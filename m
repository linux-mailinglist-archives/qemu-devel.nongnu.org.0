Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C83C7534F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 17:58:07 +0200 (CEST)
Received: from localhost ([::1]:33318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqg86-0002y7-4e
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 11:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54702)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mreitz@redhat.com>) id 1hqg7h-0002Hc-Up
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:57:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1hqg7h-0006ID-1n
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:57:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44498)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1hqg7e-0006HN-Vc; Thu, 25 Jul 2019 11:57:39 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 418E330A7C6B;
 Thu, 25 Jul 2019 15:57:38 +0000 (UTC)
Received: from localhost (ovpn-117-225.ams2.redhat.com [10.36.117.225])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B401319D7C;
 Thu, 25 Jul 2019 15:57:37 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 25 Jul 2019 17:57:28 +0200
Message-Id: <20190725155735.11872-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 25 Jul 2019 15:57:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/7] vmdk: Misc fixes
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I made the mistake of trying to run the iotests with all non-default
subformats our vmdk driver has to offer:
- monolithicFlat
- twoGbMaxExtentSparse
- twoGbMaxExtentFlat
- streamOptimized

Many things broke, so this series fixes what I found.  It=E2=80=99s mostl=
y just
iotest fixes, but there are actually two real fixes in here.


Max Reitz (7):
  iotests: Fix _filter_img_create()
  vmdk: Use bdrv_dirname() for relative extent paths
  iotests: Keep testing broken relative extent paths
  vmdk: Reject invalid compressed writes
  iotests: Disable broken streamOptimized tests
  iotests: Disable 110 for vmdk.twoGbMaxExtentSparse
  iotests: Disable 126 for some vmdk subformats

 block/vmdk.c                     | 64 ++++++++++++++++++++++----------
 tests/qemu-iotests/002           |  1 +
 tests/qemu-iotests/003           |  1 +
 tests/qemu-iotests/005           |  3 +-
 tests/qemu-iotests/009           |  1 +
 tests/qemu-iotests/010           |  1 +
 tests/qemu-iotests/011           |  1 +
 tests/qemu-iotests/017           |  3 +-
 tests/qemu-iotests/018           |  3 +-
 tests/qemu-iotests/019           |  3 +-
 tests/qemu-iotests/020           |  3 +-
 tests/qemu-iotests/027           |  1 +
 tests/qemu-iotests/032           |  1 +
 tests/qemu-iotests/033           |  1 +
 tests/qemu-iotests/034           |  3 +-
 tests/qemu-iotests/037           |  3 +-
 tests/qemu-iotests/059           | 34 ++++++++++++++++-
 tests/qemu-iotests/059.out       | 24 +++++++-----
 tests/qemu-iotests/063           |  3 +-
 tests/qemu-iotests/072           |  1 +
 tests/qemu-iotests/105           |  3 +-
 tests/qemu-iotests/110           |  3 +-
 tests/qemu-iotests/126           |  6 +++
 tests/qemu-iotests/197           |  1 +
 tests/qemu-iotests/215           |  1 +
 tests/qemu-iotests/251           |  1 +
 tests/qemu-iotests/common.filter |  4 +-
 27 files changed, 131 insertions(+), 43 deletions(-)

--=20
2.21.0


