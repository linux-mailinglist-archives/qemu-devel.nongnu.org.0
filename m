Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D37518BD5
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 20:06:06 +0200 (CEST)
Received: from localhost ([::1]:46556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlwuS-0000U8-Od
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 14:06:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nlwqH-0003YU-Vy; Tue, 03 May 2022 14:01:46 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:7088
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nlwqD-0006m6-9L; Tue, 03 May 2022 14:01:42 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243HWGvf020785;
 Tue, 3 May 2022 18:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=yNZlp9a+zg/GOSm3LbevHWw+e07eiVQNJPVMOE0lNkE=;
 b=KiSar4e6Ugcx3Gjlk8JxmkajxFj/gznA//Q7rTILFNZ3JW0+5C0ih+hI7cEcFAYy6Jze
 4cbCA8LMJZ4O4CeCxxzImz4kcRhuGn7SV70XlrjZVP7Agra7dDbOhG384qoHAE6ON6in
 zRYfSpmqt/2ZaDapZl/1IYASBtB92k3Ik2axipt1+i8DCyc6646QOvAdNrtMxqqVanWa
 dpdhAcDRhLwpDhpZiPwHyfY4QXW3FS3OBcirxpDEJVntEdYnUj7NBh0kdH1G3RIE2CT0
 S0PLaYjOgW/WxzFzkFyXcSklUMtEcDJUhWRdd/Lc1CFtB+vK9CwGw8b4EHBDHvV9lY/Q Ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu8vprgvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 18:01:30 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243HaC42005851;
 Tue, 3 May 2022 18:01:29 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fu8vprgv4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 18:01:29 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243HsJbM012087;
 Tue, 3 May 2022 18:01:28 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3frvr9ju6s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 18:01:28 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 243I1Rq326739112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 18:01:27 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B773AAE062;
 Tue,  3 May 2022 18:01:27 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A7A4AE066;
 Tue,  3 May 2022 18:01:27 +0000 (GMT)
Received: from localhost (unknown [9.65.192.61])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  3 May 2022 18:01:27 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Peter Turschmid <peter.turschm@nutanix.com>
Subject: [PATCH] vhost-user: Use correct macro name TARGET_PPC64
Date: Tue,  3 May 2022 15:01:08 -0300
Message-Id: <20220503180108.34506-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aNxXg2UACDavOwaCLk8hsqdTWmYdObnz
X-Proofpoint-ORIG-GUID: wc7-_jRk-1tLY1_nQpNqMzNbqy-_ramA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_07,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 mlxscore=0 mlxlogscore=999 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The correct name of the macro is TARGET_PPC64.

Fixes: 27598393a232 ("Lift max memory slots limit imposed by vhost-user")
Reported-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>
Cc: Peter Turschmid <peter.turschm@nutanix.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 9c4f84f35f..e356c72c81 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -51,7 +51,7 @@
 #include "hw/acpi/acpi.h"
 #define VHOST_USER_MAX_RAM_SLOTS ACPI_MAX_RAM_SLOTS
 
-#elif defined(TARGET_PPC) || defined(TARGET_PPC_64)
+#elif defined(TARGET_PPC) || defined(TARGET_PPC64)
 #include "hw/ppc/spapr.h"
 #define VHOST_USER_MAX_RAM_SLOTS SPAPR_MAX_RAM_SLOTS
 
-- 
2.35.1


