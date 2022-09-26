Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B75EA6E1
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 15:12:54 +0200 (CEST)
Received: from localhost ([::1]:60388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocnun-0007yX-11
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 09:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ocln3-0002iZ-Bz
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:56:45 -0400
Received: from pv50p00im-ztdg10021801.me.com ([17.58.6.56]:45950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ocln1-0004fD-0Z
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 06:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1664189797; bh=17k/b9gqNcIBWr3feuuHpvs4c3ERPyupeebOSl9sZfs=;
 h=Content-Type:Mime-Version:Subject:From:Date:Message-Id:To;
 b=L//+SPWv+tSAj8ABhN67SpzXi4V8LwKhIRyIchKyA1Pst4/5NKy+GR1dhRQwBhJBE
 a0kXzpN5k0/0quTMDbtoElvZju3NmmCQlJyPLwMn6shckQ057aY+pBDb3uD+y8R8rJ
 bIhzDGxv+UIQWGkG4VvpaRx33N5rgMMuR4XoJXW4NmDYFZ/acnzk3bs3i0+kV9D5HQ
 HnNfEYQc4gw5BuqdyZ39r0q3PiyVnXSyoQuCj8JsGevzH28+ZNl1nowuMQiGB+lzoc
 8K86GEcBVs5fccwsZX6unXaMLhpQuf7UIpYgfhUec2rwHKSBcQozZQesyguFErRfi7
 WM4nKTVXag1iA==
Received: from smtpclient.apple (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10021801.me.com (Postfix) with ESMTPSA id 647B41604EB;
 Mon, 26 Sep 2022 10:56:34 +0000 (UTC)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH  v1 3/9] hw/intc/gic: use MxTxAttrs to divine accessing CPU
From: mads@ynddal.dk
In-Reply-To: <20220922145832.1934429-4-alex.bennee@linaro.org>
Date: Mon, 26 Sep 2022 12:56:32 +0200
Cc: qemu-devel@nongnu.org, f4bug@amsat.org,
 Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM cores" <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <85155F4E-0FFF-4DE6-A336-3F9C5B561CDC@ynddal.dk>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-4-alex.bennee@linaro.org>
To: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-Proofpoint-GUID: r5XPi0IoRuEJOqQnVv5E0zl3ShYtLZ8x
X-Proofpoint-ORIG-GUID: r5XPi0IoRuEJOqQnVv5E0zl3ShYtLZ8x
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.517,18.0.883,17.11.64.514.0000000_definitions?=
 =?UTF-8?Q?=3D2022-06-21=5F08:2022-06-21=5F01,2022-06-21=5F08,2022-02-23?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 clxscore=1030 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2209260069
Received-SPF: pass client-ip=17.58.6.56; envelope-from=mads@ynddal.dk;
 helo=pv50p00im-ztdg10021801.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Sep 2022 09:08:27 -0400
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



> On 22 Sep 2022, at 16.58, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
>=20
> Now that MxTxAttrs encodes a CPU we should use that to figure it out.
> This solves edge cases like accessing via gdbstub or qtest.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
>=20
> ---
> v2
>  - update for new field
>  - bool asserts
> ---
> hw/intc/arm_gic.c | 39 ++++++++++++++++++++++-----------------
> 1 file changed, 22 insertions(+), 17 deletions(-)
>=20
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index 492b2421ab..b58d3c4a95 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -56,17 +56,22 @@ static const uint8_t gic_id_gicv2[] =3D {
>     0x04, 0x00, 0x00, 0x00, 0x90, 0xb4, 0x2b, 0x00, 0x0d, 0xf0, 0x05, =
0xb1
> };
>=20
> -static inline int gic_get_current_cpu(GICState *s)
> +static inline int gic_get_current_cpu(GICState *s, MemTxAttrs attrs)
> {
> -    if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> -    }
> -    return 0;
> +    /*
> +     * Something other than a CPU accessing the GIC would be a bug as
> +     * would a CPU index higher than the GICState expects to be
> +     * handling
> +     */
> +    g_assert(attrs.requester_is_cpu);
> +    g_assert(attrs.cpu_index < s->num_cpu);
> +
> +    return attrs.requester_id;
> }

The asserts here abort on macOS, with HVF accelerator:

ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion failed: =
(attrs.requester_is_cpu)
Bail out! ERROR:../hw/intc/arm_gic.c:66:gic_get_current_cpu: assertion =
failed: (attrs.requester_is_cpu)

If I revert the changes inside this function, it seemingly works again.=

