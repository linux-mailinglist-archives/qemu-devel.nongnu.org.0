Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E59D82CBA27
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 11:09:12 +0100 (CET)
Received: from localhost ([::1]:34910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkP4R-0004R4-Vm
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 05:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3f-0003XD-Dm
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kkO3c-0004dS-HU
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 04:04:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606899855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8eOK5P/i5aRC81NFyyuDcyo3cTjFzaugC2LKN0TEuQ=;
 b=iDZlT0nX5ImtF1/c4U4hujAKrASNVPWPMjKAPIJlu+uEGEpPldL9y1uKCOGyGr/mLZJVj/
 KWOeYSpsXGRnOw5kifoRDtdEB0yKCDQ5DhtM9sioS7LDq7sJXkxUb7ntc6W2xEiNlUzRmw
 WdA90NAXkzHW2AbA+XceNCFWIDV1XaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-IRr0tKN-OKO1Am6g1pXssQ-1; Wed, 02 Dec 2020 04:04:14 -0500
X-MC-Unique: IRr0tKN-OKO1Am6g1pXssQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6F319400F6;
 Wed,  2 Dec 2020 09:03:40 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A7AFD6ACE3;
 Wed,  2 Dec 2020 09:03:39 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/28] qemu-option: warn for short-form boolean options
Date: Wed,  2 Dec 2020 04:02:42 -0500
Message-Id: <20201202090305.4129317-6-pbonzini@redhat.com>
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
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Options such as "server" or "nowait", that are commonly found in -chardev,
are sugar for "server=on" and "wait=off".  This is quite surprising and
also does not have any notion of typing attached.  It is even possible to
do "-device e1000,noid" and get a device with "id=off".

Deprecate it and print a warning when it is encountered.  In general,
this short form for boolean options only seems to be in wide use for
-chardev and -spice.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/deprecated.rst |  6 ++++++
 tests/test-qemu-opts.c     |  2 +-
 util/qemu-option.c         | 29 ++++++++++++++++++-----------
 3 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 565389697e..ced4fa23a5 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -146,6 +146,12 @@ Drives with interface types other than ``if=none`` are for onboard
 devices.  It is possible to use drives the board doesn't pick up with
 -device.  This usage is now deprecated.  Use ``if=none`` instead.
 
+Short-form boolean options (since 5.2)
+''''''''''''''''''''''''''''''''''''''
+
+Boolean options such as ``share=on``/``share=off`` can be written
+in short form as ``share`` and ``noshare``.  This is deprecated
+and will cause a warning.
 
 QEMU Machine Protocol (QMP) commands
 ------------------------------------
diff --git a/tests/test-qemu-opts.c b/tests/test-qemu-opts.c
index 2aab831d10..8bbb17b1c7 100644
--- a/tests/test-qemu-opts.c
+++ b/tests/test-qemu-opts.c
@@ -515,7 +515,7 @@ static void test_opts_parse(void)
     error_free_or_abort(&err);
     g_assert(!opts);
 
-    /* Implied value */
+    /* Implied value (qemu_opts_parse warns but accepts it) */
     opts = qemu_opts_parse(&opts_list_03, "an,noaus,noaus=",
                            false, &error_abort);
     g_assert_cmpuint(opts_count(opts), ==, 3);
diff --git a/util/qemu-option.c b/util/qemu-option.c
index 5f27d4369d..40564a12eb 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -756,10 +756,12 @@ void qemu_opts_print(QemuOpts *opts, const char *separator)
 
 static const char *get_opt_name_value(const char *params,
                                       const char *firstname,
+                                      bool warn_on_flag,
                                       bool *help_wanted,
                                       char **name, char **value)
 {
     const char *p;
+    const char *prefix = "";
     size_t len;
     bool is_help = false;
 
@@ -776,10 +778,15 @@ static const char *get_opt_name_value(const char *params,
             if (strncmp(*name, "no", 2) == 0) {
                 memmove(*name, *name + 2, strlen(*name + 2) + 1);
                 *value = g_strdup("off");
+                prefix = "no";
             } else {
                 *value = g_strdup("on");
                 is_help = is_help_option(*name);
             }
+            if (!is_help && warn_on_flag) {
+                warn_report("short-form boolean option '%s%s' deprecated", prefix, *name);
+                error_printf("Please use %s=%s instead\n", *name, *value);
+            }
         }
     } else {
         /* found "foo=bar,more" */
@@ -801,14 +808,14 @@ static const char *get_opt_name_value(const char *params,
 
 static bool opts_do_parse(QemuOpts *opts, const char *params,
                           const char *firstname, bool prepend,
-                          bool *help_wanted, Error **errp)
+                          bool warn_on_flag, bool *help_wanted, Error **errp)
 {
     char *option, *value;
     const char *p;
     QemuOpt *opt;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, firstname, help_wanted, &option, &value);
+        p = get_opt_name_value(p, firstname, warn_on_flag, help_wanted, &option, &value);
         if (help_wanted && *help_wanted) {
             g_free(option);
             g_free(value);
@@ -839,7 +846,7 @@ static char *opts_parse_id(const char *params)
     char *name, *value;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, NULL, NULL, &name, &value);
+        p = get_opt_name_value(p, NULL, false, NULL, &name, &value);
         if (!strcmp(name, "id")) {
             g_free(name);
             return value;
@@ -858,7 +865,7 @@ bool has_help_option(const char *params)
     bool ret = false;
 
     for (p = params; *p;) {
-        p = get_opt_name_value(p, NULL, &ret, &name, &value);
+        p = get_opt_name_value(p, NULL, false, &ret, &name, &value);
         g_free(name);
         g_free(value);
         if (ret) {
@@ -878,12 +885,12 @@ bool has_help_option(const char *params)
 bool qemu_opts_do_parse(QemuOpts *opts, const char *params,
                        const char *firstname, Error **errp)
 {
-    return opts_do_parse(opts, params, firstname, false, NULL, errp);
+    return opts_do_parse(opts, params, firstname, false, false, NULL, errp);
 }
 
 static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
                             bool permit_abbrev, bool defaults,
-                            bool *help_wanted, Error **errp)
+                            bool warn_on_flag, bool *help_wanted, Error **errp)
 {
     const char *firstname;
     char *id = opts_parse_id(params);
@@ -906,8 +913,8 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
         return NULL;
     }
 
-    if (!opts_do_parse(opts, params, firstname, defaults, help_wanted,
-                       errp)) {
+    if (!opts_do_parse(opts, params, firstname, defaults,
+                       warn_on_flag, help_wanted, errp)) {
         qemu_opts_del(opts);
         return NULL;
     }
@@ -925,7 +932,7 @@ static QemuOpts *opts_parse(QemuOptsList *list, const char *params,
 QemuOpts *qemu_opts_parse(QemuOptsList *list, const char *params,
                           bool permit_abbrev, Error **errp)
 {
-    return opts_parse(list, params, permit_abbrev, false, NULL, errp);
+    return opts_parse(list, params, permit_abbrev, false, false, NULL, errp);
 }
 
 /**
@@ -943,7 +950,7 @@ QemuOpts *qemu_opts_parse_noisily(QemuOptsList *list, const char *params,
     QemuOpts *opts;
     bool help_wanted = false;
 
-    opts = opts_parse(list, params, permit_abbrev, false,
+    opts = opts_parse(list, params, permit_abbrev, false, true,
                       opts_accepts_any(list) ? NULL : &help_wanted,
                       &err);
     if (!opts) {
@@ -962,7 +969,7 @@ void qemu_opts_set_defaults(QemuOptsList *list, const char *params,
 {
     QemuOpts *opts;
 
-    opts = opts_parse(list, params, permit_abbrev, true, NULL, NULL);
+    opts = opts_parse(list, params, permit_abbrev, true, false, NULL, NULL);
     assert(opts);
 }
 
-- 
2.26.2



