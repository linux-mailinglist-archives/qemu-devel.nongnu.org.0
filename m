Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D39B28F30B
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 15:17:35 +0200 (CEST)
Received: from localhost ([::1]:58694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT38P-00052C-Tt
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 09:17:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kT37F-0004W6-TX; Thu, 15 Oct 2020 09:16:22 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:2252
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1kT37C-0005qU-Tv; Thu, 15 Oct 2020 09:16:21 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09FD1FAH077248; Thu, 15 Oct 2020 09:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject : date : message-id; s=pp1;
 bh=PMTlVxQ1ek8X0g/wkS0kgNIZfXno94TjDlYcQj6ucMg=;
 b=asITyDGW3TYQoDHsDlPAcSlLd7QPsZqGco44SgprxlJWvjdJl6KUkmRQia5bS3PJTHSP
 haTtwLX0LmvKg1M94xSgnvseZH5219rQIBY8rJtYb6YJ21Xe/FNA7aIcaJsubRnhbjzq
 x7mUrUrjJ4OfQ603xRQKTnwGZqr1MSf5M0ak3CfJDWIPkNEoiGYmI0piPz9fP+GmKTXF
 CrLJB1w6nLQoO+QTYw8vM+J9se08hcS3uPPBAXd7TauZvzNwYtq8+1GUjSG83I2t8VMG
 jB9rHyc+YkJOhYobfzjFcL2vnR5bBmXfpqJcLQTc7rgxPyptcP7fGW+VenbdhjSGHcvX VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 346pw48scs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 09:16:14 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 09FD1J3F077526;
 Thu, 15 Oct 2020 09:16:14 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 346pw48scb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 09:16:14 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09FDD5fA001915;
 Thu, 15 Oct 2020 13:16:13 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 3434k99wqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 15 Oct 2020 13:16:13 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09FDGApC59834716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 15 Oct 2020 13:16:10 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 769746E056;
 Thu, 15 Oct 2020 13:16:10 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 154A66E053;
 Thu, 15 Oct 2020 13:16:08 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.37.36])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 15 Oct 2020 13:16:08 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] s390x/s390-virtio-ccw: Reset PCI devices during subsystem
 reset
Date: Thu, 15 Oct 2020 09:16:07 -0400
Message-Id: <1602767767-32713-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-15_07:2020-10-14,
 2020-10-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=1
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010150090
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 09:16:15
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
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
 schnelle@linux.ibm.com, farman@linux.ibm.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently, a subsystem reset event leaves PCI devices enabled, causing
issues post-reset in the guest (an example would be after a kexec).  These
devices need to be reset during a subsystem reset, allowing them to be
properly re-enabled afterwards.  Add the S390 PCI host bridge to the list
of qdevs to be reset during subsystem reset.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/s390-virtio-ccw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e52182f..2e90033 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -101,6 +101,7 @@ static const char *const reset_dev_types[] = {
     "s390-sclp-event-facility",
     "s390-flic",
     "diag288",
+    TYPE_S390_PCI_HOST_BRIDGE,
 };
 
 static void subsystem_reset(void)
-- 
1.8.3.1


