Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B80F371EF2
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 19:54:07 +0200 (CEST)
Received: from localhost ([::1]:34136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldcli-00030V-8h
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 13:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ldcIp-0005i4-4P; Mon, 03 May 2021 13:24:15 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:47384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ldcIm-0001Pq-H6; Mon, 03 May 2021 13:24:14 -0400
Received: from pps.filterd (m0127842.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 143HNTk0005639; Mon, 3 May 2021 10:24:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=lZLtw/y0Zum7bQRZaYu/qzk/zj9LBhMh0v4UH5fgVY4=;
 b=RaQXhtMTX4+Bh8usBkgf6lz4UnGFI56N1ryvh2IyltiCWQa6bCtib9c9hIfmurkqH3Iz
 XW1Z/CB4V4dARZId148li3aQZNiiilUJmDNFECiBOoqHL2m14lMu8mtIDwetSRQ0NGHQ
 p0Zn4p+MjUITFkN9kT3xRA//RQdgbhHaOjGLRSvuHPJ079+1ggm1Kj5k0TAQ2Dj/s0SA
 B4cV1Zh4ooNzKv/mYxKzKOUpu4fk74CBwxxx7DrDKgiatF3xmL3ZsOwo3zZFth22uh7R
 wmwQfVL3onW+v+KbqoVAVKifqx8e9J7W5CpBiHdPRpBK2mLd7e89CGP5/yDxz/VNqXJt xQ== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2108.outbound.protection.outlook.com [104.47.58.108])
 by mx0b-002c1b01.pphosted.com with ESMTP id 38aeqsrun0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 10:24:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WCQmCfzEnzMvRs0ESVbuShhyxrpu6cF/9znI5ZAhUGcQpohfLbhNHMUGj8B6WKIhGRPKVD7/YTa3btpY7KArBwJmyQ3sp/8yDdlJp6pLtVCaNpaeO/KJsJp637aJIHqUsR7jCJiXDHtxw3uONgBHJZUcy3+AohZaQ2w9zWwFCrt2BaOq67ZfxeP+hhqJwlM9KbAnnV4+Cb0mRwdaOioiCvP+dmUANgj9OqDMbfUBz2kOh72WUXN5fyUKD05uQLXLdkq4Zklwk9ArJEFvhNhTc5H76UClFCV7ErAgM2Zsir3jfXugJ6+iGXqVlNhgPabNy1AFywmQ0B3nA0ZfJa23+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZLtw/y0Zum7bQRZaYu/qzk/zj9LBhMh0v4UH5fgVY4=;
 b=VIzgfZFxRrgrs9Yn2sBjgf4cK/dAsPrbwwREvxwDEocHXuruwBe+Fj7Z2umpQY5wOSftQnsK+C2PlJb0XA9hZU0Hwc15jKtv780qOF8TOXQsDivg7CoBX6WJ2wQopevHYNNlRtgoxiUIdCWZoUdQzWO5IWky0/jbytHqbhFr3UFc7hVorW+7iun08XwfTOrt7IMk19SCSHDqN5qyv6KpU3L+tqPnGq68lb/sUacRFZxsxgc1QWEFtXx7vK27QbiDoI2bUQPBjFfiBMl9XEiGuuAku0xsNzH5RZAjEt/rPgODaiEuZar8MAt9ps+I7Y71UpsuuBnCxB0UtspzO0ODOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SN6PR02MB4638.namprd02.prod.outlook.com (2603:10b6:805:aa::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.41; Mon, 3 May
 2021 17:24:08 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 17:24:08 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH v2 1/6] vhost-user-blk: Make sure to set Error on realize
 failure
Thread-Topic: [PATCH v2 1/6] vhost-user-blk: Make sure to set Error on realize
 failure
Thread-Index: AQHXPRr59WPezyD9fEWC3rPi5MH5TKrSCAcA
Date: Mon, 3 May 2021 17:24:08 +0000
Message-ID: <20210503172406.GB21884@raphael-debian-dev>
References: <20210429171316.162022-1-kwolf@redhat.com>
 <20210429171316.162022-2-kwolf@redhat.com>
In-Reply-To: <20210429171316.162022-2-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a8d53f7-3d75-4235-0854-08d90e58425f
x-ms-traffictypediagnostic: SN6PR02MB4638:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR02MB4638D810825EFBB00BA40B11EA5B9@SN6PR02MB4638.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mOZsHzeTVbF4T3SZKGZ7DERIFevocSavZDEQLWqoAK7GGQRP3lFxQQuIzf9t4ussmkCYnkgxDBpeHPVBRsD4sX+3SNy0C0aeTzG7ikYi/a9zZefCDTqOwUlTVY7eTik+O4W2A1zx4dnEDjYs21uNasX8QgyPdzCdW6+kYXdfTXwW1mxSLOPBLX+FG24eq93ooRve+DB/5fL3bl/Z7Te+QE2l5P154jk1WKqAYEU9ieJe4FO3r2temzJCEhqumLG3X/oK5/FBmZLI4j0aMU/wkpWtWhtBAmUFAqDVqq3uv5H1qq+DmLohrfFaLQpvvrd1uQIiClmjGKUrO1Gp0QFQx6fQuPWiLY4ucuhOLD6s5y8T2ifcyUljc0qlU6yxZ3p3b1HnLD3f3S6GMCTqaD5Z1vqxKTin/iZ3zPDDRRyYSUAuOw+WpXLEEhC0nMxMsDIhBvbvydsHEF9ceWIm3cd3xHr+GV/zOTWdPhfjORtk5jrplO7MEE1PbfkGx73KtUHFJE/cfzHQAdee5oOvBB2rNqc9O72wtMiuTg4903cvuEez0U0ZIhxzirmVvd3iw70I5q7tt5ACmGBi77gOtRqF5ZyNs+PDlPKulnJbcXPtn7A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(136003)(366004)(396003)(346002)(376002)(39860400002)(26005)(44832011)(6486002)(33656002)(316002)(1076003)(33716001)(6916009)(66446008)(64756008)(6512007)(9686003)(8676002)(38100700002)(5660300002)(478600001)(76116006)(91956017)(186003)(66476007)(66946007)(66556008)(6506007)(86362001)(8936002)(71200400001)(122000001)(4326008)(83380400001)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GnjwifQFnSNUJHPK+ZIV+LxV0W3iVtJqyXXpA/Qn4nl0nDQgyfxLkBuDeOXw?=
 =?us-ascii?Q?+8Rlmx1mkwNT8TJVBF57vvhlHpSVNJ237iTLPXwcXP7eQpFhusg0oY26nW8j?=
 =?us-ascii?Q?SSCJ7ik9HBm8Cu/H1qU4dUwe6UPWJpfmU6JhvXfu4zZq08KzfvqBdvL6L7FA?=
 =?us-ascii?Q?1wib/B/ydJG0B+ohmYKGa8djwbWSYbKKMKiS5DPXvr/me44XeJdM36fqY/d8?=
 =?us-ascii?Q?G0Dm7Os+vHX9K8c/vmMbGq2IyGKm+HGSxwyUep6Nfa5H8CSME4TU9gZSxF+5?=
 =?us-ascii?Q?JCoP9pbr7YFqctjG2cgtLAvvhU2zPcgcNYKNc9ZCQr45bvfWVqWZKyGlYTZb?=
 =?us-ascii?Q?MRvHuK3qWq7zl6gEbPIEBeIF0e5U9YjdkSa+5cL4Iu8fqLsnP8bePW2B6oHR?=
 =?us-ascii?Q?7DvXey6HvNbqrqcA/nmY8lvY9ol6tjcI3vu0oFmIwVYuZ+bHuqH3U0oTQoRd?=
 =?us-ascii?Q?BhdnX+lreILIQMEkkQwIWVYmTamw8x5zsf2ud4LqugJlq1DDyfNrXH451l6y?=
 =?us-ascii?Q?IIWjHPv2AQfpwcRpcYKvpfvb1wK0EFheKdbWrCUsnch3ZRaWq2/OLr/Orsj0?=
 =?us-ascii?Q?j1XG83R7XzhQrqANJDGYQ+kZv/yi2wbZT08Ff2YPUwgx6aLKUvhiRY7E1Z/C?=
 =?us-ascii?Q?Pp+mHQ3fu6EutMJW2HFwv+JpK7ASxymOng/oFCEdlM93WpTM45gvekOZImQD?=
 =?us-ascii?Q?dSmMtM8BXKFVATdcZEmAHr7fquIFrEtIZKsbWXG3l0o31Y4sEZbwxZQsk2cV?=
 =?us-ascii?Q?/UpsDmWlehz/t5KoCA+/zX+/VrcrN6VPF56HAJ5TpM8AyIQKK/2/X0ipjNCn?=
 =?us-ascii?Q?RwzGNzdXqU71uCDaerShwJNCxTHFWJ+dES0ZoS/dtxxY5ySxS9qXA3jgKKgM?=
 =?us-ascii?Q?3ibea67Rh2DZSXdB3W43942ZXK9xGKLpBHb1sIAsXUdtY45xJD1xyAW6tVIv?=
 =?us-ascii?Q?NTq7djX3nKhbI8dB4mCDAD01ObUBtt7JfkGMjJ2+caUSORnNOfzPn9PbAAyX?=
 =?us-ascii?Q?WrlQRzSQCN3qaeUOSndgw8q3okg25X4nNQUciRjo3cpFu7AmDoh1wM50C65j?=
 =?us-ascii?Q?VfUurDSg23jdedi7+HP+cCCSMQlU+xQJKD9wQpUWyq5tFqbg0sfuu93S0p/u?=
 =?us-ascii?Q?dmzAuQP9QtsLGlP9Fw/PpSwsc3/ASdWnfWvOZiDo0chJ5QJJTovQtizuLs62?=
 =?us-ascii?Q?NYv5pElozW+t42o0Z6uI3wSTcewMkGZlptBwEznXAR2xdsTu+X1+8MqkxxE4?=
 =?us-ascii?Q?4k4rJq1TjQU7DMkN9KIVGJGaXOq9jleqMhAvp+Nqw19QrM+dLHOHXsBhVVWt?=
 =?us-ascii?Q?6CSwbxJPdyEtD4P7Dr558vL1K1TTvVDy9TvCGgrQbt2xXg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E505193BD9B5C04A98ACC20B5738FBC3@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a8d53f7-3d75-4235-0854-08d90e58425f
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 17:24:08.1551 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: llpoPmstCzQCIOO5x4u6rkciaJZuKbyWP+kMo/35HzyhAE9Ozz9FihsnWjwFvZfvIldDhzWk+SDDM0066P7OgLKX+uKmkEACAOK91A+X8Qg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4638
X-Proofpoint-GUID: Kw0npdeR30Ib6zKwi64XheN6ORJYxCZc
X-Proofpoint-ORIG-GUID: Kw0npdeR30Ib6zKwi64XheN6ORJYxCZc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-03_13:2021-05-03,
 2021-05-03 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "den-plotnikov@yandex-team.ru" <den-plotnikov@yandex-team.ru>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Acked-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Thu, Apr 29, 2021 at 07:13:11PM +0200, Kevin Wolf wrote:
> We have to set errp before jumping to virtio_err, otherwise the caller
> (virtio_device_realize()) will take this as success and crash when it
> later tries to access things that we've already freed in the error path.
>=20
> Fixes: 77542d431491788d1e8e79d93ce10172ef207775
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index f5e9682703..7c85248a7b 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -447,7 +447,6 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
>      VHostUserBlk *s =3D VHOST_USER_BLK(vdev);
> -    Error *err =3D NULL;
>      int i, ret;
> =20
>      if (!s->chardev.chr) {
> @@ -495,8 +494,7 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>                               NULL, true);
> =20
>  reconnect:
> -    if (qemu_chr_fe_wait_connected(&s->chardev, &err) < 0) {
> -        error_report_err(err);
> +    if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
>          goto virtio_err;
>      }
> =20
> --=20
> 2.30.2
> =

