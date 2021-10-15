Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FA442EB3A
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 10:13:50 +0200 (CEST)
Received: from localhost ([::1]:41558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbILe-0006Zf-01
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 04:13:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxD-00085n-5C
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:35 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:45866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mbHxB-0003Jt-Mm
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 03:48:34 -0400
Received: by mail-pl1-x629.google.com with SMTP id s1so4061961plg.12
 for <qemu-devel@nongnu.org>; Fri, 15 Oct 2021 00:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=nq9NK5F4Z6u6F5pKTCAC6Xb8J2A3O8Us2ZzRXrJTVgUgPMMnFYsiMS4clQeYu0G3h6
 zVgw8JalBsFzTIqniw3FtbbrnFadq00fhvGmsLpa+yIjM8NbxytYl1o33IYGMTcw22Xz
 ePrvLMG/yWLoX9yE/XQicGc85aQiLSL8MDo8+O3g9bXcTYuJqzgDUA+/d3Z9jqsK1TLq
 rQ/D3anQh+JzY6ZXo1WgAEk1NHJtcpMopqpufQEQFWTOy9TeCY73ltw4FYtG6YHQ6uXz
 oRff4dPIDm2TPpmzE7PAbW7E/zizwQIJ+wPQ3vaaOtCVvxs1lm7BZoyEdnt+Kil3iLRZ
 ylXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RkcJRBFfgWRMLE0q4h8ibzmlGf09nN5PtQGtP90osKY=;
 b=D1hWwD0jHWEJ/2QJt7YmwPSaFWdlllId7R2BpP+IVnP+i8R61BBuWxIouqmzzx35KQ
 bm6RTAc9GYe66qBNd2GvUu6erNLQeV+Tz4CX/xgJSYJmkCX/PQ1+4wZ7W40N0fD/AG7v
 Jbxtfg6dZ1QYF/arjyN3KNeh976UBMzkd078vOzCLbnEs5Hi2Dx7/p94grodUK4ivUoP
 mr1+dLdzyc5sL2rto8VfLzJGguoseZ5ul6MGmzj+7sihORfvok44tpaLLZ881pMUe8BK
 gxid3tjj+2PRVo6m1D8ovF9D2mCnBlMV6Nkejeiv0bhjd+0XZYoNDhavjm9r7gZDWVfq
 nTkQ==
X-Gm-Message-State: AOAM531xuMK22sFubt0tVEIW2rTaCaGgx2dY7J565qQWCXBN/oIMsraF
 XqEa9UYdLsicwNgRvCixYQWaDwP8h8cO4NFG
X-Google-Smtp-Source: ABdhPJyw++OghG5Qk7QlgmHG6x00YuEXcWeuCdO5u0Mja5PslUymrKmF0dDGJRVFpbOGWF8JpI5+4g==
X-Received: by 2002:a17:90a:5515:: with SMTP id
 b21mr11782010pji.239.1634284111400; 
 Fri, 15 Oct 2021 00:48:31 -0700 (PDT)
Received: from localhost.localdomain (123-193-74-252.dynamic.kbronet.com.tw.
 [123.193.74.252])
 by smtp.gmail.com with ESMTPSA id z13sm4271680pfq.130.2021.10.15.00.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 00:48:31 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v8 27/78] target/riscv: rvv-1.0: floating-point square-root
 instruction
Date: Fri, 15 Oct 2021 15:45:34 +0800
Message-Id: <20211015074627.3957162-34-frank.chang@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015074627.3957162-1-frank.chang@sifive.com>
References: <20211015074627.3957162-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x629.google.com
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 7d8441d1f21..92a0e6fe51e 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -563,7 +563,7 @@ vfwmsac_vv      111110 . ..... ..... 001 ..... 1010111 @r_vm
 vfwmsac_vf      111110 . ..... ..... 101 ..... 1010111 @r_vm
 vfwnmsac_vv     111111 . ..... ..... 001 ..... 1010111 @r_vm
 vfwnmsac_vf     111111 . ..... ..... 101 ..... 1010111 @r_vm
-vfsqrt_v        100011 . ..... 00000 001 ..... 1010111 @r2_vm
+vfsqrt_v        010011 . ..... 00000 001 ..... 1010111 @r2_vm
 vfmin_vv        000100 . ..... ..... 001 ..... 1010111 @r_vm
 vfmin_vf        000100 . ..... ..... 101 ..... 1010111 @r_vm
 vfmax_vv        000110 . ..... ..... 001 ..... 1010111 @r_vm
-- 
2.25.1


