Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063595C57D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 00:08:09 +0200 (CEST)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hi4T2-0008Px-7q
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 18:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <jsnow@redhat.com>) id 1hi3XZ-00083A-3C
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:08:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1hi3XY-0006U8-4Q
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 17:08:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56240)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1hi3XT-0006R7-Pz; Mon, 01 Jul 2019 17:08:39 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2DE3E59455;
 Mon,  1 Jul 2019 20:13:37 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-215.bos.redhat.com [10.18.17.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 588A57A4B1;
 Mon,  1 Jul 2019 20:13:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  1 Jul 2019 16:13:27 -0400
Message-Id: <20190701201330.29718-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Mon, 01 Jul 2019 20:13:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/3] qapi: block-dirty-bitmap-remove
 transaction action
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 vsementsov@virtuozzo.com, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, this is a proposal based off of Vladimir's patchset:
[Qemu-devel] [PATCH 0/4] qapi: block-dirty-bitmap-remove transaction acti=
on

It replaces patches two and three with a modified patch (now patch 2)
that foregoes the need for a hide()/unhide() bitmap API. I think it's
suitable as a smaller alternative, but I'm not sure if it covers all
of the use cases of the original series.

Patches 1 and 3 (formerly 4) included as-is.

John Snow (1):
  qapi: implement block-dirty-bitmap-remove transaction action

Vladimir Sementsov-Ogievskiy (2):
  blockdev: reduce aio_context locked sections in bitmap add/remove
  iotests: test bitmap moving inside 254

 qapi/transaction.json          |   2 +
 include/block/dirty-bitmap.h   |   3 +-
 block.c                        |   2 +-
 block/dirty-bitmap.c           |  16 ++---
 blockdev.c                     | 105 ++++++++++++++++++++++++++-------
 migration/block-dirty-bitmap.c |   2 +-
 tests/qemu-iotests/254         |  30 +++++++++-
 tests/qemu-iotests/254.out     |  82 +++++++++++++++++++++++++
 8 files changed, 208 insertions(+), 34 deletions(-)

--=20
2.21.0


