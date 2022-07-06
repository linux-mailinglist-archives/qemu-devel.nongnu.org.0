Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93AD3567D94
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 07:05:19 +0200 (CEST)
Received: from localhost ([::1]:46770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8xDy-0001EC-9D
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 01:05:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o8xBK-00007M-Tl
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:02:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:59758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o8xBH-0007QJ-8i
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 01:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657083751; x=1688619751;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uJah8WZma/F8xinp6/yP6sofCRXc7nrSRkS1M3lBC8M=;
 b=C6Nqy3klfB/u/EozivpXegNfz0m14jVHBf1lPhpgeRpCiINfgz3emtlB
 q+UxpMD5hPkPQSLzniv6r2lgXteanY10RI59Zjm+z0zrtXp3QTnjZS9EO
 3iazFCdDSfVsGRzXmF8mAvt02amaU9PuX5h1qSoUYy+RL5f8lzIb/TLJW
 pGX5B/1U1zdvzRbxRrLU/Q3uA2lPaobjCroQSgZozEghby44JHjdpjbbl
 svWdFnLAmvgmWTakLCdiwZBLGi/0Ubg1Z8Oi1U5jcl3P0+QaJtpMS+NgI
 tVuP1tWoLt/iCihoQW/pjFkAe7/tDE5bjJU/Jo1Ta92Hhc+dYxlTMp8+w Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="282396481"
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; d="scan'208";a="282396481"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 22:02:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,248,1650956400"; d="scan'208";a="567911677"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga006.jf.intel.com with ESMTP; 05 Jul 2022 22:02:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 22:02:09 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 22:02:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Jul 2022 22:02:08 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Jul 2022 22:02:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gQgN+3zX86O9nvqLvc3XHyicewPHK3UdoENynzn2Mf1RvKIIZt7/F0whFY2nmiq6wv/qFvOls6TYXuuJ8NP0rbpS0DwQQiFWStvkt6oln/glWWV011yPFm+GxbIIhh/sWcBydw0oVPB/BsO4IX/Fd/Tv1/g9usw6mf6osG6UQmCGJFI7WqTdVEcTJFTggFp9PZ2YJean4NGSzPVd3qwb/76KmX1AIDJlf8CiKj/jUm0M53J0u2LhcsfSpvwFMdhGM5NuY9Zs8YxtusHODZuze6OZe94XRMxrunUr2CP2z8V623eI9LEZVnU3ep22JjKdFjlhlLA8WTkfIkeiN6RoNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJah8WZma/F8xinp6/yP6sofCRXc7nrSRkS1M3lBC8M=;
 b=iCis0qNmjDsmHeUvUmfudvqeu4ASlzOp+fMlJBOwZXliKJYJExocTNNAUEGJWh65dzbfjYXGouBZ71KU+Tvfmwqj4I+sURUqS5i4dunv+M8rYb0c8TxhgT/K75qsxESRD7R3f1vJLmT/wJOOnw//WcVd9WXTTcUHu7XxXcdMAp5fPfP78aBl2FYfjqDSCI9Y6GvztqutGf2xE7pl1d6yYnvt+IePfseQSEyPrlnQRgVUmCVBlPNkMqLtsn18/VJOMIejdqtHXWkhxSELeI1VLxZ12ynbLVgUht/OOwnF41ejkGxoQmDU379LlyqKcDOfW7S8ITr8Nm3+OV679fhxLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB2953.namprd11.prod.outlook.com (2603:10b6:5:6a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Wed, 6 Jul
 2022 05:02:01 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5395.022; Wed, 6 Jul 2022
 05:02:01 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>, Li Zhijian
 <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>, Like Xu
 <like.xu@linux.intel.com>, Juan Quintela <quintela@redhat.com>
Subject: RE: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition support
 form COLO to PRELAUNCH
Thread-Topic: [PATCH V2 1/4] softmmu/runstate.c: add RunStateTransition
 support form COLO to PRELAUNCH
Thread-Index: AQHYRXzmizOHXYyq0ES2uHvbpCCqMa0DnnYAgAAE1MCADz4a4IAANLAAgBHP0ACAANyFAIBLnKqA
Date: Wed, 6 Jul 2022 05:02:01 +0000
Message-ID: <MWHPR11MB00317BE49AE00B7CDC066A3D9B809@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220401034702.687057-1-chen.zhang@intel.com>
 <20220401034702.687057-2-chen.zhang@intel.com>
 <CACGkMEs7FeRCr4E9E68gS+GBTgdebeD=f0dYnPivyZ2G1mWmvw@mail.gmail.com>
 <MWHPR11MB0031EE757A9C70E8F506BC899BFA9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB00318C5C371743AD30AB9CE69BC49@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEtdaP6x0xdwVWfHmBLWOJQ=ffepbmz-6quWq3g8FC5GCg@mail.gmail.com>
 <YoTv6hUkdggrfd4l@work-vm>
 <CACGkMEu6nxmZiyi=w_+hwemETfRJfhvwMypeSiLY1QZ_g9tJ4A@mail.gmail.com>
In-Reply-To: <CACGkMEu6nxmZiyi=w_+hwemETfRJfhvwMypeSiLY1QZ_g9tJ4A@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: dbde08e9-8460-49d3-8705-08da5f0ca96c
x-ms-traffictypediagnostic: DM6PR11MB2953:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4lzSafY2PrxeNICuzJsgjnM07ZOmiFw7Gflw2mtI+MHMdSw6PrBBZsUYXGWWhD/LiVq37TmSdVP8txUPEjPPsvT7WqYWP2Cf3Wpc+DjpEKYhxF7l+PDTyiTEkRcWbyfiCAtgRcp9gox0TGOG4X/TVyyb3DdCafYLum3jAxUAbHhdSnveS8cF9oAlWLwu9tOk5xmLQogfV763uh3VxVB+0wpx/rbpAPmGxqXRn3dBPzYQLMoa6Zw4s5rAkgdFrX3YKmWnQx3vN0xFrfRRmC7qXp3mIWQ8B6dYQ8YsRu9k7FuQEIndFpINl7C0iU0xOy4OxocAEDk1s3Pz2/mWW5dJoQLS6l5xcs06eMX3puOC0rgbaYpzb1UWepUy2jwQrkNDqjBhAByeU7vfek4eMwgYprGuougZ6F9nQrjWMrbsqOLIamFszywQ0zTmHfw0AUv52XeyCpgieapMcY/nBW15CzTZAgwe8u2Aan2HAo/1i6JQFFKaGzY3V0n+VY9JemT7Ly+RpZMLaps4+y1Xxaz+GbLq2TKIYjnKTGx6FDcDJZSr2sKp/a0yep0NjRVDa3Gyh8mGDOEPgTQhUnFWVn3pUxwCP2luuSMdIbDpx0vJALlYkOizWFCdTidxTl4znQ0AcH10c3LBLg4ED0cNzollInPd+ta4YiiqhkvQrxb3r7TKQofW0sIetK2QO0igeQe8ylT7viZhfqZcK6p2T84/7RgghZbOZ6h4lNZ1oQR4LX383e6w2MHEhBQYuj1UcOUmPW6qSXgL8VKOaOQRCmf57QGrRx62RedkyOmTl+fjEtwME3xo84SIQ+cDdtsOL61JV+Poy4stjIKH6R8L5hWSO80nMU6JuLgeRvUpQDf1QLwxfw9m97v+dBVwDU+WKOSM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(39860400002)(136003)(396003)(376002)(346002)(186003)(55016003)(38070700005)(38100700002)(122000001)(316002)(54906003)(8676002)(4326008)(110136005)(64756008)(66446008)(71200400001)(66946007)(76116006)(66556008)(66476007)(53546011)(5660300002)(8936002)(33656002)(7696005)(86362001)(6506007)(9686003)(478600001)(52536014)(26005)(82960400001)(41300700001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aEFHb0p1STlXSmVHalQrVGxNZGZCWDlnVWRNdGUwT011akNHdEpCbC9PV2Ro?=
 =?utf-8?B?WW9ha2l2dnBOaTM3WkFoVlNvV3FPRmE4THp5QkZTOGVORWVvekdrRmNqQXJW?=
 =?utf-8?B?dDhqVnBpeVV3c2grWTJqY1FUd1RmSzlKWDZZc2xvODY3cUkzWVZvcllmTmJm?=
 =?utf-8?B?YXpkLzJsamw0eEVzNUljcEU0YW50cGFoOHZ1VThHdU1JQ1l1OHBSTzV3ZXYr?=
 =?utf-8?B?Z2pCcGdZaytPd1ZvWEZpd2huNlhsY2JjbU5FMWtZd0k4Z1dUR25GRWZHQ002?=
 =?utf-8?B?WmhDdUNCZDhOMVEvM3NpRUJEMFNGTXNsbmdzdGlmT0ZtNFBUQnBsUzFkM0s3?=
 =?utf-8?B?Wjdyc1ZxN3kwOGdpRHNna2luWXBYNHJyemdKSW9iaGR4dmlXWERmandnS09F?=
 =?utf-8?B?M0RZVkNyYXQ5b2lqVGZNbXdKakR5dWt4MmVYZ1VnSHlwOEFLTmRLVVV5MHhZ?=
 =?utf-8?B?ZGRDSUthbnFVSkhUWWJjYXExdEFtUWNoeU9oT1JxME5MNlVLNktjRHN5Rnk5?=
 =?utf-8?B?M1dRQTBlTGZlRXlDQ1ZCUkd4TzRYaXBieERYak84QXNXUTVsTHFRVTVzOFlo?=
 =?utf-8?B?eXh3NkRtU3E0NGVvcU8zSjROMXRhU0o5a3VvNkVrczN3Y1hIUDI3YTdINDJp?=
 =?utf-8?B?WG04QnRkekhYdW9FeVl4T1RSazFYM25TVXJqTkV1a1ZwMURqV3lURVZrbkJt?=
 =?utf-8?B?dVFMOWdrdkFIQi9uMzNDVW0rajNnVFJDeXFZbFN0aTJEcjNRS2d1SHI1RmJ3?=
 =?utf-8?B?Z3lGdnFmWHhKYkZoc254ZytVWmZab2hLekoxeXZsTUhRR045WWtyd2ZVaGd6?=
 =?utf-8?B?OFBhTGFUaUkzWDdhNURJZWJ2WC9iSTZMMGxNRGM4ak40anFrL3JjQktBcUJV?=
 =?utf-8?B?UmZpemg3ejZCb0JFY0oxN0dYQVM3d2M5VmNHQkFRbHN4aXljOWhaUkxxSWt3?=
 =?utf-8?B?QnU4bTRQby9VYnM0RldhSWtCTzA3L3NHSmlTNCtHMnYvSmNsbkpwR2lqQnZ4?=
 =?utf-8?B?MHJHQVg4ay9FanhVVllGVG1CVXRNWjFEd29lMzg3ZmFzUWZGTnJNcmFpaDNF?=
 =?utf-8?B?STRBaFZmbVBKRksxTkpLSmhlcXl0Ym55aVF3bEUyMTEyYVZwVkF2aWIrZGVz?=
 =?utf-8?B?MS90ZWFGS1BYQlJaQXAxQTBlRU53VFM5MUpDNjdjNU5POThHTXZ5UE9Fc3VP?=
 =?utf-8?B?MTVmRWw1WGVDL3o4c2ZoSGRqQkEvZWU2Q092NG8vaEd2YkRLUHVxOG1LM2cx?=
 =?utf-8?B?am1sT05xZEhMV0FMYldoeWEwRlVHdWZ3bzR6YkZJQU1UNkN1UGRneE12N1dC?=
 =?utf-8?B?cFF5a21oeGc4b1VGdUdRM2Q4bHlobHU3QkQ3MGF6MzFSMjJJVXJKc1VMbjRn?=
 =?utf-8?B?ZEdRd3lEdjJFa1Vmby9MbXBJeG9qN1pVYkhCTm85eUpqNWM4QVlEZ1BqQ2RJ?=
 =?utf-8?B?UDV5TXVJUENCdTlrUjNZdWF2ejVZWUNzSVNPcm1OMmUyazd4R0dLTzNWc3FP?=
 =?utf-8?B?c0RKRGllWWRPTTgzYS8wQlJHZXdrelVVa01BcE5VSFc5R0xDTWFSK2pCTVQ2?=
 =?utf-8?B?dUJzbTNodkZGMDJvVzlTZlBFTUI2TGV0THVNWVN4MlZJblV3K1JoRHM0K25K?=
 =?utf-8?B?VjErcmx5MGk5ajdkVHB2ZDdnQUpEdE1kWjB5K3B2YS9rcUlFSjZpNko4R291?=
 =?utf-8?B?dEg4S2VKdFhhc1N2RWx6emhYbUppQVZMRjlSaUVjYjArSnUzaVdHbTVJaVg4?=
 =?utf-8?B?SnZFbkM4WTB1Q2w1QXVLbk1GYXRxVk4zMXp6TkYrSndlVnRRZjFHbGUzam1Z?=
 =?utf-8?B?dFNBY01PWUk0YWpuZTRjS21EZklZYmpiRGoreHN0ckR5am5rdkprUGxBNHJF?=
 =?utf-8?B?OFhiemJQMHJUTUw2MEJCMjhCbnZqZVVUeitsVGlDckM5dXN1RkUrUzV5cGRp?=
 =?utf-8?B?K0d0WkNpV0lycWtMbUNCTXdXL2xHdzBJVEd2UnhuOHVjWmlUcXJkMmcxUlNP?=
 =?utf-8?B?R1Q5Vi9KV2F1cGgwdFUxYmIyYzZERjJ4MlM0NllYQ2NjUzBNdHdPUnUxMGUx?=
 =?utf-8?B?N1lIbGhtaCtPeGhsbWdhYlY3Q01zakxuajNza2VzbEwxd0Q2V0FLV0gvRDN6?=
 =?utf-8?Q?jA5/I0ZCgVe36eqy0wgr+cy0Z?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbde08e9-8460-49d3-8705-08da5f0ca96c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 05:02:01.2586 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lQ1GpPZWi7aFzXjkl6+46jEqRWaquiy70UXjfZ5WilxkU2D4O1puvBzTdM/YVYujNc9JJ4Hbo8Crb+7GDG6jlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2953
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

PiA+ID4gPiA+ID4gT24gRnJpLCBBcHIgMSwgMjAyMiBhdCAxMTo1OSBBTSBaaGFuZyBDaGVuIDxj
aGVuLnpoYW5nQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4g
PiA+IElmIHRoZSBjaGVja3BvaW50IG9jY3VycyB3aGVuIHRoZSBndWVzdCBmaW5pc2hlcyByZXN0
YXJ0aW5nDQo+ID4gPiA+ID4gPiA+IGJ1dCBoYXMgbm90IHN0YXJ0ZWQgcnVubmluZywgdGhlIHJ1
bnN0YXRlX3NldCgpIG1heSByZWplY3QNCj4gPiA+ID4gPiA+ID4gdGhlIHRyYW5zaXRpb24gZnJv
bSBDT0xPIHRvIFBSRUxBVU5DSCB3aXRoIHRoZSBjcmFzaCBsb2c6DQo+ID4gPiA+ID4gPiA+DQo+
ID4gPiA+ID4gPiA+IHsidGltZXN0YW1wIjogeyJzZWNvbmRzIjogMTU5MzQ4NDU5MSwgIm1pY3Jv
c2Vjb25kcyI6DQo+ID4gPiA+ID4gPiA+IDI2NjA1fSxcDQo+ID4gPiA+ID4gPiA+ICJldmVudCI6
ICJSRVNFVCIsICJkYXRhIjogeyJndWVzdCI6IHRydWUsICJyZWFzb24iOg0KPiA+ID4gPiA+ID4g
PiAiZ3Vlc3QtcmVzZXQifX0NCj4gPiA+ID4gPiA+ID4gcWVtdS1zeXN0ZW0teDg2XzY0OiBpbnZh
bGlkIHJ1bnN0YXRlIHRyYW5zaXRpb246ICdjb2xvJyAtPg0KPiAncHJlbGF1bmNoJw0KPiA+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gPiBMb25nLXRlcm0gdGVzdGluZyBzYXlzIHRoYXQgaXQncyBw
cmV0dHkgc2FmZS4NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTog
TGlrZSBYdSA8bGlrZS54dUBsaW51eC5pbnRlbC5jb20+DQo+ID4gPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+IEknZCBleHBlY3QgdGhpcyB0byBnZXQgYWNrIGZyb20gdGhlIHJlbGV2YW50IG1h
aW50YWluZXJzLg0KPiA+ID4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoZSBzY3JpcHRz
L2dldF9tYWludGFpbmVyLnBsIGNhbid0IGZpbmQgcmVsZXZhbnQgbWFpbnRhaW5lcnMgZm9yIHRo
aXMNCj4gcGF0Y2guDQo+ID4gPiA+ID4gTWF5YmUgUGFvbG8gaGF2ZSB0aW1lIHRvIGNvdmVyIHRo
aXMgc2ltcGxlIHBhdGNoIHJlbGF0ZWQgdG8gcnVuc3RhdGU/DQo+ID4gPiA+DQo+ID4gPiA+IE5v
IG5ld3MgZm9yIGEgd2hpbGUsIGFueSBjb21tZW50cyBmb3IgdW5tYWludGFpbmVkIGZpbGVzIGNo
YW5nZXMgPw0KPiA+ID4gPiBQaW5nLi4uDQo+ID4gPg0KPiA+ID4gQWRkaW5nIERhdmlkIGFuZCBK
dWFuLg0KPiA+DQo+ID4gVGhpcyBsb29rcyBPSyB0byBtZTsNCj4gPg0KPiA+IEFja2VkLWJ5OiBE
ci4gRGF2aWQgQWxhbiBHaWxiZXJ0IDxkZ2lsYmVydEByZWRoYXQuY29tPg0KPiANCj4gR3JlYXQu
DQo+IA0KPiA+DQo+ID4gaXQgc2hvdWxkIGJlIGZpbmUgdG8gbWVyZ2UgaXQgYWxvbmcgd2l0aCB0
aGUgcHVsbCB0aGF0IHRha2VzIHRoZSBvdGhlcg0KPiA+IHBhdGNoZXMuDQo+IA0KPiBZZXMsIEkn
dmUgcXVldWVkIHRoaXMgc2VyaWVzLg0KDQpIaSBKYXNvbiwgIGRpZCB0aGlzIHNlcmllcyBnZXQg
bG9zdCBpbiB0aGUgbmV0IHF1ZXVlIGJyYW5jaD8NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+IFRo
YW5rcw0KPiANCj4gPg0KPiA+IERhdmUNCj4gPg0KPiA+ID4gVGhhbmtzDQo+ID4gPg0KPiA+ID4g
Pg0KPiA+DQoNCg==

