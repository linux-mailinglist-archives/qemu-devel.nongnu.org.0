Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A253F46C5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 10:43:59 +0200 (CEST)
Received: from localhost ([::1]:48202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI5Yf-0001Gp-3e
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 04:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5WW-000085-Eu
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:41:40 -0400
Received: from esa2.fujitsucc.c3s2.iphmx.com ([68.232.152.246]:18502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mI5WT-00015L-Mm
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 04:41:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629708098; x=1661244098;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=NikwNUaOPv457spmSCx3nAVEjGlkX/giau/84AnfU5g=;
 b=NSWJ6skUJCMBpbauHi3Mh4uWD/nKsOuI2mEBh6AwYzO32nS6OqEuw41g
 DohpchmOi+TbGUrseA+2IcRtYdgfpek79CXVBa8Ql1i6c3kU8cAHJ1p+c
 YycSVqVc3M6saW9PDxwY2vD49L6pyq1zdf7DttFlH9ROBElLNGolvi5ma
 sQeYemSo8+JTGXjo7Zfe513Yec9btLm9Fzz8TXv5K3rIk952r1WiXHvbi
 2Z60uuqUS0GMgTqRYD2sYhmrt3124LJnoc4OuyrCi+6fHIo8g8L0n3K5d
 sq8pd2lBGefRM7iK5fFPlDr9P9i9v0hQe8O4ZZe4kTSKe5Peu8xwi3qUz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="45552694"
X-IronPort-AV: E=Sophos;i="5.84,344,1620658800"; d="scan'208";a="45552694"
Received: from mail-ty1jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 17:41:35 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKdMghICqY+zq/QKVZjl0nUMxrNAH8eCE0U3m7aqZVSF+I2EM7+jTulow3hPIz7CEoqbD72BHxnk7tGIL6RuaTkJdNO41+i2BT5IgEaJeQ7HQ9e1YGpwSd/0EwC162H3NSTUHWc28Cuq2YClUF4idgNTkI2q1n8ChPCUJ11TJK6/ukLlMHPEScgIvHM30nmzQEgZxjbNQqvm4GYuQdzh79fuLCLjqoH06vCJYP0uSkAhShUV0rqGF52MS+WMnH+Kp5xfEHfogFDXEq5/arX6xhjCZyIXX3YhiHLWk1AGK/Ny+E+wM24vh3G8fx7SucI9a3eCVCQGmibaMuEoZVeVgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NikwNUaOPv457spmSCx3nAVEjGlkX/giau/84AnfU5g=;
 b=CAlBZAjdva6iV5zjPN904TjRmWbSvl5TMUa/fWiWNHurw3gySWzTOiJ2v7xhqMT9ohPz5eEGfs9QiMofIvJ+igsxLSl432CVvnyHuoAjcmdZ7yjQJ60nkrlj7uAe7iwN+y00vc0jvhMrMNOGDFeyl51cjalvvglDeVpaHg0NiL8fDF82we5E9IMOgryKstUlRFmoY7ZB+4SrAbxqGfSZoe3Bbvqr+YoTU8Mlnwc8mmnBUSHCnZ4LeZaweh7TnM5ygoj1PvfIr+dTUUXUff/ZaKeN6QZDcyylU9YRksEaGelUNxlYi38BeJJ3yWh4c021PC4qHSARSxPDVf9/eVxWIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NikwNUaOPv457spmSCx3nAVEjGlkX/giau/84AnfU5g=;
 b=BdhsaHPFnO492zDGN/XPLRDRtzEWrAn5DciaDhCO5/GYE7EiIXabpkZZ1oWtWP5ARKNUhFI3fVX6jqIfb3exLPApNN0d3dGaK+qtgDUG3a5EIhUqkHY1T7y/2qMkAWg9Zwhfde53dAWAGnU5e0kcuKpQPJoo5/rSFbJxXDCtoc4=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OS3PR01MB7405.jpnprd01.prod.outlook.com (2603:1096:604:11f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 08:41:31 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 08:41:31 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>, "quintela@redhat.com"
 <quintela@redhat.com>, "dgilbert@redhat.com" <dgilbert@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v2 0/2] enable fsdax rdma migration
Thread-Topic: [PATCH v2 0/2] enable fsdax rdma migration
Thread-Index: AQHXl88Mx1JESMdxBU2uATfoT1XfYKuAxSyA
Date: Mon, 23 Aug 2021 08:41:31 +0000
Message-ID: <dfcfa096-080a-4bc1-7a16-ce783839c4b7@fujitsu.com>
References: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
In-Reply-To: <20210823033358.3002-1-lizhijian@cn.fujitsu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: fujitsu.com; dkim=none (message not signed)
 header.d=none;fujitsu.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 235dc9c8-1d05-4d1a-b590-08d96611cea7
x-ms-traffictypediagnostic: OS3PR01MB7405:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OS3PR01MB7405C427245F3EAEA98453BEA5C49@OS3PR01MB7405.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 93sbQIgotKDCu8XvnkNZUqmTPw9Bz7X7R3j1RtEefdMzsyAV2GKQ3ssq3vfDLV8bfFtlj+f30oUIfYa3dPmpC4Wf4chnk9pdkwFqdCEdAroEwiATaI3l/h1rFShO9Dn0Xs/EvvtjCRsrbgUevgXdCFjc2CPvZrdJ2ffhiDGnHB7KU53aXEZ7lq/ftA/gD0Yahk+kde2y9NKEXNcc63D1RPvK0n5GkzZPLU077Wo2KG4DOolG2K4V34Q1LOLq/UvD7v/+JpWm7lr1SuWQOhlpv4u2e2uTQbySfZ9c9uMGd4GX6JNO8ast9uTHHHKVFuYOoxXaW4vniDxl9RCdLI17Q4L+B3z8nwg3qMrs/NW8Yh2G35Spf50RZjXhSS0IL9l3FKKZUSYLyH3Chi1rlLxi39iqDiCFwoi32sPTvqtp9ZchXyToTyYuYZ2B8nJxOCCI1/LHmjEp6IS0wV2EMADC9UOWWo6/eSoHl+9ym3BP19/KbrnE6z7NyJ1hxWfnTrNOwdmCWi1YSr5k3lI5Y6jI7fuqGnVUiedDl3xFoarxzLmWLeD+a+gVZOUQsbK4DrAcgYSFk5hqL+F19EtuEr6S53fyZgBxDvi1QEchAvrB8qq9cQN934K2RjSOAEyMgDJh1dAsvPOYL+xriYzpgSDG/zEVjzCwOGLZ+uLKsQQc7dhGlt5GlpxJIy1ZE3vTRUP4bZiK946xS6AhQZAHHqMrCdaY0w3Izs+9hUiP+sR/an2+Sadm6tNH9lypfE6i2TQj6o7ai8CUlP5okSCyCy1vWA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(136003)(39860400002)(478600001)(31696002)(110136005)(31686004)(2906002)(316002)(38070700005)(86362001)(85182001)(4326008)(6506007)(2616005)(53546011)(38100700002)(122000001)(4744005)(5660300002)(66446008)(66476007)(8936002)(76116006)(6486002)(8676002)(91956017)(66946007)(6512007)(71200400001)(83380400001)(36756003)(64756008)(66556008)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dTA1STlUKytZTXZkZ2ZtOW1SWjd2Y1lwUUlnWWQrOUxoY0hhd2ZVZGhPeXZN?=
 =?utf-8?B?UG1pWFZKSTNMRXk2KzZyYmdGWWNVaG0vV0tOWXV2Ri94M0lTUGU2eDVaLzBI?=
 =?utf-8?B?V1ZEbFpoUjlWdmQ5TXUrR2RjaWVWS1hlamxHem55TWJVNXczN0RUQkZPSXU1?=
 =?utf-8?B?TU1VMzN1QzIrcjZVSnpVamdwUlVEKy9qcFJyQy9mTCtYak9wUFZ1TVZ6VUtq?=
 =?utf-8?B?SXFBS0MyVWk4RW4rcXdHOFR0d3NzbzdWQUlWOFlZSmtOYm82UVVJeDVhVE5i?=
 =?utf-8?B?OXIzWUZWQy9CUkwzRGdoR25RTksxZHJ3R0pRVVBZeEdreUpGRkh5RUp1Tmlh?=
 =?utf-8?B?M0hPUUhUSmNveXpGZ3J1a0N6S0VwUUJhek8rdTBId2dFblRDMzQrV3g1MWJO?=
 =?utf-8?B?d2szRDNPVXhTUGZhQ2VyRWhoV21HRWl1aEpBK3RSL1JNUlIwL0xVd0ljUWdx?=
 =?utf-8?B?cGRjZFFkWlZzdmNZejUrOE5lbWUyK1JhNG9XUnBheVJyMDFxamRkWjNNcEtK?=
 =?utf-8?B?eDJwcWY2ZiswT1JaOTNlZkQxazdBSUZjL1BKWVdEZSt0VWZmS1BMaUdNdHly?=
 =?utf-8?B?MmpEMUFzL0ZqdVI4dmU0NGZsNld6WkwweVh0d25kaGwxMXROb1ZWSVprQ1hk?=
 =?utf-8?B?anpteTFxYVZadXZIdkJDZEw0djFCUHN0ZCtCTEw0VkMyRkFWTlpyZjlpNlFm?=
 =?utf-8?B?Z3l4dGg0VGdMTW4xQmFxV3J1SU5YRVpUNkxYVWZudHNibFpZMXVjUllUcU9E?=
 =?utf-8?B?SWhYRkhtdFVSeGtEWXNqWkhxV1ljM1I5MDdYelhqTzA0QzBtUFVsMFVOSkdH?=
 =?utf-8?B?dGtnSXVkc1dWQUN1dTRaMDI5TEZWQU4wUVMzVmV4VGlBSnBXcllaWUZOb25o?=
 =?utf-8?B?RlhpYjVaMXArQUg4ZUhmRXdOMmQ2V01iTk9sWjdWZVR1U3JieGtBVEw1VzlS?=
 =?utf-8?B?OHcvWlhmM3lPeWE2dDA3MFJkTng1TU10dElrT3ExM2l0aU1qM0VydmU3ZVFH?=
 =?utf-8?B?QmtwNWtlTGhQNlVNYlZxdWY1L2lPcU9KQVdONlBlMmRBZWwrZEI5dXE4WlRv?=
 =?utf-8?B?WFFPUllDQy9Nd0R2dU41VGZvMldDdzY4OStwN1NySDU1TnZSMEpDVzZlS2JG?=
 =?utf-8?B?ZWtqNW5BQzdDS3ZWc1o1OEpNRkhZUTIrdERCeTY5M1pnSmQ1VlNucTBSUFZH?=
 =?utf-8?B?bDNvZExScjIySU5Lb2hLeE44SlY0bC9tbE9FTXpNYmlLSVkvVnRVVjF6M2xn?=
 =?utf-8?B?N1FER0Z2MkNqT0loTjZOeEg2eHdVRVNIYVowMTlTUXVJcnVZOS9SSGFxemdo?=
 =?utf-8?B?SUhkR1ZiTURyMTBmMTR4UXNNWmc0MmVZMisxcFU4R1BadDFJRlI0cWovSmNR?=
 =?utf-8?B?SjlKZlBSTEFrMXNmSzV3M0hYYzdjd2ROMGxMUTByRW5DQnBQcGVvaW5acFpU?=
 =?utf-8?B?eHBzcS9TZVNuemw5TTl4VW9sdHJoN0gzdkJQQlhoY05Jc3FDc3F0bDBud1Na?=
 =?utf-8?B?QmRFOTVlaE13OUpKQUtObW04U3YwWndpRGpKeTd2VGsrRkVSRlpubTJ4U1Ax?=
 =?utf-8?B?UFNXQnN6aC9kUmZjTmtSbTd0Zk9abDIrZ1hEanlKSjhqbmg5TXVBM2xCSkdY?=
 =?utf-8?B?bVFwY09NdUozblZyQU04LzloYS9nbjZJcWJXNGVpdUNIUWRUZElmSFMzT2l5?=
 =?utf-8?B?YWdWckFKZjZqdXlHRFdydGxjczdkTncvQkdTTnV0T2VudmNhaEtWNSsvTE5L?=
 =?utf-8?B?d2EvYk40YzQvcHk0Y3ovY3dDbVdYUm9qWEtlZzNxazlrU09FSEpEUFNhQ0Q1?=
 =?utf-8?B?eTBlNjZsOFduSlVBd0V6dz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <806DFE167704564FB6C92F14A9FC638A@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 235dc9c8-1d05-4d1a-b590-08d96611cea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 08:41:31.6573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n7dM9SwQOCAc0QjW7fngJ09NhfsFNfkoElESUffybcBF+5SvHzn/vMBuxnCt+sVfbiG27a0C1fb3UJatbT6IdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7405
Received-SPF: pass client-ip=68.232.152.246;
 envelope-from=lizhijian@fujitsu.com; helo=esa2.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

Q0NpbmfCoCBNYXJjZWwNCg0KDQpPbiAyMy8wOC8yMDIxIDExOjMzLCBMaSBaaGlqaWFuIHdyb3Rl
Og0KPiBQcmV2aW91cyBxZW11IGFyZSBmYWNpbmcgMiBwcm9ibGVtcyB3aGVuIG1pZ3JhdGluZyBh
IGZzZGF4IG1lbW9yeSBiYWNrZW5kIHdpdGgNCj4gUkRNQSBwcm90b2NvbC4NCj4gKDEpIGlidl9y
ZWdfbXIgZmFpbGVkIHdpdGggT3BlcmF0aW9uIG5vdCBzdXBwb3J0ZWQNCj4gKDIpIHJlcXVlc3Rl
cihzb3VyY2UpIHNpZGUgY291bGQgcmVjZWl2ZSBSTlIgTkFLLg0KPg0KPiBGb3IgdGhlICgxKSwg
d2UgY2FuIHRyeSB0byByZWdpc3RlciBtZW1vcnkgcmVnaW9uIHdpdGggT0RQIGZlYXR1cmUgd2hp
Y2gNCj4gaGFzIGFscmVhZHkgYmVlbiBpbXBsZW1lbnRlZCBpbiBzb21lIG1vZGVybiBIQ0EgaGFy
ZHdhcmUvZHJpdmVycy4NCj4gRm9yIHRoZSAoMiksIElCIHByb3ZpZGVzIGFkdmlzZSBBUEkgdG8g
cHJlZmV0Y2ggcGFnZXMgaW4gc3BlY2lmaWMgbWVtb3J5DQo+IHJlZ2lvbi4gSXQgY2FuIGhlbHAg
ZHJpdmVyIHJlZHVjZSB0aGUgcGFnZSBmYXVsdCBvbiByZXNwb25kZXIoZGVzdGluYXRpb24pDQo+
IHNpZGUgZHVyaW5nIFJETUFfV1JJVEUuDQo+DQo+IENDOiBtYXJjZWwuYXBmZWxiYXVtQGdtYWls
LmNvbQ0KPg0KPiBMaSBaaGlqaWFuICgyKToNCj4gICAgbWlncmF0aW9uL3JkbWE6IFRyeSB0byBy
ZWdpc3RlciBPbi1EZW1hbmQgUGFnaW5nIG1lbW9yeSByZWdpb24NCj4gICAgbWlncmF0aW9uL3Jk
bWE6IGFkdmlzZSBwcmVmZXRjaCB3cml0ZSBmb3IgT0RQIHJlZ2lvbg0KPg0KPiAgIG1pZ3JhdGlv
bi9yZG1hLmMgICAgICAgfCAxMTcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0NCj4gICBtaWdyYXRpb24vdHJhY2UtZXZlbnRzIHwgICAyICsNCj4gICAyIGZpbGVzIGNo
YW5nZWQsIDk4IGluc2VydGlvbnMoKyksIDIxIGRlbGV0aW9ucygtKQ0KPg0K

