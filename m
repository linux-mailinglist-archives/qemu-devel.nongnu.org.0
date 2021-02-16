Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E99BF31C91D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 11:53:18 +0100 (CET)
Received: from localhost ([::1]:46386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBxyn-0002AR-Vh
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 05:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lBxwt-0000K4-64; Tue, 16 Feb 2021 05:51:19 -0500
Received: from mail-dm6nam12on2056.outbound.protection.outlook.com
 ([40.107.243.56]:12000 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <saipava@xilinx.com>)
 id 1lBxwq-00082n-2Z; Tue, 16 Feb 2021 05:51:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8/EHiLhyYbbXUKTip6pbq2j5/Mna163wb/bDVNojILSLWy4SGK5Py7K97CDcmx9JZzFJrCJs5SF6yle1P0UkIB9RCxV+hBC6Es6V4nYGp0k+CiD3l8JAlbXyeVqAu2W+nHaSZ+F6GNZOWgg0oycQ9W6AfWTd55VSBAvQ5MKzVe6hb3RvlZdp2fo1sN0iOYAmrnY8IH8o1wcZiQe4cansBZfF+A2Nxw142mG4wHhQyu/KHrC0eAQN/SAqh3l9qcacaGCHrk7IsZ+6ByQKtpmrzFa5RTyLc0URfrteEAmKbinZX+aMpFE4ejc1NC+m0/ye8c27u93BX4QEaCNTUGIoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9CEycJ0I1gdNigMJLIO343tsDBI+NjKWcmsMqRDIsk=;
 b=KSJDB0GKESBC0K6tNsBNSR4q6GibfIN+CZix9+qSzUm5wL7Lx5ueSPIW9PV8+xXI6+KHk2+V9DhjYciMn4gpsut2+x3D6Psq4eeXXM9dOFRcZb9PNyqUaNpYwKZQydiueQyZShO3t7G2cg3RtpY9WO3DO2/+QnWDu7vaQYZB1ut7S8qEVMjdSJjTOdTXhlCNODw9+gVb0kfWBeQ8y7xf62rAzcwNdW1L2aszPnhwSUfHuCUujgz2Yt4LfClHmKFSU38ZlS+ODg51NRSbHTjpxOPIEiGlCOMLVKvmR5WbQLrQNESys20u9sbD7SOHKGT0HdHBxE/52FOLQoldYKazTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o9CEycJ0I1gdNigMJLIO343tsDBI+NjKWcmsMqRDIsk=;
 b=RXxEsL0FGeIzwLrR/WgaQnLHNk+/veBZpq7Bn2o9ZfTu6Q1so3F8whYIKBTwXIxBOkMhKsTOv4QdsWBUVZqyUfx0N17EGnfbrJKQQVrU1juYzBsDLt58myCbLJ7qIsv2OHAiVEfH/2ZViMddWEHJHP35HRp/tS0UKJfP6apf7mI=
Received: from BY5PR02MB6772.namprd02.prod.outlook.com (2603:10b6:a03:206::11)
 by BYAPR02MB5896.namprd02.prod.outlook.com (2603:10b6:a03:122::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Tue, 16 Feb
 2021 10:51:12 +0000
Received: from BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf]) by BY5PR02MB6772.namprd02.prod.outlook.com
 ([fe80::c18e:1693:fd4e:7fdf%5]) with mapi id 15.20.3846.042; Tue, 16 Feb 2021
 10:51:12 +0000
From: Sai Pavan Boddu <saipava@xilinx.com>
To: Alistair Francis <alistair23@gmail.com>
Subject: RE: [RFC PATCH 10/15] sd: emmc: Update CID structure for eMMC
Thread-Topic: [RFC PATCH 10/15] sd: emmc: Update CID structure for eMMC
Thread-Index: AQHXAE21JgFd38Ueskm4IxNX+87atapVFyiAgAWLEEA=
Date: Tue, 16 Feb 2021 10:51:12 +0000
Message-ID: <BY5PR02MB677267A884D78F5E54E382D6CA879@BY5PR02MB6772.namprd02.prod.outlook.com>
References: <1613031446-22154-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613031446-22154-11-git-send-email-sai.pavan.boddu@xilinx.com>
 <CAKmqyKOcADG6Dd=BQ3GwixNmEAKMUg7bR7Nhx4wc33iLrcZbvQ@mail.gmail.com>
In-Reply-To: <CAKmqyKOcADG6Dd=BQ3GwixNmEAKMUg7bR7Nhx4wc33iLrcZbvQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=xilinx.com;
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8c687929-328f-4d29-2342-08d8d268c6a6
x-ms-traffictypediagnostic: BYAPR02MB5896:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5896C4A977022805BAA09FF7CA879@BYAPR02MB5896.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1CImNS64rSeb3jbKzgvC+PmRWTcMjMpJfpLNSzH2xLATIe/yprmFb5chSYoeox6Zq6LP8XMkMfEZYrxUTDdS5jq0Igj9eCe6Bp1NmiYguv/91BKOPs8A3eZGTeQigiZkg4hAdJwYDt8T8JXkLV8l2rPQzynRWqKRhEYfQ4Mnd+AULmM81CjOvWkVl0Oo0V4E4/hf/Q+KSn4LN12HxwOdcaoDbX4A7hJGVnFxgrnt/8OlsvdO2nfdHWpVYaTtUqTApJnqmrI/3K0/7/e5N7jTRr18Vm1G9f601nbHuTMLGWTacWZOmY84MmdkJOg+4SOG9UvDjidhSQleGbD9IOp/l0yN3X9kPrCt0MKPSwTr7zRaoHby/C0YlfqIOxl8tz86L0zdqKBUfvdDGSYO+WfQ/j4TOJr3FPOO3zLKYgSe682uhTuvEchaG0+PY7HjFCvV77ScEcfHwSs0Ri+qNUzvEoMx3lo+F58u5pbll9cLnCzFsC+Ua+wpeUjXZzgcnWnS/Y+BOVXVc7/JhT9uTCqvDw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR02MB6772.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(396003)(366004)(136003)(376002)(478600001)(8936002)(86362001)(33656002)(71200400001)(7696005)(4326008)(53546011)(26005)(83380400001)(5660300002)(54906003)(8676002)(6506007)(55016002)(9686003)(66476007)(76116006)(66446008)(64756008)(66946007)(186003)(66556008)(15650500001)(52536014)(7416002)(6916009)(66574015)(316002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?cGFVbG5ucGhDZWpCSlJqTmhzRU1LTEZmQjhYL3hUMmpkZmEvQkZvOVRQblBD?=
 =?utf-8?B?eG5ZVlgrTnJOaVRGa1pJeTh3bkMrRDYrVXJRb3dabURLclk0aVdlc1BmWUli?=
 =?utf-8?B?d0E5RzUzeERNT2I0ZTROWVcyVnR5ckpuY1NNOGdWUDVEWGc2bjN4bjE3K3BB?=
 =?utf-8?B?dnVXUHRJK0JUV1VFSXhKcDZrNWhDTUVWUkxTSGhOVFBOb3Q5QnJnRlA1MVk3?=
 =?utf-8?B?aG1WNVdIMGNZQkFRbXpoSlp6RUdjRnpMcW8zTVlZUTZ0a3UyK3crS0x4U3NE?=
 =?utf-8?B?K2YrQldwWFluYklvMUMwSG81NHl4ZXVlblorN2l4dlU1TGJidzV3cXRDQWVo?=
 =?utf-8?B?TUJEeXVOcFlyZWdSa0VFajJ0MHZub1pmcVNGcTBiNGtGUTJUbXNnMnVVQnlX?=
 =?utf-8?B?T0M2SkFtaGN5WS9rSWFXQkM3OUFSZ3ZFNHB0a2hpMG1ZdkNka1FjcGJlb0Jj?=
 =?utf-8?B?ZlZyZE1pL0tBOXQ4NklHRjV3UVBnZFk5bVhKSGk5Zk1LWFFFMy9yNmV3Q0x4?=
 =?utf-8?B?R0FXWE82dTJpWGV6UDg0b0lDVWhhL2lXckcxeXRxckF1aThUNDI1WHZiSEdH?=
 =?utf-8?B?SWJBMnVrcVBteXUxQkdKZGJXa2JjVjIzTmRvenpXaXRsN3l6YlVLK1k3Qitz?=
 =?utf-8?B?cXZzWDExcWdhWG5DV0o4b0lHU2dHRTE4YmVpaXJxSThsK3h2NG9xOVAxMjYz?=
 =?utf-8?B?UWtIQzlEcW5FYXd4RjgwRkVCemNmWmd0UVhScHZrd05NbFc2bVZ5YUY4bWlT?=
 =?utf-8?B?QUJXbm5KczlSeUo5cHZpT3VWYk11QldXckJBSXJKMi9HNUljM1J6Y0RoWVNU?=
 =?utf-8?B?ZUNyWUNYbjlBSmhBQ0VPUy9qRTNMOVE4Unp6bU9ML3RsdjRUZkQ2Y0NHcENn?=
 =?utf-8?B?RlFkUWlYaUl4c2xPT3Fybk91ckl6dVdJYWVyalBxMGVTM0YwZ2pLQXBWbksx?=
 =?utf-8?B?VEw3VXE2cEsxWktmNWFDRmpNNGFtZzEveWNkTWdjTEpITEZ2dWZLSjZNUmUr?=
 =?utf-8?B?dld3VEQ3NXg1eEtGWm9kSVY5aXRQMGhzYkZCYUR4NS9CaWw2SGluWitIODhO?=
 =?utf-8?B?U3VoSDk2ejdHZVRGa3JoM1M2S2NVby90cXF6Y0RhSjJtL3k1WmdrTmdqUGww?=
 =?utf-8?B?SWZnTE5PaGRTN0hRS1hlRlhXM25ybFFZcDJGNkVaZWVkdHpLcVdRdkY1bWJF?=
 =?utf-8?B?enA4NzhuTlBYcHQ1OVJkYXlxYUxoWno0c1BpNEluajl1c1RxU3daSUtjQi80?=
 =?utf-8?B?MEo2eWdYdXdwWTdzQnYrMStoMnFac1l2RFRCdmhMeitrQldIZXhBVnBoVng4?=
 =?utf-8?B?bmQ3QzFyY1RUMTdBS2lmQ1dkTUkzV0x6R08zYUVxRUdreUR2VmlxYjZtY3RB?=
 =?utf-8?B?MGdPcXcyK1BkcytHQWVlak9yYkxtUGhCSGhlTG52S2FURG82dUFzSWtpTklE?=
 =?utf-8?B?RDNpTXVIYjVUdXhPTjNmNUQ0Z2VMVzRuSHgxQmNlTXJ5Q1gvcElWS0VrZ3pG?=
 =?utf-8?B?SVFuellMM1NmaEYvNGVCRld2U2orUUw0dUxBNnFiQkVETXFURm9WQmFPMloz?=
 =?utf-8?B?Zmk3cmZYYnduck50UWJ5MlJKbW5GbWhZYnBOSFR3UGx4VFJBRGU0UTBDWlpI?=
 =?utf-8?B?NkhicFArZWdUQmVaQ2p1MVVrVzZua0QxVFZ6cEN4Q1AzS0lTeTh0RWxLSVF0?=
 =?utf-8?B?Q1hJbmZBTkZJTDNRbE9Ma0phanFvUmFQY0h0ZjloT2w1R2NpTGtVS3doR3FQ?=
 =?utf-8?Q?RwG2TtD3VKaoBLhVaMm2C2wGXCF4lunjKdS0eFm?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB6772.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c687929-328f-4d29-2342-08d8d268c6a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Feb 2021 10:51:12.2919 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qcyKLdNadGBqooDuxU6TV51PTz0gHexKJigoWfBsfUl3zVjBF5Uyn7dcw+4Pdr5IBwiL98AK7szwQb4WBSnLdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5896
Received-SPF: pass client-ip=40.107.243.56; envelope-from=saipava@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Vincent Palatin <vpalatin@chromium.org>, Luc Michel <luc.michel@greensocs.com>,
 Qemu-block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Edgar Iglesias <edgari@xilinx.com>,
 Alistair Francis <alistair.francis@wdc.com>, Joel Stanley <joel@jms.id.au>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SGkgQWxpc3RhaXINCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxpc3Rh
aXIgRnJhbmNpcyA8YWxpc3RhaXIyM0BnbWFpbC5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCBGZWJy
dWFyeSAxMywgMjAyMSAzOjQxIEFNDQo+IFRvOiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGls
aW54LmNvbT4NCj4gQ2M6IE1hcmt1cyBBcm1icnVzdGVyIDxhcm1icnVAcmVkaGF0LmNvbT47IEtl
dmluIFdvbGYNCj4gPGt3b2xmQHJlZGhhdC5jb20+OyBNYXggUmVpdHogPG1yZWl0ekByZWRoYXQu
Y29tPjsgVmxhZGltaXIgU2VtZW50c292LQ0KPiBPZ2lldnNraXkgPHZzZW1lbnRzb3ZAdmlydHVv
enpvLmNvbT47IEVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPjsNCj4gSm9lbCBTdGFubGV5
IDxqb2VsQGptcy5pZC5hdT47IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+OyBWaW5j
ZW50DQo+IFBhbGF0aW4gPHZwYWxhdGluQGNocm9taXVtLm9yZz47IERyLiBEYXZpZCBBbGFuIEdp
bGJlcnQNCj4gPGRnaWxiZXJ0QHJlZGhhdC5jb20+OyBUaG9tYXMgSHV0aCA8dGh1dGhAcmVkaGF0
LmNvbT47IFN0ZWZhbiBIYWpub2N6aQ0KPiA8c3RlZmFuaGFAcmVkaGF0LmNvbT47IFBldGVyIE1h
eWRlbGwgPHBldGVyLm1heWRlbGxAbGluYXJvLm9yZz47IEFsaXN0YWlyDQo+IEZyYW5jaXMgPGFs
aXN0YWlyLmZyYW5jaXNAd2RjLmNvbT47IEVkZ2FyIElnbGVzaWFzIDxlZGdhcmlAeGlsaW54LmNv
bT47IEx1Yw0KPiBNaWNoZWwgPGx1Yy5taWNoZWxAZ3JlZW5zb2NzLmNvbT47IFBhb2xvIEJvbnpp
bmkgPHBib256aW5pQHJlZGhhdC5jb20+Ow0KPiBTYWkgUGF2YW4gQm9kZHUgPHNhaXBhdmFAeGls
aW54LmNvbT47IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZyBEZXZlbG9wZXJzDQo+IDxxZW11LWRldmVs
QG5vbmdudS5vcmc+OyBRZW11LWJsb2NrIDxxZW11LWJsb2NrQG5vbmdudS5vcmc+DQo+IFN1Ympl
Y3Q6IFJlOiBbUkZDIFBBVENIIDEwLzE1XSBzZDogZW1tYzogVXBkYXRlIENJRCBzdHJ1Y3R1cmUg
Zm9yIGVNTUMNCj4gDQo+IE9uIFRodSwgRmViIDExLCAyMDIxIGF0IDEyOjMwIEFNIFNhaSBQYXZh
biBCb2RkdQ0KPiA8c2FpLnBhdmFuLmJvZGR1QHhpbGlueC5jb20+IHdyb3RlOg0KPiA+DQo+ID4g
Q0lEIHN0cnVjdHVyZSBpcyBsaXR0bGUgZGlmZmVyZW50IGZvciBlTU1DLCB3LnIudCB0byBwcm9k
dWN0IG5hbWUgYW5kDQo+ID4gbWFudWZhY3R1cmluZyBkYXRlLg0KPiA+DQo+ID4gU2lnbmVkLW9m
Zi1ieTogU2FpIFBhdmFuIEJvZGR1IDxzYWkucGF2YW4uYm9kZHVAeGlsaW54LmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBFZGdhciBFLiBJZ2xlc2lhcyA8ZWRnYXIuaWdsZXNpYXNAeGlsaW54LmNv
bT4NCj4gPiAtLS0NCj4gPiAgaHcvc2Qvc2QuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM1IGlu
c2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2h3L3Nk
L3NkLmMgYi9ody9zZC9zZC5jDQo+ID4gaW5kZXggN2FhYjY0Ny4uNDUzMTFmYSAxMDA2NDQNCj4g
PiAtLS0gYS9ody9zZC9zZC5jDQo+ID4gKysrIGIvaHcvc2Qvc2QuYw0KPiA+IEBAIC0zNDUsMjMg
KzM0NSw0MSBAQCBzdGF0aWMgdm9pZCBzZF9zZXRfc2NyKFNEU3RhdGUgKnNkKQ0KPiA+DQo+ID4g
IHN0YXRpYyB2b2lkIHNkX3NldF9jaWQoU0RTdGF0ZSAqc2QpDQo+ID4gIHsNCj4gPiAtICAgIHNk
LT5jaWRbMF0gPSBNSUQ7ICAgICAgICAgIC8qIEZha2UgY2FyZCBtYW51ZmFjdHVyZXIgSUQgKE1J
RCkgKi8NCj4gPiAtICAgIHNkLT5jaWRbMV0gPSBPSURbMF07ICAgICAgIC8qIE9FTS9BcHBsaWNh
dGlvbiBJRCAoT0lEKSAqLw0KPiA+IC0gICAgc2QtPmNpZFsyXSA9IE9JRFsxXTsNCj4gPiAtICAg
IHNkLT5jaWRbM10gPSBQTk1bMF07ICAgICAgIC8qIEZha2UgcHJvZHVjdCBuYW1lIChQTk0pICov
DQo+ID4gLSAgICBzZC0+Y2lkWzRdID0gUE5NWzFdOw0KPiA+IC0gICAgc2QtPmNpZFs1XSA9IFBO
TVsyXTsNCj4gPiAtICAgIHNkLT5jaWRbNl0gPSBQTk1bM107DQo+ID4gLSAgICBzZC0+Y2lkWzdd
ID0gUE5NWzRdOw0KPiA+IC0gICAgc2QtPmNpZFs4XSA9IFBSVjsgICAgICAgICAgLyogRmFrZSBw
cm9kdWN0IHJldmlzaW9uIChQUlYpICovDQo+ID4gLSAgICBzZC0+Y2lkWzldID0gMHhkZTsgICAg
ICAgICAvKiBGYWtlIHNlcmlhbCBudW1iZXIgKFBTTikgKi8NCj4gPiAtICAgIHNkLT5jaWRbMTBd
ID0gMHhhZDsNCj4gPiAtICAgIHNkLT5jaWRbMTFdID0gMHhiZTsNCj4gPiAtICAgIHNkLT5jaWRb
MTJdID0gMHhlZjsNCj4gPiAtICAgIHNkLT5jaWRbMTNdID0gMHgwMCB8ICAgICAgIC8qIE1hbnVm
YWN0dXJlIGRhdGUgKE1EVCkgKi8NCj4gPiAtICAgICAgICAoKE1EVF9ZUiAtIDIwMDApIC8gMTAp
Ow0KPiA+IC0gICAgc2QtPmNpZFsxNF0gPSAoKE1EVF9ZUiAlIDEwKSA8PCA0KSB8IE1EVF9NT047
DQo+ID4gLSAgICBzZC0+Y2lkWzE1XSA9IChzZF9jcmM3KHNkLT5jaWQsIDE1KSA8PCAxKSB8IDE7
DQo+ID4gKyAgICBpZiAoc2QtPmVtbWMpIHsNCj4gPiArICAgICAgICBzZC0+Y2lkWzBdID0gTUlE
Ow0KPiA+ICsgICAgICAgIHNkLT5jaWRbMV0gPSAweDE7ICAgICAgIC8qIENCWCAqLw0KPiA+ICsg
ICAgICAgIHNkLT5jaWRbMl0gPSBPSURbMF07ICAgIC8qIE9FTS9BcHBsaWNhdGlvbiBJRCAoT0lE
KSAqLw0KPiA+ICsgICAgICAgIHNkLT5jaWRbM10gPSBQTk1bMF07ICAgIC8qIEZha2UgcHJvZHVj
dCBuYW1lIChQTk0pIDQ4Yml0ICovDQo+ID4gKyAgICAgICAgc2QtPmNpZFs0XSA9IFBOTVsxXTsN
Cj4gPiArICAgICAgICBzZC0+Y2lkWzVdID0gUE5NWzJdOw0KPiA+ICsgICAgICAgIHNkLT5jaWRb
Nl0gPSBQTk1bM107DQo+ID4gKyAgICAgICAgc2QtPmNpZFs3XSA9IFBOTVs0XTsNCj4gDQo+IEFy
ZW4ndCB0aGUgbWFqb3JpdHkgb2YgdGhlc2UgdGhlIHNhbWUgYmV0d2VlbiB0aGUgdHdvIGNhc2Vz
PyBJdCdzIHByb2JhYmx5DQo+IGNsZWFuZXIgdG8gc3BsaXQgdGhlbSBvdXQgdGhlbi4NCltTYWkg
UGF2YW4gQm9kZHVdIFllcywgSSB3b3VsZCB0cnkgdG8gcmUtb3JkZXIuIElmIEkgc2VlIG9ubHkg
dGhlIFBOTSBmaWVsZHMgYXJlIHNhbWUsIHJlc3QgYWxsIGZpZWxkcyBraW5kIG9mIG1vdmVkIGEg
Ynl0ZSBiZWxvdy4NCg0KUmVnYXJkcywNClNhaSBQYXZhbg0KPiANCj4gQWxpc3RhaXINCj4gDQo+
ID4gKyAgICAgICAgc2QtPmNpZFs4XSA9IDB4MDsNCj4gPiArICAgICAgICBzZC0+Y2lkWzldID0g
UFJWOyAgICAgICAgLyogRmFrZSBwcm9kdWN0IHJldmlzaW9uIChQUlYpICovDQo+ID4gKyAgICAg
ICAgc2QtPmNpZFsxMF0gPSAweGRlOyAgICAgIC8qIEZha2Ugc2VyaWFsIG51bWJlciAoUFNOKSAq
Lw0KPiA+ICsgICAgICAgIHNkLT5jaWRbMTFdID0gMHhhZDsNCj4gPiArICAgICAgICBzZC0+Y2lk
WzEyXSA9IDB4YmU7DQo+ID4gKyAgICAgICAgc2QtPmNpZFsxM10gPSAweGVmOw0KPiA+ICsgICAg
ICAgIHNkLT5jaWRbMTRdID0gKChNRFRfWVIgLSAxOTk3KSAlIDB4MTApOyAvKiBNRFQgKi8NCj4g
PiArICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgc2QtPmNpZFswXSA9IE1JRDsgICAgICAgLyog
RmFrZSBjYXJkIG1hbnVmYWN0dXJlciBJRCAoTUlEKSAqLw0KPiA+ICsgICAgICAgIHNkLT5jaWRb
MV0gPSBPSURbMF07ICAgIC8qIE9FTS9BcHBsaWNhdGlvbiBJRCAoT0lEKSAqLw0KPiA+ICsgICAg
ICAgIHNkLT5jaWRbMl0gPSBPSURbMV07DQo+ID4gKyAgICAgICAgc2QtPmNpZFszXSA9IFBOTVsw
XTsgICAgLyogRmFrZSBwcm9kdWN0IG5hbWUgKFBOTSkgNDBiaXQgKi8NCj4gPiArICAgICAgICBz
ZC0+Y2lkWzRdID0gUE5NWzFdOw0KPiA+ICsgICAgICAgIHNkLT5jaWRbNV0gPSBQTk1bMl07DQo+
ID4gKyAgICAgICAgc2QtPmNpZFs2XSA9IFBOTVszXTsNCj4gPiArICAgICAgICBzZC0+Y2lkWzdd
ID0gUE5NWzRdOw0KPiA+ICsgICAgICAgIHNkLT5jaWRbOF0gPSBQUlY7ICAgICAgIC8qIEZha2Ug
cHJvZHVjdCByZXZpc2lvbiAoUFJWKSAqLw0KPiA+ICsgICAgICAgIHNkLT5jaWRbOV0gPSAweGRl
OyAgICAgIC8qIEZha2Ugc2VyaWFsIG51bWJlciAoUFNOKSAqLw0KPiA+ICsgICAgICAgIHNkLT5j
aWRbMTBdID0gMHhhZDsNCj4gPiArICAgICAgICBzZC0+Y2lkWzExXSA9IDB4YmU7DQo+ID4gKyAg
ICAgICAgc2QtPmNpZFsxMl0gPSAweGVmOw0KPiA+ICsgICAgICAgIHNkLT5jaWRbMTNdID0gMHgw
MCB8ICAgIC8qIE1hbnVmYWN0dXJlIGRhdGUgKE1EVCkgKi8NCj4gPiArICAgICAgICAgICAgKChN
RFRfWVIgLSAyMDAwKSAvIDEwKTsNCj4gPiArICAgICAgICBzZC0+Y2lkWzE0XSA9ICgoTURUX1lS
ICUgMTApIDw8IDQpIHwgTURUX01PTjsNCj4gPiArICAgfQ0KPiA+ICsgICBzZC0+Y2lkWzE1XSA9
IChzZF9jcmM3KHNkLT5jaWQsIDE1KSA8PCAxKSB8IDE7DQo+ID4gIH0NCj4gPg0KPiA+ICAjZGVm
aW5lIEhXQkxPQ0tfU0hJRlQgIDkgICAgICAgICAgICAgICAgICAgICAgIC8qIDUxMiBieXRlcyAq
Lw0KPiA+IC0tDQo+ID4gMi43LjQNCj4gPg0KPiA+DQo=

