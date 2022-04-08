Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E34F97D3
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 16:18:14 +0200 (CEST)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncpRF-0001ZM-G3
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 10:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP7-0006hZ-5V
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:16:04 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpP2-0002Do-Ik
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 10:15:59 -0400
Received: by mail-wr1-x430.google.com with SMTP id w21so13098903wra.2
 for <qemu-devel@nongnu.org>; Fri, 08 Apr 2022 07:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVmU1qLkCHaTXuHr4ltB478D0Fm9VHRiDUNWCa6vyzc=;
 b=Ow0ITSH+G0FVuhOLUelijQ3AXLTsBiwTSwkgKKFrGkZOoqN9spikJ9wgJBtPrInBQZ
 QgV4quTuDCWuAJ1anwS/Zy6vDRVTH+viggLXhEEL6G0ap88rvI3Nr8bJJlS0rf6lXgFB
 Lf2fdGwtBp6TJ6aFtI7mTS7RiBUa/LV5/1UiOtY9bvlqKRdX0iEame1SdleAnftbfNXy
 Axs9/IUM5XO7fPSeasfpchoMu/1UuGpt+PBp5MZFMnDJWmSt0WroSC+Tv1vkJxYsWCf5
 p7fAEYxYEUvjk0DL2snwNPySKHlYZFgYv4MnRRn+igaVHly+kKo9pyO+ur8ihlVc8/o+
 P0ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lVmU1qLkCHaTXuHr4ltB478D0Fm9VHRiDUNWCa6vyzc=;
 b=l26VzI/3ghdNUJBQH5ITzaOqOC7hikSlKOyppIwcVGONbmlh2rkOGN+LUl934Hp1HF
 wwtisT6Q26U4U8xmlH/PYyYIn86EWcWsrA0HeXVqtLDV29eJJQcgHUEjsMkH7QT1/OGR
 ZYq3vegIaITP89HclmD8WiM0bja+rThZAV14B1UYuLyla/zD+Bb6jtzY6/XQwPMX4lns
 4E9FpiHYXo29JGrXxnKCug15pTLg/id8eLdZJkjGX6j2m80Bog+nMAP1v68D/mk4btpO
 T2SJRqXx/WzD4aeXPjIxp61vmwLcLMHhWFzwA2BNr3ukafIWnGdU97DLLNhiDJs4QBjA
 S4hA==
X-Gm-Message-State: AOAM531dn+hhYCYUXSheyGRS36me7Y5zfp1knNAI8d0MOua92M7i+hIC
 aOsnl/5IkQkCZ5c/jXutT1Nf3g==
X-Google-Smtp-Source: ABdhPJwK6mp/VhJAWLGMxWNwhzzuwwZG7/LT3LIB5exka0bcSHBxT8wm22pLZGL3qJ5gpGmd/Fg++A==
X-Received: by 2002:adf:ea44:0:b0:206:1761:715a with SMTP id
 j4-20020adfea44000000b002061761715amr14796367wrn.534.1649427354976; 
 Fri, 08 Apr 2022 07:15:54 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:15:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/41] arm: Implement GICv4
Date: Fri,  8 Apr 2022 15:15:09 +0100
Message-Id: <20220408141550.1271295-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements emulation of GICv4 in our TCG GIC and ITS
models, and makes the virt board use it where appropriate.

The GICv4 provides a single new feature: direct injection of virtual
interrupts from the ITS to a VM. In QEMU terms this means that if you
have an outer QEMU which is emulating a CPU with EL2, and the outer
guest passes through a PCI device (probably one emulated by the outer
QEMU) to an inner guest, interrupts from that device can go directly
to the inner guest, rather than having to go to the outer guest and
the outer guest then synthesizing virtual interrupts to the inner
guest. (If you aren't configuring the inner guest with a passthrough
PCI device then this new feature is of no interest.)

The basic structure of the patchset is as follows:

(1) There are a handful of preliminary patches fixing some minor
existing nits.

(2) The v4 ITS has some new in-guest-memory data structures and new
ITS commands that let the guest set them up. The next sequence of
patches implement all those commands. Where the command needs to
actually do something (eg "deliver a vLPI"), these patches call
functions in the redistributor which are left as unimplemented stubs
to be filled in in subsequent patches. This first chunk of patches
sticks to the data-structure handling and all the command argument
unpacking and error checking.

(3) The redistributor has a new redistributor frame (ie the amount of
guest memory used by redistributor registers is larger) with a two new
registers in it. We implement these initially as reads-as-written.

(4) The CPU interface needs relatively minor changes: as well as
looking at the list registers to determine the highest priority
pending virtual interrupt, we must also look at the highest priority
pending vLPI. We implement these changes, again leaving the interfaces
from this code into the redistributor as stubs for the moment.

(5) Now we can fill in all the stub code in the redistributor.  This
is almost all working with the pending and config tables for virtual
LPIs. (Side note: in real hardware some of this work is done by the
ITS rather than the redistributor, but in our implementation we split
between the two source files slightly differently. I've made the vLPI
handling follow the pattern of the existing LPI handling.)

(6) Finally, we can update the ID registers which tell the guest about
the presence of v4 features, allow the GIC device to accept 4 as a
value for its QOM revision property, and make the virt board set that
when appropriate.

General notes:

Since the only useful thing in GICv4 is direct virtual interrupt
injection, it isn't expected that you would have a system with a GICv4
and a CPU without EL2. So I've made this an error, and the virt board
will only use GICv4 if the user also enables emulation of
virtualization.

Because the redistributor frame is twice the size in GICv4, the
number of redistributors we can fit into a given area of memory
is reduced. This means that when using GICv4 the maximum number
of CPUs supported on the virt board drops from 512 to 317. (No,
I'm not sure why this is 317 and not 256 :-))

I have not particularly considered performance in this initial
implementation. In particular, we will do a complete re-scan of a
virtual LPI pending table every time the outer guest reschedules a
vCPU (and writes GICR_VPENDBASER). The spec provides scope for
optimisation here, by allowing part of the LPI table to have IMPDEF
contents, which we could in principle use to cache information like
the current highest priority pending vLPI. Given that emulating
nested guests with PCI passthrough is a fairly niche activity,
I propose that we not do this unless the three people doing that
complain about this all being too slow :-)

Tested with a Linux kernel passing through a virtio-blk device
to an inner Linux VM with KVM/QEMU. (NB that to get the outer
Linux kernel to actually use the new GICv4 functionality you
need to pass it "kvm-arm.vgic_v4_enable=1", as the kernel
will not use it by default.)

thanks
-- PMM

Peter Maydell (41):
  hw/intc/arm_gicv3_its: Add missing blank line
  hw/intc/arm_gicv3: Sanity-check num-cpu property
  hw/intc/arm_gicv3: Insist that redist region capacity matches CPU count
  hw/intc/arm_gicv3: Report correct PIDR0 values for ID registers
  target/arm/cpu.c: ignore VIRQ and VFIQ if no EL2
  hw/intc/arm_gicv3_its: Factor out "is intid a valid LPI ID?"
  hw/intc/arm_gicv3_its: Implement GITS_BASER2 for GICv4
  hw/intc/arm_gicv3_its: Implement VMAPI and VMAPTI
  hw/intc/arm_gicv3_its: Implement VMAPP
  hw/intc/arm_gicv3_its: Distinguish success and error cases of CMD_CONTINUE
  hw/intc/arm_gicv3_its: Factor out "find ITE given devid, eventid"
  hw/intc/arm_gicv3_its: Factor out CTE lookup sequence
  hw/intc/arm_gicv3_its: Split out process_its_cmd() physical interrupt code
  hw/intc/arm_gicv3_its: Handle virtual interrupts in process_its_cmd()
  hw/intc/arm_gicv3: Keep pointers to every connected ITS
  hw/intc/arm_gicv3_its: Implement VMOVP
  hw/intc/arm_gicv3_its: Implement VSYNC
  hw/intc/arm_gicv3_its: Implement INV command properly
  hw/intc/arm_gicv3_its: Implement INV for virtual interrupts
  hw/intc/arm_gicv3_its: Implement VMOVI
  hw/intc/arm_gicv3_its: Implement VINVALL
  hw/intc/arm_gicv3: Implement GICv4's new redistributor frame
  hw/intc/arm_gicv3: Implement new GICv4 redistributor registers
  hw/intc/arm_gicv3_cpuif: Split "update vIRQ/vFIQ" from
    gicv3_cpuif_virt_update()
  hw/intc/arm_gicv3_cpuif: Support vLPIs
  hw/intc/arm_gicv3_cpuif: Don't recalculate maintenance irq unnecessarily
  hw/intc/arm_gicv3_redist: Factor out "update hpplpi for one LPI" logic
  hw/intc/arm_gicv3_redist: Factor out "update hpplpi for all LPIs" logic
  hw/intc/arm_gicv3_redist: Recalculate hppvlpi on VPENDBASER writes
  hw/intc/arm_gicv3_redist: Factor out "update bit in pending table" code
  hw/intc/arm_gicv3_redist: Implement gicv3_redist_process_vlpi()
  hw/intc/arm_gicv3_redist: Implement gicv3_redist_vlpi_pending()
  hw/intc/arm_gicv3_redist: Use set_pending_table_bit() in mov handling
  hw/intc/arm_gicv3_redist: Implement gicv3_redist_mov_vlpi()
  hw/intc/arm_gicv3_redist: Implement gicv3_redist_vinvall()
  hw/intc/arm_gicv3_redist: Implement gicv3_redist_inv_vlpi()
  hw/intc/arm_gicv3: Update ID and feature registers for GICv4
  hw/intc/arm_gicv3: Allow 'revision' property to be set to 4
  hw/arm/virt: Use VIRT_GIC_VERSION_* enum values in create_gic()
  hw/arm/virt: Abstract out calculation of redistributor region capacity
  hw/arm/virt: Support TCG GICv4

 docs/system/arm/virt.rst               |   5 +-
 hw/intc/gicv3_internal.h               | 231 ++++++-
 include/hw/arm/virt.h                  |  19 +-
 include/hw/intc/arm_gicv3_common.h     |  13 +
 include/hw/intc/arm_gicv3_its_common.h |   1 +
 hw/arm/virt.c                          | 102 ++-
 hw/intc/arm_gicv3_common.c             |  54 +-
 hw/intc/arm_gicv3_cpuif.c              | 195 +++++-
 hw/intc/arm_gicv3_dist.c               |   7 +-
 hw/intc/arm_gicv3_its.c                | 876 ++++++++++++++++++++-----
 hw/intc/arm_gicv3_its_kvm.c            |   2 +
 hw/intc/arm_gicv3_kvm.c                |   5 +
 hw/intc/arm_gicv3_redist.c             | 480 +++++++++++---
 target/arm/cpu.c                       |  12 +-
 hw/intc/trace-events                   |  18 +-
 15 files changed, 1695 insertions(+), 325 deletions(-)

-- 
2.25.1


