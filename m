Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622352F74ED
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 10:11:16 +0100 (CET)
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0L8V-0006HR-GH
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 04:11:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0L5O-0004Sa-Ez
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:08:02 -0500
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:34195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l0L5M-0005xB-RT
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 04:08:02 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-133-12v0d7_5NEWuQNSQAdhLRw-1; Fri, 15 Jan 2021 04:07:55 -0500
X-MC-Unique: 12v0d7_5NEWuQNSQAdhLRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75B1E107ACF7;
 Fri, 15 Jan 2021 09:07:53 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-20.ams2.redhat.com [10.36.112.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 21C136F99E;
 Fri, 15 Jan 2021 09:07:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] 9pfs: Fully restart unreclaim loop (CVE-2021-20181)
Date: Fri, 15 Jan 2021 10:05:10 +0100
Message-Id: <20210115090507.108064-2-groug@kaod.org>
In-Reply-To: <20210115090507.108064-1-groug@kaod.org>
References: <20210115090507.108064-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zero Day Initiative <zdi-disclosures@trendmicro.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Depending on the client activity, the server can be asked to open a huge
number of file descriptors and eventually hit RLIMIT_NOFILE. This is
currently mitigated using a reclaim logic : the server closes the file
descriptors of idle fids, based on the assumption that it will be able
to re-open them later. This assumption doesn't hold of course if the
client requests the file to be unlinked. In this case, we loop on the
entire fid list and mark all related fids as unreclaimable (the reclaim
logic will just ignore them) and, of course, we open or re-open their
file descriptors if needed since we're about to unlink the file.

This is the purpose of v9fs_mark_fids_unreclaim(). Since the actual
opening of a file can cause the coroutine to yield, another client
request could possibly add a new fid that we may want to mark as
non-reclaimable as well. The loop is thus restarted if the re-open
request was actually transmitted to the backend. This is achieved
by keeping a reference on the first fid (head) before traversing
the list.

This is wrong in several ways:
- a potential clunk request from the client could tear the first
  fid down and cause the reference to be stale. This leads to a
  use-after-free error that can be detected with ASAN, using a
  custom 9p client
- fids are added at the head of the list : restarting from the
  previous head will always miss fids added by a some other
  potential request

All these problems could be avoided if fids were being added at the
end of the list. This can be achieved with a QSIMPLEQ, but this is
probably too much change for a bug fix. For now let's keep it
simple and just restart the loop from the current head.

Fixes: CVE-2021-20181
Buglink: https://bugs.launchpad.net/qemu/+bug/1911666
Reported-by: Zero Day Initiative <zdi-disclosures@trendmicro.com>
Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Message-Id: <161064025265.1838153.15185571283519390907.stgit@bahia.lan>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 94df440fc740..6026b51a1c04 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -502,9 +502,9 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPD=
U *pdu, V9fsPath *path)
 {
     int err;
     V9fsState *s =3D pdu->s;
-    V9fsFidState *fidp, head_fid;
+    V9fsFidState *fidp;
=20
-    head_fid.next =3D s->fid_list;
+again:
     for (fidp =3D s->fid_list; fidp; fidp =3D fidp->next) {
         if (fidp->path.size !=3D path->size) {
             continue;
@@ -524,7 +524,7 @@ static int coroutine_fn v9fs_mark_fids_unreclaim(V9fsPD=
U *pdu, V9fsPath *path)
              * switched to the worker thread
              */
             if (err =3D=3D 0) {
-                fidp =3D &head_fid;
+                goto again;
             }
         }
     }
--=20
2.26.2


