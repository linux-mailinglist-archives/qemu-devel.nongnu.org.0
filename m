Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880DE46BF29
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 16:20:40 +0100 (CET)
Received: from localhost ([::1]:46002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mucGj-0007sO-Hv
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 10:20:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1mucFE-0006gE-Md; Tue, 07 Dec 2021 10:19:04 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:40598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bcain@quicinc.com>)
 id 1mucFB-0002vR-LQ; Tue, 07 Dec 2021 10:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1638890341; x=1639495141;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tBFsTlLifItiSMi8ms1NGz6Ek9uhus5yjdwMQfJFU/Q=;
 b=TnSTQBgCXBe8tNDYX/AkfRlKLp/RtxnS9GTeBrbxyNQFarOHtaq9lCsB
 Y+dId2raHhF4f3rHs7/G08lIBJax/Cu7kh9AgDK5q7k7WWpyJjJtoMJb+
 92kvMM0Nepa9+kBhxI8U0St/KpJJdhKm7hWd+RvLNXR0+iVlGYkc06G2r g=;
Received: from mail-dm6nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.173])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 15:18:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMFXSvQq4ldh231k2v/PrMw9fiKFtOJkdD+HykOD34CqYvnO9GXvjAVhTmh/SZwEBbUh0hiD0XeFZDTOatq4STJD5gzhfyirbpf/RxngMLiEC5lv/JwElNPtB8XQyxqu7pt3rk/jEC1a0grLWLKtIckiyB0vDtB0SweVCasIvzzyGXmQa0JTE44NPKfX1gYcHRgpn46hWP7oCjIcmqE8Qpj2RlNbX16Ceug0zIjU1wHbpCssE+Jg0/Gm1+Q1axUSgywCe5mZIc2jjtkdYXfGCK3QhDxVEm4mqZ6wdrIvHd2Nn8yKQEPNkB9h/kPK1UH7UyoMTIiay0neRD3B3aydBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBFsTlLifItiSMi8ms1NGz6Ek9uhus5yjdwMQfJFU/Q=;
 b=M2LQOp4b14mS2Q1zS3DTXCm7yvi/Xwi69pasgC2b8zHJ1nQJyzGIUQ8iYU1FcfFT0EqSZv8YZa2PeeHzzfLg162Yeig/rrCarSth2ZOayDvewviF0wXOaXKnfHUurAoqoaVwbuUBblS9NtOQYnzGlfPdw30BkNHObFx+CPliBffbTwpA3Wg18goee4TJgpLD3DO8bYE8fbaAQK2HLyG6DqieBLbRXOk7D3HHmVmZTB9kq33kh7ArdUNnzt6LEFgEcclCWOIIWOFnxRDg0fgl8xsl/xdAljbZkkAuP5Fe3TGFkODvGGYX23jlkrAEBOVpaQzMvbclXt0r5afUaq9YKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN6PR02MB4205.namprd02.prod.outlook.com (2603:10b6:805:35::17)
 by SN6PR02MB4653.namprd02.prod.outlook.com (2603:10b6:805:af::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.11; Tue, 7 Dec
 2021 15:18:52 +0000
Received: from SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7]) by SN6PR02MB4205.namprd02.prod.outlook.com
 ([fe80::85b4:5d53:c403:d0c7%5]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 15:18:52 +0000
From: Brian Cain <bcain@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>, Damien Hedde
 <damien.hedde@greensocs.com>
Subject: RE: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Thread-Topic: [PATCH v2 for 6.2?] gicv3: fix ICH_MISR's LRENP computation
Thread-Index: AQHX609h+dHXMtNu0UGpsROrGa0UTqwnFLkAgAAOhvA=
Date: Tue, 7 Dec 2021 15:18:52 +0000
Message-ID: <SN6PR02MB42054732F8B59940998D01EDB86E9@SN6PR02MB4205.namprd02.prod.outlook.com>
References: <20211207094427.3473-1-damien.hedde@greensocs.com>
 <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
In-Reply-To: <CAFEAcA-=8an6Q0ZC2Nx6=VoaB0_rucv+vEGS8Fy+ChMc2zCqHg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3df83ae-e6d6-46fa-3a41-08d9b994e0ce
x-ms-traffictypediagnostic: SN6PR02MB4653:EE_
x-microsoft-antispam-prvs: <SN6PR02MB46534EBC4D08BD2CCB35D934B86E9@SN6PR02MB4653.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZNqo12BlT0C4d6sN6f+etP18c4cslDf5VqXLZC5p3DJDziFK97iQOn4gfU7jEbf8gzjL9CGkfIK9zeZG5SxDzlSdE14FwVrGl+i2Odn9y9UNYUs5MKajpSjIH77GuhS+WPqgjFi4wqSA82uyvCN/TD+t+/c9rpQ9g45Ile+3l9aFQHQC0FdbsDiat/4I5WK1uSWHAHZSGKK4FZLR0fXZLA+Wp+yBxFJdJb5ZEX48/jMJaDpTXZv78DctiAhR3YgrCwM0Y3i6dafhGXZBKF/db03SeGC6cO93csO+DDP1mIifEWiAwhEkJ8CiRu6VOTd7ZDQuPNhSN3pTJ933cpP0KOC2to1FJqJpilIpgZ669yCXBE5QoHZjVM8hm5pyc2el2hGtERkf8KCUrGcb7VY3FtGYraxJCm+UASdEumuIRROUUoLwYC8KMsGw0/vXTKrzLSK8ydXLf3AnHt15W1klKucTtQObc6OIjD2XaT7VjJtfTU1y8wcZhSGxucrM/5koGKFxixnxV9P4wD5mG1TX5UeJdDp7iJnpZ2OeEDDcQgNdso66V21iB7pTYn866EOQDs885SFViUi/RFhETrRjMT+P82FO0O9TQBPQVpic/KsDTB/6ytor7G8l7rZ899oGp42H8OR1CqyrPw4VP6Eqx9OFbNIvIqY6mlR58+MKs7rOoXHMWhrSMS2xPQKFZm30G6Rv/OPLmsLKUVipbxGTbxW5uPCVYLBt8qgm7lRgbJ1sjk74i7qdWsm/Xie/VuibWYFjsMj4edaYZ/Cr3J5tkKpyiH4Jw8v1TekH8NCYFAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4205.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(33656002)(83380400001)(508600001)(38100700002)(107886003)(54906003)(110136005)(52536014)(122000001)(8676002)(5660300002)(66556008)(66946007)(38070700005)(66446008)(64756008)(76116006)(8936002)(9686003)(71200400001)(66476007)(4326008)(186003)(6506007)(7696005)(26005)(86362001)(966005)(55016003)(316002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXFWMEpxWWdJRVhoV1A1YkUrLzdvcmVSaThob09vYm4rWHZtRWVKbldrZ3RX?=
 =?utf-8?B?ZGJHbW10YnYwUGJXNEVORk45OHpRM3puWkNIcldXcVNmaTNyTlcwanByWnJ4?=
 =?utf-8?B?U01GS3NtVTl5dmluZDdYNXBVaWZzZTVXQWhIVFVMOGtoMFpLell4WFpkSWNX?=
 =?utf-8?B?cExJQ1lubXNiWG5nMFl3UUlVZFh5TThzZE94NndsNzlYVDFrSldKZnFuTko1?=
 =?utf-8?B?ajNQcTVFc1M0N0d2MU91NmZrUGk3TkdsdVZUUVBEVzFLL1VJZ1BtRXU2WUxL?=
 =?utf-8?B?MmVEbU83WXhDTGtxSldreTA4V0ZHNitsOUtOK2U3RU8wc0hub1VMTnRGaTgx?=
 =?utf-8?B?WWpxYW9lWTZLcDFoVnJaYk4rS0UrRlZzNmZWREFoN05sNHFjTG43Yi9iOXE5?=
 =?utf-8?B?bmppZ2pVZzRLZzFud0orTnl1eFBJeVVRditTcTdNR0VaTHRZTmdpL0s0QVZa?=
 =?utf-8?B?VExkQzk5VlkrQnQxcENuWUJFdHFaWXVNLzc4aXJDVnNrOVFCWjY0aXc3R1li?=
 =?utf-8?B?amlOUjVkbkpXNEpxVmtHa25yZTZINlk2c0RXSDR4L2JLalNSQmFSVXpCUFZJ?=
 =?utf-8?B?emJwK0h0L1NxWStmTUZ2aitFUm0wQjVGbzFUdk9hZWpkZHBlN1JjaE5mTnhP?=
 =?utf-8?B?dVZVVGpwL1VDcTM2bTlIbE5veHFkOXgwaWVaZXl6dkNOTSt5RkZmV2NTdWZ0?=
 =?utf-8?B?am80VDhubXUzVUl1VE52bUtXbTZxd1pQZk9jTmtPTVhjTUUydXRpanNKNk1r?=
 =?utf-8?B?cWJ2M2ZCKzdVa3NXaFlUdGlDZjdXQkR3ai9zNURVcGdIYW96dHBPM3l5Ui9v?=
 =?utf-8?B?Q2x6YjlJdUFuRU9GNGVYc3ZUVmJXV1ByYkEzcWtwTjZaMWtVQ014M3h5WlY3?=
 =?utf-8?B?VWhZU2ZyM2pBc2Q4V3RLcEpITFg5bHN6TFNIVFArTmFjOERNeGFFckZsWlZa?=
 =?utf-8?B?S1Q5NEF6dFYzQ280QWNla3hrZE12eWhBYWVmVG9JNWxiWjRpRHdONVAwUEl5?=
 =?utf-8?B?c1pYdHJWRXVNa2duK0J6QXpCNFFoWms5ZjNwZzRGT1RsVGRXa2s2N09GYmlX?=
 =?utf-8?B?VFh4YWF1ampFMEJId0R3L21sSTZFOVZOWjArbGtwNFFyTHJHMWc5MlZENmVk?=
 =?utf-8?B?RzZCZkZ6Ymo3TmNZckdtMHBnL3JXdC82aFBYQTNtL3JaL1VTVEpwajYrckxJ?=
 =?utf-8?B?NzhDbk9pV3daSjF6TFhqVHR6Nkkva0ppVW5UbVp6aTRETmVRR1d6dU9rWlBQ?=
 =?utf-8?B?Tk4zWlhneTZZOUJ0ZTdiYXljM2ZUT21laWp0SzF5Qm5zS2Q1N2prNE9uVG0x?=
 =?utf-8?B?VXRIcEFqS0YwcWk3b0liakIzSC9BWnpaQ1kyQmM2dlI5UENoc3Y2dFcxZmFz?=
 =?utf-8?B?c2p3RWtSS0ZybWUyQytBeUdXeUJzVlduQ3dUcjRrRFN5cFRFc2ZGa043eG1Z?=
 =?utf-8?B?ZjJGY0NRMm5YU2xYL1Z4dWJoUm1MdWEwby9KdEFmb1dFMjVwV3dmOVdERUlz?=
 =?utf-8?B?azhQaVc5UWExL2tWT3VZdjliVmoyUy9jYWZjd1VWVlRWZmxSQWR6ekMrRXg5?=
 =?utf-8?B?d3hQSThsU1ZRVjFYa3g1UHc1QTNuckY4K0JlZkhlTEhUSzVqOEtRMkkrMzZW?=
 =?utf-8?B?c291NFRVaEZiOTFYR2lUMmVUUTBFRGJKR0pZMWpVbG9ZbzAvSCtOOXVjeDho?=
 =?utf-8?B?VGJpZzB5b3VKc3N2RnNpaGJVTmNUcGI1aDVPMHk1ZGRIc29IQm9wNEVoZk13?=
 =?utf-8?B?bzRuS0kvMGR0eGF2WkhzbWlZSytYYXd2V3dUS1ZNS0pRVFBNK0EvUzJKR0tF?=
 =?utf-8?B?bDV0dXVnTVF2SVZmekw0WFZRNnRaL2JyMVVNWk1mNkFsSjF6Q1RPU1hjYUZn?=
 =?utf-8?B?bEpmQjdjS0hnZjFFbFpWc0k4ZldYcDgwaEhoS0ZGTHk0SXlxS0FnRmtrYmFy?=
 =?utf-8?B?VlMyWWxSV2M5OWdFd1RZOE8zTktIWHZxOTlUbDlHOVU2R21oOXBxRTFwb3Fr?=
 =?utf-8?B?RXNOdi9jVHBrZXFLZk5ocmxqSXpRV2lmWjIzWjRSMklJNmZwNEl4eE9jSjdm?=
 =?utf-8?B?U0loMnBzOUtNM2tKYkhJbC91ZE02a2c1S3ZhSEl4ZExmTTBuYVFPZm9PbEF3?=
 =?utf-8?B?dlEzODhTTTlvK0dNc0d2N1pzUXBWcm84ZUZydmdoZGN2M2RkVFZQV296UFZ4?=
 =?utf-8?Q?eQDf7OUdM0FFqyCnsvvKvug=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4205.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3df83ae-e6d6-46fa-3a41-08d9b994e0ce
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2021 15:18:52.6452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zIUwjN1FTDrHmNRtAoaJw99d0PH8o87odZfbRSo9kiBc4re5aRyyYRdrt5TuCJ3yBJKAe6ONwHZYFk8RDKBwww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4653
Received-SPF: pass client-ip=216.71.140.77; envelope-from=bcain@quicinc.com;
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
Cc: Sid Manning <sidneym@quicinc.com>,
 Carl van Schaik <cvanscha@qti.qualcomm.com>,
 "shashi.mallela@linaro.org" <shashi.mallela@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRZW11LWRldmVsIDxxZW11LWRl
dmVsLWJvdW5jZXMrYmNhaW49cXVpY2luYy5jb21Abm9uZ251Lm9yZz4NCj4gT24gQmVoYWxmIE9m
IFBldGVyIE1heWRlbGwNCi4uLg0KPiBPbiBUdWUsIDcgRGVjIDIwMjEgYXQgMDk6NDQsIERhbWll
biBIZWRkZSA8ZGFtaWVuLmhlZGRlQGdyZWVuc29jcy5jb20+DQo+IHdyb3RlOg0KPiA+DQo+ID4g
QWNjb3JkaW5nIHRvIHRoZSAiQXJtIEdlbmVyaWMgSW50ZXJydXB0IENvbnRyb2xsZXIgQXJjaGl0
ZWN0dXJlDQo+ID4gU3BlY2lmaWNhdGlvbiBHSUMgYXJjaGl0ZWN0dXJlIHZlcnNpb24gMyBhbmQg
NCIgKHZlcnNpb24gRzogcGFnZSAzNDUNCj4gPiBmb3IgYWFyY2g2NCBvciA1MDkgZm9yIGFhcmNo
MzIpOg0KPiA+IExSRU5QIGJpdCBvZiBJQ0hfTUlTUiBpcyBzZXQgd2hlbiBJQ0hfSENSLkxSRU5Q
SUU9PTEgYW5kDQo+ID4gSUNIX0hDUi5FT0ljb3VudCBpcyBub24temVyby4NCj4gPg0KPiA+IFdo
ZW4gb25seSBMUkVOUElFIHdhcyBzZXQgKGFuZCBFT0kgY291bnQgd2FzIHplcm8pLCB0aGUgTFJF
TlAgYml0IHdhcw0KPiA+IHdyb25nbHkgc2V0IGFuZCBNSVNSIHZhbHVlIHdhcyB3cm9uZy4NCj4g
Pg0KPiA+IEFzIGFuIGFkZGl0aW9uYWwgY29uc2VxdWVuY2UsIGlmIGFuIGh5cGVydmlzb3Igc2V0
IElDSF9IQ1IuTFJFTlBJRSwNCj4gPiB0aGUgbWFpbnRlbmFuY2UgaW50ZXJydXB0IHdhcyBjb25z
dGFudGx5IGZpcmVkLiBJdCBoYXBwZW5zIHNpbmNlIHBhdGNoDQo+ID4gOWNlZTFlZmU5MiAoImh3
L2ludGM6IFNldCBHSUMgbWFpbnRlbmFuY2UgaW50ZXJydXB0IGxldmVsIHRvIG9ubHkgMCBvciAx
IikNCj4gPiB3aGljaCBmaXhlZCBhbm90aGVyIGJ1ZyBhYm91dCBtYWludGVuYW5jZSBpbnRlcnJ1
cHQgKG1vc3Qgc2lnbmlmaWNhbnQNCj4gPiBiaXRzIG9mIG1pc3IsIGluY2x1ZGluZyB0aGlzIG9u
ZSwgd2VyZSBpZ25vcmVkIGluIHRoZSBpbnRlcnJ1cHQgdHJpZ2dlcikuDQo+ID4NCj4gPiBGaXhl
czogODNmMDM2ZmUzZCAoImh3L2ludGMvYXJtX2dpY3YzOiBBZGQgYWNjZXNzb3JzIGZvciBJQ0hf
IHN5c3RlbQ0KPiByZWdpc3RlcnMiKQ0KPiA+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBIZWRkZSA8
ZGFtaWVuLmhlZGRlQGdyZWVuc29jcy5jb20+DQo+ID4gLS0tDQo+ID4gVGhlIGdpYyBkb2MgaXMg
YXZhaWxhYmxlIGhlcmU6DQo+ID4gaHR0cHM6Ly9kZXZlbG9wZXIuYXJtLmNvbS9kb2N1bWVudGF0
aW9uL2loaTAwNjkvZw0KPiA+DQo+ID4gdjI6IGlkZW50aWNhbCByZXNlbmQgYmVjYXVzZSBzdWJq
ZWN0IHNjcmV3LXVwIChzb3JyeSkNCj4gDQo+IFJldmlld2VkLWJ5OiBQZXRlciBNYXlkZWxsIDxw
ZXRlci5tYXlkZWxsQGxpbmFyby5vcmc+DQo+IA0KPiBJIHdvbid0IHRyeSB0byBwdXQgdGhpcyBp
bnRvIDYuMiB1bmxlc3MgeW91IGhhdmUgYSBjb21tb24gZ3Vlc3QNCj4gdGhhdCBydW5zIGludG8g
dGhpcyBidWcuDQoNClBldGVyLA0KDQpJIGtub3cgdGhhdCBRdWFsY29tbSBlbmNvdW50ZXJzIHRo
aXMgaXNzdWUgd2l0aCBpdHMgaHlwZXJ2aXNvciAoaHR0cHM6Ly9naXRodWIuY29tL3F1aWMvZ3Vu
eWFoLWh5cGVydmlzb3IpLiAgQXBvbG9naWVzIGZvciBub3QgYmVpbmcgZmFtaWxpYXIgLS0gImNv
bW1vbiBndWVzdCIgbWVhbnMgbXVsdGlwbGUgZ3Vlc3Qgc3lzdGVtcy9PU3MgdGhhdCBlbmNvdW50
ZXIgdGhlIGlzc3VlPyAgRG9lcyB0aGF0IG1lYW4gdGhhdCBpdCB3b3VsZCBub3Qgc3VmZmljZSB0
byBkZW1vbnN0cmF0ZSB0aGUgaXNzdWUgZm9yIHRoZSBvbmUga25vd24gY2FzZT8NCg0KLUJyaWFu
DQo=

