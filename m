Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8965564733E
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 16:37:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Iw3-0003I9-JS; Thu, 08 Dec 2022 10:35:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Ivv-0003Gp-P4
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:37 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3Ivu-0006FI-1u
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 10:35:35 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 h8-20020a1c2108000000b003d1efd60b65so3629143wmh.0
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 07:35:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+RM4UwijIpBPUIIRN2AowsmzXNijKTCSn3H3N3D+GCg=;
 b=sVtUEeiouVnCevIsTQ1U1d70vH9x97w5UheXwB1Vxxb8uNF6TyomteXx+Lc+35n0q8
 k+nASupApS+i1paBd8HCmvbZAppuVs3JbYfgbaktVhCF8Qq31G08SHgu46stisNWK5LI
 zJcVcsBMx4vWgCFt2xM6z7MjdaLYfEZG9Q82nQCzGhHz0cUzx40n1omVKxqUmUqfJ+uW
 FRjTp9aLzs8udl3dc8HrtcGG93DIu8ejLBu+laQtS6QEzEY29+lD+NS/M2mYkuS/ZsEr
 aJw6KTF486KexxawK6eoFDfe8wWIXxwOXpYBuiOLUsGX9cGPclQMhKZItyQD/5zo+XkF
 z0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+RM4UwijIpBPUIIRN2AowsmzXNijKTCSn3H3N3D+GCg=;
 b=d+jxBryhZp9Ovtxqzrwg2T1UaJNDTrdit6KlD1LqnhJyuFgI5kJ2Jnknh+hvzUpWLq
 FZblhSR5WlXfxvAs418hQtDfnd5YvhqYP9jdyLx+7DLi3dUXOwve40lEizwMwtF+xpN0
 tbeTVigEyHyGHX7qnMgbxJF9W69A/Fe80BanG9hsNcP4u2PvbRGe8ZAbSEmu1wr7ZRBJ
 Dau1p1zj4gVRcs6Tjqt76FVcOfEp00Kcw8NsP9qfw3vSDoDNPh3uWnYRGTqr0BQ/p+Q+
 gj/CjkzuVE5lTwH/LBkq78IkRn/IsUCsvoVI8jJtBCfB4IEnAltwo3IkZuN2NPL6JB3z
 582Q==
X-Gm-Message-State: ANoB5pnOfiT/mrqKkPUQwoJxPxwSfOd1/cbL2lERPiETnpfY4x5I/7eT
 fCdkV1qcIw9lwIrQm0L4AVahdW+a7LJ55zSBuaw=
X-Google-Smtp-Source: AA0mqf49aJ/+SKfZbINuKtt6dxJE/LrEL9Yzvc4uqOLweecB0LwA26N7v4IJRugoVSQ/98bgO+RUXQ==
X-Received: by 2002:a05:600c:3ac5:b0:3d0:761b:f86 with SMTP id
 d5-20020a05600c3ac500b003d0761b0f86mr2210330wms.28.1670513731944; 
 Thu, 08 Dec 2022 07:35:31 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 ay5-20020a05600c1e0500b003c21ba7d7d6sm5412191wmb.44.2022.12.08.07.35.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 Dec 2022 07:35:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Anton Johansson <anjo@rev.ng>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, Chris Wulff <crwulff@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marek Vasut <marex@denx.de>, Max Filippov <jcmvbkbc@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH-for-8.0 v2 0/4] target/cpu: System/User cleanups around
 hwaddr/vaddr
Date: Thu,  8 Dec 2022 16:35:24 +0100
Message-Id: <20221208153528.27238-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

We are not supposed to use the 'hwaddr' type on user emulation.

This series is a preparatory cleanup before few refactors to
isolate further System vs User code.

Since v1:
- only restrict SavedIOTLB in header (Alex)
- convert insert/remove_breakpoint implementations (Peter)

Philippe Mathieu-Daudé (4):
  cputlb: Restrict SavedIOTLB to system emulation
  gdbstub: Use vaddr type for generic insert/remove_breakpoint() API
  target/cpu: Restrict cpu_get_phys_page_debug() handlers to sysemu
  target/sparc/sysemu: Remove pointless CONFIG_USER_ONLY guard

 accel/kvm/kvm-all.c        | 4 ++--
 accel/kvm/kvm-cpus.h       | 4 ++--
 accel/tcg/tcg-accel-ops.c  | 4 ++--
 gdbstub/gdbstub.c          | 1 -
 gdbstub/internals.h        | 6 ++++--
 gdbstub/softmmu.c          | 5 ++---
 gdbstub/user.c             | 5 ++---
 include/hw/core/cpu.h      | 6 ++++--
 include/sysemu/accel-ops.h | 6 +++---
 target/alpha/cpu.h         | 2 +-
 target/cris/cpu.h          | 3 +--
 target/hppa/cpu.h          | 2 +-
 target/m68k/cpu.h          | 2 +-
 target/nios2/cpu.h         | 2 +-
 target/openrisc/cpu.h      | 3 ++-
 target/ppc/cpu.h           | 2 +-
 target/rx/cpu.h            | 2 +-
 target/rx/helper.c         | 4 ++--
 target/sh4/cpu.h           | 2 +-
 target/sparc/cpu.h         | 3 ++-
 target/sparc/mmu_helper.c  | 2 --
 target/xtensa/cpu.h        | 2 +-
 22 files changed, 36 insertions(+), 36 deletions(-)

-- 
2.38.1


