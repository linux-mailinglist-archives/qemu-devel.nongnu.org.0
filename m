Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E96424F18
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 10:20:00 +0200 (CEST)
Received: from localhost ([::1]:34230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYOdD-00032j-Et
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 04:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mYOba-0001XR-PF
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:18:18 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mYObY-0005sN-B9
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 04:18:18 -0400
Received: by mail-pf1-x434.google.com with SMTP id g2so4691475pfc.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 01:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=az0PyQUrgiu40mZYqhgyAjMGnVo/wqEUkt6vs4aCBq8=;
 b=BHL88myk0PfQ2xKkix3+hamFy4Mc1N/EmMdgPBzeiAj4vFxqc3WdXuGH0uqfmtneUb
 Of5lKWmFW8wkSnsnyh1Br8nLNaf/5PxZmncQQXkNrF0BMW+mytK7EwVDZ8QNXSC/jMmd
 9wE/pwW6BvSWukm+NapUzUzLBsb41mLJlhaeNSVjHplUfGItcof8/NMZBtgveuEgJ/58
 jgw15+jKLNyk9kDSqwb7EyDj5L1ebwveH/3APIN2w75HKa9UXSmOg2pk2GoQ0m2zUq5G
 5E1f8+ueMPLhFt9dv+Ve/Ns3u/u1zAxx7kyB+JcGWjE9EYtP3n4mQXvqjQi+kw9qoSBT
 n/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=az0PyQUrgiu40mZYqhgyAjMGnVo/wqEUkt6vs4aCBq8=;
 b=IgKhzJVoBqYqwoY21xk/f059nu8HVYZkLxtEusVm+Uil6hXp0XMR3oMqNRBv0yQ80c
 OYpR4cvCGsT3/lIzl+dOJx/cP5c6s2F993Wc+Ox0v14PR/+OnBQ/9oS4piyXk1BYmcHt
 6mlI3LIA7qla9z1EUHRfEZenG2zoCpNii9PxwGJwah2akJapNbU5aU0DQgb1ezkx0hqu
 zcTE04AKKpb/oA2jPXGK+c6MzzR++e4j92bmuLQ7shOq5ShtpIZTPZM4vHfDAh5ZAoMb
 Tm6bDBDhmiWH6azCvvTDKZ2V/yrlBLOeAQ76YLRqSeSmNH2Yt33Gg+3Sjlr74JbUkEEz
 VGyw==
X-Gm-Message-State: AOAM5312Fk7sh/CihgOjMezRLuYWNr7JoEDYTKHRqxetg/g90iJErR5h
 D+sca+WgaQTouTvXv68BNPKpkQ/wzmO0Ng==
X-Google-Smtp-Source: ABdhPJxzq9KcVhwkuvL5bfGllbl5VVI94RRPfDxv29Lxe/Yjl8JJk2QFvappN3JfMUzPMvCNBSkMGA==
X-Received: by 2002:a63:e741:: with SMTP id j1mr2337085pgk.86.1633594691729;
 Thu, 07 Oct 2021 01:18:11 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id v20sm17056647pgc.38.2021.10.07.01.18.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 01:18:11 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH] target/riscv: Pass the same value to oprsz and maxsz for
 vmv.v.v
Date: Thu,  7 Oct 2021 16:17:41 +0800
Message-Id: <20211007081803.1705656-1-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x434.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

oprsz and maxsz are passed with the same value in commit: eee2d61e202.
However, vmv.v.v was missed in that commit and should pass the same
value as well in its tcg_gen_gvec_2_ptr() call.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index fa451938f1e..f730bd68d18 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1619,7 +1619,8 @@ static bool trans_vmv_v_v(DisasContext *s, arg_vmv_v_v *a)
             tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_vl, 0, over);
 
             tcg_gen_gvec_2_ptr(vreg_ofs(s, a->rd), vreg_ofs(s, a->rs1),
-                               cpu_env, 0, s->vlen / 8, data, fns[s->sew]);
+                               cpu_env, s->vlen / 8, s->vlen / 8, data,
+                               fns[s->sew]);
             gen_set_label(over);
         }
         return true;
-- 
2.25.1


