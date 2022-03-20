Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2CF4E1D19
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:23:16 +0100 (CET)
Received: from localhost ([::1]:46380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzGt-0005nT-H3
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:23:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:32962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5n-0008Lk-IF
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:47 -0400
Received: from [2607:f8b0:4864:20::532] (port=35759
 helo=mail-pg1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz5l-0003Qn-K0
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:11:46 -0400
Received: by mail-pg1-x532.google.com with SMTP id e6so8737180pgn.2
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1dSl4TTW2l9haojZKtDE3xV0KCAHP/jmJTof7woW9Y=;
 b=G3Zx6dmWTDj3rdH7H5Zzsiei+VsMlRBdn5ump6JYSnDHw7m/W6ssIub/PxMwr20Zud
 yhJbqbnvQXxy0GyosxouG3qihWKYvoBPDMZPar/MGV2KJpty9jJUMzQbSVhuk7WL8jHW
 SIYRI+bc6qjcszOSKGah1fKXvwL9oEy5CUaYFg+MkSqhopNKoMsmKkmJFSbx+g5dhKZq
 o+0S0PehzgYmtYeSpvUuOpF/a8b4i6f2KDczyj1hE5Pa8BVmMVdxU7/PZ4N3u4AKZ1oc
 QVfCsgilgH9C+dDh9pC1cBaJ6OdYh8AhKjy1tEXwSAegoyCqCZuBtPRniVPQLqDj+yM8
 9KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1dSl4TTW2l9haojZKtDE3xV0KCAHP/jmJTof7woW9Y=;
 b=qh5MvREFmkFuUrt80a6DH+8IOcnjfXctbm0PpX8VRQRrido/RkeUGVwliNxe/fWS3S
 ZIQ9BNn2Bv+qJ8AcvrJkocB71dA2VQ6mJnWmxOj3ni14wTZCX2QOG/tfyIA94Y4MpTzU
 8ty//Iv7LzgUYf7KyyQYXXLCIqDojQnxBQGsQebI5XmWz+CVNQgO0pb1Rg8xBM5U8o1/
 cOs+ppyZ/39/gh8UAqA2ckOdCAvjKLZvKWrbcf6QOu1WJr7AwblJwSNF4x8/8e+N6NLR
 hg64NNRed+UOJwmdw6JrE2/hlfQ1i6WtQBBm+Sj+5f27tvKucxarUPxrP6vzBNxdJsyT
 4QOg==
X-Gm-Message-State: AOAM532IDG/ifR0wyeYJGMkCjUMEZDuqPiZjqYBJ9f2c8zIii37iTDfD
 dk+pmX2yU1FcgTge3f5+bCHVU2LZWGAQYA==
X-Google-Smtp-Source: ABdhPJxXMBpkcykVo18sISt1zlvE2uxrLgjrfECUsEsT3V8NL7Vy5Zyd2elX5eCQIrjFrK6s7oJIyg==
X-Received: by 2002:a63:4766:0:b0:382:6cc2:c0d3 with SMTP id
 w38-20020a634766000000b003826cc2c0d3mr3234343pgk.6.1647796303299; 
 Sun, 20 Mar 2022 10:11:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:11:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 07/36] hw/xen: Split out xen_pv_output_msg
Date: Sun, 20 Mar 2022 10:11:06 -0700
Message-Id: <20220320171135.2704502-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::532
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not replicate the individual logging statements.
Use qemu_log_lock/unlock instead of qemu_log directly.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/xen/xen_pvdev.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 8ab458922a..355bbda60d 100644
--- a/hw/xen/xen_pvdev.c
+++ b/hw/xen/xen_pvdev.c
@@ -196,34 +196,38 @@ const char *xenbus_strstate(enum xenbus_state state)
  *  2 == noisy debug messages (logfile only).
  *  3 == will flood your log (logfile only).
  */
+static void xen_pv_output_msg(struct XenLegacyDevice *xendev,
+                              FILE *f, const char *fmt, va_list args)
+{
+    if (xendev) {
+        fprintf(f, "xen be: %s: ", xendev->name);
+    } else {
+        fprintf(f, "xen be core: ");
+    }
+    vfprintf(f, fmt, args);
+}
+
 void xen_pv_printf(struct XenLegacyDevice *xendev, int msg_level,
                    const char *fmt, ...)
 {
+    FILE *logfile;
     va_list args;
 
-    if (xendev) {
-        if (msg_level > xendev->debug) {
-            return;
-        }
-        qemu_log("xen be: %s: ", xendev->name);
-        if (msg_level == 0) {
-            fprintf(stderr, "xen be: %s: ", xendev->name);
-        }
-    } else {
-        if (msg_level > debug) {
-            return;
-        }
-        qemu_log("xen be core: ");
-        if (msg_level == 0) {
-            fprintf(stderr, "xen be core: ");
-        }
+    if (msg_level > (xendev ? xendev->debug : debug)) {
+        return;
     }
-    va_start(args, fmt);
-    qemu_log_vprintf(fmt, args);
-    va_end(args);
+
+    logfile = qemu_log_lock();
+    if (logfile) {
+        va_start(args, fmt);
+        xen_pv_output_msg(xendev, logfile, fmt, args);
+        va_end(args);
+        qemu_log_unlock(logfile);
+    }
+
     if (msg_level == 0) {
         va_start(args, fmt);
-        vfprintf(stderr, fmt, args);
+        xen_pv_output_msg(xendev, stderr, fmt, args);
         va_end(args);
     }
     qemu_log_flush();
-- 
2.25.1


