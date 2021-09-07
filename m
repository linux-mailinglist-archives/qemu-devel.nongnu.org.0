Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1642A4029E9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:40:42 +0200 (CEST)
Received: from localhost ([::1]:39960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbL7-00060N-26
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88847c260e=pdel@fb.com>)
 id 1mNbIc-00032R-W6; Tue, 07 Sep 2021 09:38:07 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:26046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=88847c260e=pdel@fb.com>)
 id 1mNbIa-0008Uk-M4; Tue, 07 Sep 2021 09:38:06 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 187DUjqR011040; Tue, 7 Sep 2021 06:37:44 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=K1yXELwuAQQZf6MJ6YHZrol5E+ZI1GD3fJxr5Nij69Q=;
 b=CZoMS1zCYoR1FAdslI2WuUrPH2RsFnxQuB7PAE3qz6GPBdtQrwfcZxga5dfLcFCaexEE
 ETJObooVt4GhbWrDK+di60XUTd8/A8Hq0kHfKAlbOaibXTeRg8bWxm6o4B9of0+Bp6zf
 eNCAIp/Fg6z5HY9cOO+29+LCjh0uOWL2GaE= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com with ESMTP id 3awkg7e7k5-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 07 Sep 2021 06:37:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (100.104.31.183)
 by o365-in.thefacebook.com (100.104.35.172) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Tue, 7 Sep 2021 06:37:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJiPu4zLsqEO0UeXi5CZiH/Q/uHOWocjYp0WhKSDwpy9cLfbiSBBUUJmKIM/54x+wQHdzZkBH6/Gwe7DCtuUbQJF1tj4pQZ0stDbp5/FfpjCfVW3TVTA0C+5cIFPAytd/908n+7TqQ0sSPetlofxrIZP+tkcDhhvs7YY5QbuTo9jR2uEc034gwLeutG+fGGtnWOdrIZsdN6An3r4Kidh4wm9weOto2gKZCbwydhEBT7FZ9Z5WH8IAtiB2xdnDhExYLHEEFkvzAlaSn4p0bLji0D/NqPqOo+WQXJ/IP8S/bFOxjXhnrq40xE+foTOGmXYd9XD3TEwMg6DR9G4qNuHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=K1yXELwuAQQZf6MJ6YHZrol5E+ZI1GD3fJxr5Nij69Q=;
 b=ZCbruSnnUNqhswc9u7w+8HUQnjxOE31B8uFCa+Y6SPW4mAhl8piV338Xq5h3/TGrpIHRTh6vQXSR1dz5b854IYLu8+G7lub9wMguN5WAGrmjfTkZmkTk7052X3VkwM7g+rcCUUD0Bc/dT1CTFceazUdOFDcwg1UMv+cBQTIt/zIOfXVUud4DT2j7Ye713ofGzHrGdct2wkI2RaAy5j8leXQfsENQMtcrUhl+zCZ/AF55bXHH7Qj8XRFHOEfDmx6z50s9crtigjeBFzYDVwP1IOQg4rFm9eqKAHZ6xc8rCaDoTxPSZWQ9RWtqRIOYQjx1jvwr4AqohfN4v7bK4rbsjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from BYAPR15MB3032.namprd15.prod.outlook.com (2603:10b6:a03:ff::11)
 by BYAPR15MB2599.namprd15.prod.outlook.com (2603:10b6:a03:15a::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Tue, 7 Sep
 2021 13:37:40 +0000
Received: from BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368]) by BYAPR15MB3032.namprd15.prod.outlook.com
 ([fe80::39cf:cf4c:885c:9368%7]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 13:37:40 +0000
From: Peter Delevoryas <pdel@fb.com>
To: Joel Stanley <joel@jms.id.au>
CC: =?utf-8?B?Q8OpZHJpYyBMZSBHb2F0ZXI=?= <clg@kaod.org>, QEMU Developers
 <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Subject: Re: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock
 selection registers
Thread-Topic: [PATCH v2 1/1] hw/arm/aspeed: Initialize AST2600 UART clock
 selection registers
Thread-Index: AQHXoyTC3jz1GN67okugPdjsUFjiVKuYPU4AgABXdYA=
Date: Tue, 7 Sep 2021 13:37:40 +0000
Message-ID: <033C6B44-2867-4C4E-B5D4-A482E0E56DC8@fb.com>
References: <20210906134023.3711031-1-pdel@fb.com>
 <20210906134023.3711031-2-pdel@fb.com>
 <CACPK8XfyxtB2v8i4hprSgJZj3Tm9P8e7a456UKv=64gHZs-jiQ@mail.gmail.com>
In-Reply-To: <CACPK8XfyxtB2v8i4hprSgJZj3Tm9P8e7a456UKv=64gHZs-jiQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: jms.id.au; dkim=none (message not signed)
 header.d=none;jms.id.au; dmarc=none action=none header.from=fb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14204aea-f0cf-47b5-a154-08d97204a9b2
x-ms-traffictypediagnostic: BYAPR15MB2599:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR15MB25991A3E4AAA39193E64C04EACD39@BYAPR15MB2599.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HNNew+9/ZZ+hBFP4Sducz82AcFmYkmvNm3Y2fmQ53GHf6rLkbqS6JYdAiyv9SeY6uGkosNhkaDnUzS6I/jCFRTaniiCYmB+9p+93xk6ZSlbMREcubMLL2wrxexx8h8PPjq5Pn2/tZBloYQGtsIAu5RsBZmvKFn4xqnjoHLPgINxzmJY04ex6Ov+SiWeSN6MfVIcUf3tNSBDCzOg9EVJcrWqR/Y8Nw8X3x5ss5IuDbCATDkbfngGeWsHO5yvmUrsXPWRQF/js0xwSeM6D4xlJLSR+mXtgyJ+Of6x9zDDmcyKVKLAUybCaBGGY1IzIUuPWnQuNbmdZomvY5mVsm/0NfIgMr9rtwjS6c5es99jZM5yDAhVsPbySmaGrIVRzFaz6emCSl1FaSafbhgRlxRwiKwmJxstu5yx+RmOzD/JeQv7aH14X3YoBzCcldZ175r+pncgA0pw6kBtti1mOWAvwMYzH/kYEg6B55Svu0V+4r/fJd1W2tWiEDnI0fQhEajUmNFVoQJWJEPolHUnZo/wtfO4ulTwFAaoKgBtHP/0OMfKRdqFRJrVxt5QX5qsIsaFeHTbLSx/BvUgmLn3wbNZ+gXE6NkNaRmf52aLGuIL9i+/qzpmj8M8mvd70t8sCspkv1h2kgBr92F+dYYcP5Wwe7cUrS0B5WccSGf4QhzTb42aRMHdA5HxQmJ7bBeF5MxZ0JTRl046jPLUQCa7Xoslf8Au0TUaUehn2c4XGk5RCgzDOZymRVfCgp+zHqEBP/IWs5H11DJu5BsDriE/5SCpxsRUj4E4hN/nXY8v4WBzkbyx39jNPoFJhzONHpvBXb6bA
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR15MB3032.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(6506007)(53546011)(6486002)(83380400001)(478600001)(8936002)(966005)(38100700002)(76116006)(71200400001)(33656002)(122000001)(2906002)(186003)(66946007)(316002)(5660300002)(8676002)(2616005)(6512007)(66476007)(66556008)(66446008)(64756008)(86362001)(38070700005)(4326008)(36756003)(6916009)(54906003)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WFFYdXVORENaWnJKMDF3NVpBTWR4WDJ0SWFJOWkwSUpBdzNadnpFWUFNcXRa?=
 =?utf-8?B?TDlZK2N1Y2h2cGgzSUJKcXAyWGdzYkhMSHp2OVpqaFVUaXJOMXQveGhRNHhB?=
 =?utf-8?B?Y255RG5WMitOak9pclVmcnRvOTJVQzRZMHIwRFpJZURpdHZCVzV4b1FXZVEv?=
 =?utf-8?B?VXVqM1FWbnNXYXc2YlV0bS93c3pHZ1lYTEVBMnhaOFJlY245MDV4dDU2NWVn?=
 =?utf-8?B?dmkxQjI4ODF0MU9sV3EyenIySWVNTkJnR0ovRS9sdjgvcnhObVg0VCttNi9q?=
 =?utf-8?B?RUM3UnlMQ0VXMEtZZDA4cVpOSFUwVjByYnNGTGU3YTB2bGNRTElxQk9XOE9C?=
 =?utf-8?B?NTVaUkJwTEFjYmxvdnRoalpPck5ZaDUrcS9QMmFRSngwTXlLSzlDT3V3MGR0?=
 =?utf-8?B?Uy9aK1pUSktqNk5jdUZtS1FXemZ0emt6Y3VoaFpNZFZ3YzMvNzZ6S0ZZYWxj?=
 =?utf-8?B?OVpEVXRYdlAzWm1rbFE1TUR3WDBkME1LQldlb0dLRGozSm96dDY4THhSOFJN?=
 =?utf-8?B?dkpLK1ZwUHhEd2NqMkFEdm1qZ1UxbTJjbjdKRGpYcGM0aTlzTE85bXFnTFJW?=
 =?utf-8?B?VlJYUFEyaFpFMTNCQURtZStwajlzZDkrSjVSejdBaWUrK2ZhbCtDN0F5SnJR?=
 =?utf-8?B?Y1plODNBYzU2TmdkcmowUlpqMDRhcm8yaHhETmYyVVZYcG94NU1lbVJiQVpt?=
 =?utf-8?B?UEh4ZDZWU1FKY0d5bnJCd3lVVVFMSFFydXBqdGIyWTJTRllUNmFpUmsvbE5h?=
 =?utf-8?B?b3I4eFNRejNaK2lKN1pnaVNxQTB1VjZydjdOUURsNXgxZlRuVG8xeitQWFJu?=
 =?utf-8?B?NzhLVE45OVVxRngvTTR1bzdtQVBFaEQ2eEoreTkyekF0dEFWMklwZllhbW15?=
 =?utf-8?B?TlFDWnFQbHpyUVNVcUtMVTg0b0VqV2EzU1FjVXpreTd1ekkvMEUvbTdPWFFZ?=
 =?utf-8?B?Nm13N2JoK3NpTFlUQXltSGt0azM5elhIU0Q2K1dhNExpMVdyKzRyWTlwU3do?=
 =?utf-8?B?TG5vcGVxNzRZeXNCS0xKSlc4VWV1RHdIZDhGNHEzVVBGTW52Zy8vWnJpNVRq?=
 =?utf-8?B?ZUl0YkFyZFNVd3FZQUF6dG51UFhyTDYvTkJ3TkVleit0eEdVUjdZdEwvVFhG?=
 =?utf-8?B?MDN1V2JYK1ZqYnhmRW5lSXRSZkxIWjZ0QXlpZUZndWFtL1RzaFJ6YlpITENh?=
 =?utf-8?B?eG1wU3ExVUFHTzk4Vno0QVdNeWN6NTVvcXJlVU5XcGdKRW05VXVLVVRncGJ0?=
 =?utf-8?B?VGdpRnFkQVZrMlB2ck5NQ3hZRkJsS0JuOEtoMXM3K2tVV1JIMm1YQnBhNDVn?=
 =?utf-8?B?VENVMUFLMURYQ1MrejVRZ3hzbUdyWHhKYk5yNU9jajNwbU5PMTZ1aDBiUmdM?=
 =?utf-8?B?Smdzb3lwSjIyazhTR2tnZXRWRzgrL1VLR3lES0plWjdyemplV0svKy9oZXNR?=
 =?utf-8?B?YTVVVTFVSm5HdnRhYm5pdXk1Yk1zV0lFM0c3TDNLQjVXMGkxekNTL2tBUCtN?=
 =?utf-8?B?d1JYaFVZZnhwMmVaeS82aGRaOTgvWFBkMTJOa2RwbGpSNkM0dmhKVk5WNzBO?=
 =?utf-8?B?eTFOZlh0RXdkckVFcXorbnhMdzlQYnBvQWErNFM5U1ozdExXWTlsVDdGUmVB?=
 =?utf-8?B?eG0rd2QydnlWdnRXUVJ5MmJQTnFaL0R1WU53OS8rcUV4RzdleTRaVGZSa1VB?=
 =?utf-8?B?WjIxYWt4QVl2d2tFZENPVWpQbmJVMGNsRTNlWFdIR1orRURmVGhrd3RHRVRz?=
 =?utf-8?B?WURza0s5cThLMXpycjV0UjU3cjdpSGluZXExZkhldVZmdXB1bDRySGVJeEJ5?=
 =?utf-8?Q?z1LsVmEC0SfCxaGS7t/T2f8sFhZpB0JVxxuCc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <270A92B7DE399A4CAB28EA9593013DFB@namprd15.prod.outlook.com>
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR15MB3032.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14204aea-f0cf-47b5-a154-08d97204a9b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 13:37:40.1158 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqgr0TluivSquGoaW2WdO0VsBRTEnQmWPSDD/MC6Az1icUjqSwC1QQQoELHo/A3R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2599
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: gd2m5ajTSXJISpkJSdDs_bICHWT8cUF2
X-Proofpoint-ORIG-GUID: gd2m5ajTSXJISpkJSdDs_bICHWT8cUF2
Content-Transfer-Encoding: base64
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-07_04:2021-09-07,
 2021-09-07 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109070089
X-FB-Internal: deliver
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=88847c260e=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

DQoNCj4gT24gU2VwIDcsIDIwMjEsIGF0IDE6MjQgQU0sIEpvZWwgU3RhbmxleSA8am9lbEBqbXMu
aWQuYXU+IHdyb3RlOg0KPiANCj4gT24gTW9uLCA2IFNlcHQgMjAyMSBhdCAxMzo0MCwgPHBkZWxA
ZmIuY29tPiB3cm90ZToNCj4+IA0KPj4gRnJvbTogUGV0ZXIgRGVsZXZvcnlhcyA8cGRlbEBmYi5j
b20+DQo+PiANCj4+IFVBUlQ1IGlzIHR5cGljYWxseSB1c2VkIGFzIHRoZSBkZWZhdWx0IGRlYnVn
IFVBUlQgb24gdGhlIEFTVDI2MDAsIGJ1dA0KPj4gVUFSVDEgaXMgYWxzbyBkZXNpZ25lZCB0byBi
ZSBhIGRlYnVnIFVBUlQuIEFsbCB0aGUgQVNUMjYwMCBVQVJUJ3MgaGF2ZQ0KPj4gc2VtaS1jb25m
aWd1cmFibGUgY2xvY2sgcmF0ZXMgdGhyb3VnaCByZWdpc3RlcnMgaW4gdGhlIFN5c3RlbSBDb250
cm9sDQo+PiBVbml0IChTQ1UpLCBidXQgb25seSBVQVJUNSB3b3JrcyBvdXQgb2YgdGhlIGJveCB3
aXRoIHplcm8taW5pdGlhbGl6ZWQNCj4+IHZhbHVlcy4gVGhlIHJlc3Qgb2YgdGhlIFVBUlQncyBl
eHBlY3QgYSBmZXcgb2YgdGhlIHJlZ2lzdGVycyB0byBiZQ0KPj4gaW5pdGlhbGl6ZWQgdG8gbm9u
LXplcm8gdmFsdWVzLCBvciBlbHNlIHRoZSBjbG9jayByYXRlIGNhbGN1bGF0aW9uIHdpbGwNCj4+
IHlpZWxkIHplcm8gb3IgdW5kZWZpbmVkIChkdWUgdG8gYSBkaXZpZGUtYnktemVybykuDQo+PiAN
Cj4+IEZvciByZWZlcmVuY2UsIHRoZSBVLUJvb3QgY2xvY2sgcmF0ZSBkcml2ZXIgaGVyZSBzaG93
cyB0aGUgY2FsY3VsYXRpb246DQo+PiANCj4+ICAgIGh0dHBzOi8vZ2l0aHViLmNvbS9mYWNlYm9v
ay9vcGVuYm1jLXVib290L2Jsb2IvMTVmN2UwZGMwMWQ4L2RyaXZlcnMvY2xrL2FzcGVlZC9jbGtf
YXN0MjYwMC5jI0wzNTcNCj4+IA0KPj4gVG8gc3VtbWFyaXplLCBVQVJUNSBhbGxvd3Mgc2VsZWN0
aW9uIGZyb20gNCByYXRlczogMjQgTUh6LCAxOTIgTUh6LCAyNCAvDQo+PiAxMyBNSHosIGFuZCAx
OTIgLyAxMyBNSHouIFRoZSBvdGhlciBVQVJUJ3MgYWxsb3cgc2VsZWN0aW5nIGVpdGhlciB0aGUN
Cj4+ICJsb3ciIHJhdGUgKFVBUlRDTEspIG9yIHRoZSAiaGlnaCIgcmF0ZSAoSFVBUlRDTEspLiBV
QVJUQ0xLIGFuZCBIVUFSVENMSw0KPj4gYXJlIGNvbmZpZ3VyYWJsZSB0aGVtc2VsdmVzOg0KPj4g
DQo+PiAgICBVQVJUQ0xLID0gVVhDTEsgKiBSIC8gKE4gKiAyKQ0KPj4gICAgSFVBUlRDTEsgPSBI
VVhDTEsgKiBIUiAvIChITiAqIDIpDQo+PiANCj4+IFVYQ0xLIGFuZCBIVVhDTEsgYXJlIGFsc28g
Y29uZmlndXJhYmxlLCBhbmQgZGVwZW5kIG9uIHRoZSBBUExMIGFuZC9vcg0KPj4gSFBMTCBjbG9j
ayByYXRlcywgd2hpY2ggYWxzbyBkZXJpdmUgZnJvbSBjb21wbGljYXRlZCBjYWxjdWxhdGlvbnMu
IExvbmcNCj4+IHN0b3J5IHNob3J0LCB0aGVyZSdzIGxvdHMgb2YgbXVsdGlwbGljYXRpb24gYW5k
IGRpdmlzaW9uIGZyb20NCj4+IGNvbmZpZ3VyYWJsZSByZWdpc3RlcnMsIGFuZCBtb3N0IG9mIHRo
ZXNlIHJlZ2lzdGVycyBhcmUgemVyby1pbml0aWFsaXplZA0KPj4gaW4gUUVNVSwgd2hpY2ggYXQg
YmVzdCBpcyB1bmV4cGVjdGVkIGFuZCBhdCB3b3JzdCBjYXVzZXMgdGhpcyBjbG9jayByYXRlDQo+
PiBkcml2ZXIgdG8gaGFuZyBmcm9tIGRpdmlkZS1ieS16ZXJvJ3MuIFRoaXMgY2FuIGFsc28gYmUg
ZGlmZmljdWx0IHRvDQo+PiBkaWFnbm9zZSwgYmVjYXVzZSBpdCBtYXkgY2F1c2UgVS1Cb290IHRv
IGhhbmcgYmVmb3JlIHNlcmlhbCBjb25zb2xlDQo+PiBpbml0aWFsaXphdGlvbiBjb21wbGV0ZXMs
IHJlcXVpcmluZyBpbnRlcnZlbnRpb24gZnJvbSBnZGIuDQo+PiANCj4+IFRoaXMgY2hhbmdlIGp1
c3QgaW5pdGlhbGl6ZXMgYWxsIG9mIHRoZXNlIHJlZ2lzdGVycyB3aXRoIGRlZmF1bHQgdmFsdWVz
DQo+PiBmcm9tIHRoZSBkYXRhc2hlZXQuDQo+PiANCj4+IFRvIHRlc3QgdGhpcywgSSB1c2VkIEZh
Y2Vib29rJ3MgQVNUMjYwMCBPcGVuQk1DIGltYWdlIGZvciAiZnVqaSIsIHdpdGgNCj4+IHRoZSBm
b2xsb3dpbmcgZGlmZiBhcHBsaWVkIChiZWNhdXNlIGZ1amkgdXNlcyBVQVJUMSBmb3IgY29uc29s
ZSBvdXRwdXQsDQo+PiBub3QgVUFSVDUpLg0KPj4gDQo+PiAgQEAgLTMyMyw4ICszMjMsOCBAQCBz
dGF0aWMgdm9pZCBhc3BlZWRfc29jX2FzdDI2MDBfcmVhbGl6ZShEZXZpY2VTdGF0ZSAqZGV2LCBF
cnJvciAqKmVycnApDQo+PiAgICAgICB9DQo+PiANCj4+ICAgICAgLyogVUFSVCAtIGF0dGFjaCBh
biA4MjUwIHRvIHRoZSBJTyBzcGFjZSBhcyBvdXIgVUFSVDUgKi8NCj4+ICAtICAgIHNlcmlhbF9t
bV9pbml0KGdldF9zeXN0ZW1fbWVtb3J5KCksIHNjLT5tZW1tYXBbQVNQRUVEX0RFVl9VQVJUNV0s
IDIsDQo+PiAgLSAgICAgICAgICAgICAgICAgICBhc3BlZWRfc29jX2dldF9pcnEocywgQVNQRUVE
X0RFVl9VQVJUNSksDQo+PiAgKyAgICBzZXJpYWxfbW1faW5pdChnZXRfc3lzdGVtX21lbW9yeSgp
LCBzYy0+bWVtbWFwW0FTUEVFRF9ERVZfVUFSVDFdLCAyLA0KPj4gICsgICAgICAgICAgICAgICAg
ICAgYXNwZWVkX3NvY19nZXRfaXJxKHMsIEFTUEVFRF9ERVZfVUFSVDEpLA0KPj4gICAgICAgICAg
ICAgICAgICAgIDM4NDAwLCBzZXJpYWxfaGQoMCksIERFVklDRV9MSVRUTEVfRU5ESUFOKTsNCj4+
IA0KPj4gICAgICAgLyogSTJDICovDQo+PiANCj4+IFdpdGhvdXQgdGhlc2UgY2xvY2sgcmF0ZSBy
ZWdpc3RlcnMgYmVpbmcgaW5pdGlhbGl6ZWQsIFUtQm9vdCBoYW5ncyBpbg0KPj4gdGhlIGNsb2Nr
IHJhdGUgZHJpdmVyIGZyb20gYSBkaXZpZGUtYnktemVybywgYmVjYXVzZSB0aGUgVUFSVDEgY2xv
Y2sNCj4+IHJhdGUgcmVnaXN0ZXIgcmVhZHMgcmV0dXJuIHplcm8sIGFuZCB0aGVyZSdzIG5vIGNv
bnNvbGUgb3V0cHV0LiBBZnRlcg0KPj4gaW5pdGlhbGl6aW5nIHRoZW0gd2l0aCBkZWZhdWx0IHZh
bHVlcywgZnVqaSBib290cyBzdWNjZXNzZnVsbHkuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IFBl
dGVyIERlbGV2b3J5YXMgPHBkZWxAZmIuY29tPg0KPj4gLS0tDQo+PiBody9taXNjL2FzcGVlZF9z
Y3UuYyB8IDQgKysrKw0KPj4gMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQ0KPj4gDQo+
PiBkaWZmIC0tZ2l0IGEvaHcvbWlzYy9hc3BlZWRfc2N1LmMgYi9ody9taXNjL2FzcGVlZF9zY3Uu
Yw0KPj4gaW5kZXggMDVlZGViZWRlYi4uYTk1ZGNhNjVmMiAxMDA2NDQNCj4+IC0tLSBhL2h3L21p
c2MvYXNwZWVkX3NjdS5jDQo+PiArKysgYi9ody9taXNjL2FzcGVlZF9zY3UuYw0KPj4gQEAgLTEx
OSw2ICsxMTksOCBAQA0KPj4gI2RlZmluZSBBU1QyNjAwX0NMS19TRUwzICAgICAgICAgIFRPX1JF
RygweDMwOCkNCj4+ICNkZWZpbmUgQVNUMjYwMF9DTEtfU0VMNCAgICAgICAgICBUT19SRUcoMHgz
MTApDQo+PiAjZGVmaW5lIEFTVDI2MDBfQ0xLX1NFTDUgICAgICAgICAgVE9fUkVHKDB4MzE0KQ0K
Pj4gKyNkZWZpbmUgQVNUMjYwMF9VQVJUQ0xLX1BBUkFNICAgICBUT19SRUcoMHgzMzgpDQo+PiAr
I2RlZmluZSBBU1QyNjAwX0hVQVJUQ0xLX1BBUkFNICAgIFRPX1JFRygweDMzQykNCj4gDQo+IEl0
IHdvdWxkIGJlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgbmFtaW5nIGlmIHdlIGRyb3Bw
ZWQgdGhlDQo+IF9QQVJBTS4gTm90IHdvcnRoIHJlLXNwaW5uaW5nIGp1c3QgZm9yIHRoYXQgdGhv
dWdoLg0KDQpZZWFoIHNvcnJ5IGFib3V0IHRoYXQsIEkgd2FzbuKAmXQgc3VyZSB3aGF0IG5hbWUg
dG8gdXNlIGhlcmUuIFRoZQ0KZGF0YXNoZWV0IG5hbWVzIOKAnEdlbmVyYXRlIFVBUlRDTEsgZnJv
bSBVWENMS+KAnSBhbmQg4oCcR2VuZXJhdGUgSFVBUlRDTEsNCmZyb20gSFVYQ0xL4oCdIHNlZW1l
ZCB0b28gbG9uZyBhbmQgZGlkbuKAmXQgbWF0Y2ggYW55dGhpbmcgZWxzZS4gSSB0aG91Z2h0DQp0
aGVzZSByZWdpc3RlcnMgd2VyZSBraW5kIG9mIHNpbWlsYXIgdG8gdGhlIEhQTExfUEFSQU0gcmVn
aXN0ZXIsIGp1c3QNCmZvciBVQVJUQ0xLIGFuZCBIVUFSVENMSy4gSWYgdGhlcmUgYXJlIGFueSBm
dXJ0aGVyIHJldmlzaW9ucyBJIGNhbg0KY2hhbmdlIGl0IHRob3VnaC4NCg0KPiANCj4+ICNkZWZp
bmUgQVNUMjYwMF9IV19TVFJBUDEgICAgICAgICBUT19SRUcoMHg1MDApDQo+PiAjZGVmaW5lIEFT
VDI2MDBfSFdfU1RSQVAxX0NMUiAgICAgVE9fUkVHKDB4NTA0KQ0KPj4gI2RlZmluZSBBU1QyNjAw
X0hXX1NUUkFQMV9QUk9UICAgIFRPX1JFRygweDUwOCkNCj4+IEBAIC02ODEsNiArNjgzLDggQEAg
c3RhdGljIGNvbnN0IHVpbnQzMl90IGFzdDI2MDBfYTNfcmVzZXRzW0FTUEVFRF9BU1QyNjAwX1ND
VV9OUl9SRUdTXSA9IHsNCj4+ICAgICBbQVNUMjYwMF9DTEtfU0VMM10gICAgICAgICAgPSAweDAw
MDAwMDAwLA0KPj4gICAgIFtBU1QyNjAwX0NMS19TRUw0XSAgICAgICAgICA9IDB4RjNGNDAwMDAs
DQo+PiAgICAgW0FTVDI2MDBfQ0xLX1NFTDVdICAgICAgICAgID0gMHgzMDAwMDAwMCwNCj4+ICsg
ICAgW0FTVDI2MDBfVUFSVENMS19QQVJBTV0gICAgID0gMHgwMDAxNDUwNiwNCj4+ICsgICAgW0FT
VDI2MDBfSFVBUlRDTEtfUEFSQU1dICAgID0gMHgwMDAxNDVDMCwNCj4gDQo+IFRoZXNlIG1hdGNo
IHY5IG9mIHRoZSBkYXRhc2hlZXQsIHNvIHRoZXkgbG9vayBnb29kIHRvIG1lLg0KPiANCj4gUmV2
aWV3ZWQtYnk6IEpvZWwgU3RhbmxleSA8am9lbEBqbXMuaWQuYXU+DQoNClRoYW5rcyENClBldGVy
DQoNCj4gDQo+PiAgICAgW0FTVDI2MDBfQ0hJUF9JRDBdICAgICAgICAgID0gMHgxMjM0QUJDRCwN
Cj4+ICAgICBbQVNUMjYwMF9DSElQX0lEMV0gICAgICAgICAgPSAweDg4ODg0NDQ0LA0KPj4gfTsN
Cj4+IC0tDQo+PiAyLjMwLjINCg0K

