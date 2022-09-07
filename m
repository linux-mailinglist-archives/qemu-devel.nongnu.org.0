Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143F25AFAF3
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 06:05:40 +0200 (CEST)
Received: from localhost ([::1]:45250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVmJm-00016R-Nv
	for lists+qemu-devel@lfdr.de; Wed, 07 Sep 2022 00:05:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oVmGr-0007h5-Qr; Wed, 07 Sep 2022 00:02:37 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:39010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oVmGo-0002ss-Ku; Wed, 07 Sep 2022 00:02:36 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286Lbxt1020324;
 Tue, 6 Sep 2022 21:02:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=5ev5XK8lrwixBW/8cccdWpc/s3KZyypujIihqrzwolE=;
 b=LkappKirit1zqCgU3vrp9jzcECq/QWCrdv0nPufPlXJObSqPB4y6ddMhDKCmOh6aPI7s
 qiklMScotJ8V2PMScFEmIvJ73CAJkwDhdwJzUuRKMjwqRujsyBpTj4mcrLt8q7VRUHW4
 DpB3axryrUKy+iLLV/QQc62kmUUf6pGJ3u3odG7JNy4w8dXo0K4zbkyL101wqh0bPQVQ
 XCGFwiIRCwZc9lo7m1wHFCQ96J4NMiKBXlU38kwD1JjxxkgO16coUAuhW4rVwyzBxW9j
 itcKCdmBRW2NxwcGHHCPDUyfGa3WumN8SgVAe/qpUZ77utLGWkYefXX1mwJ/l/UWof6g LA== 
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2174.outbound.protection.outlook.com [104.47.59.174])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3jc2u8g3kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 21:02:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h9G9klepED/Lzfx4Nd5FJBpQKMhT5GdS1NoVfujst6KxAm+9ntKkZrnT/UsZkYSvQ6RzPQR8C12tAewiFPVSx5qMIL2Fk+igVb+N0T0wXg7tTe3T5To/WSS0hP2g5Bc5CXVyGUUTUBPB26A5ASDyulz+80FST60guZ3fhLszAGIlrphSzg9mYsrqE5NZj2k8BlDcIOq+9DZ7GBkt1//kLHtlKJT9A3x41vgdHcrYHh3lGZDo4UoVSWJdNFPXdUVIGbIGHlgLUpgzqla5CiaNGALmqmyN9WT0CQrmGMpdPbxACITrGblC3jhQe01WZvZQJFPImy6hBHg6Z2EM0lkOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ev5XK8lrwixBW/8cccdWpc/s3KZyypujIihqrzwolE=;
 b=PVOPgK1/TcZiANfwmi/yN295rMxhVt+nl6qcdj3xBf/JH7m534iT9eY0I9QNszrelgOF+fgfLLH+otK/oTNkmX1RHGPbcmuUEqKOIO+0zQwdc5YXgCvRlLngA4l1uUwKwQtfev72Oxi1Zf5SrIGyunY9gI+j739ko0UE2NYh3RX36hG9v1Q4wMbWTdvGA3XZB2qFqMvPlPmzix/Npy+l/6TB9Qd21+ta0/HxjdrEa15GODlVGw0u4JGLuty89+atesuCd8M396JzJB5Csgn07c40arllc7xZMcUodKbGshaw8LWYqsYxgf11J++lyo/+PNFq0J0lG6x4wdG/nGxnGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by DM8PR02MB8215.namprd02.prod.outlook.com (2603:10b6:8:e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Wed, 7 Sep 2022 04:02:26 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%3]) with mapi id 15.20.5612.012; Wed, 7 Sep 2022
 04:02:26 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Thread-Topic: [PATCH v3 0/5] vhost-user-blk: dynamically resize config space
 based on features
Thread-Index: AQHYwcKvP8gUp4hBlkmx4MOh0GqH4a3TWZaA
Date: Wed, 7 Sep 2022 04:02:25 +0000
Message-ID: <20220907040149.GA6661@raphael-debian-dev>
References: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
In-Reply-To: <20220906073111.353245-1-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR02MB7938:EE_|DM8PR02MB8215:EE_
x-ms-office365-filtering-correlation-id: d0127b4a-e436-4de1-22cf-08da9085c662
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gduY6V78qafBJnkf8BWjFhWBxcTjEru3cmd2wNG5pohuOOjUYwMOSlMgpsH4dn1YUcs+lSl6pzwVUlnsSSL/83vT8jpywRgXAacUiA3pHSm2lii6skQd8fuGeRA0L1Negw+lnVHY6Wa0QEGdaQ8wledqVFi5HywN3x9pHDYGvdjZTfsR2VRN4bRpiRqVOZU1IjDR4T84HFuoSF6rhjmUKUd/ubg/rC80A4c17FTOjAxoBNRH04SQm+Lbkmmea1r6teMPvqdiemQLp19NG9l2VnsCwyYAqpD4LjkMFszoBmO8oEVIBTb6KQjC0NA2DTO/r3M+2YZt/YvDcV054x2mleqblQ0uw/8ttDHmFnXCGRkbEfWHb+ZRpSv2/YjBGO1QeKLyAop2XyHE5Rqb4G/KZZfs9BNYuOIGG+dT6phOXMoWYfaCh9mopWDmgK7P69fAAjVrKi613Vc8xQIIZhqRJktzJPCEVnzk09r1pnLHLlTjKTaIjKEEynEXkUf8gCsVAL8H4OLAXWxpIqsy2101WsjmE0eKZMpu9NNPuHXrCt++k+FAo3B/bBF8Q6Z2FEiKpp4yFHxi0OrlsBOBQ8txMp1/I6Xt5rwAA4jVEFS/xg8OU4/2SWr3WrzNWToWRhFUFwFGYiOhR0T4e6qYKnKGaPZhrpDfgRnChapItXQiKxfsa3Ehp3lBrCtKILRqDrNfvj8Q1snksuMI1ZDKyFskMle/PyYC69VYXv1wGUrfPTfkxTQVJCTAaDjdtlpX3K+i/ASmUfT3Ar6en3UNDV/QeQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(346002)(396003)(376002)(39860400002)(366004)(136003)(66556008)(186003)(66446008)(76116006)(54906003)(83380400001)(1076003)(38100700002)(66476007)(64756008)(4326008)(6916009)(8676002)(71200400001)(91956017)(66946007)(316002)(6486002)(122000001)(86362001)(6512007)(2906002)(478600001)(33656002)(8936002)(38070700005)(9686003)(6506007)(26005)(33716001)(44832011)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?QGABtkFxcVIc0pDYpQ0AnwY+PZy4wxtdCXOyX2WeDqAZ6LoEvmdleb4BFzxM?=
 =?us-ascii?Q?RU6c6GgCPGBHItOw+BveuFyxrbzPBqgSBMP4G+nt2cpeUjDMnd4Q3eL5o5cJ?=
 =?us-ascii?Q?eTN/fYCuEtcFgE1OBSjtRZfv1ZZ88ErRCHwI1oUOVNYC8HOW6cLLFmGTTsis?=
 =?us-ascii?Q?6297dDTcg2w9PubKQzHZ20rnRfbHDe2Y0pGSmDM/2PImU44EJsmSeXgLwUiK?=
 =?us-ascii?Q?72C8gspG5lAWrBJSRtle8sSQyuJ2PmVb8QiysaoAK/jLgj9b8LU3FIcCMrAA?=
 =?us-ascii?Q?TpKUVAcdPmiV0vqH/K84Tb4FYKx/5jpAjsjoTzqpx3iF6aEmXYmyBDtJ4qHl?=
 =?us-ascii?Q?qQk0Y+bWO3abCUk/a33KlTCnKVDf+CofdiSbTzwjWOyb+i6WJVLHrspENsfV?=
 =?us-ascii?Q?X6RsWQE1KvV9ApcWaJSqyeTEffFA0S7aQqfK2qNTeoYB0TP7rvK3W/ICwgYC?=
 =?us-ascii?Q?sqyQ2+akq5GG1X5zCgt/xfzDcXCIMDEohceyhWfZdwLogRSbQggaj0W2y0zj?=
 =?us-ascii?Q?TFgSk1uYzx87bATaTdBqHXUVXMtT9ekuS9fqu/uHkQQo9xAQJuGLDnApbg3K?=
 =?us-ascii?Q?kQ7TyX6T21rxzLz6Ya7ONnk9B9i97QBMua1JvnJ62HdIg3b7z6kHkRagdO4g?=
 =?us-ascii?Q?ymX2OIjccmuzluEcVS+YcyxdOZ3pIbfIjfbjHL0qMvJ5IAof2dMISDoD9Wcc?=
 =?us-ascii?Q?npUJmBTUvpb4wY/7QX21hRiUz/se25JKG6nD9BJ8OtOQsENdDQtlIaVw9+EB?=
 =?us-ascii?Q?UovIiBwqQoKh5BqhTMPCVYhekWPZ/mD6ZwUI24LVL3HaOvTHpE9iJbXgtZcg?=
 =?us-ascii?Q?W6zsISEIbK5eqBKw48Szi5lvitCev9gYrmwqImgDM7ZSGHSk5zcVaxXEgcXb?=
 =?us-ascii?Q?pJFVKUsODI/9TmzrHi5oNLsVbaAPUe7anByJK+QkNElzbQKYfYUB1C/Tt1Lm?=
 =?us-ascii?Q?roDlFiIv7PQsnH7EgWUpEpIuZBxLcbfQ784zDQP66Dx9ytgyZNPMpFXtvro9?=
 =?us-ascii?Q?3/EH7xujzKS1ttdJFSwWbrzkhKuDy+WoGkcVCePCFOvnE4VmmJmOsxdeIreg?=
 =?us-ascii?Q?4tW4RJUAeWFfwMY9cqUOiRogGoqA89lZCVNIUnEDPSfEC2pM7NxY9LcvfzVa?=
 =?us-ascii?Q?IN4LdDQ6eIxDUg/QZgei6Ie7FxyYddLk59gjpKO8Cq41TUslQHaUg6tL7IWr?=
 =?us-ascii?Q?h9lbMOBw2onqlA2YMhq4wKia7gh6uApJPYe1rczsRlOCXy5gAcm+qeHYvesL?=
 =?us-ascii?Q?EVt9LL/hMP+9hGuDMuBgXfFqRkt83iVNf8g+vv71x+xPNms0T/4bBaPhLzAG?=
 =?us-ascii?Q?T7CkQ7CtHdgyLBXAJNSTzuMyq7y1HrFCK28ZJCfd0mUZb5c+XhZ5ivXzCofK?=
 =?us-ascii?Q?KOllW0HLVUkl6dK+VNAWzrb4ts3Ispad2YdCJvdGfs15XDLg1BekGj+CNYdJ?=
 =?us-ascii?Q?B4QSERFWgEmTuDww0c3+LC9E0ZS+4A1VvgIktQNYkEZNLWIe4xvDN4AfT3Cf?=
 =?us-ascii?Q?hwyI1olxc5LKdMrekoAybayVSudbnafDdkGH3VCmv+BS6YFWdPi/EO9+ORjR?=
 =?us-ascii?Q?GO0aoZUL4FEQ679OtuyqjTdCZLIQGgtwm1DL7YzwKEQYxVwyvNuX0LovxA6l?=
 =?us-ascii?Q?O/rBT//+joxxcozIhh30nis=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <E1AB08B188411F44B6DACF521E03DFE7@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0127b4a-e436-4de1-22cf-08da9085c662
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2022 04:02:25.9561 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uVYhJbwVWZQks06mmwDGaVbGIuNLedXwMuHqeCpvt6uwiOhFMxWKI4ULIEXv/NhAJZTyqq27oKNIdHOQKVtXBrGIr9qaDziR7Z8HPnlY7eQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB8215
X-Proofpoint-GUID: oQ1mB1nIG4XxXMoFrC6UM1rrn5P2csLW
X-Proofpoint-ORIG-GUID: oQ1mB1nIG4XxXMoFrC6UM1rrn5P2csLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_02,2022-09-06_02,2022-06-22_01
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

Thanks for the changes. For the whole series:

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Tue, Sep 06, 2022 at 10:31:06AM +0300, Daniil Tatianin wrote:
> This patch set attempts to align vhost-user-blk with virtio-blk in
> terms of backward compatibility and flexibility. It also improves
> the virtio core by introducing new common code that can be used by
> a virtio device to calculate its config space size.
>=20
> In particular it adds the following things:
> - Common virtio code for deducing the required device config size based
>   on provided host features.
> - Ability to disable modern virtio-blk features like
>   discard/write-zeroes for vhost-user-blk.
> - Dynamic configuration space resizing based on enabled features,
>   by reusing the common code introduced in the earlier commits.
> - Cleans up the VHostUserBlk structure by reusing parent fields.
>=20
> Changes since v1 (mostly addresses Stefan's feedback):
> - Introduce VirtIOConfigSizeParams & virtio_get_config_size
> - Remove virtio_blk_set_config_size altogether, make virtio-blk-common.c
>   only hold the virtio-blk config size parameters.
> - Reuse parent fields in vhost-user-blk instead of introducing new ones.
>=20
> Changes since v2:
> - Squash the first four commits into one
> - Set .min_size for virtio-net as well
> - Move maintainer/meson user-blk bits to the last commit
>=20
> Daniil Tatianin (5):
>   virtio: introduce VirtIOConfigSizeParams & virtio_get_config_size
>   virtio-blk: move config size params to virtio-blk-common
>   vhost-user-blk: make it possible to disable write-zeroes/discard
>   vhost-user-blk: make 'config_wce' part of 'host_features'
>   vhost-user-blk: dynamically resize config space based on features
>=20
>  MAINTAINERS                           |  4 +++
>  hw/block/meson.build                  |  4 +--
>  hw/block/vhost-user-blk.c             | 29 +++++++++++---------
>  hw/block/virtio-blk-common.c          | 39 +++++++++++++++++++++++++++
>  hw/block/virtio-blk.c                 | 28 +++----------------
>  hw/net/virtio-net.c                   |  9 +++++--
>  hw/virtio/virtio.c                    | 10 ++++---
>  include/hw/virtio/vhost-user-blk.h    |  1 -
>  include/hw/virtio/virtio-blk-common.h | 20 ++++++++++++++
>  include/hw/virtio/virtio.h            | 10 +++++--
>  10 files changed, 105 insertions(+), 49 deletions(-)
>  create mode 100644 hw/block/virtio-blk-common.c
>  create mode 100644 include/hw/virtio/virtio-blk-common.h
>=20
> --=20
> 2.25.1
> =

