Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6C234F8CF
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 08:34:12 +0200 (CEST)
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRUQd-0002Qa-1j
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 02:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIL-0004Zi-6c; Wed, 31 Mar 2021 02:25:37 -0400
Received: from ozlabs.org ([203.11.71.1]:58985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lRUIG-0000or-4b; Wed, 31 Mar 2021 02:25:36 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4F9GX63hf6z9sWQ; Wed, 31 Mar 2021 17:25:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1617171926;
 bh=w6ivpbr18ircZ7iUjcRH4h/+gzbrnDyxEw8rPmOq160=;
 h=From:To:Cc:Subject:Date:From;
 b=Kj1NujUhqTkQiF6Ez17OptuHyRQ9eYEwb949ALz/DCCn5FeQoF0i7o9OHs/ZfHdUZ
 vUZp2Q2UFMQhK6icDL0yy5G0blw0nL9lX2GMYEt7FJOOscVP3+u8XxbXpOr5bJWUcB
 Rb70alhuTPDvSgnqhkzBfnk59TTW6rTQHqJV3t5Y=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 0/5] ppc-for-6.0 queue 20210331
Date: Wed, 31 Mar 2021 17:25:19 +1100
Message-Id: <20210331062524.335749-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 6d40ce00c1166c317e298ad82ecf10e650c4f87d:

  Update version for v6.0.0-rc1 release (2021-03-30 18:19:07 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210331

for you to fetch changes up to 611ac0a60fdcc7422bf42ef9b467abf4fdbea1a2:

  hw/net: fsl_etsec: Tx padding length should exclude CRC (2021-03-31 11:10:50 +1100)

----------------------------------------------------------------
ppc patch queue for 2021-03-31

Here's another set of patches for the ppc target and associated
machine types.  I'd hoped to send this closer to the hard freeze, but
got caught up for some time chasing what looked like a strange
regression, before finally concluding it was due to unrelated failures
on the CI.

This is just a handful of fairly straightforward fixes, plus one
performance improvement that's simple and beneficial enough that I'm
considering it a "performance bug fix".

----------------------------------------------------------------
Alexey Kardashevskiy (1):
      spapr: Fix typo in the patb_entry comment

Bin Meng (2):
      hw/ppc: e500: Add missing #address-cells and #size-cells in the eTSEC node
      hw/net: fsl_etsec: Tx padding length should exclude CRC

Greg Kurz (2):
      target/ppc/kvm: Cache timebase frequency
      spapr: Assert DIMM unplug state in spapr_memory_unplug()

 hw/net/fsl_etsec/rings.c |  2 +-
 hw/ppc/e500.c            |  2 ++
 hw/ppc/spapr.c           |  3 +++
 include/hw/ppc/spapr.h   |  2 +-
 target/ppc/kvm.c         | 25 +++++++++++++++++++------
 5 files changed, 26 insertions(+), 8 deletions(-)

