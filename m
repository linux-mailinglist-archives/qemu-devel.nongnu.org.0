Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6E42F4519
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 08:21:01 +0100 (CET)
Received: from localhost ([::1]:57434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzaSi-0003kx-9i
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 02:21:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaM6-0006lg-QI
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:12 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1kzaM2-0003m3-NU
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 02:14:09 -0500
Received: by mail-pj1-x1035.google.com with SMTP id w1so2700411pjc.0
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 23:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=aMywIBnSI83XT3/IkaO5F7ZSwOZ00BefYHJBDoTIbZ/DSNl63KizHkv34ZT/XQkKym
 LVR5ggMJ9xv0l2yvcpmsQ3g3bxya/k+qGktlO392gVzqCgQ4/Ln3HMkmvEK1JEkHGq67
 hQvn/8NrFzJecTgP6dcBLrI5OpCnd51/D/NgimbJ1UtBYum40LFlMGcVSsEcYPKk7ZA1
 g2uvK2yds1iNAq/L7tVvh8vcQtO6B9Db5XaVvp7gPTrmYb8TzCk51JJj6Ro9gDIUPPOa
 57S4eSuG9FW2qMbrxLmdbX4i0IOtOOWfXiILy6xLYjTsxmUKuL0/8luygfGntj72oDlv
 vwGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=BgZikz4sJLs+w0Gy/WgD2VLy+0WnxAYabQZ2ZyT4YKc=;
 b=i1uBJfor9yW7aijjOHU2u9A0Du/qp9iD4T6GADqbYasAgNAwo1/wal3VZoai3xPdzl
 Ks4tVpJYLbu1X2Wsf5YJw8KvWnDQwU8HWRXdylfHccoNYwXDW6SZRxCVjE7EKtlhqIK4
 6LVIvGZk2OnaX90tf/STPPUw2aXCJzY/D9Tc70A/4whVOkZONSSxugWV9p2ARlgvLXW3
 L9XXqstGMna9DB2bHy3MzoUKSxAczCX3TPvlYNRZIe6Qhd/Wd+zZvpVwGnkAcTKk/Yzy
 6GTijbB9S5aOoMOMc1srnGrV2V+0Tp5AXZnQMs615aT2vh34o1Vl6Adoxq14Xi97c55L
 7HOw==
X-Gm-Message-State: AOAM532ID16U7Hp+B5N7wgI0yG3QbmZvux+gI6Atyt1mA6vVsCR4dKQH
 dEMQoqHYY2kPdOzEiPw3Asou5U+HdEQXBXi4
X-Google-Smtp-Source: ABdhPJzFZeT9UTPg0iStY9LzqCNXY0l2cXUS3WDZHQBNLaqv/c0gdJeNWtmII4/rddXfcLRLBruy3g==
X-Received: by 2002:a17:90a:46c2:: with SMTP id x2mr832741pjg.15.1610522044052; 
 Tue, 12 Jan 2021 23:14:04 -0800 (PST)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l7sm1361888pjy.29.2021.01.12.23.14.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 23:14:03 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 01/16] target/riscv: reformat @sh format encoding for
 B-extension
Date: Wed, 13 Jan 2021 15:13:33 +0800
Message-Id: <20210113071350.24852-2-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210113071350.24852-1-frank.chang@sifive.com>
References: <20210113071350.24852-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=frank.chang@sifive.com; helo=mail-pj1-x1035.google.com
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


