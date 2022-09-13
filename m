Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113745B772D
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 19:05:28 +0200 (CEST)
Received: from localhost ([::1]:39938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oY9Li-0003x3-VR
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 13:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9Gb-0000qL-Kp
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:52010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanb@linux.ibm.com>)
 id 1oY9GZ-0002jt-OU
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 13:00:09 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28DGg7bT014420;
 Tue, 13 Sep 2022 17:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=Aej9yljQMBszLtEbsPsSBBuaHjIwW4QTy4+RXsWKBpQ=;
 b=NfJMinny2CHOIcC+2sa9xQxCrGSELmPZpgmYDH7uXGLvtXFPhtT0YzX5Huw+CzVpFeZQ
 vdBh9zK+8NdjKwn5i0ryVB2Gf6dlR2Nc/YbUKeNOL13q2+nEiB6HbF35Vt3OIs+61S8H
 lWIO+M6gqqJHDGYI5LbcibbwGRiAduYtsp6yCYx4j+BsoudAtI+BUslopLKR0I4ugNIl
 GtmmyInHTvGaTI7ZqTCPu0QXhGqCZ/irzCR343/t4lwy3TyIUMXUNslLvCnQMzI4pV78
 2mqHAChqO0nLQ0XIG41Dj9VSADLnQPZVBQ7s/6ciCfN57WBibsnjedi64ZSXoKdqPoGl Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwm10k22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:02 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28DGr7h8027641;
 Tue, 13 Sep 2022 17:00:01 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjwm10k0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:01 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DGohvo015501;
 Tue, 13 Sep 2022 17:00:00 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3jgj7a59vp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Sep 2022 17:00:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28DGxxtt50135522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Sep 2022 16:59:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B65FB7805F;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CBA67805E;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 13 Sep 2022 17:14:29 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, Ross Lagerwall <ross.lagerwall@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 1/4] tpm_emulator: Avoid double initialization during migration
Date: Tue, 13 Sep 2022 12:59:42 -0400
Message-Id: <20220913165945.1635016-2-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220913165945.1635016-1-stefanb@linux.ibm.com>
References: <20220913165945.1635016-1-stefanb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LTKU3iebjTKNmECyGDBIPQ36qR3vKshg
X-Proofpoint-ORIG-GUID: zDBzxJGInUUOGXXf-fzgfGcHZrelae5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_09,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209130075
Received-SPF: pass client-ip=148.163.156.1; envelope-from=stefanb@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

When resuming after a migration, the backend sends CMD_INIT to the
emulator from the startup callback, then it sends the migration state
from the vmstate to the emulator, then it sends CMD_INIT again. Skip the
first CMD_INIT during a migration to avoid initializing the TPM twice.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Tested-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 backends/tpm/tpm_emulator.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index 87d061e9bb..9b50c5b3e2 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -32,6 +32,7 @@
 #include "qemu/sockets.h"
 #include "qemu/lockable.h"
 #include "io/channel-socket.h"
+#include "sysemu/runstate.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
 #include "tpm_int.h"
@@ -383,6 +384,15 @@ err_exit:
 
 static int tpm_emulator_startup_tpm(TPMBackend *tb, size_t buffersize)
 {
+    /* TPM startup will be done from post_load hook */
+    if (runstate_check(RUN_STATE_INMIGRATE)) {
+        if (buffersize != 0) {
+            return tpm_emulator_set_buffer_size(tb, buffersize, NULL);
+        }
+
+        return 0;
+    }
+
     return tpm_emulator_startup_tpm_resume(tb, buffersize, false);
 }
 
-- 
2.37.2


