Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10945FB08C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 12:36:31 +0200 (CEST)
Received: from localhost ([::1]:54762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiCcf-0008Q0-Qh
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 06:36:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTi-0001ji-NH
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiCTc-0004Ep-8H
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 06:27:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665484026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:  content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WN7vyw/Yghj0NMLMlAFEEXC6xzopuV54jhpmsmUPG4g=;
 b=aPcNqFOr1x9wE+nLQkKxMdEZkHnkMUY+7n15ITRz3TR74Bt/JwfJAhy/RQzt2LsT9tXGZE
 GvhSV6z7FGiyBS9ON1dngkx0+t0cgoiw6nu7oZpGj3L7zb4AsG09ZsPG4kxWQgUExsKza5
 nZNLa2/nGU4DwgpfxKTmnO9mU/IPWxA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-apwm2jzIMCiwxuexKcKeuA-1; Tue, 11 Oct 2022 06:27:05 -0400
X-MC-Unique: apwm2jzIMCiwxuexKcKeuA-1
Received: by mail-ej1-f71.google.com with SMTP id
 ga20-20020a1709070c1400b0078db506c555so1944261ejc.6
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 03:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WN7vyw/Yghj0NMLMlAFEEXC6xzopuV54jhpmsmUPG4g=;
 b=p8kvrmF7MRsgo5c7p/4neqoo0mk56VdVzFU+0ZTOloMlmAQA9+MgFXAv3iNwGmE0k3
 WZSB+Mv2HdKi1DgF6UO70DZzldzW7FACft3Uq45g9laXbo92+oX9YV+RyFOOtfeIeivT
 Iq8g2VqS5okGwhmNG6ee3H0rxfl9V3QYezml27bEzcbioR+YfXweofikAumAmqIR8pqC
 Ubxkdfv+Mgk2aRs/Tb/yCqi426E8mbvBidrAH23DTqcwO10TH9ooAEEphQy82/isIHR2
 EJCGJ2gugccVGv8rWU3CLcrArpCjnHqgPlFQTfIigxFwodFyMQZRxZce4XA7Nb0HUx/z
 HW2A==
X-Gm-Message-State: ACrzQf37QKyjXJpgp5Klp3k+7WRTXdwv/KkQDrokSrZFcA8HhZMRL6xZ
 W9qDb5WFAy0ojrlYYGo22qhull79qz6jKOFWImr269Dd8OpQnYeovg9ylnbj/wUxlRoUlGZ0gY3
 2wohH6H3yvSRoI2NAbErObO+3/ElPG34nJIf/QGH1RG9lre63saaFfnEdDctrn93SfBE=
X-Received: by 2002:a17:907:2cf1:b0:78d:c7a1:172d with SMTP id
 hz17-20020a1709072cf100b0078dc7a1172dmr5588096ejc.51.1665484024021; 
 Tue, 11 Oct 2022 03:27:04 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7EqsPDgj0Xs36w0fUXKdP2m573EoTstFU77e+90VJFkwDrnLON+E27ubV1zlMj8tEdW/bRag==
X-Received: by 2002:a17:907:2cf1:b0:78d:c7a1:172d with SMTP id
 hz17-20020a1709072cf100b0078dc7a1172dmr5588064ejc.51.1665484023526; 
 Tue, 11 Oct 2022 03:27:03 -0700 (PDT)
Received: from avogadro.local ([2001:b07:6468:f312:aad8:f393:e009:e014])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a170906a38700b0077b523d309asm6717008ejz.185.2022.10.11.03.27.02
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 03:27:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 00/37] SCSI, i386 patches for 2022-10-11
Date: Tue, 11 Oct 2022 12:26:23 +0200
Message-Id: <20221011102700.319178-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f1d33f55c47dfdaf8daacd618588ad3ae4c452d1:

  Merge tag 'pull-testing-gdbstub-plugins-gitdm-061022-3' of https://github.com/stsquad/qemu into staging (2022-10-06 07:11:56 -0400)

are available in the Git repository at:

  https://gitlab.com/bonzini/qemu.git tags/for-upstream

for you to fetch changes up to 5d2456789ac50b11c2bd560ddf3470fe820bb0ff:

  linux-user: i386/signal: support XSAVE/XRSTOR for signal frame fpstate (2022-10-11 10:27:35 +0200)

----------------------------------------------------------------
* scsi-disk: support setting CD-ROM block size via device options
* target/i386: Implement MSR_CORE_THREAD_COUNT MSR
* target/i386: notify VM exit support
* target/i386: PC-relative translation block support
* target/i386: support for XSAVE state in signal frames (linux-user)

----------------------------------------------------------------
Alexander Graf (3):
      x86: Implement MSR_CORE_THREAD_COUNT MSR
      i386: kvm: Add support for MSR filtering
      KVM: x86: Implement MSR_CORE_THREAD_COUNT MSR

Chenyi Qiang (3):
      i386: kvm: extend kvm_{get, put}_vcpu_events to support pending triple fault
      kvm: expose struct KVMState
      i386: add notify VM exit support

John Millikin (1):
      scsi-disk: support setting CD-ROM block size via device options

Paolo Bonzini (4):
      kvm: allow target-specific accelerator properties
      linux-user: i386/signal: move fpstate at the end of the 32-bit frames
      linux-user: i386/signal: support FXSAVE fpstate on 32-bit emulation
      linux-user: i386/signal: support XSAVE/XRSTOR for signal frame fpstate

Richard Henderson (26):
      target/i386: Remove pc_start
      target/i386: Return bool from disas_insn
      target/i386: Remove cur_eip argument to gen_exception
      target/i386: Remove cur_eip, next_eip arguments to gen_interrupt
      target/i386: Create gen_update_eip_cur
      target/i386: Create gen_update_eip_next
      target/i386: Introduce DISAS_EOB*
      target/i386: Use DISAS_EOB* in gen_movl_seg_T0
      target/i386: Use DISAS_EOB_NEXT
      target/i386: USe DISAS_EOB_ONLY
      target/i386: Create cur_insn_len, cur_insn_len_i32
      target/i386: Remove cur_eip, next_eip arguments to gen_repz*
      target/i386: Introduce DISAS_JUMP
      target/i386: Truncate values for lcall_real to i32
      target/i386: Create eip_next_*
      target/i386: Use DISAS_TOO_MANY to exit after gen_io_start
      target/i386: Create gen_jmp_rel
      target/i386: Use gen_jmp_rel for loop, repz, jecxz insns
      target/i386: Use gen_jmp_rel for gen_jcc
      target/i386: Use gen_jmp_rel for DISAS_TOO_MANY
      target/i386: Remove MemOp argument to gen_op_j*_ecx
      target/i386: Merge gen_jmp_tb and gen_goto_tb into gen_jmp_rel
      target/i386: Create eip_cur_tl
      target/i386: Add cpu_eip
      target/i386: Inline gen_jmp_im
      target/i386: Enable TARGET_TB_PCREL

 accel/kvm/kvm-all.c                  |  78 +---
 hw/scsi/scsi-disk.c                  |   7 +-
 include/sysemu/kvm.h                 |   2 +
 include/sysemu/kvm_int.h             |  76 ++++
 linux-user/i386/signal.c             | 231 +++++++---
 qapi/run-state.json                  |  17 +
 qemu-options.hx                      |  11 +
 target/arm/kvm.c                     |   4 +
 target/i386/cpu-param.h              |   4 +
 target/i386/cpu.c                    |   3 +-
 target/i386/cpu.h                    |   4 +
 target/i386/helper.h                 |   2 +-
 target/i386/kvm/kvm.c                | 266 +++++++++++
 target/i386/kvm/kvm_i386.h           |  11 +
 target/i386/machine.c                |  20 +
 target/i386/tcg/fpu_helper.c         |  64 +--
 target/i386/tcg/seg_helper.c         |   6 +-
 target/i386/tcg/sysemu/misc_helper.c |   5 +
 target/i386/tcg/tcg-cpu.c            |   8 +-
 target/i386/tcg/translate.c          | 830 ++++++++++++++++++-----------------
 target/mips/kvm.c                    |   4 +
 target/ppc/kvm.c                     |   4 +
 target/riscv/kvm.c                   |   4 +
 target/s390x/kvm/kvm.c               |   4 +
 24 files changed, 1102 insertions(+), 563 deletions(-)
-- 
2.37.3


