Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F4D61F45F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:30:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os2Bf-0000cK-2J; Mon, 07 Nov 2022 08:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os2BZ-0000av-Ai
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:29:10 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1os2BW-00077B-QX
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:29:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1667827744; bh=rPCCkICtGd7upsfHv1KYr6ShqHuTrPCWLNYdk6joyx4=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=fIuwI7Szr/gLe/aQV809Qgt6RBVnQRXuLOOYE/fDEHGa9rtB45DYxlDMQtAsQbO96
 /Ejsm9gTb2MhdwdiPe7xYAXVKZ4DPjSRpPE66W14STlgONZ7mN95N/kxBkd1zc0WHA
 hO2TyQg3ZEBvF6mbzOO50IDN3dIrjfgqlhxs47wZkeB4KQtglKo4z9uVPMV04a7ygL
 pkWTpo5ThiyGhsZB5hW1/JNQZVQTkJUKtE2B3tasVGnyJYiwVHqK71vZsD/j0A6/Ht
 ZHWcv9jCywi8HRcDbw+TtC7VsB1zu9KNAmWUa6CHsB+dl+3iZzlvxcLtp/Zs3qrGK8
 BuICEcaAHSqqw==
Received: from smtpclient.apple (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 703E8960B5C;
 Mon,  7 Nov 2022 13:29:01 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
From: Mads Ynddal <mads@ynddal.dk>
In-Reply-To: <20221104184101.6923-3-fcagnin@quarkslab.com>
Date: Mon, 7 Nov 2022 14:28:48 +0100
Cc: qemu-devel@nongnu.org, dirty@apple.com, r.bolshakov@yadro.com,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Francesco Cagnin <fcagnin@quarkslab.com>,
 =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2B918171-9464-40DC-AE11-D25E60858370@ynddal.dk>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
 <20221104184101.6923-3-fcagnin@quarkslab.com>
To: francesco.cagnin@gmail.com
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-Proofpoint-GUID: zm_MDPl4QMKgHiIh4cGBNFDP-AI3WOiM
X-Proofpoint-ORIG-GUID: zm_MDPl4QMKgHiIh4cGBNFDP-AI3WOiM
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.572,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2020-02-14=5F11:2020-02-14=5F02,2020-02-14=5F11,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0 mlxscore=0
 mlxlogscore=736 adultscore=0 phishscore=0 clxscore=1030 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2211070109
Received-SPF: pass client-ip=17.58.23.181; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
>=20
> diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
> index bb70082e45..3e99c80416 100644
> --- a/include/sysemu/hvf.h
> +++ b/include/sysemu/hvf.h
> @@ -1180,6 +1201,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>=20
>     flush_cpu_state(cpu);
>=20
> +    r =3D hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, =
trap_debug_exceptions);
> +    assert_hvf_ok(r);
> +
>     qemu_mutex_unlock_iothread();
>     assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));

We don't need to set this at every call to `hvf_vcpu_exec`. Would it =
make sense
to move it to `hvf_arch_update_guest_debug` or even =
`hvf_arch_init_vcpu`?

(CC'ed Alex Benn=C3=A9e as we discussed the GDB stub in HVF at KVM Forum =
2022)=

