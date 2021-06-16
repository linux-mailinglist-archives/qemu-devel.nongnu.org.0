Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0DA3A8E93
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 03:49:42 +0200 (CEST)
Received: from localhost ([::1]:52748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltKgX-00019t-CI
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 21:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf3-0007sX-1v; Tue, 15 Jun 2021 21:48:09 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34304
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1ltKf0-0003Eb-HR; Tue, 15 Jun 2021 21:48:08 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15G1XYQ7192017; Tue, 15 Jun 2021 21:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=COPAipmx/0G7UHAydJr1haV7qO+ant0RW8SvJcaMK9k=;
 b=r+I28Yy7DyZGSUSFqaQ7SWgEAKOfjKWZp/VS9FQhUOCUpJLVFBvBC6BMHrLaoj9cM3gN
 jo6Rf1QZxRbB6XOlmbEu57536yViatRnqfKkxvpLk/XTI8yo8/2dKYc4Bc9Ozv46IT2+
 riHd2513jdaMuwLPe0qFKhIStgliuqnTqm3XNJDlK3xJdfGzkdqYQEdV1+SunkS6qWTH
 YPkUmEs3vHSNp2wPWXJR77F2zyDL4iZvfBrovw/FrbTR7Eg5C5/3zW07tKYQ6kI796ru
 o5cH/lYzaBSQongNa5iOGXlr/iyYffx0z+b+3PUrA/+B45nL1kxxPvDTPyb75/LLwcGX rg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39752s3jt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15G1YP10193586;
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39752s3jsn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 21:48:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15G1gOmH024112;
 Wed, 16 Jun 2021 01:48:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 394m6hst3b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Jun 2021 01:48:01 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 15G1ktk326607952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Jun 2021 01:46:55 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46064A405B;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30BEAA4060;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 16 Jun 2021 01:47:58 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id BBB26E023D; Wed, 16 Jun 2021 03:47:57 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v3 1/4] s390x/css: Introduce an ESW struct
Date: Wed, 16 Jun 2021 03:47:46 +0200
Message-Id: <20210616014749.2460133-2-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210616014749.2460133-1-farman@linux.ibm.com>
References: <20210616014749.2460133-1-farman@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7mDLsKRyWKJXyNEmLQi4g_x0YrZaTF2V
X-Proofpoint-ORIG-GUID: Rwxbp3mkdZiDKaHKFQIt-eQFjIeEt6ce
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

The Interrupt Response Block is comprised of several other
structures concatenated together, but only the 12-byte
Subchannel-Status Word (SCSW) is defined as a proper struct.
Everything else is a simple array of 32-bit words.

Let's define a proper struct for the 20-byte Extended-Status
Word (ESW) so that we can make good decisions about the sense
data that would go into the ECW area for virtual vs
passthrough devices.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/css.c            | 19 +++++++++++++------
 include/hw/s390x/ioinst.h | 12 +++++++++++-
 2 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3..8be21efb13 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1335,6 +1335,14 @@ static void copy_schib_to_guest(SCHIB *dest, const SCHIB *src)
     }
 }
 
+static void copy_esw_to_guest(ESW *dest, const ESW *src)
+{
+    dest->sublog = cpu_to_be32(src->sublog);
+    dest->erw = cpu_to_be32(src->erw);
+    dest->f_addr = cpu_to_be64(src->f_addr);
+    dest->s_addr = cpu_to_be32(src->s_addr);
+}
+
 IOInstEnding css_do_stsch(SubchDev *sch, SCHIB *schib)
 {
     int ret;
@@ -1604,9 +1612,8 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
 
     copy_scsw_to_guest(&dest->scsw, &src->scsw);
 
-    for (i = 0; i < ARRAY_SIZE(dest->esw); i++) {
-        dest->esw[i] = cpu_to_be32(src->esw[i]);
-    }
+    copy_esw_to_guest(&dest->esw, &src->esw);
+
     for (i = 0; i < ARRAY_SIZE(dest->ecw); i++) {
         dest->ecw[i] = cpu_to_be32(src->ecw[i]);
     }
@@ -1655,9 +1662,9 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
                         SCSW_CSTAT_CHN_CTRL_CHK |
                         SCSW_CSTAT_INTF_CTRL_CHK)) {
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF;
-            irb.esw[0] = 0x04804000;
+            irb.esw.sublog = 0x04804000;
         } else {
-            irb.esw[0] = 0x00800000;
+            irb.esw.sublog = 0x00800000;
         }
         /* If a unit check is pending, copy sense data. */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
@@ -1670,7 +1677,7 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
             for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
                 irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
             }
-            irb.esw[1] = 0x01000000 | (sizeof(sch->sense_data) << 8);
+            irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
         }
     }
     /* Store the irb to the guest. */
diff --git a/include/hw/s390x/ioinst.h b/include/hw/s390x/ioinst.h
index c6737a30d4..9613e0ccbb 100644
--- a/include/hw/s390x/ioinst.h
+++ b/include/hw/s390x/ioinst.h
@@ -123,10 +123,20 @@ typedef struct SCHIB {
     uint8_t mda[4];
 } QEMU_PACKED SCHIB;
 
+/* extended-status word */
+typedef struct ESW {
+   uint32_t sublog;
+   uint32_t erw;
+   uint64_t f_addr;
+   uint32_t s_addr;
+} QEMU_PACKED ESW;
+
+#define ESW_ERW_SENSE 0x01000000
+
 /* interruption response block */
 typedef struct IRB {
     SCSW scsw;
-    uint32_t esw[5];
+    ESW esw;
     uint32_t ecw[8];
     uint32_t emw[8];
 } IRB;
-- 
2.25.1


