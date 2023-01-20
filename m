Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7742676027
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 23:25:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIzo5-0008CQ-UU; Fri, 20 Jan 2023 17:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIygE-0007xD-Hq
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 16:12:10 -0500
Received: from mail-be0deu01on20624.outbound.protection.outlook.com
 ([2a01:111:f400:7e23::624]
 helo=DEU01-BE0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Bernhard.Kauer@incari.com>)
 id 1pIygC-0003AC-5y
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 16:12:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPHa6Nr+i1bnqL+cMqnz+fnFWVHi+uwpSjnzq+Hq+SsQsZIYh4wm8PmtKkkC214M3hOEKonP7Op3ILlbh0hxOOk2XAION5gs2+Kbz0JCdLGog6fchhT0ihbHeeuocl2Qpre0HMINnQaE8olpqfUbCf5ur+1rl7s7lZdsWmrB1czrnGmqmSSshFeSmooMhCBCP15/gQjtVveL9qPjugk1LdW7Ag3zzZJ0Z09VFICpHjJ4l1sMJg53dHERVZb8Yp1qc4SAL9sIupJrT6pnnsUg94Gg2OfwEIXt60s7S8ttN68dmh8V93z+OtHaO01G/BpQtuRXNgOxhzXvBe2JxoFOxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWswT/wgOJG9kw0BajJaOhaavNw80k3tzJFloqHbkY4=;
 b=cgjA7dL5XWEfsdji4KQ6FPnRT4yllDSftHv/cY4mdMIetUZjMiqV8Zq9w32Xd9Q/DI3/2ExLt8/q9jRVARMDUG9RqAfc2uJO+V3SDw3h+5TQgVJxztdB9kM2JQ22RafsLp3WEx6ayUDWozQ8kpGq+fLk0hXb+Hil8Sjn/buThKRumrRETo2gPAya29KDZyjvpobbhuqptoIfrcAMy7UjM8WKOMT6TilKt0N9tGJrqs4wEXw35MsofWCPhnfKx33HxmYJSLMi2A8vcxdukK1ATR6YO51WhDbJKTicX6aBs6yNdqUT1ZLVCHuaKgMru8AwXn6/Cl0XdMbygPM9G0M+KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=incari.com; dmarc=pass action=none header.from=incari.com;
 dkim=pass header.d=incari.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=incari.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWswT/wgOJG9kw0BajJaOhaavNw80k3tzJFloqHbkY4=;
 b=yyt/hJSh2dhemlNisSGx5Rxczt8JtbHU0WAjbFKxrgOYNd44Etg4abu1oypnpLjQ88dhDs+KwR26cpDManmMNaaxcc9UI1/tF1KLOmCCkTS5CDNIxhzAIWIOSNEbowbXGcNkkC17XE+N6zoVT8jzAfRDX/Kkqwn611b3I6bB8SkJ36UJbBME2DgI6OWY5E5zh/fw9w9G9XMYGF/XP8PeK6sPCfvdDZ6rE3oswRdwTjdijKo1xJSVf1UokAbiTp0uQRMUSVwff8MnYiJ9o/+G297W1SZeIfbYyo4AEJrjra2DRJa0oRNFKDdMd362xouZ6FIQIzSo2CU1lORoPHnLKg==
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:2e::6) by
 FR0P281MB2923.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:56::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.27; Fri, 20 Jan 2023 21:06:59 +0000
Received: from BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040]) by BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
 ([fe80::69f4:1511:acf4:d040%3]) with mapi id 15.20.6002.027; Fri, 20 Jan 2023
 21:06:59 +0000
From: Bernhard Kauer <Bernhard.Kauer@incari.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] target/i386: translate GPA to HPA even in unpaged mode
Thread-Topic: [PATCH] target/i386: translate GPA to HPA even in unpaged mode
Thread-Index: AQHZLRJLH8uL69hnX0iDYloHfXAGOw==
Date: Fri, 20 Jan 2023 21:06:59 +0000
Message-ID: <BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59@BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=incari.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2965:EE_|FR0P281MB2923:EE_
x-ms-office365-filtering-correlation-id: 63e3541d-f6d4-46ba-b144-08dafb2a4520
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Rmul44L/7XMB33MNURJvVsIahexe8gHsS5Gu4UKN9OZOGaa1HfoLY+sIk6T0A2EIHFBHOYNbIaUQ6PbojnXvymeh5bmCC7fysH0HY6PApUsJV2105Y+6+PBg9192BGY0aHwx2CD0jYI0+GepgGc+RjeKbx9U+I2UgQI13lb+VpZjv0OcoGJ1h93Sbsb0/G1ahY50Dg3ygkVEFKoTCzDIZ+SUEIBOie4L/yCAFodseubaiw9zTHDVymjlVkOVvcQkoNqqLLR7G0HQ15JXpTd5Tnk4My3oUXuzmYj4l4coTQHo3LSrBC3kByAf5RXoehbBtOE1TA0pGWv+YGz4waWXlugPIIuV7yUFdo8NVe4cGHKXRiXBbXqMJ00FvlfUBR/5LpYWHdsdNBzeCzJJf+ltxfRrG9B9edHo7t1p7+OfKMG9qLeASjB6zjMr84F45ku5U+3xMawzrJnow4gcY/0nSzj5b9yCnns2GGGC5nGCZ+FwJa5b011B8dy5iNfWkA4neJSv49GCbNCtjmivbT3qaP8NO+HeyDWEDhdvxgkgqvwzrE9yrfyxYZLz4xAKfc/t4NebZzpnif1dVPJD7JnvW0qeULPe0vHn3p9Ot8k0wXYfWdLPoMwpKcAsHxUz/SMjjyPyb5yyHDlQG5qSZsL+cnpjB4yN/OVrVJlFQ1A8azXCpdFDrm52e0A6ztz9gxaJQQcDtyw0KnrsPLK8DrUGKw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(136003)(376002)(366004)(396003)(39840400004)(451199015)(122000001)(52536014)(86362001)(8936002)(186003)(5660300002)(71200400001)(2906002)(33656002)(66446008)(66556008)(76116006)(6506007)(66946007)(4326008)(64756008)(8676002)(38070700005)(6916009)(66476007)(316002)(478600001)(38100700002)(7696005)(4744005)(19627405001)(83380400001)(9686003)(41300700001)(55016003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HU8Uyf05WqvzLu11o50qUUFTPPy65FJhdDqaO+svpmNeM02cr8IIpLJgDa?=
 =?iso-8859-1?Q?Xj8Q/STWdVv+r+NRVx43xymtscb+ElsOW2LkhEELQiZqvYnz2va1RTQoFo?=
 =?iso-8859-1?Q?iHHhGlo0kpkigVe9CAaE9aQcv2qsZSnPRt+SR2ds4utMQd1Fy706dQCBtV?=
 =?iso-8859-1?Q?rDfVSi3FhHRvcGL2/ld+xtxamxoKH8o7Y7r0QgnE04fWWc7/zXl1l+PY+w?=
 =?iso-8859-1?Q?lS10gh4BVzqbpX+ZSgl410JDxd+ZOr+l9rwkSWirvRVmyiEOgpg4ZCIQ7u?=
 =?iso-8859-1?Q?Jj+CWPPfZm2+WKPdPz0XdOCqvUN4bOPRJtVdqJT+Bs2sR2YgZRke4B5xf6?=
 =?iso-8859-1?Q?/i6E1I41km2/pJGX2i/cyAJkVJl5i+BfIuMX6TgIDFs1QBKGwc2x0SO0a6?=
 =?iso-8859-1?Q?XOSzaCKpT3xrhiaXHFC0oF38w77umeOIOSkHw++I3MdPiR9ntZoGsmltS7?=
 =?iso-8859-1?Q?xN/7V94i6J6o08csIttin2cORwdnmR/dF2HxCDu6aiTNmMwzyBiO/ZzApg?=
 =?iso-8859-1?Q?cJ5Z+A/0iads9nK+e9X56y+hLXam0t/p8hoXhddIksVzXIuWdRgj/1iqK4?=
 =?iso-8859-1?Q?hAs15x925biVdKekYkqQvo44ctK905ne7C2sqIHe6kXfzcA/yoPuVrayl5?=
 =?iso-8859-1?Q?tqhpPBKBXKmKZZOabuTk7pyzEUeBwrffM3UOQ5KRaoTVAIuwng1oXR8/+t?=
 =?iso-8859-1?Q?vditIlXGBj4NnDWB6pvnAt053SgAx/dJmn40m0MN0feNBul5fpG5TyIRwA?=
 =?iso-8859-1?Q?3QgyxGfXQQKlFu2LrG60Ic6NLQqSJBJWc4R6PDCyl81k7Rk86Ipt00iwgp?=
 =?iso-8859-1?Q?zHSpAtU+yRrb1ECeY15qTDnEBRcLMR/EHcfkMQY8MWBlgqrsr4MpUoPuh1?=
 =?iso-8859-1?Q?l5EYFkj2TYS3yGLzTeBTb6HHRgc6moA5cfIHoSfZNq37gQM1NyAsCJwNKd?=
 =?iso-8859-1?Q?TB4gv/tsXGQMzsTJg8hHZwr0MVHoFPK5xjmYrGMfzl96jtMrw5X7+6/RrP?=
 =?iso-8859-1?Q?58QRiuwuZlCVmI0SH/fuj0J2TmyA3o2Oslg0+VjjrQjR40TT4x/Qoh46Eq?=
 =?iso-8859-1?Q?Bh8YaQThAj8bUOGjViSzhi+KWHoh7qSm5r2t1czOP2YwnKItLnV6FuviLz?=
 =?iso-8859-1?Q?2Q/MP5HK72WaRH7w7IcOpCr8/G54RsPf9va4OG2uMDD4uxcXYRJbW7jr9N?=
 =?iso-8859-1?Q?3VoUQ9lKI7VLjrMDRmATD3f08rArtaTVt9fZODxxkTwCi2nrBz0/NOkydp?=
 =?iso-8859-1?Q?r6EAnOs1bDlzXhsH7vt7oVeadAMRDBPQSgRkDCc8F+LJjOoUYQwJJazlRr?=
 =?iso-8859-1?Q?cJIl9JL1dFW9fIoGze8wKBFSTVtpjuVj6bMQdQrbIiZAYPlCbAQ0QecrkG?=
 =?iso-8859-1?Q?a0INYSXiTRDmQrYO0IOEIFRdW5sAydEWxIC0lcw42HM7mRNCI65iDkgm9u?=
 =?iso-8859-1?Q?EymTwHTN0toWf3mZN2FTb2LpHcGnUXVqacTYN1H+AkGU2uAjlI9ok4w+ff?=
 =?iso-8859-1?Q?CHDGERXRh9O/Jnt6KtQfjer6Mn8qfOcFfkRJ6AZ89zB5aDKE71e8HBXs8z?=
 =?iso-8859-1?Q?XtzbeM6SpSi2lGLF/8b7bHktfQdx3iRjqNdtrBvMdK8FlV3dvgbwVwnz8i?=
 =?iso-8859-1?Q?EJL4/wTyb6D/LkyaytVXNit75tWNb0+uRidBwyBagx4OKW1r/q2ACcjow/?=
 =?iso-8859-1?Q?4y0jsJDC+0TI68R/1If2FcICrs66XVDLCYx9OgS4?=
Content-Type: multipart/alternative;
 boundary="_000_BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59BEZP281MB2965DEUP_"
MIME-Version: 1.0
X-OriginatorOrg: incari.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2965.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e3541d-f6d4-46ba-b144-08dafb2a4520
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 21:06:59.3157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a46cb45d-70c3-46b7-b011-a63d6a9c3c2c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JjvWNWA0wCjBrdNmen+IciYsMvqNe1L3W+dGOl9YZN2PSvWb0x5kJP707/t5tGFwvcwfYa4F9s3AznG31gA6p2hx4zDLca48GeJPlzzkQCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR0P281MB2923
Received-SPF: pass client-ip=2a01:111:f400:7e23::624;
 envelope-from=Bernhard.Kauer@incari.com;
 helo=DEU01-BE0-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 20 Jan 2023 17:24:19 -0500
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

--_000_BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59BEZP281MB2965DEUP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Guest to host page translation is missing if the guest runs in unpaged mode=
.
See last sentence in AMD SDM rev 3.40 section 15.25.5.

Signed-off-by: Bernhard Kauer <bernhard.kauer@incari.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/=
excp_helper.c
index 55bd1194d3..8d9152245b 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -576,6 +576,9 @@ static bool get_physical_address(CPUX86State *env, vadd=
r addr,
             }
             return mmu_translate(env, &in, out, err);
         }
+        if (use_stage2) {
+            return get_physical_address(env, addr, access_type, MMU_NESTED=
_IDX, out, err);
+        }
         break;
     }



--_000_BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59BEZP281MB2965DEUP_
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
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof ContentPasted0">
<div class=3D"elementToProof">Guest to host page translation is missing if =
the guest runs in unpaged mode.</div>
<div class=3D"elementToProof">See last sentence in AMD SDM rev 3.40 section=
 15.25.5.</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">Signed-off-by: Bernhard Kauer &lt;bernhard.ka=
uer@incari.com&gt;</div>
<div class=3D"ContentPasted0">---</div>
<div class=3D"ContentPasted0">&nbsp;target/i386/tcg/sysemu/excp_helper.c | =
3 +++</div>
<div class=3D"ContentPasted0">&nbsp;1 file changed, 3 insertions(+)</div>
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">diff --git a/target/i386/tcg/sysemu/excp_help=
er.c b/target/i386/tcg/sysemu/excp_helper.c</div>
<div class=3D"ContentPasted0">index 55bd1194d3..8d9152245b 100644</div>
<div class=3D"ContentPasted0">--- a/target/i386/tcg/sysemu/excp_helper.c</d=
iv>
<div class=3D"ContentPasted0">+++ b/target/i386/tcg/sysemu/excp_helper.c</d=
iv>
<div class=3D"ContentPasted0">@@ -576,6 +576,9 @@ static bool get_physical_=
address(CPUX86State *env, vaddr addr,</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;}</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp;return mmu_translate(env, &amp;in, out, err);</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;if (use_stage2) =
{</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;re=
turn get_physical_address(env, addr, access_type, MMU_NESTED_IDX, out, err)=
;</div>
<div class=3D"ContentPasted0">+ &nbsp; &nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;break;</div=
>
<div class=3D"ContentPasted0">&nbsp; &nbsp; &nbsp;}</div>
<div class=3D"ContentPasted0">&nbsp;</div>
<br>
</div>
</body>
</html>

--_000_BEZP281MB2965EA2D8C69925DEFD4B6C8E9C59BEZP281MB2965DEUP_--

