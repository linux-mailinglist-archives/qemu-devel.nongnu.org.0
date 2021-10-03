Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B10E4202F5
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 18:49:21 +0200 (CEST)
Received: from localhost ([::1]:56878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX4fv-0003ZH-HA
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 12:49:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4d2-0000n0-Du
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:55604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mX4cv-00024M-RY
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 12:46:17 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F05D61A4F;
 Sun,  3 Oct 2021 16:46:11 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mX4cr-00EUhe-Eg; Sun, 03 Oct 2021 17:46:09 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/5] target/arm: Reduced-IPA space and highmem=off fixes
Date: Sun,  3 Oct 2021 17:46:00 +0100
Message-Id: <20211003164605.3116450-1-maz@kernel.org>
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
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
reduced IPA ranges such as the Apple M1 (original version at [1]).
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

This has been tested on an M1-based Mac-mini running Linux v5.15-rc3.

[1] https://lore.kernel.org/r/20210822144441.1290891-1-maz@kernel.org

Marc Zyngier (5):
  hw/arm/virt: Key enablement of highmem PCIe on highmem_ecam
  hw/arm/virt: Add a control for the the highmem redistributors
  hw/arm/virt: Honor highmem setting when computing the memory map
  hw/arm/virt: Use the PA range to compute the memory map
  hw/arm/virt: Disable highmem devices that don't fit in the PA range

 hw/arm/virt-acpi-build.c | 12 ++++-----
 hw/arm/virt.c            | 53 ++++++++++++++++++++++++++++++++++------
 include/hw/arm/virt.h    |  4 ++-
 3 files changed, 54 insertions(+), 15 deletions(-)

-- 
2.30.2


