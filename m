Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08F3B25BD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 05:56:52 +0200 (CEST)
Received: from localhost ([::1]:38392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwGTz-0004tV-NE
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 23:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lwGSy-0004DI-0J
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:55:48 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:61415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lwGSt-0004er-2f
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 23:55:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624506942; x=1625111742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RMFCt8b+gR2VHjsQdVDSPXDQMe0m4XeMr8nle5pbGhw=;
 b=IM3CwE3tHhUMFF5jtPSUUvyWH413GNtVWJ416Mka/BiuuOviY8lz7oY3
 eM08x/Kj1XgTcIyNQY+egjftY9FKi7pvNVvdU4uyQwYweRqAjO4QjJWVK
 kJ39WKKjUvzScdu0s5T7M2MbC3PWBYpc7KKur0AcFNM6FK02gj2HnuAkS Y=;
IronPort-SDR: l1e+3MhzTClke/ct2HOCoZxaXNDJgopsd+9S7xoM0txCxFVuOn1C7zX4FWwURVM/T/o0fzWfrT
 8t8HgPijfO2Tg6L7MF+/BcDmi+6IqDWEMtIpC/kWAZyysfFH7CaO74xNv8hYqHrEGFUSBdW/Sg
 26H6jSmKun4xntcLE/0f01pzDnXpozzBB9vMVjvgQdPTkxtQ5B4QsrituXkmqybGXmBfWGbRMi
 ZYXcqTg8atFAmRNI4/wZvu+1JCa57LWXSGuiE0FSEYPvnd6zR449+p6d0MTPfPTHliJScIgKCY
 M6Q=
Received: from mail-mw2nam12lp2044.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.44])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 03:55:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C0Ql6YM/iWJPV9x9QMT8v7OF7wSDKtSmlruGclaNSOB3ASmR7/osbJSbvbjGfijS9aJ0Q1vkhOjFZsjYq003b8RZjePiSaOqHW4dA6+KqmTGxmqqJv/xtQEFSiv4AroC3dEKyR3kq92711zK+gBxf9CNByskoEXGaDbmkd7R9752SEk0TPnH4LAIKvFuhU84/QUtztkePqAWNMtAO1jikDe4pXabkOFohaUWOc3jUvAO7Ua2CgChwOpAprmEGB/zXczZ/RsU0IBc8YRAeEmOsi4k27PUVOC1V5keEMXIqj6Hq7ERJQsQC/crOOhy0gaiiUlQE7WkKJUTOAsvsVV7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDqj1v1ghfCyubyPRAO469px9eQxCvUhJoe4XrJIHsg=;
 b=RQU0QQHWvvdMWk2moA8rb2jwhM6mK9qRzxib7XUZO84G1ziakI9jdpjLZXpHYGJwPXV2/+IxcZAUQaReLOykeTSQD1IrNo6rzZMa11Y6cs3j9pgUWfPhn8GjlGtdaOoQGirGobUvLjnNxBzz2Fnaopl6GLkD9wRc9EfpJ1BvFEWW+VC6TJNWgw0RDwH1I9oJmEqvrwCowzdsiyzsrLOkoWOGRIlKA3SJYu2f3XGlcNHM+KpHcZgs8VrXLyIwQTJpZmTmZju5Bmk5g149s7LyYyM+LuSwjxNYZW5DN6qsEwtO516cw+poyqYX7osVAUxarYz7HoDNF6UjDiCB21xiag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4120.namprd02.prod.outlook.com (2603:10b6:a02:f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Thu, 24 Jun
 2021 03:55:36 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Thu, 24 Jun 2021
 03:55:35 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
Thread-Index: AQHXZO7Goa2DPYI2nUGjRUNAahm7rasiFDbQ
Date: Thu, 24 Jun 2021 03:55:35 +0000
Message-ID: <BYAPR02MB488679E9F94D484852DD2398DE079@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-11-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-11-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7d130cc-4b43-47a7-7152-08d936c3ec3f
x-ms-traffictypediagnostic: BYAPR02MB4120:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4120DC11DFE92FF1E776416FDE079@BYAPR02MB4120.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:561;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XVrS5nQlj9GTw1gOwtbf4sUI0oX5Ai3xCI8D20+X6qV0WKq/6L8vnv5WW07FHa1FM2Yt7R2QcHVL43qsrTgBg/ya+vvRU4f22t6iSeTDu8FSMCzIN07MlqNmqPg6mbnhbFLqxRjcl4UrTo8RjPDnw0CS+XSSzeLBASqZCYXtmj/QA16dOK1AQAwLnEPmUHXNub9YU5B5u/vxqUjiV3k9yns9S7HY8dXHRrevnBG92sW0f3eRA5h/GeqlG7eULb82LAtTbt1qGjJGD1sdB07absjF7U/ACwWzQnIqgcXGeZJ3XaeuBNNw0MpZR1HS5SNNJT2gBAMhcYg3A56jWhtNMu0SkDkMPbqRpBTcmIvuh4mbciloDh2OK+pamH7K0yHMfFoJOvOG2J1oMoMSY+UEA3sGwpd7ArsZgeSiNDdw8SCR+WETtkPJY8G+vDZ7jejV7S0LC2WHGhMaGudqmiEFo9xT/LCKg71RMEvFLzeflYGDqoyi9MlygSjDVTQBEZhE+Bi/xgaKd2cqzxmT9zxq/tRPK2gEWH2HJIRPL1PAYProug/DR8Jg/TElJ4ON+4ymFRfAsq/uFtiebqNDkF6alkfRbUNlqmLrreYbCZJuUKA=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(396003)(366004)(39860400002)(376002)(186003)(5660300002)(110136005)(9686003)(55016002)(66556008)(54906003)(64756008)(26005)(66946007)(71200400001)(52536014)(316002)(8676002)(66446008)(86362001)(66476007)(7696005)(76116006)(53546011)(83380400001)(122000001)(38100700002)(33656002)(4326008)(30864003)(478600001)(2906002)(8936002)(6506007)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?I5bohBrgNuM6szmx5KSIpcByKyYN05YxCvIc7kqpY+pbgAcQRlYix7OhnEki?=
 =?us-ascii?Q?FD86f4e67IrGqDf57OmKIBwOXd4WR7MSOlHYd5v9j4W+8h5bGlnfWQfaLc1F?=
 =?us-ascii?Q?QjO4V/wdLjUPL+zHKf5ByJ2/DbGr3j6Of263wJl+oFonBv67SyFEvMM0IaEp?=
 =?us-ascii?Q?XddgZd6h/uXTgcZeGM1EIinECP1xB+E+RwxXw0/VViHHD2DHrA1gnDh/0x7h?=
 =?us-ascii?Q?UjxOPxbt3Uz0FvIfP2y37OFpQrMGnQrum5YUvm0t+TutY6Tp2ufVsiiyfIEf?=
 =?us-ascii?Q?2SySmxDCkPeBn/qSgyN2I/jpYNbcNzyof0dr7SBpogqFPCqd8L46GF+MI2Kr?=
 =?us-ascii?Q?3QreunfQMs6obOX74edd9Regi7rgtN5mS7WF/FcNBE5t1PttN75mE0Bx9gqP?=
 =?us-ascii?Q?dlnjyPl6M7Q3U2BugrVTFbe61LBRLKB9IGqnXx3fC5+vgwNvupsvzKtbu+Zh?=
 =?us-ascii?Q?AqUE/Zs9E1KEJ+8gtyGEE0kIqVmGCdldNRsX58/whG1QtFiPR9WFks/IE8v1?=
 =?us-ascii?Q?suUR3d2hPsOC5uGzV9B3WOqrY+XnIJOv8MijFPzxmn/HFJ8WBBohAd3P9CNp?=
 =?us-ascii?Q?o4HYk81GIC7qU/1XVBa6WlR7ImHCH7M7vZLrCGhPnaxFcUSRC4vkKT6EqG1/?=
 =?us-ascii?Q?aDFq+mdaI0LrwG5PQ35xhP7Cmyl7MvT5ofmusE3Uz20FN2y9AX0AlePOuydK?=
 =?us-ascii?Q?DvjqWdFYBUes/+bDV7uSCC8qBjLMU84TTftw9G3ak6kSJMydPZRR5mzeABO2?=
 =?us-ascii?Q?ia1TaZPPJiM1dlVexF60xjZF3qZwPfN8eTOOzX7kbFjadJWfusXGav6DxIQ9?=
 =?us-ascii?Q?pqTRbGuSHeX+esxjjJTATgwQF/5/gWFh3hpBgSfnX47sAYtVHNiTr9gFpCkm?=
 =?us-ascii?Q?Jn+sExB0TJdnkFO7U0+sEtXaWKOkNq/0p2ApxPwwDjjwfmHkh+8MK808a/cS?=
 =?us-ascii?Q?7P+1AqDTeLf00G2RvDflhIXEnkpNT/O74kOWPM4CyqMUYNgbL+8iibHooyxY?=
 =?us-ascii?Q?cnasfIlq3f5jiHF/TsldJtQE+jN6l5FXlL957FxIjfhotG9rkF1B3rxw9ca/?=
 =?us-ascii?Q?qOEpQXS6CBC3epDZp9Cp5cXT5F25rRHw5Tyz0iuUtSGVj+qHY3my1M6ShTSV?=
 =?us-ascii?Q?DiAgsx6zHM2BY+Oy4w6Vu2CC0GSLm7+0qL23ANQ8w3+s4y6vlLaPf7brwsx6?=
 =?us-ascii?Q?fxOywJ3F/bHOhQ4pnD6gSPJZdq4I5JWe8tcG7nwnjfx5yH9liX3u6WgN/INI?=
 =?us-ascii?Q?cHzAMDu5w/RVwOVxiwjT1C6Y2I1Qp77zOf4IJQa7QqN7GqrAmQJfsMyzUZU6?=
 =?us-ascii?Q?MxKSLmQAQFuaThwNHv+ekm0/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d130cc-4b43-47a7-7152-08d936c3ec3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2021 03:55:35.8190 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5tLki7BJRZvEgcbYzqkQIDrt4Enq0koV4OaFqVQyt3VpBml6yoN1pzft3dDC5cK1WphSn4lkzZ1FTiWMa8RvDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4120
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Saturday, June 19, 2021 3:37 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v5 10/14] target/hexagon: import parser for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
> diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/id=
ef-
> parser/idef-parser.y



> +for_statement : FOR '(' IMM '=3D' IMM ';' IMM '<' IMM ';' IMM PLUSPLUS '=
)'
> +                {
> +                    @1.last_column =3D @13.last_column;
> +                    OUT(c, &@1, "for (int ", &$3, " =3D ", &$5, "; ",
> +                        &$7, " < ", &$9);
> +                    OUT(c, &@1, "; ", &$11, "++) {\n");

Increase indent level here

> +                }
> +                code_block
> +                {

Decrease indent level

> +                    OUT(c, &@1, "}\n");
> +                }
> +              | FOR '(' IMM '=3D' IMM ';' IMM '<' IMM ';' IMM INC IMM ')=
'
> +                {
> +                    @1.last_column =3D @14.last_column;
> +                    OUT(c, &@1, "for (int ", &$3, " =3D ", &$5, "; ",
> +                        &$7, " < ", &$9);
> +                    OUT(c, &@1, "; ", &$11, " +=3D ", &$13, ") {\n");

Increase indent

> +                }
> +                code_block
> +                {

Decrease indent

> +                    OUT(c, &@1, "}\n");
> +                }
> +              ;
> +
> +fpart1_statement : PART1
> +                   {
> +                       OUT(c, &@1, "if (insn->part1) {\n");

Increase indent

> +                   }
> +                   '(' statements ')'
> +                   {
> +                       @1.last_column =3D @3.last_column;

Emit the return first, then decrease indent before the curly

> +                       OUT(c, &@1, "return; }\n");
> +                   }
> +                 ;


> +       | rvalue '[' rvalue ']'
> +         {
> +             @1.last_column =3D @4.last_column;
> +             if ($3.type =3D=3D IMMEDIATE) {
> +                 $$ =3D gen_tmp(c, &@1, $1.bit_width);
> +                 OUT(c, &@1, "tcg_gen_extract_i", &$$.bit_width, "(");
> +                 OUT(c, &@1, &$$, ", ", &$1, ", ", &$3, ", 1);\n");
> +             } else {
> +                 HexValue one =3D gen_imm_value(c, &@1, 1, $3.bit_width)=
;
> +                 HexValue tmp =3D gen_bin_op(c, &@1, ASR_OP, &$1, &$3);
> +                 $$ =3D gen_bin_op(c, &@1, ANDB_OP, &tmp, &one);

Can this be done with a tcg_gen_extract_tl or tcg_gen_sextract_tl?

Do you need to worry about signed-ness?

> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> new file mode 100644


> +const char *creg_str[] =3D {"HEX_REG_SP", "HEX_REG_FP", "HEX_REG_LR",
> +                          "HEX_REG_GP", "HEX_REG_LC0", "HEX_REG_LC1",
> +                          "HEX_REG_SA0", "HEX_REG_SA1"};

SP, FP, LR shouldn't in this array.

> +void reg_compose(Context *c, YYLTYPE *locp, HexReg *reg, char reg_id[5])
> +{
> +    switch (reg->type) {
> +    case GENERAL_PURPOSE:
> +        reg_id[0] =3D 'R';
> +        break;
> +    case CONTROL:
> +        reg_id[0] =3D 'C';
> +        break;
> +    case MODIFIER:
> +        reg_id[0] =3D 'M';
> +        break;
> +    case DOTNEW:
> +        /* The DOTNEW case is managed by the upper level function */

Should we raise an error if we get here?

> +        break;
> +    }
> +    switch (reg->bit_width) {
> +    case 32:
> +        reg_id[1] =3D reg->id;
> +        reg_id[2] =3D 'V';
> +        break;
> +    case 64:
> +        reg_id[1] =3D reg->id;
> +        reg_id[2] =3D reg->id;
> +        reg_id[3] =3D 'V';
> +        break;
> +    default:
> +        yyassert(c, locp, false, "Unhandled register bit width!\n");
> +    }
> +}
> +
> +void reg_print(Context *c, YYLTYPE *locp, HexReg *reg)
> +{
> +  if (reg->type =3D=3D DOTNEW) {
> +    EMIT(c, "N%cN", reg->id);

Why not handle this in reg_compose?

> +  } else {
> +    char reg_id[5] =3D { 0 };
> +    reg_compose(c, locp, reg, reg_id);
> +    EMIT(c, "%s", reg_id);
> +  }
> +}
> +
> +void imm_print(Context *c, YYLTYPE *locp, HexImm *imm)
> +{
> +    switch (imm->type) {
> +    case I:
> +        EMIT(c, "i");
> +        break;
> +    case VARIABLE:
> +        EMIT(c, "%ciV", imm->id);
> +        break;
> +    case VALUE:
> +        EMIT(c, "((int64_t)%" PRIu64 "ULL)", (int64_t)imm->value);
> +        break;
> +    case QEMU_TMP:
> +        EMIT(c, "qemu_tmp_%" PRIu64, imm->index);
> +        break;
> +    case IMM_PC:
> +        EMIT(c, "ctx->base.pc_next");
> +        break;
> +    case IMM_NPC:
> +        EMIT(c, "ctx->npc");
> +        break;
> +    case IMM_CONSTEXT:
> +        EMIT(c, "insn->extension_valid");

The extension_valid field is a bool indicating if the instruction has a con=
stant extender.  Don't you want the actual value here?

> +        break;


> +
> +static HexValue get_ternary_cond(Context *c, YYLTYPE *locp)
> +{
> +    yyassert(c, locp, is_inside_ternary(c), "unexisting condition");
> +    Ternary *t =3D &g_array_index(c->ternary, Ternary, 0);
> +    HexValue cond =3D t->cond;
> +    if (t->state =3D=3D IN_RIGHT) {
> +        cond =3D gen_rvalue_notl(c, locp, &cond);
> +    }
> +    for (unsigned i =3D 1; i < c->ternary->len; ++i) {
> +        Ternary *right =3D &g_array_index(c->ternary, Ternary, i);
> +        HexValue other =3D right->cond;
> +        /* Invert condition if we are on the right side */
> +        if (right->state =3D=3D IN_RIGHT) {
> +            other =3D gen_rvalue_notl(c, locp, &other);
> +        }
> +        cond =3D gen_bin_op(c, locp, ANDL_OP, &cond, &other);
> +    }
> +    return cond;
> +}
> +
> +/* Temporary values creation */
> +HexValue gen_tmp(Context *c, YYLTYPE *locp, int bit_width)
> +{
> +    HexValue rvalue;
> +    rvalue.type =3D TEMP;
> +    bit_width =3D (bit_width =3D=3D 64) ? 64 : 32;

Better to assert it's either 64 or 32

> +    rvalue.bit_width =3D bit_width;
> +    rvalue.is_unsigned =3D false;
> +    rvalue.is_dotnew =3D false;
> +    rvalue.is_manual =3D false;
> +    rvalue.tmp.index =3D c->inst.tmp_count;
> +    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
> +        " =3D tcg_temp_new_i", &bit_width, "();\n");
> +    c->inst.tmp_count++;
> +    return rvalue;
> +}
> +


> +
> +void rvalue_free(Context *c, YYLTYPE *locp, HexValue *rvalue)

Should be called gen_rvalue_free

> +{
> +    if (rvalue->type =3D=3D TEMP && !rvalue->is_manual) {
> +        const char *bit_suffix =3D (rvalue->bit_width =3D=3D 64) ? "i64"=
 : "i32";
> +        OUT(c, locp, "tcg_temp_free_", bit_suffix, "(", rvalue, ");\n");
> +    }
> +}


> +HexValue rvalue_extend(Context *c, YYLTYPE *locp, HexValue *rvalue)

Should be called gen_rvalue_extend

> +{
> +    if (rvalue->type =3D=3D IMMEDIATE) {
> +        HexValue res =3D *rvalue;
> +        res.bit_width =3D 64;
> +        return res;
> +    } else {
> +        if (rvalue->bit_width =3D=3D 32) {
> +            HexValue res =3D gen_tmp(c, locp, 64);
> +            const char *sign_suffix =3D (rvalue->is_unsigned) ? "u" : ""=
;
> +            OUT(c, locp, "tcg_gen_ext", sign_suffix,
> +                "_i32_i64(", &res, ", ", rvalue, ");\n");
> +            rvalue_free(c, locp, rvalue);
> +            return res;
> +        }
> +    }
> +    return *rvalue;
> +}
> +
> +HexValue rvalue_truncate(Context *c, YYLTYPE *locp, HexValue *rvalue)

Should be called gen_rvalue_truncate

> +{
> +    if (rvalue->type =3D=3D IMMEDIATE) {
> +        HexValue res =3D *rvalue;
> +        res.bit_width =3D 32;
> +        return res;
> +    } else {
> +        if (rvalue->bit_width =3D=3D 64) {
> +            HexValue res =3D gen_tmp(c, locp, 32);
> +            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", rvalue, ")=
;\n");
> +            rvalue_free(c, locp, rvalue);
> +            return res;
> +        }
> +    }
> +    return *rvalue;
> +}
> +


> +void varid_allocate(Context *c,

gen_varid_allocate

> +                    YYLTYPE *locp,
> +                    HexValue *varid,
> +                    int width,
> +                    bool is_unsigned)
> +{
> +    varid->bit_width =3D width;
> +    const char *bit_suffix =3D width =3D=3D 64 ? "64" : "32";
> +    int index =3D find_variable(c, locp, varid);
> +    bool found =3D index !=3D -1;
> +    if (found) {
> +        Var *other =3D &g_array_index(c->inst.allocated, Var, index);
> +        varid->var.name =3D other->name;
> +        varid->bit_width =3D other->bit_width;
> +        varid->is_unsigned =3D other->is_unsigned;
> +    } else {
> +        EMIT_HEAD(c, "TCGv_i%s %s", bit_suffix, varid->var.name->str);
> +        EMIT_HEAD(c, " =3D tcg_temp_local_new_i%s();\n", bit_suffix);
> +        Var new_var =3D {
> +            .name =3D varid->var.name,
> +            .bit_width =3D width,
> +            .is_unsigned =3D is_unsigned,
> +        };
> +        g_array_append_val(c->inst.allocated, new_var);
> +    }
> +}
> +
> +void ea_free(Context *c, YYLTYPE *locp)

gen_ea_free

> +{
> +    OUT(c, locp, "tcg_temp_free(EA);\n");
> +}
> +HexValue gen_bin_cmp(Context *c,
> +                     YYLTYPE *locp,
> +                     TCGCond type,
> +                     HexValue *op1_ptr,
> +                     HexValue *op2_ptr)
> +{
> +    HexValue op1 =3D *op1_ptr;
> +    HexValue op2 =3D *op2_ptr;
> +    enum OpTypes op_types =3D (op1.type !=3D IMMEDIATE) << 1
> +                            | (op2.type !=3D IMMEDIATE);
> +
> +    /* Find bit width of the two operands, if at least one is 64 bit use=
 a */
> +    /* 64bit operation, eventually extend 32bit operands. */

This is duplicated elsewhere (e.g., gen_bin_op) - should be pulled into a s=
ingle function.

> +    bool op_is64bit =3D op1.bit_width =3D=3D 64 || op2.bit_width =3D=3D =
64;
> +    const char *bit_suffix =3D op_is64bit ? "i64" : "i32";
> +    int bit_width =3D (op_is64bit) ? 64 : 32;
> +    if (op_is64bit) {
> +        switch (op_types) {
> +        case IMM_IMM:
> +            break;
> +        case IMM_REG:
> +            op2 =3D rvalue_extend(c, locp, &op2);
> +            break;
> +        case REG_IMM:
> +            op1 =3D rvalue_extend(c, locp, &op1);
> +            break;
> +        case REG_REG:
> +            op1 =3D rvalue_extend(c, locp, &op1);
> +            op2 =3D rvalue_extend(c, locp, &op2);
> +            break;
> +        }
> +    }



> +static void gen_mini_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        HexValue *res, enum OpTypes op_types,
> +                        HexValue *op1_ptr, HexValue *op2_ptr)
> +{
> +    HexValue op1 =3D *op1_ptr;
> +    HexValue op2 =3D *op2_ptr;
> +    const char *min =3D res->is_unsigned ? "tcg_gen_umin" : "tcg_gen_smi=
n";
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ", res, " =3D (", &op1, " <=
=3D ");
> +        OUT(c, locp, &op2, ") ? ", &op1, " : ", &op2, ";\n");
> +        break;
> +    case IMM_REG:
> +        op1.bit_width =3D bit_width;
> +        op1 =3D rvalue_materialize(c, locp, &op1);
> +        OUT(c, locp, min, "_i", &bit_width, "(");
> +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    case REG_IMM:
> +        op2.bit_width =3D bit_width;
> +        op2 =3D rvalue_materialize(c, locp, &op2);
> +        /* Fallthrough */
> +    case REG_REG:
> +        OUT(c, locp, min, "_i", &bit_width, "(");
> +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    }
> +    rvalue_free(c, locp, &op1);
> +    rvalue_free(c, locp, &op2);
> +}
> +
> +static void gen_maxi_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        HexValue *res, enum OpTypes op_types,
> +                        HexValue *op1_ptr, HexValue *op2_ptr)
> +{
> +    HexValue op1 =3D *op1_ptr;
> +    HexValue op2 =3D *op2_ptr;
> +    const char *min =3D res->is_unsigned ? "tcg_gen_umax" : "tcg_gen_sma=
x";
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ", res, " =3D (", &op1, " <=
=3D ");
> +        OUT(c, locp, &op2, ") ? ", &op2, " : ", &op1, ";\n");
> +        break;
> +    case IMM_REG:
> +        op1.bit_width =3D bit_width;
> +        op1 =3D rvalue_materialize(c, locp, &op1);
> +        OUT(c, locp, min, "_i", &bit_width, "(");
> +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    case REG_IMM:
> +        op2.bit_width =3D bit_width;
> +        op2 =3D rvalue_materialize(c, locp, &op2);
> +        /* Fallthrough */
> +    case REG_REG:
> +        OUT(c, locp, min, "_i", &bit_width, "(");
> +        OUT(c, locp, res, ", ", &op1, ", ", &op2, ");\n");
> +        break;
> +    }
> +    rvalue_free(c, locp, &op1);
> +    rvalue_free(c, locp, &op2);
> +}

These two look basically the same, create a single function with one extra =
are indicating min/max.


> +HexValue gen_cast_op(Context *c,
> +                     YYLTYPE *locp,
> +                     HexValue *source,
> +                     unsigned target_width) {

Don't you need to worry about signed-ness of the result?

> +    if (source->bit_width =3D=3D target_width) {
> +        return *source;
> +    } else if (source->type =3D=3D IMMEDIATE) {
> +        HexValue res =3D *source;
> +        res.bit_width =3D target_width;
> +        return res;
> +    } else {
> +        HexValue res =3D gen_tmp(c, locp, target_width);
> +        /* Truncate */
> +        if (source->bit_width > target_width) {
> +            OUT(c, locp, "tcg_gen_trunc_i64_tl(", &res, ", ", source, ")=
;\n");
> +        } else {
> +            if (source->is_unsigned) {
> +                /* Extend unsigned */
> +                OUT(c, locp, "tcg_gen_extu_i32_i64(",
> +                    &res, ", ", source, ");\n");
> +            } else {
> +                /* Extend signed */
> +                OUT(c, locp, "tcg_gen_ext_i32_i64(",
> +                    &res, ", ", source, ");\n");
> +            }
> +        }
> +        rvalue_free(c, locp, source);
> +        return res;
> +    }
> +}
> +
> +HexValue gen_extend_op(Context *c,
> +                       YYLTYPE *locp,
> +                       HexValue *src_width_ptr,
> +                       HexValue *dst_width_ptr,
> +                       HexValue *value_ptr,
> +                       bool is_unsigned) {
> +    HexValue src_width =3D *src_width_ptr;
> +    HexValue dst_width =3D *dst_width_ptr;
> +    HexValue value =3D *value_ptr;
> +    src_width =3D rvalue_extend(c, locp, &src_width);
> +    value =3D rvalue_extend(c, locp, &value);
> +    src_width =3D rvalue_materialize(c, locp, &src_width);
> +    value =3D rvalue_materialize(c, locp, &value);
> +
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    HexValue shift =3D gen_tmp_value(c, locp, "64", 64);
> +    HexValue zero =3D gen_tmp_value(c, locp, "0", 64);
> +    OUT(c, locp, "tcg_gen_sub_i64(",
> +        &shift, ", ", &shift, ", ", &src_width, ");\n");
> +    if (is_unsigned) {
> +        HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffff", 6=
4);
> +        OUT(c, locp, "tcg_gen_shr_i64(",
> +            &mask, ", ", &mask, ", ", &shift, ");\n");
> +        OUT(c, locp, "tcg_gen_and_i64(",
> +            &res, ", ", &value, ", ", &mask, ");\n");
> +        rvalue_free(c, locp, &mask);

Can't you do this with tcg_gen_extract?

> +    } else {
> +        OUT(c, locp, "tcg_gen_shl_i64(",
> +            &res, ", ", &value, ", ", &shift, ");\n");
> +        OUT(c, locp, "tcg_gen_sar_i64(",
> +            &res, ", ", &res, ", ", &shift, ");\n");

Can't you do this with get_gen_sectract?

> +    }
> +    OUT(c, locp, "tcg_gen_movcond_i64(TCG_COND_EQ, ", &res, ", ");
> +    OUT(c, locp, &src_width, ", ", &zero, ", ", &zero, ", ", &res, ");\n=
");
> +
> +    rvalue_free(c, locp, &src_width);
> +    rvalue_free(c, locp, &dst_width);
> +    rvalue_free(c, locp, &value);
> +    rvalue_free(c, locp, &shift);
> +    rvalue_free(c, locp, &zero);
> +
> +    res.is_unsigned =3D is_unsigned;
> +    return res;
> +}
> +
> +void gen_rdeposit_op(Context *c,
> +                     YYLTYPE *locp,
> +                     HexValue *dest,
> +                     HexValue *value,
> +                     HexValue *begin,
> +                     HexValue *width)
> +{
> +    HexValue dest_m =3D *dest;
> +    dest_m.is_manual =3D true;
> +
> +    HexValue value_m =3D rvalue_extend(c, locp, value);
> +    HexValue begin_m =3D rvalue_extend(c, locp, begin);
> +    HexValue width_orig =3D *width;
> +    width_orig.is_manual =3D true;
> +    HexValue width_m =3D rvalue_extend(c, locp, &width_orig);
> +    width_m =3D rvalue_materialize(c, locp, &width_m);
> +
> +    HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffffUL", 64)=
;
> +    mask.is_unsigned =3D true;
> +    HexValue k64 =3D gen_tmp_value(c, locp, "64", 64);
> +    k64 =3D gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
> +    mask =3D gen_bin_op(c, locp, LSR_OP, &mask, &k64);
> +    begin_m.is_manual =3D true;
> +    mask =3D gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
> +    mask.is_manual =3D true;
> +    value_m =3D gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
> +    value_m =3D gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);
> +
> +    OUT(c, locp, "tcg_gen_not_i64(", &mask, ", ", &mask, ");\n");
> +    mask.is_manual =3D false;
> +    HexValue res =3D gen_bin_op(c, locp, ANDB_OP, &dest_m, &mask);
> +    res =3D gen_bin_op(c, locp, ORB_OP, &res, &value_m);
> +

Can't you do this with tcg_gen_deposit?

> +    if (dest->bit_width !=3D res.bit_width) {
> +        res =3D rvalue_truncate(c, locp, &res);
> +    }
> +
> +    HexValue zero =3D gen_tmp_value(c, locp, "0", res.bit_width);
> +    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width, "(TCG_COND_NE, ",
> dest);
> +    OUT(c, locp, ", ", &width_orig, ", ", &zero, ", ", &res, ", ", dest,
> +        ");\n");
> +
> +    rvalue_free(c, locp, &zero);
> +    rvalue_free(c, locp, width);
> +    rvalue_free(c, locp, &res);
> +}
> +
> +void gen_deposit_op(Context *c,
> +                    YYLTYPE *locp,
> +                    HexValue *dest,
> +                    HexValue *value,
> +                    HexValue *index,
> +                    HexCast *cast)

What's the difference between this and the gen_rdeposit_op above?


> +{
> +    yyassert(c, locp, index->type =3D=3D IMMEDIATE,
> +             "Deposit index must be immediate!\n");
> +    HexValue value_m =3D *value;
> +    int bit_width =3D (dest->bit_width =3D=3D 64) ? 64 : 32;
> +    int width =3D cast->bit_width;
> +    /* If the destination value is 32, truncate the value, otherwise ext=
end */
> +    if (dest->bit_width !=3D value->bit_width) {
> +        if (bit_width =3D=3D 32) {
> +            value_m =3D rvalue_truncate(c, locp, &value_m);
> +        } else {
> +            value_m =3D rvalue_extend(c, locp, &value_m);
> +        }
> +    }
> +    value_m =3D rvalue_materialize(c, locp, &value_m);
> +    OUT(c, locp, "tcg_gen_deposit_i", &bit_width, "(", dest, ", ", dest,=
 ", ");
> +    OUT(c, locp, &value_m, ", ", index, " * ", &width, ", ", &width, ");=
\n");
> +    rvalue_free(c, locp, index);
> +    rvalue_free(c, locp, &value_m);
> +}
> +
> +HexValue gen_rextract_op(Context *c,
> +                         YYLTYPE *locp,
> +                         HexValue *source,
> +                         int begin,
> +                         int width) {
> +    int bit_width =3D (source->bit_width =3D=3D 64) ? 64 : 32;
> +    HexValue res =3D gen_tmp(c, locp, bit_width);
> +    OUT(c, locp, "tcg_gen_extract_i", &bit_width, "(", &res);
> +    OUT(c, locp, ", ", source, ", ", &begin, ", ", &width, ");\n");
> +    rvalue_free(c, locp, source);
> +    return res;
> +}
> +
> +HexValue gen_extract_op(Context *c,
> +                        YYLTYPE *locp,
> +                        HexValue *source,
> +                        HexValue *index,
> +                        HexExtract *extract) {

What's the difference between this ant the gen_rextract_op above?

> +    yyassert(c, locp, index->type =3D=3D IMMEDIATE,
> +             "Extract index must be immediate!\n");
> +    int bit_width =3D (source->bit_width =3D=3D 64) ? 64 : 32;
> +    const char *sign_prefix =3D (extract->is_unsigned) ? "" : "s";
> +    int width =3D extract->bit_width;
> +    HexValue res =3D gen_tmp(c, locp, bit_width);
> +    res.is_unsigned =3D extract->is_unsigned;
> +    OUT(c, locp, "tcg_gen_", sign_prefix, "extract_i", &bit_width,
> +        "(", &res, ", ", source);
> +    OUT(c, locp, ", ", index, " * ", &width, ", ", &width, ");\n");
> +
> +    /* Some extract operations have bit_width !=3D storage_bit_width */
> +    if (extract->storage_bit_width > bit_width) {
> +        HexValue tmp =3D gen_tmp(c, locp, extract->storage_bit_width);
> +        tmp.is_unsigned =3D extract->is_unsigned;
> +        if (extract->is_unsigned) {
> +            /* Extend unsigned */
> +            OUT(c, locp, "tcg_gen_extu_i32_i64(",
> +                &tmp, ", ", &res, ");\n");
> +        } else {
> +            /* Extend signed */
> +            OUT(c, locp, "tcg_gen_ext_i32_i64(",
> +                &tmp, ", ", &res, ");\n");
> +        }
> +        rvalue_free(c, locp, &res);
> +        res =3D tmp;
> +    }
> +
> +    rvalue_free(c, locp, source);
> +    rvalue_free(c, locp, index);
> +    return res;
> +}
> +
> +HexValue gen_read_creg(Context *c, YYLTYPE *locp, HexValue *reg)
> +{
> +    yyassert(c, locp, reg->type =3D=3D REGISTER, "reg must be a register=
!");
> +    if (reg->reg.id < 'a') {

What is this check telling us?

> +        HexValue tmp =3D gen_tmp_value(c, locp, "0", 32);
> +        const char *id =3D creg_str[(uint8_t)reg->reg.id];
> +        OUT(c, locp, "READ_REG(", &tmp, ", ", id, ");\n");

Change READ_REG to gen_read_reg - that's what the macro is.

> +        rvalue_free(c, locp, reg);
> +        return tmp;
> +    }
> +    return *reg;
> +}
> +


> +/* Circular addressing mode with auto-increment */
> +void gen_circ_op(Context *c,
> +                 YYLTYPE *locp,
> +                 HexValue *addr,
> +                 HexValue *increment,
> +                 HexValue *modifier) {
> +    HexValue increment_m =3D *increment;
> +    HexValue cs =3D gen_tmp(c, locp, 32);
> +    increment_m =3D rvalue_materialize(c, locp, &increment_m);
> +    OUT(c, locp, "READ_REG(", &cs, ", HEX_REG_CS0 + MuN);\n");

Change READ_REG to gen_read_reg

> +    OUT(c,
> +        locp,
> +        "gen_helper_fcircadd(",
> +        addr,
> +        ", ",
> +        addr,
> +        ", ",
> +        &increment_m,
> +        ", ",
> +        modifier);
> +    OUT(c, locp, ", ", &cs, ");\n");
> +    rvalue_free(c, locp, &increment_m);
> +    rvalue_free(c, locp, modifier);
> +    rvalue_free(c, locp, &cs);
> +}



> +void gen_load(Context *c, YYLTYPE *locp, HexValue *num, HexValue *size,
> +              bool is_unsigned, HexValue *ea, HexValue *dst)
> +{
> +    /* Memop width is specified in the load macro */
> +    int bit_width =3D (size->imm.value > 4) ? 64 : 32;
> +    const char *sign_suffix =3D (size->imm.value > 4)
> +                              ? ""
> +                              : ((is_unsigned) ? "u" : "s");
> +    char size_suffix[4] =3D { 0 };
> +    /* Create temporary variable (if not present) */
> +    if (dst->type =3D=3D VARID) {
> +        /* TODO: this is a common pattern, the parser should be varid-aw=
are.
> */
> +        varid_allocate(c, locp, dst, bit_width, is_unsigned);
> +    }
> +    snprintf(size_suffix, 4, "%" PRIu64, size->imm.value * 8);
> +    if (bit_width =3D=3D 32) {
> +        *dst =3D rvalue_truncate(c, locp, dst);
> +    } else {
> +        *dst =3D rvalue_extend(c, locp, dst);
> +    }

Why is the truncate/extend needed for the destination?

> +    int var_id =3D find_variable(c, locp, ea);
> +    yyassert(c, locp, var_id !=3D -1, "Load variable must exist!\n");
> +    /* We need to enforce the variable size */
> +    ea->bit_width =3D g_array_index(c->inst.allocated, Var, var_id).bit_=
width;
> +    if (ea->bit_width !=3D 32) {
> +        *ea =3D rvalue_truncate(c, locp, ea);
> +    }
> +    OUT(c, locp, "if (insn->slot =3D=3D 0 && pkt->pkt_has_store_s1) {\n"=
);
> +    OUT(c, locp, "process_store(ctx, pkt, 1);\n");

Indent

> +    OUT(c, locp, "}\n");
> +    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
> +    OUT(c, locp, "(", dst, ", ", ea, ", 0);\n");
> +    /* If the var in EA was truncated it is now a tmp HexValue, so free =
it. */
> +    rvalue_free(c, locp, ea);
> +}
> +
> +void gen_store(Context *c, YYLTYPE *locp, HexValue *num, HexValue
> *size,
> +               HexValue *ea, HexValue *src)
> +{
> +    /* Memop width is specified in the store macro */
> +    int mem_width =3D size->imm.value;
> +    /* Adjust operand bit width to memop bit width */
> +    if (mem_width < 8) {
> +        *src =3D rvalue_truncate(c, locp, src);
> +    } else {
> +        *src =3D rvalue_extend(c, locp, src);
> +    }

Why is this needed?

> +    assert(ea->type =3D=3D VARID);
> +    int var_id =3D find_variable(c, locp, ea);
> +    yyassert(c, locp, var_id !=3D -1, "Load variable must exist!\n");
> +    /* We need to enforce the variable size */
> +    ea->bit_width =3D g_array_index(c->inst.allocated, Var, var_id).bit_=
width;
> +    if (ea->bit_width !=3D 32) {
> +        *ea =3D rvalue_truncate(c, locp, ea);
> +    }

How can ea be not 32 bits?

> +    *src =3D rvalue_materialize(c, locp, src);
> +    OUT(c, locp, "gen_store", &mem_width, "(cpu_env, ", ea, ", ", src);
> +    OUT(c, locp, ", ctx, insn->slot);\n");
> +    rvalue_free(c, locp, src);
> +    /* If the var in ea was truncated it is now a tmp HexValue, so free =
it. */
> +    rvalue_free(c, locp, ea);
> +}
> +


> +void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
> +                 HexValue *dst, HexValue *val)
> +{
> +    yyassert(c, locp, hi->type =3D=3D IMMEDIATE &&
> +             hi->imm.type =3D=3D VALUE &&
> +             lo->type =3D=3D IMMEDIATE &&
> +             lo->imm.type =3D=3D VALUE,
> +             "Range deposit needs immediate values!\n");
> +
> +    *val =3D rvalue_truncate(c, locp, val);
> +    unsigned len =3D hi->imm.value + 1 - lo->imm.value;
> +    HexValue tmp =3D gen_tmp(c, locp, 32);
> +    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", val, ");\n");
> +    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst, ", ", &tmp, ", =
");
> +    OUT(c, locp, lo, ", ", &len, ");\n");


This doesn't match the C semantics of fSETBITS

#define fSETBIT(N, DST, VAL) \
    do { \
        DST =3D (DST & ~(1ULL << (N))) | (((uint64_t)(VAL)) << (N)); \
    } while (0)

#define fGETBIT(N, SRC) (((SRC) >> N) & 1)
#define fSETBITS(HI, LO, DST, VAL) \
    do { \
        int j; \
        for (j =3D LO; j <=3D HI; j++) { \
            fSETBIT(j, DST, VAL); \
        } \
    } while (0)

You need to put len copies of LSB(val), so emit something like this
    TCGv zero =3D tcg_const_tl(0);
    TCGv ones =3D tcg_const_tl(~0);
    tcg_gen_andi_tl(tmp, val, 1);
    tcg_gen_movcond_tl(TCG_COND_NE, tmp, tmp, zero, ones, zero);
    tcg_gen_deposit_tl(dst, dst, tmp, lo, len);
    tcg_temp_free(zero);
    tcg_temp_free(ones);



> +HexValue gen_rvalue_pow(Context *c, YYLTYPE *locp, HexValue *l,
> HexValue *r)

Which instruction calls this?  I don't think there is one.  If not, remove =
the POW token from the lexer and the associated rules from the parser.



> +HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v)
> +{
> +    const char *bit_suffix =3D (v->bit_width =3D=3D 64) ? "i64" : "i32";
> +    int bit_width =3D (v->bit_width =3D=3D 64) ? 64 : 32;
> +    HexValue res;
> +    res.is_unsigned =3D v->is_unsigned;
> +    res.is_dotnew =3D false;
> +    res.is_manual =3D false;
> +    if (v->type =3D=3D IMMEDIATE) {
> +        res.type =3D IMMEDIATE;
> +        res.imm.type =3D QEMU_TMP;
> +        res.imm.index =3D c->inst.qemu_tmp_count;
> +        OUT(c, locp, "int", &bit_width, "_t ", &res, " =3D abs(", v, ");=
\n");
> +        c->inst.qemu_tmp_count++;
> +    } else {
> +        res =3D gen_tmp(c, locp, bit_width);
> +        HexValue zero =3D gen_tmp_value(c, locp, "0", bit_width);
> +        OUT(c, locp, "tcg_gen_neg_", bit_suffix, "(", &res, ", ", v, ");=
\n");
> +        OUT(c, locp, "tcg_gen_movcond_i", &bit_width);
> +        OUT(c, locp, "(TCG_COND_GT, ", &res, ", ", v, ", ", &zero);

tcg_gen_abs_i<bit_width>

> +        OUT(c, locp, ", ", v, ", ", &res, ");\n");
> +        rvalue_free(c, locp, &zero);
> +        rvalue_free(c, locp, v);
> +    }
> +    return res;
> +}
> +
> +HexValue gen_rvalue_brev(Context *c, YYLTYPE *locp, HexValue *v)
> +{
> +    yyassert(c, locp, v->bit_width <=3D 32,
> +             "fbrev not implemented for 64-bit integers!");
> +    HexValue res =3D gen_tmp(c, locp, v->bit_width);
> +    *v =3D rvalue_materialize(c, locp, v);
> +    OUT(c, locp, "gen_fbrev(", &res, ", ", v, ");\n");

gen_helper_fbrev



> diff --git a/target/hexagon/idef-parser/parser-helpers.h
> b/target/hexagon/idef-parser/parser-helpers.h
> new file mode 100644

> +#define OUT(c, locp, ...) FOR_EACH((c), (locp), OUT_IMPL, __VA_ARGS__)

You should be able to handle indenting here.  Unfortunately, many of the C =
statements generated use multiple OUT invocations.
Create two macros
	OUT			prints indentation, then the text		used for beginning a line of outp=
ut
              OUT_CONTINUE	just print the text				used for continuing a lin=
e

> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index 329219463f..a2257d41a5 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -183,7 +183,7 @@ idef_parser_input_generated =3D custom_target(
>      command: [python, files('gen_idef_parser_funcs.py'),
> semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
>  )
>=20
> -idef_parser_input_generated_prep =3D custom_target(
> +preprocessed_idef_parser_input_generated =3D custom_target(

Don't change the name of this here, use the name you want in the patch wher=
e it was introduced.


