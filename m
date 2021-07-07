Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC18F3BE18D
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 05:36:11 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0yM6-0006Mx-C4
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 23:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m0yLF-0005iK-Cw
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:35:18 -0400
Received: from esa5.fujitsucc.c3s2.iphmx.com ([68.232.159.76]:63193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m0yLC-0008DC-Va
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 23:35:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1625628916; x=1657164916;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=2S7JuMQBAk/wiSB6XWRH9jJtYSSfcwqijGwL6e/5sjs=;
 b=Cvco4mAwwzQ1zQPemyEfhrT2zXDDQAgyHX+laNlKyepcPOZzqz6cVR0Z
 6qRMnlbJ2+FTjpxE85E0z6m5iAEOVbBuAlQd5HYMsXK7FTpgtGaWymCqG
 46qFJrForLZdRlom8fGlzBcBTx8/nU4T6MUF74I2U5cX7NqNwP9cW9saz
 x+PafLo8QysbY3uqIMEqnVgT1HW3JAXq1Hoebt9GP7sTkqUnhtZbnHI3D
 cDZ16JOJJUugh/wesMeJwvXD4n3zQmkzbWvB9t81VZn+Vz72OIlJodK1B
 blWXxNlrp9v7wu7iCEWImdNuxbNYaU4zTakaRicXCsZbMqQilMryynMMU g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="34494269"
X-IronPort-AV: E=Sophos;i="5.83,330,1616425200"; d="scan'208";a="34494269"
Received: from mail-os2jpn01lp2059.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.59])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 12:35:12 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R7xMWJCrzfpxoSUrxTddKlf5OoR2tFuUzLI992RoBNCSIkuf8oEbdgTH7te1ZHvwr/U5rkCqfRx4CEImoF4MHEdoXv5AgjjB6gyTwvYrFPMm+T7zfA5z5z7jt8AG2pI+DX+CvTOWMkfbs4BmtGCutrH8FRyOj+u6ppgPyh6ECZpDcCP+RaYbeRzWlkZdFSbwEONjXsn0JNSJp1J8e5vQjlJqZNamEuwrr6YcF5+NFYIKXWRwBtDrDlNQNVDxhR1VQFJG+KR0rhIClD9OdVQn2I/EfJeHP4Dsum1ibsg0eN4jLZJVQ5jLNqsK1jsxoyVgYSZ//FsFnNgwT9KJjfcFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S7JuMQBAk/wiSB6XWRH9jJtYSSfcwqijGwL6e/5sjs=;
 b=lmYgXDJWSZd/6KVQL0aE1PKG0qQohl/Xe+CxDf36w87WrM8eIMworx91XVOYcdoIVelJX9ghYdwMl+GNdY0RbFwMdwukIH6AZLZRWnXUrP+7oq/T81IH3huZGe9jDFNTmR0vOo2pWO8BlkpLy2bNq0+yIcFaaWZavwsXTUjhhHsW5553BcH1TbkoP8094CV4Z2N6cHV4iE5gLFPRIHcuZWulp1VKLFTl5XlwmGS/z3Jd6CiY9OwqesheR0rSzpAF9lzcXcw4FYVA/EyA+Sg4AkJOb9PEGGFHkAnoRedZ6AziRl6lq5onWfZ6HPhfMlJH03ZUl2wkN23o/X/T7IJ91A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S7JuMQBAk/wiSB6XWRH9jJtYSSfcwqijGwL6e/5sjs=;
 b=BGwJ9NN0DRFNan4ArrYi1D8cvYBBl030x1NvZGG0LmvUGRn5O/PuEAarXZ47xrXXOATKlDP/pNu874mUmtrMpMIfF4EepnrPg0HZ8yeGYzy4tmCRTL3rjax2oL1Dr9aY2XLrHulzBumA5B2abLPqx4YObDohqHmMU/dN/EojvFw=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7408.jpnprd01.prod.outlook.com (2603:1096:604:14c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Wed, 7 Jul
 2021 03:35:08 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20%5]) with mapi id 15.20.4308.020; Wed, 7 Jul 2021
 03:35:08 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>, qemu devel
 <qemu-devel@nongnu.org>
Subject: Re: [PATCH] docs/nvdimm: update doc
Thread-Topic: [PATCH] docs/nvdimm: update doc
Thread-Index: AQHXXnPKF+rvJfzBc0SUCNqISCwlC6s3BSKA
Date: Wed, 7 Jul 2021 03:35:08 +0000
Message-ID: <8acb8a33-e3d8-7bc2-98d4-eb78f4b1dad1@fujitsu.com>
References: <20210611034133.472812-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210611034133.472812-1-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c7362aca-cade-4731-64f1-08d940f83827
x-ms-traffictypediagnostic: OS3PR01MB7408:
x-microsoft-antispam-prvs: <OS3PR01MB7408B9692DF80705FD51D999A51A9@OS3PR01MB7408.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /ARlbywAxxynDmBGBRFhIPC240dAczui6IUucLx+hiGsvd+Np1MZQOPoObpqBPB/Bw9lzi1Xk7rAG2+hztx95oqAvnvB+3tTXD0YQcFoqeV625zzvGBBaOwWP71H54QNdCRm4p0oGJgLyQFsS1eVA66eQm13ElQ2PRGgnHfwXujja4Nna3LpniYhIFHMNZM299W93amDqyJ78Ct9JumvHxzbMiYkfGplH3PcWLwVUuwEp82dMvEvcZbYP01OxzY672N9J3leH/6a/T5LObS6EA3/7EG8K2xeUA0eSSu3867K6ZYH7afw3tjZIwdgfewNz+2EU6OQAT4R2Uo5Va6KzR1GWxFrIYT6Snlxn3NZ42ECyR5T3FYAm/bwXMGYaBPFiZ8WfriplwA1hkrFRgBSkS6WW/5XqdZ6Q79xGWVaLneyLJispuBbOx20ekcqYmgvMeLZNmjy9+QZ9l4qBNk/OYs75fABfJ3TDQ0ZUJPcjdKYDqyg7T+niMVQYWxcHc31O9COYoDwhz7tdJ2dcmA+lOX+mdJacWvnE8K+5qvIWtuBKBh/7+IFJysteFlrJ0mgdI24MnvN4BqfPApcEeuX/585egMdZJ3/tXTnY4ZRohlYCN+Rw4M9viiDiDhipWrDeqcJWLjM96doYxSFsO7o2969qHfo/KDvoCVL81Rofz21UO4uI9bCjZD93ONIcHA4nEK/XoH8pBfFb6Cvz0a2uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(110136005)(478600001)(83380400001)(86362001)(26005)(2616005)(2906002)(31686004)(36756003)(91956017)(31696002)(5660300002)(316002)(71200400001)(76116006)(186003)(66476007)(53546011)(64756008)(66556008)(6506007)(38100700002)(122000001)(66446008)(15650500001)(6512007)(85182001)(6486002)(8676002)(66946007)(8936002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MGhVcnM1bmMyRkxUanlHNXlJN1Y3WFBoMnB1REtJWDRNbVUwUEJBNVAyYkFB?=
 =?utf-8?B?cVY0bTVNQzVrYUZNWmZYL09jTkt5OEZXUXdNK2VPQTBHMUlDSHlsZGpOYmZU?=
 =?utf-8?B?NE5zclZJY1kzdGdXd2ZZaE8xL2svWWhVTGFuc3dmMUFKRW9ubEtYQzBjcnN1?=
 =?utf-8?B?U2dmM2xCTVBtL0NILzVwTlBoSzE5Z3BlTWdoeUVqYVA1ZkVBdmllUmxTdFQ2?=
 =?utf-8?B?MVFESGNabXk0Q0tIVXl5UHdoRzk0QUt3NlFQVkh0NGdvY0JVcDlyNUNtc2xp?=
 =?utf-8?B?QnIwWmY2RjVjS3RDN3MrTzBZK2U3Y3dyVUFITVVhRjJRd05VM09hUkt3bTcz?=
 =?utf-8?B?WjZJSW52ZzBkNVlkVUtHZUJNNGVWNUp6MXQxemYyTTJoZmw0K2dqc2QyWWNo?=
 =?utf-8?B?eG04WEJYd1lYZEdKdnhwQ1BFajhud0NQU1ozNnJzNVQyTVlrSFZjcE1nd3FB?=
 =?utf-8?B?U253eElvYjZrdDNyWTlDbEY3UlJYOUd2eG1PeWlhYW8xTWFDRDRuTjF5eEMz?=
 =?utf-8?B?RzNPbXYrcWdZeGdwNFlEL1diWUphZ3p2aGJLQmd5cXE4enBJazd5U0Uwd09H?=
 =?utf-8?B?ZVVyNTh1UFNXYlV2RmhIQW1IRzl5cERpL09GdzM2YVkvRXkvN3pzMHFOQnRq?=
 =?utf-8?B?cHRpN1J4ZEhVMzZXRnQ5YXRBYUxpY21uajF4OTV4OXZNb3JSYjZTT3Q0aHhF?=
 =?utf-8?B?TDNrbHBydVorb0J3cHcwUWRsUWdUVFdNTVlRMFV3QXhBVlBqVG14emF3Q2x3?=
 =?utf-8?B?T0xNZnovOTA2N3A5b1RrVE9DRFAxMnRkd0RrZlVMb0lNdWVtT2dsRFUwSUJT?=
 =?utf-8?B?cm1raWxMQ0xKT0dieGRvTlhjZU41c2k0ZzFvNVVsOG5mdHh6dENyNjFLT25E?=
 =?utf-8?B?MGhEU0hyT0RKUFBpcWNrSEdYbjdzMFI1MncxL2pYTTk2UWd2dCtlM28vTDlz?=
 =?utf-8?B?c3B3SlVNcHRrWEkxMlFsM25CZG9tUjJaWTJGUjZ3dzR4dmZyWHFPSmp5eERp?=
 =?utf-8?B?RFJsTmdPUlNmbnhqc0dRd0ZCbURsQTNZcFJkYUJwK2pYemxkaCt1UkJrelpN?=
 =?utf-8?B?akhqR0dHVmVqRllHYXNuZUtySU5yS2ZNS0NUTFE4QjhJOGdlUjk4blU3TXJ3?=
 =?utf-8?B?MVlUZSs5NUJab2NPbGhoZXZKOWo0eWt1Wmt1aFBEUktmR3IyeWREbzBpQXVU?=
 =?utf-8?B?bUpIelA0azZUSFl5SHdrY3pROG5EUWZCYmdybG5UYlNlaTlyNjdOc0swN0tE?=
 =?utf-8?B?azRUV3E0TktrRlpBam1BS0Q4UWtsdmkrWjdmME40YllRQXd6YUFHbE1CL3hm?=
 =?utf-8?B?UzBIdmc2cWx2UUFteGJFQkNqcXFwdzZjMnFhdjFTeWNjclczcEdvampxbzB2?=
 =?utf-8?B?VlhlUE5uS1draGpHRlRBNjBTZHBNdTIvMnJXbWk1K3dvMHlRYmZuRVFMaGlO?=
 =?utf-8?B?eUVBTmdYYzhZN3Noc2NrZlpQVytVek1yNjhGa0FZcUlndXlqYXpJNTZEbnVC?=
 =?utf-8?B?RFFDclZrRWhaallUanA3S0NreVRLempkSXhxQkxTVXE5NXJXZWRUMG1Mem5L?=
 =?utf-8?B?bCtZK3V4L1hTaDFtVHFKNXJ1Ukk5MHd4NTBBa0NOZEhTRlB4a3lxVTRqZ283?=
 =?utf-8?B?SDgrV2x3VTFOWkE2Q3ppMDBJdXhyQWczWUhDL3RNRk5kU0Y5aHNES3g1NEZ2?=
 =?utf-8?B?TkJoU2diZXNXa1VHZHJkRU85UGFQT2pnWmk5R0E1cnhTU3pueHRFUmphdEI1?=
 =?utf-8?B?V3dHY0VZa2xFeEVVWU5vd3RRSTUzbExYaXYvSzErNnFWRTMrRkJrV2ozdTla?=
 =?utf-8?B?S0plQzJVakNsRzJIamdCdz09?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <E1DB9CE1188AD9478D212FF4A4D521AD@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7362aca-cade-4731-64f1-08d940f83827
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2021 03:35:08.6574 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s+4vP3HEYLkUW/BUKb4B8qWt99B8+D1obpKr3C05WDu/z305DD8volD1HZLcZQ1REUJbwCqtJ3ksrhbihhToFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7408
Received-SPF: pass client-ip=68.232.159.76; envelope-from=lizhijian@fujitsu.com;
 helo=esa5.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQpwaW5nLi4uDQoNCg0KT24gMTEvMDYvMjAyMSAxMTo0MSwgTGkgWmhpamlhbiB3cm90ZToNCj4g
VGhlIHByb21wdCB3YXMgdXBkYXRlZCBzaW5jZSBkZWY4MzVmMGRhICgnaG9zdG1lbTogRG9uJ3Qg
cmVwb3J0IHBtZW0gYXR0cmlidXRlIGlmIHVuc3VwcG9ydGVkJykNCj4NCj4gU2lnbmVkLW9mZi1i
eTogTGkgWmhpamlhbiA8bGl6aGlqaWFuQGNuLmZ1aml0c3UuY29tPg0KPiAtLS0NCj4gICBkb2Nz
L252ZGltbS50eHQgfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RvY3MvbnZkaW1tLnR4dCBiL2RvY3Mv
bnZkaW1tLnR4dA0KPiBpbmRleCAwYWFlNjgyYmUzZS4uNzFjZGJkZjU1NGIgMTAwNjQ0DQo+IC0t
LSBhL2RvY3MvbnZkaW1tLnR4dA0KPiArKysgYi9kb2NzL252ZGltbS50eHQNCj4gQEAgLTI0Nyw3
ICsyNDcsOCBAQCBpcyBidWlsdCB3aXRoIGxpYnBtZW0gWzJdIHN1cHBvcnQgKGNvbmZpZ3VyZWQg
d2l0aCAtLWVuYWJsZS1saWJwbWVtKSwgUUVNVQ0KPiAgIHdpbGwgdGFrZSBuZWNlc3Nhcnkgb3Bl
cmF0aW9ucyB0byBndWFyYW50ZWUgdGhlIHBlcnNpc3RlbmNlIG9mIGl0cyBvd24gd3JpdGVzDQo+
ICAgdG8gdGhlIHZOVkRJTU0gYmFja2VuZChlLmcuLCBpbiB2TlZESU1NIGxhYmVsIGVtdWxhdGlv
biBhbmQgbGl2ZSBtaWdyYXRpb24pLg0KPiAgIElmICdwbWVtJyBpcyAnb24nIHdoaWxlIHRoZXJl
IGlzIG5vIGxpYnBtZW0gc3VwcG9ydCwgcWVtdSB3aWxsIGV4aXQgYW5kIHJlcG9ydA0KPiAtYSAi
bGFjayBvZiBsaWJwbWVtIHN1cHBvcnQiIG1lc3NhZ2UgdG8gZW5zdXJlIHRoZSBwZXJzaXN0ZW5j
ZSBpcyBhdmFpbGFibGUuDQo+ICthICJsYWNrIG9mIGxpYnBtZW0gc3VwcG9ydCIgKG9yICJJbnZh
bGlkIHBhcmFtZXRlciAncG1lbSciIHNpbmNlIHY2LjAuMCkNCj4gK21lc3NhZ2UgdG8gZW5zdXJl
IHRoZSBwZXJzaXN0ZW5jZSBpcyBhdmFpbGFibGUuDQo+ICAgRm9yIGV4YW1wbGUsIGlmIHdlIHdh
bnQgdG8gZW5zdXJlIHRoZSBwZXJzaXN0ZW5jZSBmb3Igc29tZSBiYWNrZW5kIGZpbGUsDQo+ICAg
dXNlIHRoZSBRRU1VIGNvbW1hbmQgbGluZToNCj4gICANCg==

