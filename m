Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E9A36CE75
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 00:11:51 +0200 (CEST)
Received: from localhost ([::1]:57656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbVvq-0002Uo-GE
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 18:11:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqe-0006Ch-3s; Tue, 27 Apr 2021 18:06:28 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <baturo.alexey@gmail.com>)
 id 1lbVqb-0002fm-Ut; Tue, 27 Apr 2021 18:06:27 -0400
Received: by mail-ej1-x629.google.com with SMTP id r12so91622726ejr.5;
 Tue, 27 Apr 2021 15:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SXP9miMv/3P0p9dhuQ8Wt5/vziVZEbG3jXWL4Jn1kY=;
 b=Ptq4m5BWBqik8E4zFQ7WE4fAy2x3blDmeJO7qQtmdtNnN6FMk0xrzVQFVyRH4YOU4e
 mZEdR/erXS57VTfkS52Z0H8UDNBB47k4RW/jBr/9YzZ1y+ednnshAKYyeNup+ddukiUn
 JX2I0nNHir2aQAYdFvH9AXQ9eTZDZvz0bHelxnV9w4Wx9W37eLkue3+dM5PRGTfzziK8
 CKvh6gIiU1mf/qdVAYUYiZvE8M6JghYOEFj2XMddAFR+VDJR7FKxArTcTAfeVnQyO5p0
 zzArKQw3XsThR8irXhmivecOkzsJ6TszLpL5377TxyUP5OEq2/oxPtHIdDI7qvOt5ZcZ
 yZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1SXP9miMv/3P0p9dhuQ8Wt5/vziVZEbG3jXWL4Jn1kY=;
 b=FpeE0aI67OZXdjpjfcjeZagZ9qTBsVdI9QyhUd4raJzW9VVjSbOolrt+5ILUSBJNzz
 NY9iFYslOYm9fHqDf8VTlwVPwItbo+P6SX4fr8CyBPAOuDCWY1EWM24KrM+g8IGn3vfq
 p20P89WhOdJui9kZJ/ivvuUwGqdNlddJStxOxswbMmI+vRh8wxiZYmXjr/MNhaj8613p
 DcFA/I1Wt+RXYwQo2+KtBp82m+SCDV429GpG3PZOujQNxXRHb/sz3d5Yf8jPFQiJE8VK
 LBASS6reytx6ho+uQSwgF10z7Meckyr096WrrXr4Rk9e1Ti56JXCbsrsd/I98440In2+
 zMJQ==
X-Gm-Message-State: AOAM532znEk4B5MUN9jhzBMr+ZyW5WykMRtXYAUmd53GR2UQePWkAZJg
 uG+2CXLVwb2Lz0Ln+oQIVGA=
X-Google-Smtp-Source: ABdhPJzkIhyOV6OdwzYWhEXEn1gfkkJiyeu90vZ4Q2haJxCs90XzCjb9Qx8ndnYDQRymlL2M60Tr0g==
X-Received: by 2002:a17:907:2151:: with SMTP id
 rk17mr25434818ejb.203.1619561181285; 
 Tue, 27 Apr 2021 15:06:21 -0700 (PDT)
Received: from neptune.lab ([46.39.228.82])
 by smtp.googlemail.com with ESMTPSA id r10sm640049ejd.112.2021.04.27.15.06.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 15:06:20 -0700 (PDT)
From: Alexey Baturo <baturo.alexey@gmail.com>
X-Google-Original-From: Alexey Baturo <space.monkey.delivers@gmail.com>
To: 
Subject: [PATCH v8 0/6] RISC-V Pointer Masking implementation
Date: Wed, 28 Apr 2021 01:06:09 +0300
Message-Id: <20210427220615.12763-1-space.monkey.delivers@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=baturo.alexey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: baturo.alexey@gmail.com, qemu-riscv@nongnu.org, sagark@eecs.berkeley.edu,
 kbastian@mail.uni-paderborn.de, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, space.monkey.delivers@gmail.com,
 Alistair.Francis@wdc.com, kupokupokupopo@gmail.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v8:
Hi folks,

Finally we were able to assign v0.1 draft for Pointer Masking extension for RISC-V: https://github.com/riscv/riscv-j-extension/blob/master/pointer-masking-proposal.adoc
This is supposed to be the first series of patches with initial support for PM. It obviously misses support for hypervisor mode, vector load/stores and some other features, while using temporary csr numbers(they're to be assigned by the committee a bit later).
With this patch series we were able to run a bunch of tests with HWASAN checks enabled.

I hope I've managed to addressed @Alistair's previous comments in this version.

Thanks!

v7:
Hi folks,

Sorry it took me almost 3 month to provide the reply and fixes: it was a really busy EOY.
This series contains fixed @Alistair suggestion on enabling J-ext.

As for @Richard comments:
- Indeed I've missed appending review-by to the approved commits. Now I've restored them except for the fourth commit. @Richard could you please tell if you think it's still ok to commit it as is, or should I support masking mem ops for RVV first?
- These patches don't have any support for load/store masking for RVV and RVH extensions, so no support for special load/store for Hypervisor in particular.

If this patch series would be accepted, I think my further attention would be to:
- Support pm for memory operations for RVV
- Add proper csr and support pm for memory operations for Hypervisor mode
- Support address wrapping on unaligned accesses as @Richard mentioned previously

Thanks!

Alexey Baturo (5):
  [RISCV_PM] Add J-extension into RISC-V
  [RISCV_PM] Support CSRs required for RISC-V PM extension except for
    the h-mode
  [RISCV_PM] Print new PM CSRs in QEMU logs
  [RISCV_PM] Support pointer masking for RISC-V for i/c/f/d/a types of
    instructions
  [RISCV_PM] Allow experimental J-ext to be turned on

Anatoly Parshintsev (1):
  [RISCV_PM] Implement address masking functions required for RISC-V
    Pointer Masking extension

 target/riscv/cpu.c                      |  32 ++++
 target/riscv/cpu.h                      |  34 ++++
 target/riscv/cpu_bits.h                 |  66 +++++++
 target/riscv/csr.c                      | 236 ++++++++++++++++++++++++
 target/riscv/insn_trans/trans_rva.c.inc |   3 +
 target/riscv/insn_trans/trans_rvd.c.inc |   2 +
 target/riscv/insn_trans/trans_rvf.c.inc |   2 +
 target/riscv/insn_trans/trans_rvi.c.inc |   2 +
 target/riscv/translate.c                |  42 +++++
 9 files changed, 419 insertions(+)

-- 
2.20.1


