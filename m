Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDFE43192
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 00:12:44 +0200 (CEST)
Received: from localhost ([::1]:35384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbBU3-00086V-Js
	for lists+qemu-devel@lfdr.de; Wed, 12 Jun 2019 18:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44725)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hbBQT-0005nP-PH
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:09:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hbBQR-0006Xx-Ln
 for qemu-devel@nongnu.org; Wed, 12 Jun 2019 18:09:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hbBQL-0006R3-PD; Wed, 12 Jun 2019 18:08:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7BC4E6EB81;
 Wed, 12 Jun 2019 22:08:41 +0000 (UTC)
Received: from localhost (unknown [10.40.205.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CD41608A6;
 Wed, 12 Jun 2019 22:08:40 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 13 Jun 2019 00:08:37 +0200
Message-Id: <20190612220839.1374-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Wed, 12 Jun 2019 22:08:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] vl: Drain before (block) job cancel when
 quitting
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Quitting qemu should lead to qemu exiting pretty much immediately.  That
means if you have a block job running on a throttled block node, the
node should ignore its throttling and the job should be cancelled
immediately.

Unfortunately, that is not what happens.  Currently, the node will be
drained (with a bdrv_drain_all()), and then again unquiesced (because
bdrv_drain_all() ends).  Then, the block job is cancelled; but at this
point, the node is no longer drained, so it will block, as it befits a
throttling node.

To fix this issue, we have to keep all nodes drained while we cancel all
block jobs when quitting qemu.  This will make the throttle node ignore
its throttling and thus let the block job cancel immediately.


Max Reitz (2):
  vl: Drain before (block) job cancel when quitting
  iotests: Test quitting with job on throttled node

 vl.c                       | 11 ++++++++
 tests/qemu-iotests/218     | 55 ++++++++++++++++++++++++++++++++++++--
 tests/qemu-iotests/218.out |  4 +++
 3 files changed, 68 insertions(+), 2 deletions(-)

--=20
2.21.0


