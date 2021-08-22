Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEDA3F4025
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 16:47:46 +0200 (CEST)
Received: from localhost ([::1]:53482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHolF-0007YV-Rj
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 10:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mHoih-0005Qv-5m
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:45:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1mHoid-0002It-Ts
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 10:45:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B277A61284;
 Sun, 22 Aug 2021 14:45:01 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mHoia-006VES-4P; Sun, 22 Aug 2021 15:45:00 +0100
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] docs/system/arm/virt: Fix documentation for the 'highmem'
 option
Date: Sun, 22 Aug 2021 15:44:41 +0100
Message-Id: <20210822144441.1290891-4-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210822144441.1290891-1-maz@kernel.org>
References: <20210822144441.1290891-1-maz@kernel.org>
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

The documentation for the 'highmem' option indicates that it controls
the placement of both devices and RAM. The actual behaviour of QEMU
seems to be that RAM is allowed to go beyond the 4GiB limit, and
that only devices are constraint by this option.

Align the documentation with the actual behaviour.

Cc: Andrew Jones <drjones@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 docs/system/arm/virt.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 59acf0eeaf..e206e7565d 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -86,9 +86,9 @@ mte
   Arm Memory Tagging Extensions. The default is ``off``.
 
 highmem
-  Set ``on``/``off`` to enable/disable placing devices and RAM in physical
-  address space above 32 bits. The default is ``on`` for machine types
-  later than ``virt-2.12``.
+  Set ``on``/``off`` to enable/disable placing devices in physical address
+  space above 32 bits. RAM in excess of 3GiB will always be placed above
+  32 bits. The default is ``on`` for machine types later than ``virt-2.12``.
 
 gic-version
   Specify the version of the Generic Interrupt Controller (GIC) to provide.
-- 
2.30.2


