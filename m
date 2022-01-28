Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BD84A03FC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 23:57:11 +0100 (CET)
Received: from localhost ([::1]:54654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDaB4-0008Lr-E8
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 17:57:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZva-0007ln-IO; Fri, 28 Jan 2022 17:41:16 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nDZvL-0003W3-6l; Fri, 28 Jan 2022 17:41:08 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SMaELW015440; 
 Fri, 28 Jan 2022 22:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=tnRXRWzWpwYdHDY0ymNoDu3mtqbksKYrYuTZ4uZkbko=;
 b=DGKC4o4yego5Pc5RCoUm2Lhx45RdtNN5j0xqfKUOyEwzdiAPz/5FVwc1W5ikzEwv+b5v
 SkEuAeNkVrM1V08XvvEpfM7c07nwnzAAyZaQRuprcXnuYLA0st+MHijpFEgGmHuHI7yk
 82QpJyZaJn6WdFv7j5O8GH1jKrptxkfaIJOleomHW6pRQOjyVDX4oqJKyaaW7hakByCa
 z2ceKZ57RdBB3St+dr90enNJ3DfG9cAvNxfNxX0qkCu5NzSzuQPakwUM1KvKzU0vgtWs
 6LQ+N9ajDVoNHR+jqBxGc/I8BSc/DZy0lsWWtYXE6Eu/EDSMddCnGvV9qwPB3shg+FTS UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvm8jnxnr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:38 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20SMeL6U030205;
 Fri, 28 Jan 2022 22:40:37 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dvm8jnxnf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:37 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20SMcg3u027384;
 Fri, 28 Jan 2022 22:40:36 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 3dr9jcu1xh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 22:40:36 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20SMeZwQ29753818
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jan 2022 22:40:35 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 580F778060;
 Fri, 28 Jan 2022 22:40:35 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C287B7806A;
 Fri, 28 Jan 2022 22:40:33 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.66.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 28 Jan 2022 22:40:33 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/11] target/ppc: booke: Data Storage exception cleanup
Date: Fri, 28 Jan 2022 19:40:12 -0300
Message-Id: <20220128224018.1228062-6-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128224018.1228062-1-farosas@linux.ibm.com>
References: <20220128224018.1228062-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: g--YK52mg4a69cPh3qKjXsB20lKFMjat
X-Proofpoint-ORIG-GUID: hSFxe7Qnr4WDtk3G5Jo1baD-XpwHJUnM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 spamscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280125
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

There is no DSISR or DAR in BookE. Change to ESR and DEAR.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4753b81527..c8bd78d5cb 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -832,7 +832,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
 
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        trace_ppc_excp_dsi(env->spr[SPR_BOOKE_ESR], env->spr[SPR_BOOKE_DEAR]);
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
         trace_ppc_excp_isi(msr, env->nip);
-- 
2.34.1


