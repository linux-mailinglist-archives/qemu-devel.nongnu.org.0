Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 983E41BCD7E
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Apr 2020 22:34:03 +0200 (CEST)
Received: from localhost ([::1]:50452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jTWva-0007iV-Ia
	for lists+qemu-devel@lfdr.de; Tue, 28 Apr 2020 16:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTWr4-0000Lo-N4
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1jTWr3-0005q0-I5
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:22 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:31050
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jTWr3-0005oq-4b
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 16:29:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588105760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2WDvPV9ET1XwGwAYBrJR2donFfxYVmwkoOnWvQdDc1M=;
 b=DwchL5ro/sHfGSGmHx1sbZctexMZWR31+/K33gMHVC6qehjZ1XMEi2j2SYSWfM8IJweeTa
 LKIo46dW/DVxw+u/5ZekFf/mfUvjoMFvbdmvN70G9fpXmM5N2HIZgvnzy18VMvyKIawd2H
 augG+WoCE1VDneIlkNLfMMPDLfHN0SI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-4Vvzf9UDOJqKkpHxhrer_w-1; Tue, 28 Apr 2020 16:29:16 -0400
X-MC-Unique: 4Vvzf9UDOJqKkpHxhrer_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DC7A100A8E9;
 Tue, 28 Apr 2020 20:29:15 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-80.rdu2.redhat.com [10.10.116.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DCB05C1D4;
 Tue, 28 Apr 2020 20:29:14 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] nfs: Support BDRV_REQ_ZERO_WRITE for truncate
Date: Tue, 28 Apr 2020 15:28:59 -0500
Message-Id: <20200428202905.770727-4-eblake@redhat.com>
In-Reply-To: <20200428202905.770727-1-eblake@redhat.com>
References: <20200428202905.770727-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/28 04:11:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: kwolf@redhat.com, Peter Lieven <pl@kamp.de>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Our .bdrv_has_zero_init_truncate returns 1 if we detect that the OS
always 0-fills; we can use that same knowledge to implement
BDRV_REQ_ZERO_WRITE by ignoring it when the OS gives it to us for
free.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/nfs.c b/block/nfs.c
index 2393fbfe6bcc..b93989265630 100644
--- a/block/nfs.c
+++ b/block/nfs.c
@@ -623,6 +623,9 @@ static int nfs_file_open(BlockDriverState *bs, QDict *o=
ptions, int flags,
     }

     bs->total_sectors =3D ret;
+    if (client->has_zero_init) {
+        bs->supported_truncate_flags =3D BDRV_REQ_ZERO_WRITE;
+    }
     ret =3D 0;
     return ret;
 }
--=20
2.26.2


