Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9909641145C
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 14:26:52 +0200 (CEST)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSINn-0002Vr-91
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 08:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mSIID-0008LC-O2; Mon, 20 Sep 2021 08:21:05 -0400
Received: from mail-eopbgr790122.outbound.protection.outlook.com
 ([40.107.79.122]:62332 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mSIIA-0001sn-RH; Mon, 20 Sep 2021 08:21:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ctg8yBe0LpgXNbzdNXyCC1m8tr4aqCV/mxKCA9eC0lcwC2UwLmH40CFaPHg0nXfI8TyyYLikfVPxmU3K6ksjnSKHUTcjFeHrxUijlney+lHEPqJbio2rzRRJA2uOdSTJ/9qrMmfGuNK7H0gwwsMmwKAqWmCshvYJTu9+ANTSqVRJGCdKYKiTnGrVW+h1WlmVIg/R37WE7GB7fXWJwjh5CR+Coz9ACxuc3XM9EN4e9jxmZuMwTwIyTqLUFfgO7ggA7zijOn2lLSs46GpShJRuLaANapH86XLKf7XyvWGYsMDTubjdkNFDaE7RRKNmmyk9Nb5tJJZTaI+wgUHyHhLt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=mq67XObW1bPT7XLip0EyVf1ybJXvB6EeeRggHsA7ID4=;
 b=YhzyNGqRcyo87TJIPpyDG1wQ3nq7t6wwWjIzryk+f05z2HTKjtZrL+1zkdVzoxyF8OKIReMvUr/cv2jEZpnHaH1lW9h7aMZSRVCkHgoSGybtDQ9o1Zi+r2IFfCnOW27X5X4SEYnYaYgDQTuGS8lw7hZ9/hsG1A7zotwQYefqHp/vkL4yOlMo3naCjZfDGCJoZpxFW+mnJlx32kiOj37v7gRn5JuvqspQhAyKmEgTHLTC90QYfgE7uPD3/pUnHTgDoskmfOn6ey1rALZZu9leXtnhrIz9G9sc3tZvYqOM6m1ZZqzkAAwLY4gJsUSDY1xqOzKvqvgkYH8jsuOxWgfnXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mq67XObW1bPT7XLip0EyVf1ybJXvB6EeeRggHsA7ID4=;
 b=WykH5Rckoo3GwU1hU0KVmrVZZmvdmJyKwNwZIAxaxczg9Ptyeamelf0VQSPT3ZVNKtNCaMg2eXPeWqyI5PLwHfUBUuHS3QWBNcD0x7KygWqp1X0OT4fkG1WHhOMielzNBsh3L7mIHFq8HK0rc9jTjoW7VeDi3dMwtDTwDK7FG08ZVPqvSdKSgr1tDw86d/hyjvZroCxVOyS2cR0r2Go1wSpPK9Mz2g8dkBpjhJ/QTO7oRFdrGPEokp4YrZ7oWdz13PHMnV3w0r4lu4he/HZ+4ysOBxwmBIyUngjxLI5oa3vnRQHoRRxWeAg6pWTZbwPy/4cWge9bBEoEL1+i/pNsMg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4084.lamprd80.prod.outlook.com (2603:10d6:102:3d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.17; Mon, 20 Sep
 2021 12:20:55 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::506a:7080:4ca3:6c91%5]) with mapi id 15.20.4523.018; Mon, 20 Sep 2021
 12:20:55 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, David Gibson
 <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>
Subject: RE: [PATCH v4 4/4] target/ppc: Fix 64-bit decrementer
Thread-Topic: [PATCH v4 4/4] target/ppc: Fix 64-bit decrementer
Thread-Index: AQHXreZzntNgu1VgbEa/nyPCNNm/3qus16+w
Date: Mon, 20 Sep 2021 12:20:55 +0000
Message-ID: <CP2PR80MB3668108A1D65844D6B45466BDAA09@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210920061203.989563-1-clg@kaod.org>
 <20210920061203.989563-5-clg@kaod.org>
In-Reply-To: <20210920061203.989563-5-clg@kaod.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kaod.org; dkim=none (message not signed)
 header.d=none;kaod.org; dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe3077f6-c78f-4a0e-f40f-08d97c31187c
x-ms-traffictypediagnostic: CP2PR80MB4084:
x-microsoft-antispam-prvs: <CP2PR80MB4084BDBD0E576191E186785EDAA09@CP2PR80MB4084.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a4fTX/hzlQ1CHbzms1WC9aEwYnMpyrTt9kShPrY/NMKO6ugTdc5+oAZHUR3PxJwvJpzs0x1ANL4XxQ57z8G+msQ9Txm7bF6bPE8H/I1HE/S40+4BvQk0Dl0MYPQUkUTATT7RsZo5pOTbffp+FY5auBmmK+LlrbOsyCl8S6ZRlRnnJ93IXABAELrCQQ00FDfo64bpEEypydqbYBqsIM8I8rBTOaN99a8s8KSBLdg0tpdfVt7ClFIUH+FR8Dw9sanErafc+6jVo5SgjKJ5tozSdIvaN85S1T4NsCUmb8RKvZJ95Yld9ApJXVs7ojtdvPD/AhUcXM6P5DqkggAX9UnRASRUKMiWbpzLwfiLUX+pDlQ9UWMVQ8ZyQiXTlK9djxanzd1TUhs2J/XlECjgEKRUMEtES/yH27qfFvnGIOkz/wzhRKZLIawU390MUOT+AomxYc0l7CeZzN2hMryYov5pqJXmfmdcxR5zwe993BkqL77XeE3GDKr2l2wDJN8rGNyDzThUkfp1IZ09+Fbwn7HWRNVwoCtFjXRpaHjB33kGEUmmxk0tYr+CLAZgPvS3NYl+oCOGVloNOaIwlxaqP/wrhXVBnLWcpAxwd8HtnBoeU4fWuhHTbatRQ7Ilc68YQbHmAquO54rj5u7Vz3kL8dPb7jKWVD9isettPfkeDT4i7OYjowE/klXnlXwlt2ASdlBAa1xw9oXdjmsGXybp/jb5wWNA0+98SJdb8Mu9iRGN6BlSd1euS9BmQ8A86OS7c9DsgMr8N4bS17VuldA3o9I9t8bClJEKJOFVa6iD7K6XGQ0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(76116006)(64756008)(52536014)(38070700005)(66446008)(8936002)(316002)(110136005)(2906002)(71200400001)(5660300002)(186003)(86362001)(4326008)(66946007)(66556008)(66476007)(4744005)(26005)(54906003)(55016002)(6506007)(122000001)(8676002)(38100700002)(33656002)(508600001)(9686003)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VXBCQ0Z6VmRVWldkb2hxTVpUbW1FUk14RTAwcHkrMzJmQTNoNnFacThleHRD?=
 =?utf-8?B?U3ptSVVGd3B5L0ZDbVEwZXVqcGZHTEIzUFRNTmExSlhudDR3cGg5VTJ0NmNm?=
 =?utf-8?B?TFVhS0Y5cTFhaFpUZGU3c0RVellQK0xKU0gvK2w0UmpNQjNTVGpkQVJEdDZS?=
 =?utf-8?B?TEhOR3pwd3lsV25DeVNIRWViY05JSnVnNE1sRWtvV0t2UGVGSlNNSlplS1FJ?=
 =?utf-8?B?a1BCeE0vd3IrYzh5OFYrb3g5cmdqN3B2SEp0Yit3NnNTaXcxZDFhTVM5akNG?=
 =?utf-8?B?QmViVkNLRFpWSzgyak9jRFl0MEF5UEtJT0YrMk9sN2dJQVNLUC85NlBMdXZv?=
 =?utf-8?B?WnpqWWVDMk94N1BTd1JmRmtwQWQydDdNTjQ4eG9ZazhZaFNKUWhOaFdaYlBo?=
 =?utf-8?B?MXNweDZlMk5nV1JKOXU2WHZCdmEvdk5ZRGhlRWdxVk50RjlFZ2Vpbm5TSm1Z?=
 =?utf-8?B?elBENTFpbGZJKzhtTkx6WHF3a09CeU11OW1KRUJ5TGFPK3U3SHQ2NzJUOWs5?=
 =?utf-8?B?R21CRi9IWHVLbWh5M2hDdFQ3SnpzQk94bEt0ZXlOU0szV3F3OXhWcEI5Wmha?=
 =?utf-8?B?Z083R3ZSa0cxMjVoYWpuam1ldG5ic2hNRW1zdENrOFVUOXBOZlZPK0dFcU5l?=
 =?utf-8?B?K21XZHVrOVVrZldqWTI5b3I2TUpVNXo3Tjl1bE42Wi9XckUxZmRYUElMN0Vm?=
 =?utf-8?B?c1g5RklhZzZFQWVoZ3BEMVBwejZrZkx3OS9pdXNZREZQa1o5emhTVGZOZFpV?=
 =?utf-8?B?Tml3bGFFWDRoM0hRYnhVM1h4Q0xDVmZGK05lSHdJQnZ1VUpqckNJckw1c293?=
 =?utf-8?B?VFlOQ2tRaUZ4SmJaK2xHS0Q0QjY2ZWNiVUpuZTN3ZkJEaWxXWC93WHFKYVRa?=
 =?utf-8?B?NWVtaWlJV0RYRy9BVTQ3NE5BL2Zxb0gvcCsxTDdFUWUvREZBdDR0bkRTN3hj?=
 =?utf-8?B?MUdzUE5nK1NWZHlWRFFDWG5rQlhBNVlyeUsra1NUN2x1RkxMZnlOT2piVmF4?=
 =?utf-8?B?Z0xjZTh3SGtLVjlzckhvTDBpZnB3UUxHajVrejBOSmwyT1hJQ0htdFJHV2k3?=
 =?utf-8?B?ZXl0S2xpdVVYaVNuVWRnbEFWY1R5aGpZd2FkbXlYMVRzUVpSc1o0amVLNHdo?=
 =?utf-8?B?Wmxkbzg1R1hmcGVITlJkUmJaZGxEMjZSOVI0cVdxb1kwNzB0SG8zWXlLRzNx?=
 =?utf-8?B?TE1ETU5aVFY4MUV3aG5WUmhsdWRmYWNCMmFveE5YK2p4Ti9kaDg0ZXkyNmo5?=
 =?utf-8?B?bHEvN3hiTS9TWWxMMjhjV1ZzTDNJdGM1ODJQcFl2VFBjTVhjZ1VQQXFZV3ZM?=
 =?utf-8?B?K3V0cU1rRUh3V3k3SDRBL1RmT1Awc0gra09teXBJYVcySGJmOFFqcVErVDVM?=
 =?utf-8?B?TUs0dmF4RDgwdDZwZXJWOUFPdkFGdUZHR3FOd25oQS9WQzIzYytCYTdRbHVo?=
 =?utf-8?B?Q3owVitrTi9XTzdtQkZObklzMG5yWDNjbFhOMjNpMUI1TVBMb3ovOHZyZE9X?=
 =?utf-8?B?OEdPdGNKTlBUdVNxV3BDWGtnNDcvTTlOM0NqOUIyTkQ5TytQUWVJa2FUazI0?=
 =?utf-8?B?TU9lSmg4VkJMTnR1NkJpVTZ4dzZBWGluMXdndU9JWmlwYWxleS9hdTVkUU5y?=
 =?utf-8?B?VjdPT0pUeVFBMm1PaGgvOW1DeTMyYW56M2REdml6dWRZeVJPMVFrbjQwQ0FL?=
 =?utf-8?B?RmJyN2RNZE9ZMWJqMXRzSmJINTZSTHRJY0wySzJCRUZrWThvcGhKblYrVWV3?=
 =?utf-8?Q?0t2cE+VhmJcG3Ts/r1X5NSlTJwhPYESu5j/Wbha?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3077f6-c78f-4a0e-f40f-08d97c31187c
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2021 12:20:55.5160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 26DkEdB3WesFfncG2raMpQKTU5StKp4wgPRgUy7vHKY6WqWCwe4qH11erQETXwKENGMSjkZ2Bak24NfebA0NOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4084
Received-SPF: pass client-ip=40.107.79.122;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

RnJvbTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4NCj4gVGhlIGN1cnJlbnQgd2F5
IHRoZSBtYXNrIGlzIGJ1aWx0IGNhbiBvdmVyZmxvdyB3aXRoIGEgNjQtYml0IGRlY3JlbWVudGVy
Lg0KPiBVc2Ugc2V4dHJhY3Q2NCgpIHRvIGV4dHJhY3QgdGhlIHNpZ25lZCB2YWx1ZXMgYW5kIHJl
bW92ZSB0aGUgbG9naWMgdG8gaGFuZGxlDQo+IG5lZ2F0aXZlIHZhbHVlcyB3aGljaCBoYXMgYmVj
b21lIHVzZWxlc3MuDQo+IA0KPiBDYzogTHVpcyBGZXJuYW5kbyBGdWppdGEgUGlyZXMgPGx1aXMu
cGlyZXNAZWxkb3JhZG8ub3JnLmJyPg0KPiBGaXhlczogYThkYWZhNTI1MTgxICgidGFyZ2V0L3Bw
YzogSW1wbGVtZW50IGxhcmdlIGRlY3JlbWVudGVyIHN1cHBvcnQgZm9yDQo+IFRDRyIpDQo+IFNp
Z25lZC1vZmYtYnk6IEPDqWRyaWMgTGUgR29hdGVyIDxjbGdAa2FvZC5vcmc+DQoNClJldmlld2Vk
LWJ5OiBMdWlzIFBpcmVzIDxsdWlzLnBpcmVzQGVsZG9yYWRvLm9yZy5icj4NCg0KVGhhbmtzLA0K
DQotLQ0KTHVpcyBQaXJlcw0KSW5zdGl0dXRvIGRlIFBlc3F1aXNhcyBFTERPUkFETw0KQXZpc28g
TGVnYWwgLSBEaXNjbGFpbWVyIDxodHRwczovL3d3dy5lbGRvcmFkby5vcmcuYnIvZGlzY2xhaW1l
ci5odG1sPg0K

