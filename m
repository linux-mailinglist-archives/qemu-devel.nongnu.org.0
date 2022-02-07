Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3C54AB77E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 10:31:55 +0100 (CET)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH0NF-0000EI-6A
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 04:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNU-00060i-1B
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:04 -0500
Received: from [2a00:1450:4864:20::42f] (port=39445
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGzNS-00077v-De
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 03:28:03 -0500
Received: by mail-wr1-x42f.google.com with SMTP id v19so8365323wrv.6
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 00:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4RHaWL1yaT2CjnX3vtiJt/47i4MHhkHrixhAJ/fdiU=;
 b=pv50r+kR+e0epJVsCrkTYWpe15tvaJpQ642mNx/+tklhxoCJfDCB+6j9h4NzCfZO6v
 2YcIEyzH9RwhNKDQJXEL6ENh7SFA1w3JjiDWILNotZluFu6ASr00W4gCTDd4A1D/QM0o
 Kvnnoc4bMLlgciTIB9Ko8nfA8SsG7Kb4YRgZUyKzxdkr9BbZdQ28VhQFWjjU1+Vc+70U
 h54FYJXlhyBssdUHdlfFyKo1RdeP2kXgHyX3DViwLT+VE/CEcaywGEMQySg90dYkFvum
 51DQH+dztFe5QdWHgW6+XEoT+8n875BsqgAZNWjLn7Adre9ILerfofhCdAD8CGGqB65Q
 yZiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=P4RHaWL1yaT2CjnX3vtiJt/47i4MHhkHrixhAJ/fdiU=;
 b=M9OvHYKjfjxAcrY9QT/GTVh1SSW0WlobpvPhtuaJhhwQssyO8gueCp4MrM3TaZMvv+
 4UY+TcWxjVg3Xlno/NkKsletrsAbJht43/MG+vmd+z+iS6oBnvsCVDllzNWZRfaPW17W
 IcMQ/Fh00RyMtlxMhFOxLRJV1nCHh794+2s523lqNoAzUhzw05KAhx12pd52Rw7ATMpx
 olNyBYJ3mLBZirSJfXGwoVFD4Dd75VYrImcDrlfX3HAN7B9XrCDCtUbCdOPR4VfBv7V7
 DHKYtkZan27Om79iXrdcwfALzQk8Jy6edXuOiRoO+hkibKTIpFrRpI0hWohvUAniLYMQ
 c4WQ==
X-Gm-Message-State: AOAM533O72rbNn76TNKfNWCbEsFdXJjhJ+5YfcCRy0ULCIB7lXOfeGgD
 FBJmEd9ZPA5SjKl/kLpXzFLcXtZvrd0=
X-Google-Smtp-Source: ABdhPJzfxfgXTMHvY+X8S1QAdHdL6d/8mjXjsvAE8B6S+ltpyi9SRnHjwGqg/pZuImumVFQObtXa2A==
X-Received: by 2002:a05:6000:1c9:: with SMTP id
 t9mr9179420wrx.550.1644222478151; 
 Mon, 07 Feb 2022 00:27:58 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t17sm9255450wrs.10.2022.02.07.00.27.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Feb 2022 00:27:57 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 0/9] exec: Remove 'qemu/log.h' from 'exec-all.h'
Date: Mon,  7 Feb 2022 09:27:47 +0100
Message-Id: <20220207082756.82600-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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

Since v1:
- Remove unrelated "hw/s390x/virtio: missing 'cpu.h'" (thuth)
- Reword some commit descriptions (thuth)

Based-on: <20220207075426.81934-1-f4bug@amsat.org>
"softmmu: Make various objects target agnostic"

Philippe Mathieu-Daudé (9):
  hw/tpm: Clean includes
  hw/remote: Add missing include
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
 target/hexagon/translate.h              | 1 +
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


