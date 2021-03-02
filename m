Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7F32ABF6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 21:59:39 +0100 (CET)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHC7G-0005To-QF
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 15:59:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwg-0001VZ-1Z
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:42 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38132
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1lHBwd-00086a-Ir
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 15:48:41 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 122Khn6r054943; Tue, 2 Mar 2021 15:48:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=pU1YpA++e+Hrf7KQ5FtJYr10Pdn5ncGR8lkqHgrc2is=;
 b=Hn7M+aJjlFh0M1qMcDdm6Fh9KR/vvVfXU7HPzid9amrhjkprliQsxd6o/cYzSW57TN12
 OeSbsLGS7X3y4MFIUppZoUMJr8B5vr7oc2BYGDGngpy0lO1W5I4N5/4SGtbdGYEdfdEX
 TNgVO+S3JAVDQrNcsV6LB1IsNS+dD/hQLyGUvbgffTx8N0S1wByyGE7yDD0v7loPs37+
 +DjyugYkdTSEPfSa/EdMy9LuOM+WNb8T0jrmMNA4ZXZb+w8OQo8NXssOz+Beba0IISXK
 w3VpM6p5AELfE6cabB49vYDYnwLcSrTOQbzQhGG9sVYN1JPL1pxAXnaGifEZ2ZucvMHo ng== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vn9g6r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:37 -0500
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 122KiKp4064759;
 Tue, 2 Mar 2021 15:48:36 -0500
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 371vn9g6qe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 15:48:36 -0500
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 122Km5WF009944;
 Tue, 2 Mar 2021 20:48:35 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04wdc.us.ibm.com with ESMTP id 3712phhu8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Mar 2021 20:48:35 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 122KmYBm10617264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Mar 2021 20:48:34 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 867FA2805C;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5984A28059;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
Received: from amdrome1.watson.ibm.com (unknown [9.2.130.16])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Mar 2021 20:48:34 +0000 (GMT)
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 23/26] target/i386: Re-sync kvm-clock after confidential
 guest migration
Date: Tue,  2 Mar 2021 15:48:19 -0500
Message-Id: <20210302204822.81901-24-dovmurik@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
References: <20210302204822.81901-1-dovmurik@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-02_08:2021-03-01,
 2021-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103020156
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 James Bottomley <jejb@linux.ibm.com>, Jon Grimm <jon.grimm@amd.com>,
 Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If confidential guest support is active, set TSC to 0 on the target when
loading the CPU state.  This causes the guest OS to re-sync with
kvm-clock.

Without this change, the guest clocks after migration are stuck (don't
advance), except the *_COARSE clocks which advance normally.

Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
---
 target/i386/machine.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/i386/machine.c b/target/i386/machine.c
index 3768a753af..36c52ec02e 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -297,8 +297,17 @@ static int cpu_post_load(void *opaque, int version_id)
     X86CPU *cpu = opaque;
     CPUState *cs = CPU(cpu);
     CPUX86State *env = &cpu->env;
+    MachineState *ms = MACHINE(qdev_get_machine());
     int i;
 
+    /*
+     * When loading the state of a confidential guest, set TSC to zero at allow
+     * the guest OS to re-sync with kvmclock.
+     */
+    if (ms->cgs) {
+        env->tsc = 0;
+    }
+
     if (env->tsc_khz && env->user_tsc_khz &&
         env->tsc_khz != env->user_tsc_khz) {
         error_report("Mismatch between user-specified TSC frequency and "
-- 
2.20.1


