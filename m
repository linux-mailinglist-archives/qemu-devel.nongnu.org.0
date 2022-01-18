Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8651D492EA1
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 20:44:36 +0100 (CET)
Received: from localhost ([::1]:40226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9uPD-0006Oc-3d
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 14:44:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tUU-0005tu-1h; Tue, 18 Jan 2022 13:45:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63726
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n9tUE-00034f-M4; Tue, 18 Jan 2022 13:45:48 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20IH2MNi029238; 
 Tue, 18 Jan 2022 18:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=UVC3ah59WKhVgK73j27mhDmbNIq25HuDzD2DZ0k/0os=;
 b=PVD4OnJ8f1OpSax6y3VRRV2KpQjTXAyGzpOw6/qI1J9IMCJvIgFF5H9bctorG6s9B+JK
 WIijwqVZKsQjPJUT2GFbmj/aPTz0fF3kOZiQkcvfFN9bOWSBvr9QrYmXYjVLIlK5O+9u
 UqwNTY6zLUSh6yq++BPSHQD6XToVmck/ylm+suUYtolofpylpP9wHcEW+KBg1ecXiKHh
 FevKzGNwzOPqZbTy4if+4neF+kDZ4UXIHrnklB1ybWPf7GKDcZh5FgnsmDcLitl5DQPM
 0vvMU1OeLy+NYoVSqTqCF+4KDdxVuqH0h1PBdLc6PVPD57i1aJD0J7jR9IXSbgaOonf4 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2ug1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:36 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20IIV0U4009403;
 Tue, 18 Jan 2022 18:45:35 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dp1kq2ufn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:35 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20IIbBjP032228;
 Tue, 18 Jan 2022 18:45:35 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma03dal.us.ibm.com with ESMTP id 3dknwc5b3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 18 Jan 2022 18:45:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20IIjXU138928646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 18 Jan 2022 18:45:33 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8311EAE067;
 Tue, 18 Jan 2022 18:45:33 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C46D1AE05C;
 Tue, 18 Jan 2022 18:45:30 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.109.91])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 18 Jan 2022 18:45:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/14] target/ppc: 405: Data Storage exception cleanup
Date: Tue, 18 Jan 2022 15:44:45 -0300
Message-Id: <20220118184448.852996-12-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220118184448.852996-1-farosas@linux.ibm.com>
References: <20220118184448.852996-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k7y0dFY-HG7jq7D3iDipHqMlliXv_0SF
X-Proofpoint-GUID: r240D7p7_0p33UbGfLxQQGq1MFCrbIGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-18_05,2022-01-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 adultscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201180112
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
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

The 405 has no DSISR or DAR, so convert the trace entry to
trace_ppc_excp_print.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 84ec7e094a..e4e513322c 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -465,7 +465,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         srr1 = SPR_40x_SRR3;
         break;
     case POWERPC_EXCP_DSI:       /* Data storage exception                   */
-        trace_ppc_excp_dsi(env->spr[SPR_DSISR], env->spr[SPR_DAR]);
+        trace_ppc_excp_print("DSI");
         break;
     case POWERPC_EXCP_ISI:       /* Instruction storage exception            */
         trace_ppc_excp_isi(msr, env->nip);
-- 
2.33.1


