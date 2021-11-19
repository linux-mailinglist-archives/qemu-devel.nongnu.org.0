Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0D14569C3
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 06:36:15 +0100 (CET)
Received: from localhost ([::1]:55128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnwZJ-00084x-Mk
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 00:36:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnwY2-0007GO-Oz
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 00:34:54 -0500
Received: from mga02.intel.com ([134.134.136.20]:26576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1mnwXz-0003Br-9L
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 00:34:54 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221576492"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="221576492"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 21:34:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="455640308"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga006.jf.intel.com with ESMTP; 18 Nov 2021 21:34:46 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 18 Nov 2021 21:34:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Thu, 18 Nov 2021 21:34:46 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Thu, 18 Nov 2021 21:34:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfgK3mu+KOPsE7HojgyWdFilQtyOlkTZZtfRU/0aXTb4UjOTgrI0yFFoPuLNFq7hR6XF935Awrpf3hyzQHQvSmiUoZaIYtzHo8JBtEJEygT3pgFAP1Sm+8CWkk7FHFHkUMgIRaAvJ8ZcZ4DNjc1EZoal7fU3vSzvOci0dT4e+yssFNKMxZnn8dkst2szRsxd2+mYxTAW6FeXrPNOEUZKThxwKQYkNduo6gjmGWRNDVUV8eZ+TYzYkBK11SEMI3HLfz/5N4DGchg9rJEgS5lU301+lb6jVxg92gBuPRWecyjsVPLWw+8Z/N0qoCVkP2vOUHOEksspqWQyh+AxFXdrmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wqotty4FTE+6yDD7cWEvuqbDSrTO4+MhB5GN3H4KByI=;
 b=A4nvm+dffV6pbLgVXG8PMEfyNeCYJdldULW+ef25pqWaV7gxOzoKwCGcz8FHCDyCykpBBHDkRScxD8c60OZf3BYkiHjBEBN3DBjjly3J5ZwBFJTjmoyfwvlmon1KvGkvEdrM9iwsQCXnaS+6+cUf+/JGVTgV0SdcaImYZu/J3p4iAk9vrOUpNUFF+4qDHDKsEPWslBCFxUnrAr0JPEnc0+x18la062vwar2L7ItUUrJs1T3AmCTGTV4ESMnka93yICcPjklCZURuPsM2+jxBt5zuyVhDIVNP/DpUB6NLxLKTFbF6n4mJofzAgOKSQYBoJ6cLM6FDc4HJsPiNlIS5cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wqotty4FTE+6yDD7cWEvuqbDSrTO4+MhB5GN3H4KByI=;
 b=FPtzl62w1utNYqJRCSUGh2aQSbEzLq3UXAdHdrdH9zu/7kw647ozKY429CbTXU3sxMkhx1ZxOdiuZVy/qPkv+Lkl48PN2UzriI1xqrGs62Tli1343oWcrJcZ6UntQo24s5yu8uj3UJZaMMkXEnZoudTec1N0LzqcabN9io0EhBo=
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by MW3PR11MB4588.namprd11.prod.outlook.com (2603:10b6:303:54::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Fri, 19 Nov
 2021 05:34:45 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::3827:2f36:f344:e814%3]) with mapi id 15.20.4690.027; Fri, 19 Nov 2021
 05:34:44 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
Subject: RE: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Topic: [PATCH] net/filter: Enable the vnet_hdr_support by default
Thread-Index: AQHX1d14LCgu6/0Qh0SCPdXTBPAUvawKPEiAgAAFVQCAAB99EA==
Date: Fri, 19 Nov 2021 05:34:44 +0000
Message-ID: <MWHPR11MB00312104F7D88E29F3117C079B9C9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20211110023915.3797141-1-chen.zhang@intel.com>
 <435c4c3f-9dfc-4a01-e398-72d9fe778a2d@redhat.com>
 <CACGkMEtTC3wWAXxWwfaT-Acuw8wgjSwDobkgzD=QngvST0211g@mail.gmail.com>
In-Reply-To: <CACGkMEtTC3wWAXxWwfaT-Acuw8wgjSwDobkgzD=QngvST0211g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.6.200.16
dlp-reaction: no-action
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81170599-8954-4c68-f84f-08d9ab1e4b46
x-ms-traffictypediagnostic: MW3PR11MB4588:
x-microsoft-antispam-prvs: <MW3PR11MB4588376C3BC12FCDF158B5429B9C9@MW3PR11MB4588.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:612;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pLSQzM+YdNQMH3lGMkPPJzlHl04MGJOiuL3YHJwI2PFAnXc50Cg7ybQbXIUEMt1CF2JZ9GE6k9+MNo3ItVFXtbtbSh89CXhG2z2tXc3WlT/BdUUSLUOQO6k8Qj7/fpUS9/eGnYildkvX30sFBjV5G8vvdSOlRZAYQJDyPBGMNLSuBZ6fllkCnA+091zTwdbK9yW/Hgrp9KFMq8uZYOqxwKTutCo9xx0CR0XDdYrxdpE7xarY1NRNmzXK6Fa/y1oEpdgU43Hu4gGqUaucrKhCFWZFRMZcsiYexCOy+fYxeg5hwGuSTbKRk1JUMSSNPR2ycAXE3OnnT7+zc1z9FS8EiatHT5y9UsVyb3lVFmiQgYaGVWjqnwpy2QCQ5XyexFwkzWMzMUxXnNJ5c8Q+y1cOU1uPIEmIuc6T/YCLvsdV+failgOqkenkPQxhzrGzJ2ELtgjV15hnpTTn1Ydfuu+N/9dyUY1IaTkTb0mtgDlBhHcWKWMCVAEruVQwIEFIlzBhsocxV0tqUVpr2x7ajTsIcAMuNP4vgyMqERMUhLNOJPhdFCqatj/16mkwdSR/VDcUKeBHuNZpIVYxhHD23KxByo4tljtlcOWg2cf1tRvoZrP71B3uHyH2uoxCThbaI+RvzN8MZnKZm0pmUOJcGVyeRnXrLpZ1BScDG15XVhh/c8WoKB2Y4j3F/hF4Ap5zNkVXAf88UUQClXY5sZGC5FVXOg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(6506007)(66556008)(4326008)(66476007)(66446008)(2906002)(64756008)(122000001)(316002)(5660300002)(54906003)(53546011)(508600001)(71200400001)(8936002)(8676002)(6916009)(38100700002)(76116006)(38070700005)(26005)(186003)(66946007)(83380400001)(55016002)(82960400001)(7696005)(52536014)(9686003)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eCtTNk9peXEvTUxrZk9lQi8vMlNwbGVRSnFPd1RHNVFHU1JUelZTc21sZ2Vh?=
 =?utf-8?B?dHpoSlczemZ0MVc3TUtGTXYwUjIycWNHZnVmYWFjVTRZeUd5UnY3SkZZTDQr?=
 =?utf-8?B?Q01BUW9qaXhScVBYOWFrZm03VWw2bDdVNEhydVowMUVITSt5TEZEWjVqbFF6?=
 =?utf-8?B?NDlUMDNmbWljQ1B5NVJJL0k1VXgwcEt0MXg4Znlqalg4SGNSTWVRM0cxVEZv?=
 =?utf-8?B?QkpoQjdia28vMnY1NFU5cjRnV0RzMHBDZzhHSVJNaGhURVBBSGFtYnJYc1p3?=
 =?utf-8?B?UWU4T2NiU0VjeGtMTHIxVkJCa28zTTlaY29rRE1rcVlHT0ZGYlZzYW0xemVZ?=
 =?utf-8?B?bUdEZmdHTThMd1JsSEE3bm8yY3ErUUNlZVhoODJqcWRHczBnVjJsNGx5dkJm?=
 =?utf-8?B?c295d243QnU2c2puR1NwNDFGTDBaZjkwVGR1MWMwYTVjbm5WV1A4QXA5NW4x?=
 =?utf-8?B?RnBxcS9hUDVveHJjbHk3YVlaaFZ1Y3d1c2VJaVF2dmdLWHNBaCs4dGRURlBv?=
 =?utf-8?B?K0wrWWpVZWlybkZ4MkdBeEE0KzI0ZHVaZHpycUlibHA1ZUJHaXRqODBTM2p6?=
 =?utf-8?B?eElGRXNQdU5xRWZFOWkyMVU3ekYrRmxoNk1QaDVPYitNamxsNDRIZ0dmTW9n?=
 =?utf-8?B?QTNGakZ4ajNlZ1pReGtEa2x6MkxTKy9IRkszcHVCdzVwbVBmK1VtRmtBbnJU?=
 =?utf-8?B?UktqeUlHbStueER4Q21qMnVERjZHMU44SmJLcG8wTk1mTGtzWTRVc0hWMzBZ?=
 =?utf-8?B?TnlTbU9aN1o5eTBPanQwZ3JiMUhhVmVTaFl3dmEzbUpuQmFwU3ZUaDNYRE5v?=
 =?utf-8?B?MlFEYXJQNElBT0gyU2lsU3puek4zNy9jODBzRFZsenVGUjloZDNuZ3phOWhx?=
 =?utf-8?B?Ny9NNTZ1YlhBdGpvNk0ranlGbW9nYjN5WlU0TUdpa3R4L0dUb0pDcVdleFo3?=
 =?utf-8?B?Yjl2YUpKamplNFRMWlkvVUorTmFxV3Y2YU9WYUNIL3pOSUpOOFdCMHZ0dC9F?=
 =?utf-8?B?VkJGczIxNDBaenZ5emdKT1hBdFNiTjhBV1N3NEkwTkoxNmRna2pndlZldmJE?=
 =?utf-8?B?SVdiR3hJU21lMDFUaGRpTFRnQy9kejJrL2pNcVkzcFlRTDZ6VTVDZi9MYlZo?=
 =?utf-8?B?VTlsMUo1ZXBZeVJhTDhHcC9xODVtK0hwcFJNQlNCSDA2ZElsVXdFWk9XT3dB?=
 =?utf-8?B?bFZFeVFtdlZtS2FVdUkva2YxS3VDNlgvb1lUa1J1a0VZRmR2dnRDNW1nTklr?=
 =?utf-8?B?VmRyeWNPaE9tYlJNMlREUTBDNWxrYm00MnJ2UFdSSENsaUordDNUekNRdDZa?=
 =?utf-8?B?N0JTMVdwbVVyM3ZCTXByVkdNZlNCZkQvb1RnOW1GWG1LZHpIZVkyQmdtc2ox?=
 =?utf-8?B?Y3J5bjNSaGJ0cEt1YlZILzdqVmxKa1FCZVNUM0YyRGMrbDB1VHcvbUF1ZlY0?=
 =?utf-8?B?RjdKSmhhQnNVVVNVYzhDMEZvc0Ezd1NxWjJTMFp3cThySzhrQThRbmxyc2JN?=
 =?utf-8?B?K3RPdWdqTDNKeWV1cHVCVWszK3pqU3FNNVJqSU9abDl1YzdYYi92UDdmeVk3?=
 =?utf-8?B?YzgwdHc2R2w1N2ZTVEo3NzNnY3FHNEFFQjRMZXZMTndtMVh6VWVvUE80cEVM?=
 =?utf-8?B?YnhVRGxvTjVxQk9DclVHeG16NkZqTm9zZURvMDZKMVA5SkNDUHQzOHhTM1VZ?=
 =?utf-8?B?U3U0TmZNWE5GTHl2cTJDb1hvbWRxNDlvQzlYVGpOZjFiTVlzUTl3cWVKY1p6?=
 =?utf-8?B?a1NYN3gzWEhQVlpEck9TOElEdGIyZUhHVU1Ic3d1a2Fxek9iOHFsN0MzS1Fp?=
 =?utf-8?B?WER3cDdOVXlRL2FQelkzNXQwWXAzSDVRVGxWemVTUENxTkdXNXJBRVpQU2hq?=
 =?utf-8?B?TitvSlVqL3grQXkra2VnbmxNbFpnTm9tbC9zYWhja2FoSnhTK1k0WUoxYmJh?=
 =?utf-8?B?aDBaay92ampFM3dMeDhaRjE5QmtaUEhkQm1aSnRNQUVaSVpXdGtlOXFiZitF?=
 =?utf-8?B?NTc1emVFUWY3cy82Z2JGQXp6SHJtaTZiblRQejg0Z0hFREdjc2IwdUNudGpq?=
 =?utf-8?B?ZzhRTHhaMWE5VFR0dWxvUVVvbjcrei9GTkc2Szk5RmlJeFVNaUZxd3pjb2s2?=
 =?utf-8?B?NHVoVzhmM2ZUSk1QNmVnSXk1amVZQTlEaUJ6Ly9jbjVma2dZNXBSdmdrWEpC?=
 =?utf-8?Q?cvllKxJm92svpt1sadc9Uf4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81170599-8954-4c68-f84f-08d9ab1e4b46
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2021 05:34:44.8637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k5H9G4xshNLfwhGPcewxs7Q92IdC8p6mfIIchPIczyyT3lHjGjLyxzfbF0sERVBRKtDnqXZyhfsk3K/0Hf5JWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4588
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=chen.zhang@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogRnJpZGF5LCBOb3ZlbWJlciAxOSwgMjAyMSAxMToz
NyBBTQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogcWVt
dS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz47IE1hcmt1cyBBcm1icnVzdGVyDQo+IDxhcm1i
cnVAcmVkaGF0LmNvbT47IExpIFpoaWppYW4gPGxpemhpamlhbkBjbi5mdWppdHN1LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSF0gbmV0L2ZpbHRlcjogRW5hYmxlIHRoZSB2bmV0X2hkcl9zdXBw
b3J0IGJ5IGRlZmF1bHQNCj4gDQo+IE9uIEZyaSwgTm92IDE5LCAyMDIxIGF0IDExOjE3IEFNIEph
c29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4NCj4gPiDl
nKggMjAyMS8xMS8xMCDkuIrljYgxMDozOSwgWmhhbmcgQ2hlbiDlhpnpgZM6DQo+ID4gPiBUaGlz
IHBhdGNoIG1ha2UgZmlsdGVycyBhbmQgY29sby1jb21wYXJlIG1vZHVsZSBzdXBwb3J0IHZuZXRf
aGRyIGJ5DQo+ID4gPiBkZWZhdWx0LiBBbmQgYWxzbyBzdXBwb3J0IC1kZXZpY2Ugbm9uLXZpcnRp
by1uZXQobGlrZSBlMTAwMC4pLg0KPiA+ID4gQnV0IGl0IGNhbid0IGF2b2lkIHVzZXIgbWFudWFs
IGNvbmZpZ3VyYXRpb24gZXJyb3IgYmV0d2VlbiBkaWZmZXJlbnQNCj4gPiA+IGZpbHRlcnMgd2hl
biBlbmFibGUvZGlzYWJsZSB2aXJ0aW8tbmV0LXBjaS4NCj4gPiA+DQo+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+DQo+
ID4NCj4gPiBBcHBsaWVkLg0KPiA+DQo+ID4gVGhhbmtzDQo+IA0KPiBBY3R1YWxseSBub3QsIGl0
IGJyZWFrcyBmaWx0ZXItbWlycm9yIHRlc3Q6DQo+IA0KPiANCj4gRVJST1I6Li4vdGVzdHMvcXRl
c3QvdGVzdC1maWx0ZXItbWlycm9yLmM6NzQ6dGVzdF9taXJyb3I6IGFzc2VydGlvbiBmYWlsZWQN
Cj4gKHJlY3ZfYnVmID09IHNlbmRfYnVmKTogKCIiID09ICJIZWxsbyEgZmlsdGVyLW1pcnJvcn4i
KSBFUlJPUiBxdGVzdC0NCj4geDg2XzY0L3Rlc3QtZmlsdGVyLW1pcnJvciAtIEJhaWwgb3V0IQ0K
PiBFUlJPUjouLi90ZXN0cy9xdGVzdC90ZXN0LWZpbHRlci1taXJyb3IuYzo3NDp0ZXN0X21pcnJv
cjogYXNzZXJ0aW9uIGZhaWxlZA0KPiAocmVjdl9idWYgPT0gc2VuZF9idWYpOiAoIiIgPT0gIkhl
bGxvISBmaWx0ZXItbWlycm9yfiIpDQo+IF5DbWFrZVsxXTogKioqIFtNYWtlZmlsZS5tdGVzdDo3
ODQ6IHJ1bi10ZXN0LTk2XSBJbnRlcnJ1cHQNCg0KT2gsIFRoaXMgdGVzdCB1c2VkIGRlZmF1bHQg
d2F5IHRvIHNlbmQgZmlsdGVyIGRhdGEgd2l0aG91dCB2bmV0X2hkcl9sZW4uDQpCdXQgd2UgY2hh
bmdlZCBkZWZhdWx0IGZpbHRlciB0cmFuc2ZlciBwcm90b2NvbC4gSSB3aWxsIGZpeCBpdCBpbiBh
bm90aGVyIHBhdGNoLg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiA+DQo+
ID4NCj4gPiA+ICAgbmV0L2NvbG8tY29tcGFyZS5jICAgIHwgMiArLQ0KPiA+ID4gICBuZXQvZmls
dGVyLW1pcnJvci5jICAgfCA0ICsrLS0NCj4gPiA+ICAgbmV0L2ZpbHRlci1yZXdyaXRlci5jIHwg
MiArLQ0KPiA+ID4gICBxZW11LW9wdGlvbnMuaHggICAgICAgfCA5ICsrKysrLS0tLQ0KPiA+ID4g
ICA0IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gPiA+
DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbmV0L2NvbG8tY29tcGFyZS5jIGIvbmV0L2NvbG8tY29tcGFy
ZS5jIGluZGV4DQo+ID4gPiBiODg3NmQ3ZmQ5Li44MmQ0ZDgxNzEwIDEwMDY0NA0KPiA+ID4gLS0t
IGEvbmV0L2NvbG8tY29tcGFyZS5jDQo+ID4gPiArKysgYi9uZXQvY29sby1jb21wYXJlLmMNCj4g
PiA+IEBAIC0xMzk3LDcgKzEzOTcsNyBAQCBzdGF0aWMgdm9pZCBjb2xvX2NvbXBhcmVfaW5pdChP
YmplY3QgKm9iaikNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X21heF9xdWV1
ZV9zaXplLA0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICBzZXRfbWF4X3F1ZXVlX3Np
emUsIE5VTEwsIE5VTEwpOw0KPiA+ID4NCj4gPiA+IC0gICAgcy0+dm5ldF9oZHIgPSBmYWxzZTsN
Cj4gPiA+ICsgICAgcy0+dm5ldF9oZHIgPSB0cnVlOw0KPiA+ID4gICAgICAgb2JqZWN0X3Byb3Bl
cnR5X2FkZF9ib29sKG9iaiwgInZuZXRfaGRyX3N1cHBvcnQiLA0KPiBjb21wYXJlX2dldF92bmV0
X2hkciwNCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXJlX3NldF92
bmV0X2hkcik7DQo+ID4gPiAgIH0NCj4gPiA+IGRpZmYgLS1naXQgYS9uZXQvZmlsdGVyLW1pcnJv
ci5jIGIvbmV0L2ZpbHRlci1taXJyb3IuYyBpbmRleA0KPiA+ID4gZjIwMjQwY2M5Zi4uYWRiMGM2
ZDg5YSAxMDA2NDQNCj4gPiA+IC0tLSBhL25ldC9maWx0ZXItbWlycm9yLmMNCj4gPiA+ICsrKyBi
L25ldC9maWx0ZXItbWlycm9yLmMNCj4gPiA+IEBAIC00MDYsMTQgKzQwNiwxNCBAQCBzdGF0aWMg
dm9pZCBmaWx0ZXJfbWlycm9yX2luaXQoT2JqZWN0ICpvYmopDQo+ID4gPiAgIHsNCj4gPiA+ICAg
ICAgIE1pcnJvclN0YXRlICpzID0gRklMVEVSX01JUlJPUihvYmopOw0KPiA+ID4NCj4gPiA+IC0g
ICAgcy0+dm5ldF9oZHIgPSBmYWxzZTsNCj4gPiA+ICsgICAgcy0+dm5ldF9oZHIgPSB0cnVlOw0K
PiA+ID4gICB9DQo+ID4gPg0KPiA+ID4gICBzdGF0aWMgdm9pZCBmaWx0ZXJfcmVkaXJlY3Rvcl9p
bml0KE9iamVjdCAqb2JqKQ0KPiA+ID4gICB7DQo+ID4gPiAgICAgICBNaXJyb3JTdGF0ZSAqcyA9
IEZJTFRFUl9SRURJUkVDVE9SKG9iaik7DQo+ID4gPg0KPiA+ID4gLSAgICBzLT52bmV0X2hkciA9
IGZhbHNlOw0KPiA+ID4gKyAgICBzLT52bmV0X2hkciA9IHRydWU7DQo+ID4gPiAgIH0NCj4gPiA+
DQo+ID4gPiAgIHN0YXRpYyB2b2lkIGZpbHRlcl9taXJyb3JfZmluaShPYmplY3QgKm9iaikgZGlm
ZiAtLWdpdA0KPiA+ID4gYS9uZXQvZmlsdGVyLXJld3JpdGVyLmMgYi9uZXQvZmlsdGVyLXJld3Jp
dGVyLmMgaW5kZXgNCj4gPiA+IGJmMDUwMjNkYzMuLjU2OThjZDM5ZDEgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9uZXQvZmlsdGVyLXJld3JpdGVyLmMNCj4gPiA+ICsrKyBiL25ldC9maWx0ZXItcmV3cml0
ZXIuYw0KPiA+ID4gQEAgLTQwNyw3ICs0MDcsNyBAQCBzdGF0aWMgdm9pZCBmaWx0ZXJfcmV3cml0
ZXJfaW5pdChPYmplY3QgKm9iaikNCj4gPiA+ICAgew0KPiA+ID4gICAgICAgUmV3cml0ZXJTdGF0
ZSAqcyA9IEZJTFRFUl9SRVdSSVRFUihvYmopOw0KPiA+ID4NCj4gPiA+IC0gICAgcy0+dm5ldF9o
ZHIgPSBmYWxzZTsNCj4gPiA+ICsgICAgcy0+dm5ldF9oZHIgPSB0cnVlOw0KPiA+ID4gICAgICAg
cy0+ZmFpbG92ZXJfbW9kZSA9IEZBSUxPVkVSX01PREVfT0ZGOw0KPiA+ID4gICB9DQo+ID4gPg0K
PiA+ID4gZGlmZiAtLWdpdCBhL3FlbXUtb3B0aW9ucy5oeCBiL3FlbXUtb3B0aW9ucy5oeCBpbmRl
eA0KPiA+ID4gNzc0OWY1OTMwMC4uYzQwZTM4NWVkZSAxMDA2NDQNCj4gPiA+IC0tLSBhL3FlbXUt
b3B0aW9ucy5oeA0KPiA+ID4gKysrIGIvcWVtdS1vcHRpb25zLmh4DQo+ID4gPiBAQCAtNDk2Nywx
MyArNDk2NywxMyBAQCBTUlNUDQo+ID4gPiAgICAgICBgYC1vYmplY3QgZmlsdGVyLQ0KPiBtaXJy
b3IsaWQ9aWQsbmV0ZGV2PW5ldGRldmlkLG91dGRldj1jaGFyZGV2aWQscXVldWU9YWxsfHJ4fHR4
Wyx2bmV0X2hkcg0KPiBfc3VwcG9ydF1bLHBvc2l0aW9uPWhlYWR8dGFpbHxpZD08aWQ+XVssaW5z
ZXJ0PWJlaGluZHxiZWZvcmVdYGANCj4gPiA+ICAgICAgICAgICBmaWx0ZXItbWlycm9yIG9uIG5l
dGRldiBuZXRkZXZpZCxtaXJyb3IgbmV0IHBhY2tldCB0bw0KPiA+ID4gICAgICAgICAgIGNoYXJk
ZXZjaGFyZGV2aWQsIGlmIGl0IGhhcyB0aGUgdm5ldFxfaGRyXF9zdXBwb3J0IGZsYWcsDQo+ID4g
PiAtICAgICAgICBmaWx0ZXItbWlycm9yIHdpbGwgbWlycm9yIHBhY2tldCB3aXRoIHZuZXRcX2hk
clxfbGVuLg0KPiA+ID4gKyAgICAgICAgZmlsdGVyLW1pcnJvciB3aWxsIG1pcnJvciBwYWNrZXQg
d2l0aCB2bmV0XF9oZHJcX2xlbihkZWZhdWx0OiBvbikuDQo+ID4gPg0KPiA+ID4gICAgICAgYGAt
b2JqZWN0IGZpbHRlci0NCj4gcmVkaXJlY3RvcixpZD1pZCxuZXRkZXY9bmV0ZGV2aWQsaW5kZXY9
Y2hhcmRldmlkLG91dGRldj1jaGFyZGV2aWQscXVldQ0KPiBlPWFsbHxyeHx0eFssdm5ldF9oZHJf
c3VwcG9ydF1bLHBvc2l0aW9uPWhlYWR8dGFpbHxpZD08aWQ+XVssaW5zZXJ0PWJlaGluZA0KPiB8
YmVmb3JlXWBgDQo+ID4gPiAgICAgICAgICAgZmlsdGVyLXJlZGlyZWN0b3Igb24gbmV0ZGV2IG5l
dGRldmlkLHJlZGlyZWN0IGZpbHRlcidzIG5ldA0KPiA+ID4gICAgICAgICAgIHBhY2tldCB0byBj
aGFyZGV2IGNoYXJkZXZpZCxhbmQgcmVkaXJlY3QgaW5kZXYncyBwYWNrZXQgdG8NCj4gPiA+ICAg
ICAgICAgICBmaWx0ZXIuaWYgaXQgaGFzIHRoZSB2bmV0XF9oZHJcX3N1cHBvcnQgZmxhZywgZmls
dGVyLXJlZGlyZWN0b3INCj4gPiA+IC0gICAgICAgIHdpbGwgcmVkaXJlY3QgcGFja2V0IHdpdGgg
dm5ldFxfaGRyXF9sZW4uIENyZWF0ZSBhDQo+ID4gPiArICAgICAgICB3aWxsIHJlZGlyZWN0IHBh
Y2tldCB3aXRoIHZuZXRcX2hkclxfbGVuKGRlZmF1bHQ6IG9uKS4NCj4gPiA+ICsgQ3JlYXRlIGEN
Cj4gPiA+ICAgICAgICAgICBmaWx0ZXItcmVkaXJlY3RvciB3ZSBuZWVkIHRvIGRpZmZlciBvdXRk
ZXYgaWQgZnJvbSBpbmRldiBpZCwgaWQNCj4gPiA+ICAgICAgICAgICBjYW4gbm90IGJlIHRoZSBz
YW1lLiB3ZSBjYW4ganVzdCB1c2UgaW5kZXYgb3Igb3V0ZGV2LCBidXQgYXQNCj4gPiA+ICAgICAg
ICAgICBsZWFzdCBvbmUgb2YgaW5kZXYgb3Igb3V0ZGV2IG5lZWQgdG8gYmUgc3BlY2lmaWVkLg0K
PiA+ID4gQEAgLTQ5ODMsNyArNDk4Myw4IEBAIFNSU1QNCj4gPiA+ICAgICAgICAgICBwYWNrZXQg
dG8gc2Vjb25kYXJ5IGZyb20gcHJpbWFyeSB0byBrZWVwIHNlY29uZGFyeSB0Y3ANCj4gPiA+ICAg
ICAgICAgICBjb25uZWN0aW9uLGFuZCByZXdyaXRlIHRjcCBwYWNrZXQgdG8gcHJpbWFyeSBmcm9t
IHNlY29uZGFyeSBtYWtlDQo+ID4gPiAgICAgICAgICAgdGNwIHBhY2tldCBjYW4gYmUgaGFuZGxl
ZCBieSBjbGllbnQuaWYgaXQgaGFzIHRoZQ0KPiA+ID4gLSAgICAgICAgdm5ldFxfaGRyXF9zdXBw
b3J0IGZsYWcsIHdlIGNhbiBwYXJzZSBwYWNrZXQgd2l0aCB2bmV0IGhlYWRlci4NCj4gPiA+ICsg
ICAgICAgIHZuZXRcX2hkclxfc3VwcG9ydCBmbGFnLCB3ZSBjYW4gcGFyc2UgcGFja2V0IHdpdGgg
dm5ldA0KPiA+ID4gKyAgICAgICAgaGVhZGVyKGRlZmF1bHQ6IG9uKS4NCj4gPiA+DQo+ID4gPiAg
ICAgICAgICAgdXNhZ2U6IGNvbG8gc2Vjb25kYXJ5OiAtb2JqZWN0DQo+ID4gPiAgICAgICAgICAg
ZmlsdGVyLXJlZGlyZWN0b3IsaWQ9ZjEsbmV0ZGV2PWhuMCxxdWV1ZT10eCxpbmRldj1yZWQwDQo+
ID4gPiAtb2JqZWN0IEBAIC01MDA0LDcgKzUwMDUsNyBAQCBTUlNUDQo+ID4gPiAgICAgICAgICAg
Y2hlY2twb2ludCBhbmQgc2VuZCBwcmltYXJ5IHBhY2tldCB0byBvdXRcX2Rldi4gSW4gb3JkZXIg
dG8NCj4gPiA+ICAgICAgICAgICBpbXByb3ZlIGVmZmljaWVuY3ksIHdlIG5lZWQgdG8gcHV0IHRo
ZSB0YXNrIG9mIGNvbXBhcmlzb24gaW4NCj4gPiA+ICAgICAgICAgICBhbm90aGVyIGlvdGhyZWFk
LiBJZiBpdCBoYXMgdGhlIHZuZXRcX2hkclxfc3VwcG9ydCBmbGFnLA0KPiA+ID4gLSAgICAgICAg
Y29sbyBjb21wYXJlIHdpbGwgc2VuZC9yZWN2IHBhY2tldCB3aXRoIHZuZXRcX2hkclxfbGVuLg0K
PiA+ID4gKyAgICAgICAgY29sbyBjb21wYXJlIHdpbGwgc2VuZC9yZWN2IHBhY2tldCB3aXRoIHZu
ZXRcX2hkclxfbGVuKGRlZmF1bHQ6DQo+IG9uKS4NCj4gPiA+ICAgICAgICAgICBUaGUgY29tcGFy
ZVxfdGltZW91dD1AdmFye21zfSBkZXRlcm1pbmVzIHRoZSBtYXhpbXVtIHRpbWUNCj4gb2YgdGhl
DQo+ID4gPiAgICAgICAgICAgY29sby1jb21wYXJlIGhvbGQgdGhlIHBhY2tldC4gVGhlIGV4cGly
ZWRcX3NjYW5cX2N5Y2xlPUB2YXJ7bXN9DQo+ID4gPiAgICAgICAgICAgaXMgdG8gc2V0IHRoZSBw
ZXJpb2Qgb2Ygc2Nhbm5pbmcgZXhwaXJlZCBwcmltYXJ5IG5vZGUgbmV0d29yaw0KPiBwYWNrZXRz
Lg0KDQo=

