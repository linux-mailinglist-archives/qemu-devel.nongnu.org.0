Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C734B31FA08
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 14:42:19 +0100 (CET)
Received: from localhost ([::1]:57510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD630-0004fD-Qt
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 08:42:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lD60X-0003Ys-MA; Fri, 19 Feb 2021 08:39:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56268
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lD60U-00008R-OE; Fri, 19 Feb 2021 08:39:45 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11JDVUo5146988; Fri, 19 Feb 2021 08:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=mbmYLCs9zyH0C2kmy1R2JdDmgp7c40cDY3SQamUTdCE=;
 b=DW4IyBXA6C+HHz7f/Ez9FgLPqw3eqdIScVn/5npbQMqcGvfccTRTR//P/hMzhvuD4K4T
 jDforEgvaISmD+QD6jHKj/CMFKk2hnfFM3zsz9BnoYg0PYtkprgorKB0e6EIF8IJFULk
 XQSY45AlZaLGcrgtE1Bp6hcOzKOPYgfoVX8maZjrQn1wT6kPR0D8LGMmJcEfO65wR+zK
 sY1bs7XmTCrWnLgQh8BzWAOvD5UDNrQFzv792BxUDXOOS8QZ07i1L87XEzLyC52YdgdD
 85pOtLTH0VvyNuvaeHyvn3mYO9xqxs4cUB1GI5iQkaT/X6HA2cRXPXTeXZNXvi1UDi4d vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36tdjg1vn5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 08:39:41 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11JDVgn6147851;
 Fri, 19 Feb 2021 08:39:41 -0500
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36tdjg1vmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 08:39:41 -0500
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11JDXasK013722;
 Fri, 19 Feb 2021 13:39:39 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 36p6d8jxer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Feb 2021 13:39:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11JDdaOr42140138
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Feb 2021 13:39:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E393AE045;
 Fri, 19 Feb 2021 13:39:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3E2CAE053;
 Fri, 19 Feb 2021 13:39:35 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.23.206])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 19 Feb 2021 13:39:35 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/1] css: SCHIB measurement block origin must be aligned
Date: Fri, 19 Feb 2021 14:39:33 +0100
Message-Id: <1613741973-3711-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
References: <1613741973-3711-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-19_05:2021-02-18,
 2021-02-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102190105
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Measurement Block Origin inside the SCHIB is used when
Measurement Block format 1 is in used and must be aligned
on 64 bytes otherwise an operand exception is recognized
when issuing the Modify Sub CHannel (MSCH) instruction.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/ioinst.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index a412926d27..1ee11522e1 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -121,6 +121,12 @@ static int ioinst_schib_valid(SCHIB *schib)
     if (be32_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_XMWME) {
         return 0;
     }
+    /* for MB format 1 bits 26-31 of word 11 must be 0 */
+    /* MBA uses words 10 and 11, it means align on 2**6 */
+    if ((be16_to_cpu(schib->pmcw.chars) & PMCW_CHARS_MASK_MBFC) &&
+        (be64_to_cpu(schib->mba) & 0x03fUL)) {
+        return 0;
+    }
     return 1;
 }
 
-- 
2.25.1


