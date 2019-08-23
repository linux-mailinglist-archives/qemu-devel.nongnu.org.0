Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 343E49B678
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 20:54:19 +0200 (CEST)
Received: from localhost ([::1]:32846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1EhW-0002H6-2k
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 14:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i1Eb8-0004WK-0D
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:47:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i1Eb6-0006WB-VZ
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:47:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47902)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i1Eb4-0006V9-FI; Fri, 23 Aug 2019 14:47:38 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BBE8330832DA;
 Fri, 23 Aug 2019 18:47:37 +0000 (UTC)
Received: from localhost (ovpn-204-96.brq.redhat.com [10.40.204.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F23BA1001938;
 Fri, 23 Aug 2019 18:47:34 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 23 Aug 2019 20:47:31 +0200
Message-Id: <20190823184733.18929-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 23 Aug 2019 18:47:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] block: Let blockdev-create return 0 on
 success
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Jobs are expected to return 0 on success.  .bdrv_co_create() on the
other hand is a block layer function, and as such returns a non-negative
value on success.

blockdev_create_run() should translate between the two (patch 1).

Without patch 1, blockdev-create is likely to fail for VPC images.
Hence patch 2.


Max Reitz (2):
  block: Let blockdev-create return 0 on success
  iotests: Test blockdev-create for vpc

 block/create.c             |   3 +-
 tests/qemu-iotests/266     | 182 +++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/266.out | 107 ++++++++++++++++++++++
 tests/qemu-iotests/group   |   1 +
 4 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/266
 create mode 100644 tests/qemu-iotests/266.out

--=20
2.21.0


