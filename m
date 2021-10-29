Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3988843FA96
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 12:17:24 +0200 (CEST)
Received: from localhost ([::1]:55170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgOwt-0002Bi-AL
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 06:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNn3-00082l-1T
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:09 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mgNmz-0006dZ-HT
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 05:03:07 -0400
Received: by mail-pg1-x52c.google.com with SMTP id c4so9282806pgv.11
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 02:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHSoKgnP3T2hrrnes3culunWEOlYvAFk2n+yt2jlwtA=;
 b=OgTZHKm0w9o6sezLSYea7pDQlOoH3Su3sTA27MAXFBpkDZDxwNMwbS2TMy6AWHhz+1
 x5BB7CH/raRJboaPfpxFpEkX6iuap4pMZz6mQvPaeD2r52+WNWmHWY0EEBh1FRCFHOYp
 ertCkuK1UAGZkiJhSO9o/uR2L0HLHU63okV27ySCASLp/ZjOSFti3wsHYXAZrLhjGd49
 aKkG3B7L0k3REV5nIqkm/ma8sf27O2unpgklCD1OLESNew4P3pynzeMc2qSB9GYcyxEO
 HJSsQ2tnvmVBfbKJUAPLXJsJlKYUBpHihTy9Xya7E0WrxjtLUj+8+K4pIi6NF8xE9fEv
 3Xsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHSoKgnP3T2hrrnes3culunWEOlYvAFk2n+yt2jlwtA=;
 b=oZHYXIIgxPqE+GlEMws4n94gBVbVGFXtxlkUtYFIvaUbU5QThSehb36Q9nlMWDltLn
 pqVcE9MMC+eWz+Burw904mI8W69RJ3EHBnwPN2onbZN5TbvSeREH5qGDCw8Ik8Wvo2JB
 kW/cRuP+JkYKi7Bao05lwfxjZi/+7ZtAV3fzfMG+Mjny2RYEum1hEBy9vTwfwMozMGxK
 4Q4JZ+Yx/OBf7IlIljSxw6YqcoiAOMxVMdPfQ+zIveb+SB74XLpMP+59Mx/W9FjF7taz
 Y1bPkgmJ1bibHE9DoG7JoclCvYvWDKEt/YM6mVPKKBLusEo1gOUoSCHM/h3jnZPG5aIn
 OvdA==
X-Gm-Message-State: AOAM531b9Y9JLvYlCm3QW0+8fhu3Ov3AlW0IVQHn8qVyoNE6w9wfJyes
 ElLct0BNdw18LX20BS2s81uvhx0Y6FlHyveD
X-Google-Smtp-Source: ABdhPJw22znx+vAkvg+9sX9N4Q73n60WZrt+jfONWGRDV1lnjXuWI/xGqjwf2R9pxN84cyLLiDgClA==
X-Received: by 2002:a05:6a00:8c4:b0:44c:9827:16cc with SMTP id
 s4-20020a056a0008c400b0044c982716ccmr9706133pfu.7.1635498184218; 
 Fri, 29 Oct 2021 02:03:04 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46b:ce55:983b:6962:38ac:e1b9])
 by smtp.gmail.com with ESMTPSA id t13sm5081477pgn.94.2021.10.29.02.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 02:03:04 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v9 55/76] target/riscv: rvv-1.0: single-width scaling shift
 instructions
Date: Fri, 29 Oct 2021 16:59:00 +0800
Message-Id: <20211029085922.255197-56-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029085922.255197-1-frank.chang@sifive.com>
References: <20211029085922.255197-1-frank.chang@sifive.com>
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
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
index b43234ed3ff..03716ad7066 100644
--- a/target/riscv/insn_trans/trans_rvv.c.inc
+++ b/target/riscv/insn_trans/trans_rvv.c.inc
@@ -2030,8 +2030,8 @@ GEN_OPIVV_TRANS(vssrl_vv, opivv_check)
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
2.25.1


