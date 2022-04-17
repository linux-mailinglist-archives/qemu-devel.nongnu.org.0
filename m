Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 389F1504923
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Apr 2022 21:02:05 +0200 (CEST)
Received: from localhost ([::1]:49098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngA9s-00048B-9q
	for lists+qemu-devel@lfdr.de; Sun, 17 Apr 2022 15:02:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fN-0000Qa-Ou
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:37 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:38633)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng9fJ-0001kN-HV
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 14:30:32 -0400
Received: by mail-pg1-x52c.google.com with SMTP id s137so15072503pgs.5
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 11:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kPR3QL2zkjcobuOtk7sTr4ObN7Yl/0yBneTbMcqTLmw=;
 b=V1P2oIfpCf6o9/Eh90FTCqBSht+ULSw1BjeVd8tWR67LmtAGv6OC2b1wEb1/cabq0M
 Ax3AHU1/cAn2SK53JYYR+aulFxd22vVhjLUn3/MHfplbdMUKhHS1yeYaVIkxsVtn2kxL
 de57P4KMpcOfwjzDvdnl/dRqKP+lh43HKT2qsb8dL1uWBs86jLOAPHRtoBZUo/hcfj56
 ytX6cg3x+o0hzJOkEuL2WzP/FxfTu1xyVgaoKwck9+sHvLbWC3/hXUyilnxQZc05ZT+W
 CNr1wdjM4H5tw01qx9jjKaWzKAXR8H7K5CRTqs4dP9JGJ2pSa70O/SsSGTZ9wYGUVxsG
 055Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kPR3QL2zkjcobuOtk7sTr4ObN7Yl/0yBneTbMcqTLmw=;
 b=wL4sEf668FDrbMqPN2Q7Bo3umRN+pqD1COk86KaIqHGEDSEuS7ER3E1/onfH/cR+w4
 OeEGhk/TZmVa3QpU+4oVQfzpb8FmTN0k0PfApVyFRpgu/up05zy8zniRL5WxxxHM0gM0
 Vo4ovKqiGYIqC4zf1fSP/WhJq4eqw6t7uaNEtIh68zIh3Kmctx/GpMX2rRJ8qNSTF7ak
 gJgDBqNUz4QyEnZzG72U8iyOi+2RzcJ3+jttzrFRuWLN7Ixtt1+s9Kkef1d7M3qzWJB8
 gsZmVyU6qlB24ZTYPXsuuBNNQk8rRWPK0NGry9tMrGA1/kt2R17Tge/id4k2GzovZ+TD
 /AKg==
X-Gm-Message-State: AOAM532/QO02q2BcCcHMLUvfNKVfGmQQjzPqdIaTa0uLzxAl6NpirpRk
 yLHTioe0X6/EG+7Rkcr607mnyeTeOyvbDA==
X-Google-Smtp-Source: ABdhPJwnqKRwNxDCP0ypiCel9t1I0Bss2O3AIr7Ea8oxKfXWkeMjo+pc/jDsqY/V7pttVe4zfbfmUw==
X-Received: by 2002:a63:e10b:0:b0:39d:bd5a:92b6 with SMTP id
 z11-20020a63e10b000000b0039dbd5a92b6mr7085602pgh.163.1650220227042; 
 Sun, 17 Apr 2022 11:30:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 on10-20020a17090b1d0a00b001d08a7d569csm8154011pjb.56.2022.04.17.11.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 11:30:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/39] hw/xen: Split out xen_pv_output_msg
Date: Sun, 17 Apr 2022 11:29:48 -0700
Message-Id: <20220417183019.755276-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417183019.755276-1-richard.henderson@linaro.org>
References: <20220417183019.755276-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Use qemu_log_trylock/unlock instead of qemu_log directly.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/xen/xen_pvdev.c | 44 ++++++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/hw/xen/xen_pvdev.c b/hw/xen/xen_pvdev.c
index 8ab458922a..0423c61158 100644
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
+    logfile = qemu_log_trylock();
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


