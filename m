Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DD247DD8C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Dec 2021 02:55:26 +0100 (CET)
Received: from localhost ([::1]:35658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n0DKH-0002Pd-2O
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 20:55:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n0DI8-0001DG-Hh
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 20:53:12 -0500
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:17741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1n0DI6-00052U-4i
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 20:53:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1640224390; x=1640829190;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XdeveZnzDKeJK1oA+szLfvwzSR79cbgorq9j6x5OSFk=;
 b=2AqMprWqxpnD46FfiqYYeb8/GuaUsLuEjHs5fDiIvBl3HooAmae8PvNr
 BzUFUVS2vDSuLeN62GYwaGHP0r0AnApP+zaFm8rmwDOjpIB2+ag/qCLoy
 A4AbANg4pCh/X8ThmQVldXWbZy5aZmUO/BYun1P0e5NQ2iDgE0qhtvaib E=;
Received: from mail-mw2nam10lp2104.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.104])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2021 01:53:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+rFo/T41ii7Sk3OTUBb0UT3SyUgbguf1J2Xx95JdaTRxVVvInc7/E/cLxsNH45EJewtP/kNE+avrP0Mnmb/eYHelGhKPh1J6PrDCTLVn6NNmY7rycZNKT6+aZvF739D51FozJiCz/mQiyXs3xGhGSW9fAOVmMxheRys7XmD8Eagg7KV12Zm+6J5k3gjE/xb/2raTVIkyVm/qn7sxSxPbhOJ8od9ifp10noG8OFy0oLDkJF9y+2mXP5fmtjrF6ih+Kd9XQm6xG4PScoiPhjwIAkVCYPHxb0qCYtLOiHb1aj5ae1rnf+dxR6TG7VA+x+6Q3fAe0nrs9/B3tLbtKYc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XdeveZnzDKeJK1oA+szLfvwzSR79cbgorq9j6x5OSFk=;
 b=KGx7CYTovY7jVurcg/vo7i/2VL74NbLzJYKO+8tPhdHlz/6vonlFj8oF9e0ic5vRJUaICbH+zo5DsUlpQ2GFAzK1L2i9wTeewO4UawRHocqva8eMxJC8OLda5X1uhoueOggWY3QlZpU85XB30quToIbmpae4w1VCA6rNoi0INsozjHy6Q2+jiN0ak0cB4gF0i7rYuep1l4RuePThFPLIWId/LkVd5qZUCAaelkH8ORT2zQAa6BMzJGjUpliddO3909obetsvjhqHlllTQfE/YlPwo/3YjEQ5tdzJbJpeS+A+bbNQ00RBKHv/5bXNwvh97h0kGV6IbR4Pgc6JsZNdVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by SN6PR02MB4000.namprd02.prod.outlook.com
 (2603:10b6:805:38::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 01:53:02 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::2016:dd39:b081:9dd4%4]) with mapi id 15.20.4801.020; Thu, 23 Dec 2021
 01:53:02 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v7 07/13] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v7 07/13] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHX8yS7Dh4yXJEjiEq4R3I13TRLHaw/R/wQ
Date: Thu, 23 Dec 2021 01:53:02 +0000
Message-ID: <SN4PR0201MB8808D3ABC21BA57C5040412CDE7E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20211217090129.23242-1-anjo@rev.ng>
 <20211217090129.23242-8-anjo@rev.ng>
In-Reply-To: <20211217090129.23242-8-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 79683e13-dfce-4586-fe37-08d9c5b6f4a7
x-ms-traffictypediagnostic: SN6PR02MB4000:EE_
x-microsoft-antispam-prvs: <SN6PR02MB40003D70F7841709A6D5480ADE7E9@SN6PR02MB4000.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DVQE5LDUfac7SzAgea5KIOf9hERz57QGbV7q++G7ky0h43i414dgtXIuJPp4ra3IR0tmJ68Ny7HDqaaZ3dMISLoFDY6a2rD1/z8ycdWLZG+rrDRa1S2vXKzFjwrgfzLizK39yoocxU/7LMpNbdp0VbuleFFQI/MWj2Oa5pRx8AF6MwyNTZMyWD54bU2URWvJTJEOi0N9qPZ+5VqoRLBp5Oqb5b6FnSszXbsJCOivEqecovQgsNz1KoD4xWvSEcF8HENJ5mSIBj8tL05fdYE6JW6E5oLY97qSeHZNWhLnknvTuPaWbk16Zh9NXrqxQmraGY8pxaYVF9xDgXd+8IUKm08z/YlInujyiWojo8xUJ6LzgrZN9rHMYp3FG39HCXcnmIUlACStSrzIyeQW136Omoyk5MFGqJU8BzObkpwuWqhGvSQpxqPGmGIdD+vsboe3tet2cJiIrBtDLWQi1bXwi+fteEFMN78kcHzed9yNKDN8MuGyIFSTbm6vxmw/B6P25Vav22WnHa0pkXXRKtZvUxxcJ9vTySJldq3V8A8MFJYpZ3ctuRJ5/7tkA8E3e87EL/cWggaw4itnMw2sbCWvAL2mH8ipgmFSp1dSRw32ogy3+LVWNneLibux0IJmBGVNxF7YBpLTSUgyl5lBAdHS+SZFsadqKG33wyKr2ws429rU41lZbRKxCdwlsVsYlUod0OBerkr9U9I/LlhkI5K/gA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9686003)(316002)(2906002)(71200400001)(54906003)(110136005)(55016003)(508600001)(76116006)(86362001)(66556008)(66476007)(83380400001)(66946007)(64756008)(66446008)(38070700005)(33656002)(4326008)(52536014)(5660300002)(8936002)(6506007)(7696005)(26005)(122000001)(53546011)(8676002)(38100700002)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KTe4bX2AcQ1RmSl8NxRWgEz6XZM5XbBC/VhfWN3RVHJngRmyEqXts5KwIcTs?=
 =?us-ascii?Q?QHdtDAW98jT/nWOf+Tl6f+fIILOstxCsh64LFcGE8RIr8A8oNzK3bHxrsfj6?=
 =?us-ascii?Q?Wbf/jewPEdIRiKKF54yPmIAZmdRQrMtYRKK4yxav3UCv9+7tPlC5C4dCs04Y?=
 =?us-ascii?Q?ySATxjy/esOxsH/4ZZlrDezajInbu2zz7etVqPc07J1uZdVi880k7CW2Ye7M?=
 =?us-ascii?Q?i8CPzvdd813ovEurm0XChBU73hGQz+tApPqPaQvInr3IMY2nuiVf2hgoCfp8?=
 =?us-ascii?Q?Z8LnO5S4uLv8ck4xjDkwkYWuS01Jd7uK76h1QBPFzA9Zx6K5sjb14v9T6Xlf?=
 =?us-ascii?Q?paHq3h8o/Wjx6ZNOKwgQNa0rmU8FNSiYK4Yq74pRKkD135aAe33Y0OazI6ML?=
 =?us-ascii?Q?m+e3xqChO6WebZ1cHYtcyAhGyDGuAqHUV3N+sAMQrzqSLHOH4v+pHEIkk7DB?=
 =?us-ascii?Q?PY/4R986D2KAmaVDX+7L0TRsO6azT8Ya/WOOgiXcipP12mdJVVr8SQhsTBOl?=
 =?us-ascii?Q?zPNCqO6xadlZbJBgKS+9axN9PA2kr/hAXGzixQ+T/KjOVbAiysWTofini3mS?=
 =?us-ascii?Q?097ZtMxnBb6tT4K7/ONuBjsHj0znmDq0qhOjU3pMHBKe7T8vEmk0frLzDg1+?=
 =?us-ascii?Q?o5gO4rtlN1Wd3WHclLtVmJHr2EdHFL6oS5IjT0Mq0O9Rr/LY+hKo8PdkPz8H?=
 =?us-ascii?Q?ZFDnZsAz7E9o+Lx0/yXW0CDcvh2erL5UshdaoKCVlV+NdSl6Y5bxGnukcjug?=
 =?us-ascii?Q?P0k5r700/ycgTVDgbgvR+YbrOuQQBSE/8my/M2I1fJmnXY4MJCx37lah2+CO?=
 =?us-ascii?Q?NSFwrTibNGV6lviThKbDBA39KtfOQlv/43gk0ihMOLp8DObRLhlavxYFJJFx?=
 =?us-ascii?Q?7jkXsMIcUFS0xK5hEcODArdR1SmZWYbwDPnvFb+/OGyWa8IUdh5CV8Rnmt4g?=
 =?us-ascii?Q?Ozmm5aWkO+4Cls4a5sWqbbT2zjv99sraIzo3xpj0TdRkiHvQXPoBfvjPumWD?=
 =?us-ascii?Q?2BLiCnEyFwzvSC4nz/89ZiDvafHDCj64DOmKgAXtIeTRAw/v7Ik1ONrq6SZl?=
 =?us-ascii?Q?fj7YqwVkNfiYnCaYzalozZU1D3SIGgcmaBIQBCRyJ6e7AK41kfKqrh3F0oFa?=
 =?us-ascii?Q?WzU33bDFrjHVwARS1LTs7FUrm4+QcDDBAbsS5Bx9AR+Sjuj+ANHl5YYfoM4O?=
 =?us-ascii?Q?+I0IRLQQ+JovXt6pdaKyOVn10XGQ3T34GhivP5jStAKk/TxPXnPz7gDr/jdI?=
 =?us-ascii?Q?YKW2sjmkMHiF8h4YilcPW0LVfXBMViDTD3iVicVJApc84W+bSCioYmZhaB3h?=
 =?us-ascii?Q?XUDf657TvAoNpmRXLyUnZizJq7go9/JhPV+QlwVkzfCekmkSKJ5eaQZ7ScSY?=
 =?us-ascii?Q?tYo+SXzGCfNhCOJFPDJg13ZF+y1U6KLMZwK1Xzs5ZBIav+1v/ya1IC8WcNsP?=
 =?us-ascii?Q?CRzgbXfyjwi5mrIGXgqAKOa8ImxbZ39ptdnW6B/EXeHphqVXaALqlh9C/wqe?=
 =?us-ascii?Q?uGyF8t97RCUSo+0gqVImgnUHUJzqKKfElBFqWd1WDDB75p0w3ybB2VYVmxZj?=
 =?us-ascii?Q?l/UdpcItoe7mkvB1KiX2V0i2MlF7QAsvgGp+km1yvrZyBoPzMwLTY4ocfJLo?=
 =?us-ascii?Q?/PUmkJWxndyDxAFq6uGq7f4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79683e13-dfce-4586-fe37-08d9c5b6f4a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2021 01:53:02.7912 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: setMSPJ5yIlBOgugZhxO9tltNRV1Z3/mA49ohe2hN5/UI20IgbmfUZm/gqJbx/FJdPbi/xIELB2Rj8R8DGTaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4000
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



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Friday, December 17, 2021 2:01 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org
> Subject: [PATCH v7 07/13] target/hexagon: prepare input for the idef-pars=
er
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Introduce infrastructure necessary to produce a file suitable for being p=
arsed
> by the idef-parser.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>


> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index b61243103f..236c3a3ffa 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -179,4 +180,19 @@ hexagon_ss.add(files(
> +
> +idef_parser_input_generated_prep =3D custom_target(
> +    'idef_parser_input.preprocessed.h.inc',
> +    output: 'idef_parser_input.preprocessed.h.inc',
> +    input: idef_parser_input_generated,
> +    command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' +
> +idef_parser_dir, '-o', '@OUTPUT@'],

This depends on macros.inc, but that is not indicated anywhere.  So, a chan=
ge to that file won't cause this file to be regenerated.

