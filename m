Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD1465051B
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 23:24:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p725G-0003Ra-4a; Sun, 18 Dec 2022 17:24:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1p725C-0003RI-Ix
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:24:34 -0500
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1p7257-0006QR-M5
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 17:24:32 -0500
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BILMeJg010023; Sun, 18 Dec 2022 14:24:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=vm5n8X5CV0Vz6owwhyoeYM7HSUE0TZia9X7V2D0lBq4=;
 b=b5v0W1Cddj/cc4MoW+YAjnEwzyvqlHpc/CjDe2mqJMPnwjy33sqSi3ikMRDUeANso5kJ
 otVA74YT0GEn+DPn2dl5zASHivalz14E8cckJa9qlWXPBY3ME16Dyh9SJqgkOZmr8eRC
 o5kQCY7Y0uaCM11HEP1REr1/fBw5clighM6bDKpXJu8VSvHMrbog4RHWE8BSReB29IoC
 Ia6zHO3L3pQ0ji3E+NDXxJhuNEurmivl3Q0TKELaL+CIXegCskAeZRB46gC2DvTiS/zJ
 m9c+MsAjExmp/UUE9ljybeB6iAPyYbbkopNGYu4KVwLWhsma9rzQAMk+tXGRjP/rpPnP wA== 
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3mhdqmjxut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 18 Dec 2022 14:24:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EBc4KYGyZHrD4DLJjyVKDcZuYhRz27EHicOqLokiAMy5/t2jk+AKm8kDFA/IlrcNhaaE6CQYaYekZSYWLApXCtRgLTogmJKhypXw3v/Z5Z/9h2QmeQJVxILxruR8X66/HahbtYfq7pKGw0GkXgUGgUTRxjTKs3yG38urSLvILdSKv4vGJ01AAaU0NpJu0m+NeLP85hK4YT+5t3xuLznP/bi8wXOntRt3iKb4eWLY+p+7Uq+y2ecUl9tyZaZnu5T+0W+2AjmA/ccu7rJey7rve1b9njXSrutQAU9/caf49xqUgGwSfIDvkxkDRpm7/IEvPx8YlxPZAk9Qd8Qd5jP+qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm5n8X5CV0Vz6owwhyoeYM7HSUE0TZia9X7V2D0lBq4=;
 b=ZVRzMphoqiVTdQsJzCsCUXczsxizWP3Xs2DeE4PpskGsjXko8rhR6fXgvOjgTG5BrSKW2AL+DnfsnKaUOcnXCcW4fszoAPhI1LaW5kuKHmzx6TRMLxAmlHZlxQnfQlWCB/7r+1LJmDUM4U4UJ2NrQq3QOO7AE/LGhUzOE2yPjiIvmW+ZB4bGkKaODNJNuazsvyM/AiyV1ku/aMvNdZq8Lp3aMcmHdT080JAc/d7g9UAx9bHj93B7vzlbCjuLr9emOs5bsvU/h++AqtHz3HB7f2W0gYKhdyomLJp98hp/gvFPWNWknYxZNAFCLlO1J+uTj7p7eibhs0s/gn6xgpz89A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm5n8X5CV0Vz6owwhyoeYM7HSUE0TZia9X7V2D0lBq4=;
 b=wJgeGmJxPX/mJDNZYOH39wbkFqTWN4lT5i4G4DQ2q6rMj9kOsIpQwYW3sxxe37veqzgevRa4PDHPGgYqPSI4kpEFDT1Fm/G74vid6V5/liGmoV/vdpzIMxdrHxh9wTNCLoD2a6VIFK2dsISChN6qxBVOTA/eQ0l+cvWOFDYsWTsxi0sSrQ54JD3SQDS+ooziZdat4pE2VrICx8y9UlzyOkHXD14yP6K6EsJkATOWClzA5cuUG7W3QzGC9XURGe+qyBFmPB6Yng1cPhjSjGHxEVbbJT+h6vQE3Gfa+ehViz/Sydob8YNyrKLeHZQTORo62LP/ApVc+erSu49Gp+4wSA==
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM6PR02MB7098.namprd02.prod.outlook.com (2603:10b6:5:251::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sun, 18 Dec
 2022 22:24:22 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::a01e:4b95:6c3:acf2%6]) with mapi id 15.20.5924.016; Sun, 18 Dec 2022
 22:24:22 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Michael S . Tsirkin"
 <mst@redhat.com>
Subject: Re: [PATCH v2] contrib/vhost-user-blk: Replace lseek64 with lseek
Thread-Topic: [PATCH v2] contrib/vhost-user-blk: Replace lseek64 with lseek
Thread-Index: AQHZEy0pcVvwjOr2AU6ZZDWxk7eU1K50OJUA
Date: Sun, 18 Dec 2022 22:24:22 +0000
Message-ID: <ADD6A2E9-D460-4D29-8877-E1E920FC9B62@nutanix.com>
References: <20221218220740.315839-1-raj.khem@gmail.com>
In-Reply-To: <20221218220740.315839-1-raj.khem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|DM6PR02MB7098:EE_
x-ms-office365-filtering-correlation-id: ada620bc-64ec-45d7-edbe-08dae1469d3b
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OvcKS85vROr+AcQhX8Ql6l4okkOBv2M/qJws90YVS3IlBmTzvJAH1mlrACL5tybOHh/YXZnu/58lUISn82mSuPK7rMXKI9vbNUB+4y56m6NoMyE0ZZO0ScMCLmEBM+gZAvbmrZFRh7H35LrPLK2DsCjq60OUCgQXiIhOLV7/mfGFDXCjbGT9XQ8NduRW1goRqnrehYZFYLLjXpBClXSEI2iY70z3zaX/6/GlxortasO+xJV8Gv6++F12hk1+ZeIZx/NeHdAnkXzfCwqEMJ7m2VTKRRBwEX6A/pyTDM29GAUFd3WjoozJufUaeifYEfVWioZxwvCUvIDw681k0fVbg4gRc6ZovWzLKO9jLkSCYZwWhHx5p8JyyLGfCMQwIAA1ruUyT29vq1kc6ekU9ANdQgDv0YrTUgWcjJnoCo3l22WnqS3t0775xJgI6Yieyi3Pv7yWZVrqjRT43vwGEJcqN5hJ0Nr3Pzynuh4Siydbu4L9m+aBYeyzQbllc6O6IFFAbHUnWk+v8Pqn076LfGTw6VomqUKtFYq7h4rRrh0UIuhPjD1su869J7cb9v+E9eTlUilxjctOnBpDuZYLQ4uPFWzUkcAbB4Gj2jv87giVx72vZo2P3T/WeMcZYpDexuptQJdwyupBy+cQGuI3WYaWq5+ALI4igojcfVtKLc/bQv/vmMVZjsWE6xh3wH4yTXbdu31M4EgFEfemSymkc1gU/lNb8zWICgFoLKVxgLiUipA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(376002)(346002)(39850400004)(396003)(451199015)(8676002)(8936002)(4326008)(36756003)(41300700001)(38100700002)(122000001)(44832011)(83380400001)(5660300002)(38070700005)(2906002)(33656002)(53546011)(2616005)(71200400001)(6506007)(6486002)(478600001)(316002)(6916009)(54906003)(86362001)(6512007)(66476007)(66946007)(66446008)(26005)(66556008)(186003)(76116006)(91956017)(64756008)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/lLa0jUB4m3qXuRrmSzViwYq3qhfaGNEct6Mk95afKTtpSy743djj9Fa0VEH?=
 =?us-ascii?Q?Lf6RQlO9qQ3draTUlL7CYBIerApd1xZdt6gW1Jb4Ex9+Zf8TMMNiQEuUc0KV?=
 =?us-ascii?Q?HFt+s4Yfsw/PL88/KfSnuBY5fk6T6RhXH0bHRWA3qWkl4FjtbXGMg+P+tujf?=
 =?us-ascii?Q?5wkmWdxLD3IdxtUR5Anlwg37FfpoSTy1If0G4mG4lj91+/Qktvi+79zT5Ow5?=
 =?us-ascii?Q?fHYM7IZLSFZ46eA1KtuhxqIDDLqS0Kc7CukTDnseBTtDAuxgPaSZTz9amRS1?=
 =?us-ascii?Q?pwK1c4XNFk141aYfycw94jgpZmyGLKWnHlSZPMCayf3ggcO3Hb/aWQW34UQ4?=
 =?us-ascii?Q?7fr1B84dkKaiI2NM8s4oQdlu0cf9BB/GxJ+QYrw65JROrW3VCj1cKy8TM1X+?=
 =?us-ascii?Q?cDV00hDyMtNR38jVbC9uTH4gF23/CQC9yFbHMhBa+MumQZmFd7cgqHQkVLt8?=
 =?us-ascii?Q?/Jv0cHzuUT6aAoqB83dxNQAbLmIk4Igl0HaIZ58hR8p2VZrGYCBU4u7ji846?=
 =?us-ascii?Q?cUGe9LBtuOX/hlH6TmHmjVJdd8wI/LtVx//Fa4jyQVObYMKBFwkyNBx8nC2Z?=
 =?us-ascii?Q?9ohM6tE9/1ZEa12aSpYGk1kcJDYwEv0Qv5Q6W5QcdeRiOybtpii0YEPS8zTA?=
 =?us-ascii?Q?fR49SELZ47dpOmgKWQ9QSz4rdHZeLVBU6InKL51ILsH9VftLGQMjhJ+9SiTw?=
 =?us-ascii?Q?0vHU79oL75WsZpNJ5npZH8xC2sZdiQt2FJr/rKJIUzoT6SLdmJg1DKnSNYg3?=
 =?us-ascii?Q?e9dvbyTHl/u+G1TG2OeQqyzDk39pnBUXqbD+9bAaNiJ15iWcmgZXpBIHqM0P?=
 =?us-ascii?Q?5F7BjeO4ilCz9Qh8bpd5j3Qw9Mip9AT+l+VZeCAFUOuuZvNmi1VDmNxo8WzE?=
 =?us-ascii?Q?WO7TGrS9HNPgkUzDAmNAR9CJy4LMrcgwC9URuv5CtI7kKu9PwRWNxjt+t/OW?=
 =?us-ascii?Q?kjqPHfdXib2OCfqq4+b6uZdSDowMBSvTmOdxhuvKO+MtwhXUZRhH2tX5Y9Ir?=
 =?us-ascii?Q?arPnS9YhMFRjGShhjsmAle69Jy1UEps5anhXt84jbQVOvpM1qsGFDaNWQ7Te?=
 =?us-ascii?Q?6HsaWGkmGCVdKVqXblWOHh2lW4FHL7Jns3OUfD3RquD3ZcV3kZaqSS4/rE8T?=
 =?us-ascii?Q?tPMKz2QNlDkRSE+fQKGOCRh5If0dFwd3WEw8Jj1ntqzC8C7RAj+fenJnQN3e?=
 =?us-ascii?Q?RSD769bk2RNkRsLLuZzpkvjzNWQm/3cYuNx8shyKxzCIe8Xzsqw3FNBFqW6J?=
 =?us-ascii?Q?TLKUrj9SXeltypAZz/4Y1Q/ac9A/81mF/7VSJmGkTEh4pP4iPjbpPy4SKZEC?=
 =?us-ascii?Q?h3A7dFaRh1j+hkgIpLfj+2pMMxGoYjCTuzCe6wah1gJeo+2+mHUHEqO0JdGt?=
 =?us-ascii?Q?Z8EVza4+k61GoA2hv95cXfKcPaPjb+q8lESkEpxEcQzY7Y/ts34hueyl0w4Y?=
 =?us-ascii?Q?9AJICySeXd91Gc/C3eSY2NRIBlPkzNMvfimPb+FKctexUo67exhdGEDgVXBV?=
 =?us-ascii?Q?QoWACz4jdGMSTxMsh0qC28CQWXcVVIWD2VDxEnjWLxWeHDGlud6jkXGoxjtf?=
 =?us-ascii?Q?zI2+FxD4OkZkJ9xZ0fRkQI+UHStRnPlWMW1gnBkpyBFd8XwfWZafBOcmWGqa?=
 =?us-ascii?Q?39pSe1CbqYxR7fYxcqtTRo8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E271208A29905E46BCF7A9C649106E0E@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ada620bc-64ec-45d7-edbe-08dae1469d3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2022 22:24:22.8100 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1MQu2KQstUqNPGMTxAw7bwp2iKwkMu01mbYRC9AK0olxH2VQwj3TXShoMo0Ekie3wxZyamNFPskfoEMQ/yoKP4MTHVGLNgzEAElgQ2Wx/g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7098
X-Proofpoint-GUID: TkaPnpRKQhvXoSVc5KJutNgVn0Yn3Jfx
X-Proofpoint-ORIG-GUID: TkaPnpRKQhvXoSVc5KJutNgVn0Yn3Jfx
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



> On Dec 19, 2022, at 12:07 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> 64bit off_t is already in use since build uses _FILE_OFFSET_BITS=3D64
> already. Using lseek/off_t also makes it work with latest musl without
> using _LARGEFILE64_SOURCE macro. This macro is implied with _GNU_SOURCE
> when using glibc but not with musl.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> CC: Raphael Norwitz <raphael.norwitz@nutanix.com>
> ---
> v2: Fix typo must->musl
>=20
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


Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>=

