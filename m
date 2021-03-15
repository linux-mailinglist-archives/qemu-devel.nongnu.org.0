Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D302F33AB69
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:08:58 +0100 (CET)
Received: from localhost ([::1]:34396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgPR-0002oL-RA
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:08:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMv-000154-VA; Mon, 15 Mar 2021 02:06:22 -0400
Received: from forwardcorp1j.mail.yandex.net ([2a02:6b8:0:1619::183]:35796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1lLgMs-0004bk-3O; Mon, 15 Mar 2021 02:06:19 -0400
Received: from sas1-ec30c78b6c5b.qloud-c.yandex.net
 (sas1-ec30c78b6c5b.qloud-c.yandex.net
 [IPv6:2a02:6b8:c14:2704:0:640:ec30:c78b])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id C824A2E157B;
 Mon, 15 Mar 2021 09:06:12 +0300 (MSK)
Received: from sas1-24e978739efd.qloud-c.yandex.net
 (sas1-24e978739efd.qloud-c.yandex.net [2a02:6b8:c14:3088:0:640:24e9:7873])
 by sas1-ec30c78b6c5b.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 IZMfUqca6F-6CYu8Kik; Mon, 15 Mar 2021 09:06:12 +0300
Precedence: bulk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1615788372; bh=a+p3zUwz6uuCvRQWqILxBncvTStIwgJWk2PhKVAHarY=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=O03eXWgd3EHdyk/nHANmPFqgrVd/uJYPezq1pM1pQxNYd30mWBlAFd3BvDNDDhjn4
 CNiiIjtzEfdR9sKFF9PYBjXyb8tO5rMFe0mBwRhABbW5bi2qZgPuSWFmL7jA9hYugs
 BWLd/KgpoaEsCk6NvQJOZrxShaL7UlyxnL5Bercw=
Authentication-Results: sas1-ec30c78b6c5b.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:23::1:15])
 by sas1-24e978739efd.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 FoAWGMWkZt-6Cn0Kwd0; Mon, 15 Mar 2021 09:06:12 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] block/nbd: decouple reconnect from drain
Date: Mon, 15 Mar 2021 09:06:04 +0300
Message-Id: <20210315060611.2989049-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a02:6b8:0:1619::183;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1j.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>, yc-core@yandex-team.ru
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The reconnection logic doesn't need to stop while in a drained section.=0D
Moreover it has to be active during the drained section, as the requests=0D
that were caught in-flight with the connection to the server broken can=0D
only usefully get drained if the connection is restored.  Otherwise such=0D
requests can only either stall resulting in a deadlock (before=0D
8c517de24a), or be aborted defeating the purpose of the reconnection=0D
machinery (after 8c517de24a).=0D
=0D
This series aims to just stop messing with the drained section in the=0D
reconnection code.=0D
=0D
While doing so it undoes the effect of 5ad81b4946 ("nbd: Restrict=0D
connection_co reentrance"); as I've missed the point of that commit I'd=0D
appreciate more scrutiny in this area.=0D
=0D
Roman Kagan (7):=0D
  block/nbd: avoid touching freed connect_thread=0D
  block/nbd: use uniformly nbd_client_connecting_wait=0D
  block/nbd: assert attach/detach runs in the proper context=0D
  block/nbd: transfer reconnection stuff across aio_context switch=0D
  block/nbd: better document a case in nbd_co_establish_connection=0D
  block/nbd: decouple reconnect from drain=0D
  block/nbd: stop manipulating in_flight counter=0D
=0D
 block/nbd.c  | 191 +++++++++++++++++++++++----------------------------=0D
 nbd/client.c |   2 -=0D
 2 files changed, 86 insertions(+), 107 deletions(-)=0D
=0D
-- =0D
2.30.2=0D
=0D

