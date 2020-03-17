Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB2C187887
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 05:42:00 +0100 (CET)
Received: from localhost ([::1]:52594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jE43D-0005Rr-Im
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 00:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51752)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1jE3zu-00007X-Co
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1jE3zt-0007hH-Db
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:34 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:60567)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>) id 1jE3zt-0007fs-9w
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 00:38:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584419913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ahENl3BNbjiX9217T8D2HNUwmfnYsYvdtYYCuVYsDWw=;
 b=hdITesUBJVKLBGWVFP7iHgOOeS/cEXnguBvR2ntp2Mjmq+ZaSYfTog5wulCyTahbKl/+i1
 MzinyIWHaMghooYd6ZOg10Fxki9N2La63Qrhfu+LP0VyafHAN4+RdPknvht4uP0mqqzAxj
 /Wp0ad3w8agQ1x0Yqb4ozgBp5e/gaW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-5lwXJDZjM-yI_TaaxhfLcg-1; Tue, 17 Mar 2020 00:38:30 -0400
X-MC-Unique: 5lwXJDZjM-yI_TaaxhfLcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7ECC3100550E;
 Tue, 17 Mar 2020 04:38:29 +0000 (UTC)
Received: from probe.redhat.com (ovpn-112-191.rdu2.redhat.com [10.10.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE151036D00;
 Tue, 17 Mar 2020 04:38:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 jsnow@redhat.com
Subject: [PULL 01/10] hbitmap: assert that we don't create bitmap larger than
 INT64_MAX
Date: Tue, 17 Mar 2020 00:38:10 -0400
Message-Id: <20200317043819.20197-2-jsnow@redhat.com>
In-Reply-To: <20200317043819.20197-1-jsnow@redhat.com>
References: <20200317043819.20197-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, libvir-list@redhat.com,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

We have APIs which returns signed int64_t, to be able to return error.
Therefore we can't handle bitmaps with absolute size larger than
(INT64_MAX+1). Still, keep maximum to be INT64_MAX which is a bit
safer.

Note, that bitmaps are used to represent disk images, which can't
exceed INT64_MAX anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: John Snow <jsnow@redhat.com>
Message-id: 20200205112041.6003-2-vsementsov@virtuozzo.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 util/hbitmap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/util/hbitmap.c b/util/hbitmap.c
index 242c6e519c..7f9b3e0cd7 100644
--- a/util/hbitmap.c
+++ b/util/hbitmap.c
@@ -716,6 +716,7 @@ HBitmap *hbitmap_alloc(uint64_t size, int granularity)
     HBitmap *hb =3D g_new0(struct HBitmap, 1);
     unsigned i;
=20
+    assert(size <=3D INT64_MAX);
     hb->orig_size =3D size;
=20
     assert(granularity >=3D 0 && granularity < 64);
@@ -746,6 +747,7 @@ void hbitmap_truncate(HBitmap *hb, uint64_t size)
     uint64_t num_elements =3D size;
     uint64_t old;
=20
+    assert(size <=3D INT64_MAX);
     hb->orig_size =3D size;
=20
     /* Size comes in as logical elements, adjust for granularity. */
--=20
2.21.1


