Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3B86E997F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 18:27:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppX7x-0003Lh-6m; Thu, 20 Apr 2023 12:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX7u-0003LW-68
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:27:18 -0400
Received: from mail-db8eur05on2139.outbound.protection.outlook.com
 ([40.107.20.139] helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1ppX7s-0002zK-Mm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 12:27:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X77RrEN1ep9qW/LOqpuWR7+upKfXBHgWBLpkElJH1P8jMVWyj/FOAh1GSzGROmo3eIk8aroj7e6U4v36UdClMUxc6DJEG0iABa9OCwGw9Uzd1NKru5RvOcBAWWEThQPxdA16RPjz82taZmsIJvyQQAS0gyBGfql/YDDBATUKiH7o3AtqxlvEP9mIbbjGt8zNvcHmqWJJnJemymAdQAvMQIvQSDCY01fHYV0Wpr8vvf85VFofTAreELAFfqDbJyuTGIMnyCC665IIeu+TO4c5P2ZNsSZoXyRx3RYDT2wZ/8UJcWq9dA20efwfpclqG9QsIMdTKHV3ukQc7pJuEnwaHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUPyH/6mlajWyvVQ/uKNCUu28jt/rNembWIXMVo3kcY=;
 b=JFZHTA58tlSLGuS6jHRmvSWvfpl4GV85xxNSFW7pUqHKvi6e99D8xVgN8PrAP+xsBIn6JxMIiNNxHU9Fj7hLiJ0EDt43NazLf9gZGEU4YdMy8ZGBpzeQLKWgUkbmzaZon1z0taLx1JgR5wgdHeER1PT7b8my01njVtBwVg6ntzOzB2leh4CztjHtB7fw+K0VTJUvtLiEljqojkG5fERB+4mwdquwnKLZTd9XztjgB928h3GlOyMwuUx4R+zDSxe0Rr4+DuEMH2cXgzoE6U27PEDftriZKf6hvRnDGkPqcXiboCTyCFJMa938CVxF1LP1hMjNLlqGcOF/dmo9TpNUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QUPyH/6mlajWyvVQ/uKNCUu28jt/rNembWIXMVo3kcY=;
 b=LL2qhSmgUXU7EjcebrVKacBVJBpE1cJXeNPwMgCGXeldrECSIEUCo7mZMA1a3ySIWvrt7Ev72Hd/smr4Rs5VlCZIAWZIvdl6eYcLcqJ3IuPeuSdJ3ppCx75yCREcjFm+5mu8bH64EEKSeKsg/Hu69/5m//A3MbW4Kp5shA2C8sY=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GVXP189MB2103.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Thu, 20 Apr
 2023 16:22:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 16:22:11 +0000
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
Subject: RE: [PATCH v2 03/41] e1000x: Fix BPRC and MPRC
Thread-Topic: [PATCH v2 03/41] e1000x: Fix BPRC and MPRC
Thread-Index: AQHZc0ulABZF2sF0jEi5DPWKNL38J680V3vA
Date: Thu, 20 Apr 2023 16:22:11 +0000
Message-ID: <DBBP189MB1433E41662949765DD812AD295639@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
 <20230420054657.50367-4-akihiko.odaki@daynix.com>
In-Reply-To: <20230420054657.50367-4-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|GVXP189MB2103:EE_
x-ms-office365-filtering-correlation-id: 57fbf313-6a1e-4d96-1b44-08db41bb6523
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nEEmd9I3iI7yQ+MJKZLF5Ev+S/YvMexwO4bS4UscXEU4LmhrkXJYC0lLlIqdOiu2qOxl6MLLZ7jsmoRFj5RSq4YLhPXvXUHcuislzxV12fuPIA9acAEzhSiHmcLBh2B0HYAyVjObVrSOBofgsW/Y+/XM+a0XsDH887cIyib9Qfej2Dk2XkfDfEtTHGxcrwy1RIKfK67pJAtRRvNEHsy7WakPp4jz8DuyFZLMvm0J9cLeUejy5ZHGYbC7qSLtF0oBX4IW5mtSnq1/PBVbK+2H+iMg5fQOyVlENLVtwMVjiCfzNhFNOFwFtYLZglXXDGnQvlnU52Tl4b0lMsLCrVHfajzngVefg8BHWpe9X04uBrHf58d21JVqZMxA/V1dPnWYouyWtVRN6XkgS6cKq2pHRQ9w/YwnFzaqMLbdafsi4OrmPceStW+QnI+aeKFEJDchw9uvmNalIKArgp4Zlgh93J9sHXXG0efhZClG8uQZ6jNrPXlegxcjuQSP8SW3w4L6mEBwTirST02VOxZ5womf0IS1DVMH63fdsz8ewNVg0aZW52UcNAhiXCd4vPuJ6cVgWhBux47FsaxL01CX3jLXfhBYXWYRhHLx/5tdNoG9hsNh5a12JdtCyWHp2cscOMg6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(39840400004)(366004)(346002)(396003)(451199021)(122000001)(8936002)(6916009)(4326008)(316002)(54906003)(76116006)(66946007)(64756008)(66556008)(66446008)(66476007)(41300700001)(7696005)(478600001)(71200400001)(52536014)(5660300002)(55016003)(8676002)(38070700005)(7416002)(86362001)(2906002)(33656002)(9686003)(6506007)(38100700002)(26005)(186003)(83380400001)(66574015)(44832011);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dEIrN0ZoMWRsNHJQdVp3b3JVTkUrUDZDSllDQ3h1d3poVlpHVGdGaFFFZVNO?=
 =?utf-8?B?bVpYQVRpRmNZZUI0akd6bFlId0NnZDU4TkZYbk5Lck1qam91UTJNZXdzL3l5?=
 =?utf-8?B?T0VoVmMvcTRHSWR4aklBMGNtTmdqUGFKdlNlc1ZSakxWWFFuaHRSZ1dKd01l?=
 =?utf-8?B?Q2NCa0VwS1U5d0oxL05idkNyZUF2UHk1K2hUeUN4bkdQSjlwY2l2cjU4ZEps?=
 =?utf-8?B?R3JMM3lCSWdwNWlhQzllNUViMkpBOGF0R0JDSmNRYXV1bHJhQzZzRVlnYVZs?=
 =?utf-8?B?UUUzUEVMeWJRRXRUc1RycSs5Z25UOHFFbTVMM3l3M09JY0lKY2ZiRmlmZ0ho?=
 =?utf-8?B?eWVGSldrU0hGVlJROGVuQjArcUJaZzVhdXE3c3VOR0tvYjdIWXFzS1NIMzlm?=
 =?utf-8?B?bWtKQ3h0ZzE3RUw0ekc3WlNaa1JFYUxwTUNYTTNQdUtZdXIvOHR5WWdDelhJ?=
 =?utf-8?B?UHBma2VrN3NUQlE3R3c1VGQwZWNpY0RqZHVrSWhUWkp1dGhBa0YrWVV2czdw?=
 =?utf-8?B?K1BhWWNtMzlVS3ozcVJPNExuL0o5VmU2TnVvUDFIVXYwclg4K3FTZFMxYVF3?=
 =?utf-8?B?NHh1YjVzZGRjWTgzcjUxS3MwWG1VY0tMaG1lbVJ1U2hMakpJamp5N2RPVW8v?=
 =?utf-8?B?UnRJc1lNOWJ3WS9tWVBvUW1mZlhvS1NTSUtKMm5MNnpIdXM0d214cEpVK2ho?=
 =?utf-8?B?YTExK3pPUk8vS0NGRmtpY3lydTd1TkpwY3l0RWUyQVBhYUdyN1NHVUxCUE1p?=
 =?utf-8?B?QWNIQTBTdUdheHRxWnFNRVBpaE1EdzhiK2N1b2RjOE1nYjU1bkg3aVVtZ04w?=
 =?utf-8?B?U0dMTkFFZUZsOTFuWUlNVzhFRXplS1FTa1g1Y0o3eitNTWltY245bE9pajd3?=
 =?utf-8?B?dDlWMG1abElOZU12STVuY2U4RksvSWU4NnlqSW9pTUxJSUNLUWFHbUVOUStG?=
 =?utf-8?B?OEs1ZzdCOGFqbE83YWNYUXhSRy9RNnUwZlhMbDltbCswYTdPY1BwQU12MDJU?=
 =?utf-8?B?M0tGclBOMWVPSU0yQmZ0VUtXSkVIMjRrWFF3ZmxiTWliZFVsb2plZXl1dHhh?=
 =?utf-8?B?ckJoYnk3M3RtYWZsRkZ3Y0xud2N4R1dXRjhOSjZVNW84WWpZZ0EvUUdweEhC?=
 =?utf-8?B?R1lHMW1zWkVUNlNON3JQL0dJNmgwc3VRZXFTVnNsY2NJdVB6THRRREFwV3lT?=
 =?utf-8?B?UG9JQkx4blgxRHpWQW5sRjR2UDRXcDVTSElEelBBV1hIWXd5c0tsK3ZuY3dk?=
 =?utf-8?B?d2FLMkhjUlZ0ZFZjSWdkVWxzTW1QNTZXSHQraDk3dnU0VUc1bFl3QnBadXZX?=
 =?utf-8?B?dFB0Y3pXWjNCVW80di9aR0F5VTFJcGQ2cUZwcVZTNWlRMVJhZ1N2SEVIQm5t?=
 =?utf-8?B?MU5JRUdzRDFEelpaYWR4OUhHT1JJZEt0K1BsUkNnR0tCVC9kTE53YVA1akdo?=
 =?utf-8?B?TEZiYyt6WjFGL0I3RVNlVjBtR28yUEcxajRjeDZNV3lERGZpdHZ3N3RmUnJV?=
 =?utf-8?B?R1g5NUE3SVJBNlF1Vk10K085R3p1TTNYMkNBZHpPS2VsQVVwQ2l2bkxIM3I2?=
 =?utf-8?B?TDEyTDBjd3BCRWpnbWU4UXM3SnUyVzV6SjVZLyt5dEcyS3dSTWtJbmZQTlpQ?=
 =?utf-8?B?OWpyZGdVbXZiTU1Ldmo3elRMWi9uYUdBUUV4dGZiK3NkSFgzVno5Y0dZcUta?=
 =?utf-8?B?dHNoa1VJaGR5TWRTNnpIeitpQkViU3lMVE5WR1gxdzdZZXBNR0RDQUswTTNW?=
 =?utf-8?B?TGNCUVpsa1JaRmliYlBGby96bkhBMVA5eUJkemZPb1ROSEZZNmpERnczdG11?=
 =?utf-8?B?cE5uamVyWUw3VEs3SjlJRHVYKzlWRWFBWHFyVndaZ2VielpNeG5hN0VGL3ls?=
 =?utf-8?B?bEk4Nmdja3BjYzdKemZQb0Y2amVsa1YwNGpFQXVWVmRiSDNvcVNnUmRPeUF3?=
 =?utf-8?B?NUpGUnhiM20ycE14N2J5QUZ4STJCeGZtWE9mSmRFTkJvTVQ4VGpxd0NLbVpj?=
 =?utf-8?B?N3NvdWRNdS9sQXhqVWcwazYxbDdBbDZQYWR4THQrSTd4SHg2U2dRajNxcldF?=
 =?utf-8?B?eDdEcUdYNFRqZFNqV0pobnhXVngzUTNWenhzcXZTenhqMGpqZHBHZ3h1KzNJ?=
 =?utf-8?Q?UmrOsxoMtVjmr4f+GdZ8LreuX?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 57fbf313-6a1e-4d96-1b44-08db41bb6523
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2023 16:22:11.4482 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jehKHsn4/8pS6wV7Pupzwxvsl20P3tnGuO/wUqVbYwv4YMeslU/pqJPXVYF6u5WP2dnTb9wnOlpugfWJO/QBQARFDx70aftiy/2qvn5cFGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2103
Received-SPF: pass client-ip=40.107.20.139;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIDIwIEFwcmlsIDIwMjMg
MDc6NDYNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMgLiBUc2lya2luIDxtc3RA
cmVkaGF0LmNvbT47IEFsZXggQmVubsOpZQ0KPiA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47IFBo
aWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47DQo+IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWlu
ZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVy
IFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZzsgVG9tYXN6IER6aWVjaW9sDQo+IDx0LmR6aWVjaW9sQHBhcnRuZXIuc2Ft
c3VuZy5jb20+OyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+
IFN1YmplY3Q6IFtQQVRDSCB2MiAwMy80MV0gZTEwMDB4OiBGaXggQlBSQyBhbmQgTVBSQw0KPiAN
Cj4gQmVmb3JlIHRoaXMgY2hhbmdlLCBlMTAwMCBhbmQgdGhlIGNvbW1vbiBjb2RlIHVwZGF0ZWQg
QlBSQyBhbmQgTVBSQw0KPiBkZXBlbmRpbmcgb24gdGhlIG1hdGNoZWQgZmlsdGVyLCBidXQgZTEw
MDBlIGFuZCBpZ2IgZGVjaWRlZCB0byB1cGRhdGUgdGhvc2UNCj4gY291bnRlcnMgYnkgZGVyaXZp
bmcgdGhlIHBhY2tldCB0eXBlIGluZGVwZW5kZW50bHkuIFRoaXMgaW5jb25zaXN0ZW5jeSBjYXVz
ZWQNCj4gYSBtdWx0aWNhc3QgcGFja2V0IHRvIGJlIGNvdW50ZWQgdHdpY2UuDQo+IA0KPiBVcGRh
dGluZyBCUFJDIGFuZCBNUFJDIGRlcGVuZGluZyBvbiBhcmUgZnVuZGFtZW50YWxseSBmbGF3ZWQg
YW55d2F5IGFzIGENCj4gZmlsdGVyIGNhbiBiZSB1c2VkIGZvciBkaWZmZXJlbnQgdHlwZXMgb2Yg
cGFja2V0cy4gRm9yIGV4YW1wbGUsIGl0IGlzIHBvc3NpYmxlIHRvDQo+IGZpbHRlciBicm9hZGNh
c3QgcGFja2V0cyB3aXRoIE1UQS4NCj4gDQo+IEFsd2F5cyBkZXRlcm1pbmUgd2hhdCBjb3VudGVy
cyB0byB1cGRhdGUgYnkgaW5zcGVjdGluZyB0aGUgcGFja2V0cy4NCj4gDQo+IEZpeGVzOiAzYjI3
NDMwMTc3ICgiZTEwMDA6IEltcGxlbWVudGluZyB2YXJpb3VzIGNvdW50ZXJzIikNCj4gU2lnbmVk
LW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiAtLS0N
Cj4gIGh3L25ldC9lMTAwMHhfY29tbW9uLmggfCAgNSArKystLQ0KPiAgaHcvbmV0L2UxMDAwLmMg
ICAgICAgICB8ICA2ICsrKy0tLQ0KPiAgaHcvbmV0L2UxMDAwZV9jb3JlLmMgICB8IDIwICsrKy0t
LS0tLS0tLS0tLS0tLS0tDQo+ICBody9uZXQvZTEwMDB4X2NvbW1vbi5jIHwgMjUgKysrKysrKysr
KysrKysrKysrKy0tLS0tLQ0KPiAgaHcvbmV0L2lnYl9jb3JlLmMgICAgICB8IDIyICsrKysrLS0t
LS0tLS0tLS0tLS0tLS0NCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNDUg
ZGVsZXRpb25zKC0pDQo+IA0KDQpSZXZpZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJh
bS55YWduYXJhbWFuQGVzdC50ZWNoPg0K

