Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A88636B90
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 21:50:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxwh2-00088d-2X; Wed, 23 Nov 2022 15:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huanyu.zhai@outlook.com>)
 id 1oxuJn-0001DD-8p; Wed, 23 Nov 2022 13:17:57 -0500
Received: from mail-db8eur05acsn20805.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::805]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huanyu.zhai@outlook.com>)
 id 1oxuJl-0004Un-3J; Wed, 23 Nov 2022 13:17:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m+dpEQnr+yp294MWwTeTL5aTYMXYNergiLkJuXxzA8iimAeLWfcmMk/lIWbkot9sZ6aEI2FTISEwSe+whkb3VAonGCdjk1EnjCsliG6oI6rPCdP4FMRSsx2V1Ffvj/smWgy2qlPBq8uiT/+uD9Ck0IzdD9YOVol8oUIva/JkoaJH04U7Vaq2jqG44YewkzxO28U/MtJLcFiV7MlR62d/TU7Li41+NKqOPMC63fFsIzYVsf3IQzKQNP0N07v13t829eomt51Qo9FPsDw4z8fnMIHLr9gSt8eQJQntHy4he5iCuDmllickDJ0EX6QHxOS5LYCpf2DJgVv+yCTMXf6fFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpZr+SXRaC8ZmtLmpUkIdKY4DJ4vNagxc7Ive5WKN6A=;
 b=AEkQAsmQmbPrTJazGCh1+eZJ+GMvvw3707PDOIbgmTSdfbefVKwes/HQCBUl7M7F/M+5zd82EPsVhNhlhJqzXuqZIjJ5yq2JU3unCwT+iNjsqs0h1gdPHaPFe0CVEayYvvli6WOJx2/0jq/ey1YzBz9isdTsXva24vSrHs61N4CVFvHLJwvVPQE40v7pqGsVopCtJvt+vGqX3Ru7Y3QzW2rUU+oOXrKXvPfBFLh2mKKoLODMWxcqlYvor5MfNN2C2DpWp+NDCo0AaX167nR7xM/DlqxMit+9+o9GSgdgGlxdxZLtyh7OcdYx/SHp25xuGB1kZ5Q1XLUXAG3fZXPhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpZr+SXRaC8ZmtLmpUkIdKY4DJ4vNagxc7Ive5WKN6A=;
 b=Fa8SK1jNdxXnsRvQFdeHgVBR6ih0woWk9SgJOQ/8etgFOUrPAKIYIIaBsFmdnfcYWWWbco/KXQZh+db2ky36POYJKrnwzRxxtuyLj9M7iH3DhdcL/Ey7/fUBMJItUh0iuprNXS71yeuy8AVMl4UCqHp+7Mct9TRtlSkkxvjcZmwt2qJB1Z6irVLA+BHJPTMMPvYmoPEiUQLgRZ4y/wDNUARDuCjH/RmC5OZkV/fU+9VCZSMwlV6l2knuIQMEtq4feyRc8akRWz43Eq1HhmH4zBK8ZAH6uG7TNczQGfEKPc+Ns/gagDWqyCweUOGubjOZ894OTI+JNNocV3YIDLH7Cg==
Received: from AS4P190MB2021.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:519::16)
 by DBAP190MB0999.EURP190.PROD.OUTLOOK.COM (2603:10a6:10:1af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Wed, 23 Nov
 2022 18:17:48 +0000
Received: from AS4P190MB2021.EURP190.PROD.OUTLOOK.COM
 ([fe80::f177:ba24:c669:47bb]) by AS4P190MB2021.EURP190.PROD.OUTLOOK.COM
 ([fe80::f177:ba24:c669:47bb%3]) with mapi id 15.20.5834.015; Wed, 23 Nov 2022
 18:17:48 +0000
From: Huanyu ZHAI <huanyu.zhai@outlook.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: [PATCH] cpu/i386: update xsave components after CPUID filtering
Thread-Topic: [PATCH] cpu/i386: update xsave components after CPUID filtering
Thread-Index: Adj/Z1Q576NQ8Xr5QByylpzq/8jNfQ==
Date: Wed, 23 Nov 2022 18:17:48 +0000
Message-ID: <AS4P190MB202188766937CF16EC4F1DAFF60C9@AS4P190MB2021.EURP190.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-tmn: [P6IagM4yeNONZyjkev79b7HySZiWdHE5]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4P190MB2021:EE_|DBAP190MB0999:EE_
x-ms-office365-filtering-correlation-id: 8417e05d-88a9-4249-ee2f-08dacd7f06a9
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VCXpWhYOyvbTREJuaR7k3hf0KkI5cfrkOSWQ9UwV2CgZZbq3sUGO5hO97BFbXxn4K4aCL9ZUmbQwIum4xyja4ppN/qcDg95UkiPvaSahO/uhI03hWpvnOZnk/3H+U09jtjsbS7s7SwFERMVcf8LJxW+5bQa48m0drjMbXbO4SA7sJr4/6cWXXvDdgdX3Wf6eMa6RF15O8HXR2q8H/iVArnzow2eQfF6sehakXufcF0b1GXykudFHc74SrAg+vSEbCP2amukCvMfb+lzmyKIwmUYWEZjRkaUbDGYaCGCZJDWD0B/tCQIvzTys+3dyai+U1HRNvMdgILF9iP+w5fwe9s21Af9NBxTAJdoohbTAjylFo1xFotMtqrIqEMgpKPidFaSyTXcnxb7/OR+UJBuHtilEmsOH2NuFujDosoTKFR6Ab4gsj0pf32qTJpaGVByyWwUVXDTsNNdyKQ2dalPBj0RzfnqvZAwstWMQuOBuQbgEHtbrxzW6/Hn1gyhkajlZQfCTLZnqhWEOMAU6WxK4D1zfMxFourMhLWLlVEkfudZfKpXjhG6NsXe5ZSCzkJpNsZ0hZ/2l0PoheB7CVn0j6A==
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yLx2ahdgTmn+mUthT3D0V437RojEtrm3YOpmKT+K8NdKIQ35nTki/kG4nLrV?=
 =?us-ascii?Q?ZIhz3JmjzqRSeag3UWyapnf0JaOCMAhzGNGqCyXFPSnoOqguInKu/X+zqx8Q?=
 =?us-ascii?Q?WqN+XSZMXVH9CqX2b29Df+fcEgpXxh0dd4BeUfAOP2fJHMR3WjtVrQueOrxq?=
 =?us-ascii?Q?3gfXrOuqQUjKp8DHGx+tVFi3hvomIvpkJenOL5B87e3qn1RB1SZ/vVNO29t6?=
 =?us-ascii?Q?4ogQ4mC8HlpIkuunaf14QSFG3hlrPPX87pNlHkUJ4gbu7wghOefzZC0o5NFr?=
 =?us-ascii?Q?4KP67jcRRkPPPTVnxXBIt7iEsuCy/L9ndPyIyTEu24EzNWu4MkogXb6YCUco?=
 =?us-ascii?Q?4rGgcm9JKbIu8Z2+hnm6T5bVbKdBuiOMbkW1Dbf/APAb6fuRhC+t+p76i3Gf?=
 =?us-ascii?Q?9cwXS2m0eJyKd21LM4aqIqrA0lkG8a4MjS/YAIAQJ5vuzdDQfTMAhYBmhhGs?=
 =?us-ascii?Q?x72UHOmCM1+mSVjL9e/Fc/fTlF6Xc2Xn34FVzomxhZYi1EulJm0o0/cdXCNR?=
 =?us-ascii?Q?DnSQd95kjP1bJ4HKtceTgW7oALAH8EZyxLf5VZWErMJxL6yeAx3vgcqpeDrm?=
 =?us-ascii?Q?3/Xix5IirMJso7Reabaia0velMHIkrcQjpLjHsC5VSNU6eWR8t8jw+8yIBUX?=
 =?us-ascii?Q?OibPBI85uunzaP7qcctf3Dr29aI6Y9aNHEaHZOh0d+n6C3MN4ZQM+seTx3Q1?=
 =?us-ascii?Q?JBLNP+Fl7Cp8dnplJ1G5hVj+bTCaB8k3COqekbMhzNrxYZxGte4p5YXZ5dod?=
 =?us-ascii?Q?UPzvUgFzWbyj2WLL5f5Lnz7HtYtM4DCiSS1vTVeNzR8xTW4nNgqojs3U50gh?=
 =?us-ascii?Q?EB/gKqePOJg/4qbSRXoPVda8dnTTV3vhhHbwg2bem8CsUeq33+tE81UhXs+P?=
 =?us-ascii?Q?Ttxi6Uax5/TkfvthQKQkgfseOvqRqmrFJ1QqO13YIFK0i8o/UJ+mRkUnjvQm?=
 =?us-ascii?Q?10xWaGAIc+PtPRpE7rtfoq4bOlJB6OvaWLXrl8QJpJvqGWerDIHeVrIxTQi5?=
 =?us-ascii?Q?EUShGaF7pfnp7hkVyavEaqfTP0vwOv9/zpeT0+YqKAgYs+s7d1t3l4gjmEEk?=
 =?us-ascii?Q?wVLBO2s2UrIzB177K4ttEfGdmSB393xvPYYOBMNbkW5rulbtDVwcKMPPXn/3?=
 =?us-ascii?Q?WPyrVojuv70j4pEuTBDHzJfJiEz4Pnq5gTV9kRhrkHaYhPfMfytcggI/wwGI?=
 =?us-ascii?Q?76qWbkAzm3dUXDVNg4HCJYvtKn8yqvlgnbQtFH3vjmT6WTlYT50JefLcZdxQ?=
 =?us-ascii?Q?WG4STNaUJvA41MDAAxRmHGea3HjotLZxgjRC8xzw3g=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_AS4P190MB202188766937CF16EC4F1DAFF60C9AS4P190MB2021EURP_"
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4P190MB2021.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8417e05d-88a9-4249-ee2f-08dacd7f06a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2022 18:17:48.2374 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAP190MB0999
Received-SPF: pass client-ip=2a01:111:f400:7e1a::805;
 envelope-from=huanyu.zhai@outlook.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 GB_FREEMAIL_DISPTO=0.5, HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 23 Nov 2022 15:49:54 -0500
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

--_000_AS4P190MB202188766937CF16EC4F1DAFF60C9AS4P190MB2021EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Subject: [PATCH] cpu/i386: update xsave components after CPUID filtering

On i386 platform, CPUID data are setup through three consecutive steps: CPU=
 model definition, expansion and filtering.
XSAVE components are enabled during the expansion stage, by checking if the=
y are enabled in CPUID. However, it is still
probable that some XSAVE features will be enabled/disabled during the filte=
ring stage and the XSAVE components left unchanged.
Inconsistency between XSAVE features and enabled XSAVE components can lead =
to problems on some Linux guests in the absence of
the following patch in the kernel:

https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1452368.html

A simple case to reproduce this problem is to start a SUSE 12 SP3 guest wit=
h cpu model set to Skylake-Server:
$ qemu-system-x86_64 -cpu Skylake-Server ...

In the SUSE 12 SP3 guest, one can observe that PKRU will be enabled without=
 Intel PKU's presence.
That's because on platform with Skylake-Server cpus, Intel PKU is disabled =
during x86_cpu_filter_features(),
but the XSAVE PKRU bit was enabled by x86_cpu_expand_features().

Signed-off-by: Huanyu ZHAI zhaihuanyu@huawei.com<mailto:zhaihuanyu@huawei.c=
om>
Signed-off-by: Xin Wang wangxinxin.wang@huawei.com<mailto:wangxinxin.wang@h=
uawei.com>
---
target/i386/cpu.c | 3 +++
1 file changed, 3 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 22b681ca37..2ee574cf05 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -6362,6 +6362,9 @@ static void x86_cpu_filter_features(X86CPU *cpu, bool=
 verbose)
             mark_unavailable_features(cpu, FEAT_7_0_EBX, CPUID_7_0_EBX_INT=
EL_PT, prefix);
         }
     }
+
+    /* Update XSAVE components again based on the filtered CPU feature fla=
gs */
+    x86_cpu_enable_xsave_components(cpu);
}

static void x86_cpu_hyperv_realize(X86CPU *cpu)
--
2.27.0


--_000_AS4P190MB202188766937CF16EC4F1DAFF60C9AS4P190MB2021EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:DengXian;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:DengXian;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:DengXian;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Subject: [PATCH] cpu/i386: upda=
te xsave components after CPUID filtering<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">On i386 platform, CPUID data ar=
e setup through three consecutive steps: CPU model definition, expansion an=
d filtering.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">XSAVE components are enabled du=
ring the expansion stage, by checking if they are enabled in CPUID. However=
, it is still<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">probable that some XSAVE featur=
es will be enabled/disabled during the filtering stage and the XSAVE compon=
ents left unchanged.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Inconsistency between XSAVE fea=
tures and enabled XSAVE components can lead to problems on some Linux guest=
s in the absence of<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">the following patch in the kern=
el:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><a href=3D"https://www.mail-arc=
hive.com/linux-kernel@vger.kernel.org/msg1452368.html">https://www.mail-arc=
hive.com/linux-kernel@vger.kernel.org/msg1452368.html</a><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">A simple case to reproduce this=
 problem is to start a SUSE 12 SP3 guest with cpu model set to Skylake-Serv=
er:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">$ qemu-system-x86_64 -cpu Skyla=
ke-Server ...<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">In the SUSE 12 SP3 guest, one c=
an observe that PKRU will be enabled without Intel PKU's presence.<o:p></o:=
p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">That's because on platform with=
 Skylake-Server cpus, Intel PKU is disabled during x86_cpu_filter_features(=
),<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">but the XSAVE PKRU bit was enab=
led by x86_cpu_expand_features().<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Huanyu ZHAI <a h=
ref=3D"mailto:zhaihuanyu@huawei.com">
zhaihuanyu@huawei.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Xin Wang <a href=
=3D"mailto:wangxinxin.wang@huawei.com">
wangxinxin.wang@huawei.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">target/i386/cpu.c | 3 +++<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">1 file changed, 3 insertions(+)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/target/i386/cpu.c =
b/target/i386/cpu.c<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 22b681ca37..2ee574cf05 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/target/i386/cpu.c<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/target/i386/cpu.c<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -6362,6 +6362,9 @@ static vo=
id x86_cpu_filter_features(X86CPU *cpu, bool verbose)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mark_unavailable_features(cpu, FE=
AT_7_0_EBX, CPUID_7_0_EBX_INTEL_PT, prefix);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; }<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp; /* Update X=
SAVE components again based on the filtered CPU feature flags */<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp; x86_cpu_ena=
ble_xsave_components(cpu);<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">static void x86_cpu_hyperv_real=
ize(X86CPU *cpu)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-- <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2.27.0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_AS4P190MB202188766937CF16EC4F1DAFF60C9AS4P190MB2021EURP_--

