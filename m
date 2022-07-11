Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB34570ADE
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 21:41:29 +0200 (CEST)
Received: from localhost ([::1]:50788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAzHc-00045c-Au
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 15:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oAzEh-00029v-Nq; Mon, 11 Jul 2022 15:38:27 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:55412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oAzEe-0003QS-8f; Mon, 11 Jul 2022 15:38:26 -0400
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BJW5bi021009;
 Mon, 11 Jul 2022 19:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=2xrUlKM3Xt6TEOPRA+Dago9M6q/dtc3r6EAt73cr3f8=;
 b=i3pL12iEYi3AbqLqykR7Rl88c6zmeYC8QB7q8nqLFchNz0pBVKq++kpXHUYiWJYZvsBc
 C6k3jhgwCZf5K//g97c7n5q2S72L3Q059XV0ZO1fYsZ1h3BnjqaC/sTZog0mqTzh6dZN
 IvmY7ED16Rn8BUZHJG2TpXqRlZXil7GwjnOEpdC9y4NJ1xQPuK8purSR/7SvMIKPuRJ+
 STsvMxw+fLCUp1D7seI0FYRFd8LtDPx4b5yIXyTZh58vN5PeSbFvdxvf0R9Eh9fMXAad
 s/QU+xQ9m8pyoKCDsPfSo1bb2/mbYSioD+eCxU0YoYPC4wdidXdSodOoprJaHdxEjNLs XA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8t3t04v9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 19:38:08 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26BJWghc022999;
 Mon, 11 Jul 2022 19:38:07 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h8t3t04uv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 19:38:07 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26BJZrhI007609;
 Mon, 11 Jul 2022 19:38:06 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 3h71a99b79-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Jul 2022 19:38:06 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26BJc5xP54264180
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 19:38:05 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91BBFAC059;
 Mon, 11 Jul 2022 19:38:05 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF925AC05E;
 Mon, 11 Jul 2022 19:38:04 +0000 (GMT)
Received: from localhost (unknown [9.163.4.84])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 11 Jul 2022 19:38:04 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH] target/ppc/kvm: Skip ".." directory in kvmppc_find_cpu_dt
Date: Mon, 11 Jul 2022 16:37:43 -0300
Message-Id: <20220711193743.51456-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r6q7M3YInvZWsBgfpzrtkrdeUGERtsN8
X-Proofpoint-GUID: oXJZXSOPE_GNK0SUmudLO27ovm5I1I7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-11_24,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=835 bulkscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110082
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

Some systems have /proc/device-tree/cpus/../clock-frequency. However,
this is not the expected path for a CPU device tree directory.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/kvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..c8485a5cc0 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     buf[0] = '\0';
     while ((dirp = readdir(dp)) != NULL) {
         FILE *f;
+
+        /* Don't accidentally read from the upper directory */
+        if (strcmp(dirp->d_name, "..") == 0) {
+            continue;
+        }
+
         snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
                  dirp->d_name);
         f = fopen(buf, "r");
-- 
2.36.1


