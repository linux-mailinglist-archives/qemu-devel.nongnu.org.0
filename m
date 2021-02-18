Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4410C31EDD6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 19:03:40 +0100 (CET)
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCneN-0004QX-8L
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 13:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lCnIg-0000Be-RW; Thu, 18 Feb 2021 12:41:19 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1lCnIc-0006vD-VH; Thu, 18 Feb 2021 12:41:14 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IHY1HY040637; Thu, 18 Feb 2021 12:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=XngdBw/B77KioqbuoRrCqR7QL3zmo4cvAzyuaTHcdqA=;
 b=RMgU0pjZ1dyYt6U8PFtyGmEEIZjFPXwniL0W2nJeOXeBjzEgc1QIBQeBK3RzSdRkueLO
 WYCmuMxdh/fy8rdoBLAnBfA5v/HGY6UtOzDDeozp4k34UhIyJEp7P0zXDg51dtZoY1fJ
 PAJHAj0vz/lIATGpkRW7wzPpEbD+vOu+zrCJVZKwaBr0b18A4d47DpHK0l3AKLAz5pn7
 QUIH364LjsnmBZ/cNWS8YyPqvw3FOaT9jdreaZgCbUeySqJ3JzjqX6o+QbEF9NuZ+t6V
 8g9OlBhP6s0FRIpesVh63DLcCvgIKwfvFexD7ue/w8vFlN85gR2InfpqJDxJJUZJqjUA Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sttvd0kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 12:41:07 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IHateN053248;
 Thu, 18 Feb 2021 12:41:07 -0500
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36sttvd0j9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 12:41:06 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IHb6kZ031362;
 Thu, 18 Feb 2021 17:41:04 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 36spsn868p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 17:41:04 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11IHf1Qn63898094
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 17:41:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7496F11C04C;
 Thu, 18 Feb 2021 17:41:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 025D611C050;
 Thu, 18 Feb 2021 17:41:01 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.94.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 17:41:00 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: cohuck@redhat.com
Subject: [PATCH 1/1] css: SCHIB measurement block origin must be aligned
Date: Thu, 18 Feb 2021 18:40:59 +0100
Message-Id: <1613670059-8406-2-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1613670059-8406-1-git-send-email-pmorel@linux.ibm.com>
References: <1613670059-8406-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180146
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 qemu-s390x@nongnu.org, imbrenda@linux.ibm.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Measurement Block Origin inside the SCHIB is used when
Mesurement Block format 1 is in used and must be aligned
on 128bits.

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


