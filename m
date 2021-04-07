Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFE53561C5
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 05:12:40 +0200 (CEST)
Received: from localhost ([::1]:33588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTycR-00035u-5S
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 23:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTybX-0002gj-Ng
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:11:43 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:26099)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lTybU-00014n-WB
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 23:11:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1617765100; x=1649301100;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tdmyl/NLEOhyk3TKbj1W6O7m8u2+T0RiwxKsJo0OVI4=;
 b=YyhmV5AJMsgbEGHLdJL+cqyu4kJ+ua7mFiTtvKItLuCY2frg2vo8k8gT
 aMIcqvKheqJtl3GndbiLUDgPYjsAQoh71v1Wm1yhQ+aDcqSrwnVZPHA/d
 bnazDLy5Y4XyvhzugCwNwLh5lk1RSB92BN0k8Wgdcs+7tE8Va5w52nyvd g=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Apr 2021 20:11:38 -0700
X-QCInternal: smtphost
Received: from nasanexm03b.na.qualcomm.com ([10.85.0.98])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 06 Apr 2021 20:11:38 -0700
Received: from nasanexm03a.na.qualcomm.com (10.85.0.103) by
 nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 20:11:38 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 20:11:38 -0700
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4007.namprd02.prod.outlook.com (2603:10b6:a02:f2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 03:11:31 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.3999.033; Wed, 7 Apr 2021
 03:11:31 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 17/21] Hexagon (target/hexagon) circular addressing
Thread-Topic: [PATCH v2 17/21] Hexagon (target/hexagon) circular addressing
Thread-Index: AQHXJqqetCRz+CE7yEq/IPpHZKn00qqoFl4AgAAGB0A=
Date: Wed, 7 Apr 2021 03:11:30 +0000
Message-ID: <BYAPR02MB48868074F14C421E3D07AEB4DE759@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1617249213-22667-1-git-send-email-tsimpson@quicinc.com>
 <1617249213-22667-18-git-send-email-tsimpson@quicinc.com>
 <365724a7-1013-e04a-43b1-dae87103fcd1@linaro.org>
In-Reply-To: <365724a7-1013-e04a-43b1-dae87103fcd1@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c4e35f38-e3cc-42c6-12ad-08d8f972d796
x-ms-traffictypediagnostic: BYAPR02MB4007:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4007C82A4B6E709589F4F3B8DE759@BYAPR02MB4007.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bl5aC55ra8WsFkk7JKFIISw7xKCXOKjqyy+Ratw+I2bD+UE42xSlXO7Sv1EnBjrvZd92nnkIEIQk6UNvwlfiIDEefyWsJF5eOuNJM5vm18Z5hSEC+jXu50brHBlT1ZyV/i2qPd5sDE69ghHGAZuL6V2/wWjO5ehNJHb+isDZ9k3tb8h9BfZPkOAdgS2GMTY3wKgPvt9w20wogb3KB3pUXUd2EZBMPH0FBvLnugxENOmdG3nNC9iWvqrcvOh5yldO9ZC6BjLWnMoODrxTjz7gPMQ7TxR2Jy/qsrbm53Fqgm1aCQ2coAEQ4AqtNJjInfa2TJUKpXoQrwJ/2RgPhutNWqf2g9KNei4pWMUKR5LFYsMt7th2HvZSKdD+92ny+x70gxtatqGsEFK7IwSGgpHiGhkG6rvl6/p0AHmAmQaUgI/YBtYG2/WupatR/Tw7TO0AYhwV07VsEFhD/nfgWMPyIeAfhtn8pISr06feDL6g7RUAM+wEOC1duqTKxXfokZfEcZvvXcI76oBXJUeLDVEzl0OS53R24ejw4HgwtQJdUAh7tCBJAGCk7sXjekAaD/AgKhv3o1fE/uuhc2/dxjlfPKUG3QdlXEkwCvei0hTrr+Bepm9ArAmxsfjXWKTVRMithkZOP5XzZfPIl0zak4EvLq7quDEBzmsS0KD4+lyu4qs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(396003)(136003)(39850400004)(38100700001)(53546011)(6506007)(86362001)(83380400001)(52536014)(2906002)(478600001)(33656002)(316002)(9686003)(4326008)(7696005)(8936002)(8676002)(26005)(107886003)(110136005)(5660300002)(54906003)(76116006)(66446008)(186003)(66476007)(71200400001)(64756008)(66556008)(66946007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?TzY3bms3VTR1WStwNmVCaGFNb1BHNVhBeXRSb0tlSTRiRGlmcHByZWNGTmVv?=
 =?utf-8?B?TzdBR1V5eDNQbXBxZ1pDVFFGaFN5emtOTndIRmZMcFhHa0t5cGV0N3crOW9x?=
 =?utf-8?B?ZmlQZGhjY2JtbGFHb0MrK3NtUVFBSnUzeC9GMVVIZmxNMUZmbDZOVllSdHA3?=
 =?utf-8?B?cUdaRFBwdGZVRkhVYmptN3g3WEhTUUN6TnZhZWJFdW0ya0NBRjk1VmR2OFBj?=
 =?utf-8?B?bXpPQ1F1am0xc21acVlWd0JNSFQrWDNZRjNKQ2svMFBGQ2gvMWwwUjY5aTF6?=
 =?utf-8?B?ajdiN3JBQTV0UDJxU3VVTWlEQVJOQWIxZ1ZqeE1iSUZaM284WDM0eDNpREc5?=
 =?utf-8?B?cWJOVURTaWpRRVBWeTBha0d1MnJ5dStRblV1T25SRXVWTUtITDJPZ0ZyYzcx?=
 =?utf-8?B?Uk5JRUJIY3UyQmR5eUZSWkpHaVZ4WVJuejg5Ly8vdUpybjFma0xrOXZ0QUxK?=
 =?utf-8?B?ak9IeWRBQWU2b3QvMTBMeUJhc29maWpGSXVsZTc4MDhXamVwZUlONjBJUzRF?=
 =?utf-8?B?ckRBYk91QzMxTGsySExpaGJTcjIyNWwzNnFxLzZNQVhNeTR6OFRXdVRRRDJX?=
 =?utf-8?B?NmNkZGY3Wit6dWFkTzJMVHo4RUJjYkh6ZWc4T0FxY0M1MC8rVCtaOG5IZmpp?=
 =?utf-8?B?YjN6VmYrdGwxU09MNHFNdVFKZnBsY3RWMWxFbG9HbTVUcnk0Mk9LVEdOZmVW?=
 =?utf-8?B?ZktPdWE0b2RRQTVuOWpsVSt2TEJTajJpcTd3MTc4WjlZOGVhZXQ0TmFEYmJy?=
 =?utf-8?B?MHk5ZHFWdzBWclhDT3ZFc3NaY1M5by9Gd3M3NGlFVUo5eXc5SEpKK3FVdTFV?=
 =?utf-8?B?R3pHeG1FSkYwV2xiVXpMOVBsbkFIYzlYWUUwcFVOSThYeUVVNkdkZzdqVnN0?=
 =?utf-8?B?bnduRmt6TFd6YmNLZHNHZ0dRTUtOTWp0ZHdoVFNSZjBWS0JlN0p6aVp2RC8w?=
 =?utf-8?B?aXVLTUJMZFFiVDhmbzY5LzVqT1o1S2xObExpdDdJcXFPL3JIblFTUVZtaE9a?=
 =?utf-8?B?dVZUS21lbE4ySExZamZLQ2U5ajBVSlZXS0hCZnYvdExvSE1pTXF4K2I0TW15?=
 =?utf-8?B?RGd5ZFFaQUZsU0Z5dTlDY3FHRmpxeldWVGtUQnlkR3VxVytYMUJlaUlFYzF0?=
 =?utf-8?B?NXBqK0ltODZjeUcxVVltNW5VZ0QvSkptd3B4NC94OGxYbktROXp5RkRGbmpG?=
 =?utf-8?B?QkQ3QzFNcXpkVUQzN0FJUDIxckNNdmMvdkFqZ045VkxzZWovVUJpRnhrR0Jv?=
 =?utf-8?B?Q0RTeHlKMnBLQk9yVEVxdmdDb0MxSi9lQXZiczlWTkQ5TlpDQmdnZ2NyVUJZ?=
 =?utf-8?B?aUhEVmgyenBOWHp3Rmlja1B2bEFDKzE0dEI4T1k4RjVzSHJhNFk5eWtIeDY3?=
 =?utf-8?B?TWFYNHNjSDlESVVqdzNSQ1ZaV0QxOE1BM21EaDJxUHlKd2V2TmlvTXN1V2ZQ?=
 =?utf-8?B?OC9neWFIc3hFWitQWW4vcHoycXA4L0dhdk1vU3ZUakd6NXhYVnVHNnBWQ1pk?=
 =?utf-8?B?Kzg0VjcwaXpiSzhHd1FyNXBQdno0QlFLdjRBaDVoSnFhTDU5YVZWdU1pWEZ5?=
 =?utf-8?B?SHlOV2lYQktYTWhiWjAyaGpFUWJYbGNLUzJhZXVsY3RLWVZzRlBUZGpTMjVH?=
 =?utf-8?B?RXhRZ20xRk1sc0JzMktaa1VFT2tpMGZjdjhza1BobEc0dzVrTUQrWHVqcSt3?=
 =?utf-8?B?TVVHUGJYQ3BxNGZGbCt6ck1rejlMSXFIUzJ5d1JBM1lwNXFQY21XdUMxcnlq?=
 =?utf-8?Q?TDcACVQ/8SqYFydYRGUDZFlOF5gXCz54oGPT/pN?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNBHDjG+V6BDbw71vq0wVBBnbUA7Ph4iGevnCh82l8bYzgbCGWixEKNviWITOO4/MyH0tOHt8LEfVoLnMw+P35hyA5LLWKT9sZsOErqv+zLAZhz8J6AlX4T2apXkd7J6EUfrgmS69CQW6fmlPMz/m3zQdu87wkQm8Cj9xb5tu8zqdo9+smVt74DUiLdojuht+M3Qout1HmK533QHQUm2ER+EwU9jw1e7aokfi6InPPOcxZBJawW0gkW1w68cmeHmahjOZFtS5InJT+gBxT2IxDFiG7S6FpDWPUduvYgzp+sX9YKW8ogVpod4/JSQJijHTMUfzPepJP3IH+krB8Vk1A==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xcBulrlE4jq/LWpRKwv2lELbaKjQU7/lYTwkzdzHlQ8=;
 b=jwi9YyQgZirMzYMA5D0OYClV0yxH0rGFWx09qaEgfaoIjOXouNus+dMnbvi3X2i4hlH+EQVEOMwqkZdhskaQYT6d8tIbU6KOBkAS0MccgK+KF4i/FvkAY+jnSmKizNpVVmh5+591CU/DHqVam9kkrsI84/lQiDQ1r2OoeM20G06O1pgATuWcX/aLB4XgkUFIR01AEhGPwa/0XBI4omNgcKewkOOMdJbF8boBXm/7//+8sxcWtmS61sGBym8HGWdvVIjrxCQUxoynOPZE681TrQ9jAYeQfMp7Ax46MyYyjKxODfTawGGYEcO6DRx+ssWHvO3PrF2wQw1r8kbsLKtakw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: c4e35f38-e3cc-42c6-12ad-08d8f972d796
x-ms-exchange-crosstenant-originalarrivaltime: 07 Apr 2021 03:11:30.9560 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: IDppe5o2ggiu+WAM9g4UlIWjE2l/9IwiWm3z8WLfhu9avE1DWTFKBo9SnpjMIu23PQlN7M1318Zg8suMJmdbGw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB4007
x-originatororg: quicinc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian
 Cain <bcain@quicinc.com>, "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUmljaGFyZCBIZW5kZXJz
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEFwcmls
IDYsIDIwMjEgNToxMiBQTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNpbmMu
Y29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsgYWxl
QHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjIgMTcvMjFdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBjaXJjdWxhciBhZGRyZXNz
aW5nDQo+DQo+IE9uIDMvMzEvMjEgODo1MyBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4g
K3N0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9yZWcoVENHdiByZXN1bHQsIGludCBudW0pDQo+
DQo+IFRoZSB1bm5lY2Vzc2FyeSBpbmxpbmVzIGFyZSBiYWNrLCBqdXN0IGFmdGVyIGhhdmluZyBy
ZW1vdmVkIHRoZW0gaW4gcGF0Y2ggMi4NCg0KVGhlIG9uZXMgaW4gZ2VucHRyLmMgbmVlZCB0byBz
dGF5IHNvIHdlIGNhbiBzd2l0Y2ggYmV0d2VlbiB0aGUgb3ZlcnJpZGVzIGFuZCBoZWxwZXJzIGFu
ZCBldmVudHVhbGx5IHRoZSBpZGVmLXBhcnNlci4NCg0KDQo+ID4gKyNpZmRlZiBRRU1VX0dFTkVS
QVRFDQo+ID4gK3N0YXRpYyBpbmxpbmUgVENHdiBnZW5fcmVhZF9pcmVnKFRDR3YgcmVzdWx0LCBU
Q0d2IHZhbCwgaW50IHNoaWZ0KQ0KPiA+ICt7DQo+ID4gKyAgICAvKg0KPiA+ICsgICAgICogU2Vj
dGlvbiAyLjIuNCBvZiB0aGUgSGV4YWdvbiBWNjcgUHJvZ3JhbW1lcidzIFJlZmVyZW5jZSBNYW51
YWwNCj4gPiArICAgICAqDQo+ID4gKyAgICAgKiAgVGhlICJJIiB2YWx1ZSBmcm9tIGEgbW9kaWZp
ZXIgcmVnaXN0ZXIgaXMgZGl2aWRlZCBpbnRvIHR3byBwaWVjZXMNCj4gPiArICAgICAqICAgICAg
TFNCICAgICAgICAgYml0cyAyMzoxNw0KPiA+ICsgICAgICogICAgICBNU0IgICAgICAgICBiaXRz
IDMxOjI4DQo+ID4gKyAgICAgKiBBdCB0aGUgZW5kIHdlIHNoaWZ0IHRoZSByZXN1bHQgYWNjb3Jk
aW5nIHRvIHRoZSBzaGlmdCBhcmd1bWVudA0KPiA+ICsgICAgICovDQo+ID4gKyAgICBUQ0d2IG1z
YiA9IHRjZ190ZW1wX25ldygpOw0KPiA+ICsgICAgVENHdiBsc2IgPSB0Y2dfdGVtcF9uZXcoKTsN
Cj4gPiArDQo+ID4gKyAgICB0Y2dfZ2VuX2V4dHJhY3RfdGwobHNiLCB2YWwsIDE3LCA3KTsNCj4g
PiArICAgIHRjZ19nZW5fZXh0cmFjdF90bChtc2IsIHZhbCwgMjgsIDQpOw0KPiA+ICsgICAgdGNn
X2dlbl9tb3ZpX3RsKHJlc3VsdCwgMCk7DQo+ID4gKyAgICB0Y2dfZ2VuX2RlcG9zaXRfdGwocmVz
dWx0LCByZXN1bHQsIGxzYiwgMCwgNyk7DQo+ID4gKyAgICB0Y2dfZ2VuX2RlcG9zaXRfdGwocmVz
dWx0LCByZXN1bHQsIG1zYiwgNywgNCk7DQo+ID4gKw0KPiA+ICsgICAgdGNnX2dlbl9zaGxpX3Rs
KHJlc3VsdCwgcmVzdWx0LCBzaGlmdCk7DQo+DQo+IFRoaXMgZG9lc24ndCBtYXRjaA0KPg0KPiA+
ICsjZGVmaW5lIGZSRUFEX0lSRUcoVkFMKSBcDQo+ID4gKyAgICAoZlNYVE4oMTEsIDY0LCAoKChW
QUwpICYgMHhmMDAwMDAwMCkgPj4gMjEpIHwgKChWQUwgPj4gMTcpICYgMHg3ZikpKQ0KPg0KPiB3
aGljaCBoYXMgYSBzaWduLWV4dGVuc2lvbiBvZiB0aGUgcmVzdWx0Lg0KPg0KPiAgICAgIHRjZ19n
ZW5fZXh0cmFjdF90bChsc2IsIHZhbCAxNywgNyk7DQo+ICAgICAgdGNnX2dlbl9zYXJpX3RsKG1z
YiwgdmFsLCAyMSk7DQo+ICAgICAgdGNnX2dlbl9kZXBvc2l0X3RsKHJlc3VsdCwgbXNiLCBsc2Is
IDAsIDcpOw0KDQpHb29kIGNhdGNoIC0gdGhpcyBpcyBzdHJhbmdlLiAgVGhlIHZhbHVlIGdldHMg
cGFzc2VkIHRvIGFzIHRoZSAiTSIgYXJndW1lbnQgdG8gSEVMUEVSKGZjaXJjYWRkKS4gIFRoZSBj
b2RlIHRoZXJlIGRvZXMNCiAgICBpbnQzMl90IEtfY29uc3QgPSAoTSA+PiAyNCkgJiAweGY7DQog
ICAgaW50MzJfdCBsZW5ndGggPSBNICYgMHgxZmZmZjsNCg0KSSB3aWxsIGNvbnN1bHQgd2l0aCB0
aGUgYXJjaGl0ZWN0cyBvbiB0aGlzLg0KDQpUaGFua3MsDQpUYXlsb3INCg0KDQoNCg0K

