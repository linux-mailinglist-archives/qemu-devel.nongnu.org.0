Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB49B5761CC
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 14:36:41 +0200 (CEST)
Received: from localhost ([::1]:46892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCKYi-00069C-6O
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 08:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKVv-00044s-Gu
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:33:47 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKVf-0002RA-Eo
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 08:33:47 -0400
Received: by mail-wr1-x434.google.com with SMTP id j1so2098799wrs.4
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuRbk5CWRfM03M5yrd1oq6pfXGgzYo68VWk+Ro2YMl8=;
 b=r1GWN6JetqLl1ugnzacjTi/aXxegnPXgNMKnmTsS6NljZp4rFkpLypWmoyyzk7z2kD
 BQlqNY3t1w5zh/fRRJiAlpbttm65j3isAWj6rrGeObXjoWAWOWaoBwOxyg/jW/PMGhw2
 nAonSCEQR5Jft5Jaq+oRjmZAdqRs3ZMoYRlTpjlWFI+8K9AGyYxGFz2z9nsDQyC4M42l
 IqF9EXc3F6lUjJOoNHY46boAHdmzTYpJOzqXaHYPiWdn4lJKPTBS/EHmW4kUUk6Sgqnx
 oNut83eg+o3Wj1gh2fvyGVop4xJAB9mzkWILHl0l5TBx+2m7IQVQZ+pDwcgEErpBfNPO
 +P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuRbk5CWRfM03M5yrd1oq6pfXGgzYo68VWk+Ro2YMl8=;
 b=tCWSPSVCSdQsvkZLH+2Pvq73MEVwhsBOZTpcAicpFsgGS2wWGt/ocuUuMA+32DgYoE
 Z4G9Yj7KEJ5UaXlFqih16DNIQZMUiLX8No2sU3J6Ye7xufCd+ClgN0+LPiFoPtUVzqiM
 fPVNvcOePkDJP5/EPmYqZuNxpa8n4x5hkNFB8vXNAsaXfR3/dXwLmd2oj9OmZ9bkS5X9
 AQYh9o9c9usyETSH0mVMUx4sX+SeY2p1v1/CaXIM62UcBolbm464g9CFntx4pShUvA4z
 E4LPdiaYeAct/wuZOcsO2GjBtab0fdCkJ1/s7N6pa2HC/gI4fEwOUitlkpYmS7UvYgvr
 wzMw==
X-Gm-Message-State: AJIora/VIeU6q0oPqaCWuqbY3E3w+OcenjZDFlTDwX+pnbpeKM6ppuEK
 Zt7hrLODOZxOGrj/wpVqvpybHwD36Y6BMA==
X-Google-Smtp-Source: AGRyM1tHkOoaHa2lKpq4UmW4kVtTiJbnOPbUd6J39YTToHDYdP/T3+284MKxT5ZygVDALrulPCfXrQ==
X-Received: by 2002:a5d:598e:0:b0:21d:86b2:f35 with SMTP id
 n14-20020a5d598e000000b0021d86b20f35mr12877646wri.54.1657888409576; 
 Fri, 15 Jul 2022 05:33:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003a302fb9df7sm4832616wmm.21.2022.07.15.05.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 05:33:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't set syndrome ISS for loads and stores with
 writeback
Date: Fri, 15 Jul 2022 13:33:23 +0100
Message-Id: <20220715123323.1550983-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The architecture requires that for faults on loads and stores which
do writeback, the syndrome information does not have the ISS
instruction syndrome information (i.e. ISV is 0).  We got this wrong
for the load and store instructions covered by disas_ldst_reg_imm9().
Calculate iss_valid correctly so that if the insn is a writeback one
it is false.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1057
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with RTH's test case attached to the bug report.
---
 target/arm/translate-a64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b7b64f73584..163df8c6157 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3138,7 +3138,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool is_store = false;
     bool is_extended = false;
     bool is_unpriv = (idx == 2);
-    bool iss_valid = !is_vector;
+    bool iss_valid;
     bool post_index;
     bool writeback;
     int memidx;
@@ -3191,6 +3191,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         g_assert_not_reached();
     }
 
+    iss_valid = !is_vector && !writeback;
+
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-- 
2.25.1


