Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D22D519258
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:32:31 +0200 (CEST)
Received: from localhost ([::1]:38728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm20M-0005Ge-AZ
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1NM-0002YS-Uj; Tue, 03 May 2022 18:52:13 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <iii@linux.ibm.com>)
 id 1nm1NL-00022j-4S; Tue, 03 May 2022 18:52:12 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243Mmqdq005483;
 Tue, 3 May 2022 22:52:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=8Goh9cFY4xL/WtuCeD4ecCRooYTPuhOfEMh2Dq3A07U=;
 b=RubJZRwTXgNQUmbmkZDxuYUabUtsJP49FinLWfbhOioz8Ib1DEzeWIpXQrXii3/DbikW
 o1DScHg6dyG9QLPWJqGafk+wPCAaH25Yc+NZ+CnFnv7bVf76GC/4eQ2LpUis9PFh8ck6
 4JQ5m1Aa5mcwJ2r0/m3DxTqNZwQXNIizF305bptiaYqvW6AXWxu1jvyGQdTSPGJ2aHE2
 2IvqLaobw51N72cgUs5GJVwsqoQTMYuIu2Z7vVWO3waXZT4G9dMniQqCTM3u5+oaIcB2
 ph3CI1LHblvV+kmqDxfH9WRq1SmiYCWDQCPLV7FXUu1FY5m1fRVHU9MIikZsfwgKpvnA KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fuc70sa1m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:08 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 243MmnEP005159;
 Tue, 3 May 2022 22:52:07 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3fuc70sa0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:07 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 243MmH1Q014872;
 Tue, 3 May 2022 22:52:05 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 3frvr8ut2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 May 2022 22:52:05 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 243Mq09k19595590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 May 2022 22:52:00 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECE9BA405C;
 Tue,  3 May 2022 22:52:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74BA0A4054;
 Tue,  3 May 2022 22:52:01 +0000 (GMT)
Received: from heavy.ibmuc.com (unknown [9.171.50.79])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 May 2022 22:52:01 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ulrich Weigand <ulrich.weigand@de.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 1/2] linux-user/s390x: Fix unwinding from signal handlers
Date: Wed,  4 May 2022 00:51:56 +0200
Message-Id: <20220503225157.1696774-2-iii@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503225157.1696774-1-iii@linux.ibm.com>
References: <20220503225157.1696774-1-iii@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: eOBc6MueiM8x-JvoJB6yxwKkRXHUImKF
X-Proofpoint-ORIG-GUID: XMXCHHC8AzeOfS0X5M7Z78ijBXgRzoJq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-03_09,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030136
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

Commit 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
removed an unused field from rt_sigframe, disturbing offsets of other
fields and breaking unwinding from signal handlers (e.g. libgcc's
s390_fallback_frame() relies on this struct having a specific layout).
Restore the field and add a comment.

Reported-by: Ulrich Weigand <ulrich.weigand@de.ibm.com>
Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Fixes: 31330e6cecfd ("linux-user/s390x: Implement setup_sigtramp")
---
 linux-user/s390x/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/s390x/signal.c b/linux-user/s390x/signal.c
index f47713e04a..4979c4b017 100644
--- a/linux-user/s390x/signal.c
+++ b/linux-user/s390x/signal.c
@@ -84,6 +84,11 @@ struct target_ucontext {
 
 typedef struct {
     uint8_t callee_used_stack[__SIGNAL_FRAMESIZE];
+    /*
+     * This field is no longer initialized by the kernel, but it's still a part
+     * of the ABI.
+     */
+    uint16_t svc_insn;
     struct target_siginfo info;
     struct target_ucontext uc;
 } rt_sigframe;
-- 
2.35.1


