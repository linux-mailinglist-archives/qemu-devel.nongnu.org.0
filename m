Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEED11D3B5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 18:22:48 +0100 (CET)
Received: from localhost ([::1]:34596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifSAo-00035C-VN
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 12:22:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56248)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWF-0006i4-Ki
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1ifRWE-0003Is-Fb
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:40:51 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40532
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1ifRWD-0003Fr-AR
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 11:40:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576168848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GDHweZ0hWH8J1z04M+rbHqVdxkEMVU/6pMBMTFopRl0=;
 b=Nt1J47Q8ZZTbwDf4BqBwf7WCXezkyWeV2wdH4GVu15d086NL6ajQbSj3Tk3sXj73AQI43X
 KuBkUIeBj7Z2PD53V49Tg/ydYBY6sAEQDwM5lErf9J2nj6QYbYWRzQGaofIc9vOSpEqkG2
 ezpdSCbDRJxwuVTKyULQgv0u4RbnzaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-iMH11d9RN6qOdEBqviuiog-1; Thu, 12 Dec 2019 11:40:47 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C0FD801E72
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 16:40:46 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4EAF60BE1;
 Thu, 12 Dec 2019 16:40:45 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com,
	vgoyal@redhat.com
Subject: [PATCH 064/104] vhost-user: Print unexpected slave message types
Date: Thu, 12 Dec 2019 16:38:24 +0000
Message-Id: <20191212163904.159893-65-dgilbert@redhat.com>
In-Reply-To: <20191212163904.159893-1-dgilbert@redhat.com>
References: <20191212163904.159893-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: iMH11d9RN6qOdEBqviuiog-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 02a9b25199..33470c14b0 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1055,7 +1055,7 @@ static void slave_read(void *opaque)
                                                           fd[0]);
         break;
     default:
-        error_report("Received unexpected msg type.");
+        error_report("Received unexpected msg type. (%d)", hdr.request);
         ret =3D -EINVAL;
     }
=20
--=20
2.23.0


