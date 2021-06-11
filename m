Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E5C3A4A15
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:23:05 +0200 (CEST)
Received: from localhost ([::1]:40750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrngF-00006Y-TF
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrnfK-00074P-HI; Fri, 11 Jun 2021 16:22:06 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:13102)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lrnfI-0002TQ-9X; Fri, 11 Jun 2021 16:22:06 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BK3LxM077184; Fri, 11 Jun 2021 16:22:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NXV4L8d37XfFN9t0oCMwABERXWmv4PVa9uzU/DO8TXs=;
 b=Fhgzhon3jHinWTfysHvo/isEl8YPEWiDdG1KExi53PfokAP3T/0XM14MJAr/m9qensZJ
 KsPE8Ce0TR2+DEtM8jx4QKGH3totPLPlQW7qYfasNFbPo1fByHOrabWAr6Lq8jQbvzk/
 9e7WmOEJ2c13q+zv+9xG7K47JRsy2bg+iwNfb1URLNU21SVouat6jeka/CdcrmwXuqX8
 ZHquurBqsth46MI882GtQI6e/2hNVi17YaejHy2TN872olQkNuoKrq/F5o95/snk5mT9
 Sj/11rTEQER7KlLKIG0dn9VxAPEM8UVLVlULiS7858Koi2A3cV/T1bgS0NiiWlhtzQ7X rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394e6g8v1u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 16:22:00 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15BK4sPv085617;
 Fri, 11 Jun 2021 16:21:59 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 394e6g8v17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 16:21:59 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15BKDwOr027453;
 Fri, 11 Jun 2021 20:21:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3900w8bmuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 20:21:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15BKLsq08192340
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 20:21:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58D1C11C050;
 Fri, 11 Jun 2021 20:21:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4710111C04C;
 Fri, 11 Jun 2021 20:21:54 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 11 Jun 2021 20:21:54 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id E913BE020C; Fri, 11 Jun 2021 22:21:53 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
Subject: [PATCH v2] s390x/css: Selectively copy sense data to IRB
Date: Fri, 11 Jun 2021 22:21:51 +0200
Message-Id: <20210611202151.615410-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: o27FSlWuw0FaRIJilbRnTdD8H8GldIOB
X-Proofpoint-GUID: gD6wgDN9ShqHSLWvB3kqseNtF-jW-lkS
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106110127
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
 Christian Borntraeger <borntraeger@de.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SCHIB.PMCW.CSENSE bit is used to determine whether the
IRB should be set up with sense data, but that bit only
indicates whether sense data is requested, not if it was
provided by the device. For virtual devices, this is fine.

For passthrough devices, hardware would present sense data
in IRB.ECW, but that field is only valid if IRB.SCSW.E and
IRB.ERW.S were also set.

Let's only build the sense data in the IRB if the first byte
of sense is nonzero (indicating it may have come from a virtual
device), or the IRB.SCSW.E bit is already set (indicating it
came from the hardware). That way, the guest driver can read
the sense data if valid, or respond with a Sense CCW to get
the sense data if it wants/needs.

Fixes: df1fe5bb4924 ("s390: Virtual channel subsystem support.")
Fixes: 334e76850bbb ("vfio/ccw: update sense data if a unit check is pending")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---

Notes:
    v1->v2:
     - [MR] Add Fixes: tags
     - [CH] Reinstate the memcpy(sch->sense_data, irb.ecw) in vfio_ccw
     - [CH] Look at IRB.SCSW.E before copying sense into guest IRB
    
    v1: https://lore.kernel.org/qemu-devel/20210610202011.391029-1-farman@linux.ibm.com/

 hw/s390x/css.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/css.c b/hw/s390x/css.c
index bed46f5ec3..8935f948d5 100644
--- a/hw/s390x/css.c
+++ b/hw/s390x/css.c
@@ -1659,9 +1659,15 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
         } else {
             irb.esw[0] = 0x00800000;
         }
-        /* If a unit check is pending, copy sense data. */
+        /*
+         * If a unit check is pending and concurrent sense
+         * is requested, copy the sense data if the sense
+         * data is plausibly valid.
+         */
         if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
-            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
+            (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE) &&
+            ((schib->scsw.flags & SCSW_FLAGS_MASK_ECTL) ||
+             (sch->sense_data[0] != 0))) {
             int i;
 
             irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
-- 
2.25.1


