Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96816A982D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 14:14:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY5E9-0004X9-40; Fri, 03 Mar 2023 08:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5E6-0004Wn-8r
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:13:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pY5E4-00088j-9E
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 08:13:34 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso3929149wmb.0
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 05:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1677849210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d+E5fIwwLgOGmgtCTsCyP1FkaIZElxDHFJYcbVZDsgk=;
 b=HRmnythN3s3jKCamVLeOpUGzF3Ckiv968U013n2cill4dSshkmLfBWnm8bnz81/gcy
 eJb5PIinZ3Xc21UcEtkJgf88PBq6z1TeeCGp6d5D5qCZeX2qEVwERP6NvAuGmpY7+NdW
 4JkT+HcK4wC5COADxm1jprsv3m2utdNztPnm+BXprSqxggXNdiRX/54XC8OzNcFUJy7S
 X9W/cjlwBR27pk17bvY6fzUAt9KqBigkF0522l7ysYdbWWKfp+GXFy6hDnRqfeezwGeb
 fX+Wb36nAVKrAD6UiRt21GA/WfaJ305c22auInUYGQ9vo+dK1y153Ll8kDCMHQST0Lir
 iTWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677849210;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d+E5fIwwLgOGmgtCTsCyP1FkaIZElxDHFJYcbVZDsgk=;
 b=KdZdCpCQBUArzPtNhb6wSXeYIJ+OFQLtZV48GaWr1EIVR0hTmU3TExk6xtCa3vUx++
 Zw92HAEBMku2mI4DJkghdglwLgESGfKPu57U+YKN+TIIGCIjEOZh4J0sKifSF5bzJd9Q
 ptGIyCF6wJ44UiYn+LuYD+1Aa36rrziGNMKqkH1/JqMszFTrCHgDn3Wzum6vpUfl50CE
 GDclpOOS0/msJMwMViSHi5ftguFtfZpN9U7c0xivpvMT/FyNAu8mUoajmVYg1K0wB+I1
 9UZhdW02Rm5zgFMOL0no7PeGRCe7akikBqo/1gnIUXCiX097WJYPpoKiF9HdzwNpStb2
 n9Jg==
X-Gm-Message-State: AO0yUKVP82rOBkt3qo/We2aWndC8nfcvcf2tUWxfsnVFVyflPD5id0Jr
 3oTTCK/25tYf8p7iJ5yplHThkg==
X-Google-Smtp-Source: AK7set+F+XuwugAvO+j/3gsigWDLR79jIyWY0lQkUVFUCy+Wpj1eX058OXwkLUlj5Uwe5NJEX6bmDg==
X-Received: by 2002:a7b:cc10:0:b0:3eb:3104:efef with SMTP id
 f16-20020a7bcc10000000b003eb3104efefmr1536296wmh.31.1677849210399; 
 Fri, 03 Mar 2023 05:13:30 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com
 (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
 by smtp.gmail.com with ESMTPSA id
 f2-20020adfdb42000000b002c54fb024b2sm2150961wrj.61.2023.03.03.05.13.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 05:13:30 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v11 0/5] riscv: Allow user to set the satp mode
Date: Fri,  3 Mar 2023 14:12:47 +0100
Message-Id: <20230303131252.892893-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This introduces new properties to allow the user to set the satp mode,
see patch 3 for full syntax. In addition, it prevents cpus to boot in a
satp mode they do not support (see patch 4).

base-commit: commit c61d1a066cb6 ("Merge tag 'for-upstream' of
https://gitlab.com/bonzini/qemu into staging")

v11:
- rebase on top of master
- Added RB/AB from Frank and Alistair
- Use VM_1_10_XX directly instead of satp_mode_from_str, from Frank
- Set satp mode max for thead c906 to sv39

v10:
- Fix user mode build by surrounding satp handling with #ifndef
  CONFIG_USER_ONLY, Frank
- Fix AB/RB from Frank and Alistair

v9:
- Move valid_vm[i] up, Andrew
- Fixed expansion of the bitmap map, Bin
- Rename set_satp_mode_default into set_satp_mode_default_map, Bin
- Remove outer parenthesis and alignment, Bin
- Fix qemu32 build failure, Bin
- Fixed a few typos, Bin
- Add RB from Andrew and Bin

v8:
- Remove useless !map check, Andrew
- Add RB from Andrew

v7:
- Expand map to contain all valid modes, Andrew
- Fix commit log for patch 3, Andrew
- Remove is_32_bit argument from set_satp_mode_default, Andrew
- Move and fixed comment, Andrew
- Fix satp_mode_map_max in riscv_cpu_satp_mode_finalize which was set
  too early, Alex
- Remove is_32_bit argument from set_satp_mode_max_supported, Andrew
- Use satp_mode directly instead of a string in
  set_satp_mode_max_supported, Andrew
- Swap the patch introducing supported bitmap and the patch that sets
  sv57 in the dt, Andrew
- Add various RB from Andrew and Alistair, thanks

v6:
- Remove the valid_vm check in validate_vm and add it to the finalize function
  so that map already contains the constraint, Alex
- Add forgotten mbare to satp_mode_from_str, Alex
- Move satp mode properties handling to riscv_cpu_satp_mode_finalize, Andrew
- Only add satp mode properties corresponding to the cpu, and then remove the
  check against valid_vm_1_10_32/64 in riscv_cpu_satp_mode_finalize,
  Andrew/Alistair/Alex
- Move mmu-type setting to its own patch, Andrew
- patch 5 is new and is a fix, Alex

v5:
- Simplify v4 implementation by leveraging valid_vm_1_10_32/64, as
  suggested by Andrew
- Split the v4 patch into 2 patches as suggested by Andrew
- Lot of other minor corrections, from Andrew
- Set the satp mode N by disabling the satp mode N + 1
- Add a helper to set satp mode from a string, as suggested by Frank

v4:
- Use custom boolean properties instead of OnOffAuto properties, based
  on ARMVQMap, as suggested by Andrew

v3:
- Free sv_name as pointed by Bin
- Replace satp-mode with boolean properties as suggested by Andrew
- Removed RB from Atish as the patch considerably changed

v2:
- Use error_setg + return as suggested by Alistair
- Add RB from Atish
- Fixed checkpatch issues missed in v1
- Replaced Ludovic email address with the rivos one

Alexandre Ghiti (5):
  riscv: Pass Object to register_cpu_props instead of DeviceState
  riscv: Change type of valid_vm_1_10_[32|64] to bool
  riscv: Allow user to set the satp mode
  riscv: Introduce satp mode hw capabilities
  riscv: Correctly set the device-tree entry 'mmu-type'

 hw/riscv/virt.c    |  19 +--
 target/riscv/cpu.c | 288 ++++++++++++++++++++++++++++++++++++++++++---
 target/riscv/cpu.h |  25 ++++
 target/riscv/csr.c |  29 +++--
 4 files changed, 323 insertions(+), 38 deletions(-)

-- 
2.37.2


