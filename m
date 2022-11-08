Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4A7620F8D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 12:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osN9E-0006Je-8S; Tue, 08 Nov 2022 06:52:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1osN98-0006Br-6e
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:52:02 -0500
Received: from mr85p00im-ztdg06011101.me.com ([17.58.23.185])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1osN93-00018x-IK
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 06:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667908316; bh=JCTM5SiYYPq6yh9nFLgxzl9PF+cu3+MmyRLsirAgEFU=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=hQ2GWwqikwy7MCG7buzz2EV5kh0RfF9ZpeasmLqs+pRRk6B5G0GzuonNbZVF9AR8W
 R8CbQuU6Ijm9o2Emjn0UWnp68JamuCNojY2HQayk5fTxEf425l1BNIB7r7YgdxfDy3
 p0TF5h12aOCpSpb4jD8ovU4ElwXPQHdSBW1eDQUJM1plq8/anOjRjnLAxPtnNI0Zgc
 6+m/XzOkFlXEjzLiHY+NWuyOleAgZPbpJ/BNRNZrZ8zoJGaiiMYnMH/1FH7oTvs1vZ
 VuzICSKk1YdM6bbKSwqiHcg2ZtDZtcb8xaBKKCuNzjKQFramFNZ+7eTsraVZzIbXJl
 gBPMrHfVUl2oA==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011101.me.com (Postfix) with ESMTPSA id 69D77DA08D8;
 Tue,  8 Nov 2022 11:51:52 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
Date: Tue, 8 Nov 2022 12:51:39 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <D86C8F4E-517E-4ECC-A66D-E57F551FFECF@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
 <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
 <CAF8_6KmwMCiNcC-romHoGZhcpPph71b3qv7yn9RHQArV3Q+nDA@mail.gmail.com>
To: Francesco Cagnin <francesco.cagnin@gmail.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: W2waGQyuLClpt6apUlHKVOTXTiDdQh4I
X-Proofpoint-ORIG-GUID: W2waGQyuLClpt6apUlHKVOTXTiDdQh4I
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2020-02-14=5F02,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 clxscore=1030
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211080067
Received-SPF: pass client-ip=17.58.23.185; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011101.me.com
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


> On 8 Nov 2022, at 11.09, Francesco Cagnin <francesco.cagnin@gmail.com> =
wrote:
>=20
> Mads, thanks for the review and feedbacks. I worked on this a few =
months
> ago but only managed to have it published now, I'm sorry for work =
being
> done twice.
>=20
> I'll add support for SSTEP_NOIRQ as you suggested.
>=20
> For multi-core systems there's no particular issue, just I'm not
> familiar with all of these topics and I'm asking for good practices. =
KVM
> saves breakpoints information in struct 'KVMState', and following the
> same approach I've updated struct 'HVFState' to store equivalent data.
> To keep separate information for each cpu, KVM uses field 'kvm_state' =
in
> struct 'CPUState' (see 'include/hw/core/cpu.h'), but at the moment
> there's no analogous field for the HVF state (which is instead defined
> as a single global variable in 'accel/hvf/hvf-accel-ops.c'). Should we
> add a new field to 'CPUState' for the HVF state, or take a different
> approach?
>=20
> For your last question regarding =
`hv_vcpu_set_trap_debug_exceptions()`,
> I think it's possible to move it to `hvf_arch_update_guest_debug()` =
but
> I'm not confident about `hvf_arch_init_vcpu()`, I will experiment =
again.

You're welcome. And that's ok. It's just unlucky timing.

In my version, I added the sw breakpoints to `hvf_vcpu_state` so they =
would
follow each CPU, but it's effectively a copy of the global set of =
breakpoints.=20
I'm no expert on QEMU, as this would have been my first contribution, =
but AFAIK,
KVM will also add the breakpoints to all CPUs as we can't know which CPU =
will
take a certain process.

Moving it to `hvf_arch_update_guest_debug` would probably be best. =
Having it in
`hvf_arch_init_vcpu` would mean that it's always enabled. In some =
corner-cases,
that might have an adverse effect.

I also noticed you are adding 1 to the WRPs and BRPs. As I interpret the
documentation, you should subtract 1 instead, given the value 0 is =
reserved:

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index dbc3605f6d..80a583cbd1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -39,11 +39,11 @@ static void hvf_arm_init_debug(CPUState *cpu)
 {
     ARMCPU *arm_cpu =3D ARM_CPU(cpu);

-    max_hw_bps =3D 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
+    max_hw_bps =3D extract64(arm_cpu->isar.id_aa64dfr0, 12, 4) - 1;
     hw_breakpoints =3D
         g_array_sized_new(true, true, sizeof(HWBreakpoint), =
max_hw_bps);

-    max_hw_wps =3D 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
+    max_hw_wps =3D extract64(arm_cpu->isar.id_aa64dfr0, 20, 4) - 1;
     hw_watchpoints =3D
         g_array_sized_new(true, true, sizeof(HWWatchpoint), =
max_hw_wps);
     return;

But the documentation is a bit ambiguous on that. Maybe we can test it?=

