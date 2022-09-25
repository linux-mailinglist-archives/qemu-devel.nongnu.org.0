Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA165E9236
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 12:59:55 +0200 (CEST)
Received: from localhost ([::1]:45858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocPMY-0003Qf-HF
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 06:59:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPEV-0002D0-Dp
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:35 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:40899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ocPET-0000K3-NX
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 06:51:35 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id m9so2784092qvv.7
 for <qemu-devel@nongnu.org>; Sun, 25 Sep 2022 03:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date;
 bh=DmdeVgpe35Nbf0oUUINRO4c7UXYaA7d6OnzJfSMchAc=;
 b=SliGEwWN+1xPIrZFcbqkUn1RGHxQz2wkDoC2Jh8U4K3NEVgUL4GK+9GqKsPKty7YvZ
 EITot+iGzb1202lXMWyMHxkGxmE7BClFCuk+AZIWoVXGOtwvZTYnxPraA2+/DgahNAfZ
 9xlFht55O02uPPc23Bh6nTk7VRpZ9DJ3c7l1xuAcv7+lgyy4I/lqrACCk9Rsb71+X2bk
 eWtPiHK6EmuZwI+egABy05/O5ElTt/3s5yQ1pPNhZ6IAR8ooI7UDA1AGtBjy8aIQOLk1
 71+YxJhJU4vraag18A3pOxmOPA9khuGJa6Y3XXgvxdP+vuPNoKJNIDin2nLCU4sqfPNT
 7z8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date;
 bh=DmdeVgpe35Nbf0oUUINRO4c7UXYaA7d6OnzJfSMchAc=;
 b=hhWhWb3p8eaouoRTCyaDnWvaL5S0QzjitHNAD7UpsqbyktyOGPxkgsnSquu2uNiB0W
 wcsPoPLv5ReBiXWfUDCY0x+u9uo7myBI9/Jd6FKLg4cYCeKcRZnPy83xCi3wdsGaPNgK
 TbH7blSuErc/WqVoTfFAnB0ROR7vE63eVi5areFR1GauOzAJujfWnNsvZtOhi5+6BOK2
 l3sditdYYCxwgtHVNVg1LlXqvBEwOC0JYbIV8q6DEzvqXMnHWmebJUjjzETnRlD7DdUv
 MgYRphuC+8EuqBCDmpEgZaHUyCcuUxAo3dysMnY3hprhz5/VMg6s8j7VSINFzg5d1AbS
 lbTg==
X-Gm-Message-State: ACrzQf2qeZKIoht+I66A0KugNvVj3LAl58nyOAIavwYBsTGp3S7JFrKU
 h0NjXglpe0m/TpqSq26daDhIU43ACFm87A==
X-Google-Smtp-Source: AMsMyM5qcS85whi2zBaTInftc6hJ/7baC8Woa67+a4BPpy3tS+GJsHe8oQ8ZLQ2b2+Z+yYf1uR8JIQ==
X-Received: by 2002:a05:6214:b6e:b0:4ad:5e20:8cb1 with SMTP id
 ey14-20020a0562140b6e00b004ad5e208cb1mr13640596qvb.31.1664103092449; 
 Sun, 25 Sep 2022 03:51:32 -0700 (PDT)
Received: from stoup.. ([2605:ef80:80a9:5c0e:1ec2:d482:4986:8538])
 by smtp.gmail.com with ESMTPSA id
 u15-20020a05620a0c4f00b006cf19068261sm10061132qki.116.2022.09.25.03.51.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Sep 2022 03:51:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/17] tcg: CPUTLBEntryFull and TARGET_TB_PCREL
Date: Sun, 25 Sep 2022 10:51:07 +0000
Message-Id: <20220925105124.82033-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Smooshing these two patch sets back together for review bandwidth.
I hope to make this the next tcg-next pull.

There are three from the first half, tlbentryfull, which are new.
These are following a hallway conversation with Peter about bits
in MemTxAttrs that are not actually related to memory transactions,
and infrastructure to address a to-do in an Arm patch set.

There are a few patches from the second half, pcrel, that have not
been reviewed. 

  07-target-sparc-Use-tlb_set_page_full.patch
  08-accel-tcg-Move-byte_swap-from-MemTxAttrs-to-CPUTL.patch
  09-accel-tcg-Add-force_aligned-to-CPUTLBEntryFull.patch
  10-accel-tcg-Remove-PageDesc-code_bitmap.patch
  13-accel-tcg-Do-not-align-tb-page_addr-0.patch
  15-accel-tcg-Introduce-tb_pc-and-tb_pc_log.patch
  16-accel-tcg-Introduce-TARGET_TB_PCREL.patch


r~


Richard Henderson (17):
  accel/tcg: Rename CPUIOTLBEntry to CPUTLBEntryFull
  accel/tcg: Drop addr member from SavedIOTLB
  accel/tcg: Suppress auto-invalidate in probe_access_internal
  accel/tcg: Introduce probe_access_full
  accel/tcg: Introduce tlb_set_page_full
  include/exec: Introduce TARGET_PAGE_ENTRY_EXTRA
  target/sparc: Use tlb_set_page_full
  accel/tcg: Move byte_swap from MemTxAttrs to CPUTLBEntryFull
  accel/tcg: Add force_aligned to CPUTLBEntryFull
  accel/tcg: Remove PageDesc code_bitmap
  accel/tcg: Use bool for page_find_alloc
  accel/tcg: Use DisasContextBase in plugin_gen_tb_start
  accel/tcg: Do not align tb->page_addr[0]
  include/hw/core: Create struct CPUJumpCache
  accel/tcg: Introduce tb_pc and tb_pc_log
  accel/tcg: Introduce TARGET_TB_PCREL
  accel/tcg: Split log_cpu_exec into inline and slow path

 include/exec/cpu-all.h                  |   6 +-
 include/exec/cpu-defs.h                 |  54 ++++--
 include/exec/exec-all.h                 |  84 ++++++++-
 include/exec/memattrs.h                 |   2 -
 include/exec/plugin-gen.h               |   7 +-
 include/hw/core/cpu.h                   |  10 +-
 accel/tcg/cpu-exec.c                    | 108 +++++++----
 accel/tcg/cputlb.c                      | 228 ++++++++++++++----------
 accel/tcg/plugin-gen.c                  |  22 +--
 accel/tcg/translate-all.c               | 168 ++++++-----------
 accel/tcg/translator.c                  |   2 +-
 target/arm/cpu.c                        |   4 +-
 target/arm/mte_helper.c                 |  14 +-
 target/arm/sve_helper.c                 |   4 +-
 target/arm/translate-a64.c              |   2 +-
 target/avr/cpu.c                        |   2 +-
 target/hexagon/cpu.c                    |   2 +-
 target/hppa/cpu.c                       |   4 +-
 target/i386/tcg/tcg-cpu.c               |   2 +-
 target/loongarch/cpu.c                  |   2 +-
 target/microblaze/cpu.c                 |   2 +-
 target/mips/tcg/exception.c             |   2 +-
 target/mips/tcg/sysemu/special_helper.c |   2 +-
 target/openrisc/cpu.c                   |   2 +-
 target/riscv/cpu.c                      |   4 +-
 target/rx/cpu.c                         |   2 +-
 target/s390x/tcg/mem_helper.c           |   4 -
 target/sh4/cpu.c                        |   4 +-
 target/sparc/cpu.c                      |   2 +-
 target/sparc/mmu_helper.c               | 123 ++++++-------
 target/tricore/cpu.c                    |   2 +-
 tcg/tcg.c                               |   6 +-
 32 files changed, 501 insertions(+), 381 deletions(-)

-- 
2.34.1


