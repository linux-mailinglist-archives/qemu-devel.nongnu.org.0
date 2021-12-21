Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B9F47C6FF
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 19:52:21 +0100 (CET)
Received: from localhost ([::1]:52248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzkFI-0007uz-DC
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 13:52:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzkBo-0007EP-QA
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 13:48:44 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:32254)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mzkBm-0006C3-4J
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 13:48:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640112522; x=1640717322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=xEgb9aNGfzpkksLmRXtei/42D8d6ouF/AYBNceWDaY4=;
 b=v7IZFlc7TNWGVS+DY+0bKY4jHC/HPbFb2KwJVMwPZ/2tFefKhhBncmrs
 Sf73mNYVcQe9YqeEn1yPdBsyt4a0uxTscGRFauzIoMBrzkKQN0HMQz7M6
 7Jw0XfB30klFt1VnUEJDFsRFClTcw8ehMYBE6Ds1QbH4XpTib8VmS+ANq w=;
Received: from mail-dm6nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2021 18:48:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCUg8DNajX1FKPFVLBoSTBAp+d8t8VFAdQdO+yRVnQK8m/+77ItMePVaEA4sb2IE7NgR+3J9uvx5diyL/F8NdbP1t5l9uozOheNLtihMUF74c754pUkzZRpHROvOm/yJrwYA0S1IJDP69dekVuvY8LLK6PXSy9fT+96U8kzR9HY2kr/+ZYEyrBBg3RLu+xp9YtDxvwC1g+UYxD+5SPSujUWnAKjO/gJIMl+KaeomesOMjnEVAg62f79QMV6Ehk92D8h2oVdyCfK58UeljYNe5ou0b14bTguhbfl/w52Ul+rfYReomtfHWQGVA+mXtASE/OXDaEvh8yeWN0WYw/TAXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEgb9aNGfzpkksLmRXtei/42D8d6ouF/AYBNceWDaY4=;
 b=llfc1JrkHQ1aZfq1pu78DayYkZv2UsdWi7JsLdMOzuPuBvGzOEAf+Lzks4aZqENmJFX4ySRm4hb3S2gPOMmBy26LVFItZVd+Is8lEfxjGHqZnQJx+XDgtu/2QoKmbLgUIHWoW9FzsivjCR+ZMJwhmSxXUKylOIdOiQLhkXNM3CzWEPZ198/kWK9WNRppGwDqlVoOLJDpylHY1lJs5eVYRt4pn+QTwvr4ghmpKW3fbW5MbMQNzjp27i8fakRM5L/8S/1sTiJEZZihIu67heNj5hsZEwdu/VZqAwnEFmHLXyiEsDfDp2J4hc6eEY8YUfI2zdgZIiZuplRdNb//aBYNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB5520.namprd02.prod.outlook.com
 (2603:10b6:805:e0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 18:48:20 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 18:48:20 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 09/13] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v7 09/13] target/hexagon: import lexer for idef-parser
Thread-Index: AQHX8yS9jeo2tYYF00ClcbQZsPiC8qw9OCcA
Date: Tue, 21 Dec 2021 18:48:20 +0000
Message-ID: <SN4PR0201MB88080CEA00266D6CD83A350EDE7C9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-10-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-10-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3db052bb-b4a2-48f5-25b2-08d9c4b275c8
x-ms-traffictypediagnostic: SN6PR02MB5520:EE_
x-microsoft-antispam-prvs: <SN6PR02MB5520B21D2D7F57836079955FDE7C9@SN6PR02MB5520.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ub4BQwIDMOlfmQZnMojshc/AgTdMgzu3f2xL0wsyysZQ6NOEzELjCIi4vx4JhRbOrXiwuwzcggFPFjGuYfD0xDedlfYi8lZ+3X6B+gE4354dI8CKFBPTDIyVYwOQ1lBFJ6uNBPVxGhKEnb6D2TgeX3od0lhDlS+oya2ov5dDpmpE2PmRykzU9iSE9ImAVB8Mq0ZXKy9d4fxIJJRJaSA+Myau+dGLWi+NO/0MZ3AEUDSQyaWuNjcXGqT90vc1QRcEhqODC0ZBlEtlYdYJs5kiacUEKg3lVsiB8hvGm0seKvA01cr0GT3VvBmI9ZHFx6UI5E8KoOQbo0QyyUTjOJElcZ9yt+m8xnDtXq822sL4ubZHTiufIBX18ijG6dhDJ5Gy6lPBRkF/zrYto3EzD71I8xSeoLgqCEkHWihFoPzDq+gBvSqu6BrBjtpch+Yn3ZMcEADd/qD6gRW1TTk3zPrAdQxG/0pOq0uk3KThJ12ifycLmCHFr9gJYOSzYF0mbgUji6GjNelFlBBUgA/gqIjyLIISBzD2WZRAkl2Lduend+uzVbvSqhalezKNXUDpwJBBiliKyzyYqhCLLPVTQIwUH6h7lyEyARpwxrfjvBby/lq5xgboy89O+3wD8o2PDvn+xO5RgPbWHoDbK1k6U+VntrpeDQeNwcCFLe8TK9Vy//vPd0uzofj16ieEkPCBHY0Gldda1PSL6UMyTQwS0RnEEA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(52536014)(99936003)(186003)(38070700005)(55016003)(8936002)(508600001)(66476007)(7696005)(76116006)(64756008)(54906003)(316002)(66946007)(66556008)(66446008)(110136005)(9686003)(122000001)(86362001)(38100700002)(8676002)(53546011)(6506007)(83380400001)(33656002)(5660300002)(26005)(71200400001)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?tpObEjUKFSV2ep2tyxKNnoJQIYqHggZo+12q96mvBrGMRG1nl4ey6IT1PBkD?=
 =?us-ascii?Q?hxdfOItyp0lS3Ny0M3PvzoAjdva/wS6QdYbUeLg22JHFmfQkO95sZ2afJ59z?=
 =?us-ascii?Q?SIKC8N3qwaolaiSGhI1H0CniyPQyvcECK47dx7cpkFdUwpjoyNMy3cfnCCva?=
 =?us-ascii?Q?/+/0xu/mMZotj0WVc/pgw2+AJHZMqC4MN6ShVMW12mmBFNHpXofzUXt7pXNE?=
 =?us-ascii?Q?hxOhtPqcPoEguIimmq76YZPxkH6hNaqk6E3SQiXRBDvPLKpYH+ikqD/ao9f8?=
 =?us-ascii?Q?MLhIriwcWrM8scMOh469dI+hiKdJ87Lt+DNLD9SuF+s1TVUdjJIfw+imIPeJ?=
 =?us-ascii?Q?LtG9w3XfAOQTthwpFr3BwMKngqw59F2QbeRiWC/NqR8UiW1yV326qXDMQi0b?=
 =?us-ascii?Q?SeeqaplLKUb2LYQ5dRHZzmF3WB2a4vMn6FXCGY+TPykAmj3E+4d+jBiJtlVv?=
 =?us-ascii?Q?eP9veCwQ3xZdu2CTl2ZngBeZNxW/yVap9srRZRGUTDhsNxhI3vHPtdsZ+8FX?=
 =?us-ascii?Q?qt1UylMGyUnv/RT6ISc3gb4gwIrzmOgrYBtxChqwRv4EjLpeRhqjnOKfIGOD?=
 =?us-ascii?Q?SdVAEKZUoCyNdKXyxAqb5NZGUbz7B8LGF/vwKOEfQhl2gjRzrxfYVJpadr/u?=
 =?us-ascii?Q?7zfwvW3xaaTbzN56V73sreDkm87OtJqH7vfBvRvfz2qY22uVIfWkTZJo3OI1?=
 =?us-ascii?Q?j+j2r7eBetcTsYGYuGcrio5xZi+vrvJGVhp4/Kl3THl/yN5673mHWY0+UT8D?=
 =?us-ascii?Q?Oh0ovu25ddc9Cw5/t03r6amdaaWBkcIdCk77UVSWepjsWSP8jozY45rCoTjC?=
 =?us-ascii?Q?bP0p5o2XzcMGndyGJb3SxpjE339e2UhnkuVnBg0cJmqf2DywfwY2r9zCmhgc?=
 =?us-ascii?Q?Gc/tHpo+ts/v6K8nKk1w5Cr1LY0hBMYyXYhubIMuzB9OeAKNJiY/roXzTifB?=
 =?us-ascii?Q?cJGOEcmOcQtdh2c77D9LUW2DimpnhsKsZd7yWxvdkIZ7t2OUuXVYD1uI0DLX?=
 =?us-ascii?Q?9lE+XdlwdCk4u3NPRNKph6PfSsOokCrIEEh5LlV2+mTo/uWY7xvLNAFpHDRB?=
 =?us-ascii?Q?WqHalwC8LVbxZmkOO4lRMMpIyBH2tYf9TYv8z/rPjwXiK6ATZhvD7bBgNtGc?=
 =?us-ascii?Q?0J6pVafA7PuanbQwIfcI5xuOApV7mxYOEGN1pX/Mq+P87Ke8RBh0TPEaN3fu?=
 =?us-ascii?Q?wQveBTae/0l4nk/0djnr5IjCADCa7eJzCmSyKibApQ+FwW9pV5yEebOlaUXP?=
 =?us-ascii?Q?z3dibyTo8XmqVrXse4wGo844KKmdE9DqqdyMKVOpjHgKDb16CK/1dNu3UwQ6?=
 =?us-ascii?Q?UmLiLZXyHyb/83ZBS+8uusE4yHuKQwI8VvcfxkToDi1y4nWJ4SbLvsCjtWnU?=
 =?us-ascii?Q?yuBeXKJ/WMHyi20TCv/YeRkUCGFPsjPgCxIaEgh/h3ut/Sfg8AQLXOSz0skT?=
 =?us-ascii?Q?GYHnTx5O4BPwE0QVk7KkOwr1MHuqx595nvdrTFPp+bmGQrF0bfwnIKJ7GDyJ?=
 =?us-ascii?Q?URv25t0mrLVUwkxYibhJBg6kYl94FHXqZWIjyh45+TIugbGo1MrgyNXykK8z?=
 =?us-ascii?Q?WyXBYB302WOdrLMkFG0RWSRFwnWwdZdlUW4/Bc7RGJquHGcxvBH2lkHJwqzu?=
 =?us-ascii?Q?4ptpChNUNzjOh4Zz4OJlosU=3D?=
Content-Type: multipart/mixed;
 boundary="_002_SN4PR0201MB88080CEA00266D6CD83A350EDE7C9SN4PR0201MB8808_"
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db052bb-b4a2-48f5-25b2-08d9c4b275c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 18:48:20.8128 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rbw1EDZT6XZYOXYyXO7e9/53olVhG6KLjO/skuXne1SbG/9M7voh4PkRID2al9+AMxtk65FrGAiM1KZlTYlFPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5520
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_002_SN4PR0201MB88080CEA00266D6CD83A350EDE7C9SN4PR0201MB8808_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Friday, December 17, 2021 2:01 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org
> Subject: [PATCH v7 09/13] target/hexagon: import lexer for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h   | 259 ++++++++++
>  target/hexagon/idef-parser/idef-parser.lex | 571
> +++++++++++++++++++++
>  target/hexagon/meson.build                 |   4 +
>  3 files changed, 834 insertions(+)
>  create mode 100644 target/hexagon/idef-parser/idef-parser.h
>  create mode 100644 target/hexagon/idef-parser/idef-parser.lex
>=20
> diff --git a/target/hexagon/idef-parser/idef-parser.lex
> b/target/hexagon/idef-parser/idef-parser.lex
> new file mode 100644
> index 0000000000..c7466c47f4
> --- /dev/null
> +++ b/target/hexagon/idef-parser/idef-parser.lex
> +"fSATN"                  { yylval->sat.set_overflow =3D true;
> +                           yylval->sat.signedness =3D SIGNED;
> +                           return SAT; }
> +"fVSATN"                 { yylval->sat.set_overflow =3D false;
> +                           yylval->sat.signedness =3D SIGNED;
> +                           return SAT; }
> +"fSATUN"                 { yylval->sat.set_overflow =3D false;

This should be true, just like fSATN.  Take a look at the satuh and satub i=
nstructions.

I tried changing it to true to make satuh and satub work.  However, the vad=
dubs, vadduhs, vsatub, vsatwuh, vsububs, and other instructions don't work.=
  I've attached a test case that demonstrates this problem.

When the value is set to false, the test case prints
ERROR at line 71: 0x00000000 !=3D 0x00000001
ERROR at line 75: 0x00000000 !=3D 0x00000001
ERROR at line 106: 0x00000000 !=3D 0x00000001
FAIL

When the value is set to true, the test case prints
ERROR at line 105: 0x000000000000007f !=3D 0x00000000000000ff
ERROR at line 106: 0x00000000 !=3D 0x00000001
FAIL

Without your changes, the test case prints
PASS



> +                           yylval->sat.signedness =3D UNSIGNED;
> +                           return SAT; }

--_002_SN4PR0201MB88080CEA00266D6CD83A350EDE7C9SN4PR0201MB8808_
Content-Type: text/plain; name="satub_vaddubs.c"
Content-Description: satub_vaddubs.c
Content-Disposition: attachment; filename="satub_vaddubs.c"; size=3070;
	creation-date="Tue, 21 Dec 2021 18:27:00 GMT";
	modification-date="Tue, 21 Dec 2021 18:27:00 GMT"
Content-Transfer-Encoding: base64

LyoKICogIENvcHlyaWdodChjKSAyMDE5LTIwMjEgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIs
IEluYy4gQWxsIFJpZ2h0cyBSZXNlcnZlZC4KICoKICogIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNv
ZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5CiAqICBpdCB1bmRl
ciB0aGUgdGVybXMgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFzIHB1Ymxpc2hl
ZCBieQogKiAgdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyIHZlcnNpb24gMiBv
ZiB0aGUgTGljZW5zZSwgb3IKICogIChhdCB5b3VyIG9wdGlvbikgYW55IGxhdGVyIHZlcnNpb24u
CiAqCiAqICBUaGlzIHByb2dyYW0gaXMgZGlzdHJpYnV0ZWQgaW4gdGhlIGhvcGUgdGhhdCBpdCB3
aWxsIGJlIHVzZWZ1bCwKICogIGJ1dCBXSVRIT1VUIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVu
IHRoZSBpbXBsaWVkIHdhcnJhbnR5IG9mCiAqICBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBG
T1IgQSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlCiAqICBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgogKgogKiAgWW91IHNob3VsZCBoYXZlIHJlY2VpdmVk
IGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UKICogIGFsb25nIHdpdGgg
dGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cDovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4u
CiAqLwoKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxzdGRpbnQuaD4KCmludCBlcnI7Cgpz
dGF0aWMgdm9pZCBfX2NoZWNrMzIoaW50IGxpbmUsIGludCB2YWwsIGludCBleHBlY3QpCnsKICAg
IGlmICh2YWwgIT0gZXhwZWN0KSB7CiAgICAgICAgcHJpbnRmKCJFUlJPUiBhdCBsaW5lICVkOiAw
eCUwOHggIT0gMHglMDh4XG4iLCBsaW5lLCB2YWwsIGV4cGVjdCk7CiAgICAgICAgZXJyKys7CiAg
ICB9Cn0KCiNkZWZpbmUgY2hlY2szMihSRVMsIEVYUCkgX19jaGVjazMyKF9fTElORV9fLCBSRVMs
IEVYUCkKCnN0YXRpYyB2b2lkIF9fY2hlY2s2NChpbnQgbGluZSwgbG9uZyBsb25nIHZhbCwgbG9u
ZyBsb25nIGV4cGVjdCkKewogICAgaWYgKHZhbCAhPSBleHBlY3QpIHsKICAgICAgICBwcmludGYo
IkVSUk9SIGF0IGxpbmUgJWQ6IDB4JTAxNmxseCAhPSAweCUwMTZsbHhcbiIsIGxpbmUsIHZhbCwg
ZXhwZWN0KTsKICAgICAgICBlcnIrKzsKICAgIH0KfQoKI2RlZmluZSBjaGVjazY0KFJFUywgRVhQ
KSBfX2NoZWNrNjQoX19MSU5FX18sIFJFUywgRVhQKQoKc3RhdGljIHVpbnQzMl90IHNhdHViKHVp
bnQzMl90IHNyYywgaW50ICpvdmZfcmVzdWx0KQp7CiAgICB1aW50MzJfdCByZXN1bHQ7CiAgICB1
aW50MzJfdCB1c3I7CgogICAgLyoKICAgICAqIFRoaXMgaW5zdHJ1Y3Rpb24gY2FuIHNldCBiaXQg
MCAoT1ZGL292ZXJmbG93KSBpbiB1c3IKICAgICAqIENsZWFyIHRoZSBiaXQgZmlyc3QsIHRoZW4g
cmV0dXJuIHRoYXQgYml0IHRvIHRoZSBjYWxsZXIKICAgICAqLwogICAgYXNtIHZvbGF0aWxlKCJy
MiA9IHVzclxuXHQiCiAgICAgICAgICAgICAgICAgInIyID0gY2xyYml0KHIyLCAjMClcblx0IiAg
ICAgICAgLyogY2xlYXIgb3ZlcmZsb3cgYml0ICovCiAgICAgICAgICAgICAgICAgInVzciA9IHIy
XG5cdCIKICAgICAgICAgICAgICAgICAiJTAgPSBzYXR1YiglMilcblx0IgogICAgICAgICAgICAg
ICAgICIlMSA9IHVzclxuXHQiCiAgICAgICAgICAgICAgICAgOiAiPXIiKHJlc3VsdCksICI9ciIo
dXNyKQogICAgICAgICAgICAgICAgIDogInIiKHNyYykKICAgICAgICAgICAgICAgICA6ICJyMiIs
ICJ1c3IiKTsKICAgICpvdmZfcmVzdWx0ID0gKHVzciAmIDEpOwogICAgcmV0dXJuIHJlc3VsdDsK
fQoKc3RhdGljIHZvaWQgdGVzdF9zYXR1Yih2b2lkKQp7CiAgICB1aW50MzJfdCByZXN1bHQ7CiAg
ICBpbnQgb3ZmX3Jlc3VsdDsKCiAgICByZXN1bHQgPSBzYXR1YigweGZmZiwgJm92Zl9yZXN1bHQp
OwogICAgY2hlY2szMihyZXN1bHQsIDB4ZmYpOwogICAgY2hlY2szMihvdmZfcmVzdWx0LCAxKTsK
CiAgICByZXN1bHQgPSBzYXR1YigtMSwgJm92Zl9yZXN1bHQpOwogICAgY2hlY2szMihyZXN1bHQs
IDApOwogICAgY2hlY2szMihvdmZfcmVzdWx0LCAxKTsKfQoKc3RhdGljIHVpbnQ2NF90IHZhZGR1
YnModWludDY0X3Qgc3JjMSwgdWludDY0X3Qgc3JjMiwgaW50ICpvdmZfcmVzdWx0KQp7CiAgICB1
aW50NjRfdCByZXN1bHQ7CiAgICB1aW50MzJfdCB1c3I7CgogICAgLyoKICAgICAqIFRoaXMgaW5z
dHJ1Y3Rpb24gY2FuIHNldCBiaXQgMCAoT1ZGL292ZXJmbG93KSBpbiB1c3IKICAgICAqIENsZWFy
IHRoZSBiaXQgZmlyc3QsIHRoZW4gcmV0dXJuIHRoYXQgYml0IHRvIHRoZSBjYWxsZXIKICAgICAq
LwogICAgYXNtIHZvbGF0aWxlKCJyMiA9IHVzclxuXHQiCiAgICAgICAgICAgICAgICAgInIyID0g
Y2xyYml0KHIyLCAjMClcblx0IiAgICAgICAgLyogY2xlYXIgb3ZlcmZsb3cgYml0ICovCiAgICAg
ICAgICAgICAgICAgInVzciA9IHIyXG5cdCIKICAgICAgICAgICAgICAgICAiJTAgPSB2YWRkdWIo
JTIsICUzKTpzYXRcblx0IgogICAgICAgICAgICAgICAgICIlMSA9IHVzclxuXHQiCiAgICAgICAg
ICAgICAgICAgOiAiPXIiKHJlc3VsdCksICI9ciIodXNyKQogICAgICAgICAgICAgICAgIDogInIi
KHNyYzEpLCAiciIoc3JjMikKICAgICAgICAgICAgICAgICA6ICJyMiIsICJ1c3IiKTsKICAgICpv
dmZfcmVzdWx0ID0gKHVzciAmIDEpOwogICAgcmV0dXJuIHJlc3VsdDsKfQoKc3RhdGljIHZvaWQg
dGVzdF92YWRkdWJzKHZvaWQpCnsKICAgIHVpbnQ2NF90IHJlc3VsdDsKICAgIGludCBvdmZfcmVz
dWx0OwoKICAgIHJlc3VsdCA9IHZhZGR1YnMoMHhmZkxMLCAweGZmTEwsICZvdmZfcmVzdWx0KTsK
ICAgIGNoZWNrNjQocmVzdWx0LCAweGZmTEwpOwogICAgY2hlY2szMihvdmZfcmVzdWx0LCAxKTsK
fQoKaW50IG1haW4oKQp7CiAgICB0ZXN0X3NhdHViKCk7CiAgICB0ZXN0X3ZhZGR1YnMoKTsKCiAg
ICBwdXRzKGVyciA/ICJGQUlMIiA6ICJQQVNTIik7CiAgICByZXR1cm4gZXJyOwp9Cg==

--_002_SN4PR0201MB88080CEA00266D6CD83A350EDE7C9SN4PR0201MB8808_--

