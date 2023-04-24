Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB096ED09C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 16:48:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqxTu-0006i6-LN; Mon, 24 Apr 2023 10:47:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTr-0006fn-5I; Mon, 24 Apr 2023 10:47:51 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <harshpb@linux.ibm.com>)
 id 1pqxTp-0008Uq-El; Mon, 24 Apr 2023 10:47:50 -0400
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33OEasOh006302; Mon, 24 Apr 2023 14:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=p4YyZuzrsrSnHn6mlm4xnMfLrcS1+1nhYIc2wjrfLMQ=;
 b=QKOMsthyFU/lwVtBwtBkXJNctKw2J4yg1ZA0Q4s0R1pwUg67aROkDCn6EbqgVNjFS0TI
 SGhWJM49QAvZLLL3YKT3pHs6MY6OiFTm9hLnVGpdVnINWRC5M1DA3PQle5PsW19tXVOe
 j5BoXQEymAmsL2FlgKg08ldMkQvvDYHNmIRrIhJnYRJn4zLWHCM2rXnbwtZR3RkpsL9o
 MGqxJLRc1i1xqnwTAh4/IEAK8dyZ7mO8pINuA/IbNOd2WS4jOfEepvOhGmyMFvND/1Nm
 HC20epmgy6ugZF8iWXO2xC5Hnf8VuYtUstvUfHg2VmcWyJuZv3h6/mfziUs04FaoH/Fm 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47d5a4s5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:47 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OEbZ7q010948;
 Mon, 24 Apr 2023 14:47:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q47d5a4nb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O2F359020905;
 Mon, 24 Apr 2023 14:47:41 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
 by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3q47771676-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Apr 2023 14:47:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 33OElddg21562036
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Apr 2023 14:47:39 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 469BD2004B;
 Mon, 24 Apr 2023 14:47:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4840620040;
 Mon, 24 Apr 2023 14:47:37 +0000 (GMT)
Received: from li-1901474c-32f3-11b2-a85c-fc5ff2c001f3.ibm.com.com (unknown
 [9.43.92.123]) by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Mon, 24 Apr 2023 14:47:37 +0000 (GMT)
From: Harsh Prateek Bora <harshpb@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-devel@nongnu.org, farosas@suse.de, npiggin@gmail.com,
 danielhb413@gmail.com
Subject: [PATCH v2 4/4] MAINTAINERS: Adding myself in the list for ppc/spapr
Date: Mon, 24 Apr 2023 20:17:12 +0530
Message-Id: <20230424144712.1985425-5-harshpb@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230424144712.1985425-1-harshpb@linux.ibm.com>
References: <20230424144712.1985425-1-harshpb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: i_ff8EkenOPdqEaaFxCMyvm1jdT0gjI6
X-Proofpoint-GUID: 4D-w6i83ejqIOJgpt3JtnfsLZy3_sKZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=978
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304240131
Received-SPF: pass client-ip=148.163.156.1; envelope-from=harshpb@linux.ibm.com;
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Would like to get notified of changes in this area and review them.

Signed-off-by: Harsh Prateek Bora <harshpb@linux.ibm.com>
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2c2068ea5c..b5d290cf92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1420,6 +1420,7 @@ M: Daniel Henrique Barboza <danielhb413@gmail.com>
 R: Cédric Le Goater <clg@kaod.org>
 R: David Gibson <david@gibson.dropbear.id.au>
 R: Greg Kurz <groug@kaod.org>
+R: Harsh Prateek Bora <harshpb@linux.ibm.com>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/*/spapr*
-- 
2.31.1


