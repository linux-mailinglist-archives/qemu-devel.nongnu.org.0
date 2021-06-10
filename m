Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0660A3A34C8
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 22:22:53 +0200 (CEST)
Received: from localhost ([::1]:33962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrRCW-0000VW-1P
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 16:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRA8-0007Nu-SY; Thu, 10 Jun 2021 16:20:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:43672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrRA5-0001yz-RR; Thu, 10 Jun 2021 16:20:24 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15AK53i1045379; Thu, 10 Jun 2021 16:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=HGmkbNxhbi9Lll5eq2yEMCPeD+voD0tk+a7NIPAKdYg=;
 b=Fg60eCUiTomwo1ojM9c6YphETBuleG9J/aCxwRC5VXoC5F+N/R+fYWc3PN6Opeop5rgP
 6RO1xJh4HtCKophTMz+zdZBr54HiG5A/vycDfzTceJUWoAFxRH/yiEaV5vsS60JNVxA0
 ItnFU/d4Is2BcII0MwgxazE9y7+9cIv6vmvJSwiIM9WOwQeg2yVjjTKY5M4IONpRgv7h
 Hi6mMFnC6uB50zo0fDt9848PHwIT2PFQlrvvcfIlKjs3jpJcfrQHChA2WttuV5c+YAQE
 SZtgB86cKySg4rv8qR/MgacfYnV9bgGbVO8yKPedKixrR8RAXoFpYFyRDm+hjOBd6IH8 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393sbv8kg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:20:17 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15AK4vCr044716;
 Thu, 10 Jun 2021 16:20:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 393sbv8kfg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 16:20:17 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15AKEf97011321;
 Thu, 10 Jun 2021 20:20:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3900w8b1v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Jun 2021 20:20:15 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15AKKCGR33882438
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Jun 2021 20:20:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5F68A4068;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9248CA405B;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 10 Jun 2021 20:20:12 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 507C9E027E; Thu, 10 Jun 2021 22:20:12 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH 1/1] vfio-ccw: Keep passthrough sense data intact
Date: Thu, 10 Jun 2021 22:20:11 +0200
Message-Id: <20210610202011.391029-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610202011.391029-1-farman@linux.ibm.com>
References: <20210610202011.391029-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GLzw3p0w33SJUvFp3uPKcKy19dIKNGQe
X-Proofpoint-ORIG-GUID: cBVynbSkCqw8d4iGPfow0T4cboNagfIY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_13:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0 mlxlogscore=940
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106100129
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
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

For virtual devices, there is space for sense data to be built
and later copied into the IRB's ECW space once a TSCH is handled.

For passthrough devices, the IRB is passed up from hardware.
There might already be sense data in the ECW, in which case it
would be unusual to overwrite the IRB ESW/ECW data with itself.

In either case, if there isn't sense data, then an explicit SENSE
operation might be needed from the guest driver. Regardless,
fabricating sense data out of zeros seems like it would result
in unexpected behavior.

Let's remove the copying of the ECW/sense data in the vfio-ccw
driver, and adapt the check in the TSCH handler to look for
non-zero data in the local sense data before building a sense
data response in the IRB.

This fixes a "dasdfmt -M quick" command issued within a guest.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/css.c | 3 ++-
 hw/vfio/ccw.c  | 6 ------
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3..29234daa27 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1661,7 +1661,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
         }
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
-            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
+            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
+            (sch->sense_data[0] != 0)) {
             int i;
 
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 139a3d9d1b..a4dc4acb34 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -371,12 +371,6 @@ static void vfio_ccw_io_notifier_handler(void *opaque)
     copy_scsw_to_guest(&s, &irb.scsw);
     schib->scsw = s;
 
-    /* If a uint check is pending, copy sense data. */
-    if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
-        (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
-        memcpy(sch->sense_data, irb.ecw, sizeof(irb.ecw));
-    }
-
 read_err:
     css_inject_io_interrupt(sch);
 }
-- 
2.25.1


