Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DAD39F2EC
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:53:32 +0200 (CEST)
Received: from localhost ([::1]:42826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYQN-0004gG-Vt
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:53:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDm-0004Ym-FH
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:45631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDj-0001nl-5K
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:29 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so1386135wmg.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/PRr41PxTyXm10FMURUstxjpacQwh84HXdIsa79wlV8=;
 b=YtXe09RQcmPQ5bxuCluMBVTDLhc6/KvpT1EgkyxWBrr8yQnydzNvaIYAOUTF0jpQ8H
 x5xpihYdoM3s0O/4wALNmf0zwHgrpW6jvEHtQn/mlP4qC/MmkwR5bUR+17ZQpBrgn41o
 MdIsKxhnK/4VKbx9m2QNeRWlg7UOGZTmvG4d4fBNIod1UghtK3GSB3p90B2Z4+ka/fT0
 V+W2qDDO8xDwZeoX6D6oUFd0uFYqHkKLsTidBuO+UuTG5Jij98hc8x/2rYmCixi06fEH
 ZcHZP+Mu52/IMghTagmIM41jGhMr1jhp4iO4vw3zOydQqOGW0UclnnvmbPz5i776Ph7U
 Yc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/PRr41PxTyXm10FMURUstxjpacQwh84HXdIsa79wlV8=;
 b=agMOhpdUY+jikCJ46fC4T611lWDYzTfZHLpwlxtF7ks9SSist88ejz0AXzemz+k+qF
 arCtxouN6abeqSa1ljQ8kU6CtgNnMNKXQL+aAq6b6jbHaBlOsOrl2+VJqsusEUUxb6rh
 sK40Qlv04Vrg2OiiofZawm1MvMSND9dZELe4tkoOrewJ+djUtO+4qFe4Qazkm08DHJgO
 A/KSOLTtERxCNp078c+NYHXpyR1mfEkfhO0OYJk6pmXmZp543Vpn5diwcL6UNWy5qHOH
 bdoZuhKeCpYxL2xfjftEhKzfSX5ITbsguf27p3sLR8lTFe5pj/XD8khZOrCFwdB4qX3N
 1Rlg==
X-Gm-Message-State: AOAM5338LYqb2pTj6kABASuqhPOoFIlAX44DjLzkYPNOr0MA/Drw+a5V
 al8Evu8oC55CYceqEjLHOOuKmtdI7y4=
X-Google-Smtp-Source: ABdhPJx8mBdJzT+8OhXJNCOe1rQR3NXzlcKh9TmUr5Nx+zujaJdmbLnSfTjkqpTAgU+awpOqVYMF2g==
X-Received: by 2002:a7b:cde1:: with SMTP id p1mr3111734wmj.13.1623145222552;
 Tue, 08 Jun 2021 02:40:22 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:22 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/12] keyval: introduce keyval_parse_into
Date: Tue,  8 Jun 2021 11:40:08 +0200
Message-Id: <20210608094017.392673-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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



