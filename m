Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878C9325C62
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 05:11:13 +0100 (CET)
Received: from localhost ([::1]:47682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFUTA-00078x-Iy
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 23:11:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjx-0002M1-9J
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:29 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d]:43179)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lFTjt-0002ZT-SH
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 22:24:29 -0500
Received: by mail-pf1-x42d.google.com with SMTP id q204so4271153pfq.10
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 19:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=jZ9hdwr7FFILDecToSnjoA0FbuR+IrlhAkB/tfNcgIWilhvD5WVc6lJBe0jD8XNdLw
 qUmvayZs2rSGXDPeX3LjBMaNci74ouDaaENiK7AayfAcouL9cP1ehGUkl11dJr6FxEVo
 y8lwfsqZbg+tTHq6drXJlP9uwUmnhg5OQ8GFo3NN/Bc1mr0h8VIosYAPaWkDW1hWKsCG
 QPQRzWsurDmSoytgCvvYQILZgSE4pnkClUDCl5A1PHPq5BGYuW8Qrj+m+nERVIYzMyRl
 0P9bMlLWzGR/vwIn0HV/ReFDwVQAUe4KaNdJ0IuNp+OWbjZ/ACH+KMH/HEB/7y181zAT
 0psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=y8Cl7Ad5sVJikJjeuJoLMz5GHxBKLNT+GwUS5o2r2j8=;
 b=hy0b3ZpVsf/adoQGQcz9ueBjX0uY/iu7wycyfb6psUudf2/eVagbdq6q2pmzoK1V/c
 A4O8rhVkb+esDguhLOwEtlgwW0xU07TdavkBXvDyRzoQlBNCQRnldiTQGOdDxvahtAwE
 4miqMLhfG48e+/vqsZjgZwE5v2m/aSX/sGhpJwB7SCzhHf6tzq1Z3vf7Hu42FV+aR09o
 Mv6JxHHuvOUVw1sUgOzb75jWiQRmXd/4ieUwy0I8ringXZoSt5R1AIufwA7uKJ17FS/8
 76HxEbRPy9qa3B9qh48zu1L3JSVNN1FGdwQW6v2PlOvplJstwoPVDAZ8ZR/clLJ1iSlO
 IsFg==
X-Gm-Message-State: AOAM530xPtQ7bHYcyXvhuoJ1rPRBf1EzmjnvKxLAslA/1BiTKzx6x57g
 Og9dJtxGvT9tEiagkDBfpKJe2tR64n2D5Q==
X-Google-Smtp-Source: ABdhPJw1mLkXj0t+ocyW1JQm0saDkifGV2S0LSgjWrzYa3aZX667D5chSlt/oHx5pdTd3mACzdLgfw==
X-Received: by 2002:a65:50c8:: with SMTP id s8mr1060402pgp.68.1614309864404;
 Thu, 25 Feb 2021 19:24:24 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id p11sm7083709pjb.31.2021.02.25.19.24.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 19:24:24 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v7 54/75] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Fri, 26 Feb 2021 11:18:38 +0800
Message-Id: <20210226031902.23656-55-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226031902.23656-1-frank.chang@sifive.com>
References: <20210226031902.23656-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x42d.google.com
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

log(SEW) truncate vssra.vi immediate value.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/insn_trans/trans_rvv.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvv.c.inc b/target/riscv/insn_trans/trans_rvv.c.inc
index 49889a7706b..2188e92064f 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2263,8 +2263,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
 GEN_OPIVV_TRANS(vssra_vv, opivv_check)
 GEN_OPIVX_TRANS(vssrl_vx,  opivx_check)
 GEN_OPIVX_TRANS(vssra_vx,  opivx_check)
-GEN_OPIVI_TRANS(vssrl_vi, IMM_ZX, vssrl_vx, opivx_check)
-GEN_OPIVI_TRANS(vssra_vi, IMM_SX, vssra_vx, opivx_check)
+GEN_OPIVI_TRANS(vssrl_vi, IMM_TRUNC_SEW, vssrl_vx, opivx_check)
+GEN_OPIVI_TRANS(vssra_vi, IMM_TRUNC_SEW, vssra_vx, opivx_check)
 
 /* Vector Narrowing Fixed-Point Clip Instructions */
 GEN_OPIWV_NARROW_TRANS(vnclipu_wv)
-- 
2.17.1


