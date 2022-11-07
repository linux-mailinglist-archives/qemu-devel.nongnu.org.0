Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDC762045E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 01:00:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC14-0004KG-0i; Mon, 07 Nov 2022 18:58:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC12-0004Iv-T8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC10-0001zX-VQ
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:58:56 -0500
Received: by mail-wr1-x434.google.com with SMTP id j15so18519162wrq.3
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=85x2IkSz6a0ndvbFw8yP07VnybynH46w15PMISZYCz4=;
 b=lCcDOJ/Xd0/jSRKpdiP578qsxAncDYafQM4VIFQ2ToRFzGoKaCKbx6/UIzaXUyVvKL
 NfHWdpCmGyyZLaaDJg8wofrm5IwnkPy/hH+QQcspBS6mBgKYZuCNoKPC3jJIHm1Yjy1I
 W/ngA4/S1WvU7dHKbXVEPuMlI7C3gFZIF5JmHELytsoQ2r3P6J4HrTPufeutBkYzKMDK
 RqrzJMSHh6sCEOLyDktwKCKcpb7FG/3BnC+hGqkNfxFRVIT8TT/Lw+Vp6J1EVp7ouzLz
 rNrhKIyUcWX2P3paDnGWonx9RNl+IqR6mFjikvwjRYch9cSNMrMFy9UH/Ajt2xkbRxDP
 jKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=85x2IkSz6a0ndvbFw8yP07VnybynH46w15PMISZYCz4=;
 b=xLYZv8Lqw41bR7lDxLCp8DAp+fuPc9azCYaKHI9SNkvDfDoJUb40+u4jQ5UXM/iHm0
 i7AI8yKo78HI3uwCCJ70CxBFD8LRFp7Em03QfDKjCibZboOXmjeSzAz8cafboAwe9QXu
 Rac8H47lL7cT10cl46JXiUKkyk9gYDzHlO+VlB9xq0XwDGZ0uOAWaVErfILwwpolS/PD
 ZHd1bTcc7LpbC/e4oSO23Xnd0KZr9CRlza93rwE4/HpwOfnVZ34o9uu85q7UJG655csO
 jZTPR0PE+wbhJGnk03rgKI604myw8/SCgmVcvT4nqEMEI+gJ0KgkHKI9e+eqjt585fAp
 XskA==
X-Gm-Message-State: ACrzQf3kZuxn1r+vh0z2Pe4/EUFk/h/UAg9z6/BOL5zbM6r1D3BsCcoB
 zeJ50ryGsVqREWEHWJXrDUqdqiE/vpFzbw==
X-Google-Smtp-Source: AMsMyM5/cRCv3i6nRO/5pZpYZxoE6SRaUBMIRW7WWsTwG83db+1lfneNuXUwCPqzA8v5sJXq3/0XEQ==
X-Received: by 2002:a5d:5a82:0:b0:224:f744:1799 with SMTP id
 bp2-20020a5d5a82000000b00224f7441799mr33041214wrb.582.1667865533548; 
 Mon, 07 Nov 2022 15:58:53 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 iv9-20020a05600c548900b003cf87623c16sm14389624wmb.4.2022.11.07.15.58.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 06/14] disas/nanomips: Fix invalid PRId64 format calling
 img_format()
Date: Tue,  8 Nov 2022 00:58:14 +0100
Message-Id: <20221107235822.71458-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Fix warnings such:

  disas/nanomips.c:3251:64: warning: format specifies type 'char *' but the argument has type 'int64' (aka 'long long') [-Wformat]
    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, s_value, rs);
                                            ~~                 ^~~~~~~
                                            %lld

To avoid crashes such (kernel from commit f375ad6a0d):

  $ qemu-system-mipsel -cpu I7200 -d in_asm -kernel generic_nano32r6el_page4k
  ...
  ----------------
  IN: __bzero
  0x805c6084:  20c4 6950      ADDU r13, a0, a2
  0x805c6088:  9089           ADDIU a0, 1
  Process 70261 stopped
  * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffff0)
      frame #0: 0x00000001bfe38864 libsystem_platform.dylib`_platform_strlen + 4
  libsystem_platform.dylib`:
  ->  0x1bfe38864 <+4>:  ldr    q0, [x1]
      0x1bfe38868 <+8>:  adr    x3, #-0xc8                ; ___lldb_unnamed_symbol314
      0x1bfe3886c <+12>: ldr    q2, [x3], #0x10
      0x1bfe38870 <+16>: and    x2, x0, #0xf
  Target 0: (qemu-system-mipsel) stopped.
  (lldb) bt
  * thread #6, stop reason = EXC_BAD_ACCESS (code=1, address=0xfffffffffffffff0)
    * frame #0: 0x00000001bfe38864 libsystem_platform.dylib`_platform_strlen + 4
      frame #1: 0x00000001bfce76a0 libsystem_c.dylib`__vfprintf + 4544
      frame #2: 0x00000001bfd158b4 libsystem_c.dylib`_vasprintf + 280
      frame #3: 0x0000000101c22fb0 libglib-2.0.0.dylib`g_vasprintf + 28
      frame #4: 0x0000000101bfb7d8 libglib-2.0.0.dylib`g_strdup_vprintf + 32
      frame #5: 0x000000010000fb70 qemu-system-mipsel`img_format(format=<unavailable>) at nanomips.c:103:14 [opt]
      frame #6: 0x0000000100018868 qemu-system-mipsel`SB_S9_(instruction=<unavailable>, info=<unavailable>) at nanomips.c:12616:12 [opt]
      frame #7: 0x000000010000f90c qemu-system-mipsel`print_insn_nanomips at nanomips.c:589:28 [opt]

Fixes: 4066c152b3 ("disas/nanomips: Remove IMMEDIATE functions")
Reported-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101114458.25756-2-philmd@linaro.org>
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
2.38.1


