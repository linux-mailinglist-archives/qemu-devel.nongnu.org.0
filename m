Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D317A1627B4
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Feb 2020 15:09:25 +0100 (CET)
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j43Yy-0000T3-QB
	for lists+qemu-devel@lfdr.de; Tue, 18 Feb 2020 09:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1j43Xh-0006rZ-Um
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1j43Xg-0001QS-UM
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:05 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:40485
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1j43Xg-0001Pz-Qg
 for qemu-devel@nongnu.org; Tue, 18 Feb 2020 09:08:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582034883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OaAAOgUxvfCKha/fWoEmi4fIag5om0BwBxSd24Q7muk=;
 b=LXEgE9PC+91tI5ZksJt2cleQQsUPGma6Lpqf9xRheZvkoZfNjSQrO8eQcJiP/Xo8DhMgAZ
 hxnTT+p12KPlAhMlszyzVSvsphd8pP22oIdZ9XBFbLGKVT+osjwyPyMYbq6KfTjuhlCbjg
 uraJSZJ9p8F3qTsYTfcUkMuRzXsvuwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-MT_4gvgvPxWqSg7llYwO9A-1; Tue, 18 Feb 2020 09:08:01 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E397D18FE879;
 Tue, 18 Feb 2020 14:07:59 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-117-181.ams2.redhat.com
 [10.36.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDBEB19E9C;
 Tue, 18 Feb 2020 14:07:58 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 06/36] qcow2: Fix qcow2_alloc_cluster_abort() for external data
 file
Date: Tue, 18 Feb 2020 15:06:52 +0100
Message-Id: <20200218140722.23876-7-kwolf@redhat.com>
In-Reply-To: <20200218140722.23876-1-kwolf@redhat.com>
References: <20200218140722.23876-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MT_4gvgvPxWqSg7llYwO9A-1
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For external data file, cluster allocations return an offset in the data
file and are not refcounted. In this case, there is nothing to do for
qcow2_alloc_cluster_abort(). Freeing the same offset in the qcow2 file
is wrong and causes crashes in the better case or image corruption in
the worse case.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200211094900.17315-3-kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/qcow2-cluster.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 1947f13a2d..78c95dfa16 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1026,8 +1026,11 @@ err:
 void qcow2_alloc_cluster_abort(BlockDriverState *bs, QCowL2Meta *m)
 {
     BDRVQcow2State *s =3D bs->opaque;
-    qcow2_free_clusters(bs, m->alloc_offset, m->nb_clusters << s->cluster_=
bits,
-                        QCOW2_DISCARD_NEVER);
+    if (!has_data_file(bs)) {
+        qcow2_free_clusters(bs, m->alloc_offset,
+                            m->nb_clusters << s->cluster_bits,
+                            QCOW2_DISCARD_NEVER);
+    }
 }
=20
 /*
--=20
2.20.1


