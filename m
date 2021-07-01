Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 634B03B8D65
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 07:26:51 +0200 (CEST)
Received: from localhost ([::1]:50056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lypDu-0000bp-05
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 01:26:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lypCs-0008Ko-Gl
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:25:46 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:39104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1lypCp-0000Ci-S1
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 01:25:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1625117140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=swkyF7Y/cvxAK0UlJBcypY0zvnKwYDiRLN+s/Q2NJOc=;
 b=F7sJ3txClKX9qApF/mmQovcs1rmOhx2/2XQi0YqHjrxT1mHAwkPNL3J/5hM7X3nO7i2Qm0
 woRPGC7dNKPTrEg021nNg8mo2sLfh1PHvA/SaLMN5RxFq7ISYhZz0p5pTRwpXwP6U09uHg
 IDiR1uoGyMQsmJXTBN5Z8a8e1LWzSww=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2057.outbound.protection.outlook.com [104.47.13.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-mH8MsYVRNnqfCLEEAPcRTg-2; Thu, 01 Jul 2021 07:25:38 +0200
X-MC-Unique: mH8MsYVRNnqfCLEEAPcRTg-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cMpjXvMPgKXkFhrA83enyOVbtZeBcVpPbdSVekc0TH5LPo9TfAwtiYd4axsZKC5RbodLVATHHoF8yBVwzMIi3gKi0Tw4KhSwCjwCaDhAIXgnEIVfRpTks78ffSH8HEGjyqtCBx7CtWagh/UDOUz/KncSB2V8+UjXzxWXbwE3Uos7lAfEMz2TOjbd5caDAy2wno3CMwrjNKuvhx+MWXDnoi6QfDpg+I3cFGdeKLKK+60jdTRbSCwGvhgd4jOyg9W5GTo1wXu579DkQ7g7oV9NARZPlDYzgeabwePuGYivEdEdeyWmfoLG8GI3Wdj1WYki4KeH6Nl6s9ZiDQQuNYczmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=swkyF7Y/cvxAK0UlJBcypY0zvnKwYDiRLN+s/Q2NJOc=;
 b=SkssmlKJAlHyPhf2MA+rCkTzjlob/UZqgh3osYCvba1jOdu29oCb0DFY/qrLoLIqcg4PzitAVoxoYg/kqj5LMIk2Uzrl2WCe6n/iENWA+IZh9XttHPnNa8ZiPe/awy0Q3nuqLUTPa46ZxkAzj47bqjQwELg4wDSqiPQqlH5OZXBqz9h+xK4nu7sx83rBpvugMRTB9po5qyepZxwNX7VoLQmLCIKPQChN8cPo899+p6ddKDfIgUgzLBWYVY2ItN7j/jdrSTO3uEUYAmRH5vO231uOjko6RxOjXgvZPdyCx/iJBdGOi8CGL84teR0ZRCyLa3BVRnRgxKv1laft2/nR3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB5104.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.22; Thu, 1 Jul
 2021 05:25:37 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::4c1c:b538:59b8:30f%5]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 05:25:37 +0000
From: Al Cho <ACho@suse.com>
To: Cornelia Huck <cohuck@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>, "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>
CC: Claudio Fontana <Claudio.Fontana@suse.com>,
 =?iso-8859-1?Q?Jos=E9_Ricardo_Ziviani?= <jose.ziviani@suse.com>
Subject: Re: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Thread-Topic: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to
 kvm_s390_get_hpage_1m
Thread-Index: AQHXbPHukD1kV6kBSkKcDtz04DfpmassrWAAgADp5w4=
Date: Thu, 1 Jul 2021 05:25:37 +0000
Message-ID: <VI1PR0402MB37443E719A108F3BCAC76172A0009@VI1PR0402MB3744.eurprd04.prod.outlook.com>
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-11-acho@suse.com>,<87fswzl6nr.fsf@redhat.com>
In-Reply-To: <87fswzl6nr.fsf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
x-originating-ip: [1.169.23.205]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f6d39bbd-cfb6-4475-7caf-08d93c50a8a1
x-ms-traffictypediagnostic: VI1PR04MB5104:
x-ld-processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB5104366F5A9CD7861578E701A0009@VI1PR04MB5104.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pytIQX4Sqn98l6HA43wFwglgumpxo4lXd6p3IYncLIkgBj5LKOUTPNgbCB/Fd5UFHpedbk+h35PvkU/kZRBokgLMdJx593dWAvWq5+1WWBB6IgtD40dp+DH8xb+/+TeoSvXt1se9QdhIJKA5ziwQXdMw0Gy6ZLzvntLCg2nhzeQEry0fvNC760nQ/0W54wo0MpAeeDHXHWwoVxNp+UUGuz5Hajl9OxFbV52OgsgeKwhRU/CMooBmC/fizRg5yTA10PVm0uAKgrZykoGpOgz2RdZOkzepCMak87Ker+d/FbbgdTY7KqITOxCr0PUJwNWCyobcby4At0TbibBhRSYxfi462oSMFXxWpn56z/fb7jUsyoJjjEs+uHgGktXDE2/JtSSRK6lOChxf2BaoOMiNxrSvqyD65os0giwtDvhhB6SWf9ab6Ydj6K6EPAgYsRhSw9Uf8md27GopdLx8uvx/VHHAX4Y6w/lR69hHfZ1s/WZYi+rpHwn1BuJaMIVCd2J8sAN5ItyMAVgCXEW9KTJv18zwti9+bbILm6ArqH0cUJY7CnqjJcLPEepTcyjfV4k1nsfXmgcIvJuy/hVzncVpJyPEAP3oqCkhJiD54VnZ0ThNfQ3bgBvrynARHCH/9uLAQxNPHRjIrDYCNZfPRHLecA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(376002)(346002)(136003)(366004)(396003)(64756008)(110136005)(66476007)(26005)(5660300002)(478600001)(7696005)(8676002)(8936002)(9686003)(38100700002)(186003)(66556008)(66446008)(55016002)(33656002)(54906003)(91956017)(316002)(52536014)(2906002)(53546011)(83380400001)(6506007)(4326008)(107886003)(76116006)(86362001)(122000001)(66946007)(19627405001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?xsdu5lZHv9VQoD9I3MLrgLsp8eukHpZxBIwtn/LB1/kT4PNl5uLUpJmdWF?=
 =?iso-8859-1?Q?p+R7Ibqq/i0XlVrRhnvJkSVkmSIAft+m8rw5crA9IBz+9/FpTOap7sCPL4?=
 =?iso-8859-1?Q?ttom0YyEFFIkKlR37aAvy1E5mJK36Cxm9Ky17o10sj9kY0dObEAONm8PY6?=
 =?iso-8859-1?Q?VailEYbtOCW88+/PR4WvUOp9NOtunZjpv4jX+yP/jLRnwEKl74ewj1L63T?=
 =?iso-8859-1?Q?RAhQXmVu3c363KJPsELS/fWa/PgXTLC0UZ8GlqB321ANze5O2XYYtzcoFj?=
 =?iso-8859-1?Q?h4hclboMmlmS73wr4+yxev3rqR5DHRk9mhGy0RwEtwRPMlgy/r8CbN2Dcu?=
 =?iso-8859-1?Q?wMFRC4RimAo5k+SrQT6OeU1KQ5v9oyvMxTVbrf99OsJ9WFyz67MrhFEqB6?=
 =?iso-8859-1?Q?pCvPKpMwBnIVRUZOFvQ3exnOzBfJL6OuGqto+yTUVH9qWpQDJXPXwfs2kL?=
 =?iso-8859-1?Q?i2Tezr8UEQ/SgfXuo6F00oRZ48VXgLzyxcFHyCJOavkc/7T8tbjgLVuY56?=
 =?iso-8859-1?Q?GggbkGr/9L23FNI9juRBoiSgo8tR61nCl8w0xaxpm8yt1sq5XAgVB/uIZ9?=
 =?iso-8859-1?Q?JFCvs2Y6bMHtU9/1z+SKSwZmpasmymrnqw8orwwUqJRQv7lC++P7qTO8T/?=
 =?iso-8859-1?Q?rCFGVV+o+wqa1AF3mixYWFdD25YHUuqsFRv/q8c8UZFZ3Hxh4YxiO32qPz?=
 =?iso-8859-1?Q?WmfSL1an2bouJwtnd8N1bK6wGMJErWNcLZvkHBMm+qOq56HQuopnFo3K2O?=
 =?iso-8859-1?Q?CEeqUd0EbN90GDCyf3csVeCIhYl8cIwuXUE0DyZGSNla7ibHs/HZYS3448?=
 =?iso-8859-1?Q?Sz8TYa9pt7PukUlsTl82Ljz566lIsJZd54J4zBznKLhDggN9cJ1+Y5ySPG?=
 =?iso-8859-1?Q?Ul7ME/6+SjVqduZymA7NNEJX/ib3mFfoe+GfAQrg8/keXLFFUDiIq/Z0H+?=
 =?iso-8859-1?Q?uk+qrmMa64sFZQg4eMM38pul3Tl18NA5o6d8V6tKMexJrGMfXFuJ9GWqRW?=
 =?iso-8859-1?Q?BiRxuWt+ZG4rs6Q6pHkx2pgc7Zm/EKPGs+W0DXlGxcYYGx3UPfMp7ENPJt?=
 =?iso-8859-1?Q?VAVV45NKXoOIRydGJcgnU7UPq43rKbcxW1a7+Tmb/6EIK+rbeeo4eeprLU?=
 =?iso-8859-1?Q?GFblmxcvsU77HDvhb2BqHAqWS7dklGosHXC+POQRD156Jiaqjk/YOS+HmI?=
 =?iso-8859-1?Q?2jkmCvj4nzDu5rh2wg0xvv+OlxMacZAeXZcvBq7+ue6gOQ/s1/etPXg8iY?=
 =?iso-8859-1?Q?DAJ8i3AdweFKpuqr+6sC4lykJfv/JaCmTlUNbRS2qoFZdRMjgVhdsyYCB6?=
 =?iso-8859-1?Q?ojKlNgF7/eAccHi019LVdK2/bRtDXC6uk1TT29RNLUB4RIU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0402MB37443E719A108F3BCAC76172A0009VI1PR0402MB3744_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6d39bbd-cfb6-4475-7caf-08d93c50a8a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 05:25:37.2782 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ONeyPU83kqe9xqQHfcJL+6oHlUyh6OO+L/6g+Hg73aTtctUNeHRtTztMikvfJLxq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5104
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0402MB37443E719A108F3BCAC76172A0009VI1PR0402MB3744_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Cornelia,

Sorry for missing the reply.
I think it may not be worth it, as you said it seem to be the only call sit=
e for kvm_s390_get_hpage_1m().
So I think we could keep it.

Thanks,
            AL
________________________________
From: Cornelia Huck <cohuck@redhat.com>
Sent: Wednesday, June 30, 2021 11:21 PM
To: Al Cho <ACho@suse.com>; qemu-devel@nongnu.org <qemu-devel@nongnu.org>; =
qemu-s390x@nongnu.org <qemu-s390x@nongnu.org>
Cc: Claudio Fontana <Claudio.Fontana@suse.com>; Al Cho <ACho@suse.com>; Jos=
=E9 Ricardo Ziviani <jose.ziviani@suse.com>; Claudio Fontana <cfontana@suse=
.de>
Subject: Re: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap call to=
 kvm_s390_get_hpage_1m

On Tue, Jun 29 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:

> this will allow to remove the kvm stubs.
>
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>  target/s390x/diag.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
> index c17a2498a7..8405f69df0 100644
> --- a/target/s390x/diag.c
> +++ b/target/s390x/diag.c
> @@ -20,6 +20,7 @@
>  #include "hw/s390x/ipl.h"
>  #include "hw/s390x/s390-virtio-ccw.h"
>  #include "hw/s390x/pv.h"
> +#include "sysemu/kvm.h"
>  #include "kvm_s390x.h"
>
>  int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
> @@ -168,7 +169,7 @@ out:
>              return;
>          }
>
> -        if (kvm_s390_get_hpage_1m()) {
> +        if (kvm_enabled() && kvm_s390_get_hpage_1m()) {

I think I asked before whether we should introduce a
s390_huge_page_backing() wrapper (which might be overkill)... any
opinions on that? I'm not really opposed to this patch here, either.

>              error_report("Protected VMs can currently not be backed with=
 "
>                           "huge pages");
>              env->regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;


--_000_VI1PR0402MB37443E719A108F3BCAC76172A0009VI1PR0402MB3744_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Cornelia,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Sorry for missing the reply.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
I think it may not be worth it, as you said it seem to be the only call sit=
e for kvm_s390_get_hpage_1m().</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
So I think we could keep it.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AL<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Cornelia Huck &lt;coh=
uck@redhat.com&gt;<br>
<b>Sent:</b> Wednesday, June 30, 2021 11:21 PM<br>
<b>To:</b> Al Cho &lt;ACho@suse.com&gt;; qemu-devel@nongnu.org &lt;qemu-dev=
el@nongnu.org&gt;; qemu-s390x@nongnu.org &lt;qemu-s390x@nongnu.org&gt;<br>
<b>Cc:</b> Claudio Fontana &lt;Claudio.Fontana@suse.com&gt;; Al Cho &lt;ACh=
o@suse.com&gt;; Jos=E9 Ricardo Ziviani &lt;jose.ziviani@suse.com&gt;; Claud=
io Fontana &lt;cfontana@suse.de&gt;<br>
<b>Subject:</b> Re: [RFC v6 10/13] target/s390x: use kvm_enabled() to wrap =
call to kvm_s390_get_hpage_1m</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Jun 29 2021, &quot;Cho, Yu-Chen&quot; &lt;=
acho@suse.com&gt; wrote:<br>
<br>
&gt; this will allow to remove the kvm stubs.<br>
&gt;<br>
&gt; Signed-off-by: Claudio Fontana &lt;cfontana@suse.de&gt;<br>
&gt; Signed-off-by: Cho, Yu-Chen &lt;acho@suse.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; target/s390x/diag.c | 3 ++-<br>
&gt;&nbsp; 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/target/s390x/diag.c b/target/s390x/diag.c<br>
&gt; index c17a2498a7..8405f69df0 100644<br>
&gt; --- a/target/s390x/diag.c<br>
&gt; +++ b/target/s390x/diag.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;&nbsp; #include &quot;hw/s390x/ipl.h&quot;<br>
&gt;&nbsp; #include &quot;hw/s390x/s390-virtio-ccw.h&quot;<br>
&gt;&nbsp; #include &quot;hw/s390x/pv.h&quot;<br>
&gt; +#include &quot;sysemu/kvm.h&quot;<br>
&gt;&nbsp; #include &quot;kvm_s390x.h&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3=
)<br>
&gt; @@ -168,7 +169,7 @@ out:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; return;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (kvm_s390_get_hpage_1m(=
)) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (kvm_enabled() &amp;&am=
p; kvm_s390_get_hpage_1m()) {<br>
<br>
I think I asked before whether we should introduce a<br>
s390_huge_page_backing() wrapper (which might be overkill)... any<br>
opinions on that? I'm not really opposed to this patch here, either.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; error_report(&quot;Protected VMs can currently not be backed with &=
quot;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &quot;huge pages&quot;);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; env-&gt;regs[r1 + 1] =3D DIAG_308_RC_INVAL_FOR_PV;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0402MB37443E719A108F3BCAC76172A0009VI1PR0402MB3744_--


