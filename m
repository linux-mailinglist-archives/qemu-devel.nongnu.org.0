Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CCC3CC7E0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 07:30:48 +0200 (CEST)
Received: from localhost ([::1]:41952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4zO3-0005yn-H4
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 01:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianrui-wei@outlook.com>)
 id 1m4zMR-0004vj-Ct; Sun, 18 Jul 2021 01:29:07 -0400
Received: from mail-me3aus01olkn2140.outbound.protection.outlook.com
 ([40.92.63.140]:20685 helo=AUS01-ME3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tianrui-wei@outlook.com>)
 id 1m4zMO-0001x0-5C; Sun, 18 Jul 2021 01:29:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go2pEAoYH+d0P9uuz3RbXouLwRN/anA7Bb3cNs7t6g8uSalLw801g5kDjjra/Wrz3R4sscWRINwky8sjCREziYd9eO6SKHFgomXjt62ALejvH7uBksOp/rKm0jpzqEdSDIaZ2d1zKBZnipvL9gPiXl9iu/0seKhWbrNulrztKyJPowLHD+nEqPRy734uelJr+7VTnkRL9EZoqCZAkVAp3AU/ACS7Sw6nif1yWvCnYQzz7aEeecwft91uc9nsiiXlO7kNxwahJfOXO3DkujPwbgjZmBfb2/E2OcFW1wesE+o5HawCS47EwOdy+MUktW+IM/AjO7IMsSZ/M1Rb0U/C4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qlf4Y0ObHa0xvePkXiOdWhZLxCv/EM9/4O+EabAwRgw=;
 b=W6SAw1bMqykQ1lbuhB4+RBZNg8Z9DWuv63z/XORmSiH2MS1eIs1dKaCUM8y8JsTvy63JJCtKiPLP15cybZLtJR2iNo8qtOPHDvAUBlUWsPLESBNAbWydhUGwBknYAULv76otLRF4Ek72NI9PtDWtGJU5RnxF83PpKKQVxnn4OveCUzh31QX893IdrxKhfb/h/ntDYEZo8rWuc3xvq8CewBHziXX9fyKiFhYG8DeuJZnuIgcfpm011es5Akhq5hRboPXGmk5SzlSt5Q0BF+fuZLviXfJq4tTJ86pP80NItK1dA6bFOpj6DPGDs/c93Jl/N1W+lofIhHJWYD+C+sTvTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qlf4Y0ObHa0xvePkXiOdWhZLxCv/EM9/4O+EabAwRgw=;
 b=pZ+yXkeRsM25wSYyWMCecKo+P/r5C6IqWdIsF9+YNxsSwAXCRwIJgvMAYO9acRSupiFDS/O1RhDeMRK5ne8AqlZFPTfGRsXaHEKZwisRcd71ZhN3qXjRk6OY4O+3RtrSuNZ3KtbXwh3fPxo7nNvnholL0tg5hnAupxPRRs6XBqK0q8L/GGLh6mJ1xCoAsKMm6zRIjLonFMO7NccaBO3WKLW7p+NjCzvwAflDup8okNDqa37ahJ7W1/ZnvsJ3T8sjJAogbKC0qXadn8ekjqYJkcNFS5/mzFJWsRs84mCeAQur8fcGCVnxl8tetH0+YWMTmAEhmJPQFRYHeBvVbTgzBQ==
Received: from SY4PR01MB6798.ausprd01.prod.outlook.com (2603:10c6:10:137::12)
 by SY4PR01MB5738.ausprd01.prod.outlook.com (2603:10c6:10:fa::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Sun, 18 Jul
 2021 05:28:56 +0000
Received: from SY4PR01MB6798.ausprd01.prod.outlook.com
 ([fe80::a44f:289d:7a25:339b]) by SY4PR01MB6798.ausprd01.prod.outlook.com
 ([fe80::a44f:289d:7a25:339b%4]) with mapi id 15.20.4331.031; Sun, 18 Jul 2021
 05:28:56 +0000
X-Gm-Message-State: AOAM533NZMZJP7mHvdj7uHzZGMI9cyA/DmkRmZCLj9OyaOimrEM6Uu40
 DinD9zShEyLm9hzSFXlv/4ElWJTBauKUu5Uo4YE=
X-Google-Smtp-Source: ABdhPJxvltyDDt6n2/siT0CxV8Rg9w7TOV6NHTp4gRbcaE2rHuqgrGf2TFt97n6S3ceJ9Ch7U1EfHp1Dt4BJ/bS7WVo=
X-Received: by 2002:a05:6e02:550:: with SMTP id
 i16mr12018048ils.207.1626585670148; 
 Sat, 17 Jul 2021 22:21:10 -0700 (PDT)
References: <SY4PR01MB6798FDE7B97E478254D6B955F6139@SY4PR01MB6798.ausprd01.prod.outlook.com>
 <CAFEAcA97bUkyHL+=LuToYgG-HWgppfbBc=BqO=BdboSWfF=Kcg@mail.gmail.com>
In-Reply-To: <CAFEAcA97bUkyHL+=LuToYgG-HWgppfbBc=BqO=BdboSWfF=Kcg@mail.gmail.com>
From: Tianrui Wei <tianrui-wei@outlook.com>
Date: Sun, 18 Jul 2021 13:20:34 +0800
X-Gmail-Original-Message-ID: <CAD5SOmeT-E8vrebsK5iN6j8bm=iFsOU7_m2Mc90mowsw6ktzZw@mail.gmail.com>
Message-ID: <SY4PR01MB679862ABE7F461977519D0D7F6E09@SY4PR01MB6798.ausprd01.prod.outlook.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Fix GICv3 redistributor security
 checking
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000010e5f005c75efd01"
X-TMN: [7iFJTsVoG57iQtpto5HNmqTdcZwPvyrx]
X-ClientProxiedBy: CH2PR07CA0062.namprd07.prod.outlook.com
 (2603:10b6:610:5b::36) To SY4PR01MB6798.ausprd01.prod.outlook.com
 (2603:10c6:10:137::12)
X-Microsoft-Original-Message-ID: <CAD5SOmeT-E8vrebsK5iN6j8bm=iFsOU7_m2Mc90mowsw6ktzZw@mail.gmail.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mail-io1-f45.google.com (209.85.166.45) by
 CH2PR07CA0062.namprd07.prod.outlook.com (2603:10b6:610:5b::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Sun, 18 Jul 2021 05:28:56 +0000
Received: by mail-io1-f45.google.com with SMTP id z17so9181006iog.12;
 Sat, 17 Jul 2021 22:28:56 -0700 (PDT)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 286d9f0e-8c3b-4e09-8c45-08d949acf036
X-MS-TrafficTypeDiagnostic: SY4PR01MB5738:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N9PgLO9QNAFuk6/YSYx2ZMRQM+/tohpTYA0LP1d76WAFWr1G5TA08nfw5I3xpFLX5iBqBgYX3UcyLBXyzZLT++26V2+6XVBB0kKFXndxZzkC3+CKkgxLpJm2JTi5t/RXZPdcHWC5ITt5qns7YGGltbokFJe9CoUbi3F1TeiN/kcePud0MCrKgR10YXQtJq8fdwGIQkAMc/BezJUY5DOqS4nS6oeViPtARWSBqSTVrNpMcvE4zXYgAQiIKSGUrL3KmX3zeNosSxk5McAUebxwia8+1Ugx6utTtAwIORBSHYU2juK5rSpibXUyffZOfQfyNG46TEPfTXFUqIZ4ak0GtIal0VE0ZTrOqlzStOqzDzSO0WVdk+AW32boI+e9EBEKimddOL47FC6DM8bEwKz4Ehe2Kum0CZXIw6BigVTBkveFwUjlAp360ef73xAwF93k
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AC7FgvjBTpu9uYO8upNZukxAsi9ZRuWMsbDBfhGRyx8XiqAmax2HN7+4SNCeR9EOoTSrDRdGFsMWQvgCUv/tFswgdVBrOdVGAVO/wSZD6hrjRGaTE+85NyKi0D1uLi0k4rz0ivOTEIu1l/kuvjgBYw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286d9f0e-8c3b-4e09-8c45-08d949acf036
X-MS-Exchange-CrossTenant-AuthSource: SY4PR01MB6798.ausprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2021 05:28:56.4926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4PR01MB5738
Received-SPF: pass client-ip=40.92.63.140;
 envelope-from=tianrui-wei@outlook.com;
 helo=AUS01-ME3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Sergey Fedorov <sergey.fedorov@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Shlomo Pongratz <shlomo.pongratz@huawei.com>,
 Jonathan Balkind <jbalkind@ucsb.edu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Shannon Zhao <shannon.zhao@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000010e5f005c75efd01
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peter,

Many thanks for your detailed explanation. Upon further reflection, it
seems that I have misinterpreted some of the explanations in
the manual. Sorry for the confusion, the original implementation is
correct.

Thanks,
Tianrui

On Fri, Jul 16, 2021 at 4:32 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 14 Jul 2021 at 20:46, Tianrui Wei <tianrui-wei@outlook.com> wrote=
:
> >
> > For redistributor to send sgi, we must test NSACR bits in secure mode.
> > However, current implementation inverts the security check, wrongly
> > skipping this it when the CPU is in secure state, and only carrying out
> > the check when the CPU is not secure or security is not implemented.
> > This patch corrects this problem by correcting the inversion of CPU
> > secure state checking. It has been tested to work with Linux version 5.=
11
> > in both aarch64 and arm version of qemu.
> >
> > According to =E2=80=9CArm Generic Interrupt Controller Architecture
> > Specification GIC architecture version 3 and version 4,=E2=80=9D p. 930=
, 2008.
> > Chapter 12, page 530, when there is only one security state implemented=
,
> > GICD.CTLR.DS is always 0, thus checking NSACR in non-secure state. When
> > cpu is in secure state, ns =3D 0, thus the NSACR check is never perform=
ed.
> >
> > Signed-off-by: Tianrui Wei <tianrui-wei@outlook.com>
> > Signed-off-by: Jonathan Balkind <jbalkind@ucsb.edu>
> > Tested-by: Tianrui Wei <tianrui-wei@outlook.com>
> > ---
> >  hw/intc/arm_gicv3_redist.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
> > index 53da703ed8..84cfcfd18f 100644
> > --- a/hw/intc/arm_gicv3_redist.c
> > +++ b/hw/intc/arm_gicv3_redist.c
> > @@ -564,7 +564,7 @@ void gicv3_redist_send_sgi(GICv3CPUState *cs, int
> grp, int irq, bool ns)
> >          return;
> >      }
> >
> > -    if (ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> > +    if (!ns && !(cs->gic->gicd_ctlr & GICD_CTLR_DS)) {
> >          /* If security is enabled we must test the NSACR bits */
> >          int nsaccess =3D gicr_ns_access(cs, irq);
>
> So, before this change:
>  * if the access to ICC_SGI[01]R_EL1 attempting to kick off this SGI
>    is done in Secure state, we allow it
>  * if the GIC has security disabled (GICD_CTLR.DS is 1), we allow it
>  * if the access is from NonSecure and the GIC does not have security
>    disabled, we check the NSACR bits to see if we should allow it
>
> With this change, we check the NSACR bits for accesses from Secure
> state, and we don't check them for accesses from NonSecure.
> This doesn't seem to me to match what the spec requires: in version
> IHI0069G of the GICv3 spec, section 12.1.10, the tables show that
> only accesses from NonSecure are subject to NSACR checks. (This makes
> intuitive sense: the GICR_NSACR is the NonSecure Access Control
> Register and it is controls NonSecure accesses, not Secure accesses.)
>
> What bug are you trying to fix with this patch ?
>
> thanks
> -- PMM
>

--00000000000010e5f005c75efd01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8"><d=
iv dir=3D"ltr">Hi Peter,<div><br></div><div>Many thanks for your detailed e=
xplanation. Upon further reflection, it</div><div>seems that I have misinte=
rpreted some of the explanations in</div><div>the manual. Sorry&nbsp;for th=
e confusion, the original implementation is</div><div>correct.</div><div><b=
r></div><div>Thanks,</div><div>Tianrui</div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 16, 2021 at 4:32 PM=
 Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydel=
l@linaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On Wed, 14 Jul 2021 at 20:46, Tianrui Wei &lt;<a href=3D"mailto=
:tianrui-wei@outlook.com" target=3D"_blank">tianrui-wei@outlook.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; For redistributor to send sgi, we must test NSACR bits in secure mode.=
<br>
&gt; However, current implementation inverts the security check, wrongly<br=
>
&gt; skipping this it when the CPU is in secure state, and only carrying ou=
t<br>
&gt; the check when the CPU is not secure or security is not implemented.<b=
r>
&gt; This patch corrects this problem by correcting the inversion of CPU<br=
>
&gt; secure state checking. It has been tested to work with Linux version 5=
.11<br>
&gt; in both aarch64 and arm version of qemu.<br>
&gt;<br>
&gt; According to =E2=80=9CArm Generic Interrupt Controller Architecture<br=
>
&gt; Specification GIC architecture version 3 and version 4,=E2=80=9D p. 93=
0, 2008.<br>
&gt; Chapter 12, page 530, when there is only one security state implemente=
d,<br>
&gt; GICD.CTLR.DS is always 0, thus checking NSACR in non-secure state. Whe=
n<br>
&gt; cpu is in secure state, ns =3D 0, thus the NSACR check is never perfor=
med.<br>
&gt;<br>
&gt; Signed-off-by: Tianrui Wei &lt;<a href=3D"mailto:tianrui-wei@outlook.c=
om" target=3D"_blank">tianrui-wei@outlook.com</a>&gt;<br>
&gt; Signed-off-by: Jonathan Balkind &lt;<a href=3D"mailto:jbalkind@ucsb.ed=
u" target=3D"_blank">jbalkind@ucsb.edu</a>&gt;<br>
&gt; Tested-by: Tianrui Wei &lt;<a href=3D"mailto:tianrui-wei@outlook.com" =
target=3D"_blank">tianrui-wei@outlook.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; hw/intc/arm_gicv3_redist.c | 2 +-<br>
&gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c<b=
r>
&gt; index 53da703ed8..84cfcfd18f 100644<br>
&gt; --- a/hw/intc/arm_gicv3_redist.c<br>
&gt; +++ b/hw/intc/arm_gicv3_redist.c<br>
&gt; @@ -564,7 +564,7 @@ void gicv3_redist_send_sgi(GICv3CPUState *cs, int =
grp, int irq, bool ns)<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br>
&gt;&nbsp; &nbsp; &nbsp; }<br>
&gt;<br>
&gt; -&nbsp; &nbsp; if (ns &amp;&amp; !(cs-&gt;gic-&gt;gicd_ctlr &amp; GICD=
_CTLR_DS)) {<br>
&gt; +&nbsp; &nbsp; if (!ns &amp;&amp; !(cs-&gt;gic-&gt;gicd_ctlr &amp; GIC=
D_CTLR_DS)) {<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* If security is enabled we must te=
st the NSACR bits */<br>
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; int nsaccess =3D gicr_ns_access(cs, =
irq);<br>
<br>
So, before this change:<br>
&nbsp;* if the access to ICC_SGI[01]R_EL1 attempting to kick off this SGI<b=
r>
&nbsp; &nbsp;is done in Secure state, we allow it<br>
&nbsp;* if the GIC has security disabled (GICD_CTLR.DS is 1), we allow it<b=
r>
&nbsp;* if the access is from NonSecure and the GIC does not have security<=
br>
&nbsp; &nbsp;disabled, we check the NSACR bits to see if we should allow it=
<br>
<br>
With this change, we check the NSACR bits for accesses from Secure<br>
state, and we don't check them for accesses from NonSecure.<br>
This doesn't seem to me to match what the spec requires: in version<br>
IHI0069G of the GICv3 spec, section 12.1.10, the tables show that<br>
only accesses from NonSecure are subject to NSACR checks. (This makes<br>
intuitive sense: the GICR_NSACR is the NonSecure Access Control<br>
Register and it is controls NonSecure accesses, not Secure accesses.)<br>
<br>
What bug are you trying to fix with this patch ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000010e5f005c75efd01--

