Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E4315F77B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 21:11:19 +0100 (CET)
Received: from localhost ([::1]:45140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2hJ0-0003u6-DA
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 15:11:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51931)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j2hGR-0007Wv-Br
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j2hGQ-0005Uh-8i
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:39 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:40766
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j2hGQ-0005Tx-3X
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:08:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581710917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kw0Ovdv0zytep/i41pEvdOUY/wlGbwSrovoSBVCAo2s=;
 b=MED/4voz2WWRxnMvUC+TTjepo1hx34K39QNUvOkHOXYNwgUwHEPL5n+h3nQM51SS3qZmYX
 o+voNqB1NYhc0GRoK0zAxSmAO18KMv/l4wNa2hpdH44jI2LyNsu1RTxBKedISd31G+EZIM
 z57B96e+TgRJ6Zi3jUusMqHRhAg6rBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-71-nnt9GtWROiSt9uWawC-G8A-1; Fri, 14 Feb 2020 15:08:35 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A46B1107ACC4;
 Fri, 14 Feb 2020 20:08:34 +0000 (UTC)
Received: from linux.fritz.box.com (unknown [10.36.118.128])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AF735C1C3;
 Fri, 14 Feb 2020 20:08:33 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 4/7] commit: Inline commit_populate()
Date: Fri, 14 Feb 2020 21:08:09 +0100
Message-Id: <20200214200812.28180-5-kwolf@redhat.com>
In-Reply-To: <20200214200812.28180-1-kwolf@redhat.com>
References: <20200214200812.28180-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: nnt9GtWROiSt9uWawC-G8A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, nsoffer@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

commit_populate() is a very short function and only called in a single
place. Its return value doesn't tell us whether an error happened while
reading or writing, which would be necessary for sending the right data
in the BLOCK_JOB_ERROR QMP event.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/commit.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/block/commit.c b/block/commit.c
index 8189f079d2..2992a1012f 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -43,27 +43,6 @@ typedef struct CommitBlockJob {
     char *backing_file_str;
 } CommitBlockJob;
=20
-static int coroutine_fn commit_populate(BlockBackend *bs, BlockBackend *ba=
se,
-                                        int64_t offset, uint64_t bytes,
-                                        void *buf)
-{
-    int ret =3D 0;
-
-    assert(bytes < SIZE_MAX);
-
-    ret =3D blk_co_pread(bs, offset, bytes, buf, 0);
-    if (ret < 0) {
-        return ret;
-    }
-
-    ret =3D blk_co_pwrite(base, offset, bytes, buf, 0);
-    if (ret < 0) {
-        return ret;
-    }
-
-    return 0;
-}
-
 static int commit_prepare(Job *job)
 {
     CommitBlockJob *s =3D container_of(job, CommitBlockJob, common.job);
@@ -178,7 +157,12 @@ static int coroutine_fn commit_run(Job *job, Error **e=
rrp)
         copy =3D (ret =3D=3D 1);
         trace_commit_one_iteration(s, offset, n, ret);
         if (copy) {
-            ret =3D commit_populate(s->top, s->base, offset, n, buf);
+            assert(n < SIZE_MAX);
+
+            ret =3D blk_co_pread(s->top, offset, n, buf, 0);
+            if (ret >=3D 0) {
+                ret =3D blk_co_pwrite(s->base, offset, n, buf, 0);
+            }
         }
         if (ret < 0) {
             BlockErrorAction action =3D
--=20
2.20.1


