Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C53A36ED5EE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 22:11:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pr2WR-0005Uz-Is; Mon, 24 Apr 2023 16:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vicst257@student.liu.se>)
 id 1pqxvG-0001Vh-PD
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:16:11 -0400
Received: from mail-swedencentralazon11021016.outbound.protection.outlook.com
 ([52.101.81.16] helo=GVZP280CU001.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vicst257@student.liu.se>)
 id 1pqxvD-0004bp-8B
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 11:16:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqsBnm1JlVx+dTp6YzZrTAFlgWP92VFLa8kBx+PIvpWqFFrkvTtUFWLl0i7t3Tg1ZVIJmC/ISzWRL1j1YBbiG1WEQERmYENkMKvFy8/1vg/d5dgiFUM9kBT/sMxq1iDhP9IvLKpKfmawXnmUC5sm1R2cW7ppei0Ow7o+JrV3KKS+L6kytMJJLWR+lIqzqDcFSVYfMIZAxhYKGbliBicLa2raF5ivGoJR4/Ma9IpquBaUOtSaKGUxcBMOqKSzieh78T7HbS/dKWgzLb49S+Sv+IOfQi8IY1hH5IdQirQjNjnMAnyOsID7y0EHzj17xLn7yMA2yBCyd2xTVIsfJtarXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W7qU1FgQrQ5kzPubVbdNzCI07uRh07sQ1PxChO31qYg=;
 b=iAKhdxXnRdxVBkCUUceF8e09im/+GM4GNVjYKpwY3SgO5iNsEdeoe5MwPWf7SalbfyavTCkfRllN1tkQecV5YO9wbU99GUyrXcu4YlYGKFW5uYvwixTgUm5I/SgoT3ffIFDDJcyoCZdA8YLGODGv8nJt2YRY+XCbQr67yrEV5jNPqIYvkSG1D9BNm7KhEm5eChjL+/pe1dh2DAcpofLhZcBZBY1AAicLngf7oMgbd1q4N7QfiAYv2m4emaV+eAkjLsn12yX79UJy9gkCINGKYRBrA/31/twPlO4nJTTJwgEY8EVjEf4HKonJMCPivk/2liFcO2aE8tUPgZF0rxC9WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=student.liu.se; dmarc=pass action=none
 header.from=student.liu.se; dkim=pass header.d=student.liu.se; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.liu.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W7qU1FgQrQ5kzPubVbdNzCI07uRh07sQ1PxChO31qYg=;
 b=XLtANSXT7wl0bqpvgTRnPqWZrdmKVZVoMEFd1cPJv6OAgO9E1SKYb7oJuu6uMFjYgG3ayIa19JHdl99sAgdTXMWwDaqT08Z7c21r0MkoNnLBQcJLH9/n8o72fWnGg89wFVPMYGPsyVSR6H8UXgojTw0U7Saq/ErafpFOej+zBabyDsN7fbCFVd7GYFsNrz9S1veS0Xy2TbXzTElfXWcsrVcuuMO/B710+89TTVkVI8LQ56nFp0rd8gk4ejBNbugT/gaWDXHer2sKG4HzP0meZR4Cg17ferGsGbjf1H4A7MG0X1FBZ61kBT8WatowxDvBhdPVc4sqGfSGLHHIIMm53Q==
Received: from GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:30::21)
 by GV3P280MB0833.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:ef::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Mon, 24 Apr
 2023 15:11:00 +0000
Received: from GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM
 ([fe80::7a3e:51d9:8687:fe35]) by GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM
 ([fe80::7a3e:51d9:8687:fe35%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 15:11:00 +0000
From: =?iso-8859-1?Q?Victoria_Str=E5berg?= <vicst257@student.liu.se>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Ubuntu 22.04 - ARM Rock4SE
Thread-Topic: Ubuntu 22.04 - ARM Rock4SE
Thread-Index: AQHZdr42CAkxTExF+0+KTYeAeLWbiQ==
Date: Mon, 24 Apr 2023 15:11:00 +0000
Message-ID: <GVYP280MB060565ED4AB9B1F53855EA99BE679@GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM>
Accept-Language: sv-SE, en-US
Content-Language: sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=student.liu.se;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVYP280MB0605:EE_|GV3P280MB0833:EE_
x-ms-office365-filtering-correlation-id: f11cd2b4-ed0b-4b3c-fe4d-08db44d61d20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: icGtgbEc4rSZUmmknBIp8lu2m0hxVtky3qQQhF5BD7Vi0Tt6O+qdJz9LGlX99cBwePJLNz5z/9DQxlGRAWJ8cSDib6/ivpeRqA0R67dTFQ/HSbpR3WwYDvQc2Vjw6PAn9FhPOjGZiNoUO49M5Tu88T//BzYZFnmh6s4pSIajHD/j2W1E9TTXozEptDMJDr3gYxBkhzy5nhlj/TJ3sFqxqYROJ5A/QglNl7YwPD7v8pwC9av4DxNofnvYupkY/Zf5Awr+tPz89VR/HmTQD4QNggbFE9/fzR8m33NUd+7RmxbvmzZOfZY1tdr1rHv9bJAcQcTtz5NeC1WdecZ+CCjXL2T6dR/As00go2xlTtknJCM8vW42FXAeJee7j805UzD6PxkMK+90SDQ84/C3CQYzBDleWVtkOkVlAmSxuwNYm5iIwr6U3ZLXTQ90MXZ5e3btC9seVq4f75CkE4yImPd+kFY9w0Mg0AxyVfieV27DSkO2YArmImPKd1rJtgIDWCISB/tBb3TYGM6QqysDtgl+1+fGSgqR+Ey/OWFSBNN5+o0WAAC9dR3W1eJzKY+CtO21KMi41QeudRuR2IPA7q2vdUpsquybDv3Yq+OB4Zv+qMgqhNGCEgsCk7GiTSwhb9kb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(451199021)(966005)(186003)(9686003)(26005)(6506007)(19627405001)(122000001)(38100700002)(41300700001)(7696005)(71200400001)(478600001)(66556008)(6916009)(55016003)(786003)(41320700001)(166002)(66946007)(76116006)(66446008)(66476007)(316002)(64756008)(8936002)(5660300002)(52536014)(86362001)(33656002)(4744005)(2906002)(8676002)(38070700005)(32563001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A+0W+yLogemsbJkbwm7ex10TciZGz7M/ZUHXVXqs5QQofcdtpkTig+8t1Z?=
 =?iso-8859-1?Q?ARI5YCriLa1AVFOYEzyLUgKIt/HTCIX/+I3WrArkNY4rLTRQiqP/zTA3Wt?=
 =?iso-8859-1?Q?nNI0vrCEcutYgWxXshic6aD7fXBX6pdtY9Mey4o0WLIDxYw5GthLuJx6dY?=
 =?iso-8859-1?Q?+5fiIpAZmDKMudKtTmy5+m/v/7V3RH9zCVF3HnCda40LT692xY5sMrz/ml?=
 =?iso-8859-1?Q?BSWIkwOWapNKCNMxS11un5q+8CUFXKGqtTLB8O/NmIKVW/UmkCf8/OuGg9?=
 =?iso-8859-1?Q?m3eI1FdEM76d/HhCZ6fhqkRUVwYUNglP/Ovh7Xcxf6OwxnRD2tm+kc3qNT?=
 =?iso-8859-1?Q?asl7I64igZGUxGGOeoLLjnFq23lomWf6DrWmrRmZ0xiVeV6iU+E728vPIx?=
 =?iso-8859-1?Q?BRYoJuBgPRhPYiGLid1qH3cvpztGeKX2InZKSdirjvGAJ1IwLq47w1clL8?=
 =?iso-8859-1?Q?E3eEPqCirv4+w76lbpnBJzbfJfHX/m44VHmJxalNHJKgxDUtNdnAWQwp9X?=
 =?iso-8859-1?Q?kfPraOAOEUCAasD7eTMkmwF+/FXwZjgrmk+qTi61yTdrJjwp+UwnPDKjOz?=
 =?iso-8859-1?Q?2mXKT6Z5i733rlS1xTWLJfoVw5YWjf6VUNwTDjJXtxrLzy+DTLjnMYNMgg?=
 =?iso-8859-1?Q?WY9FXzZ0NnxT1qkah/CgfXzmV4xnjLmTrd4xKE4YxwHoswWtbo7HtFBSf4?=
 =?iso-8859-1?Q?5rXpFEt7tU/Q8OYXtbc2aGjpGpA0vbCtky8KfRoSuhMHo5F3U55kZ5Wlif?=
 =?iso-8859-1?Q?98ybECWYZaTeyzoJI/svvxjBZTIp8xk3VsSDLa3U9LLPT2JXdCiQVo0UZV?=
 =?iso-8859-1?Q?AsQIuq2rdsrNVy6fzykZ4lOuzrvWTprLK8XYofAtvOdiaZ6A14qDjtO9+9?=
 =?iso-8859-1?Q?ZfpSviuqTYBZRoCIyGlc/7pNYJJ5ZbTSTEo6PsrxJVFabsSCyHjrYzIV4o?=
 =?iso-8859-1?Q?24IgVZVnU3yhgqnQJn2atYTA9JiMrdHqjlXBS0eanHsf5FMdfLaT+tQ9+M?=
 =?iso-8859-1?Q?27FGVfKzjRDbnwuPapR9uXXiw63y/08ZIguYRJJZmxZx+chZbnGCUpJ74K?=
 =?iso-8859-1?Q?VrVtlutW4w5Sko9CU3JMPySlg17WWLwZ+JyKDxZW0Jrcx0oLPfyUsOtonh?=
 =?iso-8859-1?Q?gT2Nx8loLL1uLQGY20hE8kojvztpgzUcJpZvZgF6UoBwlNrte4EcMTjQT3?=
 =?iso-8859-1?Q?JlQi5doJNEoWA79d6MdrUdOFHaT6S/+A6q6jgG/M+/NWW47KZmr5ieeg0M?=
 =?iso-8859-1?Q?x4csl8fLd5domt+fpLmi3eYMhDqxsiY/jcsFKKxb49d58esKFw5NE+A+bV?=
 =?iso-8859-1?Q?qwKVEeEgrRmJ1AKwXKiya7SE4ggYdMY9VyDeQ5UKBAt+tCMm5F6+xpHNDH?=
 =?iso-8859-1?Q?qG0C1UPHVPRHZOXrPr3s0v5+Vnr5W9jkYgSdjxg+cLTy2XdeEjaoA6IikM?=
 =?iso-8859-1?Q?2YWl384ArJC/Z+V3eUFlgAGUR17n0mU1RtkL4jGrEfb3P+OUtKNJaw0ERx?=
 =?iso-8859-1?Q?qMlBI/mRsf9dDDxombVvsQYyTFTPHgyrfiwj2ue9e0Rbey19U8hvEz0nNS?=
 =?iso-8859-1?Q?W5I39OK2D0uopKC7yP+PZTC6vj7EICVpLe99vFmnnmLAMqamgk0zmTiM4S?=
 =?iso-8859-1?Q?BELFC8BamaED7LT8HRSlIpI01Bw4sRYGt6?=
Content-Type: multipart/alternative;
 boundary="_000_GVYP280MB060565ED4AB9B1F53855EA99BE679GVYP280MB0605SWEP_"
MIME-Version: 1.0
X-OriginatorOrg: student.liu.se
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GVYP280MB0605.SWEP280.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f11cd2b4-ed0b-4b3c-fe4d-08db44d61d20
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 15:11:00.5258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 913f18ec-7f26-4c5f-a816-784fe9a58edd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9Uh75b4k/R4kL4UZNfAwqUOldMW3D6M0vuccgS1a3rtXaRJfGF9rIuUNrFbesHN8xILotsctoO+ki3JOzqMOAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV3P280MB0833
Received-SPF: pass client-ip=52.101.81.16;
 envelope-from=vicst257@student.liu.se;
 helo=GVZP280CU001.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 24 Apr 2023 16:10:49 -0400
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

--_000_GVYP280MB060565ED4AB9B1F53855EA99BE679GVYP280MB0605SWEP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

Im working with an ARM machine (Rock 4 SE, Radxa https://wiki.radxa.com/Roc=
k4/se) and it has Ubuntu 22.04, Linux 4.4. I want to install Qemu on my mac=
hine to get an Intel processor.

Im trying to follow your Linux start up guide:  https://wiki.qemu.org/Hosts=
/Linux#Running_QEMU_on_Linux. How should I solve my problem? Im new to this=
.

Thanks in advance!

Regards, Victoria


--_000_GVYP280MB060565ED4AB9B1F53855EA99BE679GVYP280MB0605SWEP_
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
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi!&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
Im working with an ARM machine (Rock 4 SE, Radxa <a href=3D"https://wiki.ra=
dxa.com/Rock4/se" id=3D"LPlnk281473">
https://wiki.radxa.com/Rock4/se</a>) and it has Ubuntu 22.04, Linux 4.4. I =
want to install Qemu on my machine to get an Intel processor.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Im trying to follow your Linux start up guide: &nbsp;<a href=3D"https://wik=
i.qemu.org/Hosts/Linux#Running_QEMU_on_Linux" id=3D"LPlnk495680">https://wi=
ki.qemu.org/Hosts/Linux#Running_QEMU_on_Linux</a>. How should I solve my pr=
oblem? Im new to this.&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Thanks in advance!&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Regards, Victoria&nbsp;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
</body>
</html>

--_000_GVYP280MB060565ED4AB9B1F53855EA99BE679GVYP280MB0605SWEP_--

