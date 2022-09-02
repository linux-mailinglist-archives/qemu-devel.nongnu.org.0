Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84C25AB851
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:35:33 +0200 (CEST)
Received: from localhost ([::1]:37632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBVs-0005Gg-Ex
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAvC-0007Tc-0c; Fri, 02 Sep 2022 13:57:38 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:4850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAv9-0006Mx-2p; Fri, 02 Sep 2022 13:57:37 -0400
Received: from pps.filterd (m0127840.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2828MqNZ024774;
 Fri, 2 Sep 2022 10:57:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=RwbtxjI3PiBZCt8bMM6uJ6W8nhLsDutWE6KsVAuTDP4=;
 b=Z0KO1U5wmCRHaAZL6nDh0xMtDlr7yC1Y7u7o57fuuZ9Eo+jVkEe02csFS9/1DvMYOQNr
 HghvBxbSqmSu7oatbkurk1encuPOzfVRDabE4otzB/Gx4PDeR4cw+q9VlIdgS8pLthjJ
 tLAGAEre5NtSymH5k/wlnjg3q8Td9ug56Y/xTXV+idSAZi4TBs9UWGUL5rF7e0D62YRz
 DnNXPpHprarj6z0eN+lDOKhb6fPw0UDE5Us67+jswr6KV4eulMM8xr9ZyduAtrCA13JV
 McLf2AWMQKVPjItLmn2aWuFoN0ng8fwlbR0V2u6uCsT54oQlhlm1UU+GcEBHVEo7bHIH jw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jb4kq9uxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:57:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRqM3v0+anIHlzx5LmeZk5ApudPYgv5hUtTRM4/mfVcjv/MrDMrzt0o08QCwbfO33vNxf3eOk8s77d3IE0lFpTBna/4IOJ+YM5GnZ/NppJsrRhk3ZIJhOGcpMMOi5zi1PPNQQf+H+YzQSvAeCyL8aCQiF74+qAK5eYUjGZpQbBH8BDWHML2sb5pSqrDf7lhuvQszcYayxT0tjMOLiuumQ/IV8TTZFLmXdFRH8IJcjP9ZM8LePM4IuefgzhWkhXdkHpoynllm50HZNLe7BhDp687C7ApREgYDtRnHnREsHWe2ozHrzeq8uEBlpOM0D/ZtbLiVfXAFS034MjK1YF2Qgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwbtxjI3PiBZCt8bMM6uJ6W8nhLsDutWE6KsVAuTDP4=;
 b=Cegpq2DH9gOC7QREJSwkyv/NJmG9bTD3fGlkQuby0s7ra6XVB4/uLiLJzxLcGpIjw0+awe9sr4/l3CsQInY/KKcnVJaTnD1x8HqKAZxeHQEAF2rwGQkZM82/Agrs7O9XqCyg7CLu8UTZdJr1UvSvJurobZGk0XldeTMaNUknslngVX96JujorjqC2+OVgkUs/aG0TblfioSFL9IpCgYOKt8gNxDpWuGv4XFTIaeiHkCBUGgXVQwXyAeR3zLucQ6M9wVtVicABT1zoSAo99zJdHbTIUTtXLx8Y30B9rTjSH5OWRjysJooUKflQx4nXMiHjJZj2Ht84Hb/s+IgwXDBiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by PH0PR02MB7429.namprd02.prod.outlook.com (2603:10b6:510:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 17:57:29 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:57:29 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 5/8] virtio-blk: move config size params to
 virtio-blk-common
Thread-Topic: [PATCH v2 5/8] virtio-blk: move config size params to
 virtio-blk-common
Thread-Index: AQHYuVjIpaJlo3JKI0WQ0HiWarJ2Ca3MeDwA
Date: Fri, 2 Sep 2022 17:57:29 +0000
Message-ID: <20220902175728.GE5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-6-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-6-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a43bd2d5-15d2-4a97-d985-08da8d0c9a21
x-ms-traffictypediagnostic: PH0PR02MB7429:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LEx51zmeCAXctzS6LTsg5UsopGXFDRCLNhgVwHNAIh+fdU/BTp00DS5nbA78Zf7LX8J0NQgFvxAmlCGTrDy4t/uoMYw+3CR7Za8X/GjXBTKdv+qPZ6V0HvxZUKJT987L/w+rrq9aZvAJCP5ndhcqCv04rpmNJ/nkdA7Byk4o2VSqGcrAkAAQ7O369HwIYRy4MKq3jRUgt/aw8+hwttMLAtXCa4xKIJzgCvowgoPixyaF2hY0mGVsIZ66buDROZ7gkI0Gr6BiV3qLzGt3FQPts6qG9pJWzZn8IYmiGSe2KsiriOE/ZwJSUhJAM9eig1j3MoTHnNmohe2LT6ZWZTCETyyxWFcyWPH4ZV9NW8kWErpv5Z89yc89VqhpXLznPc0x2ffag8fKct8r8K+JIKCNsdiOlF3ud+HZRujd1yF2MbQ51Kki9OvmrKicBMOTEnUvZUiUbVJHJp34hHxOd+6T+AEqFTfcMwdK8/PhfOW2aks/lowuzepbKJACD+E3asxswktFjo4sz1ARze8Jwyddk0cSd7Lrkee56SFAjVfdaCtUVO0r6DOmJJa3CNpgui3os68Z3QSEmBwRizffe2dU5JkcOB4CPbGzeP7DMz3wlMwcHjxwePicNzv4y/E1lE7OASdCKEBjaQUx/Q+/oXSEEhOgXNXOyBZZHJ3+W9emf/RjvlTWtpBpq37g0j8mqYP68LOb1aWYcpmTkw/b4R6KVL5KvTPc6V6F3nKphYjN4qkczuqfEOjjAlmThXOrHCBbTq8B0K01MOCZMDZZMAuprg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(39860400002)(366004)(346002)(136003)(376002)(33656002)(76116006)(4326008)(33716001)(54906003)(8936002)(66476007)(5660300002)(316002)(6916009)(6486002)(44832011)(66556008)(2906002)(66446008)(64756008)(8676002)(71200400001)(66946007)(478600001)(186003)(9686003)(6512007)(26005)(83380400001)(1076003)(6506007)(86362001)(41300700001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7PR30IoYFNnS/sLDwNutE02iqIjVS+4SImfqRtgAy7kh5yUlAHKOr8viDr?=
 =?iso-8859-1?Q?zbCl4mioybbptXn4Ya0BuZdy10G0yRfhjjYUQVVISNIO1NgVUsmYE6P860?=
 =?iso-8859-1?Q?MlRFRKGkXJTH6xm/DyFUfcmzj4QVrnHbZ5UmwAHT0K+AU3QAYM2Noa2Bev?=
 =?iso-8859-1?Q?lWdN4ro1sdXRMVdVIb/iq9fArCsJHh8LWUetCxLEEDeSdyfAiT5pQzVJ+P?=
 =?iso-8859-1?Q?SeCVLlHElprbLuihhsepFUVl6tl54x62d0mE/ySHidm/Xp7UimNDKWr2t7?=
 =?iso-8859-1?Q?wQ60Bdvxjwzli5KQcUjqDwspriQpu27L2ke0q/pMNRzMiRSF8fKH9brNdl?=
 =?iso-8859-1?Q?DVPnI7pB5ettPLr5MoI3dz8MOLpkNocb8S/QjCZABWqXbc7mJHPuCBmAO5?=
 =?iso-8859-1?Q?zi7h3H7F9MXK8l4kKnp2djf2OzMiVFVYdeM5dxFko1VIflgoCfe/+Fk4Mw?=
 =?iso-8859-1?Q?4Amuzk6wriEZ3ZKlNSl8Sb8WqtmjGxntuLoLrjRjOMXG0xs2Vyyzq3LCRe?=
 =?iso-8859-1?Q?Fvel6rvHg3ALcMhyl3PnwyQz50XSIjvmHXJfYxcB3MQMkRgiK7CLmiNGWI?=
 =?iso-8859-1?Q?iJFXK7UEDouttzjuOM6cvj1VC8b2APWs3OBIwbQ+tZcvGT9u9gBG9kOmFr?=
 =?iso-8859-1?Q?VYA3bcGtSpouVYw//NCAZote2UjBAu6+e/GjCa63w/Bjl4VzkgQFr9ofFb?=
 =?iso-8859-1?Q?KMA35vSpmcJySWe/6YbbqSjWyXiOMBtkrKkGPWpznS5TagUi9ZSTyQjo86?=
 =?iso-8859-1?Q?OrJkIIZ2h1h4mi6GCpsxGqmPT4cYYnSa+Q4Ps/2oZsXbSSu1W6SO6N2ZLj?=
 =?iso-8859-1?Q?D+ocp00007rpI5tE3XSe0Ln11QsvxlMHEdt6K6NEld6fp5/M5Uz9LAgRP+?=
 =?iso-8859-1?Q?xex5jux7Lgw+q3bYwmC8MypIpWqegpHv99OHjIFi/IhArPj9vEJsIukD5m?=
 =?iso-8859-1?Q?8tHH+qaDP211HiorrVuZAILc+XNceEwfHzZ4lDcvJWHqQoKy9yB6iqHvr3?=
 =?iso-8859-1?Q?AR0v11xhN1z8IHvY39Nyn46BiNWTo4MRj5c7zo6GNYO30bYXuiDRKyt3RU?=
 =?iso-8859-1?Q?sc1Gumzx6hPz7W22oNTifn9DY4woLf6er29a6m5XdRQ28yTIcZIrtBg67r?=
 =?iso-8859-1?Q?xDhRq3hgwQzqb/9DzWf+7GJoffD5HQqmkPm6s07JM84DDC1NDjw0bDLOcl?=
 =?iso-8859-1?Q?KLSSUlscgu1kgl++Me0nyiO1FjmQNFiMA9OvvkxhKzViCI1Lmq3zc5oSfa?=
 =?iso-8859-1?Q?nEDOUedS6Sxbcf37bqfRjsqTXOca47N5H8k8Q9eu7wAZuxC6F8lVRwK9Dv?=
 =?iso-8859-1?Q?cahSatL0cUNVY88vvJEyirMIF7dQQatEvY7V6ZVxpAQSLugZarhYTrg/5P?=
 =?iso-8859-1?Q?18u4rU+6R+l3KpnicjimNgQM9cfO353CjL/deMYz+Yy4K4h+vcUzN5iT4e?=
 =?iso-8859-1?Q?Bkb2DH1ocggOeu7NeBok/MeSZolrPmawGxHlu3hVf0dxLpl5dOT2W+uVrL?=
 =?iso-8859-1?Q?VuLwjOEzSLTPfhW2w4bhhtdRNw5/unfmT+OVY7Q1Bq9bzEedGB7OEnmnjp?=
 =?iso-8859-1?Q?ZLcS2h5nZQVISwd9BYtPa/1ssxFh3SAUZUSHqukYGo6Jiz6M/xJbiCC2hb?=
 =?iso-8859-1?Q?iIm/yJJWjVtbtRUSvM5S/wXtG/nDRUC+fB+ggqT9MicQEK9cPVYQOJ3b58?=
 =?iso-8859-1?Q?P09Rx2GwIuFOoQRGR4g=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CB7DC9DA783D134DB3E57739C828345D@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a43bd2d5-15d2-4a97-d985-08da8d0c9a21
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:57:29.0911 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vUk/8N4tw76EaT2Jf7AE9RjqNWwNbfnsYMX/Mu95reN1TIFtqOW8Ug4DYPfNtR53P7GZ/Wl0uNN+HrLmYFk15f2wqCkwF4REWcCj0S/SxVY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7429
X-Proofpoint-GUID: pa9umA5nltTQdfcaWiblNbL83KhTiCzN
X-Proofpoint-ORIG-GUID: pa9umA5nltTQdfcaWiblNbL83KhTiCzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-02_04,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vhost-user-blk bits in meson.build and Maintainers should probably
be in patch 8?

Otherwise LGTM.

On Fri, Aug 26, 2022 at 05:32:45PM +0300, Daniil Tatianin wrote:
> This way we can reuse it for other virtio-blk devices, e.g
> vhost-user-blk, which currently does not control its config space size
> dynamically.
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>
> ---
>  MAINTAINERS                           |  4 +++
>  hw/block/meson.build                  |  4 +--
>  hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
>  hw/block/virtio-blk.c                 | 24 ++---------------
>  include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
>  5 files changed, 67 insertions(+), 24 deletions(-)
>  create mode 100644 hw/block/virtio-blk-common.c
>  create mode 100644 include/hw/virtio/virtio-blk-common.h
>=20

<snip>

i.e. move this.

> @@ -2271,11 +2273,13 @@ S: Maintained
>  F: contrib/vhost-user-blk/
>  F: contrib/vhost-user-scsi/
>  F: hw/block/vhost-user-blk.c
> +F: hw/block/virtio-blk-common.c
>  F: hw/scsi/vhost-user-scsi.c
>  F: hw/virtio/vhost-user-blk-pci.c
>  F: hw/virtio/vhost-user-scsi-pci.c
>  F: include/hw/virtio/vhost-user-blk.h
>  F: include/hw/virtio/vhost-user-scsi.h
> +F: include/hw/virtio/virtio-blk-common.h
> =20
>  vhost-user-gpu
>  M: Marc-Andr=E9 Lureau <marcandre.lureau@redhat.com>
> diff --git a/hw/block/meson.build b/hw/block/meson.build
> index 2389326112..1908abd45c 100644
> --- a/hw/block/meson.build
> +++ b/hw/block/meson.build
> @@ -16,7 +16,7 @@ softmmu_ss.add(when: 'CONFIG_SWIM', if_true: files('swi=
m.c'))
>  softmmu_ss.add(when: 'CONFIG_XEN', if_true: files('xen-block.c'))
>  softmmu_ss.add(when: 'CONFIG_TC58128', if_true: files('tc58128.c'))
> =20
> -specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'=
))
> -specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-use=
r-blk.c'))
> +specific_ss.add(when: 'CONFIG_VIRTIO_BLK', if_true: files('virtio-blk.c'=
, 'virtio-blk-common.c'))

And this

> +specific_ss.add(when: 'CONFIG_VHOST_USER_BLK', if_true: files('vhost-use=
r-blk.c', 'virtio-blk-common.c'))=

