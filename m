Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31462079DD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 19:05:56 +0200 (CEST)
Received: from localhost ([::1]:36260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jo8qR-0006FX-Ls
	for lists+qemu-devel@lfdr.de; Wed, 24 Jun 2020 13:05:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8Vf-0004JG-SL
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:36142
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jo8VD-00058c-AG
 for qemu-devel@nongnu.org; Wed, 24 Jun 2020 12:44:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593017037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Wu5zYiLCuR0Lw1xjwnS+ZFuLCqkfXHOO8+tGOU6AYE=;
 b=JJXXoEdjwEeNkL3Wk5jY8ORaKdsl2tXVUgSrWZifsiNGbc4AMwuAfQWy3yZxOYTMVDr3bQ
 lDSj/QOujl72he8flABXLIrNQy43b8Bmo1hOkZMNMPXSTX36zKr09FYzKAuqstVCScvcaj
 z1YZ6E4cQneVKW5PIinq4UVNU4Nsi7c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-ZaGnswEqPuKRJGs9UwoUCw-1; Wed, 24 Jun 2020 12:43:55 -0400
X-MC-Unique: ZaGnswEqPuKRJGs9UwoUCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE76800C60;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B23C5D9C5;
 Wed, 24 Jun 2020 16:43:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1CC07113847D; Wed, 24 Jun 2020 18:43:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/46] qemu-option: Make functions taking Error ** return bool,
 not void
Date: Wed, 24 Jun 2020 18:43:14 +0200
Message-Id: <20200624164344.3778251-17-armbru@redhat.com>
In-Reply-To: <20200624164344.3778251-1-armbru@redhat.com>
References: <20200624164344.3778251-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/24 00:34:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, vsementsov@virtuozzo.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See recent commit "error: Document Error API usage rules" for
rationale.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 include/qemu/option.h | 16 ++++----
 blockdev.c            |  5 ++-
 util/qemu-option.c    | 92 +++++++++++++++++++++++++------------------
 3 files changed, 64 insertions(+), 49 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index eb4097889d..2d77b10f90 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -30,7 +30,7 @@
 
 const char *get_opt_value(const char *p, char **value);
 
-void parse_option_size(const char *name, const char *value,
+bool parse_option_size(const char *name, const char *value,
                        uint64_t *ret, Error **errp);
 bool has_help_option(const char *param);
 
@@ -80,11 +80,11 @@ uint64_t qemu_opt_get_number_del(QemuOpts *opts, const char *name,
 uint64_t qemu_opt_get_size_del(QemuOpts *opts, const char *name,
                                uint64_t defval);
 int qemu_opt_unset(QemuOpts *opts, const char *name);
-void qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
+bool qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
                   Error **errp);
-void qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
+bool qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
                        Error **errp);
-void qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
+bool qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
                          Error **errp);
 typedef int (*qemu_opt_loopfunc)(void *opaque,
                                  const char *name, const char *value,
@@ -106,13 +106,13 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
                            int fail_if_exists, Error **errp);
 void qemu_opts_reset(QemuOptsList *list);
 void qemu_opts_loc_restore(QemuOpts *opts);
-void qemu_opts_set(QemuOptsList *list, const char *id,
+bool qemu_opts_set(QemuOptsList *list, const char *id,
                    const char *name, const char *value, Error **errp);
 const char *qemu_opts_id(QemuOpts *opts);
 void qemu_opts_set_id(QemuOpts *opts, char *id);
 void qemu_opts_del(QemuOpts *opts);
-void qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp);
-void qemu_opts_do_parse(QemuOpts *opts, const char *params,
+bool qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp);
+bool qemu_opts_do_parse(QemuOpts *opts, const char *params,
                         const char *firstname, Error **errp);
 QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
                                   bool permit_abbrev);
@@ -125,7 +125,7 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
 QDict *qemu_opts_to_qdict_filtered(QemuOpts *opts, QDict *qdict,
                                    QemuOptsList *list, bool del);
 QDict *qemu_opts_to_qdict(QemuOpts *opts, QDict *qdict);
-void qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp);
+bool qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp);
 
 typedef int (*qemu_opts_loopfunc)(void *opaque, QemuOpts *opts, Error **errp);
 int qemu_opts_foreach(QemuOptsList *list, qemu_opts_loopfunc func,
diff --git a/blockdev.c b/blockdev.c
index 481f36c543..1987625aba 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -705,7 +705,7 @@ BlockDriverState *bdrv_next_monitor_owned(BlockDriverState *bs)
               : QTAILQ_FIRST(&monitor_bdrv_states);
 }
 
-static void qemu_opt_rename(QemuOpts *opts, const char *from, const char *to,
+static bool qemu_opt_rename(QemuOpts *opts, const char *from, const char *to,
                             Error **errp)
 {
     const char *value;
@@ -715,7 +715,7 @@ static void qemu_opt_rename(QemuOpts *opts, const char *from, const char *to,
         if (qemu_opt_find(opts, to)) {
             error_setg(errp, "'%s' and its alias '%s' can't be used at the "
                        "same time", to, from);
-            return;
+            return false;
         }
     }
 
@@ -724,6 +724,7 @@ static void qemu_opt_rename(QemuOpts *opts, const char *from, const char *to,
         qemu_opt_set(opts, to, value, &error_abort);
         qemu_opt_unset(opts, from);
     }
+    return true;
 }
 
 QemuOptsList qemu_legacy_drive_opts = {
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 14946e81f2..ff1e703b52 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -96,7 +96,7 @@ const char *get_opt_value(const char *p, char **value)
     return offset;
 }
 
-static void parse_option_bool(const char *name, const char *value, bool *ret,
+static bool parse_option_bool(const char *name, const char *value, bool *ret,
                               Error **errp)
 {
     if (!strcmp(value, "on")) {
@@ -106,10 +106,12 @@ static void parse_option_bool(const char *name, const char *value, bool *ret,
     } else {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE,
                    name, "'on' or 'off'");
+        return false;
     }
+    return true;
 }
 
-static void parse_option_number(const char *name, const char *value,
+static bool parse_option_number(const char *name, const char *value,
                                 uint64_t *ret, Error **errp)
 {
     uint64_t number;
@@ -119,13 +121,14 @@ static void parse_option_number(const char *name, const char *value,
     if (err == -ERANGE) {
         error_setg(errp, "Value '%s' is too large for parameter '%s'",
                    value, name);
-        return;
+        return false;
     }
     if (err) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, name, "a number");
-        return;
+        return false;
     }
     *ret = number;
+    return true;
 }
 
 static const QemuOptDesc *find_desc_by_name(const QemuOptDesc *desc,
@@ -149,7 +152,7 @@ static const char *find_default_by_name(QemuOpts *opts, const char *name)
     return desc ? desc->def_value_str : NULL;
 }
 
-void parse_option_size(const char *name, const char *value,
+bool parse_option_size(const char *name, const char *value,
                        uint64_t *ret, Error **errp)
 {
     uint64_t size;
@@ -159,7 +162,7 @@ void parse_option_size(const char *name, const char *value,
     if (err == -ERANGE) {
         error_setg(errp, "Value '%s' is out of range for parameter '%s'",
                    value, name);
-        return;
+        return false;
     }
     if (err) {
         error_setg(errp, QERR_INVALID_PARAMETER_VALUE, name,
@@ -167,9 +170,10 @@ void parse_option_size(const char *name, const char *value,
         error_append_hint(errp, "Optional suffix k, M, G, T, P or E means"
                           " kilo-, mega-, giga-, tera-, peta-\n"
                           "and exabytes, respectively.\n");
-        return;
+        return false;
     }
     *ret = size;
+    return true;
 }
 
 static const char *opt_type_to_string(enum QemuOptType type)
@@ -460,24 +464,24 @@ uint64_t qemu_opt_get_size_del(QemuOpts *opts, const char *name,
     return qemu_opt_get_size_helper(opts, name, defval, true);
 }
 
-static void qemu_opt_parse(QemuOpt *opt, Error **errp)
+static bool qemu_opt_parse(QemuOpt *opt, Error **errp)
 {
     if (opt->desc == NULL)
-        return;
+        return true;
 
     switch (opt->desc->type) {
     case QEMU_OPT_STRING:
         /* nothing */
-        return;
+        return true;
     case QEMU_OPT_BOOL:
-        parse_option_bool(opt->name, opt->str, &opt->value.boolean, errp);
-        break;
+        return parse_option_bool(opt->name, opt->str, &opt->value.boolean,
+                                 errp);
     case QEMU_OPT_NUMBER:
-        parse_option_number(opt->name, opt->str, &opt->value.uint, errp);
-        break;
+        return parse_option_number(opt->name, opt->str, &opt->value.uint,
+                                   errp);
     case QEMU_OPT_SIZE:
-        parse_option_size(opt->name, opt->str, &opt->value.uint, errp);
-        break;
+        return parse_option_size(opt->name, opt->str, &opt->value.uint,
+                                 errp);
     default:
         abort();
     }
@@ -544,17 +548,19 @@ static bool opt_set(QemuOpts *opts, QemuOpt *opt, bool *help_wanted,
     return true;
 }
 
-void qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
+bool qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
                   Error **errp)
 {
     QemuOpt *opt = opt_create(opts, name, g_strdup(value), false);
 
     if (!opt_set(opts, opt, NULL, errp)) {
         qemu_opt_del(opt);
+        return false;
     }
+    return true;
 }
 
-void qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
+bool qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
                        Error **errp)
 {
     QemuOpt *opt;
@@ -563,7 +569,7 @@ void qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
     desc = find_desc_by_name(opts->list->desc, name);
     if (!desc && !opts_accepts_any(opts)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
-        return;
+        return false;
     }
 
     opt = g_malloc0(sizeof(*opt));
@@ -573,9 +579,10 @@ void qemu_opt_set_bool(QemuOpts *opts, const char *name, bool val,
     opt->value.boolean = !!val;
     opt->str = g_strdup(val ? "on" : "off");
     QTAILQ_INSERT_TAIL(&opts->head, opt, next);
+    return true;
 }
 
-void qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
+bool qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
                          Error **errp)
 {
     QemuOpt *opt;
@@ -584,7 +591,7 @@ void qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
     desc = find_desc_by_name(opts->list->desc, name);
     if (!desc && !opts_accepts_any(opts)) {
         error_setg(errp, QERR_INVALID_PARAMETER, name);
-        return;
+        return false;
     }
 
     opt = g_malloc0(sizeof(*opt));
@@ -594,6 +601,7 @@ void qemu_opt_set_number(QemuOpts *opts, const char *name, int64_t val,
     opt->value.uint = val;
     opt->str = g_strdup_printf("%" PRId64, val);
     QTAILQ_INSERT_TAIL(&opts->head, opt, next);
+    return true;
 }
 
 /**
@@ -684,16 +692,16 @@ void qemu_opts_loc_restore(QemuOpts *opts)
     loc_restore(&opts->loc);
 }
 
-void qemu_opts_set(QemuOptsList *list, const char *id,
+bool qemu_opts_set(QemuOptsList *list, const char *id,
                    const char *name, const char *value, Error **errp)
 {
     QemuOpts *opts;
 
     opts = qemu_opts_create(list, id, 1, errp);
     if (!opts) {
-        return;
+        return false;
     }
-    qemu_opt_set(opts, name, value, errp);
+    return qemu_opt_set(opts, name, value, errp);
 }
 
 const char *qemu_opts_id(QemuOpts *opts)
@@ -819,7 +827,7 @@ static const char *get_opt_name_value(const char *params,
     return p;
 }
 
-static void opts_do_parse(QemuOpts *opts, const char *params,
+static bool opts_do_parse(QemuOpts *opts, const char *params,
                           const char *firstname, bool prepend,
                           bool *help_wanted, Error **errp)
 {
@@ -841,9 +849,11 @@ static void opts_do_parse(QemuOpts *opts, const char *params,
         g_free(option);
         if (!opt_set(opts, opt, help_wanted, errp)) {
             qemu_opt_del(opt);
-            return;
+            return false;
         }
     }
+
+    return true;
 }
 
 static char *opts_parse_id(const char *params)
@@ -889,10 +899,10 @@ bool has_help_option(const char *params)
  * key=, and is treated as if key was @firstname.
  * On error, store an error object through @errp if non-null.
  */
-void qemu_opts_do_parse(QemuOpts *opts, const char *params,
+bool qemu_opts_do_parse(QemuOpts *opts, const char *params,
                        const char *firstname, Error **errp)
 {
-    opts_do_parse(opts, params, firstname, false, NULL, errp);
+    return opts_do_parse(opts, params, firstname, false, NULL, errp);
 }
 
 static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
@@ -980,17 +990,18 @@ void qemu_opts_set_defaults(QemuOptsList *list, const char *params,
     assert(opts);
 }
 
-static void qemu_opts_from_qdict_entry(QemuOpts *opts,
+static bool qemu_opts_from_qdict_entry(QemuOpts *opts,
                                        const QDictEntry *entry,
                                        Error **errp)
 {
     const char *key = qdict_entry_key(entry);
     QObject *obj = qdict_entry_value(entry);
-    char buf[32], *tmp = NULL;
+    char buf[32];
+    g_autofree char *tmp = NULL;
     const char *value;
 
     if (!strcmp(key, "id")) {
-        return;
+        return true;
     }
 
     switch (qobject_type(obj)) {
@@ -1007,11 +1018,10 @@ static void qemu_opts_from_qdict_entry(QemuOpts *opts,
         value = buf;
         break;
     default:
-        return;
+        return true;
     }
 
-    qemu_opt_set(opts, key, value, errp);
-    g_free(tmp);
+    return qemu_opt_set(opts, key, value, errp);
 }
 
 /*
@@ -1053,7 +1063,7 @@ QemuOpts *qemu_opts_from_qdict(QemuOptsList *list, const QDict *qdict,
  * from the QDict. When this function returns, the QDict contains only those
  * entries that couldn't be added to the QemuOpts.
  */
-void qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
+bool qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
 {
     const QDictEntry *entry, *next;
 
@@ -1068,13 +1078,15 @@ void qemu_opts_absorb_qdict(QemuOpts *opts, QDict *qdict, Error **errp)
             qemu_opts_from_qdict_entry(opts, entry, &local_err);
             if (local_err) {
                 error_propagate(errp, local_err);
-                return;
+                return false;
             }
             qdict_del(qdict, entry->key);
         }
 
         entry = next;
     }
+
+    return true;
 }
 
 /*
@@ -1134,7 +1146,7 @@ QDict *qemu_opts_to_qdict(QemuOpts *opts, QDict *qdict)
 /* Validate parsed opts against descriptions where no
  * descriptions were provided in the QemuOptsList.
  */
-void qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp)
+bool qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp)
 {
     QemuOpt *opt;
     Error *local_err = NULL;
@@ -1145,15 +1157,17 @@ void qemu_opts_validate(QemuOpts *opts, const QemuOptDesc *desc, Error **errp)
         opt->desc = find_desc_by_name(desc, opt->name);
         if (!opt->desc) {
             error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
-            return;
+            return false;
         }
 
         qemu_opt_parse(opt, &local_err);
         if (local_err) {
             error_propagate(errp, local_err);
-            return;
+            return false;
         }
     }
+
+    return true;
 }
 
 /**
-- 
2.26.2


