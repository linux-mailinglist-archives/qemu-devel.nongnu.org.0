Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB9D562FAB
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 11:17:06 +0200 (CEST)
Received: from localhost ([::1]:35792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7Clt-0006OZ-TS
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 05:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o7Cj6-0004ib-VQ
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:14:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:57511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1o7Cj2-0005cl-PW
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 05:14:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656666848; x=1688202848;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=reX4LUezfYa/IpTCj4ZOfLpwbWThiOk6zTEp78GeL8k=;
 b=Us3NKOGFIvdeej0DGkZfeQ+pERq+pZg+zVnoYZVNKo1W84Vm0xA7iblf
 T631ZLk+j+low3MJ5/2jvJskWh7LOfjtO6m0fcXOu/vudZiwSLkQDnjX6
 wc6k/MOLucFXF/9JcnLsuc0dTlAy6UI1gJBSgrGoapOMvLEDJDykxN0Mf
 l/3iZT7G93KYD0IwbKN+Rw9cAUWHupzvx0sjDrqo/zYCsLBi8gaN+x/2L
 JSzCrzkhPDFylZ6ziaMcfEMS7sacEHeGM+Plux1NybhgyzFP5GKAipduT
 Hh9DklY8m3Gt/MP3Ff8UURO9YPYevrQ/eLFYOpRKj58oydLCQd4mEI9Cm g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10394"; a="265635961"
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="265635961"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2022 02:14:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,236,1650956400"; d="scan'208";a="618346129"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 01 Jul 2022 02:14:04 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 1 Jul 2022 02:14:04 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 1 Jul 2022 02:14:04 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 1 Jul 2022 02:14:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz/KTr0BHpCh2iTCC59dMLBdjq1splWN1iY/Vl2wXeO7D5nLbFe442qgY+CphFAUOpfgI2YMM8SAtR6X+yPAMdCGaetnIN/A3Vj0XrqFdEBuwwkn2NusjINyShigv+2mMgqMeZrPdLWYp6Y5WUqBw3aDtqrki/d/sfDZ3k5b0/98EyK+JEs+m0OrW/B8JQ4ldeAXNNgCC7Vgy/mQlzkMBw1ImhxCHYAY/P+SmaiibG9ZHEO+asxbNQLGEPB7Ta5zX5wb23ofa92FWyjWA3oobOGHRFIKeB0PznOIyQyij5/z8dLOHvDz4y3xpJnpqnZEx2BditVB7wS3v137IH/Hag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reX4LUezfYa/IpTCj4ZOfLpwbWThiOk6zTEp78GeL8k=;
 b=OAOlgFVkEnyT5TMucWt8XuJh3wa99xD5PXfg2advUAuTpy4rSQioFGWvQeAgzUHApYOeofi3I2GMTMZz80OnHOPa3s0RzvWrzK8/3tefcVGciDtT3ZFVNNoophffw8qdrIybn94jPXOK1SkRd4wnLQbWji2fInl2id/G4S7ohkWxRH3N+EGU2Vsk4fz2yZ8dFEDLTxFj6irwwZ0//RGvNbZrM/a9L98wHraRlYfbEjT9wYytQdm4ddq7jT3PWdNsuAT/Xb38McBy6oobnMqRQF9WFWd0vyTM7cijqtu+NT/ShyMzCKXQmTXj1zoTUzv3DwlORVHMykCNhL5YGX0Y2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by BYAPR11MB2885.namprd11.prod.outlook.com (2603:10b6:a03:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17; Fri, 1 Jul
 2022 09:14:02 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e1f5:a0f0:bccf:9c42%7]) with mapi id 15.20.5373.022; Fri, 1 Jul 2022
 09:14:02 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: =?utf-8?B?RmVsaXggeHEgUXVlacOfbmVy?= <xq@random-projects.net>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "kraxel@redhat.com" <kraxel@redhat.com>, "thuth@redhat.com"
 <thuth@redhat.com>
Subject: RE: [PATCH] gtk: Add show_tabs=on|off command line option.
Thread-Topic: [PATCH] gtk: Add show_tabs=on|off command line option.
Thread-Index: AQHYikoy5lBtP/9w4UeuY2xxJjtehq1pQKEA
Date: Fri, 1 Jul 2022 09:14:02 +0000
Message-ID: <MWHPR11MB0031F97918270C5D101F5D709BBD9@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220627164404.12137-1-xq@random-projects.net>
In-Reply-To: <20220627164404.12137-1-xq@random-projects.net>
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
x-ms-office365-filtering-correlation-id: 2c2633d0-0442-4131-7137-08da5b420a48
x-ms-traffictypediagnostic: BYAPR11MB2885:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMuGWtqziYRchZNI6xNf3g2rOpcmtopx70JPAjQuCD3EMbaWoakEMGQB7dtc/qlqF4HbTY/6BIJ4C/Lp0ryXtTGL0NX7slNqBXxl32KCoAOILPgMEHduIYmjhVYzkYSa3RbWZaWuVLaH9nfvdh3IfWpQEndszcE4Dwx8NQsUE7qZgQ+gY1eoRGI6FX2pUW6a6zGAiyKcNjpXJK8cx+ldEQ4/P9orv+QkRBQQtYwp4Vw1IUgINkLUsvrGUboereJufJrkdY+34qauhqrx2udNlN+gVOB/DkM7/WcZNfLpUEVqNudTPVP3mV2CSgJK67pZ9sxsE1wbkH3I1VVew45D+uxF1uxXUftYt+VxorhY4JnQA0eI+RxYknmbaVAXwmO2HNVgWXfQ0kqFBSQlJBEAhm174Qb/TQ+Oh5TZfs7txBi54JoapEC/w2w8uAFy2e27lrw9pL3tLhsmGlawIfTGGFxTErqOXUb2nJ4CFgK5TGxu1XfCji2GAzZlxPp2/B3LSa8posx2OGJI1LgcEvbjGPoxgNbRmybyhg1RtyRQTnuuyJZB1ruVOTxKaMMNdjCBUbZKApyJBYQlFNjZY7n/z/bjd56syt4D2Xtv0dqF0y9zrcVBidCWsC/nHj5jHd1VkOIyGFCJ4WWk4sa2FJBvF35jj3ZG4CiaWeSyNAGyi+gWoxxoMaidcjpsnT180aAWOkbEPx1XBo+nVHvUv0ljR2sahFkJdiuvW2xz5SluXgWvtD9FLkiNH82QG//YqIqxjsKWbRWVrOebs53WEosw327vm/jioFPSAx+KtjHNFAPZ27XcnjO2ZqvyWYtJgV/R
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(396003)(39860400002)(366004)(136003)(376002)(83380400001)(38070700005)(33656002)(53546011)(2906002)(478600001)(186003)(66574015)(5660300002)(86362001)(8676002)(7696005)(122000001)(76116006)(110136005)(66476007)(26005)(9686003)(8936002)(4326008)(54906003)(64756008)(82960400001)(66946007)(66556008)(6506007)(38100700002)(52536014)(55016003)(316002)(71200400001)(66446008)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?akVtYXJ0ckpFRHJRTmZZdnU0NjRIL2lqRWlRdUhtcWkrOHlvcW5aU3d6YnA1?=
 =?utf-8?B?c2hhN1UyUHp0WndPbExiWHYwbDBZZEpkN3F0b25YMzV1SWpkTEpCT2pyNjRU?=
 =?utf-8?B?MVdSM0dwOC8xVGk2K3ZSSjFoU0ZkYkFIOHRJWXZpSkVPZVJiNEZmZVJIeHlC?=
 =?utf-8?B?VnJRNUV1Qk1walIwRFQrZGRaWkxlK21aZGREVUNYTGRDLzRFVm9hd3BBbnQ0?=
 =?utf-8?B?bmsxQjJaVmwvcmU0MGgybExrbzN2N25YdnVrSHJwVWU4WlVvdEh3dVY5Lzds?=
 =?utf-8?B?NkhUd3RqM3pMTXNPcEE3eE5STEozU0FnaTJ2eUN5aDltUjNlcngvazFPOEJI?=
 =?utf-8?B?TE5vU0ZvZDV0dTFGL2RzcXhBVTVBVkVHOUQ3T1hIanB2endYVWRRanFSU3h3?=
 =?utf-8?B?VHJNUVQ3K0xJeS92d1JyNnppNFRoMXlIUjFNak83OUgyanVZWnpNOG1rQk1n?=
 =?utf-8?B?NjQ5SVlwcWFEWE51SFlaSFo3a2FtcEVVVU1WY2NwT3M0Y2RGeWozaC9YYkYy?=
 =?utf-8?B?YTdlWkNuYS9nZFQwcEJFVnl4UkVkWDNxTVJ5Mmc0dU1Ubmg5OFM0RUFFb05i?=
 =?utf-8?B?TUNCTmVtSHB6WTg4NlBBSW05VDBRQ0pkUXVxM1FnNGNmVkF6cy85SEMzcUpt?=
 =?utf-8?B?YUkrK3R6cDZDemVQN0FiNTFvT0VCVmxDR0ZvalFBRVFtVm92STJDbk9nK0Z1?=
 =?utf-8?B?aUwwcGtNR3ZxTDdXdWgwVFN4S0dzcGZuQnJDVlUxMk9jbXZOL0tubjFIeXZk?=
 =?utf-8?B?L2tRL3Q1d2QzU0hmNE1rcDFtUlJKZW1XUE1udWcvWlUrVmxjaHZYQTlKZW1Z?=
 =?utf-8?B?d1IvT0VwMXdCL0NPZjg5Rkd0dWJhWWp2aTVRd1kyNEpVQk1YSHJRUy9vZ2VU?=
 =?utf-8?B?OHlQRTEvcWdXM0JNT1RKMmd1UERTY0o0Qnd0YTd5Q3BVT1hHVGpjOXY3RFdU?=
 =?utf-8?B?cUhQOHk1UGRNdS8vS0xZVjlUTjJ3Z2F1a29aQzJESjdoUVZjVDd1T2pVa2dT?=
 =?utf-8?B?MHJHTDIwOHBidS83N1dEU3htZHo1SUpaTDliT0FiVCtkZlZPa3JUOGdGSU9F?=
 =?utf-8?B?TUd1bUFrYStiRGFoUUJncTQ4cmNpRVhVbDVmczlpNEtjOHlWcEpNTzJuN0dQ?=
 =?utf-8?B?VHdMbjdjRzY2a2EzUS9yOEJiNWsxNm9qYm0wdkxBcUt3YVV4emgwOTlPZXJL?=
 =?utf-8?B?ejlZMnMxbU5rZTJMNHNxN3pZeXAwY3F6R21WSnIyZm44eDJRM2tFZTVGU1lh?=
 =?utf-8?B?U0dPNm83Q3E1SXBZOW1NK1pSOTYyc0FzNlB5SEhrUEhMdHpvUEVTb3dweldN?=
 =?utf-8?B?ekdNWWFYUldrSEMzb24za2lyRGF2STNLaTBUc3ltalkwL0RRRGZzek1od2xT?=
 =?utf-8?B?YjNyc2F2WmVBL3pzSXlGaTJTZVc3bGM0UE1RVThpZW1mS2dhcTkxMGR6a2hG?=
 =?utf-8?B?TXJCOWh5NUVERENpeWcrSnBqeVRKeE5tZk9sT3BiU2hEaEZHNDEzeUdnSWI3?=
 =?utf-8?B?YTNEczc5bHI3b1QreHUxeWtCRDlJdm5tekZsdGphcTZGRDYrT0VNdWtnbG5u?=
 =?utf-8?B?STJjQmY5VDF5RG9sS0VOam5Td1AwR0w3TVhMUk03OExRYlQrRlhNZ2JORnJM?=
 =?utf-8?B?eUlNQkZUUFNnZjBpazYwaGp4MndxeHNBK3NTNSszNXNlMVRONUZHZDNoQWYr?=
 =?utf-8?B?ZkN2T3EwdlBiaWUzOENyQ1hGOGtITGwwcXh3RVdvQVN2TldhSG5Zb2lpOE5p?=
 =?utf-8?B?WkxFdVZnN3E3VzgrelE0elhHSC9RekxvQWljNHd1TmIzcGpFS0FFcUsvTXI4?=
 =?utf-8?B?ejBXTlp3SGlDb09jZW4xaS9weGsyVUdzVVdqTGR2a3I5dXpNUEdINm9xRTNx?=
 =?utf-8?B?cWRRWUdNeE9LbXZvRVJ5YWtmZCtnOWdoTlNIYi9TdmcxS3lkOWUzbERpbGJs?=
 =?utf-8?B?V0xVZDZxSlJuaDBFK0FYKzVsenhlNUtMZTJLbmZpQTBDdU9mVHdub1FHUDYy?=
 =?utf-8?B?YXZpTEVETFF5elByZUtzdVV1V3oxWDR1Qnlzb0JiUFJaYmJNSWZOK3IwdGwx?=
 =?utf-8?B?dHdPM1NWL1JJdnptNlZzUmR3eXZxTWdVb1Q0Z0ltQjhoNGN4MUlCZXJURlhj?=
 =?utf-8?Q?lv2kXtXq3jrXtNL0J7n37ZYOv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2633d0-0442-4131-7137-08da5b420a48
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2022 09:14:02.4210 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HQSgMOg35Xe1pFXTq224aT4nM1jkqlXI2XyD7CwGTGvHTfpWX2M0lyrYPBENDqwhPAa+CB1+skOMxjOx2x+DBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2885
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUWVtdS1kZXZlbCA8cWVt
dS1kZXZlbC0NCj4gYm91bmNlcytjaGVuLnpoYW5nPWludGVsLmNvbUBub25nbnUub3JnPiBPbiBC
ZWhhbGYgT2YgRmVsaXggeHENCj4gUXVlacOfbmVyDQo+IFNlbnQ6IFR1ZXNkYXksIEp1bmUgMjgs
IDIwMjIgMTI6NDQgQU0NCj4gVG86IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiBDYzoga3JheGVs
QHJlZGhhdC5jb207IHRodXRoQHJlZGhhdC5jb207IEZlbGl4ICJ4cSIgUXVlacOfbmVyDQo+IDx4
cUByYW5kb20tcHJvamVjdHMubmV0Pg0KPiBTdWJqZWN0OiBbUEFUQ0hdIGd0azogQWRkIHNob3df
dGFicz1vbnxvZmYgY29tbWFuZCBsaW5lIG9wdGlvbi4NCj4gDQo+IFRoZSBwYXRjaCBhZGRzICJz
aG93X3RhYnMiIGNvbW1hbmQgbGluZSBvcHRpb24gZm9yIEdUSyB1aSBzaW1pbGFyIHRvDQo+ICJn
cmFiX29uX2hvdmVyIi4gVGhpcyBvcHRpb24gYWxsb3dzIHRhYmJlZCB2aWV3IG1vZGUgdG8gbm90
IGhhdmUgdG8gYmUNCj4gZW5hYmxlZCBieSBoYW5kIGF0IGVhY2ggc3RhcnQgb2YgdGhlIFZNLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogRmVsaXggInhxIiBRdWVpw59uZXIgPHhxQHJhbmRvbS1wcm9q
ZWN0cy5uZXQ+DQoNClRoYW5rcyB5b3VyIHBhdGNoLCBidXQgcGxlYXNlIHVzZSB5b3VyIHJlYWwg
bmFtZSB0byBzaWduIGEgcGF0Y2guDQpGb3IgdGhlIGRldGFpbHM6DQpkb2NzL2RldmVsL3N1Ym1p
dHRpbmctYS1wYXRjaC5yc3QNCg0KVGhhbmtzDQpDaGVuDQoNCg0KPiAtLS0NCj4gIHFhcGkvdWku
anNvbiAgICB8IDUgKysrKy0NCj4gIHFlbXUtb3B0aW9ucy5oeCB8IDIgKy0NCj4gIHVpL2d0ay5j
ICAgICAgICB8IDQgKysrKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvcWFwaS91aS5qc29uIGIvcWFwaS91aS5q
c29uIGluZGV4IDQxMzM3MWQ1ZTguLjA0OWU3OTU3YTkgMTAwNjQ0DQo+IC0tLSBhL3FhcGkvdWku
anNvbg0KPiArKysgYi9xYXBpL3VpLmpzb24NCj4gQEAgLTExOTUsMTIgKzExOTUsMTUgQEANCj4g
ICMgICAgICAgICAgICAgICBhc3N1bWluZyB0aGUgZ3Vlc3Qgd2lsbCByZXNpemUgdGhlIGRpc3Bs
YXkgdG8gbWF0Y2gNCj4gICMgICAgICAgICAgICAgICB0aGUgd2luZG93IHNpemUgdGhlbi4gIE90
aGVyd2lzZSBpdCBkZWZhdWx0cyB0byAib2ZmIi4NCj4gICMgICAgICAgICAgICAgICBTaW5jZSAz
LjENCj4gKyMgQHNob3ctdGFiczogICBEaXNwbGF5cyB0aGUgdGFiIGl0ZW1zIGJ5IGRlZmF1bHQu
DQo+ICsjICAgICAgICAgICAgICAgU2luY2UgNy4xDQo+ICAjDQo+ICAjIFNpbmNlOiAyLjEyDQo+
ICAjIw0KPiAgeyAnc3RydWN0JyAgOiAnRGlzcGxheUdUSycsDQo+ICAgICdkYXRhJyAgICA6IHsg
JypncmFiLW9uLWhvdmVyJyA6ICdib29sJywNCj4gLSAgICAgICAgICAgICAgICAnKnpvb20tdG8t
Zml0JyAgIDogJ2Jvb2wnICB9IH0NCj4gKyAgICAgICAgICAgICAgICAnKnpvb20tdG8tZml0JyAg
IDogJ2Jvb2wnLA0KPiArICAgICAgICAgICAgICAgICcqc2hvdy10YWJzJyAgICAgOiAnYm9vbCcg
IH0gfQ0KPiANCj4gICMjDQo+ICAjIEBEaXNwbGF5RUdMSGVhZGxlc3M6DQo+IGRpZmYgLS1naXQg
YS9xZW11LW9wdGlvbnMuaHggYi9xZW11LW9wdGlvbnMuaHggaW5kZXgNCj4gMzc3ZDIyZmJkOC4u
MmIyNzlhZmZmNyAxMDA2NDQNCj4gLS0tIGEvcWVtdS1vcHRpb25zLmh4DQo+ICsrKyBiL3FlbXUt
b3B0aW9ucy5oeA0KPiBAQCAtMTkzNyw3ICsxOTM3LDcgQEAgREVGKCJkaXNwbGF5IiwgSEFTX0FS
RywgUUVNVV9PUFRJT05fZGlzcGxheSwNCj4gICAgICAiICAgICAgICAgICAgWyx3aW5kb3ctY2xv
c2U9b258b2ZmXVxuIg0KPiAgI2VuZGlmDQo+ICAjaWYgZGVmaW5lZChDT05GSUdfR1RLKQ0KPiAt
ICAgICItZGlzcGxheSBndGtbLGZ1bGwtc2NyZWVuPW9ufG9mZl1bLGdsPW9ufG9mZl1bLGdyYWIt
b24taG92ZXI9b258b2ZmXVxuIg0KPiArICAgICItZGlzcGxheSBndGtbLGZ1bGwtc2NyZWVuPW9u
fG9mZl1bLGdsPW9ufG9mZl1bLGdyYWItb24tDQo+IGhvdmVyPW9ufG9mZl1bLHNob3ctdGFicz1v
bnxvZmZdXG4iDQo+ICAgICAgIiAgICAgICAgICAgIFssc2hvdy1jdXJzb3I9b258b2ZmXVssd2lu
ZG93LWNsb3NlPW9ufG9mZl1cbiINCj4gICNlbmRpZg0KPiAgI2lmIGRlZmluZWQoQ09ORklHX1ZO
QykNCj4gZGlmZiAtLWdpdCBhL3VpL2d0ay5jIGIvdWkvZ3RrLmMNCj4gaW5kZXggMmE3OTFkZDJh
YS4uMTQ2N2I4YzdkNyAxMDA2NDQNCj4gLS0tIGEvdWkvZ3RrLmMNCj4gKysrIGIvdWkvZ3RrLmMN
Cj4gQEAgLTIzOTAsNiArMjM5MCwxMCBAQCBzdGF0aWMgdm9pZCBndGtfZGlzcGxheV9pbml0KERp
c3BsYXlTdGF0ZSAqZHMsDQo+IERpc3BsYXlPcHRpb25zICpvcHRzKQ0KPiAgICAgICAgICBvcHRz
LT51Lmd0ay5ncmFiX29uX2hvdmVyKSB7DQo+ICAgICAgICAgIGd0a19tZW51X2l0ZW1fYWN0aXZh
dGUoR1RLX01FTlVfSVRFTShzLT5ncmFiX29uX2hvdmVyX2l0ZW0pKTsNCj4gICAgICB9DQo+ICsg
ICAgaWYgKG9wdHMtPnUuZ3RrLmhhc19zaG93X3RhYnMgJiYNCj4gKyAgICAgICAgb3B0cy0+dS5n
dGsuc2hvd190YWJzKSB7DQo+ICsgICAgICAgIGd0a19tZW51X2l0ZW1fYWN0aXZhdGUoR1RLX01F
TlVfSVRFTShzLT5zaG93X3RhYnNfaXRlbSkpOw0KPiArICAgIH0NCj4gICAgICBnZF9jbGlwYm9h
cmRfaW5pdChzKTsNCj4gIH0NCj4gDQo+IC0tDQo+IDIuMzYuMQ0KPiANCg0K

