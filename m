Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3B6E3343
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlGj-0000We-6W; Sat, 15 Apr 2023 15:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGh-0000WG-WC
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:04 -0400
Received: from mail-db5eur02on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::727]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGg-0007N3-IU
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2ddexLSJoAFvkWZcGy9e/qhjT9x3RTSk26k1DWH/WjMKWIizsj+/tzT+olNOtMP5v5CcZMRmJ2Ge11/JyHoyFcgTztEB9BDKmJTu1c0+eeRhlEqgxV2lZ1vThkK682jFMGh2aEyTRiQYrdSip61AgPkNBcx4p6z+Pg8EJOExqSunqzXOJ1CJOE66tsNdIE3RRbkoR23K+ZSOdZUgDySh+195fDn+wmV1vryhO1CJ++G0jwHTo801SolY+tI6RW0RtM45xnlmQe8uvY30aMdnr1wUzH4k+sX6SH216QQYSLK37WjflNFf1trxX/NtYChGVI+AvZ2S+vpN/n3uySmPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8vN4fSeYJsvK2FtHsrAGYGY42nb+sZtXM82SGSLrRE=;
 b=cpI/tMxlkA8C0jTDLwQs2Py9AJ1+2JUhjbly9kwwxh6X7Xm1AAYXs/4WbOHLCvBPTTKcdZOGiVGMDc5crcmLLUPBgn8/Okjy5GxNZEfwbzxQbzSZTSvXDVn2HS1O3DavoNs6kWvpJS9tvPFYw/kj0yUo3U8U5EYF7nqmS1GlqkXKZbrKlZxgkahJFyJlQeuL1KRtHspnGoVdsVhtDA2BX/HW+kvpT+rT7EePgNrausQhuQxs3FARHvFktQ3W6v/G5Me/nYmZAW1tDTAlaGpym2mGgCRVOg0B7D0topnNWWRFA70J1ssM9V0FLqMTH6H0F/nSTml5jsFHf+hlH4rMbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8vN4fSeYJsvK2FtHsrAGYGY42nb+sZtXM82SGSLrRE=;
 b=ab98ghG46RVeDi3hCxMbcfTAy7C5bJqsACByUSTCDoR+gFLgSM5FQ0zDo3dg1C9xLytRx9+1k5GX4UC5hPveWTLbVV4BAZ7nSWs0CDY/NhcGkWqvMYqoSfjS2SnCzhgu0mp+sghQ9SNsvL6wHh5UwjbsVBLqZgRqgGRCQDsFbCo=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:52 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:52 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>, Akihiko
 Odaki <akihiko.odaki@daynix.com>
CC: Jason Wang <jasowang@redhat.com>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Thomas Huth
 <thuth@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>, Laurent
 Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 23/40] igb: Share common VF constants
Thread-Topic: [PATCH 23/40] igb: Share common VF constants
Thread-Index: AQHZbsXKwo2kmycJc0ipnphu/Gxk668q6HQAgAFnBVA=
Date: Sat, 15 Apr 2023 19:08:52 +0000
Message-ID: <DBBP189MB1433B9E55C3FE6119F3493E5959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-24-akihiko.odaki@daynix.com>
 <2a429670-cefd-db55-61a6-f0a5bd3625ae@linaro.org>
In-Reply-To: <2a429670-cefd-db55-61a6-f0a5bd3625ae@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 87d647ae-fb6a-4b82-29e0-08db3de4da16
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: U+MmqpfzRaWOrqZqNKBzZdRfb4vPW/5kBvhO5W8lr2SVSGVo/EvLx+ud7YRVw5V+3GNVKvADcg9W7F22/WdLscw5VYPiH7GLQ/ujpTKH2cBlgM92lrhbO7fwlMl7LI+8tnZQpoeUHCbTGxJe3rwU0gPX6EqvLvCjPTKO46nK8Xa+94qeVk5H+e0YqahXdKvX1iRKVOTYw+/qBzl3VViI+UYjWsTDr7iFOZ/zH8mhXd17V9LSqqXaOyMkTPcoUV0mPtwMTYKmoiQR5JFv+PrzVlzYyeLf1qrsOpkFhO1br9vjkL5SqwlA/zFtnVv5SoLT0Pgro5w/YmfV40LufYcQHnLAuJrF3dox+MYKOWXuXmV9DeDmf7tslo8fN8xVr38t/xraTMccEQRWK5t/Vwj757QwTOJ4oC3Kh0UJbjhgf5DlvgUMMcnFT1IjY5HgJiIFhAcp0oCJtBgxzjaixdDp4iWpgjodat60dNBdOfSF475oiHJG0t41CS3PiuUXqR94T78+T2+kivN12B9c85KtGf1hjwtszuWVXTv5sk2ghIyjpK6AlH34I92l/lmTRuTYxjIosYeeLTaRW2NQlUvPfgBY/7dfLP8nIGodNCTa6lizj1SigkUFgCNmcNZqujVb
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(53546011)(9686003)(86362001)(122000001)(54906003)(8676002)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(110136005)(66946007)(66556008)(66476007)(38100700002)(4744005)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZW9PNXdwbFQwR0hxb1pOTFRDdlZNZzA3MVltbmdPbE02cVJxQzVXU2lmYUNB?=
 =?utf-8?B?ZkkzSDhZZURFeDhkZHlVNU81ak5kS2JZeEFmVkxKNThUTHRGVE45UzF2cTJB?=
 =?utf-8?B?V1VjYitOQkhhcFNxd2VibVp0V3NHM2JKZEFObml1VDdNVWdpeTlEQWFwMklL?=
 =?utf-8?B?d1l6aUpCaEY5cS9QVnUxUk5FQXVIYng5MWZHZHdCWXNDdktrY0FNMUJnQ0N0?=
 =?utf-8?B?RkVmTFdKbUNlY0lVbXZWTFU2eU9ETHFLNldtU2ZMTXVEbURPTmZLaWlRM2xy?=
 =?utf-8?B?NU5mZjhaWlNTSldiWWlRUU1ac2VST09wMCtvQmN5YnBYWW1WSUFjcnIydVJ5?=
 =?utf-8?B?MmRpcG5aZXRCYUFGNi96ZWt3WnpQZ3R6UnY2eWJjcS9PYmJ4bUEwcloyU0Fi?=
 =?utf-8?B?VmNHVHFuS0w1UEt6enlmVFI1ZUx0ZXJaNlhCUWdzaHlhZ3RNT0xZei9qUVRh?=
 =?utf-8?B?bkEzT0I3MHBuVXZjU0xENlphUjlOeVdEY0J4aGRUZVhyTG4ycXlxOXVRcy9n?=
 =?utf-8?B?S0VxQ1NTZmlkbHhhbnYyVGZwaHo3M01BSlBiNUpxRWFraEtxOFMzT2ZyWU00?=
 =?utf-8?B?QWFEcVFHSUoxbWVJbEF2N3d6eERrUnZjV0ZPZ1ZzTW1QL2RRZDVXRmhwN0Rx?=
 =?utf-8?B?YTZaNENKeFVrdEttNS9Dbk4zRE9BR3NsUHZ5QVBJT1VZZElaaFFieTRMV0gx?=
 =?utf-8?B?Q3p5Zkw5Y2gzSGtFY1JyNHd3UHlKOGg4WFEyMEVMY2NIR05SV0JoMUVaMjdM?=
 =?utf-8?B?Zmp1eGM4OHVTVTJVcmpMV2RDMlZvVVdEMmpBekNNYXBKeXFDNEpXL1Jzdmw3?=
 =?utf-8?B?Q3h5VmFodTdnYXIrOGdTaENpcVJmdWcydkZ4My9tbXdBUHdSRkJ6OW5jcGw4?=
 =?utf-8?B?L1hjY2NGUERoOGNzMTgrYVBzZlU4MXVBVFlSOG9MK3hJVFI3Z3ZLZGx1RE9t?=
 =?utf-8?B?TWhlQmVSWC83ai9TUnRMdU9PWE1wakFxeUJUanZZRzF4RVJIazdMc2hQZHJy?=
 =?utf-8?B?MWJCMisydWsxL2NoTExlT0x3VCttV0hqWVhsZjlObXUwbUc4RlR5T1JmY0tQ?=
 =?utf-8?B?UlIra1QzOU4zaWZWSXNubzN4aFlvWlZtbnRUV1pFdi9TRFp6NDZobjJiVlZC?=
 =?utf-8?B?cjFGRGFTM1dQWURYcWVPemFGTGZBVzZlWUJpbWZKL0d2azkrVEpvT042bVQ1?=
 =?utf-8?B?akZScUVmbE9zRkxxcWtqRFZpeERrNW51NDdRblJOWWg5VTR0SHJTb09saUJh?=
 =?utf-8?B?bEV3V0VhRWlFckd1TTNyaGZnREt3OFMxR1JnYVhVMFMxU2M5UklSS1ZTZi9S?=
 =?utf-8?B?dlEyc2Z2bmxKLzI4R0RWNGV0emQrc2lNREJHanVNWnBBY0tOUGZycHA4b2Jz?=
 =?utf-8?B?bm80ZGFDQlFHQ1NhZEJ3OHl0ZnJ2bTlLZ0s5R3VpcXZLeCt5MVdLQThlckNw?=
 =?utf-8?B?WUxmWlNtOGNRYlFlWG9RbGFDTHBBVmxzajN5cnRzUnVheXprdGF1WlQ5U2Jv?=
 =?utf-8?B?Wm56Y21UWXFUU3FJSkV5YWtKZmVDWU51YTBKQjR4VnFSMUtJWGtrNFFMR1Mw?=
 =?utf-8?B?d0JIMDRpSlhqbG9xY1IrWEU1VlhsRm5rd1dpSVZiVW81dEQrSVF6RFl2UWJl?=
 =?utf-8?B?Y1ZnSFpoVGZ6Ny9jdVlEVUdXeUQ0eEc0NWEvTmt3eVlaLzZQT2hxQ2U1akNT?=
 =?utf-8?B?TnUza1ZxWGZ2MU1JVEtWZVhnWi9PT2JITTZWeVFNaVJTYUdlRnhOcG91Y3N2?=
 =?utf-8?B?cFAwZXRSSWF6UmNrR3pRRlRYSjFQTUFFRWtUa2REdDRCSzlQS3llaXQ4dW9I?=
 =?utf-8?B?aUJ0ZXdzYUQ0c09uSnl1ZEhENjBJWkxyMnBmLzlxaUJXVkkwN01mS09hemxY?=
 =?utf-8?B?NUVtTFdvaGhDQXk5bkhjS3B3L0NybHVEa2pjTTJXWldnODJ5Y3laTnpzVUgx?=
 =?utf-8?B?Nzl5NnZpOUwzWFJqanVOK1c4RVRZREhiNElVYTAyZFpqeFpXUEpnTm4xaTFI?=
 =?utf-8?B?L2N6TVZtdFpTYi9TQnB0N1pwdmtqMVRKdzE1MDU0RXlPY3dJbWNXcTBqN1Q2?=
 =?utf-8?B?TkRETFEvNksvM2lsTDE1OWdXV29KTlhqQUZpMUcxbjdNbElkVFlzUHNWdDM5?=
 =?utf-8?Q?c52cvZchA0ETfsKOpGH0tKbka?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 87d647ae-fb6a-4b82-29e0-08db3de4da16
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:52.3418 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ApCTR5ONHY/uh3sn6V9uitb0QMIfsqVAweYIt5zPJjWnAOEHMQmTgh7L0Qn7tYmGFLRyi42XodJSZ1XINW08aDPXn+cgqdzIMnmm+aqjfp4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=2a01:111:f400:fe12::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFBoaWxpcHBlIE1hdGhpZXUt
RGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz4NCj4gU2VudDogRnJpZGF5LCAxNCBBcHJpbCAyMDIz
IDE3OjA5DQo+IFRvOiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5peC5jb20+DQo+
IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+OyBKYXNv
biBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxkbWl0cnku
ZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNv
bT47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47DQo+IFRob21hcyBIdXRo
IDx0aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWlu
ZXJzbUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVy
IFJvc2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRo
YXQuY29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2
ZWxAbm9uZ251Lm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIDIzLzQwXSBpZ2I6IFNoYXJlIGNv
bW1vbiBWRiBjb25zdGFudHMNCj4gDQo+IE9uIDE0LzQvMjMgMTM6MzcsIEFraWhpa28gT2Rha2kg
d3JvdGU6DQo+ID4gVGhlIGNvbnN0YW50cyBuZWVkIHRvIGJlIGNvbnNpc3RlbnQgYmV0d2VlbiB0
aGUgUEYgYW5kIFZGLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtp
aGlrby5vZGFraUBkYXluaXguY29tPg0KPiA+IC0tLQ0KPiA+ICAgaHcvbmV0L2lnYi5jICAgICAg
ICB8IDEwICsrKysrLS0tLS0NCj4gPiAgIGh3L25ldC9pZ2JfY29tbW9uLmggfCAgOCArKysrKysr
Kw0KPiA+ICAgaHcvbmV0L2lnYnZmLmMgICAgICB8ICA3IC0tLS0tLS0NCj4gPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+IA0KPiBSZXZpZXdl
ZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBsaW5hcm8ub3JnPg0KDQpSZXZp
ZXdlZC1ieTogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50ZWNoPg0K

