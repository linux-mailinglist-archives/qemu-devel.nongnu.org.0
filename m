Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B64039B8CA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 14:10:27 +0200 (CEST)
Received: from localhost ([::1]:34252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lp8eg-00035V-7X
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 08:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lp8dc-0001h7-E8
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:09:20 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:47058)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lp8da-0008Vl-Gg
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 08:09:20 -0400
Received: by mail-ej1-x634.google.com with SMTP id b9so14081954ejc.13
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 05:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cv0jEbkzVBsjGThfoh2GmDB/53gyOhZFT5zdsfY8Kyo=;
 b=Hp4q4KDExUdBlgpLs8mIkyrivU2bnzKo/N7h+Zd9SSL879ohhopdfMmF6VaNb1HKF1
 yo0eubA9Ycc6/WlXSgFNH7j1VO6twy8IBZmiXp40ZUAhSFYBuJTTe4ufiIEVzeGjvc4B
 XlvhiB3sG4SPolq54XVyqLTsS6XsdKX3QhpeRTVtZstfyPOyUjw8oe8NJ27EWk9ZeGvS
 CPta6PYn+1e/miVf1R//F6BZEZLK2G/FL3To1MDopIK0dRyiiBkCYmEjXx38kYkt3bMp
 7/cFOu0FjfKMMmnV28R0kVMwqBvoUfVRUYVxDuh0cYhmGoe0q3CmHuNkkNjFMeZSOq6+
 UEjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=cv0jEbkzVBsjGThfoh2GmDB/53gyOhZFT5zdsfY8Kyo=;
 b=PqD35rSJs9gQmucZStmQtHxZOKeyRw9TFa0ivVG1pONN3jVL32KxOkTKGx24soHMWa
 1/X39dXdef/dxcyLPgHnlTqZiK2F4y8Phs7+Ap5sEVyxAQf5YFk9U7DYCwyYh3lAehmc
 LF4ZrrKtUxTobxOvKe0rJBybMTA7nzsxhwNikvdgthTwaXptzG95B+pykPFDqbhuTdII
 +ErJn8428t+cTsRTDEw6945K7lyWfsKHLpTh87xj49fc+G7Fxok0uy/hOqglxXLDGEDI
 YyZ0UDaEMuqduFTTl8H5tmg+8F0MSNu4VRlabkfMW3wAwk2f+Mb/OXjU7VS6GdJifZGj
 qMmA==
X-Gm-Message-State: AOAM532s62UH6mZpA35KtWCSdNpTlShh7s9fE9V/NGVK3XvFTe7fytOW
 PmTnQHlb4KR1T0iTYBXtdAJlNIFYsxbw3Q==
X-Google-Smtp-Source: ABdhPJwNjqyjxVUQzq9gyvWgRsblHezToUmy5kKSoz4052jvZ9dmrdeysYfSjNVpkHV75WDQu5faug==
X-Received: by 2002:a17:906:3644:: with SMTP id
 r4mr3910517ejb.140.1622808556911; 
 Fri, 04 Jun 2021 05:09:16 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 op24sm725163ejb.68.2021.06.04.05.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 05:09:16 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vnc: avoid deprecation warnings for SASL on OS X
Date: Fri,  4 Jun 2021 14:09:15 +0200
Message-Id: <20210604120915.286195-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x634.google.com
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
all files that use SASL API need to disable -Wdeprecated-declarations.
Remove the only use that is outside vnc-auth-sasl.c and add the
relevant #pragma GCC diagnostic there.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/vnc-auth-sasl.c | 20 ++++++++++++++++++++
 ui/vnc-auth-sasl.h |  1 +
 ui/vnc.c           | 10 ++--------
 3 files changed, 23 insertions(+), 8 deletions(-)

diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
index df7dc08e9f..cf65a0b161 100644
--- a/ui/vnc-auth-sasl.c
+++ b/ui/vnc-auth-sasl.c
@@ -28,10 +28,30 @@
 #include "vnc.h"
 #include "trace.h"
 
+/*
+ * Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
+ * files that use SASL API need to disable -Wdeprecated-declarations.
+ */
+#ifdef CONFIG_DARWIN
+#pragma GCC diagnostic warning "-Wdeprecated-declarations"
+#endif
+
 /* Max amount of data we send/recv for SASL steps to prevent DOS */
 #define SASL_DATA_MAX_LEN (1024 * 1024)
 
 
+bool vnc_sasl_server_init(Error **errp)
+{
+    int saslErr = sasl_server_init(NULL, "qemu");
+
+    if (saslErr != SASL_OK) {
+        error_setg(errp, "Failed to initialize SASL auth: %s",
+                   sasl_errstring(saslErr, NULL, NULL));
+        return false;
+    }
+    return true;
+}
+
 void vnc_sasl_client_cleanup(VncState *vs)
 {
     if (vs->sasl.conn) {
diff --git a/ui/vnc-auth-sasl.h b/ui/vnc-auth-sasl.h
index 1bfb86c6f5..367b8672cc 100644
--- a/ui/vnc-auth-sasl.h
+++ b/ui/vnc-auth-sasl.h
@@ -63,6 +63,7 @@ struct VncDisplaySASL {
     char *authzid;
 };
 
+bool vnc_sasl_server_init(Error **errp);
 void vnc_sasl_client_cleanup(VncState *vs);
 
 size_t vnc_client_read_sasl(VncState *vs);
diff --git a/ui/vnc.c b/ui/vnc.c
index b3d4d7b9a5..f0a1550d58 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -4154,14 +4154,8 @@ void vnc_display_open(const char *id, Error **errp)
     trace_vnc_auth_init(vd, 1, vd->ws_auth, vd->ws_subauth);
 
 #ifdef CONFIG_VNC_SASL
-    if (sasl) {
-        int saslErr = sasl_server_init(NULL, "qemu");
-
-        if (saslErr != SASL_OK) {
-            error_setg(errp, "Failed to initialize SASL auth: %s",
-                       sasl_errstring(saslErr, NULL, NULL));
-            goto fail;
-        }
+    if (sasl && !vnc_sasl_server_init(errp)) {
+        goto fail;
     }
 #endif
     vd->lock_key_sync = lock_key_sync;
-- 
2.31.1


