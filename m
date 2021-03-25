Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857E34936A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 14:57:04 +0100 (CET)
Received: from localhost ([::1]:54174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQTv-00048Z-4c
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 09:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lPQSL-0003bU-Qd; Thu, 25 Mar 2021 09:55:25 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1lPQSJ-00070l-OX; Thu, 25 Mar 2021 09:55:25 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12PDXLPj146923; Thu, 25 Mar 2021 09:55:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version; s=pp1;
 bh=05xQ9nUqBc4xRusX/NKnfakIGF1Ts/mMq+q6CXwQtdg=;
 b=GR5i7A6wxxtoSVmZCaiemDA+k1BdLutUfALLXv/g4xuZX8zltzCNJ9XUobYxoX4/2NBn
 cqYp/giOE85esq6gk6TM66OG47ACI/DQdUZ7Tq/NEBX2gAF1Io4ZmLShA5/kZoxXs2d0
 qRZWvk0m2zi9iixn8LgsuKOE1F0PHdQh0TQOq8q0O6g3FAaL94ekleS85xxLpy80gDIo
 O4WHWuvBOucAf5lCu81j7P6fRBo7GRsl6cMJjnvRe6xlg/rMHCTp6vMM17eFAfQgfS1J
 hUqgcs+f4Y3PesQrqGkPxnZtzkybK0lQ88eBT9Hawe2wrB7t6V1YkCEhF0F+e4zWctPt Gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37grn15pv0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 09:55:18 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12PDYJfT154630;
 Thu, 25 Mar 2021 09:55:18 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37grn15pus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 09:55:18 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12PDqipC002664;
 Thu, 25 Mar 2021 13:55:17 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 37d9an7fxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Mar 2021 13:55:17 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12PDtEDr18284940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Mar 2021 13:55:14 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F1F6136092;
 Thu, 25 Mar 2021 13:55:14 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3FECD13605E;
 Thu, 25 Mar 2021 13:55:13 +0000 (GMT)
Received: from oc4221205838.ibm.com (unknown [9.211.67.166])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Mar 2021 13:55:12 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: cohuck@redhat.com
Subject: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
Date: Thu, 25 Mar 2021 09:55:09 -0400
Message-Id: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-25_03:2021-03-24,
 2021-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103250101
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, farman@linux.ibm.com,
 pmorel@linux.ibm.com, qemu-s390x@nongnu.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

S390 PCI currently has no backup, add one.  Add an additional backup
for vfio-ccw and refresh the backup for vfio-ap.

Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 MAINTAINERS | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 554be84..5620fc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1516,6 +1516,7 @@ L: qemu-s390x@nongnu.org
 
 S390 PCI
 M: Matthew Rosato <mjrosato@linux.ibm.com>
+M: Eric Farman <farman@linux.ibm.com>
 S: Supported
 F: hw/s390x/s390-pci*
 F: include/hw/s390x/s390-pci*
@@ -1830,6 +1831,7 @@ F: docs/igd-assign.txt
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
 M: Eric Farman <farman@linux.ibm.com>
+M: Matthew Rosato <mjrosato@linux.ibm.com>
 S: Supported
 F: hw/vfio/ccw.c
 F: hw/s390x/s390-ccw.c
@@ -1839,10 +1841,9 @@ T: git https://gitlab.com/cohuck/qemu.git s390-next
 L: qemu-s390x@nongnu.org
 
 vfio-ap
-M: Christian Borntraeger <borntraeger@de.ibm.com>
 M: Tony Krowiak <akrowiak@linux.ibm.com>
 M: Halil Pasic <pasic@linux.ibm.com>
-M: Pierre Morel <pmorel@linux.ibm.com>
+M: Jason Herne <jjherne@linux.ibm.com>
 S: Supported
 F: hw/s390x/ap-device.c
 F: hw/s390x/ap-bridge.c
-- 
1.8.3.1


