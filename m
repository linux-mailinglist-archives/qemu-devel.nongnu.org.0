Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AE1651F30
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 11:47:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7a8c-0003Vy-OF; Tue, 20 Dec 2022 05:46:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1p7a8a-0003Vb-Gy
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 05:46:20 -0500
Received: from mr85p00im-hyfv06021401.me.com ([17.58.23.190])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1p7a8Y-00080p-Um
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 05:46:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1671533171; bh=+/eU1TAjx4WUSjXZ6JhSVqCcFUfV+vuJWIVq0JcPOrk=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=V6e+hvGRi/qMbxwUXXOCjaAAeljCF0VJ2je1F54nG+aDC/NX8a7QYt3WCXmbtQoY4
 znaJtDUPcR8eAP1QF5+X6gGECA+s026lu1x9yxfQ1CD118LJROJvPwQBE1QwsQekjJ
 tVVab+DaDES8o12jHy6Rul4aJCdU25DfH2y1ufV1rsNBXkpwDQZ12ImItWB7ofYYOp
 aKn5LNH+XEh0DJxCzHvySOhgsbDMy7oolDNs8Q+BhYsRk75+RoqEL6BARkhkDhzIbt
 l27v5EtEvTSVGhLi60ZkRe2oBsAc3gF38w0vXguDWF4asJpMyNMElpV8o66Cc7j6yD
 KOVJZgBKKDNrA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-hyfv06021401.me.com (Postfix) with ESMTPSA id EF840303FAC4;
 Tue, 20 Dec 2022 10:46:08 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH] gdbstub: move update guest debug to accel ops
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <87h6xyjcdh.fsf@linaro.org>
Date: Tue, 20 Dec 2022 11:45:56 +0100
Cc: =?utf-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4B19094C-63DC-4A81-A008-886504256D5D@ynddal.dk>
References: <20221123121712.72817-1-mads@ynddal.dk>
 <af92080f-e708-f593-7ff5-81b7b264d587@linaro.org>
 <C8BC6E24-F98D-428D-80F8-98BDA40C7B15@ynddal.dk> <87h6xyjcdh.fsf@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: JCBdP1BveQSPN6rlqSgMr_A8JbhoN_u6
X-Proofpoint-ORIG-GUID: JCBdP1BveQSPN6rlqSgMr_A8JbhoN_u6
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 clxscore=1030 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2212200090
Received-SPF: pass client-ip=17.58.23.190; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-hyfv06021401.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


> It will do. You could just call it update_guest_debug as it is an
> internal static function although I guess that makes grepping a bit of =
a
> pain.

I agree. It should preferably be something unique, to ease grep'ing.

> Is something being accidentally linked with linux-user and softmmu?

Good question. I'm not familiar enough with the code base to know.

I experimented with enabling/disabling linux-user when configuring, and =
it does
affect whether it compiles or not.

The following seems to fix it, and I can see the same approach is taken =
other
places in cpu.c. Would this be an acceptable solution?

diff --git a/cpu.c b/cpu.c
index 6effa5acc9..c9e8700691 100644
--- a/cpu.c
+++ b/cpu.c
@@ -386,6 +386,7 @@ void cpu_breakpoint_remove_all(CPUState *cpu, int =
mask)
 void cpu_single_step(CPUState *cpu, int enabled)
 {
     if (cpu->singlestep_enabled !=3D enabled) {
+#if !defined(CONFIG_USER_ONLY)
         const AccelOpsClass *ops =3D cpus_get_accel();

         cpu->singlestep_enabled =3D enabled;
@@ -393,6 +394,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
         if (ops->update_guest_debug) {
             ops->update_guest_debug(cpu, 0);
         }
+#endif

         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }

=E2=80=94
Mads Ynddal


