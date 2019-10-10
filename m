Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 368A3D26F6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 12:10:53 +0200 (CEST)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIVPH-0005EG-RS
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41073)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1iIVNb-0003tn-Iq
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 06:09:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1iIVNa-00069m-IK
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 06:09:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47598)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1iIVNX-000679-Nj; Thu, 10 Oct 2019 06:09:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6D0802DA980;
 Thu, 10 Oct 2019 10:09:01 +0000 (UTC)
Received: from localhost (unknown [10.36.118.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E8EE5D6B2;
 Thu, 10 Oct 2019 10:09:00 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 0/2] qcow2: Limit total allocation range to INT_MAX
Date: Thu, 10 Oct 2019 12:08:56 +0200
Message-Id: <20191010100858.1261-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 10 Oct 2019 10:09:01 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

Hi,

While looking for why handle_alloc_space() seems to cause issues on
ppc64le+XFS (performance degradation and data corruption), I spotted
this other issue.  It isn=E2=80=99t as bad, but still needs fixing.

See patch 1 for what is fixed and patch 2 for what breaks otherwise.


Max Reitz (2):
  qcow2: Limit total allocation range to INT_MAX
  iotests: Test large write request to qcow2 file

 block/qcow2-cluster.c      |  5 ++-
 tests/qemu-iotests/268     | 83 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/268.out |  9 +++++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/268
 create mode 100644 tests/qemu-iotests/268.out

--=20
2.21.0


