Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C92719DCA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 15:06:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42993 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP5E7-00069M-2V
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 09:06:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52623)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hP5B0-0004PF-T2
	for qemu-devel@nongnu.org; Fri, 10 May 2019 09:03:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1hP5B0-0004Nu-0x
	for qemu-devel@nongnu.org; Fri, 10 May 2019 09:03:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:16551)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1hP5Ay-0004In-0A; Fri, 10 May 2019 09:03:00 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4CA2C3086211;
	Fri, 10 May 2019 13:02:59 +0000 (UTC)
Received: from localhost (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9380E60126;
	Fri, 10 May 2019 13:02:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2019 14:02:39 +0100
Message-Id: <20190510130243.8887-5-stefanha@redhat.com>
In-Reply-To: <20190510130243.8887-1-stefanha@redhat.com>
References: <20190510130243.8887-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Fri, 10 May 2019 13:02:59 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 4/8] block: Add coroutine_fn to
 bdrv_check_co_entry
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Nikita Alekseev <n.alekseev2104@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nikita Alekseev <n.alekseev2104@gmail.com>

bdrv_check_co_entry calls bdrv_co_check, which is a coroutine function.
Thus, it also needs to be marked as a coroutine.

Signed-off-by: Nikita Alekseev <n.alekseev2104@gmail.com>
Message-id: 20190401093051.16488-1-n.alekseev2104@gmail.com
Message-Id: <20190401093051.16488-1-n.alekseev2104@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block.c b/block.c
index 7dc8fe289a..5c2c6aa761 100644
--- a/block.c
+++ b/block.c
@@ -4121,7 +4121,7 @@ typedef struct CheckCo {
     int ret;
 } CheckCo;
=20
-static void bdrv_check_co_entry(void *opaque)
+static void coroutine_fn bdrv_check_co_entry(void *opaque)
 {
     CheckCo *cco =3D opaque;
     cco->ret =3D bdrv_co_check(cco->bs, cco->res, cco->fix);
--=20
2.21.0


