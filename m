Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192E3A2D39
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 15:38:07 +0200 (CEST)
Received: from localhost ([::1]:51802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrKsn-0006SZ-1n
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 09:38:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqY-0001ax-2n
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:46 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lrKqW-0005dZ-07
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 09:35:45 -0400
Received: by mail-wm1-x32c.google.com with SMTP id f17so6195020wmf.2
 for <qemu-devel@nongnu.org>; Thu, 10 Jun 2021 06:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PRr41PxTyXm10FMURUstxjpacQwh84HXdIsa79wlV8=;
 b=sOCwqfia5KNKkGHOHIUZB/ovym/LEQjepAQuco4VmTO3Vftl9/BmNe79aatTtbzMZl
 j4g6Lfi8pD/Zv8osn3S0YWckR6b7zBtz4105UKgj3RLAe+20ZOORc1Q+nuciC4WXNE8s
 X3pgKziRRsdfdcpNHnh7Z0g4OuYa3+xgxJCx/rY3ozJvsSew0TDUSAxyedr3O8sMgVe5
 zZI4825ZzJUwWf8BRl/wiaW2nwqCzfz2fGPnXZtiPFV8K8JZbDf5Ur2WpE1XtwTtbJb6
 ajrDSLdoiQ2UoBEcESpcieeHJwofxsXSBBNYu+h+AzStFJ1L61wmslmC3Jh2PIdqJSD4
 bPGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/PRr41PxTyXm10FMURUstxjpacQwh84HXdIsa79wlV8=;
 b=fimq9TB3hgLpizTNPJ8r/9PLtj5H228jOa5D7WAsLwXl6zCx0Rem9F+/d4ngGbZn5F
 NBFMl5SkR5FnY9nxdMPZoLSlE5R/J1GJMtFqFXbc3yiS61HnVqwwC85ncFOgWaY4Wqww
 HDEShtV8rjhc1+qJXVdZ+tsqDAm5Kzp//cNnn1lguHa/LH+GTVO5a9ylDv0WHXuXGzDY
 tZxznua7J2eNFbNQ8hl/EN9hptCcXzzdPLeQBPahil05y6iYuFhihxgLvoop65YR77n7
 Gn2pxNKRHc/eUTNnuD/Vt5p8/OzV6NbC5kUSLkOWTxVialiUASStMLNXTFbMSBfIjXYf
 YF1A==
X-Gm-Message-State: AOAM530+gUWwBplsb2rZSUajBaZMlNg4reL41VqhSCVjmBwLIUslOUiu
 5gayZ/IxmZf9dXzDFEDgz6NosctzvglHRg==
X-Google-Smtp-Source: ABdhPJwC85AgRNwwJdJjeO1DsVUzD4XIkZ4EV4bm0d+uHW+Zb1i7mezQKjZmRcb51QEVrDs0I3VquA==
X-Received: by 2002:a1c:2985:: with SMTP id p127mr5088962wmp.165.1623332142637; 
 Thu, 10 Jun 2021 06:35:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id
 v8sm4032519wrc.29.2021.06.10.06.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Jun 2021 06:35:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] keyval: introduce keyval_parse_into
Date: Thu, 10 Jun 2021 15:35:30 +0200
Message-Id: <20210610133538.608390-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210610133538.608390-1-pbonzini@redhat.com>
References: <20210610133538.608390-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow parsing multiple keyval sequences into the same dictionary.
This will be used to simplify the parsing of the -M command line
option, which is currently a .merge_lists = true QemuOpts group.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/qemu/option.h |  2 ++
 util/keyval.c         | 43 +++++++++++++++++++++++++++++++++++--------
 2 files changed, 37 insertions(+), 8 deletions(-)

diff --git a/include/qemu/option.h b/include/qemu/option.h
index d89c66145a..fffb03d848 100644
--- a/include/qemu/option.h
+++ b/include/qemu/option.h
@@ -147,6 +147,8 @@ void qemu_opts_print_help(QemuOptsList *list, bool print_caption);
 void qemu_opts_free(QemuOptsList *list);
 QemuOptsList *qemu_opts_append(QemuOptsList *dst, QemuOptsList *list);
 
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp);
 QDict *keyval_parse(const char *params, const char *implied_key,
                     bool *help, Error **errp);
 void keyval_merge(QDict *old, const QDict *new, Error **errp);
diff --git a/util/keyval.c b/util/keyval.c
index 0797f36e1d..1ffd6e1204 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -478,13 +478,14 @@ static QObject *keyval_listify(QDict *cur, GSList *key_of_cur, Error **errp)
  * If @p_help is not NULL, store whether help is requested there.
  * If @p_help is NULL and help is requested, fail.
  *
- * On success, return a dictionary of the parsed keys and values.
- * On failure, store an error through @errp and return NULL.
+ * On success, return @dict, now filled with the parsed keys and values.
+ *
+ * On failure, store an error through @errp and return NULL.  Any keys
+ * and values parsed so far will be in @dict nevertheless.
  */
-QDict *keyval_parse(const char *params, const char *implied_key,
-                    bool *p_help, Error **errp)
+QDict *keyval_parse_into(QDict *qdict, const char *params, const char *implied_key,
+                         bool *p_help, Error **errp)
 {
-    QDict *qdict = qdict_new();
     QObject *listified;
     const char *s;
     bool help = false;
@@ -493,7 +494,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
     while (*s) {
         s = keyval_parse_one(qdict, s, implied_key, &help, errp);
         if (!s) {
-            qobject_unref(qdict);
             return NULL;
         }
         implied_key = NULL;
@@ -503,15 +503,42 @@ QDict *keyval_parse(const char *params, const char *implied_key,
         *p_help = help;
     } else if (help) {
         error_setg(errp, "Help is not available for this option");
-        qobject_unref(qdict);
         return NULL;
     }
 
     listified = keyval_listify(qdict, NULL, errp);
     if (!listified) {
-        qobject_unref(qdict);
         return NULL;
     }
     assert(listified == QOBJECT(qdict));
     return qdict;
 }
+
+/*
+ * Parse @params in QEMU's traditional KEY=VALUE,... syntax.
+ *
+ * If @implied_key, the first KEY= can be omitted.  @implied_key is
+ * implied then, and VALUE can't be empty or contain ',' or '='.
+ *
+ * A parameter "help" or "?" without a value isn't added to the
+ * resulting dictionary, but instead is interpreted as help request.
+ * All other options are parsed and returned normally so that context
+ * specific help can be printed.
+ *
+ * If @p_help is not NULL, store whether help is requested there.
+ * If @p_help is NULL and help is requested, fail.
+ *
+ * On success, return a dictionary of the parsed keys and values.
+ * On failure, store an error through @errp and return NULL.
+ */
+QDict *keyval_parse(const char *params, const char *implied_key,
+                    bool *p_help, Error **errp)
+{
+    QDict *qdict = qdict_new();
+    QDict *ret = keyval_parse_into(qdict, params, implied_key, p_help, errp);
+
+    if (!ret) {
+        qobject_unref(qdict);
+    }
+    return ret;
+}
-- 
2.31.1



