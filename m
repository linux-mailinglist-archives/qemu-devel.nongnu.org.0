Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB2143E50
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 14:43:23 +0100 (CET)
Received: from localhost ([::1]:54026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ittoQ-0006aI-Kv
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 08:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52243)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsfy-00021Y-CO
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsfu-00049x-D7
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:34 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:26764
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsfu-00049k-A1
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:30:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6dq0s0+gC/9ftFvKKedTgBSQhvPR+h29e/IF/u8TUVs=;
 b=FDTFydDrdmH7aMyoGFwtBEO23lG80uUe6VZO6IbIoPaCAR7gka0yJIKdWE/2sAPXLSUqKF
 H0N+/sSV7LNf7+yHFphI2Rq39t1GVDxGI0Oz9oy8l+uTlwx0pQIk279BsU1W2DuPV/mZQH
 AVAJ9chkPUnN0HwheehBH+3DdtkzVn4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-393-8w6AXe_0PaOhoRpQ9RQz-A-1; Tue, 21 Jan 2020 07:30:26 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1F91084455;
 Tue, 21 Jan 2020 12:30:25 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94BF160BE0;
 Tue, 21 Jan 2020 12:30:16 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 064/109] virtiofsd: Handle hard reboot
Date: Tue, 21 Jan 2020 12:23:48 +0000
Message-Id: <20200121122433.50803-65-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 8w6AXe_0PaOhoRpQ9RQz-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Handle a
  mount
  hard reboot (without unmount)
  mount

we get another 'init' which FUSE doesn't normally expect.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/fuse_lowlevel.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_lowlevel.c b/tools/virtiofsd/fuse_lowleve=
l.c
index 5565f78208..7dafe02db8 100644
--- a/tools/virtiofsd/fuse_lowlevel.c
+++ b/tools/virtiofsd/fuse_lowlevel.c
@@ -2435,7 +2435,21 @@ void fuse_session_process_buf_int(struct fuse_sessio=
n *se,
             goto reply_err;
         }
     } else if (in->opcode =3D=3D FUSE_INIT || in->opcode =3D=3D CUSE_INIT)=
 {
-        goto reply_err;
+        if (fuse_lowlevel_is_virtio(se)) {
+            /*
+             * TODO: This is after a hard reboot typically, we need to do
+             * a destroy, but we can't reply to this request yet so
+             * we can't use do_destroy
+             */
+            fuse_log(FUSE_LOG_DEBUG, "%s: reinit\n", __func__);
+            se->got_destroy =3D 1;
+            se->got_init =3D 0;
+            if (se->op.destroy) {
+                se->op.destroy(se->userdata);
+            }
+        } else {
+            goto reply_err;
+        }
     }
=20
     err =3D EACCES;
--=20
2.24.1


