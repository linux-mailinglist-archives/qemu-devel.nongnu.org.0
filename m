Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA8849E8BC
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:19:59 +0100 (CET)
Received: from localhost ([::1]:57578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8RB-0005bN-5v
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:19:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6z1-0005hm-Ed
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:47 -0500
Received: from [2a00:1450:4864:20::435] (port=33607
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD6yz-0008Eo-96
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:46:46 -0500
Received: by mail-wr1-x435.google.com with SMTP id e8so5672233wrc.0
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 07:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EW6QB+nBfAmu2yzjhtIJ+gH5aLPiIjZE06u5tHS9kgQ=;
 b=ywT+Gst4d+DSK7+iVWl2qi8uCZndBb0D5EoIbO9nFreqCcMe/RSk2NuD5A/4WpXldf
 NtOBals7yfcog/qLShUSLEnpnOh/QEWM5F8GMQ2rlnMrHivqMetL0MX7UsXr7LQHKthR
 jcrGDGaqTt0qM/sGjj9me0dB5gpgfNEAULps/k6zRSQ3tYFz0xwN2kMI6ews8Rv8nOr0
 om9xQbg+375eHDlEJjpEkHnCR1R1abYKxNjMPJgNrkvcmzpYUWh4Q7m4wucV0zK/a2SS
 1KCDKqIamJjDmvV/tI96mBKhYEDTnGX6N5yRMPspJhVjPRPFxOIOFew7oA7Iljk/Ib1K
 9g6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EW6QB+nBfAmu2yzjhtIJ+gH5aLPiIjZE06u5tHS9kgQ=;
 b=hmYR2O5jZ6ZNpOLz2gf0VyrehSZ2KAyPYyKAE3spfyX/pn8rp3fRymlVu+gpsIsk6g
 UjQbeuxlKKcaqKTCHkt7pg9E5Gf7jBwVczrXAqsG7L3iyAhyPSxQrW3pWg3w/o00Ozgo
 NgQ5weOB1+kchPjyYCHTvORVEQuRTJVopAkNn5hA4t57gdwj4+XnmTpyplOgcE8x9izG
 wKqIXUxWfjjMARDFJ2+6ChDj1DCRFugDaqmRnssQ30Wd2MbIt0STC2uttZNc4DP1/k55
 h4SWQ+ktH3l/Zh8gsLtD1Q5c8x0gBob4PaCHMbhLRv///9i0llnR/KYkmyJid3Os2c13
 cLcQ==
X-Gm-Message-State: AOAM530yZvA573+TSV4sm6ZWvr6HV22NN91D2au2qYI+5i5PtJJGL90f
 hLn1+egYboctDV8FJ/yEoLFksQ==
X-Google-Smtp-Source: ABdhPJx9F6xctvNPWIn+VXtzO+QFASC7NbSzmRh2elGTJpYdnbtlZT8ikhSVOj/EKWDvFT8hXmKu6g==
X-Received: by 2002:a05:6000:3c3:: with SMTP id
 b3mr3658835wrg.102.1643298402949; 
 Thu, 27 Jan 2022 07:46:42 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w9sm6687667wmc.36.2022.01.27.07.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 07:46:42 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/16] arm: Fix handling of unrecognized functions in PSCI
 emulation
Date: Thu, 27 Jan 2022 15:46:23 +0000
Message-Id: <20220127154639.2090164-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series fixes our handling of PSCI calls where the function ID is
not recognized. These are supposed to return an error value, but
currently we instead emulate the SMC or HVC instruction to trap to the
guest at EL3 or EL2. Particularly of note for code review:
 * patches 4-9 include some "is this the right behaviour for
   this hardware" questions for the maintainers of those boards
 * patch 15 has a DTB API question, as well as being a change in
   what we edit in a DTB we are passed by the user
 * testing of the affected machines would be welcome

We tried to fix that bug in commit 9fcd15b9193e819b, but ran into
regressions and so reverted it in commit 4825eaae4fdd56fba0f for
release 7.0.  This series fixes the underlying problems causing the
regressions and reverts the revert.  It also fixes some other bugs
that were preventing booting of guests on the midway board and that
meant that the Linux kernel I tested couldn't bring up the secondary
CPUs when running with more than one guest CPU.

The regressions happened on boards which enabled PSCI emulation while
still running guest code at EL3. This used to work (as long as the
guest code itself wasn't trying to implement PSCI!)  because of the
fall-through-to-emulate-the-insn behaviour, but once the PSCI
emulation handles all SMC calls, most EL3 guest code will stop working
correctly. The solution this patchset adopts is to avoid enabling
QEMU's PSCI emulation when running guest code at EL3.

The affected boards are:
 * orangepi-pc, mcimx6ul-evk, mcimx7d-sabre, highbank, midway,
   xlnx-zcu102 (for any EL3 guest code)
 * xlnx-versal-virt (only for EL3 code run via -kernel)
 * virt (only for EL3 code run via -kernel or generic-loader)
For all these cases we will no longer enable PSCI emulation.
(This might in theory break guest code that used to work because
it was relying on running under QEMU and having the PSCI emulation
despite being at EL3 itself, but hopefully such code is rare.)

In order to only enable PSCI emulation when the guest is running at an
exception level lower than the level that our PSCI emulation
"firmware" would be running at, we make the arm_load_kernel() code in
boot.c responsible for setting the CPU properties psci-conduit and
start-powered-off. This is because only that code knows what EL it is
going to start the guest at (which depends on things like whether it
has decided that the guest is a Linux kernel or not).

The complicated case in all of this is the highbank and midway board
models, because of all the boards which enable QEMU's PSCI emulation
only these also use the boot.c secure_board_setup flag to say "run a
fragment of QEMU-provided boot code in the guest at EL3 to set
something up before running the guest at EL2 or EL1". That fragment of
code includes use of the SMC instruction, so when PSCI emulation
starts making that a NOP rather than a trap-to-guest-EL3 the setup
code will change behaviour. Fortunately, for this specific board's use
case the NOP is fine. The purpose of the setup code is to arrange that
unknown SMCs act as NOPs, because guest code may use a
highbank/midway-specific SMC ABI to enable the L2x0 cache
controller. So when the PSCI emulation starts to NOP the unknown SMCs
the setup code won't actively break, and the guest behaviour will
still be OK. (See patch 11's commit message for fuller details.)

Patches 1 and 2 make the relevant CPU properties settable after the
CPU object has been realized. This is necessary because
arm_load_kernel() runs very late, after the whole machine (including
the CPU objects) has been fully initialized.  (It was the restriction
on setting these properties before realize that previously led us to
set them in the SoC emulation code and thus to do it unconditionally.)

Patch 3 provides the "set up psci conduit" functionality in the boot.c
code; this is opt-in per board by setting a field in the arm_boot_info
struct.

Patches 4 to 9 move the individual boards across to using the new
approach. In each case I had to make a decision about the behaviour of
secondary CPUs when running guest firmware at EL3 -- should the
secondaries start off powered-down (waiting for the guest to power
them up via some kind of emulated power-control device), or powered-up
(so they all start running the firmware at once)? In a few cases I was
able to find the answer to this; in the rest I have erred on the side
of retaining the current "start powered down" behaviour, and added a
TODO comment to that effect. If you know the actual hardware
behaviour, let me know.

Patch 10 is the revert-the-revert patch.

Patch 11 removes the highbank/midway board use of the secure_board_setup
functionality; the commit message has the details about why this is safe.

Patches 12 to 14 are more minor cleanups that allow, and follow on from,
dropping the highbank-specific secondary CPU boot stub code.

Patch 15 is a change that is somewhat unrelated, but is necessary to
get the highbank board to successfully boot in SMP and to get the
midway board to start a Linux guest at all.

I have tested this with make check/check-acceptance and also with some
test images I have locally (including highbank and midway), but I
don't have test images for most of these boards, and in particular I
don't really have anything that exercises "run guest EL3 code" for
most of them. Testing would be welcome.

thanks
-- PMM

Peter Maydell (16):
  target/arm: make psci-conduit settable after realize
  cpu.c: Make start-powered-off settable after realize
  hw/arm/boot: Support setting psci-conduit based on guest EL
  hw/arm: imx: Don't enable PSCI conduit when booting guest in EL3
  hw/arm: allwinner: Don't enable PSCI conduit when booting guest in EL3
  hw/arm/xlnx-zcu102: Don't enable PSCI conduit when booting guest in
    EL3
  hw/arm/versal: Let boot.c handle PSCI enablement
  hw/arm/virt: Let boot.c handle PSCI enablement
  hw/arm: highbank: For EL3 guests, don't enable PSCI, start all cores
  Revert "Revert "arm: tcg: Adhere to SMCCC 1.3 section 5.2""
  hw/arm/highbank: Drop use of secure_board_setup
  hw/arm/boot: Prevent setting both psci_conduit and secure_board_setup
  hw/arm/boot: Don't write secondary boot stub if using PSCI
  hw/arm/highbank: Drop unused secondary boot stub code
  hw/arm/boot: Drop nb_cpus field from arm_boot_info
  hw/arm/boot: Drop existing dtb /psci node rather than retaining it

 include/hw/arm/boot.h        |  14 ++++-
 include/hw/arm/xlnx-versal.h |   1 -
 cpu.c                        |  22 ++++++-
 hw/arm/allwinner-h3.c        |   9 ++-
 hw/arm/aspeed.c              |   1 -
 hw/arm/boot.c                | 107 +++++++++++++++++++++++++++++------
 hw/arm/exynos4_boards.c      |   1 -
 hw/arm/fsl-imx6ul.c          |   2 -
 hw/arm/fsl-imx7.c            |   8 +--
 hw/arm/highbank.c            |  72 +----------------------
 hw/arm/imx25_pdk.c           |   3 +-
 hw/arm/kzm.c                 |   1 -
 hw/arm/mcimx6ul-evk.c        |   2 +-
 hw/arm/mcimx7d-sabre.c       |   2 +-
 hw/arm/npcm7xx.c             |   3 -
 hw/arm/orangepi.c            |   5 +-
 hw/arm/raspi.c               |   1 -
 hw/arm/realview.c            |   1 -
 hw/arm/sabrelite.c           |   1 -
 hw/arm/sbsa-ref.c            |   1 -
 hw/arm/vexpress.c            |   1 -
 hw/arm/virt.c                |  13 +----
 hw/arm/xilinx_zynq.c         |   1 -
 hw/arm/xlnx-versal-virt.c    |   6 +-
 hw/arm/xlnx-versal.c         |   5 +-
 hw/arm/xlnx-zcu102.c         |   1 +
 hw/arm/xlnx-zynqmp.c         |  13 +++--
 target/arm/cpu.c             |   6 +-
 target/arm/psci.c            |  35 ++----------
 29 files changed, 164 insertions(+), 174 deletions(-)

-- 
2.25.1


