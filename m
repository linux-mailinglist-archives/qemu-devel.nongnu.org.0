Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621D658D5FC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:08:44 +0200 (CEST)
Received: from localhost ([::1]:50324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLE8-0001hC-8i
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLLAp-0007IH-EQ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:05:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLLAl-00053J-9s
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660035911; x=1691571911;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=razauaDEioVJvrdShzsXOHtwS9JOdEXrpezjc6Sk/E4=;
 b=HsUeqI1OIDJPP4PObvtIURHMrMBztR7HFEkSCqjOd13CZ8aXd+bhk1i3
 ISdOjVieVsqCVZQCupO4WXPGgvAKtaYT0ufZsXQVd2Fb8Vt/GS1ESzh2t
 Q0+90hHNK04Q0tIltCE+p9wRFSNqgLHVhhX1ykF4W6JSFEV3uWAX7skOy
 TEy2e23jboSm3/snWX3OBcH/6mtutOg920IK9lGRyx/zeKcYospZLaaa6
 i67xZB7FQ35NaZYxX2Q9mRRWjLOq6k1s0OlbKE9aWe5qzB8w5YDTSEQg1
 0zOjYBVF8+8M7DkNHEOGOCkhLBpL75lcjHgaaVCK0hlKeqel/LHu5T1/e Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="270566349"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="270566349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 02:05:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="746971385"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 09 Aug 2022 02:05:09 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:05:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 02:05:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 02:05:08 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 02:05:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kc+Qi+crkuy3TdDc2Z9FAMOZ80oav/m0TffHw4I6tACyhBBElDQ4wQxSgtuPR4R+WJb82uswbVRN/MsU8i0wpkhIxNeAtPB+fELHDRWTsTI154ALb/UCwkDCdsqinzDJLGpoI9qTyT0xT36ypV6Ntxm6nTnzADrFfW1LMowwCsY3hGkfDZ9zDfTgvQLcegxP9irO37x6PZowzU4wSgAgKCqVZP4B0EDbz/Go9ucRMuHTj6DKni2Fm5LRvE4CV6f7UX8lVJaB6+fHmA2p/gSzUR40pKUI19XcDvXGN+qrE6LRZCiQmyuIa3HuRT96r6FQIPeYhmxGCHY75Li+bYk2PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6x0kNy2bg4lo646GuA4UUyXnoWVv1NRrHlTrO7DtD4=;
 b=JRR9rZ2AldippEncyQyetxpXdYqc1JtnadeHCI+Dpl+Xj5jhrhupK9WNHcpjqB0hPevH+JsBPNpWpykO0FTrTVO6BDNd/YVKd+2DgSAyJRe5wN2OrAosaUbG3xwWddqsC3HMgwZ6B/Ts/6Sn9+8BqdXs9qZqnHaT16Ey59GE7PRIftfF6xCOcvzLFkUvAkuSf37Psn3bhUlD38SdREmaconlNTK8+z6+w8dfOLNrmkvhpmGPb2U6mjWT2QJWU9iL/RmT4tn3XXrcRcTQl7/49BuIdLkzWaIkPVBTDr0EwlXOTPbgPKR2uzbZOLgXGoMwQO+ZvMYTL16qE0YVKvg11g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by SJ0PR11MB5631.namprd11.prod.outlook.com (2603:10b6:a03:3ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Tue, 9 Aug
 2022 09:05:06 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 09:05:06 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Li Zhijian <lizhijian@fujitsu.com>, qemu-dev
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH V4] net/colo.c: Fix the pointer issue reported by Coverity.
Thread-Topic: [PATCH V4] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYq85Y8y0S1ajXQ0CRJBwFaINJHa2mRlmw
Date: Tue, 9 Aug 2022 09:05:06 +0000
Message-ID: <MWHPR11MB0031CC01F5679EC527C78F659B629@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220809084437.216420-1-chen.zhang@intel.com>
In-Reply-To: <20220809084437.216420-1-chen.zhang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d23c4a9-ffa8-401d-bf29-08da79e640f2
x-ms-traffictypediagnostic: SJ0PR11MB5631:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: orB444EnUIxHZfkcx7SHjy25dJbzOQdppDm3/ejg85NJ7mnxUaKdvc/8TKhXGlkfTzKUphTEb5sK19kecYajDbcMuWTfoGl8uU8GQmVxSRxgm2ZQbHQYRmLWkxoN6gUC5oZVb4k858TbfVKrmJbkp9rD7ADi53aggLjDMN/k9maF7+MxLx3JZDGCS+BPTn0LcFZfoyTlfjwqWccfbQRC5zZE6rFtw03D+ReE7XymIZfe6gZcH92W6zwwN+EFtYGpN8C8eKI1zhgVr/Keb/9tYAXuVZdQ4vIcISCXBZjJQ8bJ49UGTeW2hcfJc7nj342MF1LGDnawj8sGQdULwsJ03Dt6sKR51jRia4Ne7IahcDo/hCKRhBSgbJJw6/wEf0YZcEzLR8uprl75/h+tzzUmF8P/KF1wcgEz7cWXGlCFPARsqJ8e6yhECUb4pPbd5kS3J+/5kQEWrSaYOuxk/jJm3JyhUtzmHQsQ/fr8W2sdOC51VvYv1eCYFnM6uC9LtdxOeFfzVliM151SV8L8ThoHBlGi81JkGCHM3i4eb41/+tNv4I0eivf0pwg5CGSkWB1WhzuzduqyuV+sqkO7D8VnqfzD1390YDhD7H6GW+coMX+jTK+zfI+QFbmtrzsrjqWc9uPr4satlXq4N3kbbmlDCTMBmBPcwM5Fdge0ou25ovcxiH/qHiqF9VkVVkjI5NVqHuzhjrzG56JdnPcldAMAngR96ghxpsSFzKySNFIYrKWl4DPMgS7zEeXQB6ZwIf13gmej6z6jhrUOQuu8Jt/vhxrHym6QDZzfjZjK7xR/yM9cpOO8oFholcKE3G29BzU7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(136003)(396003)(366004)(376002)(346002)(53546011)(478600001)(38070700005)(33656002)(41300700001)(82960400001)(86362001)(6506007)(9686003)(83380400001)(186003)(71200400001)(26005)(110136005)(66476007)(76116006)(64756008)(66946007)(7696005)(55016003)(66446008)(66556008)(5660300002)(8676002)(316002)(38100700002)(8936002)(52536014)(122000001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W8BM5xolyO93EI/OksXpxgunmX+2omzjqG8x5wq86CCHRLueTAHHUV/aMHLv?=
 =?us-ascii?Q?5o7uSOxAfCOD+IzsKdwygcOhEoCZoL2xadXnEWG1dP7dK2/KYzqLkLgFOE5Z?=
 =?us-ascii?Q?eHqrQux7sZhR30QWFftvV6vbyWCagaB3K/aLeeYG4KgO3NHN/mkWwM5OFExe?=
 =?us-ascii?Q?1Sbgzdqrh9jZLsp3Oq/kncfz6Qyg+y0VqS5h5hOnQlKItt4GP1xFJYeXdSyI?=
 =?us-ascii?Q?dYgEpa8VGbNJW82yMk0l8cnp6n+Hdt/nKV+MleGFmPY0zjEjx5okaONx0g6P?=
 =?us-ascii?Q?1yhMImt/CCgcerisJiIE5IS1GqBwszkdpJXd5lbbZTE3l+OOkAZ6k+ynmam4?=
 =?us-ascii?Q?U1fc96q9IUWzbf+sTb8NT9v6J8KLM6Zn2FSleVCBXRTmOHIlXvFrSwsMcnGo?=
 =?us-ascii?Q?V7apBEcf4ltLIPkyiOM60oWbriLVo7K4Vma8VpQ6PEjg0PQG9VSCnQ6hK/e9?=
 =?us-ascii?Q?Z3suro8Sc3G5ctUSqI5w7nK/RCue/R69wi1usYRyOQVA11uJ9o+JFi/h5wD5?=
 =?us-ascii?Q?Mth9+ZyNQyO+iS60VuZexbyR0rVllAe+mDV9pSxD1mpt/tQyUBuY4K6ENI8I?=
 =?us-ascii?Q?5p9+POGFvDJL+2YWeWzNeQ5oFPP8HqJOBJBKUlTeyCI1rBWQHm7prkMsAMF+?=
 =?us-ascii?Q?LBNhlTqNWBHltQNTmfSLDLZO/yy3b4yq/JKu/e93chUfY1SSz6E0dR5wOdK+?=
 =?us-ascii?Q?yXGYjBQI8tIxgwik0kCJMavzxt/xkqsBDLEXQ+h1ZVvk1sgux/5kCyIZnLFq?=
 =?us-ascii?Q?N1Orp6Ju22siRpe5bPsMRO7LPrpsXSsLHxFGafRBGzaHrYIa0k1B1kDfZDGX?=
 =?us-ascii?Q?/HRUSPYFJ1fglxagwI+EYR81W3mlt9QozVEo0CQFLMvTM0I9kJC4Yb+5J+OG?=
 =?us-ascii?Q?tYSKgmv6BvLQuSCM96x+eWGOpt14vy4x8TW9j77BwGhn/CMw0UlHBQUugcH/?=
 =?us-ascii?Q?5jr3ju7bXwf9swFkUMH3B9HAwx2oRg/w4WgK2Ep5n7GyOapKwNJI1S764mXv?=
 =?us-ascii?Q?/Oufrm/q22afrsLyEw2HVz8gobW8jarrurLvZV03cBj5zt2EMuuAaO736PCu?=
 =?us-ascii?Q?ryV7ibMbtqfnb+CujAzlHV6MaIMJLhQfcTzTd5BwNfBRQxWGcWlLqSXgjtzP?=
 =?us-ascii?Q?7I38QvjD0PkjGuEnIZNAYTmjsmnRO5RLoPEznubwNd5CAemIdt3Lqaqf6PoY?=
 =?us-ascii?Q?6AJvNsqeb2ShTI9/dZDSNKrsJ2kAWuM0PLI8fJKGI7lfLeBgQUG+1xZpgN8z?=
 =?us-ascii?Q?Qpz7Ncg1qU0tuqaiXW0rdEKggHtyqeXZssyCEkNQ0We99gq9QZ4w4nkhpPXB?=
 =?us-ascii?Q?QAJ1vk7ZiEDpFKJ69MVPU6KdJpFscEfYmNl6yhkRBpB17pwvPlByeBbT3xYA?=
 =?us-ascii?Q?8ZEVhJeSOe1y/Jx5e9kTaFoBzGRfYZ7eXH5eD7eQ0wEraVU/rxr+iYXrlH9a?=
 =?us-ascii?Q?LgTbNDOvlD6rzNdsFk3/oxgg78NcdyJa0grnJhO/+MTrs7tOfMgIPm3tDMoj?=
 =?us-ascii?Q?i8SOzjsXTTCn096aaGhaGukMOym6XrpMeql+4C6Knns5MOxY4bwUh0iPxsbb?=
 =?us-ascii?Q?8OBgLQp4qjtFgTvgi55Gb8OWdRsgMzTWiyozFwXj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d23c4a9-ffa8-401d-bf29-08da79e640f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 09:05:06.4967 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C1bT3ukploHVobwjtwBVDukdYFUdECFGGR+jPdDauvH4qFXnPBIgKANRUNNNo3HoZo0AxYBAJhV1zTrTO897qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5631
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.136; envelope-from=chen.zhang@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Please review the V4 RESEND version.

Thanks
Chen

> -----Original Message-----
> From: Zhang, Chen <chen.zhang@intel.com>
> Sent: Tuesday, August 9, 2022 4:45 PM
> To: Jason Wang <jasowang@redhat.com>; Peter Maydell
> <peter.maydell@linaro.org>; Li Zhijian <lizhijian@fujitsu.com>; qemu-dev
> <qemu-devel@nongnu.org>
> Cc: Zhang, Chen <chen.zhang@intel.com>
> Subject: [PATCH V4] net/colo.c: Fix the pointer issue reported by Coverit=
y.
>=20
> When enabled the virtio-net-pci, guest network packet will load the vnet_=
hdr.
> In COLO status, the primary VM's network packet maybe redirect to another
> VM, it need filter-redirect enable the vnet_hdr flag at the same time, CO=
LO-
> proxy will correctly parse the original network packet. If have any
> misconfiguration here, the vnet_hdr_len is wrong for parse the packet, th=
e
> data+offset will point to wrong place.
>=20
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  net/colo.c | 18 ++++++++++--------
>  net/colo.h |  1 +
>  2 files changed, 11 insertions(+), 8 deletions(-)
>=20
> diff --git a/net/colo.c b/net/colo.c
> index 6b0ff562ad..6930a2f4f6 100644
> --- a/net/colo.c
> +++ b/net/colo.c
> @@ -44,21 +44,23 @@ int parse_packet_early(Packet *pkt)  {
>      int network_length;
>      static const uint8_t vlan[] =3D {0x81, 0x00};
> -    uint8_t *data =3D pkt->data + pkt->vnet_hdr_len;
> +    uint8_t *data =3D pkt->data;
>      uint16_t l3_proto;
>      ssize_t l2hdr_len;
>=20
> -    if (data =3D=3D NULL) {
> -        trace_colo_proxy_main_vnet_info("This packet is not parsed corre=
ctly, "
> +    assert(data);
> +
> +    /* Check the received vnet_hdr_len then add the offset */
> +    if ((pkt->vnet_hdr_len > sizeof(sizeof(struct virtio_net_hdr_v1_hash=
))) ||
> +        (pkt->size < sizeof(struct eth_header) + sizeof(struct vlan_head=
er)
> +        + pkt->vnet_hdr_len)) {
> +        trace_colo_proxy_main_vnet_info("This packet may be load wrong "
>                                          "pkt->vnet_hdr_len", pkt->vnet_h=
dr_len);
>          return 1;
>      }
> -    l2hdr_len =3D eth_get_l2_hdr_length(data);
> +    data +=3D pkt->vnet_hdr_len;
>=20
> -    if (pkt->size < ETH_HLEN + pkt->vnet_hdr_len) {
> -        trace_colo_proxy_main("pkt->size < ETH_HLEN");
> -        return 1;
> -    }
> +    l2hdr_len =3D eth_get_l2_hdr_length(data);
>=20
>      /*
>       * TODO: support vlan.
> diff --git a/net/colo.h b/net/colo.h
> index 8b3e8d5a83..22fc3031f7 100644
> --- a/net/colo.h
> +++ b/net/colo.h
> @@ -18,6 +18,7 @@
>  #include "qemu/jhash.h"
>  #include "qemu/timer.h"
>  #include "net/eth.h"
> +#include "standard-headers/linux/virtio_net.h"
>=20
>  #define HASHTABLE_MAX_SIZE 16384
>=20
> --
> 2.25.1


