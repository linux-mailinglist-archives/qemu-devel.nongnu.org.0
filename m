Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFFF4804E0
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 22:22:03 +0100 (CET)
Received: from localhost ([::1]:50534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1xRS-0003Gf-Iq
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 16:22:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMj-0005I2-C4
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:09 -0500
Received: from [2604:1380:4641:c500::1] (port=35422 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMh-0002WV-52
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:08 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEA3161073;
 Mon, 27 Dec 2021 21:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229E9C36AEA;
 Mon, 27 Dec 2021 21:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640639825;
 bh=iVCmmeeO13JoomogqvcGNrgq4nDJ+FZNDPXN9KsDdHw=;
 h=From:To:Cc:Subject:Date:From;
 b=alQ3nfWkYPPngjyPmoIaTwKsZk/INt338gLXMlUHNVbYetsfpmNrq1bZH1zoJ/Z95
 7/2GRDPAt8PSk1PRuLI0u0m2KXvTkgguVSCosihvZ83HpC2838ZPwe1zI7OfdYKvvA
 VuBdzPLkIaE392EqljeOdh5XDP6eNNa3Po2Sey1NwnpUMN2woMYBr1HzVX0sDNKgIu
 gw1GT8V8eDlzppzrllvlDAjWMXdqqJ1Et5K1MuDdPBT424Wo83pJkEu8TK2O75oXk6
 A+EMBHnhRNgerydZDa+85HmLuK3AZgpqvpBtFoSQPQdtGOPKbrPp5l+WWYLhHnHXUZ
 wHFKEuIdyKERw==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64]
 helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n1xMd-00Ed4b-6N; Mon, 27 Dec 2021 21:17:03 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/5] target/arm: Reduced-IPA space and highmem=off fixes
Date: Mon, 27 Dec 2021 21:16:37 +0000
Message-Id: <20211227211642.994461-1-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=maz@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 kernel-team@android.com, kvmarm@lists.cs.columbia.edu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Here's another stab at enabling QEMU on systems with pathologically
reduced IPA ranges such as the Apple M1 (previous version at [1]).
Eventually, we're able to run a KVM guest with more than just 3GB of
RAM on a system with a 36bit IPA space, and at most 123 vCPUs.

This series does a few things:
- decouple the enabling of the highmem PCIe region from the highmem
  attribute
- introduce a new attribute to control the enabling of the highmem
  GICv3 redistributors
- correctly cap the PA range with highmem is off
- generalise the highmem behaviour to any PA range
- disable both highmem PCIe and GICv3 RDs when they are outside of the
  PA range

This has been tested on an M1-based Mac-mini running Linux v5.16-rc6
with both KVM and TCG.

* From v2:
  - Fixed checking of the maximum memory against the IPA space
  - Fixed TCG memory map creation
  - Rebased on top of QEMU's 89f3bfa326
  - Collected Andrew's RBs, with thanks

[1] https://lore.kernel.org/r/20211003164605.3116450-1-maz@kernel.org

Marc Zyngier (5):
  hw/arm/virt: Key enablement of highmem PCIe on highmem_ecam
  hw/arm/virt: Add a control for the the highmem redistributors
  hw/arm/virt: Honor highmem setting when computing the memory map
  hw/arm/virt: Use the PA range to compute the memory map
  hw/arm/virt: Disable highmem devices that don't fit in the PA range

 hw/arm/virt-acpi-build.c | 12 +++----
 hw/arm/virt.c            | 67 ++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h    |  4 ++-
 3 files changed, 67 insertions(+), 16 deletions(-)

-- 
2.30.2


