Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FD546E5AA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 10:36:22 +0100 (CET)
Received: from localhost ([::1]:42442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvFqf-0004At-Tz
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 04:36:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1mvFjT-00066q-Sq; Thu, 09 Dec 2021 04:28:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:22176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oro@il.ibm.com>)
 id 1mvFjS-0006Tv-9c; Thu, 09 Dec 2021 04:28:55 -0500
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B97bwc9008192; 
 Thu, 9 Dec 2021 09:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=M18RsD1YHGWRDXA7AvyKwwU0/jyJlajJNCegIn8CXQA=;
 b=Xio8W7wl7WqxbFGzoELWcgcEK6HdW9sGus1ibI1maDWIkrV139LyUJbgex+hs1kKWUJB
 Ov26JY7x0CVW8UCFxa491cQULZ2FW93hCPpz2gz71MQBMdRVqYtleT8z3JHOpV6KtSLQ
 vghoJ9AI49/q8MljWlN3mNAg9n5yREcLs8N6mvjq1DGIlTvugjqf+WweCCQ9Zszyuigr
 G+MsX75a3h8xq7Fz/x7T+9cKE97rJjO0s4ACqdbFQDuZ2/SU9gz96KnBkZNrnxU3K04Z
 FrCahdvLcdIT5HP5qLC/E2V8Rl4u5VNpzCDQYCKHejik8sIUcHGCf9vPVdVlQ4AbxZQe iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cucj2bbkc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:52 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B99Sqjb032312;
 Thu, 9 Dec 2021 09:28:52 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cucj2bbk6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:52 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B99SBKW018095;
 Thu, 9 Dec 2021 09:28:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3cqyybm71r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Dec 2021 09:28:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B99Snpf51708344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Dec 2021 09:28:49 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A4D728067;
 Thu,  9 Dec 2021 09:28:49 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8904C2805E;
 Thu,  9 Dec 2021 09:28:48 +0000 (GMT)
Received: from oro.sl.cloud9.ibm.com (unknown [9.59.192.176])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  9 Dec 2021 09:28:48 +0000 (GMT)
From: Or Ozeri <oro@il.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] virtio-block: switch to blk_get_max_hw_transfer
Date: Thu,  9 Dec 2021 03:28:15 -0600
Message-Id: <20211209092815.778066-2-oro@il.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211209092815.778066-1-oro@il.ibm.com>
References: <20211209092815.778066-1-oro@il.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -FWxhw0jK0oe1WwKMrVEO1D4zW-QLA7o
X-Proofpoint-ORIG-GUID: 8y5fLO8N-4ed4jNd4m70Pa2xEjgOQdLE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-09_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 malwarescore=0 mlxlogscore=899 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112090048
Received-SPF: pass client-ip=148.163.156.1; envelope-from=oro@il.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: dupadhya@redhat.com, oro@il.ibm.com, to.my.trociny@gmail.com,
 qemu-block@nongnu.org, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The blk_get_max_hw_transfer API was recently added in 6.1.0.
It allows querying an underlying block device its max transfer capability.
This commit changes virtio-blk to use this.

Signed-off-by: Or Ozeri <oro@il.ibm.com>
---
 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f139cd7cc9..1ba9a06888 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -458,7 +458,7 @@ static void virtio_blk_submit_multireq(BlockBackend *blk, MultiReqBuffer *mrb)
         return;
     }
 
-    max_transfer = blk_get_max_transfer(mrb->reqs[0]->dev->blk);
+    max_transfer = blk_get_max_hw_transfer(mrb->reqs[0]->dev->blk);
 
     qsort(mrb->reqs, mrb->num_reqs, sizeof(*mrb->reqs),
           &multireq_compare);
-- 
2.25.1


