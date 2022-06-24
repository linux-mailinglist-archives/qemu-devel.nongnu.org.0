Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF7559355
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 08:25:03 +0200 (CEST)
Received: from localhost ([::1]:32916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4ckY-0005XP-OO
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 02:25:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o4cia-0004B0-7M
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:23:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:47958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuan.yao@intel.com>)
 id 1o4ciY-0000TM-AI
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 02:22:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656051778; x=1687587778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9GWCMUqItkbqVS2nptB+ti1GNDPaS2V9FiduSvIbdH0=;
 b=Qcib6dgPjM0X23ISOg2MpM4ylSHc84RYh+SBYD5N9FLf+7ijg6yvpNKL
 A3XEUZAqSHeR8j0C7AUatlDpTGOdc/qgO48ez1NFD5ghLBxJUbxfYvJQM
 bxdjnEOefjReJzjJMMNgFAemMj9pbExt310tq+PWddfuFsHFMQ6GypJWw
 UWxKEgwndxN3yfyAfhe27EgjBGe3rOGubZZucOkMa/dmXITsF5408VB3G
 xE42/i66VK93W057UCJoj8tFalddsoSHUZBhJMcnxAGysXQNlWJmMVNHX
 szPBJLv5q/Vo9yCHpAS1p/RNYy2DwKyor3s2BiKVT+yfKvcNOyjBx4p7z g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10387"; a="278482264"
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="278482264"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 23:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,218,1650956400"; d="scan'208";a="915554344"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 23 Jun 2022 23:22:56 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 23:22:54 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 23 Jun 2022 23:22:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 23 Jun 2022 23:22:54 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 23 Jun 2022 23:22:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OG1sgbR6qA6bjzvbORTT67z7Hj+9P5b2fyl1Iz5YyY6NApC4/60mmz7yQwNddBTg/70T3miUvO6wIcBwEa1bmnuW7Z8wj4gX90KsQgNVRwDDsXlG2gK24UZgKDpVvRN4iyE3wL63r99GuvKDJtAk65NjQb7TwCqpyVNcHbu4h1D0sTS0W9W03qtIC2Ykjcy3Fu2lgyktweOiOsyqlMm7Bdic+SUAGTWwj/c7bsi7tW+1CM65KJeotors+z8Y+WV6iGOQzjRv/Tol9hE+bP5ZKE0MeU2AyIgHYvoH9Sdw74vr7m4MAPur/3nW98P0U+eejLPgAAP5zrQWdKy7OMp0Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=te3pJ7IOtPtoiw7p/qAic6r/iyxbCF9R0pVFGNAD/tw=;
 b=FgijUIo0bX1Lqo0l6jiRfxVTLq5b9ifuISvIoqMzaOfGZoqqKlmgmUYDUVDRoqZuyHXquHUczg+CUTjYUFFy7S+/pAiuCmJAZir0Dx5qzr1eJQG+JP98jvokm8glupr5BVE+cgILQOOOlStobDWpPPAHYx6ppK7sraAOHSpBYSQIa2NBw5Rh0PSzeVaGFtsaKd1IujN2dtvdMtLdIsoODR0yLAO9mTN8kMEGu6hmRo1zO535MxHe/PAoNFCCVLXACPU0f2BJiVCh0bjYfjZ56wP/4NnFgPuvNTmPam0Ygu5oHgGX4PyvBzr08x7iOcsuiDl0sglL78oUJO3jSsx72g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3717.namprd11.prod.outlook.com (2603:10b6:a03:b0::12)
 by IA1PR11MB6514.namprd11.prod.outlook.com (2603:10b6:208:3a2::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Fri, 24 Jun
 2022 06:22:52 +0000
Received: from BYAPR11MB3717.namprd11.prod.outlook.com
 ([fe80::a11f:64e8:4555:ad6a]) by BYAPR11MB3717.namprd11.prod.outlook.com
 ([fe80::a11f:64e8:4555:ad6a%5]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 06:22:52 +0000
From: "Yao, Yuan" <yuan.yao@intel.com>
To: "Zhang, Chen" <chen.zhang@intel.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, "Zhong, Yang" <yang.zhong@intel.com>, "Connor
 Kuehl" <ckuehl@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Yamahata, Isaku"
 <isaku.yamahata@intel.com>
Subject: RE: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Topic: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
 enabled guest
Thread-Index: AQHYe9viDVA1WJqoCUaizrs+j1JVhq1d5aWAgABH7HA=
Date: Fri, 24 Jun 2022 06:22:52 +0000
Message-ID: <BYAPR11MB371748FB85F2F42703BE1B0B95B49@BYAPR11MB3717.namprd11.prod.outlook.com>
References: <20220609083456.77946-1-yuan.yao@intel.com>
 <MWHPR11MB0031A5DE80B1DE817BFB3A399BB49@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB0031A5DE80B1DE817BFB3A399BB49@MWHPR11MB0031.namprd11.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 52b747e7-b30c-48c8-e28b-08da55a9f7f3
x-ms-traffictypediagnostic: IA1PR11MB6514:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NOi5LYLtWy83iIeiWzIRa4ZqbVCD9g0Q5iDD7FCzFa9VPlQ9NysLqA1Kz61nzDzkDDzEF9ui0YcOlYpMFQuDYASyruQIQAeqcRClBLZpsxKCKksXsoN8nZ5E2wptqYJOAp2kLIWnOOOpl2glNFDZl9kdQiA8EI/4agayzl8io9vlorOTpgcY3xJyyZydaS5bxHOg+FBWu8Gt15h4+6wLWFarun3sN6iACw13XjOEDHZyNrp/zKl+Nqkj4BCoASxdCXStZKF2znxJ10FlsIR4k9AxZOhHXEsveqlLGmgrrSyQABO9mr8X4BHyOxC1uqB4AH9ZKdOjYu3QJjuqLic65aiYcTRLuyikBintucVtVhhXVxLK6AKikvb5WS+06dotpR6PwwRmWKMAG3V1bAIVkzePTqmUJjLfbL757R/rJjtzL9fLe2QX0mcxZ4Q/VSnd6ogc97L2SYCIr4/8t95u6DgjChGD0JCOnkpGOieiH2ew/ATRaj6/XP4PSCQf6QUevyc2URVoUT3F5EFpSK1AEng+0C7RUNJeWQO92mwUm4BilJ7A/xNvUva9t8sW5unpJg8jM883Vin0QU9nXmYnqlyUMXsI41ijdZNtfX5aS3B3iXzCeFHwKXErTuFs2gSR1x9l6XzPAMv9OcN688oUO1eLltXjGSb7w4P2NoSBw6RR8JJzmcRgEAn3g4upEesJOwqxIABeqPnGwsTZThUjKahHbBvSg0w0LqVAtOkPhGe6aN1hyqmnOoTW+gOs8SMijak3CPNu83dS6uoKHXAvahSQZSsAxVPsjQAwyFo42Lt7SaFeJ3iUbe4GbjPYzt8T
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(376002)(366004)(136003)(346002)(396003)(83380400001)(8936002)(38100700002)(186003)(38070700005)(122000001)(107886003)(921005)(82960400001)(5660300002)(41300700001)(4326008)(6506007)(33656002)(86362001)(66476007)(316002)(2906002)(53546011)(66946007)(478600001)(54906003)(55016003)(7696005)(76116006)(9686003)(66556008)(8676002)(64756008)(66446008)(52536014)(110136005)(71200400001)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Y8Vr+BAsJtIjZVfvAoxZKHfVg1HutQ20wnkfXopitdZ1hTjWcGZS0gQWYC?=
 =?iso-8859-1?Q?3qvYV7TWCsLTf6MWdSv4akewGkflZ+ZmC36yo+QDVkuCah1QCO+P/qPW8T?=
 =?iso-8859-1?Q?2aP5LMMt1A2nHGOnKPZ79jL8GWvmo96Kj03UgUturi9UgWhk8oEKJ0v7R7?=
 =?iso-8859-1?Q?CvBiw/6QZbhn4p64t9nfZLOUr789k2qS3vVk7vWAGVcDFWuu1bfGl3e4Sl?=
 =?iso-8859-1?Q?L3O5jJlNTugeuI97tRA8DE+USiMIW+JOiKcVdmJuqlDhDa+TsiYsOsuiAR?=
 =?iso-8859-1?Q?vvbvxBLSHvt0UQaawcz9FiZ2xnYiptNK3v92Aif4ub/eROok7K/ko9xROa?=
 =?iso-8859-1?Q?XCFE9h8cZ2QH/OcocGD+HzUKxXykJEnT+/qrSjbbF/IdBgaxevZip+rQ3I?=
 =?iso-8859-1?Q?vzEFET6PaBU7KsZXU21l78DSxIGjjjJrBmbUbi8AoivT0pDMujE3EZ+D59?=
 =?iso-8859-1?Q?bTCs4eZIcslzBMuRh4uilogyJRFEhPzk8EZ8ruK6tPg2B/JdMMqMOIMM8/?=
 =?iso-8859-1?Q?MC3v8li7a7IH88Cxcv6lMD+KwJv/fMspHWNRl+dzV+vJNEZUdS4Q/F42Mt?=
 =?iso-8859-1?Q?GBznDq5sbJeoETK34x4KqKfphGWrmTXoL0VFOu01oBU/HUuxUQiNT6y9nv?=
 =?iso-8859-1?Q?uB4SaWGtTZ/v6yr2MIy7e54eqoghVBybyrrtbyfkqfLpqEw8dsQnkeARtK?=
 =?iso-8859-1?Q?WysuQKwWnYxNvGQjhjKiSOpwWGC2FCe91D2Pk8vtgRgFx6eF2D4Ed8o9lm?=
 =?iso-8859-1?Q?ayqoqudSzG3Lx1JRGZKMugO0/MZkNjtH6ZcWd0X0JWpH5/N7DdDVgAm+bh?=
 =?iso-8859-1?Q?3zaSZbEkVIbXg/CrhDU7qKsWbsdEd/LmJUsNDOl/Bc8i8AB40a+XAg6xx+?=
 =?iso-8859-1?Q?xENu1B2o2vw7IUTiRg4+RSw04daMSAqrOxf5t9cbfm28OTn/+is6/qT/VC?=
 =?iso-8859-1?Q?/A78Jr1qSxY+oz+QaYps7UlpD2qOr0YK3NOQiAvWPen4ShxWLeKdqVe1Qv?=
 =?iso-8859-1?Q?mH4xHkSfQ/TCHNpdaZFzUrUvXXTI1KHSBQTy7mg8cp1MG3cfHObte6KQf5?=
 =?iso-8859-1?Q?89WcRi6XidGM3Zozw6fwObLxeuj0h93tf97sS3LAHPltE9twlw5O/Nkd02?=
 =?iso-8859-1?Q?KYboavyM8zqhvCEWElRsZm42IREtU+eOT1OdnPMR7HcAIAhrOPMrYc7SvV?=
 =?iso-8859-1?Q?W2dS0wklR/GPozN9qTRg2OsuCQ539g7eJE+i7qkK0M8Ie/kiW9wpju5fS/?=
 =?iso-8859-1?Q?3KRMIcF6+4KcD6ADaKIrvlkiHz+c/GtdDvqg0uyNql1YANj30Hc4QCBUVj?=
 =?iso-8859-1?Q?WQ8nR3X6rHOl7OAnGFyG3KWiRfka6+mkWTC/F+qYKzJXVQlbxe99VcoI3U?=
 =?iso-8859-1?Q?LvxayKOAKZtnHD2a+scUzjd0iEwS7ABSeq7mcR47w2vvTlS+l04p0TTz/C?=
 =?iso-8859-1?Q?7kuKb0UsrgaA75gkCckXxQXBNzyxpkJ/+35V+AsJB+TfZ39WnxjQW1tC3p?=
 =?iso-8859-1?Q?93Ff0/oIFIKpIc7Jv6OmVUR0xqNcLqs5brCCboH6CcurWWeJIHF/cfYBn6?=
 =?iso-8859-1?Q?T6DBIsxvYQb7Kc/tO30vnwRGG0KhnEnRntgNFkBFyTRodCe4N0vClBZxUE?=
 =?iso-8859-1?Q?woxi72XaoEozlI4xtUCeBQ5qdLGD11NEYh?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b747e7-b30c-48c8-e28b-08da55a9f7f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 06:22:52.3823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OWZ0ZgjGTFXiyGrcxRv+ZvxiWLsl6/ZNlzVQrsnEHe0OUhyCRspMizhIf6mo11+awIaIDMcdBtR0vEJbV9BPrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6514
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=yuan.yao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

>-----Original Message-----
>From: Zhang, Chen <chen.zhang@intel.com>
>Sent: Friday, June 24, 2022 10:04
>To: Yao, Yuan <yuan.yao@intel.com>; Paolo Bonzini <pbonzini@redhat.com>; P=
hilippe Mathieu-Daud=E9 <f4bug@amsat.org>; Dr.
>David Alan Gilbert <dgilbert@redhat.com>; Zhong, Yang <yang.zhong@intel.co=
m>; Connor Kuehl <ckuehl@redhat.com>; Eric
>Blake <eblake@redhat.com>; Markus Armbruster <armbru@redhat.com>
>Cc: qemu-devel@nongnu.org; Yao, Yuan <yuan.yao@intel.com>; Yamahata, Isaku=
 <isaku.yamahata@intel.com>
>Subject: RE: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA=
57 enabled guest
>
>
>
>> -----Original Message-----
>> From: Qemu-devel <qemu-devel-
>> bounces+chen.zhang=3Dintel.com@nongnu.org> On Behalf Of Yuan Yao
>> Sent: Thursday, June 9, 2022 4:35 PM
>> To: Paolo Bonzini <pbonzini@redhat.com>; Philippe Mathieu-Daud=E9
>> <f4bug@amsat.org>; Dr. David Alan Gilbert <dgilbert@redhat.com>; Zhong,
>> Yang <yang.zhong@intel.com>; Connor Kuehl <ckuehl@redhat.com>
>> Cc: qemu-devel@nongnu.org; Yao, Yuan <yuan.yao@intel.com>; Yamahata,
>> Isaku <isaku.yamahata@intel.com>
>> Subject: [PATCH 1/1] i386/monitor: Fix page table walking issue for LA57
>> enabled guest
>>
>> Don't skip next leve page table for pdpe/pde when the PG_PRESENT_MASK
>
>S/leve/level

Sorry for the typo.

>
>> is set.
>>
>> This fixs the issue that no mapping information was collected from "info
>> mem" for guest with LA57 enabled.
>>
>> Signed-off-by: Yuan Yao <yuan.yao@intel.com>
>
>LGTM.
>It should same with the excp_helper.c/mmu_translate() la57 implementation.
>Reviewed-by: Zhang Chen <chen.zhang@intel.com>
>
>Add Eric and Markus for double check.

Thanks for your comments.

>
>Thanks
>Chen
>
>> ---
>>  target/i386/monitor.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/i386/monitor.c b/target/i386/monitor.c index
>> 8e4b4d600c..3339550bbe 100644
>> --- a/target/i386/monitor.c
>> +++ b/target/i386/monitor.c
>> @@ -489,7 +489,7 @@ static void mem_info_la57(Monitor *mon,
>> CPUArchState *env)
>>                  cpu_physical_memory_read(pdp_addr + l2 * 8, &pdpe, 8);
>>                  pdpe =3D le64_to_cpu(pdpe);
>>                  end =3D (l0 << 48) + (l1 << 39) + (l2 << 30);
>> -                if (pdpe & PG_PRESENT_MASK) {
>> +                if (!(pdpe & PG_PRESENT_MASK)) {
>>                      prot =3D 0;
>>                      mem_print(mon, env, &start, &last_prot, end, prot);
>>                      continue;
>> @@ -508,7 +508,7 @@ static void mem_info_la57(Monitor *mon,
>> CPUArchState *env)
>>                      cpu_physical_memory_read(pd_addr + l3 * 8, &pde, 8)=
;
>>                      pde =3D le64_to_cpu(pde);
>>                      end =3D (l0 << 48) + (l1 << 39) + (l2 << 30) + (l3 =
<< 21);
>> -                    if (pde & PG_PRESENT_MASK) {
>> +                    if (!(pde & PG_PRESENT_MASK)) {
>>                          prot =3D 0;
>>                          mem_print(mon, env, &start, &last_prot, end, pr=
ot);
>>                          continue;
>>
>> base-commit: 6d940eff4734bcb40b1a25f62d7cec5a396f994a
>> --
>> 2.27.0
>>


