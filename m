Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8252D51CDE7
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 03:18:33 +0200 (CEST)
Received: from localhost ([::1]:59046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmmc4-0002E2-4t
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 21:18:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nmmao-0000t0-Kd; Thu, 05 May 2022 21:17:14 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1nmmam-0007kU-Qb; Thu, 05 May 2022 21:17:14 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2460FED9030892;
 Fri, 6 May 2022 01:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=oDb+HfF1kRc8sf3VFH1r5TrRxmS46BgpdaM7xPUSwls=;
 b=f50dfQ6HQLQ9b8Hik7+st1ATqmd/HvopAWeBRbaRpBEIH2PyeLlWrzxthSjog8bESJRk
 a24V/wxzjPSxaC6eQVwZ7x0KnElP3UwOqc2oARcLdFyIKuliYpGRlyFdp4N16cdfCJcY
 h5xQkyVwd10BszkKOOQjtspOrayUeGDaoPqvvxwGShcE31zvc7/yXSyW9iD/otutbY/+
 tugLKm28oALsQun1jKoEYi9dyQoIFakIjSyL1PKZXMWHT3HUoK7hApHYU/ZNTbWbiK90
 ofPU/wZ/z1iIgn2wW5/nYOouXdzsyYejqzgKGVkU/V3c+qOhKdlZeYSKyK25z8VTM4Qj Pw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvry99051-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 01:16:58 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2461EN06008086;
 Fri, 6 May 2022 01:16:57 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fvry9904v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 01:16:57 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2461CMIi027409;
 Fri, 6 May 2022 01:16:57 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02wdc.us.ibm.com with ESMTP id 3frvra56xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 May 2022 01:16:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2461Gu796357952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 May 2022 01:16:56 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56346112061;
 Fri,  6 May 2022 01:16:56 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D22F6112062;
 Fri,  6 May 2022 01:16:55 +0000 (GMT)
Received: from localhost (unknown [9.160.56.100])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri,  6 May 2022 01:16:55 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, mopsfelder@gmail.com,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH v2] mos6522: fix linking error when CONFIG_MOS6522 is not set
Date: Thu,  5 May 2022 22:16:32 -0300
Message-Id: <20220506011632.183257-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mOY6AnOX1lrdAg8dOd9E6WGAcZszdKjX
X-Proofpoint-ORIG-GUID: bqXs7EyJTAt6KOwcDZZiCgHUdoLa5FFN
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-05_10,2022-05-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205060004
Received-SPF: pass client-ip=148.163.158.5; envelope-from=muriloo@linux.ibm.com;
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

When CONFIG_MOS6522 is not set, building ppc64-softmmu target fails:

    /usr/bin/ld: libqemu-ppc64-softmmu.fa.p/monitor_misc.c.o:(.data+0x1158): undefined reference to `hmp_info_via'

Make devices configuration available in hmp-commands*.hx and check for
CONFIG_MOS6522.

Fixes: 409e9f7131e5 (mos6522: add "info via" HMP command for debugging)
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
---
v2:
- Included devices configuration in monitor/misc.c

v1:
- https://lore.kernel.org/qemu-devel/20220429233146.29662-1-muriloo@linux.ibm.com/

 hmp-commands-info.hx | 2 ++
 monitor/misc.c       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index adfa085a9b..9ad784dd9f 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -881,6 +881,7 @@ SRST
 ERST
 
 #if defined(TARGET_M68K) || defined(TARGET_PPC)
+#if defined(CONFIG_MOS6522)
     {
         .name         = "via",
         .args_type    = "",
@@ -889,6 +890,7 @@ ERST
         .cmd          = hmp_info_via,
     },
 #endif
+#endif
 
 SRST
   ``info via``
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
2.35.1


