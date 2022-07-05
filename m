Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DF25665C8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 11:04:44 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8eU7-0004w1-7e
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 05:04:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o8eRU-00031J-MW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:02:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:32379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shirley.zhao@intel.com>)
 id 1o8eRL-0000CH-UQ
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 05:02:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657011710; x=1688547710;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LEvAumu54G5dqUCMQsOSjh9ZUPxmHyqQx9pj8p1dXqE=;
 b=n4hPX5eYUzgv3P7N5bla01sjDWGEpIzFi2dlXwYy1BTqVUw8YW23qfrJ
 wWxSsVGgZTWMeWeH3P1mjM8ujmw+55BcGuUpRmYyzHN9JFz5yeEtLQ+AC
 BGy6zFuVtwkeKVxW054FD7ILsSS+v2tLHLJfROD0c4/tW4ky6z429VGXu
 Nbx//FsWX9pfEirxbfbyYzAJo87279Ua9s9xFBzxWRRFaDriBXDnw32gI
 SXTe8TRqpVXAEXtZ1R5kLsPvQv5yY+05dm5K3Y6qnOdXgONaxiSlCx5Sd
 g7lE3d74lGstnRj2sqXtT527XEnW2pR0FbfgPYgwqlEjycKtvQX+BYM6R A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="284030028"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="284030028"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2022 02:01:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; d="scan'208";a="650024154"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga008.fm.intel.com with ESMTP; 05 Jul 2022 02:01:48 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 5 Jul 2022 02:01:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 5 Jul 2022 02:01:47 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.42) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Tue, 5 Jul 2022 02:01:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cE1F8At9jTo+QdjJDsDsSVobCHmi/DPwCO3WAlzME5MzvFtgnp7W5kGvp+s8O0xNPMcjuJb+h6tNJF/D9rAfdVMoeT2cTIFtkucKrUWCSoD31nfafCFwb97giJ56Iyv6JLcHdMoW4JeQrSlETZi4oXenMVV9jd1tg4AxC5u81teNbzpaJZ4n5LZYJpDXmVODrmWTZS3M0/sk5paiySzfodYpwP06nuODnTa3itOok3J+m5RqMtmOGA2MIB3Pr7+yZe4cuCBphBNZcvvnSjsI7rPPpnuQzT9ejJjeaK5PeS28g2PHriVXmVe+OBNR7kpjVuIvgr/p8YENA/rJ7TioHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEvAumu54G5dqUCMQsOSjh9ZUPxmHyqQx9pj8p1dXqE=;
 b=f6WOGxCohH1Ar0EokjKw5DERUBVnTXqL5gHNWaydXgLZWE/qqgUzf7Okn/WhsbrnY0xcqxyhE3Chwjn0iAbvQ7IFMAuSJkyR94rDVkkF2znWkIwyLToR0CcA6jDtZfoVeag1VRqKWN+pSOcWsduf/krdqqGyREHdy3QqWjppxWPM+oEXKdndORFh3yUrdaB4+Yt/+wHNRTAexsN07jMAO4RfVWVqgnOPBu9UIbeMUdJxrCBSISA6qCGD1npjbic4/VFOIxAPc7zKTBhLYaHDEEByRGJn50ctjvATzZvNoUkiWUlu+tN6EsSrBCOkooF0HOhJ/MizEMXKBPkoYQG/hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BY5PR11MB4291.namprd11.prod.outlook.com (2603:10b6:a03:1c2::12)
 by SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Tue, 5 Jul
 2022 09:01:46 +0000
Received: from BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192]) by BY5PR11MB4291.namprd11.prod.outlook.com
 ([fe80::1d37:60c1:cfd1:b192%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 09:01:46 +0000
From: "Zhao, Shirley" <shirley.zhao@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth
 <thuth@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "virtio-fs@redhat.com"
 <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: RE: [Qemu] how to use viriofs in qemu without NUMA
Thread-Topic: [Qemu] how to use viriofs in qemu without NUMA
Thread-Index: AdiQCpaHJJlwUwhPRyeyoMxZnaNd+wAOQjsAAACJ1oAAAdWNIA==
Date: Tue, 5 Jul 2022 09:01:45 +0000
Message-ID: <BY5PR11MB42912BFEA77F94B5B20D6F258D819@BY5PR11MB4291.namprd11.prod.outlook.com>
References: <BY5PR11MB42911D5BF55D9FAF501F64F68D819@BY5PR11MB4291.namprd11.prod.outlook.com>
 <3b6c8e16-3712-3402-3ab2-17bf53ec64a8@redhat.com> <YsPwbbiuxtkD6HSp@work-vm>
In-Reply-To: <YsPwbbiuxtkD6HSp@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.500.17
dlp-product: dlpe-windows
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab4235a9-fc99-4ada-6bff-08da5e64fcef
x-ms-traffictypediagnostic: SN6PR11MB3230:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 89RhG+pjYuSM76o+cGh/mf3/QhSgIO2XvDDUKkRxBylcEVZaICRs/NRsgTdgsf3Ze8F4z8qhEKQpOVQE8RywDA6TtgcBruNvaPX+hZIif0lqdNq1vbUcY2YTlQlXEv9r1z+kMNiweXPjPLIunc+63C9MCFkcV5NYm9gUWYa6SXBYaWmKVfqzR06dmObcFIiHxYcTBeOogaN5ftROs0h0A5VBjFsbT5WXEIkEFyMQ0S1wbGQBKJE0GiEZIVSnd7onFjaqZOCj3rVQP3xuQlZDA0Yt4bcZvznwJaQig1DN+8JRcDpUUXmEmAcUbtzKK7cUA3Z1mGI2Gn50eLWDSJfwO8sJo/DSKl7vhoox4c5RD3LMcDSRvH7Lmox3Xa1kPXYAq9BRLqAy/RLOhYbfyfyRRpUf3pjnQ8o3gpsuZ2oTytZlv09hSxlafuAdPwbFqHqrEiIQ0cZZrnSkxa1ew4hxJWxjAe/7yUQhQCMNdBpZt3Ce1krExJ0z201ks040FPCCZwfndaNaIIviR1QEkLznLYt8FIzM9QP802FEtV/sANjeQKPAyIyoeYd8GMG2IkobtykY6bNxNzuXpU7beYmw7CmmggCjEQHskVp5kFVgWZv7OpAYS6YyZDEjrhye+Wabw991K0Q48jz6kh9WtQZXL34pDdCRYHcSH6aztyF6ajBekaHruNYmALaTljmJXWq+u8fRt1zq25TBl+rEmujj5Qbk71pejwnrovRVQsVCPFpWvID+PLAkbL+gwXVKGK88NTHAhloJngeNHddrLFAIRA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4291.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(396003)(366004)(136003)(346002)(376002)(38070700005)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(53546011)(71200400001)(41300700001)(86362001)(6506007)(2906002)(7696005)(478600001)(82960400001)(52536014)(83380400001)(55016003)(33656002)(5660300002)(8936002)(122000001)(26005)(966005)(9686003)(186003)(316002)(38100700002)(54906003)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SHRWczZjNkxGYitRSWEydDZDWUFqaGw1cU0zSXppZ0l4Znh6dnF2cVRlOEtx?=
 =?utf-8?B?dU12UXJOcUdWUi9mTUt2WjFjbkZ4dmtsbjFKejZXY3dIanhwVTM3c1JaMnlz?=
 =?utf-8?B?SVV1UkJac0JzOENxU2VBc0V6SXBLZU5UN3FXUFVyUSt5QXlqU2tFYzljN0xR?=
 =?utf-8?B?bEt4Z3JkcnpnbVFkTTFtSWZlRjVHUTkyVHpVQUF0RE04UXZjclY2UVNqeUEy?=
 =?utf-8?B?SjFJdVN6S2VXTEYvMHIxRUNaWjJKcEd0UmlqQ29mMjhqV1lQVXRKUytIKzkz?=
 =?utf-8?B?cjU4T1ZHaHhnSlRPaDZmSW9OK1JiNk9NR0tnbmluendzUzFSVC82QVpYQVZv?=
 =?utf-8?B?VkhvQ2dwcEpMVUN2QXBjeWhqZEZxV091MGFGNnJnVEl6S1BTeFFtVHhFbVdx?=
 =?utf-8?B?ZEhtSGZHTE4yZWxhZ1BWYjdUejZFNzVVbExlb2xZZHdla1E1SWZVRHlzazY3?=
 =?utf-8?B?czNBcFkwWmVNZUdIWDk0RGJOOUNBNmNXRFUrY1hZZCtndHFtNTMvYUdzMHAy?=
 =?utf-8?B?dVljRWRSY3dKby8vaDNqK3RvbGROWXZ0M09GSU1QTmY2M1hLUk9oL0tsdjB6?=
 =?utf-8?B?LzZWQTArakxESzdIbkZ1QlExem42bE1qYm9hcjBKVmp5Qmw4U2tmRU8xalc4?=
 =?utf-8?B?VEE3Q2ZRTWZPb0w3bk5KQUcvbTlHT2pCTjFYOXpIVFI1dnpiV0VhWDM5alBC?=
 =?utf-8?B?RFIrR1FsSndUQnhSeGM4S1I0SVg3Z1hkSURFUEhqVndHV0JvNjcySmNVQ0JQ?=
 =?utf-8?B?YWx6NFNtem03TVVnQ1N0bExSYm5mRGtBdWVraGxFazlDNHc3Q3RXMGxiQ0Nv?=
 =?utf-8?B?RmN6c044d0Ribm9ISGRlU1B3d3gxcDNQNkR2K3lrTlhsUDZBditGVlBiZmUx?=
 =?utf-8?B?dWFaYlE3bWRIbmd0Zkc3KzNMWUdrbld4N0xVR1dGaG5lMVlsWE1OTGs5SFlR?=
 =?utf-8?B?ZUJGUDRDVHBIbC82dldid0tJTW5Yc0dJOGR4M1BvelNMV0QyNnZEL1ZkNHNn?=
 =?utf-8?B?aXVENmEyNUR6YUxPNU10OVErNzVZM3M1bG9XYzBSMzRXVkxSbmM1bitxWGdp?=
 =?utf-8?B?QTVQK0k2TkRKQWliWU5FMVhRSDh3SEcvYkREcUhEekVadUlGd2pmNnVKL1FV?=
 =?utf-8?B?cmxJZmFlMHFXUXBaRk1HRm95UzY4aldkQnlvNGhVdjFqL3d2V2IrL3dVSFY1?=
 =?utf-8?B?MEJDUlVUek5zNER0NWNaOUhTNG1EV1VoSkEwd0Q0WDR4U0QyV1M1VXlKdUQ1?=
 =?utf-8?B?aEpJTzkydjA2aVd2QnJrOEJYUFNDMXM3UnpudDZ0dWRRRHRzT3FTUnAzTHpi?=
 =?utf-8?B?MjU3Zm5ScnAwclpxTUEreVBrVnBnVDZTNUx1SWlEdXJkODBoeVU4bjBhTHBL?=
 =?utf-8?B?alpRV0d2Ty9DbW0yVUVlalFJYVZ5K2E5Wk83RXB0VmlHSnhmek5OanF1U0JU?=
 =?utf-8?B?ZWFtanQ5TlZPNFpIZGRSODJtbUE5QjJJeUd0QUhVRWFQNVYrUEw1TC9QNXlw?=
 =?utf-8?B?bTVsMDZVNHF1L1ZqdGFhQXFJSGFSR0lPc0pucnFGQlVlNDgrUGpLSFBWak9n?=
 =?utf-8?B?aEF3NWJqeU54WElTS2hBLzdKNjBPbk5ib3VhNUF4MVYvV2Yyczh5NXZXQW5t?=
 =?utf-8?B?ZEdYakh1R3Y4bndVSFhyZ2k2Z0srdVVpMmdWOW9yUUdCRjdiZ09BVWNjT01y?=
 =?utf-8?B?OVFkSHN5bVJpWHp0UnBEQzBmdTlHbzRIeU4zbWhXRWozNDkzblRzUzdNUnQ1?=
 =?utf-8?B?UEZhT3l5SkI4TmMzQWFKWVdmQmtoTlRlMld1VHR6blgvbE1PeXdwbmM2R0ho?=
 =?utf-8?B?TlhCaXMzdDV4dndINmlsTnBvdHVnZjBQVkZ1aXFYVm9RNG9VZi9tN1NzTzRR?=
 =?utf-8?B?dldVaXhDaEdoTHlTcUdkU3FyNGZjdUdSakNBUDczSkRUNXFKTXdrWkh0ZjdH?=
 =?utf-8?B?dFk4SkI1dUpORXB4QjhuVHNTRVNXVEtyUTVVU1VDMHljNnFjZGVld0FuUGZs?=
 =?utf-8?B?WG9PWkd0UVdxNDY0OFhob1M4eitjM2NIYWJLNEo4aUJMLzdyaHI5YmdyNlVM?=
 =?utf-8?B?TjA1Vm5oWmJaZXMxQVBXSnU1bDJxMmFHMW11cmxjN24wM2NaclhaQVNEd25y?=
 =?utf-8?Q?cxMwY/2vNFBFhI4qvmbX0nP8a?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4291.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4235a9-fc99-4ada-6bff-08da5e64fcef
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 09:01:45.9167 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2prHQiK5ChessjsYqgbNn3fRx8kvMiOgqbOO2a3OCsFM/+x3qx79x2VVrzEPmL2zJEhwJFJ2zvcYD2OXwUlTPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3230
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=shirley.zhao@intel.com; helo=mga09.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

VGhhbmtzIGZvciB0aGUgaW5mb3JtYXRpb24uIA0KWWVzLCBJIGFsc28gZm91bmQgdGhlIG1lbW9y
eSBiYWNrZW5kIG9wdGlvbnMgb24gczM5MHgsIGFuZCBhbHNvIGNvcHkgdGhlIGNvbW1hbmQgdG8g
eDg2LCBidXQgZmFpbGVkLiANCg0KVGhlIGZvbGxvd2luZyBpcyB0aGUgY29tbWFuZCB1c2VkIHRv
IHN0YXJ0IHFlbXUgKyB2aXJ0aW9mcyArIHVidW50dSAyMC4wNC4gDQpPbmUgaXMgd29ya2VkIHdl
bGwgdXNpbmcgTlVNQSwgYW5vdGhlciBvbmUgaXMgZmFpbGVkIHdpdGhvdXQgTlVNQS4gDQpJcyB0
aGVyZSBhbnl0aGluZyB3cm9uZz8gDQoNClRoZSB3b3JrZWQgb25lIHdpdGggTlVNQSBvcHRpb25z
OiANCg0KcWVtdS1zeXN0ZW0teDg2XzY0IC1NIHBjIC1jcHUgaG9zdCAtLWVuYWJsZS1rdm0gLXNt
cCAyIC1tIDRHIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSxpZD1tZW0sc2l6ZT00RyxtZW0t
cGF0aD0vZGV2L3NobSxzaGFyZT1vbiAtbnVtYSBub2RlLG1lbWRldj1tZW0gLWNoYXJkZXYgc29j
a2V0LGlkPWNoYXIwLHBhdGg9L3RtcC92ZnNkLnNvY2sgLWRldmljZSB2aG9zdC11c2VyLWZzLXBj
aSxxdWV1ZS1zaXplPTEwMjQsY2hhcmRldj1jaGFyMCx0YWc9bXlmcyAtY2hhcmRldiBzdGRpbyxt
dXg9b24saWQ9bW9uIC1tb24gY2hhcmRldj1tb24sbW9kZT1yZWFkbGluZSAtZGV2aWNlIHZpcnRp
by1zZXJpYWwtcGNpIC1kZXZpY2UgdmlydGNvbnNvbGUsY2hhcmRldj1tb24gLXZnYSBub25lIC1k
aXNwbGF5IG5vbmUgLWRyaXZlIGlmPXZpcnRpbyxmaWxlPXVidW50dS5pbWcNCg0KVGhlIGZhaWxl
ZCBvbmUgd2l0aG91dCBOVU1BIG9wdGlvbnM6IA0KDQpxZW11LXN5c3RlbS14ODZfNjQgLU0gcGMg
LWNwdSBob3N0IC0tZW5hYmxlLWt2bSAtc21wIDIgLW0gNEcgLW9iamVjdCBtZW1vcnktYmFja2Vu
ZC1maWxlLGlkPW1lbSxzaXplPTRHLG1lbS1wYXRoPS9kZXYvc2htLHNoYXJlPW9uIC1tYWNoaW5l
IHEzNSxtZW1vcnktYmFja2VuZD1tZW0gLWNoYXJkZXYgc29ja2V0LGlkPWNoYXIwLHBhdGg9L3Rt
cC92ZnNkLnNvY2sgLWRldmljZSB2aG9zdC11c2VyLWZzLXBjaSxxdWV1ZS1zaXplPTEwMjQsY2hh
cmRldj1jaGFyMCx0YWc9bXlmcyAtY2hhcmRldiBzdGRpbyxtdXg9b24saWQ9bW9uIC1tb24gY2hh
cmRldj1tb24sbW9kZT1yZWFkbGluZSAtZGV2aWNlIHZpcnRpby1zZXJpYWwtcGNpIC1kZXZpY2Ug
dmlydGNvbnNvbGUsY2hhcmRldj1tb24gLXZnYSBub25lIC1kaXNwbGF5IG5vbmUgLWRyaXZlIGlm
PXZpcnRpbyxmaWxlPXVidW50dS5pbWcNCg0KDQpUaGFua3MuIA0KLSBTaGlybGV5IA0KDQotLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogRHIuIERhdmlkIEFsYW4gR2lsYmVydCA8ZGdp
bGJlcnRAcmVkaGF0LmNvbT4gDQpTZW50OiBUdWVzZGF5LCBKdWx5IDUsIDIwMjIgNDowNCBQTQ0K
VG86IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPg0KQ2M6IFpoYW8sIFNoaXJsZXkgPHNo
aXJsZXkuemhhb0BpbnRlbC5jb20+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IHZpcnRpby1mc0By
ZWRoYXQuY29tOyBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhhQHJlZGhhdC5jb20+DQpTdWJqZWN0
OiBSZTogW1FlbXVdIGhvdyB0byB1c2UgdmlyaW9mcyBpbiBxZW11IHdpdGhvdXQgTlVNQQ0KDQoq
IFRob21hcyBIdXRoICh0aHV0aEByZWRoYXQuY29tKSB3cm90ZToNCj4gT24gMDUvMDcvMjAyMiAw
My4wMiwgWmhhbywgU2hpcmxleSB3cm90ZToNCj4gPiBIaSwgYWxsLA0KPiA+IA0KPiA+IEkgd2Fu
dCB0byB1c2UgdmlydGlvZnMgdG8gc2hhcmUgZm9sZGVyIGJldHdlZW4gaG9zdCBhbmQgZ3Vlc3Qu
DQo+ID4gDQo+ID4gIEZyb20gdGhlIGd1aWRlLCBpdCBtdXN0IHNldCB0aGUgTlVNQSBub2RlLg0K
PiA+IGh0dHBzOi8vdmlydGlvLWZzLmdpdGxhYi5pby9ob3d0by1xZW11Lmh0bWwNCj4gPiANCj4g
PiBCdXQgbXkgZ3Vlc3QgZG9lc27igJl0IHN1cHBvcnQgTlVNQS4NCj4gPiANCj4gPiBJcyB0aGVy
ZSBhbnkgZ3VpZGUgdG8gdXNlIHFlbXUgKyB2aXJ0aW9mcyB3aXRob3V0IE5VTUE/DQo+ID4gDQo+
ID4gT3IgZG9lcyBxZW11IGhhdmUgYW55IHBsYW4gdG8gc3VwcG9ydCBpdD8NCj4gDQo+ICBIaSEN
Cj4gDQo+IEF0IGxlYXN0IG9uIHMzOTB4LCB5b3UgY2FuIGFsc28gc3BlY2lmeSB0aGUgbWVtb3J5
IGJhY2tlbmQgdmlhIHRoZSANCj4gLW1hY2hpbmUgb3B0aW9uIGluc3RlYWQgb2YgdXNpbmcgdGhl
IC1udW1hIG9wdGlvbiwgZS5nLjoNCj4gDQo+ICBxZW11LXN5c3RlbS1zMzkweCAtbWFjaGluZSBt
ZW1vcnktYmFja2VuZD1tZW0gXA0KPiAgIC1vYmplY3QgbWVtb3J5LWJhY2tlbmQtZmlsZSxpZD1t
ZW0sLi4uDQo+IA0KPiBOb3Qgc3VyZSB3aGV0aGVyIHRoYXQgd29ya3Mgb24gb3RoZXIgYXJjaGl0
ZWN0dXJlcywgdG9vLCB0aG91Z2guIA0KPiBTdGVmYW4sIERhdmlkLCBkbyB5b3Uga25vdz8NCg0K
UmlnaHQsIHRoYXQncyB0aGUgd2F5IEkgZG8gaXQgb24geDg2Lg0KV2Ugd3JvdGUgdmlydGlvZnMg
YmVmb3JlIHRoZSBtZW1vcnktYmFja2VuZCBvcHRpb24gZXhpc3RlZCwgd2hpY2ggaXMgd2h5IHRo
ZSBvbGQgZG9jcyB0YWxrIGFib3V0IHVzaW5nIHRoZSBOVU1BIHN0dWZmLg0KDQpEYXZlDQoNCj4g
IFRob21hcw0KPiANCi0tDQpEci4gRGF2aWQgQWxhbiBHaWxiZXJ0IC8gZGdpbGJlcnRAcmVkaGF0
LmNvbSAvIE1hbmNoZXN0ZXIsIFVLDQoNCg==

