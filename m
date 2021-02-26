Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37791325C74
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:17:22 +0100 (CET)
Received: from localhost ([::1]:43034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUZ7-0008Hz-7i
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTj3-0001Pq-Tu
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:35 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:44422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTiz-00029c-Af
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:33 -0500
Received: by mail-pf1-x42b.google.com with SMTP id t29so5308734pfg.11
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2kXd7BkSecgi1sQstKw8lugNbrgP0rsKfdX8qw3qJaw=;
 b=chaWivbwFKEbunLWUvETJLTjxGBL/taXt7t7LXETKpFUTYhYLwR4ETWf8qYCEAYww1
 O5k3p8PiqZVzNxR0QC69tyFNtuXbuS/1wbBEpTI4v6zbIWSCBJUm8i2hjQaYZacpFAdu
 Zqia2AdWDjviJtYpaxcIJiL5FRMUUKjY5KYZisWCCZ9kvyDagex4LnAWtYtOCSDzSdTN
 mAbRDvfRWPZEJ9pJWmAF2riw/BhycyFfPgWe+BdMexbMiXAh3k/0MVzeBq6Es9G/9hKB
 ta7Xq54vAynLcOgxY0Z40vbFCmyUDQCEPHWbnhHoujN5LnEShF1AouOszm82xTUnnCHT
 ZfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2kXd7BkSecgi1sQstKw8lugNbrgP0rsKfdX8qw3qJaw=;
 b=aUmQScl7jtaOqJySH86vqxhpQuTK2EmNrPJ4J6CfT9wXqpGthZs9j5/BM0dgbj+oF+
 uj1hP3F3crwRlSohndUPdpKshrP2EQzXu4CsQEU+6oAbGiyrj9E+KtYsrlmxDNrsGv7R
 /W0YpYC5MUhwVYZAi7CbXAwTkNrmPuk6UKSS2rCpoxt79U6xLJ7Q9SyvxxrhCHKnsoPP
 GFYwE8Go0VGAHmm6Y4Gd/t0cTPmSt2rBsiN66+zsiSy2gLtvi0gJN2Expy0HCphzQjs2
 eHWof9aPAuhRmGj4ncuWbh+IzNG7QMOWBNij6jL+m5P2HnV3tWcCx7TEKQZ69VQ2lIt8
 923g==
X-Gm-Message-State: AOAM532QC5z3XzoN90+mST7fdVT21DEYR9tvh7AETsYSJNdP6eGxZh9G
 wkdglXeqv7YLLKnIZJh75vkPDxn3twKwaw==
X-Google-Smtp-Source: ABdhPJwOrPR6sLJdLRs5dxjlu24JaREwKpSj/BB1wevvamiM7BWGKUjfClVadiWRrSzZQM6RPEQijQ==
X-Received: by 2002:a62:7797:0:b029:1ed:7b10:84c2 with SMTP id
 s145-20020a6277970000b02901ed7b1084c2mr945910pfc.47.1614309807575; 
 Thu, 25 Feb 2021 19:23:27 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:27 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 45/75] target/riscv: rvv-1.0: single-width saturating add
 and subtract instructions
Date: Fri, 26 Feb 2021 11:18:29 +0800
Message-Id: <20210226031902.23656-46-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42b.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Sign-extend vsaddu.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 113a20af4d7..39e2d21da5e 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2232,7 +2232,7 @@ GEN_OPIVX_TRANS(vsaddu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vsadd_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssubu_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssub_vx,  opivx_check)
-GEN_OPIVI_TRANS(vsaddu_vi, IMM_ZX, vsaddu_vx, opivx_check)
+GEN_OPIVI_TRANS(vsaddu_vi, IMM_SX, vsaddu_vx, opivx_check)
 GEN_OPIVI_TRANS(vsadd_vi, IMM_SX, vsadd_vx, opivx_check)
 
 /* Vector Single-Width Averaging Add and Subtract */
-- 
2.17.1


