Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE566402E30
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 20:11:02 +0200 (CEST)
Received: from localhost ([::1]:43344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNfYj-0001Nt-VL
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 14:11:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWN-000869-VR
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:08:36 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.140.77]:34132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1mNfWJ-00032X-8d
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 14:08:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1631038111; x=1631642911;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RtRb9Sl8IXu2yaHaZH9ZwcNk05/rjnFEaKgml3vA5Vc=;
 b=UVRHYuNAwL144NyjZxBY4guZPECBUBsKAWFIfuZLDgyr4i14Luoaetkm
 pJL/q3KguOvL+dO1AAbdKxtA+W3sRyQ5xB4d7OL8pJsUVniUAcNIyKgHh
 kHMzHozM8qw4Gd3d1RUH28D3JFVodEfoHTdsjLjmR2hENGcJRe2KTkYxf Q=;
Received: from mail-sn1anam02lp2044.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.44])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2021 18:08:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I0OP2TM5WG0tB4yy0Gw7leknjHFR7u8E2MieZ2gp+V/KOmKtj5EdOj16oRJsE0JjtdaPO6o4CZSojJyISYCO6hNJVDdfU+DSkYivCfBXKWV2o775j5yFkR63q03N9IcAdp6Y2K1GXU8PVgbwsy9769saCmRhLyE/HONXi7pEgo7rwiNLBB4uCHPFhiJYiEM4iENUQndqvqjwibUM8knCsSktZPaBhm0RMejkPxbkvvf2k42wA33RjBJA3M8Vi8aHyr01EHcp57E8vEfaBlkstH8oGHkaKUmOKM4SOGsXSELfGrTniFaQ6m/E6439GURUtXImr1u7Dn/RHOmXEAqpVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=RtRb9Sl8IXu2yaHaZH9ZwcNk05/rjnFEaKgml3vA5Vc=;
 b=eUq7nGasd/CJ4koDuTnlBQUT/IshlDF4vwKnSHUZkEIIYtZcGCF7E2gCBmEK00zoGpQKReFpc97ZkXjUjJqUjD+zfyApSGlOUJIl0aZWzC/zpG1LI7Rf8Fahq6BwBY2pKTul19NBjBctq4CKKFLYWP0iGkw0idgTFHRaGR3zPuNC9mScx/UdSJj7p36fRFpxCLs2+PIOf65aC60gsc5Q+8fNExNGWnEPfOo2HuDINZ/FaCIscP4hGzQtKECJ5bZ24nRrazmzYElf1Rl+BpAb78zIQzumpCpqaBzyr5pyjiMDNKHCqYQwbKtHxwnWDjobFe9uNckPlbN9gGW/moT9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BY5PR02MB6324.namprd02.prod.outlook.com (2603:10b6:a03:1f6::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Tue, 7 Sep
 2021 18:08:24 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::d91d:e6d8:ee5d:77b5%6]) with mapi id 15.20.4478.025; Tue, 7 Sep 2021
 18:08:24 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
Thread-Index: AQHXfWMqqFcgcKOnD065oDp4orZU7quXyTdw
Date: Tue, 7 Sep 2021 18:08:24 +0000
Message-ID: <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-10-ale.qemu@rev.ng>
In-Reply-To: <20210720123031.1101682-10-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a71bb7c9-db77-4aee-eefd-08d9722a7bd6
x-ms-traffictypediagnostic: BY5PR02MB6324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6324D3C0B88840C56B16BBBEDED39@BY5PR02MB6324.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:403;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ulQP0vHPrYP2Kgwe23dLYKuzFTIOl6kGUmrLqxDojVoSw5T6ide401RZkyUHkcTYpMlL8vJpEque4230TezSkRvD9OHN9Z0wEgzQmGTe3T1vXaXA+wqTMK76k+Cj0LVL1PAEDJLq2EnrD83nvNmSD27+0oXg89PX5rjN8LqoQTz8KhwcysxRRmXwgd339EVqBqr7H65EZdrcubcWN//Doi8vfiNMyxxb8kFT2LWNcCv9O6eBxwf1AmRthjyAG/Yi3WpykpoZZH0MbeQoVDSB+ii6WUQ6Sj8g+2Mt8GP//cuk6m8AhzAT1+PrGMJYFgIgrISKzKoWZ7k0k5l5SAlO5G2wwS3nQ83VHG7q23AfaWv6oQPp++40jzTaHKJt72T12bwIP4X1u23OCH0SGUxAGuTVMR3ZvnAUlvxb4o0W45XE7qGYkR3PB78o3s/pzakNqHzTLiJNvcHZF7Hk0FB7+AEmjVkWowQbc/5FdRR71tNRNVrxgUGf0xT4RkCr8LV+DkQTVO+aom68HBthuEx2rZiH3T0u3nDk10I41nif/PLG6o03gHrR8TivT7UyHtRRXfhLNGvcM3TRZripxvhHphz4jRnWxb7UeIwIKYRaXWmnfDjiGb8aeZ++cfcBTMHn8oQ1RZLgEH3pjxzeLo8T3yBY55A9pGAPDBbFstENmXdYqMkbdaQgPsrlkcOxusPWE/f4BUV/jGee+mhhh26+sA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(30864003)(38100700002)(8936002)(4326008)(186003)(66946007)(33656002)(83380400001)(64756008)(122000001)(26005)(55016002)(5660300002)(9686003)(2906002)(316002)(110136005)(508600001)(6506007)(53546011)(54906003)(7696005)(71200400001)(86362001)(8676002)(66446008)(52536014)(38070700005)(66476007)(66556008)(76116006)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?9goA8rASIvpuLoDlpFO+BqYnE+jJuINZFCHU0mTe+7VdCqRbbfn/Sa8hUnjP?=
 =?us-ascii?Q?LhoNT45X6ovCBb+vvtt9PQufbf53fEqujh2dntomidNzvUGmH+HZqc2FG/Wz?=
 =?us-ascii?Q?HTxT78mCqnQYrMsgf6cjmFXKIY+412SNMmANKglqaRqm8cY2dehywgg9sO57?=
 =?us-ascii?Q?O5HA4ANddo7p1DCGBab2P1dfmJIMjJPu6E5anlnCP0yPngoRZaQSIGRhJ3m3?=
 =?us-ascii?Q?t0+AGCvMZtgIXbQ79QXzc88MiIzBRvxCRKUhSwnt5/9P40PbN3+RbSOxLCBP?=
 =?us-ascii?Q?bG8wrGHC89ZDU4cYbqtkL0us6++R47oavY69a8c3CnrRiPiMpis3cMEtsiOY?=
 =?us-ascii?Q?RCHOoAspnge436XoBc05HubcCYxl4uf2FOmiEXvupkbSQRWOY5NbydU0Myzn?=
 =?us-ascii?Q?OXn3CXI4fK8tBAIFonQXLcKxYEYad7GphQrArjPr83dCeH/TwEm5buSnvhlg?=
 =?us-ascii?Q?SdLc5j5yfsjf2CQzKUWHcx/nCBIWfBMM1P9Ny0jkgvaKzpBySrcL1w1LylnU?=
 =?us-ascii?Q?0ntW2pmVNjaFqxg90gqtqJPmkVv2J5SZ0v/Tv0tR34v/fQEiFZEOyEIVw6/b?=
 =?us-ascii?Q?d+brpghj04e7mfJlIgje4rXUvbWhklGxEzNA4jfnqW3bIZ4o5AacSaH+btKq?=
 =?us-ascii?Q?fhk3c/bKb70GsTWaLupLIEn9aKv8jojcHeAWZJHl9WG+fhmtRL1fUavl5daw?=
 =?us-ascii?Q?K+Tyz8AI77sZUyBUZ6uY9o67aUEd51TcpikwMpZ7icNNTJE25aTSZUbb7Iwx?=
 =?us-ascii?Q?xFPQ0GgNMXeBmPUA6HRap8/w5N6P+fp5JmUjoJo+o4TnHkqE/qAR/dZsV6dM?=
 =?us-ascii?Q?VGOqRCTHnHH4jugZ5GrdGozGuIJGK5KvY7xbheAd7yvdts7p/2PhTF5l41jS?=
 =?us-ascii?Q?no8j3IiCwDgSKQRNYHbIHjm6q4sDVL144EtQXqcCtpo/8l6xgVRn2zSdzQgi?=
 =?us-ascii?Q?CLbqerOCDgW5pzDtCIAkPB+696ZHoTkgRcJOJv6uX65LoWWkeCvfpON1Lrf2?=
 =?us-ascii?Q?eDUQkyA/0aNYqU5K+ykPRGGu+qYANUn0Ng6oGDzX9A7/s7RYthzWln7Oem6i?=
 =?us-ascii?Q?dH3L4qB0kl2FDXCj9YpCpPQK2aWMoXfP2Ei09fIqo3Jle10a1+EEVLkBWPJu?=
 =?us-ascii?Q?9/Tu+dCz8/5RLFlfyhu0WgNvcvBJ2nBV0sIH08kEhY+pOdfWSo1uVsul4tT8?=
 =?us-ascii?Q?dAlAJDlO3xMIX9N/70Fpw+5tVQSGGumLDUE12yvdM4+NKdZim840jYyHS6y2?=
 =?us-ascii?Q?HPBGETN+FV2Ge8TU7wjbBCkCL90rpi1qh+HMJE2WNQENezv/JBTp/bS5haS5?=
 =?us-ascii?Q?ygLv7HeiedSKC3O3WTJDJPtM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a71bb7c9-db77-4aee-eefd-08d9722a7bd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 18:08:24.0702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zikcbVrvgJPmbZMr68L9UlzpOmaG9N62MtGAscJdl9Do0i1Qco4g6/hZpPOQQapdNoZ2swiw2fEJVIvS71q+2Q==
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
> Subject: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
>=20
> From: Paolo Montesel <babush@rev.ng>
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>


> diff --git a/target/hexagon/idef-parser/parser-helpers.h
> b/target/hexagon/idef-parser/parser-helpers.h
> +#define OUT_IMPL(c, locp, x)                    \
> +    _Generic(*x,                                \
> +        char:      str_print,                   \
> +        uint8_t:   uint8_print,                 \
> +        uint64_t:  uint64_print,                \
> +        int:       int_print,                   \
> +        unsigned:  uint_print,                  \
> +        HexValue:  rvalue_out,                  \
> +        default:   out_assert                   \
> +    )(c, locp, x);

Unless something has changed, qemu requires building with GCC 4.8 which is =
old enough that it doesn't support C11 _Generic.


> +HexValue gen_bin_cmp(Context *c,
> +                     YYLTYPE *locp,
> +                     TCGCond type,
> +                     HexValue *op1_ptr,
> +                     HexValue *op2_ptr);
> +
> +/* Code generation functions */

Move this comment above the previous function

> +HexValue gen_bin_op(Context *c,
> +                       YYLTYPE *locp,
> +                       OpType type,
> +                       HexValue *operand1,
> +                       HexValue *operand2);
> +
> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> new file mode 100644

> +void pre_print(Context *c, YYLTYPE *locp, HexPre *pre, bool is_dotnew)
> +{
> +    (void) locp;
> +    char suffix =3D is_dotnew ? 'N' : 'V';
> +    EMIT(c, "P%c%c", pre->id, suffix);
> +}

Call this pred_print

> +
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
> +        reg_id[0] =3D 'N';
> +        reg_id[1] =3D reg->id;
> +        reg_id[2] =3D 'N';
> +        return;
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

It would be better to zero out the result in the above function than having=
 the caller do it.

> +
> +static void reg_arg_print(Context *c, YYLTYPE *locp, HexReg *reg)
> +{
> +    char reg_id[5] =3D { 0 };

This is where the caller zero's out the result ...

> +    reg_compose(c, locp, reg, reg_id);
> +    EMIT(c, "%s", reg_id);
> +}


> +/* Temporary values creation */
> +HexValue gen_tmp(Context *c, YYLTYPE *locp, unsigned bit_width)

You should pass the signedness as an argument rather than assuming it's sig=
ned.

> +{
> +    HexValue rvalue;
> +    memset(&rvalue, 0, sizeof(HexValue));
> +    rvalue.type =3D TEMP;
> +    assert(bit_width =3D=3D 32 || bit_width =3D=3D 64);
> +    rvalue.bit_width =3D bit_width;
> +    rvalue.signedness =3D SIGNED;
> +    rvalue.is_dotnew =3D false;
> +    rvalue.is_manual =3D false;
> +    rvalue.tmp.index =3D c->inst.tmp_count;
> +    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
> +        " =3D tcg_temp_new_i", &bit_width, "();\n");
> +    c->inst.tmp_count++;
> +    return rvalue;
> +}
> +
> +HexValue gen_tmp_value(Context *c,
> +                       YYLTYPE *locp,
> +                       const char *value,
> +                       unsigned bit_width)

You should pass the signedness as an argument rather than assuming it's sig=
ned.

> +{
> +    HexValue rvalue;
> +    memset(&rvalue, 0, sizeof(HexValue));
> +    rvalue.type =3D TEMP;
> +    rvalue.bit_width =3D bit_width;
> +    rvalue.signedness =3D SIGNED;
> +    rvalue.is_dotnew =3D false;
> +    rvalue.is_manual =3D false;
> +    rvalue.tmp.index =3D c->inst.tmp_count;
> +    OUT(c, locp, "TCGv_i", &bit_width, " tmp_", &c->inst.tmp_count,
> +        " =3D tcg_const_i", &bit_width, "(", value, ");\n");
> +    c->inst.tmp_count++;
> +    return rvalue;
> +}
> +
> +static HexValue gen_tmp_value_from_imm(Context *c,
> +                                       YYLTYPE *locp,
> +                                       HexValue *value)
> +{
> +    assert(value->type =3D=3D IMMEDIATE);
> +    HexValue rvalue;
> +    memset(&rvalue, 0, sizeof(HexValue));
> +    rvalue.type =3D TEMP;
> +    rvalue.bit_width =3D value->bit_width;
> +    rvalue.signedness =3D value->signedness;
> +    rvalue.is_dotnew =3D false;
> +    rvalue.is_manual =3D false;
> +    rvalue.tmp.index =3D c->inst.tmp_count;
> +    OUT(c, locp, "TCGv_i", &rvalue.bit_width, " tmp_", &c->inst.tmp_coun=
t);
> +    OUT(c, locp, " =3D tcg_const_i", &rvalue.bit_width,
> +        "((int", &rvalue.bit_width, "_t) (", value, "));\n");

Is the type conversion necessary?  You've copied the bit_width and the sign=
edness from the value.

> +    c->inst.tmp_count++;
> +    return rvalue;
> +}
> +
> +HexValue gen_imm_value(Context *c __attribute__((unused)),
> +                       YYLTYPE *locp,
> +                       int value,
> +                       unsigned bit_width)

You should pass the signedness as an argument rather than assuming it's sig=
ned.

> +{
> +    (void) locp;
> +    HexValue rvalue;
> +    memset(&rvalue, 0, sizeof(HexValue));
> +    rvalue.type =3D IMMEDIATE;
> +    rvalue.bit_width =3D bit_width;
> +    rvalue.signedness =3D SIGNED;
> +    rvalue.is_dotnew =3D false;
> +    rvalue.is_manual =3D false;
> +    rvalue.imm.type =3D VALUE;
> +    rvalue.imm.value =3D value;
> +    return rvalue;
> +}


> +void gen_varid_allocate(Context *c,
> +                        YYLTYPE *locp,
> +                        HexValue *varid,
> +                        int width,
> +                        HexSignedness signedness)
> +{
> +    assert_signedness(c, locp, signedness);
> +    varid->bit_width =3D width;
> +    const char *bit_suffix =3D width =3D=3D 64 ? "64" : "32";
> +    int index =3D find_variable(c, locp, varid);
> +    bool found =3D index !=3D -1;
> +    if (found) {
> +        Var *other =3D &g_array_index(c->inst.allocated, Var, index);
> +        varid->var.name =3D other->name;
> +        varid->bit_width =3D other->bit_width;
> +        varid->signedness =3D other->signedness;

Do you need to check that "other" has the same bit_width and signedness?

> +    } else {
> +        EMIT_HEAD(c, "TCGv_i%s %s", bit_suffix, varid->var.name->str);
> +        EMIT_HEAD(c, " =3D tcg_temp_local_new_i%s();\n", bit_suffix);
> +        Var new_var =3D {
> +            .name =3D varid->var.name,
> +            .bit_width =3D width,
> +            .signedness =3D signedness,
> +        };
> +        g_array_append_val(c->inst.allocated, new_var);
> +    }
> +}
> +
> +void gen_operands_extend(Context *c,
> +                         YYLTYPE *locp,
> +                         HexValue *op1,
> +                         HexValue *op2) {
> +    enum OpTypes op_types =3D (op1->type !=3D IMMEDIATE) << 1
> +                            | (op2->type !=3D IMMEDIATE);
> +
> +    switch (op_types) {
> +    case IMM_IMM:
> +        break;
> +    case IMM_REG:
> +        *op2 =3D gen_rvalue_extend(c, locp, op2);
> +        break;
> +    case REG_IMM:
> +        *op1 =3D gen_rvalue_extend(c, locp, op1);
> +        break;
> +    case REG_REG:
> +        *op1 =3D gen_rvalue_extend(c, locp, op1);
> +        *op2 =3D gen_rvalue_extend(c, locp, op2);
> +        break;
> +    }
> +}

Why are you only extending the REG operands?  Will you ever need to extend =
the IMM operands (e.g., 32-bit immediate and 64-bit register)?

> +static void gen_andl_op(Context *c, YYLTYPE *locp, unsigned bit_width,
> +                        const char *bit_suffix, HexValue *res,
> +                        enum OpTypes op_types, HexValue *op1, HexValue *=
op2)
> +{
> +    HexValue zero, tmp1, tmp2;
> +    memset(&zero, 0, sizeof(HexValue));
> +    memset(&tmp1, 0, sizeof(HexValue));
> +    memset(&tmp2, 0, sizeof(HexValue));
> +    switch (op_types) {
> +    case IMM_IMM:
> +        OUT(c, locp, "int", &bit_width, "_t ",
> +            res, " =3D ", op1, " && ", op2, ";\n");
> +        break;
> +    case IMM_REG:
> +        zero =3D gen_tmp_value(c, locp, "0", 32);
> +        tmp2 =3D gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
> +        OUT(c, locp, "tcg_gen_andi_", bit_suffix,
> +            "(", res, ", ", op1, " !=3D 0 , ", &tmp2, ");\n");
> +        gen_rvalue_free(c, locp, &tmp2);
> +        break;
> +    case REG_IMM:
> +        zero =3D gen_tmp_value(c, locp, "0", 32);
> +        tmp1 =3D gen_bin_cmp(c, locp, TCG_COND_NE, op1, &zero);
> +        OUT(c, locp, "tcg_gen_andi_", bit_suffix,
> +            "(", res, ", ", &tmp1, ", ", op2, " !=3D 0);\n");
> +        gen_rvalue_free(c, locp, &tmp1);
> +        break;
> +    case REG_REG:
> +        zero =3D gen_tmp_value(c, locp, "0", 32);
> +        zero.is_manual =3D true;
> +        tmp1 =3D gen_bin_cmp(c, locp, TCG_COND_NE, op1, &zero);
> +        tmp2 =3D gen_bin_cmp(c, locp, TCG_COND_NE, op2, &zero);
> +        OUT(c, locp, "tcg_gen_and_", bit_suffix,
> +            "(", res, ", ", &tmp1, ", ", &tmp2, ");\n");
> +        gen_rvalue_free_manual(c, locp, &zero);
> +        gen_rvalue_free(c, locp, &tmp1);
> +        gen_rvalue_free(c, locp, &tmp2);
> +        break;
> +    }
> +}

This might be OK for everything in the Hexagon semantics files.  However, i=
t doesn't match the C semantics of the && operator.
In C, the expression X && Y only evaluates Y after we check that X is true.

> +/* Code generation functions */
> +HexValue gen_bin_op(Context *c,
> +                    YYLTYPE *locp,
> +                    OpType type,
> +                    HexValue *operand1,
> +                    HexValue *operand2)
> +{
> +    /* Replicate operands to avoid side effects */
> +    HexValue op1 =3D *operand1;
> +    HexValue op2 =3D *operand2;
> +
> +    /* Enforce variables' size */
> +    if (op1.type =3D=3D VARID) {
> +        int index =3D find_variable(c, locp, &op1);
> +        yyassert(c, locp, c->inst.allocated->len > 0,
> +                 "Variable in bin_op must exist!\n");
> +        op1.bit_width =3D g_array_index(c->inst.allocated, Var, index).b=
it_width;
> +    }
> +    if (op2.type =3D=3D VARID) {
> +        int index =3D find_variable(c, locp, &op2);
> +        yyassert(c, locp, c->inst.allocated->len > 0,
> +                 "Variable in bin_op must exist!\n");
> +        op2.bit_width =3D g_array_index(c->inst.allocated, Var, index).b=
it_width;
> +    }

It's not clear what these checks are doing - please add a comment.

> +
> +    enum OpTypes op_types =3D (op1.type !=3D IMMEDIATE) << 1
> +                            | (op2.type !=3D IMMEDIATE);
> +
> +    bool op_is64bit =3D op1.bit_width =3D=3D 64 || op2.bit_width =3D=3D =
64;
> +
> +    /* Shift greater than 32 are 64 bits wide */
> +    if (type =3D=3D ASL_OP && op2.type =3D=3D IMMEDIATE &&
> +        op2.imm.type =3D=3D VALUE && op2.imm.value >=3D 32)
> +        op_is64bit =3D true;

Need curly braces per qemu coding conventions

> +
> +    /* Extend to 64-bits, if required */
> +    if (op_is64bit) {
> +        gen_operands_extend(c, locp, &op1, &op2);
> +    }
> +
> +    HexValue res;
> +    memset(&res, 0, sizeof(HexValue));
> +    const char *bit_suffix =3D op_is64bit ? "i64" : "i32";
> +    int bit_width =3D (op_is64bit) ? 64 : 32;
> +    if (op_types !=3D IMM_IMM) {
> +        res =3D gen_tmp(c, locp, bit_width);
> +    } else {
> +        res.type =3D IMMEDIATE;
> +        res.is_dotnew =3D false;
> +        res.is_manual =3D false;
> +        res.imm.type =3D QEMU_TMP;
> +        res.imm.index =3D c->inst.qemu_tmp_count;
> +        res.bit_width =3D bit_width;
> +    }
> +    /* Handle signedness, if both unsigned -> result is unsigned, else s=
igned
> */
> +    assert_signedness(c, locp, op1.signedness);
> +    assert_signedness(c, locp, op2.signedness);
> +    res.signedness =3D (op1.signedness =3D=3D UNSIGNED
> +                      && op2.signedness =3D=3D UNSIGNED) ? UNSIGNED : SI=
GNED;

This doesn't match C semantics.  You also have to consider the bit_width of=
 the original two operands.
    For example, If op1 is unsigned 32 and op2 is signed 64, the result is =
signed

> +HexValue gen_extend_op(Context *c,
> +                       YYLTYPE *locp,
> +                       HexValue *src_width_ptr,
> +                       HexValue *dst_width_ptr,
> +                       HexValue *value_ptr,
> +                       HexSignedness signedness) {
> +    HexValue src_width =3D *src_width_ptr;
> +    HexValue dst_width =3D *dst_width_ptr;
> +    HexValue value =3D *value_ptr;
> +    src_width =3D gen_rvalue_extend(c, locp, &src_width);
> +    value =3D gen_rvalue_extend(c, locp, &value);
> +    src_width =3D rvalue_materialize(c, locp, &src_width);
> +    value =3D rvalue_materialize(c, locp, &value);
> +
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    HexValue shift =3D gen_tmp_value(c, locp, "64", 64);
> +    HexValue zero =3D gen_tmp_value(c, locp, "0", 64);
> +    OUT(c, locp, "tcg_gen_sub_i64(",
> +        &shift, ", ", &shift, ", ", &src_width, ");\n");
> +    assert_signedness(c, locp, signedness);
> +    if (signedness =3D=3D UNSIGNED) {
> +        HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffff", 6=
4);
> +        OUT(c, locp, "tcg_gen_shr_i64(",
> +            &mask, ", ", &mask, ", ", &shift, ");\n");
> +        OUT(c, locp, "tcg_gen_and_i64(",
> +            &res, ", ", &value, ", ", &mask, ");\n");
> +        gen_rvalue_free(c, locp, &mask);
> +    } else {
> +        OUT(c, locp, "tcg_gen_shl_i64(",
> +            &res, ", ", &value, ", ", &shift, ");\n");
> +        OUT(c, locp, "tcg_gen_sar_i64(",
> +            &res, ", ", &res, ", ", &shift, ");\n");
> +    }

This seems strange that you are doing shifts.  Why not use tcg_gen_extract_=
* or tcg_gen_sextract_*?


> +    OUT(c, locp, "tcg_gen_movcond_i64(TCG_COND_EQ, ", &res, ", ");
> +    OUT(c, locp, &src_width, ", ", &zero, ", ", &zero, ", ", &res, ");\n=
");
> +
> +    gen_rvalue_free(c, locp, &src_width);
> +    gen_rvalue_free(c, locp, &dst_width);
> +    gen_rvalue_free(c, locp, &value);
> +    gen_rvalue_free(c, locp, &shift);
> +    gen_rvalue_free(c, locp, &zero);
> +
> +    res.signedness =3D signedness;
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
> +    HexValue value_m =3D gen_rvalue_extend(c, locp, value);
> +    HexValue begin_m =3D gen_rvalue_extend(c, locp, begin);
> +    HexValue width_orig =3D *width;
> +    width_orig.is_manual =3D true;
> +    HexValue width_m =3D gen_rvalue_extend(c, locp, &width_orig);
> +    width_m =3D rvalue_materialize(c, locp, &width_m);
> +
> +    HexValue mask =3D gen_tmp_value(c, locp, "0xffffffffffffffffUL", 64)=
;
> +    mask.signedness =3D UNSIGNED;
> +    HexValue k64 =3D gen_tmp_value(c, locp, "64", 64);
> +    k64 =3D gen_bin_op(c, locp, SUB_OP, &k64, &width_m);
> +    mask =3D gen_bin_op(c, locp, LSR_OP, &mask, &k64);
> +    begin_m.is_manual =3D true;
> +    mask =3D gen_bin_op(c, locp, ASL_OP, &mask, &begin_m);
> +    mask.is_manual =3D true;
> +    value_m =3D gen_bin_op(c, locp, ASL_OP, &value_m, &begin_m);
> +    value_m =3D gen_bin_op(c, locp, ANDB_OP, &value_m, &mask);

Why not use tcg_gen_deposit_*?

> +
> +    OUT(c, locp, "tcg_gen_not_i64(", &mask, ", ", &mask, ");\n");
> +    mask.is_manual =3D false;
> +    HexValue res =3D gen_bin_op(c, locp, ANDB_OP, &dest_m, &mask);
> +    res =3D gen_bin_op(c, locp, ORB_OP, &res, &value_m);
> +
> +    if (dest->bit_width !=3D res.bit_width) {
> +        res =3D gen_rvalue_truncate(c, locp, &res);
> +    }
> +
> +    HexValue zero =3D gen_tmp_value(c, locp, "0", res.bit_width);
> +    OUT(c, locp, "tcg_gen_movcond_i", &res.bit_width, "(TCG_COND_NE, ",
> dest);
> +    OUT(c, locp, ", ", &width_orig, ", ", &zero, ", ", &res, ", ", dest,
> +        ");\n");

Not sure what this is for?

> +
> +    gen_rvalue_free(c, locp, &zero);
> +    gen_rvalue_free(c, locp, width);
> +    gen_rvalue_free(c, locp, &res);
> +}

> +static HexValue gen_convround_n_a(Context *c,
> +                                  YYLTYPE *locp,
> +                                  HexValue *a,
> +                                  HexValue *n)
> +{
> +    (void) n;
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
> +    return res;
> +}

This looks like a simple extend, why is it a separate function?

> +
> +static HexValue gen_convround_n_b(Context *c,
> +                                  YYLTYPE *locp,
> +                                  HexValue *a,
> +                                  HexValue *n)
> +{
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
> +
> +    HexValue one =3D gen_tmp_value(c, locp, "1", 32);
> +    HexValue tmp =3D gen_tmp(c, locp, 32);
> +    HexValue tmp_64 =3D gen_tmp(c, locp, 64);
> +
> +    OUT(c, locp, "tcg_gen_shl_i32(", &tmp);
> +    OUT(c, locp, ", ", &one, ", ", n, ");\n");
> +    OUT(c, locp, "tcg_gen_and_i32(", &tmp);
> +    OUT(c, locp, ", ", &tmp, ", ", a, ");\n");
> +    OUT(c, locp, "tcg_gen_shri_i32(", &tmp);
> +    OUT(c, locp, ", ", &tmp, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &tmp_64, ", ", &tmp, ");\n");
> +    OUT(c, locp, "tcg_gen_add_i64(", &res);
> +    OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");

Why not use tcg_gen_sextract_*?

> +
> +    gen_rvalue_free(c, locp, &one);
> +    gen_rvalue_free(c, locp, &tmp);
> +    gen_rvalue_free(c, locp, &tmp_64);
> +
> +    return res;
> +}
> +
> +static HexValue gen_convround_n_c(Context *c,
> +                                  YYLTYPE *locp,
> +                                  HexValue *a,
> +                                  HexValue *n)
> +{
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &res, ", ", a, ");\n");
> +
> +    HexValue one =3D gen_tmp_value(c, locp, "1", 32);
> +    HexValue tmp =3D gen_tmp(c, locp, 32);
> +    HexValue tmp_64 =3D gen_tmp(c, locp, 64);
> +
> +    OUT(c, locp, "tcg_gen_subi_i32(", &tmp);
> +    OUT(c, locp, ", ", n, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_shl_i32(", &tmp);
> +    OUT(c, locp, ", ", &one, ", ", &tmp, ");\n");
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &tmp_64, ", ", &tmp, ");\n");
> +    OUT(c, locp, "tcg_gen_add_i64(", &res);
> +    OUT(c, locp, ", ", &res, ", ", &tmp_64, ");\n");
> +
> +    gen_rvalue_free(c, locp, &one);
> +    gen_rvalue_free(c, locp, &tmp);
> +    gen_rvalue_free(c, locp, &tmp_64);
> +
> +    return res;
> +}
> +
> +HexValue gen_convround_n(Context *c,
> +                         YYLTYPE *locp,
> +                         HexValue *source_ptr,
> +                         HexValue *bit_pos_ptr)
> +{
> +    /* If input is 64 bit cast it to 32 */
> +    HexValue source =3D gen_cast_op(c, locp, source_ptr, 32);
> +    HexValue bit_pos =3D gen_cast_op(c, locp, bit_pos_ptr, 32);
> +
> +    source =3D rvalue_materialize(c, locp, &source);
> +    bit_pos =3D rvalue_materialize(c, locp, &bit_pos);
> +
> +    HexValue r1 =3D gen_convround_n_a(c, locp, &source, &bit_pos);
> +    HexValue r2 =3D gen_convround_n_b(c, locp, &source, &bit_pos);
> +    HexValue r3 =3D gen_convround_n_c(c, locp, &source, &bit_pos);
> +
> +    HexValue l_32 =3D gen_tmp_value(c, locp, "1", 32);
> +
> +    HexValue cond =3D gen_tmp(c, locp, 32);
> +    HexValue cond_64 =3D gen_tmp(c, locp, 64);
> +    HexValue mask =3D gen_tmp(c, locp, 32);
> +    HexValue n_64 =3D gen_tmp(c, locp, 64);
> +    HexValue res =3D gen_tmp(c, locp, 64);
> +    HexValue zero =3D gen_tmp_value(c, locp, "0", 64);
> +
> +    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
> +    OUT(c, locp, ", ", &bit_pos, ", ", &l_32, ");\n");
> +    OUT(c, locp, "tcg_gen_shl_i32(", &mask);
> +    OUT(c, locp, ", ", &l_32, ", ", &mask, ");\n");
> +    OUT(c, locp, "tcg_gen_sub_i32(", &mask);
> +    OUT(c, locp, ", ", &mask, ", ", &l_32, ");\n");
> +    OUT(c, locp, "tcg_gen_and_i32(", &cond);
> +    OUT(c, locp, ", ", &source, ", ", &mask, ");\n");
> +    OUT(c, locp, "tcg_gen_extu_i32_i64(", &cond_64, ", ", &cond, ");\n")=
;
> +    OUT(c, locp, "tcg_gen_ext_i32_i64(", &n_64, ", ", &bit_pos, ");\n");

Some comments here would be helpful ...

> +
> +    OUT(c, locp, "tcg_gen_movcond_i64");
> +    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &cond_64, ", ", &zero);
> +    OUT(c, locp, ", ", &r2, ", ", &r3, ");\n");
> +
> +    OUT(c, locp, "tcg_gen_movcond_i64");
> +    OUT(c, locp, "(TCG_COND_EQ, ", &res, ", ", &n_64, ", ", &zero);
> +    OUT(c, locp, ", ", &r1, ", ", &res, ");\n");
> +
> +    OUT(c, locp, "tcg_gen_shr_i64(", &res);
> +    OUT(c, locp, ", ", &res, ", ", &n_64, ");\n");
> +
> +    gen_rvalue_free(c, locp, &source);
> +    gen_rvalue_free(c, locp, &bit_pos);
> +
> +    gen_rvalue_free(c, locp, &r1);
> +    gen_rvalue_free(c, locp, &r2);
> +    gen_rvalue_free(c, locp, &r3);
> +
> +    gen_rvalue_free(c, locp, &cond);
> +    gen_rvalue_free(c, locp, &cond_64);
> +    gen_rvalue_free(c, locp, &l_32);
> +    gen_rvalue_free(c, locp, &mask);
> +    gen_rvalue_free(c, locp, &n_64);
> +    gen_rvalue_free(c, locp, &zero);
> +
> +    res =3D gen_rvalue_truncate(c, locp, &res);
> +    return res;
> +}
> +
> +HexValue gen_round(Context *c,
> +                   YYLTYPE *locp,
> +                   HexValue *source,
> +                   HexValue *position) {
> +    yyassert(c, locp, source->bit_width <=3D 32,
> +             "fRNDN not implemented for bit widths > 32!");
> +
> +    HexValue src =3D *source;
> +    HexValue pos =3D *position;
> +
> +    HexValue src_width =3D gen_imm_value(c, locp, src.bit_width, 32);
> +    HexValue dst_width =3D gen_imm_value(c, locp, 64, 32);
> +    HexValue a =3D gen_extend_op(c, locp, &src_width, &dst_width, &src,
> SIGNED);

Are you sure extending is the right thing to do here?



> +HexValue gen_fbrev_4(Context *c, YYLTYPE *locp, HexValue *source)
> +{
> +    HexValue source_m =3D *source;
> +
> +    HexValue res =3D gen_tmp(c, locp, 32);
> +    HexValue tmp1 =3D gen_tmp(c, locp, 32);
> +    HexValue tmp2 =3D gen_tmp(c, locp, 32);
> +
> +    source_m =3D rvalue_materialize(c, locp, &source_m);
> +    source_m =3D gen_rvalue_truncate(c, locp, &source_m);
> +
> +    OUT(c, locp, "tcg_gen_mov_tl(", &res, ", ", &source_m, ");\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xaaaaaaaa);\=
n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x55555555);\=
n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 1);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n=
");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xcccccccc);\=
n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 2);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x33333333);\=
n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 2);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n=
");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp1, ", ", &res, ", 0xf0f0f0f0);\=
n");
> +    OUT(c, locp, "tcg_gen_shri_tl(", &tmp1, ", ", &tmp1, ", 4);\n");
> +    OUT(c, locp, "tcg_gen_andi_tl(", &tmp2, ", ", &res, ", 0x0f0f0f0f);\=
n");
> +    OUT(c, locp, "tcg_gen_shli_tl(", &tmp2, ", ", &tmp2, ", 4);\n");
> +    OUT(c, locp, "tcg_gen_or_tl(", &res, ", ", &tmp1, ", ", &tmp2, ");\n=
");
> +    OUT(c, locp, "tcg_gen_bswap32_tl(", &res, ", ", &res, ",
> TCG_BSWAP_IZ);\n");

This would be better as a helper that just does revbit32 - or maybe just sk=
ip any instructions that reference this.

> +HexValue gen_fbrev_8(Context *c, YYLTYPE *locp, HexValue *source)

Ditto


> +HexValue gen_deinterleave(Context *c, YYLTYPE *locp, HexValue *mixed)

Ditto

> +
> +HexValue gen_interleave(Context *c,
> +                        YYLTYPE *locp,
> +                        HexValue *odd,
> +                        HexValue *even)

Ditto


> +void gen_pre_assign(Context *c, YYLTYPE *locp, HexValue *lp, HexValue
> *rp)

Change to gen_pred_assign

> +void gen_load(Context *c, YYLTYPE *locp, HexValue *size,
> +              HexSignedness signedness, HexValue *ea, HexValue *dst)
> +{
> +    /* Memop width is specified in the load macro */
> +    int bit_width =3D (size->imm.value > 4) ? 64 : 32;
> +    assert_signedness(c, locp, signedness);
> +    const char *sign_suffix =3D (size->imm.value > 4)
> +                              ? ""
> +                              : ((signedness =3D=3D UNSIGNED) ? "u" : "s=
");
> +    char size_suffix[4] =3D { 0 };
> +    /* Create temporary variable (if not present) */
> +    if (dst->type =3D=3D VARID) {
> +        /* TODO: this is a common pattern, the parser should be varid-aw=
are.
> */
> +        gen_varid_allocate(c, locp, dst, bit_width, signedness);
> +    }
> +    snprintf(size_suffix, 4, "%" PRIu64, size->imm.value * 8);
> +    int var_id =3D find_variable(c, locp, ea);
> +    yyassert(c, locp, var_id !=3D -1, "Load variable must exist!\n");
> +    /* We need to enforce the variable size */
> +    ea->bit_width =3D g_array_index(c->inst.allocated, Var, var_id).bit_=
width;
> +    OUT(c, locp, "if (insn->slot =3D=3D 0 && pkt->pkt_has_store_s1) {\n"=
);
> +    OUT(c, locp, "process_store(ctx, pkt, 1);\n");
> +    OUT(c, locp, "}\n");
> +    OUT(c, locp, "tcg_gen_qemu_ld", size_suffix, sign_suffix);
> +    OUT(c, locp, "(", dst, ", ", ea, ", 0);\n");

Instead of 0, pass ctx->mem_idx

> +    /* If the var in EA was truncated it is now a tmp HexValue, so free =
it. */
> +    gen_rvalue_free(c, locp, ea);
> +}


> +void gen_setbits(Context *c, YYLTYPE *locp, HexValue *hi, HexValue *lo,
> +                 HexValue *dst, HexValue *val)
> +{
> +    yyassert(c, locp, hi->type =3D=3D IMMEDIATE &&
> +             hi->imm.type =3D=3D VALUE &&
> +             lo->type =3D=3D IMMEDIATE &&
> +             lo->imm.type =3D=3D VALUE,
> +             "Range deposit needs immediate values!\n");
> +
> +    *val =3D gen_rvalue_truncate(c, locp, val);
> +    unsigned len =3D hi->imm.value + 1 - lo->imm.value;
> +    HexValue tmp =3D gen_tmp(c, locp, 32);
> +    OUT(c, locp, "tcg_gen_neg_i32(", &tmp, ", ", val, ");\n");

Taking the neg only works if val is 0 or 1.  Today, this is always invoked =
with 0 or 1, but this implementation isn't future-proof.  Do an andi with 1=
 first, then it will be correct for possible inputs.

> +    OUT(c, locp, "tcg_gen_deposit_i32(", dst, ", ", dst, ", ", &tmp, ", =
");
> +    OUT(c, locp, lo, ", ", &len, ");\n");
> +
> +    gen_rvalue_free(c, locp, &tmp);
> +    gen_rvalue_free(c, locp, hi);
> +    gen_rvalue_free(c, locp, lo);
> +    gen_rvalue_free(c, locp, val);
> +}


> +HexValue gen_rvalue_pre(Context *c, YYLTYPE *locp, HexValue *pre)

Call this gen_rvalue_pred and name the argument pred

> +HexValue gen_rvalue_var(Context *c, YYLTYPE *locp, HexValue *var)
> +{
> +    /* Assign correct bit width and signedness */
> +    bool found =3D false;
> +    for (unsigned i =3D 0; i < c->inst.allocated->len; i++) {
> +        Var *other =3D &g_array_index(c->inst.allocated, Var, i);
> +        if (g_string_equal(var->var.name, other->name)) {

Use find_variable function here?

> +            found =3D true;
> +            other->name =3D var->var.name;
> +            var->bit_width =3D other->bit_width;
> +            var->signedness =3D other->signedness;
> +            break;
> +        }
> +    }
> +    yyassert(c, locp, found, "Undefined symbol!\n");
> +    return *var;
> +}


> +HexValue gen_rvalue_not(Context *c, YYLTYPE *locp, HexValue *v)
> +{
> +    const char *bit_suffix =3D (v->bit_width =3D=3D 64) ? "i64" : "i32";
> +    int bit_width =3D (v->bit_width =3D=3D 64) ? 64 : 32;
> +    HexValue res;
> +    memset(&res, 0, sizeof(HexValue));
> +    res.signedness =3D v->signedness;
> +    res.is_dotnew =3D false;
> +    res.is_manual =3D false;
> +    if (v->type =3D=3D IMMEDIATE) {
> +        res.type =3D IMMEDIATE;
> +        res.imm.type =3D QEMU_TMP;
> +        res.imm.index =3D c->inst.qemu_tmp_count;
> +        OUT(c, locp, "int", &bit_width, "_t ", &res, " =3D ~", v, ";\n")=
;

I see a lot of these casts to "int", &bit_width, "_t".  Shouldn't we also b=
e checking the signedness and decide if it should be uint... instead?

> +        c->inst.qemu_tmp_count++;
> +    } else {
> +        res =3D gen_tmp(c, locp, bit_width);
> +        OUT(c, locp, "tcg_gen_not_", bit_suffix, "(", &res,
> +            ", ", v, ");\n");
> +        gen_rvalue_free(c, locp, v);
> +    }
> +    return res;
> +}


> +HexValue gen_rvalue_abs(Context *c, YYLTYPE *locp, HexValue *v)
> +{
> +    int bit_width =3D (v->bit_width =3D=3D 64) ? 64 : 32;
> +    HexValue res;
> +    memset(&res, 0, sizeof(HexValue));
> +    res.signedness =3D v->signedness;
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
> +        OUT(c, locp, "tcg_gen_abs_i", &bit_width, "(", &res, ", ", v, ")=
;\n");
> +        gen_rvalue_free(c, locp, v);
> +    }
> +    return res;
> +}
> +
> +HexValue gen_rvalue_neg(Context *c, YYLTYPE *locp, HexValue *v)
> +{
> +    const char *bit_suffix =3D (v->bit_width =3D=3D 64) ? "i64" : "i32";
> +    int bit_width =3D (v->bit_width =3D=3D 64) ? 64 : 32;
> +    HexValue res;
> +    memset(&res, 0, sizeof(HexValue));
> +    res.signedness =3D v->signedness;
> +    res.is_dotnew =3D false;
> +    res.is_manual =3D false;
> +    if (v->type =3D=3D IMMEDIATE) {
> +        res.type =3D IMMEDIATE;
> +        res.imm.type =3D QEMU_TMP;
> +        res.imm.index =3D c->inst.qemu_tmp_count;
> +        OUT(c, locp, "int", &bit_width, "_t ", &res, " =3D -", v, ";\n")=
;
> +        c->inst.qemu_tmp_count++;
> +    } else {
> +        res =3D gen_tmp(c, locp, bit_width);
> +        OUT(c, locp, "tcg_gen_neg_", bit_suffix, "(", &res, ", ", v, ");=
\n");
> +        gen_rvalue_free(c, locp, v);
> +    }
> +    return res;
> +}

There's too much copy&paste across these.  I'd suggest a helper function th=
at takes the C code (e.g., "-") and the TCG function (e.g., tcg_gen_neg_) a=
s arguments.



> diff --git a/target/hexagon/idef-parser/idef-parser.y b/target/hexagon/id=
ef-
> parser/idef-parser.y
> new file mode 100644


> +       | CONSTEXT
> +         {
> +             HexValue rvalue;
> +             memset(&rvalue, 0, sizeof(HexValue));
> +             rvalue.type =3D IMMEDIATE;
> +             rvalue.imm.type =3D IMM_CONSTEXT;
> +             rvalue.signedness =3D UNSIGNED;
> +             rvalue.is_dotnew =3D false;
> +             rvalue.is_manual =3D false;
> +             $$ =3D rvalue;
> +         }

Aren't the constant extenders already taken care of during decoding?


> +       | CAST rvalue
> +         {
> +             @1.last_column =3D @2.last_column;
> +             /* Assign target signedness */
> +             $2.signedness =3D $1.signedness;
> +             $$ =3D gen_cast_op(c, &@1, &$2, $1.bit_width);
> +             $$.signedness =3D $1.signedness;

Pass $1.signedness to gen_cast_op rather than setting it here

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
> +             }

You're assuming $1 is a bitfield.  How do you assure it's not a normal arra=
y?=20


