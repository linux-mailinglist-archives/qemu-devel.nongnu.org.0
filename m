Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CF04FBCB6
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 15:03:00 +0200 (CEST)
Received: from localhost ([::1]:38684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndth5-0003Lc-HD
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 09:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ndtdW-0001Lx-Ld; Mon, 11 Apr 2022 08:59:18 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:11638
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ndtdT-0002qa-Kx; Mon, 11 Apr 2022 08:59:18 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23BBgYCV013209; 
 Mon, 11 Apr 2022 12:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=hOIGqo5gKVUMjTQDsIaEC0qMwRU0mZnojfCdvSQ5prU=;
 b=IXvCtGpO1nsBLN5tnYZMUJkk4//kxR/aQJ2UAQs9I/N8EE0quT7FfoNCoVnpiG+/x9Sw
 3Tgr4zn6KRAjg1FRXrqQh3YR5kT6tbgm0ajMRr/8xa6m075WyaAdUtGdLbftE468whKt
 OFCX23NEVyJolVnXRiB/E3CNQSPuJDI0EquZV+EeM5WagAhR9Wd/KYQjlhoP0WIICJIi
 reIQjClalYAvlhJ9RTJlD5U1MlzdLeLn9WDdl81+r6Lxgr440OFDlosD3AAnPLqBKFrP
 yX4KE+rZMdYrQHZ4yjhDPXy4jAtMtRjUjXinh+otDP1TjtUfZ77I7IVz5QzN2/M5CmSS XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fckpjsq5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:59:06 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 23BCMtfN007497;
 Mon, 11 Apr 2022 12:59:05 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fckpjsq54-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:59:05 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23BCrg6V008611;
 Mon, 11 Apr 2022 12:59:03 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3fb1dj35kn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 12:59:03 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23BCkYOI50462994
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Apr 2022 12:46:34 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14510A405B;
 Mon, 11 Apr 2022 12:59:01 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D44C0A4054;
 Mon, 11 Apr 2022 12:59:00 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.41.246])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 11 Apr 2022 12:59:00 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] target/ppc: Add two missing register callbacks on POWER10
Date: Mon, 11 Apr 2022 14:59:00 +0200
Message-Id: <20220411125900.352028-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LbEMcmFrfYArfJZkY4qWGUS06xrCRYru
X-Proofpoint-ORIG-GUID: BWxC4n1yEB-VRok5TNqKON_FPSvTq-MP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_04,2022-04-11_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110069
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This patch adds tcg accessors for 2 SPRs which were missing on P10:

- the TBU40 register is used to write the upper 40 bits of the
timebase register. It is used by kvm to update the timebase when
entering/exiting the guest on P9 and above. The missing definition was
causing erratic decrementer interrupts in a pseries/kvm guest running
in a powernv10/tcg host, typically resulting in hangs.

- the missing DPDES SPR was found through code inspection. It exists
unchanged on P10.

Both existed on previous versions of the processor and a bit of git
archaeology hints that they were added while the P10 model was already
being worked on so they may have simply fallen through the cracks.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 target/ppc/cpu_init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 073fd10168..2e9a3ded54 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6457,6 +6457,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power5p_common_sprs(env);
     register_power5p_lpar_sprs(env);
     register_power5p_ear_sprs(env);
+    register_power5p_tb_sprs(env);
     register_power6_common_sprs(env);
     register_power6_dbg_sprs(env);
     register_power8_tce_address_control_sprs(env);
@@ -6467,6 +6468,7 @@ static void init_proc_POWER10(CPUPPCState *env)
     register_power8_pmu_user_sprs(env);
     register_power8_tm_sprs(env);
     register_power8_pspb_sprs(env);
+    register_power8_dpdes_sprs(env);
     register_vtb_sprs(env);
     register_power8_ic_sprs(env);
     register_power8_book4_sprs(env);
-- 
2.35.1


