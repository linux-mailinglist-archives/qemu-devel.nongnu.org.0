Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438D65F10A
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:22:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDT0M-00038f-MM; Thu, 05 Jan 2023 11:22:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pdel@pdel-mbp.localdomain>)
 id 1pDT0G-00034f-8w
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:22:04 -0500
Received: from [163.114.132.7] (helo=pdel-mbp.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pdel@pdel-mbp.localdomain>) id 1pDT0E-0004hB-Fy
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:22:03 -0500
Received: by pdel-mbp.localdomain (Postfix, from userid 501)
 id 1CD6CC3BBBF; Thu,  5 Jan 2023 01:13:49 -0800 (PST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: samuel.thibault@ens-lyon.org, jasowang@redhat.com, eblake@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, Peter Delevoryas <peter@pjd.dev>
Subject: [PATCH 0/1] net/slirp: Add mfr-id and oob-eth-addr parameters
Date: Thu,  5 Jan 2023 01:13:44 -0800
Message-Id: <20230105091345.49757-1-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 163.114.132.7 (failed)
Received-SPF: none client-ip=163.114.132.7;
 envelope-from=pdel@pdel-mbp.localdomain; helo=pdel-mbp.localdomain
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NO_DNS_FOR_FROM=0.001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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

This adds mfr-id and oob-eth-addr parameters to the userspace netdev backend.

    -netdev user,id=[str],mfr-id=[uint32],oob-eth-addr=[MAC address]

I introduced mfr-id and oob-eth-addr to slirp a while ago, as part of Slirp
config version 5, but never managed to get the options exposed in upstream QEMU
(I've just been maintaining my own patches).

This is useful for testing NC-SI OEM commands, which are critical for bringing
up the network path for lots of BMC's in data centers. So like, OpenBMC devs
would be interested in this.

I tried to submit this change a long time ago, but failed cause I wasn't sure
exactly how to gate this on the slirp version.

My strategy was actually not to use the slirp version (e.g. 4.7.0) to check for
this, but to use the slirp config version. This is different, but correct, I
think? If we don't use the slirp config version, we have to create a new slirp
release, 4.8.0. But, I don't see the point of that, because we already have a
version number exposed for the SlirpConfig.

Thanks,
Peter

Peter Delevoryas (1):
  net/slirp: Add mfr-id and oob-eth-addr parameters

 net/slirp.c   | 19 ++++++++++++++++---
 qapi/net.json |  9 ++++++++-
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.31.1


