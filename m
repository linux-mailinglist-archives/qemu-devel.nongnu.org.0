Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2F0325C1D
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 04:47:00 +0100 (CET)
Received: from localhost ([::1]:55236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFU5j-0000kK-CC
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 22:46:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTie-0001Hu-TU
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:09 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:33161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTid-00023o-8i
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:23:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id v200so5338450pfc.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=YzD4GWE7McJdMyvQd2WiHcEXlnvpaperfKiAw/tXaHxQQ62Uh5+fR3ucaqArwLiFsr
 CWFYuJV1Edn0x10XcnaCdyNDlQ2narUZw3OG3o8suPsgXPY/aeZwK+Jk9Bepk8ebiOuF
 EBAYPnWbrDhic6ZccvOewQxmLGOk4Oer77YLMxira2/rw70MqsIo3W5qnova8rA/81gS
 LsN+YzoHFx0JUo2rVgw2DSKUDG2hHuLeTIx0be4YGYFw07kV2J1NSiCrJ/Cr12cntcyV
 Cv6wknzeeQ+N1tXvDAQDl9Ow86XMs9jIWhj9KIy1bKajZamPTpWQhiFD6nT8+R4vrgfM
 CCAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=U0kMztiCj22FP8UuPO9hV/LMukr7pMgORff7Dy2rjNw=;
 b=JAuzN8z5Xf0jC1kmyR3IGnwyKYjWuYLDlsg1uVsIbQ9tU/kPyqtW2UDTPDi05ePCO8
 0+sFF/RvaOT/tn3ED0hCFSL+AS43Zge6bxsulTaHb3HY8TDdGLrf4Vpf886ud7zWGpcR
 7q+TjGvBQdwm3zXvoL8U6hG73RiWf+cpkQIsH4q1fNh65jcFAeJXsepnEeXRAAISdJoT
 NDas8k6oD38ravIhOYAWRrQH8m9STLL/SzhEZMHq8EozUD8jvRjbC8RTeM5VE9Jj9I8P
 WZsaIBErw0evZhumcXw6RyNqe3egMVGa5TF/ky/166+xSg1mxPfaqltR8eOAh7RHi2r2
 aeYA==
X-Gm-Message-State: AOAM532SAauGsF0iuG8Zqrqd7JS49SsCI5vOkELkt30Gafc4ls8znFAU
 qjqIDuaanJBib7hKKXlbPkQGr+mzXovX9Q==
X-Google-Smtp-Source: ABdhPJxr0+erg+vluTqkUVkl7wm4SIH/+kgVEHmkzmRrTaDfnhu4deMbBrjgDC/Q4/vj1yN+zB5CUQ==
X-Received: by 2002:a63:d144:: with SMTP id c4mr1013836pgj.196.1614309785033; 
 Thu, 25 Feb 2021 19:23:05 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:23:04 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 41/75] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 26 Feb 2021 11:18:25 +0800
Message-Id: <20210226031902.23656-42-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x436.google.com
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
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Frank Chang <frank.chang@sifive.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Truncate vsll.vi, vsrl.vi, vsra.vi's immediate values to lg2(SEW) bits.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 308c9fa44be..91936ec464a 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1915,9 +1915,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsrl_vx,  shrs)
 GEN_OPIVX_GVEC_SHIFT_TRANS(vsra_vx,  sars)
 
-GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_ZX, vsll_vx, shli)
-GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_ZX, vsrl_vx, shri)
-GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_ZX, vsra_vx, sari)
+GEN_OPIVI_GVEC_TRANS(vsll_vi, IMM_TRUNC_SEW, vsll_vx, shli)
+GEN_OPIVI_GVEC_TRANS(vsrl_vi, IMM_TRUNC_SEW, vsrl_vx, shri)
+GEN_OPIVI_GVEC_TRANS(vsra_vi, IMM_TRUNC_SEW, vsra_vx, sari)
 
 /* Vector Narrowing Integer Right Shift Instructions */
 static bool opivv_narrow_check(DisasContext *s, arg_rmrr *a)
-- 
2.17.1


