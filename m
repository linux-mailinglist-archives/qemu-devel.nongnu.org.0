Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB0F14F193
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 18:50:58 +0100 (CET)
Received: from localhost ([::1]:57266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixaRV-0002tc-8t
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 12:50:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41306)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1ixaLa-0002fr-3G
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:44:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1ixaLZ-0004Oa-1t
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:44:49 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29443
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1ixaLY-0004Nk-S7
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 12:44:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580492688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hityjKMfB0ls/+JKoTt1mzdgEMZFRSfbIhfAQvP0UgA=;
 b=IMkhNQJNBWIKEn4O7NM2S10isN1pNMhL732/i/P/Yrg1AMd7xS2KRf515RDBTj7PVHxlMX
 KIJ99zi78HOrnIYIuH6Ago9ANgZDsoyAMV5LeaZiJf7TqliFNgW2dw1MC6nO211Z0vSHCi
 IOmFYo53RaTdRko58DfOCVufseYWFVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-DvDKizFLPamuqUujl0zeJg-1; Fri, 31 Jan 2020 12:44:44 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13F9F1937FC6;
 Fri, 31 Jan 2020 17:44:43 +0000 (UTC)
Received: from blue.redhat.com (ovpn-116-181.phx2.redhat.com [10.3.116.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 991B77FB60;
 Fri, 31 Jan 2020 17:44:42 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/17] block: Improve bdrv_has_zero_init_truncate with backing
 file
Date: Fri, 31 Jan 2020 11:44:25 -0600
Message-Id: <20200131174436.2961874-7-eblake@redhat.com>
In-Reply-To: <20200131174436.2961874-1-eblake@redhat.com>
References: <20200131174436.2961874-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: DvDKizFLPamuqUujl0zeJg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: david.edmondson@oracle.com, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we added bdrv_has_zero_init_truncate(), we chose to blindly
return 0 if a backing file was present, because we knew of the corner
case where a backing layer larger than the current layer might leak
the tail of the backing layer into the resized region.  But as this
setup is rare, it penalizes the more common case of a backing layer
smaller than the current layer.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/block.c b/block.c
index 296845040e59..d132662f3103 100644
--- a/block.c
+++ b/block.c
@@ -5112,9 +5112,19 @@ int bdrv_has_zero_init_truncate(BlockDriverState *bs=
)
         return 0;
     }

+    /*
+     * If the current layer is smaller than the backing layer,
+     * truncation may expose backing data; treat failure to query size
+     * in the same manner. Otherwise, we can trust the driver.
+     */
+
     if (bs->backing) {
-        /* Depends on the backing image length, but better safe than sorry=
 */
-        return 0;
+        int64_t back =3D bdrv_getlength(bs->backing->bs);
+        int64_t curr =3D bdrv_getlength(bs);
+
+        if (back < 0 || curr < back) {
+            return 0;
+        }
     }
     if (bs->drv->bdrv_has_zero_init_truncate) {
         return bs->drv->bdrv_has_zero_init_truncate(bs);
--=20
2.24.1


