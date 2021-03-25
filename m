Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3692349863
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 18:40:20 +0100 (CET)
Received: from localhost ([::1]:50402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPTxz-00071p-Uj
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 13:40:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lPTv9-00063h-G2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:37:26 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:21801)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lPTux-0006QH-Je
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 13:37:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1616693831; x=1648229831;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=35t45gWPusPD88lfo/1SlHe2c6LiwAAxfd8nTQDzWYs=;
 b=RcGhAiGzvalsHKorEHlMTSNZrRwHCJB9x9tiFgIhrQUgZmE1eqqRZo7F
 0SuBcM3mh2sojlmGFQgNJ2JzpS1vnoghBdsIoM5BUtczT8/VFVWWqB3Xf
 6hzNCmbBCidb7wAapJW324nXa7tPZC57HQA5O/ljndx2mf7kg3gvoCIyc 0=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 25 Mar 2021 10:37:07 -0700
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 25 Mar 2021 10:37:07 -0700
Received: from nasanexm03e.na.qualcomm.com (10.85.0.48) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 25 Mar 2021 10:37:06 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Thu, 25 Mar 2021 10:37:06 -0700
Received: from SN6PR02MB4895.namprd02.prod.outlook.com (2603:10b6:805:8f::16)
 by SA0PR02MB7180.namprd02.prod.outlook.com (2603:10b6:806:e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 17:37:05 +0000
Received: from SN6PR02MB4895.namprd02.prod.outlook.com
 ([fe80::98a1:5133:38e3:cc8a]) by SN6PR02MB4895.namprd02.prod.outlook.com
 ([fe80::98a1:5133:38e3:cc8a%7]) with mapi id 15.20.3955.028; Thu, 25 Mar 2021
 17:37:05 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH 11/15] Hexagon (target/hexagon) circular addressing
Thread-Topic: [PATCH 11/15] Hexagon (target/hexagon) circular addressing
Thread-Index: AQHXISGff2MHOQZCgEe+JLJp9qZ/86qU5vYAgAAEgIA=
Date: Thu, 25 Mar 2021 17:37:05 +0000
Message-ID: <SN6PR02MB48957AFA71DA4C571E5943B9DE629@SN6PR02MB4895.namprd02.prod.outlook.com>
References: <1616640610-17319-1-git-send-email-tsimpson@quicinc.com>
 <1616640610-17319-12-git-send-email-tsimpson@quicinc.com>
 <c06f50bb-cf79-f719-4cb2-4b57a0df59d6@linaro.org>
In-Reply-To: <c06f50bb-cf79-f719-4cb2-4b57a0df59d6@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b1fcbaec-71b0-45c6-4720-08d8efb49b85
x-ms-traffictypediagnostic: SA0PR02MB7180:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR02MB718047FB4C88AEAA0BCAD262DE629@SA0PR02MB7180.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:635;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ggr6Nlbci+GRVgTFSA1UDTGZpKoMosk9CxEy9qYs33R4A+xWLWsJV0a7+PvbgLzOPlVi8eTT98iZLs21YcswWqpC0nFCd8hkvm5W7MRRmoZS6ofGL7tfmajq/xzqIQm2XWU85GEuWb4WY6nvB7mW1+AnHuznBjRT1jMKOyG5fukxbj9WVStJQEKC+h+XZUsz0/TGAezhqCACV5Gt2TAjjcNDzw34TbUmTvK3zC2oGRfSFkL3W3pkYUT8X8PHoZPCXpIwqrIJp7siab8BrYUhAo3wrHuV75J76gutu16WkaxQe0WvvU5o6qHQ9ZWraup4Zr0FLQOmndGIJwNxaYB5CfunMCLw4/jBPIN1mmauCm02e2YXKq6tMsvkiqvbQB+p25Arj1HMk7XMA71Gr0gt3A5MNRQwMIeqedAIChnxtKvl6O7OSRgmD4xra7/mtNZs6TbPO/g6v5QLJDwegQ4bP2SpbejK7eC8T70EpBoJabU4PCpBe9e7ILiNSbVYwGQcRiqO0ZzOHwlutzCSJe3+EoZ1UHlwuu8H7XxJxn1B3OwNz1tSifZeERQHo8RiT2dT277x6aEvlyRLOFSKqWMnG0wg5Ugh8mjdXP+84GmF7dwzI9GwVtTEQsQY246nIivHbMg72MF0wGpwnK7s1Y6ZT/C4N6B9jhi1fapYtzsT6nA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4895.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(66446008)(66556008)(5660300002)(8936002)(76116006)(71200400001)(8676002)(64756008)(66476007)(53546011)(6506007)(66946007)(83380400001)(55016002)(33656002)(7696005)(9686003)(4326008)(52536014)(107886003)(478600001)(86362001)(38100700001)(110136005)(2906002)(54906003)(186003)(316002)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?V3UydlhRTGdaVjNKajI1ZjN6eVZFOFBsUTVWVzIrZWlFaDFXU1ppbHZNVDNp?=
 =?utf-8?B?VzYyeWdEWVJ5MlpZOGs3UWZUR3lGakRSa2llTnpkWk5EYjlKQ3hjMHBNVVdo?=
 =?utf-8?B?NEpjeURHVnAwRkJibUZ3QXBzcFZxMGZJVjFxam9DUmlHMEE0aE95aml2UEoz?=
 =?utf-8?B?V3VDM3k4MDZ5Njk2cm1GUFZHcFVwZ0JQM0ZFaW9IQzJqQ0RLMjBiSUZwemxM?=
 =?utf-8?B?dDZJUE5BdUhBNXlpZi9kM0VqNXVzbEdHeTRUcEQxdXFTVGg5cVBydnN2YlRH?=
 =?utf-8?B?TWpvb09tSmdOeVZBQnU3TTh0aFRDVjIwSG5CdVAxVldZU2NWQ0tqeXIwL3U1?=
 =?utf-8?B?MW9hQzRoYkxHMDdSeHF1M2tmR2Q5WVdrRSsyalFQNUFSWVNtSXhkTDZwekc2?=
 =?utf-8?B?QVNnNE9SMUlaWXJ5OWdtUDgxSE1KL3R4M0VNc1d6OVpTZHd1STlLRTY0clFD?=
 =?utf-8?B?UktaNzFTQUFOSmdrVXU3QVpFbXB4OVc5aGpkSlYyTzJRMnJrd3BlVWxZUkhL?=
 =?utf-8?B?RUFZbGNDT1dUN3hYZGw1Wk9sTnNZKzVWU2NzblFMbDI3dC9UVUdIWTNibURU?=
 =?utf-8?B?bm1zai9pbS9uSFI2VmFtekhseG1kY1pWVSsrMWplbUpNY3dQbHJ4YjF0MFVE?=
 =?utf-8?B?MVM1YTBvTWRXTGYrcnNTTmdubFJPVmxjeHFtMzY4a3FHRU4xVFdFNWVkMlJR?=
 =?utf-8?B?VSt5LyszWnB0OS9oRGlBb2IvS2UwUG5nMklkUG5iekgwZ00wMkVoaHBncCtj?=
 =?utf-8?B?cVJIN3VER2lyTmhsbk1MZ29qQmhTZ2FJL0pxdUxzcmpvR3ZodkorejlWYk5G?=
 =?utf-8?B?UjRoZmpKOFZpWUVWMWpNd0dyd2NjTkZhOGJwYWl4WGo4bmp4dlBPdDFYbmU5?=
 =?utf-8?B?ZnQzeVFwTkpSSFVDdnh2NUZlWFdZSW93T1RvdUxtY3FxbXdBbWRrWTdKWVRy?=
 =?utf-8?B?VmwzcDFyN2MwdzRnMC9uQ0hDMVgyMFdSSGFtREprVFkyb3UzNXg5MEpVTUpQ?=
 =?utf-8?B?ZHRJbmJVVk81QWZDazdHdUJyZGRDckIvWjYvRUZIRlA0SGZyWC9oLzl1TlRl?=
 =?utf-8?B?YXlYVThoKzNZL1N1OE1EaE56cEoxbnBBK2ZTSHFuTVFnNlZBVDRXZ0UvSXFr?=
 =?utf-8?B?UGZMVUhPWWoxREdEWnBnK1VZSDdQcE5zVXhqdTJUMXpsV2RlZGdrc3M2bzJ0?=
 =?utf-8?B?QVduS0hER2dBeHRUcm84MTVucE5YYWtYQlUzVHEvTkd3dng1K1cvUG02TDVE?=
 =?utf-8?B?Y1pMbE9iVWdCTG1hR25TdzFqT3lxUk1vM2NDaURXSGYzL01lZHc1UTRaOExU?=
 =?utf-8?B?RE5iaS9UQlNtU010dkhGTGtTdXpwdkYwSE9ScXVkWk5jTng4aGl6S2JjNUh3?=
 =?utf-8?B?Q1VXbHpTQkhCMytOdkJlSitPSG9LL2krRU1TeVJ2djR3Z2FqNm9KOGI4UXRq?=
 =?utf-8?B?MU5YS21VU0s2QkowanJwTU1vQjFEZUJhbjc2OFU4dkJ2YXdrUFhLVmZpeEFl?=
 =?utf-8?B?NlNoK0RsdWRnMjBDUkRZWFoyS3BndHpoUzNGU1lpQ2FuT1hYNXVpNUY0RTNv?=
 =?utf-8?B?cGxNK3lDaWpFRXFjQlFSaDRPOXpSbHFhMkNaamtBa01VR2hscUc3L0ZTMytp?=
 =?utf-8?B?QUlNWUoxMEFnU2w2VjNUUzBwdHZWK09UeWp0My8vNjlmZmVhbEtBWHNVbTgx?=
 =?utf-8?B?c0dDVG1HNCsvWHNJTFdhbmJTR2F4WU5tVUpZbU1NTmRLc1poSC90WUNValFU?=
 =?utf-8?Q?q7zxmAMSEnrpDpGFaCLetPnhzRJVydKtuyrdOso?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TkYEgRBLvlrhj0arGOKnqmyq32KN9QYfHrbd507FtppWB9YZelm5GPS52No+0zjb1LKPaZmtzyVjJQ8bYhwf3RzVYTPO3WA9RX4wWJQPisJvUyo5Y+D2kZdtMqTKiK3wphLxW7w2G1LzDHWV64F0tgwbw0roOCC5KvTlpjl68UKIlCXZv1H/nxMZhpw7j93GcSIEgqEY63+olVYyTY48pjajzlcXKS8i5R8kgphWJBe9YktkzwqFfRZnKsTaZN9MAT1qnjaIMT0DsFAqIQ6p5THw8ntewZkAHl3fQUDK3ZUsAAOaBpIUFHG/p+Oe0nT2Bi1Rgp45bR2+dLWL+TGcyw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mtes6LF78g01zrvSLO07NKb6a84Tu/Y9EB1cYsJ9Wio=;
 b=eJPvoMa9KmBRN6hQfqE/6EIy8HQqWOx0Zu4XVVMPuzTNfUBh9z6l0O32fuoayyJRb3w6zu+N/8Wgv1IyCToHx4WXSLceenS3uou8a0lxZnmD0i3AlbeFrecqKqJsC7Uzr5JJ4NraSfGhQcQnkcxmBAahy6MD+VE5I2zxjeQ1VbuBRYt/rhuvgNfICzoPE29BkGZT3xZiBE+FHSm9U8ZVVeTXR6EjYOcyo7r43a8TXCXe89SGbSTSku9LM8bmTDKXcFFknppIUN9yMJy2RxrAYKKmk5UdQVAY7ocX46pKSfOppeY5Z3jl+LZpuBIFsJnHCUhuBrBkaX3fX0Cnkf4svA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: SN6PR02MB4895.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: b1fcbaec-71b0-45c6-4720-08d8efb49b85
x-ms-exchange-crosstenant-originalarrivaltime: 25 Mar 2021 17:37:05.4236 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: d6jZI/TVD5TwcdqKlZoP16GXI8IWJ5+glWCq8mbiIJtFuFS8gy2F9nzH0gFBnqQoRmpoEYoD125OdL8EZDYyBw==
x-ms-exchange-transport-crosstenantheadersstamped: SA0PR02MB7180
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
b24gPHJpY2hhcmQuaGVuZGVyc29uQGxpbmFyby5vcmc+DQo+IFNlbnQ6IFRodXJzZGF5LCBNYXJj
aCAyNSwgMjAyMSAxMTozNCBBTQ0KPiBUbzogVGF5bG9yIFNpbXBzb24gPHRzaW1wc29uQHF1aWNp
bmMuY29tPjsgcWVtdS1kZXZlbEBub25nbnUub3JnDQo+IENjOiBwaGlsbWRAcmVkaGF0LmNvbTsg
YWxlQHJldi5uZzsgQnJpYW4gQ2FpbiA8YmNhaW5AcXVpY2luYy5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggMTEvMTVdIEhleGFnb24gKHRhcmdldC9oZXhhZ29uKSBjaXJjdWxhciBhZGRyZXNz
aW5nDQo+DQo+IE9uIDMvMjQvMjEgODo1MCBQTSwgVGF5bG9yIFNpbXBzb24gd3JvdGU6DQo+ID4g
Ky8qDQo+ID4gKyAqIE1hbnkgaW5zdHJ1Y3Rpb25zIHdpbGwgd29yayB3aXRoIGp1c3QgbWFjcm8g
cmVkZWZpbml0aW9ucw0KPiA+ICsgKiB3aXRoIHRoZSBjYXZlYXQgdGhhdCB0aGV5IG5lZWQgYSB0
bXAgdmFyaWFibGUgdG8gY2FycnkgYQ0KPiA+ICsgKiB2YWx1ZSBiZXR3ZWVuIHRoZW0uDQo+ID4g
KyAqLw0KPiA+ICsjZGVmaW5lIGZHRU5fVENHX3RtcChTSE9SVENPREUpIFwNCj4gPiArICAgIGRv
IHsgXA0KPiA+ICsgICAgICAgIFRDR3YgdG1wID0gdGNnX3RlbXBfbmV3KCk7IFwNCj4gPiArICAg
ICAgICBTSE9SVENPREU7IFwNCj4gPiArICAgICAgICB0Y2dfdGVtcF9mcmVlKHRtcCk7IFwNCj4g
PiArICAgIH0gd2hpbGUgKDApDQo+DQo+IFdvdywgdGhpcyBpcyBhd2Z1bGx5IG1hZ2ljYWwuICBJ
IGRvbid0IGV2ZW4gc2VlICJ0bXAiIHJlZmVyZW5jZWQgaW4gdGhlDQo+IFNIT1JUQ09ERS4gIFdo
YXQncyBnb2luZyBvbiBoZXJlPw0KDQpIZXJlJ3MgYW4gZXhhbXBsZTpMMl9sb2FkcnViX3BjaQ0K
U2VtYW50aWNzOntmRUFfUkVHKFJ4Vik7IGZQTV9DSVJJKFJ4VixzaVYsTXVWKTsgZkxPQUQoMSwx
LHUsRUEsUmRWKTt9DQoNClRoZSBuZWVkIGZvciB0bXAgaXMgaW5zaWRlIHRoZSBmUE1fQ0lSSSBt
YWNybw0KI2RlZmluZSBmUE1fQ0lSSShSRUcsIElNTSwgTVZBTCkgXA0KICAgIGRvIHsgXA0KICAg
ICAgICBUQ0d2IHRjZ3Zfc2lWID0gdGNnX2NvbnN0X3RsKHNpVik7IFwNCiAgICAgICAgZ2VuX2hl
bHBlcl9mY2lyY2FkZChSRUcsIFJFRywgdGNndl9zaVYsIE11ViwgZlJFQURfQ1NSRUcoTXVOKSk7
IFwNCiAgICAgICAgdGNnX3RlbXBfZnJlZSh0Y2d2X3NpVik7IFwNCiAgICB9IHdoaWxlICgwKQ0K
DQpOb3RpY2UgdGhlIHVzZSBvZiBmUkVBRF9DU1JFRw0KI2RlZmluZSBmUkVBRF9DU1JFRyhOKSAo
UkVBRF9SRUcodG1wLCBIRVhfUkVHX0NTMCArIE4pKQ0KDQpTbywgd2UncmUgdXNpbmcgdG1wIHRv
IGNhcnJ5IHRoZSB2YWx1ZSByZWFkIGZyb20gdGhlIENTIHJlZyB0byB0aGUgZ2VuX2hlbHBlcl9m
Y2lyY2FkZCBjYWxsLg0KDQoNCkknbGwgZ28gYWhlYWQgYW5kIG1vdmUgdGhlIGNyZWF0ZS9mcmVl
IHRtcCBpbnNpZGUgdGhlIGZQTV9DSVJJIG1hY3JvLg0KDQpUaGFua3MsDQpUYXlsb3INCg0K

