Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5E555146B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 11:34:57 +0200 (CEST)
Received: from localhost ([::1]:33464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Do7-0001eS-SX
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 05:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Did-00071r-VN
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:29:16 -0400
Received: from mga05.intel.com ([192.55.52.43]:30846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o3Dia-0007Nd-2P
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 05:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655717352; x=1687253352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+LYhhmQzC8iqR97sQ5p/wCjzif+77lMFjqwPmCmZNbU=;
 b=WZCzjioKoEdDdCPzCb61qXMeGaYytgAJ7W2DX4Qapw/tROpgTh0Vejws
 VJydIcoOmtpCsMWT8//y7E4Q7SgwWl4wlt2CEl0Y2j/l/CwiWKeT/7jDt
 4qNONGxyT9ohJvfcINxvSzr0ZWB2bmrBJZMZChWADLTPRIrMf7nEsvXg/
 C/eC7Qvr7sJHXeaJpRsxLr4J+X3YhUoSFZLGRk0ahgstP2PSPELYIhQz9
 ISdVbdIoiWDcK6qLqOPRlMrVvEazvAYC1Txqfg7ZeaodxpPiUpQtvBCdi
 MB4Vmhayy1mtV3ELZrpIKvDYVV8+c+Nqyd9TmUWymSDeE94CQ1hQJ04OV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="366174364"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="366174364"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 02:29:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="620036733"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP; 20 Jun 2022 02:29:08 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 20 Jun 2022 02:29:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 20 Jun 2022 02:29:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 20 Jun 2022 02:29:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAArTSEZNZgNXinFOggIkdjzrvEGtcvGqPqIx8pPtx0d089cY1/n6mkoA+XEBEcY/nzHWcBPCQ1fwnx5rsUyjOgFTjvTdenQ6Vt8xXLo3gP2YuY+ZIqHm76RkBSYuJgVzM6HYCKHYLoe1NvMwg0W4R/32wMgDBSKrojPgfG2r0lFBrEYGJwExLFSwzFgWDMaKmJlNDVbxPWhee3Apa3Hj+GazrUImhaTrH6RmJ0x1nU/AVeh+z4JFxNa2UCiclbs9kYCZYwOQZglD7ORDjvF+Uo81ughDM4Es/quKBUmz/iB5JN93KD8mPLNwI6MxbQF/j18TC2xArBGlsrfoEsapQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LYhhmQzC8iqR97sQ5p/wCjzif+77lMFjqwPmCmZNbU=;
 b=l5fPsX5vupldgjty9flO3a2RCG5L61SebLVtPedyRomxy6dX6pjYDtP8sLu9NqxLl28khjkn7olcfzt0z0Fisl4bPQ5SFSHlHQITwP/tVI4t846B09D+7DRM4Z/3xL0QLe/2+WeRsJcJL2fdWX23hM41vqDXYXIEXr+dUkUtopSArmVprxQtIoQ6/0h6G3C7CPJLCKzSBvFeYcQ+ApjQ1EjoJ7zuExMFvrA5rHb2ZgT66VmPKWPPAQg+BOMHhqYrIM5ZowpVqDP2the5eaUpEsK1bX6GLLfajTX4N2nXiazjWyuVc+L3QCMVOP8Q5J29vItmM24OahBkJBib+1UlFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by DM6PR11MB2601.namprd11.prod.outlook.com (2603:10b6:5:ce::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Mon, 20 Jun
 2022 09:29:05 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::5908:5bb0:c7c0:85d%7]) with mapi id 15.20.5332.023; Mon, 20 Jun 2022
 09:29:05 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Thomas Huth <thuth@redhat.com>, =?utf-8?B?RGFuaWVsIFAuIEJlcnJhbmfDqQ==?=
 <berrange@redhat.com>
CC: Jason Wang <jasowang@redhat.com>, qemu-dev <qemu-devel@nongnu.org>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Eric
 Blake" <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, Laurent Vivier <lvivier@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, Andrew Melnychenko
 <andrew@daynix.com>
Subject: RE: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Topic: [RFC PATCH 01/12] configure: Add iovisor/ubpf project as a
 submodule for QEMU
Thread-Index: AQHYgh8EJk95aDHPrke2v71SXRLplK1TPbyAgASPuXCAACkNgIAACbmAgAABQNA=
Date: Mon, 20 Jun 2022 09:29:05 +0000
Message-ID: <MWHPR11MB0031AA06E7B46D66291F7E0A9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-2-chen.zhang@intel.com> <Yqw1wf+QjaBQ3I6M@redhat.com>
 <MWHPR11MB0031A589B82138F6E541B8BF9BB09@MWHPR11MB0031.namprd11.prod.outlook.com>
 <YrArvxwzVWQK4Hu8@redhat.com>
 <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
In-Reply-To: <151603a7-7c5f-baa2-81b5-afb8aa30ff38@redhat.com>
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
x-ms-office365-filtering-correlation-id: 4dcc85fc-d2d6-4e5e-8174-08da529f521c
x-ms-traffictypediagnostic: DM6PR11MB2601:EE_
x-microsoft-antispam-prvs: <DM6PR11MB2601C28F30DCE9AE62AEBAFB9BB09@DM6PR11MB2601.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wk1whjGbB53+y+0w8WrFyVwOBpM8E4zLeoEaNuBjxqoRtr5Y9W7yH4N1HHzpIml81uBF8VTxkbSGi39nhSXTj/DetW1xrh7AkMVH7GxfX2YTOX4qPNyaiRlrEGopzN7rVqFpXZuKSS3fUYjPyHlc2bk6xT0fOHF952zhwGVz4UBAM3rFMGxizegAFEUu25Xu37VN6xdRLbWvPZyq2VmX57yYtudJjmINp0rHidDJlICBL4/7kkDxFgn2ynhPfcTe3KktYqU16X8Ua6vpMEDEFp5nD92jZnSGgYb6KBGDn8u/ndfJ66PibMyaeQLpPyNYLDrvNrmbpxTmrT01cLJdZCKURHMA3JtVTx4l3tp38jmx8WIfcSVh8PdWgo7lBxWpC1RyZjMg/FFqBER7sEzOPMbdvi9UnAPL1uxNEPegypo8G4wuP+r85t6Rh+/wDR1O8aePKJX257Bb56dxR9Dq2fRSIHNvHyRDdOVDvgtUw1cM8rD/JIevtejsPqS/xdwdXyzSk7Xy6tIiSfdcSrl7CU7i5X1QG2B0bu8U2/l/QfYG9rtTTXLofC10+jJZhJ0AitPxvoeMCCpf5d+I4VQ7k082djdI6Ilm/f4jnZ6zSa2WenGj1IkSgSt32CMaOVfdXFCxawjHS4Bl7Efkbj4+uI3jxcqTvKsDeafEpwvVkOwjztTOasZ+n2Wrm5hdfGLG6oaKedo/of3JhlUc7F7/MA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(136003)(39860400002)(376002)(346002)(110136005)(54906003)(122000001)(2906002)(66574015)(86362001)(38100700002)(76116006)(66476007)(66446008)(64756008)(66556008)(66946007)(82960400001)(4326008)(316002)(8676002)(55016003)(52536014)(71200400001)(8936002)(5660300002)(7416002)(478600001)(33656002)(83380400001)(9686003)(41300700001)(26005)(38070700005)(7696005)(53546011)(186003)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cWhqMHIzNzZNcWZIcVFpdDVnbHdNTnhSb1lSbGdwcEhHaVAzTFpVUm9PR1Fx?=
 =?utf-8?B?cE1ESWg1c1Y1VE5kcG1MWm1pcUxUWkppa1pMbnRsZW92YUh0UGZGdmJFUFZE?=
 =?utf-8?B?YXA2MXZFRzYvZmJRWDJGeFB4M3NJc3lMelhEOXB5dmFSVlp5RklMMmpkcmVC?=
 =?utf-8?B?MDBvb3dnNjhjYVZ1Z2RBd294RVBhRjg3alZNM3EybytVOUN6eitIdWhNY3pN?=
 =?utf-8?B?WU5TbC85bzVuZFFKSmpSVHV4OFpEVWRrTGl2V2lWSGwzTE0rVktGTHY3cXc1?=
 =?utf-8?B?REloMnJsVnJybzlXVWdyMmhhenF5UWJwTXErb040ZTd2UVNWeldnbkFVQjIw?=
 =?utf-8?B?ZndyQy83WE9ENWdyZlpyRWYrOC9WcjJFNDFyQ1phWjBJU2gwMXg5T0tqTFBl?=
 =?utf-8?B?NkJJTjBSOW9JN3lvM2Q1QmpQOTl1MjdJWWYwY0g0eEdKUHp3NXZVbzBSY2l2?=
 =?utf-8?B?djJ2SFJuOEZ6aXRFNWxZc0s2aVNKL3hFTi9xeXBWOGxKb21kSFRVbkJpdGpM?=
 =?utf-8?B?M0puMGU0WDdIL1AyVHNvNEJyZXF2Zk1jVW56cDh0TlVqMlZvTEtpWWFEZkQv?=
 =?utf-8?B?TG4yR25rRWtsczFTVFBKVm0zaTF2S0UyY2RRL0R6T2I2WitEZmhycjY0Wmp3?=
 =?utf-8?B?TVp0bWhHY1AvYitNajJ5bmxtd2R1Z1JFOGFEdzU0cmZnbmRhU3pBNzlwbFJT?=
 =?utf-8?B?MWVQa0FhdDNoZytDMDV6WitBbWpiUEJyd2k2cDlSaTFZTmhuL1ZxOHhZa0g2?=
 =?utf-8?B?VVY4UDExYkVKcFZiRWdiWWl1b3lrazk3ektLT1RiQ0RUYUlkNzBHV3J5WnBV?=
 =?utf-8?B?WnMzVVBUTVA1bnlVbkt0anRmekt5aThZczlrdEJRaXVQZWpPUm5qd2N3b0tZ?=
 =?utf-8?B?VzNKanp6UlowQ2RySnYrUWpJQWZJMlExNVBOcFdxSkdIVFBqN3R3Q0ljV1B6?=
 =?utf-8?B?blVPM3JSMDI5d25IaWtiRm5DUDhxSE9ncXNKSWZacTZmVjd5a2JoU2lMWEVp?=
 =?utf-8?B?OFZubTJjcVl5Q0xvZFVpWndtS3F0VTVPYnFpd1dXZUZqNHBJbEIybDlZNG1k?=
 =?utf-8?B?NkFoa2puczNlYW44dWZRYjhYR0oyQXdNb3g2SVJDNm9GaUV3NW5tN0VhSWV5?=
 =?utf-8?B?cnJSM3dSek5vKzhudVNzMmVaemlPeXg4dk5UVW1WamxJZkhRNHMrQjRHTWhO?=
 =?utf-8?B?YlJWWlZTa3ZJYURMU2dKMjZMVGZ0N1B6ZWlmQlVPSWNxME51bGR1bHdnZkZS?=
 =?utf-8?B?a0E4Q29FdVJhUzVpdnVZMktFV0JUOFlHMkpGbmdHdFNZT1J0Z2lmcVBrZ0Zm?=
 =?utf-8?B?KyttclVnaEdGMFppR3NBdTlzbjFiZG93c1RpczQ1aURRLzFXTXpjM3Q0R0R0?=
 =?utf-8?B?RUl1TXdRZzlzai9qRDAvRzhnMkxzYWRLNlE5eGhTMyt6MU9mTVRRNWt3WGRP?=
 =?utf-8?B?ZGowcGo3dzRYVHhjNmJIR1d3eDUzVjlJRXBzdkhvVGE4T3FFWWhxWVE1K3oy?=
 =?utf-8?B?RUVzQWxmL2VucmZ4UU53eXE4L283KzlLWElya0tKNE9xMy9zMmdKaElPWC85?=
 =?utf-8?B?SllIYnlYRWx0VURCdHdFZnJTcEZFbCtxSUppZEI0Vml0akxPMmdIeGhFZDUy?=
 =?utf-8?B?ZWFHV3pKMHpERjV5VXdBWUFPQmdheFZybFJSZkVFQ1ZqNElRUjY3UlhzVE42?=
 =?utf-8?B?KzhPV1FFTHgxZmc2d00rb0V6dlNTdnBpTkRpNjJYZVk1OGVObEY1OStTZXI3?=
 =?utf-8?B?NlgvbTc0RFIvb0VjK3U0YWJUUVdFN01NR0FZcTdkaFdISUZac3N3MEMrUWpN?=
 =?utf-8?B?cmNDL2hYWExXRDROdStGSWJOcDQ4N3VWbWFCczBJQmdEVHl3cDM0aUpoV1Jk?=
 =?utf-8?B?SnBwRFB1ZGUybzFlZmhIUVNYL2lEK3RPNE5hVDJGbENidWwwZmtWZUtTRTll?=
 =?utf-8?B?dHBnV1FlTUdYd1FpZW9pWmNpYXRkYngvdFZkWWtvMjV0TmRPelZUY3pQSnk4?=
 =?utf-8?B?QzZvRWk1LzBRdEpWRlQxNHFzOFc1NjY4czhnQ0lyM0FTN1B6Q0dnWk1Pc2tL?=
 =?utf-8?B?WWtEcWdHN2pFd1Q0Y1JzYXNocUZnVjVaQTRNTFYzZE9FRDhxdk83bklSa081?=
 =?utf-8?B?OXB2SkdXaFlYUDVsN3ZWQUhleEdEd2kydDY0VGhRTkNZQ05BT1FDT1R4K0tJ?=
 =?utf-8?B?SkUvdzhzck40ejEwOE1MVGYrdjhkaDR6b3RNcXJjSi9TSXU1VFZQTWFPcWFu?=
 =?utf-8?B?ZjZESXBOc2NRK1o2anVmd0FISHU5WGdkKzdHaXBmckZ4Q0pkeUxtV3FMS2JT?=
 =?utf-8?B?VkRxcFVvMisvM2hxTHkzZFkrdnZpNCtjUk9SaUt6VTRmQVp3Zm9xZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dcc85fc-d2d6-4e5e-8174-08da529f521c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 09:29:05.7067 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gpLajldy4f7cwBMWE5kQMgiSeUFEsQQILrKLDX8yzMwRe7dkM/1fGkuGMDU6Wc20RwzxVW+ICLzbhnDhn9/y1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2601
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIEh1dGggPHRo
dXRoQHJlZGhhdC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgSnVuZSAyMCwgMjAyMiA0OjQ3IFBNDQo+
IFRvOiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5nZUByZWRoYXQuY29tPjsgWmhhbmcsIENo
ZW4NCj4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogSmFzb24gV2FuZyA8amFzb3dhbmdA
cmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiBkZXZlbEBub25nbnUub3JnPjsgUGFvbG8g
Qm9uemluaSA8cGJvbnppbmlAcmVkaGF0LmNvbT47IEVkdWFyZG8NCj4gSGFia29zdCA8ZWR1YXJk
b0BoYWJrb3N0Lm5ldD47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPjsgTWFya3VzDQo+
IEFybWJydXN0ZXIgPGFybWJydUByZWRoYXQuY29tPjsgUGV0ZXIgTWF5ZGVsbA0KPiA8cGV0ZXIu
bWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0LmNvbT47
IFl1cmkNCj4gQmVuZGl0b3ZpY2ggPHl1cmkuYmVuZGl0b3ZpY2hAZGF5bml4LmNvbT47IEFuZHJl
dyBNZWxueWNoZW5rbw0KPiA8YW5kcmV3QGRheW5peC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUkZD
IFBBVENIIDAxLzEyXSBjb25maWd1cmU6IEFkZCBpb3Zpc29yL3VicGYgcHJvamVjdCBhcyBhDQo+
IHN1Ym1vZHVsZSBmb3IgUUVNVQ0KPiANCj4gT24gMjAvMDYvMjAyMiAxMC4xMSwgRGFuaWVsIFAu
IEJlcnJhbmfDqSB3cm90ZToNCj4gPiBPbiBNb24sIEp1biAyMCwgMjAyMiBhdCAwNTo1OTowNkFN
ICswMDAwLCBaaGFuZywgQ2hlbiB3cm90ZToNCj4gPj4NCj4gPj4NCj4gPj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQo+ID4+PiBGcm9tOiBEYW5pZWwgUC4gQmVycmFuZ8OpIDxiZXJyYW5n
ZUByZWRoYXQuY29tPg0KPiA+Pj4gU2VudDogRnJpZGF5LCBKdW5lIDE3LCAyMDIyIDQ6MDUgUE0N
Cj4gPj4+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+ID4+PiBDYzog
SmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT47IHFlbXUtZGV2IDxxZW11LQ0KPiA+Pj4g
ZGV2ZWxAbm9uZ251Lm9yZz47IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+OyBF
ZHVhcmRvDQo+ID4+PiBIYWJrb3N0IDxlZHVhcmRvQGhhYmtvc3QubmV0PjsgRXJpYyBCbGFrZSA8
ZWJsYWtlQHJlZGhhdC5jb20+Ow0KPiA+Pj4gTWFya3VzIEFybWJydXN0ZXIgPGFybWJydUByZWRo
YXQuY29tPjsgUGV0ZXIgTWF5ZGVsbA0KPiA+Pj4gPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47
IFRob21hcyBIdXRoIDx0aHV0aEByZWRoYXQuY29tPjsNCj4gTGF1cmVudA0KPiA+Pj4gVml2aWVy
IDxsdml2aWVyQHJlZGhhdC5jb20+OyBZdXJpIEJlbmRpdG92aWNoDQo+ID4+PiA8eXVyaS5iZW5k
aXRvdmljaEBkYXluaXguY29tPjsgQW5kcmV3IE1lbG55Y2hlbmtvDQo+ID4+PiA8YW5kcmV3QGRh
eW5peC5jb20+DQo+ID4+PiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAwMS8xMl0gY29uZmlndXJl
OiBBZGQgaW92aXNvci91YnBmIHByb2plY3QNCj4gPj4+IGFzIGEgc3VibW9kdWxlIGZvciBRRU1V
DQo+ID4+Pg0KPiA+Pj4gT24gRnJpLCBKdW4gMTcsIDIwMjIgYXQgMDM6MzY6MTlQTSArMDgwMCwg
WmhhbmcgQ2hlbiB3cm90ZToNCj4gPj4+PiBNYWtlIGlvdmlzb3IvdWJwZiBwcm9qZWN0IGJlIGEg
Z2l0IHN1Ym1vZHVsZSBmb3IgUUVNVS4NCj4gPj4+PiBJdCB3aWxsIGF1dG8gY2xvbmUgdWJwZiBw
cm9qZWN0IHdoZW4gY29uZmlndXJlIFFFTVUuDQo+ID4+Pg0KPiA+Pj4gSSBkb24ndCB0aGluayB3
ZSBuZWVkIHRvZG8gdGhpcy4gQXMgaXQgaXMgYnJhbmQgbmV3IGZ1bmN0aW9uYWxpdHkgd2UNCj4g
Pj4+IGRvbid0IGhhdmUgYW55IGJhY2sgY29tcGF0IGlzc3Vlcy4gV2Ugc2hvdWxkIGp1c3QgZXhw
ZWN0IHRoZSBkaXN0cm9zDQo+ID4+PiB0byBzaGlwIHVicGYgaWYgdGhleSB3YW50IHRoZWlyIFFF
TVUgYnVpbGRzIHRvIHRha2UgYWR2YW50YWdlIG9mIGl0Lg0KPiA+Pj4NCj4gPj4NCj4gPj4gWWVz
LCBhZ3JlZS4gSXQncyB0aGUgYmVzdCB3YXkgdG8gdXNlIHRoZSB1QlBGIHByb2plY3QuDQo+ID4+
IEJ1dCBjdXJyZW50IHN0YXR1cyBpcyBkaXN0cm9zKHVidW50dSwgUkhFTC4uLikgZG9lcyBub3Qg
c2hpcCB0aGUNCj4gPj4gaW92aXNvci91YnBmIGxpa2UgdGhlIGlvdmlzb3IvYmNjLiBTbyBJIGhh
dmUgdG8gZG8gaXQuDQo+ID4+IE9yIGRvIHlvdSBoYXZlIGFueSBiZXR0ZXIgc3VnZ2VzdGlvbnM/
DQo+ID4NCj4gPiBJZiBkaXN0cm9zIHdhbnQgdG8gc3VwcG9ydCB0aGUgZnVuY3Rpb25hbGl0eSwg
dGhleSBjYW4gYWRkIHBhY2thZ2VzDQo+ID4gZm9yIGl0IElNSE8uDQo+IA0KPiBZZXMsIGxldCdz
IHBsZWFzZSBhdm9pZCBuZXcgc3VibW9kdWxlcy4gU3VibW9kdWxlcyBjYW4gc29tZXRpbWVzIGJl
IGENCj4gcmVhbCBQSVRBIChlLmcuIGlmIHlvdSBmb3JnZXQgdG8gdXBkYXRlIGJlZm9yZSByc3lu
YydpbmcgeW91ciBjb2RlIHRvIGENCj4gbWFjaGluZSB0aGF0IGhhcyBsaW1pdGVkIGludGVybmV0
IGFjY2VzcyksIGFuZCBpZiB1c2VycyBpbnN0YWxsIFFFTVUgZnJvbQ0KPiBzb3VyY2VzLCB0aGV5
IGNhbiBhbHNvIGluc3RhbGwgdWJwZiBmcm9tIHNvdXJjZXMsIHRvby4NCj4gQW5kIGlmIGRpc3Ry
b3Mgd2FudCB0byBzdXBwb3J0IHRoaXMgZmVhdHVyZSwgdGhleSBjYW4gcGFja2FnZSB1YnBmIG9u
IHRoZWlyDQo+IG93biwgYXMgRGFuaWVsIHNhaWQuDQoNCkhpIERhbmllbCBhbmQgVGhvbWFzLA0K
DQpJIGRvbid0IGtub3cgbXVjaCB0aGUgYmFja2dyb3VuZCBoaXN0b3J5IG9mIFFFTVUgc3VibW9k
dWxlcywgYnV0IG1lc29uIGJ1aWxkDQppcyBhIHN1Ym1vZHVsZSBmb3IgUUVNVSB0b28uIEl0IG1l
YW5zIHVzZXIgY2FuJ3QgaW5zdGFsbCBRRU1VIGZyb20gc291cmNlcw0Kd2l0aCBsaW1pdGVkIGlu
dGVybmV0IGFjY2Vzcy4gDQpBbmQgYmFjayB0byBEYW5pZWwncyBjb21tZW50cywgIFllcywgdGhl
IGJlc3Qgd2F5IGlzIGRpc3Ryb3MgYWRkIHRoZSB1YnBmIHBhY2thZ2VzLA0KQnV0IG1heWJlIGl0
J3MgdG9vIGxhdGUgdG8gaW1wbGVtZW50IG5ldyBmZWF0dXJlcyBmb3IgdXMuIFdlIGNhbiBpbnRy
b2R1Y2UgdGhlIHN1Ym1vZHVsZSBub3cgYW5kDQphdXRvIGNoYW5nZSB0byB0aGUgZGlzdHJvcydz
IGxpYiB3aGVuIGRpc3Ryb3MgYWRkIGl0LiAgRm9yIGV4YW1wbGUgUUVNVSdzIHN1Ym1vZHVsZSBT
TElSUCBkbyBpdCBpbiB0aGUgc2FtZSB3YXkuDQpJdCdzIGFscmVhZHkgYWRkZWQgYnkgbW9zdCBk
aXN0cm9zIGFuZCBzdGlsbCBhcyBhIFFFTVUgc3VibW9kdWxlLiBJdCBtYWtlIHVzZXIgZXhwZXJp
ZW5jZSB0aGUgbGF0ZXN0IHRlY2hub2xvZ3kNCndpdGggbm8gb3RoZXIgZGVwZW5kZW5jaWVzLiB1
QlBGIGluZnJhc3RydWN0dXJlIGhhdmUgdGhlIGFiaWxpdHkgdG8gZXh0ZW5kIHRoZSBjYXBhYmls
aXRpZXMgd2l0aG91dCByZXF1aXJpbmcNCmNoYW5naW5nIHNvdXJjZSBjb2RlLiBJZiB3ZSBub3Qg
YWxsb3cgaXQsIHdlIGhhdmUgdG8gcmUtaW1wbGVtZW50IGFsbCB0aGUgZUJQRiBhc3NlbWJsZXIs
IGRpc2Fzc2VtYmxlciwNCmludGVycHJldGVyLCBhbmQgSklUIGNvbXBpbGVyIGxpa2UgRFBESyB1
c2Vyc3BhY2UgZUJQRiBzdXBwb3J0IChEUERLIGNhbid0IHVzZSB1YnBmIHByb2plY3QgYnkgbGlj
ZW5zZSBpc3N1ZSkuDQoNClRoYW5rcw0KQ2hlbg0KDQoNCj4gDQo+ICAgVGhvbWFzDQoNCg==

