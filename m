Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866C53F4328
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 03:43:00 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHyzL-0000wx-Bl
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 21:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mHyxe-00009D-LT
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:41:16 -0400
Received: from esa8.fujitsucc.c3s2.iphmx.com ([68.232.159.88]:15528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lizhijian@fujitsu.com>)
 id 1mHyxa-0004TL-F5
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 21:41:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629682871; x=1661218871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Af8KZy+izZkyg6g8+5GFeIcCIBaTCpwe97KaDEIGV5c=;
 b=hVsvGtwQw43CrJ2haaIhLWSo5xJkS+/IdQPnNcUMS4vIh+8XCrTiX2o5
 p7W2qwxB2XmqMiBpVClxU/LVVOpu4YMK0WgkfITcJ2JGd0Ee/gu2OYmNu
 Et9ZK2MDYq2z2jtpno2eQx2q9rICKreiTk/j0DZM/DH9/zKJpzLThXzgu
 +S4y6fELUoog1edLTi3o5D0r/P2eDsgh+4+Fj8yXMu7wO+wkyZ0e2p1pa
 im9/HxbMctcTSboVyGrJXSGo1dVDttQJ9r+VbAT374jegPO8s1o/Kfemn
 a6a0XJBIMqEIVp3zfhdm0YgR4u5OI+KgPVWUB3RGwY+jBDelrszzxMmYt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10084"; a="37300485"
X-IronPort-AV: E=Sophos;i="5.84,343,1620658800"; d="scan'208";a="37300485"
Received: from mail-os2jpn01lp2056.outbound.protection.outlook.com (HELO
 JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2021 10:41:07 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E1tV3NFAidgZ1qJETJ1G9yWJcHbZedlp+lyPaR/QjtjWuj8AcuEI4WmuINWhUlV9hW9UyZG3u3ZDtEGxBKEXxKeUdioNkUuJgaD9utVqVFppXlsg74f3Od4rDdFF1XJpRjHxkcMRdbczM15wYDjGaULebQfJgxnSOCO2SL7bRFkvaQx08mtb7ynuulJOPwV390tnnu8eDaPn6SmnSM6q+r8pKIt55enqrcHRd6Qye4Idbzb5+rOjYEtLxUo0y8DhWgULqlinT+YCQ9unAetSrtYwtc82uCnSdl+2B+iHtDyATVlZw8LKoJIcJhRDy9PB1rgKDHqQkAkwRWRO1nEplw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af8KZy+izZkyg6g8+5GFeIcCIBaTCpwe97KaDEIGV5c=;
 b=RwNGKoG+z+GpNkNms5zJ78exgcutbxbp5j2AQFN2TlbrcuLzcui6giFnZ/0QnpspeLVOjddsJ0Mx9TQSp6lpfgg36fgsDEO8f/5AmAwYauTWOaDtHmJB/fA4Xv/akAeNSbPfieAsc6nFV4R2UYuCxGk3NWz4sns+AkCWLboC247oRiU8mZtOjXSFQjtnDqAMqyqrXW6oUtVFbhWsFZW+y2ZYLvt6tTc4j66H3j8jwmvLuevPyWnEUUZDM/t08AHU/rNHRoFG0Jc49T6VyIE89KLAX4Rvv+BRl5VkOfpwNgVzX0DnDdT/dzEigP5vGAJKvhEagAu/2m7GVmxMr6O8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Af8KZy+izZkyg6g8+5GFeIcCIBaTCpwe97KaDEIGV5c=;
 b=XIT2w8LVTaGuZK2/EealcsllrM72Asq0pPX447FiBwoGLhAcEp9RuuHpxIxs+2MX6N9OBOO7dDzxtM+KxBmstCB3nZ06sTi3+uQ3DYP344uL8hhAcT/U6fdZR/VtXMxAtZz836UluCOOxlg594qgdlU4+FJSmu/x0cP0FpGMn+U=
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com (2603:1096:604:14f::5)
 by OSZPR01MB7889.jpnprd01.prod.outlook.com (2603:1096:604:1b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Mon, 23 Aug
 2021 01:41:02 +0000
Received: from OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634]) by OS3PR01MB7650.jpnprd01.prod.outlook.com
 ([fe80::d0b3:dccf:a218:f634%6]) with mapi id 15.20.4415.024; Mon, 23 Aug 2021
 01:41:02 +0000
From: "lizhijian@fujitsu.com" <lizhijian@fujitsu.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "lizhijian@fujitsu.com"
 <lizhijian@fujitsu.com>
Subject: Re: [PATCH 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
Thread-Topic: [PATCH 1/2] migration/rdma: Try to register On-Demand Paging
 memory region
Thread-Index: AQHXhhQ2edRdUl4zrEa8hYQHW0TX+qt/Wg8AgAEZFoA=
Date: Mon, 23 Aug 2021 01:41:02 +0000
Message-ID: <7ee884ab-3927-79c2-dd5b-4f805442d118@fujitsu.com>
References: <20210731140332.8701-1-lizhijian@cn.fujitsu.com>
 <20210731140332.8701-2-lizhijian@cn.fujitsu.com>
 <CAC_L=vUJnyT+Z_NpgocM3HNOuU0G6HvVB5LXFXN0=yajUrVXYg@mail.gmail.com>
In-Reply-To: <CAC_L=vUJnyT+Z_NpgocM3HNOuU0G6HvVB5LXFXN0=yajUrVXYg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2a852676-c125-4f54-86e4-08d965d710f8
x-ms-traffictypediagnostic: OSZPR01MB7889:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSZPR01MB7889EF948503D1551361A6DAA5C49@OSZPR01MB7889.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QrnfBuiXBoJ1QMyi2jkJub5/9TVN58BP1qgcA37/WhxVcLA6Vcm76wxlI+EUuxtVYkm9hhbNkFnkqtUnY4iJvPn3xL9qbLD1ugURiP0yBiTh84dGfJ/x/BwqNESiNBT6lDk+85zgxbELK/1uNk2GIKAhG2wHeRMB02eHvyhHXa5Ln+9CV7DcrIbkF4eF8lFKhlQpcYoXixnxPwXH4LKg3Ny/y9I5VBzs2JXN03tMoeKHoOE5n6JST7UGWzJQ83xWWYhM1WUKfAs+dKHgPvP9Bux9tkcQOmXIxLEtUPuIqLS/FXM2hrz05fzpqutr120niJamHis9bj3zJ8vtkNiHC2zIpqjamOdF6CXN1b7Jl57DTDF6Am4rynobVE56LnXdojKoW9UaYr1eZ6rcOgitlRnuIYNGT85yDRPx5uKZggHz554xUSD2ei3sWBPog5n1LX/+S0HIx55wceraMXTvDqozIazghr8wT2BCmqEJaKHAs6JXqc6+U1UMXiNJUcFko4K7PJEmm3LXiehpmaqqZwtOJbcO26Z7i6PSExjqJrHQ58HGJrujFa9L3DZynphZLqNVvig/mH7nsHzvwco0wN66VOKXavcIZ3WeT8OxrWqMLJYQ3R8OodOcdKkjrwVppJeBfS6JqFBccibYzhFPR2lPZS+WlvGSyoXzdvIST3nMPdyXtndujUHFgiAEOWyDKkr5svfsvmOhv5dazoBStvAA2r/OzuyJYUpCzRImA9TwGDsyG2mqq1BfYYJkapkpS/NDgKmTOkkpyL5txn9RXXCjoTDn94FcOpVocCx0mOYLirRw+qXPPA+Jv3lf6lwfd51WOSAJeQVptXS0iS2d5LEMJAmJwq04XAPNIMpL5ro=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB7650.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(346002)(366004)(376002)(136003)(26005)(186003)(86362001)(6506007)(83380400001)(53546011)(2906002)(2616005)(4326008)(85182001)(64756008)(31686004)(31696002)(36756003)(71200400001)(8936002)(66556008)(6512007)(8676002)(66476007)(76116006)(91956017)(5660300002)(66946007)(66446008)(6486002)(316002)(478600001)(966005)(110136005)(54906003)(38100700002)(122000001)(38070700005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WjBYRmI3eE54VlZ3MGppcmVaNmJiN0pCeDJPaGJDK1F3ZkI1VWZYeC9jeThp?=
 =?utf-8?B?UmkrMjE1Q2lvWVVEOHZrV3kycVZ1Zzg4OXdLWjB5a2xMZGNXek5nbDhTRXNi?=
 =?utf-8?B?VDRsNWZMcmxqR3ZKa3h2UEVVVm5lcFBmb3BBM01BOFBHNlY3MFhKcnBHTXNC?=
 =?utf-8?B?cGYxYjQrNGpjdHFsQmZQTjZLNEVZSFFONTlzK3VISFoxT1NYQzNjOTBvaU5u?=
 =?utf-8?B?ZUJxRzByMVQvOGV0cUNEZ0NzVGJCZ2VXckdDL3FBYTNvZnN1TEZqVXhLQVBk?=
 =?utf-8?B?eXVGNmE1SWFOa0ZIelVPc25OeUVxR2NPUWowY0RWekpQcEx1UFF5a2dhZ2tx?=
 =?utf-8?B?bWRpV3FEem9mUFYvS3BEaVVDMDZiK2FFVjdPc2RIN0ZWVUhmZFZ1alZPWGlu?=
 =?utf-8?B?ZXozcHQ5TE1oUFFFUEZSQy96K2QwVVl3MjRGeXd4ZFFWV3dpa1Rya0J5MFhV?=
 =?utf-8?B?SzJFampHTnJDYzhVOTlGblpyNTBONWZ4SWZMNVBnWTdOUGI1c1B5aGtwbU1s?=
 =?utf-8?B?ajJERmducVlUY0dEQ09lMHMxWE1pcDZFVU92dVdmd0N0VUU2Z25BckFlZ0tr?=
 =?utf-8?B?VGNCWUdEdXhhaElhR1JodjhLZnpQc1JBaUdOV290NXl6Yjg1QkZveG5PNW9i?=
 =?utf-8?B?VlMyQk1iMmZnYngzRW5lSkxPU3Q2MTBZYkJNWmtyOVVIZVdzSC9MZ1dISEZr?=
 =?utf-8?B?TFZXbHcvZkdiOWErSGtSY2VrL0Q3TlZwRG5uK1ZBMW1hWEJvRFdRblRVenYv?=
 =?utf-8?B?WHVGcXk5K2lUaDVtQmlOeEtsS1kybzMyV0ZIdUNKNUs4U2pCZGlPRGs3aEZV?=
 =?utf-8?B?dkI3VlVNc1VId0krNDhDUVNoZWtSWnhrcnp6cjBVTHR3S3F3SHgzUC9DL0Js?=
 =?utf-8?B?SFFieGxkUjJWMlFTcjcydGxwY3FEeGFoVHVMSlZ3TDMxYjRBQW1WeXFGUWVO?=
 =?utf-8?B?ZnVrY24zK3lHbkN4RWMrUXVSamtJb3RpdlJKN3VvRVVrUGR5a29vcHFuZFd3?=
 =?utf-8?B?ZWM4ZUFLUmVCZDlaSFBmUTEwZXY4UnQ5N3BaVEMyNEJJdk1JQ3hTMmkvUmgr?=
 =?utf-8?B?MHJQRm9HWmRSeEg3SzIrTUVCM1Zqam1oZzR6eFp0dGU0OUw1L1NCK2REMkRU?=
 =?utf-8?B?RnhnYzNTdmNGbzkyMGZPamQxY1BzN0JjN3EvWHIxOWtFcVU5Z3BlM2h4Z2hj?=
 =?utf-8?B?UGdwaG9KLy81VHZrODR0QlpFOGVjdmljNDZNeDl2SGlmMkM3cFh2SWYwUVc0?=
 =?utf-8?B?L2wvekZBdG45S09PemJkSlJ6MTZTNzRLRUFRVzNZdzQwU1A3SldqUTJodkRW?=
 =?utf-8?B?V0JJaUlMQkNHamErVk90eDlGZ0RZS3JWdFZ4UEVmSFluYzhhbDMzQjVZRlAv?=
 =?utf-8?B?TGNISFgwTGlZNFY5c241dHEwQzBKR0FlY1VwbThIUWdjV3FLTnlDdEtnWnk3?=
 =?utf-8?B?ZFRTaTJHSWdxN3lkYzc2M1BIKy9RZUdvVlByY2FzQ2hwLzZ4SC9lYnptQkRp?=
 =?utf-8?B?YlpQZ2pldTNGS1pSQnlEOHU2R2ZmOTZJdFdkY2Z3cWQyS0NDTDFQVmFwWHd2?=
 =?utf-8?B?ek9hYjlJakc3czNtWEdRbm9sSWlwa0NDZ3hTRVBrV0ZNeW5oQllMQWdIV25F?=
 =?utf-8?B?bUR0TEgweHIwRU5NdWhwWmdKUFc3M1IvcEtKd1RwR1FYK25Dd2NaUFdhZmdJ?=
 =?utf-8?B?UXM2S09TSk1rOSsrMjAxVDlKMG1ZMGdTTmd0UXJvZHlDVm5ta1lpVFF0dWNM?=
 =?utf-8?B?UnpKVXRMMmlqQjc4MitHZDQvRGViMGliZW1UU2ZUZXlHZm9mZGx6Zy9FM3cw?=
 =?utf-8?B?U2ZWamVCaXEyTi9TcGU2QT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A7169F001954E842A7B780E8A3AC441D@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB7650.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a852676-c125-4f54-86e4-08d965d710f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2021 01:41:02.5338 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JHMcXLJDGfK2aN0mQRhhCKhFrF9A2obXdqfyLtYDukBWXK4irKWCqyPzuH0jPFSYCACmI1eEmQZgChCi8MUggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7889
Received-SPF: pass client-ip=68.232.159.88; envelope-from=lizhijian@fujitsu.com;
 helo=esa8.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
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
Cc: qemu devel list <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

DQoNCk9uIDIyLzA4LzIwMjEgMTY6NTMsIE1hcmNlbCBBcGZlbGJhdW0gd3JvdGU6DQo+IEhpDQo+
DQo+IE9uIFNhdCwgSnVsIDMxLCAyMDIxIGF0IDU6MDAgUE0gTGkgWmhpamlhbiA8bGl6aGlqaWFu
QGNuLmZ1aml0c3UuY29tPiB3cm90ZToNCj4+IFByZXZpb3VzbHksIGZvciB0aGUgZnNkYXggbWVt
LWJhY2tlbmQtZmlsZSwgaXQgd2lsbCByZWdpc3RlciBmYWlsZWQgd2l0aA0KPj4gT3BlcmF0aW9u
IG5vdCBzdXBwb3J0ZWQuIEluIHRoaXMgY2FzZSwgd2UgY2FuIHRyeSB0byByZWdpc3RlciBpdCB3
aXRoDQo+PiBPbi1EZW1hbmQgUGFnaW5nWzFdIGxpa2Ugd2hhdCBycG1hX21yX3JlZygpIGRvZXMg
b24gcnBtYVsyXS4NCj4+DQo+PiBbMV06IGh0dHBzOi8vY29tbXVuaXR5Lm1lbGxhbm94LmNvbS9z
L2FydGljbGUvdW5kZXJzdGFuZGluZy1vbi1kZW1hbmQtcGFnaW5nLS1vZHAteA0KPj4gWzJdOiBo
dHRwOi8vcG1lbS5pby9ycG1hL21hbnBhZ2VzL3YwLjkuMC9ycG1hX21yX3JlZy4zDQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBMaSBaaGlqaWFuIDxsaXpoaWppYW5AY24uZnVqaXRzdS5jb20+DQo+PiAtLS0N
Cj4+ICAgbWlncmF0aW9uL3JkbWEuYyAgICAgICB8IDI3ICsrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLQ0KPj4gICBtaWdyYXRpb24vdHJhY2UtZXZlbnRzIHwgIDEgKw0KPj4gICAyIGZpbGVzIGNo
YW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL21pZ3JhdGlvbi9yZG1hLmMgYi9taWdyYXRpb24vcmRtYS5jDQo+PiBpbmRleCA1YzJkMTEz
YWE5NC4uODc4NGI1ZjIyYTYgMTAwNjQ0DQo+PiAtLS0gYS9taWdyYXRpb24vcmRtYS5jDQo+PiAr
KysgYi9taWdyYXRpb24vcmRtYS5jDQo+PiBAQCAtMTEyMywxNSArMTEyMywyMSBAQCBzdGF0aWMg
aW50IHFlbXVfcmRtYV9yZWdfd2hvbGVfcmFtX2Jsb2NrcyhSRE1BQ29udGV4dCAqcmRtYSkNCj4+
ICAgICAgIFJETUFMb2NhbEJsb2NrcyAqbG9jYWwgPSAmcmRtYS0+bG9jYWxfcmFtX2Jsb2NrczsN
Cj4+DQo+PiAgICAgICBmb3IgKGkgPSAwOyBpIDwgbG9jYWwtPm5iX2Jsb2NrczsgaSsrKSB7DQo+
PiArICAgICAgICBpbnQgYWNjZXNzID0gSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8IElCVl9BQ0NF
U1NfUkVNT1RFX1dSSVRFOw0KPj4gKw0KPj4gK29uX2RlbWFuZDoNCj4+ICAgICAgICAgICBsb2Nh
bC0+YmxvY2tbaV0ubXIgPQ0KPj4gICAgICAgICAgICAgICBpYnZfcmVnX21yKHJkbWEtPnBkLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgIGxvY2FsLT5ibG9ja1tpXS5sb2NhbF9ob3N0X2FkZHIs
DQo+PiAtICAgICAgICAgICAgICAgICAgICBsb2NhbC0+YmxvY2tbaV0ubGVuZ3RoLA0KPj4gLSAg
ICAgICAgICAgICAgICAgICAgSUJWX0FDQ0VTU19MT0NBTF9XUklURSB8DQo+PiAtICAgICAgICAg
ICAgICAgICAgICBJQlZfQUNDRVNTX1JFTU9URV9XUklURQ0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgbG9jYWwtPmJsb2NrW2ldLmxlbmd0aCwgYWNjZXNzDQo+PiAgICAgICAgICAgICAgICAgICAg
ICAgKTsNCj4+ICAgICAgICAgICBpZiAoIWxvY2FsLT5ibG9ja1tpXS5tcikgew0KPj4gLSAgICAg
ICAgICAgIHBlcnJvcigiRmFpbGVkIHRvIHJlZ2lzdGVyIGxvY2FsIGRlc3QgcmFtIGJsb2NrISIp
Ow0KPj4gKyAgICAgICAgICAgIGlmICghKGFjY2VzcyAmIElCVl9BQ0NFU1NfT05fREVNQU5EKSAm
JiBlcnJubyA9PSBFTk9UU1VQKSB7DQo+PiArICAgICAgICAgICAgICAgIGFjY2VzcyB8PSBJQlZf
QUNDRVNTX09OX0RFTUFORDsNCj4+ICsgICAgICAgICAgICAgICAgdHJhY2VfcWVtdV9yZG1hX3Jl
Z2lzdGVyX29kcF9tcihsb2NhbC0+YmxvY2tbaV0uYmxvY2tfbmFtZSk7DQo+PiArICAgICAgICAg
ICAgICAgIGdvdG8gb25fZGVtYW5kOw0KPiBXb3VsZG4ndCBpdCBiZSBiZXR0ZXIgdG8gY2hlY2sg
Zmlyc3QgaWYgdGhlIGRldmljZSBzdXBwb3J0cyBPRFAgPw0KPiBTb21ldGhpbmcgbGlrZToNCj4g
ICAgICByZXQgPSBpYnZfZXhwX3F1ZXJ5X2RldmljZShjb250ZXh0LCAmZGF0dHIpOw0KPiAgICAg
IGlmIChkYXR0ci5leHBfZGV2aWNlX2NhcF9mbGFncyAmIElCVl9FWFBfREVWSUNFX09EUCkuLi4N
Cg0KR29vZCBpZGVhICENCg0KDQoNCj4NCj4gQWxzbywgSSAgYW0gbm90IChwZXJzb25hbGx5KSB0
b28gZm9uZCBvZiB0aGUgIm9uX2RlbWFuZCIgbGFiZWwgdXNhZ2UgaGVyZSwNCj4gaG93ZXZlciBJ
IHdpbGwgbGV0IHRoZSBtYWludGFpbmVyL290aGVycyBkZWNpZGUuDQpJbmRlZWQsIGhvdyBqdXN0
IHJlcGVhdGluZyB0aGUgaWJ2X3JlZ19tcigpIGluc3RlYWQgb2YgYSAnZ28gdG8nDQoNClRoYW5r
cw0KWmhpamlhbg0KDQoNCg0KPg0KPiBUaGFua3MsDQo+IE1hcmNlbA0KPg0KPj4gKyAgICAgICAg
ICAgIH0NCj4+ICsgICAgICAgICAgICBwZXJyb3IoIkZhaWxlZCB0byByZWdpc3RlciBsb2NhbCBk
ZXN0IHJhbSBibG9jayFcbiIpOw0KPj4gICAgICAgICAgICAgICBicmVhazsNCj4+ICAgICAgICAg
ICB9DQo+PiAgICAgICAgICAgcmRtYS0+dG90YWxfcmVnaXN0cmF0aW9ucysrOw0KPj4gQEAgLTEy
MTUsMTUgKzEyMjEsMTggQEAgc3RhdGljIGludCBxZW11X3JkbWFfcmVnaXN0ZXJfYW5kX2dldF9r
ZXlzKFJETUFDb250ZXh0ICpyZG1hLA0KPj4gICAgICAgICovDQo+PiAgICAgICBpZiAoIWJsb2Nr
LT5wbXJbY2h1bmtdKSB7DQo+PiAgICAgICAgICAgdWludDY0X3QgbGVuID0gY2h1bmtfZW5kIC0g
Y2h1bmtfc3RhcnQ7DQo+PiArICAgICAgICBpbnQgYWNjZXNzID0gcmtleSA/IElCVl9BQ0NFU1Nf
TE9DQUxfV1JJVEUgfCBJQlZfQUNDRVNTX1JFTU9URV9XUklURSA6IDA7DQo+Pg0KPj4gICAgICAg
ICAgIHRyYWNlX3FlbXVfcmRtYV9yZWdpc3Rlcl9hbmRfZ2V0X2tleXMobGVuLCBjaHVua19zdGFy
dCk7DQo+Pg0KPj4gLSAgICAgICAgYmxvY2stPnBtcltjaHVua10gPSBpYnZfcmVnX21yKHJkbWEt
PnBkLA0KPj4gLSAgICAgICAgICAgICAgICBjaHVua19zdGFydCwgbGVuLA0KPj4gLSAgICAgICAg
ICAgICAgICAocmtleSA/IChJQlZfQUNDRVNTX0xPQ0FMX1dSSVRFIHwNCj4+IC0gICAgICAgICAg
ICAgICAgICAgICAgICBJQlZfQUNDRVNTX1JFTU9URV9XUklURSkgOiAwKSk7DQo+PiAtDQo+PiAr
b25fZGVtYW5kOg0KPj4gKyAgICAgICAgYmxvY2stPnBtcltjaHVua10gPSBpYnZfcmVnX21yKHJk
bWEtPnBkLCBjaHVua19zdGFydCwgbGVuLCBhY2Nlc3MpOw0KPj4gICAgICAgICAgIGlmICghYmxv
Y2stPnBtcltjaHVua10pIHsNCj4+ICsgICAgICAgICAgICBpZiAoIShhY2Nlc3MgJiBJQlZfQUND
RVNTX09OX0RFTUFORCkgJiYgZXJybm8gPT0gRU5PVFNVUCkgew0KPj4gKyAgICAgICAgICAgICAg
ICBhY2Nlc3MgfD0gSUJWX0FDQ0VTU19PTl9ERU1BTkQ7DQo+PiArICAgICAgICAgICAgICAgIHRy
YWNlX3FlbXVfcmRtYV9yZWdpc3Rlcl9vZHBfbXIoYmxvY2stPmJsb2NrX25hbWUpOw0KPj4gKyAg
ICAgICAgICAgICAgICBnb3RvIG9uX2RlbWFuZDsNCj4+ICsgICAgICAgICAgICB9DQo+PiAgICAg
ICAgICAgICAgIHBlcnJvcigiRmFpbGVkIHRvIHJlZ2lzdGVyIGNodW5rISIpOw0KPj4gICAgICAg
ICAgICAgICBmcHJpbnRmKHN0ZGVyciwgIkNodW5rIGRldGFpbHM6IGJsb2NrOiAlZCBjaHVuayBp
bmRleCAlZCINCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICIgc3RhcnQgJSIgUFJJ
dVBUUiAiIGVuZCAlIiBQUkl1UFRSDQo+PiBkaWZmIC0tZ2l0IGEvbWlncmF0aW9uL3RyYWNlLWV2
ZW50cyBiL21pZ3JhdGlvbi90cmFjZS1ldmVudHMNCj4+IGluZGV4IGExYzBmMDM0YWI4Li41ZjZh
YTU4MGRlZiAxMDA2NDQNCj4+IC0tLSBhL21pZ3JhdGlvbi90cmFjZS1ldmVudHMNCj4+ICsrKyBi
L21pZ3JhdGlvbi90cmFjZS1ldmVudHMNCj4+IEBAIC0yMTIsNiArMjEyLDcgQEAgcWVtdV9yZG1h
X3BvbGxfd3JpdGUoY29uc3QgY2hhciAqY29tcHN0ciwgaW50NjRfdCBjb21wLCBpbnQgbGVmdCwg
dWludDY0X3QgYmxvY2sNCj4+ICAgcWVtdV9yZG1hX3BvbGxfb3RoZXIoY29uc3QgY2hhciAqY29t
cHN0ciwgaW50NjRfdCBjb21wLCBpbnQgbGVmdCkgIm90aGVyIGNvbXBsZXRpb24gJXMgKCUiIFBS
SWQ2NCAiKSByZWNlaXZlZCBsZWZ0ICVkIg0KPj4gICBxZW11X3JkbWFfcG9zdF9zZW5kX2NvbnRy
b2woY29uc3QgY2hhciAqZGVzYykgIkNPTlRST0w6IHNlbmRpbmcgJXMuLiINCj4+ICAgcWVtdV9y
ZG1hX3JlZ2lzdGVyX2FuZF9nZXRfa2V5cyh1aW50NjRfdCBsZW4sIHZvaWQgKnN0YXJ0KSAiUmVn
aXN0ZXJpbmcgJSIgUFJJdTY0ICIgYnl0ZXMgQCAlcCINCj4+ICtxZW11X3JkbWFfcmVnaXN0ZXJf
b2RwX21yKGNvbnN0IGNoYXIgKm5hbWUpICJUcnkgdG8gcmVnaXN0ZXIgT24tRGVtYW5kIFBhZ2lu
ZyBtZW1vcnkgcmVnaW9uOiAlcyINCj4+ICAgcWVtdV9yZG1hX3JlZ2lzdHJhdGlvbl9oYW5kbGVf
Y29tcHJlc3MoaW50NjRfdCBsZW5ndGgsIGludCBpbmRleCwgaW50NjRfdCBvZmZzZXQpICJaYXBw
aW5nIHplcm8gY2h1bms6ICUiIFBSSWQ2NCAiIGJ5dGVzLCBpbmRleCAlZCwgb2Zmc2V0ICUiIFBS
SWQ2NA0KPj4gICBxZW11X3JkbWFfcmVnaXN0cmF0aW9uX2hhbmRsZV9maW5pc2hlZCh2b2lkKSAi
Ig0KPj4gICBxZW11X3JkbWFfcmVnaXN0cmF0aW9uX2hhbmRsZV9yYW1fYmxvY2tzKHZvaWQpICIi
DQo+PiAtLQ0KPj4gMi4zMS4xDQo+Pg0KPj4NCj4+DQo+Pg0KPg0K

