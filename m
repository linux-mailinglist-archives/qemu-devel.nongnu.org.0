Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB664C13E1
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 14:17:25 +0100 (CET)
Received: from localhost ([::1]:47134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMrWF-0006m9-EN
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 08:17:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMrS3-0004yd-QM
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:13:03 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=pbN1=TG=zx2c4.com=Jason@kernel.org>)
 id 1nMrS1-0004tR-Jn
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 08:13:03 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1C54AB80B3E;
 Wed, 23 Feb 2022 13:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533DEC340F0;
 Wed, 23 Feb 2022 13:12:53 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="p2uLwLyr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1645621971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yDH6L5SfKXyei5pTTzcAk9yjz7NgT/Zl7Px1eWnwpqQ=;
 b=p2uLwLyrNMQ8HTaqGPewS3XX209s7oJqJ9miRcoY1DtAZT8hviF4SxAj5On0Im2pbnBr3p
 qozPAZOFG4amHtvVOWAclMD5HdWA5Oi9z78mYqPXXrH2JsBBaqdcZS4CZ649Pcqn51y//z
 udUOOwgOLtSyOIgtQw8+TrDExV8xsig=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 57f5dfd0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Wed, 23 Feb 2022 13:12:50 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, linux-s390@vger.kernel.org,
 adrian@parity.io
Subject: [PATCH RFC v1 0/2] VM fork detection for RNG
Date: Wed, 23 Feb 2022 14:12:29 +0100
Message-Id: <20220223131231.403386-1-Jason@zx2c4.com>
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, tytso@mit.edu, jannh@google.com,
 gregkh@linuxfoundation.org, raduweis@amazon.com, acatan@amazon.com,
 graf@amazon.com, colmmacc@amazon.com, sblbir@amazon.com, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This small series picks up work from Amazon that seems to have stalled
out later year around this time: listening for the vmgenid ACPI
notification, and using it to "do something." Last year, that something
involved a complicated userspace mmap chardev, which seems frought with
difficulty. This year, I have something much simpler in mind: simply
using those ACPI notifications to tell the RNG to reinitialize safely,
so we don't repeat random numbers in cloned, forked, or rolled-back VM
instances.

This series consists of two patches. The first is a rather
straightforward addition to random.c, which I feel fine about. The
second patch is the reason this is just an RFC: it's a cleanup of the
ACPI driver from last year, and I don't really have much experience
writing, testing, debugging, or maintaining these types of drivers.
Ideally this thread would yield somebody saying, "I see the intent of
this; I'm happy to take over ownership of this part." That way, I can
focus on the RNG part, and whoever steps up for the paravirt ACPI part
can focus on that.

As a final note, this series intentionally does _not_ focus on
notification of these events to userspace or to other kernel consumers.
Since these VM fork detection events first need to hit the RNG, we can
later talk about what sorts of notifications or mmap'd counters the RNG
should be making accessible to elsewhere. But that's a different sort of
project and ties into a lot of more complicated concerns beyond this
more basic patchset. So hopefully we can keep the discussion rather
focused here to this ACPI business.

Cc: dwmw@amazon.co.uk
Cc: acatan@amazon.com
Cc: graf@amazon.com
Cc: colmmacc@amazon.com
Cc: sblbir@amazon.com
Cc: raduweis@amazon.com
Cc: jannh@google.com
Cc: gregkh@linuxfoundation.org
Cc: tytso@mit.edu

Jason A. Donenfeld (2):
  random: add mechanism for VM forks to reinitialize crng
  drivers/virt: add vmgenid driver for reinitializing RNG

 drivers/char/random.c  |  58 ++++++++++++++++++
 drivers/virt/Kconfig   |   8 +++
 drivers/virt/Makefile  |   1 +
 drivers/virt/vmgenid.c | 133 +++++++++++++++++++++++++++++++++++++++++
 include/linux/random.h |   1 +
 5 files changed, 201 insertions(+)
 create mode 100644 drivers/virt/vmgenid.c

-- 
2.35.1


