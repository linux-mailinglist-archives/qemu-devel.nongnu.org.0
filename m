Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 321DF2AD4DE
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 12:27:15 +0100 (CET)
Received: from localhost ([::1]:41696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcRns-0002Nh-TS
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 06:27:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgQ-0001wg-RB
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:30 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcRgN-0006oD-HJ
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 06:19:30 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 33so12234958wrl.7
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 03:19:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ju+kUkFBMOBFyiWH5JlYSMsJ+dyc+Z8Zg617Qpzid2w=;
 b=hzockvwIS94CUkXwJlWZxeLja9YC6fphHg8VBhOJochArpsBhgStpGG7Cb3Iv4Q3Ed
 0CsjCvi0NZNaq8elWiL+nOsxU4C6+UmRWYxvGDqPvO0eje+G43sEP/AlOrYsPeGaXsvf
 pDwoE3h/iG1uGvnN1gufIhd8T84JHtfkOkuXG64YfF6qNlircDgw5nAp6dwE5OEDItXh
 vop5E1UnXuU/sSlDW9UcI9P53o7eohCuC19LvEdqdRGGwcq6g/b3Wi//i+Ngp1GY3pEL
 AQ5ldPNOyeJ4sgc+kUl8y8XECSYysTpac1mgsIHBF2iHUHle+6w5uMg/vZOvyPFKrlC6
 VI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ju+kUkFBMOBFyiWH5JlYSMsJ+dyc+Z8Zg617Qpzid2w=;
 b=AbQNUKMeG1bqqslbeEYaUBpxPoDJ3JQiX8XZQ7YvlHe1aMfpcxocj33SIvUCKaAA9P
 QRlbFDnTR1dY6kpJniS2GGdRpb2UwehiM/+WdswU7mC/3Mqpy+AWfQBbaK+IjNTsMe5k
 4em3M9vXLahmIsG4nDmU2a78JH8x1DMoxuIfG+A32Oe6K4hG9CSOjW3uFZyQFOPCVOxH
 BRpYTMfPdo/U0Vvy8S0j1R/16qPVZ9DoUihZt2g/Pm0zfrUxtN/mvtlpmsFMDIn6f1MN
 XkRoLmvxsIIolQ66SFwh7cmuKPWq3xMC7be62r4UlNJ2mOf6q7hCq0V6R36cCqLG1aC9
 yDRQ==
X-Gm-Message-State: AOAM5334k85tZVB/MTg5KlZttBJzeOyv5AhYHZH41YwL/Oc9d+1tkfXV
 +61HHxo26v+NOwMml047OegiZ7clNMpvyA==
X-Google-Smtp-Source: ABdhPJypDsJfEkC1wCfZ4jVezau6ecdIYTuVS+xILVXg6gbM7lcKcM8fE9hye1z/i6FzXY8qq4jmoA==
X-Received: by 2002:adf:f881:: with SMTP id u1mr24863525wrp.103.1605007165196; 
 Tue, 10 Nov 2020 03:19:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 109sm16909498wra.29.2020.11.10.03.19.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 03:19:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/16] target/arm: Don't use '#' flag of printf format
Date: Tue, 10 Nov 2020 11:19:05 +0000
Message-Id: <20201110111917.29539-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110111917.29539-1-peter.maydell@linaro.org>
References: <20201110111917.29539-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Xinhao Zhang <zhangxinhao1@huawei.com>

Fix code style. Don't use '#' flag of printf format ('%#') in
format strings, use '0x' prefix instead

Signed-off-by: Xinhao Zhang <zhangxinhao1@huawei.com>
Signed-off-by: Kai Deng <dengkai1@huawei.com>
Message-id: 20201103114529.638233-2-zhangxinhao1@huawei.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 072754fa24d..1867ec293f4 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -12114,7 +12114,7 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
-                fprintf(stderr, "%s: insn %#04x, fpop %#2x @ %#" PRIx64 "\n",
+                fprintf(stderr, "%s: insn 0x%04x, fpop 0x%2x @ 0x%" PRIx64 "\n",
                         __func__, insn, fpopcode, s->pc_curr);
                 g_assert_not_reached();
             }
@@ -13121,7 +13121,7 @@ static void disas_simd_two_reg_misc_fp16(DisasContext *s, uint32_t insn)
     case 0x7f: /* FSQRT (vector) */
         break;
     default:
-        fprintf(stderr, "%s: insn %#04x fpop %#2x\n", __func__, insn, fpop);
+        fprintf(stderr, "%s: insn 0x%04x fpop 0x%2x\n", __func__, insn, fpop);
         g_assert_not_reached();
     }
 
-- 
2.20.1


