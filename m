Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFE523D12
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 18:18:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38023 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSkzK-0001Mr-8X
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 12:18:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwm-00089a-7o
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hSkwk-0003Ss-8G
	for qemu-devel@nongnu.org; Mon, 20 May 2019 12:15:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52422)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hSkwb-0003M5-9i; Mon, 20 May 2019 12:15:22 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 30760C058CA8;
	Mon, 20 May 2019 16:15:14 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-208.ams2.redhat.com
	[10.36.117.208])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 43F1FD1E4;
	Mon, 20 May 2019 16:15:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Mon, 20 May 2019 18:14:35 +0200
Message-Id: <20190520161453.30723-7-kwolf@redhat.com>
In-Reply-To: <20190520161453.30723-1-kwolf@redhat.com>
References: <20190520161453.30723-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 20 May 2019 16:15:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/24] nvme: fix copy direction in DMA reads
 going to CMB
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Birkelund Jensen <klaus@birkelund.eu>

`nvme_dma_read_prp` erronously used `qemu_iovec_*to*_buf` instead of
`qemu_iovec_*from*_buf` when the request involved the controller memory
buffer.

Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
Reviewed-by: Kenneth Heitke <kenneth.heitke@intel.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7caf92532a..63a5b58849 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -238,7 +238,7 @@ static uint16_t nvme_dma_read_prp(NvmeCtrl *n, uint8_=
t *ptr, uint32_t len,
         }
         qemu_sglist_destroy(&qsg);
     } else {
-        if (unlikely(qemu_iovec_to_buf(&iov, 0, ptr, len) !=3D len)) {
+        if (unlikely(qemu_iovec_from_buf(&iov, 0, ptr, len) !=3D len)) {
             trace_nvme_err_invalid_dma();
             status =3D NVME_INVALID_FIELD | NVME_DNR;
         }
--=20
2.20.1


