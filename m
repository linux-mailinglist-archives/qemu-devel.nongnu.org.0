Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9926ABED2
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 19:34:25 +0200 (CEST)
Received: from localhost ([::1]:58939 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6I7s-0005Tf-At
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 13:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1i6I5v-0003je-Md
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:32:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1i6I5t-000384-SP
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 13:32:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41612)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1i6I5f-0002wE-DK; Fri, 06 Sep 2019 13:32:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D92BF1917F5E;
 Fri,  6 Sep 2019 17:32:05 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 905CC5D9D3;
 Fri,  6 Sep 2019 17:32:03 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  6 Sep 2019 20:31:58 +0300
Message-Id: <20190906173201.7926-1-mlevitsk@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Fri, 06 Sep 2019 17:32:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/3] Fix qcow2+luks corruption introduced by
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
 Maxim Levitsky <mlevitsk@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 8ac0f15f335 accidently broke the COW of non changed areas
of newly allocated clusters, when the write spans multiple clusters,
and needs COW both prior and after the write.
This results in 'after' COW area beeing encrypted with wrong
sector address, which render it corrupted.

Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1745922

CC: qemu-stable <qemu-stable@nongnu.org>

Best regards,
	Maxim Levitsky

Maxim Levitsky (3):
  block/qcow2: refactoring of threaded encryption code
  block/qcow2: fix the corruption when rebasing luks encrypted files
  qemu-iotests: test for bz #1745922

 block/qcow2-cluster.c      | 26 +++++++------
 block/qcow2-threads.c      | 53 ++++++++++++++++++++------
 tests/qemu-iotests/263     | 76 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/263.out | 19 ++++++++++
 tests/qemu-iotests/group   |  1 +
 5 files changed, 153 insertions(+), 22 deletions(-)
 create mode 100755 tests/qemu-iotests/263
 create mode 100644 tests/qemu-iotests/263.out

-- 
2.17.2


