Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708E4C1E37
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:08:53 +0100 (CET)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzoZ-00073q-Nl
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:08:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzlB-0004x6-0j
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:21 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:39852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMzl7-0005Mo-Tb
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:05:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1806DB81F56;
 Wed, 23 Feb 2022 22:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EFEC340E7;
 Wed, 23 Feb 2022 22:05:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="p3Fz+yby"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645653908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=5pBvrnim267Drxy2tBvWhv9EQxny44tgDJv9yglZOzw=;
 b=p3Fz+ybysAbMGdmdB0sXZ+aF5mGEdageCUkh7PocknvKbNnTB5XjnKEJVZu7hQtIXjUCRV
 +iVQK8XXcFoQulzKc8N8w6u3b5+p0WWAQadYInqvn1YWF84YakUvyrd09f56rG73+9IfzQ
 qfOkaGtHcrR+Y1Y1rmLdap7kDWjWwR4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c269c5a0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Feb 2022 22:05:08 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 linux-crypto@vger.kernel.org, qemu-devel@nongnu.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] VM fork detection for RNG
Date: Wed, 23 Feb 2022 23:04:54 +0100
Message-Id: <20220223220456.666193-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org;
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, kys@microsoft.com,
 sthemmin@microsoft.com, ehabkost@redhat.com, adrian@parity.io, mst@redhat.com,
 decui@microsoft.com, haiyangz@microsoft.com, ben@skyportsystems.com,
 raduweis@amazon.com, wei.liu@kernel.org, linux@dominikbrodowski.net,
 gregkh@linuxfoundation.org, graf@amazon.com, tytso@mit.edu, jannh@google.com,
 imammedo@redhat.com, colmmacc@amazon.com, ardb@kernel.org, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series picks up work from Amazon that seems to have stalled
out last year around this time: listening for the vmgenid ACPI
notification, and using it to "do something." Last year, folks proposed
a complicated userspace mmap chardev, which was frought with
difficulty and evidently abandoned. This year, instead, I have something
much simpler in mind: simply using those ACPI notifications to tell the
RNG to reinitialize safely, so we don't repeat random numbers in cloned,
forked, or rolled-back VM instances.

This series consists of two patches. The first one adds the right hooks
into the actual RNG, and the second is a driver for the ACPI
notification.

I had posted an RFC v1 earlier today, thinking I really needed to
request comments, lacking much experience with ACPI drivers. But having
spent all day reworking this driver, and then testing and debugging it
in a variety of circumstances, I feel fairly confident that it works
well, so this is now the real thing. Please review! Here's a little
screencast showing it in action: https://data.zx2c4.com/vmgenid-appears-to-work.gif

As a side note, this series intentionally does _not_ focus on
notification of these events to userspace or to other kernel consumers.
Since these VM fork detection events first need to hit the RNG, we can
later talk about what sorts of notifications or mmap'd counters the RNG
should be making accessible to elsewhere. But that's a different sort of
project and ties into a lot of more complicated concerns beyond this
more basic patchset. So hopefully we can keep the discussion rather
focused here to this ACPI business.

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
Cc: ardb@kernel.org
Cc: jannh@google.com
Cc: gregkh@linuxfoundation.org
Cc: tytso@mit.edu

Jason A. Donenfeld (2):
  random: add mechanism for VM forks to reinitialize crng
  virt: vmgenid: introduce driver for reinitializing RNG on VM fork

 drivers/char/random.c  |  53 ++++++++++++++++++
 drivers/virt/Kconfig   |   9 ++++
 drivers/virt/Makefile  |   1 +
 drivers/virt/vmgenid.c | 120 +++++++++++++++++++++++++++++++++++++++++
 include/linux/random.h |   1 +
 5 files changed, 184 insertions(+)
 create mode 100644 drivers/virt/vmgenid.c

-- 
2.35.1


