Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E90B4460D8
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 09:46:10 +0100 (CET)
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miurR-0000Uv-8V
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 04:46:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miup0-0007g2-Cd
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 04:43:38 -0400
Received: from mga04.intel.com ([192.55.52.120]:6386)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1miuot-0005W2-Rh
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 04:43:37 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10158"; a="230588956"
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="230588956"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2021 01:43:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,210,1631602800"; d="scan'208";a="600553831"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 05 Nov 2021 01:43:24 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 01:43:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Fri, 5 Nov 2021 01:43:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Fri, 5 Nov 2021 01:43:23 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Fri, 5 Nov 2021 01:43:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awbXZHCMiq4sVG/4zfhEMR1+6kJ9NaiUI+hL4gHAPk9I0UPiHFAdGitcK03bpaYr3V5pKCC8Aln35nNBmBqa3+a3gv35z6tZ729uqWzBYgcEn2kMaZf9ty3N2GHXs0Xu9RGJK9+HjwBKs6t9Tt0aZouol1hk6lb+uoBVATFH+vuzFk5FMDDfRs8S0W+CU4uMgnZ9S0nQ0kWWvCVTmG2PKab51rDdiszzsnyRmA/nsWxEPzO70vDMFyajDzs8gl5FkRcdd2FqiHMhUiY6zkNrTJHnHi97T1JEW7Q1c4QWJiJQOHYxMGbeQsLz1tv1hgPfMJx8VAyu3uyoQJYuax+gWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FR7gIb6reX1brJjo5GbUSToxTUGcn71d6GiEk1DGeWA=;
 b=IgNP1q9rxIpw3pzHYTIQC9CMmu4cOfZf5BFdHRIhbSbJTXy4ArzTe84E2VxQTPnqTiQCJJamu+OQx6Dbj/U2NoK1N5/Ddc5DKXs1qw7Ar7iF2HlMUYg31VZeyq6/Nuueqbrcyz76tdcsVE2VIA8srR5OZzyFWYfJCjsZw1XIWtNehWVZMJQhIW9uOFOoziw+vWyTLPALG6wsOcLcRnI0fYrfTPD7JHv+kRr2YLEKDafUmam+7oqnlrrtuw0PfBpndtg5Wo72XDMMxvSDgO5MOT7i6QfKeJJSABVLVoIxVUkoCZ0gH7qcYVyYQvXePK1twQWDYzNUctmm4PpzSHm9XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FR7gIb6reX1brJjo5GbUSToxTUGcn71d6GiEk1DGeWA=;
 b=ASFbX09FoLM5KogTEQatbYvyo5EG80pYXl6y0QjBsQV+RNf7mqk7CSS2YNOjeOVg1g2RuvmF1Nl2v1i7OWmEZQF8WZuWynyT93ckBO0/ZdBokdg3dp1WLsCOQD7KM/eDAU0LAcQTn91BqThHvejRyd4e7TIYmq7dNqIlsI0RyKU=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (10.164.205.37) by
 CO1PR11MB5060.namprd11.prod.outlook.com (20.182.136.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15; Fri, 5 Nov 2021 08:43:22 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 08:43:22 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Topic: [PATCH V5 1/3] net/filter: Optimize transfer protocol for
 filter-mirror/redirector
Thread-Index: AQHXy9x7gE+VGPrLuEuUpJeh4vPmyavpTZSAgABPWuCABHFUgIAAMzPwgAShnTCAAWxkAIAAAISAgAAMYICAABYMEIAANIUAgAACC2A=
Date: Fri, 5 Nov 2021 08:43:22 +0000
Message-ID: <MWHPR11MB0031EBF5ACACF7455EA9F4779B8E9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211028090556.3168043-1-chen.zhang@intel.com>
 <20211028090556.3168043-2-chen.zhang@intel.com>
 <c603b048-1cee-1396-811d-8be857aa932b@redhat.com>
 <MWHPR11MB0031A0311824C3DF060B64E39B879@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsjn0nz4N+O4s9Y0m0gEYXu9WKstP9LHE4F=m5mOR3dcA@mail.gmail.com>
 <MWHPR11MB00315CFF0E7854146B5C9AE69B8A9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <MWHPR11MB0031B626425E7815EB78A9E49B8D9@MWHPR11MB0031.namprd11.prod.outlook.com>
 <94f96089-f8a8-d3d4-18c3-26917952fc14@redhat.com>
 <DM5PR11MB00276DF408F0DBC3C6EFADB89B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEvuXhuzSiTebOQqvriD5UnaiPzaY37AOR8bihTC4FTa4Q@mail.gmail.com>
 <DM5PR11MB002701BF07DCC15BF968A1749B8E9@DM5PR11MB0027.namprd11.prod.outlook.com>
 <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
In-Reply-To: <CACGkMEs5q4E3yK_ZjUQsvJ=Ojd6hmTVEwQeh1N0QDPNaPoM7Dw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f523051b-12bb-4a8a-331e-08d9a0385325
x-ms-traffictypediagnostic: CO1PR11MB5060:
x-microsoft-antispam-prvs: <CO1PR11MB5060458E494FDA34F86251B39B8E9@CO1PR11MB5060.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bHvN8buDGu6aBBC71o+lEN99GVK31MtlGbe/JXH+Pe/LimTFrGO+xbyLX+k3OtkEBfmdP9EKZfbbB8ZYlBfwlnvz+IpSWeTjy5LTbXV6XWa3iLQ34mNs5LCATfh8qsjlnlge+9KTq+Pn4/Rj8G+XuDUdbLzvuObaWqBR+xyAsZKfmlOKtRTU1N9FBJx03gNYO/FTIpjtWyr3sdqAFSsZ/bXhKsAHTiEAHZGvlxwkpfKPC0D+/BkG+seTiQuS3F1oUkmI4cXUJ4WM99QGktWuO8rRm2gRN+9XKAd4AMv5UnwHrhEsPkb9Y684Nj4ZkI8YxhnJyK9Y2nYlX3LO5y07VSxyBKP5RtzCC+pGPWRcmnNnRE+gMKZMmuUBcUuk1uifaLs6rmr7CkUutGsGQ79pNJsSnPNFOZe/k112ZCg7TPGYxWS0VksBPl35+3fxBzd0kiRfLYAIxFGAtKIZo+hmJRSnG/GoVZN2iUXqWLWvJ92USlXvwl1JIW/vYBt0KbFlYlNOuAiNo1Q/KR5QmLeIcSLx3R/kf21rpDnEVUKlAGtI8p0Ab32pWnkR+3a8jhVYGOVcRGNfLwzbteDD7kSLlMIw3ya/tZwibwgoJ7X7VrZStvMZ6PeHZeFloaMJi6TiEvxeX8raAXoYXeKWcgc0X5Aroeeln0SDENJicDJMt0Pm+Nbv5WbFxC5Dvy1cXgjISLtFa5t0AlEIyuFDPKr4cg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(82960400001)(6916009)(54906003)(316002)(55016002)(66946007)(66556008)(2906002)(8676002)(38070700005)(5660300002)(6506007)(53546011)(83380400001)(86362001)(508600001)(38100700002)(66446008)(76116006)(8936002)(52536014)(26005)(71200400001)(64756008)(186003)(122000001)(33656002)(9686003)(7696005)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFpHd2xXZGhKOVlVV1VOZ0JRV3pxMUNvZ3UyOEVBY01SOFJIdHRMUTdMUldG?=
 =?utf-8?B?V05XWnR5TUNtVTJDWkg1eGc3S2tyK1ArRER6SkcvOU9ScC92aUx5ZDc4UW5u?=
 =?utf-8?B?UjdpSVg1MjdZaEVaeXI2WnZrMldrSFlUQi9DS2tIQnhTNlZtTXJKdndlUGxV?=
 =?utf-8?B?dldNYXVrTzdoZGhtUVZJc1dWeDJaWUJGK0FMYVZaY0VUMFhaNkhQbmlGaks1?=
 =?utf-8?B?cko2MVhlK2t5TXBLZy83V0EvQVdnNDNWVTVXYTd6enFPTmY4cUNtdXdtUXdF?=
 =?utf-8?B?UmFHMHZIVE1GRkNiUi8vNHhRSGxzRkxBcU9LTk05WHZkbXFhMVViNFYvU2FC?=
 =?utf-8?B?Nmp2TXJuVVI2elNrYjREbEpybzcyV1RINU83aTRBTURIc05Sdjg0Z1dhTDI1?=
 =?utf-8?B?MzNPRlMyVjVHWVVhaHd1MmFkVkZKcUYvLzByd3VqK2hHa3luOGwvbmlYWWdz?=
 =?utf-8?B?ZGF1ek93bGRhN1VVNERPNXFiM2N5WWhMcnZHenk3cGhIL3BjMEFQcnBkRnlk?=
 =?utf-8?B?ZFFoSkRXSTRtd2wwM1NQNG9PekdQanFjK25YSFR0bTBha1Z1M3g4T1VVOXZq?=
 =?utf-8?B?L0JaOG5hV3lXam5jL3lwUkxvbEJoLzJxK0F1di9MK1hKUm9XYlpraGlFMllB?=
 =?utf-8?B?eG9sVzdlZ3NUMDhqenlQdmxWUCtzSlUrS2NCNzhCZ3hYeUwvc0lxOHAvY2Q2?=
 =?utf-8?B?OUxKQmowejVxZ2FIS3dWRXFzcDdndlUyMGwveExMYVZIRWtJdXhGdWt4eVBw?=
 =?utf-8?B?Lzc5SFl4NnN0eWd5UitHQ3V2dzlQOU11NzYxU0w5TEZua1VmRmJmVWxXVnJz?=
 =?utf-8?B?VHRHZWJmVnFFcm1FWnJCVEw0dXQzQWhoY2x6VzlQYndpbGxWcFdwTUZleGdp?=
 =?utf-8?B?WW9UMUtjWWRpTGpMZldKY3hyOE5RbVE5SHhQTnFUNjdHTVlLOE1hY1M4aS90?=
 =?utf-8?B?bkVmek9nS09sVWZlU3RRS0JFdW1mR1pRNlB5NngxcWFwUmdKYWdheERGRGta?=
 =?utf-8?B?NGZhT2l3ZW80ZjRMTmFGNjBicXpLK2RwRXVzKzhFbi95MG9mSU5tR2JrRTRy?=
 =?utf-8?B?a0pnNnhOWlhLTUZQT2NvbGhGekY4Ync2TTNGcjZxdG9RL2RxaUhlWjRlb2Jr?=
 =?utf-8?B?Zk5INGkxSzVqeTJ6YzVxOFAvREFrclBybXZBNHVHMXJEcVlVS2Q0bzNSZWtM?=
 =?utf-8?B?RUxsNkwxcjRtRHBSUk9KVmlSeVd6S0VOdmVMTllEUGJmZDZGQ25qTGFicWps?=
 =?utf-8?B?UVFGR0Z5Si8wU0EvbnpmL3dhNjBQTmVQRDBxMEcrNXBLdHlKMnR0V3VIc3da?=
 =?utf-8?B?Sktlc3ZRNEdSUDVkU1Y4Ym1vQmJ4RS9JSkVMTENaMnB6ajcvMHZKZXJhTktM?=
 =?utf-8?B?ZnlNeHR4SU5hSVYweC9OM2xjbnltZjFuMFQ0NzhlVzdmaUJWSnB2ZnM4QUxp?=
 =?utf-8?B?RXdpb3RBcW4yYnVNc0RyN0FwaDhKZC9yekFjQ3dhSjRwZEpmVFk5YzBTQThu?=
 =?utf-8?B?MkJwUXEzNVI5STR4TXRwcStPNkM0NUgwdUNjczQxb0lUTjJQOGVTbDJjTU1X?=
 =?utf-8?B?bEZBbXNDcHdaWFdXWW9MODZZYXFMNVNNdjFGMEVIWUY1UDdNY203NldhUzE3?=
 =?utf-8?B?ZjF0ZXZjNTdCYkcxRmZQWWVxWU80dytMOHNOK0xVY2gydWZ2T3FpSHpXUGs1?=
 =?utf-8?B?SnRndTdNcWhkSEtZc1ViTEtmSkNiWmNRNEhPbWk4OGtQcXdwUHBmdGNkM01W?=
 =?utf-8?B?cktzTUxLZ1VROXV0VmgyL0docE1nNVpxV2lKMlBXRStTK3lNemcwSVZpREhz?=
 =?utf-8?B?bUdEUXVqZnFpMEdhM1FFLzhkcGRlT3hydWVtNW1BSitlaE9tdEJZK1ZuSCs2?=
 =?utf-8?B?bzdnc2NOVy9nOHFnUHhBdzNaekRhaXZOLzdpd2lka1NxdVJsdGFwQXRudTlj?=
 =?utf-8?B?ck5Ta2UrM0RuQlVweGwyRnRSOFd0WDhLR01HbzAvVGhRU0N2N090c1RqSThC?=
 =?utf-8?B?S3JQaFFvZ0ZDUS9SRnR3QUw4eldRN2E3RkRscnNWcjNZUGVIdUNUQ1JIREhF?=
 =?utf-8?B?TjNBVFlsK00wQkdhRzVMV2tSM0NEREgwZFB1K2h4V1p2TkVzZjBvUWlMbFAr?=
 =?utf-8?B?d2lyZGZLcE5EWCtQWUxhUFN0UjI2aDRxWU56UnlGQkNud1lGdlZWbVlpLzBi?=
 =?utf-8?B?aUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f523051b-12bb-4a8a-331e-08d9a0385325
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2021 08:43:22.1296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4n8ohw+cyanH18l15cb6nBRwjYejL9zRt8H16CoN6GnFtzCy6z7yWN2dh5RDMwrrZYSHav75OrV2jSfiQ4iE4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5060
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.120; envelope-from=chen.zhang@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Markus Armbruster <armbru@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIxIDQ6MzAg
UE0NCj4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gQ2M6IE1hcmt1
cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiBkZXZl
bEBub25nbnUub3JnPjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY1IDEvM10gbmV0L2ZpbHRlcjogT3B0aW1pemUgdHJhbnNmZXIg
cHJvdG9jb2wgZm9yIGZpbHRlci0NCj4gbWlycm9yL3JlZGlyZWN0b3INCj4gDQo+IE9uIEZyaSwg
Tm92IDUsIDIwMjEgYXQgMToyOSBQTSBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+
IHdyb3RlOg0KPiA+DQo+ID4NCj4gPg0KPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+ID4gPiBTZW50
OiBGcmlkYXksIE5vdmVtYmVyIDUsIDIwMjEgMTI6MDMgUE0NCj4gPiA+IFRvOiBaaGFuZywgQ2hl
biA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4gPiBDYzogTWFya3VzIEFybWJydXN0ZXIgPGFy
bWJydUByZWRoYXQuY29tPjsgcWVtdS1kZXYgPHFlbXUtDQo+ID4gPiBkZXZlbEBub25nbnUub3Jn
PjsgTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVyIHByb3RvY29s
DQo+ID4gPiBmb3IgZmlsdGVyLSBtaXJyb3IvcmVkaXJlY3Rvcg0KPiA+ID4NCj4gPiA+IE9uIEZy
aSwgTm92IDUsIDIwMjEgYXQgMTE6MjcgQU0gWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwu
Y29tPg0KPiB3cm90ZToNCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IEphc29uIFdhbmcgPGphc293
YW5nQHJlZGhhdC5jb20+DQo+ID4gPiA+ID4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciA1LCAyMDIx
IDExOjE3IEFNDQo+ID4gPiA+ID4gVG86IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNv
bT47IE1hcmt1cyBBcm1icnVzdGVyDQo+ID4gPiA+ID4gPGFybWJydUByZWRoYXQuY29tPg0KPiA+
ID4gPiA+IENjOiBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPjsgTGkgWmhpamlhbg0K
PiA+ID4gPiA+IDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+ID4gPiA+ID4gU3ViamVjdDog
UmU6IFtQQVRDSCBWNSAxLzNdIG5ldC9maWx0ZXI6IE9wdGltaXplIHRyYW5zZmVyDQo+ID4gPiA+
ID4gcHJvdG9jb2wgZm9yIGZpbHRlci0gbWlycm9yL3JlZGlyZWN0b3INCj4gPiA+ID4gPg0KPiA+
ID4gPiA+DQo+ID4gPiA+ID4g5ZyoIDIwMjEvMTEvNCDkuIvljYgxOjM3LCBaaGFuZywgQ2hlbiDl
hpnpgZM6DQo+ID4gPiA+ID4gPj4+Pj4NCj4gPiA+ID4gPiA+Pj4+PiBJIHdvbmRlciBpZiB3ZSBu
ZWVkIHRvIGludHJvZHVjZSBuZXcgcGFyYW1ldGVyLCBlLmcNCj4gPiA+ID4gPiA+Pj4+PiBmb3Jj
ZV92bmV0X2hkciBoZXJlLCB0aGVuIHdlIGNhbiBhbHdheXMgc2VuZCB2bmV0X2hkcg0KPiB3aGVu
DQo+ID4gPiA+ID4gPj4+Pj4gaXQNCj4gPiA+IGlzIGVuYWJsZWQuDQo+ID4gPiA+ID4gPj4+Pj4N
Cj4gPiA+ID4gPiA+Pj4+PiBPdGhlcndpc2UgdGhlICJ2bmV0X2hkcl9zdXBwb3J0IiBzZWVtcyBt
ZWFuaW5nbGVzcy4NCj4gPiA+ID4gPiA+Pj4+IFllcywgQ3VycmVudCAidm5ldF9oZHJfc3VwcG9y
dCIgIGRlZmF1bHQgZW5hYmxlZCwgYW5kDQo+ID4gPiA+ID4gPj4+PiB2bmV0X2hkcl9sZW4NCj4g
PiA+ID4gPiA+Pj4gYWxyZWFkeSBmb3JjZWQgZnJvbSBhdHRhY2hlZCBuZi0+bmV0ZGV2Lg0KPiA+
ID4gPiA+ID4+Pj4gTWF5YmUgd2UgY2FuIGludHJvZHVjZSBhIG5ldyBwYXJhbWV0ZXINCj4gImZv
cmNlX25vX3ZuZXRfaGRyIg0KPiA+ID4gaGVyZQ0KPiA+ID4gPiA+IHRvDQo+ID4gPiA+ID4gPj4+
IG1ha2UgdGhlIHZuZXRfaGRyX2xlbiBhbHdheXMga2VlcCAwLg0KPiA+ID4gPiA+ID4+Pj4gSWYg
eW91IHRoaW5rIE9LLCBJIHdpbGwgdXBkYXRlIGl0IGluIG5leHQgdmVyc2lvbi4NCj4gPiA+ID4g
PiA+Pj4gTGV0IG1lIGV4cGxhaW4sIGlmIEkgd2FzIG5vdCB3cm9uZzoNCj4gPiA+ID4gPiA+Pj4N
Cj4gPiA+ID4gPiA+Pj4gInZuZXRfaGRyX3N1cHBvcnQiIG1lYW5zIHdoZXRoZXIgb3Igbm90IHRv
IHNlbmQgdm5ldCBoZWFkZXINCj4gPiA+IGxlbmd0aC4NCj4gPiA+ID4gPiA+Pj4gSWYgdm5ldF9o
ZHJfc3VwcG9ydD1mYWxzZSwgd2Ugd29uJ3Qgc2VuZCB0aGUgdm5ldCBoZWFkZXIuDQo+ID4gPiA+
ID4gPj4+IFRoaXMgbG9va3MgdGhlIHNhbWUgYXMgeW91ICJmb3JjZV9ub192ZW50X2hkciIgYWJv
dmUuDQo+ID4gPiA+ID4gPj4gWWVzLCBJdCB3YXMuICBCdXQgdGhpcyBzZXJpZXMgY2hhbmdlZCBp
dC4NCj4gPiA+ID4gPiA+PiBDdXJyZW50ICJ2bmV0X2hkcl9zdXBwb3J0IiBjYW4ndCBkZWNpZGUg
d2hldGhlciBzZW5kIHZuZXQNCj4gPiA+ID4gPiA+PiBoZWFkZXIgbGVuZ3RoLCB3ZSBhbHdheXMg
c2VuZCBpdCBldmVuIDAuDQo+ID4gPiA+ID4gPj4gSXQgd2lsbCBhdm9pZCBzZW5kZXIvcmVjZWl2
ZXIgdHJhbnNmZXIgcHJvdG9jb2wgcGFyc2UgaXNzdWVzOg0KPiA+ID4gPiA+ID4+IFdoZW4gc2Vu
ZGVyIGRhdGEgd2l0aCB0aGUgdm5ldCBoZWFkZXIgbGVuZ3RoLCBidXQgcmVjZWl2ZXINCj4gPiA+
ID4gPiA+PiBjYW4ndCBlbmFibGUgdGhlICJ2bmV0X2hkcl9zdXBwb3J0Ii4NCj4gPiA+ID4gPiA+
PiBGaWx0ZXJzIHdpbGwgYXV0byBzZXR1cCB2bmV0X2hkcl9sZW4gYXMgbG9jYWwgbmYtPm5ldGRl
diBhbmQNCj4gPiA+ID4gPiA+PiBmb3VuZCB0aGUgaXNzdWUgd2hlbiBnZXQgZGlmZmVyZW50IHZu
ZXRfaGRyX2xlbiBmcm9tIG90aGVyDQo+IGZpbHRlcnMuDQo+ID4gPiA+ID4gPj4NCj4gPiA+ID4g
PiA+Pj4gQW5kIG15ICJmb3JjZV92bmV0X2hkciIgc2VlbXMgZHVwbGljYXRlZCB3aXRoDQo+ID4g
PiA+ID4gdm5ldF9oZHJfc3VwcG9ydD10cnVlLg0KPiA+ID4gPiA+ID4+PiBTbyBpdCBsb29rcyB0
byBtZSB3ZSBjYW4gbGVhdmUgdGhlIG1pcnJvciBjb2RlIGFzIGlzIGFuZA0KPiA+ID4gPiA+ID4+
PiBqdXN0IGNoYW5nZSB0aGUgY29tcGFyZT8gKGRlcGVuZHMgb24gdGhlIG1nbXQgdG8gc2V0IGEN
Cj4gPiA+ID4gPiA+Pj4gY29ycmVjdA0KPiA+ID4gPiA+ID4+PiB2bmV0X2hkcl9zdXBwb3J0KQ0K
PiA+ID4gPiA+ID4+IE9LLCBJIHdpbGwga2VlcCB0aGUNCj4gPiA+ID4gPiA+PiBmaWx0ZXItbWly
cm9yL2ZpbHRlci1yZWRpcmVjdG9yL2ZpbHRlci1yZXdyaXRlcg0KPiA+ID4gPiA+ID4+IHNhbWUg
YXMgdGhpcyB2ZXJzaW9uLg0KPiA+ID4gPiA+ID4+IEZvciB0aGUgY29sby1jb21wYXJlIG1vZHVs
ZSwgSXQgd2lsbCBnZXQgcHJpbWFyeSBub2RlJ3MNCj4gPiA+ID4gPiA+PiBmaWx0ZXIgZGF0YSdz
IHZuZXRfaGRyX2xlbiBhcyB0aGUgbG9jYWwgdmFsdWUsIEFuZCBjb21wYXJlDQo+ID4gPiA+ID4g
Pj4gd2l0aCBzZWNvbmRhcnkgbm9kZSdzLCBiZWNhdXNlIGl0IGlzIG5vdCBhdHRhY2hlZCBhbnkg
bmYtPm5ldGRldi4NCj4gPiA+ID4gPiA+PiBTbywgaXQgbG9va3MgY29tcGFyZSBtb2R1bGUncyAi
dm5ldF9oZHJfc3VwcG9ydCIgYmVlbiBhdXRvDQo+ID4gPiA+ID4gPj4gY29uZmlndXJhdGlvbiBm
cm9tIHRoZSBmaWx0ZXIgdHJhbnNwb3J0IHByb3RvY29sLg0KPiA+ID4gPiA+ID4+IElmIHRoZSAi
Zm9yY2Vfdm5ldF9oZHIiIG1lYW5zIGhhcmQgY29kZSBhIGNvbXBhcmUncyBsb2NhbA0KPiA+ID4g
PiA+ID4+IHZuZXRfaGRyX2xlbiByYXRoZXIgdGhhbiBjb21lIGZyb20gaW5wdXQgZmlsdGVyJ3Mg
ZGF0YT8NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4+IFRoYW5rcw0KPiA+ID4gPiA+ID4+IENo
ZW4NCj4gPiA+ID4gPiA+Pg0KPiA+ID4gPiA+ID4gSGkgSmFzb24vTWFya3VzLA0KPiA+ID4gPiA+
ID4NCj4gPiA+ID4gPiA+IFJldGhpbmsgYWJvdXQgaXQsIEhvdyBhYm91dCBrZWVwIHRoZSBvcmln
aW5hbCAidm5ldF9oZHJfc3VwcG9ydCINCj4gPiA+ID4gPiA+IGZ1bmN0aW9uLCBBbmQgYWRkIGEg
bmV3IG9wdGlvbmFsIHBhcmFtZXRlciAiYXV0b192bmV0X2hkciIgZm9yDQo+ID4gPiA+ID4gZmls
dGVycy9jb21wYXJlPw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJdCdzIGEgd2F5
IGJ1dCByZXRoaW5rIG9mIHRoZSB3aG9sZSB0aGluZy4gSSB3b25kZXIgd2hhdCBpZiB3ZQ0KPiA+
ID4gPiA+IGp1c3QgZW5hYmxlICJ2bmV0X2hkcl9zdXBwb3J0IiBieSBkZWZhdWx0IGZvciBmaWx0
ZXIgYW5kIGNvbG8tDQo+IGNvbXBhcmU/DQo+ID4gPiA+DQo+ID4gPiA+IEl0J3Mgd29ya3MgYnkg
ZGVmYXVsdCBmb3IgdXNlciB1c2UgLWRldmljZSB2aXJ0aW8tbmV0LXBjaSBhbmQgZTEwMDAuLi4N
Cj4gPiA+ID4gQnV0IGl0IGNhbid0IHJlc29sdmUgdGhpcyBzZXJpZXMgbW90aXZhdGlvbiwgaG93
IHRvIGZpeC9jaGVjayB1c2VyDQo+ID4gPiBjb25maWd1cmF0aW9uIGlzc3VlOg0KPiA+ID4gPiBG
b3IgZXhhbXBsZSB1c2VyIGVuYWJsZSAiIHZuZXRfaGRyX3N1cHBvcnQgIiBmaWx0ZXItbWlycm9y
IGFuZA0KPiA+ID4gPiBkaXNhYmxlICIgdm5ldF9oZHJfc3VwcG9ydCIgZmlsdGVyLXJlZGlyZWN0
b3IgQW5kIGNvbm5lY3QgYm90aA0KPiA+ID4gPiBmaWx0ZXIgbW9kdWxlcyBieQ0KPiA+ID4gY2hh
cmRldiBzb2NrZXQuDQo+ID4gPiA+IEluIHRoaXMgY2FzZSBndWVzdCB3aWxsIGdldCB3cm9uZyBu
ZXR3b3JrIHdvcmtsb2FkIGFuZCBmaWx0ZXJzDQo+ID4gPiA+IGRpZG7igJl0IHBlcmNlaXZlIGFu
eSBhYm5vcm1hbGl0aWVzLCBidXQgaW4gZmFjdCwgdGhlIHdob2xlIHN5c3RlbQ0KPiA+ID4gPiBp
cyBubyBsb25nZXINCj4gPiA+IHdvcmtpbmcuDQo+ID4gPiA+IFRoaXMgc2VyaWVzIHdpbGwgcmVw
b3J0IGVycm9yIGFuZCB0cnkgdG8gY29ycmVjdCBpdC4NCj4gPiA+DQo+ID4gPiBUaGUgcHJvYmxl
bSBpcyBob3cgImF1dG9fdm5ldF9oZHIiIGhlbHAgaW4gdGhpcyBjYXNlLiBJdCdzIGEgbmV3DQo+
ID4gPiBwYXJhbWV0ZXIgd2hpY2ggbWF5IGxlYWQgdG8gbW9yZSB3cm9uZyBjb25maWd1cmF0aW9u
Pw0KPiA+DQo+ID4gTm8sIHRoZSAiYXV0b192bmV0X2hkciIgd2lsbCBmaXggbW9zdCB0aGUgd3Jv
bmcgY29uZmlndXJhdGlvbiBpc3N1ZXMgYXMNCj4gInZuZXRfaGRyX3N1cHBvcnQiIGNvcnJlY3Qg
c2V0dGluZy4NCj4gPiBXaGVuIHdlIGVuYWJsZSB0aGUgImF1dG9fdm5ldF9oZHIiLCB0aGUgb3Jp
Z2luYWwgInZuZXRfaGRyX3N1cHBvcnQiDQo+IHdpbGwgbm8gZWZmZWN0Lg0KPiANCj4gU28gaXQg
bG9va3MgdG8gbWUgaXQgc3RpbGwgZGVwZW5kcyBvbiB0aGUgbWFuYWdlbWVudCB0byBzZXQgImF1
dG9fdm5ldF9oZHIiDQo+IHRvIGJlIHRydWU/IChvciBtYWtlIGl0IGVuYWJsZWQgYnkgZGVmYXVs
dCkNCg0KWWVzLCBJIHBsYW4gdG8gbWFrZSAiYXV0b192bmV0X2hkciIgZW5hYmxlZCBieSBkZWZh
dWx0IGluIG5leHQgdmVyc2lvbi4gDQoNCj4gDQo+IElmIHdlIGNhbiBkbyB0aGF0LCBpc24ndCBp
dCBtdWNoIG1vcmUgc2ltcGxlciB0byBtYWtlIHZuZXRfaGRyX3N1cHBvcnQgYnkNCj4gZGVmYXVs
dD8NCg0KWWVzLCBGb3IgY29tcGF0aWJpbGl0eSBmaWx0ZXJzIGFuZCBDT0xPIHN0aWxsIHdvcmsg
d2l0aCB0aGUgb3JpZ2luYWwgInZuZXRfaGRyX3N1cHBvcnQiLg0KRm9yIG5ldyB1c2VycywgdGhl
eSBjYW4gZW5hYmxlIHRoZSBuZXcgImF1dG9fdm5ldF9oZHIiIHRvIGF2b2lkIHNvbWUgaXNzdWVz
Lg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gSSB0aGluayBJIG1heSBtaXNzIHNvbWV0aGluZy4N
Cj4gDQo+IFRoYW5rcw0KPiANCj4gPg0KPiA+IFRoYW5rcw0KPiA+IENoZW4NCj4gPg0KPiA+ID4N
Cj4gPiA+IFRoYW5rcw0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzDQo+ID4gPiA+IENo
ZW4NCj4gPiA+ID4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IFRoYW5rcw0KPiA+ID4gPiA+DQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBUaGFua3MNCj4gPiA+ID4gPiA+IENoZW4N
Cj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4+PiBUaGFua3MNCj4gPiA+ID4g
PiA+Pj4NCj4gPiA+ID4gPiA+Pj4+IFRoYW5rcw0KPiA+ID4gPiA+ID4+Pj4gQ2hlbg0KPiA+ID4g
PiA+ID4+Pj4NCj4gPiA+ID4gPiA+Pj4+PiBUaGFua3MNCj4gPiA+ID4gPiA+Pj4+Pg0KPiA+ID4g
PiA+ID4+Pj4+DQo+ID4gPiA+DQo+ID4NCg0K

