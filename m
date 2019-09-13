Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD547B235D
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Sep 2019 17:29:07 +0200 (CEST)
Received: from localhost ([::1]:45244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8nVR-0000gG-Ul
	for lists+qemu-devel@lfdr.de; Fri, 13 Sep 2019 11:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53144)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1i8nSL-0006kE-AK
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:25:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1i8nSK-0003Qp-Ck
 for qemu-devel@nongnu.org; Fri, 13 Sep 2019 11:25:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>)
 id 1i8nSI-0003Kj-F1; Fri, 13 Sep 2019 11:25:50 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B200D3090FC1;
 Fri, 13 Sep 2019 15:25:49 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 867D81001959;
 Fri, 13 Sep 2019 15:25:43 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 13 Sep 2019 17:25:06 +0200
Message-Id: <20190913152507.56197-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 13 Sep 2019 15:25:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 0/2] blockdev: avoid acquiring AioContext
 lock twice at do_drive_backup()
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 Sergio Lopez <slp@redhat.com>, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

do_drive_backup() acquires the AioContext lock of the corresponding
BlockDriverState. This is not a problem when it's called from
qmp_drive_backup(), but drive_backup_prepare() also acquires the lock
before calling it.

Additionally, Max Reitz pointed out that bdrv_try_set_aio_context() is
called at do_backup_common() with the new context held, and the old
context not held, while it expects it to be the other way
around. This is also the case for other uses of that function on
blockdev.c.

This patch series fixes all occurrences of bdrv_try_set_aio_context()
to honor the context requirements. It also changes
drive_backup_prepare() to release the context before calling
do_drive_backup().

---
Changelog

v2:
 - Honor bdrv_try_set_aio_context() context acquisition requirements
   (thanks Max Reitz).
 - Release the context at drive_backup_prepare() instead of avoiding
   re-acquiring it at do_drive_baclup(). (thanks Max Reitz)
 - Convert a single patch into a two-patch series.
---

Sergio Lopez (2):
  blockdev: release the AioContext at drive_backup_prepare
  blockdev: honor bdrv_try_set_aio_context() context requirements

 blockdev.c | 127 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 76 insertions(+), 51 deletions(-)

--=20
2.21.0


