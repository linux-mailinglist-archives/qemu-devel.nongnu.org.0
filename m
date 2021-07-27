Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D890C3D7C12
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:22:52 +0200 (CEST)
Received: from localhost ([::1]:51394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8Qn5-0001I1-U7
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:22:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m8Qm0-0000Uo-0E
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:21:44 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:43110)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1m8Qlx-0001pH-7v
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:21:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1627406501; x=1628011301;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Hf0W+ZS/jX5zwmr4SxtONnfN77WipoCkkSTQXWwDeI=;
 b=CCOz2i0Xf1nRTlaB54wJUlt7yYs+TH9eQ76y4PzqLIYyNHJQYqkcCxEv
 p6H10xHsPRHz+vx2Kt8s1sHMK8W14MPN1IRzkMNZO1pg69EZw/i3YDHk7
 kLtbUYJB6xd+MVEiSq+3KJ/efaWKi0DefiiwY4Kdgvho5St5/2yfxm1uk s=;
Received: from mail-dm6nam10lp2100.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.100])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 17:21:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E+d8rhBbyQssk7nl0fQEu+RdXQaIEvVbK2vG8GfGFcfl+LTvOkii4YcgmdWFlEIraburxjA3Q+i9bByN3nTs2VGtKIlPuSpT+V/v4vNdGlA9KWY1UD87RWUGN0xHYG69uKuupC2bq4hFpT0P0LiiHtOFPmzqFsUn6XqpQK6bJ8uKRhW8KwMZF49oFF+juz+SYh0gbVDxitLvGjA1v7aQAl3HUcmxQjRpIJU8CbtvgEgDG/ZrVSpg0OaKnkLKG/d30DdtMgjBvh45vG/7PIn4OwRH6py/kroGPaHiCVZUgTKAZ25NceVeShDsFjUS0w2SzcZKla+mlt6cJjJe0ZzQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Hf0W+ZS/jX5zwmr4SxtONnfN77WipoCkkSTQXWwDeI=;
 b=avkRrkM5QPMrffzYJ6jux6gor2PT6UXhxQiL7eOa+2lCgieA0beCHhVEMh2ytSaaMh4ozErC/fmW82xZ+67aSv7hT8F5y5Ut8WxWTXu6AoYgzw+Unm/0+3SMBebXwk4rq8CcY02olkQZbghK0lwe/H42VT/BHrjaO3ESeSf61f3uZxecMuuA5IBn3rXSZQNtlVZ3q/klp2mAmnvaJuLLjMNETuXumO3aB9p2AoZIBI4bgqhxHK2vrPnGUPzTefo0hUlV58ioSjInnDj3ByhWP9vn4/aYi00LHayw+NmqEYlY5APFRgoWLi5LX4K7NmmqkUjhpFrmtLQZDFguVA5mwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by SJ0PR02MB7711.namprd02.prod.outlook.com (2603:10b6:a03:326::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 17:21:33 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 17:21:33 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 02/20] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
Thread-Topic: [PATCH 02/20] Hexagon HVX (target/hexagon) add Hexagon Vector
 eXtensions (HVX) to core
Thread-Index: AQHXcfZYpSSqEe5fDUGe1KlX9n47JKtTyEuAgACQ1ZCAAtkIoA==
Date: Tue, 27 Jul 2021 17:21:32 +0000
Message-ID: <BYAPR02MB488686EDAF41E10629B2E569DEE99@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1625528074-19440-1-git-send-email-tsimpson@quicinc.com>
 <1625528074-19440-3-git-send-email-tsimpson@quicinc.com>
 <9d5e6225-4ffa-d394-17b9-518c58842186@linaro.org>
 <BYAPR02MB4886FB40A259261C7E10A2EBDEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4886FB40A259261C7E10A2EBDEE89@BYAPR02MB4886.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 03cfdbfc-14e0-4b15-dca0-08d95122faf6
x-ms-traffictypediagnostic: SJ0PR02MB7711:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7711D145904565BCD6EE1F71DEE99@SJ0PR02MB7711.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ncUXX2Po7WrUK3lEzR5zC2DmNZsbym/rT+cmZC4FMUQ3nAO0takZiiQlefd7nCoxMA/9J23Ldh3oXx9VIQp33Dl1iyE8WdevJ/EJWNjQ2ooKhlIEB0Jg96u0+HmNxOFwoQVsrqeJebb0H1qZLRL3aIab3IOP12kNAE/f0kft6YsOtsYAXZL/jHG6Jj1YZxJydm4TDh4rFiTaaAFyfQyLi3IsNiM2AbpHjPYmGCPx8/S39Heqsu/fDYNtrJufqgUc/G/iqHdWEcsItzAGLo8diZasbe3h1J9E1uWUG2aPuOyY+RiV3hZgfvZdosucK8PpbrlbUwPsiTRrzW+4IEEDgaz3AVmlzFrxTq35An4ivUAgzQxS+yClAYK9DSiJ56pFmfXw+Xg7JsgE5N9UiExmpEEAgLsWqBEu1h1/NWc64V2cnoEbVOeeWucwR0XC8vp/8+qu/ttg3+MdKb7M7tQhiwY5hvOzLwtc0xSkQDY1f4V3lO6h7jTxRHqVlmcpnkS3CglUKMZsbhV/W5t3msFuSlXb9Ut2cMoJS+N5nC53SmKJEXfF9nuz8KH/qyx88UYg6wM55xaVDJ8Sasmo0fKJOyEULVCBBROAKauT6spRZ+Wrb6xP+RBcqwWNtDouwGdgw+26PWbrqShmRqGX9wf7D8rGi2buhc3MyddEkfQHjvTTmZL5eu2POk+PDNYBXHTvIQyYgMf8SIkCKpxCiChIrQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(39860400002)(346002)(376002)(186003)(26005)(55016002)(8936002)(122000001)(478600001)(66946007)(33656002)(6506007)(66476007)(66446008)(316002)(54906003)(53546011)(8676002)(110136005)(9686003)(83380400001)(76116006)(52536014)(7696005)(38100700002)(66556008)(64756008)(86362001)(4326008)(2906002)(5660300002)(71200400001)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1dDTmRMNlJiU0NnT25uWWJwSmNiZlFTaW8rRGVWZy9RUTg1ejRZdEVua2RS?=
 =?utf-8?B?aEg3MDlMVTZCWHZHUDYzRzV6VEVlR3h1a2pEYnNYMmdIZ2JtcXJXMkttVlNX?=
 =?utf-8?B?UFlXUUxUZlJMcStZdUxFSUhtVU1xdG45TVZWV0xYYzBhbkQzOTVXYVdpOGtj?=
 =?utf-8?B?K1NZNCtzOTNOYzlnaFZub0RrTkVpRHFRcHFnODdjTEVJWDQ5cE1vWEQ1bFBx?=
 =?utf-8?B?c1ZnU2NvSmxWMlV5MmRwSUVYdzNvOXNDQ0NQQXphdWMxc3VhTzF0TmovYVRG?=
 =?utf-8?B?aVdmZ1pCUmVZR2ZFOFlRUm1JOHRWUGNpdjJLWFZpQ1JOeDJOWW5QMjd3U0dp?=
 =?utf-8?B?aDNPTmd3clQrS3NWS2loMGlGSTVXZmkvTHZlS0JqcmZUWmhzRkhIVFdJalpR?=
 =?utf-8?B?OEhrV2tvRFhPTTRaSjRWVURoZHQ5dzk4bUN6Q2wxRE1TTFZSWlU3RUZqdEpm?=
 =?utf-8?B?OGkzUHNna1RkazRLMXlpU1hoTy9PcXN5QmZuRVB2RDV5RTd5ME9yZjZuY3Uw?=
 =?utf-8?B?U1dIY2RWK3RPWDRicCtwdGZsUldSL2dFbXMrdGZqdzJhL0t4MjRhUUw4NHhO?=
 =?utf-8?B?Z3llSzE0WnNZOFkvRU9kV3ZLdEt3d2ZoSDl0T051QUdWc1FwWE1nTjgvVjlI?=
 =?utf-8?B?amY3TDB0QXR0Qk5oRkJCUW1HbHRGeVMra0poZXNFdjFuYlhNMy9mbkhkQWpU?=
 =?utf-8?B?bVN5TnJkZDNDaUNmaGJWRjdjVFk5NGd6V1ppeXVwTm5tZytScnlaeHFwcUll?=
 =?utf-8?B?T0t0ZzBidTNINCtBNStUSDZxU2tHLzVWOGhxY3d6NlFUdk5zZ1dZc3BJU3VU?=
 =?utf-8?B?TlkxUEk0WFlMQUVocXJoK3FUdmVYZTg4dFpJRXc3QWJoLzlzWEI1QjJ3eHJ3?=
 =?utf-8?B?eDUyWGJDUTZPaDY0c0luZ0tmV1hiQmkxNmRDc3hDcWJkUXg5RTBnV1o2Ulhy?=
 =?utf-8?B?VFRpVnBPT1dvNk1sMEloM2dPYzJSYWxJa1c5aktwbXg5bW4xRTFqSzczMlhy?=
 =?utf-8?B?REZHSjMzOEcvZVloeTBaUHRXQlN1LytLbnFEZXFMTm9vTm50N002dXl4NUZi?=
 =?utf-8?B?U2NONnNmVlRoWWRuaU9kVU9wUXZxVXROZ2FZWFBXNlQvSVd6azhVUmVBTlFk?=
 =?utf-8?B?RmJka0x5L1ZhbHl6bHcvY3hRV2wyMHBSdlVpd3J2NXhmVXp5TGNCOEZLc2VW?=
 =?utf-8?B?WkJkdmJ6WGJ5a2dNQWxnUENpYmdjMGZsNHd1M2NObFF4Wkpkd0M3TkRMM1VK?=
 =?utf-8?B?QmVQMktWemgvdVVNdnRBSjM0dUVSS1A0YnJpMEVTbkVtaUoydFZSbUxTVm43?=
 =?utf-8?B?M3ZwME45amJZZXFrbW56dUxxMlh5dldSNWVVVG5BUUIyaEZLcXBOTkErdDhU?=
 =?utf-8?B?dTlJaCtkV1FXTmJKTUJNcmhtNk9ZY0xTVzVKSUZ6Wk9WcnFjRG1xd3FJS3B6?=
 =?utf-8?B?Mk5Lb3VHVnA0Y2dBaWpDanc2aEtYQVg3YlhaSmRITlgvS1lHQkQxbUdMdCt4?=
 =?utf-8?B?SGJMNjJwUjhRR1haWFpqWlI5cUJJK0k0N3lxNWRIakhZNDR2ZS9IOEZYaUZJ?=
 =?utf-8?B?WGIzZ2pOUjBCVkZLb0h6VVVkbXgwbkNoTTlvdE84QzZEWUpWKy9vS1c3V2gz?=
 =?utf-8?B?S3R3cUw3U0dUTDhYL2Y5UThiSkJuM1paRWc1UmlzOFVzQnhJcFJRc1VFNkVB?=
 =?utf-8?B?L2lYekZWbnRYSXJKeW05WmswQnVhZW4zZjk3T0s0UDBMWWZmLzU4L1diS0t1?=
 =?utf-8?Q?NXej0NlPiGefvc/pO94jiqegdC8fGRoh+chyoel?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03cfdbfc-14e0-4b15-dca0-08d95122faf6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2021 17:21:32.9107 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f18H4l9lNL0mZBNJlqxpQvE/vP9TvorbPQ3ciMwU1mTtUzMkdnv/WhymNqd8reoqgurQaJjpb5n7DW2kgej4DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7711
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGF5bG9yIFNpbXBzb24N
Cj4gU2VudDogU3VuZGF5LCBKdWx5IDI1LCAyMDIxIDEwOjAyIFBNDQo+IFRvOiBSaWNoYXJkIEhl
bmRlcnNvbiA8cmljaGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZz47IHFlbXUtDQo+IGRldmVsQG5v
bmdudS5vcmcNCj4gQ2M6IHBoaWxtZEByZWRoYXQuY29tOyBhbGVAcmV2Lm5nOyBCcmlhbiBDYWlu
IDxiY2FpbkBxdWljaW5jLmNvbT47DQo+IHBldGVyLm1heWRlbGxAbGluYXJvLm9yZw0KPiBTdWJq
ZWN0OiBSRTogW1BBVENIIDAyLzIwXSBIZXhhZ29uIEhWWCAodGFyZ2V0L2hleGFnb24pIGFkZCBI
ZXhhZ29uDQo+IFZlY3RvciBlWHRlbnNpb25zIChIVlgpIHRvIGNvcmUNCj4gDQo+IA0KPiANCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IFJpY2hhcmQgSGVuZGVyc29u
IDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KPiA+IFNlbnQ6IFN1bmRheSwgSnVseSAy
NSwgMjAyMSA4OjA4IEFNDQo+ID4gVG86IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5j
LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZw0KPiA+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+Ow0KPiA+IHBldGVyLm1h
eWRlbGxAbGluYXJvLm9yZw0KPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMDIvMjBdIEhleGFnb24g
SFZYICh0YXJnZXQvaGV4YWdvbikgYWRkIEhleGFnb24NCj4gPiBWZWN0b3IgZVh0ZW5zaW9ucyAo
SFZYKSB0byBjb3JlDQo+ID4NCg0KDQo+ID4gPiArICAgIC8qIFRlbXBvcmFyaWVzIHVzZWQgd2l0
aGluIGluc3RydWN0aW9ucyAqLw0KPiA+ID4gKyAgICBNTVZlY3RvciB6ZXJvX3ZlY3RvciBRRU1V
X0FMSUdORUQoMTYpOw0KPiA+DQo+ID4gWW91IG11c3QgYmUgZG9pbmcgc29tZXRoaW5nIHdyb25n
IHRvIG5lZWQgemVybyBpbiBtZW1vcnkuDQo+IA0KPiBUaGUgYXJjaGl0ZWN0dXJlIHNwZWNpZmll
cyB0aGF0IGlmIHlvdSB1c2UgYSAubmV3IGluIGEgcGFja2V0IHdoZXJlIHRoZSB2ZWN0b3INCj4g
cmVnaXN0ZXIgaXNuJ3QgIGRlZmluZWQsIGl0IGdldHMgemVyby4gIFNvLCB0aGUgZ2VuZXJhdG9y
IHByb2R1Y2VzIHRoZSBmb2xsb3dpbmcNCj4gZm9yIC5uZXcgcmVmZXJlbmNlcw0KPiAgICAgY29u
c3QgaW50cHRyX3QgT3NOX29mZiA9DQo+ICAgICAgICAgdGVzdF9iaXQoT3NOX251bSwgY3R4LT52
cmVnc191cGRhdGVkKQ0KPiAgICAgICAgICAgICA/IG9mZnNldG9mKENQVUhleGFnb25TdGF0ZSwg
ZnV0dXJlX1ZSZWdzW09zTl9udW1dKQ0KPiAgICAgICAgICAgICA6IG9mZnNldG9mKENQVUhleGFn
b25TdGF0ZSwgemVyb192ZWN0b3IpOw0KDQpDb3JyZWN0aW9uIC0gdGhlIGFyY2hpdGVjdHVyZSBk
b2VzIE5PVCBhbGxvdyBhIC5uZXcgd2hlcmUgdGhlIHZlY3RvciByZWdpc3RlciBpc24ndCBkZWZp
bmVkLg0KDQpUaGlzIGNvZGUgaXMgYmVpbmcgb3Zlcmx5IGNhdXRpb3VzLCBzbyBJJ2xsIGNoYW5n
ZSBpdCB0byBhbHdheXMgcmV0dXJuIGZ1dHVyZV9WUmVncyBhbmQgcmVtb3ZlIHplcm9fdmVjdG9y
IGZyb20gQ1BVSGV4YWdvblN0YXRlLg0KDQpUaGFua3MsDQpUYXlsb3INCg0KDQoNCg==

