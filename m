Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE5335D471
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 02:28:47 +0200 (CEST)
Received: from localhost ([::1]:44090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW6v7-0001wF-QT
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 20:28:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tO-0000Xe-3Y; Mon, 12 Apr 2021 20:26:58 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:41709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1lW6tL-0006Nc-UJ; Mon, 12 Apr 2021 20:26:57 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FK5yL3897z9sWX; Tue, 13 Apr 2021 10:26:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618273610;
 bh=VaMHaBv9HwPhhuVOvFvOVSjeHf683TykgZXx5TLEwGc=;
 h=From:To:Cc:Subject:Date:From;
 b=B+J8+qs5Rh10NoV2ZyBs424A9hOBnLG6jvR7lmr/di18qDSL0AkMZUIZ8EgVx72Nr
 qLZ7jBJs3txPNmYwPhwZeqJj27UEFKrP0uzu4w5z4HpeBomH1hh7b09+kZp5qWgXro
 MvDY1UHlw1hewEI4XNwYMJKBjlBk80KPK24j5vho=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 0/2] ppc-for-6.0 queue 20210412
Date: Tue, 13 Apr 2021 10:26:46 +1000
Message-Id: <20210413002648.8281-1-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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

The following changes since commit 555249a59e9cdd6b58da103aba5cf3a2d45c899f:

  Merge remote-tracking branch 'remotes/ehabkost-gl/tags/x86-next-pull-request' into staging (2021-04-10 16:58:56 +0100)

are available in the Git repository at:

  https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210412

for you to fetch changes up to 2b18fc794f312a91482998bae5ea6c8724200e06:

  spapr.c: always pulse guest IRQ in spapr_core_unplug_request() (2021-04-12 12:27:14 +1000)


Ugh, sorry Peter.  I meant to sent this yesterday, but apparently
forgot to execute the last step to actuall send it out.

----------------------------------------------------------------
ppc patch queue for 2021-04-21

Here's what I hope is the last ppc related pull request for qemu-6.0.

The 2 patches here revert a behavioural change that after further
discussion we concluded was a bad idea (adding a timeout for
possibly-failed hot unplug requests).  Instead it implements a
different approach to the original problem: we again let unplug
requests the guest doesn't respond to remain pending indefinitely, but
no longer allow those to block attempts to retry the same unplug
again.

The change is a bit more complex than I'd like for this late in the
freeze.  Nonetheless, I think it's important to merge this for 6.0, so
we don't allow a release which has the probably-a-bad-idea timeout
behaviour.

----------------------------------------------------------------
Daniel Henrique Barboza (2):
      spapr: rollback 'unplug timeout' for CPU hotunplugs
      spapr.c: always pulse guest IRQ in spapr_core_unplug_request()

 hw/ppc/spapr.c             | 15 ++++++++-----
 hw/ppc/spapr_drc.c         | 52 ----------------------------------------------
 include/hw/ppc/spapr_drc.h |  5 -----
 include/qemu/timer.h       |  8 -------
 util/qemu-timer.c          | 13 ------------
 5 files changed, 10 insertions(+), 83 deletions(-)

