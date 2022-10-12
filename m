Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 595C75FC57A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 14:39:04 +0200 (CEST)
Received: from localhost ([::1]:35442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oib0p-0007Kf-8A
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 08:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1oiauu-0002Qg-Gd; Wed, 12 Oct 2022 08:32:56 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:37322)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nrb@linux.ibm.com>)
 id 1oiaur-0001VK-JZ; Wed, 12 Oct 2022 08:32:55 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29CAcp2d001731;
 Wed, 12 Oct 2022 12:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=BbA/CFRGQHWAqNPWtj31JR3PQ4KWqjX0Dpem3fMikOM=;
 b=CHINP9DcpVr3ivh3W3KtdTnjmnGqhmgbwue2LAN8QPchihuW48bhIibopQwEr4Lv6nDK
 UeI9qToiTWwAUSgTzuaMrTVlzP5mpQjsUxnVHK1S/EFYEBQHvH+zVqvvWVSD6U7r66Zo
 EnA0sVAq2jHZtYRDEiTrVrtVD9vRQPiX8GRNWD7pOMxkrfAYNyhWjt+J/E3951s4VVwx
 1F/8dYS0WZpvXVSQvlKqAd5y8SnZTjza3Hpxtrj0aEAY605ZtiLi16+LW8fqFL3ykf8g
 K2YdNqR7nUUiit4Y8DLBHR3Ab+7j9t0QINR74eJe/SlA/KlmUVEtBjNKGSkkCTsDeVnG JA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5upwujh0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:32:49 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29CBt2H2026421;
 Wed, 12 Oct 2022 12:32:49 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k5upwuj9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:32:48 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29CCMmE4019612;
 Wed, 12 Oct 2022 12:32:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3k30u95ymr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Oct 2022 12:32:32 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29CCWTBh1639054
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Oct 2022 12:32:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B56A11C04C;
 Wed, 12 Oct 2022 12:32:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5099811C04A;
 Wed, 12 Oct 2022 12:32:29 +0000 (GMT)
Received: from a46lp57.lnxne.boe (unknown [9.152.108.100])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 Oct 2022 12:32:29 +0000 (GMT)
From: Nico Boehr <nrb@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, thuth@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, imbrenda@linux.ibm.com
Subject: [PATCH v1] s390x/tod-kvm: don't save/restore the TOD in PV guests
Date: Wed, 12 Oct 2022 14:32:29 +0200
Message-Id: <20221012123229.1196007-1-nrb@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cu2_bAjrkVV2WCDuLek6mVQk6ewT_xJD
X-Proofpoint-GUID: 1DkcYqj0W0NP3BxqTOB8hwPVtQngiiFi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-12_06,2022-10-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 clxscore=1011 suspectscore=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=781
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210120082
Received-SPF: pass client-ip=148.163.158.5; envelope-from=nrb@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Under PV, the guest's TOD clock is under control of the ultravisor and the
hypervisor cannot change it.

With upcoming kernel changes[1], the Linux kernel will reject QEMU's
request to adjust the guest's clock in this case, so don't attempt to set
the clock.

This avoids the following warning message on save/restore of a PV guest:

warning: Unable to set KVM guest TOD clock: Operation not supported

[1] https://lore.kernel.org/all/20221011160712.928239-2-nrb@linux.ibm.com/

Fixes: c3347ed0d2ee ("s390x: protvirt: Support unpack facility")
Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
---
 hw/s390x/tod-kvm.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/s390x/tod-kvm.c b/hw/s390x/tod-kvm.c
index 9d0cbfbce2bf..303bd67ee64f 100644
--- a/hw/s390x/tod-kvm.c
+++ b/hw/s390x/tod-kvm.c
@@ -13,6 +13,7 @@
 #include "qemu/module.h"
 #include "sysemu/runstate.h"
 #include "hw/s390x/tod.h"
+#include "hw/s390x/pv.h"
 #include "kvm/kvm_s390x.h"
 
 static void kvm_s390_get_tod_raw(S390TOD *tod, Error **errp)
@@ -84,6 +85,13 @@ static void kvm_s390_tod_vm_state_change(void *opaque, bool running,
     S390TODState *td = opaque;
     Error *local_err = NULL;
 
+    /*
+     * Under PV, the clock is under ultravisor control, hence we cannot restore
+     * it on resume.
+     */
+    if (s390_is_pv())
+        return;
+
     if (running && td->stopped) {
         /* Set the old TOD when running the VM - start the TOD clock. */
         kvm_s390_set_tod_raw(&td->base, &local_err);
-- 
2.36.1


