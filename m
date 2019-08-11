Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D14A89397
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Aug 2019 22:21:43 +0200 (CEST)
Received: from localhost ([::1]:41610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hwuLW-0006Pz-9L
	for lists+qemu-devel@lfdr.de; Sun, 11 Aug 2019 16:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46061)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <steve@sk2.org>) id 1hwtjr-000137-8l
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 15:42:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <steve@sk2.org>) id 1hwtjq-0007VN-9K
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 15:42:47 -0400
Received: from smtp5-g21.free.fr ([2a01:e0c:1:1599::14]:16206)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <steve@sk2.org>) id 1hwtjq-0007QM-0G
 for qemu-devel@nongnu.org; Sun, 11 Aug 2019 15:42:46 -0400
Received: from heffalump.sk2.org (unknown [88.186.243.14])
 by smtp5-g21.free.fr (Postfix) with ESMTPS id 401D85FFAC
 for <qemu-devel@nongnu.org>; Sun, 11 Aug 2019 21:42:36 +0200 (CEST)
Received: from steve by heffalump.sk2.org with local (Exim 4.92)
 (envelope-from <steve@sk2.org>)
 id 1hwtjz-0002aY-Tt; Sun, 11 Aug 2019 21:42:56 +0200
From: Stephen Kitt <steve@sk2.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Aug 2019 21:42:47 +0200
Message-Id: <20190811194247.9861-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:e0c:1:1599::14
X-Mailman-Approved-At: Sun, 11 Aug 2019 16:21:04 -0400
Subject: [Qemu-devel] [PATCH] Fix hw/rdma/vmw/pvrdma_cmd.c build
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
Cc: Stephen Kitt <steve@sk2.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This was broken by the cherry-pick in 41dd30f. Fix by handling errors
as in the rest of the function: "goto out" instead of "return rc".

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 hw/rdma/vmw/pvrdma_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
index bb9a9f1cd1..a3a86d7c8e 100644
--- a/hw/rdma/vmw/pvrdma_cmd.c
+++ b/hw/rdma/vmw/pvrdma_cmd.c
@@ -514,7 +514,7 @@ static int create_qp(PVRDMADev *dev, union pvrdma_cmd=
_req *req,
                                      cmd->recv_cq_handle, rings, &resp->=
qpn);
     if (resp->hdr.err) {
         destroy_qp_rings(rings);
-        return rc;
+        goto out;
     }
=20
     resp->max_send_wr =3D cmd->max_send_wr;
--=20
2.20.1


