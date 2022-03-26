Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 041914E815D
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 15:14:07 +0100 (CET)
Received: from localhost ([::1]:50520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY7B8-0000bD-2x
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 10:14:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6RA-0007dE-Cw
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:40 -0400
Received: from [2001:4860:4864:20::36] (port=45864
 helo=mail-oa1-x36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6R7-0005Y3-OH
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:35 -0400
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-d6ca46da48so10699744fac.12
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jlMPZ5+ciovunZH+v/owH8Odf5O35GcMQuqFyPTC+AM=;
 b=XfnJR1AFNM+2CYc0XgXZ/qDrYf7l8Y5TX8rNg11+KAsASBSycNgeCmeXZEfBejPF9n
 2DExRC6Di2Op4ZlwIRsalqnb9WKq5sPvey9wmRq8yQ0MQwrrVsKxL0MjTaD7Rug5pXDw
 zhIkfXTqiQjQCMj3YiGSUEBC3Arf5jyiiN6VTKzNQ30JoKFGzjIk+lQRHJqGHgGlHaPJ
 eOfn81QApvnAQ5dNUcCTQL7MDHdxW1AhDHaNS1AurynO8HTuPBAeIaPbvgG/Z5NXuQOd
 Ts/wuBu1Bn87jb/S7iFK1AdBMV8tGt+p//PE01w1b9g5xx/4/i0zn0VgaU69OXbiFb0o
 jquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jlMPZ5+ciovunZH+v/owH8Odf5O35GcMQuqFyPTC+AM=;
 b=GW0RGMXlDqPJenZtly2lvUrjI7TAsnoImgpPn8GDv59p4xeZaVP32VMOhLNR/Ukfgw
 savTD+gvLHCvfGS9kaqByzt7w+NfxibhyFZfJX14iG6W/YPEC8qkBXKbiPzDkIX0pbzj
 1w0HsMu1olTlXoSRJS7um8Pu/4Qs5FIJp40VXl2lKJ/CPrwRgkRGCC3XMDTai0Ml9By3
 hGS/EyhWFj9cgE/rHMzZfSb7bExhKOe2R34PEAPwTw9PWTv1b/Ir7b3jifvneNPIexex
 KPBFKb5xNWrRl53TWfx5R/MtqyLMHPsHOVI+1I5mhwFN6/QikLiHk96ClMT1umgiHvHF
 WE2A==
X-Gm-Message-State: AOAM530p+CkjWbyjyJMy8P84l2VNuqpzPSZXaRrC7qGCAGv8UfSlyL90
 bl+NcpRWXXMqaWhhxMtItRaFZN4hcOKIyarz
X-Google-Smtp-Source: ABdhPJzS2TOO6FYWmebKr9JVg7ljGj94mnF3SjbRdZ4uauu5Ym5ymUuBpWXkfP2zVARPoJRJtWFsuA==
X-Received: by 2002:a05:6870:3394:b0:dd:cfdd:34c9 with SMTP id
 w20-20020a056870339400b000ddcfdd34c9mr11507614oae.31.1648301192843; 
 Sat, 26 Mar 2022 06:26:32 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/39] bsd-user: Use qemu_set_log_filename_flags
Date: Sat, 26 Mar 2022 07:25:23 -0600
Message-Id: <20220326132534.543738-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::36
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x36.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Perform all logfile setup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index ed26fc5acb..aa13eae7f3 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -405,16 +405,16 @@ int main(int argc, char **argv)
     }
 
     /* init debug */
-    qemu_set_log_filename(log_file, &error_fatal);
-    if (log_mask) {
-        int mask;
-
-        mask = qemu_str_to_log_mask(log_mask);
-        if (!mask) {
-            qemu_print_log_usage(stdout);
-            exit(1);
+    {
+        int mask = 0;
+        if (log_mask) {
+            mask = qemu_str_to_log_mask(log_mask);
+            if (!mask) {
+                qemu_print_log_usage(stdout);
+                exit(1);
+            }
         }
-        qemu_set_log(mask, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     if (optind >= argc) {
-- 
2.25.1


