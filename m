Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6132E12875
	for <lists+qemu-devel@lfdr.de>; Fri,  3 May 2019 09:08:28 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35723 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMSJ1-0001jN-J8
	for lists+qemu-devel@lfdr.de; Fri, 03 May 2019 03:08:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSAt-0003nw-Bn
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hMSAs-0006Gp-DQ
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54288)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hMSAs-0006GU-8M
	for qemu-devel@nongnu.org; Fri, 03 May 2019 03:00:02 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B92C30C021A;
	Fri,  3 May 2019 07:00:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0203179B5;
	Fri,  3 May 2019 06:59:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 332A717535; Fri,  3 May 2019 08:59:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  3 May 2019 08:59:50 +0200
Message-Id: <20190503065954.17069-4-kraxel@redhat.com>
In-Reply-To: <20190503065954.17069-1-kraxel@redhat.com>
References: <20190503065954.17069-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 03 May 2019 07:00:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 3/7] usb-mtp: change default to success for
 usb_mtp_update_object
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
Cc: Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bandan Das <bsd@redhat.com>

Commit c5ead51f90cf (usb-mtp: return incomplete transfer on a lstat
failure) checks if lstat succeeded when updating attributes of a
file. However, it also changed behavior to return an error by
default. This is incorrect because for smaller file sizes, Qemu
will attempt to write the file in one go and there won't be
an object for it.

Fixes: c5ead51f90cf
Signed-off-by: Bandan Das <bsd@redhat.com>
Message-id: jpgwojv9pwv.fsf@linux.bootlegged.copy
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/usb/dev-mtp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
index 963449ec7de8..d90b336d53f4 100644
--- a/hw/usb/dev-mtp.c
+++ b/hw/usb/dev-mtp.c
@@ -1587,7 +1587,7 @@ done:
 
 static int usb_mtp_update_object(MTPObject *parent, char *name)
 {
-    int ret = -1;
+    int ret = 0;
 
     MTPObject *o =
         usb_mtp_object_lookup_name(parent, name, strlen(name));
-- 
2.18.1


