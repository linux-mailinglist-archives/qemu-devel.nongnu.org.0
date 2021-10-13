Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE8542B721
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 08:28:35 +0200 (CEST)
Received: from localhost ([::1]:48256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maXkg-000606-9d
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 02:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXhx-0004MC-Tn
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:25:45 -0400
Received: from mx0a-002c1b01.pphosted.com ([148.163.151.68]:25126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1maXhs-0002G5-Nl
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 02:25:44 -0400
Received: from pps.filterd (m0127837.ppops.net [127.0.0.1])
 by mx0a-002c1b01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19CMeVln032377; 
 Tue, 12 Oct 2021 23:25:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=RYzTOrqhdhXE/M/G+Aup4Q5tKOqt9uPG7zMZtubNJKE=;
 b=KJFHv1SRKQCeKhYYJH9x5ujlsuMjaJtIS+BfVMhjGqtEKBAbE4eSMejO7MetzfLPTFuK
 sDuj8VuzVOUVITj8WvIaZ9txxHVphgpD5C4Upf3NOFOYGAPJF10vGUtfzAGJhprY0ZK4
 huboKPuyRFPATyZBJhYIIZGzW0vRGZa+GJfNDHFIAcPrBFTc3ZQ3vtHCI+4IdQmPwpGD
 6/ZI6SLzw7xm9Mdm1Bg7GRRzRP6SXmnv4reE0zeDUDKUtn2tNdNaQedxsnJaMfK3oAza
 Ou6ohY3dNAy33up0WDnOCR23Xjk/6rbvrMG6cLUJtcVGq8LB/DHXNgW6iRh9WtN9ISJv Wg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
 by mx0a-002c1b01.pphosted.com with ESMTP id 3bnkc48kac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Oct 2021 23:25:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/DWj/Sj5cgGq+wxYrXKBXCf9VaDCQQps7EUluWaWx6J987YR1A5MaXuUp8WrNi1mpWucz9KU6EC7l7ItGypBPEJI/UoNx5mVCBV6SQ+LgrLE5bkYVIMWUFU5Tu3ezfuaUGiZ1yl1YGP+gQNGg1l+I6Kp7txZGR4lsKKH5B9YicPBTn1VeT1+/8VvXVl8vtZ0+v+FHOlLw+OD53mY0WgBwAARCV4SLZmB4nOuibRWw5OTENqwrwBEIEIbmDr95CX70JZqJb14pd2Knq46umajkmWSbTIGxtKUlxfOF88WTxeOHPfkgxfraBZuUQywUZtQwcp+PRGus8+9H3cAQcZSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYzTOrqhdhXE/M/G+Aup4Q5tKOqt9uPG7zMZtubNJKE=;
 b=PffpwBBkrayxcOox+1ArLuc8zvPAVZcL2V9kpIRgIyawUcc0NzLgzDPpeXTbKx2vB6RthCinA8GmbHp4w2HxUfl8h4uj1rmVy5kX6Mo/YSIIoEWOroMFBKRazinjcMHXDXdwoUmQv/7IsN1DtHoXezGuRwnGHQxE4RgdhfrJPP2Ir3FEs/pIcegHqh7u+OQsIMvZFgrhoR2QTvt3tBNxLx66HEtY3Z2LU/apBfko/ntTH6LNS7Lcptl0BT8AmAsMsI6H0A43ERQj2+mAwjiz61/befSG0O7nc/dM0e5X+SlALrL7nhEye6LeRQScBHf0XvD6TJ8uhehnFVFHfvKpbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from CH0PR02MB7947.namprd02.prod.outlook.com (2603:10b6:610:104::22)
 by CH2PR02MB6757.namprd02.prod.outlook.com (2603:10b6:610:a5::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Wed, 13 Oct
 2021 06:25:33 +0000
Received: from CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c]) by CH0PR02MB7947.namprd02.prod.outlook.com
 ([fe80::95a5:72e6:5a62:470c%6]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 06:25:33 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Topic: [PATCH v5] Prevent vhost-user-blk-test hang
Thread-Index: AQHXs8N7V3zNlGYXNUuXU3U0hU/D0au5JYIAgALrHACAAEhngIAIKrcAgAwK9QA=
Date: Wed, 13 Oct 2021 06:25:33 +0000
Message-ID: <20211013062526.GA30621@raphael-debian-dev>
References: <20210927171651.1433-1-raphael.norwitz@nutanix.com>
 <YVLYZCZ0NlhhrStG@stefanha-x1.localdomain>
 <20210930052900.GA15735@raphael-debian-dev>
 <YVWH2YUDLzaRxHYW@stefanha-x1.localdomain>
 <20211005102944-mutt-send-email-mst@kernel.org>
In-Reply-To: <20211005102944-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=nutanix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52499c1a-2c69-46cf-d779-08d98e12432b
x-ms-traffictypediagnostic: CH2PR02MB6757:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR02MB6757A0F8E2C799FCE5F5AA5CEAB79@CH2PR02MB6757.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sg9c1jILLvnoOG5qybxOjShHVxkxbF0EMq4cup8hpyM/dkXTVaZFxKEzUwd0Nngvs+pGyRtayZIxK/w1O9nB1+UqEICVsD1kQL0oXGmDAVlTNsZBcpO4E2GYwiYGFEhPjjCWpcOIH7NSRR0+iEojMLzlv6SeMuWPrfoov8Eih0qlPiBYkAq0uAZ3Bee9BkcmLmLi2RL5ouH3YDv61WwNdaRKQ9DSzEftMMZuRJa21eULwR3YP0BUmfg8/TMAajn7iOpVrLQoy0CuCQZX05kd0Xd9ddSilxf/FOGsqMBYU7pFmOj8le8ObhTfN877rgvhXTYGKdc/TEMQrvmseKszL9BULWhUUhny9MWhrQtyQaL4FZ7SNABA2sMFUN+dzG5HkmyZxAv4YYqtPBmw4pmUREQQKsps7h1qYYQwnGP8c0J598jlC4zkS3lwCVvabIk1VeYzwCNFW0XqaJC4a2sY8tmZQayPzzRMkMiyFLMCy7X9nEL9hGEC5VTOkSGZ2R3UEQNRvC1tVRfISKCLAOodJKujCDWyengVWIUOeeUiEDH7WcwqFw0FlZ7Umg5Gr5wVX0K0Om8jVDPn0+4Oz6g4QLNmUcXBTJTmEGLAhZXHIZATwp0k7Ai3HweTjs4hVTHAIsGE/Ks3x9hUU/i/AQbjJAmUDOQZGtmDXnVjBuuzr+eyiO/02e7mMu62Jgi/GTWrnqzI/CicLczk+NJnw5nZMCw4T348RbKgHrJZDroxm6izmHZ8yPLWqYxf97FrW2ouvopd75zI6z+e+c2GLMLMaLR9k3UFS7ELByEgGSuqVTPslqV4Nup43y4p6+oAfYr8rVSeiRsiRfoCXtT0r+KqxQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB7947.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(64756008)(83380400001)(66476007)(76116006)(33716001)(8676002)(66556008)(38070700005)(1076003)(54906003)(8936002)(66446008)(186003)(4326008)(316002)(33656002)(86362001)(6486002)(66946007)(91956017)(71200400001)(44832011)(26005)(6512007)(5660300002)(6916009)(122000001)(508600001)(6506007)(38100700002)(9686003)(2906002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VTdVUEJZVUczTm90cy9Ud0R5MUw1b3ZRUGJIVmJ5aFNCUUphYkROaE5Kbk80?=
 =?utf-8?B?dUNIcWdJSTNPU0JDRnc3cE5TU01JV2ZSTU92cVlNQ2ZiZzg0Q2NETTZtZDVM?=
 =?utf-8?B?YWZ3L1lyUS9YQkg3ZVNrZEV4a0padE83VHhwaERqVlAvY2o4WnVLTWk5REVP?=
 =?utf-8?B?ZGNqd1k1L3lhWmVtT3dZUXFvbng0N1NVcnlPbDVDNlFzT2l1MisyN0htckU1?=
 =?utf-8?B?U09ha3BWeTNPRWo5YzZqb1hRcWFaQ3FTdHNyVTArQWdJcXNKTW5CU2JucTcv?=
 =?utf-8?B?a0wwK3BFb25uUXVwVHI3ZGNvY2l1Mzc3Zm9MVDI0SVBwY3Q2aXQ1akN2Y2c3?=
 =?utf-8?B?MXdTY2JsQXhPQW9QZnZsVTRTNjFyZ3dlTVVvazdNRE5zWXlQNm5zS2EwbU1a?=
 =?utf-8?B?OWt3dzdkKzZDMjFoa244azhCczFDRlU0QjdPeEV6L2VjL0RvWmtVc2FrYmJ1?=
 =?utf-8?B?elB3ZjVLYm1FUmFmc3FZNm5BZlp4WEIrWjdOV2w4ejdObGdteDBFQjE4emdK?=
 =?utf-8?B?TkhFTmNKODhZbVlycWZQZWw4OUhPdkdIYXQva2xtVm1LeVR3aXlJVXlhT01W?=
 =?utf-8?B?Kys4dTZDZFFaUmxVdWdIZitad2IvYndMRlZaOHJTb1VHNmU1QU9TL3RYWk1q?=
 =?utf-8?B?WjFJTE8wTzZvWmhwWXMxeDZjR0lYaFh5VEpBQ0JPMW93YktrUDhCdWI2V0Mw?=
 =?utf-8?B?ak1LSFFncUVhcXZZQ254cDB0MDdKdEdiaXFYcFlPekxSWllwQkZsbjlaL1ly?=
 =?utf-8?B?YUIwdjFxdFpsYU9DOEI3NlBrOFFOWWwrSnNvVFp0d1JrNDM0MXVlZDZOdGVh?=
 =?utf-8?B?enVZMEx4bE14Ly8xckgwTnM1NWhVWWVjcCtNbktIaDk2dUtVRWVTdG5TREZW?=
 =?utf-8?B?L1N3dFR3SDBqcncxTm5hODBpVHN1Q1I3OHpBVHVQVUJvVzZ4RFpkM2tTTW9H?=
 =?utf-8?B?WjdMSnRtL1JaM1pDdVd3dklOUVYwSjBHOXhzN2ZZWVN3SXFSbnkrdHVFa3o0?=
 =?utf-8?B?ckpUeUlicXJXa1Q3OHYydDJNRGh4amdQS0RFcXdqMU5xV1VieG1YanpsU1Zv?=
 =?utf-8?B?R0hLbldpNEhjZkgzVWVub0Ryc0hVVXNjSExZbVc0THY3cU1SZ2NOZ05QSU92?=
 =?utf-8?B?WjFLN0U1OWxrTUdybXVFUDlidHlNazVKZWVUemZiRkZUZDZscmNzN3M3QzZK?=
 =?utf-8?B?aFhIM2F2NnYwdGNWNi9JbEVnZzU0NDIyeDFTYWtiYWhha2VYL2xJdVB0bCtY?=
 =?utf-8?B?KysxbStsQWJiZXJYQk5ocmNzWmZmUkpNaVMzVG0raU9QVWNzSWlqSFp1Qkx3?=
 =?utf-8?B?Ky9RNjBUZHJiYmx3TVlPMGRkS3hMQXBFeWhzRHY3eHQ5ZDkyenpxWlZPKzY1?=
 =?utf-8?B?TEluRzVRaVV1a2JiemlmeXFOOWJ6KzhMQkpXVlZ4b1VwaXhHQUhSK0lWaVlH?=
 =?utf-8?B?ZWVTOXV6ZDJDQmlJcEc1WDZQb3BVU0dIbUVXR2xrbEVuaW1vd3RJWVc3Rmxv?=
 =?utf-8?B?OE5vVW5lTjd6VzI2ZlQ1TUFJeWk3ZjdzcGNjMHdrVldxZDVYZFM0UWlHZWVZ?=
 =?utf-8?B?ZkwvdkE3d3lWWFNKT1VCM05iTXhIZVl0amRuQm9ST2pSQlFaUEQvMlVtb0la?=
 =?utf-8?B?MjJaZ3dGQTRpMnU2ckp4RExLM0dEVjZSdVNqeXR5SVhSN2RzWXFvNWVZcUJj?=
 =?utf-8?B?bUlOa0hTQlk0bGplb2ZzOHlFZjl4L3gvK1BKMFBsdG1GUDNFNCtkYkJlZC9C?=
 =?utf-8?Q?zpAokXop5tDxUNXnSOc7OkRGl0p95Lz2EtWBlQm?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B2BEBF079B719346ABEC7B92EAA04A73@namprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB7947.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52499c1a-2c69-46cf-d779-08d98e12432b
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Oct 2021 06:25:33.6570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EEZiYMgFqZNwooEEYWWks4NW01HhRMu/Wr83fjQswgEDbi46T477WWkKahi7yGkWpq2OWqLwbjAwbXjWhfVoc76jKByyABsrFxXyffbHAdk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6757
X-Proofpoint-GUID: IUdJqTmu_yVg4a-hNvWQ5GtPps63XrC4
X-Proofpoint-ORIG-GUID: IUdJqTmu_yVg4a-hNvWQ5GtPps63XrC4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-13_01,2021-10-13_01,2020-04-07_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.151.68;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0a-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "sgarzare@redhat.com" <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

T24gVHVlLCBPY3QgMDUsIDIwMjEgYXQgMTA6MzE6MDZBTSAtMDQwMCwgTWljaGFlbCBTLiBUc2ly
a2luIHdyb3RlOg0KPiBPbiBUaHUsIFNlcCAzMCwgMjAyMSBhdCAxMDo0ODowOUFNICswMTAwLCBT
dGVmYW4gSGFqbm9jemkgd3JvdGU6DQo+ID4gT24gVGh1LCBTZXAgMzAsIDIwMjEgYXQgMDU6Mjk6
MDZBTSArMDAwMCwgUmFwaGFlbCBOb3J3aXR6IHdyb3RlOg0KPiA+ID4gT24gVHVlLCBTZXAgMjgs
IDIwMjEgYXQgMTA6NTU6MDBBTSArMDIwMCwgU3RlZmFuIEhham5vY3ppIHdyb3RlOg0KPiA+ID4g
PiBPbiBNb24sIFNlcCAyNywgMjAyMSBhdCAwNToxNzowMVBNICswMDAwLCBSYXBoYWVsIE5vcndp
dHogd3JvdGU6DQo+ID4gPiA+ID4gSW4gdGhlIHZob3N0LXVzZXItYmxrLXRlc3QsIGFzIG9mIG5v
dyB0aGVyZSBpcyBub3RoaW5nIHN0b3BpbmcNCj4gPiA+ID4gPiB2aG9zdC11c2VyLWJsayBpbiBR
RU1VIHdyaXRpbmcgdG8gdGhlIHNvY2tldCByaWdodCBhZnRlciBmb3JraW5nIG9mZiB0aGUNCj4g
PiA+ID4gPiBzdG9yYWdlIGRhZW1vbiBiZWZvcmUgaXQgaGFzIGEgY2hhbmNlIHRvIGNvbWUgdXAg
cHJvcGVybHksIGxlYXZpbmcgdGhlDQo+ID4gPiA+ID4gdGVzdCBoYW5naW5nIGZvcmV2ZXIuIFRo
aXMgaW50ZXJtaXR0ZW50bHkgaGFuZ2luZyB0ZXN0IGhhcyBjYXVzZWQgUUVNVQ0KPiA+ID4gPiA+
IGF1dG9tYXRpb24gZmFpbHVyZXMgcmVwb3J0ZWQgbXVsdGlwbGUgdGltZXMgb24gdGhlIG1haWxp
bmcgbGlzdCBbMV0uDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gVGhpcyBjaGFuZ2UgbWFrZXMgdGhl
IHN0b3JhZ2UtZGFlbW9uIG5vdGlmeSB0aGUgdmhvc3QtdXNlci1ibGstdGVzdA0KPiA+ID4gPiA+
IHRoYXQgaXQgaXMgZnVsbHkgaW5pdGlhbGl6ZWQgYW5kIHJlYWR5IHRvIGhhbmRsZSBjbGllbnQg
Y29ubmVjdGlvbnMgYnkNCj4gPiA+ID4gPiBjcmVhdGluZyBhIHBpZGZpbGUgb24gaW5pdGlhbGlh
dGlvbi4gVGhpcyBlbnN1cmVzIHRoYXQgdGhlIHN0b3JhZ2UtZGFlbW9uDQo+ID4gPiA+ID4gYmFj
a2VuZCB3b24ndCBtaXNzIHZob3N0LXVzZXIgbWVzc2FnZXMgYW5kIHRoZXJlYnkgcmVzb2x2ZXMg
dGhlIGhhbmcuDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWzFdIGh0dHBzOi8vdXJsZGVmZW5zZS5w
cm9vZnBvaW50LmNvbS92Mi91cmw/dT1odHRwcy0zQV9fbG9yZS5rZXJuZWwub3JnX3FlbXUtMkRk
ZXZlbF9DQUZFQWNBOGtZcHo5TGlQTnhuV0pBUFNqYy0zRG52NTMyYkVkeWZ5bmFCZU1lb2hxQnAz
QS00MG1haWwuZ21haWwuY29tXyZkPUR3SUJBZyZjPXM4ODNHcFVDT0NoS09IaW9jWXRHY2cmcj1J
bjRnbVIxcEd6S0I4RzVwNkxVcldxa1NNZWMyTDVFdFhab3dfRlpOSlprJm09ZkIzWHM5SEJfSm9j
MVdiZW9LR2FpcEZHUUE3VFBpTVFQS2E5T1MwNEZNOCZzPWJ1U001RjNCTW9VUUVtVnNFT1hhQ2RF
Uk0wb25Ed29xaXQ3bmJMYmxrVnMmZT0gDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBIZXkgU3Rl
ZmFuLA0KPiA+ID4gDQo+ID4gPiA+IEhpIFJhcGhhZWwsDQo+ID4gPiA+IEkgd291bGQgbGlrZSB0
byB1bmRlcnN0YW5kIHRoZSBpc3N1ZSB0aGF0IGlzIGJlaW5nIHdvcmtlZCBhcm91bmQgaW4gdGhl
DQo+ID4gPiA+IHBhdGNoLg0KPiA+ID4gPiANCj4gPiA+ID4gUUVNVSBzaG91bGQgYmUgb2theSB3
aXRoIGxpc3RlbiBmZCBwYXNzaW5nLiBUaGUgcWVtdS1zdG9yYWdlLWRhZW1vbg0KPiA+ID4gPiBk
b2N1bWVudGF0aW9uIGV2ZW4gY29udGFpbnMgZXhhbXBsZSBjb2RlIGZvciB0aGlzDQo+ID4gPiA+
IChkb2NzL3Rvb2xzL3FlbXUtc3RvcmFnZS1kYWVtb24ucnN0KSBhbmQgdGhhdCBtYXkgbmVlZCB0
byBiZSB1cGRhdGVkIGlmDQo+ID4gPiA+IGxpc3RlbiBmZCBwYXNzaW5nIGlzIGZ1bmRhbWVudGFs
bHkgYnJva2VuLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gVGhlIGlzc3VlIGlzIHRoYXQgdGhl
ICJjbGllbnQiIChpbiB0aGlzIGNhc2Ugdmhvc3QtdXNlci1ibGsgaW4gUUVNVSkgY2FuDQo+ID4g
PiBwcm9jZWVkIHRvIHVzZSB0aGUgc29ja2V0IGJlZm9yZSB0aGUgc3RvcmFnZS1kYWVtb24gaGFz
IGEgY2hhbmNlIHRvDQo+ID4gPiBwcm9wZXJseSBzdGFydCB1cCBhbmQgbW9uaXRvciBpdC4gVGhp
cyBpcyBub3RoaW5nIHVuaXF1ZSB0byB0aGUNCj4gPiA+IHN0b3JhZ2UtZGFlbW9uIC0gSSd2ZSBz
ZWVuIHJhY2VzIGxpa2UgdGhpcyBoYXBwZW4gaGFwcGVuZCB3aXRoIGRpZmZlcmVudA0KPiA+ID4g
dmhvc3QtdXNlciBiYWNrZW5kcyBiZWZvcmUuDQo+ID4gPiANCj4gPiA+IFllcyAtIEkgZG8gdGhp
bmsgdGhlIGRvY3MgY2FuIGJlIGltcHJvdmVkIHRvIGV4cGxpY2l0bHkgc3RhdGUgdGhhdCB0aGUN
Cj4gPiA+IHN0b3JhZ2UtZGFlbW9uIG11c3QgYmUgYWxsb3dlZCB0byBwcm9wZXJseSBpbml0aWFs
aXplIGJlZm9yZSBhbnkgZGF0YSBpcw0KPiA+ID4gc2VudCBvdmVyIHRoZSBzb2NrZXQuIE1heWJl
IHdlIHNob3VsZCBldmVuIHBlcnNjcmliZSB0aGUgdXNlIG9mIHRoZSBwaWRmaWxlDQo+ID4gPiBv
cHRpb24/DQo+ID4gPiANCj4gPiA+ID4gQ2FuIHlvdSBzaGFyZSBtb3JlIGRldGFpbHMgYWJvdXQg
dGhlIHByb2JsZW0/DQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBEaWQgeW91IHNlZSBteSBhbmFs
eXNpcyBbMV0/DQo+ID4gPiANCj4gPiA+IFsxXSBodHRwczovL3VybGRlZmVuc2UucHJvb2Zwb2lu
dC5jb20vdjIvdXJsP3U9aHR0cHMtM0FfX2xvcmUua2VybmVsLm9yZ19xZW11LTJEZGV2ZWxfMjAy
MTA4MjcxNjUyNTMuR0ExNDI5MS00MHJhcGhhZWwtMkRkZWJpYW4tMkRkZXZfJmQ9RHdJQkFnJmM9
czg4M0dwVUNPQ2hLT0hpb2NZdEdjZyZyPUluNGdtUjFwR3pLQjhHNXA2TFVyV3FrU01lYzJMNUV0
WFpvd19GWk5KWmsmbT1mQjNYczlIQl9Kb2MxV2Jlb0tHYWlwRkdRQTdUUGlNUVBLYTlPUzA0Rk04
JnM9b19TMmtLTzRSUW5XdzJRbnpWaTdkZ093Z2lQYnVzSTlaY2hlN21XVjIySSZlPSANCj4gPiA+
IA0KPiA+ID4gQmFzaWNhbGx5IFFFTVUgc2VuZHMgVkhPU1RfVVNFUl9HRVRfUFJPVE9DT0xfRkVB
VFVSRVMgYWNyb3NzIHRoZSB2aG9zdA0KPiA+ID4gc29ja2V0IGFuZCB0aGUgc3RvcmFnZSBkYWVt
b24gbmV2ZXIgcmVjZWl2ZXMgaXQuIExvb2tpbmcgYXQgdGhlDQo+ID4gPiBRRU1VIHN0YXRlIHdl
IHNlZSBpdCBpcyBzdHVjayB3YWl0aW5nIGZvciBhIHZob3N0LXVzZXIgcmVzcG9uc2UuIE1lYW53
aGlsZQ0KPiA+ID4gdGhlIHN0b3JhZ2UtZGFlbW9uIG5ldmVyIHJlY2VpdmVzIGFueSBtZXNzYWdl
IHRvIGJlZ2luIHdpdGguIEFGQUlDVA0KPiA+ID4gdGhlcmUgaXMgbm90aGluZyBzdG9wcGluZyBR
RU1VIGZyb20gcnVubmluZyBmaXJzdCBhbmQgc2VuZGluZyBhIG1lc3NhZ2UNCj4gPiA+IGJlZm9y
ZSB2aG9zdC11c2VyLWJsayBjb21lcyB1cCwgYW5kIGZyb20gdGVzdGluZyB3ZSBjYW4gc2VlIHRo
YXQgd2FpdGluZw0KPiA+ID4gZm9yIHRoZSBzdG9yYWdlLWRhZW1vbiB0byBjb21lIHVwIHJlc29s
dmVzIHRoZSBwcm9ibGVtIGNvbXBsZXRlbHkuDQo+ID4gDQo+ID4gVGhlIHJvb3QgY2F1c2UgaGFz
IG5vdCBiZWVuIGRldGVybWluZWQgeWV0LiBRRU1VIHNob3VsZCBhY2NlcHQgdGhlDQo+ID4gaW5j
b21pbmcgY29ubmVjdGlvbiBhbmQgdGhlbiByZWFkIHRoZSBwcmV2aW91c2x5LXNlbnQNCj4gPiBW
SE9TVF9VU0VSX0dFVF9QUk9UT0NPTF9GRUFUVVJFUyBtZXNzYWdlLiBUaGVyZSBpcyBubyByZWFz
b24gYXQgdGhlDQo+ID4gU29ja2V0cyBBUEkgbGV2ZWwgd2h5IHRoZSBtZXNzYWdlIHNob3VsZCBn
ZXQgbG9zdCwgc28gdGhlcmUgaXMgcHJvYmFibHkNCj4gPiBhIFFFTVUgYnVnIGhlcmUuDQo+IA0K
PiBSaWdodC4gSG93ZXZlciB0aGUgdGVzdCBkb2VzIHJhbmRvbWx5IGhhbmcgZm9yIHBlb3BsZSBh
bmQgaXQncw0KPiBub3QgcmVhbGx5IG9mIGludGVyZXN0IHRvIGFueW9uZS4gSSB0aGluayB3ZSBz
aG91bGQgYXBwbHkgdGhlDQo+IHdvcmstYXJvdW5kIGJ1dCB5ZXMgd2Ugc2hvdWxkIGtlZXAgd29y
a2luZyBvbiB0aGUgcm9vdCBjYXVzZSwgdG9vLg0KPg0KDQpGcm9tIG15IGVuZCBJIGhhdmUgc3Bl
bnQgc29tZSBtb3JlIHRpbWUgbG9va2luZyBhdCBpdCBidXQgaGF2ZSBub3QgbWFkZQ0KbXVjaCBw
cm9ncmVzcy4gSSB3YXMgaG9wZWZ1bCB0aGF0IERhdmlkIEhpSWRlbmJyYW5k4oCZcyBsaWJ2aG9z
dC11c2VyIGJ1Zw0KZml4ZXMgbWF5IGhhdmUgcmVzb2x2ZWQgaXQsIGJ1dCBJIHRlc3RlZCBhbmQg
ZXZlbiB3aXRoIGhpcyBwYXRjaGVzIEkNCnN0aWxsIHNlZSB0aGUgaGFuZy4NCg0KSSBhbSBkZXRl
cm1pbmVkIHRvIGdldCB0byB0aGUgYm90dG9tIG9mIGl0LCBidXQgSeKAmW0gbm90IHN1cmUgaG93
IGxvbmcgaXQNCndpbGwgdGFrZS4gSWYgdGhpcyBpcyBpbXBhY3RpbmcgcGVvcGxlIHRoYW4gSSBh
Z3JlZSB3aXRoIG1lcmdpbmcgdGhlDQpwYXRjaCBhcyBhIHdvcmthcm91bmQuDQoNCkZyb20gbXkg
ZW5kLCBJIHdpbGwgc2VuZCBhIHY2IHVwZGF0aW5nIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgYWRk
DQpjb21tZW50cyB0byBtYWtlIGl0IGNsZWFyIHRoYXQgdGhlIHBhdGNoIGlzIGEgd29ya2Fyb3Vu
ZCBhbmQgdGhlIHJvb3QNCmNhdXNlIGhhcyBub3QgYmVlbiBkZXRlcm1pbmVkIHlldC4gU291bmQg
Z29vZD8NCg0KPg0KPiA+ID4gPiBEb2VzICJ3cml0aW5nIHRvIHRoZSBzb2NrZXQiIG1lYW4gd3Jp
dGluZyB2aG9zdC11c2VyIHByb3RvY29sIG1lc3NhZ2VzDQo+ID4gPiA+IG9yIGRvZXMgaXQgbWVh
biBjb25uZWN0KDIpPw0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gWWVzIC0gaXQgbWVhbnMgd3Jp
dGluZyB2aG9zdC11c2VyIG1lc3NhZ2VzLiBXZSBzZWUgYSBtZXNzYWdlIHNlbnQgZnJvbQ0KPiA+
ID4gUUVNVSB0byB0aGUgYmFja2VuZC4NCj4gPiA+IA0KPiA+ID4gTm90ZSB0aGF0IGluIHF0ZXN0
X3NvY2tldF9zZXJ2ZXIoKSAoY2FsbGVkIGZyb20gY3JlYXRlX2xpc3Rlbl9zb2NrZXQoKSkNCj4g
PiA+IHdlIGhhdmUgYWxyZWFkeSBjYWxsZWQgbGlzdGVuKCkgb24gdGhlIHNvY2tldCwgc28gSSB3
b3VsZCBleHBlY3QgUUVNVQ0KPiA+ID4gY2FsbGluZyBjb25uZWN0KDIpIHRvIHN1Y2NlZWQgYW5k
IHByb2NlZWQgdG8gc3VjY2Vzc2Z1bGx5IHNlbmQgbWVzc2FnZXMNCj4gPiA+IHdoZXRoZXIgb3Ig
bm90IHRoZXJlIGlzIGFub3RoZXIgbGlzdGVuZXIuIEkgZXZlbiB0cmllZCBjb21tZW50aW5nIG91
dCB0aGUNCj4gPiA+IGV4ZWNscCBmb3IgdGhlIHN0b3JhZ2UtZGFlbW9uIGFuZCBJIHNhdyB0aGUg
c2FtZSBiZWhhdmlvciBmcm9tIFFFTVUgLSBpdA0KPiA+ID4gc2VuZHMgdGhlIG1lc3NhZ2UgYW5k
IGhhbmdzIGluZGVmaW5pdGVseS4NCj4gPiANCj4gPiBRRU1VIGlzIGNvcnJlY3QgaW4gd2FpdGlu
ZyBmb3IgYSB2aG9zdC11c2VyIHJlcGx5LiBUaGUgcXVlc3Rpb24gaXMgd2h5DQo+ID4gcWVtdS1z
dG9yYWdlLWRhZW1vbidzIHZob3N0LXVzZXItYmxvY2sgZXhwb3J0IGlzbid0IHByb2Nlc3Npbmcg
dGhlDQo+ID4gcmVxdWVzdCBhbmQgcmVwbHlpbmcgdG8gaXQ/DQo+ID4gDQo+ID4gPiA+IENvdWxk
IHRoZSBwcm9ibGVtIGJlIHRoYXQgdmhvc3QtdXNlci1ibGstdGVzdC5jIGNyZWF0ZXMgdGhlIGxp
c3RlbiBmZHMNCj4gPiA+ID4gYW5kIGRvZXMgbm90IGNsb3NlIHRoZW0/IFRoaXMgbWVhbnMgdGhl
IGhvc3QgbmV0d29yayBzdGFjayBkb2Vzbid0DQo+ID4gPiA+IGNvbnNpZGVyIHRoZSBzb2NrZXQg
Y2xvc2VkIGFmdGVyIFFFTVUgdGVybWluYXRlcyBhbmQgdGhlcmVmb3JlIHRoZSB0ZXN0DQo+ID4g
PiA+IHByb2Nlc3MgaGFuZ3MgYWZ0ZXIgUUVNVSBpcyBnb25lPyBJbiB0aGF0IGNhc2Ugdmhvc3Qt
dXNlci1ibGstdGVzdCBuZWVkcw0KPiA+ID4gPiB0byBjbG9zZSB0aGUgZmRzIGFmdGVyIHNwYXdu
aW5nIHFlbXUtc3RvcmFnZS1kYWVtb24uDQo+ID4gPiA+IA0KPiA+ID4gDQo+ID4gPiBXaGVuIHRo
ZSB0ZXN0IGhhbmdzIGJvdGggUUVNVSBhbmQgc3RvcmFnZS1kYWVtb24gYXJlIHN0aWxsIHVwIGFu
ZA0KPiA+ID4gY29ubmVjdGVkIHRvIHRoZSBzb2NrZXQgYW5kIHdhaXRpbmcgZm9yIG1lc3NhZ2Vz
IGZyb20gZWFjaCBvdGhlci4gSSBkb24ndA0KPiA+ID4gc2VlIGhvdyB3ZSB3b3VsZCBjbG9zZSB0
aGUgRkQgaW4gdGhpcyBzdGF0ZSBvciBob3cgaXQgd291bGQgaGVscC4NCj4gPiANCj4gPiBZZXMs
IEkgc2VlLiBJbiB0aGF0IGNhc2UgdGhlIHRoZW9yeSBhYm91dCBmZHMgZG9lc24ndCBhcHBseS4N
Cj4gPiANCj4gPiA+IFdlIG1heSB3YW50IHRvIHRoaW5rIGFib3V0IGltcGxlbWVudGluZyBzb21l
IGtpbmQgb2YgdGltZW9vdXQgZm9yIGluaXRpYWwNCj4gPiA+IHZob3N0LXVzZXIgbWVzc2FnZXMg
c28gdGhhdCB3ZSBmYWlsIGluc3RlYWQgb2YgaGFuZyBpbiBjYXNlcyBsaWtlIHRoZXNlLA0KPiA+
ID4gYXMgSSBwcm9wb3NlZCBpbiBbMV0uIFdoYXQgZG8geW91IHRoaW5rPw0KPiA+IA0KPiA+IExl
dCdzIGhvbGQgb2ZmIG9uIHdvcmthcm91bmRzIHVudGlsIHRoZSByb290IGNhdXNlIGhhcyBiZWVu
IGZvdW5kLg0KPiA+IA0KPiA+IERvIHlvdSBoYXZlIHRpbWUgdG8gZGVidWcgd2h5IHZ1X2FjY2Vw
dCgpIGFuZCB2dV9tZXNzYWdlX3JlYWQoKSBkb24ndA0KPiA+IHNlZSB0aGUgcGVuZGluZyBWSE9T
VF9VU0VSX0dFVF9QUk9UT0NPTF9GRUFUVVJFUyBtZXNzYWdlPw0KPiA+IA0KPiA+IFRoYW5rcywN
Cj4gPiBTdGVmYW4NCj4gDQo+IA==

