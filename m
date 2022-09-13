Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B6F5B772C
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 19:05:27 +0200 (CEST)
Received: from localhost ([::1]:57538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9Lh-0003tr-SX
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 13:05:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9Ga-0000qD-4Z
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:08 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9GX-0002j8-D0
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:07 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DGIxmd003361;
 Tue, 13 Sep 2022 17:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BgdK/n6Xr7QQOAsqwC5YXEJpzH0gE58muPECzrZD3bU=;
 b=MWv59nzEU1nH2eNml5voY4saF5GyyrMr7oB6WC/ZV9oz9qqQYMC/zqOU+M9liStVupWa
 SEsP17xeP+TSEgwKCxwoIN8UOLoUwfMOblKshx9kimlCillb5WsTFRIluPc5oj/cBOBZ
 KEKFL4iOeltJS0OOXDaoG8B0OhQTSCCvJ09sObnY+B8YyTigLCjvQi+mKqNYFZlpiknY
 xRJVeLPONrUGuRMqwu7/fWRPEeoixsKGqQ3ryNy41YzS8hbfitxPyZOvcx7qHkIYi0T5
 kUR/SplF+41ZO20EbqfC056HIOgEsrxKnQBewATy//ibvSWUb3l8+FcsZRvMuBV8N0q2 UQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjw9ascar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:02 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DGpp51022340;
 Tue, 13 Sep 2022 17:00:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 3jgj7aak7j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28DH01OF55116106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Sep 2022 17:00:01 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2845378060;
 Tue, 13 Sep 2022 17:14:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE7567805E;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 2/4] tpm_crb: Avoid backend startup just before shutdown under
 Xen
Date: Tue, 13 Sep 2022 12:59:43 -0400
Message-Id: <20220913165945.1635016-3-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913165945.1635016-1-stefanb@linux.ibm.com>
References: <20220913165945.1635016-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -7Nj0LPDjGZG_xm1Tlt5tgLptZoHm9LX
X-Proofpoint-GUID: -7Nj0LPDjGZG_xm1Tlt5tgLptZoHm9LX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130075
Received-SPF: pass client-ip=148.163.158.5; envelope-from=stefanb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Ross Lagerwall <ross.lagerwall@citrix.com>

When running under Xen and the guest reboots, it boots into a new domain
with a new QEMU process (and a new swtpm process if using the emulator
backend). The existing reset function is triggered just before the old
QEMU process exists which causes QEMU to startup the TPM backend and
then immediately shut it down. This is probably harmless but when using
the emulated backend, it wastes CPU and IO time reloading state, etc.

Fix this by calling the reset function directly from realize() when
running under Xen. During a reboot, this will be called by the QEMU
process for the new domain.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-id: 20220826143841.1515326-1-ross.lagerwall@citrix.com
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 hw/tpm/tpm_crb.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c
index 67db594c48..ea930da545 100644
--- a/hw/tpm/tpm_crb.c
+++ b/hw/tpm/tpm_crb.c
@@ -26,6 +26,7 @@
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "sysemu/reset.h"
+#include "sysemu/xen.h"
 #include "tpm_prop.h"
 #include "tpm_ppi.h"
 #include "trace.h"
@@ -308,7 +309,11 @@ static void tpm_crb_realize(DeviceState *dev, Error **errp)
                      TPM_PPI_ADDR_BASE, OBJECT(s));
     }
 
-    qemu_register_reset(tpm_crb_reset, dev);
+    if (xen_enabled()) {
+        tpm_crb_reset(dev);
+    } else {
+        qemu_register_reset(tpm_crb_reset, dev);
+    }
 }
 
 static void tpm_crb_class_init(ObjectClass *klass, void *data)
-- 
2.37.2


