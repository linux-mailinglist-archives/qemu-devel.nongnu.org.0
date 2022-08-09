Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B655E58D5B7
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 10:52:42 +0200 (CEST)
Received: from localhost ([::1]:36654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLKyf-0000AD-S0
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 04:52:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLKva-000673-Ol
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:49:30 -0400
Received: from mga18.intel.com ([134.134.136.126]:12378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oLKvX-0002Lc-Dx
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 04:49:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660034967; x=1691570967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+FStHe/8Tw0V8mmNlJEDI69SeDpZJ7LCpWf21EQplrs=;
 b=GMzLr4cGf10fwJMb8vK7fqrVf8yNuKvz7rfDqUFz+Z12UUIIq031dCq/
 YSgXfeM9MFbW9StT4YZE50j3o1tyyj10zzXmLLGcOJN0+EdPLrX0P0qha
 04esMCgaseJdA8ZeCvFRsGr0kxDAqR9fRymmskJitWDZT7dP8M5Z7tMqq
 n1FjFm1IrpON8LDtgW//SFWV0tiT5OYdwMxgEFaNe+Y37bBLQHbFwm49O
 3e9HYLn+9cxAkM1/KgVikLJJeSrNW87cdWurZ1EzV1dSvS8JEVPhXD16I
 SaN6XFheRvuwS/R1+7RJeq/1VLdsbYSGi1fRZDYdvY3qZnWkP6D//8LFb g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10433"; a="273838170"
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="273838170"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2022 01:49:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,224,1654585200"; d="scan'208";a="604685809"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 09 Aug 2022 01:49:24 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 9 Aug 2022 01:49:24 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 9 Aug 2022 01:49:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 9 Aug 2022 01:49:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVR+8hMwL0OijndxXJuXtS6j8+jd+emvUYnrpl7qo7QR0mVkOXvQ0jP/+D/7MHli8/K44hPZJ7SUBW8UToKfH3Bl8BQ2MJEVBxM4kEEGEmfH0+VFmAJdb0gYva8uijZw37sc6G/qz/DgUBfXr7ZZtxMD+1KHWcNR0int2Rab0+bs5L+RZh6XQQ/0cLIafo8Xft5qDUNtYCweJOp75ZBGkaal9Hi0TNyLPlEsB4yV+geM18WHrpqEzp9SbgltjO0s3ncE8YysWSiQx6HTpRNyAfQmuu9AVquqCQRgqsweThX2bAd2NIHSnohSmBT9zoxw9BbO8DX9EH8OHIWM0DDUnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FStHe/8Tw0V8mmNlJEDI69SeDpZJ7LCpWf21EQplrs=;
 b=KFCbj1cKhF7krrqT85nVWYrNuWOArqx1bgozr8RNh3b0Lxu70JV8ie8VedTMvRZ9G6TjcxAISUHnz22IWmx781DlRaTL/LfUhqtwQMaml845P+dX7vaJAbBEpXmwqGoxmskLzkmLfV798e+I9LPQuIeJ21ADO+Y4YX5iusfjhXvvHifjfLOk6WMvHE9yPl69iYuXsatNDPWoM/Yd+rR0TKBK4N/XbP5XJbJ29LkKPLPAHHJGVp84KCb/jGefaXoXuT18KyzEW6P48LAxC67VFqObBBqkE1Y81tMF32/ki/qyRvu79ETftz3N7gEEkV5WZ5SymEvXRvoG/A/5sEll2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BN6PR11MB4034.namprd11.prod.outlook.com (2603:10b6:405:7d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.10; Tue, 9 Aug
 2022 08:49:22 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 08:49:22 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian
 <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH V3] net/colo.c: Fix the pointer issue reported by Coverity.
Thread-Topic: [PATCH V3] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYq5zPRShnsJI/PU2fXfF1C5tE5K2mOB+AgAADEVCAAAWDgIAAAX3Q
Date: Tue, 9 Aug 2022 08:49:21 +0000
Message-ID: <MWHPR11MB0031EF6807BB6315DEBCDFCB9B629@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220809025010.200289-1-chen.zhang@intel.com>
 <CACGkMEuWcLuGBfJ3zyEw2qi8=C80f13Tt1_t1fJj1D4k8PNRiw@mail.gmail.com>
 <MWHPR11MB0031AF520C6EEA63C544D5EE9B629@MWHPR11MB0031.namprd11.prod.outlook.com>
 <CACGkMEsm9CQ3hhVt37kGMDbRgCnbStsJ1O0VXLc6r4FLJe_tiA@mail.gmail.com>
In-Reply-To: <CACGkMEsm9CQ3hhVt37kGMDbRgCnbStsJ1O0VXLc6r4FLJe_tiA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2f3fb63a-b3d7-4dcb-0f88-08da79e40de7
x-ms-traffictypediagnostic: BN6PR11MB4034:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Go4zxvQqqF1eazIh/TZL2VjZquOlt1paz/oUgOxTSX2HFUTUr0LuSUiIxbM++27YxcslkVlBmIaVu6RqK19oXyfqwYkAZvDDV6r8glDwFib5KMS0XQZQK7T9gcmNbGqM8rBEUMwRtqbMu0ERn62ilSOK8SivxmgqTOLZOi3CWV8QucqLECrlXB2VsVbgoqdRyGSn4jV9k7wqR3k37q8kRYMHyH7mFHRYoWYjn7X4K48THB5kz3f+gCwABxXWx36f6ekB1ajDRT15SuQMrT2udTUl8luBZLirVuTUpn9QYA6DLcZWceP8wN7QL1WDC+yQBw7uODtla6rislfTmvx6nd2TkAZAhv4LuLhBESEWquZ3UAAzcsdG3ywVoMwqvoc3ZNkqWYfr9yCQSnHbhglBFHOGhdbd+x0r8s6UMgGTvqcoNW9zrG+jdzzVc4kpIEHls+fXn0JL2qxpi77GFPZ57c9QXJnOqB0kKz5BOjsOfPKmHMTvOus//SbXs6Q1iiaQw4+MIVdcB4dW62GpZf5ex1z65rK/zVKqjIx2pJC3nVOOd109AmqP1lY3jbdao2NlXs4jun5KStYVEbTwwoc8nPQIMn74amhJoYa0yuw6ZhI234eq29tXWlNTXlpMs+SPtFXofS1ymh4+yEyV9TNGWhTDXRoGqGhm5Yz8/l3shezDZbEVum0Vp31E9vOihKm6oK3xVwaYDYIDjMWvujuo6WsT/phPEkN/uu8XcMraP79DcFRAtjBJWhOnhwa1Mgz5CFheAl0QKc6UKg6jcQjHagk9CKjCMEhmD0KBLzxCOBLMAAez5Q0oHjjBBUz9ErNl
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(346002)(366004)(396003)(39860400002)(122000001)(38100700002)(26005)(82960400001)(76116006)(66946007)(4326008)(8676002)(64756008)(71200400001)(66476007)(66446008)(66556008)(38070700005)(6916009)(54906003)(316002)(55016003)(478600001)(86362001)(5660300002)(52536014)(8936002)(2906002)(186003)(9686003)(33656002)(41300700001)(53546011)(83380400001)(7696005)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YUl1K1RTWlk5dmgrc0hZUzJXY0o0T2VPdy96Mkp2S3JBTEMvbEhpbXZ4Y2FW?=
 =?utf-8?B?YksxdkdNUUZ3NWpKLzJ4TStFV1RoZklSWnJJUUlvZlQ1a3U0Q2t3WVF4akRS?=
 =?utf-8?B?SkpTQTF0SzN6NHdMWlJRSlczcE1Ec2VKOExueUpsby9EWjRJRDU0Rk41Q0h2?=
 =?utf-8?B?cG0xMFNqdzloQ2ZRZTFYelFzS3M0Zm0yRnlISDhGZG91NS84R1REQkhDSllO?=
 =?utf-8?B?MlNCNmNxYzVxSHdrbUE0OHZLNkllNDE0MTB6RnF1cnlHamlPMXIrTzJVL0VL?=
 =?utf-8?B?ckJUSW9QY1NkZjQ4R09jY1JzcTgwekRmOXpaZnZ1YnVKNjR6ME1GTkY5Slph?=
 =?utf-8?B?RXVaTjkzSXpQdXU4eWR1L0dNYkRJZ0xrcmx4NjhVcVZ2SGg3Q1k1KzZReFFW?=
 =?utf-8?B?YVppMGRZK0E4UkFFdmJ1emNJUjhNVjN5VFpuWUh0ZWJRYzErQ0llZG9URE9H?=
 =?utf-8?B?b2JxSm9oZnBPQjZZS1RRMmxhQWRxLzFjL2k2UENrdktOT2hZSWhZMktaNG55?=
 =?utf-8?B?bDcyVFJnZDFwWTJucmg4YWtuTmwxM21TaDNtYi80Ym9FK0pQVVNTRm5LbitJ?=
 =?utf-8?B?YXJOdXlwOTk2R1UwZ3l5bGNUbTFSR1pvWHhmaUpvbGREVW1Oc21Xd1Z0Nk1y?=
 =?utf-8?B?UVdMb0tJNG5mNW5nUVJoWXVzby9TeDdPY2VUMU1LaE5zTjlTVWI5MU9jcG14?=
 =?utf-8?B?eHBpZHVQTStIZTlBTDd6eTlGSkdIQmVHTEJXQmtoZ2ZIamxKemJGZWMyWmRp?=
 =?utf-8?B?Y0RJbFBQTE00UlRiRjhMeDJXWUthOUh1MG9tRWtlY0JKN0xSRU1yd2E2eC9R?=
 =?utf-8?B?a2RwTTRVQVpnVXJpZ3VNa1dlZm53QlM0Y1QzQTYzRDFyWUF0R1VwMXB3b2JC?=
 =?utf-8?B?NFBGY1dsZGFjcTBwRmdYQ3VmZnZ1VEJyT3pEeFBFKzlpMnMvM0NLWmFxRlBn?=
 =?utf-8?B?dEtmdisya0V5Y1cvaG94cmtEYlFuRHk0QjJ6dDdFaW5NT0szR1JpOTkxWGVQ?=
 =?utf-8?B?YWR6ZVg2bmZsNHFQcUZBTWJBV1N6NGxJOUpyZE9ONndBY1lMV0ZiZXNvNVds?=
 =?utf-8?B?Mkk5WXFFYjlScXlPR0lTdld1TE5OT1hYc0U5cFdWdnM1eWg0eW1LTHZ0dXor?=
 =?utf-8?B?UGNsOUJ3Mk9vT1N3M0x4cDJDZGRHOS9ncGFlbXdzckc4NGtlQW5KTzFZaHZV?=
 =?utf-8?B?Vkx2VFIyUEtQWk9SN3B3c2FnbXFTZ3NFWWEvMTdOV21SbU12VjRqUWxXemE5?=
 =?utf-8?B?RXJqRjBRLzg5YTVjaUt6SUdzbW4vWFRtR2FUaklLWUh4d0RGSWNncEhCN0pF?=
 =?utf-8?B?cURQeTZ4aVJ1OTlxRVhLRzRveWlNdEZxZGduc3JIeDRMc3BqckxRL0pJVXln?=
 =?utf-8?B?UTRwbU9xRDdlR1FlOFd5ZkpncE96TnlhNEFNK2I3c1B3YjQ1ME42ZDd0SWgr?=
 =?utf-8?B?KzdqT2hHYXlKa2FSY2d4SXpPZzBvc0ZHVCtBVlo2K0pTL1pWK2c5THBHbXNB?=
 =?utf-8?B?YUZRdXJFckdVdDFNMmZTZmhjQkk2SnlKMk1QSDMxVkFIUUNGQjd1QWRHT2l6?=
 =?utf-8?B?dUFUR3dWcEZjdlRsN0o4MG8wMEFvT1pPTW10QWtrTmtVZDgyWHY3cUwvQWRx?=
 =?utf-8?B?YThsZkUvRTRvWmQybGVjY0xVRGZPa1hlLzVscjhyRHAwa2hlQlRqU1IrTkYw?=
 =?utf-8?B?UUZpWUt2QlMzNDJKZXJSZVdqQjU2TnR2TWwzbUtXdlpmZGVHY1N5SUJEVUNj?=
 =?utf-8?B?MjBjVyt0S1FCMlVmNUdsZUd3Z0VpT0ppR09tcVJRanpldmtOWnNyVk5jcUF4?=
 =?utf-8?B?U1Y5N2dSOTF3cnpuT0o4aGZGcFBEb0RIRXB4MTdVZDlDeVIrQWFGTnhoeDVC?=
 =?utf-8?B?U092UFN1QUVIZUhtd3poVk9ZTFRGanFkNlBiUElJYk8wY2hYTEdpdTBJUEFo?=
 =?utf-8?B?cWp6M2d2THlUK3pTeEhobkRYelNwNjBjcnBURmRkN3RmS01WRmJqZloxeVNZ?=
 =?utf-8?B?dmVoQ3lqMVpSK2ZOdEFBYk1GbXMrVGRpb1FwaC9GU2RxQmRtYThwd1pLVGVl?=
 =?utf-8?B?WStDemE3MExqVGlQTTNVeTBkd0RhS3VqSXlaRERSNGNNejk1TUR6NzJUUkpV?=
 =?utf-8?Q?3i4rJTSj24fz3aPx8FhjGiFMZ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f3fb63a-b3d7-4dcb-0f88-08da79e40de7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2022 08:49:21.8785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PFlyhvolu6IRLTujKNEKOBlUB3/7DmIxa2N3vnSDdTNfkn1sfYY9EhFuRUobaCpF7MtYhTCuzK841PTcr0h9pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB4034
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=chen.zhang@intel.com; helo=mga18.intel.com
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDksIDIwMjIgNDo0MyBQ
TQ0KPiBUbzogWmhhbmcsIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPg0KPiBDYzogUGV0ZXIg
TWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGkgWmhpamlhbg0KPiA8bGl6aGlq
aWFuQGZ1aml0c3UuY29tPjsgcWVtdS1kZXYgPHFlbXUtZGV2ZWxAbm9uZ251Lm9yZz4NCj4gU3Vi
amVjdDogUmU6IFtQQVRDSCBWM10gbmV0L2NvbG8uYzogRml4IHRoZSBwb2ludGVyIGlzc3VlIHJl
cG9ydGVkIGJ5IENvdmVyaXR5Lg0KPiANCj4gT24gVHVlLCBBdWcgOSwgMjAyMiBhdCA0OjI5IFBN
IFpoYW5nLCBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4gd3JvdGU6DQo+ID4NCj4gPg0KPiA+
DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogSmFzb24gV2Fu
ZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4NCj4gPiA+IFNlbnQ6IFR1ZXNkYXksIEF1Z3VzdCA5LCAy
MDIyIDQ6MTIgUE0NCj4gPiA+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+
DQo+ID4gPiBDYzogUGV0ZXIgTWF5ZGVsbCA8cGV0ZXIubWF5ZGVsbEBsaW5hcm8ub3JnPjsgTGkg
Wmhpamlhbg0KPiA+ID4gPGxpemhpamlhbkBmdWppdHN1LmNvbT47IHFlbXUtZGV2IDxxZW11LWRl
dmVsQG5vbmdudS5vcmc+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIFYzXSBuZXQvY29sby5j
OiBGaXggdGhlIHBvaW50ZXIgaXNzdWUgcmVwb3J0ZWQgYnkNCj4gQ292ZXJpdHkuDQo+ID4gPg0K
PiA+ID4gT24gVHVlLCBBdWcgOSwgMjAyMiBhdCAxMTowNSBBTSBaaGFuZyBDaGVuIDxjaGVuLnpo
YW5nQGludGVsLmNvbT4NCj4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IFdoZW4gZW5hYmxlIHRo
ZSB2aXJ0aW8tbmV0LXBjaSwgZ3Vlc3QgbmV0d29yayBwYWNrZXQgd2lsbCBsb2FkIHRoZQ0KPiA+
ID4gPiB2bmV0X2hkci4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3MgbmV0d29yayBw
YWNrZXQgbWF5YmUNCj4gPiA+ID4gcmVkaXJlY3QgdG8gYW5vdGhlciBWTSwgaXQgbmVlZCBmaWx0
ZXItcmVkaXJlY3QgZW5hYmxlIHRoZQ0KPiA+ID4gPiB2bmV0X2hkciBmbGFnIGF0IHRoZSBzYW1l
IHRpbWUsIENPTE8tcHJveHkgd2lsbCBjb3JyZWN0bHkgcGFyc2UNCj4gPiA+ID4gdGhlIG9yaWdp
bmFsIG5ldHdvcmsgcGFja2V0LiBJZiBoYXZlIGFueSBtaXNjb25maWd1cmF0aW9uIGhlcmUsDQo+
ID4gPiA+IHRoZSB2bmV0X2hkcl9sZW4gaXMgd3JvbmcgZm9yIHBhcnNlIHRoZSBwYWNrZXQsIHRo
ZSBkYXRhK29mZnNldCB3aWxsIHBvaW50DQo+IHRvIHdyb25nIHBsYWNlLg0KPiA+ID4gPg0KPiA+
ID4gPiBTaWduZWQtb2ZmLWJ5OiBaaGFuZyBDaGVuIDxjaGVuLnpoYW5nQGludGVsLmNvbT4NCj4g
PiA+ID4gLS0tDQo+ID4gPiA+ICBuZXQvY29sby5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tICBu
ZXQvY29sby5oIHwgIDEgKw0KPiA+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQ0KPiA+ID4gPg0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbmV0L2Nv
bG8uYyBiL25ldC9jb2xvLmMgaW5kZXggNmIwZmY1NjJhZC4uNGYxYjRhNjFmNg0KPiA+ID4gPiAx
MDA2NDQNCj4gPiA+ID4gLS0tIGEvbmV0L2NvbG8uYw0KPiA+ID4gPiArKysgYi9uZXQvY29sby5j
DQo+ID4gPiA+IEBAIC00NCwyMSArNDQsMjMgQEAgaW50IHBhcnNlX3BhY2tldF9lYXJseShQYWNr
ZXQgKnBrdCkgIHsNCj4gPiA+ID4gICAgICBpbnQgbmV0d29ya19sZW5ndGg7DQo+ID4gPiA+ICAg
ICAgc3RhdGljIGNvbnN0IHVpbnQ4X3QgdmxhbltdID0gezB4ODEsIDB4MDB9Ow0KPiA+ID4gPiAt
ICAgIHVpbnQ4X3QgKmRhdGEgPSBwa3QtPmRhdGEgKyBwa3QtPnZuZXRfaGRyX2xlbjsNCj4gPiA+
ID4gKyAgICB1aW50OF90ICpkYXRhID0gcGt0LT5kYXRhOw0KPiA+ID4gPiAgICAgIHVpbnQxNl90
IGwzX3Byb3RvOw0KPiA+ID4gPiAgICAgIHNzaXplX3QgbDJoZHJfbGVuOw0KPiA+ID4gPg0KPiA+
ID4gPiAtICAgIGlmIChkYXRhID09IE5VTEwpIHsNCj4gPiA+ID4gLSAgICAgICAgdHJhY2VfY29s
b19wcm94eV9tYWluX3ZuZXRfaW5mbygiVGhpcyBwYWNrZXQgaXMgbm90IHBhcnNlZA0KPiBjb3Jy
ZWN0bHksICINCj4gPiA+ID4gKyAgICBhc3NlcnQoZGF0YSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4g
KyAgICAvKiBDaGVjayB0aGUgcmVjZWl2ZWQgdm5ldF9oZHJfbGVuIHRoZW4gYWRkIHRoZSBvZmZz
ZXQgKi8NCj4gPiA+ID4gKyAgICBpZiAoKHBrdC0+dm5ldF9oZHJfbGVuID4gc2l6ZW9mKHN0cnVj
dCB2aXJ0aW9fbmV0X2hkcikpIHx8DQo+ID4gPg0KPiA+ID4gVmlydGlvLW5ldCBzdGFydHMgdG8g
c3VwcG9ydCBSU1Mgc28gaXQgbWVhbnMgdGhlIHZuZXRfaGRyIHNpemUgY291bGQNCj4gPiA+IGJl
IGdyZWF0ZXIgdGhhbiB2aXJ0aW9fbmV0X2hkciBub3cuDQo+ID4gPg0KPiA+ID4gT3IgZGlkIHlv
dSBhY3R1YWxseSBtZWFuICI8IiBoZXJlPw0KPiA+DQo+ID4gTm8sIEkganVzdCB0cnkgdG8gYXZv
aWQgb3ZlcmZsb3cgd2l0aCBhIG1hbGljaW91c2x5IG92ZXItbGFyZ2UNCj4gPiB2bmV0X2hkcl9s
ZW4gdmFsdWUgYXMgUGV0ZXIncyBjb21tZW50cy4NCj4gPiBJZiBlbmFibGVkIHRoZSBSU1MsIGhv
dyB0byBnZXQgdGhlIG1heGltdW0gb2Ygdm5ldF9oZHIgc2l6ZT8NCj4gDQo+IFdpdGggaGFzaF9y
ZXBvcnQgdGhlIG1heGltdW0gaXMgc2l6ZW9mKHZpcnRpb19uZXRfaGRyX3YxX2hhc2gpLiBCdXQg
aXQgbWlnaHQNCj4gYmUgZXh0ZW5kZWQgaW4gdGhlIGZ1dHVyZS4NCj4gDQo+IFdlIGNhbiBwcm9i
YWJseSBzdGFydCBmcm9tIGl0Lg0KDQpUaGFua3MsIEkgd2lsbCBjaGFuZ2UgaGVyZSB0byAiIGlm
ICgocGt0LT52bmV0X2hkcl9sZW4gPiBzaXplb2YodmlydGlvX25ldF9oZHJfdjFfaGFzaCkpIHx8
IiBpbiBuZXh0IHZlcnNpb24uDQoNClRoYW5rcw0KQ2hlbg0KDQo+IA0KPiBUaGFua3MNCj4gDQo+
ID4NCj4gPiBUaGFua3MNCj4gPiBDaGVuDQo+ID4NCj4gPiA+DQo+ID4gPiBUaGFua3MNCj4gPiA+
DQo+ID4gPiA+ICsgICAgICAgIChwa3QtPnNpemUgPCBzaXplb2Yoc3RydWN0IGV0aF9oZWFkZXIp
ICsgc2l6ZW9mKHN0cnVjdCB2bGFuX2hlYWRlcikNCj4gPiA+ID4gKyAgICAgICAgKyBwa3QtPnZu
ZXRfaGRyX2xlbikpIHsNCj4gPiA+ID4gKyAgICAgICAgdHJhY2VfY29sb19wcm94eV9tYWluX3Zu
ZXRfaW5mbygiVGhpcyBwYWNrZXQgbWF5IGJlIGxvYWQgd3JvbmcNCj4gIg0KPiA+ID4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJwa3QtPnZuZXRfaGRyX2xlbiIs
IHBrdC0+dm5ldF9oZHJfbGVuKTsNCj4gPiA+ID4gICAgICAgICAgcmV0dXJuIDE7DQo+ID4gPiA+
ICAgICAgfQ0KPiA+ID4gPiAtICAgIGwyaGRyX2xlbiA9IGV0aF9nZXRfbDJfaGRyX2xlbmd0aChk
YXRhKTsNCj4gPiA+ID4gKyAgICBkYXRhICs9IHBrdC0+dm5ldF9oZHJfbGVuOw0KPiA+ID4gPg0K
PiA+ID4gPiAtICAgIGlmIChwa3QtPnNpemUgPCBFVEhfSExFTiArIHBrdC0+dm5ldF9oZHJfbGVu
KSB7DQo+ID4gPiA+IC0gICAgICAgIHRyYWNlX2NvbG9fcHJveHlfbWFpbigicGt0LT5zaXplIDwg
RVRIX0hMRU4iKTsNCj4gPiA+ID4gLSAgICAgICAgcmV0dXJuIDE7DQo+ID4gPiA+IC0gICAgfQ0K
PiA+ID4gPiArICAgIGwyaGRyX2xlbiA9IGV0aF9nZXRfbDJfaGRyX2xlbmd0aChkYXRhKTsNCj4g
PiA+ID4NCj4gPiA+ID4gICAgICAvKg0KPiA+ID4gPiAgICAgICAqIFRPRE86IHN1cHBvcnQgdmxh
bi4NCj4gPiA+ID4gZGlmZiAtLWdpdCBhL25ldC9jb2xvLmggYi9uZXQvY29sby5oIGluZGV4IDhi
M2U4ZDVhODMuLjIyZmMzMDMxZjcNCj4gPiA+ID4gMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL25ldC9j
b2xvLmgNCj4gPiA+ID4gKysrIGIvbmV0L2NvbG8uaA0KPiA+ID4gPiBAQCAtMTgsNiArMTgsNyBA
QA0KPiA+ID4gPiAgI2luY2x1ZGUgInFlbXUvamhhc2guaCINCj4gPiA+ID4gICNpbmNsdWRlICJx
ZW11L3RpbWVyLmgiDQo+ID4gPiA+ICAjaW5jbHVkZSAibmV0L2V0aC5oIg0KPiA+ID4gPiArI2lu
Y2x1ZGUgInN0YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX25ldC5oIg0KPiA+ID4gPg0KPiA+
ID4gPiAgI2RlZmluZSBIQVNIVEFCTEVfTUFYX1NJWkUgMTYzODQNCj4gPiA+ID4NCj4gPiA+ID4g
LS0NCj4gPiA+ID4gMi4yNS4xDQo+ID4gPiA+DQo+ID4NCg0K

