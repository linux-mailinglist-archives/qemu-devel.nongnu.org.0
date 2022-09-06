Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C555ADC3A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 02:14:27 +0200 (CEST)
Received: from localhost ([::1]:39346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVMEU-00029d-7b
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 20:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9Q-0003sW-Jp
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:12 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:64124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>) id 1oVM9M-0002Hl-4k
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 20:09:12 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 285Nqd3g025412;
 Tue, 6 Sep 2022 00:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Qw294nry3VonO7lIiHmYMewAg6tBtFHgQRGebHXyqyQ=;
 b=sVLhztYuHLHsFr1s31FMbZYqYMoyXHjoC2r694M6pBUA3YSvWHhrj8iugWZu7LBwDzO8
 jkXjMZSzp1D8MLLkmb9Ajs9gDT1PWjMEmWIW7FiSgGiXondkxu49QTwkwP1nm2U/NYmO
 R7BDDTYE+Jaq9auQQ6oTF+8kd+Xr8YMQcWW7seE0z0WXxQh757Xt5KeBn80T0nlXAB0G
 /OgRXWejXd3+7w3cZ0pu1PleIu/pC/0+ra4/8N3IpL1BRMKrzFLr6WHbxQGP2L5Ho8dg
 IYAKTiSetRAHm4ur2WYKqUkCLd4cvkQ5ytJvhzhfstLBy3lFFC64v45KIZxjIGlzC2Dy cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rf8g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:05 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 285NspTB003250;
 Tue, 6 Sep 2022 00:09:04 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jdu60rf6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:04 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 286065Gi010327;
 Tue, 6 Sep 2022 00:09:02 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3jbxj8u0xm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 00:09:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 28608vGs41156988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 6 Sep 2022 00:08:57 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C159011C04C;
 Tue,  6 Sep 2022 00:08:57 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 594F511C04A;
 Tue,  6 Sep 2022 00:08:57 +0000 (GMT)
Received: from heavy.lan (unknown [9.171.53.58])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  6 Sep 2022 00:08:57 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Taylor Simpson <tsimpson@quicinc.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v3 2/5] linux-user: Fix madvise(MADV_DONTNEED) on alpha
Date: Tue,  6 Sep 2022 02:08:36 +0200
Message-Id: <20220906000839.1672934-3-iii@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906000839.1672934-1-iii@linux.ibm.com>
References: <20220906000839.1672934-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wvgIJgx3ooWKtsn57QT5AGBlNlaqYn8B
X-Proofpoint-ORIG-GUID: voPcuxCJmVSh8SDjDvd6Xy3ruQKQtWKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-05_16,2022-09-05_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=990 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209050118
Received-SPF: pass client-ip=148.163.156.1; envelope-from=iii@linux.ibm.com;
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

MADV_DONTNEED has a different value on alpha, compared to all the other
architectures. Fix by using TARGET_MADV_DONTNEED instead of
MADV_DONTNEED.

Fixes: 892a4f6a750a ("linux-user: Add partial support for MADV_DONTNEED")
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
---
 linux-user/mmap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 048c4135af..a5f1ab129c 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "user-internals.h"
 #include "user-mmap.h"
+#include "target_mman.h"
 
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
@@ -891,7 +892,7 @@ abi_long target_madvise(abi_ulong start, abi_ulong len_in, int advice)
      * anonymous mappings. In this case passthrough is safe, so do it.
      */
     mmap_lock();
-    if (advice == MADV_DONTNEED &&
+    if (advice == TARGET_MADV_DONTNEED &&
         can_passthrough_madv_dontneed(start, end)) {
         ret = get_errno(madvise(g2h_untagged(start), len, MADV_DONTNEED));
         if (ret == 0) {
-- 
2.37.2


