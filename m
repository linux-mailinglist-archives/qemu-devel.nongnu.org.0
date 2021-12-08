Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694446D365
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 13:35:05 +0100 (CET)
Received: from localhost ([::1]:50482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muwA3-0001d5-Pl
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 07:35:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw80-0007Fr-LM; Wed, 08 Dec 2021 07:32:56 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1muw7y-0005iP-OG; Wed, 08 Dec 2021 07:32:56 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B8BMa2N004291; 
 Wed, 8 Dec 2021 12:32:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=nSCMgeUhsHlXoWyU3E4Q0HHE/19COEXCc0zcYwtMGx8=;
 b=IywlZeLr+zNLfBQtY351kIE3bK092n/3Jm/Hx8s6PxnpoD7anxQHiwZu3VYaeOkm71Dz
 3Tw6ZPmu5rXnKEIbPHrNxubzh7i95gxMTma/8xweDQzcNR6Tkg2qPy0DJT5johcEZdVZ
 DqqEdLHJCJ3bIbHC0BGNw7LmU88YMl4IPwQTmJLrVOK7OX1QKqxMiojgANpb8dhBnKzn
 25GX/Bu+6o1RzyZscu80y0mWzqWoVfBmIs2UzdN9QVLhNqziz/38o59diNIOtFRdx7gp
 esvjZmIpJsiIWIiEqlDaCmzfQQsN9mPfsoiw0EiEE8bka9Vg4smC+50IOIu+Y6T0KkLh eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctuseh987-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:42 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B8CN5t4025802;
 Wed, 8 Dec 2021 12:32:41 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ctuseh97x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:41 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B8CW5kE000349;
 Wed, 8 Dec 2021 12:32:41 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 3cqyybaby6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Dec 2021 12:32:41 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B8CWdj157671956
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Dec 2021 12:32:39 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5E517806E;
 Wed,  8 Dec 2021 12:32:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3216E7805C;
 Wed,  8 Dec 2021 12:32:38 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.43.72])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  8 Dec 2021 12:32:38 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] target/ppc: Fix MPCxxx FPU interrupt address
Date: Wed,  8 Dec 2021 09:30:27 -0300
Message-Id: <20211208123029.2052625-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211208123029.2052625-1-farosas@linux.ibm.com>
References: <20211208123029.2052625-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: J23r2jyD5LjLxGFToBOKxRTvid09U6RG
X-Proofpoint-ORIG-GUID: N95MdXYtxTNQ00bZklFtdeGwVdIgvyK4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-08_04,2021-12-08_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=899 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112080080
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Floating-point Unavailable and Decrementer interrupts are being
registered at the same 0x900 address. The FPU should be at 0x800
instead.

Verified on MPC555, MPC860 and MPC885 user manuals.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/cpu_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6695985e9b..55af48769a 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -2180,7 +2180,7 @@ static void init_excp_MPC5xx(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
     env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
     env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
     env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
     env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
     env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
@@ -2207,7 +2207,7 @@ static void init_excp_MPC8xx(CPUPPCState *env)
     env->excp_vectors[POWERPC_EXCP_EXTERNAL] = 0x00000500;
     env->excp_vectors[POWERPC_EXCP_ALIGN]    = 0x00000600;
     env->excp_vectors[POWERPC_EXCP_PROGRAM]  = 0x00000700;
-    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000900;
+    env->excp_vectors[POWERPC_EXCP_FPU]      = 0x00000800;
     env->excp_vectors[POWERPC_EXCP_DECR]     = 0x00000900;
     env->excp_vectors[POWERPC_EXCP_SYSCALL]  = 0x00000C00;
     env->excp_vectors[POWERPC_EXCP_TRACE]    = 0x00000D00;
-- 
2.33.1


