Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F157284A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 23:13:22 +0200 (CEST)
Received: from localhost ([::1]:43854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBNC5-000533-A6
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 17:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oBN7V-0006jY-FW; Tue, 12 Jul 2022 17:08:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:10958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <muriloo@linux.ibm.com>)
 id 1oBN7T-0000fN-Gq; Tue, 12 Jul 2022 17:08:37 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26CL3ivu011246;
 Tue, 12 Jul 2022 21:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=/jEjCL7YZNXl35sUy8hZMe+9+/eyZ6DMN+SytBl4AY0=;
 b=rA5E2GoBh9K1iUsq9quvhfo/HOu7R6T8+jibkJErWFGKpfN1PeVB7PsZh/KC9z6HC4VQ
 j2rp+03YC0MrLJnL+KV9+JCn41a0TCiz2eg62rXbBxvs+roiRZrFkrlizaTVf8Upa0fy
 Ha5g2BdSP7IlWe8gZzHAe9nB0RoQZNRGoQnpjrkd9VwkFYI93URIjRVO1WJnZ41Fmgxe
 bxelMyoyNxHxkdQhgTvdC5roeoUn4QeOatZ5KwUVnVQvc+Xf37IABj2KS0UJ26Ly6Gvf
 0KRVdy/s3VEzOV5AP9SQPU1RGh0W1dMmHCb/WvYDib9dEexk570SHyDIfNMmu2OiJdVG gg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9akr222r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 21:08:21 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26CL6dPF024445;
 Tue, 12 Jul 2022 21:08:21 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h9akr2222-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 21:08:21 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26CL6D0N011666;
 Tue, 12 Jul 2022 21:08:20 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3h8mb9rnn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Jul 2022 21:08:20 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 26CL8JV317629624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Jul 2022 21:08:19 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6F69AC6055;
 Tue, 12 Jul 2022 21:08:19 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC3ECC605B;
 Tue, 12 Jul 2022 21:08:18 +0000 (GMT)
Received: from localhost (unknown [9.211.155.64])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 12 Jul 2022 21:08:18 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: qemu-devel@nongnu.org, qemu-ppc@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 mopsfelder@gmail.com, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Subject: [PATCH v2] target/ppc/kvm: Skip current and parent directories in
 kvmppc_find_cpu_dt
Date: Tue, 12 Jul 2022 18:08:10 -0300
Message-Id: <20220712210810.35514-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XP-HfteOCQzu5NFqlBJiJLOHsI-Ntg0-
X-Proofpoint-GUID: y9Es0O4dhqE4FkBSrnbe1kNJ6Y-orx7k
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_12,2022-07-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=780
 malwarescore=0 mlxscore=0 impostorscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207120086
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

Some systems have /proc/device-tree/cpus/../clock-frequency. However,
this is not the expected path for a CPU device tree directory.

Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
v2:
- Skip current and parent directories.

v1: https://lore.kernel.org/qemu-devel/20220711193743.51456-1-muriloo@linux.ibm.com/

 target/ppc/kvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 6eed466f80..466d0d2f4c 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -1877,6 +1877,12 @@ static int kvmppc_find_cpu_dt(char *buf, int buf_len)
     buf[0] = '\0';
     while ((dirp = readdir(dp)) != NULL) {
         FILE *f;
+
+        /* Don't accidentally read from the current and parent directories */
+        if (strcmp(dirp->d_name, ".") == 0 || strcmp(dirp->d_name, "..") == 0) {
+            continue;
+        }
+
         snprintf(buf, buf_len, "%s%s/clock-frequency", PROC_DEVTREE_CPU,
                  dirp->d_name);
         f = fopen(buf, "r");
-- 
2.36.1


