Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4752B4B4E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 17:35:48 +0100 (CET)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kehTn-0001VT-5q
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 11:35:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3j-0000FO-2C
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:51 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:44528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3g-0007u6-Q5
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:50 -0500
Received: by mail-wr1-x443.google.com with SMTP id c17so19237703wrc.11
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=75Zceu/K9be36pIFImAJ+/cw2g18SD9setpoR1l2WBI=;
 b=vfzEj6yrWLd2YliLm/Fy+f1w2dDhD1xnpyzmotKOkA1ZybgktHDoJbzZjUg4TXwHtH
 eyorDJAg/SCslo2qNrzXvqmaeZ+wyC0BUnxoPI7z2WICMZYyLQK1IK6cptnjEQHI9NXd
 L6fbR6sQDOMEY8PIghGVyZg1m9RvIzE1inldYLckwJHyiw5wPdnzo/7qUsNFoQ5ybDZR
 lwny1oOZYea8BFN3DPEBSw1OArJk/qdRkt7WMT2S9cHVVnV+HrcxesYAFlMUyeccQCd1
 ouaziOZ1v9p9r1GXsCzqCppmRvvNtKo/T9mqqJDN/y2THnpPq4q6aOTC0/lBRgywc0Zg
 nADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75Zceu/K9be36pIFImAJ+/cw2g18SD9setpoR1l2WBI=;
 b=X1f8AceX2WTzVA65tW3jAyF/Cpjqwp0qNm/FYCuM6V8f94wPNjWrKh+c8dAzQy55bP
 qCjdGZL1T3ZsrA9P5c7KvdFbGCnSu6lB/sGwRNC4xhgo4YTFu3GvgNXiF6/5xVpj0HDy
 eTDTyD09HX8dkWcfqHRrwkkhZVolg8YgdLNGc+bnDMfZIYQyKRFSWAT45WuibCo4CRWO
 qaKEPXD8/yB6xau3jC0e0Tg8dpBiGPukSxfFCzfgwlj1A1MgAdxs/gKGhC5zc/5CiO9c
 4KqnjA820D69/8z0sS5RPw1y7WMwBDT1orf0D877irCTZL2TDVnCioihOUGJVz1b9ox8
 Fsow==
X-Gm-Message-State: AOAM533c24DNngOW5NloyUKokb7RjMQtzKemHToodG90cO5eecAVcbLO
 yOi8Eh9Agzj/WDjZ3JjkAu1Waw==
X-Google-Smtp-Source: ABdhPJwHm7vpGnZD4TIQYu0CzyTMSK8XjdTs0K8qsMdT5i1RtpzRLEMoMdH4Yd/wtZ1OP8K8SV2Q/g==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr20354557wrq.294.1605542927471; 
 Mon, 16 Nov 2020 08:08:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/15] target/arm: Use new FPCR_NZCV_MASK constant
Date: Mon, 16 Nov 2020 16:08:27 +0000
Message-Id: <20201116160831.31000-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
in the previous commit; use it in a couple of places in existing code,
where we're masking out everything except NZCV for the "load to Rt=15
sets CPSR.NZCV" special case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 84e806004e4..1ccaccbc834 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -743,7 +743,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * helper call for the "VMRS to CPSR.NZCV" insn.
          */
         tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
     default:
@@ -884,7 +884,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSCR:
             if (a->rt == 15) {
                 tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-                tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+                tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
             } else {
                 tmp = tcg_temp_new_i32();
                 gen_helper_vfp_get_fpscr(tmp, cpu_env);
-- 
2.20.1


