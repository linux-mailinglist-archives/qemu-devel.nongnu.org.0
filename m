Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE44D62D744
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 10:42:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovbOB-0007Xv-9m; Thu, 17 Nov 2022 04:40:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1ovbNi-0007Nw-AS
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:40:28 -0500
Received: from mail-vi1eur05on2110.outbound.protection.outlook.com
 ([40.107.21.110] helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Milica.Lazarevic@Syrmia.com>)
 id 1ovbNc-0007zu-CQ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 04:40:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CA3Kz3heW/Z5AuwTR6T/bmBOtlyZXYuKKUqQG/qr9/K2HmOX1UPdEH4LWEak1xmAqoELxgW6RQFe8Bd1yi8RfhshQEJKesSGUEU42mNWNUaym1pnuao+B0R47ol0FkmFM6N9aLHjgC08jklrurJxLLDRrlXDambF9YyMqA7Klu05c3SKOyjZ1igh/vmO7ZRyj8S3f5moMAklaWI4QRKKcLfcaWJ8gwVe/6Xfb//0XWqV+znQv2zFhDWOKYIFV5SWBKewWKn8dHIUjzqSEW5mmOlq799N5+jcqJK88RWZDH3c6tYeqOInX363KWWSLpj3knLV/0hfgR0f8VVkHP+rqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eImlYdAmaZYdkfp8mkf/W0Ij2i9dv2trWUISyOQJCOM=;
 b=DfOcXUqoRiOWV92LfmIbndpKMYr1Apt5mJeXdyaHmZCGoTYxUfEsA02N26240B7JI+328ipZjLB+JdCCclsRZoA6Oskk4QhT1okYk4BL2VkN16cl8IEoQic6OyLD9h0ukvz77TsKJTEyejlV8GXbRut2KttdHIerEOaJLANEstMtTXaOvcjhcvh+fMwS1edbV+wWMTrTHLEWyDnd9uEANGSOF9yY4YwK9MTqXgwgDit+47nHOaj48gq7+QL8HsyXskQy/NtDHRRPl3VW2Kbdl5FAI0UDiglRWAUZxg//egQxmwvQqeFP7l+2WKYQjOBY4wsJfeawoPVawS0czN3rTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eImlYdAmaZYdkfp8mkf/W0Ij2i9dv2trWUISyOQJCOM=;
 b=LTMUihoHZzjVMTPdlwl6IgOq3UhtU8s+GJg7TUD+cwT0CxNkvYiQxvV5JTRdYm9K7tEJTOP+7rWBat7wSNbe9QcjFd4lbKCgx8KzPZZ6rgMItILCC/MtKOn5ctjaFr3fnJS1Qy7ftTU5pbkoC63H04roRIt4lvYya/EOrCDn/T8=
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20)
 by DB9PR03MB7433.eurprd03.prod.outlook.com (2603:10a6:10:1fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Thu, 17 Nov
 2022 09:35:10 +0000
Received: from PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::364:f02b:cd43:7f3b]) by PAVPR03MB9678.eurprd03.prod.outlook.com
 ([fe80::364:f02b:cd43:7f3b%3]) with mapi id 15.20.5813.018; Thu, 17 Nov 2022
 09:35:10 +0000
From: Milica Lazarevic <Milica.Lazarevic@Syrmia.com>
To: =?iso-8859-9?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Markus Armbruster
 <armbru@redhat.com>, Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Subject: Re: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Thread-Topic: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Thread-Index: AQHY7LH2jReORC0J40WpQ1lmk50NPK5C9jb3
Date: Thu, 17 Nov 2022 09:35:10 +0000
Message-ID: <PAVPR03MB96784D39EC71F71C86ABAE81F8069@PAVPR03MB9678.eurprd03.prod.outlook.com>
References: <20221030225006.43203-1-philmd@linaro.org>
In-Reply-To: <20221030225006.43203-1-philmd@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=Syrmia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB9678:EE_|DB9PR03MB7433:EE_
x-ms-office365-filtering-correlation-id: d7aa6d21-3d71-472f-525d-08dac87f059b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +kD+ExKwDP0CIjwpDp24ifU7XO+5VF+VbdheAa1CdbHLLGQlA6PFBt2ZbQGg+pgybnCshnmJ8PfJyT/GqY7ri1vGkDmFJznsmsJyMI8bhYDecvCjqnugrykJx987RugCb2UwiXNtaHHYIwUxYzH8FmmDAExbqNts196NaWQZXFAoT05346FJrNgOXgFSSa3t2EyJAXReaL/Ijj5JNITUkuDtc74vcMX8mgSLczVTeQ2AkhgDxvCS8m/ZGTdE6VAUVA2wnwOTCBlxkw/hka9aocrXmRZCqDNsWs9B5TViP7CJBlPPtO8X+OBpvwp/jVhrt8Ms+Z8j00fRREpfRfO//iFb7Ia7BWwS0o0CYQpRbrRJWA6YSE9taviRN0tQBaLNaRcV6q2KzN18cC5rVkN9ZVIyJfRBll/50LdupEGI/5VtVi8Cr84j05Ah7V7Ylf9oSlTm3LsPY0HaVHA0XV25u5qltoA0QkyS2iJWTwgaFLG8T11MZ/LvI4hM09mlN/STOo5qknn8Nv/aYZeIItUbJaoDMBo5w5F3uRKGl9DS/+He/RK2kyWLYyJWe7BcxxPj+4RCNbXUXBAcwcJ7btwkOiB2r/STzHR/Ch5EMvBxNeRj1IFWlpBaa/UaI1YwvSVHj6lf5FCRhi9UFdFyEmbvDxWBjIPyS2a+Io25Nt3GYiD0RHcv4Nlee2qi96tR5ib/hFlu77u7bCQQk+M00R0sq6CNhlqvU/mRm1sclamN5nA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAVPR03MB9678.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39840400004)(136003)(366004)(396003)(376002)(346002)(451199015)(186003)(33656002)(5660300002)(53546011)(316002)(6506007)(7696005)(110136005)(54906003)(41300700001)(8936002)(52536014)(26005)(9686003)(4326008)(8676002)(91956017)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(122000001)(166002)(38070700005)(38100700002)(2906002)(83380400001)(55016003)(86362001)(478600001)(45080400002)(19627405001)(966005)(71200400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-9?Q?Ua4owFLHOqG7OKBONCMizG1g1Fhl/uNmflK1RqqL/OKQoWS5h7nlKMyYD8?=
 =?iso-8859-9?Q?SjPUb/WhFoLNo+J+ly5750m58+SVVKxFTZWs02K1NalLfZWsDbBD4UTZCu?=
 =?iso-8859-9?Q?IbMldcl56eCcjJ5vynzearT2oVOp071U2VLM1lti4cu/X23L02tvbGBfAV?=
 =?iso-8859-9?Q?hYls6tYZqVr7XnA3FRt4dWMmgmz1yWdwnX4yqR8QgLrE/RQPA91HSNks3a?=
 =?iso-8859-9?Q?DYhs5j/ATABwdTTHJFql2sBSCFGMIEuyiqk8iy/HqDfmVdGAocWN1oL6Lc?=
 =?iso-8859-9?Q?ODhuHV/jNDGna25jm/OpN13VC+plrWTHHYtaiI0Y2kS4SNxfk9WrMbDiiT?=
 =?iso-8859-9?Q?NN0UXkFecmWUSZ5JdU3Ct2rucSsx2nqwuDnnqPC+Qdje8UyWmAJXg174lk?=
 =?iso-8859-9?Q?MN/mMGB72EY4u+btXbGppHxj1EW7f2anoqcEBwG1iptt1pvFaFAKmTFyqB?=
 =?iso-8859-9?Q?taJ0EQVpPualJSeyLhB6PGAfhlN7HGAvZ8Gmfi6anATSn+CndElE+w19Il?=
 =?iso-8859-9?Q?Z7QU1HjuCDv90G2pU+98tS9m84XxVbDpAyoMMnR1gaV4zVrSvkbA9G/f38?=
 =?iso-8859-9?Q?zQPnH8KI4REaouVvrcrKCLy09SA12Paz9M4uvNtSKB/Ni6CuCdaU7WK1jm?=
 =?iso-8859-9?Q?6JR752ArzzBHV2SP8JbFUGuwj1h/F2rEN+gB3VMW+EID29lCv3hAxi5NPC?=
 =?iso-8859-9?Q?745zlRKghv80fTilQgBdDosWhiD/j6sktGbdo1l3gGSKpGFrCqoU+e0ve4?=
 =?iso-8859-9?Q?SV8uSE8ufZTo9mqrkgzM0BmRRNSPrTK8xSPYweGT6F/ITcSmvnf4TaJMb/?=
 =?iso-8859-9?Q?2ibcx5dK2+uLqtAwtadda0fANs36Fty6hXP5VbfK5MWiasK4+FMCskWFJt?=
 =?iso-8859-9?Q?UeNlt82PO+p9GvGnwZbWWacTkgeDDHCLnhZ3JESa1fbHX2gi91+0iOBD9k?=
 =?iso-8859-9?Q?wT01BUsjV1IBqf4cPwZKkhoNsxhZ1O/pNuKmj1Zvhrky5jlgjZj4RpLdze?=
 =?iso-8859-9?Q?WSVkfOVHg/bEgvngowzzFLHHxdwCdtWTYyGptvZdQ3Mn2EtFt7+KPCxvPo?=
 =?iso-8859-9?Q?rHo1CpFFDcSfViZguohKiJw7RGGyATnhS1tjAT/N9hLIcjzO0jdJyK65FM?=
 =?iso-8859-9?Q?lz1jL1z31KLz/tQPzpNa+Ap1/hMHlCcnRZgzoMu1YZbLUgvsmRTUWyh53h?=
 =?iso-8859-9?Q?NHjv/vFUEEtvRbDig4uCF2WeQgO+9/JPVRiyixUlO3Gcb4sDddFBK6bGFU?=
 =?iso-8859-9?Q?XN9Gx3YU9uHbFo5rVFC0RiqlVQ/ulFQblyhWF9uls5Uc042K7bXg96Nysx?=
 =?iso-8859-9?Q?v5nKEEUmoGuOCyjlzAb+34RMQkrhDTZhPxMkr1TuO4Fb60cYic3CfJ68hB?=
 =?iso-8859-9?Q?a1IEfwD7DGuXU49Tb54YwYDw4y1fuUgfRswiTciKUp1XXoH26He6otj0zG?=
 =?iso-8859-9?Q?TIXns0qyZ3jVsiSxQU75MVZV8urlMGjkiy9TPfg9oKxDBXed2pU3YpC8iw?=
 =?iso-8859-9?Q?G3G5+OjNkKbygCbEl/KZasFwoCVf2nspZsxQiLRfcx7YJ0cFSoG1QxAcw/?=
 =?iso-8859-9?Q?NvrljoWi+AKK2AM7wdJxtvEjoDYo8xZrOQU8jtVVqC1XHHYtnOtwQ2j51l?=
 =?iso-8859-9?Q?ToMyhm1qPg+R38rVwEDIh3iJnvIq0BpgIh?=
Content-Type: multipart/alternative;
 boundary="_000_PAVPR03MB96784D39EC71F71C86ABAE81F8069PAVPR03MB9678eurp_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB9678.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7aa6d21-3d71-472f-525d-08dac87f059b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2022 09:35:10.6501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: soPnAuY6MEy9itOAHAvlt7NX0J5AbD0RutL0iHP5U+84k/Z39r20ymEtFH+5LjlzGoFRCV7Z6gqT6mfJfBok89+WsTQwr3WLogmgAB3+2D0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7433
Received-SPF: pass client-ip=40.107.21.110;
 envelope-from=Milica.Lazarevic@Syrmia.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

--_000_PAVPR03MB96784D39EC71F71C86ABAE81F8069PAVPR03MB9678eurp_
Content-Type: text/plain; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable


6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
(see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
ISA support in QEMU"), however today his email is bouncing:

** Message blocked **

Your message to stefan.pejic@syrmia.com has been blocked. See technical det=
ails below for more information.

Hi,

Stefan is no longer working with us, but I will be more than happy to take =
maintaining the nanoMIPS ISA on me!

Regards,
Milica
________________________________
From: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
Sent: Sunday, October 30, 2022 11:50 PM
To: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Cc: Philippe Mathieu-Daud=E9 <philmd@linaro.org>; Richard Henderson <richar=
d.henderson@linaro.org>; Milica Lazarevic <Milica.Lazarevic@Syrmia.com>; Th=
omas Huth <thuth@redhat.com>; Jiaxun Yang <jiaxun.yang@flygoat.com>; Markus=
 Armbruster <armbru@redhat.com>; Vince Del Vecchio <Vince.DelVecchio@mediat=
ek.com>
Subject: [PATCH] MAINTAINERS: Inherit from nanoMIPS

6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
(see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
ISA support in QEMU"), however today his email is bouncing:

  ** Message blocked **

  Your message to stefan.pejic@syrmia.com has been blocked. See technical d=
etails below for more information.

  The response from the remote server was:
  550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEU=
R03FT030.eop-EUR03.prod.protection.outlook.com]

To avoid unmaintained code, I feel forced to merge this code
back with the generic MIPS section.

Historical references:
- https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79=
@TY0PR03MB6797.apcprd03.prod.outlook.com/
- https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMB=
S62N2.mediatek.inc/

Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Signed-off-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
---
 MAINTAINERS | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e495e165..0ba3b589bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,16 +239,10 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: disas/mips.c
+F: disas/*mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/

-MIPS TCG CPUs (nanoMIPS ISA)
-M: Stefan Pejic <stefan.pejic@syrmia.com>
-S: Maintained
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
--
2.37.3


--_000_PAVPR03MB96784D39EC71F71C86ABAE81F8069PAVPR03MB9678eurp_
Content-Type: text/html; charset="iso-8859-9"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
9">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div><br>
<blockquote class=3D"userQuote" style=3D"border-left: 3px solid rgb(200, 20=
0, 200); padding-left: 1ex; margin-left: 0.8ex; color: rgb(102, 102, 102);"=
 itemscope=3D"" itemtype=3D"https://schemas.microsoft.com/QuotedText">
6 months ago Stefan Pejic stepped in as nanoMIPS maintainer<br>
(see commit a 8e0e23445a &quot;target/mips: Undeprecate nanoMIPS<br>
ISA support in QEMU&quot;), however today his email is bouncing:<br>
<br>
** Message blocked **<br>
<br>
Your message to stefan.pejic@syrmia.com has been blocked. See technical det=
ails below for more information.</blockquote>
<br>
</div>
</div>
Hi,
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Stefan is no longer working with us, but I wi=
ll be more than happy to take maintaining the nanoMIPS ISA on me!
</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Regards, </div>
Milica<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Philippe Mathieu-Daud=
=E9 &lt;philmd@linaro.org&gt;<br>
<b>Sent:</b> Sunday, October 30, 2022 11:50 PM<br>
<b>To:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Cc:</b> Philippe Mathieu-Daud=E9 &lt;philmd@linaro.org&gt;; Richard Hend=
erson &lt;richard.henderson@linaro.org&gt;; Milica Lazarevic &lt;Milica.Laz=
arevic@Syrmia.com&gt;; Thomas Huth &lt;thuth@redhat.com&gt;; Jiaxun Yang &l=
t;jiaxun.yang@flygoat.com&gt;; Markus Armbruster &lt;armbru@redhat.com&gt;;
 Vince Del Vecchio &lt;Vince.DelVecchio@mediatek.com&gt;<br>
<b>Subject:</b> [PATCH] MAINTAINERS: Inherit from nanoMIPS</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">6 months ago Stefan Pejic stepped in as nanoMIPS m=
aintainer<br>
(see commit a 8e0e23445a &quot;target/mips: Undeprecate nanoMIPS<br>
ISA support in QEMU&quot;), however today his email is bouncing:<br>
<br>
&nbsp; ** Message blocked **<br>
<br>
&nbsp; Your message to stefan.pejic@syrmia.com has been blocked. See techni=
cal details below for more information.<br>
<br>
&nbsp; The response from the remote server was:<br>
&nbsp; 550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [=
DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]<br>
<br>
To avoid unmaintained code, I feel forced to merge this code<br>
back with the generic MIPS section.<br>
<br>
Historical references:<br>
- <a href=3D"https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40=
114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com/">
https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79@T=
Y0PR03MB6797.apcprd03.prod.outlook.com/</a><br>
- <a href=3D"https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314=
d0008@MTKMBS62N2.mediatek.inc/">
https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMBS6=
2N2.mediatek.inc/</a><br>
<br>
Cc: Vince Del Vecchio &lt;Vince.DelVecchio@mediatek.com&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=E9 &lt;philmd@linaro.org&gt;<br>
---<br>
&nbsp;MAINTAINERS | 8 +-------<br>
&nbsp;1 file changed, 1 insertion(+), 7 deletions(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 32e495e165..0ba3b589bf 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -239,16 +239,10 @@ R: Jiaxun Yang &lt;jiaxun.yang@flygoat.com&gt;<br>
&nbsp;R: Aleksandar Rikalo &lt;aleksandar.rikalo@syrmia.com&gt;<br>
&nbsp;S: Odd Fixes<br>
&nbsp;F: target/mips/<br>
-F: disas/mips.c<br>
+F: disas/*mips.c<br>
&nbsp;F: docs/system/cpu-models-mips.rst.inc<br>
&nbsp;F: tests/tcg/mips/<br>
&nbsp;<br>
-MIPS TCG CPUs (nanoMIPS ISA)<br>
-M: Stefan Pejic &lt;stefan.pejic@syrmia.com&gt;<br>
-S: Maintained<br>
-F: disas/nanomips.*<br>
-F: target/mips/tcg/*nanomips*<br>
-<br>
&nbsp;NiosII TCG CPUs<br>
&nbsp;M: Chris Wulff &lt;crwulff@gmail.com&gt;<br>
&nbsp;M: Marek Vasut &lt;marex@denx.de&gt;<br>
-- <br>
2.37.3<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PAVPR03MB96784D39EC71F71C86ABAE81F8069PAVPR03MB9678eurp_--

