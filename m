Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CC710276E
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 15:55:29 +0100 (CET)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX4ue-00083E-Dz
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 09:55:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iX4tk-0007e7-Po
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:54:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iX4th-0000Fn-W9
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:54:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32352
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iX4th-0000FO-Hm
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 09:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574175268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=naDu/k2UK5DQHEIyqHpUoCsdogICq6ZbdFhAUae1mqI=;
 b=FRV3xZangWUJ9DS9IJf2I6yfrjOuOGOK/O8gjhKyX7cYTp2/ZUWqNAJBbxfz+Mppb28euO
 +6CFJ+7Xh3g3FPs1xI8T5DOXUBjIhuEY2Oe1KMeCyDiOfRg5Qx0+egno4lQcoSJG9GLSik
 ajASOmQA9MPH2tCfpsJYQmWg40UrC+0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-5dvuU7aMPs2t4R3YxRUJuA-1; Tue, 19 Nov 2019 09:54:27 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0EAD28CD813;
 Tue, 19 Nov 2019 14:54:26 +0000 (UTC)
Received: from linux.fritz.box (ovpn-116-75.ams2.redhat.com [10.36.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 45DD71001B3F;
 Tue, 19 Nov 2019 14:54:21 +0000 (UTC)
Date: Tue, 19 Nov 2019 15:54:19 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/4] fix & merge block_status_above and is_allocated_above
Message-ID: <20191119145419.GF5910@linux.fritz.box>
References: <20191116163410.12129-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20191116163410.12129-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 5dvuU7aMPs2t4R3YxRUJuA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.11.2019 um 17:34 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
>=20
> I wanted to understand, what is the real difference between bdrv_block_st=
atus_above
> and bdrv_is_allocated_above, IMHO bdrv_is_allocated_above should work thr=
ough
> bdrv_block_status_above..
>=20
> And I found the problem: bdrv_is_allocated_above considers space after EO=
F as
> UNALLOCATED for intermediate nodes..
>=20
> UNALLOCATED is not about allocation at fs level, but about should we go t=
o backing or
> not.. And it seems incorrect for me, as in case of short backing file, we=
'll read
> zeroes after EOF, instead of going further by backing chain.
>=20
> This leads to the following effect:
>=20
> ./qemu-img create -f qcow2 base.qcow2 2M
> ./qemu-io -c "write -P 0x1 0 2M" base.qcow2
>=20
> ./qemu-img create -f qcow2 -b base.qcow2 mid.qcow2 1M
> ./qemu-img create -f qcow2 -b mid.qcow2 top.qcow2 2M
>=20
> Region 1M..2M is shadowed by short middle image, so guest sees zeroes:
> ./qemu-io -c "read -P 0 1M 1M" top.qcow2
> read 1048576/1048576 bytes at offset 1048576
> 1 MiB, 1 ops; 00.00 sec (22.795 GiB/sec and 23341.5807 ops/sec)
>=20
> But after commit guest visible state is changed, which seems wrong for me=
:
> ./qemu-img commit top.qcow2 -b mid.qcow2
>=20
> ./qemu-io -c "read -P 0 1M 1M" mid.qcow2
> Pattern verification failed at offset 1048576, 1048576 bytes
> read 1048576/1048576 bytes at offset 1048576
> 1 MiB, 1 ops; 00.00 sec (4.981 GiB/sec and 5100.4794 ops/sec)
>=20
> ./qemu-io -c "read -P 1 1M 1M" mid.qcow2
> read 1048576/1048576 bytes at offset 1048576
> 1 MiB, 1 ops; 00.00 sec (3.365 GiB/sec and 3446.1606 ops/sec)
>=20
>=20
> I don't know, is it a real bug, as I don't know, do we support backing
> file larger than its parent. Still, I'm not sure that this behavior of
> bdrv_is_allocated_above don't lead to other problems.

Actually, this specific problem is completely unrelated to how the block
status functions deal with short backing files because they are only
ever called for backing files of the same length as their overlay.

The problem is that the commit job grows the backing file first without
making sure that the clusters in the new part read as zeros. After this,
the damage is done and bdrv_is_allocated_above() returns correctly that
the blocks are unallocated both in top.qcow2 and in mid.qcow2.

So the simple fix for 4.2 would be the following. Maybe we can find a
way to optimise it later (though probably it's not worth it because
short backing files are an uncommon case anyway).

Kevin


diff --git a/block/commit.c b/block/commit.c
index 23c90b3b91..a0c4f51caf 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -159,6 +159,11 @@ static int coroutine_fn commit_run(Job *job, Error **e=
rrp)
         if (ret) {
             goto out;
         }
+        ret =3D blk_co_pwrite_zeroes(s->base, base_len, len - base_len,
+                                   BDRV_REQ_MAY_UNMAP);
+        if (ret < 0) {
+            goto out;
+        }
     }
=20
     buf =3D blk_blockalign(s->top, COMMIT_BUFFER_SIZE);
diff --git a/block/mirror.c b/block/mirror.c
index f0f2d9dff1..2a34f2fad6 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -883,6 +883,12 @@ static int coroutine_fn mirror_run(Job *job, Error **e=
rrp)
             if (ret < 0) {
                 goto immediate_exit;
             }
+            ret =3D blk_co_pwrite_zeroes(s->target, base_length,
+                                       s->bdev_length - base_length,
+                                       BDRV_REQ_MAY_UNMAP);
+            if (ret < 0) {
+                goto immediate_exit;
+            }
         }
     }
=20


