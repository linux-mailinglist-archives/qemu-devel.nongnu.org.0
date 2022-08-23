Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBB659CEA1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 04:33:57 +0200 (CEST)
Received: from localhost ([::1]:51148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQJjo-0002Yd-8O
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 22:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oQJfX-0008TN-8Y
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:29:31 -0400
Received: from mga03.intel.com ([134.134.136.65]:59823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1oQJfT-0000ya-9I
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 22:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661221767; x=1692757767;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mkhhp0tX1rj3NB+hZfcPRiUTGtnqpc4rviYPCrvhaw8=;
 b=SL9kBXSb8lrrcEk9pV1k/YBjR9OdgHV7P3mFVnQXIxvVsychf1E+H6wL
 VXfPORhs6xm1hhLKdeus6jTllo1KGG3porPTqAn8VEz+Q6t8M7Z24jUmN
 Z2S/ba0BMy8SUScbHFz1WTwCVPpc36mPRM07kO9SKuYhu8YjTEfbOOKTh
 Bhl1Fj2XCyDItIRa+wEEdOhBWUYqKA1OSlcx5lR+Vw8MowCmvnanmOMG3
 wlMpj5vlmTCPun+FOtKa4E31NcPoEvsi87SM03xxMsil4G5O668L9/TMj
 rVUrT9S77/GXSOoWAWO3bjb1S20TT5TsUV1q5KCaCHi4fCrmCUUTwNz/d A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="294855642"
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="294855642"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2022 19:29:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,256,1654585200"; d="scan'208";a="605504813"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 22 Aug 2022 19:29:23 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 22 Aug 2022 19:29:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 22 Aug 2022 19:29:23 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 22 Aug 2022 19:29:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YiKOKJ4vhingeWnaYdPRiDPPoY30xtfHZz1430YZv32bmXQ2gcmgdRA22hygX66C16FBkygTerK4yYkhQiMvPJ+JPLxmAux3m6zTPRcFSZac96Gur4r9XBTvCUtQdEg3r55GUJhSYialsaxI9piXN/ogdElYnIJ+rkVQw9U3fMlhhSkqFwx9gOeD7Xz6sKU+eHRBvbszrUT2XHgBdjQ+lZDtTTcXTjr23uJ6k6T365SnsZkCiU64f9LIXMn6uEV+cFL4h8g/yJF1G7TRp5Yo7BO8Y+iY7GsvfhrRFAQF7h4dGMHwqcA7GQFOnnBnyMAexWFkWTuS5e7A/Ul+0R8zEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkhhp0tX1rj3NB+hZfcPRiUTGtnqpc4rviYPCrvhaw8=;
 b=nbjs1Yv2ZNErQtGeYkQj+Vb68Y1R1Nf78MkA7TWNV9pWe0t3VrB0SNGC+ORZYoRk9n32e6UuRu9CWn17kRn9qYLF6Y94VbFd9Fbzw5oYRhZhzHr/3qFmBuEOM5Bslymj1oDjSbPpBEhllGj8P+/qtx0CMBZbte1KKnMmFCU4S/wma1mrAswme+wG6PydD6wfe6kHXlUtXD6MonfQelOctBkx9S6kdZaJATyrqchWaosbfz1FNzLEo91KrQ6jtcx7AcFQS4yMXIhDNgJ/0gBDfXH3PRxfH26HqDjKKlGtWxdGkeu1wfIymF8JbBUn/ooz9Eqbfn9psv+OWkbPzt1CDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR11MB0031.namprd11.prod.outlook.com (2603:10b6:301:69::37)
 by PH7PR11MB6746.namprd11.prod.outlook.com (2603:10b6:510:1b4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Tue, 23 Aug
 2022 02:29:21 +0000
Received: from MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee]) by MWHPR11MB0031.namprd11.prod.outlook.com
 ([fe80::e849:1316:6e38:6eee%7]) with mapi id 15.20.5546.024; Tue, 23 Aug 2022
 02:29:21 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: Jason Wang <jasowang@redhat.com>
CC: Peter Maydell <peter.maydell@linaro.org>, Li Zhijian
 <lizhijian@fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>
Subject: RE: [PATCH V5] net/colo.c: Fix the pointer issue reported by Coverity.
Thread-Topic: [PATCH V5] net/colo.c: Fix the pointer issue reported by
 Coverity.
Thread-Index: AQHYtgFbtH1wrhkfbEy92sB0+z1vMa27vNKAgAAHL5A=
Date: Tue, 23 Aug 2022 02:29:21 +0000
Message-ID: <MWHPR11MB00313A0B4CBC46ECC3E6BF3E9B709@MWHPR11MB0031.namprd11.prod.outlook.com>
References: <20220822081436.653555-1-chen.zhang@intel.com>
 <CACGkMEsnxOHsK-sq0xkXU9h9MaZBu31o9msc8gyrNtcyhJRLhA@mail.gmail.com>
In-Reply-To: <CACGkMEsnxOHsK-sq0xkXU9h9MaZBu31o9msc8gyrNtcyhJRLhA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ddca0d7-d05b-468f-f26f-08da84af4955
x-ms-traffictypediagnostic: PH7PR11MB6746:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: toQyKNxKY9+L+3UEM8lhF1jChMBBjHsZ2nEdwieszlbBeV5NL8EDRog6AuNACDRqO704UAIEEYSyN6ayfXMnflnW3ZxFDs1oq5LNgoudEZ2LXlG4EXpp8SBQOWE6Qg7AbbGb17YHYr9RGx4VbdDdmBfi3FsbzohAMuIV6IBjlUky3Bah2OjS0zscUXdvjYpt1e9ZgXKhRMFogJB8azYpqmnQSXo8cpgKSZZrGbOfGWYl+ObisHWtdvMlueLI0mqmwyI1MxltPqyKoHpu37Lu4XdHCH9ZRxgsS+/iaN9D7NTm5V4y6IIOvMsmanIkoGFeXPaKslfUtOlYkfyi5PKCT9VWOGF6v7KCWEaMsxSX2JCufU0wlUt8MsGljnqUZhsV7GP411NeE5bTUOYqGJQ1K9ZEkQRyp0rxno4HwJMpXZ2WCruFQB3T3CxCyEnCGWqGKXkkMC/ye5bjSq5ViE+MHSfA9iCfjkhlAX7GIp7gryJh2ZehC8LphY7/qgbRYsXEKzq8+eeolYsmRMpnwu2pFAzGVfToQJJdhRLgx12CaFn+9EHSt8gohhhwt7v6kBgtposJhGsVJ45xQ+Ax+02AKUkhxB7FvB4PEu5pQHhjoBvzgnCfSIruPOKk42T34jEW3YcYqbCEW52xr1Zvxg++fQ5dO8/ipQGW/J2yY75Qy1r9rLxToVpdCNLbyjiCqwd3vsfnI3CNkgl7iTXw1IOhsZ/hWKLjNoc3fFgVywQe8DhneiUptcAmOybnD9ZYG96R4jpn/4vcaeXqhWrEdIsX8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB0031.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(396003)(136003)(366004)(346002)(8676002)(66556008)(66946007)(86362001)(54906003)(82960400001)(76116006)(6916009)(71200400001)(38070700005)(41300700001)(55016003)(83380400001)(316002)(53546011)(9686003)(6506007)(7696005)(26005)(38100700002)(186003)(478600001)(122000001)(64756008)(33656002)(52536014)(2906002)(66446008)(8936002)(5660300002)(4326008)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dW1iSk4zaVg2YWdlTFFsNFlpMVZreHJWVkhiWXBmQmZDL2NaRXlCYmJVTmhk?=
 =?utf-8?B?d2NmSEh1UHZlN2hBZmc2bGlSU01WYkJyTkJrakIvd2JvMjY4d0NHY0F1Wmx4?=
 =?utf-8?B?TVQvUW84WHVIY3NxZENTbmlWR3dKdVBNQTI3TTYvT3hhaURKYWZ3YjZzbG1B?=
 =?utf-8?B?ZTRudWMyZllHQ3daSFV5QSt2K0lGN0xQeDEvSlZueW9kMUpkUlpIWVlEeTEz?=
 =?utf-8?B?ZGRZS1hOZTVnNDhSRzk3ZnRhbHozL3VkMklPem02SmF2T0xQQUt0citwKzUx?=
 =?utf-8?B?T2dQNmtCeVozWlhtN0dObldlV1VWRStqWmU5b2VUNWpNWWwyME9wRC9iRTA5?=
 =?utf-8?B?V3RDaUZZRmZWZEpZS0hqOVAveVRCMEFkQ0JTa1V0b1F4Z1ZCc2pDTUVXSVdM?=
 =?utf-8?B?WlBOSnRMazQ2eDdQUFNROG5rZndpZjJaVnlxY2h1aGxlZnJvVkVrVGZtOWhu?=
 =?utf-8?B?L095WC9tV3dMTDd2Tk1rSWlpQlMxWDBKc3BGcjBPL0hxdUF4ejRMRzlKNEJz?=
 =?utf-8?B?M2MrMVVSSGtSL2hmOVJINDBtMkpEV3lCS3ZUdkVRQ0lMVlhkTVJxTS9PdDEv?=
 =?utf-8?B?MmI4VHFUUEo0dUNDN2w1TmtYWE1BOGk3SUhtSG9LQ2YzbHhYckkxR3VSZlVU?=
 =?utf-8?B?N2VRYlBxOFBNYVY4N2lERnVXRU1wc2xzdzNxeEN6ZWRUSW0rbWtpK3Y3eFpZ?=
 =?utf-8?B?SlZhY3pyeUVGRGxweGtaaksvYXFyd0tTaDMyN0RmMXBMSnUvYjlaVmpVckVG?=
 =?utf-8?B?TEphQTRKYjI5eFdTdTJoMkhtU1orWkRXeFBjdTJFcUl5MEFtem82Q2owdXhx?=
 =?utf-8?B?TUd4N21oa3ZjUDNEM3lhZGZ1ZkROK2lyR0tGSURRRklaRC9VWndkQ3I0WDVF?=
 =?utf-8?B?bG5zeEN6Mlg2QXpiY1l0WFVNWjlRVTExRStnTmJ0ek1GbXE3OGVsQVIvalU0?=
 =?utf-8?B?RWlmSHRYdXl2bnNaeUtDT2Q1b1MzVDJ5U1ZwRmExcmlOMVYvYmppbWZiUHox?=
 =?utf-8?B?clk2MXZ2a0I2dTA2Qk9OOE9heUt6NXZ2cENxUi82QzhCcW43SndEQTJ6NzZ6?=
 =?utf-8?B?c0tTS2RqclZ5a0RCVk43SFYzLzM3dkFiRUlyT0NkRk9INTczSXVVSUJUTzQr?=
 =?utf-8?B?NVlKcHNxaGp0ZXdiQW05eGpIWnI1dWJrbHZTVTl6MU9wZUFvcmdnMGlUQldq?=
 =?utf-8?B?OUI0ejZRdHZzaS9aUUlpdEhwb1orUVl5SHFDZUkrdTU3V05HQlArSWZNdnQv?=
 =?utf-8?B?Q2RnNmZxdy9NbCtnV0NjdUNaZ2FKMDF0N0hBUGUxUW5BSGZOb3Z3Nm5PV2hU?=
 =?utf-8?B?eXNCTWF1MkxxTmlVMHhuV3ZtYlFxSmlibkR2RFd5Y2EwYkRONUY2U0h6dzBE?=
 =?utf-8?B?aVEyVmVZaW5ENEp6MnUxSDlZYjlpNjgvYlpEdGozVVRzbjBZcmlKRFFVQlR3?=
 =?utf-8?B?OVRqMjlLOGVEQnd2bEVENnlsdnRuV2RwdnQ4WmhQMm1BL1grUDRYZmFYNmtJ?=
 =?utf-8?B?cG5uUDVJMGdQTTd4QUZ0VGRIaHp4RkpzMFRxWUhnSDYxTndtaHF0Q0l4djNm?=
 =?utf-8?B?VC96UWhFTnpUSVkrRlBUSFduR3k5enFVcFBwRDlEK2R0ejVZZExjZVUzV3Ew?=
 =?utf-8?B?Sys5Z09PMHA2MEJCVGtlZWNJT2I1U1gycnNGNG9JaGNXc01oY2F5T2x1cG1R?=
 =?utf-8?B?V2JnbUtzdERFMDVqZEpDOFp1bWtpcmVwbURtb24xK3ZDWWpxdEdvQndaN1pE?=
 =?utf-8?B?Mmw1Tkhyb1QvU2FKZThHU1MrdFY5aEI1dzNoRkUzU0ZhTitXemJCSG82Zkli?=
 =?utf-8?B?cmhHYVBDcW5tQ3ZJcE5RU1d1Vzh5RFdhb25SL1VkVTJzeDBBZHhKNm93VDdN?=
 =?utf-8?B?OHNGNndJbnQ5M1dYZDZuVS9LYXloaXh1Z3Z0QjZUbjc1SkNFc1JVSkQ5VEE3?=
 =?utf-8?B?OVBUNVRKVDhPQlRxbmZ6QVhQWEZHeWpSMG44VHd6aXE5akUrajYzdlFWam1m?=
 =?utf-8?B?OC9wV24vWFZrUFdCb1hXL1lMN0ZYZ1k1V1dkZVozTzBoWUxkL1VVbnhFQzNV?=
 =?utf-8?B?NUk0aXIyRGZ5cWlaQk9jRUlpR1UrSEh0aCtham1vcDUxOTY1TlQrd01UdnlX?=
 =?utf-8?Q?NlNO823yif5tGAI0t21CICOHn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ddca0d7-d05b-468f-f26f-08da84af4955
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2022 02:29:21.0702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2IKaV+MhRleypAZdvBW7Aa7dn7mnus8lPbMrMvfBzrMyY0bXQP3mINaKVREJJk6sRCftJnG9Ro1ObTghg/mP7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6746
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.65; envelope-from=chen.zhang@intel.com;
 helo=mga03.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4NCj4gU2VudDogVHVlc2RheSwgQXVndXN0IDIzLCAyMDIyIDEwOjAz
IEFNDQo+IFRvOiBaaGFuZywgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IENjOiBQZXRl
ciBNYXlkZWxsIDxwZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+OyBMaSBaaGlqaWFuDQo+IDxsaXpo
aWppYW5AZnVqaXRzdS5jb20+OyBxZW11LWRldiA8cWVtdS1kZXZlbEBub25nbnUub3JnPg0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFY1XSBuZXQvY29sby5jOiBGaXggdGhlIHBvaW50ZXIgaXNzdWUg
cmVwb3J0ZWQgYnkgQ292ZXJpdHkuDQo+IA0KPiBPbiBNb24sIEF1ZyAyMiwgMjAyMiBhdCA0OjI5
IFBNIFpoYW5nIENoZW4gPGNoZW4uemhhbmdAaW50ZWwuY29tPiB3cm90ZToNCj4gPg0KPiA+IFdo
ZW4gZW5hYmxlZCB0aGUgdmlydGlvLW5ldC1wY2ksIGd1ZXN0IG5ldHdvcmsgcGFja2V0IHdpbGwg
bG9hZCB0aGUNCj4gPiB2bmV0X2hkci4gSW4gQ09MTyBzdGF0dXMsIHRoZSBwcmltYXJ5IFZNJ3Mg
bmV0d29yayBwYWNrZXQgbWF5YmUNCj4gPiByZWRpcmVjdCB0byBhbm90aGVyIFZNLCBpdCBuZWVk
cyBmaWx0ZXItcmVkaXJlY3QgZW5hYmxlIHRoZSB2bmV0X2hkcg0KPiA+IGZsYWcgYXQgdGhlIHNh
bWUgdGltZSwgQ09MTy1wcm94eSB3aWxsIGNvcnJlY3RseSBwYXJzZSB0aGUgb3JpZ2luYWwNCj4g
PiBuZXR3b3JrIHBhY2tldC4gSWYgaGF2ZSBhbnkgbWlzY29uZmlndXJhdGlvbiBoZXJlLCB0aGUg
dm5ldF9oZHJfbGVuIGlzDQo+ID4gd3JvbmcgZm9yIHBhcnNlIHRoZSBwYWNrZXQsIHRoZSBkYXRh
K29mZnNldCB3aWxsIHBvaW50IHRvIHdyb25nIHBsYWNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogWmhhbmcgQ2hlbiA8Y2hlbi56aGFuZ0BpbnRlbC5jb20+DQo+IA0KPiBOb3Qgc3VyZSBpdCdz
IHdvcnRoIDcuMS4gU28gSSBxdWV1ZWQgdGhpcyBmb3IgNy4yLg0KDQpJdCdzIGZpbmUgZm9yIG1l
Lg0KDQpUaGFua3MNCkNoZW4NCg0KPiANCj4gVGhhbmtzDQo+IA0KPiA+IC0tLQ0KPiA+ICBuZXQv
Y29sby5jICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiA+ICBuZXQvY29s
by5oICAgICAgIHwgIDEgKw0KPiA+ICBuZXQvdHJhY2UtZXZlbnRzIHwgIDIgKy0NCj4gPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+
IGRpZmYgLS1naXQgYS9uZXQvY29sby5jIGIvbmV0L2NvbG8uYw0KPiA+IGluZGV4IDZiMGZmNTYy
YWQuLmZiMmMzNmEwMjYgMTAwNjQ0DQo+ID4gLS0tIGEvbmV0L2NvbG8uYw0KPiA+ICsrKyBiL25l
dC9jb2xvLmMNCj4gPiBAQCAtNDQsMjEgKzQ0LDI4IEBAIGludCBwYXJzZV9wYWNrZXRfZWFybHko
UGFja2V0ICpwa3QpICB7DQo+ID4gICAgICBpbnQgbmV0d29ya19sZW5ndGg7DQo+ID4gICAgICBz
dGF0aWMgY29uc3QgdWludDhfdCB2bGFuW10gPSB7MHg4MSwgMHgwMH07DQo+ID4gLSAgICB1aW50
OF90ICpkYXRhID0gcGt0LT5kYXRhICsgcGt0LT52bmV0X2hkcl9sZW47DQo+ID4gKyAgICB1aW50
OF90ICpkYXRhID0gcGt0LT5kYXRhOw0KPiA+ICAgICAgdWludDE2X3QgbDNfcHJvdG87DQo+ID4g
ICAgICBzc2l6ZV90IGwyaGRyX2xlbjsNCj4gPg0KPiA+IC0gICAgaWYgKGRhdGEgPT0gTlVMTCkg
ew0KPiA+IC0gICAgICAgIHRyYWNlX2NvbG9fcHJveHlfbWFpbl92bmV0X2luZm8oIlRoaXMgcGFj
a2V0IGlzIG5vdCBwYXJzZWQgY29ycmVjdGx5LCAiDQo+ID4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAicGt0LT52bmV0X2hkcl9sZW4iLCBwa3QtPnZuZXRfaGRyX2xl
bik7DQo+ID4gKyAgICBhc3NlcnQoZGF0YSk7DQo+ID4gKw0KPiA+ICsgICAgLyogQ2hlY2sgdGhl
IHJlY2VpdmVkIHZuZXRfaGRyX2xlbiB0aGVuIGFkZCB0aGUgb2Zmc2V0ICovDQo+ID4gKyAgICBp
ZiAoKHBrdC0+dm5ldF9oZHJfbGVuID4gc2l6ZW9mKHN0cnVjdCB2aXJ0aW9fbmV0X2hkcl92MV9o
YXNoKSkgfHwNCj4gPiArICAgICAgICAocGt0LT5zaXplIDwgc2l6ZW9mKHN0cnVjdCBldGhfaGVh
ZGVyKSArIHNpemVvZihzdHJ1Y3Qgdmxhbl9oZWFkZXIpICsNCj4gPiArICAgICAgICBwa3QtPnZu
ZXRfaGRyX2xlbikpIHsNCj4gPiArICAgICAgICAvKg0KPiA+ICsgICAgICAgICAqIFRoZSByZWNl
aXZlZCByZW1vdGUgcGFja2V0IG1heWJlIG1pc2NvbmZpZ3VyYXRpb24gaGVyZSwNCj4gPiArICAg
ICAgICAgKiBQbGVhc2UgZW5hYmxlL2Rpc2FibGUgZmlsdGVyIG1vZHVsZSdzIHRoZSB2bmV0X2hk
ciBmbGFnIGF0DQo+ID4gKyAgICAgICAgICogdGhlIHNhbWUgdGltZS4NCj4gPiArICAgICAgICAg
Ki8NCj4gPiArICAgICAgICB0cmFjZV9jb2xvX3Byb3h5X21haW5fdm5ldF9pbmZvKCJUaGlzIHJl
Y2VpdmVkIHBhY2tldCBsb2FkIHdyb25nICIsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBwa3QtPnZuZXRfaGRyX2xlbiwNCj4gPiArIHBrdC0+c2l6ZSk7DQo+
ID4gICAgICAgICAgcmV0dXJuIDE7DQo+ID4gICAgICB9DQo+ID4gLSAgICBsMmhkcl9sZW4gPSBl
dGhfZ2V0X2wyX2hkcl9sZW5ndGgoZGF0YSk7DQo+ID4gKyAgICBkYXRhICs9IHBrdC0+dm5ldF9o
ZHJfbGVuOw0KPiA+DQo+ID4gLSAgICBpZiAocGt0LT5zaXplIDwgRVRIX0hMRU4gKyBwa3QtPnZu
ZXRfaGRyX2xlbikgew0KPiA+IC0gICAgICAgIHRyYWNlX2NvbG9fcHJveHlfbWFpbigicGt0LT5z
aXplIDwgRVRIX0hMRU4iKTsNCj4gPiAtICAgICAgICByZXR1cm4gMTsNCj4gPiAtICAgIH0NCj4g
PiArICAgIGwyaGRyX2xlbiA9IGV0aF9nZXRfbDJfaGRyX2xlbmd0aChkYXRhKTsNCj4gPg0KPiA+
ICAgICAgLyoNCj4gPiAgICAgICAqIFRPRE86IHN1cHBvcnQgdmxhbi4NCj4gPiBkaWZmIC0tZ2l0
IGEvbmV0L2NvbG8uaCBiL25ldC9jb2xvLmgNCj4gPiBpbmRleCA4YjNlOGQ1YTgzLi4yMmZjMzAz
MWY3IDEwMDY0NA0KPiA+IC0tLSBhL25ldC9jb2xvLmgNCj4gPiArKysgYi9uZXQvY29sby5oDQo+
ID4gQEAgLTE4LDYgKzE4LDcgQEANCj4gPiAgI2luY2x1ZGUgInFlbXUvamhhc2guaCINCj4gPiAg
I2luY2x1ZGUgInFlbXUvdGltZXIuaCINCj4gPiAgI2luY2x1ZGUgIm5ldC9ldGguaCINCj4gPiAr
I2luY2x1ZGUgInN0YW5kYXJkLWhlYWRlcnMvbGludXgvdmlydGlvX25ldC5oIg0KPiA+DQo+ID4g
ICNkZWZpbmUgSEFTSFRBQkxFX01BWF9TSVpFIDE2Mzg0DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEv
bmV0L3RyYWNlLWV2ZW50cyBiL25ldC90cmFjZS1ldmVudHMgaW5kZXgNCj4gPiA2YWY5MjdiNGI5
Li44MjNhMDcxYmRjIDEwMDY0NA0KPiA+IC0tLSBhL25ldC90cmFjZS1ldmVudHMNCj4gPiArKysg
Yi9uZXQvdHJhY2UtZXZlbnRzDQo+ID4gQEAgLTksNyArOSw3IEBAIHZob3N0X3VzZXJfZXZlbnQo
Y29uc3QgY2hhciAqY2hyLCBpbnQgZXZlbnQpICJjaHI6ICVzIGdvdA0KPiBldmVudDogJWQiDQo+
ID4NCj4gPiAgIyBjb2xvLmMNCj4gPiAgY29sb19wcm94eV9tYWluKGNvbnN0IGNoYXIgKmNocikg
IjogJXMiDQo+ID4gLWNvbG9fcHJveHlfbWFpbl92bmV0X2luZm8oY29uc3QgY2hhciAqc3RhLCBp
bnQgc2l6ZSkgIjogJXMgPSAlZCINCj4gPiArY29sb19wcm94eV9tYWluX3ZuZXRfaW5mbyhjb25z
dCBjaGFyICpzdGEsIHVpbnQzMl90IHZuZXRfaGRyLCBpbnQgc2l6ZSkNCj4gIjogJXMgcGt0LT52
bmV0X2hkcl9sZW4gPSAldSwgcGt0LT5zaXplID0gJWQiDQo+ID4NCj4gPiAgIyBjb2xvLWNvbXBh
cmUuYw0KPiA+ICBjb2xvX2NvbXBhcmVfbWFpbihjb25zdCBjaGFyICpjaHIpICI6ICVzIg0KPiA+
IC0tDQo+ID4gMi4yNS4xDQo+ID4NCg0K

