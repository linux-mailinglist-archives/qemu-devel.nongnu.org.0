Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 272B73A49FD
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 22:12:16 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrnVn-0003UY-8x
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 16:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnUy-0002gu-AN; Fri, 11 Jun 2021 16:11:24 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:62564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lrnUw-0003ZR-Bb; Fri, 11 Jun 2021 16:11:24 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BK8mqr010911; Fri, 11 Jun 2021 13:11:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=Dv7QTagFFEAryltEY821rDt0RGGjOP4Rj3zTLDfcxzo=;
 b=bIe9rGS7HVS8Y6S5oiBeo1U5qZWV4zEv6tE2uiMtnvxAUGCqsKdYsBzg6micNGXBGWRN
 23CWCIwlHvNUhyOjd7HR62/ZqGZOwTJyquu9O+PKGDLpCaiOhX4GCaQRAcOYRrzptrND
 43dHe4U+hO7NvRxQxoJo0gXIvf9Pre5qKJEw0d48zYWVIFJXjWE9th9a2BMAlpkEJirY
 woSsYsSU49V5HLU/j38kq8Lw5sRXpmoOTSemsWuSkUiaIwYrSQKURCJhT1x69rkFoLCu
 wNc/eOO51L3mVNu+sBXGARzDVEKSCp5s1B/T9rZ9PHGc/641wsaukCr/zaG3NiIsWTUD vg== 
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2172.outbound.protection.outlook.com [104.47.56.172])
 by mx0a-002c1b01.pphosted.com with ESMTP id 393kruka3c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Jun 2021 13:11:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMWAMlxOPhwAvjMh/SJcyJMWhhFX15yLR7qdU166uS4DyzFHYvpE4+kHkZBbRHOPNSLu0knZNG6Ysf0I5r2rTV6QwEvzA6VG6Mw9U3MWoYyTICPXGk5/TDHXS8Pa5fq12w+s9535DfoQdsu4rXwYZDCzePvpvXHyous3D3o/91gnuRVx3F5twI8FPMc0p5tJu9j3SLoo9xA9dBUf1+b/4Vmm22U+sbIT+hZmmuGc/31bg998xx0cC1wa9Qbi3I2/OJrF8Hp0DvjSV3EdbpwtWKlHfPp6UcMIjxGzhXOS+dg4AUdXSC4J9lO+zKXVLH0wThuvWR35JS+GFJpP2sA+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dv7QTagFFEAryltEY821rDt0RGGjOP4Rj3zTLDfcxzo=;
 b=HxgJKDM/pQ9Bn/5gaJbb+xpBiUuEFRfyiUmSVrTjLxf+LEk/D9qrfSiT8lgPF9LbaIsJL8PeABRakDBND565aLzduHFcz9RvH0j7FswqroBaIe+B80v9b3fcFZHH68eLFTtQ8nI6MZFPGpv+ENR8cHr1GS/zuBuIGb4T1XfQiuL2VFFN4BdHOyLPL5o/rOMh4wLiwcKOpAdUf2iNMYDVHgRmbqYu7yIf6t9At1pXkgiPsZu2nQjY1FbtvbbTj0EzU3BLnhMYP0tHBkVEt03+1ZLXuRQ6hDoD6sXfm2B/EORYu5troNK0qOlPPA1B62k1LZKNzncmUj75dbzUZSienA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA0PR02MB7371.namprd02.prod.outlook.com (2603:10b6:806:e7::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.23; Fri, 11 Jun
 2021 20:11:17 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::182b:62b8:51c1:ba59%5]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 20:11:17 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 6/7] vhost-user-blk: Factor out
 vhost_user_blk_realize_connect()
Thread-Topic: [PATCH 6/7] vhost-user-blk: Factor out
 vhost_user_blk_realize_connect()
Thread-Index: AQHXXUbDVBlCyHvmZEWrtOIYq1c6pKsPQVAA
Date: Fri, 11 Jun 2021 20:11:17 +0000
Message-ID: <20210611201116.GE26687@raphael-debian-dev>
References: <20210609154658.350308-1-kwolf@redhat.com>
 <20210609154658.350308-7-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-7-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [24.193.215.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91dec3db-af91-4b9a-e6bf-08d92d151264
x-ms-traffictypediagnostic: SA0PR02MB7371:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB73714A328889A1010ED4373FEA349@SA0PR02MB7371.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcO/V3/OFgIQNWI+mXIlvnrRXMyIfNhjUaY7ABE91vyOnQ6uSEGzYb6JoLiEhanCfFotedijNX8Gn4SkhoYDzYcvAf8xn+NFBJKMi+7GPilDIp2velKhZQ3sOVEPxYdHn71s7ONZOOLhwARde+sWv4kXXJM2KVvY/ZJ7N+fXe7U0NTKCJM+oJSdcN5T/p9zO/Yf909WMO7d16Mjde6z7Sr/40ecxOXmARp4jtsYWu5gojMujK7jHPD5Pg8hRpaCeArm5PKPoo6T32yao7NSp4pLPS7LnbEYsNRDVEn3h5Q8fXtTH1tfkqekiC+oTTg0gJbEfn8xCjU3eXa7FXzX/EwZZwoN2abCEhynofWYCQj3DfDky0OXenFP9K1iek9fJdPmSd6WbdUoGLRVnStlfStpwVoY1MpsDIIQsksz//fwV4Z8P1N1kwZoEJGzzG3hw0IpI2P7OteV8rMnG4BhpCPnmjxhwx0jBBjSaQoAECIVC2LZsBAkpvtg3ICA5yqaKIDjiTl52qHpoBm4qxPh9SJV/rpBZKTJ9cp0kPJG1Y/J9IvJZls6XyDuYsKARskjy8zmUyNvPECdPXJh7MpAqHjvLYMwsjn4veoAbKV9BjXg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(376002)(39860400002)(136003)(366004)(346002)(396003)(66446008)(64756008)(122000001)(33656002)(6486002)(33716001)(478600001)(38100700002)(5660300002)(4326008)(44832011)(26005)(186003)(6916009)(6506007)(66946007)(316002)(2906002)(66556008)(66476007)(71200400001)(91956017)(83380400001)(1076003)(76116006)(8936002)(9686003)(6512007)(8676002)(54906003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N0zaiHXLdEJfAJFh38ZfnOBppcrPLzoHymSeEdio8tuwg/4GY1hIluLqdZ4+?=
 =?us-ascii?Q?QhQg9rAKS0KZrAz6KHWxVcuO3iSdEPbvPcfNNApD2simnzOBMJ0gwDPyjE8O?=
 =?us-ascii?Q?ENsnZrLnaHETPLceEJ4xGrTvlCUeYXhhG7KKAHFiQUCLt/NWcasQCQaN4PAW?=
 =?us-ascii?Q?85qbweDT+DrO8MON8Do6w6hi2PWzSLT1DqqFDn/5o2IGKRBLCuC9JXYhoQzK?=
 =?us-ascii?Q?kzPSreQB6peqAY4ZnKj7qBIXGF/RlItuUwq2GPIV1eslqxKezrqgy9I5zV5v?=
 =?us-ascii?Q?czxJD6gzCqJaqNo0WzdouKQZN/UkHBPEh1t8rBdayq4bHRe7nMI7lgn27P2Z?=
 =?us-ascii?Q?GmfCARmR/swr8klumTHTAg2cDV68Fn9a2x9z3vEFB6L84pUGgJOcugNC7vsW?=
 =?us-ascii?Q?Jx+KlZ7DSI7gANvX7HYmcqK6icimKftX6u5OJVwiznkysMXb9efQGrzQRD9e?=
 =?us-ascii?Q?EowfiB2NEG+cYfwkItKWTbcO5SoWbesFjmrcKma11Sv0ueUhGuM3PuJbvNMm?=
 =?us-ascii?Q?KPqqQpaLly1FhJYCsk1imEo7uxmId1WbmG6AZ3ETbRVSmUxN8aZjiHhnixE5?=
 =?us-ascii?Q?buwOPoJDBFI35nk25WpG0QktvDqrelSwpmbOPb6tQPtYy2XTh0Ki4Fv/za0u?=
 =?us-ascii?Q?lAqpQ0dVck9/LMBzb9Uchc9BcyIrzvOhxlWaBSZmRpdrMRlHR0Rstm9A/6Y4?=
 =?us-ascii?Q?wpe0RTk8pFdys6BAQ0PbqphQRPyqU7cfUiDESMloO9sFLy616lAUPdicOQCp?=
 =?us-ascii?Q?msfjNEAstnOO1+WrAgvsggjhhYb1Ol6i4qlsKuIAObe1pt9d3vvKk4PbDL12?=
 =?us-ascii?Q?l9TqEy7rPFeBRttRxWn8TKkdLyw1Afl4CYdPqvz6wVUKYxhd4WIabUE0ApXh?=
 =?us-ascii?Q?+dOqrsziOoxUoq/tSw+GFUT4CzfCRjT9+HdEGaF6/9tUXqyhq1Aja8Dx4AZ6?=
 =?us-ascii?Q?X8qfs1vnVoFVov2P+/dAxwtouaO+Q4HyWw01bGUMu7KT/6kEyKjMSnomakkz?=
 =?us-ascii?Q?zZLiZcqb5fj+4w3fROpLF/2U4bSbnohtYP/iSmuq6HlMEpqjBh05FBN/m5vq?=
 =?us-ascii?Q?QdwmaVw/hJVhRn9EhGw7vDFgBF6NxELiA2xQefeIIjRtnxbCI0uPnRluitXt?=
 =?us-ascii?Q?WPCe5W4xsCXKxXBM3M2Egw+SoxH/Yb3Tqvg9GCxN9nze32XzIwY+ZI5fYhuL?=
 =?us-ascii?Q?UVvVc9qftkKZgs2oUMO2Y8r/2YzzL7k5Gqf/h3OXjUELJvMDqQNGs3Cu++uN?=
 =?us-ascii?Q?y3Kaq0Up5fIzgGMngW8Hb5hzTZht/oJ/0fWjx+DqFKdn4ehGeStcCDiJpa6+?=
 =?us-ascii?Q?ZHNRG3TxPfNlpG9UR1ONGNPG5R79Jo19908OCSs1+DQ25A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5EEA8C265504E44FB7A7D66293DFD49F@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91dec3db-af91-4b9a-e6bf-08d92d151264
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2021 20:11:17.4961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lyTItGNr33x4t9FaV8DNw3SMUgYVP0kuhvJT6w4b8ll3fFcK90yeiqAYhpm9L4Xs35+TEKlz13igisPIFzx0tFfN6iffn3cNyV6cNC7+W78=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7371
X-Proofpoint-GUID: NuTf56Yz2hwaaqfm0frirL2876W1fkeQ
X-Proofpoint-ORIG-GUID: NuTf56Yz2hwaaqfm0frirL2876W1fkeQ
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-11_06:2021-06-11,
 2021-06-11 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 09, 2021 at 05:46:57PM +0200, Kevin Wolf wrote:
> This function is the part that we will want to retry if the connection
> is lost during initialisation, so factor it out to keep the following
> patch simpler.
>=20
> The error path for vhost_dev_get_config() forgot disconnecting the
> chardev, add this while touching the code.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 48 ++++++++++++++++++++++++++-------------
>  1 file changed, 32 insertions(+), 16 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 3770f715da..e49d2e4c83 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -423,6 +423,36 @@ static void vhost_user_blk_event(void *opaque, QEMUC=
hrEvent event)
>      }
>  }
> =20
> +static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
> +{
> +    DeviceState *dev =3D &s->parent_obj.parent_obj;
> +    int ret;
> +
> +    s->connected =3D false;
> +
> +    ret =3D qemu_chr_fe_wait_connected(&s->chardev, errp);
> +    if (ret < 0) {
> +        return ret;
> +    }
> +
> +    ret =3D vhost_user_blk_connect(dev, errp);
> +    if (ret < 0) {
> +        qemu_chr_fe_disconnect(&s->chardev);
> +        return ret;
> +    }
> +    assert(s->connected);
> +
> +    ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> +                               sizeof(struct virtio_blk_config), errp);
> +    if (ret < 0) {
> +        qemu_chr_fe_disconnect(&s->chardev);
> +        vhost_dev_cleanup(&s->dev);
> +        return ret;
> +    }
> +
> +    return 0;
> +}
> +
>  static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp=
)
>  {
>      VirtIODevice *vdev =3D VIRTIO_DEVICE(dev);
> @@ -467,22 +497,10 @@ static void vhost_user_blk_device_realize(DeviceSta=
te *dev, Error **errp)
> =20
>      s->inflight =3D g_new0(struct vhost_inflight, 1);
>      s->vhost_vqs =3D g_new0(struct vhost_virtqueue, s->num_queues);
> -    s->connected =3D false;
> -
> -    if (qemu_chr_fe_wait_connected(&s->chardev, errp) < 0) {
> -        goto virtio_err;
> -    }
> =20
> -    if (vhost_user_blk_connect(dev, errp) < 0) {
> -        qemu_chr_fe_disconnect(&s->chardev);
> -        goto virtio_err;
> -    }
> -    assert(s->connected);
> -
> -    ret =3D vhost_dev_get_config(&s->dev, (uint8_t *)&s->blkcfg,
> -                               sizeof(struct virtio_blk_config), errp);
> +    ret =3D vhost_user_blk_realize_connect(s, errp);
>      if (ret < 0) {
> -        goto vhost_err;
> +        goto virtio_err;
>      }
> =20
>      /* we're fully initialized, now we can operate, so add the handler *=
/
> @@ -491,8 +509,6 @@ static void vhost_user_blk_device_realize(DeviceState=
 *dev, Error **errp)
>                               NULL, true);
>      return;
> =20
> -vhost_err:
> -    vhost_dev_cleanup(&s->dev);
>  virtio_err:
>      g_free(s->vhost_vqs);
>      s->vhost_vqs =3D NULL;
> --=20
> 2.30.2
> =

