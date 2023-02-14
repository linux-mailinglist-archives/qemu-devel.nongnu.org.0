Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2E69568E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 03:17:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRkrH-0007AC-95; Mon, 13 Feb 2023 21:15:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRjto-0002LC-2x
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:14:24 -0500
Received: from mga06b.intel.com ([134.134.136.31] helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dapeng1.mi@intel.com>)
 id 1pRjtl-0004v3-MV
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 20:14:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676337261; x=1707873261;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5g4VzSN2OsKYh9r43MYzVLv3ucvBP18EWstwPue7k2o=;
 b=fHhOL/T6P0EFYGuHp3NN4ZILF640abMRDBfAhJDfJAPb53rb3VqsbWEd
 /mQVwt1EO9pCreP6O/sSmjKnZz6BIKWYWIsG1aLmjHNVbSOy10QnYKHI5
 c2uIXlB7RGGou3DZbovopm3OfA7Fu9FIsSN1DdvHDNhZ68Pg71bGw5gfo
 BKvQ+gl8n0WHX2wMsHQgqrfuZBaxpuFJquL9Yex2lZwJRYGYohag08Gfb
 7P0zsE1dfq5iu0bVXgtFFjq+FfcEpBLprVeOeHmaQUdC39FFYB3XZz0vE
 m4ihArLLDKGejbch7DTEgH19KdvU32g0P33v97nwGMuDEPEOMaIVTxPVb Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="393449321"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="393449321"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2023 17:14:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="701483497"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; d="scan'208";a="701483497"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 13 Feb 2023 17:14:17 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 13 Feb 2023 17:14:17 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 13 Feb 2023 17:14:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 13 Feb 2023 17:14:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSXyzlnFhC6ZajGdUean1Vd9opBB2zxbQ6UHuFkTrA0GO4xIgxOA4NmmIOkpLX+CfR6CszQ1odwOnoO6wAPvcmtmO5ovWLI752tLyr6qCkdh4fSenFSVHc5xyYu+biLE9FpID1PH/gSeq7Oa2z7XLjqM5kuKiWitkDUjy9KoBuGYJ+qADjPG5cTGCajb6HG64BRFF5KvKlJsHJgmDHdbb84AItHU+tev2rpRy7N5pXWEr7kq+mAYxKNKyPP6cMGqEF54JYrUPpWUcL8Oo59VydS8X8Qsanu8+/Zi854xhjkqIvSRgRKOaYB0Q3oU5jGTwHQHdmInkoFm6dOX+fBVBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mszB9oliOurJWwebthlBLlxFLqqIehyMhPSE1ssLiPY=;
 b=ji0R1BleSW708/dZ3Bvsbo1jpTus0+igHNq3RCdVcGlTeAghTeJwgbic3IXBRk7eGuB6JU8mL4kVz7mw239DYV95VaDVYeCE+RVyE6ETN4TbpohyB/hXv1Ft3qTyuumSZu/YnmCcoed+zcxxeHoqsSWth6+kTEUy5bgkFRAXiiz3IuMt4mbq09WljvldsEDsVppKYzF+KnFkKjfghOoglExmRuNu86RW2Uan/vC4XEVuX8g2bmbgYJrg3+mXP1yBz7k+yah9rgJTRXTznFDR4mdFmhh4d+Sd/cRawGr8cOqfbLoZbnkPiKFMvndOAjmHMf7qLWHHoSEdPvYHGYeC4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB4824.namprd11.prod.outlook.com (2603:10b6:510:38::13)
 by LV2PR11MB6023.namprd11.prod.outlook.com (2603:10b6:408:17b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 01:14:14 +0000
Received: from PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0]) by PH0PR11MB4824.namprd11.prod.outlook.com
 ([fe80::6b21:a6a4:3b0c:8aa0%9]) with mapi id 15.20.6086.024; Tue, 14 Feb 2023
 01:14:14 +0000
From: "Mi, Dapeng1" <dapeng1.mi@intel.com>
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?iso-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
 <wangyanan55@huawei.com>, "Michael S . Tsirkin" <mst@redhat.com>, "Richard
 Henderson" <richard.henderson@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
 <armbru@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang, Zhenyu Z"
 <zhenyu.z.wang@intel.com>, "Ding, Zhuocheng" <zhuocheng.ding@intel.com>,
 Robert Hoo <robert.hu@linux.intel.com>, "Christopherson,, Sean"
 <seanjc@google.com>, Like Xu <like.xu.linux@gmail.com>, "Liu, Zhao1"
 <zhao1.liu@intel.com>
Subject: RE: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
Thread-Topic: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
Thread-Index: AQHZP4+paAk3kaAwt0ODFlOPWZjl1a7No+mA
Date: Tue, 14 Feb 2023 01:14:13 +0000
Message-ID: <PH0PR11MB482477081252AE8E0054905FCDA29@PH0PR11MB4824.namprd11.prod.outlook.com>
References: <20230213095035.158240-1-zhao1.liu@linux.intel.com>
 <20230213095035.158240-10-zhao1.liu@linux.intel.com>
In-Reply-To: <20230213095035.158240-10-zhao1.liu@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB4824:EE_|LV2PR11MB6023:EE_
x-ms-office365-filtering-correlation-id: 852892be-3478-42f4-d37c-08db0e28c90f
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ffZD+HQC3JquRA60gBVSPCYn6H82rUm81+t9Ck4/gRjc52hf+kvWn55DRR38VRI37dwvpZkSGd0BLIeuq0zTv5EYjG18JBDNjinhqpme+bFp+NtS/e0+2XDcBB2+DLK/MaPTqvpEO0MrnhIN8JYkSePB964Kk6Z97Nrp52WROCb3LYHBdNFNLjZa0lIewDmTEiMRmYnPhdsobGqAtoAi62sNrJPlD0jCcvVADIA3U19Ko7HtWF2XPrqOi09eh69x4OywvVQpasqRqRvBtFRd4ZRt9mLijgAB/pm9nqYBN/ZqDnLenXnGydQEiDK58X0C9gZzbbwV/OJmrGVteuebZ6kyGhdz56xV/nEOYVAaJ9Nm3W1sG93HTE1fM481z2S0CYOcJnKLXsuIUrGXNgvYcd6tZFFz+g7TtdUhhiy6qAw+mRWYb0Gumh4DMnbhmgPCZU+/bQX4I7LGdAIOeL0onGgdiEonQsy0uufeaY6GOUtQAbC7aPUxTk2WY6mBXI2Ikt2S9ACpdh/SRJT/Ea3rOFNn2IWNSY9fJMb0cC1avA1evhGDYK1vU15DCB1xhLUo+zBlSzSXDjJ3yIVDDHG5Gx4EuyN0kLer+bp4vTZ56Jo2HA25uzurrhEsPVkAstk+DyVm7d7DcZKrREbXw89owLp4/ygweSftulVUSZ9XfIWasNO6XHjsS/+Q1s9xwB1Ri1lcX6jMb0qoa7VTwyF7DCCAWU/O5F943U7epa4OItk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB4824.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199018)(5660300002)(7416002)(2906002)(52536014)(110136005)(71200400001)(54906003)(316002)(66946007)(76116006)(66476007)(186003)(66446008)(53546011)(7696005)(64756008)(8936002)(66556008)(41300700001)(4326008)(8676002)(38100700002)(122000001)(33656002)(921005)(38070700005)(26005)(86362001)(82960400001)(478600001)(9686003)(6506007)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ii1rQHNN45wg9BgTNsQYB9qi+sWj4RN3thDR3zM+WsHgu2NPV8QPSKd+o6?=
 =?iso-8859-1?Q?E/3cfsZqjWNnH5IY3SaIifOds7O8GUVBkReSdtThNKrOFDRVf3huqaThhn?=
 =?iso-8859-1?Q?pcsxYyW57pC1HgvE1ZxKi7hyj6wYMKHnTzN9s1bTaHYY2B71bVvz/nZak7?=
 =?iso-8859-1?Q?pxjj0qKkhAAankamVR7YMIizJ9m6IzSZ0+afmueXDzYyftfRykvKd9jDzc?=
 =?iso-8859-1?Q?UbjXmnincaU/ZoLNG2sO8Hj9cCfNoLG4KtV6qPDj1LrgBm04+jmBjwpyTb?=
 =?iso-8859-1?Q?ATThF8hBxB77y23nzJKaZK1AmDb1x5dBqnfJfS0qF6MOn4To82DpTyjadR?=
 =?iso-8859-1?Q?VyDCKqZw7iWfUajwst4QvJOBaU+KCGEVil3MAbEAtWW7/s2aKiXUrEE6T4?=
 =?iso-8859-1?Q?i5ImkFsoAmH1m88jSl3XDLE0HPZNkK9IAnDf4ine16vyhzzorxCa5+YWj/?=
 =?iso-8859-1?Q?LXnhVh1iXORrz7r2/yxL0b0XI3DNLc2bV1F2X0Y2oPfU4C0nOtj7OggeF/?=
 =?iso-8859-1?Q?WxC8vCMqNVkV3Kyx/QfMze90QrNRiy46NGUlwFjwnBqgxVt7AmGcCfRj17?=
 =?iso-8859-1?Q?haMZGvy6A4aGO8bzGTlltxt5s6QZO+WIAd9uL9Q4hnsaGQZ9EXQ5CAFAyQ?=
 =?iso-8859-1?Q?Bkwhm0npxCwNVcFAeuGFSzSurUnH5um5H1p8l8a7R2j8tE62F5swu60YhL?=
 =?iso-8859-1?Q?TzK5Xx4YAWPXorewqI46e3MGJ1nfSFgByxooEt/f+oHa+PZZI52G2a/pX/?=
 =?iso-8859-1?Q?je5qSsH6aBMAdy3iojUrBDaMtdITF920El/e48pFLpz2/kfiIOYQNDldDV?=
 =?iso-8859-1?Q?oZRIWQJRTCjUgh9itMpUVwPYIoOtlJea//3MQ/GL7GtLACENhp1MbuXAtB?=
 =?iso-8859-1?Q?gjEUuCw92+WeIfnZ6bGTs0sAIwWkrO/Zl5Is1pXFXZTVfZLh/e/qSTd/Vj?=
 =?iso-8859-1?Q?t9vJnUFI7Uo8IO9rGkl0Xl8ePEsTEbRTPmeBVVmdtTpbey/AJpOxr4IOCE?=
 =?iso-8859-1?Q?7zQp05uumMbBRI8F+JX3oW8Fda7o1ZLRx7CXfKFqRqMDs37AvxRqrvNCcf?=
 =?iso-8859-1?Q?Oezoxot5bUyIBK4qvmVsyiB1W3hO5TKHAO2jyA4szprvGm3FMvtpKGEYe4?=
 =?iso-8859-1?Q?dSsDxOQUFHxsH25o+q+3CElE3MWqn6tbdUO4Swny3sSWIbR9dUgpTgklau?=
 =?iso-8859-1?Q?V3DkEJUZvmN/uCFouiZUxUsiUad66Vh7DAB/nABfVEwpK8hU5gF2OV6f6h?=
 =?iso-8859-1?Q?aQTwkDl1LJq0W5xPE7+QmdtvVIhw8tus2Lwp2XuMdSVoPgqQzvH9+ACoNp?=
 =?iso-8859-1?Q?L6q4dIyYzM4b1HVD+Uk7xilk+CjCOALzFDP/i2arjPfvVK2gn/z1ZgbN/F?=
 =?iso-8859-1?Q?HNHKMM6A3U/MXzQ2+hO3Es4KkOFH9rg+/c4zR8/gMDsQ/bqKKrSPmCjyCv?=
 =?iso-8859-1?Q?bZcC9lz4+Megnzd1vJzQInSADGpu3zYWulfXP4pbaQex0cSvtvbXyBAwBu?=
 =?iso-8859-1?Q?SPotQFibOSUM93AwFD7baP+0o1Nv6j1Kj1XkctwGqAyFpFZnQbH6EPSvrb?=
 =?iso-8859-1?Q?nP556OMEpX9cenK5iSG8zt/jQ0IMDXgAe4/6Rshk0Vuzw+lFA5ro85sYP8?=
 =?iso-8859-1?Q?Fjt+wZSnyAE/j3UpSLk3nXpYgsr5CLbJpe?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4824.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 852892be-3478-42f4-d37c-08db0e28c90f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2023 01:14:13.7483 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7ujx+F0ERDdyerg6CUBCWcZ94+tVNz7n5lojucrQ+/9ZwziunSrvoQsWYOh281qDZA+okJCSGHzQPHfPHTYJng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6023
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.31; envelope-from=dapeng1.mi@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 13 Feb 2023 21:15:45 -0500
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

> From: Zhao Liu <zhao1.liu@linux.intel.com>
> Sent: Monday, February 13, 2023 5:50 PM
> To: Eduardo Habkost <eduardo@habkost.net>; Marcel Apfelbaum
> <marcel.apfelbaum@gmail.com>; Philippe Mathieu-Daud=E9 <philmd@linaro.org=
>;
> Yanan Wang <wangyanan55@huawei.com>; Michael S . Tsirkin
> <mst@redhat.com>; Richard Henderson <richard.henderson@linaro.org>; Paolo
> Bonzini <pbonzini@redhat.com>; Eric Blake <eblake@redhat.com>; Markus
> Armbruster <armbru@redhat.com>
> Cc: qemu-devel@nongnu.org; Wang, Zhenyu Z <zhenyu.z.wang@intel.com>; Mi,
> Dapeng1 <dapeng1.mi@intel.com>; Ding, Zhuocheng
> <zhuocheng.ding@intel.com>; Robert Hoo <robert.hu@linux.intel.com>;
> Christopherson,, Sean <seanjc@google.com>; Like Xu
> <like.xu.linux@gmail.com>; Liu, Zhao1 <zhao1.liu@intel.com>
> Subject: [RFC 09/52] hw/machine: Introduce core type for hybrid topology
>=20
> From: Zhao Liu <zhao1.liu@intel.com>
>=20
> Under the hybrid cpu topology, some CPUs care about the core type.
> For example, Intel's Alder Lake series CPU contains two types of cores:
> Intel Core and Intel Atom. The type information of these two types is exp=
osed in
> 1A leaf of CPUID.
>=20
> Core type should also be part of the hybrid topology, and
> MachineState.cpu_type cannot provide different type information for diffe=
rent
> cpus in the same machine, so add a type field for the core level in the h=
ybrid cpu
> topology.
>=20
> Additionally, add a helper to get core type information from MachineState=
.
> Though core_type is only used in hybrid case, don't use assert since it m=
ay be
> used to initialize some generic fields.
>=20
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>  hw/core/machine-topo.c        | 12 ++++++++++++
>  include/hw/boards.h           |  3 +++
>  include/hw/cpu/cpu-topology.h |  2 ++
>  3 files changed, 17 insertions(+)
>=20
> diff --git a/hw/core/machine-topo.c b/hw/core/machine-topo.c index
> b20160479629..e0ec07b53d42 100644
> --- a/hw/core/machine-topo.c
> +++ b/hw/core/machine-topo.c
> @@ -51,6 +51,18 @@ unsigned int machine_topo_get_smp_threads(const
> MachineState *ms)
>      return ms->topo.smp.threads;
>  }
>=20
> +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> +                                               unsigned int cluster_id,
> +                                               unsigned int core_id) {
> +    if (!machine_topo_is_smp(ms)) {
> +        return ms->topo.hybrid.cluster_list[cluster_id]
> +                       .core_list[core_id].core_type;
> +    } else {
> +        return 0;
> +    }
> +}
> +

We'd better not to return the hard-coded '0'. Suggest to define a 'enum'
data structure to represent the core_type. This makes the code look more in=
tuitively.

>  unsigned int machine_topo_get_threads(const MachineState *ms,
>                                        unsigned int cluster_id,
>                                        unsigned int core_id) diff --git a=
/include/hw/boards.h
> b/include/hw/boards.h index 34b64b012022..78e52af38cb1 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -484,6 +484,9 @@ unsigned int machine_topo_get_dies(const
> MachineState *ms);  unsigned int machine_topo_get_clusters(const
> MachineState *ms);  unsigned int machine_topo_get_smp_cores(const
> MachineState *ms);  unsigned int machine_topo_get_smp_threads(const
> MachineState *ms);
> +unsigned int machine_topo_get_hybrid_core_type(const MachineState *ms,
> +                                               unsigned int cluster_id,
> +                                               unsigned int core_id);
>  unsigned int machine_topo_get_threads(const MachineState *ms,
>                                        unsigned int cluster_id,
>                                        unsigned int core_id); diff --git =
a/include/hw/cpu/cpu-
> topology.h b/include/hw/cpu/cpu-topology.h index
> 8268ea3a8569..87d832556229 100644
> --- a/include/hw/cpu/cpu-topology.h
> +++ b/include/hw/cpu/cpu-topology.h
> @@ -45,9 +45,11 @@ typedef struct SmpCpuTopology {
>  /**
>   * HybridCore - hybrid core topology defination:
>   * @threads: the number of threads in one core.
> + * @core_type: the type of current core.
>   */
>  typedef struct HybridCore {
>      unsigned int threads;
> +    unsigned int core_type;
>  } HybridCore;
>=20
>  /**
> --
> 2.34.1


