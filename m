Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0722F67B6C6
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 17:20:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKiVZ-0000Yu-GK; Wed, 25 Jan 2023 11:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiVU-0000Y4-P5
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:20:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alexghiti@rivosinc.com>)
 id 1pKiVS-0002jO-C7
 for qemu-devel@nongnu.org; Wed, 25 Jan 2023 11:20:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id bk16so17584675wrb.11
 for <qemu-devel@nongnu.org>; Wed, 25 Jan 2023 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rde7W1nN83rbwZUfRDgP2anYxpLp1ez3smEnDmIEAGY=;
 b=2caxMVqaV4mnnQ9f5Gx9oGqDF98boRiJDJY4HGDrrxC0jHluw7uZS5/fej/kitDnHe
 jBNqD2BlI1ZQ/PW16O8Tcbd2Baz+RZlGkRDDCVoggy8MsYaWaGLYXHn6eolIhvX7TeAR
 gOoMgEJpwRSVVeiUM6t1Ht1WRb8AqTfshh18xvsEtns9zJI1H89Jfm9AenCPuZfhH1Kp
 Uy0xKUwue3L0lFQ5AP+eMSMIsstITFEvApLQhQzF/m4juq6iPCQ0d8JRT1QJMUtmR4v8
 RPC6S0Q6iEzpeHsb0lggB+cfYUggKJ9SngFVzSIkSAcAfLMRmkNunGm+6FNiVh7yzGSD
 PpAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rde7W1nN83rbwZUfRDgP2anYxpLp1ez3smEnDmIEAGY=;
 b=K9e6Bb1bJtYhjVVpQQCvDQstdSHDAKyLs0mDb4NGFgFrMIgrWG9nk4O7eH/eaXvepA
 wmJwTnvhMLndLiXqlaP1wkJatpZRqH7fCaTleSa1oM6XhP8PPyjU8IkPMWFFiOJVYesf
 qaTTK5OjA958ustEdAsoJrS+/ebuVIrEj9h7VYE0RoS3gxkF9HmXrDToqJKIztEdbE9s
 D4gRtdJIavyGZ7KZgW1y8CA9uofOn0j71wp9Qkzq6kIJ5oW4JxLk+nw12Lleqy+1NSAS
 MeALwKgLNvqWPZfYB9k+VhPOX5trvUzEh5AdiKq/JhPn85ALuZQRy6LRa+jXir1qQutm
 9AZg==
X-Gm-Message-State: AFqh2kq322Y/PmW8UZpIlnUcuYP1a3hZo310ZhCg7AQit2pJtPF/qJF9
 inIhYVs3bQ1eNZn/LnTpjGVARA==
X-Google-Smtp-Source: AMrXdXvZZqYJANtmbIzuB2feIdKsDe2bClWey8tBXwzxIENcF25Fe72WbL45w9vyr44wNY5ZRcUqzw==
X-Received: by 2002:adf:a38d:0:b0:2bf:9527:ce62 with SMTP id
 l13-20020adfa38d000000b002bf9527ce62mr14104802wrb.60.1674663612167; 
 Wed, 25 Jan 2023 08:20:12 -0800 (PST)
Received: from alex-rivos.home (lfbn-lyo-1-450-160.w2-7.abo.wanadoo.fr.
 [2.7.42.160]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600012cc00b002bfba730b0fsm1895458wrx.65.2023.01.25.08.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 08:20:11 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Andrew Jones <ajones@ventanamicro.com>,
 Frank Chang <frank.chang@sifive.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v8 0/5] riscv: Allow user to set the satp mode
Date: Wed, 25 Jan 2023 17:20:05 +0100
Message-Id: <20230125162010.1615787-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alexghiti@rivosinc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

 hw/riscv/virt.c    |  19 ++--
 target/riscv/cpu.c | 247 +++++++++++++++++++++++++++++++++++++++++++--
 target/riscv/cpu.h |  23 +++++
 target/riscv/csr.c |  29 +++---
 4 files changed, 287 insertions(+), 31 deletions(-)

-- 
2.37.2


