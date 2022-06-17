Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529FA54F4B1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 11:57:55 +0200 (CEST)
Received: from localhost ([::1]:60546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o28ji-00007S-Da
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 05:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o28ed-0006Nu-9V; Fri, 17 Jun 2022 05:52:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1o28eb-0002AK-7V; Fri, 17 Jun 2022 05:52:39 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25H8YQ8n023089;
 Fri, 17 Jun 2022 09:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nVcYMxMssy8glgTb/HVDkVIjA/0yJhN3pauYcBpvixc=;
 b=PITWSFayPJ39J7Rv4RL55N+ASAnm8nSsoHdTYi/2W6yxUiZZeobd6aTlMZaE0XdWeCy4
 kvrP9fuuDmm/UeUeiJOFCoXyXHCGN9mX+3FUMpeBGBGR1cPKtpSKFRIioCdwe7CNtgqA
 VNMRKBu53pSdW3ZKx/nhyx7SIpesrHC0jv9zF2WgzeZeuRqUQz5vSFqRBy4Yq0xKFgvu
 And7eJeI/uVnVU3qaenXqFdlp0WECuQ33VFIzrmAEa7Jvfe0pGtMwpH5yyiQKsU5fllt
 gSWDdbeUHylrll5HZtHrafR0K252sj5T7fg/0y2YGp5s/eZpJTWp9bI+T+l17wr6f8Fz rw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grp7e1rr8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:52:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25H9Umwc029576;
 Fri, 17 Jun 2022 09:52:26 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3grp7e1rqq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:52:26 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25H9oinp004265;
 Fri, 17 Jun 2022 09:52:25 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3gmjajgncc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Jun 2022 09:52:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 25H9qRYD23789876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 09:52:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E77E8A4054;
 Fri, 17 Jun 2022 09:52:22 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B36E2A405B;
 Fri, 17 Jun 2022 09:52:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.174.203])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jun 2022 09:52:22 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH v2] target/ppc: cpu_init: Clean up stop state on cpu reset
Date: Fri, 17 Jun 2022 11:52:22 +0200
Message-Id: <20220617095222.612212-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gQk3IPohZHIIs4XAsdwHqBt3fyYUQ4Us
X-Proofpoint-GUID: xwNHj4LA_S_ne8P6Xt27kRFZMKPUUSFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-17_08,2022-06-16_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206170042
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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

The 'resume_as_sreset' attribute of a cpu is set when a thread is
entering a stop state on ppc books. It causes the thread to be
re-routed to vector 0x100 when woken up by an exception. So it must be
cleared on reset or a thread might be re-routed unexpectedly after a
reset, when it was not in a stop state and/or when the appropriate
exception handler isn't set up yet.

Using skiboot, it can be tested by resetting the system when it is
quiet and most threads are idle and in stop state.

After the reset occurs, skiboot elects a primary thread and all the
others wait in secondary_wait. The primary thread does all the system
initialization from main_cpu_entry() and at some point, the
decrementer interrupt starts ticking. The exception vector for the
decrementer interrupt is in place, so that shouldn't be a
problem. However, if that primary thread was in stop state prior to
the reset, and because the resume_as_sreset parameters is still set,
it is re-routed to exception vector 0x100. Which, at that time, is
still defined as the entry point for BML. So that primary thread
restarts as new and ends up being treated like any other secondary
thread. All threads are now waiting in secondary_wait.

It results in a full system hang with no message on the console, as
the uart hasn't been init'ed yet. It's actually not obvious to realise
what's happening if not tracing reset (-d cpu_reset). The fix is
simply to clear the 'resume_as_sreset' attribute on reset.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
Changelog:
v2: rework commit message


 target/ppc/cpu_init.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 0f891afa04..c16cb8dbe7 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7186,6 +7186,9 @@ static void ppc_cpu_reset(DeviceState *dev)
         }
         pmu_update_summaries(env);
     }
+
+    /* clean any pending stop state */
+    env->resume_as_sreset = 0;
 #endif
     hreg_compute_hflags(env);
     env->reserve_addr = (target_ulong)-1ULL;
-- 
2.35.3


