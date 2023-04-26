Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54BE56EF482
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:42:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preTj-0005j9-IW; Wed, 26 Apr 2023 08:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preTd-0005i8-Ox
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:42:29 -0400
Received: from mail-db5eur01on2090.outbound.protection.outlook.com
 ([40.107.15.90] helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preTc-00026L-6v
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:42:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Quvm5GTTppYtTyxwVDyJgAr4YU5skMqJusFynqEYbLtm5EOTrCFyigarbxzvTH7vT+mIZp+cmqy9KXXKUy5k3HNd6lmVFK7iJ3shS2KSEjA0JG8v6C1qu5JF0SdM5oVCUM/teQb9mfPB/hhG37Trr8sZuacCjkJBOHKE8b1xFEZ3dUiBiMWfC+tSWPgV5X+wgQNCVZMjese0F8rTsu/zKL13dbzLZjRqDKIXg4hOgEeCVng0gInNkDf7f/RQiGF7874hWoT5vbPQ1whhGnglgE02fUJkMyO70fd20+w1d1xFuuo1+Ni+K8uOTiIxpicaVR+8z1xdd+uPRmAhQsUfQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rS8mE5GFybkXMMl++1oqnr6bK6qLhmp6vpjM7dSzUwg=;
 b=aJCR8iUCHqr2GqbQo8APm0nZhz72ztWxDwQe7hhPKe4uHQUJ03K6VtIAjX8EoDlvPvsmH+ykI2N1ENp4YwTE+eanpUAif/MYZwjLbt4W84/JbsU2YqdMBZhTDyvBjbQ0f9TXQrHW7pnk+a+ff9tYU2AeiHmvZv9xgTSdfwc/014D6wtyv502KY4f4Swhi0ySYmrOWBLwWsr7TU+AAWFW/Xk7Tk+DCN1bt2pYoX/Obpjw8NkouQ661Q4DhEpVwSO00dkXX4CYb89gbGd/n3AKooymTzpoIm8bXlIHtog8sdsT0TDm1OZQ4Vmf2IFVigdzVIyrkDvB2y/AwXVnTWbuNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rS8mE5GFybkXMMl++1oqnr6bK6qLhmp6vpjM7dSzUwg=;
 b=ALpHSNIjsfpG77PczQEisRart9ff+TkQIbD58o/xAJA5u1DGc4bLxRRSNxHaxy4eS4euGNSfchColgOMrru47FhGnNYCGcL0jF/5c359eOlUcwFrOo1o8gzInw+WUREPisVmUnzw7pzSktPdn+/88vaoST+4dwYwhMvrLT9OB3s=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS8P189MB2530.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:635::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:37:23 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 12:37:22 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Tomasz Dzieciol
 <t.dzieciol@partner.samsung.com>
Subject: RE: [PATCH v4 27/48] igb: Clear EICR bits for delayed MSI-X interrupts
Thread-Topic: [PATCH v4 27/48] igb: Clear EICR bits for delayed MSI-X
 interrupts
Thread-Index: AQHZeCtRW0zmAMNqp0qe9XV711wiEK89h0gQ
Date: Wed, 26 Apr 2023 12:37:22 +0000
Message-ID: <DBBP189MB143365630AF67A328E21454D95659@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
 <20230426103716.26279-28-akihiko.odaki@daynix.com>
In-Reply-To: <20230426103716.26279-28-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS8P189MB2530:EE_
x-ms-office365-filtering-correlation-id: ecb1b495-3d67-4b91-dee6-08db4652fbc1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tvqWQZd4gt0Nhhs2b86OPE4pRqoUiK8NFRfEQMhnwQiOMUIwKeuqsoPA9R5foNXWPBLf5hhXEhfY8ZhTDNfsEcxVaPWwDgngpfbeZN9X+IhnMsmBLkORnzEFxiEMHI3RTLRq4iAsBq8EEtSL6YuB2Rr10+H+gU7cUwDvW5ls2yIvK654XQdxQ/PHsx4NpcwH31gOIka3+ADwDADwNPid3RGaZ8jC/w9eMp9mNC7MAZlyIu9W8SS1XyArjayoCh7UGTQ7uUq5Fy7gG6UJtv09Tp1iIQGMsoA+otKyZdCa8s394DwU1FZFj6Gf/HMtY3fDd5ckjbOlJvLchgg60E1Tmfv8FPLt33OGYDz3QqUyHqVQ3DkblSAVc0eevlZxt1cQN0DYYcomA+VrpGTD5h0nBKxiWoaGKF6LI4IcpGPuSjEXYYBYtKwtTxwaa3ytzAMfE+nRSYF1e7Ov3TrlU19nRnIWu8qHMhJ0dAt4BElfhnMf8Ws73JoHczM+yy69HS9/CWgvMC7917ke4zoZ8ToiLBBLjwIhWbTUuCUtfRK9o0uUbLxkg3QRPKUEay15tBwQGlQjJAYVqxV0iX0KBO3s56H1n5SHK7u5DwLytxhSdkuBIwETypDB8bEdx2pHx2+s
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39840400004)(346002)(366004)(136003)(451199021)(38070700005)(33656002)(5660300002)(6916009)(316002)(4326008)(83380400001)(64756008)(4744005)(54906003)(186003)(2906002)(478600001)(9686003)(26005)(6506007)(7696005)(71200400001)(41300700001)(122000001)(8676002)(8936002)(38100700002)(7416002)(55016003)(86362001)(76116006)(44832011)(52536014)(66446008)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDUxeWRXa2F4N1JtcDd4eFBONWU5dmwvbTFBUkRvWU91Sm1UQTBUL1EyV1hN?=
 =?utf-8?B?Q2UvY2xNalcyZnpOMWxuR1pLN0xBRlJFclU0YjdJaU4zTHBqN2oxOWpTa2Z0?=
 =?utf-8?B?cExXM29OMElsL1hhQTJjM2Ywb2xSZVgrNFRqYzl3VEMzT29JWnNXMnZDVk1U?=
 =?utf-8?B?N0dFcWp6YTRGVWpldmhhdzBzeFkzK1F6UHJJQlc5dWdGK3Y1emtxalhJZG5Y?=
 =?utf-8?B?T2s1QnlFVm9FMkpadnJSK1R0RjIwNjN4OVNWN1VMOWJOZy95SW0zdWxBRUh4?=
 =?utf-8?B?MStVNXBXc0FLVnlLSTlXbkI4M1N3NjBZOFkvS3VVUlVBbjZCVDhRUkFKUTJZ?=
 =?utf-8?B?bmttTFBEbU1KSld0LzYySmhFMEM5amRJOGRSczhPVFd0c1lzSmw4YUJhcHUw?=
 =?utf-8?B?MXJ3ckhGYlREdDNxQndvNUo5UUYyRS9OeHNVb2RTNk5UL1RORTNVamg3dUFC?=
 =?utf-8?B?SVQxU2ZBOW5SVzFLVUtJMUs1MGpwWElmajczVytROGE2NERFMVk2QUw0dS9a?=
 =?utf-8?B?Y25nVjc0ZE1Rd0R2bkZFOWgwUE1vSS9talk5dEgwRWp1VHFRdm96cHJoV2Q3?=
 =?utf-8?B?ZzBreWs5VWxNRXgxTnhhcmRoczlaalRQNnY5THhHMGJST0JPTGl1TitHWXBK?=
 =?utf-8?B?WXBwT3MxUXNUOS9mdDJURUhLa05GU1RjWkM5UzY1RkljSXoyZmRFMGtlZUJw?=
 =?utf-8?B?bFNpdy9MRXgwNUV6S2liQUZOYWtmUDIwd3ZJdGVvS2tweG1VNUtqNkt0MGhU?=
 =?utf-8?B?VStRV0xZUlpzUzd6NlFtQWNBaW93c1Z0YVJwNURrbUVWaFIyNnRVOVIzRUd6?=
 =?utf-8?B?NUF6L1c5aE44Z3NkMTlqWGNMRHQvMm1EQ3RmR2VvRHo5b1FwK1lVMUtYbm50?=
 =?utf-8?B?M1FYRmpvY2RmM29RZ1NlMUtPUEgvL2xHZDYrSkg5THZkV1VQUGtRYWJnTWsv?=
 =?utf-8?B?SjFvd3R0V05yZk5vbE9LTlpqb1E4YjNaV1ZaN20xbXlSU3JkQjMwN21rVlMy?=
 =?utf-8?B?OUh3REVvVDhpMjZGeHF6c3RvVVZyL2RUOTNFOXg0YktVVG0yVU1MY1Z6VW5p?=
 =?utf-8?B?b0NlbFdLS21QNGprRHFWRzJpQythNUQzR2M0enlUeE5QNjZJNlB6MjBhWmp2?=
 =?utf-8?B?NEs2Zk13cHp0eG1Hci9DMjZBRDBpaGhHZmFXSTM4MnJtY2hxZEs2Uko5WnhY?=
 =?utf-8?B?YjlRalBUZ3F4R0hqRDhFbGgxWVBQcXorSHViYW1BTlMwTXZ2MW9VZisrRG5O?=
 =?utf-8?B?QVczMlQzdC9vRzhIU3JyK1lQL1owSitlNEg2QnRGd2I5N3RKZkRWKzlaZ2Zz?=
 =?utf-8?B?UVJrVjhGcWNyQy9YREx6YVArdmYxeWdZQ3FublluamxRM1ErZGdTRlJnamI5?=
 =?utf-8?B?UVNWNmxOWStOcVhHVDNobTdTbTVoVkZxOVArZXFLY0hrV09CVldLblZmdjBX?=
 =?utf-8?B?L0xnTE9SaElla2FzWXpWRlJBR044NStzcXpnWU84YzljaCtWUlQ4Z2lIM3Nm?=
 =?utf-8?B?SEpuSThndjU0bFlnUUhLTk9hVHFXMTRLclRWaUZsTDZvdGo0VlRLNVB2Rk9n?=
 =?utf-8?B?bGM1QzYxUzExdHBwU3FoTEJzejFUcnRSQkEyVTZrZFhqU1FycnRET2ZUUnhO?=
 =?utf-8?B?K3lNUHZyNUpsVURWVHNEdXI3VGxXM0VTVDRoMml2TC93cFVmNnk0Uk52TWYv?=
 =?utf-8?B?bVNRWGFhUTN0VFQ4LzYydFZqWDBvQmkwRUUyNVNoT0dyUmpIZEM5MWFoMmJI?=
 =?utf-8?B?eWdyRzNZdmg2SUUrU2dabGYra1NJVENUcmwrY3NySTdvS2xuYm9RdHlhd2s2?=
 =?utf-8?B?dUFiNHJHNkN4YzlFVFpBMENDdzBCWnYzSjdZendGc1BoWEZEenEwclZrWlhI?=
 =?utf-8?B?MCt3YmtQbU93bnJGR1E2VmtlQU1waDNOSDVicDY3UjFEUXMrUUpKQmdyUlJU?=
 =?utf-8?B?VzVPWS9rOFlDclE0WGsvOFRPOFRzRld6TkY5dm85L0lKNGE1akFDVlJlbzdF?=
 =?utf-8?B?Q2JiOUZuNnZvTWk3a0NTaHVJYlFYZTh0YWlPZzhwR2hJL0NVd2VISlhlTmJN?=
 =?utf-8?B?YzRVM2IzZ2p1WU1tdDZQZVlXUENVODgxSDBXeGJsUitVcjdOTkNxVFBpRm1E?=
 =?utf-8?Q?FqHXPF0GbDbsDv6oN8HiDYcrv?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb1b495-3d67-4b91-dee6-08db4652fbc1
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 12:37:22.7878 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vgsn5ic+BdiH7AQRXYcdesITNTxQu0bb71VkPVlzs62Ib98vtS6gjJILygzV4g6vd8oFYyMssUm747aMvMo0Y+pf8KGW1DbtRkgLJSuf1zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2530
Received-SPF: pass client-ip=40.107.15.90;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWtpaGlrbyBPZGFraSA8
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBXZWRuZXNkYXksIDI2IEFwcmlsIDIw
MjMgMTI6MzcNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3Qu
dGVjaD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRt
YW4gPGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMgLiBUc2lya2luIDxt
c3RAcmVkaGF0LmNvbT47IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47
IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFRob21hcyBI
dXRoIDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3
YWluZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xl
YmVyIFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckBy
ZWRoYXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUt
ZGV2ZWxAbm9uZ251Lm9yZzsgVG9tYXN6IER6aWVjaW9sDQo+IDx0LmR6aWVjaW9sQHBhcnRuZXIu
c2Ftc3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCAyNy80OF0gaWdiOiBDbGVhciBFSUNSIGJpdHMgZm9yIGRl
bGF5ZWQgTVNJLVggaW50ZXJydXB0cw0KPiANCj4gU2VjdGlvbiA3LjMuNC4xIHNheXM6DQo+ID4g
V2hlbiBhdXRvLWNsZWFyIGlzIGVuYWJsZWQgZm9yIGFuIGludGVycnVwdCBjYXVzZSwgdGhlIEVJ
Q1IgYml0IGlzIHNldA0KPiA+IHdoZW4gYSBjYXVzZSBldmVudCBtYXBwZWQgdG8gdGhpcyB2ZWN0
b3Igb2NjdXJzLiBXaGVuIHRoZSBFSVRSIENvdW50ZXINCj4gPiByZWFjaGVzIHplcm8sIHRoZSBN
U0ktWCBtZXNzYWdlIGlzIHNlbnQgb24gUENJZS4gVGhlbiB0aGUgRUlDUiBiaXQgaXMNCj4gPiBj
bGVhcmVkIGFuZCBlbmFibGVkIHRvIGJlIHNldCBieSBhIG5ldyBjYXVzZSBldmVudA0KPiANCj4g
U2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiAtLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgMjEgKysrKysrKysrKysrLS0tLS0tLS0tDQo+
ICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gDQpS
ZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNo
Pg0K

