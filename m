Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59708154496
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 14:08:41 +0100 (CET)
Received: from localhost ([::1]:38582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izgtc-0002fl-D0
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 08:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57649)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mreitz@redhat.com>) id 1izgdY-0003YJ-60
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:52:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mreitz@redhat.com>) id 1izgdX-0001Rp-0i
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:52:04 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:29119
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mreitz@redhat.com>) id 1izgdW-0001Qe-SU
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 07:52:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580993522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SD5PFo0PAb0EJVzcNjfwRjHB0q0NNQHWbghS/mUzwOQ=;
 b=KSmoUP1fGLGnpPXdRK7/df5dEOzQ/7aTLqeG4fyns1nfQgyvaki7IIg7pZabiI2NzZXpKP
 prmZVoU117tBlWzCJmOiinkbR2tUSiUsE4YvdN6yi7N7wjVpB9g03xORkWB+0SBSMRN1rJ
 6NXhp2/5VQ35ja9VW29xtR3MajK4BNk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-lxExgukqMfCualTXMPPtiQ-1; Thu, 06 Feb 2020 07:52:00 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F7101137841;
 Thu,  6 Feb 2020 12:51:59 +0000 (UTC)
Received: from localhost (unknown [10.36.118.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6CB087B1C;
 Thu,  6 Feb 2020 12:51:58 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 12/17] qcow2: Tighten cluster_offset alignment assertions
Date: Thu,  6 Feb 2020 13:51:27 +0100
Message-Id: <20200206125132.594625-13-mreitz@redhat.com>
In-Reply-To: <20200206125132.594625-1-mreitz@redhat.com>
References: <20200206125132.594625-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: lxExgukqMfCualTXMPPtiQ-1
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alberto Garcia <berto@igalia.com>

qcow2_alloc_cluster_offset() and qcow2_get_cluster_offset() always
return offsets that are cluster-aligned so don't just check that they
are sector-aligned.

The check in qcow2_co_preadv_task() is also replaced by an assertion
for the same reason.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-id: 558ba339965f858bede4c73ce3f50f0c0493597d.1579374329.git.berto@i=
galia.com
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 83db013814..6cb5aee4a5 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2167,10 +2167,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDr=
iverState *bs,
                                           offset, bytes, qiov, qiov_offset=
);
=20
     case QCOW2_CLUSTER_NORMAL:
-        if ((file_cluster_offset & 511) !=3D 0) {
-            return -EIO;
-        }
-
+        assert(offset_into_cluster(s, file_cluster_offset) =3D=3D 0);
         if (bs->encrypted) {
             return qcow2_co_preadv_encrypted(bs, file_cluster_offset,
                                              offset, bytes, qiov, qiov_off=
set);
@@ -2506,7 +2503,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
=20
-        assert((cluster_offset & 511) =3D=3D 0);
+        assert(offset_into_cluster(s, cluster_offset) =3D=3D 0);
=20
         ret =3D qcow2_pre_write_overlap_check(bs, 0,
                                             cluster_offset + offset_in_clu=
ster,
@@ -3896,7 +3893,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
=20
-        assert((cluster_offset & 511) =3D=3D 0);
+        assert(offset_into_cluster(s, cluster_offset) =3D=3D 0);
=20
         ret =3D qcow2_pre_write_overlap_check(bs, 0,
                 cluster_offset + offset_in_cluster, cur_bytes, true);
--=20
2.24.1


