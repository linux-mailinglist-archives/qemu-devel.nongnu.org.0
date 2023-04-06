Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4404B6D8E15
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 05:48:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkGaM-0001no-VA; Wed, 05 Apr 2023 23:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pkGaL-0001na-4t
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 23:46:53 -0400
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1pkGaI-0003Gc-Kb
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 23:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680752810; x=1712288810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MShpHfzVEXQLLb0u+UzHHDRtNY8C3mzlrmVll1wW8NQ=;
 b=RhkBI+TibZoR9RZHPX8FJLSEOl9Xqb4R+gnNqEnsBKB0ZKUtAGeUR4lQ
 7lGLsESgxxucIGrwQTOkz2oTOnPX4mZ61GFDj6qC5XashZc1e9wHV5ae6
 R30+UOCyRafwsFTbMpFM3hNhiBH4+al6RGfrys8STIZ3ZV4Pq55qsegAC
 doCPambrUcERe0z1BZVwtbKcuz3X75H6ZSi1gCW+cDVl8eRJHBOfQeOns
 xQ2yGv/Dm6NeceExKcrnpejGvhm/lgd/WtYW8jJYG7sXkK42g38ZNoRa6
 JJ2YGFweeR2XE19DjI0Gz8LE8lJSwtCbFkTmAOoxgva8uVkaZ9hg98RjU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="370466257"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="370466257"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 20:46:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="933058550"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; d="scan'208";a="933058550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 05 Apr 2023 20:46:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 5 Apr 2023 20:46:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 5 Apr 2023 20:46:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 5 Apr 2023 20:46:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O+KoyBZx8cNUrcmYrdpXTtP5Sp/OXPGIv+8MRxt3i5DiF0lxs1NKa2eXQnNL/vlt88fH+19Mc1YHdGmL1lqAnCYLlbJROSAqm2Jlor1M5OKlrzAczqZaSI77HZq389EnSKAhQoEw1BMdqzO/Dm8OgVltB4Zy+2w/XjJx/lysIYphMzelllUiAvPQk66Z8KZ1S9l0Qpy0LTwGtyWAfgnj4x119h5FPZFaYc/0cGD9VQPIUgKmi6GVaQerzjZxGQLxtvWrU3RfTxbAS0XOh1jkDgw4jTbr6DLAIjTazkB7fBhuvo3ho4Pgx/YdrP9iEwm/HMfYg4/e4aH0+YklExUWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQNDBlZ+lNFgQ4yqx2IgtY97Uu6Jy4NLYnaguhiXbSE=;
 b=LdtgrE8anSEjkt5Ebqn7CWCjLBeF58U9InlNXvqqHAV/IQVnTolWnJZcZJnZ8qCrHk3B5ycR9BbJ8+iVps1Jj9jobZec+YFlbTc1IzMZrIXfvZ9gEbLRHFBkdUYR8dFKbZYl5kAY3AtcujT5Cuy4ZxCLxhsEnqfRm/mHqVl3zTCiOCcLwd++xsosYla3xdicM+ZwAtrQrcwWTlSAjgWV8Wre1ynjKsJpkMAX2P2TtzZqvggP/5YtydeYYrUuzmUC7s2zvoyg1jRLUwUAED2PPlb+2Ak1vClLKb7Ru8Ko6cFfpHZrsys2La23dPjMdL7KQwv5yENhyxjr4uUdoHZwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 by CY8PR11MB7799.namprd11.prod.outlook.com (2603:10b6:930:78::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Thu, 6 Apr
 2023 03:46:39 +0000
Received: from SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1]) by SJ0PR11MB6744.namprd11.prod.outlook.com
 ([fe80::da0a:8aab:d75b:55f1%3]) with mapi id 15.20.6254.033; Thu, 6 Apr 2023
 03:46:39 +0000
From: "Duan, Zhenzhong" <zhenzhong.duan@intel.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Peter Xu
 <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Eduardo Habkost
 <eduardo@habkost.net>, David Hildenbrand <david@redhat.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: RE: [PULL 36/53] memory: Optimize replay of guest mapping
Thread-Topic: [PULL 36/53] memory: Optimize replay of guest mapping
Thread-Index: AQHZZx9h7l4IhLdGBUOkdamzDKgZhq8bhL2AgAIeulA=
Date: Thu, 6 Apr 2023 03:46:39 +0000
Message-ID: <SJ0PR11MB6744A3059DA0A505B4E6A55E92919@SJ0PR11MB6744.namprd11.prod.outlook.com>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
 <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
 <20230404150929-mutt-send-email-mst@kernel.org>
In-Reply-To: <20230404150929-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6744:EE_|CY8PR11MB7799:EE_
x-ms-office365-filtering-correlation-id: 10392add-93e6-4b47-6874-08db36518731
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w+deHqcgSH0EEgkW3JKhPbvEdpbi4WZQdmrskogeRnD4qT1HuPN1fL0krmCvx7AbXpCtIx4JxYW0OAsbcHNabQoMRQdE+MoD/tCuDLTiapAQlnurtHym27w+DIk4giQO2DimbPHjl1M7wC9ts1JIyj1asgs6EU6zR/oSXbDxacm260qRKVttRAdkct6o0ucbNKj5pYmjmDsAZh28RAeD/YXB8ZPMLYszbeBF8WqBGeU4Dj8F0+Mj5hiJOqmAG+27H74oqnZ9Eyuhvc9GMo3EzDZAAQW0GB8jGChCdsd4U1PU2aJ3Be6CFDr/swJlqRL47eXRPQggM1bXb+yP0X3FQq4wyv4DWlk+dD6iThJLY78Nv/949ZTx7eG0datLiyFf8TJb3jon8GktlJgo5BJQXOM+AnadIEuM/M8O97rdLfjjfOpMu3n0GExcvoqn9DHjROD3dkLJrK17TA5ZNMbXHFWfrf3TmehLwV9V4JiUyvoQifRp5JEBlq1k9UsxNwqKfqsTuSBClUXKLRXGer4NBfQuqCUY5eR3cmXcglr55c3szOjvRqyOeEfbfFV9vFLZ+h+v0Xqs/G02ljmnPm5TTJa69zXBQ3Wxubms5YP2zelj6ii6KFiPPyTg/cLaT8Zo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB6744.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(346002)(39860400002)(396003)(376002)(451199021)(83380400001)(71200400001)(7696005)(33656002)(82960400001)(55016003)(38100700002)(7416002)(66946007)(66446008)(66476007)(66556008)(8676002)(5660300002)(64756008)(76116006)(4326008)(38070700005)(52536014)(122000001)(8936002)(2906002)(41300700001)(478600001)(54906003)(86362001)(110136005)(186003)(316002)(6506007)(9686003)(966005)(26005)(13296009);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?osFB8OqgGcsp2iS5ei6PNUrehqsVOshvMhWY/5P7NDhD4rk/XA56XP5oBU?=
 =?iso-8859-1?Q?2BX00EX1VIc598ga4xwjZGxAffl98s4StY+CCFJdQGI7wl2nfFHSIGpAwv?=
 =?iso-8859-1?Q?t+4i53OmWwepDFwyOOB37QS2F9Ob04j4xlZ9aLD2CV7KrFaTbSof9qKWWH?=
 =?iso-8859-1?Q?fTUDUlnu4NRLbJ6MbhApVNssSs21wLtAR8aJqCBtvYxCnAlNOefOvcpCuz?=
 =?iso-8859-1?Q?DWNNtSFj2X76QnMo07LD1sQ5D4CwXeUhYmoc9eYuRvTyItwGiC8XgVUqrB?=
 =?iso-8859-1?Q?G+0Tpsl2cgEXWZOKiOw70F/8I9OvRUrDMApiY5irVi3rguRby2L1GHSHCo?=
 =?iso-8859-1?Q?QxhCSvB4eqQeO1iVd4SzPQD2bknTkxJVpXjbopoPsW5rak3pFTS8QhURCO?=
 =?iso-8859-1?Q?XpYNhVgb16FecsMCaU97UMvPAGGtJwSAk0VP/Rwu7opYAAIyOhm1fjhKs3?=
 =?iso-8859-1?Q?cLZbMsA98uekB5XIIS40KfUX6f1Y74vXPeo72vDSdDHf6lsGFsIKQSxgeL?=
 =?iso-8859-1?Q?Ey5spO8WINH2z9CnRtqv9wtRy8Dfu0d0gdqKtLOFRIM2Y3R+AN1BY327Q9?=
 =?iso-8859-1?Q?Sm3j7jbqsO8XCAIuu3WgaKsaNqzhLZwgn54lpT/mxnbX/ZWkk7bN9DtdlL?=
 =?iso-8859-1?Q?5nB8w6DbT3cHbko1odP8KB9VsDm2gD8NF3num/LIqwgSLP2wDjTBrr4o34?=
 =?iso-8859-1?Q?guN82A2tW3YDCKYbtb/cysccmVAUInwzOLEYTEjx8eQNqMHVUNu92168U9?=
 =?iso-8859-1?Q?8l2uHVnnvfz12mtJsMg/DPPNrok823+8PqswN7RRK3yNa28ZSjEVIU44VL?=
 =?iso-8859-1?Q?IrEsAKZHtdftyUKeIeA1ZxH2I3K1jCXdzv1BFzZ+Mf8/1MtAaIf1r2gONv?=
 =?iso-8859-1?Q?+yhgZtTUfVrGd8Fd/JOAbEYscZmLgvdIuNcLiaE6co0NKs3s6bTXlYxKam?=
 =?iso-8859-1?Q?QrzEVuwb/ULqVyEt9FS9PHKmJIfTBnGb1XkK+g9RQMY+1qzHIJLqmfbO6w?=
 =?iso-8859-1?Q?IQnCgalHtKJn8mZ6zUhUNj4m/achhl7BBPGWa0WoyFK7JZe3d5cojMbaTJ?=
 =?iso-8859-1?Q?z3gLlvmD0YRU5AZF4CKVQzAg2sJqcZ7bVhejVMvI38yf8CwsWFJt8wc+j1?=
 =?iso-8859-1?Q?JG+kM14gDiThn1gDAdo14kEG7JgUokBZ8aKJmKmCvGGu642acbj+N7x6rL?=
 =?iso-8859-1?Q?6ZySmIcigtCrt9004bsnAIUGxaRQqn/R7a4AuMM40Yhmhl5+iA4ppSU7GH?=
 =?iso-8859-1?Q?VVlVBirLDfWllei85shETbsfMo7DXCC9/M4gXKOwSKd6GHhlQ6+vJgRgrt?=
 =?iso-8859-1?Q?wE3+lzc9l0rbs9R1gW5cPJYlD3LTepCRBbYDRb8VNxB67nvxjgY+CI4bt0?=
 =?iso-8859-1?Q?d5Kq4QQFIIjVfzcB7BBISQeTva9qLC532svMTD84NTvqrawpU+Sg2M2una?=
 =?iso-8859-1?Q?bgru6QPDxzeSTLJHGdJlo0g4P69jMi+Ub0V82tbYGxGLftny1wdtjevJES?=
 =?iso-8859-1?Q?HuDTnxcYV/DIyl34w3KuajrURC5WxSC2Cp9l1i2UnoEJ9CtLnT0Rq5ZCkw?=
 =?iso-8859-1?Q?7XdMQh03P47GPlpYbOKKgntrq31Am5YIetsS+TMCOn1d6yqcQp2jwM2XSV?=
 =?iso-8859-1?Q?8fGQWnXMTzKbQswu/MtRclS0e6iHq10Zz9?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6744.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10392add-93e6-4b47-6874-08db36518731
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2023 03:46:39.1256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dfdFUHftbIX3TNpY+jJX0y5Ojgsv2VCYZ27xfZAF0O8fEuYOfc0UC5WvCsiitq7vctWNwxjvsB7IWMiwr9TKXdG9cff94j4Er3Klz3P351k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7799
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=zhenzhong.duan@intel.com; helo=mga01.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



>-----Original Message-----
>From: Michael S. Tsirkin <mst@redhat.com>
>Sent: Wednesday, April 5, 2023 3:13 AM
>To: Peter Maydell <peter.maydell@linaro.org>
>Cc: qemu-devel@nongnu.org; Duan, Zhenzhong
><zhenzhong.duan@intel.com>; Peter Xu <peterx@redhat.com>; Jason Wang
><jasowang@redhat.com>; Marcel Apfelbaum
><marcel.apfelbaum@gmail.com>; Paolo Bonzini <pbonzini@redhat.com>;
>Richard Henderson <richard.henderson@linaro.org>; Eduardo Habkost
><eduardo@habkost.net>; David Hildenbrand <david@redhat.com>; Philippe
>Mathieu-Daud=E9 <philmd@linaro.org>
>Subject: Re: [PULL 36/53] memory: Optimize replay of guest mapping
>
>On Tue, Apr 04, 2023 at 07:00:04PM +0100, Peter Maydell wrote:
>> On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
>> >
>> > From: Zhenzhong Duan <zhenzhong.duan@intel.com>
>> >
>> > On x86, there are two notifiers registered due to vtd-ir memory
>> > region splitting the whole address space. During replay of the
>> > address space for each notifier, the whole address space is scanned
>> > which is unnecessory.
>> >
>> > We only need to scan the space belong to notifier montiored space.
>> >
>> > Assert when notifier is used to monitor beyond iommu memory region's
>> > address space.
>>
>> Hi. This patch seems to have regressed the mps3-an547 board, which now
>> asserts on startup:
>>
>> $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
>> -kernel /tmp/an547-mwe/build/test.elf
>> qemu-system-arm: ../../softmmu/memory.c:1903:
>> memory_region_register_iommu_notifier: Assertion `n->end <=3D
>> memory_region_size(mr)' failed.
>> Aborted (core dumped)
>>
>> (reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)
>>
>> Since this commit says it's just an optimization, for the 8.0 release
>> can we simply revert it without breaking anything?
>>
>> > diff --git a/softmmu/memory.c b/softmmu/memory.c index
>> > 9d64efca26..da7d846619 100644
>> > --- a/softmmu/memory.c
>> > +++ b/softmmu/memory.c
>> > @@ -1900,6 +1900,7 @@ int
>memory_region_register_iommu_notifier(MemoryRegion *mr,
>> >      iommu_mr =3D IOMMU_MEMORY_REGION(mr);
>> >      assert(n->notifier_flags !=3D IOMMU_NOTIFIER_NONE);
>> >      assert(n->start <=3D n->end);
>> > +    assert(n->end <=3D memory_region_size(mr));
>>
>> In the mps3-an547 case we assert here because n->end is -1.
>> This is because tcg_register_iommu_notifier() registers an iommu
>> notifier that covers the entire address space:
>>
>>         iommu_notifier_init(&notifier->n,
>>                             tcg_iommu_unmap_notify,
>>                             IOMMU_NOTIFIER_UNMAP,
>>                             0,
>>                             HWADDR_MAX,
>>                             iommu_idx);
>>         memory_region_register_iommu_notifier(notifier->mr, &notifier->n=
,
>>                                               &error_fatal);
>>
>> thanks
>> -- PMM
>
>
>Fine to revert by me.  Zhenzhong Duan  can you pls fix up this regression =
and
>repost? Maybe fix typos in commit log when reposting. Thanks!

Sorry for the trouble, I'll fix and repost a new version later with wider t=
est.
Initial thought is to pick the intersection of iommu_mr and iommu notifier
in memory_region_iommu_replay(), then the assert() could be dropped.

Regards
Zhenzhong

