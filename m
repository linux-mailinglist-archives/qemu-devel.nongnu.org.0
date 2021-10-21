Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2BF436D93
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 00:37:37 +0200 (CEST)
Received: from localhost ([::1]:54850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdggq-0005YY-K4
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 18:37:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1mdgF1-0003fT-81
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:09:21 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:49781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sidneym@quicinc.com>)
 id 1mdgEy-0007uL-Pg
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 18:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1634854128; x=1635458928;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=y6LXnYqeejLHPwf99yUUNpYylWHF2UxKPbDh5Q8eTNA=;
 b=zAzmad7xzGamdKUQNCP2Axo10nUT+S4cUyyn40P1L8tJsvGiLy0DlCg+
 ReR/y/aam/UQ+n23gco1lZT67YJOIA1sjhyIJA2p0Wp7Ot/+Siwmw4HQm
 CKxmoV0qAPUuoYPGaWQwNYKWRDomY8MwYMD7CH12Cm1pMgUdnuDrrDwqD 8=;
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 22:08:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lW9sKFL691LYUsHR1iBc3RomvoI/pgDHZKp0d1IO+xshLb30wyLiNeCMG02Knzn4WO2ce+FDlBUkWF7RxX5zh5p+QmjKuaKKuMnry7UMp9yCYYrhgcANbr0xKQecxPvU8W9+XUvjVVGpbSC8QA0bazUw2Yx6sjrHaNUIOE5cGTiis6dyTclNo0Xpy6bPLCKS05oFNFsbuqjc47z7ym30n8LR9NSnpthItf0CQGU/0jSr9SIKvvrer/UGRgleDpfpfs7WE8YTU6g/lmCIkidObY6+PkBklCwo6RFBoE4Rn5ZOJwHOIFzJGeu6w219rb5IvkptZy0lEE7mv4jf6CcHmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6LXnYqeejLHPwf99yUUNpYylWHF2UxKPbDh5Q8eTNA=;
 b=EpRb2yyKUZfkIvc3rwoKYrdH/RUrFqe4gCHcdQ6VuRXoQqMJb/TV6FJkzYEhd1e7luHNwPZTSJUOpni7VdLI1dqlIdskZ0/pagj27lc9ZvD7fhp8QtV4u0x+ygGMHdP9k4J/d5AK/S4qDQy72tHYugnwHib4eodEC8/iZpuNnvoUgGpiBvn1dss1qWCNOitaDBqHn/58AWB5GQiBbfybmhMRZ0wyU/5krC9F8gLp0sNiNC8hj0rn0k/1xuiIWilDXrLf2aebgxZxnneZBaHMgJWdGlpi1o7k0TjXLmvACGfPF3Hus0hoOZzrt5hQ4Qa21NHDBFWvwY1B2saL1OUhJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB5509.namprd02.prod.outlook.com (2603:10b6:a03:9e::31)
 by BYAPR02MB4502.namprd02.prod.outlook.com (2603:10b6:a03:10::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 22:08:43 +0000
Received: from BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::79ff:3c56:b126:c38d]) by BYAPR02MB5509.namprd02.prod.outlook.com
 ([fe80::79ff:3c56:b126:c38d%6]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 22:08:43 +0000
From: Sid Manning <sidneym@quicinc.com>
To: =?utf-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: RE: [gdbstub] redirecting qemu console output to a debugger
Thread-Topic: [gdbstub] redirecting qemu console output to a debugger
Thread-Index: AdfGeE+KTuTisnOCS8GEQmT9UiiYUwABNjAAAAOCGIAADaYnoA==
Date: Thu, 21 Oct 2021 22:08:43 +0000
Message-ID: <BYAPR02MB5509A10AD30F93AA43C54789BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
References: <BYAPR02MB550976DDDA818CEB090B41C5BEBF9@BYAPR02MB5509.namprd02.prod.outlook.com>
 <fad02feb-09f3-4ef8-a2eb-bec76e2ee968@redhat.com> <87ilxqtogk.fsf@linaro.org>
In-Reply-To: <87ilxqtogk.fsf@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97ad717b-f126-4b42-649c-08d994df58c0
x-ms-traffictypediagnostic: BYAPR02MB4502:
x-microsoft-antispam-prvs: <BYAPR02MB4502615219156CBF2E5D5FFCBEBF9@BYAPR02MB4502.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: hDboYkyXBE9ELAOI7x1yFnCqueCs7jBUbcCbs6dJPXzXKy42Jv6b5dOoUdAp+//URBrgVFVJ8SRQX/IF4B18LIExA4LPcXHPcu3/fgSksh4Hs6GwFc5vhMzBiT/ijfjyELay/XsJ95GIsLZlFDzcM3cAmt0zLYBYcIhjl4T9fpgEk/Vj3Qk0sNX2UnWoJbEUHJ0jbrrXaKC7dQq8IBaMNSokd6CJng4ZX8e4lBZZyF88manmbPNd7lmilohKE31Pq5fZ9YXgcTrmNU2Dws+8ZJoAXn0rrIiqMk3R63+/5+WjvGS9dvwHIS98hkASp7JAdg7h2ys6LJbQ3WNFMIfS5gPRSBwCujDx/6Tn2Necasrhfa8frB4B5X1OW2/83nztjlVMWNc6hWrNVsMaB/ccXsdvxdc3qNT1/t1sVArSJbx/vUkhIDh9K0uHCBC/viFcCljs3YXIwGCzSiVt2hF4rasU0Q6agP22fhR94hcJzvMKBGUoCO6g6bDzhCYGF21P/qjsPdkJJZ5tcC0dEKfmgyPN4A4RYw5U38IYNwfu5sveLFdaH+9xlXFlT1q1oXZyXi7gJYJQEDcsxjRoTMr+BjFmz5wdWAzVGsHdLJthfAOEs9ZAiek1U7b3yHu4wbYZPn/pS+CQllZmKrAAFZVrE7Jb8R7BMigzz4QIp4oRrwdZ0XcshqBrRFDfOvzD/pGOU6yKi0cOY2bQac+wjGPDWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB5509.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(9686003)(66556008)(66446008)(64756008)(2906002)(110136005)(6506007)(4326008)(8676002)(186003)(66574015)(52536014)(7696005)(66946007)(76116006)(5660300002)(83380400001)(508600001)(38100700002)(66476007)(8936002)(55016002)(71200400001)(26005)(38070700005)(33656002)(316002)(122000001)(53546011)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzdFM0FPajZDVmxRV3NjVkNFcStsTi9jY09BWUd4NGhBbnd0YzlCbEEvbk5Y?=
 =?utf-8?B?TWNGQm9TdW95aDU1VUhSWFZmVENaK1lzZDRuUCtBYi9TMDhKMVY5QVFsd2M0?=
 =?utf-8?B?bUlJRE1YUVNJUGxkQzJvTEhicFo4Q0lKTTU0b0RaWWNSdmowQXE3UzhsbEtn?=
 =?utf-8?B?MW5NdDZ5VzRpQTVCekRHdUdtc2VhY050Tm1kbm1ZVzhPNnE2TEtlcm5lVkYy?=
 =?utf-8?B?eGlxaEVCZzgzSU8yNUhRZlIwRHVWMlk4Y3hQMkxSN2ZSbjRRWFVpZnU3cXRO?=
 =?utf-8?B?My9DN2pNL2dwdzFMZHFqQnU2NzJBNHpQdExISmRXN1VVaDJ6a0hQUHFEcEVW?=
 =?utf-8?B?dGcxeWowWDN1THdSRTVUdENwOER5WTRNQTNrVW9odlYvcGo2ZHhTcUFrbnBp?=
 =?utf-8?B?NDNLOVZRdytRcVppK2thMWliTXh2ZVcyVXRwOGtIeUswZ0pSTjJQTHo2ektB?=
 =?utf-8?B?ZGo4SHVlWlBXYWFiR2tyVjRJbUtPZThTZUZmclFKR05jdmFkVTVQQW16YkVM?=
 =?utf-8?B?R1gybU9GemtrRGM4eERTQ1YyR0Roblo5QXYxb0x6YVV2OGNxRnRIZlBSM25j?=
 =?utf-8?B?amZ4RmdtVnZibTI2MFYrWm9ncEoxYk85cmx6UzZZcVRQSWJqdTk2cmxmbXMv?=
 =?utf-8?B?UThEamZPRHBqb2hkRi93VUZEd1l1ampZampqT3lKelN5MkQ5RTlWcDBKYWJ6?=
 =?utf-8?B?L0ZXRDZNSDJsNG5YUHhhcVVvd1lzV1JVYWZUMmNxWDJIVkMzdHhlc1JCUlc5?=
 =?utf-8?B?WDhiTmhPQmY5ME9NcWVGalp3R2NHSEdQRVQ0ZDFjenkzaS9wN29KWDkyUExQ?=
 =?utf-8?B?UTVLelNBQzhHVUNva05zcnRZQW5oV1NaampxTnZYZ0p2aERMeEVrS3NTY3ZJ?=
 =?utf-8?B?QTR1SGcwRGpoUUVrR0FSRnRuM2tNcTR5VGRMK0xHOFpPaUpqaXhSNVU3Yk9S?=
 =?utf-8?B?U20vRVNUcTRYNzM5cXNWR3FDNmk5QlJKdEJmai9qMWQxY1UxSkR6MkxuQ1oz?=
 =?utf-8?B?WTFUeS9sMjZudlh4bDNEVWlGMFJEQ0M3cngwdmNvRFpTOW5Vd3RMeHU0cFhx?=
 =?utf-8?B?VXQ5TzlVWTMvTzQ0K0VMakhlS013VlN5Vlp5OVpzLzcxcnFJVWtaRTFFeXp2?=
 =?utf-8?B?NE9aWlBNNStmZmxzRE1kSmt6TjRwZWZNV1UxTlhHazgzSnNwSk1hU1VuZHZ3?=
 =?utf-8?B?MTlyQzlkTGo5QjdrbElINjcwbTNLQzh5NG9YbmlsMTVOcGJNdlFtenNqak5D?=
 =?utf-8?B?bi9JU2x5end4WkxWc3VRcWpDbnVla1p2ZzB2ZXZGTFFKTVFHMEVFQ0dlVUtn?=
 =?utf-8?B?YXlzdmIwcWRUaXJrWUUwaDdsN0hlNFFCN0g3K2RTZmkvVElveXF0TThLWTl0?=
 =?utf-8?B?SnoxRmpZcXBSTVJHUGgxemxKZ04rYjdXaHhjRGcrczR3MlBrTnZvUjAxbkJr?=
 =?utf-8?B?Rms4SFI3RDc2ZkhsRkJ4OXltdW1SL2FVS1ZKZzFSWnYwcVU2NnovU3JEQUF1?=
 =?utf-8?B?VzRGdnByeE5VemFkU01hYjNSQjQzTU1EZmNlbG4yNFpDK3lvUWVnYjhqQkRB?=
 =?utf-8?B?M3FTUC9OYUxuTG11bkh6S0VJYWM1NkwwdG5vN2dIV3ZDWVIzdE1JMDdoQjRP?=
 =?utf-8?B?SjZNL0RMbFZOMnBYdkNZUU5mMXVpVTJZOTFLYUdpRnZnRjhkOWhEb3E3dWhW?=
 =?utf-8?B?Sk92VVZTRnJNaWhCcnBkL1k4OGM4dEFPcHd2ZC81bGo5a3NoWHRiZ1JRcFVk?=
 =?utf-8?Q?8E278dQ6djZjNY7f170b/IgNmCbqJVpBDo5XPXt?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB5509.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ad717b-f126-4b42-649c-08d994df58c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 22:08:43.6157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sidneym@quicinc.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4502
Received-SPF: pass client-ip=216.71.140.77; envelope-from=sidneym@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: =?utf-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbGV4IEJlbm7DqWUgPGFsZXgu
YmVubmVlQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBPY3RvYmVyIDIxLCAyMDIxIDk6
NTIgQU0NCj4gVG86IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxwaGlsbWRAcmVkaGF0LmNvbT4N
Cj4gQ2M6IFNpZCBNYW5uaW5nIDxzaWRuZXltQHF1aWNpbmMuY29tPjsgTWFyYy1BbmRyw6kgTHVy
ZWF1DQo+IDxtYXJjYW5kcmUubHVyZWF1QHJlZGhhdC5jb20+OyBQYW9sbyBCb256aW5pIDxwYm9u
emluaUByZWRoYXQuY29tPjsNCj4gcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IFN1YmplY3Q6IFJl
OiBbZ2Ric3R1Yl0gcmVkaXJlY3RpbmcgcWVtdSBjb25zb2xlIG91dHB1dCB0byBhIGRlYnVnZ2Vy
DQo+IA0KPiBXQVJOSU5HOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIFF1
YWxjb21tLiBQbGVhc2UgYmUgd2FyeQ0KPiBvZiBhbnkgbGlua3Mgb3IgYXR0YWNobWVudHMsIGFu
ZCBkbyBub3QgZW5hYmxlIG1hY3Jvcy4NCj4gDQo+IFBoaWxpcHBlIE1hdGhpZXUtRGF1ZMOpIDxw
aGlsbWRAcmVkaGF0LmNvbT4gd3JpdGVzOg0KPiANCj4gPiBIaSBTaWQsDQo+ID4NCj4gPiBDYydp
bmcgbWFpbnRhaW5lcnM6DQo+ID4NCj4gPiAkIC4vc2NyaXB0cy9nZXRfbWFpbnRhaW5lci5wbCAt
ZiAgY2hhcmRldi9jaGFyLmMgIk1hcmMtQW5kcsOpIEx1cmVhdSINCj4gPiA8bWFyY2FuZHJlLmx1
cmVhdUByZWRoYXQuY29tPiAobWFpbnRhaW5lcjpjaGFyZGV2KSBQYW9sbyBCb256aW5pDQo+ID4g
PHBib256aW5pQHJlZGhhdC5jb20+IChyZXZpZXdlcjpDaGFyYWN0ZXIgZGV2aWNlLi4uKQ0KPiA+
DQo+ID4gJCAuL3NjcmlwdHMvZ2V0X21haW50YWluZXIucGwgLWYgIGdkYnN0dWIuYyAiQWxleCBC
ZW5uw6llIg0KPiA+IDxhbGV4LmJlbm5lZUBsaW5hcm8ub3JnPiAobWFpbnRhaW5lcjpHREIgc3R1
YikgIlBoaWxpcHBlDQo+ID4gTWF0aGlldS1EYXVkw6kiIDxwaGlsbWRAcmVkaGF0LmNvbT4gKHJl
dmlld2VyOkdEQiBzdHViKQ0KPiA+DQo+ID4gT24gMTAvMjEvMjEgMTQ6MzcsIFNpZCBNYW5uaW5n
IHdyb3RlOg0KPiA+PiBDdXJyZW50bHkgd2hlbiBJIGF0dGFjaCBhIGRlYnVnZ2VyIChsbGRiKSB0
byBteSBxZW11IHNlc3Npb24gYWxsIG9mIHRoZQ0KPiBvdXRwdXQgZ29lcyB0byB0aGUgc2hlbGwg
cnVubmluZyBxZW11IG5vdCB0byB0aGUgZGVidWdnZXIuICBGaXhpbmcgdGhpcw0KPiBtZWFudCB0
aGF0IEkgbmVlZGVkIHRvIHBvaW50IHRoZSBzZW1pLWhvc3Rpbmcgb3V0cHV0IHRvIHRoZSBnZGIg
Y2hhcmRldi4gIEkNCj4gc3RhcnRlZCBxZW11IGxpa2UgdGhpczoNCj4gPj4NCj4gPj4gLXMgLVMg
LXNlbWlob3N0aW5nLWNvbmZpZyB0YXJnZXQ9YXV0byxjaGFyZGV2PWNoMCAtY2hhcmRldiBnZGIs
aWQ9Y2gwDQo+IA0KPiBNaXhpbmcgdXAgc2VtaWhvc3RpbmcgYW5kIGdkYiBpcyBub3QgZ29pbmcg
dG8gZW5kIHdlbGwuIFdlIGRvIGFscmVhZHkgcmUtDQo+IGRpcmVjdCBzZW1paG9zdGluZyBvdXRw
dXQgdG8gdGhlIGRlYnVnZ2VyIHdoZW4gaXQncyBhdHRhY2hlZC4gVG8gc3BlY2lmeSBhDQo+IHNv
Y2tldCBmb3IgZ2RiIHRvIGNvbm5lY3QgdG8geW91IG5lZWQ6DQo+IA0KPiAgIC1jaGFyZGV2IHNv
Y2tldCxwYXRoPS90bXAvZ2RiLXNvY2tldCxzZXJ2ZXI9b24sd2FpdD1vZmYsaWQ9Z2RiMCAtZ2Ri
DQo+IGNoYXJkZXY6Z2RiMA0KDQpUaGFua3MsIHRoaXMgaXMgcHJldHR5IGNsb3NlIHRvIHdoYXQg
SSB0aGluayBuZWVkcyB0byBoYXBwZW4uICBJJ20gdXNpbmcgbGxkYiBhbmQgaGFkIGEgaGFyZCB0
aW1lIGZpbmRpbmcgdGhlIGNvcnJlY3QgY29ubmVjdGlvbiBjb21tYW5kLiAgRm9yIHRoZSByZWNv
cmQgaXQgaXM6IA0KKGxsZGIpIHByb2Nlc3MgY29ubmVjdCB1bml4LWNvbm5lY3Q6Ly8vdG1wL2dk
Yi1zb2NrZXQNCg0KQSByZW1haW5pbmcgaXNzdWUgaXMgYWN0aXZhdGluZyB0aGUgZ2RiIGNoYXJh
Y3RlciBkZXZpY2Ugc28gdGhlIHByb3BlciBwcm90b2NvbCBwYWNrZXQgaXMgc2VudCwgdGhlICdP
JyBwYWNrZXQuDQpNeSBjb21tYW5kIGxvb2tzIGxpa2UgdGhpczoNCg0KLi9xZW11LXN5c3RlbS1o
ZXhhZ29uIC1TIC1kaXNwbGF5IG5vbmUgLW1vbml0b3Igbm9uZSAtbm8tcmVib290IFwNCi1zZW1p
aG9zdGluZy1jb25maWcgdGFyZ2V0PWdkYixjaGFyZGV2PWdkYjAgXA0KLWNoYXJkZXYgc29ja2V0
LHBhdGg9L3RtcC9nZGItc29ja2V0LHBvcnQ9OjoxMjM0LG11eD1vbixzZXJ2ZXI9b24sd2FpdD1v
ZmYsaWQ9Z2RiMCBcDQotZ2RiIGNoYXJkZXY6Z2RiMCBcDQota2VybmVsIGEub3V0DQoNCkkgbmVl
ZGVkIHRvIGFkZCBtdXg9b24gdG8gc2hhcmUgZ2RiMC4gIFRoaXMgZG9lcyBpbmRlZWQgc2VuZCB0
aGUgb3V0cHV0IGJhY2sgdG8gdGhlIGRlYnVnZ2VyLCBidXQgaW5zdGVhZCBvZiBSU1AgJ08nIHBh
Y2tldHMgbGxkYiBzZWVzIGp1c3QgcGxhbmUgdGV4dCBhbmQgZHJvcHMgdGhlIGNvbm5lY3Rpb24u
ICBJIG5lZWQgdGhlIGNjLT5jaHJfd3JpdGUgdG8gcG9pbnQgdG8gZ2RiX21vbml0b3Jfd3JpdGUg
YXMgaXQgaXMgaXQgcG9pbnRzIHRvIG11eF9jaHJfd3JpdGUuDQoNCg0KPiANCj4gVGhlIC1jaGFy
ZGV2IHNwZWNpZmllcyB0aGUgZGV0YWlscyBvZiB0aGUgc29ja2V0IGFuZCB0aGUgLWdkYiB0ZWxs
cyBnZGIgd2hlcmUNCj4gaXQgc2hvdWxkIG1ha2UgdGhlIGdkYnNlcnZlciBwb3J0IHZpc2libGUu
IFRoZSBvbmx5IHNlbWlob3N0aW5nLWNvbmZpZw0KPiB2YXJpYWJsZSB5b3UgbWF5IHdhbnQgdG8g
dHdlYWsgaXMgdGhlIHRhcmdldC4NCj4gDQo+IDxzbmlwPg0KPiA+DQo+ID4gSSdtIG5vdCBzdXJl
IHdoeSAiY2hhcmRldi1nZGIiIGlzIGludGVybmFsLCBtYXliZSBiZWNhdXNlIGl0IHVzZXMNCj4g
PiBzdGF0aWMgc3RhdGUgYXMgc2luZ2xldG9uLCBzbyBjYW4ndCBiZSBUWVBFX1VTRVJfQ1JFQVRB
QkxFPw0KPiA+DQo+ID4gICBzdGF0aWMgR0RCU3RhdGUgZ2Ric2VydmVyX3N0YXRlOw0KPiANCj4g
T25lIGdvb2QgcmVhc29uIC0gd2UgZG9uJ3Qgc3VwcG9ydCBtdWx0aXBsZSBjb25uZWN0aW9ucy4N
Cj4gDQo+ID4NCj4gPiBCdXQgVFlQRV9EQlVTX1ZNU1RBVEUgaXMgVFlQRV9VU0VSX0NSRUFUQUJM
RSBhbmQgaGF2ZToNCj4gPg0KPiA+IHN0YXRpYyB2b2lkDQo+ID4gZGJ1c192bXN0YXRlX2NvbXBs
ZXRlKFVzZXJDcmVhdGFibGUgKnVjLCBFcnJvciAqKmVycnApIHsNCj4gPiAgICAgREJ1c1ZNU3Rh
dGUgKnNlbGYgPSBEQlVTX1ZNU1RBVEUodWMpOw0KPiA+ICAgICBnX2F1dG9wdHIoR0Vycm9yKSBl
cnIgPSBOVUxMOw0KPiA+DQo+ID4gICAgIGlmICghb2JqZWN0X3Jlc29sdmVfcGF0aF90eXBlKCIi
LCBUWVBFX0RCVVNfVk1TVEFURSwgTlVMTCkpIHsNCj4gPiAgICAgICAgIGVycm9yX3NldGcoZXJy
cCwgIlRoZXJlIGlzIGFscmVhZHkgYW4gaW5zdGFuY2Ugb2YgJXMiLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICBUWVBFX0RCVVNfVk1TVEFURSk7DQo+ID4gICAgICAgICByZXR1cm47DQo+ID4gICAg
IH0NCj4gPiAgICAgLi4uDQo+ID4NCj4gPiBTbyBpdCBzaG91bGQgYmUgcG9zc2libGUgdG8gaGF2
ZSBUWVBFX0NIQVJERVZfR0RCIGltcGxlbWVudA0KPiA+IFRZUEVfVVNFUl9DUkVBVEFCTEUgYW5k
IGNoZWNrIGZvciBzaW5nbGV0b24gdGhlIHNhbWUgd2F5LCB0aGVuDQo+IHJlbW92ZQ0KPiA+IHRo
ZSBDaGFyZGV2Q2xhc3M6OmludGVybmFsIGZpZWxkIElNTy4uLg0KPiA+DQo+ID4gQnV0IGxldCBz
ZWUgd2hhdCB0aGUgbWFpbnRhaW5lcnMgcHJlZmVyIDopDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+
DQo+ID4gUGhpbC4NCj4gDQo+IA0KPiAtLQ0KPiBBbGV4IEJlbm7DqWUNCg==

