Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA11965965A
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Dec 2022 09:38:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pBAtp-0004zi-SF; Fri, 30 Dec 2022 03:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pBAtj-0004yt-Va
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 03:37:52 -0500
Received: from mail-ve1eur01on2133.outbound.protection.outlook.com
 ([40.107.14.133] helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pBAti-0003le-0l
 for qemu-devel@nongnu.org; Fri, 30 Dec 2022 03:37:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDLOPJKIIm9rcW8qFq3AXpjq8brkqpDv+Pb4rO2h09vzBvberyabmHw0ZDTXoSneg3cvixcUzI24U8Y1itrkUB5SRHIY+sEdkGm4ZRHwMI1uT1uqpEa5vykSaUVoUFo5AomcNFA1yaOwro0jcxXvK2CQnAfEkduptnflX66AlZwdstKJjwU34/nhLmagdD0GNwTJMW4VxVYlCcfHUFtUMEcBZrWIT4SFwNRFukOfzq+sbakBfN1D5jTO+aPpxawEpLtfvtfhynUYqkxH1hT39QfU6rdj7wlWiMFkk1NNNAFozHmVxenGaBsUHAeUgAmEIh4oDbl2S0gQ+pa60cI6IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMSxcdTc+sm+JQBo3UssFCuzbIwjQG3doQTfnh93cW0=;
 b=O81JXj2FDmXQIAPlmjMGdEu7W2ievrKjCmVTUb2W3ueoh7II9On7dSLHRK5nMFdv/D1CnHHPrrAz1ttqQuaxtAtT0eihpZTjO0kOrvUDdda9ih9O/8E5sU34T1AHq4GoGcusnjU3LLQPyp/OLut87J5qauuWoOsIkLkRmJ+tF1vHc5piihosK41VbzeKRgVIU/1FV0b5PPTvfQ9JXsFMrSylaulnjhToVvwKDsvdTaXWH2IEnR1j8IkKLb0nMbhzAfbJt4aIA8ic6HfEv2zLMaZ5ny5x1QwpxbulYclHzCdc6gk2+Ax+ar2DGa0K6Q7Z99xEf2/4FZMa3PUl1W1TQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMSxcdTc+sm+JQBo3UssFCuzbIwjQG3doQTfnh93cW0=;
 b=PTUuhuR7Dx7QzuxhY8msgAI+TvwKXgowc3Hf5ItCIJNxN778ULZLY6t2I+JjITzc37iEH5SRVGJ5jYw9P6rdgqH/wrHkRdQ+XOg987Y4TbuH5eltJ0u0R6qIdsFLUHTHFCY+lydevqq6iCv7XRjSkA37L+5QT5LNPZK1H6Wg9sI=
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM0P189MB0674.EURP189.PROD.OUTLOOK.COM (2603:10a6:208:19c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.7; Fri, 30 Dec
 2022 08:37:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5986.009; Fri, 30 Dec 2022
 08:37:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: Jason Wang <jasowang@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Dmitry Fleytman
 <dmitry.fleytman@gmail.com>, "Michael S . Tsirkin" <mst@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: RE: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Topic: [PATCH 0/5] hw/net/igb: emulated network device with SR-IOV
Thread-Index: AQHZFfqLsrcGp8gJukmzNMlOfQdu7q56z/WAgAp4AWCAAI4sAIAAUQkA
Date: Fri, 30 Dec 2022 08:37:45 +0000
Message-ID: <DBBP189MB14332B356950A871E1EB1EF095F09@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
 <CACGkMEtFvmQ3th8TxApOuOtRVQz-7S7NZ-dFyOX73L1YS7Fh4g@mail.gmail.com>
 <DBBP189MB143342BF93DB130D8B9715EB95F39@DBBP189MB1433.EURP189.PROD.OUTLOOK.COM>
 <CACGkMEv1OKUtuJcCfFmbZyc1evAaZe_o=8VnqLAKFbXGzLk71Q@mail.gmail.com>
In-Reply-To: <CACGkMEv1OKUtuJcCfFmbZyc1evAaZe_o=8VnqLAKFbXGzLk71Q@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DBBP189MB1433:EE_|AM0P189MB0674:EE_
x-ms-office365-filtering-correlation-id: e80ae132-b996-4e07-67a8-08daea411fe9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PaPyFRx8yj0udejhsbuVurl1Mnnpb1bQ0D0vKkzaRynH6p0M91yuilhgU2QuYcPOB7NB4y+bISLExbtmZZWgObHHhULAQXpw8BB7zTZnmAj014ETcwYdL2K+BL+R7BmDIhQRDoqQDpsCEPruj4mZGcHs7YqH5IHM1yriBVxxXq/Zk0sHhs9cYYL/gez5kNIt2cah57fsh1vKvv3gF6r0QeG97l4cuUv3NRWyOB0Ks1UpGmyxtL4KcfJ4nY9wM6vihBnwijVff/sz5J5cohsTqZyAyhvNicSqlBAa3A1W5bLefXHYs38D83wvIQUc/Q6e6W/gsk8mSNaKHf/xzw7bv9+4lwqZFLh1aVI9Kdcd8DiiKmrQaOPbGQ6HddZz67h3xTYGQxUMOGdo104p7qOeDRaUN6EjiDgen9XAbWiIwfsPXqSNd7wSmun0wk7CBi/JrR6qpDLarU0yHQT/UONv7HcxMhpxDdIxB0bqEpMDg7goLCkD7zHQtiy2Lkdd4meCbiAKonbWFwZcSH5VMU0r+oODDDEINpXEjk4ak5oKk2XMe6wTAG0OAIzzYnxToIqyrG1L23r9Q26wmRFgVoSwM7uVtO9lQFfOZ9salldSxn/pVt65q1IsE7iMy56/YjJbQWPXZXhRAiKfehA8IA52fByIiMhvSbedv4tfK6fkJNQv5Glq2Im8ySb7stmpQIub
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(346002)(39830400003)(376002)(451199015)(26005)(6506007)(53546011)(83380400001)(71200400001)(478600001)(7696005)(2906002)(316002)(33656002)(86362001)(38100700002)(122000001)(6916009)(54906003)(9686003)(186003)(8936002)(38070700005)(4326008)(5660300002)(52536014)(64756008)(76116006)(66556008)(55016003)(44832011)(66476007)(66446008)(66946007)(41300700001)(8676002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ckpTaDNndmlVRzFiaVJiQmgxaHBVcm9Xeldha1JEclltQnlIMGVpQWhUVVIr?=
 =?utf-8?B?S2dBU0orVDFTbndEeVF6NElqVHJkRTBWZkszdElIajhuMndvNWdpaEtkaG5V?=
 =?utf-8?B?UmVDVXAwc0FJY09lbE4raDRSU2JxOC9zUUlhTSs3bVFKa09HRFpuSkVIZlYx?=
 =?utf-8?B?UExncGk0ZnZ3VEhZOWJLb0dveU1ENTQ1YXBQaXZZVUt4ZEd0K0NuVEU0VU44?=
 =?utf-8?B?ek9VL2kwdGt4OXE1N1EzR0x1dGZ4OWgyckcraWFZT0xadjFpejFxSzNGTnZs?=
 =?utf-8?B?b28wRGpoZXVpUjg4VCsxOE0wODFMeExMeHNCVmk0ajMxOFpWYlUvd2U3NUlN?=
 =?utf-8?B?MGZYZ0xZcHloZHRsdEtxK09uTFYwaVVtdVlUQ2RCVXF5SGF5dzZxdHdQK2ZG?=
 =?utf-8?B?VFc2clNvNWIycWRha3BMQjhhOFA3ZzhrQ0xleEFZMU1xY0ZtV1VzcDkrOWli?=
 =?utf-8?B?Uk9PcFpYUHNDN093SGJYcDdFK25pTHptZytSaUVoVURiQVRkS21Oa1prYUEr?=
 =?utf-8?B?WXZTMjFwWm12TUZWb21GU1RTMlRIcTlrMWhCZkdadUF1RDgzdEFvNU1KdGR5?=
 =?utf-8?B?VElhcDZDdVlZdnpwVUpiQS9nTmZuL2cyNU1laU44dVFSMC9YWlVSV3k1YWxF?=
 =?utf-8?B?SU1TZGN0REZSZDJydjRzSi9HN2hEdGdUaGI0WFFJTFgxckxTTGNUSW1yZmRC?=
 =?utf-8?B?ZnYvQ2ZzcWk0bXg1KzJQTStIQnNnc0VERHhRanpaemREemNJUm8wajlNRHFs?=
 =?utf-8?B?OFN3ZUJkRzZORm5zN001UW8wZkpYczAvWkZDVndOckY0THlzMUJldWtlZ3NK?=
 =?utf-8?B?cWJyc2M2RFRwTnl3am8yN1MrMnhOTGYrYnh3cFNVTjEwNytud2pkOW1Gbnds?=
 =?utf-8?B?M0U2bmtRUzdFU2hwZFpWekNZdlo5UWZuSW1sbENBcjd5bVUwUC9HZVJkRHRD?=
 =?utf-8?B?b0JEb1h5bmxleXVkbmduWEJSTGlGbWt4SWFMQW9qNzRXY3pHZitrTGhwemRl?=
 =?utf-8?B?eGVHRThkYWtrRC9ITDVUempiSVNZVEYyVUVLSW90Q1RqZXNYZGhNaHBnUENR?=
 =?utf-8?B?MWZEYnh0clZybnFjWFZBLzhlSThnNHNvZzFqQU5BbnArOXh3ZUFJeitIUyt4?=
 =?utf-8?B?eXc4QU5ud0J2Q2RRaDZrSkVuSHBrRUFNeXVBSWFVRFNGWE0rNHZKU3g2dEpC?=
 =?utf-8?B?WlRrMmMxenRVRWJIOVZEQ2ppeEMwRlN4cnNGT0hITnJRWHJRNHFGK2c2TTIz?=
 =?utf-8?B?akVDbUZ1RWpSYW11NEJ5b3pUclVEQXFaa0dBYUp1eHZ5aUFrU2ladERIcTQx?=
 =?utf-8?B?UzNSd2x2QkdObUpCSldISk55YmV4SnVqenBFYS90V2lNbjdqejlqRFZYUVR5?=
 =?utf-8?B?bDFPZGlBL2hGTUlFT1RnM05aQ0U4b1k4ZHg5UjJQRlBpVUJzcjA2U2tOSkJa?=
 =?utf-8?B?RlBUL0N0aDdLeklzTm1tTTlSRGVORjNZL3U2bVpNK2NVUG1PWUFPcExyUGdF?=
 =?utf-8?B?OUtCY2R4MWwyWjdKTTF2dk91QzZYTFl0V1VKdmxnaHloWUVkUkYzM2wwYnJq?=
 =?utf-8?B?MzQ1a2R4RmNTMTNkRFhjQTlFNFBTOG40NnVpbXI4dDFhN2ozL3JLTnJZS3Iv?=
 =?utf-8?B?Z1pSWEtKdEVQNjV2ZnJza2NPdW1nb2NYd0ZtblVHUU83cnJ4S3JzZ3NsOXVn?=
 =?utf-8?B?UGo1RlJjMU51WTZZUWtYTkV1SUxVOE9DZ1dWQmdYSi9EMWJvOHVCbERXeTgv?=
 =?utf-8?B?MXVFL08xQU1HRWdNNFc5Sk91RHkxaDlEendkNTZDbXVYN20yOEYzUnFzSGNy?=
 =?utf-8?B?SFlkWHNXTDQ1UDJpMlhjRFFLckIzN0JaV05CVVpnc0tpTVhXcGtuTk5MVkdR?=
 =?utf-8?B?ekQ5dWRudGtwcDR2YXZ6V3Btb3B5ZHpCak1KTkF1RGZjS1gxK2tyMUcxWXR5?=
 =?utf-8?B?ckRZbDkvSHFRdzhERC83WEtQNjBGOXRjYzdQODc3MFlYYWNna3hINDVSMnpu?=
 =?utf-8?B?amxweVFpeDd6MytrcG11OTM1R25CWWRqQmQ3TEMzQUlEdGdpRkpIbVNhTzhI?=
 =?utf-8?B?K0VOdlZudzFSOG8vdysrMlYxMjFOYzUzbGhBeXVnc2dTZnU5eFBiVDZmc2Mv?=
 =?utf-8?Q?W4O1ubhbNzA4SDvYf8ffdzAPj?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e80ae132-b996-4e07-67a8-08daea411fe9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2022 08:37:45.5041 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PGk/fPlHL024J1PGMd7pnVe4w/25U7+IlU3JUlrx6ow1PUnvRXvCRBa+UTXbYkGS7XWH5phwvD/IA+PKkq7Wdk1YoEKH0dqK6lhf07tl6tc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0P189MB0674
Received-SPF: pass client-ip=40.107.14.133;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPg0KPiBTZW50OiBGcmlkYXksIDMwIERlY2VtYmVyIDIwMjIgMDQ6NDUNCj4g
VG86IFNyaXJhbSBZYWduYXJhbWFuIDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4NCj4gQ2M6
IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgRG1pdHJ5IEZsZXl0bWFuDQo+IDxkbWl0cnkuZmxleXRt
YW5AZ21haWwuY29tPjsgTWljaGFlbCBTIC4gVHNpcmtpbiA8bXN0QHJlZGhhdC5jb20+Ow0KPiBN
YXJjZWwgQXBmZWxiYXVtIDxtYXJjZWwuYXBmZWxiYXVtQGdtYWlsLmNvbT4NCj4gU3ViamVjdDog
UmU6IFtQQVRDSCAwLzVdIGh3L25ldC9pZ2I6IGVtdWxhdGVkIG5ldHdvcmsgZGV2aWNlIHdpdGgg
U1ItSU9WDQo+IA0KPiBPbiBGcmksIERlYyAzMCwgMjAyMiBhdCAzOjE3IEFNIFNyaXJhbSBZYWdu
YXJhbWFuDQo+IDxzcmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4gd3JvdGU6DQo+ID4NCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBKYXNvbiBXYW5nIDxqYXNv
d2FuZ0ByZWRoYXQuY29tPg0KPiA+ID4gU2VudDogRnJpZGF5LCAyMyBEZWNlbWJlciAyMDIyIDA0
OjI0DQo+ID4gPiBUbzogU3JpcmFtIFlhZ25hcmFtYW4gPHNyaXJhbS55YWduYXJhbWFuQGVzdC50
ZWNoPg0KPiA+ID4gQ2M6IHFlbXUtZGV2ZWxAbm9uZ251Lm9yZzsgRG1pdHJ5IEZsZXl0bWFuDQo+
ID4gPiA8ZG1pdHJ5LmZsZXl0bWFuQGdtYWlsLmNvbT47IE1pY2hhZWwgUyAuIFRzaXJraW4gPG1z
dEByZWRoYXQuY29tPjsNCj4gPiA+IE1hcmNlbCBBcGZlbGJhdW0gPG1hcmNlbC5hcGZlbGJhdW1A
Z21haWwuY29tPg0KPiA+ID4gU3ViamVjdDogUmU6IFtQQVRDSCAwLzVdIGh3L25ldC9pZ2I6IGVt
dWxhdGVkIG5ldHdvcmsgZGV2aWNlIHdpdGgNCj4gPiA+IFNSLUlPVg0KPiA+ID4NCj4gPiA+IE9u
IFRodSwgRGVjIDIyLCAyMDIyIGF0IDc6NDMgUE0gU3JpcmFtIFlhZ25hcmFtYW4NCj4gPiA+IDxz
cmlyYW0ueWFnbmFyYW1hbkBlc3QudGVjaD4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IEEgbmV3
IGF0dGVtcHQgYXQgYWRkaW5nIHN1cHBvcnQgZm9yIEludGVsIDgyNTc2IEdpZ2FiaXQgRXRoZXJu
ZXQNCj4gPiA+ID4gYWRhcHRlciB3aXRoIFNSLUlPViBzdXBwb3J0Lg0KPiA+ID4gPg0KPiA+ID4g
PiBTdGFydCBxZW11IHdpdGggdGhlIGZvbGxvd2luZyBwYXJhbWV0ZXJzLg0KPiA+ID4gPiAgICBx
ZW11LXN5c3RlbS14ODZfNjQgLWVuYWJsZS1rdm0gLU0gcTM1IFwNCj4gPiA+ID4gICAgLi4uDQo+
ID4gPiA+ICAgIC1kZXZpY2UgcGNpZS1yb290LXBvcnQsc2xvdD0zLGlkPXBjaWVfcG9ydC4zIFwN
Cj4gPiA+ID4gICAgLW5ldGRldg0KPiA+ID4gdGFwLGlkPW5ldDMsc2NyaXB0PW5vLGRvd25zY3Jp
cHQ9L3RtcC9ybXRhcCxpZm5hbWU9eGNicjNfdDIscXVldWVzPTENCj4gPiA+IFwNCj4gPiA+ID4g
ICAgLWRldmljZSBpZ2IsYnVzPXBjaWVfcG9ydC4zLG5ldGRldj1uZXQzLG1hYz0wMDowMDowMDow
MTowMzowMg0KPiA+ID4gPg0KPiA+ID4gPiBMb2FkIElHQi9JR0JWRiBtb2R1bGVzIGlmIG5lZWRl
ZC4NCj4gPiA+ID4gbW9kcHJvYmUgaWdiDQo+ID4gPiA+IG1vZHByb2JlIGlnYnZmDQo+ID4gPiA+
DQo+ID4gPiA+IENyZWF0ZSBWRnMgdmlhIC9zeXMNCj4gPiA+ID4gbHMgL3N5cy9idXMvcGNpL2Rl
dmljZXMvMDAwMDowMTowMC4wLw0KPiA+ID4gPiBlY2hvIDIgPiAvc3lzL2J1cy9wY2kvZGV2aWNl
cy8wMDAwOjAxOjAwLjAvc3Jpb3ZfbnVtdmZzDQo+ID4gPiA+DQo+ID4gPiA+IFNyaXJhbSBZYWdu
YXJhbWFuICg1KToNCj4gPiA+ID4gICBwY2llOiBhZGQgaGVscGVyIGZ1bmN0aW9uIHRvIGdldCBu
dW1iZXIgb2YgVkZzDQo+ID4gPiA+ICAgaHcvbmV0L25ldF90eF9wa3Q6IGhlbHBlciBmdW5jdGlv
biB0byBnZXQgbDIgaGRyDQo+ID4gPiA+ICAgaHcvbmV0L2lnYjogcmVnaXN0ZXIgZGVmaW5pdGlv
bnMNCj4gPiA+ID4gICBody9uZXQvaWdiOiBlbXVsYXRlZCBpbnRlbCBJR0IgKDgyNTc2RUIpIG5l
dHdvcmsgZGV2aWNlDQo+ID4gPiA+ICAgaHcvbmV0L2lnYjogYnVpbGQgc3VwcG9ydCBmb3IgaWdi
L2lnYnZmIGRldmljZXMNCj4gPiA+DQo+ID4gPiBIYXZlbid0IHJldmlld2VkIHRoaXMgc2VyaWVz
IGJ1dCBJIHRoaW5rIHdlJ2QgaGF2ZSB0d28gbW9yZSB0aGluZ3M6DQo+ID4gPg0KPiA+ID4gMSkg
dXBkYXRlIHRoZSBNQUlOVEFJTkVSUw0KPiA+IEFueSBzdWdnZXN0aW9ucyBvbiB3aG8gc2hvdWxk
L3dpbGwgbWFpbnRhaW4gdGhpcz8NCj4gDQo+IEkgdGhpbmsgeW91IHNob3VsZCBiZSB0aGUgYmVz
dCBjYW5kaWRhdGUgZm9yIHRoZSBtYWludGFpbmVyIDopDQo+IA0KPiAoQnR3LCB3ZSBoYXZlIGEg
bG90IG9mIE5JQyB3aXRob3V0IGEgbWFpbnRhaW5lciB3aGljaCB1c3VhbGx5IG1ha2VzIHRoZQ0K
PiByZXZpZXcgdmVyeSBzbG93KS4NCj4gDQo+IFRoYW5rcw0KT2theSwgSSBjYW4gdXBkYXRlIHRo
ZSBNQUlOVEFJTkVSUyBmaWxlIGluIHRoZSBuZXh0IHZlcnNpb24gdGhlbiA6KQ0KDQo+IA0KPiA+
DQo+ID4gPiAyKSBhIHF0ZXN0IGZvciBpZ2IgKGhhdmluZyBhIHF0ZXN0IGZvciBzci1pb3Ygd291
bGQgYmUgZXZlbiBiZXR0ZXIpDQo+ID4gPg0KPiA+ID4gVGhhbmtzDQo+ID4gPg0KPiA+ID4gPg0K
PiA+ID4gPiAgaHcvaTM4Ni9LY29uZmlnICAgICAgICAgICAgIHwgICAgMSArDQo+ID4gPiA+ICBo
dy9uZXQvS2NvbmZpZyAgICAgICAgICAgICAgfCAgICA1ICsNCj4gPiA+ID4gIGh3L25ldC9lMTAw
MF9yZWdzLmggICAgICAgICB8ICAzNTcgKysrLQ0KPiA+ID4gPiAgaHcvbmV0L2UxMDAweF9jb21t
b24uYyAgICAgIHwgICAxMyArDQo+ID4gPiA+ICBody9uZXQvZTEwMDB4X2NvbW1vbi5oICAgICAg
fCAgIDI4ICsNCj4gPiA+ID4gIGh3L25ldC9pZ2IuYyAgICAgICAgICAgICAgICB8ICA2MjcgKysr
KysrDQo+ID4gPiA+ICBody9uZXQvaWdiLmggICAgICAgICAgICAgICAgfCAgMTg0ICsrDQo+ID4g
PiA+ICBody9uZXQvaWdiX2NvcmUuYyAgICAgICAgICAgfCAzNzgyDQo+ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrDQo+ID4gPiA+ICBody9uZXQvaWdiX2NvcmUuaCAgICAgICAg
ICAgfCAgMjE2ICsrDQo+ID4gPiA+ICBody9uZXQvaWdidmYuYyAgICAgICAgICAgICAgfCAgMjYy
ICsrKw0KPiA+ID4gPiAgaHcvbmV0L21lc29uLmJ1aWxkICAgICAgICAgIHwgICAgMiArDQo+ID4g
PiA+ICBody9uZXQvbmV0X3R4X3BrdC5jICAgICAgICAgfCAgIDE3ICstDQo+ID4gPiA+ICBody9u
ZXQvbmV0X3R4X3BrdC5oICAgICAgICAgfCAgICA4ICsNCj4gPiA+ID4gIGh3L25ldC90cmFjZS1l
dmVudHMgICAgICAgICB8ICAxOTAgKysNCj4gPiA+ID4gIGh3L3BjaS9wY2llX3NyaW92LmMgICAg
ICAgICB8ICAgIDYgKw0KPiA+ID4gPiAgaW5jbHVkZS9ody9wY2kvcGNpZV9zcmlvdi5oIHwgICAg
NSArDQo+ID4gPiA+ICAxNiBmaWxlcyBjaGFuZ2VkLCA1NjcxIGluc2VydGlvbnMoKyksIDMyIGRl
bGV0aW9ucygtKSAgY3JlYXRlDQo+ID4gPiA+IG1vZGUNCj4gPiA+ID4gMTAwNjQ0IGh3L25ldC9p
Z2IuYyAgY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2IuaCAgY3JlYXRlIG1vZGUNCj4gPiA+
ID4gMTAwNjQ0IGh3L25ldC9pZ2JfY29yZS5jICBjcmVhdGUgbW9kZSAxMDA2NDQgaHcvbmV0L2ln
Yl9jb3JlLmgNCj4gPiA+ID4gY3JlYXRlIG1vZGUgMTAwNjQ0IGh3L25ldC9pZ2J2Zi5jDQo+ID4g
PiA+DQo+ID4gPiA+IC0tDQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4gPg0KPiA+DQoNCg==

