Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBD2221B
	for <lists+qemu-devel@lfdr.de>; Sat, 18 May 2019 09:40:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58895 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRtx7-0004HI-7h
	for lists+qemu-devel@lfdr.de; Sat, 18 May 2019 03:40:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58109)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRtw2-0003xQ-Nw
	for qemu-devel@nongnu.org; Sat, 18 May 2019 03:39:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRtw1-0005ST-UR
	for qemu-devel@nongnu.org; Sat, 18 May 2019 03:39:14 -0400
Received: from charlie.dont.surf ([128.199.63.193]:43036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hRtvz-0005PC-Lj; Sat, 18 May 2019 03:39:11 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
	[5.186.120.196])
	by charlie.dont.surf (Postfix) with ESMTPSA id A7E38BF659;
	Sat, 18 May 2019 07:39:10 +0000 (UTC)
From: Klaus Birkelund Jensen <klaus@birkelund.eu>
To: qemu-block@nongnu.org
Date: Sat, 18 May 2019 09:39:05 +0200
Message-Id: <20190518073905.17178-1-klaus@birkelund.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: [Qemu-devel] [PATCH] nvme: fix copy direction in DMA reads going to
 CMB
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
Cc: Keith Busch <keith.busch@intel.com>, Kevin Wolf <kwolf@redhat.com>, "Heitke,
	Kenneth" <kenneth.heitke@intel.com>, qemu-devel@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

`nvme_dma_read_prp` erronously used `qemu_iovec_*to*_buf` instead of
`qemu_iovec_*from*_buf` when the request involved the controller memory
buffer.

Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 7caf92532a09..63a5b58849fb 100644
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
2.21.0


