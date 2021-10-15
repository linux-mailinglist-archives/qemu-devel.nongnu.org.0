Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2342EC0B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:23:30 +0200 (CEST)
Received: from localhost ([::1]:42046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbIUz-0003dz-DE
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHy4-0001UB-5a
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:28 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:35491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHy1-00045O-LL
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:49:27 -0400
Received: by mail-pg1-x52c.google.com with SMTP id e7so7884784pgk.2
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i6PkezBH+FEV3jHu5Pb1F3JamGgVSlOWl1a/EDuX+xo=;
 b=iRCsgvq6+4cwJOcnmXKp/06mnCIrX98rv7A1Zf6Cs0YBXUgscKW7Azhn3rPaPWmo1Y
 p/kADKTAvae2fcNIT+H9oXCK7YUgevR9fbkAtWqGe90rQfzFqnKXV+n7SYoVvO+SziQB
 dBf/N/ebUSHPOz470WosrsqwGU4QDosmNM9NXUDTZ2ibeNkfG2dzGKLbEgNRq6IDwpR5
 1DhvYEvt2VpXuaXu0MldpHHnFwuY3cpVhGfGDmnU5nOBw70i8y2X72tE8SP/26aE2VCM
 HoQBnm3cX/MqgANaSHWkHDndqJ9pThsDeHkOboKHWy1UyfugywSWo1hj7H+o42ZXl3sR
 UX/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i6PkezBH+FEV3jHu5Pb1F3JamGgVSlOWl1a/EDuX+xo=;
 b=MyAEt+oASOf+nLzvwQiJ0PnVMkAGXmw+2o56T0tWj9TU610zEU+6F8FNirrXiPmV2z
 cR55igRm38n1dyUtsCYMLXLcYDWRw9Gh2wAF6TU2Bn7p0Ucf+x+tRIYA9QJRmd+vcD+q
 MyIp0socWemZsTTjkKVraIFGOBskZ+8e6qjyFC+OdP0HNYb2QPubb+/Tjz3hbFDe6jHf
 4/81az1tXo87GjOMT8or0gvy2L2Eg8m5ppTCGbObT7qtTD2tFpBQ+iOB0yvejjOrmSwJ
 GdseKc+nnWIJ8OUpZ/Bq50Lv0gKzx7YTAZMXPvI8RRkOmLmN0SQhfGWZCmHXz9vHzLgO
 49ew==
X-Gm-Message-State: AOAM530uq8B4pydVW9YyAGy8vgwZ1lLKr+dWD2h5Q7kz9TDp2F11E6Yz
 qggjgjSfrcPpaxd0TRLlnVITuiRS3lUJTtpi
X-Google-Smtp-Source: ABdhPJxvAvWksJWDPn1S9e2LIbBnVdaguS9CE9iCnQWWE8bgDlohhYJpRnky8uwT21SLyx3A1zeeIA==
X-Received: by 2002:a05:6a00:1a46:b0:44d:7a3f:2043 with SMTP id
 h6-20020a056a001a4600b0044d7a3f2043mr8334083pfv.56.1634284164295; 
 Fri, 15 Oct 2021 00:49:24 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:49:24 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 42/78] target/riscv: rvv-1.0: single-width bit shift
 instructions
Date: Fri, 15 Oct 2021 15:45:50 +0800
Message-Id: <20211015074627.3957162-50-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=frank.chang@sifive.com; helo=mail-pg1-x52c.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>
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
index 0fc19b19c69..1fcde9f4df4 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -1685,9 +1685,9 @@ GEN_OPIVX_GVEC_SHIFT_TRANS(vsll_vx,  shls)
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
2.25.1


