Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF5C3ABF5E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 01:27:51 +0200 (CEST)
Received: from localhost ([::1]:39502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu1QM-0003fO-2E
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 19:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1OS-0000hb-4q; Thu, 17 Jun 2021 19:25:52 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lu1ON-0007YB-St; Thu, 17 Jun 2021 19:25:51 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HN3jl8173891; Thu, 17 Jun 2021 19:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uoaAx17ZJBWRmxJjFnRUPbjmU2C+imkMYNBkmhDtbUQ=;
 b=Ay385KwqsFKWhZFcthlac1m3NA1mh4+4mTayt1ZS2DO1/bb6XBUWIvEofJ4Z59OCf7lC
 VHHF+etYSpHJ3P6eMRveUgsVSUgTeHLCO8FrpBhhQWJJImfkzx0qpK8w2D3odkxf7KQ7
 +t9m94R0QfDSOk074OydU1crWTmVSnD8RqXEBzg3gzR7bknpCYR+X1LEGkZGeBh2Ex1U
 EcdkE8Krwhbn0rNXyjeQjBPP1UivYsh4VdLzt/XnEvvc4yz0aJsn+XGtX8eKYB9aAWuU
 S7kjb5hXqeanhqELoGpORiJ9d6MU93nZSoQi8w+qYkcsDEutg9hrgS0V+Hvvw7Qcsd+W cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398fqwgfs1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:44 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HN51Xv181691;
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398fqwgfrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 19:25:43 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HNE2mK006120;
 Thu, 17 Jun 2021 23:25:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 394mj8u081-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 23:25:41 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HNPcRi26673614
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 23:25:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7454652050;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 614F35204E;
 Thu, 17 Jun 2021 23:25:38 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 2CA13E03E0; Fri, 18 Jun 2021 01:25:38 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v4 4/4] s390x/css: Add passthrough IRB
Date: Fri, 18 Jun 2021 01:25:37 +0200
Message-Id: <20210617232537.1337506-5-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210617232537.1337506-1-farman@linux.ibm.com>
References: <20210617232537.1337506-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RxjqTHX1KOpRI7U5x_klOUDxfyfcAsHq
X-Proofpoint-ORIG-GUID: jgIVprgo3c-_8cC01P3c2b4pL8DaXnWe
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_16:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 adultscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170140
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/s390x/css.c         | 16 +++++++++++++++-
 hw/s390x/s390-ccw.c    |  1 +
 hw/vfio/ccw.c          |  4 ++++
 include/hw/s390x/css.h |  3 +++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index 736715e100..c1e4f65f82 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,7 +1335,7 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
-static void copy_esw_to_guest(ESW *dest, const ESW *src)
+void copy_esw_to_guest(ESW *dest, const ESW *src)
 {
     dest->word0 = cpu_to_be32(src->word0);
     dest->erw = cpu_to_be32(src->erw);
@@ -1650,6 +1650,20 @@ static void build_irb_sense_data(SubchDev *sch, IRB *irb)
     }
 }
 
+void build_irb_passthrough(SubchDev *sch, IRB *irb)
+{
+    /* Copy ESW from hardware */
+    irb->esw = sch->esw;
+
+    /*
+     * If (irb->esw.erw & ESW_ERW_SENSE) is true, then the contents
+     * of the ECW is sense data. If false, then it is model-dependent
+     * information. Either way, copy it into the IRB for the guest to
+     * read/decide what to do with.
+     */
+    build_irb_sense_data(sch, irb);
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


