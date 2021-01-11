Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABE2B2F0F78
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 10:52:40 +0100 (CET)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kytsN-0000BQ-PO
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 04:52:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kytq2-0007Mz-12
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:50:15 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kytq0-0001JX-JA
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 04:50:13 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-lA0nEegEM9qPOKCrCgEUAw-1; Mon, 11 Jan 2021 04:49:59 -0500
X-MC-Unique: lA0nEegEM9qPOKCrCgEUAw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D631107AFC8;
 Mon, 11 Jan 2021 09:49:58 +0000 (UTC)
Received: from bahia.lan (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9168F5D9F4;
 Mon, 11 Jan 2021 09:49:57 +0000 (UTC)
Subject: [PATCH] 9pfs/proxy: Check return value of proxy_marshal()
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Jan 2021 10:49:56 +0100
Message-ID: <161035859647.1221144.4691749806675653934.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
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
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This should always successfully write exactly two 32-bit integers.
Make it clear with an assert(), like v9fs_receive_status() and
v9fs_receive_response() already do when unmarshalling the same
header.

Fixes: Coverity CID 1438968
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/9pfs/9p-proxy.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/9pfs/9p-proxy.c b/hw/9pfs/9p-proxy.c
index 6f598a0f111c..4aa4e0a3baa0 100644
--- a/hw/9pfs/9p-proxy.c
+++ b/hw/9pfs/9p-proxy.c
@@ -537,7 +537,8 @@ static int v9fs_request(V9fsProxy *proxy, int type, voi=
d *response, ...)
     }
=20
     /* marshal the header details */
-    proxy_marshal(iovec, 0, "dd", header.type, header.size);
+    retval =3D proxy_marshal(iovec, 0, "dd", header.type, header.size);
+    assert(retval =3D=3D 4 * 2);
     header.size +=3D PROXY_HDR_SZ;
=20
     retval =3D qemu_write_full(proxy->sockfd, iovec->iov_base, header.size=
);



