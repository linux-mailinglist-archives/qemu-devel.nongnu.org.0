Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13864FE31
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 10:53:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6qKk-0004xu-IA; Sun, 18 Dec 2022 04:51:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1p6qKi-0004xl-KL
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 04:51:48 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1p6qKg-0007X4-Fu
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 04:51:48 -0500
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BI3c8vV020833; Sun, 18 Dec 2022 01:51:39 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=HprygaLsru4RwyHXYwlj7sEn6e030Ic6QNDXnBNM0C8=;
 b=EBFdHGqBK9EjLbrnetBZv1vk+T7JoTIUqshZnlOR+Dd4rVq5y4PTALdHRtS1SpkoNkMQ
 Ghrwl1pJUT1TM0tD8pqfNIyJNiT3gVkEtnG/ckCNs7Rjaviw3RmD2D/DpZtc6NoSkZ5F
 GGiGu9QrzlrujCDBP6Wz0do7a7XrO9AlX6HxQwlqjRBSS1jEzWnkod8Glkp3UzkFCvcR
 q/ts59s/swW53DZ4JZBcZuuVI6hcRtZEOhflSdxPix3KVAhSl7ptTRizuYeGFAHFysdI
 RyvfBaKPkpS72cs0SnNC+F2Aenbo1VO9+8eoHYnaKD2MwVNsLOIfQcQbZov4P9eruoCp ag== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhe741qj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Dec 2022 01:51:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rv4ubpW+yD1Jly4vg+3S3zMUG+TXAUOcLdM4y2w8FKxGt36rzC/anyqD+1wA4tHgsELBDReoO44MEAtQUv8853XVS71h0aDmfLSuA8ZEt7yzvLhZR4FOcjAKAXH62fzd0vEWmKFPWbBE0w9ljeKJWoBogXMFAdMZxrbFHGcDmO7ahmh69ejKznGwoIqq/EEY8rk4Y/8QeI4n0giWq6mtauR4nig1LandRMyDu8N/VRDvDF6JNBhSOhw64xVozEXBf2a12moimVScDBPaxpcBRuiG3jLqmY8na5Ozmz+8Wj4i2fNDg56K/g1XxcLEMrrAyw4yzSQGuJwCoIBcdSH68Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HprygaLsru4RwyHXYwlj7sEn6e030Ic6QNDXnBNM0C8=;
 b=PBnMeoSbSCySDZX4GTc1qFa/J2uii8jAOfXYQTZVXsWKdek+hEbOaVWsl1xpnPZIgksTIEI/afMroq4IveekFvjRpkUFu3hBPUKeulHxFmE45ItC8Gft5qTyfDSJ8JAjoHj7W7z2PHVqQC+QEHRJ6QwMZ+2+vpRISZUb/oo2dr7dj+MLTb1kaK0MPe1M/RgaTxJZ3HluWJYnVEhutceYEo5uVbJjliJBjZxxZ34cLxKI1pZJFx276EEdYvLLWStHXw6UxG9QIWj8nY1L9JrP0b/6tulnz53OKZ+J18zxMgSOtsbOzm6O0WME2c1q7trRia7c51SjNfKmRpyDO7stQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HprygaLsru4RwyHXYwlj7sEn6e030Ic6QNDXnBNM0C8=;
 b=SBhJao5NSoti/oY3xSoj2bnMHHsr670RjmjjP8hnDOgR0VNTwuPB1S8aZyoLtMZVsrz1riVm8B3yHI1RfRfQaR4XEwfIusfLo5emv+04aFguSiFTTPKKVBQGa4zCcOziokMLfuS6k4ShzK5JBAXQcE0o5kukwbjQTREhqUWPouzbk3rS98mMggxCez3q9N2xk3Ib038yyZE4nao8vOQgvRnKrB+TJCu3x0y1ghq3nmqeqRYrY1JB8h8If8hjpIcQsqC4vlEBUqlq3q+O0mswogJiwNV69lBWaEh/KbTWKMe4WZ3OBY3J8NM2y5oCSi+xtlSCHWy2yPqoCEBvmtbQzg==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by PH7PR02MB9026.namprd02.prod.outlook.com (2603:10b6:510:1f6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 18 Dec
 2022 09:51:36 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2%6]) with mapi id 15.20.5924.016; Sun, 18 Dec 2022
 09:51:36 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>
Subject: Re: [PATCH 1/2] contrib/vhost-user-blk: Replace lseek64 with lseek
Thread-Topic: [PATCH 1/2] contrib/vhost-user-blk: Replace lseek64 with lseek
Thread-Index: AQHZEkKezeYDpd1ALE29RjjLp98P5q5zaByA
Date: Sun, 18 Dec 2022 09:51:36 +0000
Message-ID: <B66A9E05-5F50-425D-9B5B-DFDB76C229D8@nutanix.com>
References: <20221217180844.3453267-1-raj.khem@gmail.com>
In-Reply-To: <20221217180844.3453267-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|PH7PR02MB9026:EE_
x-ms-office365-filtering-correlation-id: 077bb7b7-a9a2-4bd9-f4e3-08dae0dd73fa
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QCKtSRYJwxtZRCEht3mIr1/NduVOST4MAoVYeyQcc69RKsbrmOZzDBCpqmxQz2FrUHZ4XZzOmaN3uU5kH4ScGU5MDOg0O/AFkR2J8LFEzXU19/97uT8vsXh+PJvnK24Y59bDcZ9gkLmRZoU4pKmmYJbA8ytDz6fM3Mbs/Pl0I/9aDaMpNJwXsTqCnqW0PfvwGv4Oye/ZE3lqV3lmsfakcmfkcy0/QNnrW8sS/GfDoFNAn4Fpn6VmGZ8CtPQB7JQwYCMfAFyv8pGv6K5LIKBD3AApV9ZcoosuMR4c5jvsV0R7KM4YTZtl6fuCZnwMDzpWXTUwjHLriIoJDWLZ248l8ennCCsYhUI2S2Q/drpL/UPaOzdpIDcjFmeAdNH0VXApd1IJZ+dX1PZgwCPzxaSRYbddgosaMgc+NONZaaLH61J4aLEtwgFEw37wJlAJDRmCr4U1K3mBSCnDxCedl4tcU7mgwKlc0aWR2Zj1WOuDsL21RgzszkmXvQKzwVKyrmHgNcnUvCEgcZiOBzVbrcdgiLPQQ8Ltemo4U37+zFn1vp2CLm7/ZgyZXYbTp5AjhHIT0IN6ZEzUU4hMqoW6oyr3K/wtS/Qx/Fyqn58zuXIQfqSoKDWTkLDRlb+MoZ4LpjvKcr7xirqi1riRjCSOW8/yTFZpOGUz9XEFLuVqeYKN9xG+PaLJEv80jXYUmKaKMBnAiIVmGyTgBPJ+exjTMsG6fAU6adv9fZ6bmVRu1xllGIs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(136003)(396003)(376002)(39860400002)(451199015)(186003)(6512007)(6916009)(64756008)(66446008)(26005)(33656002)(66556008)(66946007)(66476007)(8676002)(76116006)(91956017)(4326008)(5660300002)(122000001)(8936002)(54906003)(38100700002)(71200400001)(53546011)(6506007)(36756003)(316002)(86362001)(38070700005)(83380400001)(44832011)(2906002)(2616005)(41300700001)(478600001)(6486002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oe/dmYYDt/IXrTWT+8HuImMe0ImRJIebQWuuwRd6P2qYymq59DoqgH6b6ZH3?=
 =?us-ascii?Q?BHDSEUto8isREcszu0Re6IFva7C1vKcUEDjtQfyekClxuIc5NwY2DX1Rchwm?=
 =?us-ascii?Q?tacCrQN/iS93f+OK7kzs4iHzge4chYbNHADVYw7yU61ERhpjo0F8BTtMrJxG?=
 =?us-ascii?Q?RhqtQpG07HsPg402lnKXwASvvuZlMU2z5wYoMVvr04emffx1AQQZFRij0PG6?=
 =?us-ascii?Q?P4oy68+1WAJVkFdUYPPP5ers/pHONKBiAoCdDEMVgpSh6AOfLmyY86D7xI0G?=
 =?us-ascii?Q?lyT12fep4kpTNiq/NfB/yJZPQKKKLyvuvawAQ2xrJTRPG+i8LKoiN+6SXan0?=
 =?us-ascii?Q?BC69OvCj7uVgE3qB0sEmImMDA7Wp7KW3+FJMsGG9ngD/CDNgLGr8avGJN6ip?=
 =?us-ascii?Q?txOaHFjb5oYfpbaTseviqnTodkzEwqE8HfaZtxMZn813tyefmF/ESRJfnemo?=
 =?us-ascii?Q?vqJXhXuIw5XwSYVPg7OiEyCO9ASEscnMhETVCQbC8HIZnOyWUml2Tv1+5V2S?=
 =?us-ascii?Q?YnrO9S6u1UXSqY0npQAZEjvl+8XAnJ5pJx9sYhYKxy4w0BqSigYB+OFs81Zu?=
 =?us-ascii?Q?qURFR/WIZCukTNxnx3FqbSQjI6X2LXoAlhMEO49TZ+9RC05anRVxjNvgjShw?=
 =?us-ascii?Q?nVO3f8NjpFxzcxNgUgsFI9kisxaRhD81GLTE60FxwAnwLFYX2JYwJPhYGXN4?=
 =?us-ascii?Q?IOQJsX7nOqBnZKJDRYpvAkvwRtXukT7qZsM+DtbBB9kQREl6rIoYJFoZXvXf?=
 =?us-ascii?Q?LO4jckMzLHCWeIoTUBXnPKKfdNalin37ZcqNbtRqELt9Ll8ncwnJyNY1SIv+?=
 =?us-ascii?Q?mZO/2MDXFa7mw/5KdrKeZD+wMYSCvY2G2GEtNKFQCq8mU4Xfen9IhPhB7AGn?=
 =?us-ascii?Q?O9ccajKEqX0ttlsl2ntmqJhLOVJ38HS8uCO4pSxw4EuE3VD6PUNwRgZitr6b?=
 =?us-ascii?Q?aniUMZ8dl8qT947XdPBugGXyZZKIEMwROLTx3a9Y2rFz3HA/sM3iOrFa6aUi?=
 =?us-ascii?Q?vfk9Upl5S9vIbliA0Cujo+E+hrsKl9boohv5ffz7PlprvLg6fZezrXZ6xtyA?=
 =?us-ascii?Q?M+49eXhyBjK5HHyWb5bKF6MrgzZ+Js40jRk0Vz+BF1EAUx8CRE0qsnDqtqWF?=
 =?us-ascii?Q?GxoGqwFVK1mNLAiMwRVrSd1ilOBY2t2IgxkmutvqGujuZ3s3Quj0GanSgrF4?=
 =?us-ascii?Q?shwPIN71Opg/q4LCjNwYCkiELKxmMWQUTNBv7V/sSe0g+hooq9AkAtcqP0FF?=
 =?us-ascii?Q?rJF1bkB4gZ8Ok733CGOJ2UnyC1IEUpOIqPI04+FxYFsFs6x+w8UccSOzt1Q4?=
 =?us-ascii?Q?vca672TVPwRFq9v338Zkq6dDg7tIfq1qjgIzmKzaqpL3xk9TIXMihKHumfw4?=
 =?us-ascii?Q?fjt9kqQz/P37+EZPQ8ZGc+ynUFbb2Py/oaikf2vfi+H7mjgmiKu9FUKEMNx8?=
 =?us-ascii?Q?PHCYrhVFM7uAVtvRraS2LgLtkQUAG+SFzZSylPubAb019Ie/rQ4drFhqlmp0?=
 =?us-ascii?Q?uUwVWEPsVkKukQU2Ig7Gslkkn+hi5c4L3Sq+wACOFnRr1RB5XKe4kgH2mNXe?=
 =?us-ascii?Q?/+yM5bgUC7O/Y1C9f45vgQvOhM0Q3qzn1/8vRsS3nSD6hkuVmRXajY8fIeOH?=
 =?us-ascii?Q?mUm1m5CNCH+sbGUaT6r0kq4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <EDF95FD0F8846C43A84BC9DD276B8DAB@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 077bb7b7-a9a2-4bd9-f4e3-08dae0dd73fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2022 09:51:36.4411 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: omn0eiAW6urEBpg4SJL4lNDj3kYQsupI5lKU4PqoQU1LquZ6UCI1xNCNpn5RHdAWjUJWmMVvi5HEhPSOSTVq6+55Zdwtvr8W4EfXL+eH0cs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR02MB9026
X-Proofpoint-ORIG-GUID: 6g5n4l4nYFRuJjNIVv1XjnxK4lru-99u
X-Proofpoint-GUID: 6g5n4l4nYFRuJjNIVv1XjnxK4lru-99u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-18_02,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

> On Dec 17, 2022, at 8:08 PM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> 64bit off_t is already in use since build uses _FILE_OFFSET_BITS=3D64
> already. Using lseek/off_t also makes it work with latest must without

s/must/musl/ ?

> using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
> when using glibc but not with musl.
>=20

Other than the nit LGTM

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
> contrib/vhost-user-blk/vhost-user-blk.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/contrib/vhost-user-blk/vhost-user-blk.c b/contrib/vhost-user=
-blk/vhost-user-blk.c
> index aa99877fcd..7941694e53 100644
> --- a/contrib/vhost-user-blk/vhost-user-blk.c
> +++ b/contrib/vhost-user-blk/vhost-user-blk.c
> @@ -532,9 +532,9 @@ vub_get_blocksize(int fd)
> static void
> vub_initialize_config(int fd, struct virtio_blk_config *config)
> {
> -    off64_t capacity;
> +    off_t capacity;
>=20
> -    capacity =3D lseek64(fd, 0, SEEK_END);
> +    capacity =3D lseek(fd, 0, SEEK_END);
>     config->capacity =3D capacity >> 9;
>     config->blk_size =3D vub_get_blocksize(fd);
>     config->size_max =3D 65536;
> --=20
> 2.39.0
>=20


