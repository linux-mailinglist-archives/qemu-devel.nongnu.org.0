Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8BE35EFED5
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 22:46:20 +0200 (CEST)
Received: from localhost ([::1]:36108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe0QF-00060i-MF
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 16:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmu-0002mM-65
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:42 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:8430)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=1271248072=kbusch@meta.com>)
 id 1odzmr-0005RT-2R
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 16:05:39 -0400
Received: from pps.filterd (m0109334.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28TJIXvW002781
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:28 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=s2048-2021-q4;
 bh=9DUyzCE+9LcliOjaEta+SPjhznTXiuml9lI23qr5Cbc=;
 b=iW/EZPJTit9FOYEhY3RKNVkSyH69kYGgpyRoDIbMs/kmpPPXhBI1SfSTPDsXpv5s2y5Q
 tAUC8B8Z22+pgZTaZecwIe0tWNp0Wx1VhMJwJtQfG99KdUaTGnpxQKytrOCgIGfCLmdH
 S3WOxHToTz5HFZpGPrBaoMMs44GWLZMb0qmj95QaFxbTMm6cJuqlWVJljUSKqSlRoVKC
 /Mx/LoiGFJuLdTXc1vC1NMYWN/am9C9GfdIryjGCs1jTzScQ3LAl5nqEfDdT7xG8zJgf
 arh5fh8wPN6yghGPUjl2d/uVBbUS64stc13+XqI2d0gmbvGgpZroeNZ/dyceZOmus81C DQ== 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3jvtn2hv1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 13:05:28 -0700
Received: from twshared10425.14.frc2.facebook.com (2620:10d:c085:108::8) by
 mail.thefacebook.com (2620:10d:c085:21d::4) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 29 Sep 2022 13:05:28 -0700
Received: by devbig007.nao1.facebook.com (Postfix, from userid 544533)
 id 96477930500F; Thu, 29 Sep 2022 13:05:24 -0700 (PDT)
From: Keith Busch <kbusch@meta.com>
To: <qemu-block@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>, Maxim Levitsky
 <mlevitsk@redhat.com>, <kvm@vger.kernel.org>,
 Keith Busch <kbusch@kernel.org>
Subject: [PATCHv3 2/2] block: use the request length for iov alignment
Date: Thu, 29 Sep 2022 13:05:23 -0700
Message-ID: <20220929200523.3218710-3-kbusch@meta.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220929200523.3218710-1-kbusch@meta.com>
References: <20220929200523.3218710-1-kbusch@meta.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: Hdf2rZFJhIi8hOlpbJyamwZu9aVOeoM5
X-Proofpoint-ORIG-GUID: Hdf2rZFJhIi8hOlpbJyamwZu9aVOeoM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-29_11,2022-09-29_03,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=1271248072=kbusch@meta.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 29 Sep 2022 16:42:15 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keith Busch <kbusch@kernel.org>

An iov length needs to be aligned to the logical block size, which may
be larger than the memory alignment.

Tested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Keith Busch <kbusch@kernel.org>
---
 block/file-posix.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index e3f3de2780..af994aba2b 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2068,13 +2068,14 @@ static bool bdrv_qiov_is_aligned(BlockDriverState=
 *bs, QEMUIOVector *qiov)
 {
     int i;
     size_t alignment =3D bdrv_min_mem_align(bs);
+    size_t len =3D bs->bl.request_alignment;
     IO_CODE();
=20
     for (i =3D 0; i < qiov->niov; i++) {
         if ((uintptr_t) qiov->iov[i].iov_base % alignment) {
             return false;
         }
-        if (qiov->iov[i].iov_len % alignment) {
+        if (qiov->iov[i].iov_len % len) {
             return false;
         }
     }
--=20
2.30.2


