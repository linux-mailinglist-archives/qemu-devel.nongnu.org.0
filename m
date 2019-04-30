Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED3FD38
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 17:51:41 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLV2i-0005ZC-Q8
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 11:51:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUun-0007x7-S1
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hLUum-00022U-KK
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 11:43:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hLUuQ-0001jk-VI; Tue, 30 Apr 2019 11:43:07 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2549689C3B;
	Tue, 30 Apr 2019 15:43:06 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.15])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 415544C7;
	Tue, 30 Apr 2019 15:43:05 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Tue, 30 Apr 2019 17:42:24 +0200
Message-Id: <20190430154244.30083-8-kwolf@redhat.com>
In-Reply-To: <20190430154244.30083-1-kwolf@redhat.com>
References: <20190430154244.30083-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 30 Apr 2019 15:43:06 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 07/27] cutils: Fix size_to_str() on 32-bit
 platforms
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Blake <eblake@redhat.com>

When extracting a human-readable size formatter, we changed 'uint64_t
div' pre-patch to 'unsigned long div' post-patch. Which breaks on
32-bit platforms, resulting in 'inf' instead of intended values larger
than 999GB.

Fixes: 22951aaa
CC: qemu-stable@nongnu.org
Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 util/cutils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util/cutils.c b/util/cutils.c
index e098debdc0..d682c90901 100644
--- a/util/cutils.c
+++ b/util/cutils.c
@@ -825,7 +825,7 @@ const char *qemu_ether_ntoa(const MACAddr *mac)
 char *size_to_str(uint64_t val)
 {
     static const char *suffixes[] =3D { "", "Ki", "Mi", "Gi", "Ti", "Pi"=
, "Ei" };
-    unsigned long div;
+    uint64_t div;
     int i;
=20
     /*
--=20
2.20.1


