Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D335F55146C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:35:04 +0200 (CEST)
Received: from localhost ([::1]:33808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3DoF-0001tf-UI
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3DlE-0008Uu-3E
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:31:56 -0400
Received: from mga11.intel.com ([192.55.52.93]:45454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3DlA-0007ze-OK
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:31:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655717512; x=1687253512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TedHSlYOhN+9BWqYj9NHzMq8WonYcG37evMg+vdwQN0=;
 b=mofpnlEt2NeIQEO4XRc6NxMYDO+bbWyiS0gDTORYG1x1j++MUNUTv+em
 FXw0XS/N7RPtI3q91olnmxYrlsO98wkh5f+RURtXYhcy2+/VgAlM6KO+0
 GyQAearcpLoUnPCHD/c6jeR4yK3kFQ4JnxwRqEtGam9VEisW7zw2p9Yar
 tytpsDu7QOhNRiYRNlL9SyHlP1v5Zcl/bCCZ0ZtPnShi5qOkyeZf+7zkg
 mNpRyxRhtm0Xj61KR8WnbFo9rpjBBCEnx6Keo/xoJKDmfDZkphBzWISt/
 pU4g1vpF1MV/ly+D7AoT7I6nLLo2MlPx/eIb21ePpla2eh1N6lYK0jm4d g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="277398735"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="277398735"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="729298730"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jun 2022 02:31:50 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 02:31:50 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 02:31:49 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 20 Jun 2022 02:31:49 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 20 Jun 2022 02:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hq/4tYetPGws7kspIpfQ+1onHODh3TrTPgXXwFg0bZ7xkum/4EPC1nPF1gKnX/rzhdA8ZKLjnPNAzhnmsBXjejZmdsZ2n4CT1vPhHSxEANPZ1/kRKFwlIUYGVJThj24UhGuowCat1EuN1Enxgp1MUvBLvabGYmus9At/qsXnms2Qk/AIqZjh7OgUSDd789ky0EpBjupRc7tueB91zU6XwOcWeEoBj63qYPWtMiUtivBJJ9cJEjXPlbPa0wfmK0PmbUbvxTVSDCTNHfa/FJYcuqJJqgOqW7QvwzucfHqUF82jpSwwiqjhl5KgCiaITKdK+NPpWs2NtCdhwvE7Z8a93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TedHSlYOhN+9BWqYj9NHzMq8WonYcG37evMg+vdwQN0=;
 b=LqlfuqbSdlnqUQOvA2m0kvxldfR9GJCQ+OklaZOT9U03gK1HiPAUtGsB3reS8yhiYR8xlROUVpY1zxEbGLpdpXlti9jfA7odcc6Uxw8T8mdBjETj1/CbcawnDbs8Xvx9bhtuG97lhgZeD5KwbR7DIvXa4I+4HTKShbclmevUldFeygFmCeh4qrStGPVGX/AL67SebLnjd5dwYwPZPnH2aEoF27Vr7hE0okot8qU8EUad1hgbDQ3nJzN+wdFVqtoYLoICjv9Oww4nR12+RADEDCtCh7sfBmYmRQ/zthrwtlxTnlT6KpEtMYI+kt4xEph2CJtfbBpYrDFhzwAjy5Iyqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB2601.namprd11.prod.outlook.com (2603:10b6:5:ce::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 09:31:46 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 09:31:46 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>, qemu-dev
 <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?= <berrange@redhat.com>, "Eduardo
 Habkost" <eduardo@habkost.net>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>, "Andrew
 Melnychenko" <andrew@daynix.com>
Subject: RE: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
Thread-Topic: [RFC PATCH 12/12] test/qtest: Add ubpf basic test case
Thread-Index: AQHYgh8Xl8IYdhFBAUKn1M25U53Olq1TVoWAgAS1x7A=
Date: Mon, 20 Jun 2022 09:31:46 +0000
Message-ID: <MWHPR11MB00315B5F8F5DAA87129A5E3E9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-13-chen.zhang@intel.com>
 <841d2152-d843-0bff-d877-6944e486a3d3@redhat.com>
In-Reply-To: <841d2152-d843-0bff-d877-6944e486a3d3@redhat.com>
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
x-ms-office365-filtering-correlation-id: 85b8cd31-f85f-45fa-9f0f-08da529fb1af
x-ms-traffictypediagnostic: DM6PR11MB2601:EE_
x-microsoft-antispam-prvs: <DM6PR11MB2601B5CDE7293363C522BC2D9BB09@DM6PR11MB2601.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TCKpTTBQ/fqInuwxSl0z+Q+UwqXyWKvaG/1OezoMnrgdxzF05TEBrFnFdW2zOceTCY20FV+BEDLq/FdXheR8IRLmgBS2cFm4RVnE06wTxaFkQKDcqGxAiyzbzd1J973XpeVintz3XIw2mHnyyS9pSdl03wgUXRiTiCquPwEVT1PB1GDAJJaTqydbzrwEgI3BxvhC6bIHANejQZ4ThilIpSZx6wkSytBiFIiXEwdjbupHKnaIom7oDx1uh6FnlKWgi0P/1vskr4G5vZ1llY0xDWS6h8AIsPELg7EW0QsFIQGLySoB97pi0u0nxyzvC9aUqnEE9E97CXyAcjd04VbVxuv9EWRkePV96yskQoAlWiXpf+Qe7xb5PIZHqd5TPNunMz4zgVL0+G6h7rL2RuM5gJI/av1uMWqVZJfpD4+CnsIvd4JGH0wPLk2fYkYHTKuoTdeuzucPZlvFqQOH1YovaUdRXibHgk8lPg0+gxNe5+BBSI71q6BRaJLkSKubkb3FgzUay0myoc64a4H6dOljPTFCuzaonNMVhXT3rsAs4UrV6X5uEyWV9xH8r+9m8ggbJLrEK5YjESi835p1BU9xswrWwOV5sMf/dwwBQbTafWO4ngZAFWQlIQiZ5wmmIgc9/H+ze3g/UPD7ueTtopB5n0+RFbtFLlTtFLmekV6FdOnavOA2Q+PYuZNa89Ly3goW3siBky209QkcHzKbUQRp6A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(39860400002)(346002)(376002)(136003)(396003)(366004)(8936002)(5660300002)(7416002)(478600001)(33656002)(83380400001)(55016003)(71200400001)(52536014)(38070700005)(26005)(186003)(6506007)(53546011)(7696005)(41300700001)(9686003)(86362001)(2906002)(122000001)(110136005)(54906003)(82960400001)(4326008)(316002)(8676002)(38100700002)(76116006)(66946007)(66476007)(66446008)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ajRJQ2dXVUVtZDVuNlYxem8xaEVmSjh3c2t6RlBGa1NTNjVwcTBCTWFtS00z?=
 =?utf-8?B?dS91a2c4MXZSK3J2VEVpUkZFN3FsS1hTRmRRUCtiaDFOODNDUytReFc4QWR0?=
 =?utf-8?B?NWlmRVV4YzU0UG15a2lUaXY3UGxBZjVUM0xlZy91UnVtVTZLTWU3NlB2VE9N?=
 =?utf-8?B?Q05DODJDdTJOa1Arc0JXSGhQaGZWUE51akxqNlJqWkp6REhML3Q5bW1NdG1Q?=
 =?utf-8?B?SCtCbWdobWxGQTVIaUdJOS9LMTRQZ3RJaHdUQWg5d250YzNQSjRhdGl3U3Z0?=
 =?utf-8?B?WnZKTWxhdHR3YmlSeWdlRXZRQURrdG5pQU13b2Y2NDV4ajFmbTZBWi9oM2RS?=
 =?utf-8?B?YWtScHRVQTkxNlBQdFlvY2s1UlJnVTNVd2x4a3lSUkNjL1RiOXNrcStNUmVj?=
 =?utf-8?B?Slh5TG1PVUlXQWpBSktxMWhYZTdjOEZLSDhOZ3hsdU9FQjhXOVNRSWNrOGxa?=
 =?utf-8?B?WUJ6ajJLZmhPUXpYbUtyWDVCbE5aRUMzVEFVK0RHUHFaTnBuTmlHRTQ1b1Vz?=
 =?utf-8?B?anBlbmZjMEZ0cFlJLzQzbDU4Y3B1QVpRMHBDMFludVM5YmdJZENacG9ORHVF?=
 =?utf-8?B?YkFZVlpyUExGVmtURmMvdFpFNTJldVFjMUZWLzhaaDRNSWhzV0dMRlR3WlRu?=
 =?utf-8?B?NmFJb25oMStvbHp1L09Zei9MU05qRDlhK3o0bi9pcmcvY0dWUTJtZ1lCeFlN?=
 =?utf-8?B?NGp4akRYZFBpQ0ZzNlYzODk2ZEZ4U2lOeUpaOGtjbXBoV2R1QlplbjNwK25I?=
 =?utf-8?B?Y0M2OVZNd0NGaFUyZkU5aklNRTlEZFBhQWcyMFZRMko0TGk2RHMyNDVtZ0pN?=
 =?utf-8?B?Z09vSmpkb3htcExTYW5ucG40SGhJbUVJN2ZsM2tBdGRhKzRrbzFoa0RpUUJl?=
 =?utf-8?B?bDYzV09UVHNKZVF3VENUaCs1ZjZSY29udFRLOFUzUlJtZUFmY1k2NnNmS2Zx?=
 =?utf-8?B?aTlXRE9hR0tlMWYweGNOQS9Lb1JYOUcxQ1VneElSMHdSNWNmZ0lQQ0NXZXFF?=
 =?utf-8?B?ZWRYNkdnaGlmRCtoeUdRREpKYjY2N2RzdG1RdWpJUzRJek96cWEvSnh5Tm1n?=
 =?utf-8?B?NUFQZFo5eW84ckk4L0xmd0p2ZWRqQThKeHB2RXZOTmhCVGJKZWx0czAvUUZB?=
 =?utf-8?B?NzVUM3dPVmY0YmM1UVd1NFVxYlhyL2F4dVhqR3BxeHVCUkV0ZEFsVDRKRlFn?=
 =?utf-8?B?N3hhQ081amRSc3NTUXhEdHk2emJCRlprb3duK1pMeWU2RFNCd3JBWU9OR05s?=
 =?utf-8?B?NHo2dWRFSHpmS01MTnk4UThCNnd4TDE1OGpmV0YvekxyRVNOV1pRUzVnTlgr?=
 =?utf-8?B?YnU1MGpYR2pHZlkwUENOS0w3Syt1UkpBeHBmMFM5bHBtaS9XNDZxV3VTQTZO?=
 =?utf-8?B?KzQwOVRxMTJ0S1Vhcm5zQmdNM253UHc2N0JLVmNYNEdzbzRudTJPdlRpaW5R?=
 =?utf-8?B?YWsvTTFYc1VuOXRJTWtXdjdZQmFvVFVqNGJGN01MQjgyb1RPMXZ0S29iQ0hB?=
 =?utf-8?B?OCsxTVhsVmw0VG5ta0xOOGptVlAxeVNiYlNYNzE2Zm51SVdHWkVzNEZxWDE1?=
 =?utf-8?B?UVExRGdGZlpVS1dCT2NKMDVCWHJCU1F0VmhMZUtVUWNWNW5JM3NzdExFaklj?=
 =?utf-8?B?OG1FclFyTHhKSnNLTHMzWTRGMEtnNm8yTVBRVnhkNU02OFVvVXVGRUNlZ1ZO?=
 =?utf-8?B?U01IYkk2LzVjNEZxT3lZMWhUUk1CYVM2RU9MY2dndTJEcElLcUIwZHNCWTBs?=
 =?utf-8?B?S3hpTVlqQmxuOWJsbFpRekJJMXFkc041K1dOMDRqK1hhZENTOHFSbGY0UTVY?=
 =?utf-8?B?czlqNndkbGdRQ3BjbS9pc2pJUHJUZVNBOCt0RlZYV0NtOHdTYkx3Y3pDVHNv?=
 =?utf-8?B?enNJSmswSGZNeVFoaG80VW85N1VWTWszYlU5VjN2Q1RjMmRLNWRQUGtRT1dZ?=
 =?utf-8?B?VU9sZ0VuMWx5ZGJBbUtCaUhoL1ZRNnBuaTdhSFVCc1dQTkJKZ3JyVEJ6ZWlG?=
 =?utf-8?B?cDdyZy95bFAwWjRiRzJiclJucEZ6K3R4T2hjWFU0aEN6cGl3bmg5dWhkVUtq?=
 =?utf-8?B?b1FSejNubVpuTGdJbkZKQlVQbVdTOTRBVkJqZDNFTGpBK2Z6S0RUUGxVdHlJ?=
 =?utf-8?B?NjIxWXRnbzlvR1hGaTRhT3hBQThoN3FlUG9xN0Fydng1L2Zvd2FxUWU3bmor?=
 =?utf-8?B?Q29QbWtYSUZLLzc3cUl3RGUvTWFPL0ZPTTJ4RWVHaWxHZWpOODMxaWY3b3hU?=
 =?utf-8?B?TURKQ3RQRDRISEJJaTZsWVlFRW1iTTFtSFR1TXlWWFJubFZTMGVIZ2NtWGVW?=
 =?utf-8?B?S013OUJ2eHgvdFMwVm8vanlQR1NucUVwbmFmbjRSdEtCd0JFd0wxZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b8cd31-f85f-45fa-9f0f-08da529fb1af
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 09:31:46.0388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zr2xFXKQUhT12R215aAc3NEOhlOF9ZL/jIzEAYLgio3nqKyyxvNWzDtZO5/5AxMO23V19wdptJ0TYpc8yY5eIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2601
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=chen.zhang@intel.com;
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgSnVuZSAxNywgMjAyMiA1OjM0IFBNDQo+
IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+OyBKYXNvbiBXYW5nDQo+IDxq
YXNvd2FuZ0ByZWRoYXQuY29tPjsgcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IFBh
b2xvDQo+IEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBEYW5pZWwgUC4gQmVycmFuZ8Op
DQo+IDxiZXJyYW5nZUByZWRoYXQuY29tPjsgRWR1YXJkbyBIYWJrb3N0IDxlZHVhcmRvQGhhYmtv
c3QubmV0PjsgRXJpYw0KPiBCbGFrZSA8ZWJsYWtlQHJlZGhhdC5jb20+OyBNYXJrdXMgQXJtYnJ1
c3RlciA8YXJtYnJ1QHJlZGhhdC5jb20+DQo+IENjOiBQZXRlciBNYXlkZWxsIDxwZXRlci5tYXlk
ZWxsQGxpbmFyby5vcmc+OyBMYXVyZW50IFZpdmllcg0KPiA8bHZpdmllckByZWRoYXQuY29tPjsg
WXVyaSBCZW5kaXRvdmljaCA8eXVyaS5iZW5kaXRvdmljaEBkYXluaXguY29tPjsNCj4gQW5kcmV3
IE1lbG55Y2hlbmtvIDxhbmRyZXdAZGF5bml4LmNvbT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFU
Q0ggMTIvMTJdIHRlc3QvcXRlc3Q6IEFkZCB1YnBmIGJhc2ljIHRlc3QgY2FzZQ0KPiANCj4gT24g
MTcvMDYvMjAyMiAwOS4zNiwgWmhhbmcgQ2hlbiB3cm90ZToNCj4gPiBUT0RPOiBUaGlzIHRlc3Qg
Y2FzZSBkb2VzIG5vdCB3b3JrLiBOZWVkIGFkZCB1YnBmLmggaGVhZGVyIGluIHF0ZXN0DQo+ID4g
Y29tcGlsZSAiLUkgLi4vdWJwZi92bSAtSSAuLi91YnBmL3ZtL2luYyIuDQo+ID4gSSdtIG5vdCBz
dXJlIGlmIHdlIG5lZWQgaXQgaW4gcXRlc3QuIEJlY2F1c2Ugbm9ybWFsIHRlc3RzL3F0ZXN0IG5v
dA0KPiA+IGluY2x1ZGluZyBleHRlcm5hbCBtb2R1bGUgdGVzdCBjYXNlIGxpa2UgZmR0LiBPciB3
ZSBqdXN0IG5lZWQgYSBxdGVzdA0KPiA+IGNhc2UgZm9yIGZpbHRlci11YnBmIG1vZHVsZS4NCj4g
PiBUaGlzIHRlc3Qgd2lsbCBsb2FkIHByZS1jb21waWxlZCBlYnBmIGJpbmFyeSBhbmQgcnVuIGl0
IGluIFFFTVUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5n
QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gWy4uLl0NCj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcXRl
c3QvdWJwZi10ZXN0LmMgYi90ZXN0cy9xdGVzdC91YnBmLXRlc3QuYyBuZXcNCj4gPiBmaWxlIG1v
ZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAuLjZlNzBhOTkzMjANCj4gPiAtLS0gL2Rldi9udWxs
DQo+ID4gKysrIGIvdGVzdHMvcXRlc3QvdWJwZi10ZXN0LmMNCj4gPiBAQCAtMCwwICsxLDY0IEBA
DQo+ID4gKy8qDQo+ID4gKyAqIFFFTVUgVXNlcnNwYWNlIGVCUEYgdGVzdCBjYXNlDQo+ID4gKyAq
DQo+ID4gKyAqIENvcHlyaWdodChDKSAyMDIyIEludGVsIENvcnBvcmF0aW9uLg0KPiA+ICsgKg0K
PiA+ICsgKiBBdXRob3I6DQo+ID4gKyAqICBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNv
bT4NCj4gPiArICoNCj4gPiArICogVGhpcyB3b3JrIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSB0ZXJt
cyBvZiB0aGUgR05VIEdQTCwgdmVyc2lvbiAyIG9yIGxhdGVyLg0KPiA+ICsgKiBTZWUgdGhlIENP
UFlJTkcgZmlsZSBpbiB0aGUgdG9wLWxldmVsIGRpcmVjdG9yeS4NCj4gPiArICoNCj4gPiArICov
DQo+ID4gKw0KPiA+ICsjaW5jbHVkZSAicWVtdS9vc2RlcC5oIg0KPiA+ICsjaW5jbHVkZSAibGli
cXRlc3QuaCINCj4gPiArI2luY2x1ZGUgImVicGYvdWJwZi5oIg0KPiA+ICsNCj4gPiArLyoNCj4g
PiArICogRGVtbyB1c2Vyc3BhY2UgZWJwZiBwcm9ncmFtDQo+ID4gKyAqIFRoZSB0ZXN0IGJpbmFy
eSB1c2UgY2xhbmcgdG8gYnVpbGQgdGhpcyBzb3VyY2UgY29kZToNCj4gPiArICogZGVtb191YnBm
LmMNCj4gPiArICoNCj4gPiArICogI2luY2x1ZGUgPHN0ZGludC5oPg0KPiA+ICsgKg0KPiA+ICsg
KiBzdGF0aWMgdWludDMyX3QgZG91YmxlX2l0KHVpbnQzMl90IGEpDQo+ID4gKyAqIHsNCj4gPiAr
ICogICAgICByZXR1cm4gKGEgKiAyKTsNCj4gPiArICogfQ0KPiA+ICsgKg0KPiA+ICsgKiB1aW50
MzJfdCBicGZfcHJvZyhpbnQzMl90ICphcmcpIHsNCj4gPiArICogICAgICAgdWludDMyX3QgcmVz
dWx0ID0gMDsNCj4gPiArICogICAgICAgcmVzdWx0ID0gZG91YmxlX2l0KCphcmcpOw0KPiA+ICsg
Kg0KPiA+ICsgKiAgICAgICByZXR1cm4gcmVzdWx0Ow0KPiA+ICsgKiB9DQo+ID4gKyAqDQo+ID4g
KyAqIEJ1aWxkIHRoZSB1c2Vyc3BhY2UgZWJwZiBwcm9ncmFtIGJpbmFyeSBmaWxlOg0KPiA+ICsg
KiBjbGFuZyAtTzIgLXRhcmdldCBicGYgLWMgZGVtb191YnBmLmMgLW8gZGVtb191YnBmLm8NCj4g
PiArICoNCj4gPiArICogVGhlIGV4dGVybmFsIHRlcmdldCBzb3VyY2U6DQo+ID4gKyAqIHByaW50
ZiAiJWIiICdceDA1XHgwMFx4MDBceDAwJyA+IGludGVnZXJfNS5tZW0NCj4gPiArICoNCj4gPiAr
ICovDQo+ID4gKw0KPiA+ICtpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ2MpDQo+ID4gK3sN
Cj4gPiArICAgIFVicGZTdGF0ZSB1X2VicGY7DQo+ID4gKyAgICBjaGFyIHByb2dyYW1fcGF0aFtd
ID0gImRlbW9fdWJwZi5vIjsNCj4gPiArICAgIC8qIHVCUEYgY2FuIHJlYWQgdGFyZ2V0IGZyb20g
aW50ZXJuYWwgc291cmNlIG9yIGV4dGVybmFsIHNvdXJjZSovDQo+ID4gKyAgICBjaGFyIHRhcmdl
dF9wYXRoW10gPSAiaW50ZWdlcl81Lm1lbSI7DQo+ID4gKw0KPiA+ICsgICAgcWVtdV91YnBmX2lu
aXRfaml0KCZ1X2VicGYsIHRydWUpOw0KPiA+ICsNCj4gPiArICAgIGdfYXNzZXJ0X2NtcHVpbnQo
cWVtdV91YnBmX3ByZXBhcmUoJnVfZWJwZiwgcHJvZ3JhbV9wYXRoKSwgPT0sDQo+ID4gKyAwKTsN
Cj4gPiArDQo+ID4gKyAgICBnX2Fzc2VydF90cnVlKHFlbXVfdWJwZl9yZWFkX3RhcmdldCgmdV9l
YnBmLCB0YXJnZXRfcGF0aCkpOw0KPiA+ICsNCj4gPiArICAgIGdfYXNzZXJ0X2NtcHVpbnQocWVt
dV9ydW5fdWJwZl9vbmNlKCZ1X2VicGYsIHVfZWJwZi50YXJnZXQsDQo+ID4gKwkJICAgICB1X2Vi
cGYudGFyZ2V0X2xlbiksID09LCAxMCk7DQo+ID4gKw0KPiA+ICsgICAgdWJwZl9kZXN0cm95KHVf
ZWJwZi52bSk7DQo+ID4gKw0KPiA+ICsgICAgcmV0dXJuIDA7DQo+ID4gK30NCj4gDQo+IEFwYXJ0
IGZyb20gdGhlICNpbmNsdWRlICJsaWJxdGVzdC5oIiB0aGVyZSBpcyBub3RoaW5nIHJlbGF0ZWQg
dG8gcXRlc3QgaW4NCj4gaGVyZSAuLi4gc2hvdWxkIHRoaXMgbWF5YmUgcmF0aGVyIGdvIGludG8g
dGVzdC91bml0LyBpbnN0ZWFkPw0KDQpSZXRoaW5rIGFib3V0IGl0LCBJIHRoaW5rIHlvdSBhcmUg
cmlnaHQuDQpUaGUgb25seSBpc3N1ZSBpcyBjYW4gd2UgaW52b2x2ZSBzdWJtb2R1bGUncyBoZWFk
ZXIgZmlsZSBpbiB0ZXN0cy91bml0Pw0KSSBjYW4ndCBmaW5kIG1lc29uL2ZkdC9TTElSUCB0ZXN0
IGNhc2VzIGluIHRoZSB0ZXN0cy4NCg0KVGhhbmtzDQpDaGVuDQoNCj4gDQo+ICAgVGhvbWFzDQoN
Cg==

