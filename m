Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1D04CC7A9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 22:12:18 +0100 (CET)
Received: from localhost ([::1]:56892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPskD-0002DN-Fa
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 16:12:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYP-0005sK-TP
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:05 -0500
Received: from [2607:f8b0:4864:20::62f] (port=44677
 helo=mail-pl1-x62f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsYO-00046g-Ac
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 16:00:05 -0500
Received: by mail-pl1-x62f.google.com with SMTP id q11so5850817pln.11
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 13:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NVZxBYjya/bVlEFKs7qigQ6ua4ofT68Gshv8z31H2EM=;
 b=WaUA0hnt0W0ZkrD7Q9SZu3e+9pJWlMDZu59Kx8tjiOdbhNjQJ6jj5FrQgSfwv62MuX
 Xvo+btsFa1jSrF/sPEfnuri/mKlOpBeULV3bsjEIVNcUh0uuc1ayBoqFwMi6bDrIR3QX
 E9b6uoRcCT7yKkpT0S+gkmwQlqobuLSyi3hN1CI0DYmdMrTPMHU3Mzd/XxmPdeWz6fTd
 mxm7MfbC35oX2oAb9u4n4B34/NOYiYnaqIbPkXqyDsN/Lj80O2Jhy8o4iqcc5LwisDnk
 7aGmZTlOKa+c+sunOQuFS3HLkUXUR4CK1Wc9qw4tPPdruu7ucgyaavwItbdXe3CGlTVV
 +EoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NVZxBYjya/bVlEFKs7qigQ6ua4ofT68Gshv8z31H2EM=;
 b=PAkpHf5/TDx3QBMsDdPIErm564v16M5ePglOSet38NiaRrgthmH17gwMh8oKCiAhnH
 0ZPHypND24fWWGSlDaL4y0Sw9cu+3ZMK6Fviqq5QJar8Kqug9zLPVYbctWZAYhrUCqkh
 5xAvC66G9W4EGICQNsdzH02J3u+ykicPjEtNP2/yTXIz/ySKZakHpm8gSyJiGvZq3A8W
 bHp7wJZgSHRojz4ZxWZTGy3evMwaR/N40/s+9yeAa9qgDHryieHQtuW1bpIjiKqj0caY
 J8y324Bpet3qx5ZTRY/wrv1iQ7fFHGEl/2q6Lv+ofBh3spIzS9nOmdtbdVrwkYC83lqA
 3EmQ==
X-Gm-Message-State: AOAM530xCnCcJyIPaAo6rRcICRXdhEdp61DVq8+wpuTXXkS1ctqC/Phz
 hHB5EE7REJKHi4MtGjXLY674H2MecBzAJw==
X-Google-Smtp-Source: ABdhPJx5HFHJeIFS1VYYXc89/NeX1Kj6GzRzihl7eu3btJIEoCcnh0fV37nt6LcsOj2HzO2P3WVW3g==
X-Received: by 2002:a17:90b:3b4b:b0:1bf:d4e:d677 with SMTP id
 ot11-20020a17090b3b4b00b001bf0d4ed677mr5261181pjb.56.1646341202596; 
 Thu, 03 Mar 2022 13:00:02 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a6549c8000000b00372eb3a7fb3sm2729934pgs.92.2022.03.03.13.00.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 13:00:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/30] tcg/i386: Implement avx512 scalar shift
Date: Thu,  3 Mar 2022 10:59:24 -1000
Message-Id: <20220303205944.469445-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303205944.469445-1-richard.henderson@linaro.org>
References: <20220303205944.469445-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

AVX512VL has VPSRAQ.

Tested-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/i386/tcg-target.c.inc | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 055db88422..1ef34f0b52 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -369,6 +369,7 @@ static bool tcg_target_const_match(int64_t val, TCGType type, int ct)
 #define OPC_PSLLQ       (0xf3 | P_EXT | P_DATA16)
 #define OPC_PSRAW       (0xe1 | P_EXT | P_DATA16)
 #define OPC_PSRAD       (0xe2 | P_EXT | P_DATA16)
+#define OPC_VPSRAQ      (0x72 | P_EXT | P_DATA16 | P_VEXW | P_EVEX)
 #define OPC_PSRLW       (0xd1 | P_EXT | P_DATA16)
 #define OPC_PSRLD       (0xd2 | P_EXT | P_DATA16)
 #define OPC_PSRLQ       (0xd3 | P_EXT | P_DATA16)
@@ -2854,7 +2855,7 @@ static void tcg_out_vec_op(TCGContext *s, TCGOpcode opc,
         OPC_UD2, OPC_PSRLW, OPC_PSRLD, OPC_PSRLQ
     };
     static int const sars_insn[4] = {
-        OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_UD2
+        OPC_UD2, OPC_PSRAW, OPC_PSRAD, OPC_VPSRAQ
     };
     static int const abs_insn[4] = {
         /* TODO: AVX512 adds support for MO_64.  */
@@ -3330,7 +3331,14 @@ int tcg_can_emit_vec_op(TCGOpcode opc, TCGType type, unsigned vece)
     case INDEX_op_shrs_vec:
         return vece >= MO_16;
     case INDEX_op_sars_vec:
-        return vece >= MO_16 && vece <= MO_32;
+        switch (vece) {
+        case MO_16:
+        case MO_32:
+            return 1;
+        case MO_64:
+            return have_avx512vl;
+        }
+        return 0;
     case INDEX_op_rotls_vec:
         return vece >= MO_16 ? -1 : 0;
 
-- 
2.25.1


