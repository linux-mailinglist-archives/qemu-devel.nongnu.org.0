Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15036DF28
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 20:48:29 +0200 (CEST)
Received: from localhost ([::1]:33918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbpEa-0003H7-8I
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 14:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbpDB-0002hQ-HW; Wed, 28 Apr 2021 14:47:01 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:50664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lbpD0-0002gf-Jz; Wed, 28 Apr 2021 14:46:59 -0400
Received: from pps.filterd (m0127843.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SIWNZk025018; Wed, 28 Apr 2021 11:46:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=/+09+n3Zb0vLeEYUi8/2DTPRufgXbpEI7XzjQG/2XxI=;
 b=AnUtgfWTBfAkdvBQ+bcSSeWd90FCkqDKtVxrbQ693dK1iGG06rM0nmjMFSAdb8JiGTCK
 1Vm3UnMAI3ALPbuQK8514Hu5e0uGaBeMACa3/l43A6eQBk7vwpsci+2BOvRAweuIYsUe
 O0DrXbQRrFgtByIMcYIEY6aaaAZEVrXXXaIdXQYksffFYFEfdcNUFcbIqLAg/lniU0/Y
 cMiwkZTydeP6UKyom+6AS4KXwyHvSnzRZ/gqWYVVW7XGppo7j/LSKODlR5fG1CLJBXXV
 XVSI/6gyy6/k60riLmixmT+YleqJvvKtbEaRyBT4UygUBmMYRF1n0OkbUST2aW9sy/KS pQ== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by mx0b-002c1b01.pphosted.com with ESMTP id 386fc3bu44-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 11:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMLt4Q1pjbGNQhBIYvUWDUk04+40zcGRtxZmgFwtn1Vphv4A+U/fkeI8M6OovFvSWOYR1eHRdHgTP5soyGb6D0koVXZocju93K51Z1fOyBdYX9X7xYIsVlPnDGBazgHSJFihPFNPXd3EboWF0guC4ZCeC0feoqGNQ6CMy1TdcNB5vXghB6rmK6KIPs8qcJoQCpGKXq3d5R/95sipd+NR7szvrsDyrfWcTGBh6Vkqn2PFlFeALhhA7kHQPP24UBf4QUfnU3FeCtg2qNozqiyzk9bt366QHc5s59vs+pxw38TtH9JAzFpeJvV4SQuO5nk0seGIxYagwAdljqtPOo2KIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+09+n3Zb0vLeEYUi8/2DTPRufgXbpEI7XzjQG/2XxI=;
 b=oU0xXNYwwWMpGm3S42jA/luKgRPi9kNDJu+X76OxQkXE6VyWBlmA7cM3gSzickGV78kb7nyTERTWUZo0gsDHFlyF9W7ZPFi01ApjQjLvT4Clt5ev0BFVRAvlfgP6TX3YADnv+GSMEHykiKK+eW7qEB+zGnN/SuTFJmD5dQlSDv2u8CPwucIiEW7m1+5Tj3zcoAc1pkq9fyjfC05MVWwmGaSTiUANeWMT+Z6HUF5JL2Hy/LOIR3evQeyqSIrxucAcIXwKGtfFRw7K7FdFHoMLTMxkSLDyiOXA5Kl23EoX9LC2Ttcqo5HqolNJFdEsfLAU5jCY9r8gwErKjCchURD5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA0PR02MB7241.namprd02.prod.outlook.com (2603:10b6:806:ef::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 18:46:44 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::bdbb:69ac:63f9:fc33%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 18:46:44 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH 3/5] vhost-user-blk: Get more feature flags from vhost
 devicey
Thread-Topic: [PATCH 3/5] vhost-user-blk: Get more feature flags from vhost
 devicey
Thread-Index: AQHXPF7VoQ4KFlH82k2x3yttUzfDFw==
Date: Wed, 28 Apr 2021 18:46:43 +0000
Message-ID: <20210428184643.GB20605@raphael-debian-dev>
References: <20210422170221.285006-1-kwolf@redhat.com>
 <20210422170221.285006-4-kwolf@redhat.com>
In-Reply-To: <20210422170221.285006-4-kwolf@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-originating-ip: [69.122.45.60]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 702eb5fb-a04c-4a43-d26a-08d90a75f830
x-ms-traffictypediagnostic: SA0PR02MB7241:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB7241AD991D098043F7A1EC98EA409@SA0PR02MB7241.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SOsK8/loKslj+OWUZx+bsLx95U6OaS/Ct4RWBCnKKvcLlvr3ecPXwgfAh5UxhoCkziqYzwpcXYvbkED7gf6AfB2X8GpvffCFy5EPsgaTq9DPnUiivxU6Kl9ZjqZIOnmiIFJ3RvHdwaTxr2XTof4o2gahnRB2Rx/Bg8yAuCyM5NXOHDQOb8Fnb1DKWdUj9buH1wlhgby/cEfU6kLASUgWz70u0TC4WrgZUnnSsfjSWVhZ7L40u001d1BNhN6L7rMwpSqwhWEwb5Sl8faTtFUixU3I3hvUSPz4+0b27jnK1gIIYSRoP9pgRWqJkMA2xJ2P+M2vWD6nkliD1vTRGCObKg62zwc/TK2iJXJ6vtaVG4l2/Y90VQyIH5PQAWiBwdkOFHiWIeSeTlNa1skU3Yvq1xnF1NYaf9ciND1Xb67JLnkxtU5VeUkB4tQ3Krssdomu4U2hmW92osoNCI3eLH/7EekmNwQntqkmtgxZdyH8H3llXyUoBW8hz9f17VHjDajbOMgAoBoVHwpEPYtvAZsprOZyzVR3ywtbsDc/FLvkXMRW2kTYysK2Jbrwqn8nI6i7u7fB9+2hK8z6aeJ/q/mtI3x44UHCmVCpBQMIQHeC+ILTwgMzmjPQVh5XF0WZcYV8aqCCM5hiK1BP1hTDPtVAr+JuDPEHftB+wvQaw5XfpknOg9rYyDXruWuYTH8kz//F
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(39860400002)(346002)(396003)(376002)(366004)(136003)(4744005)(71200400001)(122000001)(186003)(33656002)(86362001)(38100700002)(33716001)(8676002)(64756008)(83380400001)(6916009)(66556008)(4326008)(44832011)(6506007)(76116006)(1076003)(966005)(5660300002)(66446008)(91956017)(54906003)(66946007)(26005)(8936002)(2906002)(9686003)(6486002)(316002)(478600001)(66476007)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?qwxvVvutb07qQTb+pBuIojSqBhQyHCp1sUKS2yaYsFdpvOseyLw26l3K1b7f?=
 =?us-ascii?Q?iPaIkPG/cqvtkJPujZoqcZRFZY823S7twBoFax7rb+jW6i7jb9S5HjR4j+on?=
 =?us-ascii?Q?pOqwRHzIxrryDHIc2hi9aqVbN0NTsTm0M7Kf0BLs3+MU36g4BywCWHtUG1yB?=
 =?us-ascii?Q?5wt1yaFHKNFq0ThENkLH/3cZFPqvMBRcxZl5f+3zEauy2wI7+sZTTcOWPh3K?=
 =?us-ascii?Q?0aGIjJeWmpXOJ74WWSpdk9cb7d8QO43upVl3HYfLRwlvDPEzwIZmesq7GI7r?=
 =?us-ascii?Q?QJHwaB+5e1kKJPzbahUbUrXXwHFQ4R07MtuAHqVQn7+Lp2m896nzcoJmw1Qh?=
 =?us-ascii?Q?EQ9mb+u2bR/y3Jfrj4D4ijHbYqtm1g+wKtK/lNAd3Ha1D7fcmdtwAy4Uh11D?=
 =?us-ascii?Q?pKfmdxI1srmNnWzKszv8SIdBF889xEBbt1vAd2v9vFebGbw81NMFq0V8E/Ka?=
 =?us-ascii?Q?2G+b/VQzo6FD4no3eOQfglXihw526I/8EoTipTu8MKLkPlpaJNecNbgTfT5y?=
 =?us-ascii?Q?bpX6hcacphgG12JlIMqPOC1lNhub3J+YsSwxHiDy/S0asN4WbshWQrBDgeQf?=
 =?us-ascii?Q?kfaDjLCDrV8F4KkGiQeBNyC0WtcWeXqW1npTXaIo0CdsJ9sm79T/YuN0Tjo0?=
 =?us-ascii?Q?1HUu9SuVeCxnAwqKANiWRlMtXWyt8JSheC7BKDUfQfyHu7sxUM0y7CobdZ3g?=
 =?us-ascii?Q?kPUdJNIsNVUnPH0UWZU50F2+J/xWyVBxr+PpLQo1zG5HDDbyYJYiqiCvrKBf?=
 =?us-ascii?Q?2bo8N5zaAcQIFPpY0Z4EVOVYWoK7mwUQMKNfuZajZeRcbpX9KwZjeXAF8QT9?=
 =?us-ascii?Q?qWlLdeIcCXaOpbyeBaQ+LyjoevqLdUHFtWYnsfwpEJOeLt6CIOUL0SWgKueZ?=
 =?us-ascii?Q?fV8vDPUnbXViDacews6StExyl3P0SOxWjsej+KyvtsX+K6/BEA6lkp9ghD1g?=
 =?us-ascii?Q?KESy1NLp0kz1nSo4yXAp2ZY4mFvvR7yX89TvyraTJUCu8uy4aV1FI9tjX8BJ?=
 =?us-ascii?Q?gIGGJYzPjSiwibY3sQHNVh9fDXSA2dvGaBUU8G9qhA5+OzPT4f8royMbhohP?=
 =?us-ascii?Q?V3KIkxMu6lqa4bR8KMUQueva9FcHPFl6gakaK4LaURxtjKg4tCYQum/g5MeH?=
 =?us-ascii?Q?dWTT17DSygjZ029V0/V34jXP8dj8tAq/6IS4Nee+1qy9lhjs+my9qQ5d4oKe?=
 =?us-ascii?Q?4nBhidB/kUz9zUgxWM/RbcnCuniD0rE7SKkzDoRB640QTo33mJg6LYeDoPs2?=
 =?us-ascii?Q?48R7PM4yRuFGAW9qUImxq+sVGhNZnopJMxzsW5ViibySfv4rkdKGKxKqbJ83?=
 =?us-ascii?Q?ZeMk5AnsIr//5pYB1VqqyJFO?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <33B744220EAD914183513215A681F9BB@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702eb5fb-a04c-4a43-d26a-08d90a75f830
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 18:46:43.9747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TMVYyI8QcOiLEEFKprbp0KrfDhU/+1i9L/R5QbiEfeKOcqzYjogvCG2LZuJN/kiyUbTCBX4KzeqpTINbQzvEd+TeYsK+zvO40XZDlFXTCCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7241
X-Proofpoint-GUID: u8phD7VsXrDJ8cmPAc586FEm61W7qO9Y
X-Proofpoint-ORIG-GUID: u8phD7VsXrDJ8cmPAc586FEm61W7qO9Y
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_13:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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

On Thu, Apr 22, 2021 at 07:02:19PM +0200, Kevin Wolf wrote:
> VIRTIO_F_RING_PACKED and VIRTIO_F_IOMMU_PLATFORM need to be supported by
> the vhost device, otherwise advertising it to the guest doesn't result
> in a working configuration. They are currently not supported by the
> vhost-user-blk export in QEMU.
>=20
> Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=3D1935020
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  hw/block/vhost-user-blk.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 8422a29470..b6f4bb3f6f 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -47,6 +47,8 @@ static const int user_feature_bits[] =3D {
>      VIRTIO_RING_F_INDIRECT_DESC,
>      VIRTIO_RING_F_EVENT_IDX,
>      VIRTIO_F_NOTIFY_ON_EMPTY,
> +    VIRTIO_F_RING_PACKED,
> +    VIRTIO_F_IOMMU_PLATFORM,
>      VHOST_INVALID_FEATURE_BIT
>  };
> =20
> --=20
> 2.30.2
> =

