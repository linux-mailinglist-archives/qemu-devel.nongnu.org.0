Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A91544201
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 05:34:18 +0200 (CEST)
Received: from localhost ([::1]:47072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8w5-0005a3-U9
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 23:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8t6-0002aJ-WE
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:13 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nz8t4-0006fj-BJ
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 23:31:12 -0400
Received: by mail-pl1-x631.google.com with SMTP id d13so3592920plh.13
 for <qemu-devel@nongnu.org>; Wed, 08 Jun 2022 20:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXQhQ2o19G7pZvW7CPE6FiefuRjETdhvKk2mYZyEpxM=;
 b=J230iWGD2h94NVu5aMbj/DPgRBG6lRLYsuTWt91OzjaEEU4fwyeQmT6qZ/qTuQk5g9
 H1PYBIa19nplbU7Dr8DR31LgDq+HhqzKipveM8OmvBiKeA9MVQ8K/vo04DTF1uKqXPtt
 UCFkoBaBpjUyJO28Q6N8RFSHwfLtvuIiMIVot/fl7+0AgHUyrn+vv8yD0fddl2Wk0tI2
 Al7zoT6H2+jGJpovwtxFNj/dmx1vkphC9MXZO9ZixnPZJFcZnt4IvjX0uGEluBFrAT1W
 6WK3r86sZZ/aDh57pD181db7O7uOnkf7fV2X5Eq+NoGshaUDM+ks64dZDMJ4w7iiZtq/
 vGVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EXQhQ2o19G7pZvW7CPE6FiefuRjETdhvKk2mYZyEpxM=;
 b=XVkVxd0KA4VAI+ezy6sBPeNFsq2VnBqdOPDjro1mI9V7HnvyPfTsGb3jnqqfdr2Ie/
 bjwoualuXkbIuJSmIG5ul6xR0rSGwHeiUkwzB3gGGVRjNrG5exllMqxAYO3xeLYcf21N
 oKgYX3gFWL8KBFZfA7/QYIfxLGyCduAO0n9the+qVjvlW/Up7ZTvQjtdIXO5v2YceZuh
 0RiQh1PmxXBSBCF2yM40lgWLVf65Rt1WSjlfXcuylqzlhB8dZVBhbzL/i7nWSjOA+qZt
 CGjM/aymxBoApMwtzwO+RHqAJn3URLl29nsYmztBZAqu34TUfbdCT4zJ6BGH0cbbWyJB
 oAFQ==
X-Gm-Message-State: AOAM530ormxGoEaTD/P04WEY64DNtHLCHtB8KPx6e+3N+ONlGkzxRokE
 CPTVSl9WwrrzOojws/+G0dnRHg==
X-Google-Smtp-Source: ABdhPJxQbm/eIJupql6OkILm8UYIbxKATLh2EcRC7ynVIytuuG5oRDoS7NjVYDkRCqCVj0grlQ9M7Q==
X-Received: by 2002:a17:90b:2404:b0:1e3:4db0:f32a with SMTP id
 nr4-20020a17090b240400b001e34db0f32amr1249940pjb.201.1654745468589; 
 Wed, 08 Jun 2022 20:31:08 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([122.182.198.228])
 by smtp.gmail.com with ESMTPSA id
 ei13-20020a17090ae54d00b001e31c7aad6fsm15053964pjb.20.2022.06.08.20.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 20:31:08 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v5 0/4] QEMU RISC-V nested virtualization fixes
Date: Thu,  9 Jun 2022 09:00:07 +0530
Message-Id: <20220609033011.752714-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=apatel@ventanamicro.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These patches can also be found in riscv_nested_fixes_v5 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since 4:
 - Updated commit description in PATCH1, PATCH2, and PATCH4
 - Use "const" for local array in PATCH5

Changes since v3:
 - Updated PATCH3 to set special pseudoinstructions in htinst for
   guest page faults which result due to VS-stage page table walks
 - Updated warning message in PATCH4

Changes since v2:
 - Dropped the patch which are already in Alistair's next branch
 - Set "Addr. Offset" in the transformed instruction for PATCH3
 - Print warning in riscv_cpu_realize() if we are disabling an
   extension due to privilege spec verions mismatch for PATCH4

Changes since v1:
 - Set write_gva to env->two_stage_lookup which ensures that for
   HS-mode to HS-mode trap write_gva is true only for HLV/HSV
   instructions
 - Included "[PATCH 0/3] QEMU RISC-V priv spec version fixes"
   patches in this series for easy review
 - Re-worked PATCH7 to force disable extensions if required
   priv spec version is not staisfied
 - Added new PATCH8 to fix "aia=aplic-imsic" mode of virt machine

Anup Patel (4):
  target/riscv: Don't force update priv spec version to latest
  target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11 or
    higher
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Force disable extensions if priv spec version does not
    match

 target/riscv/cpu.c        |  65 +++++++++--
 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 231 +++++++++++++++++++++++++++++++++++++-
 target/riscv/csr.c        |   2 +
 target/riscv/instmap.h    |  43 +++++++
 6 files changed, 333 insertions(+), 14 deletions(-)

-- 
2.34.1


