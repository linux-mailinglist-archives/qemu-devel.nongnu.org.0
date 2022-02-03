Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85834A8F5E
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:49:11 +0100 (CET)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFj2U-0006L0-SD
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:49:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhw1-00045I-JY
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:25 -0500
Received: from [2607:f8b0:4864:20::42d] (port=44690
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhvz-0005qu-2C
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:25 -0500
Received: by mail-pf1-x42d.google.com with SMTP id n32so3059355pfv.11
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9tSzMtYT/Vhj3BbOr/PyLX3cmBBZ/u8xMQDD46l+2gQ=;
 b=HwBNTxrXJ4gp/YOlhVrY2ce5DUTbHVc8buOZIkWI0Jt1ksLeKTltInQ+TflQYq37Hq
 gf8IAJiMO+GR92iDVZXMEFQ3VzqyRAcfoe1pLoe+SnrLz2DrJZH8vg6QHM+vGuavKoxX
 m27smLbmvOT4chekjRxc3Q6mICY37LtUkFxT+BNlE88eBldPhCZFNQQGoo5wCSrnxoMl
 g8juPuZa359h9lX+ebPknj16XvIfrFVe33ialzWMKARM8W6JaLPw38fwAGawWVqWFHgJ
 szf6H23FrqHvFvMSvkKcn8gx1JVm0aKNqEsowglGPAgYw31ZRslaZBHWWBPDrvjAh9db
 cacA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9tSzMtYT/Vhj3BbOr/PyLX3cmBBZ/u8xMQDD46l+2gQ=;
 b=5plLCZdUfFCJjJQbMNk4OjtA2S7BKLZJrkebSL7+Whi5nrNKQqW2+b2hkR5u5sEiyT
 UyYD6u4cLjfLzjmHbAeyanpNT6RI0dw/kidILCK2uKA22oUiNkCWwkawYI0l4x0riGCp
 h335zpK2RasPX4N3zcOWFcpqPT1anfjzV6pRg92RUbxTj45BhHqC7XknARDXVKRskGga
 hScRB1RywI83kugOH1NO2pZRBVKusYVvqUY5LtlfAjwlAvT6PRuhwd4XprpFRQiSxNHh
 41HvFlQ/t2bek/0uou1kyWABVCUMOpJAMeWcioWGDBb2X4AmBzUNBPTYKY3o3POa0YCP
 EODA==
X-Gm-Message-State: AOAM532muXgpHeiWU94PzfwlSgSgR8jmZRvOsTs5UQRQBejHFVbL9rbt
 dVvaCxkylYk4tKSEkXVbuV/Q1glgIzc=
X-Google-Smtp-Source: ABdhPJw09Gn0mI+r6Cl7FsBGLn6HfvRU4VSBgWq1YOU1Qv6NyHTMTa9TrlctmCrS3C/HkSa9UoL8wA==
X-Received: by 2002:a62:cd8f:: with SMTP id o137mr35579104pfg.64.1643917089343; 
 Thu, 03 Feb 2022 11:38:09 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t2sm27025295pfg.207.2022.02.03.11.38.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:08 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 00/10] exec: Remove 'qemu/log.h' from 'exec-all.h'
Date: Thu,  3 Feb 2022 20:37:53 +0100
Message-Id: <20220203193803.45671-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

Yet another noisy/boring refactor, but it will allow us to better
split exec/ includes as being target-agnostic/specific (the next
series).

Based-on: <20220203191814.45023-1-f4bug@amsat.org>
"softmmu: Make various objects target agnostic"

Philippe Mathieu-Daudé (10):
  hw/tpm: Clean includes
  hw/remote: Add missing include
  hw/s390x/virtio: Add missing 'cpu.h' include
  hw/acpi/memory_hotplug: Remove unused 'hw/acpi/pc-hotplug.h' header
  qtest: Add missing 'hw/qdev-core.h' include
  exec/ramblock: Add missing includes
  core/ptimers: Remove unnecessary 'sysemu/cpus.h' include
  target: Add missing "qemu/timer.h" include
  linux-user: Add missing "qemu/timer.h" include
  exec/exec-all: Move 'qemu/log.h' include in units requiring it

 bsd-user/signal.c                       | 1 +
 hw/acpi/memory_hotplug.c                | 1 -
 hw/arm/omap1.c                          | 1 +
 hw/core/ptimer.c                        | 1 -
 hw/display/omap_dss.c                   | 1 +
 hw/gpio/omap_gpio.c                     | 1 +
 hw/input/tsc210x.c                      | 1 +
 hw/remote/proxy-memory-listener.c       | 1 +
 hw/s390x/s390-virtio-hcall.h            | 1 +
 hw/tpm/tpm_crb.c                        | 1 +
 hw/tpm/tpm_ppi.c                        | 4 ++--
 hw/tpm/tpm_ppi.h                        | 4 ++--
 include/exec/exec-all.h                 | 2 --
 include/exec/ramblock.h                 | 2 ++
 linux-user/i386/cpu_loop.c              | 1 +
 linux-user/ppc/cpu_loop.c               | 1 +
 monitor/misc.c                          | 1 +
 plugins/api.c                           | 1 +
 softmmu/qtest.c                         | 1 +
 softmmu/runstate.c                      | 1 +
 target/alpha/helper.c                   | 2 +-
 target/arm/cpu.c                        | 1 +
 target/arm/helper.c                     | 2 ++
 target/arm/m_helper.c                   | 1 +
 target/arm/mte_helper.c                 | 1 +
 target/avr/helper.c                     | 1 +
 target/cris/helper.c                    | 1 +
 target/hexagon/internal.h               | 2 ++
 target/hppa/cpu.c                       | 1 +
 target/hppa/helper.c                    | 2 +-
 target/hppa/mem_helper.c                | 1 +
 target/hppa/op_helper.c                 | 1 +
 target/i386/helper.c                    | 1 +
 target/i386/tcg/int_helper.c            | 1 +
 target/i386/tcg/misc_helper.c           | 1 +
 target/i386/tcg/sysemu/seg_helper.c     | 1 +
 target/i386/tcg/sysemu/svm_helper.c     | 1 +
 target/m68k/op_helper.c                 | 1 +
 target/microblaze/cpu.c                 | 1 +
 target/microblaze/mmu.c                 | 1 +
 target/microblaze/op_helper.c           | 1 +
 target/mips/tcg/exception.c             | 1 +
 target/mips/tcg/sysemu/special_helper.c | 1 +
 target/mips/tcg/translate.h             | 1 +
 target/openrisc/interrupt.c             | 1 +
 target/openrisc/mmu.c                   | 1 +
 target/ppc/excp_helper.c                | 1 +
 target/ppc/misc_helper.c                | 1 +
 target/riscv/csr.c                      | 1 +
 target/s390x/tcg/excp_helper.c          | 1 +
 target/s390x/tcg/mem_helper.c           | 1 +
 target/sparc/helper.c                   | 1 +
 target/sparc/ldst_helper.c              | 1 +
 target/sparc/mmu_helper.c               | 1 +
 target/tricore/helper.c                 | 2 +-
 target/xtensa/dbg_helper.c              | 1 +
 target/xtensa/exc_helper.c              | 1 +
 target/xtensa/fpu_helper.c              | 1 +
 target/xtensa/helper.c                  | 1 +
 target/xtensa/mmu_helper.c              | 1 +
 target/xtensa/win_helper.c              | 1 +
 61 files changed, 63 insertions(+), 11 deletions(-)

-- 
2.34.1


