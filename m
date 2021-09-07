Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D214C402E35
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:12:01 +0200 (CEST)
Received: from localhost ([::1]:45470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfZg-0002qV-V3
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:12:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWj-00007u-7L
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:08:59 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:57259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWe-0003Gn-7o
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:08:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038132; x=1631642932;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q2d/Qu7jpERk9kU3eQoJR9JjUl7zdnnYxfh+p5Mf+p0=;
 b=aslQ+i6wD+4C9Zjn7eSDYEOT9PDNRFhkG4S2omycOR/9sMnViwcPYnaP
 NvgAit6ctA3ehzQ9l+RAcTnF7y/7Ae2/uSGleyMkKH3AaAhH/W9NVI5cr
 Q/mNALYgCCIrAIQ7rZXFpb09PREgZ6V78JOaismBAbD8zrJweA+XTnQC9 c=;
Received: from mail-sn1anam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PohvfW1YngbDMLoKsOjx3eXhoAiq0qaW7J86Nt4PolcMKZx6bzRRqp4NYBUEygXpsKrBiS6VD8aCV6kqeJpTOesdFc3rtez3YMB/TsqUdRw9rOxaMqd9KyY5QU+aElMfsgxA03UmgT36vNPZFxKW55wIcRhRpIJrRSrPQRFCBf30FzfvvJ+h3Qe1/Q7KlX9wzC1qMaLoO9T84rQBLZMSMamfUjhNsuQZsAd5fzGACpvBZ5Xdpx2mmf0ujDFKKCFZZXfJiUNrIkLjy8Yl/xfRvA8UPk+9mCun+FChN7EQt0vJpmv507Uagw0Lsq5BsZTQlUITkyoKsFyS0VpQUhDnMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=Q2d/Qu7jpERk9kU3eQoJR9JjUl7zdnnYxfh+p5Mf+p0=;
 b=MUiMlNdRwIcJQeal+aDMG9c25mrwNtfikJpx4EMbZCremCKFTBHAMlXk39i5dR+5WXSKEoiaUmbaw3OwpdFHhR9h532OaBA5dfbW5c/XwK6//bIEt62wxghUelXW5AKpuZtBiAdxBS1sZ93RMj05Iqz6kE5bWqqF63rABkkj2kJoBRl4SaqeQhhT5cCb42iEuVAuZY1fW69AvTnX6NFrAtyRfAu5QpAUhO+YRdP3Z2sIZ+ECVO8Z+msdnfBi4baXCSExlz1B7dHLD1m1WbXZVaAZkOPJ6dSiNkaE+iYuNaRW8eFFOICufbaUjqBGpDac1XgFwzzxY6DvGmlStsAEJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 18:08:48 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:08:48 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
Thread-Index: AQHXfWMeqjE2iwrfGEuuIzlTUW5JN6uXvjRg
Date: Tue, 7 Sep 2021 18:08:48 +0000
Message-ID: <BYAPR02MB488608119AE6FE137C9ACE3ADED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-9-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-9-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0f797558-0156-4563-973f-08d9722a8a65
x-ms-traffictypediagnostic: BY5PR02MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB63245194E67411641912EADDDED39@BY5PR02MB6324.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:215;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 35xuTewx5Zd0F/e4ERbCJcEcUqMeE96kCRfha7RP111/CIeat5FCWsSHvrqVTYZ2Xk9XS1Hq3FUIHUGTAApl+gdiKo+IS9Kv40233Kh1SoYct0VyyXpUrn8Zt5vFCXXYPgmllZT1nsygzvBwwGnDvIlcXQFfYeP1rp8MylszcGhqtuBuPD+OSvKrdkMYktlMtbWqlO7bVtSN5X8gd+rfPbYAnocHmNqW2QIcCl3nxZDNFHJuiGCUxC+w/q4q1vIZXET4M77bPp13RHc9kgh8jEz/vPUnDn8Z01h5DYyseexVhmTMJ4nYVLDvPx8v3jAMtRPBd/6f4rKXmfxKHcLP+DtOlL9Uv/yUVg29xWO4SatBQYLi9Zq8XjW5YKUFg6pujLS03iJzfSOwJ40Q79xE99gJxZezE6LFeUJ5zRwh3CvJMoj6RasbR7fi/qdhM2t8F61x1s5tMUOUxmL02vICeS/sc7PDmycxXoIn7uu91jmdmYva0V1kfyrsYKZQDYtZ0MZgDErTnYufYI/9Yz5qSoNanCjzF1ayo9IaNuKujNYiUmWdmnXoEumfPiKWBPsQU155Bo39qdDc0bUx1R8NkIemTrP0P7S2M/QRzzGb4+qwEbvrhzvmPYjg0eXZrUv3A3Lrk9W7gopzTZmSFvHPX2sC2uf6bHV4B8pkt1yCQw7FbZRMiDrF/ZcXhEF9eBp59aK6eKs8fQjt57JUpDkedA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(8936002)(4326008)(186003)(66946007)(33656002)(83380400001)(64756008)(122000001)(26005)(55016002)(5660300002)(9686003)(2906002)(316002)(110136005)(508600001)(6506007)(53546011)(54906003)(7696005)(71200400001)(86362001)(8676002)(66446008)(52536014)(38070700005)(66476007)(66556008)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TjcHj3UU26d6pFID+0hCC0bbeRQNeQaMYx0NuxabbpJMjM6Xm8qq3K0yWdef?=
 =?us-ascii?Q?PnnOCT+2V/kIVAw7Smn71lUF5+x7oJzGWhKbYnkxF/SykmA2yHbOekZgoa/w?=
 =?us-ascii?Q?l8qBypQyPpBmlpQRnwgFiSaYB5Xe53tPoasuOq8aEAVEGsXz2FiEKemJKOWn?=
 =?us-ascii?Q?wa48xlmZ8z2OtnDAiok5kUQPf5EXv1qny4/JrYetjAWHLCMOdCuE+PCRTeiX?=
 =?us-ascii?Q?lUBb2F4QXmbfq5h9RF9rlp9pfv9WwZIHUZm5r0woMRnPAZDyP9Em/09ZM5gi?=
 =?us-ascii?Q?8mRWozl4LTDH++tbN8kLcg6yxrf3NUMlO03+UXPSoxLGBv9JqHG6KQ9pZ0It?=
 =?us-ascii?Q?Xmimq6zrzIAJoUJlWvikEl+i5E4QoMDDhg9grwD4fFoDZG7QZX+xUcVn4nbm?=
 =?us-ascii?Q?sTMI1NX4ajNcaWfablcxX+Nn/GDbzZ4YxlY/e1h1mB4Y4NXQHQ1xBV1sEpt6?=
 =?us-ascii?Q?w3ZT1C7h9DwvZ5tZOcIpaj9k7r2gCxyEIx73owh+6z3x1qE2TntjirP0fen2?=
 =?us-ascii?Q?CR6pZkax4UTSnkWQ11OhHg99/sC95G8+rVhK1DeohihL5QIEXNAMS9JiOPFN?=
 =?us-ascii?Q?XFPBzyRiRGLZSh5ZjRihlGKB3LkSjpK5B7kzr0Ca+gmatIIi+B+EYt0cK3c/?=
 =?us-ascii?Q?HYItuO9gRFgzf8mpAwYRfQfKQMpiKr4Eu6E7oghoinp7h67ocFeT6Ngn2n37?=
 =?us-ascii?Q?R3ZlPmHivUuYd/GTtQzwfEHY1v5du+6ElVWro2yDs8+qVDfRx6PfjBnJJRgR?=
 =?us-ascii?Q?vBAvxo71gBBpQ60eYK71krYy3KzeSUKft4Q47556Sx0fftx9nd6UdetB7wtq?=
 =?us-ascii?Q?jvADTFFFFioOaiJuEU+EreHhnnGx2OtFwZIhCldvEBj+AjC38R4Jqbx5hWqj?=
 =?us-ascii?Q?M5ko5OO75K4arEFiQ4aBNOtQzDvHiGJzjxbZmQijYIczHPxmkYrEeOk8cVjF?=
 =?us-ascii?Q?WeswXdH2hUKFpVpON6KiIGSz4c86GDFFjdhWWBnCz4FgPUlhCPKk2kLbvw8V?=
 =?us-ascii?Q?YHnK1qNIyiLKGqeiID0QKIDTZ0aPCMGluJAFeyitIwLja9BrjT+m0ou8moMa?=
 =?us-ascii?Q?BwidmuEEi6zH+3WWpFtqlvKWCD7bzLi9DgsH0DW6W2f7DKV+uqpLcAdSdmZu?=
 =?us-ascii?Q?pavnYv6hNZJtmZU5ZNKm7O/2PrC+Q2wX4e2SKaYDXXaSr2tZICT0/m3Taass?=
 =?us-ascii?Q?qODzSWBrK3W2438Rg3CoU0yO6xKgtm+g1Blz1z/ZfftRq9278N2oL6Mis1Gv?=
 =?us-ascii?Q?Ofyhma1w4hW+dj/IHr1HHFSjAwFOiGh9B4/shZrrR0EhIiAUVrbP+StoUjJo?=
 =?us-ascii?Q?keMUFwj+evx64ReoSiUbSKbE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f797558-0156-4563-973f-08d9722a8a65
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:08:48.4363 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HvhCe2DL5pSD4k4CnVs5YopETDmJJoAlfqc68s7fJ0RaW9wXYG6KsmJK3b83vDj37spnYWpKbym1FW94Mwsmiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6324
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
Cc: "babush@rev.ng" <babush@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "nizzo@rev.ng" <nizzo@rev.ng>, Alessandro Di Federico <ale@rev.ng>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Tuesday, July 20, 2021 7:30 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v6 08/12] target/hexagon: import lexer for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> ---
>  target/hexagon/idef-parser/idef-parser.h      | 258 +++++++
>  target/hexagon/idef-parser/idef-parser.lex    | 642 ++++++++++++++++++
>  target/hexagon/meson.build                    |   4 +
>  tests/docker/dockerfiles/alpine.docker        |   1 +
>  tests/docker/dockerfiles/centos8.docker       |   1 +
>  tests/docker/dockerfiles/debian-amd64.docker  |   1 +
>  tests/docker/dockerfiles/debian10.docker      |   1 +
>  .../dockerfiles/fedora-i386-cross.docker      |   1 +
>  .../dockerfiles/fedora-win32-cross.docker     |   1 +
>  .../dockerfiles/fedora-win64-cross.docker     |   1 +
>  tests/docker/dockerfiles/fedora.docker        |   1 +
>  tests/docker/dockerfiles/opensuse-leap.docker |   1 +
>  tests/docker/dockerfiles/ubuntu.docker        |   1 +
>  tests/docker/dockerfiles/ubuntu1804.docker    |   1 +
>  tests/docker/dockerfiles/ubuntu2004.docker    |   2 +

Here you are adding flex to several docker files, then in the next patch yo=
u add bison.  Create a single patch with the necessary changes to the docke=
r files together that is separate from the idef lexer for Hexagon.

>  15 files changed, 917 insertions(+)
>  create mode 100644 target/hexagon/idef-parser/idef-parser.h
>  create mode 100644 target/hexagon/idef-parser/idef-parser.lex
>=20
> diff --git a/target/hexagon/idef-parser/idef-parser.h b/target/hexagon/id=
ef-
> parser/idef-parser.h
> new file mode 100644
> +/**
> + * Type of register, assigned to the HexReg.type field
> + */
> +typedef enum {GENERAL_PURPOSE, CONTROL, MODIFIER, DOTNEW}
> RegType;

Should be HexRegType to match the other names in this file (e.g., HexSigned=
ness)

> +/**
> + * Semantic record of the PRE token, identifying a predicate
> + */
> +typedef struct HexPre {
> +    char id;                /**< Identifier of the predicate            =
     */
> +} HexPre;

Call this HexPred - HexPre sounds like something that comes before ...


> diff --git a/target/hexagon/idef-parser/idef-parser.lex
> b/target/hexagon/idef-parser/idef-parser.lex

> +REG_ID_32                e|s|d|t|u|v|x|y
> +REG_ID_64                ee|ss|dd|tt|uu|vv|xx|yy
> +SYS_ID_32                s|d
> +SYS_ID_64                ss|dd
> +LOWER_PRE                d|s|t|u|v|e|x|x

Call this PRED_ID to be consistent with REG_ID_32, etc

> +"R"{REG_ID_32}"V" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D GENERAL_PURPOSE;
> +                           yylval->rvalue.reg.id =3D yytext[1];
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return REG; }

> +"in R"{REG_ID_32}"V" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D GENERAL_PURPOSE;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }

Are you dropping the "in" here?  This looks the same as the "R"(REG_ID_32}"=
V" case.

Ditto for all the ones below ...

> +"in R"{REG_ID_64}"V" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D GENERAL_PURPOSE;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 64;
> +                           yylval->rvalue.bit_width =3D 64;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }
> +"in N"{REG_ID_32}"N" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D DOTNEW;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }
> +"in N"{REG_ID_64}"N" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D DOTNEW;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 64;
> +                           yylval->rvalue.bit_width =3D 64;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }
> +"in P"{LOWER_PRE}"V" {
> +                           yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D yytext[4];
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RPRE; }
> +"in P"{LOWER_PRE}"N" {
> +                           yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D yytext[4];
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RPRE; }
> +"in MuV" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D MODIFIER;
> +                           yylval->rvalue.reg.id =3D 'u';
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }
> +"in C"{REG_ID_32}"V" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D CONTROL;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 32;
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }
> +"in C"{REG_ID_64}"V" {
> +                           yylval->rvalue.type =3D REGISTER_ARG;
> +                           yylval->rvalue.reg.type =3D CONTROL;
> +                           yylval->rvalue.reg.id =3D yytext[4];
> +                           yylval->rvalue.reg.bit_width =3D 64;
> +                           yylval->rvalue.bit_width =3D 64;
> +                           yylval->rvalue.is_dotnew =3D false;
> +                           yylval->rvalue.signedness =3D SIGNED;
> +                           return RREG; }


> +"fGEN_TCG_"{INST_NAME}"(" { return FWRAP; }

When would one of these need to be parsed?

> +"fNEWREG"                |
> +"fCAST4s"                { yylval->cast.bit_width =3D 32;
> +                           yylval->cast.signedness =3D SIGNED;
> +                           return CAST; }

This doesn't look right - is fNEWREG the same as fCAST4s?


> +"fNEWREG_ST"             |
> +"fIMMEXT"                |
> +"fMUST_IMMEXT"           |
> +"fCAST2_2s"              |
> +"fCAST2_2u"              |
> +"fCAST4_4s"              |
> +"fCAST8_8s"              |
> +"fZE8_16"                |
> +"fSE8_16"                |
> +"fZE16_32"               |
> +"fSE16_32"               |
> +"fZE32_64"               |
> +"fPASS"                  |
> +"fECHO"                  { return IDENTITY; }

The fCAST, fZE, and fSE macros are not the same as identity.

=20
> +"fCONSTLL"               { return CONSTLL; }
> +"fCONSTULL"              { return CONSTULL; }

These can just be converts.

> +"fHINTJR(RsV)"           { /* Emit no token */ }

Put this in the list of IDENTITY above



