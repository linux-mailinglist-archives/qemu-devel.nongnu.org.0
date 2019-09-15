Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4CB3212
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Sep 2019 22:40:12 +0200 (CEST)
Received: from localhost ([::1]:57021 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i9bJc-0006G4-36
	for lists+qemu-devel@lfdr.de; Sun, 15 Sep 2019 16:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45811)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i9bGg-00032e-8L
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 16:37:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i9bGf-0000fC-0y
 for qemu-devel@nongnu.org; Sun, 15 Sep 2019 16:37:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59168)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i9bGZ-0000Zq-8f; Sun, 15 Sep 2019 16:37:03 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 303DD307D91F;
 Sun, 15 Sep 2019 20:37:00 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ADDA95C1D6;
 Sun, 15 Sep 2019 20:36:57 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Sep 2019 23:36:52 +0300
Message-Id: <20190915203655.21638-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sun, 15 Sep 2019 20:37:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v7 0/3] Fix qcow2+luks corruption introduced by
 commit 8ac0f15f335
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-stable <qemu-stable@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 8ac0f15f335 accidently broke the COW of non changed areas
of newly allocated clusters, when the write spans multiple clusters,
and needs COW both prior and after the write.
This results in 'after' COW area being encrypted with wrong
sector address, which render it corrupted.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1745922

CC: qemu-stable <qemu-stable@nongnu.org>

V2: grammar, spelling and code style fixes.
V3: more fixes after the review.
V4: addressed review comments from Max Reitz,
    and futher refactored the qcow2_co_encrypt to just take full host and guest offset
    which simplifies everything.

V5: reworked the patches so one of them fixes the bug
    only and other one is just refactoring

V6: removed do_perform_cow_encrypt

V7: removed do_perform_cow_encrypt take two, this
    time I hopefully did that correctly :-)
    Also updated commit names and messages a bit

Best regards,
	Maxim Levitsky

Maxim Levitsky (3):
  block/qcow2: Fix corruption introduced by commit 8ac0f15f335
  block/qcow2: refactor encryption code
  qemu-iotests: Add test for bz #1745922

 block/qcow2-cluster.c      | 40 ++++++-----------
 block/qcow2-threads.c      | 63 ++++++++++++++++++++------
 block/qcow2.c              |  5 ++-
 block/qcow2.h              |  8 ++--
 tests/qemu-iotests/263     | 91 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/263.out | 40 +++++++++++++++++
 tests/qemu-iotests/group   |  1 +
 7 files changed, 202 insertions(+), 46 deletions(-)
 create mode 100755 tests/qemu-iotests/263
 create mode 100644 tests/qemu-iotests/263.out

-- 
2.17.2


