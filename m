Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9061B32C5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 00:50:57 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR1jC-0004P0-CW
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 18:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45464)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR1hj-0003rV-Rr
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 18:49:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jR1hi-00062F-LQ
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 18:49:23 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:40499
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jR1hh-0005ks-Tf
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 18:49:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587509358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEkmEU+AzANqs9/z/HMD4awHIPZByi0g9ZXIoAJ14cg=;
 b=RpAYEMaNPYaCKy5iMsVvaXwscSqC/ltAx6qZnzmlrjqA+iRCmGQPekSAe1bDH2awoaVZPY
 6dMyri+aLsQ/LS1uqZbZVQEYMnj0HLkM0NPe3puulkJImsWbWniy6CyvXdpSBDXBbuAVJs
 SDnh+uSX0y/REoNIwkkTZP5xKFr4S9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-0Dw26MV9MlyuCPshUN7FPQ-1; Tue, 21 Apr 2020 18:49:16 -0400
X-MC-Unique: 0Dw26MV9MlyuCPshUN7FPQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D6EC5A099;
 Tue, 21 Apr 2020 22:49:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5BF58B3A60;
 Tue, 21 Apr 2020 22:49:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] fixup! qemu-img: Add bitmap sub-command
Date: Tue, 21 Apr 2020 17:49:11 -0500
Message-Id: <20200421224911.178024-1-eblake@redhat.com>
In-Reply-To: <158750773797.29038.4153256722909003079@39012742ff91>
References: <158750773797.29038.4153256722909003079@39012742ff91>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 17:20:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
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
Cc: nsoffer@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Squash this into patch 3/6 to fix docker-test-mingw@fedora

 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 6cfc1f52ef98..cc87eaf12778 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -4529,7 +4529,7 @@ static int img_bitmap(int argc, char **argv)
     BlockBackend *blk =3D NULL, *src =3D NULL;
     BlockDriverState *bs =3D NULL, *src_bs =3D NULL;
     bool image_opts =3D false;
-    unsigned long granularity =3D 0;
+    uint64_t granularity =3D 0;
     bool add =3D false, remove =3D false, clear =3D false;
     bool enable =3D false, disable =3D false, add_disabled =3D false;
     const char *merge =3D NULL;
--=20
2.26.2


