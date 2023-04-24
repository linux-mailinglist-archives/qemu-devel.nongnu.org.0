Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52226EC90C
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:34:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsa1-0002Ry-QV; Mon, 24 Apr 2023 05:33:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsZt-00028b-JK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:33:47 -0400
Received: from mail-ve1eur01on0702.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::702]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pqsZr-0007kA-RK
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:33:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QkTNQrSfFzfJFWw9j4xbwhyvGr0a/ZWzRVK87sGTtqKKzunPQCukFM1pzeNoFKLacCwl9nGqv/WUxuaX+2ZpuH6LIzMyuP7TrBjD2YF4LqCTtjWHOxQOkQLm5pG9G7duPDMkSFRSAhbItitTqF6KwJfPxUfyLqPMxkGkIiiiG9rE/SCS4AIXWtNVmKa/miVVXchbhOwLmBOJ+80rQBU81oMTFUWyKkYTpdqcoFxMK3RT5EgipG0gA9wkLSmBqYQE2wZltEIb93q//48FA8yJJMa0GAhU78ro75JkGIYIL2Aq+50siF3jjce91jD8jxC7DCaquV5Z4SZ9iB5jE4l+xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr7UtBRxZl3I+G7QPxUGKmfSf+pZmivPFucE7GC/rRo=;
 b=HTf0pVghzomOUghS3vZLINl4A8gr+BJZbBPI300opVHGtiWSv14GDzuxCSvRu9OVGoZTY+NO56RNhGRLkgaz1L3ExYabN70X2CdHRjBCOq6w34H3LWrQWryadW3vPmRZeiCseKyUGrTenYXxDQUC9vkS9IBg+fLgEkgXkOkSCF18Xy1enTgTeyoki+FlAZ21K9VvHkXt927IzxJmTi9OHiXGY8jxbiDjFrY1O/lO0KAwkXVTajX4L1a2SHrricKH5i7/bJ0Jn7R0QTOjQGFpQ1bWqvUuxUIaiykdTKvGhMaS+PUSCoss0cTco8b5vN91w2eqkpY0voFG2SUkH3nguQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr7UtBRxZl3I+G7QPxUGKmfSf+pZmivPFucE7GC/rRo=;
 b=KLnUC/U9ON9YV7lArDsFA6PHSAgAVEyyFH5dbxr7Px7twNHSxeBCdaklWGAci01t5vHq7HK+PigUQafooqI6yIQjfhsn8X7nfGXPgEGea7R502pr/bADmA1m7elAN5XvVSqQGgvUx5ypXhlYY/EVgDpnpOWnGxDclJX62NRqWYg=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0793.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:12d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 09:33:07 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 09:33:06 +0000
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
Subject: RE: [PATCH v3 29/47] igb: Rename a variable in igb_receive_internal()
Thread-Topic: [PATCH v3 29/47] igb: Rename a variable in igb_receive_internal()
Thread-Index: AQHZdZrt5xmmNTacZkW0Xn8kDD8Heq86NEdQ
Date: Mon, 24 Apr 2023 09:33:06 +0000
Message-ID: <DBBP189MB1433BDB7F04B6EB27E51F85E95679@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
 <20230423041833.5302-30-akihiko.odaki@daynix.com>
In-Reply-To: <20230423041833.5302-30-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB8P189MB0793:EE_
x-ms-office365-filtering-correlation-id: 302895b7-bf5d-464e-3595-08db44a6e917
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LApzZb0XMCS3RpZ8FaRaAvj27eVqaveEm0Uaed9e+abaIzTZzHjzcDBW0YKGpJv7TsEnwh9cM8vUk64je+dHcvEDUa1SHYJGSkG3Btj64xvvsI8kqD0sVEHK88ymm36w+KFqfS1xpj2n6Qelfzv/1x54pClC9Gc7wm6VeZoSN5xh5fJKXkF6JJhuyAR/LPaWfQfZjwKPPO48HNzYDujdhjSPm7InCwhiRu+rvjT8ltTArQC12O9anDD4ULpEoryOXyPvY8OqCoDNMDNuo56NaAgA+eZb3otxif//RcVib7nMNZzOAs9kOcZdNnpjawrqdEeQFxDfvnTlHNtE2YFoPTRUhCpgv9BzqveIj0W59hh9n4F6MX2njWd8VzK1FYb51JEkP7mK5NTgs1Wa7TuZ28g2wGBeTlv4iPPGLMPNv4A9k4XfFBu64gqrQ857NERscX14uNTGJyNoXTarPwZNvByBYRv33YODpVfTS0+hLjfWwsVKw0Eybnrx2kSYD3IY1ZeyLKj4TP4v1Oehc2agGrGWISuaPp2wcAAgtV5kxzo83uhNvoF8iaJbHgdqsQ3ZUBymTlTIBdv0QPovIW8w/T98GxzN4rYt4LACSdnKVz12ijkm1VcyT0bfmLfgG5dG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(376002)(346002)(39830400003)(396003)(451199021)(4744005)(2906002)(76116006)(64756008)(66446008)(66476007)(66556008)(66946007)(6916009)(316002)(4326008)(52536014)(44832011)(7416002)(8676002)(8936002)(5660300002)(38070700005)(41300700001)(33656002)(86362001)(55016003)(9686003)(26005)(186003)(122000001)(71200400001)(38100700002)(478600001)(7696005)(83380400001)(6506007)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SzdKdzFDay9mMzRaeHAwTGZMQjk2ZldDVHJnUC9CWkdqcElGb1Y1blZQNEY3?=
 =?utf-8?B?N3VEV28xTStVQnNzcWlYaFdnZnlBcVYyeE8weFg3VGRrS0xFRjRzU21RZzZU?=
 =?utf-8?B?WldMRURNWENPQkY1VzRRa2xOZ3FEVVZGVWNaNXJGTTNrczVlM0VWL21mM0xp?=
 =?utf-8?B?cUowODFYaHQyK3ZpbjJySEwzNThDWlp5OHZvREY2dDFZSlhrNEd2VXhUSFho?=
 =?utf-8?B?WlVNRnVIZE5LcGMrTU5hZjQxMDNJcXN0S3VDVlk1aXZSUU01UTJtK1dDVlpm?=
 =?utf-8?B?YkJNajBGZHNscGsrS0R4dmo1eUdDWHFFcGxQM1RtNytITmF4cjNwK2l1eVhj?=
 =?utf-8?B?WndQWDdrOXZ2Y3BuWFdJTTVUcjdJMGRQVjErVnFid0ZBV1plMWtMTnl3Rkdy?=
 =?utf-8?B?cEJyakRIMG9SU3hJK09KWkpiUzlCWUZJQVZMcjFKdmV0UmQ0NkVzaW9uM2hq?=
 =?utf-8?B?aGZtZXpJTDNXekxYVHpFZ3BvWXZMckFoYXI1SG5kM2ZxbHk2Q3ZxdElVOVUw?=
 =?utf-8?B?VDF2Ykx1MXlhbzU0bEdOZHc2b0MwTm54aXdCS3FJRWQwSDhyZUgwNXZ6b3d0?=
 =?utf-8?B?TlhadTY3MHFXZFJGUnNWdWNrU0tYR3FuV3VtOWlpZDczU1ZQVVhzT013aXRp?=
 =?utf-8?B?Z1JvL2M3TSs2dE83emxEcDdkZm9rNnFPSHgyL21mWWVpem1sZ0ExTkR2Z01O?=
 =?utf-8?B?Rlh4QzhPaTFzaHVKcVFnT0VzKzY3NnNFTFN1WTMyU2pGMFNraGRXNm9Fakow?=
 =?utf-8?B?OUV3Wk45UDhnRkcvTGwvTWZHOWt2UWFBVkJ0VXEydkpLNUVTRmhIdDhlb21F?=
 =?utf-8?B?OXIwbStOclEvZ3BMM0dBMzRzVHBWVEE4MVljbVo2RUFNVHQ1YzBGY1FzV3BZ?=
 =?utf-8?B?OGVnOE5DMmVzRXI2NTcvdXBtTDZxM1ZSV29sRnQwWDdLVmJNckJZeURWRDZj?=
 =?utf-8?B?akJTSzc1Vmt1a2NqcEtYdXAycTdIbFliRmFBY3VQZlZMV0laTGNRSjNjQ3Yx?=
 =?utf-8?B?czVDZXVUSHhDWUl1V01mODl3TlRUeklqMVlmNnRGTzhhK2Y5Q3RvdC9HQXNG?=
 =?utf-8?B?OFYyNmd2VWl6L0VDUlIrOUJ0N21BRUtMdnBYVUVUT3VRV2ZQYWlsWW92Ty9I?=
 =?utf-8?B?SkhCTUZhNXhkS2hPNFRmeVloRXFwU0ZsYVpPSGJMWXNrLzRVa0R1NXAvV0NK?=
 =?utf-8?B?NTJQNUMvVk1aeEx0cnZzMVNPVzBsdnJORXR6WGZqS0t6Y3V2SjllRy84ZmJp?=
 =?utf-8?B?SWg4NzVvRHQ4U3RBc1lZRGV6VjhUSm9YVEhIampBSEtzaEtueDRmekxJNGY1?=
 =?utf-8?B?QVNEM0hmNjI3dUhmRmhhaUpFVDVDMnllMW5EZ3M5Ni95cUVXSjlqVUVhaXR4?=
 =?utf-8?B?MTJTbktuazBjWGtTcXdmRnFBQ0tDZVhSUldrNm85dnhqUUNTTEUyb3FVWkR6?=
 =?utf-8?B?R3JVckxCdDM4R09LQkM5c3NFMTIrVDliUkl0aWZ6eDNSejNUTmp3Z0FJd3B4?=
 =?utf-8?B?VEhKRGprTEs4SHhaZWlCQzVsRzUxcjVOWUErRmloZHMwL0U0VUE5N2ZVd0Ir?=
 =?utf-8?B?MFk2dGZySmFuQUFvUFVEMnBXY21ITVNjNXJDSGJBd29FdHNTWEpGRjBRMTFh?=
 =?utf-8?B?alJtbjIyTEJkYVVQOUpiaE5ZNlpSdlNnOEZ2aTQyWDVEVzM1U09aYVR4WVJs?=
 =?utf-8?B?WGh2YXEwKyt2MDdFQW1NSWFMR3JGZldmUXNRczhDdnlhMUF2a3U3d01TNlM1?=
 =?utf-8?B?czNRNVR4ZTVHRUhDSlk0cHVldWxsSDI1KzRWbTFEQmdGY0hseU80Z1BSbDV4?=
 =?utf-8?B?V3REZ2NMSy9jRnJqNzJZeEFQbEF6R2Zna2ExMVpLQzV4M2FuL1JSSEJ3dVlj?=
 =?utf-8?B?WjNaWldOU2hSaGtNazBqVUVVRTVOempaSjFoMjdnSnN4SHFjTDdqNjcxSmw4?=
 =?utf-8?B?R2x5RzVEci8wVm4rNmhVMXNMMWpMMVJlSUY4RlJoT3p5M2FYTnZsTFo5cFdh?=
 =?utf-8?B?ZWd5aWoyTDNIaXp0L05xVFd2VmZvOHprNjFORUJlVzBxNjNSczJFUk1HNjVP?=
 =?utf-8?B?Ykd5aDJFMWViajlsSEhid1ZpckREemRoM1VSLzhuSkVVZ2FzTU9TZGNIbTQ1?=
 =?utf-8?Q?hSBmwgQhcmYdLOhj/8wAaSzHU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 302895b7-bf5d-464e-3595-08db44a6e917
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 09:33:06.8854 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fwLNoxJ8Tb2zwytg6WXPZg2VecIf7KvCNI6n+QQp7xX3YgAMyxPxRmpGRxw5/z7vV7LNcNrXmM6Ps0brxx4+gNQnnl5xr3bozHzu6a8vK7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0793
Received-SPF: pass client-ip=2a01:111:f400:fe1f::702;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEFraWhpa28gT2Rha2kgPGFr
aWhpa28ub2Rha2lAZGF5bml4LmNvbT4NCj4gU2VudDogU3VuZGF5LCAyMyBBcHJpbCAyMDIzIDA2
OjE4DQo+IENjOiBTcmlyYW0gWWFnbmFyYW1hbiA8c3JpcmFtLnlhZ25hcmFtYW5AZXN0LnRlY2g+
OyBKYXNvbiBXYW5nDQo+IDxqYXNvd2FuZ0ByZWRoYXQuY29tPjsgRG1pdHJ5IEZsZXl0bWFuIDxk
bWl0cnkuZmxleXRtYW5AZ21haWwuY29tPjsNCj4gTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0QHJl
ZGhhdC5jb20+OyBBbGV4IEJlbm7DqWUNCj4gPGFsZXguYmVubmVlQGxpbmFyby5vcmc+OyBQaGls
aXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQGxpbmFyby5vcmc+Ow0KPiBUaG9tYXMgSHV0aCA8
dGh1dGhAcmVkaGF0LmNvbT47IFdhaW5lciBkb3MgU2FudG9zIE1vc2NoZXR0YQ0KPiA8d2FpbmVy
c21AcmVkaGF0LmNvbT47IEJlcmFsZG8gTGVhbCA8YmxlYWxAcmVkaGF0LmNvbT47IENsZWJlciBS
b3NhDQo+IDxjcm9zYUByZWRoYXQuY29tPjsgTGF1cmVudCBWaXZpZXIgPGx2aXZpZXJAcmVkaGF0
LmNvbT47IFBhb2xvIEJvbnppbmkNCj4gPHBib256aW5pQHJlZGhhdC5jb20+OyBxZW11LWRldmVs
QG5vbmdudS5vcmc7IFRvbWFzeiBEemllY2lvbA0KPiA8dC5kemllY2lvbEBwYXJ0bmVyLnNhbXN1
bmcuY29tPjsgQWtpaGlrbyBPZGFraQ0KPiA8YWtpaGlrby5vZGFraUBkYXluaXguY29tPg0KPiBT
dWJqZWN0OiBbUEFUQ0ggdjMgMjkvNDddIGlnYjogUmVuYW1lIGEgdmFyaWFibGUgaW4gaWdiX3Jl
Y2VpdmVfaW50ZXJuYWwoKQ0KPiANCj4gUmVuYW1lIHZhcmlhYmxlICJuIiB0byAiY2F1c2VzIiwg
d2hpY2ggcHJvcGVybHkgcmVwcmVzZW50cyB0aGUgY29udGVudCBvZiB0aGUNCj4gdmFyaWFibGUu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBa2loaWtvIE9kYWtpIDxha2loaWtvLm9kYWtpQGRheW5p
eC5jb20+DQo+IC0tLQ0KPiAgaHcvbmV0L2lnYl9jb3JlLmMgfCAxMiArKysrKystLS0tLS0NCj4g
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KUmV2
aWV3ZWQtYnk6IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4N
Cg==

