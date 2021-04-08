Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40BC4358B35
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 19:19:59 +0200 (CEST)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUYJy-0004rV-Bw
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 13:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lUYGy-0002ql-M5
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:16:52 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:11720 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1lUYGw-0001dI-6a
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 13:16:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8PPbedam3FD1o9+K4Ie/na0ezDmYehxvqT6q2mSFhoI8dgr0ZNxWzLyAyffoO5A9jiOcVWSbeSbHi2mv5zojjDf6XobPVoN5ni5JqHWQXQv/xa2CuvXI+RqLRwBYRBDvi/LmRXmZ7vWyHoafRckqdAj1YSGxAcOzsRpG53N0uZ6CEy28ehvAls/xrHME6MgkxjXBsz0jpz1SCkzNqR83x7g/R8Lwirdn3Ji2/blaTb1te4lVtBhCLnawYcXLfeBS6/YvCB/cdDeHxvEZ8wYHZ+WmnJ5jOjwi0Wo8l0Tlyg4ki311WFNdSiUItTzdQNTu+HGvdQrSoGPTHFORFlMpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQHaB9XimnegCtdKrv/l4IpZXyYRyPnSAKsVRzRl2ho=;
 b=fucWM2zYPIZY9e5tme9v1iYq2dWSKRj62cS9Dp4vXVlETIzLlwV/vSXD2qlMU+g7OvHiH8f5cuZACgfpFaWXghE3xNdDABSpppxur8Y/lLNKEYAWnmKGTubM+jSB4MkA3bGrnwf3vybNxxJBTrrREgqZoxUj8DjyOGniOIevKLWijbmpr5yVGtDeGHzAjaO0o6IfOCIonziWRp5qLjzGIW6LtDMktljK6VE1m/TrpoI0WxDesSPTtu7C17LZEKQv2epsqKX9FzqkilLUTEI9qWVgJK+eyHXtomlYJ0434V2UQ8OR6zjfnEhu5IE5Bo4bf2SeOW1a4WqwM+Ju+xNlSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQHaB9XimnegCtdKrv/l4IpZXyYRyPnSAKsVRzRl2ho=;
 b=cmn9S0ixBaZ33fZg3Zpj4ree+qmlRqe+ZgiPtGcQZzqvITZtaO1vxA7xI0qReuyaGpCXlzx4hQrcGEjch5wWdlH98UGrN9IGHR2I7zj9ach4dJm+d75+okOz8EGoGm1gJeQmZYdirnd3stekIqud/W7yVf6FE1W3Ttv9Gk8aeaA=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by AM9PR03MB7284.eurprd03.prod.outlook.com
 (2603:10a6:20b:271::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17; Thu, 8 Apr
 2021 17:01:42 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::78bc:f514:ba61:78bf%6]) with mapi id 15.20.3999.032; Thu, 8 Apr 2021
 17:01:42 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "f4bug@amsat.org"
 <f4bug@amsat.org>
Subject: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Topic: [PATCH v2] Revert "target/mips: Deprecate nanoMIPS ISA"
Thread-Index: AQHXLFVcDWm9FQ9LmUmRmYmlgVEYZaqq1qRY
Date: Thu, 8 Apr 2021 17:01:42 +0000
Message-ID: <VI1PR0302MB34862F042D9B1C72C7E4AD239C749@VI1PR0302MB3486.eurprd03.prod.outlook.com>
References: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
In-Reply-To: <20210408085810.10567-1-Filip.Vidojevic@Syrmia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [109.245.34.47]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 048a95e0-c012-450d-29e0-08d8faaffbb0
x-ms-traffictypediagnostic: AM9PR03MB7284:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM9PR03MB7284AB6387D6A3C4A2DEF6619C749@AM9PR03MB7284.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hshbGlp0jG9waEZPV9e1/KG9KSSVqiCpmliEZMiS6ZWQGiQYVZYQDbPoMbJmfgwBYcsTlvBF32FspSDuggrh6IjcgCvG5e5peuHlW+Ft79ea0OwFP1NzPdk4qfCz5f7KQoOdkJOD931cdMu0p0MZwQhjyUOQ0Gh3z3BCZ891EeWMEXK+Sqy+rpI46huni5F+vYGg9hfhKogFRjgrZv8sUgz3dkkZlueMnc89Zs8AjMLv+fD28uCq/kAkvcqnVldHPzK702VRtji5hntdKMTtZ+tX42bmN3UXUebvDp+pAuA2Y9ViwqpRpLQ37i1Ni/pivTAAYdMLMBk5eFX7SNmiCAXqb8w7NVAnXKUXiJVrJ7qJlUAptEEX/YY4qIY4GKpZrC2JW0FqQBA+WdzhGUwBWaTGJYtf4zep8A7KB/vABQiP3wM3agjjNpwbWO/m/uDiHzt1VpJAHVYW4B2BCHqa890IIrDxW8MtDqiyosavxIn4VbPhoFln8/hZOOIgIz3gseVkQh2k85kr+JH/EHzGPWEyTZfsUClb5Qad/8s9Rm09eswL2Bq5gDtlpcY8W1Og3y12cpDAzTn8/YWyXyFcojZyxhm6xzfbebVQLiThAJLaJcthdD6+k1g5EVDnALBzYS39gE8fPP0qolS+gZtYZ9C4xXeGWacosURTqJiiT5JcwBSfw023a7n4mbwSMcOXsjitxemoSncosPS5tCMa01FtFADG0TJ7yEQXwIPQEHY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(346002)(376002)(39830400003)(396003)(2906002)(52536014)(76116006)(33656002)(7696005)(66556008)(66476007)(64756008)(316002)(66946007)(54906003)(110136005)(66446008)(966005)(4326008)(6506007)(478600001)(107886003)(186003)(8936002)(21615005)(26005)(9686003)(38100700001)(71200400001)(55016002)(19627405001)(8676002)(166002)(83380400001)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?HFgNpDj1cD/LkLPyKab/hRAxA17c/RVwzNtl20MdUf6WGyo9u2EAV1vlX/?=
 =?iso-8859-1?Q?KO05xFUTznhrpWQLD+xc4TGMLQ1z3lbm1B2UQ9cKOrOKh+EZOjqAdWgu7f?=
 =?iso-8859-1?Q?yUnT0SHP+EyH6OjLT7U/DN8FfiJ1YowoYCl0ek4plrb5w211QjDFAHC99u?=
 =?iso-8859-1?Q?09PxKhv40oZ5JC+/wStyg+SmNPKACjQ2D6JWqcPQb9QkbvDgAK0OZG9sZb?=
 =?iso-8859-1?Q?SXXGBiDydsPcmzP0gjamrF4+bWamR96ExBW0v7me58gR/O9LpBnT6p7iMo?=
 =?iso-8859-1?Q?fQi3aHl3A3gdwEA6PedLANveXSDf8VCviNgwEwwjBn05sQx6zV05PzIK+V?=
 =?iso-8859-1?Q?hEhl8XKjkOH9P+sa01dx+tk6Fj0X0Jz6xgnbwotiOA/07PruM2d1Tz3iZK?=
 =?iso-8859-1?Q?ZKe2Z3DkFs70YzjYjqnv8/j6IBMFPb0m6eaOiwXNgRm5SShDY7uT39IrZE?=
 =?iso-8859-1?Q?RpoX4LoLkw/ScldNfxjQHgxp3uIpuwBzbqXdqRyvJFlBXR/2s4JELTgrkC?=
 =?iso-8859-1?Q?L9OYxbyXxfOhfKQRYaRuJrNrtQrAyViBZjb9IaPpGELuj3WlnEWlV5QKsU?=
 =?iso-8859-1?Q?WfkDA4drRvo+tZ5FBQPDkoXlu+6d9bVbg75gHcSVcpWODZ++cbt64dqJdD?=
 =?iso-8859-1?Q?tslZkdwGLi08mGOFsJUPVFNE3vwoDHeX/8BRc7DIpRWcAsVIxg8Aj5trc1?=
 =?iso-8859-1?Q?CI+17AUXZWxwlqvJfv8WDuK30NdKVRbeRVreKbRUFqVtb6ccOM6L8CWnuA?=
 =?iso-8859-1?Q?yY/dFKlw+GuBc2CbBA1A/XxdiHWR6LJaIj09n0T/h81yuiOhXbpvWunMFL?=
 =?iso-8859-1?Q?b/JMoOT6s7bBSYqRZzhc06U37dfK/bDDdoRdvYAbvACwVXq8VOaxxzsBxi?=
 =?iso-8859-1?Q?K7aWMfn5JO8UMFhczUExkBF/LHSwj5VR7JBrpEzl4PsVjY615m1oi64+rX?=
 =?iso-8859-1?Q?i8ivyYU3a0NNc60vF086kQXw8y+tRmrGQBqO+FocruNtJUXheax2OZgX0w?=
 =?iso-8859-1?Q?VEpyw1rdxxOszEoGFRLdVZ/L3s3JOShkdJtO+qKJhw3EJ68cDllRNlWM4W?=
 =?iso-8859-1?Q?YulXQ4LCGXLEaU4mZcv4FQ3/HZX4HWsVVnnYQ3d0WFYKNXy/3LPDmaCtEM?=
 =?iso-8859-1?Q?P8WCLU7JMtj+HpT847E9nFM8+rScyRPGjXmeul7cH0pcKon34/6uujjli3?=
 =?iso-8859-1?Q?FUfBZ9d31soBEo7aFVgKv4vNF4wOPOnv/vHN2X/1bxORDol63LeRq2OkK9?=
 =?iso-8859-1?Q?bYyFmmS+nvMRhnLFhUFBL9oMGbXJQSwr7rHrJUEdq8cUf717LSGtfEAcSO?=
 =?iso-8859-1?Q?MskStiQrTVN0vknIPrqAb6Z0MfUi0Yx7TboCTCz2lCmwt0o=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB34862F042D9B1C72C7E4AD239C749VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 048a95e0-c012-450d-29e0-08d8faaffbb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2021 17:01:42.0373 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qtWXEPznPa1wRm21vKGDcBtiatPROuTqYgiWG98Bc2fzefaAgcZt4oALs4JYEKCiaJoNwlPIyDTFo9Q4FoX3NEVmFEa5Z2tLBDWDAFp0klo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7284
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 "chenhuacai@kernel.org" <chenhuacai@kernel.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB34862F042D9B1C72C7E4AD239C749VI1PR0302MB3486_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

NanoMIPS ISA is supported again, since MediaTek is taking over
nanoMIPS toolchain development (confirmed at
https://www.spinics.net/linux/fedora/libvir/msg217107.html).

New release of the toolchain can be found at
(https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/releases/tag/nanoM=
IPS-2021.02-01).

Reverting deprecation of nanoMIPS ISA requires following changes:
    MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs
    deprecated.rst: remove nanoMIPS ISA from deprecated ISAs

Signed-off-by: Filip Vidojevic <Filip.Vidojevic@Syrmia.com>
Signed-off-by: Aleksandar Rikalo <Aleksandar.Rikalo@Syrmia.com>
---
 MAINTAINERS                |  4 ----
 docs/system/deprecated.rst | 20 --------------------
 2 files changed, 24 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 69003cdc3c..498dbf0ae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -254,10 +254,6 @@ F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
 K: ^Subject:.*(?i)mips

-MIPS TCG CPUs (nanoMIPS ISA)
-S: Orphan
-F: disas/nanomips.*
-
 Moxie TCG CPUs
 M: Anthony Green <green@moxielogic.com>
 S: Maintained
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 80cae86252..a25293cb01 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -228,13 +228,6 @@ to build binaries for it.
 ``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` CPU
 Models instead.

-MIPS ``I7200`` CPU Model (since 5.2)
-''''''''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 System emulator machines
 ------------------------

@@ -305,13 +298,6 @@ The ``ppc64abi32`` architecture has a number of issues=
 which regularly
 trip up our CI testing and is suspected to be quite broken. For that
 reason the maintainers strongly suspect no one actually uses it.

-MIPS ``I7200`` CPU (since 5.2)
-''''''''''''''''''''''''''''''
-
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
-(the ISA has never been upstreamed to a compiler toolchain). Therefore
-this CPU is also deprecated.
-
 Related binaries
 ----------------

@@ -378,9 +364,3 @@ resolve CPU model aliases before starting a virtual mac=
hine.

 Guest Emulator ISAs
 -------------------
-
-nanoMIPS ISA
-''''''''''''
-
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
-As it is hard to generate binaries for it, declare it deprecated.
--
2.25.1


--_000_VI1PR0302MB34862F042D9B1C72C7E4AD239C749VI1PR0302MB3486_
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
<div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">NanoMIPS ISA is supported again, since MediaTek is=
 taking over<br>
nanoMIPS toolchain development (confirmed at<br>
<a href=3D"https://www.spinics.net/linux/fedora/libvir/msg217107.html">http=
s://www.spinics.net/linux/fedora/libvir/msg217107.html</a>).<br>
<br>
New release of the toolchain can be found at<br>
(<a href=3D"https://github.com/MediaTek-Labs/nanomips-gnu-toolchain/release=
s/tag/nanoMIPS-2021.02-01">https://github.com/MediaTek-Labs/nanomips-gnu-to=
olchain/releases/tag/nanoMIPS-2021.02-01</a>).<br>
<br>
Reverting deprecation of nanoMIPS ISA requires following changes:<br>
&nbsp;&nbsp;&nbsp; MAINTAINERS: remove nanoMIPS ISA from orphaned ISAs<br>
&nbsp;&nbsp;&nbsp; deprecated.rst: remove nanoMIPS ISA from deprecated ISAs=
</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText"><font size=3D"2"><span style=3D"font-size:11pt">Si=
gned-off-by: Filip Vidojevic &lt;Filip.Vidojevic@Syrmia.com&gt;</span></fon=
t><br>
</div>
<div class=3D"PlainText">Signed-off-by: Aleksandar Rikalo &lt;Aleksandar.Ri=
kalo@Syrmia.com&gt;</div>
<div class=3D"PlainText">---<br>
&nbsp;MAINTAINERS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 ----<br>
&nbsp;docs/system/deprecated.rst | 20 --------------------<br>
&nbsp;2 files changed, 24 deletions(-)<br>
<br>
diff --git a/MAINTAINERS b/MAINTAINERS<br>
index 69003cdc3c..498dbf0ae4 100644<br>
--- a/MAINTAINERS<br>
+++ b/MAINTAINERS<br>
@@ -254,10 +254,6 @@ F: include/hw/timer/mips_gictimer.h<br>
&nbsp;F: tests/tcg/mips/<br>
&nbsp;K: ^Subject:.*(?i)mips<br>
&nbsp;<br>
-MIPS TCG CPUs (nanoMIPS ISA)<br>
-S: Orphan<br>
-F: disas/nanomips.*<br>
-<br>
&nbsp;Moxie TCG CPUs<br>
&nbsp;M: Anthony Green &lt;green@moxielogic.com&gt;<br>
&nbsp;S: Maintained<br>
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst<br>
index 80cae86252..a25293cb01 100644<br>
--- a/docs/system/deprecated.rst<br>
+++ b/docs/system/deprecated.rst<br>
@@ -228,13 +228,6 @@ to build binaries for it.<br>
&nbsp;``Icelake-Client`` CPU Models are deprecated. Use ``Icelake-Server`` =
CPU<br>
&nbsp;Models instead.<br>
&nbsp;<br>
-MIPS ``I7200`` CPU Model (since 5.2)<br>
-''''''''''''''''''''''''''''''''''''<br>
-<br>
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated<br=
>
-(the ISA has never been upstreamed to a compiler toolchain). Therefore<br>
-this CPU is also deprecated.<br>
-<br>
&nbsp;System emulator machines<br>
&nbsp;------------------------<br>
&nbsp;<br>
@@ -305,13 +298,6 @@ The ``ppc64abi32`` architecture has a number of issues=
 which regularly<br>
&nbsp;trip up our CI testing and is suspected to be quite broken. For that<=
br>
&nbsp;reason the maintainers strongly suspect no one actually uses it.<br>
&nbsp;<br>
-MIPS ``I7200`` CPU (since 5.2)<br>
-''''''''''''''''''''''''''''''<br>
-<br>
-The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated<br=
>
-(the ISA has never been upstreamed to a compiler toolchain). Therefore<br>
-this CPU is also deprecated.<br>
-<br>
&nbsp;Related binaries<br>
&nbsp;----------------<br>
&nbsp;<br>
@@ -378,9 +364,3 @@ resolve CPU model aliases before starting a virtual mac=
hine.<br>
&nbsp;<br>
&nbsp;Guest Emulator ISAs<br>
&nbsp;-------------------<br>
-<br>
-nanoMIPS ISA<br>
-''''''''''''<br>
-<br>
-The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.<=
br>
-As it is hard to generate binaries for it, declare it deprecated.<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_VI1PR0302MB34862F042D9B1C72C7E4AD239C749VI1PR0302MB3486_--

