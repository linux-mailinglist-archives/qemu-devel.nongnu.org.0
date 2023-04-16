Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B316E37B6
	for <lists+qemu-devel@lfdr.de>; Sun, 16 Apr 2023 13:24:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1po0TL-0006ky-BT; Sun, 16 Apr 2023 07:23:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1po0TJ-0006kq-Tg
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 07:23:05 -0400
Received: from mail-am6eur05on2071f.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::71f]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1po0TH-0004bC-F4
 for qemu-devel@nongnu.org; Sun, 16 Apr 2023 07:23:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VKVq58l0DYvkmmSryqCQn4s6v8tY5nexgWEejLQdsOc/M7GEqLk5KyDhwHny9yFsiP31Qy6oUfgRnanxq7Nm2Ri71odmTM4XIsF8jJX4sFKChcU88drtIMjBAHiS2l/nculytn8Ts7VQKZsFmyBt6vZSgDmlyDhxqjGLwt9MZEk3B09Kkjj/veK5/2imGP8/Ank/SJmstjISA6OGNmCnQLuwBC2WGzQfBl/SM82jBAwuIgHURd0e5qYYf1fFV+4q1kiQj9zpzGT/wwFVBtFxEbtDrjztYih6jrBOC0ZF9Dcrf1x1etQTeHm4g+okRMyJsLiYUsNu81mgWDEFl8f4EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTq2An8pqWm7H5WMb3oJnY22PwNMpC+MHmwvmiK6utY=;
 b=D7hKX32pyW/VzxMiFiJmXFJqz5LQieO+cuK+7FPrhdF+wjC8YfwBjEURfZb7qkM0KOvmFQVNK93HxyO5Wd2CJh8ctMT/zdDnCMjzxAxmBvzVU+jca1o4LQNzc6SsYuO1LtthTGtyc7ClEFlJpANxOXTPisjW/IFl7+a7j/4oUZ/lkp9SjYsUFf5ikTCDQdJ4FqC45lrNRT5mCoxrU39oFHBWy09XuIeKqgPTLK+JivXvFRsltvnj+BgN60uu2Jem/+/XuPKEKXT0fVsqrG2GuuUgAlmseW6bzQzhVnJwEf91Dnmo6AioIO9D1a9byJ+EYw8TeBKzYvXXNKqkfBu7mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTq2An8pqWm7H5WMb3oJnY22PwNMpC+MHmwvmiK6utY=;
 b=myE/bJLR9N7hYESFDM/Z1O7seGwLYMlxMr8PlUgF+Wc7qqOnoefipADnsf4fimQsGhrh7wS0/j6LfGDtZVl+c27IIKZtMAmyHVD+oo66LOXicViIufSgbKiOwIQwrC0xsLryXE+RH35Siw7QKvg76dGbfoHRVyrj7NMpRGKukTw=
Received: from PA4P189MB1439.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:c7::8) by
 DB8P189MB0837.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:166::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30; Sun, 16 Apr 2023 11:22:58 +0000
Received: from PA4P189MB1439.EURP189.PROD.OUTLOOK.COM
 ([fe80::5a61:e234:6443:23b4]) by PA4P189MB1439.EURP189.PROD.OUTLOOK.COM
 ([fe80::5a61:e234:6443:23b4%6]) with mapi id 15.20.6298.030; Sun, 16 Apr 2023
 11:22:56 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 30/40] igb: Implement igb-specific oversize check
Thread-Topic: [PATCH 30/40] igb: Implement igb-specific oversize check
Thread-Index: AQHZbsXXLqaMZ9JuDESYePpboMVOMK8sv4ZA
Date: Sun, 16 Apr 2023 11:22:56 +0000
Message-ID: <PA4P189MB14398ED75EF9CB376DC2CD61959F9@PA4P189MB1439.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-31-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-31-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4P189MB1439:EE_|DB8P189MB0837:EE_
x-ms-office365-filtering-correlation-id: 1c6eb99f-b1e7-4486-b11a-08db3e6ced50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3mWji5WBmyG09OGvtZDP/dIHOYPZYD1sy+6fQVZobOFoQvhmGUOA2FJSB8jVYT9wncV5YAxb6Bp4wzgm8CIKOC26uYllspSHrVI9gGR7DIwh0gAPJkUqVmEMgmPW9Kq2Tt0uhe+g1i4r13THw7nmoWihKAtFaUERFKHQ+bNwB48BsbGQvglJWYqSYqXY9PSl057GMzABBsOgT3FdaC7SPN8JST0ZE1E4OkmCkk8gs7U28FsG74hPuBYjpy0QmpNxHNl2hzGGs79x6oJ9kDThU5hBJwBKq6KoTdQCKn8Ak9VdYNXjdhHkgWhpV2OKh+4nKWrvBsIY2/GfaCrP47YBTKZXAru4+o82lXGso95wljLLjoUegMVnN8kIZfgccIiaQ2zCjQTNCqdG25R9BN/BMXzyeMtLpWw3dNoNOGEjWQ7FUeYt+X7hpziysW4qDDzfa/WfZzKbcsVkR0BtxWJPIR0OPJK36ndWl274si079vB3kNGLI7IuQBr60uedEaCOekY2qSt91JT8j2SOVo5h+Rp3nSy1mh/NYDCBp6YnGAeP2Wrsvi5q2buMb+uE0cBNNmbrv8vPoNpN7gW8ELb27gjaF9RCCecXdcIFecsMYiLiAtSGwuSkGeWWON0K3ZeH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4P189MB1439.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(396003)(366004)(376002)(39830400003)(346002)(451199021)(9686003)(55016003)(66574015)(6506007)(2906002)(33656002)(26005)(186003)(38070700005)(64756008)(38100700002)(8936002)(83380400001)(122000001)(86362001)(66946007)(66556008)(66446008)(76116006)(66476007)(7696005)(71200400001)(478600001)(5660300002)(44832011)(52536014)(7416002)(4326008)(316002)(6916009)(8676002)(54906003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDFydUVPelBIc3dGUEVzMVVtaGxpN0YyZCsveC9TTlF5bEtZTUNTMWtrWldN?=
 =?utf-8?B?N0hGYTRGUVByaUdvbytXVUpaUnlMNklOK2p6dDd6SmZBeUVlaUpEclJUNEdP?=
 =?utf-8?B?NFJMc2NQWmFoZGRVbWxYTndNYmk4bG5EdnFtdTVBdGdtSnJPc1o3Y0Vad0FZ?=
 =?utf-8?B?dFQ4ZGVycDVoN0VmUGQxQW1BcVVnTEczNnY4M0hkZVJKT2dSSGVWZmlUZVY5?=
 =?utf-8?B?ZC83eitOMlF6MU50ZTJ0akcvS2kwUEJ2VkxXNGFLNmRybVlTMmhYWHU0QVV1?=
 =?utf-8?B?cXFIZnlWQklxeWNLYlk1N1l2dGp6RWJvSGVYSldvQXdMd0FWMzRrZTZPK1Nh?=
 =?utf-8?B?V0U0MU1MQnljQzRaamJ4Rno1bGNCSllsOHM3SzVNWDYzbTZXODU0cUUxRUM1?=
 =?utf-8?B?MThSV3pJYWJNbXBGQmdENVk1THBOY2RtV3FCajAvV0s4Wlk1clRVMmNKL1Bm?=
 =?utf-8?B?Y0k3Z2NwMFVKQ3RjTlgrN2F1d0dWMUNMTGZieHFFcjhwR0FCbDAzR0E5NEdh?=
 =?utf-8?B?ZHVZbXgvYzJQYTRyZzlvS2IydjhXYk92eUFqRkdEVFNaYm4vcExpbEx0cVI4?=
 =?utf-8?B?NzVMNHFoem82bytlQXZnb3o3S0Y0MThwd2dVRkpnem12cXZmbEhzdGREK05C?=
 =?utf-8?B?ZXpZWnkzQWxpa0FpVUVnNTk1N0tHTGpxd1hDMEcwcnkrMittSXY5SmlhRlh1?=
 =?utf-8?B?eU90TTl2U2hvZmYzcTdkbHVrVWt1QzNOQ25ydDVjU2JNcXNYTnJxTUZFUmJL?=
 =?utf-8?B?L0FGM2xLN3RhYm5BMmZwUC9VZ0F3dWE1cng2dFdPUDJFU1d4Z3drODdXeTJ5?=
 =?utf-8?B?cThacDZQWW02YnFKdTBDVFQxWkVFZXlpQnVWdWtwclJ0dG5kOVlYY0d4blRJ?=
 =?utf-8?B?ZHpDUVNUQkd1RGI0cGMwcE5JN2x1Q1JwV1Ywcm5DV0NQQjJGUXllUnlCTE5X?=
 =?utf-8?B?U1JEc0lmMGZpUElUeDJFL3IraDRjWElaZjVJNWJOdDYxMFU5c2E5SXZHY2ti?=
 =?utf-8?B?R1c4OXZFRDU0YkE0S1lKNDJ2aWs5RElweWZweWc3cXFvRUNheXpZSGNaSFp6?=
 =?utf-8?B?VzM1cXgrVHpnVFRWQkxrSzhIZ3p5alRCNjFXLzBDWW4vcUZIS0ZKc1lBTm1H?=
 =?utf-8?B?ejFBeVpmeWpPYTUrNGI3NVh1QzZjVkxrZDJkTjQ5d3RNZDhrNHRPUk1pYm04?=
 =?utf-8?B?K0tiYjNBV0FwNWRKbGtVM1Y2Mng3ZldwWFE4K254anRPUjZBUFFKa1BwWVF3?=
 =?utf-8?B?UFFHaERWUnBvYXBMaDlaR20xUXA0Q0hBbmxaNy9oelBkczVXRTNOVGdYRFRO?=
 =?utf-8?B?RklqZEViS2tVNmV3aVBpRnJ2VmZzTnRiTEFFUzVlOUpnaUFMR1BoL3FHc2Qv?=
 =?utf-8?B?dEJnQnhBUUlTTmJzTXpRdjk4ZEN6Y0llTnJTSVFSQW0xOUpOejhxaGdaQjI5?=
 =?utf-8?B?UklXVnBhWmlFRnQzZDZXelFuekRVWUVoSHQ4VURlYWd4RzUrajR5WlpIMHNu?=
 =?utf-8?B?R3dOS0dNUHdscFJOSFQ4K1lUNTRETFV4SnhSdzRZYTZSQUZIMWZMZ1c3RTBX?=
 =?utf-8?B?NzhGSGFtN292SGFXdGpRRUJDVmJEZnpiMnQrQWtHeHB2N1BQVk5HSjE2eWp2?=
 =?utf-8?B?ak9QRmQxemtQaXpqb2F3L1dIbUNCTjdQOVV1dDErS21iblNjKzlqSEs1WE5o?=
 =?utf-8?B?YUlIRTlvb3BzV0VKamNsUXlEV1A2dmFWWld1b0tFNUMzNytEYysrL2lBdE5O?=
 =?utf-8?B?R2pXOUlVcjdINHJXV2ZrdmZ6Ymp1RTM4MzkxRWlRRVVka1ZidGtONnlPY3dE?=
 =?utf-8?B?WTBVNU9ZVDRxc2hNdWs5UmJmcDZQMDJsK1RzVFFWTnNuYmNBS2pTamtjOTRT?=
 =?utf-8?B?NXRiYzVWMXJWYmVua0k1U0NUR1QzN04wMmVZVHlhZGhsZkRQelE5MjBRTVMy?=
 =?utf-8?B?Ujh1eDRLaU5hNktCNFM2YWJnU2ZvYVY2SmhKYjJmNS9TSGZHR1REcFNNQzFt?=
 =?utf-8?B?a2dIWmRQQXU2ZnRQSUNxSWdDeSs2b2I0R2J4Z1lNeElIU3Z5eGgzd2l2bzVD?=
 =?utf-8?B?TGNZSW0xbDk3NWc3TkIyNndncUdHV01CTEVncjRSU0w0WTI2UmwyVGpnS0Jo?=
 =?utf-8?B?eEtROTFPVjNPUEk5MVVNWlF5R1BweUoyNWtBS1JHa2FsUGg3LzVZMXZJODJ0?=
 =?utf-8?B?bGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4P189MB1439.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6eb99f-b1e7-4486-b11a-08db3e6ced50
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2023 11:22:56.1370 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D8jEwE/6ghwO4bDoLbhL1QbN8Qro/O4QUFosTUH6mAjBxN89h9R1dmVaID/D/ymJbuY5fURj1jsQVmER5kEpDOmt0nEhYdCSHTw3L/mkqac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0837
Received-SPF: pass client-ip=2a01:111:f400:7e1b::71f;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBGcmlkYXksIDE0IEFwcmlsIDIwMjMg
MTM6MzcNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
aD47IEphc29uIFdhbmcNCj4gPGphc293YW5nQHJlZGhhdC5jb20+OyBEbWl0cnkgRmxleXRtYW4g
PGRtaXRyeS5mbGV5dG1hbkBnbWFpbC5jb20+Ow0KPiBNaWNoYWVsIFMuIFRzaXJraW4gPG1zdEBy
ZWRoYXQuY29tPjsgQWxleCBCZW5uw6llIDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPjsNCj4gUGhp
bGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPjsgVGhvbWFzIEh1dGgNCj4g
PHRodXRoQHJlZGhhdC5jb20+OyBXYWluZXIgZG9zIFNhbnRvcyBNb3NjaGV0dGENCj4gPHdhaW5l
cnNtQHJlZGhhdC5jb20+OyBCZXJhbGRvIExlYWwgPGJsZWFsQHJlZGhhdC5jb20+OyBDbGViZXIg
Um9zYQ0KPiA8Y3Jvc2FAcmVkaGF0LmNvbT47IExhdXJlbnQgVml2aWVyIDxsdml2aWVyQHJlZGhh
dC5jb20+OyBQYW9sbyBCb256aW5pDQo+IDxwYm9uemluaUByZWRoYXQuY29tPjsgcWVtdS1kZXZl
bEBub25nbnUub3JnOyBBa2loaWtvIE9kYWtpDQo+IDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+
DQo+IFN1YmplY3Q6IFtQQVRDSCAzMC80MF0gaWdiOiBJbXBsZW1lbnQgaWdiLXNwZWNpZmljIG92
ZXJzaXplIGNoZWNrDQo+IA0KPiBpZ2IgaGFzIGEgY29uZmlndXJhYmxlIHNpemUgbGltaXQgZm9y
IExQRSwgYW5kIHVzZXMgZGlmZmVyZW50IGxpbWl0cyBkZXBlbmRpbmcgb24NCj4gd2hldGhlciB0
aGUgcGFja2V0IGlzIHRyZWF0ZWQgYXMgYSBWTEFOIHBhY2tldC4NCj4gDQo+IFNpZ25lZC1vZmYt
Ynk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBo
dy9uZXQvaWdiX2NvcmUuYyB8IDQxICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0t
LS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9jb3JlLmMgYi9ody9uZXQvaWdiX2Nv
cmUuYyBpbmRleA0KPiAyMDEzYTlhNTNkLi41Njk4OTdmYjk5IDEwMDY0NA0KPiAtLS0gYS9ody9u
ZXQvaWdiX2NvcmUuYw0KPiArKysgYi9ody9uZXQvaWdiX2NvcmUuYw0KPiBAQCAtOTU0LDE2ICs5
NTQsMjEgQEAgaWdiX3J4X2w0X2Nzb19lbmFibGVkKElHQkNvcmUgKmNvcmUpDQo+ICAgICAgcmV0
dXJuICEhKGNvcmUtPm1hY1tSWENTVU1dICYgRTEwMDBfUlhDU1VNX1RVT0ZMRCk7ICB9DQo+IA0K
PiAtc3RhdGljIGJvb2wNCg0KVGhlIGNvbnZlbnRpb24gaW4gc2VlbXMgdG8gYmUgdG8gZGVjbGFy
ZSByZXR1cm4gdmFsdWUgaW4gZmlyc3QgbGluZSBhbmQgdGhlbiB0aGUgZnVuY3Rpb24gbmFtZSBp
biB0aGUgbmV4dCBsaW5lLiANCg0KPiAtaWdiX3J4X2lzX292ZXJzaXplZChJR0JDb3JlICpjb3Jl
LCB1aW50MTZfdCBxbiwgc2l6ZV90IHNpemUpDQo+ICtzdGF0aWMgYm9vbCBpZ2JfcnhfaXNfb3Zl
cnNpemVkKElHQkNvcmUgKmNvcmUsIGNvbnN0IHN0cnVjdCBldGhfaGVhZGVyICplaGRyLA0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplX3Qgc2l6ZSwgYm9vbCBscGUsIHVp
bnQxNl90IHJscG1sKQ0KPiAgew0KPiAtICAgIHVpbnQxNl90IHBvb2wgPSBxbiAlIElHQl9OVU1f
Vk1fUE9PTFM7DQo+IC0gICAgYm9vbCBscGUgPSAhIShjb3JlLT5tYWNbVk1PTFIwICsgcG9vbF0g
JiBFMTAwMF9WTU9MUl9MUEUpOw0KPiAtICAgIGludCBtYXhfZXRoZXJuZXRfbHBlX3NpemUgPQ0K
PiAtICAgICAgICBjb3JlLT5tYWNbVk1PTFIwICsgcG9vbF0gJiBFMTAwMF9WTU9MUl9STFBNTF9N
QVNLOw0KPiAtICAgIGludCBtYXhfZXRoZXJuZXRfdmxhbl9zaXplID0gMTUyMjsNCj4gKyAgICBz
aXplICs9IDQ7DQoNCklzIHRoZSBhYm92ZSA0IENSQyBieXRlcz8NCg0KPiArDQo+ICsgICAgaWYg
KGxwZSkgew0KPiArICAgICAgICByZXR1cm4gc2l6ZSA+IHJscG1sOw0KPiArICAgIH0NCj4gKw0K
PiArICAgIGlmIChlMTAwMHhfaXNfdmxhbl9wYWNrZXQoZWhkciwgY29yZS0+bWFjW1ZFVF0gJiAw
eGZmZmYpICYmDQo+ICsgICAgICAgIGUxMDAweF92bGFuX3J4X2ZpbHRlcl9lbmFibGVkKGNvcmUt
Pm1hYykpIHsNCj4gKyAgICAgICAgcmV0dXJuIHNpemUgPiAxNTIyOw0KPiArICAgIH0NCg0KU2hv
dWxkIGEgY2hlY2sgZm9yIDE1MjYgYnl0ZXMgaWYgZXh0ZW5kZWQgVkxBTiBpcyBwcmVzZW50IGJl
IGFkZGVkPw0KTWF5YmUgaW4gImlnYjogU3RyaXAgdGhlIHNlY29uZCBWTEFOIHRhZyBmb3IgZXh0
ZW5kZWQgVkxBTiI/DQoNCj4gDQo+IC0gICAgcmV0dXJuIHNpemUgPiAobHBlID8gbWF4X2V0aGVy
bmV0X2xwZV9zaXplIDogbWF4X2V0aGVybmV0X3ZsYW5fc2l6ZSk7DQo+ICsgICAgcmV0dXJuIHNp
emUgPiAxNTE4Ow0KPiAgfQ0KPiANCj4gIHN0YXRpYyB1aW50MTZfdCBpZ2JfcmVjZWl2ZV9hc3Np
Z24oSUdCQ29yZSAqY29yZSwgY29uc3QgTDJIZWFkZXIgKmwyX2hlYWRlciwNCj4gQEAgLTk3Niw2
ICs5ODEsOCBAQCBzdGF0aWMgdWludDE2X3QgaWdiX3JlY2VpdmVfYXNzaWduKElHQkNvcmUgKmNv
cmUsDQo+IGNvbnN0IEwySGVhZGVyICpsMl9oZWFkZXIsDQo+ICAgICAgdWludDE2X3QgcXVldWVz
ID0gMDsNCj4gICAgICB1aW50MTZfdCBvdmVyc2l6ZWQgPSAwOw0KPiAgICAgIHVpbnQxNl90IHZp
ZCA9IGJlMTZfdG9fY3B1KGwyX2hlYWRlci0+dmxhblswXS5oX3RjaSkgJiBWTEFOX1ZJRF9NQVNL
Ow0KPiArICAgIGJvb2wgbHBlOw0KPiArICAgIHVpbnQxNl90IHJscG1sOw0KPiAgICAgIGludCBp
Ow0KPiANCj4gICAgICBtZW1zZXQocnNzX2luZm8sIDAsIHNpemVvZihFMTAwMEVfUlNTSW5mbykp
OyBAQCAtOTg0LDYgKzk5MSwxNCBAQA0KPiBzdGF0aWMgdWludDE2X3QgaWdiX3JlY2VpdmVfYXNz
aWduKElHQkNvcmUgKmNvcmUsIGNvbnN0IEwySGVhZGVyICpsMl9oZWFkZXIsDQo+ICAgICAgICAg
ICpleHRlcm5hbF90eCA9IHRydWU7DQo+ICAgICAgfQ0KPiANCj4gKyAgICBscGUgPSAhIShjb3Jl
LT5tYWNbUkNUTF0gJiBFMTAwMF9SQ1RMX0xQRSk7DQo+ICsgICAgcmxwbWwgPSBjb3JlLT5tYWNb
UkxQTUxdOw0KPiArICAgIGlmICghKGNvcmUtPm1hY1tSQ1RMXSAmIEUxMDAwX1JDVExfU0JQKSAm
Jg0KPiArICAgICAgICBpZ2JfcnhfaXNfb3ZlcnNpemVkKGNvcmUsIGVoZHIsIHNpemUsIGxwZSwg
cmxwbWwpKSB7DQo+ICsgICAgICAgIHRyYWNlX2UxMDAweF9yeF9vdmVyc2l6ZWQoc2l6ZSk7DQo+
ICsgICAgICAgIHJldHVybiBxdWV1ZXM7DQo+ICsgICAgfQ0KPiArDQo+ICAgICAgaWYgKGUxMDAw
eF9pc192bGFuX3BhY2tldChlaGRyLCBjb3JlLT5tYWNbVkVUXSAmIDB4ZmZmZikgJiYNCj4gICAg
ICAgICAgIWUxMDAweF9yeF92bGFuX2ZpbHRlcihjb3JlLT5tYWMsIFBLVF9HRVRfVkxBTl9IRFIo
ZWhkcikpKSB7DQo+ICAgICAgICAgIHJldHVybiBxdWV1ZXM7DQo+IEBAIC0xMDY3LDcgKzEwODIs
MTAgQEAgc3RhdGljIHVpbnQxNl90IGlnYl9yZWNlaXZlX2Fzc2lnbihJR0JDb3JlICpjb3JlLA0K
PiBjb25zdCBMMkhlYWRlciAqbDJfaGVhZGVyLA0KPiAgICAgICAgICBxdWV1ZXMgJj0gY29yZS0+
bWFjW1ZGUkVdOw0KPiAgICAgICAgICBpZiAocXVldWVzKSB7DQo+ICAgICAgICAgICAgICBmb3Ig
KGkgPSAwOyBpIDwgSUdCX05VTV9WTV9QT09MUzsgaSsrKSB7DQo+IC0gICAgICAgICAgICAgICAg
aWYgKChxdWV1ZXMgJiBCSVQoaSkpICYmIGlnYl9yeF9pc19vdmVyc2l6ZWQoY29yZSwgaSwgc2l6
ZSkpIHsNCj4gKyAgICAgICAgICAgICAgICBscGUgPSAhIShjb3JlLT5tYWNbVk1PTFIwICsgaV0g
JiBFMTAwMF9WTU9MUl9MUEUpOw0KPiArICAgICAgICAgICAgICAgIHJscG1sID0gY29yZS0+bWFj
W1ZNT0xSMCArIGldICYgRTEwMDBfVk1PTFJfUkxQTUxfTUFTSzsNCj4gKyAgICAgICAgICAgICAg
ICBpZiAoKHF1ZXVlcyAmIEJJVChpKSkgJiYNCj4gKyAgICAgICAgICAgICAgICAgICAgaWdiX3J4
X2lzX292ZXJzaXplZChjb3JlLCBlaGRyLCBzaXplLCBscGUsIHJscG1sKSkNCj4gKyB7DQo+ICAg
ICAgICAgICAgICAgICAgICAgIG92ZXJzaXplZCB8PSBCSVQoaSk7DQo+ICAgICAgICAgICAgICAg
ICAgfQ0KPiAgICAgICAgICAgICAgfQ0KPiBAQCAtMTYwOSwxMSArMTYyNyw2IEBAIGlnYl9yZWNl
aXZlX2ludGVybmFsKElHQkNvcmUgKmNvcmUsIGNvbnN0IHN0cnVjdA0KPiBpb3ZlYyAqaW92LCBp
bnQgaW92Y250LA0KPiAgICAgICAgICBpb3ZfdG9fYnVmKGlvdiwgaW92Y250LCBpb3Zfb2ZzLCAm
bWluX2J1Ziwgc2l6ZW9mKG1pbl9idWYubDJfaGVhZGVyKSk7DQo+ICAgICAgfQ0KPiANCj4gLSAg
ICAvKiBEaXNjYXJkIG92ZXJzaXplZCBwYWNrZXRzIGlmICFMUEUgYW5kICFTQlAuICovDQo+IC0g
ICAgaWYgKGUxMDAweF9pc19vdmVyc2l6ZWQoY29yZS0+bWFjLCBzaXplKSkgew0KPiAtICAgICAg
ICByZXR1cm4gb3JpZ19zaXplOw0KPiAtICAgIH0NCj4gLQ0KPiAgICAgIG5ldF9yeF9wa3Rfc2V0
X3BhY2tldF90eXBlKGNvcmUtPnJ4X3BrdCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBnZXRfZXRoX3BhY2tldF90eXBlKCZtaW5fYnVmLmwyX2hlYWRlci5ldGgpKTsNCj4gICAg
ICBuZXRfcnhfcGt0X3NldF9wcm90b2NvbHMoY29yZS0+cnhfcGt0LCBpb3YsIGlvdmNudCwgaW92
X29mcyk7DQo+IC0tDQo+IDIuNDAuMA0KDQo=

