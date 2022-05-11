Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A535E52361E
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 16:49:16 +0200 (CEST)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noneN-0004l0-6K
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 10:49:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbg-0001yp-1r
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:29 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:47089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nonbe-0001AS-86
 for qemu-devel@nongnu.org; Wed, 11 May 2022 10:46:27 -0400
Received: by mail-pg1-x533.google.com with SMTP id l11so1966969pgt.13
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 07:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Enoc3V9LSI02yYB4by7fwgJWxViZ8eSA+90wDYTpsOo=;
 b=nOTKSPA+earambedkjAryV1n7GQWT8hOT7jXQz+VwfTaNjmXQ6wziQEd7wvvxKbHR0
 US0110FtusXnnIKdknVglnxjtqbzxa9GDB55qqviN16iIrdlJI90K/2/bZZHPSj0u/QX
 IPFVDLAUxRqTi/yPif7K/5h2xuVbt5u2gWn/XrIRgUV+XwmnvBuKeIsciir8HpRC81wT
 dKjF2vq3YtwbxQ2pDpvVjXRroLsSFVy6OUxpk4F2AlzjTtjrrlj52gtaZV6uUju8gT0i
 uIt+7xFKcYNw/1Y848EYf/ufZVRVtiXDom6PSc5VG5Z6COEOFaUFNpPbao0ZdGOwj9Bf
 IQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Enoc3V9LSI02yYB4by7fwgJWxViZ8eSA+90wDYTpsOo=;
 b=iPK7SOECxBtZDDlNdzBa3HXoVmEdmjvwQMq4tO2s3xdaja6/dW6QV6n09p8+n+76Ky
 1oHCOR6dt1WsLC0WcLWcxc4WiT3BPAuWGlDTzwt4DRINvfUn0QG/COQ3Agwd1AS3x62a
 jQqj4ClpYmxbKUEqQWEU+U2HpNAjetzzSkJfiiVEKEhOfs+jjw/tNp8g+s6DZp0BZmPC
 cPiv2ccom51YYUnRIrpHEGhWFdycF1wHBbrMtvP3BO+A0jOknGYYNHA/GGObOow+ywLP
 200uYGJ4W5/v4X+tcJufeE8LP9frYr2D/Fn9tNdwzrRc3RdgCGpRtcY7fJioDR1WqfdO
 1a2g==
X-Gm-Message-State: AOAM531CTTqDp5a//AQZxju+8OQQSdsOdRDiZE+uI01q9yTnR9GJ6Gqr
 P1yMPZVNEbmI8X70AvLNYfpoZg==
X-Google-Smtp-Source: ABdhPJwGh9j5H+AeEh2jpry8m5+ZglmDmijD8MHGF1sTyNlf0ly719dw1lmOJdvGsuIGQYI78bBy0Q==
X-Received: by 2002:a65:6a4c:0:b0:39c:f169:b54a with SMTP id
 o12-20020a656a4c000000b0039cf169b54amr21372913pgu.384.1652280383384; 
 Wed, 11 May 2022 07:46:23 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.76.113.90])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a170902820200b0015eafc485c8sm1958726pln.289.2022.05.11.07.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 07:46:22 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 0/8] QEMU RISC-V nested virtualization fixes
Date: Wed, 11 May 2022 20:15:20 +0530
Message-Id: <20220511144528.393530-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=apatel@ventanamicro.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This series does fixes and improvements to have nested virtualization
on QEMU RISC-V.

These patches can also be found in riscv_nested_fixes_v2 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since v1:
 - Set write_gva to env->two_stage_lookup which ensures that for
   HS-mode to HS-mode trap write_gva is true only for HLV/HSV
   instructions
 - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
   patches in this series for easy review
 - Re-worked PATCH7 to force disable extensions if required
   priv spec version is not staisfied
 - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine

Anup Patel (8):
  target/riscv: Fix csr number based privilege checking
  target/riscv: Fix hstatus.GVA bit setting for traps taken from HS-mode
  target/riscv: Set [m|s]tval for both illegal and virtual instruction
    traps
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Force disable extensions if priv spec version does not
    match
  hw/riscv: virt: Fix interrupt parent for dynamic platform devices

 hw/riscv/virt.c           |  25 +++---
 target/riscv/cpu.c        |  46 +++++++++-
 target/riscv/cpu.h        |   8 +-
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 172 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |  10 ++-
 target/riscv/instmap.h    |  41 +++++++++
 target/riscv/translate.c  |  17 +++-
 8 files changed, 292 insertions(+), 30 deletions(-)

-- 
2.34.1


