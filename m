Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D23C8612D67
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:33:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opGpt-0006Ef-Ge; Sun, 30 Oct 2022 18:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpr-00069r-Mx
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:19 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opGpm-000891-Ri
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:31:19 -0400
Received: by mail-wr1-x42f.google.com with SMTP id w14so13640258wru.8
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zLWC6xEOi/MXfkwYGpZjKV5ePdFtRiEGyq7gfPaAwmc=;
 b=ETrqI5pvZit0BdxM1ensfAW4kn/GT7eAb9SN/YGJwzI5CocjUAMc1BehH5iItA3Pf1
 uDMfXxMBJeBH0atkm/p1dqFoY4IjV/ifHr339BelvzFZnfd/3shvTWGJubRQ375fp1eC
 Ulwu5AK5zi/TPehKYHTcojSdNErpl6091tazPzm9y+Kj5gkubPM2UmVjGQ7WJM/OcgD9
 Jfz1w5YhGHfTNy0GEReKBbqh7IYxKAiGoQwddDcLGBkAJLBcPc22o8zjutPZwp3aPwUY
 JCAJ4uXcC1TOpMNpnmDsGSsdgNnkfvY6SYmIy3fVPw6oZu7693PHgH59Gh2EuR73kWlj
 SrqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zLWC6xEOi/MXfkwYGpZjKV5ePdFtRiEGyq7gfPaAwmc=;
 b=MikLe0MdrBIj/xbZVWHDkH2A+0OoUidinfJqW3JGrCFW4+a8K/O1GKQyWUdEHGhEwP
 jjmfIHvtilLQgcoaXudpmJ6Rrr/4o7cPSKEEuT6tVUAcxGkVQJUKdC03c+VV/r9tDxhf
 G/nwBkJuKWdUziEcsXIj3hu6HBDDWvb5G8zKEiiQV5QvkBsoSr8dYEcZkmehApRNWJSh
 VhhwlxurO03S1oomqbnJbIuIC30KG68l+N7tMQSNs2TMIUe3nU5ilJzNVvcfmZTicziA
 xTnvu4RdvE3biwwWXkzKtU7lkooBelmXtyp4cpl5bxKjoH4PWjn5gis1B3dV0kZl/mP6
 GRQw==
X-Gm-Message-State: ACrzQf1RAdpZlUw+Hm8cFZR/39CNNgj88qHokQKbLfeciEY5i4tLgcp5
 lWNejBYARYYw/vGDkNthPH3J4P4JDwGR/Q==
X-Google-Smtp-Source: AMsMyM6bcOQpcUa630VHi0RuVN8sv6RIgC8JTFyMNu4BqMq77Ssly5EltCaZH9wQOatD0KJQwqiSew==
X-Received: by 2002:adf:f78f:0:b0:236:992b:1f62 with SMTP id
 q15-20020adff78f000000b00236992b1f62mr5863814wrp.605.1667169072510; 
 Sun, 30 Oct 2022 15:31:12 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a5d61c9000000b00236733f0f98sm5138427wrv.107.2022.10.30.15.31.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:31:11 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paul Burton <paulburton@kernel.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 22/55] disas/nanomips: Remove Pool tables from the class
Date: Sun, 30 Oct 2022 23:28:08 +0100
Message-Id: <20221030222841.42377-23-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221030222841.42377-1-philmd@linaro.org>
References: <20221030222841.42377-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Milica Lazarevic <milica.lazarevic@syrmia.com>

Pool tables are no longer declared as static fields of the NMD
class but as global static const variables. Pool struct is defined
outside of the class.

The NMD::Disassemble method is using the MAJOR Pool table variable, so
its implementation is moved to the end of the nanomips.cpp file,
right after the initialization of the MAJOR Pool table.

Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220912122635.74032-9-milica.lazarevic@syrmia.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 disas/nanomips.cpp | 363 ++++++++++++++++++++++-----------------------
 disas/nanomips.h   | 201 ++-----------------------
 2 files changed, 193 insertions(+), 371 deletions(-)

diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
index 5482284206..a73eae5b33 100644
--- a/disas/nanomips.cpp
+++ b/disas/nanomips.cpp
@@ -754,13 +754,6 @@ uint64 NMD::extract_op_code_value(const uint16 * data, int size)
 }
 
 
-int NMD::Disassemble(const uint16 * data, std::string & dis,
-                     TABLE_ENTRY_TYPE & type, Dis_info *info)
-{
-    return Disassemble(data, dis, type, MAJOR, 2, info);
-}
-
-
 /*
  * Recurse through tables until the instruction is found then return
  * the string and size
@@ -16661,7 +16654,7 @@ static std::string YIELD(uint64 instruction, Dis_info *info)
  *
  */
 
-NMD::Pool NMD::P_SYSCALL[2] = {
+static const Pool P_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfffc0000, 0x00080000, &SYSCALL_32_      , 0,
        0x0                 },        /* SYSCALL[32] */
@@ -16671,7 +16664,7 @@ NMD::Pool NMD::P_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P_RI[4] = {
+static const Pool P_RI[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfff80000, 0x00000000, &SIGRIE           , 0,
        0x0                 },        /* SIGRIE */
@@ -16687,7 +16680,7 @@ NMD::Pool NMD::P_RI[4] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU[2] = {
+static const Pool P_ADDIU[2] = {
     { pool                , P_RI                , 4   , 32,
        0xffe00000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.RI */
@@ -16697,7 +16690,7 @@ NMD::Pool NMD::P_ADDIU[2] = {
 };
 
 
-NMD::Pool NMD::P_TRAP[2] = {
+static const Pool P_TRAP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000000, &TEQ              , 0,
        XMMS_               },        /* TEQ */
@@ -16707,7 +16700,7 @@ NMD::Pool NMD::P_TRAP[2] = {
 };
 
 
-NMD::Pool NMD::P_CMOVE[2] = {
+static const Pool P_CMOVE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000210, &MOVZ             , 0,
        0x0                 },        /* MOVZ */
@@ -16717,7 +16710,7 @@ NMD::Pool NMD::P_CMOVE[2] = {
 };
 
 
-NMD::Pool NMD::P_D_MT_VPE[2] = {
+static const Pool P_D_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010ab0, &DMT              , 0,
        MT_                 },        /* DMT */
@@ -16727,7 +16720,7 @@ NMD::Pool NMD::P_D_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_E_MT_VPE[2] = {
+static const Pool P_E_MT_VPE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1f3fff, 0x20010eb0, &EMT              , 0,
        MT_                 },        /* EMT */
@@ -16737,7 +16730,7 @@ NMD::Pool NMD::P_E_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::_P_MT_VPE[2] = {
+static const Pool _P_MT_VPE[2] = {
     { pool                , P_D_MT_VPE          , 2   , 32,
        0xfc003fff, 0x20000ab0, 0                      , 0,
        0x0                 },        /* P.D_MT_VPE */
@@ -16747,7 +16740,7 @@ NMD::Pool NMD::_P_MT_VPE[2] = {
 };
 
 
-NMD::Pool NMD::P_MT_VPE[8] = {
+static const Pool P_MT_VPE[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003bff, 0x200002b0, 0                      , 0,
        0x0                 },        /* P.MT_VPE~*(0) */
@@ -16775,7 +16768,7 @@ NMD::Pool NMD::P_MT_VPE[8] = {
 };
 
 
-NMD::Pool NMD::P_DVP[2] = {
+static const Pool P_DVP[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x20000390, &DVP              , 0,
        0x0                 },        /* DVP */
@@ -16785,7 +16778,7 @@ NMD::Pool NMD::P_DVP[2] = {
 };
 
 
-NMD::Pool NMD::P_SLTU[2] = {
+static const Pool P_SLTU[2] = {
     { pool                , P_DVP               , 2   , 32,
        0xfc00fbff, 0x20000390, 0                      , 0,
        0x0                 },        /* P.DVP */
@@ -16795,7 +16788,7 @@ NMD::Pool NMD::P_SLTU[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A0[128] = {
+static const Pool _POOL32A0[128] = {
     { pool                , P_TRAP              , 2   , 32,
        0xfc0003ff, 0x20000000, 0                      , 0,
        0x0                 },        /* P.TRAP */
@@ -17183,7 +17176,7 @@ NMD::Pool NMD::_POOL32A0[128] = {
 };
 
 
-NMD::Pool NMD::ADDQ__S__PH[2] = {
+static const Pool ADDQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000000d, &ADDQ_PH          , 0,
        DSP_                },        /* ADDQ.PH */
@@ -17193,7 +17186,7 @@ NMD::Pool NMD::ADDQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::MUL__S__PH[2] = {
+static const Pool MUL__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000002d, &MUL_PH           , 0,
        DSP_                },        /* MUL.PH */
@@ -17203,7 +17196,7 @@ NMD::Pool NMD::MUL__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__PH[2] = {
+static const Pool ADDQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000004d, &ADDQH_PH         , 0,
        DSP_                },        /* ADDQH.PH */
@@ -17213,7 +17206,7 @@ NMD::Pool NMD::ADDQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDQH__R__W[2] = {
+static const Pool ADDQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000008d, &ADDQH_W          , 0,
        DSP_                },        /* ADDQH.W */
@@ -17223,7 +17216,7 @@ NMD::Pool NMD::ADDQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__QB[2] = {
+static const Pool ADDU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200000cd, &ADDU_QB          , 0,
        DSP_                },        /* ADDU.QB */
@@ -17233,7 +17226,7 @@ NMD::Pool NMD::ADDU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::ADDU__S__PH[2] = {
+static const Pool ADDU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000010d, &ADDU_PH          , 0,
        DSP_                },        /* ADDU.PH */
@@ -17243,7 +17236,7 @@ NMD::Pool NMD::ADDU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::ADDUH__R__QB[2] = {
+static const Pool ADDUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000014d, &ADDUH_QB         , 0,
        DSP_                },        /* ADDUH.QB */
@@ -17253,7 +17246,7 @@ NMD::Pool NMD::ADDUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__PH[2] = {
+static const Pool SHRAV__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000018d, &SHRAV_PH         , 0,
        DSP_                },        /* SHRAV.PH */
@@ -17263,7 +17256,7 @@ NMD::Pool NMD::SHRAV__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRAV__R__QB[2] = {
+static const Pool SHRAV__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200001cd, &SHRAV_QB         , 0,
        DSP_                },        /* SHRAV.QB */
@@ -17273,7 +17266,7 @@ NMD::Pool NMD::SHRAV__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBQ__S__PH[2] = {
+static const Pool SUBQ__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000020d, &SUBQ_PH          , 0,
        DSP_                },        /* SUBQ.PH */
@@ -17283,7 +17276,7 @@ NMD::Pool NMD::SUBQ__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__PH[2] = {
+static const Pool SUBQH__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000024d, &SUBQH_PH         , 0,
        DSP_                },        /* SUBQH.PH */
@@ -17293,7 +17286,7 @@ NMD::Pool NMD::SUBQH__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBQH__R__W[2] = {
+static const Pool SUBQH__R__W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000028d, &SUBQH_W          , 0,
        DSP_                },        /* SUBQH.W */
@@ -17303,7 +17296,7 @@ NMD::Pool NMD::SUBQH__R__W[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__QB[2] = {
+static const Pool SUBU__S__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200002cd, &SUBU_QB          , 0,
        DSP_                },        /* SUBU.QB */
@@ -17313,7 +17306,7 @@ NMD::Pool NMD::SUBU__S__QB[2] = {
 };
 
 
-NMD::Pool NMD::SUBU__S__PH[2] = {
+static const Pool SUBU__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000030d, &SUBU_PH          , 0,
        DSP_                },        /* SUBU.PH */
@@ -17323,7 +17316,7 @@ NMD::Pool NMD::SUBU__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__PH[2] = {
+static const Pool SHRA__R__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000335, &SHRA_PH          , 0,
        DSP_                },        /* SHRA.PH */
@@ -17333,7 +17326,7 @@ NMD::Pool NMD::SHRA__R__PH[2] = {
 };
 
 
-NMD::Pool NMD::SUBUH__R__QB[2] = {
+static const Pool SUBUH__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000034d, &SUBUH_QB         , 0,
        DSP_                },        /* SUBUH.QB */
@@ -17343,7 +17336,7 @@ NMD::Pool NMD::SUBUH__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::SHLLV__S__PH[2] = {
+static const Pool SHLLV__S__PH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x2000038d, &SHLLV_PH         , 0,
        DSP_                },        /* SHLLV.PH */
@@ -17353,7 +17346,7 @@ NMD::Pool NMD::SHLLV__S__PH[2] = {
 };
 
 
-NMD::Pool NMD::SHLL__S__PH[4] = {
+static const Pool SHLL__S__PH[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000fff, 0x200003b5, &SHLL_PH          , 0,
        DSP_                },        /* SHLL.PH */
@@ -17369,7 +17362,7 @@ NMD::Pool NMD::SHLL__S__PH[4] = {
 };
 
 
-NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
+static const Pool PRECR_SRA__R__PH_W[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x200003cd, &PRECR_SRA_PH_W   , 0,
        DSP_                },        /* PRECR_SRA.PH.W */
@@ -17379,7 +17372,7 @@ NMD::Pool NMD::PRECR_SRA__R__PH_W[2] = {
 };
 
 
-NMD::Pool NMD::_POOL32A5[128] = {
+static const Pool _POOL32A5[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0x20000005, &CMP_EQ_PH        , 0,
        DSP_                },        /* CMP.EQ.PH */
@@ -17767,7 +17760,7 @@ NMD::Pool NMD::_POOL32A5[128] = {
 };
 
 
-NMD::Pool NMD::PP_LSX[16] = {
+static const Pool PP_LSX[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0x20000007, &LBX              , 0,
        0x0                 },        /* LBX */
@@ -17819,7 +17812,7 @@ NMD::Pool NMD::PP_LSX[16] = {
 };
 
 
-NMD::Pool NMD::PP_LSXS[16] = {
+static const Pool PP_LSXS[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0007ff, 0x20000047, 0                      , 0,
        0x0                 },        /* PP.LSXS~*(0) */
@@ -17871,7 +17864,7 @@ NMD::Pool NMD::PP_LSXS[16] = {
 };
 
 
-NMD::Pool NMD::P_LSX[2] = {
+static const Pool P_LSX[2] = {
     { pool                , PP_LSX              , 16  , 32,
        0xfc00007f, 0x20000007, 0                      , 0,
        0x0                 },        /* PP.LSX */
@@ -17881,7 +17874,7 @@ NMD::Pool NMD::P_LSX[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_0[4] = {
+static const Pool POOL32Axf_1_0[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000007f, &MFHI_DSP_        , 0,
        DSP_                },        /* MFHI[DSP] */
@@ -17897,7 +17890,7 @@ NMD::Pool NMD::POOL32Axf_1_0[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_1[4] = {
+static const Pool POOL32Axf_1_1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000027f, &MTHLIP           , 0,
        DSP_                },        /* MTHLIP */
@@ -17913,7 +17906,7 @@ NMD::Pool NMD::POOL32Axf_1_1[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_3[4] = {
+static const Pool POOL32Axf_1_3[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x2000067f, &RDDSP            , 0,
        DSP_                },        /* RDDSP */
@@ -17929,7 +17922,7 @@ NMD::Pool NMD::POOL32Axf_1_3[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_4[2] = {
+static const Pool POOL32Axf_1_4[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x2000087f, &SHLL_QB          , 0,
        DSP_                },        /* SHLL.QB */
@@ -17939,7 +17932,7 @@ NMD::Pool NMD::POOL32Axf_1_4[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
+static const Pool MAQ_S_A__W_PHR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000a7f, &MAQ_S_W_PHR      , 0,
        DSP_                },        /* MAQ_S.W.PHR */
@@ -17949,7 +17942,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHR[2] = {
 };
 
 
-NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
+static const Pool MAQ_S_A__W_PHL[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20001a7f, &MAQ_S_W_PHL      , 0,
        DSP_                },        /* MAQ_S.W.PHL */
@@ -17959,7 +17952,7 @@ NMD::Pool NMD::MAQ_S_A__W_PHL[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_5[2] = {
+static const Pool POOL32Axf_1_5[2] = {
     { pool                , MAQ_S_A__W_PHR      , 2   , 32,
        0xfc001fff, 0x20000a7f, 0                      , 0,
        0x0                 },        /* MAQ_S[A].W.PHR */
@@ -17969,7 +17962,7 @@ NMD::Pool NMD::POOL32Axf_1_5[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1_7[4] = {
+static const Pool POOL32Axf_1_7[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x20000e7f, &EXTR_W           , 0,
        DSP_                },        /* EXTR.W */
@@ -17985,7 +17978,7 @@ NMD::Pool NMD::POOL32Axf_1_7[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_1[8] = {
+static const Pool POOL32Axf_1[8] = {
     { pool                , POOL32Axf_1_0       , 4   , 32,
        0xfc000fff, 0x2000007f, 0                      , 0,
        0x0                 },        /* POOL32Axf_1_0 */
@@ -18013,7 +18006,7 @@ NMD::Pool NMD::POOL32Axf_1[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
+static const Pool POOL32Axf_2_DSP__0_7[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200000bf, &DPA_W_PH         , 0,
        DSP_                },        /* DPA.W.PH */
@@ -18041,7 +18034,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__0_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
+static const Pool POOL32Axf_2_DSP__8_15[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200010bf, &DPAX_W_PH        , 0,
        DSP_                },        /* DPAX.W.PH */
@@ -18069,7 +18062,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__8_15[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
+static const Pool POOL32Axf_2_DSP__16_23[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200020bf, &DPAU_H_QBL       , 0,
        DSP_                },        /* DPAU.H.QBL */
@@ -18097,7 +18090,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__16_23[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
+static const Pool POOL32Axf_2_DSP__24_31[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc003fff, 0x200030bf, &DPAU_H_QBR       , 0,
        DSP_                },        /* DPAU.H.QBR */
@@ -18125,7 +18118,7 @@ NMD::Pool NMD::POOL32Axf_2_DSP__24_31[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_2[4] = {
+static const Pool POOL32Axf_2[4] = {
     { pool                , POOL32Axf_2_DSP__0_7, 8   , 32,
        0xfc0031ff, 0x200000bf, 0                      , 0,
        0x0                 },        /* POOL32Axf_2(DSP)_0_7 */
@@ -18141,7 +18134,7 @@ NMD::Pool NMD::POOL32Axf_2[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_4[128] = {
+static const Pool POOL32Axf_4[128] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000013f, &ABSQ_S_QB        , 0,
        DSP_                },        /* ABSQ_S.QB */
@@ -18529,7 +18522,7 @@ NMD::Pool NMD::POOL32Axf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group0[32] = {
+static const Pool POOL32Axf_5_group0[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00ffff, 0x2000017f, &TLBGP            , 0,
        CP0_ | VZ_ | TLB_   },        /* TLBGP */
@@ -18629,7 +18622,7 @@ NMD::Pool NMD::POOL32Axf_5_group0[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group1[32] = {
+static const Pool POOL32Axf_5_group1[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000417f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group1~*(0) */
@@ -18729,7 +18722,7 @@ NMD::Pool NMD::POOL32Axf_5_group1[32] = {
 };
 
 
-NMD::Pool NMD::ERETx[2] = {
+static const Pool ERETx[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc01ffff, 0x2000f37f, &ERET             , 0,
        0x0                 },        /* ERET */
@@ -18739,7 +18732,7 @@ NMD::Pool NMD::ERETx[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5_group3[32] = {
+static const Pool POOL32Axf_5_group3[32] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0x2000c17f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group3~*(0) */
@@ -18839,7 +18832,7 @@ NMD::Pool NMD::POOL32Axf_5_group3[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_5[4] = {
+static const Pool POOL32Axf_5[4] = {
     { pool                , POOL32Axf_5_group0  , 32  , 32,
        0xfc00c1ff, 0x2000017f, 0                      , 0,
        0x0                 },        /* POOL32Axf_5_group0 */
@@ -18855,7 +18848,7 @@ NMD::Pool NMD::POOL32Axf_5[4] = {
 };
 
 
-NMD::Pool NMD::SHRA__R__QB[2] = {
+static const Pool SHRA__R__QB[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc001fff, 0x200001ff, &SHRA_QB          , 0,
        DSP_                },        /* SHRA.QB */
@@ -18865,7 +18858,7 @@ NMD::Pool NMD::SHRA__R__QB[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf_7[8] = {
+static const Pool POOL32Axf_7[8] = {
     { pool                , SHRA__R__QB         , 2   , 32,
        0xfc000fff, 0x200001ff, 0                      , 0,
        0x0                 },        /* SHRA[_R].QB */
@@ -18893,7 +18886,7 @@ NMD::Pool NMD::POOL32Axf_7[8] = {
 };
 
 
-NMD::Pool NMD::POOL32Axf[8] = {
+static const Pool POOL32Axf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0x2000003f, 0                      , 0,
        0x0                 },        /* POOL32Axf~*(0) */
@@ -18921,7 +18914,7 @@ NMD::Pool NMD::POOL32Axf[8] = {
 };
 
 
-NMD::Pool NMD::_POOL32A7[8] = {
+static const Pool _POOL32A7[8] = {
     { pool                , P_LSX               , 2   , 32,
        0xfc00003f, 0x20000007, 0                      , 0,
        0x0                 },        /* P.LSX */
@@ -18949,7 +18942,7 @@ NMD::Pool NMD::_POOL32A7[8] = {
 };
 
 
-NMD::Pool NMD::P32A[8] = {
+static const Pool P32A[8] = {
     { pool                , _POOL32A0           , 128 , 32,
        0xfc000007, 0x20000000, 0                      , 0,
        0x0                 },        /* _POOL32A0 */
@@ -18977,7 +18970,7 @@ NMD::Pool NMD::P32A[8] = {
 };
 
 
-NMD::Pool NMD::P_GP_D[2] = {
+static const Pool P_GP_D[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000007, 0x40000001, &LD_GP_           , 0,
        MIPS64_             },        /* LD[GP] */
@@ -18987,7 +18980,7 @@ NMD::Pool NMD::P_GP_D[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_W[4] = {
+static const Pool P_GP_W[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000003, 0x40000000, &ADDIU_GP_W_      , 0,
        0x0                 },        /* ADDIU[GP.W] */
@@ -19003,7 +18996,7 @@ NMD::Pool NMD::P_GP_W[4] = {
 };
 
 
-NMD::Pool NMD::POOL48I[32] = {
+static const Pool POOL48I[32] = {
     { instruction         , 0                   , 0   , 48,
        0xfc1f00000000ull, 0x600000000000ull, &LI_48_           , 0,
        XMMS_               },        /* LI[48] */
@@ -19103,7 +19096,7 @@ NMD::Pool NMD::POOL48I[32] = {
 };
 
 
-NMD::Pool NMD::PP_SR[4] = {
+static const Pool PP_SR[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f003, 0x80003000, &SAVE_32_         , 0,
        0x0                 },        /* SAVE[32] */
@@ -19119,7 +19112,7 @@ NMD::Pool NMD::PP_SR[4] = {
 };
 
 
-NMD::Pool NMD::P_SR_F[8] = {
+static const Pool P_SR_F[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc10f007, 0x80103000, &SAVEF            , 0,
        CP1_                },        /* SAVEF */
@@ -19147,7 +19140,7 @@ NMD::Pool NMD::P_SR_F[8] = {
 };
 
 
-NMD::Pool NMD::P_SR[2] = {
+static const Pool P_SR[2] = {
     { pool                , PP_SR               , 4   , 32,
        0xfc10f000, 0x80003000, 0                      , 0,
        0x0                 },        /* PP.SR */
@@ -19157,7 +19150,7 @@ NMD::Pool NMD::P_SR[2] = {
 };
 
 
-NMD::Pool NMD::P_SLL[5] = {
+static const Pool P_SLL[5] = {
     { instruction         , 0                   , 0   , 32,
        0xffe0f1ff, 0x8000c000, &NOP_32_          , 0,
        0x0                 },        /* NOP[32] */
@@ -19176,7 +19169,7 @@ NMD::Pool NMD::P_SLL[5] = {
 };
 
 
-NMD::Pool NMD::P_SHIFT[16] = {
+static const Pool P_SHIFT[16] = {
     { pool                , P_SLL               , 5   , 32,
        0xfc00f1e0, 0x8000c000, 0                      , 0,
        0x0                 },        /* P.SLL */
@@ -19228,7 +19221,7 @@ NMD::Pool NMD::P_SHIFT[16] = {
 };
 
 
-NMD::Pool NMD::P_ROTX[4] = {
+static const Pool P_ROTX[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000d000, &ROTX             , 0,
        XMMS_               },        /* ROTX */
@@ -19244,7 +19237,7 @@ NMD::Pool NMD::P_ROTX[4] = {
 };
 
 
-NMD::Pool NMD::P_INS[4] = {
+static const Pool P_INS[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000e000, &INS              , 0,
        XMMS_               },        /* INS */
@@ -19260,7 +19253,7 @@ NMD::Pool NMD::P_INS[4] = {
 };
 
 
-NMD::Pool NMD::P_EXT[4] = {
+static const Pool P_EXT[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f820, 0x8000f000, &EXT              , 0,
        XMMS_               },        /* EXT */
@@ -19276,7 +19269,7 @@ NMD::Pool NMD::P_EXT[4] = {
 };
 
 
-NMD::Pool NMD::P_U12[16] = {
+static const Pool P_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x80000000, &ORI              , 0,
        0x0                 },        /* ORI */
@@ -19328,7 +19321,7 @@ NMD::Pool NMD::P_U12[16] = {
 };
 
 
-NMD::Pool NMD::RINT_fmt[2] = {
+static const Pool RINT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000020, &RINT_S           , 0,
        CP1_                },        /* RINT.S */
@@ -19338,7 +19331,7 @@ NMD::Pool NMD::RINT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt0[2] = {
+static const Pool ADD_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000030, &ADD_S            , 0,
        CP1_                },        /* ADD.S */
@@ -19348,7 +19341,7 @@ NMD::Pool NMD::ADD_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELEQZ_fmt[2] = {
+static const Pool SELEQZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000038, &SELEQZ_S         , 0,
        CP1_                },        /* SELEQZ.S */
@@ -19358,7 +19351,7 @@ NMD::Pool NMD::SELEQZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CLASS_fmt[2] = {
+static const Pool CLASS_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000060, &CLASS_S          , 0,
        CP1_                },        /* CLASS.S */
@@ -19368,7 +19361,7 @@ NMD::Pool NMD::CLASS_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt0[2] = {
+static const Pool SUB_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000070, &SUB_S            , 0,
        CP1_                },        /* SUB.S */
@@ -19378,7 +19371,7 @@ NMD::Pool NMD::SUB_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SELNEZ_fmt[2] = {
+static const Pool SELNEZ_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000078, &SELNEZ_S         , 0,
        CP1_                },        /* SELNEZ.S */
@@ -19388,7 +19381,7 @@ NMD::Pool NMD::SELNEZ_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt0[2] = {
+static const Pool MUL_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b0, &MUL_S            , 0,
        CP1_                },        /* MUL.S */
@@ -19398,7 +19391,7 @@ NMD::Pool NMD::MUL_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::SEL_fmt[2] = {
+static const Pool SEL_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000b8, &SEL_S            , 0,
        CP1_                },        /* SEL.S */
@@ -19408,7 +19401,7 @@ NMD::Pool NMD::SEL_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt0[2] = {
+static const Pool DIV_fmt0[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00000f0, &DIV_S            , 0,
        CP1_                },        /* DIV.S */
@@ -19418,7 +19411,7 @@ NMD::Pool NMD::DIV_fmt0[2] = {
 };
 
 
-NMD::Pool NMD::ADD_fmt1[2] = {
+static const Pool ADD_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000130, &ADD_D            , 0,
        CP1_                },        /* ADD.D */
@@ -19428,7 +19421,7 @@ NMD::Pool NMD::ADD_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::SUB_fmt1[2] = {
+static const Pool SUB_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa0000170, &SUB_D            , 0,
        CP1_                },        /* SUB.D */
@@ -19438,7 +19431,7 @@ NMD::Pool NMD::SUB_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MUL_fmt1[2] = {
+static const Pool MUL_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b0, &MUL_D            , 0,
        CP1_                },        /* MUL.D */
@@ -19448,7 +19441,7 @@ NMD::Pool NMD::MUL_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MADDF_fmt[2] = {
+static const Pool MADDF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001b8, &MADDF_S          , 0,
        CP1_                },        /* MADDF.S */
@@ -19458,7 +19451,7 @@ NMD::Pool NMD::MADDF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::DIV_fmt1[2] = {
+static const Pool DIV_fmt1[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f0, &DIV_D            , 0,
        CP1_                },        /* DIV.D */
@@ -19468,7 +19461,7 @@ NMD::Pool NMD::DIV_fmt1[2] = {
 };
 
 
-NMD::Pool NMD::MSUBF_fmt[2] = {
+static const Pool MSUBF_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0003ff, 0xa00001f8, &MSUBF_S          , 0,
        CP1_                },        /* MSUBF.S */
@@ -19478,7 +19471,7 @@ NMD::Pool NMD::MSUBF_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32F_0[64] = {
+static const Pool POOL32F_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0~*(0) */
@@ -19674,7 +19667,7 @@ NMD::Pool NMD::POOL32F_0[64] = {
 };
 
 
-NMD::Pool NMD::MIN_fmt[2] = {
+static const Pool MIN_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000003, &MIN_S            , 0,
        CP1_                },        /* MIN.S */
@@ -19684,7 +19677,7 @@ NMD::Pool NMD::MIN_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAX_fmt[2] = {
+static const Pool MAX_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000000b, &MAX_S            , 0,
        CP1_                },        /* MAX.S */
@@ -19694,7 +19687,7 @@ NMD::Pool NMD::MAX_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MINA_fmt[2] = {
+static const Pool MINA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa0000023, &MINA_S           , 0,
        CP1_                },        /* MINA.S */
@@ -19704,7 +19697,7 @@ NMD::Pool NMD::MINA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::MAXA_fmt[2] = {
+static const Pool MAXA_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00023f, 0xa000002b, &MAXA_S           , 0,
        CP1_                },        /* MAXA.S */
@@ -19714,7 +19707,7 @@ NMD::Pool NMD::MAXA_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_L_fmt[2] = {
+static const Pool CVT_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000013b, &CVT_L_S          , 0,
        CP1_                },        /* CVT.L.S */
@@ -19724,7 +19717,7 @@ NMD::Pool NMD::CVT_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RSQRT_fmt[2] = {
+static const Pool RSQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000023b, &RSQRT_S          , 0,
        CP1_                },        /* RSQRT.S */
@@ -19734,7 +19727,7 @@ NMD::Pool NMD::RSQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_L_fmt[2] = {
+static const Pool FLOOR_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000033b, &FLOOR_L_S        , 0,
        CP1_                },        /* FLOOR.L.S */
@@ -19744,7 +19737,7 @@ NMD::Pool NMD::FLOOR_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CVT_W_fmt[2] = {
+static const Pool CVT_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000093b, &CVT_W_S          , 0,
        CP1_                },        /* CVT.W.S */
@@ -19754,7 +19747,7 @@ NMD::Pool NMD::CVT_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::SQRT_fmt[2] = {
+static const Pool SQRT_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000a3b, &SQRT_S           , 0,
        CP1_                },        /* SQRT.S */
@@ -19764,7 +19757,7 @@ NMD::Pool NMD::SQRT_fmt[2] = {
 };
 
 
-NMD::Pool NMD::FLOOR_W_fmt[2] = {
+static const Pool FLOOR_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b3b, &FLOOR_W_S        , 0,
        CP1_                },        /* FLOOR.W.S */
@@ -19774,7 +19767,7 @@ NMD::Pool NMD::FLOOR_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::RECIP_fmt[2] = {
+static const Pool RECIP_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000123b, &RECIP_S          , 0,
        CP1_                },        /* RECIP.S */
@@ -19784,7 +19777,7 @@ NMD::Pool NMD::RECIP_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_L_fmt[2] = {
+static const Pool CEIL_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000133b, &CEIL_L_S         , 0,
        CP1_                },        /* CEIL.L.S */
@@ -19794,7 +19787,7 @@ NMD::Pool NMD::CEIL_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::CEIL_W_fmt[2] = {
+static const Pool CEIL_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b3b, &CEIL_W_S         , 0,
        CP1_                },        /* CEIL.W.S */
@@ -19804,7 +19797,7 @@ NMD::Pool NMD::CEIL_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_L_fmt[2] = {
+static const Pool TRUNC_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000233b, &TRUNC_L_S        , 0,
        CP1_                },        /* TRUNC.L.S */
@@ -19814,7 +19807,7 @@ NMD::Pool NMD::TRUNC_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::TRUNC_W_fmt[2] = {
+static const Pool TRUNC_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0002b3b, &TRUNC_W_S        , 0,
        CP1_                },        /* TRUNC.W.S */
@@ -19824,7 +19817,7 @@ NMD::Pool NMD::TRUNC_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_L_fmt[2] = {
+static const Pool ROUND_L_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000333b, &ROUND_L_S        , 0,
        CP1_                },        /* ROUND.L.S */
@@ -19834,7 +19827,7 @@ NMD::Pool NMD::ROUND_L_fmt[2] = {
 };
 
 
-NMD::Pool NMD::ROUND_W_fmt[2] = {
+static const Pool ROUND_W_fmt[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0003b3b, &ROUND_W_S        , 0,
        CP1_                },        /* ROUND.W.S */
@@ -19844,7 +19837,7 @@ NMD::Pool NMD::ROUND_W_fmt[2] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_0[64] = {
+static const Pool POOL32Fxf_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc003fff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0~*(0) */
@@ -20040,7 +20033,7 @@ NMD::Pool NMD::POOL32Fxf_0[64] = {
 };
 
 
-NMD::Pool NMD::MOV_fmt[4] = {
+static const Pool MOV_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000007b, &MOV_S            , 0,
        CP1_                },        /* MOV.S */
@@ -20056,7 +20049,7 @@ NMD::Pool NMD::MOV_fmt[4] = {
 };
 
 
-NMD::Pool NMD::ABS_fmt[4] = {
+static const Pool ABS_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000037b, &ABS_S            , 0,
        CP1_                },        /* ABS.S */
@@ -20072,7 +20065,7 @@ NMD::Pool NMD::ABS_fmt[4] = {
 };
 
 
-NMD::Pool NMD::NEG_fmt[4] = {
+static const Pool NEG_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0000b7b, &NEG_S            , 0,
        CP1_                },        /* NEG.S */
@@ -20088,7 +20081,7 @@ NMD::Pool NMD::NEG_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_D_fmt[4] = {
+static const Pool CVT_D_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa000137b, &CVT_D_S          , 0,
        CP1_                },        /* CVT.D.S */
@@ -20104,7 +20097,7 @@ NMD::Pool NMD::CVT_D_fmt[4] = {
 };
 
 
-NMD::Pool NMD::CVT_S_fmt[4] = {
+static const Pool CVT_S_fmt[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007fff, 0xa0001b7b, &CVT_S_D          , 0,
        CP1_                },        /* CVT.S.D */
@@ -20120,7 +20113,7 @@ NMD::Pool NMD::CVT_S_fmt[4] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf_1[32] = {
+static const Pool POOL32Fxf_1[32] = {
     { pool                , MOV_fmt             , 4   , 32,
        0xfc001fff, 0xa000007b, 0                      , 0,
        CP1_                },        /* MOV.fmt */
@@ -20220,7 +20213,7 @@ NMD::Pool NMD::POOL32Fxf_1[32] = {
 };
 
 
-NMD::Pool NMD::POOL32Fxf[4] = {
+static const Pool POOL32Fxf[4] = {
     { pool                , POOL32Fxf_0         , 64  , 32,
        0xfc0000ff, 0xa000003b, 0                      , 0,
        CP1_                },        /* POOL32Fxf_0 */
@@ -20236,7 +20229,7 @@ NMD::Pool NMD::POOL32Fxf[4] = {
 };
 
 
-NMD::Pool NMD::POOL32F_3[8] = {
+static const Pool POOL32F_3[8] = {
     { pool                , MIN_fmt             , 2   , 32,
        0xfc00003f, 0xa0000003, 0                      , 0,
        CP1_                },        /* MIN.fmt */
@@ -20264,7 +20257,7 @@ NMD::Pool NMD::POOL32F_3[8] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_S[32] = {
+static const Pool CMP_condn_S[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000005, &CMP_AF_S         , 0,
        CP1_                },        /* CMP.AF.S */
@@ -20364,7 +20357,7 @@ NMD::Pool NMD::CMP_condn_S[32] = {
 };
 
 
-NMD::Pool NMD::CMP_condn_D[32] = {
+static const Pool CMP_condn_D[32] = {
     { instruction         , 0                   , 0   , 32,
        0xfc0007ff, 0xa0000015, &CMP_AF_D         , 0,
        CP1_                },        /* CMP.AF.D */
@@ -20464,7 +20457,7 @@ NMD::Pool NMD::CMP_condn_D[32] = {
 };
 
 
-NMD::Pool NMD::POOL32F_5[8] = {
+static const Pool POOL32F_5[8] = {
     { pool                , CMP_condn_S         , 32  , 32,
        0xfc00003f, 0xa0000005, 0                      , 0,
        CP1_                },        /* CMP.condn.S */
@@ -20492,7 +20485,7 @@ NMD::Pool NMD::POOL32F_5[8] = {
 };
 
 
-NMD::Pool NMD::POOL32F[8] = {
+static const Pool POOL32F[8] = {
     { pool                , POOL32F_0           , 64  , 32,
        0xfc000007, 0xa0000000, 0                      , 0,
        CP1_                },        /* POOL32F_0 */
@@ -20520,7 +20513,7 @@ NMD::Pool NMD::POOL32F[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_0[64] = {
+static const Pool POOL32S_0[64] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0~*(0) */
@@ -20716,7 +20709,7 @@ NMD::Pool NMD::POOL32S_0[64] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf_4[128] = {
+static const Pool POOL32Sxf_4[128] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc00ffff, 0xc000013c, 0                      , 0,
        0x0                 },        /* POOL32Sxf_4~*(0) */
@@ -21104,7 +21097,7 @@ NMD::Pool NMD::POOL32Sxf_4[128] = {
 };
 
 
-NMD::Pool NMD::POOL32Sxf[8] = {
+static const Pool POOL32Sxf[8] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc0001ff, 0xc000003c, 0                      , 0,
        0x0                 },        /* POOL32Sxf~*(0) */
@@ -21132,7 +21125,7 @@ NMD::Pool NMD::POOL32Sxf[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S_4[8] = {
+static const Pool POOL32S_4[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00003f, 0xc0000004, &EXTD             , 0,
        MIPS64_             },        /* EXTD */
@@ -21160,7 +21153,7 @@ NMD::Pool NMD::POOL32S_4[8] = {
 };
 
 
-NMD::Pool NMD::POOL32S[8] = {
+static const Pool POOL32S[8] = {
     { pool                , POOL32S_0           , 64  , 32,
        0xfc000007, 0xc0000000, 0                      , 0,
        0x0                 },        /* POOL32S_0 */
@@ -21188,7 +21181,7 @@ NMD::Pool NMD::POOL32S[8] = {
 };
 
 
-NMD::Pool NMD::P_LUI[2] = {
+static const Pool P_LUI[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000002, 0xe0000000, &LUI              , 0,
        0x0                 },        /* LUI */
@@ -21198,7 +21191,7 @@ NMD::Pool NMD::P_LUI[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_LH[2] = {
+static const Pool P_GP_LH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44100000, &LH_GP_           , 0,
        0x0                 },        /* LH[GP] */
@@ -21208,7 +21201,7 @@ NMD::Pool NMD::P_GP_LH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_SH[2] = {
+static const Pool P_GP_SH[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0001, 0x44140000, &SH_GP_           , 0,
        0x0                 },        /* SH[GP] */
@@ -21218,7 +21211,7 @@ NMD::Pool NMD::P_GP_SH[2] = {
 };
 
 
-NMD::Pool NMD::P_GP_CP1[4] = {
+static const Pool P_GP_CP1[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x44180000, &LWC1_GP_         , 0,
        CP1_                },        /* LWC1[GP] */
@@ -21234,7 +21227,7 @@ NMD::Pool NMD::P_GP_CP1[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_M64[4] = {
+static const Pool P_GP_M64[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0003, 0x441c0000, &LWU_GP_          , 0,
        MIPS64_             },        /* LWU[GP] */
@@ -21250,7 +21243,7 @@ NMD::Pool NMD::P_GP_M64[4] = {
 };
 
 
-NMD::Pool NMD::P_GP_BH[8] = {
+static const Pool P_GP_BH[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc1c0000, 0x44000000, &LB_GP_           , 0,
        0x0                 },        /* LB[GP] */
@@ -21278,7 +21271,7 @@ NMD::Pool NMD::P_GP_BH[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_U12[16] = {
+static const Pool P_LS_U12[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc00f000, 0x84000000, &LB_U12_          , 0,
        0x0                 },        /* LB[U12] */
@@ -21330,7 +21323,7 @@ NMD::Pool NMD::P_LS_U12[16] = {
 };
 
 
-NMD::Pool NMD::P_PREF_S9_[2] = {
+static const Pool P_PREF_S9_[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01800, &SYNCI            , 0,
        0x0                 },        /* SYNCI */
@@ -21340,7 +21333,7 @@ NMD::Pool NMD::P_PREF_S9_[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S0[16] = {
+static const Pool P_LS_S0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000000, &LB_S9_           , 0,
        0x0                 },        /* LB[S9] */
@@ -21392,7 +21385,7 @@ NMD::Pool NMD::P_LS_S0[16] = {
 };
 
 
-NMD::Pool NMD::ASET_ACLR[2] = {
+static const Pool ASET_ACLR[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfe007f00, 0xa4001100, &ASET             , 0,
        MCU_                },        /* ASET */
@@ -21402,7 +21395,7 @@ NMD::Pool NMD::ASET_ACLR[2] = {
 };
 
 
-NMD::Pool NMD::P_LL[4] = {
+static const Pool P_LL[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005100, &LL               , 0,
        0x0                 },        /* LL */
@@ -21418,7 +21411,7 @@ NMD::Pool NMD::P_LL[4] = {
 };
 
 
-NMD::Pool NMD::P_SC[4] = {
+static const Pool P_SC[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005900, &SC               , 0,
        0x0                 },        /* SC */
@@ -21434,7 +21427,7 @@ NMD::Pool NMD::P_SC[4] = {
 };
 
 
-NMD::Pool NMD::P_LLD[8] = {
+static const Pool P_LLD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007100, &LLD              , 0,
        MIPS64_             },        /* LLD */
@@ -21462,7 +21455,7 @@ NMD::Pool NMD::P_LLD[8] = {
 };
 
 
-NMD::Pool NMD::P_SCD[8] = {
+static const Pool P_SCD[8] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f07, 0xa4007900, &SCD              , 0,
        MIPS64_             },        /* SCD */
@@ -21490,7 +21483,7 @@ NMD::Pool NMD::P_SCD[8] = {
 };
 
 
-NMD::Pool NMD::P_LS_S1[16] = {
+static const Pool P_LS_S1[16] = {
     { reserved_block      , 0                   , 0   , 32,
        0xfc007f00, 0xa4000100, 0                      , 0,
        0x0                 },        /* P.LS.S1~*(0) */
@@ -21542,7 +21535,7 @@ NMD::Pool NMD::P_LS_S1[16] = {
 };
 
 
-NMD::Pool NMD::P_PREFE[2] = {
+static const Pool P_PREFE[2] = {
     { instruction         , 0                   , 0   , 32,
        0xffe07f00, 0xa7e01a00, &SYNCIE           , 0,
        CP0_ | EVA_         },        /* SYNCIE */
@@ -21552,7 +21545,7 @@ NMD::Pool NMD::P_PREFE[2] = {
 };
 
 
-NMD::Pool NMD::P_LLE[4] = {
+static const Pool P_LLE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005200, &LLE              , 0,
        CP0_ | EVA_         },        /* LLE */
@@ -21568,7 +21561,7 @@ NMD::Pool NMD::P_LLE[4] = {
 };
 
 
-NMD::Pool NMD::P_SCE[4] = {
+static const Pool P_SCE[4] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f03, 0xa4005a00, &SCE              , 0,
        CP0_ | EVA_         },        /* SCE */
@@ -21584,7 +21577,7 @@ NMD::Pool NMD::P_SCE[4] = {
 };
 
 
-NMD::Pool NMD::P_LS_E0[16] = {
+static const Pool P_LS_E0[16] = {
     { instruction         , 0                   , 0   , 32,
        0xfc007f00, 0xa4000200, &LBE              , 0,
        CP0_ | EVA_         },        /* LBE */
@@ -21636,7 +21629,7 @@ NMD::Pool NMD::P_LS_E0[16] = {
 };
 
 
-NMD::Pool NMD::P_LS_WM[2] = {
+static const Pool P_LS_WM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000400, &LWM              , 0,
        XMMS_               },        /* LWM */
@@ -21646,7 +21639,7 @@ NMD::Pool NMD::P_LS_WM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UAWM[2] = {
+static const Pool P_LS_UAWM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000500, &UALWM            , 0,
        XMMS_               },        /* UALWM */
@@ -21656,7 +21649,7 @@ NMD::Pool NMD::P_LS_UAWM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_DM[2] = {
+static const Pool P_LS_DM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000600, &LDM              , 0,
        MIPS64_             },        /* LDM */
@@ -21666,7 +21659,7 @@ NMD::Pool NMD::P_LS_DM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_UADM[2] = {
+static const Pool P_LS_UADM[2] = {
     { instruction         , 0                   , 0   , 32,
        0xfc000f00, 0xa4000700, &UALDM            , 0,
        MIPS64_             },        /* UALDM */
@@ -21676,7 +21669,7 @@ NMD::Pool NMD::P_LS_UADM[2] = {
 };
 
 
-NMD::Pool NMD::P_LS_S9[8] = {
+static const Pool P_LS_S9[8] = {
     { pool                , P_LS_S0             , 16  , 32,
        0xfc000700, 0xa4000000, 0                      , 0,
        0x0                 },        /* P.LS.S0 */
@@ -21704,7 +21697,7 @@ NMD::Pool NMD::P_LS_S9[8] = {
 };
 
 
-NMD::Pool NMD::P_BAL[2] = {
+static const Pool P_BAL[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfe000000, 0x28000000, &BC_32_           , 0,
        0x0                 },        /* BC[32] */
@@ -21714,7 +21707,7 @@ NMD::Pool NMD::P_BAL[2] = {
 };
 
 
-NMD::Pool NMD::P_BALRSC[2] = {
+static const Pool P_BALRSC[2] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xffe0f000, 0x48008000, &BRSC             , 0,
        0x0                 },        /* BRSC */
@@ -21724,7 +21717,7 @@ NMD::Pool NMD::P_BALRSC[2] = {
 };
 
 
-NMD::Pool NMD::P_J[16] = {
+static const Pool P_J[16] = {
     { call_instruction    , 0                   , 0   , 32,
        0xfc00f000, 0x48000000, &JALRC_32_        , 0,
        0x0                 },        /* JALRC[32] */
@@ -21776,7 +21769,7 @@ NMD::Pool NMD::P_J[16] = {
 };
 
 
-NMD::Pool NMD::P_BR3A[32] = {
+static const Pool P_BR3A[32] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1fc000, 0x88004000, &BC1EQZC          , 0,
        CP1_                },        /* BC1EQZC */
@@ -21876,7 +21869,7 @@ NMD::Pool NMD::P_BR3A[32] = {
 };
 
 
-NMD::Pool NMD::P_BR1[4] = {
+static const Pool P_BR1[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0x88000000, &BEQC_32_         , 0,
        0x0                 },        /* BEQC[32] */
@@ -21892,7 +21885,7 @@ NMD::Pool NMD::P_BR1[4] = {
 };
 
 
-NMD::Pool NMD::P_BR2[4] = {
+static const Pool P_BR2[4] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc00c000, 0xa8000000, &BNEC_32_         , 0,
        0x0                 },        /* BNEC[32] */
@@ -21908,7 +21901,7 @@ NMD::Pool NMD::P_BR2[4] = {
 };
 
 
-NMD::Pool NMD::P_BRI[8] = {
+static const Pool P_BRI[8] = {
     { branch_instruction  , 0                   , 0   , 32,
        0xfc1c0000, 0xc8000000, &BEQIC            , 0,
        0x0                 },        /* BEQIC */
@@ -21936,7 +21929,7 @@ NMD::Pool NMD::P_BRI[8] = {
 };
 
 
-NMD::Pool NMD::P32[32] = {
+static const Pool P32[32] = {
     { pool                , P_ADDIU             , 2   , 32,
        0xfc000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P.ADDIU */
@@ -22036,7 +22029,7 @@ NMD::Pool NMD::P32[32] = {
 };
 
 
-NMD::Pool NMD::P16_SYSCALL[2] = {
+static const Pool P16_SYSCALL[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfffc    , 0x1008    , &SYSCALL_16_      , 0,
        0x0                 },        /* SYSCALL[16] */
@@ -22046,7 +22039,7 @@ NMD::Pool NMD::P16_SYSCALL[2] = {
 };
 
 
-NMD::Pool NMD::P16_RI[4] = {
+static const Pool P16_RI[4] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfff8    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI~*(0) */
@@ -22062,7 +22055,7 @@ NMD::Pool NMD::P16_RI[4] = {
 };
 
 
-NMD::Pool NMD::P16_MV[2] = {
+static const Pool P16_MV[2] = {
     { pool                , P16_RI              , 4   , 16,
        0xffe0    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.RI */
@@ -22072,7 +22065,7 @@ NMD::Pool NMD::P16_MV[2] = {
 };
 
 
-NMD::Pool NMD::P16_SHIFT[2] = {
+static const Pool P16_SHIFT[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x3000    , &SLL_16_          , 0,
        0x0                 },        /* SLL[16] */
@@ -22082,7 +22075,7 @@ NMD::Pool NMD::P16_SHIFT[2] = {
 };
 
 
-NMD::Pool NMD::POOL16C_00[4] = {
+static const Pool POOL16C_00[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0f    , 0x5000    , &NOT_16_          , 0,
        0x0                 },        /* NOT[16] */
@@ -22098,7 +22091,7 @@ NMD::Pool NMD::POOL16C_00[4] = {
 };
 
 
-NMD::Pool NMD::POOL16C_0[2] = {
+static const Pool POOL16C_0[2] = {
     { pool                , POOL16C_00          , 4   , 16,
        0xfc03    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_00 */
@@ -22108,7 +22101,7 @@ NMD::Pool NMD::POOL16C_0[2] = {
 };
 
 
-NMD::Pool NMD::P16C[2] = {
+static const Pool P16C[2] = {
     { pool                , POOL16C_0           , 2   , 16,
        0xfc01    , 0x5000    , 0                      , 0,
        0x0                 },        /* POOL16C_0 */
@@ -22118,7 +22111,7 @@ NMD::Pool NMD::P16C[2] = {
 };
 
 
-NMD::Pool NMD::P16_A1[2] = {
+static const Pool P16_A1[2] = {
     { reserved_block      , 0                   , 0   , 16,
        0xfc40    , 0x7000    , 0                      , 0,
        0x0                 },        /* P16.A1~*(0) */
@@ -22128,7 +22121,7 @@ NMD::Pool NMD::P16_A1[2] = {
 };
 
 
-NMD::Pool NMD::P_ADDIU_RS5_[2] = {
+static const Pool P_ADDIU_RS5_[2] = {
     { instruction         , 0                   , 0   , 16,
        0xffe8    , 0x9008    , &NOP_16_          , 0,
        0x0                 },        /* NOP[16] */
@@ -22138,7 +22131,7 @@ NMD::Pool NMD::P_ADDIU_RS5_[2] = {
 };
 
 
-NMD::Pool NMD::P16_A2[2] = {
+static const Pool P16_A2[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc08    , 0x9000    , &ADDIU_R2_        , 0,
        0x0                 },        /* ADDIU[R2] */
@@ -22148,7 +22141,7 @@ NMD::Pool NMD::P16_A2[2] = {
 };
 
 
-NMD::Pool NMD::P16_ADDU[2] = {
+static const Pool P16_ADDU[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfc01    , 0xb000    , &ADDU_16_         , 0,
        0x0                 },        /* ADDU[16] */
@@ -22158,7 +22151,7 @@ NMD::Pool NMD::P16_ADDU[2] = {
 };
 
 
-NMD::Pool NMD::P16_JRC[2] = {
+static const Pool P16_JRC[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc1f    , 0xd800    , &JRC              , 0,
        0x0                 },        /* JRC */
@@ -22168,7 +22161,7 @@ NMD::Pool NMD::P16_JRC[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR1[2] = {
+static const Pool P16_BR1[2] = {
     { branch_instruction  , 0                   , 0   , 16,
        0xfc00    , 0xd800    , &BEQC_16_         , &BEQC_16__cond    ,
        XMMS_               },        /* BEQC[16] */
@@ -22178,7 +22171,7 @@ NMD::Pool NMD::P16_BR1[2] = {
 };
 
 
-NMD::Pool NMD::P16_BR[2] = {
+static const Pool P16_BR[2] = {
     { pool                , P16_JRC             , 2   , 16,
        0xfc0f    , 0xd800    , 0                      , 0,
        0x0                 },        /* P16.JRC */
@@ -22188,7 +22181,7 @@ NMD::Pool NMD::P16_BR[2] = {
 };
 
 
-NMD::Pool NMD::P16_SR[2] = {
+static const Pool P16_SR[2] = {
     { instruction         , 0                   , 0   , 16,
        0xfd00    , 0x1c00    , &SAVE_16_         , 0,
        0x0                 },        /* SAVE[16] */
@@ -22198,7 +22191,7 @@ NMD::Pool NMD::P16_SR[2] = {
 };
 
 
-NMD::Pool NMD::P16_4X4[4] = {
+static const Pool P16_4X4[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfd08    , 0x3c00    , &ADDU_4X4_        , 0,
        XMMS_               },        /* ADDU[4X4] */
@@ -22214,7 +22207,7 @@ NMD::Pool NMD::P16_4X4[4] = {
 };
 
 
-NMD::Pool NMD::P16_LB[4] = {
+static const Pool P16_LB[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc0c    , 0x5c00    , &LB_16_           , 0,
        0x0                 },        /* LB[16] */
@@ -22230,7 +22223,7 @@ NMD::Pool NMD::P16_LB[4] = {
 };
 
 
-NMD::Pool NMD::P16_LH[4] = {
+static const Pool P16_LH[4] = {
     { instruction         , 0                   , 0   , 16,
        0xfc09    , 0x7c00    , &LH_16_           , 0,
        0x0                 },        /* LH[16] */
@@ -22246,7 +22239,7 @@ NMD::Pool NMD::P16_LH[4] = {
 };
 
 
-NMD::Pool NMD::P16[32] = {
+static const Pool P16[32] = {
     { pool                , P16_MV              , 2   , 16,
        0xfc00    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16.MV */
@@ -22346,7 +22339,7 @@ NMD::Pool NMD::P16[32] = {
 };
 
 
-NMD::Pool NMD::MAJOR[2] = {
+static const Pool MAJOR[2] = {
     { pool                , P32                 , 32  , 32,
        0x10000000, 0x00000000, 0                      , 0,
        0x0                 },        /* P32 */
@@ -22354,3 +22347,9 @@ NMD::Pool NMD::MAJOR[2] = {
        0x1000    , 0x1000    , 0                      , 0,
        0x0                 },        /* P16 */
 };
+
+int NMD::Disassemble(const uint16 *data, std::string & dis,
+                     TABLE_ENTRY_TYPE & type, Dis_info *info)
+{
+    return Disassemble(data, dis, type, MAJOR, 2, info);
+}
diff --git a/disas/nanomips.h b/disas/nanomips.h
index 7036e589f4..c56fc32b1e 100644
--- a/disas/nanomips.h
+++ b/disas/nanomips.h
@@ -68,6 +68,18 @@ typedef bool (*conditional_function)(uint64 instruction);
 typedef std::string (*disassembly_function)(uint64 instruction,
                                             Dis_info *info);
 
+typedef struct Pool {
+    TABLE_ENTRY_TYPE     type;
+    const struct Pool    *next_table;
+    int                  next_table_size;
+    int                  instructions_size;
+    uint64               mask;
+    uint64               value;
+    disassembly_function disassembly;
+    conditional_function condition;
+    uint64               attributes;
+} Pool;
+
 class NMD
 {
 public:
@@ -77,199 +89,10 @@ public:
 
 private:
 
-    struct Pool {
-        TABLE_ENTRY_TYPE     type;
-        struct Pool          *next_table;
-        int                  next_table_size;
-        int                  instructions_size;
-        uint64               mask;
-        uint64               value;
-        disassembly_function disassembly;
-        conditional_function condition;
-        uint64               attributes;
-    };
-
     uint64 extract_op_code_value(const uint16 *data, int size);
     int Disassemble(const uint16 *data, std::string & dis,
                     TABLE_ENTRY_TYPE & type, const Pool *table, int table_size,
                     Dis_info *info);
-
-    static Pool P_SYSCALL[2];
-    static Pool P_RI[4];
-    static Pool P_ADDIU[2];
-    static Pool P_TRAP[2];
-    static Pool P_CMOVE[2];
-    static Pool P_D_MT_VPE[2];
-    static Pool P_E_MT_VPE[2];
-    static Pool _P_MT_VPE[2];
-    static Pool P_MT_VPE[8];
-    static Pool P_DVP[2];
-    static Pool P_SLTU[2];
-    static Pool _POOL32A0[128];
-    static Pool ADDQ__S__PH[2];
-    static Pool MUL__S__PH[2];
-    static Pool ADDQH__R__PH[2];
-    static Pool ADDQH__R__W[2];
-    static Pool ADDU__S__QB[2];
-    static Pool ADDU__S__PH[2];
-    static Pool ADDUH__R__QB[2];
-    static Pool SHRAV__R__PH[2];
-    static Pool SHRAV__R__QB[2];
-    static Pool SUBQ__S__PH[2];
-    static Pool SUBQH__R__PH[2];
-    static Pool SUBQH__R__W[2];
-    static Pool SUBU__S__QB[2];
-    static Pool SUBU__S__PH[2];
-    static Pool SHRA__R__PH[2];
-    static Pool SUBUH__R__QB[2];
-    static Pool SHLLV__S__PH[2];
-    static Pool SHLL__S__PH[4];
-    static Pool PRECR_SRA__R__PH_W[2];
-    static Pool _POOL32A5[128];
-    static Pool PP_LSX[16];
-    static Pool PP_LSXS[16];
-    static Pool P_LSX[2];
-    static Pool POOL32Axf_1_0[4];
-    static Pool POOL32Axf_1_1[4];
-    static Pool POOL32Axf_1_3[4];
-    static Pool POOL32Axf_1_4[2];
-    static Pool MAQ_S_A__W_PHR[2];
-    static Pool MAQ_S_A__W_PHL[2];
-    static Pool POOL32Axf_1_5[2];
-    static Pool POOL32Axf_1_7[4];
-    static Pool POOL32Axf_1[8];
-    static Pool POOL32Axf_2_DSP__0_7[8];
-    static Pool POOL32Axf_2_DSP__8_15[8];
-    static Pool POOL32Axf_2_DSP__16_23[8];
-    static Pool POOL32Axf_2_DSP__24_31[8];
-    static Pool POOL32Axf_2[4];
-    static Pool POOL32Axf_4[128];
-    static Pool POOL32Axf_5_group0[32];
-    static Pool POOL32Axf_5_group1[32];
-    static Pool ERETx[2];
-    static Pool POOL32Axf_5_group3[32];
-    static Pool POOL32Axf_5[4];
-    static Pool SHRA__R__QB[2];
-    static Pool POOL32Axf_7[8];
-    static Pool POOL32Axf[8];
-    static Pool _POOL32A7[8];
-    static Pool P32A[8];
-    static Pool P_GP_D[2];
-    static Pool P_GP_W[4];
-    static Pool POOL48I[32];
-    static Pool PP_SR[4];
-    static Pool P_SR_F[8];
-    static Pool P_SR[2];
-    static Pool P_SLL[5];
-    static Pool P_SHIFT[16];
-    static Pool P_ROTX[4];
-    static Pool P_INS[4];
-    static Pool P_EXT[4];
-    static Pool P_U12[16];
-    static Pool RINT_fmt[2];
-    static Pool ADD_fmt0[2];
-    static Pool SELEQZ_fmt[2];
-    static Pool CLASS_fmt[2];
-    static Pool SUB_fmt0[2];
-    static Pool SELNEZ_fmt[2];
-    static Pool MUL_fmt0[2];
-    static Pool SEL_fmt[2];
-    static Pool DIV_fmt0[2];
-    static Pool ADD_fmt1[2];
-    static Pool SUB_fmt1[2];
-    static Pool MUL_fmt1[2];
-    static Pool MADDF_fmt[2];
-    static Pool DIV_fmt1[2];
-    static Pool MSUBF_fmt[2];
-    static Pool POOL32F_0[64];
-    static Pool MIN_fmt[2];
-    static Pool MAX_fmt[2];
-    static Pool MINA_fmt[2];
-    static Pool MAXA_fmt[2];
-    static Pool CVT_L_fmt[2];
-    static Pool RSQRT_fmt[2];
-    static Pool FLOOR_L_fmt[2];
-    static Pool CVT_W_fmt[2];
-    static Pool SQRT_fmt[2];
-    static Pool FLOOR_W_fmt[2];
-    static Pool RECIP_fmt[2];
-    static Pool CEIL_L_fmt[2];
-    static Pool CEIL_W_fmt[2];
-    static Pool TRUNC_L_fmt[2];
-    static Pool TRUNC_W_fmt[2];
-    static Pool ROUND_L_fmt[2];
-    static Pool ROUND_W_fmt[2];
-    static Pool POOL32Fxf_0[64];
-    static Pool MOV_fmt[4];
-    static Pool ABS_fmt[4];
-    static Pool NEG_fmt[4];
-    static Pool CVT_D_fmt[4];
-    static Pool CVT_S_fmt[4];
-    static Pool POOL32Fxf_1[32];
-    static Pool POOL32Fxf[4];
-    static Pool POOL32F_3[8];
-    static Pool CMP_condn_S[32];
-    static Pool CMP_condn_D[32];
-    static Pool POOL32F_5[8];
-    static Pool POOL32F[8];
-    static Pool POOL32S_0[64];
-    static Pool POOL32Sxf_4[128];
-    static Pool POOL32Sxf[8];
-    static Pool POOL32S_4[8];
-    static Pool POOL32S[8];
-    static Pool P_LUI[2];
-    static Pool P_GP_LH[2];
-    static Pool P_GP_SH[2];
-    static Pool P_GP_CP1[4];
-    static Pool P_GP_M64[4];
-    static Pool P_GP_BH[8];
-    static Pool P_LS_U12[16];
-    static Pool P_PREF_S9_[2];
-    static Pool P_LS_S0[16];
-    static Pool ASET_ACLR[2];
-    static Pool P_LL[4];
-    static Pool P_SC[4];
-    static Pool P_LLD[8];
-    static Pool P_SCD[8];
-    static Pool P_LS_S1[16];
-    static Pool P_PREFE[2];
-    static Pool P_LLE[4];
-    static Pool P_SCE[4];
-    static Pool P_LS_E0[16];
-    static Pool P_LS_WM[2];
-    static Pool P_LS_UAWM[2];
-    static Pool P_LS_DM[2];
-    static Pool P_LS_UADM[2];
-    static Pool P_LS_S9[8];
-    static Pool P_BAL[2];
-    static Pool P_BALRSC[2];
-    static Pool P_J[16];
-    static Pool P_BR3A[32];
-    static Pool P_BR1[4];
-    static Pool P_BR2[4];
-    static Pool P_BRI[8];
-    static Pool P32[32];
-    static Pool P16_SYSCALL[2];
-    static Pool P16_RI[4];
-    static Pool P16_MV[2];
-    static Pool P16_SHIFT[2];
-    static Pool POOL16C_00[4];
-    static Pool POOL16C_0[2];
-    static Pool P16C[2];
-    static Pool P16_A1[2];
-    static Pool P_ADDIU_RS5_[2];
-    static Pool P16_A2[2];
-    static Pool P16_ADDU[2];
-    static Pool P16_JRC[2];
-    static Pool P16_BR1[2];
-    static Pool P16_BR[2];
-    static Pool P16_SR[2];
-    static Pool P16_4X4[4];
-    static Pool P16_LB[4];
-    static Pool P16_LH[4];
-    static Pool P16[32];
-    static Pool MAJOR[2];
-
 };
 
 #endif
-- 
2.37.3


