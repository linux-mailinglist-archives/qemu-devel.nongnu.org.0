Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F492B681D
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 15:58:59 +0100 (CET)
Received: from localhost ([::1]:60418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2Re-0000MB-Ht
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 09:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2QX-0007uI-N1
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:57:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kf2QU-0000kV-Lc
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 09:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605625066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=khauuHmJcO690bL6TzHXcW+3mC0v8LfX+Is0LeMWEZQ=;
 b=J/6ZBRHXy4R6HTGfynwI2QnHoS9rRNAUZ8mLjcefQFmtcVadO53Q7uCro21KylwY1NaBOY
 00bTon+f8n4KrMF0FkPT6480JFVmQmpmRXzBrUe3uwu/scW6uDQVmbyFPmZlUth5Qrbf+2
 DN7mipfjy43Fuces3e1BM75tg2D7LO8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-7tG2QvYBPumnwWuYWfzdHw-1; Tue, 17 Nov 2020 09:57:44 -0500
X-MC-Unique: 7tG2QvYBPumnwWuYWfzdHw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5411007463;
 Tue, 17 Nov 2020 14:57:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-103.ams2.redhat.com
 [10.36.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F140619930;
 Tue, 17 Nov 2020 14:57:41 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2091511358BB; Tue, 17 Nov 2020 15:57:39 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] json: Fix a memleak in parse_pair()
Date: Tue, 17 Nov 2020 15:57:39 +0100
Message-Id: <20201117145739.3314926-2-armbru@redhat.com>
In-Reply-To: <20201117145739.3314926-1-armbru@redhat.com>
References: <20201117145739.3314926-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alex Chen <alex.chen@huawei.com>, peter.maydell@linaro.org,
 Chen Qun <kuhn.chenqun@huawei.com>, Euler Robot <euler.robot@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Chen <alex.chen@huawei.com>

In qobject_type(), NULL is returned when the 'QObject' returned from parse_value() is not of QString type,
and this 'QObject' memory will leaked.
So we need to first cache the 'QObject' returned from parse_value(), and finally
free 'QObject' memory at the end of the function.
Also, we add a testcast about invalid dict key.

The memleak stack is as follows:
Direct leak of 32 byte(s) in 1 object(s) allocated from:
    #0 0xfffe4b3c34fb in __interceptor_malloc (/lib64/libasan.so.4+0xd34fb)
    #1 0xfffe4ae48aa3 in g_malloc (/lib64/libglib-2.0.so.0+0x58aa3)
    #2 0xaaab3557d9f7 in qnum_from_int qemu/qobject/qnum.c:25
    #3 0xaaab35584d23 in parse_literal qemu/qobject/json-parser.c:511
    #4 0xaaab35584d23 in parse_value qemu/qobject/json-parser.c:554
    #5 0xaaab35583d77 in parse_pair qemu/qobject/json-parser.c:270
    #6 0xaaab355845db in parse_object qemu/qobject/json-parser.c:327
    #7 0xaaab355845db in parse_value qemu/qobject/json-parser.c:546
    #8 0xaaab35585b1b in json_parser_parse qemu/qobject/json-parser.c:580
    #9 0xaaab35583703 in json_message_process_token qemu/qobject/json-streamer.c:92
    #10 0xaaab355ddccf in json_lexer_feed_char qemu/qobject/json-lexer.c:313
    #11 0xaaab355de0eb in json_lexer_feed qemu/qobject/json-lexer.c:350
    #12 0xaaab354aff67 in tcp_chr_read qemu/chardev/char-socket.c:525
    #13 0xfffe4ae429db in g_main_context_dispatch (/lib64/libglib-2.0.so.0+0x529db)
    #14 0xfffe4ae42d8f  (/lib64/libglib-2.0.so.0+0x52d8f)
    #15 0xfffe4ae430df in g_main_loop_run (/lib64/libglib-2.0.so.0+0x530df)
    #16 0xaaab34d70bff in iothread_run qemu/iothread.c:82
    #17 0xaaab3559d71b in qemu_thread_start qemu/util/qemu-thread-posix.c:519

Fixes: 532fb5328473 ("qapi: Make more of qobject_to()")
Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Alex Chen <alex.chen@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20201113145525.85151-1-alex.chen@huawei.com>
[Commit message tweaked]
---
 qobject/json-parser.c | 12 ++++++------
 tests/check-qjson.c   |  9 +++++++++
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/qobject/json-parser.c b/qobject/json-parser.c
index d083810d37..c0f521b56b 100644
--- a/qobject/json-parser.c
+++ b/qobject/json-parser.c
@@ -257,8 +257,9 @@ static JSONToken *parser_context_peek_token(JSONParserContext *ctxt)
  */
 static int parse_pair(JSONParserContext *ctxt, QDict *dict)
 {
+    QObject *key_obj = NULL;
+    QString *key;
     QObject *value;
-    QString *key = NULL;
     JSONToken *peek, *token;
 
     peek = parser_context_peek_token(ctxt);
@@ -267,7 +268,8 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
         goto out;
     }
 
-    key = qobject_to(QString, parse_value(ctxt));
+    key_obj = parse_value(ctxt);
+    key = qobject_to(QString, key_obj);
     if (!key) {
         parse_error(ctxt, peek, "key is not a string in object");
         goto out;
@@ -297,13 +299,11 @@ static int parse_pair(JSONParserContext *ctxt, QDict *dict)
 
     qdict_put_obj(dict, qstring_get_str(key), value);
 
-    qobject_unref(key);
-
+    qobject_unref(key_obj);
     return 0;
 
 out:
-    qobject_unref(key);
-
+    qobject_unref(key_obj);
     return -1;
 }
 
diff --git a/tests/check-qjson.c b/tests/check-qjson.c
index 07a773e653..9a02079099 100644
--- a/tests/check-qjson.c
+++ b/tests/check-qjson.c
@@ -1415,6 +1415,14 @@ static void invalid_dict_comma(void)
     g_assert(obj == NULL);
 }
 
+static void invalid_dict_key(void)
+{
+    Error *err = NULL;
+    QObject *obj = qobject_from_json("{32:'abc'}", &err);
+    error_free_or_abort(&err);
+    g_assert(obj == NULL);
+}
+
 static void unterminated_literal(void)
 {
     Error *err = NULL;
@@ -1500,6 +1508,7 @@ int main(int argc, char **argv)
     g_test_add_func("/errors/unterminated/dict_comma", unterminated_dict_comma);
     g_test_add_func("/errors/invalid_array_comma", invalid_array_comma);
     g_test_add_func("/errors/invalid_dict_comma", invalid_dict_comma);
+    g_test_add_func("/errors/invalid_dict_key", invalid_dict_key);
     g_test_add_func("/errors/unterminated/literal", unterminated_literal);
     g_test_add_func("/errors/limits/nesting", limits_nesting);
     g_test_add_func("/errors/multiple_values", multiple_values);
-- 
2.26.2


