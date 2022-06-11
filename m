Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B185472D6
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Jun 2022 10:21:52 +0200 (CEST)
Received: from localhost ([::1]:52284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzwNT-0001Yt-89
	for lists+qemu-devel@lfdr.de; Sat, 11 Jun 2022 04:21:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4b-0003K1-BD
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 04:02:23 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:45002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1nzw4W-00020U-Ne
 for qemu-devel@nongnu.org; Sat, 11 Jun 2022 04:02:19 -0400
Received: by mail-pf1-x42f.google.com with SMTP id g205so1354321pfb.11
 for <qemu-devel@nongnu.org>; Sat, 11 Jun 2022 01:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2oLwpPrMWYN5RRtY+zQQjqQ+z/FJrrHNxyengwHfQE=;
 b=l/cpdNAtVVTFq4R7xuLlwjUWaZlcV+l4zMkB8qN1CDbOUItMwEMcv59AaGawibiBH7
 IFt3lpXm309gdLq+l1I0CL1Xi34hOLIYGpdHVWk2s8aZltjpyEEFsja31QEDyJEYlmed
 3JKNQ4FbE8OXg6wK22yHQ2YKznswnrrEzt2ZCSiavgfd4919w/FwzZqW0H5BQuG6dRja
 pXgUTdhu+vGWOObRN0e9cuDEDDPv3BJZJtBwTMQb9nbVEz1W8iclQXyO4+AYzZucA2Nm
 WH9WgFHOBG0yDfOzEAqwoOY57G2MW2EcQnNgIvkZ4YXORlIZqfwIFmO7PfVaWkSkOYIA
 kH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L2oLwpPrMWYN5RRtY+zQQjqQ+z/FJrrHNxyengwHfQE=;
 b=3mUQbzG0IFulCDTDHOoPfYA7HkdbLU2DlnpFhCgll9KzXuThI2iQPiBcCxxfP9SQX3
 bGftm0I9Cp3z8dkWeDv7h/Ery+3JCNRyhIsTAwREP+pg0ckiJmibuHa7n0QuR9HT7b48
 SIUWiZZnzIi60qzFgbgrIOsVNYBE5nLdyjIXu+X5iaBxEur6RJFQxjca4l24OlB0QLYI
 DjlkHmU74lQiUiTXkNFHeNjhP7MOgS5mSEBEB/liZ46J/bSJ0gIzpxVDmTbBcrcfkCXL
 HOvGdRoQphmpY8ivFSgDki4K8bMxn3C3RUX2VNkF/IuZ8F8jbLfHfXnCB5Ayw0G1Z3/Y
 GHKg==
X-Gm-Message-State: AOAM533QPKG8eCborNvQCuj7P5DZdOa5AdciEtQwSuuwIxw71QE0xzR3
 BdL5uADK2UP3hJL7Qw55FN77kg==
X-Google-Smtp-Source: ABdhPJzHbHEpZThRKkNuitVeT9Vxq3/5BlTZYRNWqKEPWjS3lUvMeEWoFgyh9hvLkPxOczblCy22BQ==
X-Received: by 2002:a05:6a00:114e:b0:51b:8ff5:e05a with SMTP id
 b14-20020a056a00114e00b0051b8ff5e05amr49883731pfm.37.1654934523916; 
 Sat, 11 Jun 2022 01:02:03 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([171.61.69.124])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a62c701000000b0050dc762814asm889025pfg.36.2022.06.11.01.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jun 2022 01:02:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 0/4] QEMU RISC-V nested virtualization fixes
Date: Sat, 11 Jun 2022 13:31:03 +0530
Message-Id: <20220611080107.391981-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x42f.google.com
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

These patches can also be found in riscv_nested_fixes_v6 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since v5:
 - Correctly set "Addr. Offset" for misaligned load/store traps in PATCH3
 - Use offsetof() instead of pointer in PATCH4

Changes since v4:
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

 target/riscv/cpu.c        | 154 ++++++++++++++++-----------
 target/riscv/cpu.h        |   3 +
 target/riscv/cpu_bits.h   |   3 +
 target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |   2 +
 target/riscv/instmap.h    |  45 ++++++++
 6 files changed, 356 insertions(+), 65 deletions(-)

-- 
2.34.1


