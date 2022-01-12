Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B648CE19
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:58:21 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7ldM-000359-4E
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIg-0008Oc-Cx
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:36:59 -0500
Received: from [2a00:1450:4864:20::541] (port=46664
 helo=mail-ed1-x541.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIe-00051z-L2
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:36:58 -0500
Received: by mail-ed1-x541.google.com with SMTP id k15so15133782edk.13
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 13:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8xGQ/ecRo26di/B41Bp7PLunE7rrSrF8qTipT4e9ak=;
 b=okDfTWK5x7JAAgiqWqhnaQ4ncSTX2qf2+nj9XEy4PZqAD9MUT+Ovj91gMmXlB9EJvG
 DghtTFvDOIaPa22uS73+Q2CT3tU76y8OaaZZcUmcLnv1BNCWd7abvmv07B1oppyRfVZ9
 F2f7OBgqHLmhpDxV9ctMjZOACMKrEkYpKMGzykT4MxCQButa+aaUc4pDNOYZAnCpGPhP
 rA8mEedqDxeUrbzh3kn0ohsYsMOc3d2FH3Og0221Gap8ziUbZ3JGGGg5cDUlLqfjeCYA
 wXl6BBjezlRnD3y6XqBFLICaGxvDmIB7qTUiMhflxwbSn/rN3ld67iIbS1aPuH5u2zrn
 4lZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F8xGQ/ecRo26di/B41Bp7PLunE7rrSrF8qTipT4e9ak=;
 b=IxBKvZqEdro72GpVsRf4SiG2R1vSH5Vg2SUBOC5NQ4eW8DY7U7q1rrd/UBFbgzBGHd
 DvST0ugVK/Jv1FHsjCIoU4HrDXJbsbFhtS6RsV/FOsK5koqqsIT0qNFc6p+UCms5yI1g
 j9igG48YopRiaX4aUfUMWPTZuIa+XXNWqOX2s3JMp7a8QPssFXZ67V3mgHUhhK+tcVcc
 57N1KMacWS7wwcn4idVTkFHneeWJK1Cnj+DdEIbaZuW8qvKwIDOIvVzy5LSXUrhIzqnE
 bhe9Q+5UdwHNb8NBcCpAI7Rxb5539hy92sB/+dbtAej/ZBkjXaQu2+93Mw1tbJqssade
 BD+Q==
X-Gm-Message-State: AOAM532dDiziefTCaV7rv5Qa6LorfvovngaL49yInEaotIu9BQLKOs3s
 2pTBfJOhqLu9INMMeC8DhcxvpuBDaOL0ipJh7Nk=
X-Google-Smtp-Source: ABdhPJy8x+QbUaTFK31dSBrKdJXRqA6ULSw/j7EVmuPP2ke8MW4GLc4OepmZa6L9ZO89GsXEJS2sLA==
X-Received: by 2002:a17:906:4fd6:: with SMTP id
 i22mr1261536ejw.70.1642023413095; 
 Wed, 12 Jan 2022 13:36:53 -0800 (PST)
Received: from osoxes.fritz.box (mue-88-130-49-239.dsl.tropolys.de.
 [88.130.49.239])
 by smtp.gmail.com with ESMTPSA id b2sm257288ejh.221.2022.01.12.13.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:36:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] malta: Move PCI interrupt handling from gt64xxx to piix4
Date: Wed, 12 Jan 2022 22:36:25 +0100
Message-Id: <20220112213629.9126-1-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::541
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x541.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Jan 2022 16:56:17 -0500
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
Cc: Bernhard Beschow <shentey@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

first-time contributor here. Inspired by an article in LWN [1] I figured I'd
get my hands dirty with QEMU development. According to the article my goal is
to eliminate some "accidental complexity".

While studying the code I noticed some (accidental?) differences between piix3
and piix4 where the PCI interrupts are handled. Moreover, I noticed presence of
global variables in piix4 which probably constitute a limitation of QOM's idea
of configuration-driven machine creation. By applying piix3 concepts, i.e.
moving the interrupt handling from gt64xxx to piix4, it's possible to both
eliminate the differences and resolve the global variables.

The patch series is structured as follows: Patch 1 eliminates the differences,
patch 3 resolves the global variables. Patch 2 is a preparation for patch 3.
Some of my further comments regarding the patches are:

Patch 1:
* pci_slot_get_pirq() looks quite malta-specific. Neither gt64xxx nor piix4
  seem to be the perfect fit. So I moved it to piix4, analogous to piix3.
* The i8259 property moved from MaltaState to PIIX4State looks quite redundant
  to the isa property. Could isa be used instead, eliminating i8259?

Patch 2:
* Besides piix4, there were four further cases where the PIC array was passed
  as the opaque parameter to the pci_map_irq_fn's. AFAICS in all other cases
  the DeviceState is passed instead. With this patch, consistency is
  esablished.
* Passing PIIX4State to piix4_set_irq() paves the way for eliminating all
  global variables left in piix4.c (see patch 3).

Comments welcome.

Cheers
Bernhard

[1] https://lwn.net/Articles/872321/

Bernhard Beschow (3):
  malta: Move PCI interrupt handling from gt64xxx to piix4
  pci: Always pass own DeviceState to pci_map_irq_fn's
  isa/piix4: Resolve global variables

 hw/isa/piix4.c                | 62 ++++++++++++++++++++++++++++++++---
 hw/mips/gt64xxx_pci.c         | 62 +++--------------------------------
 hw/mips/malta.c               |  6 +---
 hw/pci-host/sh_pci.c          |  6 ++--
 hw/pci-host/versatile.c       |  6 ++--
 hw/ppc/ppc440_pcix.c          |  6 ++--
 hw/ppc/ppc4xx_pci.c           |  6 ++--
 include/hw/mips/mips.h        |  2 +-
 include/hw/southbridge/piix.h |  2 --
 9 files changed, 77 insertions(+), 81 deletions(-)

-- 
2.34.1


