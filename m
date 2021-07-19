Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D50623CCCA3
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 05:26:16 +0200 (CEST)
Received: from localhost ([::1]:34214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5Jv5-0004H1-UA
	for lists+qemu-devel@lfdr.de; Sun, 18 Jul 2021 23:26:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m5JqF-0006mX-7J
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:15 -0400
Received: from esa15.fujitsucc.c3s2.iphmx.com ([68.232.156.107]:12705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1m5JqC-0006Aw-MV
 for qemu-devel@nongnu.org; Sun, 18 Jul 2021 23:21:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1626664873; x=1658200873;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7ct0bAWTmOicXDmABLGiAM/8Tl23r9WQy72M9/4ANgE=;
 b=CXhXMekBbO6XgXTl6k2rTLcTRN+WwWh5boouSeHulNxxZm7bIlOTnbna
 nl13D1tM6kn1c7vrARj/gnGH1A4Oii1NTtRsbNT+VSjpJYgkIzqidBlIh
 Vpi+aD2Ys3Bk9pvM43CYQ+zvbiCvs7Z5Fb/V3Btk3H+V0swWdefKiBDES
 vGELpTmMX/uceAgjqUvF7s9jpsYExiSoRnPaaRw5wyzjoJg2Q7gezng1R
 pdBAFxpUVYKcN3OMap6hhKeE3ns/76w+9Tzf0yl02xlerj+Wzsqu0npZ9
 5K48CK35aEheCJ0zUP720GhzzLN81+dxMOfv1OA1J3CTHW2d5huz1Fi44 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10049"; a="35079709"
X-IronPort-AV: E=Sophos;i="5.84,251,1620658800"; d="scan'208";a="35079709"
Received: from mail-os2jpn01lp2052.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.52])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 12:21:08 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iBXDZw05uWtD6ybbHefk+6sBHMzOYBdWMHMn/xX73M5X4tctKRr7Q4PeQ3vvmkENWpaIjUYJNTJ8Iphe59w+IJHCh9IIf7yHjsXNo0ujOSHXcxcJ/yGWK6IujetZQ/ndCuDS7LOGw1ZOU0hqfXtGTB3eF8lbkiPkXPjH0waqfL8Dpl1f+zwPPdV0vBMzrm+RITdLC7xREhj/K+hZZa7GmyfvgMuZHx7hhSP8C7bKXufA//sAcyjZ8pTWHJqAjygQXHRkv6k0NTTJLwS+m5gA4wCVUxe7CI4LelFD4UZEXfhUf2oPl5nhti/6P9E+RixdsXK+OjHahVXcVhiMt3t/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ct0bAWTmOicXDmABLGiAM/8Tl23r9WQy72M9/4ANgE=;
 b=YJpJI+UobTtofqzNtTEWJ4yif4q0/myfEAgMjaw0JfwffYij0qOA0kn4h2qPdGTGXWCJ++Wy51fKnH86O8XkVT+VJSMJCZeSgo1bax9B7+jQvBYpwz6ygwUfRIj27ClMLmbpqJRDJE8baWxAbhfJx1TH4xB5vjebjaG30+g8ERdCR0sN4AMg0n51jocXMesoS87NpBsKriLIPwB4reLDZ8To9st2JwZPNkPbA3tmn7hX8lnra6+qfWM3bcM43h2MCHtgYZzec4LuFM8xhPnriew0ksYLZs0ccFQhgHk6yL4vUtV2v233d6ykeOjUTX8mjUbutkaZhT6zLliie77joQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ct0bAWTmOicXDmABLGiAM/8Tl23r9WQy72M9/4ANgE=;
 b=T8JCFlB7HHpr0HBhurt2TFa99/PUs3puvcsL0+MHy2J3bESEP6F0ncgr0+03tlS1yv+rIa6LwdlFQWock+TByF2BUadA0XyQWPVZ9cqE7x+uQyxewGavPG3eLbvL7ejSHx/+CrYTaIArigZkLu19AJeaG47JEWVudp8W51aZoJA=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 03:21:04 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::bc5e:5376:385:ad20%4]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 03:21:04 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: =?gb2312?B?u9i4tDogW1BBVENIIDIvMl0gbWlncmF0aW9uOiBhbGxvdyBlbmFibGluZyBt?=
 =?gb2312?Q?utilfd_for_specific_protocol_only?=
Thread-Topic: [PATCH 2/2] migration: allow enabling mutilfd for specific
 protocol only
Thread-Index: AQHXehfi02/KN2bS/0W1edhbTT2zZatJpbxU
Date: Mon, 19 Jul 2021 03:21:04 +0000
Message-ID: <OS3PR01MB76502CD55D5EEBC969594D53A5E19@OS3PR01MB7650.jpnprd01.prod.outlook.com>
References: <20210716075909.50575-1-lizhijian@cn.fujitsu.com>,
 <20210716075909.50575-2-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210716075909.50575-2-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7aa1bc0b-03c5-438e-339d-08d94a643df9
x-ms-traffictypediagnostic: OS3PR01MB7650:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7650A4D461BCBEF2A478E3F4A5E19@OS3PR01MB7650.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kA6aq4RNtD7fyqjRG8Fz/hQeZZ1uNn+nlNgA8cwb7W0HpLyqwPctpCwQQnWNhO/SldB7LOFyVMNQ/FIdDACc10l+Kj+zsXgErHs5gnViG4jvyOxADy1cgd7ilPHY2wRBhEmR4eUw5Jk4/L/yJ1x6tY3Newj+m/sKDN/XPLnYWTnNn5+CcXkK5p58SCDx7+4hr6kQIHubENmCPHjXzBfFs9VdEv+Eql5Ay5BJ2fvHoSacHrTQoSQhODUPsYdrKkwra01ZRFnk3vaB90fD/3BCKJzFfvj4g7WXahONXwAv+yIK3aKO85Y6v3C1YKmQXcxY2WAC0B0pV1bWqvZ35mZHgdKlSAoWDiy+YGP4JIjXHi8ngv4ulkRF3xEo81e6KpxjGDsWaKKoRXVJFai4lx5chRXed3r5rXOHuK8ZYaiw7ay5MRUZO7JoSwOYqYRhlo0zHCHrhpPSr3EE1UUr9niC/PekRTuXWITeincx4YYBHHKOtdBZOjcPXaGrB3S3Ctue+nUgrvBEX/+Ir1vk/t3nuPi5EJtBduNgVyIrqmxY5qvWEt3BOWrFwSEkB3gHN/ffdxmQf4Lm2ls7lMqu1hzV49JXIrM4zG+NZ+eDS7yYp5BIm/IyJ0vJi71e3IC5ClkTvfBCpsjs325XC3qOfwBy2pDG3bN5sVOTlF1RgGUVlG81sstJje5rlOglI7YJXz8Qz3OHQkM+4cE3CWITOgTXew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(66946007)(66446008)(76116006)(55016002)(9686003)(91956017)(316002)(66476007)(64756008)(26005)(186003)(478600001)(71200400001)(85182001)(122000001)(38100700002)(4326008)(2906002)(110136005)(66556008)(5660300002)(83380400001)(224303003)(6506007)(8936002)(33656002)(86362001)(7696005)(52536014)(38070700004);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NFFCcU9pRFRHNU5HTUJJa0xGQVdWYzRPaTlub1o5S1dJeG9LNmZlVHZBaUFL?=
 =?gb2312?B?MkpQL20rc2FPKzl4UlJqRnpFN29paWFhWXUySmtLRkFQdnViVGxmV0NMTUJl?=
 =?gb2312?B?NmJaVFlidkwxNnQ4amJkOUJpOEF4bTlYYjQ1cUZXYmZjSEdUQXErRXhwVGpC?=
 =?gb2312?B?c0x1K2hXeUxKZm5Nbk05RlUrNFplY3h5ZUYwUTZOY1hJN1BVT2V2VStMdGFL?=
 =?gb2312?B?RnVER0YvQndTV1hqNWZLbkN2OTZ6K2xTbnkvbzVzN2hkc3VPVmVMTTdFWVRC?=
 =?gb2312?B?dFRrUk1KTjl3L3J1NWN5b0w2ZkhOaktjbGwvSUw0MnpXWG1KaVJWTTJtZUZw?=
 =?gb2312?B?L3RnQ0xxcVFFWnVqTTlNQkpyWVpoRUx2LzU3alFvSnYxZ0xrdXVKUFFkWVV1?=
 =?gb2312?B?L1Bab1NzVGhxZjh0NGZJNG9lQVBqNEU4YzlHZkkxb2RYK09LdzZxN1BVR25t?=
 =?gb2312?B?Z1lTdzN3amMvcFRpZ0drYkVScWo5QWdrem5RVENaV0tTdkZRTXI2WW1ST1lw?=
 =?gb2312?B?d3FiTDYxbGxaeVhUOElmLzNmd01LcVFxUXpWMU5oOG8xTFJxakRYTkxFZnJ2?=
 =?gb2312?B?VWxoc2N2dGlVbVNzWWg1TzFkSzNicWRuZW9RRC9xRWdhcDY0WFRmMHN3bC9J?=
 =?gb2312?B?d2FINHNiNkxmcXhzSlhVM2pac2NjS3lmVUpBRDcrVXZTWnN4ZFlmSTJHVWRp?=
 =?gb2312?B?OVBhNGdMcW9jRXNvaGtZZ3YwT3BucFlMVnoraFppTks0ak5TVkJrd0R5bjgv?=
 =?gb2312?B?aDRFc0lQZWNyR0ZpM1gwQjNENWtJbVJlbnZtVnpYRytIajdHdnVmNHdPMFdl?=
 =?gb2312?B?ZFhzLzZ5QmJsVWcvVjRLdkl1eEhKWXEvMDZYWFZ4YVdEU0ZNVk5PdU5VaDBz?=
 =?gb2312?B?YmZLZmFJc2U4cnpBT1hKVTBmcEZEV3VzTmZsb2RtRGRBcmhLN2VNN0VDKzlH?=
 =?gb2312?B?d1p3d2cyeUJVdkJiWEtDWGpEalJrT2NPNmovUDNsZVBvOFcyZEE3Y3g4dUhp?=
 =?gb2312?B?Q2g3VTl2VDdNdEd1VzlDb2tCcTN4anJBUjVPTDY1MkxlRUNQNEdwSzJCKzBC?=
 =?gb2312?B?eENoVkNiTGNyRGthcmtNY2VuTzhyRHlzbG9hNDRWZ1p0UXZVRGNEc0lXcFA5?=
 =?gb2312?B?OHZWMU9xZDRXT2Y1WXlNaThWOUVYaUNNS2pRQzBIN1pwNnJwaE1rcEpqSytB?=
 =?gb2312?B?WkVETnBvR05leHhaVXJ4Ym51VGxXR0xwdGVOOVVUSHV4UjlIczlKREJQeWwv?=
 =?gb2312?B?a245cnp2czdHU3VlZXM0TWR3bElkN3UydzYzT29wYVc0WjB4SjIwelVlc1Fj?=
 =?gb2312?B?MmtNQ2ZJV0lvRlBUVnBBa255QllmTHRPUzZ6MjN1TnFTMHhuc2FtbytSVXh4?=
 =?gb2312?B?QzZ5R05vVjFGVVFZM0Z0MDZwNzhYSjEwS0hxdG1XT1B4ckFkOHF0T0Rmbmhy?=
 =?gb2312?B?d2ZRV0doeWpYVlAva1RmQ0FkVGlGdnhlcDIyUElHWXF5bEloa0VreU11OWw2?=
 =?gb2312?B?RTk0R3NvdS9CY2JmV0laN0l5OEg3RlhFTVlmUmhMakhjWTJyb0JyN3ZMUllk?=
 =?gb2312?B?K0dBalZLSHdlVXJqY0RtNFg3MmExcXdhckd0K1FHZlpnejM3SjlWdGdRRVlP?=
 =?gb2312?B?aGdKUTBabjRNNjRqNGJjR0hzYkhpZ2RCVUsxajUzZEJhL1JFb3FhOFp6Y2Nt?=
 =?gb2312?B?TTVTT1JYdzNOa2loQU02SEJ0d294WTlZQ3ZraTdtZEpoMXh6UWZXcU9aNkNn?=
 =?gb2312?Q?tD54XyUOCxP7nsjm4o=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa1bc0b-03c5-438e-339d-08d94a643df9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 03:21:04.5268 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u8DGceR5KFCvJLJ0/P6CTK3H39lIngx4o5HHb2iMDkgmdD5ZhIOoo2cl6WvR71KNH641P0coY3Swb4/RhZG5pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7650
Received-SPF: pass client-ip=68.232.156.107;
 envelope-from=lizhijian@fujitsu.com; helo=esa15.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, CHARSET_FARAWAY_HEADER=3.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_PASS=-0.001,
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dGhlcmUgd2FzIGEgdHlwbzogIHMvcHJvdG9jYWwvcHJvdG9jb2wNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0Kt6K8/sjLOiBMaSBaaGlqaWFuIDxsaXpoaWppYW5A
Y24uZnVqaXRzdS5jb20+DQq3osvNyrG85DogMjAyMcTqN9TCMTbI1SAxNTo1OQ0KytW8/sjLOiBx
dWludGVsYUByZWRoYXQuY29tOyBkZ2lsYmVydEByZWRoYXQuY29tDQqzrcvNOiBxZW11LWRldmVs
QG5vbmdudS5vcmc7IExpLCBaaGlqaWFuL8DuINbHvOENCtb3zOI6IFtQQVRDSCAyLzJdIG1pZ3Jh
dGlvbjogYWxsb3cgZW5hYmxpbmcgbXV0aWxmZCBmb3Igc3BlY2lmaWMgcHJvdG9jb2wgb25seQ0K
DQpBbmQgY2hhbmdlIHRoZSBkZWZhdWx0IHRvIHRydWUgc28gdGhhdCAnLWluY29taW5nIGRlZmVy
JyBjYW4gZW5hYmxlDQptdWx0aWZkIGZpcnN0Lg0KDQpTaWduZWQtb2ZmLWJ5OiBMaSBaaGlqaWFu
IDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQotLS0NCiBtaWdyYXRpb24vbWlncmF0aW9uLmMg
fCA4ICsrKysrKysrDQogbWlncmF0aW9uL211bHRpZmQuYyAgIHwgMiArLQ0KIDIgZmlsZXMgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9taWdy
YXRpb24vbWlncmF0aW9uLmMgYi9taWdyYXRpb24vbWlncmF0aW9uLmMNCmluZGV4IGQ2ZDQ4ZjY5
OTliLi5iY2M4YjNiY2I5MiAxMDA2NDQNCi0tLSBhL21pZ3JhdGlvbi9taWdyYXRpb24uYw0KKysr
IGIvbWlncmF0aW9uL21pZ3JhdGlvbi5jDQpAQCAtMTI0OSw2ICsxMjQ5LDE0IEBAIHN0YXRpYyBi
b29sIG1pZ3JhdGVfY2Fwc19jaGVjayhib29sICpjYXBfbGlzdCwNCiAgICAgICAgIH0NCiAgICAg
fQ0KDQorICAgIC8qIGluY29taW5nIHNpZGUgb25seSAqLw0KKyAgICBpZiAocnVuc3RhdGVfY2hl
Y2soUlVOX1NUQVRFX0lOTUlHUkFURSkgJiYNCisgICAgICAgICFtaWdyYXRlX211bHRpZmRfaXNf
YWxsb3dlZCgpICYmDQorICAgICAgICBjYXBfbGlzdFtNSUdSQVRJT05fQ0FQQUJJTElUWV9NVUxU
SUZEXSkgew0KKyAgICAgICAgZXJyb3Jfc2V0ZyhlcnJwLCAibXVsdGlmZCBpcyBub3Qgc3VwcG9y
dGVkIGJ5IGN1cnJlbnQgcHJvdG9jb2wiKTsNCisgICAgICAgIHJldHVybiBmYWxzZTsNCisgICAg
fQ0KKw0KICAgICByZXR1cm4gdHJ1ZTsNCiB9DQoNCmRpZmYgLS1naXQgYS9taWdyYXRpb24vbXVs
dGlmZC5jIGIvbWlncmF0aW9uL211bHRpZmQuYw0KaW5kZXggYjNkOTljNzlkODMuLjM3MmYzNjMz
ZWRhIDEwMDY0NA0KLS0tIGEvbWlncmF0aW9uL211bHRpZmQuYw0KKysrIGIvbWlncmF0aW9uL211
bHRpZmQuYw0KQEAgLTg2NCw3ICs4NjQsNyBAQCBjbGVhbnVwOg0KICAgICBtdWx0aWZkX25ld19z
ZW5kX2NoYW5uZWxfY2xlYW51cChwLCBzaW9jLCBsb2NhbF9lcnIpOw0KIH0NCg0KLXN0YXRpYyBi
b29sIG1pZ3JhdGVfYWxsb3dfbXVsdGlmZDsNCitzdGF0aWMgYm9vbCBtaWdyYXRlX2FsbG93X211
bHRpZmQgPSB0cnVlOw0KIHZvaWQgbWlncmF0ZV9wcm90b2NhbF9hbGxvd19tdWx0aWZkKGJvb2wg
YWxsb3cpDQogew0KICAgICBtaWdyYXRlX2FsbG93X211bHRpZmQgPSBhbGxvdzsNCi0tDQoyLjMx
LjENCg0K

