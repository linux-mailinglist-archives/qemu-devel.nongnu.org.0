Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6622F4FA04A
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Apr 2022 01:54:28 +0200 (CEST)
Received: from localhost ([::1]:47368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncyQs-0000gm-RQ
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 19:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyOO-0008FG-3Q; Fri, 08 Apr 2022 19:51:52 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:57888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1ncyOL-0001HI-MI; Fri, 08 Apr 2022 19:51:51 -0400
Received: from pps.filterd (m0127838.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 238KjIcb032526;
 Fri, 8 Apr 2022 16:51:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=g6f7Up/h9jHbzcN0nnfcHBxolFD4RkquyUM0rLFPYps=;
 b=bifeBnRWmonf6b4Y4zn6xQfiSE4yo6Qo9L0/4xmxk2vd8CPCP7dgRKETChng8Sh/2W83
 qaKKqwOJHiB2L03n4iuxepwETPBK2N5VAGEkd+JdHtBNgQHaELCovSCGPcr2pNV/7p5R
 OjgPP5/QID7AFlhIu11OV+pqVH5Vrs4QfSJv4slFrlwZVfQgTV6khVujrU0pI8jvj/sM
 8W9pva0VraCgYtsDGdlpJf2wohEFfkhOm9BFMrihy1upkezE+0Q+7k3u2W+ZxndyIhpE
 cZE95xinD7f3vVt0QZD7QZocV1gcpPXThsXN+8HrJo0tiac6mac9HSnTwP+Rex0YtgCR CQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2170.outbound.protection.outlook.com [104.47.58.170])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3f6p1ypkc9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 16:51:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=afgJcpc8MuUeQyuY3cZuF3MlJfJ7hSqoYOCAJGBfdaQhiY24MzWfZViXSi6gi1Q+LtPUGSgRxcwrLoXRDvq0EggqWEmCoZmPfasT/66wru4sB6XfSbi9Y9HPIvY9z6952zU4U7VUhyMP4Ggo1VanQlW723Z/ZRkUsuSUVv0iX7vxiMNbtHaGir1qTNYzSStzC9zKpsm6NNhCgPIxFA6+DcjmGGmqVr15QC+TS5p97+WxziLKTm1LBh4V3ozLQGlOO+1Jd3JCK2UPlGkV4x4MYEy20nvHcC5cIenuljZF4s5slPQn6LQam3rvcLBMlU0U1MO7g3eEVNSZqez9AEHNSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6f7Up/h9jHbzcN0nnfcHBxolFD4RkquyUM0rLFPYps=;
 b=CeXRkUPB7qCyvQg3U9UP6zWONxJbRXpvly1IqiZMid2M1SRKMZkGFPX0zWJaA2hjf7wm8PxkHcYX7ZqHQLCvcCB8IBpv82rFVNAhu50EzTzO8JHCrkMe3fDNtWPGoWZ63Z8TMysfPNPUCYR1VFDDimjXhZ0alaXbC9vbjy/ESODX3OrfSDZvSbqGkC8UjyJL8NNpvWO3itX5HBzQ4f7s5I2+XWANDPLCFk/RkOKhwfAJnEEnAFmFmW3U8YBVgWk7oX7qLUdDg+HsT9clZP3econrAcDXnYNVHM4+XOBWh/AjXZ+3zvF3FbQUCwMxwWLK1x3GSzHXjcHeD6lMUVnnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by SN6PR02MB5262.namprd02.prod.outlook.com (2603:10b6:805:76::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 23:51:42 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::2065:e953:bdd:ae4b%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 23:51:42 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 2/3] libvhost-user: Fix extra vu_add/rem_mem_reg reply
Thread-Topic: [PATCH 2/3] libvhost-user: Fix extra vu_add/rem_mem_reg reply
Thread-Index: AQHYSoS1NsZMdIYW50KwNAgTLFP3bazmsecA
Date: Fri, 8 Apr 2022 23:51:42 +0000
Message-ID: <20220408235048.GA10957@raphael-debian-dev>
References: <20220407133657.155281-1-kwolf@redhat.com>
 <20220407133657.155281-3-kwolf@redhat.com>
In-Reply-To: <20220407133657.155281-3-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 139a033a-64bc-46c0-1fac-08da19babb50
x-ms-traffictypediagnostic: SN6PR02MB5262:EE_
x-microsoft-antispam-prvs: <SN6PR02MB52627223107858928BEFFE8CEAE99@SN6PR02MB5262.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lWaUS/Uu4zYoCd5T4Clm3cB3HEw8EBb+Xxeta/QuEfvWp4Sk9z8cY0CDE/VduUpEqGCS/ItWlRxbGC1mXqFyPn8zBAc7Op9WvWWiEw3bJujy3Qc5rImgrdQUDpMCr7ntcbNOFIRdVY9eXXbfHStc8mMLE4MmzwsYhAYJ31JK6PqgbFUz0vGK/+5ul0VmPoDDMVE64SPzKdiUEPexozd+sngB5Hq0c58PkEfOlNWMnKP2Eo8eiEasLKsga2gI/Q5b4ydlqO9Pn+e7GfJKYN78b7JoDgBZtLYbFebZLbJsDbeJRbLWHNQg0/PSmkjsiqOhfOKXmtF765WspYZh5vhvMW5oS4pQhZEpBFKJlFUOnIQbzT2Ad9lI9O8VhnMDoeoOORExmhEhLHaDwY3xBEcWG2ilkGxMHEGgYcCGB65JmbFxyUh9MOcrUgdLSmO9uNrY13WaTzOlYG3VYOq54Xm20A+iojYq2UmPbmB0LqxLLDzQZQbJRNeVrQnpWP3fj76uju0YHAHPqLmyjudjQGD8ZIUfQSP8ZiKcynZt0oiF4OfAyXXGOK5NHJqt/okrENbC7c4O/KjUa/mbBPIgGLo0HRFNK2NM6Yu2vkGFGuFP+in3+RJKlvjdwOtQ47DCd4xMkHHueu7wUXekIZXP1teXQQE9pylR9NYCMNIYuuFkUxCNItVOVubwTh/ih8EC95xJcxdrEhUjP29jU9Jn7VPhyQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(38100700002)(38070700005)(508600001)(33656002)(316002)(6486002)(6512007)(83380400001)(122000001)(9686003)(1076003)(8936002)(71200400001)(8676002)(66946007)(2906002)(76116006)(66556008)(66446008)(66476007)(86362001)(64756008)(5660300002)(4326008)(54906003)(6506007)(26005)(186003)(44832011)(33716001)(91956017)(6916009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yIVw8EkYVAvuDuUui+y+/nE85SdxbSi7U92OYAYe7oveeHHvV3ms1AMltJ5O?=
 =?us-ascii?Q?f7EZyMtOH6IvKhIS0NXXmiN5hWCrJFFk3h2W+JLgLB6oR8Dc3qqULfDvAxq8?=
 =?us-ascii?Q?MWnbJ+/4PErXhEJ+PWTdPmlQy95VTe17izcgy8VXy0ZZCi9fFwNsFO0HyJxl?=
 =?us-ascii?Q?HC5wgMH/mvHuh91xipvjMm0habBalnbKYGo9rGq1jCrDYNXHbVxJNxGjsdEv?=
 =?us-ascii?Q?Mx68cxFC/22xj6hDNqbio8UqO3EXcorqprTgfmIoGG8xRMgfQRQaVTidWNko?=
 =?us-ascii?Q?0ftA2hrgr2x2uo6oyaO//NMQdR7/SzgwduB5VDQl6iYvGLkYLjmMUXHP5a3C?=
 =?us-ascii?Q?SNGsCO1qex4DBxs8OcTWOEBkI9QdSmq/ZpU0AV8lqe/1D1oGqIzaRhwCkP1F?=
 =?us-ascii?Q?q+mQeN+y2brAwrtQoSVKA2JEd6a0EGAwfdCxkBwXyuDPHTbIZH9+7HFoqdjD?=
 =?us-ascii?Q?BI0csMRQTlpOIvQq+esW6FFlYBf2s4id7B9ihqA2pI3Y/iCRggThi+OQrs8K?=
 =?us-ascii?Q?oL3Sksk6kBVQMQyBTbQRRku8Cj0BGXsfzB+M7r/m8x4yPjkNNHjhax0VM8Pu?=
 =?us-ascii?Q?u8II9vAgg9wGESkLQFRNgP8SSt7dH91UqXBxYMddow/jCx6LtcO6VytNNF/T?=
 =?us-ascii?Q?aV+dSYLhVbQLehUwv8pg4MpzB8pm4CcbJTuY9ZRngUtcC9A4Y6Ju9t8bdb2I?=
 =?us-ascii?Q?3HvyDuwC3Bhk+4aVEqHZmz/DyfSyms2Te50R2GPrdgUrEqtk/fFPD/40Rgcb?=
 =?us-ascii?Q?GPl8wyKpK+p+X8bmFRh8oBKx2Agp7m+VqoO5WhokJuds6OMbVOvE5N8WdB/S?=
 =?us-ascii?Q?DEZj94mZouCE6MvbxS0lfv9rpKEPbPUfV53Q1a6yj+HXhfvLZdXqI17iFEf/?=
 =?us-ascii?Q?q5yLroio7VDahzV85VLnCTg6Kkx5e1sEh4jDCXv7OpO0/r5gSPJQK/XyXeTs?=
 =?us-ascii?Q?3FavTOeCd/obv0i/e8Tn4MXKD/lc3hPXv1aiBqus29s5to6C3P/IbHyFQhEV?=
 =?us-ascii?Q?HH9rJcoGVrmQOWFeR6Rv2IOAounUMQrQxgXDBEydY2I44OwFfmqyBWvZkgj9?=
 =?us-ascii?Q?OBVP5bTlq6BWwKSg7UbCktLWWctyxJWtcSL4Oci39YH0eIcAIv7GnSpOshDm?=
 =?us-ascii?Q?PVcFYNDABaFRCPsIrQUDby1auYDCWWlbJIAXqlksMcvafLjlMd3kjGiJZojH?=
 =?us-ascii?Q?xB0sjdNhTQK8RhdDdd28E8o803VofrK0xVlKjDzeNsUFBWY/eu52mdnQZhYu?=
 =?us-ascii?Q?cb+iIcVKiICA1eWRUbpNFRFs1tr0tDVW/ElKXZ3GNTSd0nKhN77RyfCe+/G6?=
 =?us-ascii?Q?Uaa3cmeBdh3NcOEY5hQI1zU3dIUAkSbeqjAqbzZ1nGAMgjabCaguIhlNfTGl?=
 =?us-ascii?Q?mXDZZos4EEaks1dDG5lKlVe3SSaeoViwOyQXVsIpQtLrSM5m7I8pQuvVtWFq?=
 =?us-ascii?Q?kVlAJ8w0aXLgrswPqASKleo0Hn01jPjNWdsT5ZCktntjpu2YQ8eriAgyH7IH?=
 =?us-ascii?Q?91hMuRTCZTvCtXMrOwNt7kny1X9CoMO5chxNiXUBTqDSU2poiLYyBacg95dN?=
 =?us-ascii?Q?5VeUEiGUr6gTDOwfHZdU7GuPALvx10cVGGleWlolr+xXgZhqdy4G9fcxI6Cx?=
 =?us-ascii?Q?bBgGKcx7s16GB4ctHYUPlGBXj6exPUhbwSEIUXACvv8bacPWxAtW4X++uxbV?=
 =?us-ascii?Q?uku8x13H96DexS6b+lM1Rmr9g6KpoK8D0FYKjdNZC2jXnsugj99BVHwtLMg6?=
 =?us-ascii?Q?rkc3Kaq2AkjPlAJs7qApAM5BGjBC5D7X9UUO3FhrAzQOnw08h+sP?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <17D5CC564B37B94B957B20972EDC3E7B@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139a033a-64bc-46c0-1fac-08da19babb50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2022 23:51:42.2923 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vAN98uqiSifdF++u6l5GkuImiLZsfHngOx2rKpspsXO9hJu/1NgSA878Y154v02kkL46GoqiwbFJjv2dqr6o1uuy2IMsVOQbgWkywc2XmR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5262
X-Proofpoint-ORIG-GUID: f5meyqKPFFe9JO7wWkmMHyVHe2tYQ-CA
X-Proofpoint-GUID: f5meyqKPFFe9JO7wWkmMHyVHe2tYQ-CA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
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
Cc: "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 07, 2022 at 03:36:56PM +0200, Kevin Wolf wrote:
> Outside of postcopy mode, neither VHOST_USER_ADD_MEM_REG nor
> VHOST_USER_REM_MEM_REG are supposed to send a reply unless explicitly
> requested with the need_reply flag. Their current implementation always
> sends a reply, even if it isn't requested. This confuses the master
> because it will interpret the reply as a reply for the next message for
> which it actually expects a reply.
>=20
> need_reply is already handled correctly by vu_dispatch(), so just don't
> send a reply in the non-postcopy part of the message handler for these
> two commands.
>=20
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  subprojects/libvhost-user/libvhost-user.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>=20
> diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libv=
host-user/libvhost-user.c
> index 47d2efc60f..eccaff5168 100644
> --- a/subprojects/libvhost-user/libvhost-user.c
> +++ b/subprojects/libvhost-user/libvhost-user.c
> @@ -800,8 +800,7 @@ vu_add_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
> =20
>          DPRINT("Successfully added new region\n");
>          dev->nregions++;
> -        vmsg_set_reply_u64(vmsg, 0);
> -        return true;
> +        return false;
>      }
>  }
> =20
> @@ -874,15 +873,13 @@ vu_rem_mem_reg(VuDev *dev, VhostUserMsg *vmsg) {
>          }
>      }
> =20
> -    if (found) {
> -        vmsg_set_reply_u64(vmsg, 0);
> -    } else {
> +    if (!found) {
>          vu_panic(dev, "Specified region not found\n");
>      }
> =20
>      close(vmsg->fds[0]);
> =20
> -    return true;
> +    return false;
>  }
> =20
>  static bool
> --=20
> 2.35.1
> =

