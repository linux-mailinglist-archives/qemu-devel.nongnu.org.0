Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF5555BE55
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 07:08:50 +0200 (CEST)
Received: from localhost ([::1]:59956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o63Sz-0001fY-Dd
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 01:08:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631n-0005UW-J8
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:43 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:36582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <apatel@ventanamicro.com>)
 id 1o631l-0006Ud-VS
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:40:43 -0400
Received: by mail-pf1-x429.google.com with SMTP id x138so8244785pfc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9hgwU+rGkNoTu1v/vMzAIrmKXBdQdS/j+S6mjlnDsM=;
 b=hEEUv6v4WiebZHpAMlG7BC/Vaxkm5NmSPJ75wpSjm3qj/TToQB92D0xtQaSSJ2n4Zp
 rHJ1lF7nukpGdSwYNk3iN+NeWF9nOLhHvAt57/u24sZoiy/lBXs7wkhyaTAI3vTYNWWI
 h03hMDCJIXCPErq8BiYp10DjlyHzu2J3c1TI30BtouPzDLnFU9U/Vjj3Zy/ryNYhBN/6
 vlWnTLeC6FBV6d7avP8zl6axnS3yZBVlat4hNhtxqxeJON+TZkCQsLIkSInEW4lVYvOn
 idsKdjDWzIgO8lMPRGVRLTLEK2xLUG1aMgT7ufmWG6MxYYqSPemq0fgR+l0HWp4qIhUB
 zOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f9hgwU+rGkNoTu1v/vMzAIrmKXBdQdS/j+S6mjlnDsM=;
 b=NCqdzQXY5hVwLZMfYdvlOrByCeFNnsdI2r5QmVhtWtf5ISlEOol26LA1QaKQq815W1
 R3ctBZ1SJmn1orcQxpKlhtMzeqpKmn+Tz8jOOwlhSWD9Rqlp2zgWh9461fPKFAT05naw
 9rS4eeYL35C6K9AMHcYtjaTNL8VQ/2V9zPmml5mGiTekTGH+PSTS21uHvzIC9trlnMQg
 BRXEmBkpiN5gfp5ueOYI9fuT7UaFkLZFG54xhXWhC7R3HMcd5hEZItIyqd4tvAlN/IWb
 HzxIhM2qU86FrVqiNHL6cHlZqXzvW6nxeSa8YCPqEFctm4I96JndnIidQEJ1UfiSiDYC
 y1BQ==
X-Gm-Message-State: AJIora/VHjWz7Visq9xkAI2Xmi1uj3fwJX0T2lYzO9Kud5Je+f+xXlkY
 nGrsrF+IEbW/aAcr1iX3Q75cdA==
X-Google-Smtp-Source: AGRyM1vFdce5DQrMECE/92Gcva5dkQDa/67sSwRwnrb5DRuLkdvPo1A4T0PuTABYyLOrUbWOTHty3Q==
X-Received: by 2002:a05:6a00:18a4:b0:525:532e:76de with SMTP id
 x36-20020a056a0018a400b00525532e76demr2755284pfh.18.1656391240016; 
 Mon, 27 Jun 2022 21:40:40 -0700 (PDT)
Received: from anup-ubuntu64-vm.. ([117.96.230.192])
 by smtp.gmail.com with ESMTPSA id
 q62-20020a17090a17c400b001ece6f492easm10284001pja.44.2022.06.27.21.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:40:39 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v7 0/4] QEMU RISC-V nested virtualization fixes
Date: Tue, 28 Jun 2022 10:10:24 +0530
Message-Id: <20220628044028.659704-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=apatel@ventanamicro.com; helo=mail-pf1-x429.google.com
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

These patches can also be found in riscv_nested_fixes_v7 branch at:
https://github.com/avpatel/qemu.git

The RISC-V nested virtualization was tested on QEMU RISC-V using
Xvisor RISC-V which has required hypervisor support to run another
hypervisor as Guest/VM.

Changes since v6:
 - Droppred original PATCH1 and PATCH2 since these are already merged
 - Added PATCH1 to revert dummy mcountinhibit CSR
 - Added PATCH2 to fix minimum priv spec version for mcountinhibit CSR
 - Fixed checkpatch error in PATCH3
 - Fixed compile error in PATCH4

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
  Revert "target/riscv: Add dummy mcountinhibit CSR for priv spec v1.11
    or higher"
  target/riscv: Set minumum priv spec version for mcountinhibit
  target/riscv: Update [m|h]tinst CSR in riscv_cpu_do_interrupt()
  target/riscv: Force disable extensions if priv spec version does not
    match

 target/riscv/cpu.c        | 150 ++++++++++++++++----------
 target/riscv/cpu.h        |   5 +
 target/riscv/cpu_bits.h   |   3 -
 target/riscv/cpu_helper.c | 214 ++++++++++++++++++++++++++++++++++++--
 target/riscv/csr.c        |   4 +-
 target/riscv/instmap.h    |  45 ++++++++
 6 files changed, 353 insertions(+), 68 deletions(-)

-- 
2.34.1


