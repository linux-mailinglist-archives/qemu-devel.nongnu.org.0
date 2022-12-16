Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E29264F423
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:31:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Ig7-0003hx-CJ; Fri, 16 Dec 2022 16:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ifx-0003f0-BN
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:55:30 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Ifu-00038W-P9
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 16:55:29 -0500
Received: by mail-ej1-x633.google.com with SMTP id fc4so9136828ejc.12
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 13:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hDjaN8eJVHHHAcFnMzr9A5qx6nMta47BhVSDkoRkjiY=;
 b=koVIL3cKjIUh0I9iexsK0DqWfQr49gTESlxiAo8T9vnX2CJ4QixeCzMydRIRBOKWbx
 +R5klEOuw0jjsMOseiyYra2DmM7xugL01wBlJceq+pr1ETQMYuEF+l2nrxerxSyoOukk
 EE8047bs8JQBm+dUp3FUQQC1qnfqTHK47keip65hJwdx3mwendQAsAQLaIBR2pRzqlvf
 NqOH4fAeX01aJpH0nqGWNSKzukViznSJY7eNEFluBWjQzNLupunEjytyMWUMkkzTPBA2
 KPTKjr9ShUXrdrTne0thHjnLliuX8/iEm2579930rtW//wgEDKCU8+iqi5HVgULV6x0O
 iFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hDjaN8eJVHHHAcFnMzr9A5qx6nMta47BhVSDkoRkjiY=;
 b=qmtn2MA+0w0oN0pLJNT9RNKlJX2eDNL2126Hxa1464M8ftmIjSBeatFCKj2w+Kccea
 c0LRwTW/khHYhll5AIEqe7we0z6nFGvdpbEAA5eGxDR5bR1nGtRfgK2AylAP6w24bWd7
 81x5PxhYcn+Ik0a6TmekDOEWJ+QhCwX+spP+sC9vBtg5MKILgm3yS3l5PfNzYMB5nlxr
 eOUORIiVYTHcdV7YOrpOgK/DqfVMuQA+51/PiItYZZnyi4f0ZH1/Crx8dIdD+N5jISwT
 dFD3uDXD+kZADdbmpHwObX10uPJftz1ykBSKFgIUYoD6FvSC5rEDX+k5x8rBaugHZRJ6
 zCjA==
X-Gm-Message-State: ANoB5pl8QduBpK8Nb6w48BzPad4As6qMF0bkBGA6Bxt6i1Q2Rc/x5O88
 QvkFtWuMbVBEuvIA8HnzBlMWsn/Dh/D3O75Hi/0=
X-Google-Smtp-Source: AA0mqf44m9uRz2q1p7VXh76chobt7pep0KjNv3fyOdRMxmPyqai4zHyqi15eXjf/Z+1BI3Gb+0JNtQ==
X-Received: by 2002:a17:906:8385:b0:7c4:f348:3b1f with SMTP id
 p5-20020a170906838500b007c4f3483b1fmr10710690ejx.44.1671227722936; 
 Fri, 16 Dec 2022 13:55:22 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b007aece68483csm1261840ejf.193.2022.12.16.13.55.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 13:55:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>,
 Bin Meng <bin.meng@windriver.com>, Eduardo Habkost <eduardo@habkost.net>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-riscv@nongnu.org, kvm@vger.kernel.org,
 Stafford Horne <shorne@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>
Subject: [PATCH v3 0/5] target/cpu: System/User cleanups around hwaddr/vaddr
Date: Fri, 16 Dec 2022 22:55:14 +0100
Message-Id: <20221216215519.5522-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

Missing review: #1

We are not supposed to use the 'hwaddr' type on user emulation.

This series is a preparatory cleanup before few refactors to
isolate further System vs User code.

Since v1:
- only restrict SavedIOTLB in header (Alex)
- convert insert/remove_breakpoint implementations (Peter)

Since v2:
- added 'dump' patch
- collected R-b tags

Philippe Mathieu-Daudé (5):
  dump: Include missing "cpu.h" header for tswap32/tswap64()
    declarations
  cputlb: Restrict SavedIOTLB to system emulation
  gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
  target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
  target/cpu: Restrict do_transaction_failed() handlers to sysemu

 accel/kvm/kvm-all.c        |  4 ++--
 accel/kvm/kvm-cpus.h       |  4 ++--
 accel/tcg/tcg-accel-ops.c  |  4 ++--
 dump/dump.c                |  1 +
 gdbstub/gdbstub.c          |  1 -
 gdbstub/internals.h        |  6 ++++--
 gdbstub/softmmu.c          |  5 ++---
 gdbstub/user.c             |  5 ++---
 include/hw/core/cpu.h      |  6 ++++--
 include/sysemu/accel-ops.h |  6 +++---
 target/alpha/cpu.h         |  2 +-
 target/arm/cpu.h           |  2 +-
 target/arm/internals.h     |  2 ++
 target/cris/cpu.h          |  3 +--
 target/hppa/cpu.h          |  2 +-
 target/i386/cpu.h          |  5 ++---
 target/m68k/cpu.h          |  4 +++-
 target/microblaze/cpu.h    |  4 ++--
 target/nios2/cpu.h         |  2 +-
 target/openrisc/cpu.h      |  3 ++-
 target/ppc/cpu.h           |  2 +-
 target/riscv/cpu.h         | 12 ++++++------
 target/rx/cpu.h            |  2 +-
 target/rx/helper.c         |  4 ++--
 target/sh4/cpu.h           |  2 +-
 target/sparc/cpu.h         |  3 ++-
 target/xtensa/cpu.h        |  2 +-
 27 files changed, 52 insertions(+), 46 deletions(-)

-- 
2.38.1


