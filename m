Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0EC4C2D70
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 14:43:25 +0100 (CET)
Received: from localhost ([::1]:58862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNEOx-0002qa-RB
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 08:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNELC-0000o9-NS
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:39:31 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:46338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org>)
 id 1nNEL8-0001wj-On
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 08:39:30 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8FC77B825DA;
 Thu, 24 Feb 2022 13:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8126BC340E9;
 Thu, 24 Feb 2022 13:39:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="pJJAYBNC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645709955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=biG0RZRtZzyZzuDo4lheV97xBCdE6etrDTyngbTngZY=;
 b=pJJAYBNCrhDmgmtYFfVAEerKf6orXO5RDsyT/mCQ1+T4uF37B113l25D5J1vME/UV1NmxO
 1YYsdO6aYTdUaAzO35KXUBiJ1VwkSoFZrjUoPbnLeuI+LPUkJrOY8lMYeHrXj8hVhfx8PP
 MBoB3xnJPN7WRwLRtMhUKcdlul2H4Ww=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 54bf55ce
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Thu, 24 Feb 2022 13:39:15 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-crypto@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] VM fork detection for RNG
Date: Thu, 24 Feb 2022 14:39:04 +0100
Message-Id: <20220224133906.751587-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=7c/N=TH=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, mst@redhat.com, raduweis@amazon.com,
 linux@dominikbrodowski.net, kys@microsoft.com, ardb@kernel.org,
 wei.liu@kernel.org, sthemmin@microsoft.com, ben@skyportsystems.com,
 decui@microsoft.com, ebiggers@kernel.org, lersek@redhat.com,
 ehabkost@redhat.com, adrian@parity.io, jannh@google.com,
 haiyangz@microsoft.com, graf@amazon.com, tytso@mit.edu, colmmacc@amazon.com,
 berrange@redhat.com, gregkh@linuxfoundation.org, imammedo@redhat.com,
 dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series picks up work from Amazon that seems to have stalled
out last year around this time: listening for the vmgenid ACPI
notification, and using it to "do something." Last year, folks proposed
a complicated userspace mmap chardev, which was frought with difficulty
and evidently abandoned. This year, instead, I have something much
simpler in mind: simply using those ACPI notifications to tell the RNG
to reinitialize safely, so we don't repeat random numbers in cloned,
forked, or rolled-back VM instances.

This series consists of two patches. The first one adds the right hooks
into the actual RNG, and the second is a driver for the ACPI notification.

Here's a little screencast showing it in action: https://data.zx2c4.com/vmgenid-appears-to-work.gif

As a side note, this series intentionally does _not_ focus on
notification of these events to userspace or to other kernel consumers.
Since these VM fork detection events first need to hit the RNG, we can
later talk about what sorts of notifications or mmap'd counters the RNG
should be making accessible to elsewhere. But that's a different sort of
project and ties into a lot of more complicated concerns beyond this
more basic patchset. So hopefully we can keep the discussion rather
focused here to this ACPI business.

Changes v2->v3:
- [Eric] Always put generation ID through the input pool, and then re-extract.
- [Lazlo] The ACPI bytes are just an opaque binary blob, rather than a real UUID.
Changes v1->v2:
- [Ard] Correct value of MODULE_LICENSE().
- [Ard] Use ordinary memory accesses instead of memcpy_fromio.
- [Ard] Make module a tristate and set MODULE_DEVICE_TABLE().
- [Ard] Free buffer after using.
- Use { } instead of { "", 0 }.
- Clean up interface into RNG.
- Minimize ACPI driver a bit.

In addition to the usual suspects, I'm CCing the original team from
Amazon who proposed this last year and the QEMU developers who added it
there, as well as the kernel Hyper-V maintainers, since this is
technically a Microsoft-proposed thing, though QEMU now implements it.

Cc: adrian@parity.io
Cc: dwmw@amazon.co.uk
Cc: graf@amazon.com
Cc: colmmacc@amazon.com
Cc: raduweis@amazon.com
Cc: berrange@redhat.com
Cc: lersek@redhat.com
Cc: imammedo@redhat.com
Cc: ehabkost@redhat.com
Cc: ben@skyportsystems.com
Cc: mst@redhat.com
Cc: kys@microsoft.com
Cc: haiyangz@microsoft.com
Cc: sthemmin@microsoft.com
Cc: wei.liu@kernel.org
Cc: decui@microsoft.com
Cc: linux@dominikbrodowski.net
Cc: ebiggers@kernel.org
Cc: ardb@kernel.org
Cc: jannh@google.com
Cc: gregkh@linuxfoundation.org
Cc: tytso@mit.edu

Jason A. Donenfeld (2):
  random: add mechanism for VM forks to reinitialize crng
  virt: vmgenid: introduce driver for reinitializing RNG on VM fork

 drivers/char/random.c  |  50 ++++++++++++-----
 drivers/virt/Kconfig   |   9 +++
 drivers/virt/Makefile  |   1 +
 drivers/virt/vmgenid.c | 121 +++++++++++++++++++++++++++++++++++++++++
 include/linux/random.h |   1 +
 5 files changed, 167 insertions(+), 15 deletions(-)
 create mode 100644 drivers/virt/vmgenid.c

-- 
2.35.1


