Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398496E334B
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:14:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlL8-0005aK-Uq; Sat, 15 Apr 2023 15:13:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlL6-0005aC-SU
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:13:36 -0400
Received: from mail-db5eur02on2123.outbound.protection.outlook.com
 ([40.107.249.123] helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlL5-0008J6-Ff
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:13:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WEdcOUiRzxr1/uV7UMpZ4shbvqzjDxccfOvv/BmUyGUxyjZZb1tO4S/iveVd0ygI2jbkPtseIfEIgsj1mnXzwZvN5fIAtCb5Iu2WtwxBN0ZLaaL1JxPiSF40tNW3+tH7W8U1efblVffCsCqMJHLEEeu2AT0Ld6VYAqme7UyYzBKplwwwpmcswTzWhGRv3sW1jpKsPqD4YjEayPudlOXhJmBl9QeavmRQ5TvILnjwruaRggSjhP7um1YIJCVeB/U1fVRGo0aGdf4pz+kAwm6pPKCc/ACpLI6R1QUY9dTFY3qJZZgP5j2DDikkjm+4C9mv3LqedhxyA/jzfiIC9NjmzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CN2g0JAe9/UEyBkAu1SdBOQSWjJGYyF9MZVFxfJYv1s=;
 b=fm8b7Ko1u7jHYupI3kpQaVV7LscQmcKt76vjeoGiM8zhznO86/aQssV2c3F/JEXu4NyaZuXm4t+lnqROqGhSvcBFB/vXr3Qrib3KXof+EvnFPL+mgKPxkLZPuRouZDN2rBm3N7rL631KW0TNa6+hRAITzSCCl4LLLS7FM8pzaiFv+/No+oBclxRKrf27I/4UuNeoQa5l10JnpkXPwMtp/EIF6kGEaD3wZCGGKfyCbvo3KQZJy6mm0RVf7aK3EEijSlCn80/i3QYrjJ01EVAsGi6tXcAwVCrH1sWXTKJxxR+VIPp5AHtz90RcBs1IKJLVfc6Re8mHaIWD67dA9yutrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CN2g0JAe9/UEyBkAu1SdBOQSWjJGYyF9MZVFxfJYv1s=;
 b=jjrsDh98IR7JxpmFc0uaIfEyRBAJgqBX+RDxeYMhY8Gz9KoSFpXypd3pUi3SSb2JZMmAsLaOZuGUHWJlhEDaBgGF4sBcN014qq6ZQ+CU45NfFblMxdFJ16hf9Qc/E0RVN8WpLVspY8TsQuZkJORxL1RcsOs06yo0aQrc8+4l+yI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:30 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:29 +0000
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
Subject: RE: [PATCH 05/40] igb: Do not require CTRL.VME for tx VLAN tagging
Thread-Topic: [PATCH 05/40] igb: Do not require CTRL.VME for tx VLAN tagging
Thread-Index: AQHZbsWbRpOT0A2/xUm2Z/5ZuNyWUq8rFTgg
Date: Sat, 15 Apr 2023 19:08:29 +0000
Message-ID: <DBBP189MB143381353CC9488759A882AC959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-6-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-6-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: 2cf7cab4-0dc4-4bdd-9e23-08db3de4ccad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SYa7FaamffZLZJa6OnXDtxD76ynbPw2I5vsM5qRWNSd/w3g3LN/+D4Fwns9trox8yJ3pwRd7Bg5kEFFnl9Nml01bJYHs4087jcUTj2lL20UiO2QzJE1tn2lYNIvEo3QGbLIUl58RFGr/roG1nTeqoduxcCXMpzGy2gu5Eonf1gfY0I212m7pblzJkPYFhTCSYF+ibzlJgs2Zd5YbSEplD/BtuVlqvchdRJ16psF64ofUIZvzcIRNni6zqPMXEEXdQWPKS40Akm7uD6KNOx4SN684uCVpSMk6RSwZViDTniAQhAAZMUbBN5g2tcJF3VQJHaXQ8Ol4AfPXVzKQRa9I6zWreiMr0DLAb7L/icY27b2pn1jhVrIxnB4g2+Jh2h0ferZppFkeD3YvHKwZxsKL6hLR0rC65LiOMTGbQ9fBwmhbfeqJJO//4bJEijI0oy5nN3NRKCYcThQIm+XGi6Ryk/D9rECii3N67XL8W4xn/PiZ/lof4oPUR/oRl3yqoVP9g80f4Dw36OMRKvww+yGHFn+sph7Ld7XCnZX2tl6rDJGdoANlapgaKBOe7mYpirOZbHTIDe7b4gXFniWNcJe6dIZtX599afRO4Rxe6F0XnlL4usne3PVFKH8Agz0kgLgG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZTJ3dUthZG43MlVqOWxxbWcyc0ZqR0ZLNCtVMk1Ca005U0N4Mk42bVRrMHF2?=
 =?utf-8?B?UXhGZkNhSnExWkRDZmszam1JMFZEbHN4dkRPZG9OTFJHa1pNN3d2ci9JMmNu?=
 =?utf-8?B?Si9Oa1RjYWFhd2htbnFHdWg1dnhjaC81K0MvRWVkODEyUk94a3g5Q28ycEU5?=
 =?utf-8?B?VU4zdDkyNktHZGV2WTlhbkRUb1ZYcmRiREVJdjZwVWYvREhhdG5Fa0s3SSs0?=
 =?utf-8?B?MytxTk9sUnQzTkdoWGFkSUxuM1VVdjFQK1BPUEtvOGZVSCtYRC83ZXRFZFpQ?=
 =?utf-8?B?VVYyS3kxUjVzYzNMa05xWVNEU0hLQ3h6ck1YSnA1eDY1SDBjc3JxM1NmUjhz?=
 =?utf-8?B?MDkxeTRnQk1hUzNmSjgvVGd3dFcwajlmZ1prV0hjRlpFNXVEQ2R3WWJLWkZY?=
 =?utf-8?B?S0JGdm54RDBSenVhZXZpZTl6TnR1NWFMRHRHZFhxUUJBY01ObWtYalRDSWNL?=
 =?utf-8?B?b2d0aFljR2hhNEpFSTFQdFZDV0YxZkhJUENzQmcwUHdscXplRlEzTGkyU0Jj?=
 =?utf-8?B?ZmtjY25UUllXdUFndFBHNTdreWNha2l2aUluUlNHTk9TNzh5MzI3d0RySnh4?=
 =?utf-8?B?Z1lweTV5ZTc1SVdiUy9zZE5TOEZHcTUvTkhNN1c5UWZKaGlMUk8zaWtkVk9U?=
 =?utf-8?B?REpRKzlpdUdmYnRCRFZkVGNvTDd6OFdxeWtkdzJITHAwb25LUjBXTktLTlI2?=
 =?utf-8?B?QnJ0RE02THFMUW0rSFU3K1VQN1lHbE42RlFJUzl4UkRkZk8yc0c3SzQxUzBj?=
 =?utf-8?B?cEhOWEJxclo4czFmMVBBVnY2NlF1MGxibFR5YzM4Ykx1blQxenBsVTRzQ29Z?=
 =?utf-8?B?VGxlZDhvRjlQZHVDZWthREJaOE0zVFZvQThsTjE4NFBrTDgxdzVLc3liUHNW?=
 =?utf-8?B?YW1oYklKOXhMYXRnVlV4eDQvekY0eUFQUGo1R2wwZkhoK1g1ZEM3YWVkUEp5?=
 =?utf-8?B?czZrMzdkSXJ2VTRCM3puL1dMU2NtWStCVVN3UitRVTRGQ1FiN3J0eEVhNXli?=
 =?utf-8?B?VmdqM0cvV3BGTGJnSzd6RGdobTRJdzhPSmlzeFoxU0Q1RFY5Zk5yQUJNRzJk?=
 =?utf-8?B?ejdLa0R3MnZaN3p0QkU4YmllYzJ5VTUySkxMVEdHSVZPK2tHUG5Kbi9PN0Ry?=
 =?utf-8?B?Q0p1aWlGaFM1VnlWSFNZWU9GY2pzTVhJQVcyUHFOSlF5OHd2Z0QxYXVkUDhY?=
 =?utf-8?B?SWJqUzA2ZnJUNkU5MU14MzdVV0VWQ1FWZHFlNkI3Sk1YVzJXRXBWUUc5SzFJ?=
 =?utf-8?B?SFgxSGt1Q01NdmxSLzBqMkRteVIySUo3am43aU5EL2xmSTZOc1ZZY0c5QmRa?=
 =?utf-8?B?WHRTT3ZzbFNyR2w3SkkrM3BLUmlLYUJWZ3BKZU00UDhhZlc2YmxJNVJ4RFNo?=
 =?utf-8?B?OGxLSHN5cThSK2FVbTFKSUlEd3BZb2xFRlp0VmFINUxzWGJPNFl6eCtMVi9z?=
 =?utf-8?B?OWFsQ3BnN0xLbTEwaW9PeWYxV0VacHhjUmxYTjVwR2RZY1lVcHdMcmcyZHFM?=
 =?utf-8?B?YXpJeWZLS1RzWVVUTGpDajlEa1RBVFlaMlRSOXk5M01SMHIwVEtCTms5T1N2?=
 =?utf-8?B?UmZPSnpCYkRKRUJIeVBJek0wTGF3TDk0ZkpzdmJHaFFaUEhDejJJMXZ4N05n?=
 =?utf-8?B?RVFqeFRMS1RnTitDOHpoeEhLZ29EZDdaZ0ZvYy9EUmJrSUJFTklyak9LZkpm?=
 =?utf-8?B?Z3hiNGNxempjZUZId1k5aWtCR2owR1ZXUnBPeGhhakltdEFCSHRjd0dkUW5L?=
 =?utf-8?B?K1A2Q2hxTGVDaHZOQzhBaTByYnJJRmZqWTVXR0xSbEwyVis1cTBDTHdxS2JY?=
 =?utf-8?B?VmVZRzJIQ2w5T3dGRWczZFp3emtrMEpOdmUyR2dPOTgrNERmOGtKZ004Ykl6?=
 =?utf-8?B?SWlzVWE5VDhQY2pJdzNnbGtObUcxSkZxdXBqSXcyU0ZjTmNia2pEWFMzYit0?=
 =?utf-8?B?Ly9TZEc3M01Za3FZZXNqT0xmR0IrcVNvSUJNT1UrWEIxOWgvL0liejVYdnIr?=
 =?utf-8?B?eGk4WnpBWTdiMDFuTG1veTBveXNHUFd6aGVzUitmNXJLS2VWOENvVXJVSEJ3?=
 =?utf-8?B?Um1yNEdKWE1QTmxhRTRmMTl1SElXcUJXNTdJNlhCcDVicEljRjNVYWpLN3Fw?=
 =?utf-8?Q?lvf4x2PZCZM8qPq+L3B5stfEi?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf7cab4-0dc4-4bdd-9e23-08db3de4ccad
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:29.8354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kvu0UFm3SgdaaOmu+k9YdzrtTlAXwRxf2Uab8ONmyJ85vynHILV0hqneB7E3AWsu+nd/V2JZO3kiBDgVzCOCgdA3uj6z+cLCtawk+YwLp2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2239
Received-SPF: pass client-ip=40.107.249.123;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogRnJpZGF5LCAxNCBBcHJpbCAyMDIzIDEz
OjM3DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTLiBUc2lya2luIDxtc3RAcmVk
aGF0LmNvbT47IEFsZXggQmVubsOpZSA8YWxleC5iZW5uZWVAbGluYXJvLm9yZz47DQo+IFBoaWxp
cHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAbGluYXJvLm9yZz47IFRob21hcyBIdXRoDQo+IDx0
aHV0aEByZWRoYXQuY29tPjsgV2FpbmVyIGRvcyBTYW50b3MgTW9zY2hldHRhDQo+IDx3YWluZXJz
bUByZWRoYXQuY29tPjsgQmVyYWxkbyBMZWFsIDxibGVhbEByZWRoYXQuY29tPjsgQ2xlYmVyIFJv
c2ENCj4gPGNyb3NhQHJlZGhhdC5jb20+OyBMYXVyZW50IFZpdmllciA8bHZpdmllckByZWRoYXQu
Y29tPjsgUGFvbG8gQm9uemluaQ0KPiA8cGJvbnppbmlAcmVkaGF0LmNvbT47IHFlbXUtZGV2ZWxA
bm9uZ251Lm9yZzsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0K
PiBTdWJqZWN0OiBbUEFUQ0ggMDUvNDBdIGlnYjogRG8gbm90IHJlcXVpcmUgQ1RSTC5WTUUgZm9y
IHR4IFZMQU4gdGFnZ2luZw0KPiANCj4gV2hpbGUgdGhlIGRhdGFzaGVldCBvZiBlMTAwMGUgc2F5
cyBpdCBjaGVja3MgQ1RSTC5WTUUgZm9yIHR4IFZMQU4gdGFnZ2luZywNCj4gaWdiJ3MgZGF0YXNo
ZWV0IGhhcyBubyBzdWNoIHN0YXRlbWVudHMuIEl0IGFsc28gc2F5cyBmb3INCj4gIkNUUkwuVkxF
IjoNCj4gPiBUaGlzIHJlZ2lzdGVyIG9ubHkgYWZmZWN0cyB0aGUgVkxBTiBTdHJpcCBpbiBSeCBp
dCBkb2VzIG5vdCBoYXZlIGFueQ0KPiA+IGluZmx1ZW5jZSBpbiB0aGUgVHggcGF0aCBpbiB0aGUg
ODI1NzYuDQo+IChBcHBlbmRpeCBBLiBDaGFuZ2VzIGZyb20gdGhlIDgyNTc1KQ0KPiANCj4gVGhl
cmUgaXMgbm8gIkNUUkwuVkxFIiBzbyBpdCBpcyBtb3JlIGxpa2VseSB0aGF0IGl0IGlzIGEgbWlz
dGFrZSBvZiBDVFJMLlZNRS4NCj4gDQo+IEZpeGVzOiBmYmE3YzNiNzg4ICgiaWdiOiByZXNwZWN0
IFZNVklSIGFuZCBWTU9MUiBmb3IgVkxBTiIpDQo+IFNpZ25lZC1vZmYtYnk6IEFraWhpa28gT2Rh
a2kgPGFraWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gLS0tDQo+ICBody9uZXQvaWdiX2NvcmUu
YyB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPiANCg0KUmV2aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1h
bkBlc3QudGVjaD4NCg==

