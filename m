Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB03AAFE8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 11:38:36 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltoTr-0007uV-ID
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 05:38:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN9-0002Yb-U4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:39 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltoN7-00060O-Mo
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 05:31:39 -0400
Received: by mail-ed1-x532.google.com with SMTP id d7so3135589edx.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 02:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YO7OJP33y0qDOR62cV7LoVmTb5HsjkNb5ft4fsaXMPw=;
 b=F0UOVti7/OyLA900wkR+I1Op/504hfGDIy8qDFTiso/oEQLCybThkCQ7wBRGnado7m
 BstKvo/ATmuygauuLKit6Rt8mym+7Se8U2aOQQvnwbYaTZ4YcaimKJz6ypKSn/T5ey4L
 VMIWZKK9cOxdpM8IpmIaloeEdYEh9kediEGtqOfMhsS6Ji8FSUr0ukJqh2DLHlW0JgVW
 peCBirZJOU49A/E60giANvxBMJL+BNlthK1f6BZWjf+pQfox6faS0GGsJS+XG5noYBAf
 zBgv/0tOQSHuTfJ2o9Nli10loemfOflBvCFzVbZKSKZgz24BAWCWtPA/CDWf+1mkLyR1
 LZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YO7OJP33y0qDOR62cV7LoVmTb5HsjkNb5ft4fsaXMPw=;
 b=dcynj3WWum/dPy00L+qoqnwTAD87nUXafWva/Ts+ptEmQ01w0zJ+c9kmGcTJAol8T4
 5SgOd8wzsUCZltw9YtvFT00f1gZ4jvsy4AF3TUqLV3Yeg2ejDol9GrEPJ9qyLeNNW5iy
 IEsiDShqHKaiJ3TQwhnIPUQ1UccRkYw7scS+uVRlOFkJJYfS6/CVy+M7LJr96LoTcgQb
 eNuhcHdh9Bu9IxAE33ON2NYY5rbWSG8KhQIQSs4/6RHgy4JgV4UROKg5zvhbbxxluPrq
 k1XlbByipp5V4x0CJccjkVtayRsWljKxMS7/5HO4eqf/LgQOlB0ZOrxxRBnTOpmec39w
 6lrA==
X-Gm-Message-State: AOAM5326skrZg+hXM7qIf8PvHxwNbl6IIbI3XTWDczELEwAoe4+iBUjl
 xTEpNbuA73ZFu6m36nIpYvvfAmIBdGs=
X-Google-Smtp-Source: ABdhPJxykuXtOa5EHH++moTjMroPgkHu+jGNgnpmaWaK1wgPwgeuOaq8LfuccHS39b+C4rvZ89l5Og==
X-Received: by 2002:aa7:db49:: with SMTP id n9mr5129529edt.361.1623922295955; 
 Thu, 17 Jun 2021 02:31:35 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id m18sm3328140ejx.56.2021.06.17.02.31.35
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 02:31:35 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/45] vnc: avoid deprecation warnings for SASL on OS X
Date: Thu, 17 Jun 2021 11:30:50 +0200
Message-Id: <20210617093134.900014-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617093134.900014-1-pbonzini@redhat.com>
References: <20210617093134.900014-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x532.google.com
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
index df7dc08e9f..47fdae5b21 100644
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
+#pragma GCC diagnostic ignored "-Wdeprecated-declarations"
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



