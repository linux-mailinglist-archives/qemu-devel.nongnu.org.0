Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0573B214F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 21:39:14 +0200 (CEST)
Received: from localhost ([::1]:56126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw8iP-0007ju-4I
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 15:39:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw8h9-000742-Lu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:37:55 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:41289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lw8h6-0006H5-Mp
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 15:37:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1624477072; x=1625081872;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RFI5m4BKdJ54RlL0uVIVBo3sjBBu3YEV4dYAVV5qsaw=;
 b=aLv46dje6gHkAxCyP6BZwijP8cr2ni7DZsqOTGVHWFX4uV7tCxcBVXc8
 BAO37mLafZCAXFz436mUnXJjixMdp2M5f1BAp/FbW8QShAn/Im2g1fPrb
 j4blVBnjxjPdv8Sr/Glt6rgA75cIC2qZNn6LltLHBTB54fYhtZXSdFqny E=;
IronPort-SDR: AFYN4g9Gll1CWybrqWBw2KsJk21ZQJ4Ip/sQoP7+yw2rdvlL3imsBliX6Wiv9HqaXQqp2xKkCs
 4nlYJEWjCPAL4ShUQXuig9/rzU2zHZj5T/FR83rKjBLngfZfxEVHSayb9hpCgRwMD/DnUnOIYi
 bFYLWa7B3iSmI9Wj/GKb3+IrO2D7inLchNA76//etrfa6A5RfGRsdIwc8/CywxvZm9pRCrhSlV
 kAPHBPsLQCLMaWEaikvtEbLECsi65KX+34L9ZI3ghp6B9L2PkTYfq7RaRtKK+0SmHUS/Wpv+L8
 Uuc=
Received: from mail-bn8nam12lp2169.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.169])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2021 19:37:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OsBcGk4PO+2x37G2RpjGamHEoMG8/Ox82b1m2NZyV672WtmjqIhOa7SOc0t52z5rpj2sgVC9Y2akDC9iMEVEOjg75e8MCWB/J1KTSVKizZQLW0tS+tdWJC3jf5mLVIBz4EblmQMpsSz3HlVTaEsirt5DVK9n7r4Zv/g528dUB2uQNpd/pq9etFulrHdTgRrnryfoE8bL5rxSa/IOCBVp2gmy/zkS3lxtW011bXSboSJojm252bodCblt2tm7dv/YvJsxJSZnbBEDrZqQec0jrQSnxEHzSlDirDWhNHfQF0WV1nQ+tlvvajv/bpEhlBOV3V8+4mIyhYunqUBfP4dSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pw/h4IC2WV9tr1UWxLMMTWX0ubZldNI3RRjRQDDs36I=;
 b=IeOYSU5F9EZi/HkiUAR1jhrllr5n9j0nsK5J4wdPsJIVdRbc2w96qFHgk1NHjs6N3JbvCnMy9YtIOrriY435/GmEwKtU82EzJkQidr3Yog8MH7dQzbeBZ62XQAYThV8ktxDzYdeKnZdJH9hhlSPEFb9JVED1hr2RA8Qp8ML8/04zdlBnGnWdEqOC2NH1elaubXpwpwcprbRmhIYaw7/iKiAoZmiaICu5KSPTFOWHEt+7JcgWzKIaRBpB0lckaCbnBsFqDcXiR1/Nl+6kgT+wJ3YP3Cthx2kWJqCWd+YJp03UazA4PWZFTNZukpR9cUGxbuosrY6AgtutQp3yINRJnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB7091.namprd02.prod.outlook.com (2603:10b6:a03:21c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Wed, 23 Jun
 2021 19:37:47 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::9533:5f34:8b3e:ed%6]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 19:37:47 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v5 08/14] target/hexagon: prepare input for the idef-parser
Thread-Topic: [PATCH v5 08/14] target/hexagon: prepare input for the
 idef-parser
Thread-Index: AQHXZO7AGxVftXBZK0er+PWGm5eECash+Hmg
Date: Wed, 23 Jun 2021 19:37:47 +0000
Message-ID: <BYAPR02MB48864DEF85F8049DB4ED5B98DE089@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210619093713.1845446-1-ale.qemu@rev.ng>
 <20210619093713.1845446-9-ale.qemu@rev.ng>
In-Reply-To: <20210619093713.1845446-9-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [76.120.51.212]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ea46076-e1f5-48db-f4b4-08d9367e6128
x-ms-traffictypediagnostic: BY5PR02MB7091:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB7091582CE5A7D545E633891EDE089@BY5PR02MB7091.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TWXRIoWkvq4doBkh1yYgLSofdFr6RXU0iqIYYkyzaqUVBZ1MaQSCuX+SuyAjA9DVYne5erPptyi2IJAt28rq/8ZamjQLvO+pasIZHgPx6d9KK0tiylBPT4UQb+HyZg0rQ6mB+pCfn9XpVtuw/CsvIVBRPmwCmwv6JHFM8fWQOTrkze32Y/CHQpK+IB/2Cb1EUyBrYL54rMxHYBOiL7I0g3ce7PiSm5f48eQli3eXyXXc+CgrXUgfx4OLevwtQIG6FGU+6uddVJZdDaaCLKY7aFKQrJfoXbHWjU+wESGefh1KN2UCMr5Vw8foVLrb6SlYhtkX52DrWeNJDoHBZaIo9XdIvC0QOfCL1T3xxdVxyK+kzciwsIj0dbBE3ZBBKJPAOzaj/Ne/9bGeYaixg9sOjcSVx4yxOWNthU665t0pQUy73leS7NLbF3fUxGHwD6kSBbYdzUh0bLxynGAUnVU0u0lEO2t1WK52mv1V/iT2OfohtuwcIVJfn1A0jcGqewi8h+HJLqMPglWW5otZJYAbnudlHQPhjSVuy8w8hB1XEWDgjsUnR3JDvSW9hQbFNo2F8C9TAz/bb0d8NzdLNOlAclrDD7ULIYVcJBRYGv49gbk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(346002)(39860400002)(136003)(366004)(38100700002)(122000001)(26005)(53546011)(9686003)(8936002)(55016002)(186003)(86362001)(83380400001)(6506007)(71200400001)(4326008)(7696005)(2906002)(478600001)(316002)(33656002)(66476007)(66946007)(76116006)(110136005)(66446008)(66556008)(64756008)(8676002)(5660300002)(52536014)(54906003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D+QT2NUn/kQtnnFgtYByf1mcydXr37dET55hPnQ7u0vYjIcOdXE7lr8THUzf?=
 =?us-ascii?Q?csOzhLsbEIhNo8X5m8yf1B65zzfCvMUlPt2GQVG0cUS6E1ZjOYM2eua6AcW6?=
 =?us-ascii?Q?ay1H5WJXTFYoG3l8e0/yLwWQYCkhSBzpL8k+/XtxTnGp6f/tO9e++GjP1yIg?=
 =?us-ascii?Q?vCCL5zC/6IYmPdc2RwVK5c9155+RWXHkIp8fC90KVRWMh7v/RstZhB57j6YR?=
 =?us-ascii?Q?2vyG+7RZGlGPu8aitJfT5MQJJtWM2GcHgE8/T0/98vs6kxkMQem7yyNaGhKH?=
 =?us-ascii?Q?EQCtUktW1Wfq7BoB5q3crtDtcj4p++Ot3BH9m/FPORXKKRIGAgsFXDHJAD0q?=
 =?us-ascii?Q?dmzi6HDSbrNQpoaiY1rsdHT1btzqWEbp6zfDZXIoOqohejp+hk4GhrtWNuxe?=
 =?us-ascii?Q?8DiYbcH/sPhiT+Kya7yhPSQhQ9dD1ixzMv3pUTTXwvtW5pT04bU9LHKSd8kK?=
 =?us-ascii?Q?VIgQmFXATU2r7opTwYo3VFp0yZ5AvBnA00qxOd68IMt64W6zkktv23l2DLNu?=
 =?us-ascii?Q?fb8FHH9vrypmSmlJCclexm65fbVWauZvC3lRW4R19exqLF8799YRdiFmyQAQ?=
 =?us-ascii?Q?/tEiN2hAFCeWUGr7fTjBj3vAuBgaO662Vm4dxp2en1cR1A7AnW62cv18THln?=
 =?us-ascii?Q?xmioDj64BT7HvDdmr9iegyEhlYdfzUy2zoHkb92Sb5Skd6jPhcFifPNL5y/L?=
 =?us-ascii?Q?FCA8lLl8ERlnkvjR1F7RSH41ATj2wpPKbwoYKkDb59QmFDY9q0so5qNYeBjv?=
 =?us-ascii?Q?dU9I/WLlCQFlxTpXCcSkNmnOBH2+NV0mMv9lQZZzK+4HD7mNQl0hb5bcwFiI?=
 =?us-ascii?Q?4nJlZHho/BHrn/pMvrRDhiz0gPg4FGHLC7Ao9c8RhqE4KHm4bnv3FIUPWcy8?=
 =?us-ascii?Q?1KwMJRerkecIUZTZa/MIJ0faNmT/QIuXgXopfed+jlP6O+X39TBF2sz95Oqi?=
 =?us-ascii?Q?WeZnxcXaSE91sZBVsbQ/p0Gz6AdrD5jUEHofqNcQa9ioR1FD2fGJVtXQHtkK?=
 =?us-ascii?Q?/m9/tSla/8mRm+VHhCGHMB+dI9ve6wklQzLlNP9zCCa2DqM1C0BiuVm05XyM?=
 =?us-ascii?Q?2ccmEB3v9EoePrZw7SGOZNe1rhBJtpsEx/2mrbanV7SIoJ+KEFlZLy5GPMjE?=
 =?us-ascii?Q?zPy1UWTjR6+Lw0OuZMh989klBT9jGpObAHouFtAr25uVw9OXwo2M8Vh05K0x?=
 =?us-ascii?Q?fpUwZLsaxx3ULOulaRAw4VEAiqslL0i+qeWIrquCeFYF2pKXhqx2x94w6Bfs?=
 =?us-ascii?Q?5ME0ZDycfflHQuvx7AegoPePQ08dCdNbrUBo/Wy3A2srtIBcZ8pzKQMD83QC?=
 =?us-ascii?Q?ZE1ZC43e1cKRwGl6aZdGJ4VO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea46076-e1f5-48db-f4b4-08d9367e6128
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jun 2021 19:37:47.2279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: njl6hCinu69iZTRplWVQbBI3B74ALVjHyOB3Pv62y/6qQ24naP3cYxFmsRSf0kVUtwnfYTLOWer2i31lO4tZow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7091
Received-SPF: pass client-ip=216.71.140.77; envelope-from=tsimpson@quicinc.com;
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
> Subject: [PATCH v5 08/14] target/hexagon: prepare input for the idef-pars=
er
>=20
> From: Alessandro Di Federico <ale@rev.ng>
>=20
> Introduce infrastructure necessary to produce a file suitable for being p=
arsed
> by the idef-parser.
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> ---
>  target/hexagon/gen_idef_parser_funcs.py | 114 ++++++++++++++++++
>  target/hexagon/idef-parser/macros.inc   | 153
> ++++++++++++++++++++++++
>  target/hexagon/idef-parser/prepare      |  24 ++++
>  target/hexagon/meson.build              |  17 +++
>  4 files changed, 308 insertions(+)
>  create mode 100644 target/hexagon/gen_idef_parser_funcs.py
>  create mode 100644 target/hexagon/idef-parser/macros.inc
>  create mode 100755 target/hexagon/idef-parser/prepare
>=20
> diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> index 6fd9360b74..bf4a0f76fa 100644
> --- a/target/hexagon/meson.build
> +++ b/target/hexagon/meson.build
> @@ -20,6 +20,7 @@ hexagon_ss =3D ss.source_set()  hex_common_py =3D
> 'hex_common.py'
>  attribs_def =3D meson.current_source_dir() / 'attribs_def.h.inc'
>  gen_tcg_h =3D meson.current_source_dir() / 'gen_tcg.h'
> +idef_parser_dir =3D meson.current_source_dir() / 'idef-parser'
>=20
>  #
>  #  Step 1
> @@ -175,4 +176,20 @@ hexagon_ss.add(files(
>      'fma_emu.c',
>  ))
>=20
> +idef_parser_input_generated =3D custom_target(
> +    'idef_parser_input.h.inc',
> +    output: 'idef_parser_input.h.inc',

Add depends: [semantics_generated],

> +    depend_files: [hex_common_py],

Add gen_tcg_h

> +    command: [python, files('gen_idef_parser_funcs.py'),
> +semantics_generated, attribs_def, gen_tcg_h, '@OUTPUT@'],
> +)
> +
> +idef_parser_input_generated_prep =3D custom_target(
> +    'idef_parser_input.preprocessed.h.inc',
> +    output: 'idef_parser_input.preprocessed.h.inc',
> +    input: idef_parser_input_generated,
> +    capture: true,
> +    depend_files: [hex_common_py],

Don't think this is needed.  If hex_common_py changes, the input will chang=
e.  But otherwise, this doesn't use hex_common.py.

> +    command: [idef_parser_dir / 'prepare', '@INPUT@', '-I' +
> +idef_parser_dir],

It would be more clear to add '-o', '@OUTPUT@' to the command.

> +)
> +
>  target_arch +=3D {'hexagon': hexagon_ss}
> --
> 2.31.1
>=20


