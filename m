Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CE72B13D9
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 02:33:23 +0100 (CET)
Received: from localhost ([::1]:48474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdNxq-0005rL-Df
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 20:33:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsQ-0003aT-8e
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:38 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:42236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1kdLsN-0006xm-Q5
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 18:19:37 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAR4R109860;
 Thu, 12 Nov 2020 23:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=on3yVKDApVeThHnfRXreTxe05Ey7ypnRF7cGsfswQMs=;
 b=zl4HvnZWzCUyiTLVNG3kMQ1ozuBvYxLmr/Aaqz94OrCBTm/W8ONvLDvpIEZnT9p/mmaq
 suVEDWmL5VWhbcawAPQeCC9edPGqnHWpJJYGoOwKtAKkyHKSQB2HbJ+6LAaUI34HV1nd
 AvUnHbHC4n+fCUn0Pzgg1nT49d3Hewy68kAKQoTvqrdZarTOQ698wQ5zcZNL+1D8iJtK
 KBA5bOdNaIEPJR5l48Za7G4+4f5Q4KhBlcaRZcPc8Iqx6nH7mG0GqqH/CmPxEEqWWGH4
 yJ35lwB9djx5blwVf4RD0zaaafnccsoGpTTRm47Nozo1YN5ek4elINBno2FHBXFNoPQw 0g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2120.oracle.com with ESMTP id 34p72exau7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Nov 2020 23:19:26 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0ACNAH1G075878;
 Thu, 12 Nov 2020 23:19:26 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 34rtksk50f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Nov 2020 23:19:26 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0ACNJNww026449;
 Thu, 12 Nov 2020 23:19:23 GMT
Received: from ol2.localdomain (/73.88.28.6)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 12 Nov 2020 15:19:23 -0800
From: Mike Christie <michael.christie@oracle.com>
To: stefanha@redhat.com, qemu-devel@nongnu.org, fam@euphon.net,
 linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
 mst@redhat.com, jasowang@redhat.com, pbonzini@redhat.com,
 virtualization@lists.linux-foundation.org
Subject: [PATCH 02/10] vhost scsi: remove extra flushes
Date: Thu, 12 Nov 2020 17:19:02 -0600
Message-Id: <1605223150-10888-4-git-send-email-michael.christie@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
References: <1605223150-10888-1-git-send-email-michael.christie@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 phishscore=0
 suspectscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9803
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011120130
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=michael.christie@oracle.com; helo=userp2120.oracle.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:37:30
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 12 Nov 2020 20:29:32 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost work flush function was flushing the entire work queue, so
there is no need for the double vhost_work_dev_flush calls in
vhost_scsi_flush.

And we do not need to call vhost_poll_flush for each poller because
that call also ends up flushing the same work queue thread the
vhost_work_dev_flush call flushed.

Signed-off-by: Mike Christie <michael.christie@oracle.com>
---
 drivers/vhost/scsi.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index 8795fd3..4725a08 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -1443,11 +1443,6 @@ static void vhost_scsi_handle_kick(struct vhost_work *work)
 	vhost_scsi_handle_vq(vs, vq);
 }
 
-static void vhost_scsi_flush_vq(struct vhost_scsi *vs, int index)
-{
-	vhost_poll_flush(&vs->vqs[index].vq.poll);
-}
-
 /* Callers must hold dev mutex */
 static void vhost_scsi_flush(struct vhost_scsi *vs)
 {
@@ -1466,9 +1461,6 @@ static void vhost_scsi_flush(struct vhost_scsi *vs)
 		kref_put(&old_inflight[i]->kref, vhost_scsi_done_inflight);
 
 	/* Flush both the vhost poll and vhost work */
-	for (i = 0; i < VHOST_SCSI_MAX_VQ; i++)
-		vhost_scsi_flush_vq(vs, i);
-	vhost_work_dev_flush(&vs->dev);
 	vhost_work_dev_flush(&vs->dev);
 
 	/* Wait for all reqs issued before the flush to be finished */
-- 
1.8.3.1


