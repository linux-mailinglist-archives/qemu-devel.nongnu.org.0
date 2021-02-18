Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 082C731F168
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:55:22 +0100 (CET)
Received: from localhost ([::1]:50286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCqKW-0000V8-Ix
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:55:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lCqIz-0007yL-Tp; Thu, 18 Feb 2021 15:53:45 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47216
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lCqIu-00023q-54; Thu, 18 Feb 2021 15:53:45 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11IKUrGC033507; Thu, 18 Feb 2021 15:53:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=bSxuySZUxhZ2egt7YvGu05v/nNJzx6G44c8QwlI5+as=;
 b=g7lJHTsQH6M4favdvxllOT0CqxW5WsRaSNtSHAPb4As7QGvEA6rzE/A5jDIF0w/tWSMe
 BWXDoF5WYMUr3ICLP/Wi1MUXj6ftU8bh8HoHf1/RCd4qyc4WbXwzWZvUnuUY3XBYpiG3
 hxaB4GC4n5loTJOVdSOhIu+K3FKXZkNcPBzoFRPUUK48E3rlwp2F8hLSR8f8DTXE2YUk
 DyNHd7MSg/J516L8vIkuPp71L0Y6gdFV4kChUCXAbeKho5yO/wHPQXlQuOERTE0SUEte
 lwYScuZpgfm0L/31Gx0KOILhBD/XePUoNA+jfnH70QS8NckuARNJXyIpxYOsgx3uoi19 bA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36sy998ht4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 15:53:36 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11IKV9kr034333;
 Thu, 18 Feb 2021 15:53:35 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36sy998hsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 15:53:35 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11IKpmwX018356;
 Thu, 18 Feb 2021 20:53:35 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 36p6d9rq86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Feb 2021 20:53:35 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11IKrXlp50004282
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Feb 2021 20:53:33 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FF526E04C;
 Thu, 18 Feb 2021 20:53:33 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7FBD96E050;
 Thu, 18 Feb 2021 20:53:32 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.37.34])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 18 Feb 2021 20:53:32 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com, thuth@redhat.com
Subject: [PATCH] s390x/pci: restore missing Query PCI Function CLP data
Date: Thu, 18 Feb 2021 15:53:29 -0500
Message-Id: <1613681609-9349-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-18_09:2021-02-18,
 2021-02-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 mlxscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102180166
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: david@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some CLP response data was accidentally dropped when fixing endianness
issues with the Query PCI Function CLP response.  All of these values are
sent as 0s to the guest for emulated devices, so the impact is only
observed on passthrough devices.

Fixes: a4e2fff1b104 ("s390x/pci: fix endianness issues")
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-inst.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 654fac6..4b8326a 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -284,10 +284,15 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintptr_t ra)
         stq_p(&resquery->sdma, pbdev->zpci_fn.sdma);
         stq_p(&resquery->edma, pbdev->zpci_fn.edma);
         stw_p(&resquery->pchid, pbdev->zpci_fn.pchid);
+        stw_p(&resquery->vfn, pbdev->zpci_fn.vfn);
         resquery->flags = pbdev->zpci_fn.flags;
         resquery->pfgid = pbdev->zpci_fn.pfgid;
+        resquery->pft = pbdev->zpci_fn.pft;
+        resquery->fmbl = pbdev->zpci_fn.fmbl;
         stl_p(&resquery->fid, pbdev->zpci_fn.fid);
         stl_p(&resquery->uid, pbdev->zpci_fn.uid);
+        memcpy(resquery->pfip, pbdev->zpci_fn.pfip, CLP_PFIP_NR_SEGMENTS);
+        memcpy(resquery->util_str, pbdev->zpci_fn.util_str, CLP_UTIL_STR_LEN);
 
         for (i = 0; i < PCI_BAR_COUNT; i++) {
             uint32_t data = pci_get_long(pbdev->pdev->config +
-- 
1.8.3.1


