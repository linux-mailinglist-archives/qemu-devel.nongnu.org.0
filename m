Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AF15AB810
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 20:16:26 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUBDN-0007Rv-CT
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 14:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAvY-0008HF-8s; Fri, 02 Sep 2022 13:58:00 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:4208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1oUAvW-0006Sh-FC; Fri, 02 Sep 2022 13:57:59 -0400
Received: from pps.filterd (m0127839.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2829P6AP021553;
 Fri, 2 Sep 2022 10:57:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=ufLpIlGURPwGRRHYd9AQubsjUn94zSYWJpxZ69EGe7E=;
 b=Rtgv2opBitiO6qzik4ocV0GLWFEG1A8dXLw7JB0HMhBLBblSPwvbud8B3UuUEm72eJpi
 8hJ6uH7nA0a7vXTY8HW9qrHQ4rzLc2Rj9/wS0AajUYvbrU5WYyngWi+c/bn5D/sPli15
 gmiXkEZVRBTDeDZL8qikfM7riHGiBy+ikVAaw83rz5QuHqX04Fa5oAOTltDAoZFknbta
 kVeTYokglLELq3o24011325vBq81tP48/M/xVrvGkKaL8Wis3yhPVgrZoq6lGcQ/2q5A
 3RYEI9a8KFffHqg1bhRHuqjVowscR4tWKmEni9x3sv+/3laLNzZgX6UPdL740qDRg7M5 Pg== 
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
 by mx0a-002c1b01.pphosted.com (PPS) with ESMTPS id 3j7jbgxgt5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 02 Sep 2022 10:57:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ooshtk9F3BaWMPTD9F9mbssF7sqWaLiBROTSeIkAWTM4lwxKFDPZE7EKA3XoCB40otcc4R+i5H56Rn/iwodjaKivgUP9wOtfsufloFeKkoVEB/o7HfF0T8RWkoysVCmmwOj1grGrUpXo9BPZbyI3MPS9zyuIGxoDYrjWqQvon0Y2TNX6C2YZmu5lVyQPhLyrIAh73efakrzuPOQVo9qDYraMjIIH23IMCL7It3uYb0aK3UTHp0bvFv737Jd4+7a+EQ7epZkCWR0fKnC0N+TMSNiiaEtZ96eALhxsYBBp840tyePk2ceRKXei2AYGJNkMlP+ICwxLee7z7hAt740cSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufLpIlGURPwGRRHYd9AQubsjUn94zSYWJpxZ69EGe7E=;
 b=NPdNGmkIw/VOG0K3eVVoiCzvLyBKXfT5anwbi8t7+bynkNAOccUN7J8upryRVZce8sRqTEWiSZZqvVhKHM/J5aua7rTohm7F/fCx2FPOnN947LLpXy5Nj+gg5z/RDkEvKGj6NzPL4EJMfUZbKNy4MqDRLm/0buxMUNBFmpLkSJ1eXiY6Yhk6XMj2bSnfG/jhLvk52iOHBooEIc1BIk0gDIaJ3YlunD32eqtKfnBscDddfuuKosto86b1HmRnfEcBQ1UDPe1p0ycOYaJNnmXyRhd3W/3zaKy+icAApgHXLPtKCLHXXUVpGFZ5OLjaQISrw+1Rxa8A8sfht6PmSfvqTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from BL3PR02MB7938.namprd02.prod.outlook.com (2603:10b6:208:355::20)
 by PH0PR02MB7429.namprd02.prod.outlook.com (2603:10b6:510:9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.12; Fri, 2 Sep
 2022 17:57:53 +0000
Received: from BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea]) by BL3PR02MB7938.namprd02.prod.outlook.com
 ([fe80::e8ab:ff5d:aded:71ea%4]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 17:57:53 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Daniil Tatianin <d-tatianin@yandex-team.ru>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "yc-core@yandex-team.ru"
 <yc-core@yandex-team.ru>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>, "jasowang@redhat.com"
 <jasowang@redhat.com>
Subject: Re: [PATCH v2 6/8] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Thread-Topic: [PATCH v2 6/8] vhost-user-blk: make it possible to disable
 write-zeroes/discard
Thread-Index: AQHYuVjIg0eip0aVIEezIKMtlu2OLK3MeFkA
Date: Fri, 2 Sep 2022 17:57:53 +0000
Message-ID: <20220902175752.GF5363@raphael-debian-dev>
References: <20220826143248.580939-1-d-tatianin@yandex-team.ru>
 <20220826143248.580939-7-d-tatianin@yandex-team.ru>
In-Reply-To: <20220826143248.580939-7-d-tatianin@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8897b6f2-e611-4255-15ed-08da8d0ca8ba
x-ms-traffictypediagnostic: PH0PR02MB7429:EE_
x-proofpoint-crosstenant: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: L5zuEK2ABl9AV/F8PpD6/JD+T6vImSPk/hArK8h19gkRfhGuvpFFonjGZPUJxeooZJAu7C0FDvAp/bENjZDK4AEw4Xt/MsiNFMEByg9BlUtw5XVFwJRY9eYrLVL0KXiCvE7EvlS5iLsI9xjbvTSk+XIUr4mA4nXVqdRS4V3eLvO0/y/C+YLzD8afSzTINbQ+XVJBWnad8shrUZ+owcQFBUTNSSi4CVn5HULl9oKH621rUJK1aTSt2yC/4bFCCGlcXy5HBzPRZKF5xZHWhbmkbms8INXucYGFY1RKamVn469VVs52gLbIPL0HGI5Qg+h3ZwAjR3xALn1IWYmo/dtLtw8pHvcGP/+FzMteWnqoFBbUK33yWVY6530ZsGoBOMXf1kzlw0bPQ7oSyIsgMmMEyrv6s4IXjXgrF4CFTcrRszPI364kpf1uqp5gav/CGHvW1qy48WEhPT85kVkHz38hIIRbhlzouYVmjAdywaVXZUgrTvBfz7nnu0yFvbfEKvncNQ3kTnnqFAtgfM+gryQAArkd3mE8MgZPLpGbH3ufiHClMed+jxGN243nOXCQRJZosgyEOBCtGMK+3xb5itjMYZVxLxU6UBrCM39Nq9j0VdFLWmqFjx6I4ka8ngcWBQx9/1KGtQRJ3piSQ4ireEp2VEr+w7VoAU6Vab1a5BR0vN29hnDKe2HeEeYSLjbVPHIPuHqkSnA6ADxS2U7ot1aRNT4/hFWzPAl/KKUSK7qFu9tAGBAIxDBOfTVE03t5VuL4EEtAZRz79f8Tr68tLuqQgA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR02MB7938.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(39860400002)(366004)(346002)(136003)(376002)(33656002)(76116006)(4326008)(33716001)(54906003)(8936002)(66476007)(5660300002)(316002)(6916009)(6486002)(44832011)(66556008)(2906002)(66446008)(64756008)(8676002)(71200400001)(66946007)(478600001)(186003)(9686003)(6512007)(26005)(83380400001)(1076003)(6506007)(86362001)(41300700001)(122000001)(38100700002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hGScaz7fQVXEL0DHJKUTfzj9QRatmXTrzG2TVmjY/5kyHdgIeNWkE8AkKEqM?=
 =?us-ascii?Q?GBeCs4BMNV5Qx2Vg4k2l6AcoI6l9nPNT8Kj9eJ2XOb+Vxa3X+Qjrvjs/V0ZS?=
 =?us-ascii?Q?8KdzCY89pZTnAeRmlBnfLD9dVEQAtkrBiDPjFPZUuhIPLadUAR47eTtH0xXK?=
 =?us-ascii?Q?fd3+0OshzP4ybkcPnnh2U1YZXjRSlY8itZ4sI0F+u35bxBygPOVVuioP63Fl?=
 =?us-ascii?Q?ZdoD6MNN8Sg0qMCIckSEAXMRhpSZLulaWXwCorfC42zeZVFnOOloemzrZ1g2?=
 =?us-ascii?Q?Thgp58LWRurE/cjHZoLdPn9dd1yJ4BwA/1l3zeUpLOnUfGkKGGrp68YFWQbl?=
 =?us-ascii?Q?RHcSbLvWWcUn4M4vEn/ba8XOULIzCNk8EHWJXtILA1jpYeQsetemetttbth9?=
 =?us-ascii?Q?QnBFyn+N0jUFSNDvh0ef22yaRu44OpZLG/K8RarkUn72qljnR9v2aKl11wK4?=
 =?us-ascii?Q?Jy5MCn0p23sA60vdC+My37R5sp30UTwGGSSn1EkRzrgQ8zDd4390To0BGm5g?=
 =?us-ascii?Q?/rXfiFQvc2tnYuE/2M8LaTZSDygv9uJ+RaM8igx/lBQCVHOJtXUTmnuxRIIp?=
 =?us-ascii?Q?DhN9NTA0MCfVQCRTyiI7O8+9eOP/lhrY2X81b1ELRQFvIu9NDGexpBNOElLc?=
 =?us-ascii?Q?OvpCk2l1tE4HuMBjP0TCNkfihrw6G6brWso982qRlBhhRxuwIH16V13UsUhr?=
 =?us-ascii?Q?F3WPa9XPdRCeaaFYwrdMBOYOXOYhHcU/aeMwKpl67NpSz+5fQ6ChGLmzUvNm?=
 =?us-ascii?Q?C2mxjcpbOqF4LIxq+LzNzXPFmhpADiWA0i5wY+VNGrvDsjvSLIqaH4IRdwJf?=
 =?us-ascii?Q?Oaecf6jCAzjSl6Us/00GxpVGac3IczuqEjc2EM33t5ePVURF5Xo7KB0WUo5G?=
 =?us-ascii?Q?1xrnp6s27ggHJ+M8mWwzRUieboY60aFz9AMu70lJj2+2fyFa8i5LXv0+OGQs?=
 =?us-ascii?Q?Fr8OnRe7YQkO3WqhuFxOjIi7X7f7d/I2TfNe3V2Dc9ucHND6sCvDb0yV6yCe?=
 =?us-ascii?Q?S87pbP3DqkMivCDMF++d18iiBNKNaFJsEtGYoZdjfQ6UOkeuAyq1QlIde/It?=
 =?us-ascii?Q?9lyZjDT08sRbcRpjO9rdGFOcs1CR7J8Hfj3OnjIvuPg+FehYUFS5LRCdHUwH?=
 =?us-ascii?Q?yFs2UX0vlBCIAafjBK2tkjGaykxkzKft3kITLwJ1GgYPLsqG4LeCm8//wlCb?=
 =?us-ascii?Q?ezz1dvBjYFutszARnUx7Mdy4DE7c++mQl7aQYvE7Th51ioIsjQSI8lLU/CiR?=
 =?us-ascii?Q?oeaV1vnYUvuyg7cgTIYFm/CS6fbhxADivp4LVyT7+BDZr5OhqI35Sj40gRgF?=
 =?us-ascii?Q?UjfJ0SZspDAxd8sLThkl8FKefpEMaKODQ3TgjiLw4PcLrXYPM59Jaq09PxiF?=
 =?us-ascii?Q?rpjEDRsXOURwEJla0I9CoV2NTqltaqcZ2m+n4+qZmSvLCvzRnWE9y1Vge/Wp?=
 =?us-ascii?Q?k0X7qYzA4Ijqe7Zb7fLWY3tDLRFWuBXrTYdVngRUCgJp9xPsJ517MOnhOzzW?=
 =?us-ascii?Q?jm/LYj9di6jlW0KRj29sFckB4cFnfKpxSzkm9ViFrTHF+vnFYL3s7BoupmJZ?=
 =?us-ascii?Q?dEHMqEFiqmMoPQ5C2rR1nv9YrNaVRDAvm9k0qLC0YTVNw/GXk60sBAXtoZai?=
 =?us-ascii?Q?GM4rSvFP72tj0ZPLTRAOXiI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DF6FD79DAF8F8047987786EEC064C8CF@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR02MB7938.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8897b6f2-e611-4255-15ed-08da8d0ca8ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 17:57:53.5768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1q3voUfN3Gm38fQ51nqVL78jzA2TMoSzFUEowjdU3CAGkwFvVZxw60XG4G8TYw/TIVjxBM8TaZ66ifwi6yvQsZq1kKs4aLUnJRQuFIfzEck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7429
X-Proofpoint-ORIG-GUID: JeQ4UJVNpwH9v6VuPQ0BbT6qXqOrIENJ
X-Proofpoint-GUID: JeQ4UJVNpwH9v6VuPQ0BbT6qXqOrIENJ
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

On Fri, Aug 26, 2022 at 05:32:46PM +0300, Daniil Tatianin wrote:
> It is useful to have the ability to disable these features for
> compatibility with older VMs that don't have these implemented.
>=20
> Signed-off-by: Daniil Tatianin <d-tatianin@yandex-team.ru>

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

> ---
>  hw/block/vhost-user-blk.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 9117222456..4c9727e08c 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -259,8 +259,6 @@ static uint64_t vhost_user_blk_get_features(VirtIODev=
ice *vdev,
>      virtio_add_feature(&features, VIRTIO_BLK_F_BLK_SIZE);
>      virtio_add_feature(&features, VIRTIO_BLK_F_FLUSH);
>      virtio_add_feature(&features, VIRTIO_BLK_F_RO);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_DISCARD);
> -    virtio_add_feature(&features, VIRTIO_BLK_F_WRITE_ZEROES);
> =20
>      if (s->config_wce) {
>          virtio_add_feature(&features, VIRTIO_BLK_F_CONFIG_WCE);
> @@ -592,6 +590,10 @@ static Property vhost_user_blk_properties[] =3D {
>                         VHOST_USER_BLK_AUTO_NUM_QUEUES),
>      DEFINE_PROP_UINT32("queue-size", VHostUserBlk, queue_size, 128),
>      DEFINE_PROP_BIT("config-wce", VHostUserBlk, config_wce, 0, true),
> +    DEFINE_PROP_BIT64("discard", VHostUserBlk, parent_obj.host_features,
> +                      VIRTIO_BLK_F_DISCARD, true),
> +    DEFINE_PROP_BIT64("write-zeroes", VHostUserBlk, parent_obj.host_feat=
ures,
> +                      VIRTIO_BLK_F_WRITE_ZEROES, true),
>      DEFINE_PROP_END_OF_LIST(),
>  };
> =20
> --=20
> 2.25.1
> =

