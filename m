Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D87A66E3344
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Apr 2023 21:10:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnlGf-0000Vk-KA; Sat, 15 Apr 2023 15:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGe-0000Vb-HT
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:00 -0400
Received: from mail-db5eur02on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe12::727]
 helo=EUR02-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pnlGc-0007N3-Sq
 for qemu-devel@nongnu.org; Sat, 15 Apr 2023 15:09:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3XD1ckXeeVner7JyZjovUdcqojaxtkdq9YIrdwzJ0O3D8yuDM/32u1Z1YeiIDrGZcih07e6huIAuaNj9cdhJD+j/DWRu/hnborMB82JF+DuE4epPDGE5Edue3uGX8ajRngr5xF0xTBQitADlpIljAtUbSpN+O7GHrg3W1lcQ7712/QlzBvQOQzZwevNuz11U/p7Os39l1ih5fMNqrmS0XSAhvE75/2w7wuqcFDCJiVPVLxvrcBhgfrcokAY0YCHDv5JPRxrAIp4G6/mB/Y2lIp8422UPjKdz/g21G31pV2/JGlZC2WGSJz/6xsuJ25T0cSstMxmgz1j03uTVZrXBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgxp31rwG7LXY3VUvLfdeRg5RWC85Lf6RGw4OyPGHBo=;
 b=aaZeBEXZ/GFMgG1m6necQDlJ4telHCoLxKhxH1jAzWVBLubZQDKwsY3anhF1SP/k2vZbi2MzOd8V1rOQEVyezrDSUzzVPDevOaWrCnhGvz4ylriO1v7S1GlduaCaaAjRDpozm6VLOIeCYrouxF96DqdFINWYZTciqonwNAlNwzBGyOz3Y32x3wV9Dm3LfvI6bqes2rRqMDv+n5X291ym2/yz8FkV4B/2A+qnVIaCdEBhj13qFFB6GAEKuCz+5KxOSzahDE0SRtoHkTcMXuBaQaYGeJMkUJiwXqt54jHrzuHoRlMhKL2Y60MoT6iO4pSeeM+Fo7fjODFbXk7YeYchjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgxp31rwG7LXY3VUvLfdeRg5RWC85Lf6RGw4OyPGHBo=;
 b=krIDcwvW1C4x1Rwc9qgYij0S3+v+g3BQoSkngXOCNUtHwc8iqQqGaJymo4HOgK4xlauAG/dq3KnwIQlXFrygjoP678gxEPcurEOh/L5KN+YDqi/KZmlzdZzBHH9ifNMTzPqjEumy+HMdBTGMD1+UPz0QdqYjg189TsBeZ4D7k4o=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2239.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:38d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Sat, 15 Apr
 2023 19:08:43 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::c697:dbef:e1d6:c2b5%6]) with mapi id 15.20.6298.030; Sat, 15 Apr 2023
 19:08:43 +0000
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
Subject: RE: [PATCH 22/40] igb: Add more definitions for Tx descriptor
Thread-Topic: [PATCH 22/40] igb: Add more definitions for Tx descriptor
Thread-Index: AQHZbsXJ+erJ4Wk7QEG65XAhDo9B568svLbA
Date: Sat, 15 Apr 2023 19:08:43 +0000
Message-ID: <DBBP189MB143391E4B52F02917F3C6A7C959E9@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20230414113737.62803-1-akihiko.odaki@daynix.com>
 <20230414113737.62803-23-akihiko.odaki@daynix.com>
In-Reply-To: <20230414113737.62803-23-akihiko.odaki@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|DB4P189MB2239:EE_
x-ms-office365-filtering-correlation-id: d163ed56-410a-49a7-3891-08db3de4d4cc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jrZ3vsuifkmTfL2QaW6rdNWe/Q7XgO16FlJytFyuhhkPlqEHmT1YwvXI+197YP4SvLDyr/w5I6k12MZPLA+IsoVBJhX86VlOsdHLN49n/5G7IunAC+t5w03ptX2aWE3HRIoRtx+4FyG0pqQyrEs9yUz+F4LFSAD2zXTozJ01Aup3sDQHdaXHzKGcEAwehLAOjeTxehCxzB+ZWjJqQL4izn6DIXnfcfia1TvYCZE4ifrRI48Iwyg7II6QufFsNjoSeXESEtDK4xdfX0tGLbfezgF+7K3pSbeZNX3u9KmEIXCx7V4ckH4pk3qQuXbRoBlqG6BYe7GyKIh6EEag/j6SOCfJv8nWBqyqXFkx0lFxeLyCnPKuJ4BxKsgZgbJGa6gh4tfABObPHDAqffIU0TwdzGtZTlmjKLv0Kft6l21MneLrjRHPOj9o6PnEIEVRfNFdv4tuiydT0THbrs/w/1NKzbTIC2H5OsdELG8lunjiMr3Gr771FqQUXm+IeXXC06i25likUN/hlIgKLe08DQSYv0Xq6dCozotgeStBZQBG7naq/heMWslptfeBDnkrJozIkHqTlzHlzBgKkFGEQJ2LeMsBog/N3yB9kzBVtiPPltDyJGwZNVoBfdJWxA5u3cov
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(39830400003)(376002)(366004)(136003)(346002)(396003)(451199021)(55016003)(71200400001)(7696005)(38070700005)(2906002)(33656002)(26005)(6506007)(9686003)(86362001)(122000001)(54906003)(8676002)(6916009)(4326008)(41300700001)(66446008)(316002)(64756008)(76116006)(66946007)(66556008)(66476007)(38100700002)(5660300002)(44832011)(7416002)(478600001)(8936002)(52536014)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGNWZWlGVUlvekV3bHZwUU93ZUFVbE9aRmJNaTh4dnNXYVNRWGJsU3pYYVFm?=
 =?utf-8?B?ZnlGQnJBQ0FvNFJvK2psWDIwQXZEL20wVlZXM05wMUszazBKa3pVaWZBMzB6?=
 =?utf-8?B?OHlBT3gxMXVsSmgrdmp0Y2FrOHl2UjVDbzRiNkZDRkNKb0FHcm1WRzhnZU9Q?=
 =?utf-8?B?YWRFQmUxKzU2K1JwcUMwaThHdmtXME1Oc3Q4d0VoUE8wdWtRd3NJU2FvY1J3?=
 =?utf-8?B?Tk5sZklBcko2b2QxOXdQeEM0ZkllaGhRdUNTeGVxQ3dlTkpBSnMvM0lKc1VY?=
 =?utf-8?B?M2NHK3NRZnN0dTNoQWZiaEJ3ajBNcitvNkNJSUJLNXZxckRkSVF6ZUFoTDNV?=
 =?utf-8?B?ODR2MEZOVHJmb3EyNi9BS1lpby83SkxjVDByVUQ0WTltRUhyVW13TFh0U2M1?=
 =?utf-8?B?SFpOUnliUE5GaFZYUTR2RC82OFhqR3lOSFRYeE5Tbml2dTU4SUEvbUwxazZJ?=
 =?utf-8?B?aXZ1NWFscXNmUFVmTTRaNlNCM1E1Z2IwV3ZIYUVpbGpEdjdwdXZLUm1PSE4y?=
 =?utf-8?B?dGFhWlQxVGpOcWVwV1ZlaDZHRXdhMm9TKzNzVzRFSVc3Y1JrSG1nczJod05o?=
 =?utf-8?B?d283K0RPRG1weUhlNGtJWWFjOVg0T3NrRnBNK0VNZUUwbmZXcys1T1JCTFBW?=
 =?utf-8?B?bzJlV3MxVHBIQ0NsNVlWelhvR1Q1YlYvOCtIWTM1L2l3bnNObTZ1cmxGUWFr?=
 =?utf-8?B?enlKK1hhdlRrM203bXlxamdOZzAydDhWaFR2aEVzdjYvUFpqdFlBNS9nWWJq?=
 =?utf-8?B?TkF4TVRrVmEwYUpBbzBPMUxReWMyc0ljeFR4OHRGQlRoOHZHS0w3b3REOG0y?=
 =?utf-8?B?NnJ1TlVMMFcrc1NLTm4xUjJlUVhRcm1uZ1k3bUZGQUJRTWQxemNJWkhJVGVD?=
 =?utf-8?B?bGVlMlNQYktuamRtdW81Q09TZnRDWnhicHhGUmw2L296OTUrTmZETkFuWVhV?=
 =?utf-8?B?VFlyTWhMdFRVWFJhN3F4elJWSUJzY2FPSVhnUXBndnAzTkdOeTVQTVkzYnpn?=
 =?utf-8?B?K3NJUVJhTzk2WlpEUFc2MnNjc2hIUlJTaWtDK2t1MXJPdDc5WllvbSt6T0dZ?=
 =?utf-8?B?UHFRTFB5ZFRUVVc4Q3NWeGFpdkd3ZkNUd2tQUVdQc1BEYS9NRU9nR0N2Q2Vh?=
 =?utf-8?B?SUpCeTArTFRvaTd4MEo1WjYyQkxOdzJaQ2NVbnBRaEQ5OHNNaGFkeXlvNmdO?=
 =?utf-8?B?MENXbFkzWXc2Tm1weVBSdU9PM1l6Y3o1czB1aW5jaGtLQk5hZzdWMUtYRCtP?=
 =?utf-8?B?NzJ5VTRSajg0Z010Wjg4UnRORFF0RDdEUHZIMVJ6aU5tWHFwZy8vV2t3WWRL?=
 =?utf-8?B?U3JNTTl4NGprOGprT0ZySUcyaW1NR01OdFVsR1hKY0xIZGZiQjIyalBVK1V0?=
 =?utf-8?B?eHBtNlNtUXA4b0MxVTlKR21DcEZEcmpubTNlYUxhcFUzTTBIamNzMlc3bkhN?=
 =?utf-8?B?VldueENwNkxvY214c2V6UkE3WjdhWmxjMTdFYm94bXAzdGVNVWozeW5oVkRM?=
 =?utf-8?B?WGREU2R0QXpqUnJMelpWRU45TWVBM2xEUVVNa2VZWmNTKzFJdTZSODBzR0Ru?=
 =?utf-8?B?S1ZHdkZOVHZjYjhBSDBrYmFudWczRUozb0R0U3Y2Y2thdjc2RXRVY2NubVJV?=
 =?utf-8?B?ekUzVTRETUxZbzdmSFJQTGN0bCtsSURxQlVxSm9ac0JxRHE1TWtZak1qbENz?=
 =?utf-8?B?aWZUTGJoUFRaYUt5VGV3T0ZlTGpUNm9sM1Z6bldkNm0zS0l2UmE0d29qaWdO?=
 =?utf-8?B?SFVjbTdZYzNvUCtUY2xBOTF3NlZQYndnWlQveko0WElmeXZZTnZkaVUxcDBu?=
 =?utf-8?B?eUtJWWZaMWJ4K1d0SVprdWJrY1lhT2p1M2I0M1lTSmxuSk82NklScU9reTJw?=
 =?utf-8?B?RXAzdUJtTzMweVRVTnIrdXpCd0IxTk11aE5Ec0J1SWE5YWlUMXBYajBWalJK?=
 =?utf-8?B?RThJdTh0cVIxUjBkNVl0aVNIMzN3a1R5UERNaUp0R3EzVHhLSlRYRWRBeFFh?=
 =?utf-8?B?SUp0dFdONjZvRWZod3Y4WWVhanRIUHhKZ2syWk9ab25mR0pxcTFxSjlhU3l1?=
 =?utf-8?B?VklLamFMbVFyL3FySXRzK3M2cldOTjBSMG1OcGNZeTlJNWxnKzl0bDEyNVVR?=
 =?utf-8?Q?9ljaVYXMAEBf1OpxXE6MmeORa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d163ed56-410a-49a7-3891-08db3de4d4cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2023 19:08:43.4616 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OU3tVc24pzwEFDHkOPgie6YS0/IcJXsUAm2kElTuTMPt4y7ncc8JMtGB+ykZoXGw8WBFwttD6qGR7YcwYnB0+n8dq/5pXYFasl74PLJPIr0=
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
DQo+IFN1YmplY3Q6IFtQQVRDSCAyMi80MF0gaWdiOiBBZGQgbW9yZSBkZWZpbml0aW9ucyBmb3Ig
VHggZGVzY3JpcHRvcg0KPiANCj4gU2lnbmVkLW9mZi1ieTogQWtpaGlrbyBPZGFraSA8YWtpaGlr
by5vZGFraUBkYXluaXguY29tPg0KPiAtLS0NCj4gIGh3L25ldC9pZ2JfY29yZS5jIHwgIDIgKy0N
Cj4gIGh3L25ldC9pZ2JfcmVncy5oIHwgMzIgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9ody9uZXQvaWdiX2NvcmUuYyBiL2h3L25ldC9pZ2JfY29yZS5j
IGluZGV4DQo+IGU1YTcwMjFjMGUuLjM1MDQ2MmM0MGMgMTAwNjQ0DQo+IC0tLSBhL2h3L25ldC9p
Z2JfY29yZS5jDQo+ICsrKyBiL2h3L25ldC9pZ2JfY29yZS5jDQo+IEBAIC00MTgsNyArNDE4LDcg
QEAgaWdiX3NldHVwX3R4X29mZmxvYWRzKElHQkNvcmUgKmNvcmUsIHN0cnVjdCBpZ2JfdHgNCj4g
KnR4KSAgew0KPiAgICAgIGlmICh0eC0+Zmlyc3RfY21kX3R5cGVfbGVuICYgRTEwMDBfQURWVFhE
X0RDTURfVFNFKSB7DQo+ICAgICAgICAgIHVpbnQzMl90IGlkeCA9ICh0eC0+Zmlyc3Rfb2xpbmZv
X3N0YXR1cyA+PiA0KSAmIDE7DQo+IC0gICAgICAgIHVpbnQzMl90IG1zcyA9IHR4LT5jdHhbaWR4
XS5tc3NfbDRsZW5faWR4ID4+IDE2Ow0KPiArICAgICAgICB1aW50MzJfdCBtc3MgPSB0eC0+Y3R4
W2lkeF0ubXNzX2w0bGVuX2lkeCA+Pg0KPiArIEUxMDAwX0FEVlRYRF9NU1NfU0hJRlQ7DQo+ICAg
ICAgICAgIGlmICghbmV0X3R4X3BrdF9idWlsZF92aGVhZGVyKHR4LT50eF9wa3QsIHRydWUsIHRy
dWUsIG1zcykpIHsNCj4gICAgICAgICAgICAgIHJldHVybiBmYWxzZTsNCj4gICAgICAgICAgfQ0K
PiBkaWZmIC0tZ2l0IGEvaHcvbmV0L2lnYl9yZWdzLmggYi9ody9uZXQvaWdiX3JlZ3MuaCBpbmRl
eA0KPiBjNWM1YjNjM2I4Li4yMmNlOTA5MTczIDEwMDY0NA0KPiAtLS0gYS9ody9uZXQvaWdiX3Jl
Z3MuaA0KPiArKysgYi9ody9uZXQvaWdiX3JlZ3MuaA0KPiBAQCAtNDIsMTEgKzQyLDYgQEAgdW5p
b24gZTEwMDBfYWR2X3R4X2Rlc2Mgew0KPiAgICAgIH0gd2I7DQo+ICB9Ow0KPiANCj4gLSNkZWZp
bmUgRTEwMDBfQURWVFhEX0RUWVBfQ1RYVCAgMHgwMDIwMDAwMCAvKiBBZHZhbmNlZCBDb250ZXh0
DQo+IERlc2NyaXB0b3IgKi8gLSNkZWZpbmUgRTEwMDBfQURWVFhEX0RUWVBfREFUQSAgMHgwMDMw
MDAwMCAvKiBBZHZhbmNlZA0KPiBEYXRhIERlc2NyaXB0b3IgKi8gLSNkZWZpbmUgRTEwMDBfQURW
VFhEX0RDTURfREVYVCAgMHgyMDAwMDAwMCAvKg0KPiBEZXNjcmlwdG9yIEV4dGVuc2lvbiAoMT1B
ZHYpICovDQo+IC0jZGVmaW5lIEUxMDAwX0FEVlRYRF9EQ01EX1RTRSAgIDB4ODAwMDAwMDAgLyog
VENQL1VEUCBTZWdtZW50YXRpb24NCj4gRW5hYmxlICovDQo+IC0NCj4gICNkZWZpbmUgRTEwMDBf
QURWVFhEX1BPVFNfSVhTTSAgMHgwMDAwMDEwMCAvKiBJbnNlcnQgVENQL1VEUA0KPiBDaGVja3N1
bSAqLyAgI2RlZmluZSBFMTAwMF9BRFZUWERfUE9UU19UWFNNICAweDAwMDAwMjAwIC8qIEluc2Vy
dA0KPiBUQ1AvVURQIENoZWNrc3VtICovDQo+IA0KPiBAQCAtMTUxLDYgKzE0NiwxMCBAQCB1bmlv
biBlMTAwMF9hZHZfcnhfZGVzYyB7DQo+ICAjZGVmaW5lIElHQl84MjU3Nl9WRl9ERVZfSUQgICAg
ICAgIDB4MTBDQQ0KPiAgI2RlZmluZSBJR0JfSTM1MF9WRl9ERVZfSUQgICAgICAgICAweDE1MjAN
Cj4gDQo+ICsvKiBWTEFOIGluZm8gKi8NCj4gKyNkZWZpbmUgSUdCX1RYX0ZMQUdTX1ZMQU5fTUFT
SyAgICAgMHhmZmZmMDAwMA0KPiArI2RlZmluZSBJR0JfVFhfRkxBR1NfVkxBTl9TSElGVCAgICAx
Ng0KPiArDQoNCkRvZXNuJ3Qgc2VlbSB0byBiZSB1c2VkIGFueXdoZXJlLCBhZGRlZCBieSBtaXN0
YWtlPyANCg0KPiAgLyogZnJvbSBpZ2IvZTEwMDBfODI1NzUuaCAqLw0KPiANCj4gICNkZWZpbmUg
RTEwMDBfTVJRQ19FTkFCTEVfUlNTX01RICAgICAgICAgICAgMHgwMDAwMDAwMg0KPiBAQCAtMTYw
LDYgKzE1OSwyOSBAQCB1bmlvbiBlMTAwMF9hZHZfcnhfZGVzYyB7DQo+ICAjZGVmaW5lIEUxMDAw
X01SUUNfUlNTX0ZJRUxEX0lQVjZfVURQICAgICAgIDB4MDA4MDAwMDANCj4gICNkZWZpbmUgRTEw
MDBfTVJRQ19SU1NfRklFTERfSVBWNl9VRFBfRVggICAgMHgwMTAwMDAwMA0KPiANCj4gKy8qIEFk
diBUcmFuc21pdCBEZXNjcmlwdG9yIENvbmZpZyBNYXNrcyAqLw0KPiArI2RlZmluZSBFMTAwMF9B
RFZUWERfTUFDX1RTVEFNUCAgIDB4MDAwODAwMDAgLyogSUVFRTE1ODgNCj4gVGltZXN0YW1wIHBh
Y2tldCAqLw0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfRFRZUF9DVFhUICAgIDB4MDAyMDAwMDAg
LyogQWR2YW5jZWQgQ29udGV4dA0KPiBEZXNjcmlwdG9yICovDQo+ICsjZGVmaW5lIEUxMDAwX0FE
VlRYRF9EVFlQX0RBVEEgICAgMHgwMDMwMDAwMCAvKiBBZHZhbmNlZCBEYXRhDQo+IERlc2NyaXB0
b3IgKi8NCj4gKyNkZWZpbmUgRTEwMDBfQURWVFhEX0RDTURfRU9QICAgICAweDAxMDAwMDAwIC8q
IEVuZCBvZiBQYWNrZXQgKi8NCj4gKyNkZWZpbmUgRTEwMDBfQURWVFhEX0RDTURfSUZDUyAgICAw
eDAyMDAwMDAwIC8qIEluc2VydCBGQ1MgKEV0aGVybmV0DQo+IENSQykgKi8NCj4gKyNkZWZpbmUg
RTEwMDBfQURWVFhEX0RDTURfUlMgICAgICAweDA4MDAwMDAwIC8qIFJlcG9ydCBTdGF0dXMgKi8N
Cj4gKyNkZWZpbmUgRTEwMDBfQURWVFhEX0RDTURfREVYVCAgICAweDIwMDAwMDAwIC8qIERlc2Ny
aXB0b3IgZXh0ZW5zaW9uDQo+ICgxPUFkdikgKi8NCj4gKyNkZWZpbmUgRTEwMDBfQURWVFhEX0RD
TURfVkxFICAgICAweDQwMDAwMDAwIC8qIFZMQU4gcGt0IGVuYWJsZSAqLw0KDQpuaXQ7IFlvdSBj
b3VsZCB1c2UgdGhlIGFib3ZlIGRlZmluaXRpb24gaW5zdGVhZCBvZiBFMTAwMF9UWERfQ01EX1ZM
RSBpbiBpZ2JfdHhfaW5zZXJ0X3ZsYW4oKT8NCg0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfRENN
RF9UU0UgICAgIDB4ODAwMDAwMDAgLyogVENQIFNlZyBlbmFibGUgKi8NCj4gKyNkZWZpbmUgRTEw
MDBfQURWVFhEX1BBWUxFTl9TSElGVCAgICAxNCAvKiBBZHYgZGVzYyBQQVlMRU4gc2hpZnQgKi8N
Cj4gKw0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfTUFDTEVOX1NISUZUICAgIDkgIC8qIEFkdiBj
dHh0IGRlc2MgbWFjIGxlbiBzaGlmdCAqLw0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfVFVDTURf
TDRUX1VEUCAweDAwMDAwMDAwICAvKiBMNCBQYWNrZXQgVFlQRQ0KPiBvZiBVRFAgKi8NCj4gKyNk
ZWZpbmUgRTEwMDBfQURWVFhEX1RVQ01EX0lQVjQgICAgMHgwMDAwMDQwMCAgLyogSVAgUGFja2V0
IFR5cGU6DQo+IDE9SVB2NCAqLw0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfVFVDTURfTDRUX1RD
UCAweDAwMDAwODAwICAvKiBMNCBQYWNrZXQgVFlQRSBvZg0KPiBUQ1ANCj4gKyovICNkZWZpbmUg
RTEwMDBfQURWVFhEX1RVQ01EX0w0VF9TQ1RQIDB4MDAwMDEwMDAgLyogTDQgcGFja2V0DQo+IFRZ
UEUgb2YNCj4gK1NDVFAgKi8NCj4gKy8qIElQU2VjIEVuY3J5cHQgRW5hYmxlIGZvciBFU1AgKi8N
Cj4gKyNkZWZpbmUgRTEwMDBfQURWVFhEX0w0TEVOX1NISUZUICAgICA4ICAvKiBBZHYgY3R4dCBM
NExFTiBzaGlmdCAqLw0KPiArI2RlZmluZSBFMTAwMF9BRFZUWERfTVNTX1NISUZUICAgICAgMTYg
IC8qIEFkdiBjdHh0IE1TUyBzaGlmdCAqLw0KPiArLyogQWR2IGN0eHQgSVBTZWMgU0EgSURYIG1h
c2sgKi8NCj4gKy8qIEFkdiBjdHh0IElQU2VjIEVTUCBsZW4gbWFzayAqLw0KPiArDQo+ICAvKiBB
ZGRpdGlvbmFsIFRyYW5zbWl0IERlc2NyaXB0b3IgQ29udHJvbCBkZWZpbml0aW9ucyAqLyAgI2Rl
ZmluZQ0KPiBFMTAwMF9UWERDVExfUVVFVUVfRU5BQkxFICAweDAyMDAwMDAwIC8qIEVuYWJsZSBz
cGVjaWZpYyBUeCBRdWV1ZSAqLw0KPiANCj4gLS0NCj4gMi40MC4wDQoNCg==

