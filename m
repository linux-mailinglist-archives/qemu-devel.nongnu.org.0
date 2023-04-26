Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1BD6EF47B
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 14:40:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1preRI-0003cW-Eo; Wed, 26 Apr 2023 08:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preRF-0003Ss-DK
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:40:01 -0400
Received: from mail-db5eur01on0724.outbound.protection.outlook.com
 ([2a01:111:f400:fe02::724]
 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1preRD-0001bT-Sg
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 08:40:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0uVQYcO8LD8TRmpNkDHnnEzRnInEwHn/uPCWUIikYJDS7Pd4m2GcW8kaHyLhWd6hpYybJac0kAYgmmQoUhWz/Y0VP4ezVvWZWNRE+aIxrXXT/W1v7hbdw1IHSRxowv9J24Fv7V+Xt2yaQRimmsfzClS9W6UExDDxDS2/rUqQUyV2bGA3R4M4GhVNt3SagGQ7s9hYoYAlaVm3kRgrmgK3rMu4P5pcwT06oYCVes9MNQxSvIurDZxjk72I25xoDvSTNcMpRJRJLrpmdkS1kjRGDxpDo2Ry28wY0Y5J0icR/h0bfE8FSzOiKsnYCpGFAY5zKLxsNJ5LN/4tDL0JfnT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cIiZInljMwP943foOkN4IymPsDZpIVW4x16w0Mu8REk=;
 b=mO4f5DX1zqov5kEQqzu9jdh8ViQTFQOkxmR0ZGl7vIzaFx7sWQDI8IVFktkiCOQ/1/afBEXjJcP8EeNLbQCry6K+Ir1HA6cjYdMWC7R3VN+V424ioEukU3AKWq43rKUphNUjd6LRsjx490luUJOEMRYqWf7HAfbqiVycNNpQzhUqbNc0zk5uTgo+Ld8KQm3+FqSz8aFKqmEjK2A8wal4asZmls9DFY14mYSHkih6x/4rpiT9t1UJInbqo1iWWOQlheAwIzujsQlZ17w/TY0CE29XHju99oVgQEnCHmLUKi/09+9Jph7O988nsDXOiEkm0kIsAQczxtJ6pc/1hFrtgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIiZInljMwP943foOkN4IymPsDZpIVW4x16w0Mu8REk=;
 b=GKykwuYrZiYda2qQA0Q4HhBQvfuA/Ppq2BLIPVpaeIGzO6gBuk42hfgwbLRr3XDQyW60KZUJjBbjdnW+a4Df05tewvlv4PUe9uUOY7XqtQqkgwyjbs1kzjyPioBXt6a3Hb2NQW7ep9hud51f9p94kqD29qjj9xwscOfzj8XGg6U=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS8P189MB2530.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:635::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 12:39:35 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 12:39:35 +0000
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
Subject: RE: [PATCH v4 45/48] igb: Clear-on-read ICR when ICR.INTA is set
Thread-Topic: [PATCH v4 45/48] igb: Clear-on-read ICR when ICR.INTA is set
Thread-Index: AQHZeCt3zkfKSraVy0OePj+ZyAb7W689h/Sg
Date: Wed, 26 Apr 2023 12:39:34 +0000
Message-ID: <DBBP189MB1433B685DCDB58409FC2085495659@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
 <20230426103716.26279-46-akihiko.odaki@daynix.com>
In-Reply-To: <20230426103716.26279-46-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AS8P189MB2530:EE_
x-ms-office365-filtering-correlation-id: 281ce130-aa59-4155-b210-08db46534a85
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bj3tUKIzTFeA9hB1ktiZnQoLtReDi6PFb3LcqcbKFgipN9pPlpfVWm5MdmRKNQhlvoswuYg/K+ZRGKbkz4U7QiVuZnb5QR84zU1owT25W1vu4H2AM6GG6+4JTSnhOTUEhDVq28gydjQUQJlD2UKFR0e+MCiPKyo2EtFrqfnnCJogpJx9cgdQvSIsaBmFbgeG7Q7Nps3JBuNpPSHn/brD9RtA1AT3yY23j7y8kcSLnREY1kfdiYnGfFKvx9X35fHOPuB2ds25yUwR0bEXgAjqUsynQOr5dXOL45/d0OD2cRyMJEZkf5iJMQ17inOKE3H66/s8d6HacPdxV24GUJPWMSNYoy4cZLeuhcOmRFMxgzdVd/xKHY4dIA3DfiGsTfFQOYGYBSlUQHwlGAxdvA6ILVAZvrdq9CB36G9dJvsoTZJCKkpeL3QwXELFAzxBhKAaqzXC8HDf3l2DQpmWTEdxxH0u+S5sczxEb5m0e9dKZgGUCN39fneh7UH5tTJwpOoN57GXpZ0cxJr8d2650oN8+UmAy8s06OdkcfZ02jIf5ZYV5jTSZdvdD+9EA0VCizkV3kMfA1h1OSgoa9D9CihCdEnV6uWoHGLLsmXt1/7QulTHsSHay2Baqdx+3jVpqtVh
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(39840400004)(346002)(366004)(136003)(451199021)(38070700005)(33656002)(5660300002)(6916009)(316002)(4326008)(83380400001)(64756008)(54906003)(186003)(2906002)(478600001)(9686003)(26005)(6506007)(7696005)(71200400001)(41300700001)(122000001)(8676002)(8936002)(38100700002)(7416002)(55016003)(86362001)(76116006)(44832011)(52536014)(66446008)(66556008)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?elowZEtQeU85Qm5NWTdkQ0Rzd0FFVWZ2ZFFmajYrekh4KzBoaG1icFlBRzRp?=
 =?utf-8?B?TE9kOVQrUGxRWnpXbXJEb3FNTVpDQmlJZXZEQkJxdzF6YXRlSCt3a0lqdkRy?=
 =?utf-8?B?M3FkMzEwbmE1bjdXNmNzdXdmYXBGT1BMME5ncGFuK2hobUZpN2ZTejBhT25o?=
 =?utf-8?B?WjhVZWFCcXI4NXpxL2dERU13S0IzS3g5U0c0d2svdlVyNDdCTkxCbTdFcXRn?=
 =?utf-8?B?MW9WYTk0U0ljOW40TVA5YWJBYVhiSXcySkNUWXBNTkQvaVFIdU5LdzQvTGxP?=
 =?utf-8?B?aERJb095MGZGR0tOSEJyQWFQYmJFNDZod28zYTY1bmZ5NXhKUHYzc1R2bjJn?=
 =?utf-8?B?WHorRlZIdU91VERUUXFVZTBYNWhlNE1lbzh6YmhTRmYyWHNRQ2VUajczY09l?=
 =?utf-8?B?bXZLd2k1MU9BMGY0NEZJSCt1Q1J5aE50ZlNoMUd4aThzQWVUZ3JPOFZta1Rq?=
 =?utf-8?B?dW5GT2EvOU5CendrQjZheTVaL1BYU3FDRDRRN3U4S2I2dmZhdm9LcldyZUlE?=
 =?utf-8?B?R3N5SThyMkdzbnY3ck83czRQRlRDRFFsSUVhVW8zYmZhazJwZW9hei92TXBU?=
 =?utf-8?B?THZqdEpVN0p5eUR4Sll4THd2aHlPa3FZdkVoaTh1NTJRWEZLaHlkdktCdCt1?=
 =?utf-8?B?VVFCNWh6bmE2RUNHQkRYeDNrSU9aNHdRRUloa0NZVk8vR3huRHRLeXAvU3Vs?=
 =?utf-8?B?SG92YmhXdnFyamc3aVkwd3AxVjR4R3U3eUd5R1JWVVNZbzBmejhIQmExODlk?=
 =?utf-8?B?amJ3dVI2czFKS3FzYy9IZEVwRnhQS3hQaTRmUS9wbnRSRWdSVG5sWGMrK1Na?=
 =?utf-8?B?ZXh4U1k3cStNMERKeG0vZ1FlOGZESTM4S1F0ZmhDSis0Znp5NldkdE1CVGN0?=
 =?utf-8?B?ZjJhR3Jwc3BycWxOTmJpTXNqaWZ6M3k4S1dmVEVlSFhKR0tTSUcwR3ErVDZQ?=
 =?utf-8?B?UDBySGRsUUQ5eEhuOC9OL1BuVVVQYUhZTVU4dG05a2F2dnNrbTNxZldmYmRE?=
 =?utf-8?B?ZEU5amRXRGl0WlBmWU5tZWs0MkZKSkw4VjNNMjVkVzQ0Q2RrMzA3aDRxT1kw?=
 =?utf-8?B?QlpDc3p5YmV4cklxekhMbHJwSGc4SHRtTGJEQmdpR3RkY0tQeUtybllnTDFs?=
 =?utf-8?B?dVk1Wm1DcHNVTmxvYkNhelJjM2Nnc0FDWFpSaTJQWEc4RkdEdE1FUzJsY1hZ?=
 =?utf-8?B?dnVrR09wcFY3RXNJS1VDNlNJU3E3QldVaVUrcXZnNUpjUlI3b2VZRUFuZnJG?=
 =?utf-8?B?bmFCbUF4bXdVVGFZSFlCdmZicGVKMVd5SnRhQUNlVFdISDJkUGRaUitiMkRx?=
 =?utf-8?B?OWNSQ0dIOGpYUllyRDhuYU55WnlKOGZ0RVpBa0twWlVmRC9NRGM5TmExNzVm?=
 =?utf-8?B?V3lpY2FudWJUd2tWVmRSaG1GUkJoRFlCWkVSQlJaNFBCV3NjQmdvRmNwUnp4?=
 =?utf-8?B?Mjk4UW9vV24veFJIU2RBRzY4UUdFYUE4ejdQR2ZhVGNFN3JMQS9saWlxMENG?=
 =?utf-8?B?dmdrbnl4ZWRJM2RIMXkvaFBjRTNOSWJldVFPTnlkRFpuZjFhT3UyUGJIdUtI?=
 =?utf-8?B?a2hUS3VhMDc0U3JZS1pTK0RFZlBCUW16eThNNGkrcEpYOXcrRFQxcklHcnJV?=
 =?utf-8?B?WWczZ1ZJOXpCNWc5SXk5b3JUZG1KWUNsb3ROMkRPUDluL1E4dVdXa1ZVN1RK?=
 =?utf-8?B?a3lQWXloMjdHelpROERxOGprVFR2aWRkcktGVTRxYVBVTk9YSjhycG91aG1I?=
 =?utf-8?B?ZUN5Q1JUSUZweVhVSzM3RzN0VFJCOVFISTlsTm9mOTNTYXMxNmZGRHlSdFRE?=
 =?utf-8?B?RkhnT0NldHNObXdFdFljYmU4djNCeHQwK1M1Ylk3NzlWMDZqN3g0TTUvNDg0?=
 =?utf-8?B?VVdVSllPR3BYVHVoUWhSYzJXRmJic0g1OEdPU0pxZFVqamxzRjhWbXdjZHdv?=
 =?utf-8?B?aGU2N0tXUXhSbVkrRzdKWitLZWc2Q3RsZmRKTGdjVy9DWWRMalora1ZoSUUv?=
 =?utf-8?B?c3NpOHVZTHo5a3pSKzlGSWpNdlRlZlpDR0ZINGtRODc5SnQ2WWNwaW5kbUcx?=
 =?utf-8?B?aG1Lekk3N1VaZjJ3Smp3MkJuSElnM3RpMDkzUFJKUWV1THNGRzVPc0dBWS9E?=
 =?utf-8?Q?xZVEOjo6p0Sg3Nb3laCZJ6W+4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 281ce130-aa59-4155-b210-08db46534a85
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 12:39:34.9147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FOlP54bGNOQYtStTE+cJUtumVsOsNKLyC4OJJ35Hiq0MYMdleE8EQNDZQF9PSAULmKx66soGoUTj5Wh1ngEySn3m57DuLSUnTgBtpu2bu3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P189MB2530
Received-SPF: pass client-ip=2a01:111:f400:fe02::724;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
DQo+IFN1YmplY3Q6IFtQQVRDSCB2NCA0NS80OF0gaWdiOiBDbGVhci1vbi1yZWFkIElDUiB3aGVu
IElDUi5JTlRBIGlzIHNldA0KPiANCj4gRm9yIEdQSUUuTlNJQ1IsIFNlY3Rpb24gNy4zLjIuMS4y
IHNheXM6DQo+ID4gSUNSIGJpdHMgYXJlIGNsZWFyZWQgb24gcmVnaXN0ZXIgcmVhZC4gSWYgR1BJ
RS5OU0lDUiA9IDBiLCB0aGVuIHRoZQ0KPiA+IGNsZWFyIG9uIHJlYWQgb2NjdXJzIG9ubHkgaWYg
bm8gYml0IGlzIHNldCBpbiB0aGUgSU1TIG9yIGF0IGxlYXN0IG9uZQ0KPiA+IGJpdCBpcyBzZXQg
aW4gdGhlIElNUyBhbmQgdGhlcmUgaXMgYSB0cnVlIGludGVycnVwdCBhcyByZWZsZWN0ZWQgaW4N
Cj4gPiBJQ1IuSU5UQS4NCj4gDQo+IGUxMDAwZSBkb2VzIHNpbWlsYXIgdGhvdWdoIGl0IGNoZWNr
cyBmb3IgQ1RSTF9FWFQuSUFNRSwgd2hpY2ggZG9lcyBub3QgZXhpc3QNCj4gb24gaWdiLg0KPiAN
Cj4gU3VnZ2VzdGVkLWJ5OiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0
LnRlY2g+DQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5
bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2NvcmUuYyB8IDIgKysNCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9ody9uZXQvaWdiX2Nv
cmUuYyBiL2h3L25ldC9pZ2JfY29yZS5jIGluZGV4DQo+IGI2OGUyNGM5ZWUuLjI5MTkwMDU0YzYg
MTAwNjQ0DQo+IC0tLSBhL2h3L25ldC9pZ2JfY29yZS5jDQo+ICsrKyBiL2h3L25ldC9pZ2JfY29y
ZS5jDQo+IEBAIC0yNTk4LDYgKzI1OTgsOCBAQCBpZ2JfbWFjX2ljcl9yZWFkKElHQkNvcmUgKmNv
cmUsIGludCBpbmRleCkNCj4gICAgICB9IGVsc2UgaWYgKGNvcmUtPm1hY1tJTVNdID09IDApIHsN
Cj4gICAgICAgICAgdHJhY2VfZTEwMDBlX2lycV9pY3JfY2xlYXJfemVyb19pbXMoKTsNCj4gICAg
ICAgICAgaWdiX2xvd2VyX2ludGVycnVwdHMoY29yZSwgSUNSLCAweGZmZmZmZmZmKTsNCj4gKyAg
ICB9IGVsc2UgaWYgKGNvcmUtPm1hY1tJQ1JdICYgRTEwMDBfSUNSX0lOVF9BU1NFUlRFRCkgew0K
PiArICAgICAgICBpZ2JfbG93ZXJfaW50ZXJydXB0cyhjb3JlLCBJQ1IsIDB4ZmZmZmZmZmYpOw0K
PiAgICAgIH0gZWxzZSBpZiAoIW1zaXhfZW5hYmxlZChjb3JlLT5vd25lcikpIHsNCj4gICAgICAg
ICAgdHJhY2VfZTEwMDBlX2lycV9pY3JfY2xlYXJfbm9ubXNpeF9pY3JfcmVhZCgpOw0KPiAgICAg
ICAgICBpZ2JfbG93ZXJfaW50ZXJydXB0cyhjb3JlLCBJQ1IsIDB4ZmZmZmZmZmYpOw0KPiAtLQ0K
PiAyLjQwLjANCg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFy
YW1hbkBlc3QudGVjaD4NCg==

