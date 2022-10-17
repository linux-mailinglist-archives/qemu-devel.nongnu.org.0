Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B7D600963
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:55:38 +0200 (CEST)
Received: from localhost ([::1]:41404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLuJ-00041K-Te
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLev-0007t4-Ex; Mon, 17 Oct 2022 04:39:46 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:57528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frankja@linux.ibm.com>)
 id 1okLes-0003fC-L2; Mon, 17 Oct 2022 04:39:41 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29H7rFZ8001846;
 Mon, 17 Oct 2022 08:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ihcyzdaTbDT5cwlGqNku/2YsTq8jCdtPF/3ztkFfD84=;
 b=i7JN04dJOYzMXZz86ktuMyhhkFmnD49zfGWSGs4TXjVHvnOndGf1SrNdtOt+Qfmd+jPu
 tqF6jG/WcT2VumtcOYRoAixFs/S7J/I97LW2wEuZTJwvezzksco7NNUhoBK9y3KY+Dwx
 gPR7+4QpfGWWh8oCjZqLsnXg7D6Khgr5X6bk78V61uc5GRlEndVGCoUBZGf36dTzhzWC
 udR16+7/2j/F4MDB82gzDeHJ6pdMs+MIZ56Pmvdkgx849WPNfMilWfJtvjZX2MDt295b
 rd1e12wPzBo1kJkPhwugwL53ik2w/dDg3boNdMsFpL4e8NhhQS6U7pQOYxp6IUmaARrh Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k866bha7h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:36 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29H8V97T008053;
 Mon, 17 Oct 2022 08:39:36 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k866bha6u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29H8b8hA026025;
 Mon, 17 Oct 2022 08:39:34 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3k7mg92n4s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Oct 2022 08:39:33 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 29H8dUsc64553264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Oct 2022 08:39:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9265A404D;
 Mon, 17 Oct 2022 08:39:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AD0F0A4051;
 Mon, 17 Oct 2022 08:39:29 +0000 (GMT)
Received: from linux6.. (unknown [9.114.12.104])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 17 Oct 2022 08:39:29 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, pbonzini@redhat.com, mhartmay@linux.ibm.com, 
 borntraeger@linux.ibm.com, imbrenda@linux.ibm.com, pasic@linux.ibm.com,
 cohuck@redhat.com, thuth@redhat.com, qemu-s390x@nongnu.org,
 seiden@linux.ibm.com, scgl@linux.ibm.com
Subject: [PATCH v6 04/10] dump: Reintroduce memory_offset and section_offset
Date: Mon, 17 Oct 2022 08:38:16 +0000
Message-Id: <20221017083822.43118-5-frankja@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017083822.43118-1-frankja@linux.ibm.com>
References: <20221017083822.43118-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 95KmpSQBMVmoi0by6-psYqEP_uBTVGsW
X-Proofpoint-ORIG-GUID: jncNJ2l4LYZGriAimml6brb5za8mLHAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-17_07,2022-10-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 mlxlogscore=799 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2210170049
Received-SPF: pass client-ip=148.163.156.1; envelope-from=frankja@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

section_offset will later be used to store the offset to the section
data which will be stored last. For now memory_offset is only needed
to make section_offset look nicer.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 dump/dump.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/dump/dump.c b/dump/dump.c
index b168a25321..626f7b2fd0 100644
--- a/dump/dump.c
+++ b/dump/dump.c
@@ -1876,6 +1876,8 @@ static void dump_init(DumpState *s, int fd, bool has_format,
         s->phdr_offset = s->shdr_offset + sizeof(Elf32_Shdr) * s->shdr_num;
         s->note_offset = s->phdr_offset + sizeof(Elf32_Phdr) * s->phdr_num;
     }
+    s->memory_offset = s->note_offset + s->note_size;
+    s->section_offset = s->memory_offset + s->total_size;
 
     return;
 
-- 
2.34.1


