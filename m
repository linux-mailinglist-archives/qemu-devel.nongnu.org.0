Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DAD1470EC
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 19:40:00 +0100 (CET)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuhOZ-0001wI-C1
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 13:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufeK-0005Qw-Bw
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufeJ-0006vE-AB
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:08 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32711
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufeJ-0006uk-74
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:48:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ApL7B12we6isx84E91oulLnY1zwfzdx+W/HGjyKNvjg=;
 b=CzMT4I4DmRwSnQf1F2sk6HgvRasVZcoiWdj7gSe/e+dhqmOkW59qvH3O/L4gkClmcv5niX
 m3bSktHdGg0QK6kroMoO56mfVx9VsSm8WZJngSQ3LVvma+1G9li/DP6vAvUDStDhT/Sppq
 YeM6f7tnkVC7tYGB2XGyCd+sb0rU5k4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-PCDalbjAOYeWooqjkzDfdQ-1; Thu, 23 Jan 2020 11:48:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C6508026BB
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:48:04 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5FCF38F;
 Thu, 23 Jan 2020 16:48:03 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 065/108] vhost-user: Print unexpected slave message types
Date: Thu, 23 Jan 2020 16:45:47 +0000
Message-Id: <20200123164630.91498-66-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: PCDalbjAOYeWooqjkzDfdQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

When we receive an unexpected message type on the slave fd, print
the type.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index d27a10fcc6..2e81f5514f 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1061,7 +1061,7 @@ static void slave_read(void *opaque)
                                                           fd[0]);
         break;
     default:
-        error_report("Received unexpected msg type.");
+        error_report("Received unexpected msg type: %d.", hdr.request);
         ret =3D -EINVAL;
     }
=20
--=20
2.24.1


