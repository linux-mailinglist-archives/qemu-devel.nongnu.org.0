Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CF2CB9B3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 10:52:59 +0100 (CET)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkOok-00024P-KM
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 04:52:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3b-0003Mn-Oh
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3X-0004bE-Hv
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJ8V3+fjVpvn8MatvjcW1uk//9o9ccm/MEgVoT3ufNI=;
 b=hBvXhaPcjbWSxP9CRFZ0g3jZ5N4pm4KyAfTlGhGeQ25+ABOmnG890am/GsEx2hyFzddcr7
 1iaqPJVBCll/NI1hoxROZetLwvVQkPXhIlEUqdCuwst/jYcX5TXzrjZHQcRW7f/WkoLN9D
 H4Oihpgbx+Ee/XZpZpDfjJDk9bUbLCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-2-YtvlL2NzGWn7-xjBhk9A-1; Wed, 02 Dec 2020 04:04:08 -0500
X-MC-Unique: 2-YtvlL2NzGWn7-xjBhk9A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 984F2107658A;
 Wed,  2 Dec 2020 09:03:39 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDF0662A25;
 Wed,  2 Dec 2020 09:03:38 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/28] qemu-option: move help handling to get_opt_name_value
Date: Wed,  2 Dec 2020 04:02:41 -0500
Message-Id: <20201202090305.4129317-5-pbonzini@redhat.com>
In-Reply-To: <20201202090305.4129317-1-pbonzini@redhat.com>
References: <20201202090305.4129317-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, armbru@redhat.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now, help options are parsed normally and then checked
specially in opt_validate, but only if coming from
qemu_opts_parse_noisily.  has_help_option does the check on its own.

opt_validate() has two callers: qemu_opt_set(), which passes null and is
therefore unaffected, and opts_do_parse(), which is affected.

opts_do_parse() is called by qemu_opts_do_parse(), which passes null and
is therefore unaffected, and opts_parse().

opts_parse() is called by qemu_opts_parse() and qemu_opts_set_defaults(),
which pass null and are therefore unaffected, and
qemu_opts_parse_noisily().

Move the check from opt_validate to the parsing workhorse of QemuOpts,
get_opt_name_value.  This will come in handy in the next patch, which
will raise a warning for "-object memory-backend-ram,share" ("flag" option
with no =on/=off part) but not for "-object memory-backend-ram,help".

As a result:

- opts_parse and opts_do_parse do not return an error anymore
  when help is requested; qemu_opts_parse_noisily does not have
  to work around that anymore.

- various crazy ways to request help are not recognized anymore:
  - "help=..."
  - "nohelp" (sugar for "help=off")
  - "?=..."
  - "no?" (sugar for "?=off")

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 util/qemu-option.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 91f4120ce1..5f27d4369d 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -496,8 +496,7 @@ static QemuOpt *opt_create(QemuOpts *opts, const char *name, char *value,
     return opt;
 }
 
-static bool opt_validate(QemuOpt *opt, bool *help_wanted,
-                         Error **errp)
+static bool opt_validate(QemuOpt *opt, Error **errp)
 {
     const QemuOptDesc *desc;
     const QemuOptsList *list = opt->opts->list;
@@ -505,9 +504,6 @@ static bool opt_validate(QemuOpt *opt, bool *help_wanted,
     desc = find_desc_by_name(list->desc, opt->name);
     if (!desc && !opts_accepts_any(list)) {
         error_setg(errp, QERR_INVALID_PARAMETER, opt->name);
-        if (help_wanted && is_help_option(opt->name)) {
-            *help_wanted = true;
-        }
         return false;
     }
 
@@ -524,7 +520,7 @@ bool qemu_opt_set(QemuOpts *opts, const char *name, const char *value,
 {
     QemuOpt *opt = opt_create(opts, name, g_strdup(value), false);
 
-    if (!opt_validate(opt, NULL, errp)) {
+    if (!opt_validate(opt, errp)) {
         qemu_opt_del(opt);
         return false;
     }
@@ -760,10 +756,12 @@ void qemu_opts_print(QemuOpts *opts, const char *separator)
 
 static const char *get_opt_name_value(const char *params,
                                       const char *firstname,
+                                      bool *help_wanted,
                                       char **name, char **value)
 {
     const char *p;
     size_t len;
+    bool is_help = false;
 
     len = strcspn(params, "=,");
     if (params[len] != '=') {
@@ -780,6 +778,7 @@ static const char *get_opt_name_value(const char *params,
                 *value = g_strdup("off");
             } else {
                 *value = g_strdup("on");
+                is_help = is_help_option(*name);
             }
         }
     } else {
@@ -791,6 +790,9 @@ static const char *get_opt_name_value(const char *params,
     }
 
     assert(!*p || *p == ',');
+    if (help_wanted && is_help) {
+        *help_wanted = true;
+    }
     if (*p == ',') {
         p++;
     }
@@ -806,7 +808,12 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
     QemuOpt *opt;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, firstname, &option, &value);
+        p = get_opt_name_value(p, firstname, help_wanted, &option, &value);
+        if (help_wanted && *help_wanted) {
+            g_free(option);
+            g_free(value);
+            return false;
+        }
         firstname = NULL;
 
         if (!strcmp(option, "id")) {
@@ -817,7 +824,7 @@ static bool opts_do_parse(QemuOpts *opts, const char *params,
 
         opt = opt_create(opts, option, value, prepend);
         g_free(option);
-        if (!opt_validate(opt, help_wanted, errp)) {
+        if (!opt_validate(opt, errp)) {
             qemu_opt_del(opt);
             return false;
         }
@@ -832,7 +839,7 @@ static char *opts_parse_id(const char *params)
     char *name, *value;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, NULL, &name, &value);
+        p = get_opt_name_value(p, NULL, NULL, &name, &value);
         if (!strcmp(name, "id")) {
             g_free(name);
             return value;
@@ -848,11 +855,10 @@ bool has_help_option(const char *params)
 {
     const char *p;
     char *name, *value;
-    bool ret;
+    bool ret = false;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, NULL, &name, &value);
-        ret = is_help_option(name);
+        p = get_opt_name_value(p, NULL, &ret, &name, &value);
         g_free(name);
         g_free(value);
         if (ret) {
@@ -937,11 +943,13 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     QemuOpts *opts;
     bool help_wanted = false;
 
-    opts = opts_parse(list, params, permit_abbrev, false, &help_wanted, &err);
-    if (err) {
+    opts = opts_parse(list, params, permit_abbrev, false,
+                      opts_accepts_any(list) ? NULL : &help_wanted,
+                      &err);
+    if (!opts) {
+        assert(!!err + !!help_wanted == 1);
         if (help_wanted) {
             qemu_opts_print_help(list, true);
-            error_free(err);
         } else {
             error_report_err(err);
         }
-- 
2.26.2



