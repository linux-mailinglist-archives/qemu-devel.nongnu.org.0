Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8893A307F5E
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:18:10 +0100 (CET)
Received: from localhost ([::1]:32780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Dk1-0006JM-FL
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5Dga-0004TY-Su; Thu, 28 Jan 2021 15:14:37 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:40012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5DgU-0002jt-TK; Thu, 28 Jan 2021 15:14:35 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id B76AA2E1E89;
 Thu, 28 Jan 2021 23:14:23 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 9NyAlq4PXv-EMwm1a94; Thu, 28 Jan 2021 23:14:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611864863; bh=woLt8PtamSL9O6bsh+CpTYbUA+dgQMjovVTi1xDOvAs=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=AEK4XiJAoXEsH4eA3es86XrQnsEo6BNKW2vR09A3HtpYc5Pz3ujHsooEbOQHZezPB
 xAqgA46HF8NpS4+iTjf8EkUGCJYvdXtlEYV32yY1N4KySyAVqjx/VCZ+gfFTxpILmK
 tP3Pceni8uZ44yXCSfQesscKe7rsaQHGmLKlptmY=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:420::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fjMENJuJUJ-ELmWkN6a; Thu, 28 Jan 2021 23:14:22 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] block/nbd: fix crashers in reconnect while migrating
Date: Thu, 28 Jan 2021 23:14:15 +0300
Message-Id: <20210128201418.607640-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the final phase of migration the NBD reconnection logic may=0D
encounter situations it doesn't expect during regular operation.=0D
=0D
This series addresses some of them that make qemu crash.  They are=0D
reproducible when a vm with a secondary drive attached via nbd with=0D
non-zero "reconnect-delay" runs a stress load (fio with big queue depth)=0D
in the guest on that drive and is migrated (e.g. to a file), while the=0D
nbd server is SIGKILL-ed and restarted every second.=0D
=0D
See the individual patches for specific crash conditions and more=0D
detailed explanations.=0D
=0D
Roman Kagan (3):=0D
  block/nbd: only detach existing iochannel from aio_context=0D
  block/nbd: only enter connection coroutine if it's present=0D
  nbd: make nbd_read* return -EIO on error=0D
=0D
 include/block/nbd.h |  7 ++++---=0D
 block/nbd.c         | 25 +++++++++++++++++--------=0D
 2 files changed, 21 insertions(+), 11 deletions(-)=0D
=0D
-- =0D
2.29.2=0D
=0D

