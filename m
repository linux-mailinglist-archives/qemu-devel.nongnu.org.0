Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3623B6149AD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:45:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opphq-0006Y1-FQ; Tue, 01 Nov 2022 07:45:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphe-0006SE-KT
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:10 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opphc-0004He-RN
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:45:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 ay14-20020a05600c1e0e00b003cf6ab34b61so3243382wmb.2
 for <qemu-devel@nongnu.org>; Tue, 01 Nov 2022 04:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SJejtaN5E6Xp6r487/nhzrxEqMmLjxBo+QwOTkFMbfU=;
 b=r9/UJor/WUqR9Kl87e8whOyUvh5HiLroRyped3qlX9N26+6l0VqHmSjZo4dFBSBa07
 HfnMdFcsQVxav+No6POL5QLc4FwBqgkssl6UyFhYHjWyfwIxpDw1H81stoazWBDcVRW1
 0INIoQnaqvQV8Ii13JZpFkTNqIVtMZtuJ89Wfg1PZMGstcCzhCU1SYqtI2fwvmQ7K+6c
 gpiXHGemBMzMC7Fp1gmh/9F2j0sX0qk6rELOpqILRXwzCLQL6iWAvl/wZ9SO+CUoNZE/
 XbkSXOouOOyYXxEBuXKjYHegM/3fJuakw8AL/9qTcaDzvM2gF4pygTVtsP8pY0VFrLpr
 nUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SJejtaN5E6Xp6r487/nhzrxEqMmLjxBo+QwOTkFMbfU=;
 b=5QWk5DNWN8jBG/3T6PSnoJTT8sC9w1Bz/suoE9o3TaJadI/t+vunXRBKgi9O3M3wW8
 MXO8O1aVsvjjD3/MggilSh934MPXThH0I9TYxFNL1RDNE9NzWeWWPcMLxsM0wuSN7GNZ
 wsurKMB85jhRhPA8Du/lq7EbRkrI8md9R8k+KVWHCBL3YV1JcPGdHq+CNlpI3SfTd2H4
 qGSmces4dICjxcad7vIZbLFjEPLGSB48mM3NHLRqPM+5Ab+3V3h65+utUtc0GJz6eGG9
 0pXn5A/LdQwJHapuU27mskEgor2aBBsbrvuC9zgjkL3aFNKys/dpWFHXjBgyeze/ghGm
 EBjw==
X-Gm-Message-State: ACrzQf2ySbiU8FzR15loPqyqZ4lX44TfyduR8ZuhzJ/3uXi4LN3n9QSK
 GS77z10NA/0xwuwEGDuS0CvwlSbSU9a68Q==
X-Google-Smtp-Source: AMsMyM7iJP6/3Nz8qaxZ7k0OYHMgaS62rzingUdgmVf7gN/xSORNoMh0vfPO4B115vSB7puPfsWs6g==
X-Received: by 2002:a7b:cb8d:0:b0:3c6:d811:6cff with SMTP id
 m13-20020a7bcb8d000000b003c6d8116cffmr82016wmi.43.1667303107072; 
 Tue, 01 Nov 2022 04:45:07 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a5d620a000000b0023657e1b97esm9938311wru.11.2022.11.01.04.45.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 01 Nov 2022 04:45:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Petar Jovanovic <mips32r2@gmail.com>, Stefan Weil <sw@weilnetz.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 1/5] disas/nanomips: Fix invalid PRId64 format calling
 img_format()
Date: Tue,  1 Nov 2022 12:44:54 +0100
Message-Id: <20221101114458.25756-2-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221101114458.25756-1-philmd@linaro.org>
References: <20221101114458.25756-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Fix warnings such:

  disas/nanomips.c:3251:64: warning: format specifies type 'char *' but the argument has type 'int64' (aka 'long long') [-Wformat]
    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
                                            ~~                 ^~~~~~~
                                            %lld

Fixes: 4066c152b3 ("disas/nanomips: Remove IMMEDIATE functions")
Reported-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 9647f1a8e3..6466c80dc5 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -3252,7 +3252,8 @@ static char *CACHE(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value, info);
 
-    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
+    return img_format("CACHE 0x%" PRIx64 ", %" PRId64 "(%s)",
+                      op_value, s_value, rs);
 }
 
 
@@ -3274,7 +3275,8 @@ static char *CACHEE(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value, info);
 
-    return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
+    return img_format("CACHEE 0x%" PRIx64 ", %" PRId64 "(%s)",
+                      op_value, s_value, rs);
 }
 
 
@@ -5173,7 +5175,7 @@ static char *DADDIU_48_(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value, info);
 
-    return img_format("DADDIU %s, %s", rt, s_value);
+    return img_format("DADDIU %s, %" PRId64, rt, s_value);
 }
 
 
@@ -11859,7 +11861,7 @@ static char *PREF_S9_(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value, info);
 
-    return img_format("PREF 0x%" PRIx64 ", %s(%s)",
+    return img_format("PREF 0x%" PRIx64 ", %" PRId64 "(%s)",
                       hint_value, s_value, rs);
 }
 
@@ -11905,7 +11907,8 @@ static char *PREFE(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value, info);
 
-    return img_format("PREFE 0x%" PRIx64 ", %s(%s)", hint_value, s_value, rs);
+    return img_format("PREFE 0x%" PRIx64 ", %" PRId64 "(%s)",
+                      hint_value, s_value, rs);
 }
 
 
@@ -12079,7 +12082,7 @@ static char *REPL_PH(uint64 instruction, Dis_info *info)
 
     const char *rt = GPR(rt_value, info);
 
-    return img_format("REPL.PH %s, %s", rt, s_value);
+    return img_format("REPL.PH %s, %" PRId64, rt, s_value);
 }
 
 
@@ -12613,7 +12616,7 @@ static char *SB_S9_(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SB %s, %s(%s)", rt, s_value, rs);
+    return img_format("SB %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12659,7 +12662,7 @@ static char *SBE(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SBE %s, %s(%s)", rt, s_value, rs);
+    return img_format("SBE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12706,7 +12709,7 @@ static char *SC(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SC %s, %s(%s)", rt, s_value, rs);
+    return img_format("SC %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12729,7 +12732,7 @@ static char *SCD(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SCD %s, %s(%s)", rt, s_value, rs);
+    return img_format("SCD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12776,7 +12779,7 @@ static char *SCE(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SCE %s, %s(%s)", rt, s_value, rs);
+    return img_format("SCE %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12868,7 +12871,7 @@ static char *SD_S9_(uint64 instruction, Dis_info *info)
     const char *rt = GPR(rt_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SD %s, %s(%s)", rt, s_value, rs);
+    return img_format("SD %s, %" PRId64 "(%s)", rt, s_value, rs);
 }
 
 
@@ -12973,7 +12976,7 @@ static char *SDC1_S9_(uint64 instruction, Dis_info *info)
     const char *ft = FPR(ft_value, info);
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SDC1 %s, %s(%s)", ft, s_value, rs);
+    return img_format("SDC1 %s, %" PRId64 "(%s)", ft, s_value, rs);
 }
 
 
@@ -13066,7 +13069,8 @@ static char *SDC2(uint64 instruction, Dis_info *info)
 
     const char *rs = GPR(rs_value, info);
 
-    return img_format("SDC2 CP%" PRIu64 ", %s(%s)", cs_value, s_value, rs);
+    return img_format("SDC2 CP%" PRIu64 ", %" PRId64 "(%s)",
+                      cs_value, s_value, rs);
 }
 
 
@@ -13091,7 +13095,8 @@ static char *SDM(uint64 instruction, Dis_info *info)
     const char *rs = GPR(rs_value, info);
     uint64 count3 = encode_count3_from_count(count3_value);
 
-    return img_format("SDM %s, %s(%s), 0x%" PRIx64, rt, s_value, rs, count3);
+    return img_format("SDM %s, %" PRId64 "(%s), 0x%" PRIx64,
+                      rt, s_value, rs, count3);
 }
 
 
-- 
2.37.3


