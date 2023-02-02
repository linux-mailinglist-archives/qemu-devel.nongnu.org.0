Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA1E687E84
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 14:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNZXH-0006Q4-Au; Thu, 02 Feb 2023 08:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pNZXE-0006PI-Sa
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:21:53 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaxun.yang@flygoat.com>)
 id 1pNZXD-0001Iw-0p
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 08:21:52 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B571B5C0058;
 Thu,  2 Feb 2023 08:21:47 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 02 Feb 2023 08:21:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm1; t=1675344107; x=1675430507; bh=sDstMVXYg0A6r2cwbLNdvO8iu
 FM+JDIspm5s7BfduPQ=; b=rzV303Ojqjne0YcZGdJFKJZs5BnVYkcUrf2busoM5
 Vvxw1WD0LU3XsVFIF5nOUbH/Wulf43c/38W+n0F762teMiV3L6i2catBrIJgectd
 BZtsHTeuVvidcJotxqi3sSpZedl1uYLaXsgEi+7Y3nuGX/ej7CFlPQn5ssZUuRX1
 jjNsdwT4uHtkSKVgyVJFRk7tkEw90WTLz/UOn01x4glK3GQ6sZOK6GSp6b4ezvH/
 iewwlM/HeQkZBUeRf8OCYB63rouw9gHtefAjel5r6c6Qb2xKw94Km8x3luMDY4QJ
 eRYp9nuRSpDHA5WEGwQDt6KGs73OKsTEi5AN0LqLVkJHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1675344107; x=1675430507; bh=sDstMVXYg0A6r2cwbLNdvO8iuFM+JDIspm5
 s7BfduPQ=; b=ZEOLx/ECQCkyf2WJXMYuRvyXatfC/jDba9i5AaTWv3j43VRdQ7P
 x2ItbuhBu0on29ZEo5Jk57Rrk2QmdmhHaAvwwz1sCTwAwxXdAmqhN8YQ/Wz2ryJ0
 bTKMLEmbM33pn3lfVMSCFWZwV456nJ/kf1cll6knXJAAShgV+lctlgzu0GSyTalN
 PyRyRIRd8iO8rn5UBITwuAVu8JVhjZBgh9GgO7faQvgV6i04dgo+99jNLSTt8pTk
 5SEz2foNJvRUMUp52pEtkopCZ0iLP6QPWVVWN0LwaYX/mqiFQWEraebOXQKWv/nh
 dH2EVSbocjfKqs8k7YcuuU5532VzlncqFjw==
X-ME-Sender: <xms:67jbY1slgefMKrg_KIR9VqYM4i0PmDsoNBzdVqbAp6Z2loa6TBFEXQ>
 <xme:67jbY-fFZjssxAdD5I1EGovFsVYYTpeFZVbwnppWBv2qki_ONwpebkYL2-nriwM__
 v_HNdX_orbw4fJWkes>
X-ME-Received: <xmr:67jbY4wl5FrAvT8ldmTJIh4nvQAPw5PNsZzejyJocLUePm0kAYodCYxQ76RU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudefkedggeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
 ertddtnecuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhephfetuddtudevieeljeejte
 ffheeujeduhefgffejudfhueelleduffefgfffveeknecuvehluhhsthgvrhfuihiivgep
 tdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgoh
 grthdrtghomh
X-ME-Proxy: <xmx:67jbY8Mw0_bwxwl6QtfTP9ejKSR2da3-kOUn9quFDTtdeufrAeB_LQ>
 <xmx:67jbY1-5wh-9c1zH3PnGg6rXQ0IFNGrFVrGYrYDo8Gh4I3x6ZOQhRQ>
 <xmx:67jbY8Xj7j4Kj4tSiy9iXXQ0BooD2z0Zrv3Zc4ucLyCi-xFGxS5qMQ>
 <xmx:67jbY3LzwZEehkJ_teL-JUmrrnr6asuaE0jCJrgsE5rEZVTR4f61HA>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Feb 2023 08:21:46 -0500 (EST)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, balaton@eik.bme.hu,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 0/3] MIPS Virt machine
Date: Thu,  2 Feb 2023 13:21:35 +0000
Message-Id: <20230202132138.30945-1-jiaxun.yang@flygoat.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=jiaxun.yang@flygoat.com;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi there,

This patchset is to add a new machine type for MIPS architecture, which
is purely a VirtIO machine.

It is design to utilize existing VirtIO infrastures but also comptitable
with MIPS's existing internal simulation tools.

It should be able to cooperate with any MIPS core and boot Generic MIPS
kernel.

For testing purpose I've built little endian kernel[1] to work with this
machine with R4X00, loongson2f, octeon, mips32r2, mips64r2 and mips64r6. 

TODO:
- Documentation
- Test against big endian kernel
- nanoMIPS options

Thanks

Jiaxun Yang (3):
  docs/system: Remove "mips" board from target-mips.rst
  hw/misc: Add MIPS Trickbox device
  hw/mips: Add MIPS virt board

 MAINTAINERS                             |    7 +
 configs/devices/mips-softmmu/common.mak |    1 +
 docs/system/target-mips.rst             |   26 +-
 hw/mips/Kconfig                         |   18 +
 hw/mips/meson.build                     |    1 +
 hw/mips/virt.c                          | 1015 +++++++++++++++++++++++
 hw/misc/Kconfig                         |    3 +
 hw/misc/meson.build                     |    1 +
 hw/misc/mips_trickbox.c                 |   97 +++
 hw/misc/trace-events                    |    4 +
 include/hw/misc/mips_trickbox.h         |   41 +
 11 files changed, 1206 insertions(+), 8 deletions(-)
 create mode 100644 hw/mips/virt.c
 create mode 100644 hw/misc/mips_trickbox.c
 create mode 100644 include/hw/misc/mips_trickbox.h

-- 
2.37.1 (Apple Git-137.1)


