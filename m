Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 392415227E5
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 01:57:08 +0200 (CEST)
Received: from localhost ([::1]:59722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noZj0-0002jq-EW
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 19:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1noZhS-0001sf-Gr; Tue, 10 May 2022 19:55:30 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:4368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1noZhQ-0007nv-GV; Tue, 10 May 2022 19:55:30 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24AMHcH1013747;
 Tue, 10 May 2022 23:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=hhvSyE+7iW67tCO9D55AvqvBI985Rq1iU4ybH2VgfCE=;
 b=PjNu/xgqx+30CzxX74ta+CV6ZyznWRmTHPW+lQ6LydBwuOXm75PH2FRtvDb8NWQXbH0h
 5PVbiiQMmVaa7sl9MEwvb/u+0BTtFTWlwb1E9Pz+F+x1Mms/U/L/MZnQOwBsrurP06X6
 iL5BY1QKkKUgjvEMyNDtsN6lvitjAUNgBGMLvutJrrxwT1mWUg20m3ikMgFVh3ESX4OI
 HnOlv1gq4EzSjpuis4zPbJwAJ48OOq3h/k4KytywE/Nog/XEbuKmznsD8E8Ms8O0Wdxf
 iB92djbujCG+bh+qqut8coKldbxspe5O5ni8o8Fzu14OU915sc3PdL8eN5k59aJxqfu8 tA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g00qes8ah-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 23:55:10 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24ANtAiJ030253;
 Tue, 10 May 2022 23:55:10 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g00qes8ab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 23:55:10 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24ANqOL6017695;
 Tue, 10 May 2022 23:55:09 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03dal.us.ibm.com with ESMTP id 3fwgd9xff5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 10 May 2022 23:55:09 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24ANt8DO25428240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 May 2022 23:55:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1364411206D;
 Tue, 10 May 2022 23:55:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E15611206B;
 Tue, 10 May 2022 23:55:07 +0000 (GMT)
Received: from localhost (unknown [9.65.84.66])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 10 May 2022 23:55:07 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v3] mos6522: fix linking error when CONFIG_MOS6522 is not set
Date: Tue, 10 May 2022 20:54:39 -0300
Message-Id: <20220510235439.54775-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hAO1UDeU0jGqyqv_1iQMx8bu1tn9UmMj
X-Proofpoint-GUID: qyGDludIf-0tkkrrAQUEqlrMaRDyuHWp
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-10_07,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205100097
Received-SPF: pass client-ip=148.163.156.1; envelope-from=muriloo@linux.ibm.com;
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

When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:

    /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'

Make devices configuration available in hmp-commands*.hx and check for
CONFIG_MOS6522.

Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Thomas Huth <thuth@redhat.com>
---
v3:
- Removed TARGET_M68K and TARGET_PPC checks, as per Thomas Huth suggestion.

v2:
- https://lore.kernel.org/qemu-devel/20220506011632.183257-1-muriloo@linux.ibm.com/
- Included devices configuration in monitor/misc.c

v1:
- https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/

 hmp-commands-info.hx | 2 +-
 monitor/misc.c       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..834bed089e 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -880,7 +880,7 @@ SRST
     Show intel SGX information.
 ERST
 
-#if defined(TARGET_M68K) || defined(TARGET_PPC)
+#if defined(CONFIG_MOS6522)
     {
         .name         = "via",
         .args_type    = "",
diff --git a/monitor/misc.c b/monitor/misc.c
index 6c5bb82d3b..3d2312ba8d 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -84,6 +84,9 @@
 #include "hw/s390x/storage-attributes.h"
 #endif
 
+/* Make devices configuration available for use in hmp-commands*.hx templates */
+#include CONFIG_DEVICES
+
 /* file descriptors passed via SCM_RIGHTS */
 typedef struct mon_fd_t mon_fd_t;
 struct mon_fd_t {
-- 
2.35.3


