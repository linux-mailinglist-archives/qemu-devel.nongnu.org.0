Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 714172DCBD9
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 06:16:09 +0100 (CET)
Received: from localhost ([::1]:50830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kple3-000216-Uy
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 00:16:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1kplcS-0001Y3-Dm
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 00:14:28 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:14353)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>) id 1kplcQ-0001od-5x
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 00:14:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1608182066; x=1639718066;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=S3y5wd37NSxNcpuwsfrmYbyn5NCWtkIH5rW1ptcb2rY=;
 b=IlzvP+OTELv9vE3ktS7KbxdnNflmYPiATigZI1+PlDYrn+F0UzTBdVPd
 xJ0zBKsqYc4+4MZKv0oWJoz0F2+Y+BdIXEgffFpnIIwvQ5+2KrbV6sVRV
 dP69VqlE273+7gwrgay+UhvVFF0yq67/lEptLWF0wPSBD15SJPCoqAyY/ 8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 16 Dec 2020 21:14:21 -0800
X-QCInternal: smtphost
Received: from nasanexm03h.na.qualcomm.com ([10.85.0.50])
 by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA;
 16 Dec 2020 21:14:21 -0800
Received: from nasanexm03d.na.qualcomm.com (10.85.0.91) by
 nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 21:14:21 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03d.na.qualcomm.com (10.85.0.91) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 16 Dec 2020 21:14:21 -0800
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Thu, 17 Dec
 2020 05:14:20 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ed53:56ff:9bca:3dfc]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::ed53:56ff:9bca:3dfc%3]) with mapi id 15.20.3654.025; Thu, 17 Dec 2020
 05:14:20 +0000
From: Brian Cain <bcain@quicinc.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: hexagon sysemu - library loading path feature
Thread-Topic: hexagon sysemu - library loading path feature
Thread-Index: AdbTNi4vj0rhn2a/S826SggvjRM06g==
Date: Thu, 17 Dec 2020 05:14:20 +0000
Message-ID: <SN6PR02MB420590EF08DD9FFA5DC81EB6B8C60@SN6PR02MB4205.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [104.54.226.75]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f30898f7-b636-48bc-8ae0-08d8a24a9c08
x-ms-traffictypediagnostic: SN6PR02MB4205:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4205BF6F65253698CE106EEAB8C40@SN6PR02MB4205.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ri2CXKfPyYBBHZyXl4/OqPMLIi21zdQV/cHQ4OjpIxj0kr4f8WAyuohnN1t/JesBw1Rgcqz2oPKavDJLFY3YWoeQ/qLaQjmScQKNkS/TjnVyDhlRk4ZuGOE44695YQL1iK8uXfwUDgt5BvqvzIaVpjax/cUng6LU1qcPcmY8xYLQo2+97hU2AtNnwNSx3WwirbBEb+M2Wseepm1RKtjrlygoayMhqhqcIMHcjWFj912utzb4uiQXr9G1xYei+Bf9+a5zUhIAG6ks0b9G6LJlCvqu+XcJGgeZePrQftvtrwwgaggrEaEmP0eFsPkZVc0NKNFR+2MnwVHzXJHdFMFgtA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(186003)(6916009)(4326008)(86362001)(7696005)(107886003)(64756008)(5660300002)(66476007)(8676002)(83380400001)(66446008)(52536014)(6506007)(66556008)(71200400001)(76116006)(9686003)(66946007)(33656002)(8936002)(54906003)(55016002)(316002)(26005)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?Windows-1252?Q?vQpOJMmcNLsxEUq5XSs0MIXVBnkLH+iQjMV2t5TKk9n/Me0aI4w3DXYd?=
 =?Windows-1252?Q?WpBOEzNBh05yxbv26hmT38+w4QFF2JqGvL+bpUN9q30sSUuAQBDu4ltB?=
 =?Windows-1252?Q?9AMb2jxg4uhx/w4lI/Lo/mGgIZ36Xg/DeQa2reGW7c41v8v1icc11e0i?=
 =?Windows-1252?Q?YgQN1mizcoCmj+KkVPezdCzGrXeGwDLuLsz/zj0fDZWnM3Hn6WqCr4w3?=
 =?Windows-1252?Q?HuV/askrVejbiGg+PFI/fxhHg8BDj5YD+Tm9GaywSG2/eEYEeoM4kwLX?=
 =?Windows-1252?Q?jm3cVQ9mDqvvd1DHLf6+IfkxmwVAhcaN3LJ8TbOSMZj/zaA5qkXnPF2G?=
 =?Windows-1252?Q?0prJbSOTOCEbg/IYFFczyaGu2j1l0vqILtPS8TC7KfM6+TvG8RXY1POi?=
 =?Windows-1252?Q?9eqerybLQHEOhGPstTUkBmnWd8zkrDuFek4ggIvgILgz31cD55aNTJwG?=
 =?Windows-1252?Q?2WVzbv6GzVgBS4MW4QQ1u1XgreGAEH3F5ZgZbX/NAR5SwHWN0xTGV1Tc?=
 =?Windows-1252?Q?EFeAxaZWdBOK0g1qnNc7D2J5p926jbYU2cANN0bO2b87lrlJ5HXs/DvP?=
 =?Windows-1252?Q?R9FxtGLT+GUHkbKXiI872eh+xXLd28UbZdVFTaj6f3TB9HZnQQe/oU50?=
 =?Windows-1252?Q?YPb8NITRKXFarKkjRgL0B6OCMA0k+AGZldQsdBSj0nuNcKaaK+ekgwTa?=
 =?Windows-1252?Q?8QGzj7TDtKqgLVqEeKWs3DGhTjPU+Ox3BMPOtTzRjtfNRfxNDbS55Yrl?=
 =?Windows-1252?Q?suqOpz9pRNsOGrCDY1w1BKjasLm4QlQtMm8BsNo4HHcdbKkxTR0lod+Z?=
 =?Windows-1252?Q?KRAxajotWclOI7uoxH2f0MPMfEKtQlKafV4JsWTohedKLa2IkMOgTa39?=
 =?Windows-1252?Q?IVXejx32eehjM/l1TcmzSUIhFHO6/JtrBc4l3wHfxqszexqP+CR07lDH?=
 =?Windows-1252?Q?yT4I0IsAchjJ3vqHbnQABSTsGNpIChXFLzEpOrEoBZ0qJ6I/OaqD5yFS?=
 =?Windows-1252?Q?GvrfqlnCsQr91ZWnqu/1CMU/V+qPw60U9ZLS9d8YKdap+8l2OE0=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heUKnAe7J7Hm/Gl73ppQ2o4XYWhaRNnNpUN2icRhcsx5AQBFM4Qc9PI8W86wSxGlujwm1q1puv9RXCEnAkf+FuWo7InBkhKm5lavoyeyxvFFpGCEXP21Loe9fV4yo+d2q9SUD2I6QAR16Zn5POCL9m+N6NWP0q6j6IzEDjTR0WP1gEOYZay+oOI1FsSqRZOQ6zz/qAtjGRmktleq2VKDJKb3ZdnlpCCDPTO63Z4/vZP4+h5GJ30wBCdw9CQ88Ru/0OB0CObaynQjnDne2puLUZ2X8maeScJOdnD42DFPyH291Eh1+6e1xT2YURzwQYOB+Z8VpigRB+RGMwf7UNKXag==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajuns6o0rbvHQb3DkIuNuGIuJiyjURkM12TX7gTtXe0=;
 b=dJpM0MidPqMB0qighdfzSqRUuVewamFIKoSyow+SCYvw4y0ipyZ549g1AU2GwAv++A1BXFvktl7ESbbstKJXBjOiZTFuy5d2vIhn0YAnTaS7zAt9zsbLOV8VcVGLIv9rmudf/CKf9ADOYbX0a6f/aL3CG9sAbAQScr9eFiz1EIJ+nGwnPqe0eqCWmL5sz9dN7TbF0KO96UNvuaD4ghBen+PwtukI3Wjrr5p07Oa9K/bzaS4Xril/HCweGRHl9yiYcGY3HPOBK/rruKvSgs3h9NKJXSpcjA3Jmb8XCeQPaECbfMUGACosKRZWhaM1NmitLzAkRXrnClV6YRf3ElvqJA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajuns6o0rbvHQb3DkIuNuGIuJiyjURkM12TX7gTtXe0=;
 b=JOwASjWs2TfDvLqrM13LKxMqw+ck4bbnUa0FNMmVbXYt3FlUCXaWxKwb9RU3OUWhEtig6y3DKXVv7U5rbt1iDu2qwf/PP8H2D1Hnawa0n691M7Q7MUNS/VyjUSC89iPGpMN9iqRSS+mHb41x/V1exFV5M4jQDFVMiDgTMtudkSU=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR02MB4205.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: f30898f7-b636-48bc-8ae0-08d8a24a9c08
x-ms-exchange-crosstenant-originalarrivaltime: 17 Dec 2020 05:14:20.1110 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: HpZ3h34IZOK8n60Hnp+JuWcoRbKO5aajvCkUQnVLr6pHR0n8/bCn7VYauXRf8n7cnCVRFEQBXhMoDGtrFBk/Xg==
x-ms-exchange-transport-crosstenantheadersstamped: SN6PR02MB4205
x-originatororg: quicinc.com
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=bcain@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Michael Lambert <mlambert@quicinc.com>, Sid Manning <sidneym@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

My team is working on sysemu support for Hexagon.  We've made some good pro=
gress so far and we'll work on upstreaming after Taylor=92s hexagon linux-u=
ser patch series lands.

The only use case we have focused on with sysemu is booting/running elf pro=
grams.  Both "-device loader,file=3D..." or "-kernel" are effective and wor=
k similarly.  We have implemented "angel calls" (semihosting) to do host I/=
O.  We have not yet tried using the QEMU semihosting features/cmdline args,=
 but may explore that option.

One feature we'd like to integrate is a guest library search path feature. =
 The existing hexagon simulator program distributed in the Hexagon SDK has =
a command line option, =93--usefs".  The manual states that it =93Cause[s] =
the simulator to search for files in the directory with the specified path.=
 It is used for accessing shared object files that are loaded during progra=
m execution.=94  If the guest OS has a loader that tries to resolve an exec=
utable or library's DT_NEEDED shared object libraries, we would want QEMU a=
ngel calls to be able to search a user specified host-path for the toolchai=
n language support libraries.

This feature is like the functionality in QEMU=92s =93QEMU_LD_PREFIX=94 env=
ironment variable used by linux-userspace.  So, one idea was to just (ab)us=
e this interface to mean the same thing for sysemu.  We could make it a tar=
get-specific hexagon feature, if it doesn=92t make sense to have it as targ=
et-independent.  And if it makes sense we could qualify it like HEXAGON_QEM=
U_LD_PREFIX.

If not this environment variable, is there an existing QEMU feature that ma=
ps well here?  Or is there a better interface that we should consider inste=
ad?

-Brian

