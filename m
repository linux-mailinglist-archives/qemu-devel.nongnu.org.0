Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F58361123
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 19:33:35 +0200 (CEST)
Received: from localhost ([::1]:50850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX5ry-0000ja-Gg
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 13:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lX4yv-0005To-9h
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:36:42 -0400
Received: from mail-eopbgr70129.outbound.protection.outlook.com
 ([40.107.7.129]:5774 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lX4ym-0007Kx-Mu
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 12:36:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQiNHWDQQTwM20MTVjTr1YJfEhuuiSk2em8Rt/EvANYUtKhc3IvPvxbWcu9/sPu4EdZrOWXyOVigsUx/jfb7NzWRAckWOlSW/nHzflGLayQuKZU3y6tluTnr0gawSoE3CHo2qwSBg7TSZc9qVyYsjZfHo5clpTqQbYRp2gUCgPZn394fIIsyYyVnrfM0V2Sh1azl/5Mc46W1JToUr5v8vHV52JfPQWOEBZLNAbFx8LFYEzcMSLDe2cY8zrEgpa9zCitGWzkQmVvnpAdcnqtfuXNrmwlLR7Ao3jjQ9xVp9WRi6F1rNSOiIJgrkp9f2TG46lAVvYLK1q0f9B4fVq2CYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aNH4cWgxsRoQXpqzXRf5133fLIOtRh63u0lkY1KFRk=;
 b=i7GExENlly+uraL5GyDXQNSFDpATvj3tZytdy3WYFDFKwkgsGuVa93Sb8ZwzS+rC02P13+jzWFGYVHO3FqGXDrYrPgESSt6Uf1c8SNlaXMESEgCSEd6O/L16jkIsC+fvF15da2v6zeRx7Zk4LNeCqqTaZbh7E/g6/5WkJVKmaRUIwpDXPotu8z6spUvR4vqtjvy7DGZ55pfnp6NTDvEYQ3lZUE2dHcsveCzC+UCn9f+iPE8WAjBvLN9jwFLqY0oGSTkCns4fmuo+fcizM11yYoI5tcMD6UgAmcS+8Kb2fDhps9XDJdObBYGlGBzsI15blAlJONu+1TwZQqI2JIXzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aNH4cWgxsRoQXpqzXRf5133fLIOtRh63u0lkY1KFRk=;
 b=OrM+qwqawEjg1CescZfWXmpqi5VFyU5OYtCD0FglZZ9UitKmfy5Hu/9OsyykPeTlVUiV96WaNtvxvUbjKod9VS9191JAQYFnnHcP4AD5f7l5P0n87p/qQYa9Lkq7tVgh/MkDFPnlM+DyjzWXAYWuzAOcdJZPTGLeq7VnQYRDPUM=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by AM4PR0301MB2275.eurprd03.prod.outlook.com
 (2603:10a6:200:4e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Thu, 15 Apr
 2021 16:21:23 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf%6]) with mapi id 15.20.4020.022; Thu, 15 Apr 2021
 16:21:23 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: Paolo Bonzini <pbonzini@redhat.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern "C"
Thread-Topic: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern
 "C"
Thread-Index: AQHXMH3rMThc5Zp3wUeOScCoM1D6Mqq1wvaF
Date: Thu, 15 Apr 2021 16:21:23 +0000
Message-ID: <VI1PR0302MB3486A5C79C9B6DC235B381749C4D9@VI1PR0302MB3486.eurprd03.prod.outlook.com>
References: <20210413113741.214867-1-pbonzini@redhat.com>,
 <847ddb28-7dd6-58c3-b9c6-facecee6e133@amsat.org>
In-Reply-To: <847ddb28-7dd6-58c3-b9c6-facecee6e133@amsat.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [109.245.37.82]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba6fcbaa-7103-43fe-cdbf-08d9002a82e3
x-ms-traffictypediagnostic: AM4PR0301MB2275:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM4PR0301MB227595D85A4437C9CC2C1BAF9C4D9@AM4PR0301MB2275.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GStJmnMSgQjcuWFvjmAiDFGFm5tEBroIk9WhYIumQcy+nnlItN0S5RtXZT1ukVuIfx5WQIXyQ6rzD4aED0oIe9P+1QUkRPDrL6XBsvNdR2yh4Hu24PLJ+dFTZlkmOERgqw11MDTfwJ7m2eLMU5g59b8PIMZjoqMvrpxZ+nvslnAVd9stMPnE97ZucgbSKUWcJDvs5RP3naYSqhbLqd2xy8RI3cztD11b7jQgOpygTm7ly9Ct3kgQE04qmjv0AKRM0uHiw8tZglaaRXEU6bek8f/zGTGKzcKfIUFKB0MfyHgcbxZxIyTTlZoJhXri4fSM9Be2qlm+CW37prSMcVOsntu+K+iDVS9CIegY8DzSiUQ6CnI2YNGvcC42qkK3VveURmXqBPKndoVqNsqcDMGC8d8Ry2th5fgNq2pD31rajGHkLqCkiRS2Nw+apN939R/cIAQ6G38138pucqijFvPj9YYKH5jqWwk+u65E+pkXy4fURwYihorrE7l4ZbvDPYmoA2xEzv+Gj/MHTXz3QqFUgxjnP9wnMeu+mRlxJF9cl5ch6wdZPWov7jEZzO4kToclX+eruJZz9WvVjDPndGFmZFblZ5iPVKoTslGtkr+dwng=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(396003)(136003)(39830400003)(8676002)(4326008)(316002)(8936002)(54906003)(110136005)(33656002)(478600001)(83380400001)(26005)(5660300002)(2906002)(86362001)(38100700002)(52536014)(71200400001)(19627405001)(66946007)(7696005)(6506007)(76116006)(66556008)(66476007)(122000001)(53546011)(55016002)(9686003)(186003)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?BKtXtTyzjKU3ewvkwPh50cu124cY81hDWA/PFbluFOj11wJWTWd1mCm0M+?=
 =?iso-8859-1?Q?UyDO82eO2wh/QETbZpdARy7gdXEUPwoBuXFTXLpeIGisTTsbFupq8E72O+?=
 =?iso-8859-1?Q?xyexKe9M5QnTy4rpK1Ij85os/HcTNL/shkgv54XY03HaAwmHH25HkywGQ8?=
 =?iso-8859-1?Q?Q/ZemUAAW/89wPZ8edukTS3thdEZ1XjESMxTdi7RpXlgIbKhJmjic7jJnL?=
 =?iso-8859-1?Q?KfLStZ/5hkvMO/gOF8Py8plYtRhGFuL8o97Q9478m1jjuYwY77c5ShFufx?=
 =?iso-8859-1?Q?Dhoixd2+Fd4Kd6/2QyeGU8leVNhOsOu/uDtzMiPy9gyMVcqn6rZwyOQihv?=
 =?iso-8859-1?Q?KDU0I3VVoi+a4NozxCVchPYIsDytLe0qxBrbZ/QGAaxCFu1tH3qkFjGGGo?=
 =?iso-8859-1?Q?XUVDO4wsKqt5pfXA8VWP6KfaDcgCdTA7d66OJB5nFP/+YcOo0G0i6hUI+e?=
 =?iso-8859-1?Q?kEX65jajSVljHvMgZSmF5GwedqcoT1c9vJxm6OmA+fT4YjLnOnz1zJnnQf?=
 =?iso-8859-1?Q?8+KeNBrSHBHb2LKVoMpvOouNRROx2nRUxEYLOQnVlSmLa0ZFHzssgRgp6R?=
 =?iso-8859-1?Q?yvs1P3JWTs7+0UPlk8JTPMhieeiXqffHCUlvigvmpGnS1wi77Hxihrxfwg?=
 =?iso-8859-1?Q?GktWp1MXpMZAo8hvpL59PDKGHKIhCA/hrG3c+mcVXImmIusmN+Opf2/nHu?=
 =?iso-8859-1?Q?hg9GOFalJg+EulIx9GLy8q07+AH3cThIIWFauOKxCkF7LtD0JvXgs6xC9R?=
 =?iso-8859-1?Q?7HdUAuG5Iq46Mc+CIVrqm6iRLjA/wfjghDR4knS07aGymKbrHHssnrdfPa?=
 =?iso-8859-1?Q?Re0wiT7yFd+RfvWzGS6Eo+yCLVzJ5ueW+lbB22a2LTA9SitIvdkiTBxfYf?=
 =?iso-8859-1?Q?MRZrfFw/huZJN6ZFRuLyKfwRfEWyUn19EnM7t9asZWFEVeVgxtyMGM4mrD?=
 =?iso-8859-1?Q?ozeBPVBiRere0yvCu2OAUoIgDy/YdxBQCppQZd2xkq+FDCwqUXUv2gIVnP?=
 =?iso-8859-1?Q?o9QnuEgJ/w5SdMFkjh+vjAp+w2Cq/BCJKkA/QpzBfEIiPS3DtGtS9Y2zqc?=
 =?iso-8859-1?Q?7q/4PWpmR/RMEV4JkXTknS06N+rlkfC7/+isKHARzatgPfSX61fr3n8lta?=
 =?iso-8859-1?Q?tHD6nSWEVJGa5AYFIWLZEnvVImHKdISJNUQWa0fJdg65AJCJFUfal+4s/3?=
 =?iso-8859-1?Q?RHPR1ILy1gvJ3VfYH78chgXb4i91QPrl5QSCYqEnaNtipvVDpaWpIeDl/h?=
 =?iso-8859-1?Q?2uW7BZFFE7Ay7b3NIXthV1MNyZCkFjP8vqZWSrvHLqyGIJT2Su9dDyPZCy?=
 =?iso-8859-1?Q?YQNHKogr/ueSNjATAeDB5GPVMS/UoueA5SOwBZYlBSC4MBs=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB3486A5C79C9B6DC235B381749C4D9VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba6fcbaa-7103-43fe-cdbf-08d9002a82e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2021 16:21:23.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XYCQ+TYkiv+K07HDDkyyctCAHsggAN2xJxqgygtJ2xvb/WitvVwr3aV+e/d3yYj2hPycRex0nGkJNouNqpaEtbrmZI+JgDI4/ZE0wzJAbxw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0301MB2275
Received-SPF: pass client-ip=40.107.7.129;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "Vince.DelVecchio@mediatek.com" <Vince.DelVecchio@mediatek.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB3486A5C79C9B6DC235B381749C4D9VI1PR0302MB3486_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Can you specify how to reproduce the issue ? We need more details about env=
ironment.

In my case, everything seems to work fine for the newest version of glib (2=
.68).

Thank you,
Aleksandar

> qemu/osdep.h is quite special in that, despite being part of QEMU sources=
,
> it is included by C++ source files as well.
>
> disas/nanomips.cpp is doing so within an 'extern "C"' block, which breaks
> with latest glib due to the inclusion of templates in glib.h.
>
> These patches implement Daniel Berrang=E9's idea of pushing the 'extern "=
C"'
> block within glib.h and including system headers (including glib.h,
> and in fact QEMU's own glib-compat.h too) *outside* the block.
>
> (CI has not finished running yet, but it seems encouraging).
>
> Paolo
>
> Paolo Bonzini (2):
>   osdep: include glib-compat.h before other QEMU headers
>   osdep: protect qemu/osdep.h with extern "C"
>
>  disas/nanomips.cpp      |  2 +-
>  include/qemu/compiler.h |  6 ++++++
>  include/qemu/osdep.h    | 13 +++++++++++--
>  3 files changed, 18 insertions(+), 3 deletions(-)
>
> --
> 2.30.1
________________________________
From: Philippe Mathieu-Daud=E9 <philippe.mathieu.daude@gmail.com> on behalf=
 of Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
Sent: Tuesday, April 13, 2021 5:58 PM
To: Paolo Bonzini <pbonzini@redhat.com>; qemu-devel@nongnu.org <qemu-devel@=
nongnu.org>
Cc: peter.maydell@linaro.org <peter.maydell@linaro.org>; berrange@redhat.co=
m <berrange@redhat.com>; Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>; =
Vince.DelVecchio@mediatek.com <Vince.DelVecchio@mediatek.com>; Petar Jovano=
vic <petar.jovanovic@syrmia.com>; Filip Vidojevic <Filip.Vidojevic@Syrmia.c=
om>
Subject: Re: [PATCH 0/2] osdep: allow including qemu/osdep.h outside extern=
 "C"

Cc'ing MediaTek reviewers.

On 4/13/21 1:37 PM, Paolo Bonzini wrote:
> qemu/osdep.h is quite special in that, despite being part of QEMU sources=
,
> it is included by C++ source files as well.
>
> disas/nanomips.cpp is doing so within an 'extern "C"' block, which breaks
> with latest glib due to the inclusion of templates in glib.h.
>
> These patches implement Daniel Berrang=E9's idea of pushing the 'extern "=
C"'
> block within glib.h and including system headers (including glib.h,
> and in fact QEMU's own glib-compat.h too) *outside* the block.
>
> (CI has not finished running yet, but it seems encouraging).
>
> Paolo
>
> Paolo Bonzini (2):
>   osdep: include glib-compat.h before other QEMU headers
>   osdep: protect qemu/osdep.h with extern "C"
>
>  disas/nanomips.cpp      |  2 +-
>  include/qemu/compiler.h |  6 ++++++
>  include/qemu/osdep.h    | 13 +++++++++++--
>  3 files changed, 18 insertions(+), 3 deletions(-)
>


--_000_VI1PR0302MB3486A5C79C9B6DC235B381749C4D9VI1PR0302MB3486_
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
Hi Paolo,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Can you specify how to reproduce the issue ? We need more details about env=
ironment.<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
In my case, everything seems to work fine for the newest version of glib (2=
.68).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thank you,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Aleksandar<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
&gt; qemu/osdep.h is quite special in that, despite being part of QEMU sour=
ces,
<div>&gt; it is included by C++ source files as well.</div>
<div>&gt; </div>
<div>&gt; disas/nanomips.cpp is doing so within an 'extern &quot;C&quot;' b=
lock, which breaks</div>
<div>&gt; with latest glib due to the inclusion of templates in glib.h.</di=
v>
<div>&gt; </div>
<div>&gt; These patches implement Daniel Berrang=E9's idea of pushing the '=
extern &quot;C&quot;'</div>
<div>&gt; block within glib.h and including system headers (including glib.=
h,</div>
<div>&gt; and in fact QEMU's own glib-compat.h too) *outside* the block.</d=
iv>
<div>&gt; </div>
<div>&gt; (CI has not finished running yet, but it seems encouraging).</div=
>
<div>&gt; </div>
<div>&gt; Paolo</div>
<div>&gt; </div>
<div>&gt; Paolo Bonzini (2):</div>
<div>&gt; &nbsp; osdep: include glib-compat.h before other QEMU headers</di=
v>
<div>&gt; &nbsp; osdep: protect qemu/osdep.h with extern &quot;C&quot;</div=
>
<div>&gt; </div>
<div>&gt; &nbsp;disas/nanomips.cpp &nbsp; &nbsp; &nbsp;| &nbsp;2 +-</div>
<div>&gt; &nbsp;include/qemu/compiler.h | &nbsp;6 ++++++</div>
<div>&gt; &nbsp;include/qemu/osdep.h &nbsp; &nbsp;| 13 +++++++++++--</div>
<div>&gt; &nbsp;3 files changed, 18 insertions(+), 3 deletions(-)</div>
<div>&gt; </div>
<div>&gt; -- </div>
&gt; 2.30.1<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philippe Mathieu-Daud=
=E9 &lt;philippe.mathieu.daude@gmail.com&gt; on behalf of Philippe Mathieu-=
Daud=E9 &lt;f4bug@amsat.org&gt;<br>
<b>Sent:</b> Tuesday, April 13, 2021 5:58 PM<br>
<b>To:</b> Paolo Bonzini &lt;pbonzini@redhat.com&gt;; qemu-devel@nongnu.org=
 &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> peter.maydell@linaro.org &lt;peter.maydell@linaro.org&gt;; berra=
nge@redhat.com &lt;berrange@redhat.com&gt;; Aleksandar Rikalo &lt;Aleksanda=
r.Rikalo@syrmia.com&gt;; Vince.DelVecchio@mediatek.com &lt;Vince.DelVecchio=
@mediatek.com&gt;; Petar Jovanovic &lt;petar.jovanovic@syrmia.com&gt;;
 Filip Vidojevic &lt;Filip.Vidojevic@Syrmia.com&gt;<br>
<b>Subject:</b> Re: [PATCH 0/2] osdep: allow including qemu/osdep.h outside=
 extern &quot;C&quot;</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Cc'ing MediaTek reviewers.<br>
<br>
On 4/13/21 1:37 PM, Paolo Bonzini wrote:<br>
&gt; qemu/osdep.h is quite special in that, despite being part of QEMU sour=
ces,<br>
&gt; it is included by C++ source files as well.<br>
&gt; <br>
&gt; disas/nanomips.cpp is doing so within an 'extern &quot;C&quot;' block,=
 which breaks<br>
&gt; with latest glib due to the inclusion of templates in glib.h.<br>
&gt; <br>
&gt; These patches implement Daniel Berrang=E9's idea of pushing the 'exter=
n &quot;C&quot;'<br>
&gt; block within glib.h and including system headers (including glib.h,<br=
>
&gt; and in fact QEMU's own glib-compat.h too) *outside* the block.<br>
&gt; <br>
&gt; (CI has not finished running yet, but it seems encouraging).<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; Paolo Bonzini (2):<br>
&gt;&nbsp;&nbsp; osdep: include glib-compat.h before other QEMU headers<br>
&gt;&nbsp;&nbsp; osdep: protect qemu/osdep.h with extern &quot;C&quot;<br>
&gt; <br>
&gt;&nbsp; disas/nanomips.cpp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 2 +-<br=
>
&gt;&nbsp; include/qemu/compiler.h |&nbsp; 6 ++++++<br>
&gt;&nbsp; include/qemu/osdep.h&nbsp;&nbsp;&nbsp; | 13 +++++++++++--<br>
&gt;&nbsp; 3 files changed, 18 insertions(+), 3 deletions(-)<br>
&gt; <br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_VI1PR0302MB3486A5C79C9B6DC235B381749C4D9VI1PR0302MB3486_--

