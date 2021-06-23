Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CEB3B1CAF
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:38:09 +0200 (CEST)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw412-00086Z-On
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw3uf-0004AV-Sa
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:31:33 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:4309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw3uZ-0002CC-CX
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624458687; x=1625063487;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YvpkjJykZ6A/eetqUuYy1ZksFi/oeFTFWnbKN/peP2w=;
 b=Rtp0Z6/XUK0oLCopQYBCa7E2VKzEmJClgOwmTCCTMBFgjbBa6KPa3tEW
 YIsP9sXyDwbteeH1QMpL+KL/MFJ99Pc4jZZOFXSeSPKxFg8MvtIzKMAFI
 9gdpbrBpW/5lENEeizF8hxP/6ewDBATZiDGTzZZFl9LysB7qa6iWB2vOH 4=;
IronPort-SDR: qY0SxJ5PuJ3sOjEbkyIbwp2++besvlS22aSQ/OmNWQqUU6fCEprccqOA8o/8j2uDmY4yu76mLg
 YTyaxpc2zGev/gq98q9DGoGVyDR8ScZfqpZynKQTwdceK4SOVIJQSDGyZh2DQd37A7XFec9+zp
 wc5ntGXx//blb1kSWnAl2+DxTCEc+PfChin0fu7ZTxwhyXzI3hYckfB5OOkHtY7RcBeqCzOtew
 6rxcVWNWC6KFwiVlEOkmyDom5yAhHhjSzPGldUzPWwH8Ye6AdF/b93ZC7fkhWiWAdkNf8+CCPS
 3Lc=
Received: from mail-mw2nam08lp2171.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.171])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 14:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AklqbtENxqMKs5oooCeFnI+Ft6Y5+3UDQN6CW4aHZgPJsfq3K6ntLZM/2egW38jrNY296vpsKdH4l7H3wRJ6fCb6yBDMUykESztr6/Ac4PLYQSlYHveAoEorfwSAzymTMNBh7NFnbRGjErI1A1yYobZxyQnJchiwbCEaI8GKuE37XIgRWsQ7yXsvdUZUPzurHWVz+40tQ+n7BCQE0+U129+Ux3YRuAMZ19mg0Z47s4nmryJxFSnZCBp/J/CIk+ghbfmVhAITVwHxulG1+xsgMxoFrZ97xqN45jxplQtN52d3VJTtxWEPwLiKHytNgTv6cR2FPpxjsz1P3fP03eweSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YvpkjJykZ6A/eetqUuYy1ZksFi/oeFTFWnbKN/peP2w=;
 b=XcBu1GYGPH30equpWPx09IkJvL2UcXNU6E6xL2ei8qzub+L/TnFLfBadq0f/aCU5Pw2aXADs9fdKW8AmbOKT3jM0mCxQLpPF/IB6qfpnfHik7fTlm2WcFISFrzCxQzpUS+2F0x7pUWGwtJl4HANxJWkEECTYKTu0/BqzTwbwSI9Bs2J6b11plNOGqJmcsPRECIlyx1CaS7cmxWbAJbLyOixGTL1TD1H77yhVjYbrXklMhEosOwMDSENTJcDmVktuWYKBXizi9CFiVyvG502uA0C+SlLsa45EfuM9uwkx2/w3+P/MXAWEibKy3bF1FTaZpAhJh0Vg/4o96PdoaT9Gmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (52.135.234.160) by
 BY5PR02MB6386.namprd02.prod.outlook.com (52.133.252.153) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21; Wed, 23 Jun 2021 14:31:19 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 14:31:19 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Taylor Simpson <tsimpson@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PULL 0/4] Hexagon (target/hexagon) bug fixes
Thread-Topic: [PULL 0/4] Hexagon (target/hexagon) bug fixes
Thread-Index: AQHXZHUiWV+TEmZa40Gsl2XNMCSL3Kshr3Bg
Date: Wed, 23 Jun 2021 14:31:19 +0000
Message-ID: <BYAPR02MB488608E16AA66341B3D9E972DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
In-Reply-To: <1624043202-20124-1-git-send-email-tsimpson@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: quicinc.com; dkim=none (message not signed)
 header.d=none;quicinc.com; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dd7c110f-46f7-4189-5c48-08d9365390fd
x-ms-traffictypediagnostic: BY5PR02MB6386:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB63867A909AFBD8F05E854C59DE089@BY5PR02MB6386.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:626;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pyIxuRpz+4msRol2x5DRv+u8eM/aKn2Iw0H+0dd1RjKdTlmqFYEG5+mrsDo8eyob/m1fY10kkVfqyTsmsIQCpt+WKLRW5hKuO7gD1u5ouP5Hwgf+IZBFpg1qIfGyiVkaETHepSn5sOebOzRMqzTk62i2UDESdq5qhx0xU/CgHdh9BDG6l/oTYVkxwjYLMPcWRl/9wdwzSB42PFq48aZtQt14enV+W5NN5ELckk6Kl9rUx2h3sDK+J6RtAxEzjoeFTCAmMCyeFpIm2I143UBcnyZqLFu7FL2RV5OCmhZoedQO8QtkdeHUMWw2melsvq9oY6lQZlufRy3NgQLPkyC7rE2BQ7clPVI7W7PIfGJ7IpBrADd0uMWJ2TYmGru9t8EsV4+z6WvU8wxKhRoNh8RvGD667q+l5UVi+KpyZlwosDCgWaolWsyAxH4diY9hL/TatE+gJxl57ClCAYlah0n8bdaD0Wfu2IT/onTqe5LqtuuW92MizZaTzs/uAhnYl2OVYlZHVGYAnazNrVm0KpBb3PQ4k3t85pgrbFGtjrHHy0gRE5UFnd1eF5pymQ98pE6ottGp6LINMM/qSBWBDq719g83P+LIfqeo08Vk8RMb7HJutA17NQocCeYCNq+Oe3N0g24/8hGlU2+DeFqFk1MXvNEBbU5lXd61OFVK2aJPzRVxBWrK8LOWehVWBgqZL4cE+f+wtj8EFM2kpE8cEUrDLx0Y0wNsBLrLqZdRm0+aoVY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(8676002)(5660300002)(186003)(26005)(55016002)(71200400001)(7696005)(9686003)(33656002)(2906002)(52536014)(6506007)(53546011)(4326008)(86362001)(966005)(478600001)(66556008)(64756008)(66446008)(122000001)(38100700002)(76116006)(8936002)(66476007)(316002)(54906003)(66946007)(83380400001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L0pqZFRzcEV4Vm5nTkVUUTZzcXJPS1ZLUHJBOHhndVVzNmlodHdzc010WEQr?=
 =?utf-8?B?bFR2U0JhVUpzT2VZZ3gydXFwMGNwUGpXNUV1SWtkUWkyN3E4TDhnczJlZ2RL?=
 =?utf-8?B?eWpTbmRSUU1oM09ZbTdzYUZxclU1NXFsZm1KcTF3d0xkODBTNysxU0J2TC9a?=
 =?utf-8?B?NHVTOUVROURkeDlQK2I0N3g0bGNHbmJXSmpJSDJ0VXZkK0RWYmFldXVDSDF0?=
 =?utf-8?B?UXlmZFVEMDRZNkU0RWIyMkdLa2xQMDZnWnZra3NlRU0rSmw2M1ZnYjVRekNN?=
 =?utf-8?B?d2dYT2l6MHpyM2xLend1YTJEeCthOUIrQWNSNitjM2RoOFlwYmFpczN1K3Z0?=
 =?utf-8?B?bXNjOGFnS3lVREtzUDh3TUY1WEptaGJMWFhSNWNTMW1XU3RnMzA2STVRbFFE?=
 =?utf-8?B?ZGl0d1NuSk9neG9HRm5aZmx1TXRpRTlQaVJyci9JWFhMbUdyaGZmKzlmK3hB?=
 =?utf-8?B?THR4Zm9ISERiQkRRRUE3U09LeGZESkwxQmdIV254NkFTdTVOb3BDNHNEa2lS?=
 =?utf-8?B?TFd5QkJkRXNETVRpUWljK2NoRkNoYVh1b2JHOTdtSm1vdDBFT2V4RmVqd0Vu?=
 =?utf-8?B?dk1QOVhiTmVjQ1didWIzOEs3VmdWMytTd0xVM3pjSWw0MjlhMmlUWVVlZFdj?=
 =?utf-8?B?ZFFkVzBtMHU1NjI3MUxnckRaVVMzM0tzZkxyQXhZS09qWndvcXIzMURGRlNx?=
 =?utf-8?B?NEZwY09FS2pXeDZIVlNtQ01DSW1zL2piUms2anhNaTIvbFMyblUwQWlLZDF4?=
 =?utf-8?B?bzIrQ2dCM3FZTUEwT20vYXpBdVEwMTk0WkFHU2RFNG02Mlc4Sy9kNzZtdUdo?=
 =?utf-8?B?aWw2YWo0TGl2QXRqd2NVL2Y5S25FMXlaOVBJOHJsMkZqOGNEMkY3Q3J1WDBS?=
 =?utf-8?B?YVJvbXp6bnhLV0RBRjU5WjdZUkdCUWJWM3hYOXJCL0g3R1BCTVhvSTVEUGYx?=
 =?utf-8?B?OUp2TElSWm1NcU55ZlNHTGRucDFjMkRJanZ0YjRseEZ4ai9lZDlzNzZ4cnc3?=
 =?utf-8?B?SnpHRW9uRm05cUNLWmE2eHRQMzdjTXNxekZWM3U2REVlVDkxS2hSa3pacW8r?=
 =?utf-8?B?T2t2eXRPelRTMDRpVFFKazdJUGhreDBydGowQlNsTThseDN2bjdNcERyYzQr?=
 =?utf-8?B?UVBqVmtCdzYrZTFKVGRTMXpFMkt5bDhYQjRDQ1k3dXBpSzk2NWVwN24zZjNO?=
 =?utf-8?B?RVpoOHBhaU14RHp5amw0MWoyMkQrRTBwR01NMzZDckZURm9odjh6MmNEMFpk?=
 =?utf-8?B?c0FQZ0NTblk2a0tBb1k5MVE5Q1RpdFlKRXZXYkZJbHJLZ1lSY1JScTNYbXM4?=
 =?utf-8?B?STV6SW1sbU9Db2RyVHlCOXV4aWVqNklMNC91OXhUUkcrODZTbW1wbWI1MVc0?=
 =?utf-8?B?aEliRmVJclYwUmxIUEVRU2JQOXpCMlJwWGVscGVxK3Ewd1c4SEFoZVVWdDh2?=
 =?utf-8?B?UjBQSnBxTXB3VUdaQjdQd2RtTitQNWNxdS9uaFlIR1VlcEJySkFpNDVrUHlu?=
 =?utf-8?B?SGlvcWxobXRrOWF0eFNRZG5IeXdtZWxUTjBUVENrRnBxN1kxMFoxTG9ETGFa?=
 =?utf-8?B?Nm10czhYWFhPRTB3UE5XcFpkM0NndHBQS3Y3cmJkYjZ4VGVlNDFyczJjbzgz?=
 =?utf-8?B?dXdONXcvVmNPOGdqMGI4anB3K3dWVFdWdlY0U01id2l4MjVkS204L3h1OGx5?=
 =?utf-8?B?V2UwbkZHUEVRMk5RYlpwMTNEQWxWVTFocDZEZ05UVWhHOXpKMjcwRGpHcjBJ?=
 =?utf-8?Q?HJIdYVBU/Z6kqEDjvJtsS8uAOc8Oxwa1/AkpU6u?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7c110f-46f7-4189-5c48-08d9365390fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 14:31:19.0885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7JA4HzHFYpEL8AgrodiqzI/Y5y0K/nzHP+pLL0T5rmSR34aBZ69/aMf1rAPvtR1Hk8uMyPL0YEXGL2w1vIYqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6386
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, "philmd@redhat.com" <philmd@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Brian Cain <bcain@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QWRkaW5nIFBldGVyIHRvIHRoZSBDQyBsaXN0IC4uLg0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2Fn
ZS0tLS0tDQo+IEZyb206IFRheWxvciBTaW1wc29uIDx0c2ltcHNvbkBxdWljaW5jLmNvbT4NCj4g
U2VudDogRnJpZGF5LCBKdW5lIDE4LCAyMDIxIDE6MDcgUE0NCj4gVG86IHFlbXUtZGV2ZWxAbm9u
Z251Lm9yZw0KPiBDYzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMuY29tPjsgcmlj
aGFyZC5oZW5kZXJzb25AbGluYXJvLm9yZzsNCj4gcGhpbG1kQHJlZGhhdC5jb207IGFsZUByZXYu
bmc7IEJyaWFuIENhaW4gPGJjYWluQHF1aWNpbmMuY29tPg0KPiBTdWJqZWN0OiBbUFVMTCAwLzRd
IEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBidWcgZml4ZXMNCj4gDQo+IFRoZSBmb2xsb3dpbmcg
Y2hhbmdlcyBzaW5jZSBjb21taXQNCj4gM2NjZjZjZDBlM2UxZGZkNjYzODE0NjQwYjNiMThiNTU3
MTVkN2E3NToNCj4gDQo+ICAgTWVyZ2UgcmVtb3RlLXRyYWNraW5nIGJyYW5jaCAncmVtb3Rlcy9r
cmF4ZWwvdGFncy9hdWRpby0yMDIxMDYxNy1wdWxsLQ0KPiByZXF1ZXN0JyBpbnRvIHN0YWdpbmcg
KDIwMjEtMDYtMTggMDk6NTQ6NDIgKzAxMDApDQo+IA0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBn
aXQgcmVwb3NpdG9yeSBhdDoNCj4gDQo+ICAgaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvcWVtdSB0
YWdzL3B1bGwtaGV4LTIwMjEwNjE4DQo+IA0KPiBmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAg
dG8gMTNjZTJhZTAzMDAwMTM3ZTFkZThkNDBmZjdjZWFlNDZmY2IzNGNkNToNCj4gDQo+ICAgSGV4
YWdvbiAodGFyZ2V0L2hleGFnb24pIHJlbW92ZSB1bnVzZWQgVENHIHZhcmlhYmxlcyAoMjAyMS0w
Ni0xOA0KPiAxMzoyNjowNyAtMDUwMCkNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gRml4ZXMgZm9yIGJ1Z3Mg
Zm91bmQgYnkgaW5zcGVjdGlvbiBhbmQgaW50ZXJuYWwgdGVzdGluZyBUZXN0cyBhZGRlZCB0bw0K
PiB0ZXN0cy90Y2cvaGV4YWdvbi9taXNjLmMNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gVGF5bG9yIFNpbXBz
b24gKDQpOg0KPiAgICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGJ1ZyBpbiBmTFNC
TkVXKg0KPiAgICAgICBIZXhhZ29uICh0YXJnZXQvaGV4YWdvbikgZml4IGwyZmV0Y2ggaW5zdHJ1
Y3Rpb25zDQo+ICAgICAgIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBjbGVhbnVwIGdlbl9zdG9y
ZV9jb25kaXRpb25hbFs0OF0gZnVuY3Rpb25zDQo+ICAgICAgIEhleGFnb24gKHRhcmdldC9oZXhh
Z29uKSByZW1vdmUgdW51c2VkIFRDRyB2YXJpYWJsZXMNCj4gDQo+ICB0YXJnZXQvaGV4YWdvbi9n
ZW5fdGNnLmggICAgICAgICAgICAgIHwgMTUgKysrKysrKysrLS0NCj4gIHRhcmdldC9oZXhhZ29u
L21hY3Jvcy5oICAgICAgICAgICAgICAgfCAyOSArKysrKysrKy0tLS0tLS0tLS0tLS0NCj4gIHRh
cmdldC9oZXhhZ29uL2dlbnB0ci5jICAgICAgICAgICAgICAgfCAxNiArKystLS0tLS0tLS0NCj4g
IHRhcmdldC9oZXhhZ29uL29wX2hlbHBlci5jICAgICAgICAgICAgfCAgNSAtLS0tDQo+ICB0YXJn
ZXQvaGV4YWdvbi90cmFuc2xhdGUuYyAgICAgICAgICAgIHwgMTEgKystLS0tLS0NCj4gIHRlc3Rz
L3RjZy9oZXhhZ29uL21pc2MuYyAgICAgICAgICAgICAgfCA0OA0KPiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQ0KPiAgdGFyZ2V0L2hleGFnb24vaW1wb3J0ZWQvZW5jb2RlX3Bw
LmRlZiB8ICAzICsrKw0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA4MCBpbnNlcnRpb25zKCspLCA0NyBk
ZWxldGlvbnMoLSkNCg==

