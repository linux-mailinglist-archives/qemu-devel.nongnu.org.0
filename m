Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6AE39F2F0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 11:53:55 +0200 (CEST)
Received: from localhost ([::1]:44288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqYQk-0005dQ-7Z
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 05:53:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDs-0004iD-Sl
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:36 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lqYDo-0001ww-7b
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 05:40:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1233391wmc.1
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vv2J1Eu+1Gs3q5FfU3Miy7oOhq4eBNKPYhz6liN5ugY=;
 b=cYdVyniv8mQg3NRAJpLF+f533QWroQdU2ACIsDvgUHYuSIUCAqm8XZuk9ymaVERZ0B
 j99rqJtI5a89k5dhUWTt9A1mzezkg1Nsyi9KPLT/gHh7gK9Mi8GSRO6LnCVQuNdPIaht
 x8TfFOLelS2IaF1lHFh2jzvfPOxwIrN6K8970+UdZXs+085ttAp/5YV2G5e/H+QQW4Qu
 iO9w2gELNFX2uqS9OXDeedIk7R0N5KjQpBMJmJQmWX+rHL90FBtDItatDNGoAE7ylrNM
 fe2ksQKfe9jn0Gg8593hElAIP4+krzJgH+RQlthD3EBUJCj5SVfv6U7T4DpBdOwGidgT
 uA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Vv2J1Eu+1Gs3q5FfU3Miy7oOhq4eBNKPYhz6liN5ugY=;
 b=fHq0aCpWTX0dRDiGlwpNTtTg0pY6BeWq8LgKoueLax36op6LchiCRwzBziaib07NdO
 YEpUFNRdbMMgSAr7u16FeAjwsyXcZ36oxQcs/g+pVn3eFoijTFpWb3UY0ehyb6PefF4w
 v09z8QGvw8G8cIjQG+iZ7NBsYosdaHsSZ6F9nrPf0QxiSX/aF82AvWLLKtWAQTuzgpee
 ARIuMasgQX1/gr9ldq+RYvwclx2cDUoOp2pRcJ8bS6LN3wGV4uml9TP+Zjke6weaZGET
 hmJtO6GJGxu/BLjQ0plAl4M0ztyDm32YGQvnXFI8TKD8jFpK6Y8Tns27g3drAZO+t6w+
 YsBQ==
X-Gm-Message-State: AOAM531dyM8o76O/K6IEYwfu9fVnX3yO/tUV4Nw9qAU6nhm/AJ8j3GUv
 VzGcxOaHQeILZc1m8CZcFSW/GeO9foc=
X-Google-Smtp-Source: ABdhPJzhUgKRNOFBEoixl1RzWQK9uLTjbAy7V5clQMnD/yJoCyedn5ozjGcSvFUcKdTLfMyH6DxlzQ==
X-Received: by 2002:a1c:1d04:: with SMTP id d4mr20756428wmd.126.1623145230810; 
 Tue, 08 Jun 2021 02:40:30 -0700 (PDT)
Received: from avogadro.lan ([93.56.169.140])
 by smtp.gmail.com with ESMTPSA id d15sm8608764wri.58.2021.06.08.02.40.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jun 2021 02:40:30 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/12] vnc: avoid deprecation warnings for SASL on OS X
Date: Tue,  8 Jun 2021 11:40:17 +0200
Message-Id: <20210608094017.392673-13-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608094017.392673-1-pbonzini@redhat.com>
References: <20210608094017.392673-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x333.google.com
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

Apple has deprecated sasl.h functions in OS X 10.11.  Therefore,
all files that use SASL API need to disable -Wdeprecated-declarations.
Remove the only use that is outside vnc-auth-sasl.c and add the
relevant #pragma GCC diagnostic there.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210604120915.286195-1-pbonzini@redhat.com>
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


