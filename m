Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173158D1B3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 03:20:59 +0200 (CEST)
Received: from localhost ([::1]:39900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLDvW-0000vM-15
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 21:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLDtq-0007o9-Hv
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 21:19:14 -0400
Received: from mga18.intel.com ([134.134.136.126]:36459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ling1.xu@intel.com>)
 id 1oLDtn-0005mT-GG
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 21:19:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660007951; x=1691543951;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K3zM/s1XrWaYuqQsWHnVdXUOFBaIYPtelrvJV6pBtUY=;
 b=Z0hh9AE291WqP2k/6IgQbWPC+MNoflrLSNRnIQUBneF0acackNnj2YS8
 uiPTxGfNzHmbgYZ9SuT7SLV0ph7kCYYEFq0zBJSFlYWAJtaghst0cUKt+
 wEwJoD7LI5aPXvWw9976Bp3muvlpoB7Ra56UHpCyCFbReVp62hrw4jCDY
 3PpHaEcxjhi0OpRDIhTNKPu0itFn0RMSY9mOQhdJUYs9b1r8B3boaASPC
 q7Z5/ZzE23rXOiRDfpKo+psyuxzbRKq6rMR57a335AWKviBy1zCQffRqO
 E/kU6zkC0s3OUpx+dD4fivTs6D81PTNaEGf30L6K4McNH3+PP82sYpRbc A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="273777798"
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="273777798"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2022 18:19:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,223,1654585200"; d="scan'208";a="637527075"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga001.jf.intel.com with ESMTP; 08 Aug 2022 18:19:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 18:19:04 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 8 Aug 2022 18:19:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 8 Aug 2022 18:19:03 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 8 Aug 2022 18:19:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdbwmLInb4Nr5eAx9r38IAmWiKGs9nkg4y91M/QE8q57hH0KhWmUkqSdHF2JBXQIPZE9qiFQXt5Ly87k4b406SMC4QUCcmVy3s4KfKR5ouLbAbc5S0H3OxHM+NiuxRVqZlQpUAAGM1joA7eA1CRTOLwkuHEXiWNvOkRxv47/Bq0fIhGn4E8samSzy29fy2U5oTpV4IdrlJI5q2gZ70GhxJa+PgiuJfPYlpMJV9cbBuEoPwozSGpi5F6yzN6Bl7OrAT9yCxd/5X4ZgibFgrxP8R6yymajLTCzbAiud0TAMoI354vYMUG5O+8EUePccrasurNdyDiki96Clc9MlD1lEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/Z9/1zjd+QzuLIV9L+7cDuo46opbKaGP2F9Sfm2S0E=;
 b=a3wh/p1qyzh/mUXn/GjfJz914X2Wil3PZdks2hhbrDx36Hj6pd+63iAROxK+kjM5FlVA1vh60lVBN00FjVbxI8r+lfcfDTIHfdWtHDpcBxPD9HpdJm+g2HAI7GrgnZufDZfXBH1Bvue6NA5NgUNsSeHMUHD1WzKNU1VQk5ZgL06Rtd3HXr/tQWzI1O64pDyxH9d/BIVsV+A5ngetLsdzaxC7QFQIoprAIJ++ZTdbdsF4rieS8SEUwglGFw9IH6Tnb+S+qlGsjt171CJ5NTlSS8gjIqQKa6JQDV/7272WLpevM45CHsUAii+bdT3n86eHe8rqciTdDcoZ4hCyHWcB4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5465.namprd11.prod.outlook.com (2603:10b6:408:11e::18)
 by BN6PR11MB2036.namprd11.prod.outlook.com (2603:10b6:404:4a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 01:19:00 +0000
Received: from BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99]) by BN9PR11MB5465.namprd11.prod.outlook.com
 ([fe80::e9b7:c3cd:e2d3:6d99%3]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 01:19:00 +0000
From: "Xu, Ling1" <ling1.xu@intel.com>
To: "quintela@redhat.com" <quintela@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "dgilbert@redhat.com"
 <dgilbert@redhat.com>
Subject: RE: [PATCH v3 0/2] This patch updates runtime check of AVX512
Thread-Topic: [PATCH v3 0/2] This patch updates runtime check of AVX512
Thread-Index: AQHYqvtTqePT5OLLm0a0FYtP+fdnga2k5VOWgADcaMA=
Date: Tue, 9 Aug 2022 01:19:00 +0000
Message-ID: <BN9PR11MB5465FFED972F1E0414695FF9D1629@BN9PR11MB5465.namprd11.prod.outlook.com>
References: <20220808074837.1484760-1-ling1.xu@intel.com>
 <87wnbjlzm6.fsf@secure.mitica>
In-Reply-To: <87wnbjlzm6.fsf@secure.mitica>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54b6fab8-6abd-474e-8011-08da79a523c8
x-ms-traffictypediagnostic: BN6PR11MB2036:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mzc1ks1mkxWVcs5Ug1VuM8IvRAYSdMx3Limec+W9QPJ2gmcwfAcBQdPQ8FFekdLFJV1PTdmM0IsqKeNFh+X6jQmovEDPUu68o6p3QVRnqCiaNgOCDLfNsCQ5pN/GRDI3dW16tWMDbPXcwYLay63BwFrt1y7AuvDUlu5uwyF9agsB5v187rxli/KpPFFOK+Kq2t9frVg9peA9E9t1zspzCEYz/Zz2weZRbXocsZm3ziwUsrer65c4Rh5SRh2YB5VRlOdq7ur0ZHlbHPuaJ1bJZ0p8qOwCvW5txnbjhdp6xQxEExbKc3zHFDEiA5YAM5JReTl3H/biBtM+YjXDSand7zVXXK+KEcGEmS3Utbb41FCQDjrc9x9/asTBToyrIunXzI+TCUuRaeu18JzhAdOHdgsxUtxynqiK5QnZrVonuY8dmQsQ+A4Ng0nQAbJSDNmKUw/oqlFz+kI/RiGW5okWO9Blngv6/4dZKihyLaoZxhQF54q5dSDTXfzArQUsizIbvxRiEzS/p0722eSj91FULeP14X8Xx6/VTsxrrJe640wM9L3ZjAD1x/qP9rrHzlj2oEezC3J8lFTAHO+fc2Z02b+8qXszI1l7VLJ5sp4R65ZqydbXNZuF0xb2nSPBH0k/pVjQ+ISd3G/5EpPLrikIcdIu6syDcQAg70pdjcc+VtkY97SP2ZAG+SmKdLsr8To1IBW8kiZN0unCKECph0RURC+6Kfr72u/MxEXR36a2WqOj/L1joRBDxbnxB8h7WP4puRCfFQXYwSmEgHYYE6i876UI0ceHBxu3aApTQMMq++SDXhz4/Q1aQOe2c9qAaXqoSW7MjD88MhcwQOQTXY2EQw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5465.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(39860400002)(136003)(376002)(346002)(38070700005)(122000001)(6506007)(186003)(83380400001)(26005)(53546011)(7696005)(86362001)(82960400001)(33656002)(9686003)(478600001)(316002)(6916009)(71200400001)(41300700001)(54906003)(966005)(66446008)(66476007)(66556008)(5660300002)(76116006)(8936002)(8676002)(64756008)(38100700002)(52536014)(4326008)(2906002)(15650500001)(66946007)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?98LJBO69qiYsqluPnFhT8nn1TCmfkO5rJB9BQhWFBlx58moGUSf0x6yYPXbs?=
 =?us-ascii?Q?C+7jdspXxIpq6hvvElnXKGWzakR2gGpHSe3Hak1HGOrka2smCEW9wZTqqq5N?=
 =?us-ascii?Q?ifUFnZ+hYtMdXZyv4JFy19kd9dolmdNu1wQBsdSqjI+257tAjD14azucRPqF?=
 =?us-ascii?Q?yvwGaz0TPQlPkxNzxS2qt8vy9GTLBdYxJZ9crtmSuXEJ2IWJ9cKI0A1fEQRF?=
 =?us-ascii?Q?Cg3I/ajQ4d7FHViOSeT+HUoLqLUSn8p3Eh0S3P0wPiEGFVjLMZoq1srzlN+I?=
 =?us-ascii?Q?d9b3hTtIdNXaDAhZULwIVVC/c0LOUqVkOO6CRTvxNc54w8TLNfp7rmuTPAB9?=
 =?us-ascii?Q?bafn+lqIHukG4TN3/dSoENBcmD0N1+7Qa6uLPAQkQJHeIiH7K3x9NfyIzvg1?=
 =?us-ascii?Q?Xzi718MA0pulitNjTXw+VZu4r3WZqjPNcmnmWzSSwz7PGnVhvv0LPWTYQqKy?=
 =?us-ascii?Q?9JGDrwwEr6tsGDKMsxWhZiXSUPHMxaUqAPjEhcjTbbAMJ0Via6zdp8Ng5saZ?=
 =?us-ascii?Q?xSYu9GQKnFfPM4lmOjLLMmDe5Gw6VJBf4i68T2juwA9UmmLDAiWBqhWyervm?=
 =?us-ascii?Q?QzGA3fUjxjkmQGN93mTsL1exmI9lkK7QGuwkX17mByJH/NRU6izSyoz1fS6C?=
 =?us-ascii?Q?iQXp/hOhnBYNnTI1WRUMt4gEp4yiX7dQEnvCklZpIjPg/styOGHbYIirF0hT?=
 =?us-ascii?Q?lkI0zq4cD0Yp7Qcl+/WcFn8HcsiGItVsC/fnpwFPYi1fdXnP4JQxiMzg2X5x?=
 =?us-ascii?Q?q2QbOtt/P9/WTVzITPsiE0cP8/+ZjUb3tHqAZHpMrWBeIETj/+x14WLGqfw7?=
 =?us-ascii?Q?/zyEbxrg6DRAS0hypf+nVEHIpB1rQR0iJjmLoK8XsAbfE67fXTH1aRfCazzd?=
 =?us-ascii?Q?k/Il0rlhUTxrC8J7qDKqfqTDGspIp6kS1GWgmqtTsc5dO8YbXD/PWw4J49e3?=
 =?us-ascii?Q?gV3RJzaNMN5dPIMAot7UwgetmHbknTT/89McTkDRuNIVQUJ0GKtgCAV4KqVz?=
 =?us-ascii?Q?nIxJmGjXhLTrN/d2K8ggeKeUAniyDgs14Qj/PMkr5sfG4O281pRTiDo8FJ3N?=
 =?us-ascii?Q?Hm8VyvaZM3d5yUHtz5CBTPJHW1i+WovTQd47g4QUPN63E3GaB6lBtQ/kRYJR?=
 =?us-ascii?Q?lGlOL/WGUNRpsw/3QWcqYWaMNwVmc1L2CwqTj75DO2LaFdFMmmEe8pyWq74t?=
 =?us-ascii?Q?7noCadfYNk3DMHJEJYoHPjlPdauutmq0NO6QnkcM7pxZnZvGBrkdxCzH0eI5?=
 =?us-ascii?Q?0lLiMzA8JdmLRo459AossrURZDeAy+FNoeYipQrKoi6l5YyFcFmVrowcpEsT?=
 =?us-ascii?Q?M8iNSFSOtnd1Xga0YGb20ZtwqVlLgjuBAkTKbY57EKv2VTLqOpfR4DcbHhBH?=
 =?us-ascii?Q?ZI+jURacSKaa20EmTp4PQlyHA9tgeqj36xeXv5znEx5rtmKOgRPD+YxSuLza?=
 =?us-ascii?Q?l0Mel+bjLIcJonOWS0tZ6XNyhOk373ZpNRMLVepoXcKLqytmQ5cg6ORLyZZI?=
 =?us-ascii?Q?LtHOng2+hI0Zxfa5exmA/3XxSf5lC6ZK+/SZ4oZc1qv+dBgQ27qsoGlFZMLl?=
 =?us-ascii?Q?oJMFZdAzVZWV1I6ZBztKm9WA5yL8T73uHTWzYUrR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5465.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b6fab8-6abd-474e-8011-08da79a523c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 01:19:00.2941 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YfVY4L1OeEdjwQJKkzLMfeVhIOp1PqKLC3pzbWTpOEVVdN3qreJ6lwOfKFQI7ydZgboA/RWm62rlebw3o/ArnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB2036
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126; envelope-from=ling1.xu@intel.com;
 helo=mga18.intel.com
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

Hi, Juan,=20
     You are right, this v3 and previous v3 are identical except the link t=
o previous discussion. The previous [patch v3 0/2] was sent failed as shown=
 in my mail, so I resend this patch. Sorry for the ambiguity of resending s=
ame patch, and thanks for your time ~

Best Regards
Ling

-----Original Message-----
From: Juan Quintela <quintela@redhat.com>=20
Sent: Monday, August 8, 2022 7:54 PM
To: Xu, Ling1 <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org; dgilbert@redhat.com
Subject: Re: [PATCH v3 0/2] This patch updates runtime check of AVX512

ling xu <ling1.xu@intel.com> wrote:
> This patch updates runtime check of AVX512 and update avx512 support=20
> for xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
>
> The runtime check is updated in meson.build and meson_options.txt.
>
> The updated AVX512 algorithm is provided in ram.c, xbzrle.c and=20
> xbzrle.h.
>
> The test code is provided in test-xbzrle.c.
>
> Previous discussion is refered below:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg903520.html
>
> ling xu (2):
>   Update AVX512 support for xbzrle_encode_buffer function
>   Test code for AVX512 support for xbzrle_encode_buffer

I think this v3 and previous v3 are identical except for mthe link to the p=
revious discussion.

Later, Juan.


