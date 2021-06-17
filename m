Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC203AB944
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:11:58 +0200 (CEST)
Received: from localhost ([::1]:47536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltucX-0004Qk-Au
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKR-0006e4-RM
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:15 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKP-0001Rm-UT
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:15 -0400
Received: by mail-ej1-x632.google.com with SMTP id gt18so10622982ejc.11
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1AXreqKY+hL7+OHi5Zt8L7qOfGiJrOmEH2Pb5pryjdM=;
 b=AxZh5WIWrgJdUx9qA7pmxHKVuuRDglfEKbzrDq17a1fhCHH/pAfFK35bnuSBojwoO3
 GjbgFkk5t4RM/U11jSoKr2dWZheH+7+yHM/okJ/VI+ck1/6NVUPlXu8yEn3W8zdnR/1k
 fyq5MWtyM5SJbwismyee8KgSfcVPGKJBpsk9/cUh56f9SY30MyAVyksoLNuZTX4XY+ew
 weehLph/LX59/SiNTYpxdXIEmTjyN7xZwLF6toEByMND9lilI/AEX4/dTJWgnqGKrrIH
 csn+YXLdbrROkEcsIuJAk7tqBDTDNrN5M6gtFg0zS4/xa+++zsLrM4/Zm9C+SexYbal6
 2nAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1AXreqKY+hL7+OHi5Zt8L7qOfGiJrOmEH2Pb5pryjdM=;
 b=GJFk4ymk9SXCn2QM3VlN0dUYJREj6NzN0JvpjQytkkJFiMBEoeKw3DwgYUgmB3n1J0
 C5UjR8V5B0FI5yCIUPMW5ouUyYVNlQem6CE1oJQ5HybB8bpEZG4zQylQnLaHx80vADSt
 4H+NVP6gz7/1dwZUf4dez5ov9+N/st80wwdNUCMQ+fiWAaJqrj0bvBrsxkSLPj+yr+pg
 2huIGEaYWKt4xaXF5nsMeoPdyUE2mDu3hK7CmpM4JrdjHTUVL69mm6QB+sI1g39bH9qb
 yeLfq9jzIluNrfIN5suOKPRoxLeRPItnJGj0DUQa0iXDe31hQqYqyPC0JtSxELCKxKEZ
 3vtQ==
X-Gm-Message-State: AOAM530axOpPedyGJZ6SMPh3khDQPeA6ri2VGqx4OzsfTdFoLWcEWr+4
 UyFMBWI2RgcZs3/w9f/e7vjsPcf4rjQ=
X-Google-Smtp-Source: ABdhPJywgOfAX6kbLQR3unPyzEf59y9S9K9y2QUQavDL2SMiLRrtzym+A0Tjmt/qNPqCDQRcs1wsZA==
X-Received: by 2002:a17:907:a8b:: with SMTP id
 by11mr6068303ejc.357.1623945192502; 
 Thu, 17 Jun 2021 08:53:12 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/11] keyval: introduce keyval_parse_into
Date: Thu, 17 Jun 2021 17:53:00 +0200
Message-Id: <20210617155308.928754-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow parsing multiple keyval sequences into the same dictionary.
This will be used to simplify the parsing of the -M command line
option, which is currently a .merge_lists = true QemuOpts group.

Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
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
index 8006c5df20..a6cf1d9606 100644
--- a/util/keyval.c
+++ b/util/keyval.c
@@ -502,13 +502,14 @@ static QObject *keyval_listify(QDict *cur, GSList *key_of_cur, Error **errp)
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
@@ -517,7 +518,6 @@ QDict *keyval_parse(const char *params, const char *implied_key,
     while (*s) {
         s = keyval_parse_one(qdict, s, implied_key, &help, errp);
         if (!s) {
-            qobject_unref(qdict);
             return NULL;
         }
         implied_key = NULL;
@@ -527,15 +527,42 @@ QDict *keyval_parse(const char *params, const char *implied_key,
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



