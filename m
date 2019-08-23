Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE10B9B073
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 15:10:28 +0200 (CEST)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i19Kl-0006eg-R7
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 09:10:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1i19ET-0000f7-PG
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:04:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1i19ES-0003uC-Lc
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:03:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40250)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>)
 id 1i19EK-0003ln-Aq; Fri, 23 Aug 2019 09:03:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6CBB430655F5;
 Fri, 23 Aug 2019 13:03:45 +0000 (UTC)
Received: from localhost (ovpn-204-96.brq.redhat.com [10.40.204.96])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5F6360126;
 Fri, 23 Aug 2019 13:03:42 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 23 Aug 2019 15:03:39 +0200
Message-Id: <20190823130341.21550-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 23 Aug 2019 13:03:45 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/2] block/file-posix: Reduce xfsctl() use
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
Cc: =?UTF-8?q?Luk=C3=A1=C5=A1=20Doktor?= <ldoktor@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

As suggested by Paolo, this series drops xfsctl() calls where we have
working fallocate() alternatives.  (And thus replaces =E2=80=9Cblock/file=
-posix:
Fix xfs_write_zeroes()=E2=80=9D.)

Unfortunately, we also use xfsctl() to inquire the request alignment for
O_DIRECT, and this is the only way we currently have to obtain it
without trying.  Therefore, I didn=E2=80=99t quite like removing that cal=
l, too,
so this series doesn=E2=80=99t get rid of xfsctl() completely.

(If we did, we could delete 146 lines instead of these measly 76 here.)


Anyway, dropping xfs_write_zeroes() will also fix the guest corruptions
Luk=C3=A1=C5=A1 has reported (for qcow2, but I think it should be possibl=
e to see
similar corruptions with raw, although I haven=E2=80=99t investigated tha=
t too
far).


Max Reitz (2):
  block/file-posix: Reduce xfsctl() use
  iotests: Test reverse sub-cluster qcow2 writes

 block/file-posix.c         | 77 +-------------------------------------
 tests/qemu-iotests/265     | 67 +++++++++++++++++++++++++++++++++
 tests/qemu-iotests/265.out |  6 +++
 tests/qemu-iotests/group   |  1 +
 4 files changed, 75 insertions(+), 76 deletions(-)
 create mode 100755 tests/qemu-iotests/265
 create mode 100644 tests/qemu-iotests/265.out

--=20
2.21.0


