Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2E7D806E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 21:39:54 +0200 (CEST)
Received: from localhost ([::1]:57398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKSfh-0002Ge-Ey
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 15:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40741)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iKSb7-0005OC-Do
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 15:35:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iKSb6-0006U2-EN
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 15:35:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iKSb2-0006SN-T6; Tue, 15 Oct 2019 15:35:05 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2625C2A09AD;
 Tue, 15 Oct 2019 19:35:04 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-168.phx2.redhat.com [10.3.116.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A43B719C4F;
 Tue, 15 Oct 2019 19:35:03 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] tests: More iotest 223 improvements
Date: Tue, 15 Oct 2019 14:35:00 -0500
Message-Id: <20191015193503.25591-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.38]); Tue, 15 Oct 2019 19:35:04 +0000 (UTC)
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
Cc: qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[subject line kept for continuity with v1, but now touches much more]

Max suggested that instead of special-casing just 223 to trace QMP
input as well output, that we should instead patch common.qemu to do
it for all tests.  That in turn found that test 173 has been broken
since v3.0.  Max also suggested that 223 use a for loop rather than
massive code duplication, which does indeed look nicer.

Eric Blake (3):
  iotests: Fix 173
  iotests: Include QMP input in .out files
  tests: More iotest 223 improvements

 tests/qemu-iotests/common.qemu |   9 +++
 tests/qemu-iotests/085.out     |  26 +++++++++
 tests/qemu-iotests/094.out     |   4 ++
 tests/qemu-iotests/095.out     |   2 +
 tests/qemu-iotests/109.out     |  88 +++++++++++++++++++++++++++++
 tests/qemu-iotests/117.out     |   5 ++
 tests/qemu-iotests/127.out     |   4 ++
 tests/qemu-iotests/140.out     |   5 ++
 tests/qemu-iotests/141.out     |  26 +++++++++
 tests/qemu-iotests/143.out     |   3 +
 tests/qemu-iotests/144.out     |   5 ++
 tests/qemu-iotests/153.out     |  11 ++++
 tests/qemu-iotests/156.out     |  11 ++++
 tests/qemu-iotests/161.out     |   8 +++
 tests/qemu-iotests/173         |   4 +-
 tests/qemu-iotests/173.out     |  10 +++-
 tests/qemu-iotests/182.out     |   8 +++
 tests/qemu-iotests/183.out     |  11 ++++
 tests/qemu-iotests/185.out     |  18 ++++++
 tests/qemu-iotests/191.out     |   8 +++
 tests/qemu-iotests/200.out     |   1 +
 tests/qemu-iotests/223         |  16 +++++-
 tests/qemu-iotests/223.out     | 100 +++++++++++++++++++++++++++++++++
 tests/qemu-iotests/229.out     |   3 +
 tests/qemu-iotests/249.out     |   6 ++
 25 files changed, 387 insertions(+), 5 deletions(-)

--=20
2.21.0


