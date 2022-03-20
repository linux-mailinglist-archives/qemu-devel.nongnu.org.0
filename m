Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69ECF4E1D42
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 18:55:15 +0100 (CET)
Received: from localhost ([::1]:49796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVzlp-0004ZP-HP
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 13:55:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz64-0000H9-8d
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:04 -0400
Received: from [2607:f8b0:4864:20::1031] (port=45830
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nVz62-0003V1-Rj
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 13:12:03 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 m11-20020a17090a7f8b00b001beef6143a8so12525038pjl.4
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 10:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X5VZGVfDRwsa6U5imM3TbqL1rDwZxZr3FYEMX2oqv64=;
 b=gkvCUH+25Jp/H+u8K+OTbkHDz4ZpZx+i3HazrP92UjrcXmjhlzNvC8NA92KZia3mfa
 2ZT42MycZHIDl8s7chTaKesh5WTKZ2UYHcwDGhK3/xyH39xgryJugYP17fF/kO7RASqe
 sS2e3MBgHx1i+W1Y5E7JLhrq6oVpGEciaiAvWhXl57TDNTGaL0sBkX2rhhBUDgJCvqG7
 C/3v6hS0ki+j97+6C+Ka5do5lKbH9Zl68rKBtSmRyz3vV7mpoVMQMA7L2GS3jPpiIf/s
 9QmXKmQdF6xwXZoGvDFlYqUiYI4Qo+n/Sl2k7mwHfhPEJQLXOK0GKHlFcO/liBb6jXUK
 lD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X5VZGVfDRwsa6U5imM3TbqL1rDwZxZr3FYEMX2oqv64=;
 b=Yr7aqi8fkV99XKzz6qad/txGbs04KC5XD75ny34Vpv31qIxGI9TVTKjEmsLwQ0YA4L
 +PXUpaVYH628oUZxUcTLCVG/iWmWkmaDB+9N52xjGxaRIhiTp8UaRV3TPkCrUgsNonHe
 B5y2dZtgiFLmip6YZm26pgXePNCBhrRXq7aSxOrB5Tx+NtHym7cPP4ElTVBV5m7QhxqK
 uTTNqUFcOxMxo23jO710GJ5+QQ2S+bI4Kpak0XQVZ6/juRWUtIzgcGAsVHl1QDrR5ANp
 8H1F39TGai5HFlGp3onFt/INitEFJ8ZhFLRLkQEv4RxP0kNMh86nOk/r/MKsOSAmVbxA
 GYNg==
X-Gm-Message-State: AOAM533NemXVAxki1G7s2KpgxYsspyhU3VcRekU4cfoqyUVMI/9h7LPT
 vt56lVjG5zNbbL5BvrYUxPmJ6X4k9M6fSA==
X-Google-Smtp-Source: ABdhPJwIax6lmBbL1YsGoh3k78BTzjInKGKZ6AFccJrGGKPm3JoHByHa5tjd4lapnOUo3lvkh73M1g==
X-Received: by 2002:a17:90a:4097:b0:1c6:ca92:7a83 with SMTP id
 l23-20020a17090a409700b001c6ca927a83mr11177526pjg.130.1647796321538; 
 Sun, 20 Mar 2022 10:12:01 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 q12-20020a17090aa00c00b001bc6f1baaaesm17149697pjp.39.2022.03.20.10.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 10:12:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL for-7.1 27/36] softmmu: Use qemu_set_log_filename_flags
Date: Sun, 20 Mar 2022 10:11:26 -0700
Message-Id: <20220320171135.2704502-28-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220320171135.2704502-1-richard.henderson@linaro.org>
References: <20220320171135.2704502-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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

Perform all logfile setup at startup in one step.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 softmmu/vl.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/softmmu/vl.c b/softmmu/vl.c
index 73296015af..81c91ec7b0 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2559,19 +2559,16 @@ static void qemu_process_early_options(void)
 #endif
 
     /* Open the logfile at this point and set the log mask if necessary.  */
-    if (log_file) {
-        qemu_set_log_filename(log_file, &error_fatal);
-    }
-    if (log_mask) {
-        int mask;
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
-    } else {
-        qemu_set_log(0, &error_fatal);
+        qemu_set_log_filename_flags(log_file, mask, &error_fatal);
     }
 
     qemu_add_default_firmwarepath();
-- 
2.25.1


