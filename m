Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D8E4804D9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Dec 2021 22:19:38 +0100 (CET)
Received: from localhost ([::1]:44872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1xP7-000801-ES
	for lists+qemu-devel@lfdr.de; Mon, 27 Dec 2021 16:19:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMk-0005IK-Eb
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:10 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:53084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>) id 1n1xMi-0002Wr-No
 for qemu-devel@nongnu.org; Mon, 27 Dec 2021 16:17:10 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 365F4B8115E;
 Mon, 27 Dec 2021 21:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 099C7C36AEF;
 Mon, 27 Dec 2021 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640639826;
 bh=8jnTIlm8Zob2Jvux6Qz42yjEvf+iD+5kMVUVUXnj1ys=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q56PjvJIBDPFg9k+R/s7jSrr+hm/vcoXAPHyqveK2tK+tOZF4My4oU+D3fGM2JOxU
 jUyQuacheThXBYwn3eKWIod4ntDY14Wqy54ieL8EK13vzrkXe9cxeVE+3iqJ6wlF+P
 MCr6gHk23XNFjs9wBL2Dv4S3Q3SEivjB8rhtlQDulEstMsWTBCbMLP2ioAn+KVO/M2
 MYkOkzZD9ErsRWPfHGTPf8XcjoN/ogqYYUn/1x5TC0ekcNH/+6pPNrfl7X1dfCkS5o
 pDjuRmdzJpo27+OhxuYyYIFX/QTh+2+A5kVU+c+xJvX3CY8acZwo3iMSStu7WlhKgZ
 zPRSTJhcPlu0Q==
Received: from cfbb000407.r.cam.camfibre.uk ([185.219.108.64]
 helo=hot-poop.lan)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1n1xMe-00Ed4b-4O; Mon, 27 Dec 2021 21:17:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 5/5] hw/arm/virt: Disable highmem devices that don't fit in
 the PA range
Date: Mon, 27 Dec 2021 21:16:42 +0000
Message-Id: <20211227211642.994461-6-maz@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211227211642.994461-1-maz@kernel.org>
References: <20211227211642.994461-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: qemu-devel@nongnu.org, drjones@redhat.com,
 eric.auger@redhat.com, peter.maydell@linaro.org, kvmarm@lists.cs.columbia.edu,
 kvm@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=145.40.68.75; envelope-from=maz@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.575,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Make sure both the highmem PCIe and GICv3 regions are disabled when
they don't fully fit in the PA range.

Reviewed-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 212079e7a6..18e615070f 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1723,6 +1723,9 @@ static void virt_set_memmap(VirtMachineState *vms, int pa_bits)
     if (base <= BIT_ULL(pa_bits)) {
         vms->highest_gpa = base - 1;
     } else {
+        /* Advertise that we have disabled the highmem devices */
+        vms->highmem_ecam = false;
+        vms->highmem_redists = false;
         vms->highest_gpa = memtop - 1;
     }
 
-- 
2.30.2


