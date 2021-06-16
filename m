Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748B33A8E9C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:54:43 +0200 (CEST)
Received: from localhost ([::1]:34974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKlO-0008KK-IQ
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf4-0007xp-Gb; Tue, 15 Jun 2021 21:48:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:5258
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf1-0003Ea-2S; Tue, 15 Jun 2021 21:48:10 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G1XW8B191916; Tue, 15 Jun 2021 21:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=WO1+5Ro+xO4p1cDOfEKOJrpGKm7yhSkoJQwINg7cFGE=;
 b=MEUoqXEOveqlko1qTMyIeTcJ9O23VJGJTuLkNLxbU1d31PwXiOZR3GUjUP8ijjC6tcQw
 +5qeIp1dtV9v4gp9IelV7M33xLEgq0aej7FH5bG4TKKHYHCU36Hiw4JEPoOQtHcJEnrB
 mYjEi0SO0uX+RsEtHzOrVoO7yygO3MwhheawLEVE+PnHPIpYcMbMNihnaQOfobWtN+xE
 2dkQJ6lsj1hnTojdTQt1ga/QCHgtm1i1Um7EAv5mZs1nClV6IZul8DEi+7q//4/+O8WR
 BwQQ2qs70krQ7c4p+2ooVdf+UqCUsbjKnbngMQy6pmr5VJxeAbv3K+mBz8RY+kBoKlsG 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39752s3jtb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G1Z3vM194772;
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39752s3jst-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G1h1ji008799;
 Wed, 16 Jun 2021 01:48:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 394mj8ssx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 01:48:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15G1ktQI33751484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 01:46:55 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F49411C04C;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C46B11C050;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id C30D4E03D7; Wed, 16 Jun 2021 03:47:57 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 4/4] s390x/css: Add passthrough IRB
Date: Wed, 16 Jun 2021 03:47:49 +0200
Message-Id: <20210616014749.2460133-5-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616014749.2460133-1-farman@linux.ibm.com>
References: <20210616014749.2460133-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l2zTzmpj9BSIOYboXYg8k3zl-dVdZhe8
X-Proofpoint-ORIG-GUID: I5iA3geariTq9sG_zyifRNuA02FnPb0V
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-15_09:2021-06-15,
 2021-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106160007
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

Wire in the subchannel callback for building the IRB
ESW and ECW space for passthrough devices, and copy
the hardware's ESW into the IRB we are building.

If the hardware presented concurrent sense, then copy
that sense data into the IRB's ECW space.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/css.c         | 13 ++++++++++++-
 hw/s390x/s390-ccw.c    |  1 +
 hw/vfio/ccw.c          |  4 ++++
 include/hw/s390x/css.h |  3 +++
 4 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 9bd6e512eb..90b74b8b58 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,7 +1335,7 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
-static void copy_esw_to_guest(ESW *dest, const ESW *src)
+void copy_esw_to_guest(ESW *dest, const ESW *src)
 {
     dest->sublog = cpu_to_be32(src->sublog);
     dest->erw = cpu_to_be32(src->erw);
@@ -1650,6 +1650,17 @@ static void build_irb_sense_data(SubchDev *sch, IRB *irb)
     }
 }
 
+void build_irb_passthrough(SubchDev *sch, IRB *irb)
+{
+    /* Copy ESW from hardware */
+    irb->esw = sch->esw;
+
+    if (irb->esw.erw & ESW_ERW_SENSE) {
+        /* Copy ECW from hardware */
+        build_irb_sense_data(sch, irb);
+    }
+}
+
 void build_irb_virtual(SubchDev *sch, IRB *irb)
 {
     SCHIB *schib = &sch->curr_status;
diff --git a/hw/s390x/s390-ccw.c b/hw/s390x/s390-ccw.c
index c227c77984..2fc8bb9c23 100644
--- a/hw/s390x/s390-ccw.c
+++ b/hw/s390x/s390-ccw.c
@@ -124,6 +124,7 @@ static void s390_ccw_realize(S390CCWDevice *cdev, char *sysfsdev, Error **errp)
     }
     sch->driver_data = cdev;
     sch->do_subchannel_work = do_subchannel_work_passthrough;
+    sch->irb_cb = build_irb_passthrough;
 
     ccw_dev->sch = sch;
     ret = css_sch_build_schib(sch, &cdev->hostid);
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 139a3d9d1b..000992fb9f 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -321,6 +321,7 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
     SCHIB *schib = &sch->curr_status;
     SCSW s;
     IRB irb;
+    ESW esw;
     int size;
 
     if (!event_notifier_test_and_clear(&vcdev->io_notifier)) {
@@ -371,6 +372,9 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
     copy_scsw_to_guest(&s, &irb.scsw);
     schib->scsw = s;
 
+    copy_esw_to_guest(&esw, &irb.esw);
+    sch->esw = esw;
+
     /* If a uint check is pending, copy sense data. */
     if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
         (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
diff --git a/include/hw/s390x/css.h b/include/hw/s390x/css.h
index 7c23a13f3d..10ed1df1bb 100644
--- a/include/hw/s390x/css.h
+++ b/include/hw/s390x/css.h
@@ -141,6 +141,7 @@ struct SubchDev {
     void (*irb_cb)(SubchDev *, IRB *);
     SenseId id;
     void *driver_data;
+    ESW esw;
 };
 
 static inline void sch_gen_unit_exception(SubchDev *sch)
@@ -202,6 +203,7 @@ int css_sch_build_schib(SubchDev *sch, CssDevId *dev_id);
 unsigned int css_find_free_chpid(uint8_t cssid);
 uint16_t css_build_subchannel_id(SubchDev *sch);
 void copy_scsw_to_guest(SCSW *dest, const SCSW *src);
+void copy_esw_to_guest(ESW *dest, const ESW *src);
 void css_inject_io_interrupt(SubchDev *sch);
 void css_reset(void);
 void css_reset_sch(SubchDev *sch);
@@ -216,6 +218,7 @@ void css_clear_sei_pending(void);
 IOInstEnding s390_ccw_cmd_request(SubchDev *sch);
 IOInstEnding do_subchannel_work_virtual(SubchDev *sub);
 IOInstEnding do_subchannel_work_passthrough(SubchDev *sub);
+void build_irb_passthrough(SubchDev *sch, IRB *irb);
 void build_irb_virtual(SubchDev *sch, IRB *irb);
 
 int s390_ccw_halt(SubchDev *sch);
-- 
2.25.1


