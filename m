Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF452153D9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jul 2020 10:17:19 +0200 (CEST)
Received: from localhost ([::1]:49894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsMJS-0006kT-FO
	for lists+qemu-devel@lfdr.de; Mon, 06 Jul 2020 04:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCU-0001je-Lp
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:34435
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jsMCN-0003CJ-PP
 for qemu-devel@nongnu.org; Mon, 06 Jul 2020 04:10:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594022998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g3ySM10k9UbCgKhWVEE6TxsHmdluVXj5wEYfSDsLmz0=;
 b=Vm4GFMWLMJXptUock6ttzhjeS0YCOA2QgPCVDw11QP5kCl3J8UaFXrNmzVUJkxb3d0+wEP
 kav19QaeWUaEynzqXdDYQcWNfcfi65PRSr4e3cXGCGHcqrlRmVA01PMhff1eMzetxOjonx
 R7UYnAUd0rO/3zjbKf6EM/YB2Chwsl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-pmkxXwVOPAaOWyhSoevX6Q-1; Mon, 06 Jul 2020 04:09:57 -0400
X-MC-Unique: pmkxXwVOPAaOWyhSoevX6Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F93E188360D;
 Mon,  6 Jul 2020 08:09:56 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3F86CF953;
 Mon,  6 Jul 2020 08:09:53 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BABD911385D7; Mon,  6 Jul 2020 10:09:50 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/44] qemu-option: Factor out helper find_default_by_name()
Date: Mon,  6 Jul 2020 10:09:14 +0200
Message-Id: <20200706080950.403087-9-armbru@redhat.com>
In-Reply-To: <20200706080950.403087-1-armbru@redhat.com>
References: <20200706080950.403087-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 01:52:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 ehabkost@redhat.com, qemu-block@nongnu.org, groug@kaod.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 util/qemu-option.c | 47 ++++++++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index 1df55bc881..14e211ddd8 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -142,6 +142,13 @@ static const QemuOptDesc *find_desc_by_name(const QemuOptDesc *desc,
     return NULL;
 }
 
+static const char *find_default_by_name(QemuOpts *opts, const char *name)
+{
+    const QemuOptDesc *desc = find_desc_by_name(opts->list->desc, name);
+
+    return desc ? desc->def_value_str : NULL;
+}
+
 void parse_option_size(const char *name, const char *value,
                        uint64_t *ret, Error **errp)
 {
@@ -270,7 +277,7 @@ static void qemu_opt_del_all(QemuOpts *opts, const char *name)
 const char *qemu_opt_get(QemuOpts *opts, const char *name)
 {
     QemuOpt *opt;
-    const QemuOptDesc *desc;
+    const char *def_val;
 
     if (opts == NULL) {
         return NULL;
@@ -278,9 +285,9 @@ const char *qemu_opt_get(QemuOpts *opts, const char *name)
 
     opt = qemu_opt_find(opts, name);
     if (!opt) {
-        desc = find_desc_by_name(opts->list->desc, name);
-        if (desc && desc->def_value_str) {
-            return desc->def_value_str;
+        def_val = find_default_by_name(opts, name);
+        if (def_val) {
+            return def_val;
         }
     }
     return opt ? opt->str : NULL;
@@ -312,7 +319,7 @@ const char *qemu_opt_iter_next(QemuOptsIter *iter)
 char *qemu_opt_get_del(QemuOpts *opts, const char *name)
 {
     QemuOpt *opt;
-    const QemuOptDesc *desc;
+    const char *def_val;
     char *str = NULL;
 
     if (opts == NULL) {
@@ -321,9 +328,9 @@ char *qemu_opt_get_del(QemuOpts *opts, const char *name)
 
     opt = qemu_opt_find(opts, name);
     if (!opt) {
-        desc = find_desc_by_name(opts->list->desc, name);
-        if (desc && desc->def_value_str) {
-            str = g_strdup(desc->def_value_str);
+        def_val = find_default_by_name(opts, name);
+        if (def_val) {
+            str = g_strdup(def_val);
         }
         return str;
     }
@@ -349,7 +356,7 @@ static bool qemu_opt_get_bool_helper(QemuOpts *opts, const char *name,
                                      bool defval, bool del)
 {
     QemuOpt *opt;
-    const QemuOptDesc *desc;
+    const char *def_val;
     bool ret = defval;
 
     if (opts == NULL) {
@@ -358,9 +365,9 @@ static bool qemu_opt_get_bool_helper(QemuOpts *opts, const char *name,
 
     opt = qemu_opt_find(opts, name);
     if (opt == NULL) {
-        desc = find_desc_by_name(opts->list->desc, name);
-        if (desc && desc->def_value_str) {
-            parse_option_bool(name, desc->def_value_str, &ret, &error_abort);
+        def_val = find_default_by_name(opts, name);
+        if (def_val) {
+            parse_option_bool(name, def_val, &ret, &error_abort);
         }
         return ret;
     }
@@ -386,7 +393,7 @@ static uint64_t qemu_opt_get_number_helper(QemuOpts *opts, const char *name,
                                            uint64_t defval, bool del)
 {
     QemuOpt *opt;
-    const QemuOptDesc *desc;
+    const char *def_val;
     uint64_t ret = defval;
 
     if (opts == NULL) {
@@ -395,9 +402,9 @@ static uint64_t qemu_opt_get_number_helper(QemuOpts *opts, const char *name,
 
     opt = qemu_opt_find(opts, name);
     if (opt == NULL) {
-        desc = find_desc_by_name(opts->list->desc, name);
-        if (desc && desc->def_value_str) {
-            parse_option_number(name, desc->def_value_str, &ret, &error_abort);
+        def_val = find_default_by_name(opts, name);
+        if (def_val) {
+            parse_option_number(name, def_val, &ret, &error_abort);
         }
         return ret;
     }
@@ -424,7 +431,7 @@ static uint64_t qemu_opt_get_size_helper(QemuOpts *opts, const char *name,
                                          uint64_t defval, bool del)
 {
     QemuOpt *opt;
-    const QemuOptDesc *desc;
+    const char *def_val;
     uint64_t ret = defval;
 
     if (opts == NULL) {
@@ -433,9 +440,9 @@ static uint64_t qemu_opt_get_size_helper(QemuOpts *opts, const char *name,
 
     opt = qemu_opt_find(opts, name);
     if (opt == NULL) {
-        desc = find_desc_by_name(opts->list->desc, name);
-        if (desc && desc->def_value_str) {
-            parse_option_size(name, desc->def_value_str, &ret, &error_abort);
+        def_val = find_default_by_name(opts, name);
+        if (def_val) {
+            parse_option_size(name, def_val, &ret, &error_abort);
         }
         return ret;
     }
-- 
2.26.2


