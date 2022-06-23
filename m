Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B63755700A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 03:44:31 +0200 (CEST)
Received: from localhost ([::1]:58682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4BtV-00045N-Uu
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 21:44:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4Bqe-0003N4-6q
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 21:41:32 -0400
Received: from mga06b.intel.com ([134.134.136.31]:18472 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1o4BqU-0003t0-2p
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 21:41:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655948482; x=1687484482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7VjfYl1JAy3+aJslIHyXi8VRl+zbmMtKhC5Kc4XEtcM=;
 b=S+f7ha1TFzKuAtAZQsmfIIFodfOJB1c4HVSF2Hjv+CcL4j3W5ywJBIlL
 GpkejOtIbrLu2bXfznwUkcwW3lPXFhqXc6PI11n/1z1rN6VhdNJ9SSLmg
 uLyWLFYpwwgkBdo8sUHsQxx0jIdfjPx1Gdjq+5PrDUyemHAShbZ61lEPe
 d4CBreeB7LwlI8XWWPg74KdaFaxGA4+AvDl8Ky681Z3eIteVl7MNh8G0O
 Ys8RM9CB5Mh2dHA4h2DMMmNnx3z30i1PFGDEbVXwiUMfCLrDRNwNr5WJY
 NPS96jDji+d0IIz4hX5tM+jLU3nxEt1XuJQHhEJFdp/RMkTWquiuij7tF Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="342278832"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="342278832"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 18:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="834408000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 22 Jun 2022 18:41:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 18:41:06 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 18:41:06 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 18:41:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M8dcZIUK6ze/Xgp0gXuVLUiBZO+4eoE7sHvFcBTz2DyAx3U8TLc40r4nIjZ6i5fL1ruhUzCS92hg9aAaYET5hxMv4N7Mmmr57BfaXbnmWb45cJYvARdFQvGWVXpYXjBu+uzcj5KieU3441VWDh+J4UaDcQC8LA4n48LZ/uWIRXUeYsL1DxWfW60blg4nvTMXzumlz+WSBU6gSvKI8ElNB/kBr4bo3+a47oZPVEz45QZJrueL2CPqpeyBbO0NWkQL8x8wOL1b5q7EYW+Xd4Vj8LWT2Wr7NDsgImB75F2tNqwoSIqu+eVKcv/mZotGRESBKQksS2YhE5JYtAyVma8u2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hn+kksQi0KKfLd2M94doDkPT632JBWBNKCP3zdvzG70=;
 b=BWj27ViIw3ot7aZxsF/dEHQip+J7xoAn6fqEwS7UHwTolOvT9NqvG+Rxb1iXRxd6a57a4o84Kb/tOWaw02glETQqcmUVbbuMjOsT4lBt/Tc07jqTYGtM3uPPGWxY8gzok1AzB7DXega/RV/IZJlhV8QwTpPdXA1Rg+Y7T6V4MVlY5C2tXcdQsB05VTimi4ugRVQ+k6vXFP71i0t+xp7eDOEZfjp0bDyNVmpvXOrEHhmhBgvoR32aKAsSBRAPSnR/Iqrx16sQ643G4qqLf7yopWOuVDayT0v71lXZKaNoLN0ibpp0DIeBv6b6dSyYIx7jOKPaYU+6m7hV8l3y/e0nVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 (2603:10b6:301:4f::15) by DM6PR11MB3851.namprd11.prod.outlook.com
 (2603:10b6:5:146::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Thu, 23 Jun
 2022 01:40:59 +0000
Received: from MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22]) by MWHPR1101MB2110.namprd11.prod.outlook.com
 ([fe80::7958:c658:d5:5e22%6]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 01:40:58 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, Eric Auger
 <eric.auger@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
Subject: RE: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Thread-Topic: [PATCH v2] virtio-iommu: Fix the partial copy of probe request
Thread-Index: AQHYhiHLN12ALVxKQEO8ysH57sZn6a1bUa6AgAAHewCAABrCAIAAwkXQ
Date: Thu, 23 Jun 2022 01:40:58 +0000
Message-ID: <MWHPR1101MB2110E6A7F68546E2232E5A5E92B59@MWHPR1101MB2110.namprd11.prod.outlook.com>
References: <20220617062024.3168331-1-zhenzhong.duan@intel.com>
 <0f4f26de-1402-5c3a-9903-389fef9b234f@redhat.com> <YrMDMzfXAiEgFU+d@myrica>
 <5471e06f-b1f2-d582-3558-b775af72a0fd@redhat.com> <YrMf7I8mFGVyt9fS@myrica>
In-Reply-To: <YrMf7I8mFGVyt9fS@myrica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.500.17
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2af025c7-98b8-4285-33fc-08da54b96c48
x-ms-traffictypediagnostic: DM6PR11MB3851:EE_
x-microsoft-antispam-prvs: <DM6PR11MB3851C4ACC4DC7852A5EB304E92B59@DM6PR11MB3851.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ffc2E/EH9gSZOWlVvkmuD9Fi/InrBydraPC6a3Ey2sF4NRMraW6DIAYZV5nJpzfkyWPABDw2qJflbCuQf5TYUDlv852v5ZWnj0pnfpxsQLQZTHcbnCb4yvfypU0rGya6EHnF4WipyYPuQpzGDMaU7MWPZEtQcU/73CxzOxCVnqW7UNj5T29cwE/8BTVn2j0LoDp71ZiSoI2cf603Ari3i1TrIhXfbJQ0nbul6d6R7msZ5WTT2bj2tpoRH/RW7bby1ViKGJh986Xxkj74vQiMIr+rB5qNpePdIbPwV0LK8DXvqc9iIG998BJ6MTv4DBpxl8KVGtMizBuqWpQxVnicv593gzZaGdXA72DPICAkJQckG94KCpYMEuVTAq6MuHEkPOTQYSZPIfgVU1B9wuCpeaOOH5MUPtYB8V3FVSv/UDk2j0XpUTYjZIE+MWHptcGDhbDDX4sTk7qb7ZJMqvLPH/spmuZjYm2SFNi6KMMUVo/pBd7wGkDvSS7wOulXafndlrMbFIxFjMjhnGHV2Nit90TS1kVGY2tCLE5URO911uPQC1mytqn4wegNwNSdxjAPliNdKpjRL/6jtawcdgDhC9mLVPFo0mKX7cikpu8JEEzxUyU4sfhzSt6r5m6OYUDQNiwwgbR5N+MdeDv7SMW5GgtaXszdHUm0ePW/t6oiU//0bsuAJDDaKxxkBcoS6XoJnYL1XVwPDen1jcK5NZRclKOPhzQbUczY0iebiYNYKhdd/gCcwiIAhWGL6daziL7yt8Z3MHyZ9Bv7ZQjriBDgiA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2110.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(366004)(396003)(39860400002)(38100700002)(33656002)(5660300002)(64756008)(41300700001)(122000001)(2906002)(38070700005)(82960400001)(26005)(478600001)(316002)(8676002)(52536014)(66476007)(86362001)(71200400001)(55016003)(8936002)(4326008)(66446008)(7696005)(186003)(83380400001)(110136005)(6506007)(9686003)(66556008)(54906003)(76116006)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rjkuAcnPeBkveXl1MLwMDFik2nJIVFKLwjjVLCajOyty0XYg6a9/XcGJwY0+?=
 =?us-ascii?Q?PDTXuBAbUnw0Fd0IIWEKqR7NedJtA50lbKrvsMEZfYZ+lU8KJg5DNhFmgND3?=
 =?us-ascii?Q?Dh9SiCg60YFTm+r+L6aL5QyoJjoMkviJmV5JkIhzcJfTYnOBl1CGh6fp1E20?=
 =?us-ascii?Q?7fXaV62Mb0Pqn4XtXj1dGhJRj7AZu4SDIXm/6C2e6lSXyXkW/kScpJCJUggW?=
 =?us-ascii?Q?YBd9xYxjiyTzIbapGHvRuEJ4RDDTIfQ0HXlz7MHIbjQB3L1jb7WIcCeWDMC5?=
 =?us-ascii?Q?fBTXeUp0mgde/S1+sRQk350euI46QMZjlqpZKxRXUNjMgmyUL1ejOZGbtXLT?=
 =?us-ascii?Q?hOwQuDncpETgcX6s1esGb06xVJx9aJK+Z8qErdGbQCO54GwnndUbnNfCnw9M?=
 =?us-ascii?Q?EuXclVv0vGIHCY8JGWcjjSylxdmoGNU+QBL+bNClwtxW3X+beiP7wxUn32op?=
 =?us-ascii?Q?/i09YhIuEKfHjQ5ZQWb08n3Z/IbQARlaqmzM5Wmy94V8mnWNkRkS2D3wv1HI?=
 =?us-ascii?Q?vllWpHwvcdqW8eNKoCs23bVzkGNqk6LxQODMw6GxrpUTquiw5mTnWYGJ6PEW?=
 =?us-ascii?Q?Hd2McHeBgzdKr3Oito9xT3lvWHhYPigmUjg7g7W8fnep3EtBtJY/9XKIg5n1?=
 =?us-ascii?Q?kfN9X8eIkcC+B4V2DIu5Oyd15KDm4JhbP4Bmp+ikaQw19mOplahbwW/Efsa8?=
 =?us-ascii?Q?LDAfs35Vy/rRpl6YDxqXKXOCo7hU7p6n9eYT6hygj9sowixChMBBOUvjwMMH?=
 =?us-ascii?Q?s8fQp8ekDhtQq3iEeIkYnn6ky6m8k+fGC/gQR3WV9+qMqRvpJPF6r6QvyZzU?=
 =?us-ascii?Q?rV9Y2HWNgaweUVgoqF8cNhum8yfzbCTn01s/OJBpYvaBYl+WrfrYK3EW0Fxz?=
 =?us-ascii?Q?5HXxTK7n9YZbgIUET0qW2+SURSPPy/qseRBprX8majnQdTvuPBwthd5ygJrf?=
 =?us-ascii?Q?TFipKb7aLfPSPY/DNclPy+DORaCVefaImIJbzDHm3Ql7es6H5ycbo/Q1vswW?=
 =?us-ascii?Q?KKCDNIECzhqCJm84ozVBFnb6MdQKb5tE4e2zGF2Q9xou/lBozMDu4WJBl+eJ?=
 =?us-ascii?Q?STCgIzwvTHkvZYMUxs9NtnmGgLJkEoCJKxvuuM9QYsi2Wh905yx4k9il9p49?=
 =?us-ascii?Q?ciodaNmG2P3A9ucvalvD8UK6P4p3roX22g5ZUFKFpk1PhCU3mL1ur2GS2Rum?=
 =?us-ascii?Q?w1ON7W1JT3Vwc1C8qNemLjo8DBrrswvy16ZIKTY4y9HoG5wo5w8A/TKs66Ia?=
 =?us-ascii?Q?oyJcEq+ljylow74CJD4ywW+QB5Gl2vPwtz6iAUZgwBC/dMVBBUGuP+g1UIwo?=
 =?us-ascii?Q?+ms5qlg2ZckszdzKC1Hx2+UGXkTPDd3Rmf6djPe7Rfz3yqGZZVSzd0TiFoaP?=
 =?us-ascii?Q?uK6CRuFPD/Pb57g7hhgjZrgDtYQ/eZ2zwJIrGYS2+Qg+OFXPFW2ZWX7lo7Ww?=
 =?us-ascii?Q?aJEGzksqoXA1aD5wyPr/GkLNx+OE9PlQc4nLoXZs9V3gKzwEFIxFr9blGrba?=
 =?us-ascii?Q?455RpVUeB1yobcFL8P771pOvo/XSD3OZTq5XYsQ4xZJgk0HhIdxt3bNrYZ4j?=
 =?us-ascii?Q?GBB5Hb4Lh/0H8lNwjS2O8oCg03BVDmm7KkY4RConfPpZAsskRkFYiHTDj8SB?=
 =?us-ascii?Q?uLMMYuJMClwHiHy4yWHYTYssahNEqoRa3mwq9EikL2+SuV2Z2Xy0x35fpNYI?=
 =?us-ascii?Q?j3MjTKjrjrn1X1IxsRqhcoL8+QKheUGlYnk17099ZjAlHQu798aIpQnewnMr?=
 =?us-ascii?Q?rLuqx8osctlkB/LksAf84/zzJnnEDsw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2110.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2af025c7-98b8-4285-33fc-08da54b96c48
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2022 01:40:58.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9TkjkspqxD39loT+qSQW4TmJKkw5H2K9nx5LR+0JrAck0qZM7OXoUF6RbmxfS5r9FK1DA6Elemq3RIpVOVHrA1qtTYV6icbINGLmV02CEqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3851
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=zhenzhong.duan@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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



>-----Original Message-----
>From: Jean-Philippe Brucker <jean-philippe@linaro.org>
>Sent: Wednesday, June 22, 2022 9:58 PM
>To: Eric Auger <eric.auger@redhat.com>
>Cc: Duan, Zhenzhong <zhenzhong.duan@intel.com>; qemu-
>devel@nongnu.org; mst@redhat.com
>Subject: Re: [PATCH v2] virtio-iommu: Fix the partial copy of probe reques=
t
>
>On Wed, Jun 22, 2022 at 02:22:18PM +0200, Eric Auger wrote:
>> >> the spec is pretty confusing here though (virtio-v1.2-csd01.pdf) as
>> >> it presents the struct as follows:
>> >>
>> >> struct virtio_iommu_req_probe {
>> >> struct virtio_iommu_req_head head;
>> >> /* Device-readable */
>> >> le32 endpoint;
>> >> u8 reserved[64];
>> >>
>> >> /* Device-writable */
>> >> u8 properties[probe_size];
>> >> struct virtio_iommu_req_tail tail;
>> >> };
>> > Hm, which part is confusing?  Yes it's not valid C since probe_size
>> > is defined dynamically ('probe_size' in the device config), but I
>> > thought it would be nicer to show the whole request layout this way.
>> > Besides, at least virtio-blk and virtio-scsi have similar
>> > variable-sized arrays in their definitions
>> the fact "struct virtio_iommu_req_tail tail;" was part of the
>>
>> virtio_iommu_req_probe struct
>
>Right, it would have been better to use a different name than
>virtio_iommu_req_probe in virtio_iommu.h, to make the pitfall clear.
>
Maybe virtio_iommu_req_probe_no_tail?

>The larger problem is using C structs across the virtio spec instead of an
>abstract format. Someone implementing the device in another language
>would already not encounter this problem since they would read the spec as
>an abstract format. For documentation purposes I do prefer displaying the
>whole struct like this rather than working around limitations of C, which =
may
>be more confusing.
>
>
>> >>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>> >>> index 7c122ab95780..195f909620ab 100644
>> >>> --- a/hw/virtio/virtio-iommu.c
>> >>> +++ b/hw/virtio/virtio-iommu.c
>> >>> @@ -708,7 +708,8 @@ static int
>virtio_iommu_handle_probe(VirtIOIOMMU *s,
>> >>>                                       uint8_t *buf)  {
>> >>>      struct virtio_iommu_req_probe req;
>> >>> -    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req, sizeof(=
req));
>> >>> +    int ret =3D virtio_iommu_iov_to_req(iov, iov_cnt, &req,
>> >>> +                    sizeof(req) + sizeof(struct
>> >>> + virtio_iommu_req_tail));
>> > Not sure this is correct, because what we are doing here is reading
>> > the device-readable part of the property from the request. That part
>> > is only composed of fields 'head', 'endpoint' and 'reserved[64]' and
>> > its size is indeed sizeof(struct virtio_iommu_req_probe).
>> >
>> > The 'properties' and 'tail' fields shouldn't be read by the device
>> > here, they are instead written later. It is
>> > virtio_iommu_handle_command() that copies both of them into the
>request:
>> >
>> >             output_size =3D s->config.probe_size + sizeof(tail);
>> >             buf =3D g_malloc0(output_size);
>> >
>> >             ptail =3D (struct virtio_iommu_req_tail *)
>> >                         (buf + s->config.probe_size);
>> >             ptail->status =3D virtio_iommu_handle_probe(s, iov, iov_cn=
t, buf);
>> > 	    // and virtio_iommu_probe() fills 'properties' as needed
>> > 	    ...
>> >
>> > 	// then copy the lot
>> >         sz =3D iov_from_buf(elem->in_sg, elem->in_num, 0,
>> >                           buf ? buf : &tail, output_size);
>> >
>> > So I think the current code is correct, as all fields are accounted
>> > for
>>
>> In virtio_iommu_iov_to_req(), payload_sz is computed as
>>
>> payload_sz =3D req_sz - sizeof(struct virtio_iommu_req_tail);
>>
>> sz =3D iov_to_buf(iov, iov_cnt, 0, req, payload_sz);
>>
>> This works for other command structs but not for probe one.
>
>Aah right sorry. The resulting code may be less confusing if we moved
>"- sizeof(struct virtio_iommu_req_tail)" to virtio_iommu_handle_req()
>
Looks better, thanks. Will send v3.

Zhenzhong

