Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 239722C6711
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 14:43:34 +0100 (CET)
Received: from localhost ([::1]:53112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kie29-0004Tf-0D
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 08:43:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidwD-00075k-HL; Fri, 27 Nov 2020 08:37:25 -0500
Received: from relay.sw.ru ([185.231.240.75]:52764 helo=relay3.sw.ru)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidwB-0003RG-BQ; Fri, 27 Nov 2020 08:37:25 -0500
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay3.sw.ru with esmtp (Exim 4.94)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kidvi-00AfjY-8I; Fri, 27 Nov 2020 16:36:54 +0300
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, mreitz@redhat.com,
 mdroth@linux.vnet.ibm.com, thuth@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 den@openvz.org, vsementsov@virtuozzo.com, andrey.shinkevich@virtuozzo.com
Subject: [PATCH v3 3/5] monitor: let QMP monitor track JSON message content
Date: Fri, 27 Nov 2020 16:35:44 +0300
Message-Id: <1606484146-913540-4-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1606484146-913540-1-git-send-email-andrey.shinkevich@virtuozzo.com>
Received-SPF: pass client-ip=185.231.240.75;
 envelope-from=andrey.shinkevich@virtuozzo.com; helo=relay3.sw.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
From: Andrey Shinkevich via <qemu-devel@nongnu.org>

We are going to allow the QMP monitor reading data from input channel
more than one byte at once to increase the performance. With the OOB
compatibility disabled, the monitor queues one QMP command at most. It
was done for the backward compatibility as stated in the comment before
pushing a command into the queue. To keep that concept functional, the
monitor should track the end of a single QMP command. It allows the
dispatcher handling the command and send a response to client in time.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 include/qapi/qmp/json-parser.h |  5 +++--
 monitor/qmp.c                  | 18 ++++++++++++++++--
 qga/main.c                     |  2 +-
 qobject/json-lexer.c           | 30 +++++++++++++++++++++---------
 qobject/json-parser-int.h      |  8 +++++---
 qobject/json-streamer.c        | 15 ++++++++-------
 qobject/qjson.c                |  2 +-
 tests/qtest/libqtest.c         |  2 +-
 8 files changed, 56 insertions(+), 26 deletions(-)

diff --git a/include/qapi/qmp/json-parser.h b/include/qapi/qmp/json-parser.h
index 7345a9b..039addb 100644
--- a/include/qapi/qmp/json-parser.h
+++ b/include/qapi/qmp/json-parser.h
@@ -36,8 +36,9 @@ void json_message_parser_init(JSONMessageParser *parser,
                                            Error *err),
                               void *opaque, va_list *ap);
 
-void json_message_parser_feed(JSONMessageParser *parser,
-                             const char *buffer, size_t size);
+size_t  json_message_parser_feed(JSONMessageParser *parser,
+                                 const char *buffer, size_t size,
+                                 bool track_qmp);
 
 void json_message_parser_flush(JSONMessageParser *parser);
 
diff --git a/monitor/qmp.c b/monitor/qmp.c
index a86ed35..0b39c62 100644
--- a/monitor/qmp.c
+++ b/monitor/qmp.c
@@ -367,8 +367,22 @@ static void handle_qmp_command(void *opaque, QObject *req, Error *err)
 static void monitor_qmp_read(void *opaque, const uint8_t *buf, int size)
 {
     MonitorQMP *mon = opaque;
-
-    json_message_parser_feed(&mon->parser, (const char *) buf, size);
+    char *cursor = (char *) buf;
+    size_t len;
+
+    while (size > 0) {
+        len = json_message_parser_feed(&mon->parser, (const char *) cursor,
+                                       size, true);
+        cursor += len;
+        size -= len;
+
+        if (size > 0) {
+            /* Let the dispatcher process the QMP command */
+            while (qatomic_mb_read(&mon->common.suspend_cnt)) {
+                g_usleep(20);
+            }
+        }
+    }
 }
 
 static QDict *qmp_greeting(MonitorQMP *mon)
diff --git a/qga/main.c b/qga/main.c
index dea6a3a..16de642 100644
--- a/qga/main.c
+++ b/qga/main.c
@@ -605,7 +605,7 @@ static gboolean channel_event_cb(GIOCondition condition, gpointer data)
     case G_IO_STATUS_NORMAL:
         buf[count] = 0;
         g_debug("read data, count: %d, data: %s", (int)count, buf);
-        json_message_parser_feed(&s->parser, (char *)buf, (int)count);
+        json_message_parser_feed(&s->parser, (char *)buf, (int)count, false);
         break;
     case G_IO_STATUS_EOF:
         g_debug("received EOF");
diff --git a/qobject/json-lexer.c b/qobject/json-lexer.c
index 632320d..1fefbae 100644
--- a/qobject/json-lexer.c
+++ b/qobject/json-lexer.c
@@ -280,10 +280,11 @@ void json_lexer_init(JSONLexer *lexer, bool enable_interpolation)
     lexer->x = lexer->y = 0;
 }
 
-static void json_lexer_feed_char(JSONLexer *lexer, char ch, bool flush)
+static JSONTokenType json_lexer_feed_char(JSONLexer *lexer, char ch, bool flush)
 {
     int new_state;
     bool char_consumed = false;
+    JSONTokenType ret;
 
     lexer->x++;
     if (ch == '\n') {
@@ -310,16 +311,16 @@ static void json_lexer_feed_char(JSONLexer *lexer, char ch, bool flush)
         case JSON_FLOAT:
         case JSON_KEYWORD:
         case JSON_STRING:
-            json_message_process_token(lexer, lexer->token, new_state,
-                                       lexer->x, lexer->y);
+            ret = json_message_process_token(lexer, lexer->token, new_state,
+                                             lexer->x, lexer->y);
             /* fall through */
         case IN_START:
             g_string_truncate(lexer->token, 0);
             new_state = lexer->start_state;
             break;
         case JSON_ERROR:
-            json_message_process_token(lexer, lexer->token, JSON_ERROR,
-                                       lexer->x, lexer->y);
+            ret = json_message_process_token(lexer, lexer->token, JSON_ERROR,
+                                             lexer->x, lexer->y);
             new_state = IN_RECOVERY;
             /* fall through */
         case IN_RECOVERY:
@@ -335,20 +336,31 @@ static void json_lexer_feed_char(JSONLexer *lexer, char ch, bool flush)
      * this is a security consideration.
      */
     if (lexer->token->len > MAX_TOKEN_SIZE) {
-        json_message_process_token(lexer, lexer->token, lexer->state,
-                                   lexer->x, lexer->y);
+        ret = json_message_process_token(lexer, lexer->token, lexer->state,
+                                         lexer->x, lexer->y);
         g_string_truncate(lexer->token, 0);
         lexer->state = lexer->start_state;
     }
+    return ret;
 }
 
-void json_lexer_feed(JSONLexer *lexer, const char *buffer, size_t size)
+/*
+ * Return the number of characters fed until the end of a QMP command or
+ * the buffer size if not any or else not tracked.
+ */
+size_t json_lexer_feed(JSONLexer *lexer, const char *buffer, size_t size,
+                       bool track)
 {
     size_t i;
+    JSONTokenType type = JSON_ERROR;
 
     for (i = 0; i < size; i++) {
-        json_lexer_feed_char(lexer, buffer[i], false);
+        if ((type == JSON_QMP_CMD_END) && track) {
+            break;
+        }
+        type = json_lexer_feed_char(lexer, buffer[i], false);
     }
+    return i;
 }
 
 void json_lexer_flush(JSONLexer *lexer)
diff --git a/qobject/json-parser-int.h b/qobject/json-parser-int.h
index 16a25d0..904555b 100644
--- a/qobject/json-parser-int.h
+++ b/qobject/json-parser-int.h
@@ -31,6 +31,7 @@ typedef enum json_token_type {
     JSON_KEYWORD,
     JSON_STRING,
     JSON_INTERP,
+    JSON_QMP_CMD_END,
     JSON_END_OF_INPUT,
     JSON_MAX = JSON_END_OF_INPUT
 } JSONTokenType;
@@ -39,13 +40,14 @@ typedef struct JSONToken JSONToken;
 
 /* json-lexer.c */
 void json_lexer_init(JSONLexer *lexer, bool enable_interpolation);
-void json_lexer_feed(JSONLexer *lexer, const char *buffer, size_t size);
+size_t json_lexer_feed(JSONLexer *lexer, const char *buffer, size_t size,
+                       bool track);
 void json_lexer_flush(JSONLexer *lexer);
 void json_lexer_destroy(JSONLexer *lexer);
 
 /* json-streamer.c */
-void json_message_process_token(JSONLexer *lexer, GString *input,
-                                JSONTokenType type, int x, int y);
+JSONTokenType json_message_process_token(JSONLexer *lexer, GString *input,
+                                         JSONTokenType type, int x, int y);
 
 /* json-parser.c */
 JSONToken *json_token(JSONTokenType type, int x, int y, GString *tokstr);
diff --git a/qobject/json-streamer.c b/qobject/json-streamer.c
index b93d97b..fe33303 100644
--- a/qobject/json-streamer.c
+++ b/qobject/json-streamer.c
@@ -28,8 +28,8 @@ static void json_message_free_tokens(JSONMessageParser *parser)
     }
 }
 
-void json_message_process_token(JSONLexer *lexer, GString *input,
-                                JSONTokenType type, int x, int y)
+JSONTokenType json_message_process_token(JSONLexer *lexer, GString *input,
+                                         JSONTokenType type, int x, int y)
 {
     JSONMessageParser *parser = container_of(lexer, JSONMessageParser, lexer);
     QObject *json = NULL;
@@ -54,7 +54,7 @@ void json_message_process_token(JSONLexer *lexer, GString *input,
         goto out_emit;
     case JSON_END_OF_INPUT:
         if (g_queue_is_empty(&parser->tokens)) {
-            return;
+            return type;
         }
         json = json_parser_parse(&parser->tokens, parser->ap, &err);
         goto out_emit;
@@ -86,7 +86,7 @@ void json_message_process_token(JSONLexer *lexer, GString *input,
 
     if ((parser->brace_count > 0 || parser->bracket_count > 0)
         && parser->brace_count >= 0 && parser->bracket_count >= 0) {
-        return;
+        return type;
     }
 
     json = json_parser_parse(&parser->tokens, parser->ap, &err);
@@ -97,6 +97,7 @@ out_emit:
     json_message_free_tokens(parser);
     parser->token_size = 0;
     parser->emit(parser->opaque, json, err);
+    return JSON_QMP_CMD_END;
 }
 
 void json_message_parser_init(JSONMessageParser *parser,
@@ -115,10 +116,10 @@ void json_message_parser_init(JSONMessageParser *parser,
     json_lexer_init(&parser->lexer, !!ap);
 }
 
-void json_message_parser_feed(JSONMessageParser *parser,
-                             const char *buffer, size_t size)
+size_t json_message_parser_feed(JSONMessageParser *parser,
+                                const char *buffer, size_t size, bool track_qmp)
 {
-    json_lexer_feed(&parser->lexer, buffer, size);
+    return json_lexer_feed(&parser->lexer, buffer, size, track_qmp);
 }
 
 void json_message_parser_flush(JSONMessageParser *parser)
diff --git a/qobject/qjson.c b/qobject/qjson.c
index f1f2c69..f85a1ff 100644
--- a/qobject/qjson.c
+++ b/qobject/qjson.c
@@ -66,7 +66,7 @@ static QObject *qobject_from_jsonv(const char *string, va_list *ap,
     JSONParsingState state = {};
 
     json_message_parser_init(&state.parser, consume_json, &state, ap);
-    json_message_parser_feed(&state.parser, string, strlen(string));
+    json_message_parser_feed(&state.parser, string, strlen(string), false);
     json_message_parser_flush(&state.parser);
     json_message_parser_destroy(&state.parser);
 
diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index e49f3a1..7e82d9f 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -611,7 +611,7 @@ QDict *qmp_fd_receive(int fd)
         if (log) {
             len = write(2, &c, 1);
         }
-        json_message_parser_feed(&qmp.parser, &c, 1);
+        json_message_parser_feed(&qmp.parser, &c, 1, false);
     }
     json_message_parser_destroy(&qmp.parser);
 
-- 
1.8.3.1


