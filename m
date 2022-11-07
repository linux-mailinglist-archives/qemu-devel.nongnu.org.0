Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B912A61F380
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 13:40:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1PK-00080p-FI; Mon, 07 Nov 2022 07:39:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1P9-0007xi-Ck
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:39:07 -0500
Received: from mr85p00im-zteg06011601.me.com ([17.58.23.186])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os1Ov-0002Z0-SH
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 07:39:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667824730; bh=xYh8VzjfiN6w/lPsiKQagcSGwxoIDhYYnJZ7YGg6gAA=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=QWzOsbmYpmV6MmjmjBHnkKYl2mmA59apldhBxz3wkfMrlN5wmMa/jj2t5u9Je9RuR
 mY5p7IEnNZ3ZT4HpkY5Wax6RjPDmqAjT8rIBYE6fL0+4kLQ7auJZRI2NUREc90VsaD
 WYTmgmzMxHmEj8BR+kxrhor2IMXExpLeUTDik7bPueG4vz8hqh3+vZAAV36vr6EKNv
 seG8iKvF2x9DdN2ZYwv6sx4Cr89T7ZOBHgnTqx5+aTrpYM6RmAwbka0x7SdTY0n+U4
 zGItmfWLfy0TPHiEUn3DAWzzcJmlVvFd0JbbkLTydU0HZAqAYoEqC2zBKtIqwn8sz5
 dyqE7V1u6rZ/w==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-zteg06011601.me.com (Postfix) with ESMTPSA id 35210180D32;
 Mon,  7 Nov 2022 12:38:47 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-3-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 13:38:35 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, agraf@csgraf.de,
 pbonzini@redhat.com, Francesco Cagnin <fcagnin@quarkslab.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <10B025A2-C011-43BF-99CC-3FA3190E88B3@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-ORIG-GUID: r6kUhd8zU0e9K1FNAlBiKyG-HVKbf4kq
X-Proofpoint-GUID: r6kUhd8zU0e9K1FNAlBiKyG-HVKbf4kq
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0 mlxlogscore=686
 clxscore=1030 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070102
Received-SPF: pass client-ip=17.58.23.186; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-zteg06011601.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


> On 4 Nov 2022, at 19.41, francesco.cagnin@gmail.com wrote:
>=20
> From: Francesco Cagnin <fcagnin@quarkslab.com>
>=20
> Support is added for single-stepping, software breakpoints, hardware
> breakpoints and watchpoints. The code has been structured like the KVM
> counterpart (and many parts are basically identical).
>=20
> Guests can be debugged through the gdbstub.
>=20
> Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
> ---
> accel/hvf/hvf-accel-ops.c | 124 ++++++++++++++++++++++++
> accel/hvf/hvf-all.c       |  24 +++++
> cpu.c                     |   3 +
> include/sysemu/hvf.h      |  29 ++++++
> include/sysemu/hvf_int.h  |   1 +
> target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
> 6 files changed, 374 insertions(+), 1 deletion(-)


I've been working on the exact same features just last week, and had it =
working=20
just hours before you posted, but you beat me to it. I can see we have =
solved it
almost exactly the same way, so I won't post my patchset.

I can see you are missing support for SSTEP_NOIRQ. I've handled it like =
this:

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 5ff5778d55..8b96d2f320 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -343,7 +343,7 @@ static int hvf_accel_init(MachineState *ms)

 static int hvf_gdbstub_sstep_flags(void)
 {
-    return SSTEP_ENABLE;
+    return SSTEP_ENABLE | SSTEP_NOIRQ;
 }

 static void hvf_accel_class_init(ObjectClass *oc, void *data)
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index dbc3605f6d..964a4ecf8a 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1331,7 +1331,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     hv_return_t r;
     bool advance_pc =3D false;

-    if (hvf_inject_interrupts(cpu)) {
+    if (!(cpu->singlestep_enabled & SSTEP_NOIRQ) && =
hvf_inject_interrupts(cpu)) {
         return EXCP_INTERRUPT;
     }

You'll have to suppress the interrupts while you're single-stepping the =
code.=20
Otherwise, you'll only be stepping a few times, and suddenly get taken =
to the
interrupt-handler.

What issues do you have with multi-core systems?


