Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75E4624B2
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 23:22:36 +0100 (CET)
Received: from localhost ([::1]:39316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrp2h-0007iv-90
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 17:22:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mroxr-0003Kn-0M; Mon, 29 Nov 2021 17:17:35 -0500
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:41840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1mroxo-0003EH-MV; Mon, 29 Nov 2021 17:17:34 -0500
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1ATJ796o005935;
 Mon, 29 Nov 2021 14:17:31 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=4MGwldYynxqH0I774ziMyVkp8huzsK8um2Ms+C9hIig=;
 b=SXRiiTtb9I5W9CgvibMwzX2fRRuE5iLQijaFlTvr4u7+QbZljIYUnQdYywC54RUwClOI
 3y7lQ+YaYUFAqJa19U3OaOnY3TsecnTgU/3pbh6CPC6GrPZ4IAVRhywaArqFxQIIcK0l
 cLLvkeBbH9AFNazK8/EspdrpDddvwlN9+Mkc/dMh0lGrVGajmj7UCIU4bs2BZ7aT/+Sy
 8LMArUGaMHpJjFVkse8Aw/o+rKsMvzq0/RWWxWg5yExMvO8e42QgTU1PNMe3Aol2oX6F
 HfnSsrmizQxpSp1m9y3hujLGj1DQOO0ZsMJGKMDv1vAwrsq/jghTEYVb/LOSOQ1yugDl lg== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3cmnt4a0v2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 14:17:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ymp5wXuq//LInvjHTCDYxO4YA5yZPoT9yVwXUTiuyzOkUF5KXA3cGV62UY9/C6MWrt0610WiafxZulY5O/YhGusW11vV4RCLFP03blXcmEa3fCy/LpYmeey87QeKTKbjsDhwfZ9EKCKyhDDYrmkUXRPCxwldNlvKocDAC8YbwIEVhL812X4ndfBnHwWoxLGxay1Dy+0yN93EHG9V4jfBRYShbsLn7uncLopzT59z7EdKtzLn5bevBzTuc/1P8GX6F08bKH6uVE9CD+EH122JWu1mR7/q6PVeIj7RSysegXoOK2sFyYcAKtXfiWAD/liGR4Aomq/hC8Xh5jRZe1nAdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4MGwldYynxqH0I774ziMyVkp8huzsK8um2Ms+C9hIig=;
 b=ixOQGcIIgUOHeA9jJmY8FppvAb3AxmAJMb7fhI3sFDU5MAsPq1fqeVbIJiiKvkTq4KKBbd8slxCL9yYSX7Oyy1uOI5BBt2R/Nl2Kjud4pIuvU4OcQIzFUmJYcpIHRo+0gUbp2ZBGaZ7XUZD9b1xfyW1MQfYzYUEc2QaME29eAA709fEz0VdYTKDqZmf6vSU1wbRKMd/QM41yLh9unDGSYjEtXPpfZylmULfM/lEmEhER4S0x8ohQVRdhonKxfRKq4oWBeARfCDLWwJ4TCwhtf7AMm2elKPLqtkC3Vx6IqWK3KDvuR/jAPWDcfZRHl4zBStjXC3DwpAHSxboVL/0Aiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BL0PR02MB4417.namprd02.prod.outlook.com (2603:10b6:208:45::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Mon, 29 Nov
 2021 22:17:29 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::25f1:c1cf:5f90:35af%7]) with mapi id 15.20.4713.027; Mon, 29 Nov 2021
 22:17:29 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Roman Kagan <rvkagan@yandex-team.ru>
Subject: Re: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Thread-Topic: [PATCH 01/10] vhost-user-blk: reconnect on any error during
 realize
Thread-Index: AQHX1xGQdhZ+wK2bK0CvUd5YwJAwxqwbL6WA
Date: Mon, 29 Nov 2021 22:17:29 +0000
Message-ID: <20211129221727.GC5722@raphael-debian-dev>
References: <20211111153354.18807-1-rvkagan@yandex-team.ru>
 <20211111153354.18807-2-rvkagan@yandex-team.ru>
In-Reply-To: <20211111153354.18807-2-rvkagan@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd8d87ff-4589-4207-ac29-08d9b386081e
x-ms-traffictypediagnostic: BL0PR02MB4417:
x-microsoft-antispam-prvs: <BL0PR02MB4417B008FC4E6ED4A8D8683DEA669@BL0PR02MB4417.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5wCSQ6I5dKwQjoFRqWNxMN+RmwbmVLKENwyrXCa8zzCKi+wpukpyvJ6IPbZC1HMoMWBUY0uqVwg6yttAi4nPGW1TN2OVaGPW7pYg7TqB/sbl3pAqiONbzrIrNX71zEp78wkSDNKSBjyms1UgQPdzYEtH9GbIcXAxbIDQ0OSyGZBagSIWd6x4uUYj3bNYGslwrJb7IulEVXj42Rs5y6IG7K4Q8DHZlBIeR57NdaWwkhyfOT6KX5gUvmiJKcHbkCH8TUSlNShPdHl8AxAcQ57WlP/Wr58viZHpxwFZ824aqwJglWl11JdBAW3Gg7ghV1X0sp3t9P4+U+GTuMH5WjhVHIcL0iKa2J2+X5uw4K4ivCiWD9m7Cy/5J/zqELoc81rZIYtDKTlEcmmf4Ol3vT9qXfg8n17Ev2Lm+1lYQfJe8pZZ5AbTUsuhQC4wcFWlKf6YZbTgpnsdWMdwNQUlvsWdOQYKAjJ9AHSCgk/W/108doS87/UDlc9APHBUtj53dUoNsZppz3eB5FJSySJ1cUO9RhOoUxE2FIoidG9XP9uL4lM2EYhJC6TaWq4RjX5k2tl03c2/4ZfiOtPrmLAibcfveMNPhngksob+xy9RGUMMJeWM1lIboBSZBrfRfrc0itUHLaWBJQ2omviX4211xRhPMDS4Fr2+nvhBGXxJ+Hvyul/oWESS4AH69jC3akFSm4YIT5Ir3wBiUrihoSGNLmyAhw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(33716001)(122000001)(86362001)(508600001)(54906003)(5660300002)(64756008)(66446008)(66556008)(66476007)(91956017)(1076003)(76116006)(66946007)(9686003)(6512007)(8936002)(186003)(38100700002)(4326008)(6916009)(2906002)(6486002)(71200400001)(26005)(44832011)(33656002)(6506007)(83380400001)(8676002)(316002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ASKSvl1ikfb8IaQwF4UC/OxH2uAHFZ7xfeEvIN2tGSL6euPMWqvNrQaENq?=
 =?iso-8859-1?Q?vlkDapdZWI3cwQQrAc3QcwvGHbpB8H1DdaNz9KxzK/q+UCWfAM65S8nUUE?=
 =?iso-8859-1?Q?oYe1gFttBYzBepoka1hzHQ8t7cALkrsmc4eKsGMkPimgRleOL7MVJCZyf2?=
 =?iso-8859-1?Q?yeS8ztLow97N8XTIEQhR5iFYtWtpZLd2qB15/CQYKcta7ZFxJNE6D+uN+r?=
 =?iso-8859-1?Q?iHWa/JqsIoFpPyeINrdr3yTH/ktUq6bYAij2TCJ2zhJzAyTpyq0E6mAC6W?=
 =?iso-8859-1?Q?LofhIda6zbGU0epkn1AJ68F4cpsp6e3wepjSkzk5IFKL6cxGWIqM1RKTyW?=
 =?iso-8859-1?Q?9GmsOHjVOySiJkyyUfHRlQBMIT8wjr+sf7FMjIgPdd6UQIpDZ4l+20JOy3?=
 =?iso-8859-1?Q?fi49kCaVBCybub8ADQZM3x+QJIQCC27xgLm+el+FVZS9Jt5fY2v7RDZBuR?=
 =?iso-8859-1?Q?/NUfqcl45m4UKR6/HBQoA+8N4NzB3/uecWJmuNFUHnSJ0VrVe+JPj3ssgK?=
 =?iso-8859-1?Q?aGaU/zzTPEIRNzUXGnDlyQEH96TIAAJo+e5xo/VG1jRn8Wur2IXZpEp7Gz?=
 =?iso-8859-1?Q?2XiKeudzSrQ73voDIJx48eMPZqHx6Lb80Gh6R5CdKtDvmPlvZ+eRCsIhiZ?=
 =?iso-8859-1?Q?8ncfH6xFoml1iDOMr0VLzSPSkqV/NnLd7f2UCHdWsuEJ9zdurr5RZ5ruIM?=
 =?iso-8859-1?Q?IUNVHOLKk0E4dWAq846eDEFjMO1chT7CbKKQ+zV6x0qcPAqAhbq4AcnMAF?=
 =?iso-8859-1?Q?0tR8yjUdURFsUUQrDNDBM5h20pExrqwxvDDAD1dicHNfC0FH1sMVxrjBsL?=
 =?iso-8859-1?Q?24+FbEN7oEBxBY+sSKbF9thjkFzvi3r6uO2sQR351ySThqjkXFjGabtGjm?=
 =?iso-8859-1?Q?ZgF6WwgdIQjLVWiiSNcqF3dHouWvFcPxg619h3nbEucpnCHponBACdfMjM?=
 =?iso-8859-1?Q?W7mTuRC6ofTXw2lOxc08+SRQqMWvZzV9vvm9E5u29xyAozZ3KwCPMyet4F?=
 =?iso-8859-1?Q?NL/7eDnLakgYETxpadcojD70M16C5q1AA3McrkHAHuT+xvvabyX54WGmaJ?=
 =?iso-8859-1?Q?2uTCrfPs/w0nfGVrFwG+NT7b8Oi2d4Ies5LwJlgQipP5Bx1V2SYSbP2m3u?=
 =?iso-8859-1?Q?LfqiUQDBMfkOrOQh6e/UAsCzAFkQ0dCuy53AmmQukTJ93xdUuXmWgPw03y?=
 =?iso-8859-1?Q?Wkq2OMpE483AlIHUNga88NFwc9oC1vgKKmc7PVUlyOwq9LYel1he4+B3NF?=
 =?iso-8859-1?Q?l/W6mDIao95TTj8iECnnueH/8MU3CTRWCNFZteyTzTAYeKHa+UmdvdnogT?=
 =?iso-8859-1?Q?82NsHJMuCLfQ9R5fNw+lb24cw/zb3T79FZsAgbJ+pAwV9Q16Qhe5/9fijq?=
 =?iso-8859-1?Q?aog1k9LoSrWYR50UD/3MEVXiVpQ+otoYVzDskLODvAQtv/65BvVlGmIgt3?=
 =?iso-8859-1?Q?uOlWG7MTvnH4BiVy/nA36SY6pttgWXCpKGEPxgVhYJbzMurNmT/abmckf/?=
 =?iso-8859-1?Q?hsJR78UqCJn5p515sn0n1mQJnBWSL3Q4rHNrGrMVptGIELtaYYVI2/eoNE?=
 =?iso-8859-1?Q?o7JBXbj5rJt6xJgM44QBijjNAP7sImZqGChbppzkGJCqG1D177thj0Pnvv?=
 =?iso-8859-1?Q?yynN8x7x1A6nouSpKYQ8WQ6+vY2JN1FFS61hlr0xBbLmghvLRaj6oLYSUv?=
 =?iso-8859-1?Q?fvVzlRoPgiHZsT0OCyiOz2L2WAOtnqoK7kPCaU6e6Y+iQ1Tbe8yRNWgeYu?=
 =?iso-8859-1?Q?KrmU/mzG0Flebc21BncZg5PrA=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <28E307AEC34B6A498A74444A8A9FDC0E@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8d87ff-4589-4207-ac29-08d9b386081e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2021 22:17:29.1907 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aYx9a9yABqH3Bq6cgmmaUvumPpH67ZKaWfBDYpKmmNKrtpljwZXHXF9+GbswQ6diFsTRvf8OCQuzfWp+cfwDmIBmj3+o2rv259b34oO2aZE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB4417
X-Proofpoint-GUID: b7pR3Oq3Zp0iz06B5HpQSQvpCHzUP1zI
X-Proofpoint-ORIG-GUID: b7pR3Oq3Zp0iz06B5HpQSQvpCHzUP1zI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_11,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, Hanna Reitz <hreitz@redhat.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As mst said, not for 6.2.

On Thu, Nov 11, 2021 at 06:33:45PM +0300, Roman Kagan wrote:
> vhost-user-blk realize only attempts to reconnect if the previous
> connection attempt failed on "a problem with the connection and not an
> error related to the content (which would fail again the same way in the
> next attempt)".
>=20
> However this distinction is very subtle, and may be inadvertently broken
> if the code changes somewhere deep down the stack and a new error gets
> propagated up to here.
>=20
> OTOH now that the number of reconnection attempts is limited it seems
> harmless to try reconnecting on any error.
>=20
> So relax the condition of whether to retry connecting to check for any
> error.
>=20
> This patch amends a527e312b5 "vhost-user-blk: Implement reconnection
> during realize".
>=20
> Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index ba13cb87e5..f9b17f6813 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -511,7 +511,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>              *errp =3D NULL;
>          }
>          ret =3D vhost_user_blk_realize_connect(s, errp);
> -    } while (ret =3D=3D -EPROTO && retries--);
> +    } while (ret < 0 && retries--);
> =20
>      if (ret < 0) {
>          goto virtio_err;
> --=20
> 2.33.1
> =

