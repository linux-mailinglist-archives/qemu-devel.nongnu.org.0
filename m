Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E53E6EC913
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsaW-00076u-Ts; Mon, 24 Apr 2023 05:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsaT-0006pC-PV
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:21 -0400
Received: from mail-am0eur02on20708.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::708]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsaR-0007pp-Hu
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:34:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W9g0BdlbQpwS9TLTbWqQupQgeWqz8URVgCk0LYLl2xxrcWOU3HYXw/GWROhB3nm9Rx61uV4kO2Oh91h+DA4KzEnNqSPiLTnbdJQtz+CyjPzWk00uwj00x9yVPk8HdWZRy4vENyboj87kjh/KyIbTD5z0jASc08R2JGDo2hBhwvIEGWxa+yVRYcCqPLgyblAPAKgkeYBX9D1jD4RWCIBEfmAJ2jbPPMdRVd/SQUZFjEvMbF3uCVWwj5tLlLeiZZXNYTdweOI+VRTRVOgrKEo3d1GauoiDTO+tU1C9BGQvjCEcNhfflMDsIYE5nwxhRwIyz0JY921Gl5k6b6NLSDklJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ue7sp3OvDASEjJPVvJwYTADvdMmyOzthGmrhLP9Z/W8=;
 b=lHXK3BOawg0yGlbSxtMdJ8M2EAZzxDm//BrZymunbB+1vZVJ//jRZnRV5BMlfhg+OwHkrvcQakrBNo2v6nAuiHjcljd3sujlKux/T4eYxe+hlVbT2yY68XYa88xKi6sHz2mMQgO67DGQA7PwQ15X0HpCGBiy2B08OERD6WOQfdfc55SF/x5zcfhpF8o76KrgrtJ4GM4XciShTcJk5O+SuVAtTTvVuTs2H8g+M2XmYUXsJ6nDkSAUVaQeHLFVB7h+4wcCtE4df/JCtfgWLzBDGjfYfz8RXSNzy5df73QdxvX7uXRyxYfwrtfL9fK3bRpEqitP7z+Jn8yx5gU5b6t9zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ue7sp3OvDASEjJPVvJwYTADvdMmyOzthGmrhLP9Z/W8=;
 b=SIbQNE4ptrMp80fe1bGJkH9+WcJjd9vh8LbFHzQiHqrn3ZjyCYN4kNNU9KUU7IJqVyb2J/CYTDRnJ2f66LJghjbKxAADErzxtZheourvb8br67eRsZ6VcJ/V7xUl7aXKnlsbDjSJEq1UBbUU2C+2/NAkyGeImbQPCmVDpF0yxnY=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAVP189MB2388.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:30b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Mon, 24 Apr
 2023 09:34:11 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:34:11 +0000
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
Subject: RE: [PATCH v3 36/47] igb: Implement Rx SCTP CSO
Thread-Topic: [PATCH v3 36/47] igb: Implement Rx SCTP CSO
Thread-Index: AQHZdZr7R1MDdenNEUWKO+vy97PHHq86NHQw
Date: Mon, 24 Apr 2023 09:34:11 +0000
Message-ID: <DBBP189MB1433FC226BB6225F6A279E7E95679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-37-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-37-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|PAVP189MB2388:EE_
x-ms-office365-filtering-correlation-id: 7ae586fe-ba9f-49ae-3dfb-08db44a70f5c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ONBRNMx+0xIDHV5+S4ubI3C1WK7BHSNEBmTDbr7NdR7mb+473w3c5JEkNXARcwkFrreH2gdiBaL4n/jEWwZf/4YuLRqhCqEpma9DVylGlqN5DjZXik8GWbVuwehdKWy9ieFt+hwh+ck2dJOuNLqqfQDUKxJaeGaUkelHWLZkHFmVgru9ArP27+ZtN2t0uU1Nrhu2uo3cTdZ+69pFU5GVeMOXRvIMWP2ppVQF1UgTDqkoe58WjobxPe6gkHlFrBXyUtfGAJNzA1ONUJcdYKHuCJVWpjA3lQ4ZFrkeZknu7yaUJoKH4V1Xhb8g88bI4muxjB6IyMouXOgetoCsWZmZoA3NtM0nqXziUVCHo30mNnKJ3RryWEuEq3SCTuVwYuduz9Xnum1klDdzhKMZ7bftWYvsybyVEUJ5whL8WvGaoWPLD/DH4vcbmRbIJRmwxV+7WxzhidtC1hwSv9M3SKxDSANbKFFAgGWoHPUk+0P1+7HRaeZzIRfab1IwQ1wpfwJNa51qYA4ey9Jqm92ZSV7b4wJoEgnI8tUwJHK31jxLUknAwdpTKJqqxFaW10faPsBa9db4BrgwlNFJq682HUnSHabyk7qNp2LMY7HvoxrxaGuKjVdVbdN+cU4ioWHL8TMN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(39830400003)(376002)(366004)(346002)(451199021)(9686003)(6506007)(26005)(38070700005)(55016003)(83380400001)(186003)(38100700002)(122000001)(66946007)(478600001)(76116006)(86362001)(6916009)(64756008)(66556008)(66476007)(66446008)(8936002)(8676002)(54906003)(7416002)(44832011)(52536014)(5660300002)(71200400001)(7696005)(41300700001)(4744005)(2906002)(4326008)(33656002)(316002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K0E4SERxTlo5WGY5VGxjaXpZV3NVMURncERnWEhmMkxhNlNQMFBCSWlBS213?=
 =?utf-8?B?QS9aTW5YQUp5ZHJLcnNCNzk2SDFYd0Q3L0ZzQktLdUEvaThSV3Irbm51c2FV?=
 =?utf-8?B?WXlkVmRHM21jeDhoc1lBTmdKRk5DWDlLQnRRNGl3bll4ZTN0Sm5iU3RVaTEx?=
 =?utf-8?B?VE42THNTLytwajFvdEJMZ2RIcVU5N0k5Znp4Ym5iZHBsNGF1VnBtcWtJSExG?=
 =?utf-8?B?dHgveHVNK0cvc2RIMUJUZzRiQy9rdFloK1M4TjFYaGMyZVpSVFBsRThheTcw?=
 =?utf-8?B?dnVtUW5QNEpldHZkZXgzWFBMVXYwN25ibWR6dWJxaE5xb0FHS2k1ekgyVlBF?=
 =?utf-8?B?VGgxMVJXVmFKUGxBQ0tFZzlLaHVkRU5JS0N6OFpMajVmSzY0L3dkaVBsMmRp?=
 =?utf-8?B?SDQzVlk2VWw2dmFGNFlSdGlCOUcvaS9TUWxZeUM2R3pXdmtxTDRIWnZyUEFa?=
 =?utf-8?B?R2kwZ1J0ODJ0b1daZ1Y4bmNVa0tqWjZnRHJrK0RWRlJYVGpwZXRxb0tXUlpx?=
 =?utf-8?B?RHR5ZDVvbnpzWit2UFJrNTBtTjBKWTFPT1FOb0RnSGZqMUw3UzA1TGdwUUhq?=
 =?utf-8?B?TTdGZWdCSFl0d2I2RWdNMW5KOTVnbk9lTjNLbHVRZEtITnlYY0xZSUo1UlF1?=
 =?utf-8?B?QUtXVTI4UzhHZmR3M2tzMFRtL3lBMDFweURQRis2VW5PbEJqSktZcldtV3cy?=
 =?utf-8?B?V01VWllDZCtLRkZZMXhZMUd3YWNrcURrTmY4L3QxOTBWVi8xNS9qdGNVZVdz?=
 =?utf-8?B?ZnRzMEtaSnlMa3ltU1V2dzhKNHU5eFdqOGNITTQwaitBdnFxc3dlVGM0SVQ1?=
 =?utf-8?B?dHJ2RUdoajZpVFhaUGFxcWQ2K0VkRjVmQjZYKzBTRWdIcmNKWU8zd1EwSkVQ?=
 =?utf-8?B?cTN2bmJxT2Z1Q3FNd3dBNlB1azAzRFF1ODg4Yzdhd3huZVhseWdXb29mYjVj?=
 =?utf-8?B?U1NJa2RMZlM5em9TMDMvL0RTWDhCWE9PQU1NTTdBZGZ1TnczMXd5UVU5eXZG?=
 =?utf-8?B?L1N2REphWW5yaCtzbE1jakZmdTduV0E2NjlYZjI5WVZFYUJNbjY1dUlqb2FQ?=
 =?utf-8?B?M0lFVUhURWlYYU9sdFg4aTVxUnZxNTFjSTF3a2hrYnRGTkxQa1Nidys2UDBz?=
 =?utf-8?B?ZGRlNjFSVlJ1b1hrL21jWU5XL21Qc2lseG9PTFpVL2xFVXBtMG9HUmZhZDZ3?=
 =?utf-8?B?RUo3TWg0bTBGdG1NZWV6bkUweDI4b1hBOUU0M1ZlbzAzenZtc1p5Uko0MDF3?=
 =?utf-8?B?VXF4ai9sWEp2QjRRMUxITGphTWdNRVJpbllMeW51UExJbzgyVEhjK2xOTU1q?=
 =?utf-8?B?OWFLeDVySVB4ZHgrWU1ha1Mrc0RzYUY3ZzBBVzZtcDBvVTRMUzFIVzdhNGhq?=
 =?utf-8?B?M0lWb0RGYVl3Yk5qbldHV0Y2UzFIdVEwZFluS0VPWFVzbXdjdkxXMXFxMWlt?=
 =?utf-8?B?dkkwQWF3OFBHeTNCOGZRWVBhZ1RmbVBudzBDVW40ZFRhSGZIK3VjaUQvdnVw?=
 =?utf-8?B?RlRiQmNyVStwVlVnQU1LM1hnQWErc3FBaFJycUw1Rm9ocXRLd0dNNlpmMVhu?=
 =?utf-8?B?RElTRTYvYXJrcm11VFAwZDFTL2Jud09acnNxaFFvNEhVMWsvcjdQaHZGcjNl?=
 =?utf-8?B?cFZjNkhrTWNMYytqM1N6ZXVJRTZGVnJic2tTU0tiY1IrOFplTjJQU1YreVhX?=
 =?utf-8?B?aDNsaE1UZE9TcWRUamR0ZjJFSGs3Wkt0MXQxaEFFV2MyRzF1ckhKSS9FNjJm?=
 =?utf-8?B?UFRkbnNUQkFDU0hWTkdQeGJuOW5ldVEzT3lDckFKdWpDY3ZqQStQY1NFNFFn?=
 =?utf-8?B?VVA1ZXNGYlQ0bSt5bXNXMFBmQ2tCb1l6R1Y2MElzeWYxRTZjdGNFN3FNaE5E?=
 =?utf-8?B?MzEvZU9MTENrc3ZPU2ZaajY0cHhGKzVHUEJRWjlBdE5IS3p0aC9Rc2ZIYWZi?=
 =?utf-8?B?anRSNkRDUURrcGJUQ2cwSUFId1E0U0c0ekF2SEVsU0FCQ015ZWZiTmRkUjdh?=
 =?utf-8?B?UGh1Y1dobUtBeGxzanVwMzR1dE9oemxYckdXSk4wSzUzajNjZU9ZRUJmQlR0?=
 =?utf-8?B?YWFXbnJwQXpKSStyazI0Sm1qUCtBSk9ZSDJQb2t4d08vREtsMmJrTThPZll6?=
 =?utf-8?Q?gLxqZnxozj4C03rn6vDpJ7ntc?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae586fe-ba9f-49ae-3dfb-08db44a70f5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 09:34:11.0888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CMWIJqWMmGYVacTDJqeWOP7zs3ByzIqnebMYE1u09AXV92otxQ6hlnPtipJSAzD6bayloEfgLAj3gDurRD2vh9rIkj8m8awPE03eNlh3BKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVP189MB2388
Received-SPF: pass client-ip=2a01:111:f400:fe13::708;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
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
YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBTZW50OiBTdW5kYXksIDIzIEFwcmlsIDIwMjMg
MDY6MTgNCj4gQ2M6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVj
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
IFN1YmplY3Q6IFtQQVRDSCB2MyAzNi80N10gaWdiOiBJbXBsZW1lbnQgUnggU0NUUCBDU08NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rha2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNv
bT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX3JlZ3MuaCAgICAgfCAgMSArDQo+ICBpbmNsdWRlL25l
dC9ldGguaCAgICAgfCAgNCArKy0NCj4gIGluY2x1ZGUvcWVtdS9jcmMzMmMuaCB8ICAxICsNCj4g
IGh3L25ldC9lMTAwMGVfY29yZS5jICB8ICA1ICsrKysNCj4gIGh3L25ldC9pZ2JfY29yZS5jICAg
ICB8IDE1ICsrKysrKysrKy0NCj4gIGh3L25ldC9uZXRfcnhfcGt0LmMgICB8IDY0ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4gIG5ldC9ldGguYyAgICAgICAg
ICAgICB8ICA0ICsrKw0KPiAgdXRpbC9jcmMzMmMuYyAgICAgICAgIHwgIDggKysrKysrDQo+ICA4
IGZpbGVzIGNoYW5nZWQsIDg5IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQ0KPiANCg0K
TEdUTS4NClJldmlld2VkLWJ5OiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5A
ZXN0LnRlY2g+DQo=

