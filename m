Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415256F01C5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 09:29:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prw4N-0002pz-41; Thu, 27 Apr 2023 03:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1prw4J-0002lp-LP
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:29:31 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jiles@quicinc.com>)
 id 1prw4H-0007wA-DK
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 03:29:30 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33R6pgtS015273; Thu, 27 Apr 2023 07:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=qcppdkim1;
 bh=gkiUuqtE4VQVOs4AyHl1EMP5rVnz3ZqwB+ESMzSuIAk=;
 b=K5RUZ6VMfDBL2qakWmzqUyj+LhZf6WFJ33YJnRBSPqhF8DhZL/sAPzKMWjyidg5RDygA
 nvhejTh+w3ugPpSRGHOVt+PnQdKZhQQvjYoq96J2mjwKgV4fLX5xGKRxZq5ApgAGA4Sf
 eIHJ5+Uviogpqlhbuj5mhFJuIzHPP/QNJxPImpHgWCQnRzmoPAJNInCEOD5Z/rZOkDSy
 Ev1kZt2s6mjYwUGR3TY4hXT5NA5x3UsLkn4cj2OLHj9CIswgvXsiSAdk6+FMTah5vW7s
 xisLMmHeOk8XfpWnKJwH/KNc56oxA8C85DFOOeqpGNYeOcYb/fzUkynR+wHrzT6gPIuW gQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7j4v8910-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 07:29:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33R7T7QW019496
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Apr 2023 07:29:07 GMT
Received: from localhost (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 27 Apr
 2023 00:29:06 -0700
From: Jamie Iles <quic_jiles@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <richard.henderson@linaro.org>, <pbonzini@redhat.com>, <philmd@linaro.org>,
 <peter.maydell@linaro.org>
Subject: [PATCH v3 0/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
Date: Thu, 27 Apr 2023 03:09:23 +0100
Message-ID: <20230427020925.51003-1-quic_jiles@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: mucc57YU1cowJRm5nZZnZYjDI05wTqWO
X-Proofpoint-GUID: mucc57YU1cowJRm5nZZnZYjDI05wTqWO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_05,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=730 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270064
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_jiles@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

From: Jamie Iles <jiles@qti.qualcomm.com>

The round-robin scheduler will iterate over the CPU list with an
assigned budget until the next timer expiry and may exit early because
of a TB exit.  This is fine under normal operation but with icount
enabled and SMP it is possible for a CPU to be starved of run time and
the system live-locks.

For example, booting a riscv64 platform with '-icount
shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
has timers enabled and starts performing TLB shootdowns.  In this case
we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
1.  As we enter the TCG loop, we assign the icount budget to next timer
interrupt to CPU 0 and begin executing where the guest is sat in a busy
loop exhausting all of the budget before we try to execute CPU 1 which
is the target of the IPI but CPU 1 is left with no budget with which to
execute and the process repeats.

We try here to add some fairness by splitting the budget across all of
the CPUs on the thread fairly before entering each one.  The CPU count
is cached on CPU list generation ID to avoid iterating the list on each
loop iteration.  With this change it is possible to boot an SMP rv64
guest with icount enabled and no hangs.

New in v3 (address feedback from Richard Henderson):
 - Additional patch to use QEMU_LOCK_GUARD with qemu_cpu_list_lock where 
   appropriate
 - Move rr_cpu_count() call to be conditional on icount_enabled()
 - Initialize cpu_budget to 0

Jamie Iles (2):
  cpu: expose qemu_cpu_list_lock for lock-guard use
  accel/tcg/tcg-accel-ops-rr: ensure fairness with icount

 accel/tcg/tcg-accel-ops-icount.c | 17 +++++++++++++--
 accel/tcg/tcg-accel-ops-icount.h |  3 ++-
 accel/tcg/tcg-accel-ops-rr.c     | 37 +++++++++++++++++++++++++++++++-
 cpus-common.c                    |  2 +-
 include/exec/cpu-common.h        |  1 +
 linux-user/elfload.c             | 12 +++++------
 migration/dirtyrate.c            | 26 +++++++++++-----------
 trace/control-target.c           |  9 ++++----
 8 files changed, 78 insertions(+), 29 deletions(-)

-- 
2.25.1


