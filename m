Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58603407AAD
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 00:32:31 +0200 (CEST)
Received: from localhost ([::1]:58404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPBXx-0002LW-GU
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 18:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mPBVZ-0001We-0U
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 18:30:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:36096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.levon@nutanix.com>)
 id 1mPBVX-0006On-1A
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 18:30:00 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18BJxgFr026549; 
 Sat, 11 Sep 2021 15:29:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=OBg33RsJdjykHfFcxbzn/Hulo8F6eukrt2PGibWrJ+Q=;
 b=qZvlQJ92UnN7rkQ6gwx5FIB1PPPesQ9ERFwvY9fxAwMkdUjX3kEseplRUHKiqs7e/dZl
 3lETBJryGxgYp/uXUhen2O7ZARNYg/vGXAoGuZUqIGkrwALtLdXmausSoQWO7mdvCK7c
 0qCd6AhajJl5wQZ1Bwax3tsaPqEFibplpRVlxWo7RPwyghCBDEDogWQD8PtV2ZbhLjOu
 5F6Nl9jsthpy/4n4YharqVDSu75RhVvCA4veGRskZr+shqtXWT5wsfZwz5chjDTGUhMM
 5BuFQEtEYvwdb6/wGIXyB5dxueuEr7Qukj1wWf3CUrD5bi8Yx/99FXyvO0HkT4tiMPC7 6Q== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
 by mx0b-002c1b01.pphosted.com with ESMTP id 3b0usf8m0v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 11 Sep 2021 15:29:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MeFar/Teg+szGJ6eNkgIB+7EQPos/Cx1OJ+qO6PZ2O0FiJt7780W64WTKh3x7mxQ6dQCoLa4b9mcpP6TuE2tk4iMWCMdbBzP86YsDf3MuyMIBpe7zwH318LLL8YXSmQP8WuZ0c06nGaizRhNufwIjBsNGEXcvuURbgg1c8qXuQxSvvVXkHM9WAqmBcf1LlANJWPyNMbe7ARfPdSsBs5E7Eqt9ahEndNz1s/oUI/taRifC2R7Rg4h4rW1FJYQfv4nS2p3hxMdiR9y6YscsaI0i6wUnXRF6WnaCrOD+85bK9ABBBde5RVecLS28z7CQC3Zq6f9TaFnvy81cz+FP+IiAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=OBg33RsJdjykHfFcxbzn/Hulo8F6eukrt2PGibWrJ+Q=;
 b=WUoaaDVR2QlWIBWyY/S9KAcqlBxqVDyGKw8u0INSa8SOofZru1GVog1ins/ZfsALvicskV6hOz227cf6VhuOPS+YAwTqlrSWNVDRKy/ceB8ajdUJWozBMQPMtCJdOcb1XXBC84QOqn/uCqYJyAoSWvluVediDqZbMuDzjG7YMtWMbvbYzZMz7WMMWVrUOo/Sgf6Vd7DPqrZIzVjuJ3Xx3g71TDRZCQStiFCXKHsXCfwkZ7SVwlk7iCPQz5OQTmJMME0lToXeYtW8XmBanFlOgnb7gnqgoB5UNXFGD/Am162NeS6pC5VjlqMAW1z5trmtDyDp9+RSvvlnqg3+bSwbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL0PR02MB4580.namprd02.prod.outlook.com (2603:10b6:208:40::27)
 by BL3PR02MB8233.namprd02.prod.outlook.com (2603:10b6:208:340::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Sat, 11 Sep
 2021 22:29:51 +0000
Received: from BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0]) by BL0PR02MB4580.namprd02.prod.outlook.com
 ([fe80::b9d9:2c4b:c85e:dbd0%7]) with mapi id 15.20.4500.018; Sat, 11 Sep 2021
 22:29:51 +0000
From: John Levon <john.levon@nutanix.com>
To: =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Topic: [PATCH RFC server v2 01/11] vfio-user: build library
Thread-Index: AQHXm2yFxhZSmqB0RUm5CCvnkHM9eKudd9WAgAIKYwA=
Date: Sat, 11 Sep 2021 22:29:51 +0000
Message-ID: <YT0t3gY7yR6lPUPL@movementarian.org>
References: <cover.1629131628.git.elena.ufimtseva@oracle.com>
 <cover.1630084211.git.jag.raman@oracle.com>
 <b556fb2bb8e364657a867dc5a83df937ffbf5880.1630084211.git.jag.raman@oracle.com>
 <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
In-Reply-To: <16c06c73-3b1b-1178-805d-3dceab4d41de@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6eddaae4-5ad2-43f2-e8d4-08d97573abe3
x-ms-traffictypediagnostic: BL3PR02MB8233:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL3PR02MB823392C3C74FB93C8BF9748497D79@BL3PR02MB8233.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:298;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISQdS+ItF8UA7UcaM6STHvqSpn4hFat+V8OlDGWn5JA9ybRoG0wASwe5yzOSZd++Y/OVLXXwYhQDebF1aLbvVy13Twc09IMfsLW2TLyqcgsMOsvLZe/GDYhl++3fYNhKCmxtUCw4RrXW9MPB0OgXByF9dIZ4H/Eg711MHpPDKe8KvXmSkQZ7IWMNkbMpkGnQfEvp1RPkMtbEPnkB2CuIxDDdeLOF7RBDewfvl1IGK9pGLYNJnt+3wkhP0laGdKLRiRI+PPXsbNb/WavltVkN56xKIt+rN4RBenxZMYG1V7RLjuYfA4QneXrcVFkGtyDwgni0nSgF6rQfxmA0qmXfDdXg7kvfogMRazCg6H9hfa7jZcW1t3I3RGxnSeRTK2EguZtXDZ2zuf/YqhSl0dvdV3NuEqXiC4+/u4p5onMu8zpQsESv9f9S5AD0ic+pOSz2JDJq6UJ7TC3HhKFa3swphuyozumJiFWCuEXM/8Sz9Z6vwXBPNHzmPDJa1b9x/BmzFlkrkwqpjx4QcmZMmicf/Yl53iEsfxsBpLk79EoeLi31cNwr4b3tIP/wQapxq86YjKiow0sOlGp/kz3HkkkUZjFlOnlE7ktiE3A0M7zTIxyWqTMrzP4lqykBKkZqPkU8m6jmzgHvkvnfDrUKb52bAp655jGZVGhg1OdrxRgU/cjrSxqwjGRCBRelMZc9lwv552+uA3opzooh6HTnu2Hq1Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR02MB4580.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(107886003)(36756003)(122000001)(91956017)(4326008)(38100700002)(76116006)(5660300002)(66446008)(9686003)(6512007)(66476007)(66946007)(64756008)(66556008)(86362001)(8676002)(26005)(8936002)(508600001)(6506007)(7416002)(2906002)(186003)(53546011)(54906003)(6486002)(316002)(71200400001)(44832011)(6916009)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?fEckjKP3DGClL9VWRFdyLmscLx65ca7J0HWbPGnnnTmubPVPtI5ST7p8qQ?=
 =?iso-8859-1?Q?1+F/srQUpiLUlYpTtHaiugr2/7TG4kPOya+3lqumxxio/qDRSlsJctjiWO?=
 =?iso-8859-1?Q?/+jCnZezl7dDe2LnxF95gLB5YZc4G8QzD3xmVgfGCjYGHptbdPQzXFBgP+?=
 =?iso-8859-1?Q?c9kQeRw7TcGbkid3v8hf+lRCYhIfNUmCxSCQboIfCkydfYT6MKjkGSCQO7?=
 =?iso-8859-1?Q?RLwp8EbPByLsIXVEL3aQ7/qejzvoMV+CwFqYttBJYny6zQfDP4CvgEXARl?=
 =?iso-8859-1?Q?r1eaQhcN99BfzxCC1QrftwNDHBR9BIRXt/IdZr2Ix3V9+sk4/QAUWE9NuM?=
 =?iso-8859-1?Q?zQ79OrTWiGL3uapjS9b3z4ZjN8ttbral9zCur/nDd84tmiqZ9X0x0Jadgj?=
 =?iso-8859-1?Q?GJxv5rCV1g1RX0oH93pdIzNkIs4Zk7k31OZFDDqzVRb0X56u+fMsdR+0N2?=
 =?iso-8859-1?Q?3SkDUlvi2Die44Ogz3Ks0b8cxnI5E9jVf71S2UZg/mhavdhRhzXoioxW3f?=
 =?iso-8859-1?Q?QjxO3aL+gx+bObfvMXKjd91cjwbGZH3toRpPlqkxDwuPlN8ZVFH5G4w48s?=
 =?iso-8859-1?Q?V/lua0Q/FTcoVcj6LZEOqi5mk3qWCZ5Umfrog5eUnZiKbkNR3j0ZDTQoXY?=
 =?iso-8859-1?Q?TxBuvyN2+Fa83flMGonFs2kKyIC+UCSFDwFEX/LQikxEYYfplLAiTJIc9j?=
 =?iso-8859-1?Q?83mkkThNL76SOuSjwX/3HsR3WDjSgqpZASBaff5PrAz9lqy0DgJmJJ3T6o?=
 =?iso-8859-1?Q?3Dl0O3gj6J/c4QvZ67JJWDJAofkvwHSDcQzGTmzGhVPpzrw9nI3673VKHU?=
 =?iso-8859-1?Q?td9K6mz26okAhyfg0VGDUtcmmYZOVViDB+TQOUOF2xO/yodnHMHkU//qrH?=
 =?iso-8859-1?Q?32Q4uNG6i3nWQbYjECXxJ/RbE8OGTm9WsTxUtpmw6n1QsFfVbkUcI2lKAm?=
 =?iso-8859-1?Q?3RG4LegTqGrbFoIY6wT9TYG977TfHtCLeL6he1YZPi6U92sDe7D+/IpSsN?=
 =?iso-8859-1?Q?0Td3S/+0Zd1h4UFU7tgR5EWPCbGYCRx1o1d8TRuEuWbfzuNrwfVW13psBx?=
 =?iso-8859-1?Q?Pj7xED4Sd8c9Ko74/VdvhUgzeo0gpiZewO0XwZm8PeLhjXfj4vUTtHt7jx?=
 =?iso-8859-1?Q?EnUlDx9ApgUlXZ1desb8LdHd0/WRXVHJNkv8cbm2cBxGTsaWep3jY/u2h8?=
 =?iso-8859-1?Q?E8nPsFe+7oC3VEE8JICoMYS7X6QfgPtSwtkDhT/i8fE4VMCiDjNKf14moG?=
 =?iso-8859-1?Q?S+J/5t4np9Qa9OMgPU/mCwz+Xdju/LlXkEcUUTi1C20EhY6Jg9XLz5EJPR?=
 =?iso-8859-1?Q?1Hld6ikmvCXw9beqt1ruYaoejaeAj960taOglsQ3VwAeo45vuwRGX+kcTK?=
 =?iso-8859-1?Q?rNhqdMXEGv?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CE43C36FED516546A435D957150E4E9A@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR02MB4580.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eddaae4-5ad2-43f2-e8d4-08d97573abe3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2021 22:29:51.3945 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9gnTXoX0zX45Ki1jLDY74p13RJGBbNxkm3yr4SHc7TmiImUmylswe91M9mRS0zQSN5YKnZRCTvHGxuwiOGhiEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR02MB8233
X-Proofpoint-GUID: l2xZ0wFc8O6R4gK-NHsaAeecPjBAThy8
X-Proofpoint-ORIG-GUID: l2xZ0wFc8O6R4gK-NHsaAeecPjBAThy8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-11_06,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=john.levon@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "elena.ufimtseva@oracle.com" <elena.ufimtseva@oracle.com>,
 "john.g.johnson@oracle.com" <john.g.johnson@oracle.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 05:20:09PM +0200, Philippe Mathieu-Daud=E9 wrote:

> On 8/27/21 7:53 PM, Jagannathan Raman wrote:
> > add the libvfio-user library as a submodule. build it as a cmake
> > subproject.
> >=20
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > ---
> >  configure                | 11 +++++++++++
> >  meson.build              | 28 ++++++++++++++++++++++++++++
> >  .gitmodules              |  3 +++
> >  MAINTAINERS              |  7 +++++++
> >  hw/remote/meson.build    |  2 ++
> >  subprojects/libvfio-user |  1 +
> >  6 files changed, 52 insertions(+)
> >  create mode 160000 subprojects/libvfio-user
>=20
> > diff --git a/subprojects/libvfio-user b/subprojects/libvfio-user
> > new file mode 160000
> > index 0000000..647c934
> > --- /dev/null
> > +++ b/subprojects/libvfio-user
> > @@ -0,0 +1 @@
> > +Subproject commit 647c9341d2e06266a710ddd075f69c95dd3b8446
>=20
> Could we point to a sha1 of a released tag instead?

We don't have releases (yet) partly because we haven't yet stabilized the A=
PI.

regards
john=

