Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0CB538AD7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 07:24:07 +0200 (CEST)
Received: from localhost ([::1]:35992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvuMQ-0004Tj-5a
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 01:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvuKJ-0003jh-03
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:21:55 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:65394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1nvuKG-00051o-Dx
 for qemu-devel@nongnu.org; Tue, 31 May 2022 01:21:54 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24V2tLpP030285;
 Mon, 30 May 2022 22:21:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ABe+wJ3lQc/u8CLL0jWywxbxv+wErRa4l+AIxKWqG/M=;
 b=w/D0u2x8mrFr+0b96CJ387H/+BhJGJSIb6w39Xz/iARMkJcMp5B5Nb73pYmd4T24ERKg
 LPpzEv++T5kn3AHCtxJxmpHI5lc/RafKimc6RA+g1Hx5S/K9LuEyHaeHhbmAR2tb1K/r
 9XXwiM0jM7zQIJBxUCcz9isoUX8VbDftLPYy8wjn4C2tBiyYExzBZcMr4TuXvbmZR8sy
 6IaqcqWc4cB2v4pfkFP1MPcKCv8QK6FJcyFRcr+snYxQz6JjgT2OgCsBIQkNURhisL3m
 kbytWjyMeT0xdIjw4exWCb8RBF10E1nBCzVDGdLAuUM5d0VxqNudt5JOR41ijWb8cXjo 7A== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3gbjteva5v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 May 2022 22:21:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DJMHUY0sFbYuOOuKyHiLxkqWpGyjwCPrNIaVtVPteOXfKQDIYc5pPCPATz+o2ce6KtDkeLZQVKvNcq4+1ny2uS+lXn4rqPaMFkrjokpY2hoiRyIeYrwNzBF/UbPtl3nva6aw6WJYh7OWTeLvmlExN2xLHv7Mvm8VUzshbRngQvdpM9i5K0Md21UemZN8Oo6ir/ZVG9d/IOuo9tBlp90VpEoaTQ9vbFHzfWkrzjOZQEe5GGn9niNOLP3S33Mj1u4BGKgSnqex3/JDez/X0MVuBH/YqwvWXjkbS7gtn60WlDF1iATwyU13tN+0NZCip9mLICORBGQZ/z4FxtPmg3TJHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABe+wJ3lQc/u8CLL0jWywxbxv+wErRa4l+AIxKWqG/M=;
 b=WOYQmjN8SfNFznyq+Nma7OlJ7tAWBOVl6/Yog2UU6t4yhss7fRQmsblV+lOheUN5JiVGgbAbxTwNw+/NIOwDuL+IQXVExMY1fTKgDQJcewGWYe9ihbvYjNgHzDFLVbZmeblFYiH9n33IvkLqGFE6OPavakRqvhlnJCKeWVS920UlHXa0MRjelXKbquKiB5JW6lEwmmkpmRHtSll3Aex5sK05D63W1VV9HBU7iAJd5jAtoVvtsUuFB9gT+bolQh3Bvs+lxFaJx0mCEt7pl8LI9bddTrVUEVq3kXMO9WfY9kP0YuD3pTF8eGGfxSTbvye/E+NJRCi4ZGAI5Y9GPEk5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by BYAPR02MB4454.namprd02.prod.outlook.com (2603:10b6:a03:5f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 31 May
 2022 05:21:42 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::c123:e4ca:ea71:d40e%9]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 05:21:42 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Changpeng Liu <changpeng.liu@intel.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "alex.bennee@linaro.org"
 <alex.bennee@linaro.org>
Subject: Re: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized variable
Thread-Topic: [PATCH 1/2] hw/virtio/vhost-user: don't use uninitialized
 variable
Thread-Index: AQHYcEEXKaZZNxmyVU2jp87U9Yc84K04fBsA
Date: Tue, 31 May 2022 05:21:42 +0000
Message-ID: <20220531052140.GC8262@raphael-debian-dev>
References: <20220525125540.50979-1-changpeng.liu@intel.com>
In-Reply-To: <20220525125540.50979-1-changpeng.liu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 420c5ecf-7773-452d-00b0-08da42c57274
x-ms-traffictypediagnostic: BYAPR02MB4454:EE_
x-microsoft-antispam-prvs: <BYAPR02MB4454056C0F9BCAB33C148765EADC9@BYAPR02MB4454.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sHXPuA8tAIgPoxGDgNy6QR4ieYiNB/vjyCcv7AvFa+RgCoW+CxD8CaRdF/BSG3UoUePQneoxaW7u+v2cFBnBRejqdcmwUCjD5pQzmQP5KXsro/2zU4+kzp0roE9tJRLPQOPcb+W1ceW+QBE3QSNMAGNS3S0RiyzM/ijh53SxAJJsp6z+sbCUoH8G+EqF675DJjMJoL13ThtfLojlFrnRh40VHEIQr2f/IgLqIqSo79sl9ORrjVCrdRATUumow2dlQs1O04ZOQDIe1KTd8mH7X4p8hscAOy041IuluDQzn165/B+ILuQofRJQG+UyPaxw7MQw8hs0FYxw4G9kMKQ02ufHgKzAPF9bdEK/AQqldI4lpSpSjhlXB6qUT9UU+7lCCT+74ZyfA4mCEqXJVX31pMjt91az0QWEuqiU/8bFcffhMWEoMm7ojxdJzJuh0HhmTIClQeFScaC4wz7nBOmKcVoYsOfCOwlNsyHzjUU1srUwWxkJtCIoZEAgp5bJU61QvJIp4m2RoulPgtAGQvWKsk9eKUy3/BNhvRNdAKNaCyAOHJM+gcFRxeuIkSWhRS3yGvnTLLtO8tfrAZ9cy6lk1spBKpJE39dI6OHOx15hq+8D0YYv09w0bUQuWVDnE9h2q2CEXtLMMks6Wm3UaznOv/UzJ5VQNU6VjXFMPcThDMVPwUhShREmJVAjTzZyVby0F99SeZ6+bQ8TgVUqOXUTCg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(76116006)(91956017)(4326008)(66946007)(66556008)(66476007)(8676002)(66446008)(64756008)(1076003)(6506007)(6512007)(26005)(9686003)(8936002)(86362001)(44832011)(5660300002)(83380400001)(122000001)(6916009)(508600001)(54906003)(6486002)(38100700002)(33656002)(71200400001)(316002)(38070700005)(186003)(2906002)(33716001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2cM9bfAUxeCxSBx9DQXPQ9qxAz4OhqUYnSTUJBgs4aSHjaVym4pTUzeUyQco?=
 =?us-ascii?Q?S1P9H7arOb+CUK39dW9HquvG0+QK0Vf5Kvxb0/ZBCvgpKM/qrWyqYwLLDlid?=
 =?us-ascii?Q?5U9zMjTP+RvvC44j/KhwSBF72BxWjmx/RL+thZbavMX62jL3AXBPJGvYKZOV?=
 =?us-ascii?Q?Lkbe87T83upaeLfHF6VKuiwKhq1k5zIzW5z0QjA0NKs7cKR5Cr8B4MOi1TOe?=
 =?us-ascii?Q?DMa4MPFCjDx53/KP5MWEnVj5tXhBNbHQ8f/VOZtXXWRMIM5Bo9P6lfDqF6Fu?=
 =?us-ascii?Q?TqkPD4wSXmE12mbAnX8XYVugB7Ki+EK/eKNDCmzu8KMvUjrshs5/PGNlhHWQ?=
 =?us-ascii?Q?Ovw7P1DP7LDOonrBE8/+ovkD2ilsr2kEmI53KqDdA3gKwGzwbTnP+DfWGtHV?=
 =?us-ascii?Q?Y6TLBuHJaq0ewPeJlXlgBlQuxMfq+hiWkacUjbcaJomAZPsOYsa53ZbDk1Nw?=
 =?us-ascii?Q?cQdpIa/0ctUIyvGofD238drkxy+G6BZZST3cR1DpVIDG2BiZRYaAeKTME+yh?=
 =?us-ascii?Q?eYptxnie3K80PNS3hZu4nQXqXXNu+UhgBFBKaVgrDE3nhDA9r2yo21Hb8kaU?=
 =?us-ascii?Q?KtlB/Yxf0dKFsMq8lb6gQ83AcWGjLf0OiK91deYzLFkMuQbmvtxy7GprYJ8Q?=
 =?us-ascii?Q?BGPtGhyvyFgHEdpwf8+WWER7RYdkH7PN5hzm1BCYqYGOsFQWojkWWrIvykpS?=
 =?us-ascii?Q?2TJ8B8DaEju9gLtNKZvVJe24UhUN9DOwMepIWrvAPWD+/vlhJWigvjN4jt7M?=
 =?us-ascii?Q?TW4eSxg0Cmw1AXJ8CI2ajeW6/DPiV+qD3oOTqOyNLVtgebLrm85+4JZ2OVUM?=
 =?us-ascii?Q?L4dVn0f1ngdQRNg5bGITIxYrLewPQT5ucynT9y3MCu/4ciEhwoBfWcoPHUdI?=
 =?us-ascii?Q?B5iloKvGoUvue54MkCnUgS+utBsGqYODLVdepIS/Y5+pGF/IlntoVlh/lbtT?=
 =?us-ascii?Q?fDqUum0DVxhEc92bA3+Vu2QQcvfFoqwHuEXqOvfujiOkgIbdrLzgtrvKUqrd?=
 =?us-ascii?Q?v0bYWRH9PA6qZ0NBrL9HY4ZBefbnjPLonePfxJH1PBFoN9TOFJx7lhIFWvET?=
 =?us-ascii?Q?yWOSsN8CQohwtiS7TxFo43bAnjnFphmU/uXm6DRRDyH8yZSwjpr30+CtPXnQ?=
 =?us-ascii?Q?dndlLolFBXCRSFrEYm+U4nirbC9jarw+JPkMzTYTbIBdKBp+hq8vBAYUzUxR?=
 =?us-ascii?Q?yrx8Drv0kn8PoAmM4MP+HgAce0L1itC3rNJkSYseHd4X+pUjhIAH72UwBXFi?=
 =?us-ascii?Q?EBRxkqAszMiIuZBpevG7ssVDHQ1EM2kwHLHt3GiTWKXOo6SysBnhhH7XNCIL?=
 =?us-ascii?Q?QT8fWCTilsMoy1AgdqoEav37szAklpphiTRXMTbalW0szRcHM/JFFrTwF2RP?=
 =?us-ascii?Q?gjmKunyPOU3cn7LV893BQJPTaDF8ITZYpi0uuq8GPDF+CXMxFg46Ll7e5tmg?=
 =?us-ascii?Q?xeXmrEsWD9moB6+psOW7jXg3qorytkIJAOmhVUBvgFz8uLi5lEGgZSVrzkHo?=
 =?us-ascii?Q?5vn2d1ap5JDkDKmV7MVRO+J7Vwphjb4oPFSY3rdlm017pWsCqMrv/bndz3Ah?=
 =?us-ascii?Q?xrDxnVxH3s+X1aTvGWosJZxMmzZ5jYTJ4RREsp8yfyHTefIGwnUtIgplRSwR?=
 =?us-ascii?Q?unT461bDpYxq7k6RKRpJYZ8kFOWsYLO/2vKoZjaALhPTn1EQyhPAtqXk/yAm?=
 =?us-ascii?Q?8vcrRmBFGrK2LSVL11Tdhig0OhL4NmVMo1UokmcGCjINEfhuqrutQ1cx7dUw?=
 =?us-ascii?Q?TnpAHkfAHMSkjlJMvUZ0SD2rxhBcmIfNOE7imzpm8z8gcBtv7P5e?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11E6CD1370D4F14C853F55A90FF6A6B2@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420c5ecf-7773-452d-00b0-08da42c57274
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2022 05:21:42.2072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VWy/dUb2pkEUH91y56CccnmWIzlsI0rgql1IOCEGRIG5n5/v3VAtQg3iaRPxy71T7IXlY29nxYntxfADnaPO9FFp3bhL8nz2429sXo0hNU4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4454
X-Proofpoint-ORIG-GUID: cNds902gYbshpbr__SXWY7JLOqwyLxeE
X-Proofpoint-GUID: cNds902gYbshpbr__SXWY7JLOqwyLxeE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-05-31_01,2022-05-30_03,2022-02-23_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

On Wed, May 25, 2022 at 08:55:39PM +0800, Changpeng Liu wrote:
> Variable `vdev` in `struct vhost_dev` will not be ready
> until start the device, so let's not use it for the error
> output here.
>=20
> Fixes: 5653493 ("hw/virtio/vhost-user: don't suppress F_CONFIG when suppo=
rted")
>=20
> Signed-off-by: Changpeng Liu <changpeng.liu@intel.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/virtio/vhost-user.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index b040c1ad2b..0594178224 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -2031,18 +2031,16 @@ static int vhost_user_backend_init(struct vhost_d=
ev *dev, void *opaque,
>          if (supports_f_config) {
>              if (!virtio_has_feature(protocol_features,
>                                      VHOST_USER_PROTOCOL_F_CONFIG)) {
> -                error_setg(errp, "vhost-user device %s expecting "
> +                error_setg(errp, "vhost-user device expecting "
>                             "VHOST_USER_PROTOCOL_F_CONFIG but the vhost-u=
ser backend does "
> -                           "not support it.", dev->vdev->name);
> +                           "not support it.");
>                  return -EPROTO;
>              }
>          } else {
>              if (virtio_has_feature(protocol_features,
>                                     VHOST_USER_PROTOCOL_F_CONFIG)) {
>                  warn_reportf_err(*errp, "vhost-user backend supports "
> -                                 "VHOST_USER_PROTOCOL_F_CONFIG for "
> -                                 "device %s but QEMU does not.",
> -                                 dev->vdev->name);
> +                                 "VHOST_USER_PROTOCOL_F_CONFIG but QEMU =
does not.");
>                  protocol_features &=3D ~(1ULL << VHOST_USER_PROTOCOL_F_C=
ONFIG);
>              }
>          }
> --=20
> 2.21.3
>=20
> =

