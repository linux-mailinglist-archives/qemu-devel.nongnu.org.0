Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFA33ABF5C
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:27:45 +0200 (CEST)
Received: from localhost ([::1]:39102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1QG-0003PA-Tu
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:27:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1OQ-0000fr-Av; Thu, 17 Jun 2021 19:25:50 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63092
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1ON-0007XL-4s; Thu, 17 Jun 2021 19:25:50 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HN4o2R001267; Thu, 17 Jun 2021 19:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uSSAUiwGHZq6c67oVA8QJIYeOI8hpQtifpkx3eiFwWw=;
 b=IAkdrX8cFLsWH8MpSgoikuA4dgcbpHIyp1l5m91HGa/8epcduj1oZqvOZ/hvcHYPhW9s
 TXvPpzlMpcEm2cWP5awVb0dagNzlI1GOYPKJQ+/DFZn6rORoazb0EViCVJozfnxyrCqx
 mqf1UYtKrww1RKfJZat+JSIZ7nBeJvkOT9M0ZuOOwri6Rsa2PihfU0zpZraXtDME5VDr
 x3SCbY+rKDXRbspek/shLYTvS2cYWBK7eYZVxHhEXCYOQgL87kPORCNNFGKzRt7o6PG9
 KDtbn0FDQwsk1GpROUOuLPye3d0pmXw7vdCPBO1b0QlkC7EaqPJiXNy1O5wFHZznBqTl Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398f3818jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HN50Aq002214;
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 398f3818j3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HNDKSG022200;
 Thu, 17 Jun 2021 23:25:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 394mj8tywn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:25:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15HNOVdn25887186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 23:24:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F55E11C04C;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6805A11C050;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 2A5BAE03C3; Fri, 18 Jun 2021 01:25:38 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v4 3/4] s390x/css: Refactor IRB construction
Date: Fri, 18 Jun 2021 01:25:36 +0200
Message-Id: <20210617232537.1337506-4-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617232537.1337506-1-farman@linux.ibm.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yBMbKFMjpGFXwKJ27C6NFYIspk7h6CoU
X-Proofpoint-ORIG-GUID: Nt7gH_xRh-W_CRW0F5dLGUnHBPxFXGds
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170140
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Farman <farman@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, all subchannel types have "sense data" copied into
the IRB.ECW space, and a couple flags enabled in the IRB.SCSW
and IRB.ESW. But for passthrough (vfio-ccw) subchannels,
this data isn't populated in the first place, so enabling
those flags leads to unexpected behavior if the guest tries to
process the sense data (zeros) in the IRB.ECW.

Let's add a subchannel callback that builds these portions of
the IRB, and move the existing code into a routine for those
virtual subchannels. The passthrough subchannels will be able
to piggy-back onto this later.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/3270-ccw.c    |  1 +
 hw/s390x/css.c         | 45 +++++++++++++++++++++++++++---------------
 hw/s390x/virtio-ccw.c  |  1 +
 include/hw/s390x/css.h |  2 ++
 4 files changed, 33 insertions(+), 16 deletions(-)

diff --git a/hw/s390x/3270-ccw.c b/hw/s390x/3270-ccw.c
index 13e93d8d8f..69e6783ade 100644
--- a/hw/s390x/3270-ccw.c
+++ b/hw/s390x/3270-ccw.c
@@ -129,6 +129,7 @@ static void emulated_ccw_3270_realize(DeviceState *ds, Error **errp)
                                 EMULATED_CCW_3270_CHPID_TYPE);
     sch->do_subchannel_work = do_subchannel_work_virtual;
     sch->ccw_cb = emulated_ccw_3270_cb;
+    sch->irb_cb = build_irb_virtual;
 
     ck->init(dev, &err);
     if (err) {
diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index a54e384566..736715e100 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1650,6 +1650,30 @@ static void build_irb_sense_data(SubchDev *sch, IRB *irb)
     }
 }
 
+void build_irb_virtual(SubchDev *sch, IRB *irb)
+{
+    SCHIB *schib = &sch->curr_status;
+    uint16_t stctl = schib->scsw.ctrl & SCSW_CTRL_MASK_STCTL;
+
+    if (stctl & SCSW_STCTL_STATUS_PEND) {
+        if (schib->scsw.cstat & (SCSW_CSTAT_DATA_CHECK |
+                        SCSW_CSTAT_CHN_CTRL_CHK |
+                        SCSW_CSTAT_INTF_CTRL_CHK)) {
+            irb->scsw.flags |= SCSW_FLAGS_MASK_ESWF;
+            irb->esw.word0 = 0x04804000;
+        } else {
+            irb->esw.word0 = 0x00800000;
+        }
+        /* If a unit check is pending, copy sense data. */
+        if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
+            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
+            irb->scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
+            build_irb_sense_data(sch, irb);
+            irb->esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
+        }
+    }
+}
+
 int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 {
     SCHIB *schib = &sch->curr_status;
@@ -1668,23 +1692,12 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
 
     /* Copy scsw from current status. */
     irb.scsw = schib->scsw;
-    if (stctl & SCSW_STCTL_STATUS_PEND) {
-        if (schib->scsw.cstat & (SCSW_CSTAT_DATA_CHECK |
-                        SCSW_CSTAT_CHN_CTRL_CHK |
-                        SCSW_CSTAT_INTF_CTRL_CHK)) {
-            irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
-            irb.esw.word0 = 0x04804000;
-        } else {
-            irb.esw.word0 = 0x00800000;
-        }
-        /* If a unit check is pending, copy sense data. */
-        if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
-            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
-            irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
-            build_irb_sense_data(sch, &irb);
-            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
-        }
+
+    /* Build other IRB data, if necessary */
+    if (sch->irb_cb) {
+        sch->irb_cb(sch, &irb);
     }
+
     /* Store the irb to the guest. */
     p = schib->pmcw;
     copy_irb_to_guest(target_irb, &irb, &p, irb_len);
diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 220b9efcf9..d68888fccd 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -753,6 +753,7 @@ static void virtio_ccw_device_realize(VirtioCcwDevice *dev, Error **errp)
     sch->id.reserved = 0xff;
     sch->id.cu_type = VIRTIO_CCW_CU_TYPE;
     sch->do_subchannel_work = do_subchannel_work_virtual;
+    sch->irb_cb = build_irb_virtual;
     ccw_dev->sch = sch;
     dev->indicators = NULL;
     dev->revision = -1;
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index bba7593d2e..7c23a13f3d 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -138,6 +138,7 @@ struct SubchDev {
     int (*ccw_cb) (SubchDev *, CCW1);
     void (*disable_cb)(SubchDev *);
     IOInstEnding (*do_subchannel_work) (SubchDev *);
+    void (*irb_cb)(SubchDev *, IRB *);
     SenseId id;
     void *driver_data;
 };
@@ -215,6 +216,7 @@ void css_clear_sei_pending(void);
 IOInstEnding s390_ccw_cmd_request(SubchDev *sch);
 IOInstEnding do_subchannel_work_virtual(SubchDev *sub);
 IOInstEnding do_subchannel_work_passthrough(SubchDev *sub);
+void build_irb_virtual(SubchDev *sch, IRB *irb);
 
 int s390_ccw_halt(SubchDev *sch);
 int s390_ccw_clear(SubchDev *sch);
-- 
2.25.1


