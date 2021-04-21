Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E0366447
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 06:16:33 +0200 (CEST)
Received: from localhost ([::1]:42632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZ4Hw-0008Qa-9U
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 00:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fi-0006U0-RQ
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:14 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1lZ4Fc-0002qR-OA
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 00:14:14 -0400
Received: by mail-pf1-x435.google.com with SMTP id 10so18567270pfl.1
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 21:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=m10ZJR5ga+jrNOiccbCPxybddRIl97ElRYhoIendunY=;
 b=LLV2MiWy8tFrOz4Bhi+OiBloxILI/9nGbSF8B4ZdDOso9iEByvtFgucwdie4/0KuVO
 4uWYnT4luyIr8loltClQqepFRvFhwmNRGUHGu37ZGf3Mvl2KyLZGvTE28OH707APwN7z
 72fztG61yUFD1UmETJSzm11WulyXYgB5SQyssJJVQuQ5TG5yauG+E31pkwtoE78ySx3N
 ZHxg0tDZHERSbmI/0BRqXCyudSdgdrgTh7zYTvP33pgpaSdSHn5vsiNgGLUIZ3RWLIGg
 LPZVaxSwZSK4ZKYr5LiEpIMeuwkB1JF5dUDUIotcnXREwxOlhVl/uGmAhM8dh6w0WTA0
 3dSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=m10ZJR5ga+jrNOiccbCPxybddRIl97ElRYhoIendunY=;
 b=Yjjc3sktZ5jx2CNEPrIwSEs/XGgpuOabDYtbIOrq1T3mk3fq4JrGPSan+0pzgqNi/V
 iufZd/nbjWGbUjYAUswGBLZdl58mSW10bmrk4S+kYKi/XJi3qr0l2ASKMnKwD9FlIAXk
 Eg1SwdCuD/3vHuIUv9i8vNI4pSloctd3yHZoUrGaidPELR20WuhZiIoHoBvSKIEN/Ajg
 YOm++fEAOLUpz+5IpMSDHGkSSqg33jpbL1E/HKV7Vo9UjLD8C6sLkBwYpWvYVJAU27pE
 +5QE+Qs1VkSC89VMKoi5Fgqa8GuPWhaUTA+ZvQ5Wq2lBfRxEjAGjUwvmbawp/a146/su
 LZtQ==
X-Gm-Message-State: AOAM531sTns3llcGwR3bUn6KbKkDFj5vtUDGcEJxkJsbHxk4qxdzdjLP
 GYqEdZKQoHA1xLbiwJ2iQS4TyHJyl5eirLWd
X-Google-Smtp-Source: ABdhPJxeKSGEiVUj0U4m5x1MIpZsIU4Euu63I8MVZlc8WOYhpxSbOG34DlYHGDzZNOvINhOMmAL3Ng==
X-Received: by 2002:a63:3d48:: with SMTP id k69mr19727430pga.239.1618978447293; 
 Tue, 20 Apr 2021 21:14:07 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id jx20sm551465pjb.41.2021.04.20.21.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 21:14:06 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v5 01/17] target/riscv: reformat @sh format encoding for
 B-extension
Date: Wed, 21 Apr 2021 12:13:43 +0800
Message-Id: <20210421041400.22243-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210421041400.22243-1-frank.chang@sifive.com>
References: <20210421041400.22243-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x435.google.com
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
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Kito Cheng <kito.cheng@sifive.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kito Cheng <kito.cheng@sifive.com>

Signed-off-by: Kito Cheng <kito.cheng@sifive.com>
Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/insn32.decode | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 84080dd18ca..3823b3ea800 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -22,7 +22,7 @@
 %rs1       15:5
 %rd        7:5
 
-%sh10    20:10
+%sh7    20:7
 %csr    20:12
 %rm     12:3
 %nf     29:3                     !function=ex_plus_1
@@ -58,7 +58,7 @@
 @u       ....................      ..... ....... &u      imm=%imm_u          %rd
 @j       ....................      ..... ....... &j      imm=%imm_j          %rd
 
-@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh10      %rs1 %rd
+@sh      ......  ...... .....  ... ..... ....... &shift  shamt=%sh7     %rs1 %rd
 @csr     ............   .....  ... ..... .......               %csr     %rs1 %rd
 
 @atom_ld ..... aq:1 rl:1 ..... ........ ..... ....... &atomic rs2=0     %rs1 %rd
@@ -122,9 +122,9 @@ sltiu    ............     ..... 011 ..... 0010011 @i
 xori     ............     ..... 100 ..... 0010011 @i
 ori      ............     ..... 110 ..... 0010011 @i
 andi     ............     ..... 111 ..... 0010011 @i
-slli     00.... ......    ..... 001 ..... 0010011 @sh
-srli     00.... ......    ..... 101 ..... 0010011 @sh
-srai     01.... ......    ..... 101 ..... 0010011 @sh
+slli     00000. ......    ..... 001 ..... 0010011 @sh
+srli     00000. ......    ..... 101 ..... 0010011 @sh
+srai     01000. ......    ..... 101 ..... 0010011 @sh
 add      0000000 .....    ..... 000 ..... 0110011 @r
 sub      0100000 .....    ..... 000 ..... 0110011 @r
 sll      0000000 .....    ..... 001 ..... 0110011 @r
-- 
2.17.1


