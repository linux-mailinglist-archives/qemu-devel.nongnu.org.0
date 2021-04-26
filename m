Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B08C436BACE
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 22:43:00 +0200 (CEST)
Received: from localhost ([::1]:58680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb84J-0007jS-CH
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 16:42:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lb80G-0005jl-Cu; Mon, 26 Apr 2021 16:38:48 -0400
Received: from mail-eopbgr790129.outbound.protection.outlook.com
 ([40.107.79.129]:17544 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lb801-0004RO-Ag; Mon, 26 Apr 2021 16:38:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVhF4CdqMjX1Q2ovw/nASVuPDGQRLTocEkZaEBiQH9PGSIdczjfhC+FHhzBWRHJ9HSx9kHKYv7UOsVplhxsnwAqSSyzb7ctcmpZTdK+w1gO51STGD//gjQQzTXF4UjSWif/zCHzmLgFfiOAvMxmVe08Ca9ZYEQYvr/4PBuSfoGfM6uGv8sahWg0VHE0bl93UloaHYm7X7yzlCvCpbwB9P4FoYyyICUbnMLBU3USPMw8g2aAcTMhhOEgrxdQ7TeYsYdJJ+cadSXuiw/Krm26CTOUQiJsUkODqxC0fuDfgVGtMl5t7n3OTTjZFUcGKGYB7exbp/w5h3meWqRqurqYMDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdGSXoE3jOwAEEl/+vQBwiCixCk76vmsFrhuDyKJgrs=;
 b=UntdvNhmIw+9FCc68J9xOEezzTfC59jATO8OBG3yCLhEIhZn9mvQyf6QLGKdT6xbcMuEay8v1m+u2YZ/Q4KH/5uXVKL6QoIQMDtJPxOEeqSxSaf8Abt5Wto5ctIK3puctY9L57GDEnBxjSj9LrKeF+DKT56aadpXnsJtPcgjQ2CORlkxnE1A+3KSjhZ/xH/FdVVVK1c3XRXDjBeb35jjfneWW9dMevL1zX55hj4sAsnU1A+Eqj9aVV9HPZpVsnzGcOv32SU0pbQogROUuOMoYN2YFm8V1teOmrl4apE4nWJOYJLx1EwSsVGFJKK4bpqBLn/ZHAFQojWeeHw4f8iWHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KdGSXoE3jOwAEEl/+vQBwiCixCk76vmsFrhuDyKJgrs=;
 b=OYQbU3HUmNnTSB0aSe9GWkTp4gTsEBYqZ0pcIwhg091kK0Xtaj8e5hP+ZCdv1XcgSEQN8836YK0nBfTBkaZsMB0TQB4UiloikM0hxl9JeqyE1p/zxa8E78DoNicJ24PZunuJcs+S3RAZtlH+AZERPWPv7d1zr+5N6WXWoSFf+6t0/b+A+qqwzkc7RVvBFAaCiAzSts/qqgw1snk5cyojVtbeyT357AlS2hm20dWIT9x9CHZtobEWJCP7W8NnftYRfZYRgSeFt8Kxh5VGgAO4Tjnyk1B6QAv3Tl0yEMN5xEKJ6N/Wdu31FY0+YA6yIGVfIqSNRAyXV0FXUx4Y2d+yKQ==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP2PR80MB5492.lamprd80.prod.outlook.com (2603:10d6:102:b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Mon, 26 Apr
 2021 20:38:28 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 20:38:28 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Fabiano Rosas <farosas@linux.ibm.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
Thread-Topic: [RFC PATCH 2/4] target/ppc: isolated SPR read/write callbacks
Thread-Index: AQHXOHV42nubYpKEGEmSEO/a7gzTdKrHPlsAgAABaog=
Date: Mon, 26 Apr 2021 20:38:28 +0000
Message-ID: <CP2PR80MB4499E24FF645D0AEF2CC2D4EC7429@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <20210423191807.77963-1-bruno.larsen@eldorado.org.br>
 <20210423191807.77963-3-bruno.larsen@eldorado.org.br>,
 <87mttk3j5p.fsf@linux.ibm.com>
In-Reply-To: <87mttk3j5p.fsf@linux.ibm.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:571a:2a0a:f5e1:e426]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d82a79f7-be46-44bc-db70-08d908f33f7f
x-ms-traffictypediagnostic: CP2PR80MB5492:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB54925E9744B11B7E4549188CC7429@CP2PR80MB5492.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eqm/RZBxRr7hwL+3pYVe5AxxUfvlxfyvgl6Q2oHCJ4ggJKoRtIO3VZHqreUyW/Rip9xn2duFDmK7JRq/4PZjTxRyKf4G304/hEKpncKJn1493bWLJsvQlGmytiZWc+pMjXJlVayScu2fE/8FoOq9vDjoYcDtjyiqMjwfC8XB3rZ5nOZr2TdqxkBd5HrSPfvzfK6OQ+r5LoDngu7JN8OG7l3a6Dd6ys0HjzEkrehvsCgI05JLJolu6WndceFq25awLv/ORu0MdTfVomE1w6KT0FH64ZugxAp5WZpAeHcpRovaqcizN4e3kKPHcWMpwkcDbndyh+/so/VWGmOsEcTq6Via+5bFqc8NHANySouQauMTbgaWm2uSW5ZZQhM2qwDFmDqA6ZZNHzkuukM7N5105MDotAH1FiWrq2VQGSz5GviWr1iBbF9fkxctSV2YqAkheHKRNx49f7g+loJiGEBsiNv4tPYnvFKsKfU46OzL+z19Ybq3f9ezOvh3J2FSh8PvN8LQVrsrDEKboO7f0pqsfHCn1ai+d3g+VppKO/OrHXUv7YkxjA/D2jNBFuNgc5LIi4LhZPAqmWOhhOwXFyYqSTbK8QcG8lD46MUh8tatf/IOGsNOyd/O73plKPZiwZAxi66t0eTC1prW5um4nirecbOeeiPbzw1nmY+/Op0LZAs6dgW1bV3KqHTl/PSy4vvM
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(396003)(376002)(366004)(346002)(136003)(5660300002)(71200400001)(66446008)(122000001)(8676002)(38100700002)(6506007)(76116006)(83380400001)(478600001)(66476007)(52536014)(7696005)(64756008)(86362001)(2906002)(66946007)(66556008)(19627405001)(54906003)(55016002)(33656002)(166002)(9686003)(8936002)(186003)(110136005)(21615005)(316002)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?5NGNF7R3JylJzVFQ9KUrvShFG7IInLf0QpW1eQzNxZafckzQsOqY1sOTK7?=
 =?iso-8859-1?Q?87HYJ5VPzHZdimT+jJQh+1AKnGgjtgYHIhsGjLGp28lRq4xZsMDR/THqw2?=
 =?iso-8859-1?Q?HttWzNCRfDD85sY+7AUtljBKmIrRFRT3kpadUV4XT3pKrE9yYa7sNnvGDN?=
 =?iso-8859-1?Q?aXCpnHGhF3YATF68ammymiKXXqCZYiNjuryt5P1XgvZX/0StKpw/WcWLCx?=
 =?iso-8859-1?Q?hhnjzz4V7ZBdB9MYfiB+WTZ7z+OvwEt4ZF4nKOVmscRN0sVw4m6i3Joza0?=
 =?iso-8859-1?Q?+dWJ+6eZZV3vsLNQQ4Qv2f+tbM+UTi/j/gOfjWm8qODYzck/vtUQWC0UbN?=
 =?iso-8859-1?Q?1qCcdXrQrN8KrNuCmZu8OAGwyOFIxkRaFSJXfIA1kJaZMRPWQQTNExURQS?=
 =?iso-8859-1?Q?D7PFyt8pRDphhxhHl4GxdHgocubI52o/FTrrKZ1p3W1myLSo1dlAdB304U?=
 =?iso-8859-1?Q?Rr5JWiJQENRiVYjjgv7aMvFykmZwBtnx99VucoQpxLRTFkMXK66V8lHol1?=
 =?iso-8859-1?Q?KciBvudk3MYs1jz2v0BBQXxlAfyx06FaZL2NpKy8wNnpbjFlCfbYLv3hph?=
 =?iso-8859-1?Q?Iig904oiGXggDf3lvDIja+YKZgoYElIj0gxnVwNZlyLlQdJdYJli38RZW3?=
 =?iso-8859-1?Q?yedznfuICbtS/SdvjLfQlfIREypLm0AIqMD6F+loMXKdX3AHGqntvQJz6S?=
 =?iso-8859-1?Q?VPenczfPeumdcjMs73rcIxznyyVz5ZRo9CU8Ec9aYpKZr/fDjs7x7KsDwm?=
 =?iso-8859-1?Q?i3Uv7WB16ufRHKimuqWDKK6iuaZbbJ+IfBdgBgw2mfcOcZk2+GacGijtWb?=
 =?iso-8859-1?Q?QRTbIbdcKsBgOjNOQ9XmYoWJn4O2cwMl4o5Xr7c6hEPetZyi6mnHVKjFjR?=
 =?iso-8859-1?Q?Xoxg4//Nl1+Okp8s6sSGZrtIpMWuFwhzFDsl7KWAq3Llc6950v2aLq04pf?=
 =?iso-8859-1?Q?NYcUVg0/l6UzRRR9N6CZiJZQiRF8k9v8Qu7vtfuHdmXZGx9uCs2uzaQThS?=
 =?iso-8859-1?Q?noZQw9K7zTICIxmi604ENVLhYInkGZwPO/omXVf50T+J4dwvdtE6QcTFRi?=
 =?iso-8859-1?Q?o9Jlysjk8kxfF3aVYBLDnW2Fi96LSFfpB3vAQZxhZG1JXj2c53Vx9A2AkN?=
 =?iso-8859-1?Q?GKuyudelTd4wRYiQOO4notRXPpUEzTwOculOF0oPd0igwifpujNaKTN0wM?=
 =?iso-8859-1?Q?LF/SKWnEzrxPoGo56gxz10mDvtHkM0xg0ENJ4bIW9G2OZ4Eh+00uNhklDj?=
 =?iso-8859-1?Q?AEyiiujypExLpuccKNoOav34g1PuZLwgYcwdyR5zsPo8sitEiX3QiULUqG?=
 =?iso-8859-1?Q?Z/mYlyesuO5qkvyXXAmTN4d18fvBNm+DoYnRTM69BjVsMb6o9KzqeEHzWy?=
 =?iso-8859-1?Q?tFCLoiyq5zLLtau7RyA8WmuKhCBXO5SKFjUeUyus564qIQbyp0U7w=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499E24FF645D0AEF2CC2D4EC7429CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d82a79f7-be46-44bc-db70-08d908f33f7f
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 20:38:28.2956 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YOB7kcFNBqMXhimueuADA0hTHKkXgv1jXfRaC8420Cryaf7PpDIgSXSkjHcrnGgCoLQyADfODA17/h+rOZplcnHGRhrLREe4C8I83EJQr5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5492
Received-SPF: pass client-ip=40.107.79.129;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_KAM_HTML_FONT_INVALID=0.01 autolearn=ham autolearn_force=no
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
Cc: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499E24FF645D0AEF2CC2D4EC7429CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > The solution to move it to spr_tcg.c.inc and including it in translate.=
c
> > is a work in progress, any better solutions are very much appreciated.
> > Also, making the R/W functions not static is required for the next
> > commit.
>
> Looks like this could be done in the next commit then.

Sure, I can separate it like this. It was just easier to make the commit li=
ke this, since
I wouldn't need to undo all the static removals and redo them for the next =
commit
(I tend to work through all the code and then separate changes into commits=
, maybe
that's a bad habit I should drop), and also I thought it would making revie=
wing the
next patch easier.

> > +void spr_load_dump_spr(int sprn)
> > +{
> > +#ifdef PPC_DUMP_SPR_ACCESSES
>
> The define needs to come along.

Oops, another one that I forgot. This has the same issue as the one before,=
 so I'm
guessing the same solution: move the define to internal, so both cpu_init.c=
 and
translate.c can access it.

> > +/* I really see no reason to keep these gen_*_xer */
> > +/* instead of just leaving the code in the spr_*_xer */
> > +void gen_read_xer(DisasContext *ctx, TCGv dst)
> > +{
> > +    TCGv t0 =3D tcg_temp_new();
> > +    TCGv t1 =3D tcg_temp_new();
> > +    TCGv t2 =3D tcg_temp_new();
> > +    tcg_gen_mov_tl(dst, cpu_xer);
> > +    tcg_gen_shli_tl(t0, cpu_so, XER_SO);
> > +    tcg_gen_shli_tl(t1, cpu_ov, XER_OV);
> > +    tcg_gen_shli_tl(t2, cpu_ca, XER_CA);
> > +    tcg_gen_or_tl(t0, t0, t1);
> > +    tcg_gen_or_tl(dst, dst, t2);
> > +    tcg_gen_or_tl(dst, dst, t0);
> > +    if (is_isa300(ctx)) {
> > +        tcg_gen_shli_tl(t0, cpu_ov32, XER_OV32);
> > +        tcg_gen_or_tl(dst, dst, t0);
> > +        tcg_gen_shli_tl(t0, cpu_ca32, XER_CA32);
> > +        tcg_gen_or_tl(dst, dst, t0);
> > +    }
> > +    tcg_temp_free(t0);
> > +    tcg_temp_free(t1);
> > +    tcg_temp_free(t2);
> > +}
> > +
> > +void gen_write_xer(TCGv src)
> > +{
> > +    /* Write all flags, while reading back check for isa300 */
> > +    tcg_gen_andi_tl(cpu_xer, src,
> > +                    ~((1u << XER_SO) |
> > +                      (1u << XER_OV) | (1u << XER_OV32) |
> > +                      (1u << XER_CA) | (1u << XER_CA32)));
> > +    tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1);
> > +    tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1);
> > +    tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);
> > +    tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);
> > +    tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);
> > +}
>
> These two can continue being static.

Good catch again. But my question (in the comment at the begining) remains:
Is there a good reason to keep them separate from spr_(read|write)_xer, sin=
ce
they are only used by those functions and aren't much different than other
read|write functions.

> Moving a big amount of code like this to another file *and* rearranging
> the code within the file at the same time makes it harder to review and
> is error prone. I'd move the code in one patch and rearrange things in a
> separate patch if needed.

Yeah... I didn't know about the automated sed command until earlier today
so it didn't occur to me that it could be a problem. The rearranging was ei=
ther
an accident, or a way to reduce ifdefs, but that can be a trivial patch lat=
er on

> > +/* prototypes for readers and writers for SPRs */
> > +
> > +#ifdef TARGET_PPC64
> > +void gen_fscr_facility_check(DisasContext *ctx, int facility_sprn,
> > +                                    int bit, int sprn, int cause);
> > +void gen_msr_facility_check(DisasContext *ctx, int facility_sprn,
> > +                                   int bit, int sprn, int cause);
> > +#endif
>
> The gen_* functions are only called from within the spr.c.inc file. You
> shouldn't need them here.
>
> > +
> > +void spr_load_dump_spr(int sprn);
> > +void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
> > +void spr_store_dump_spr(int sprn);
> > +void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
> > +void gen_read_xer(DisasContext *ctx, TCGv dst);
> > +void gen_write_xer(TCGv src);
>
> Same here.

Relics of a different solution. Will remove for v2

> > -static void spr_noaccess(DisasContext *ctx, int gprn, int sprn)
> > -{
> > -#if 0
> > -    sprn =3D ((sprn >> 5) & 0x1F) | ((sprn & 0x1F) << 5);
> > -    printf("ERROR: try to access SPR %d !\n", sprn);
> > -#endif
> > -}
> > -#define SPR_NOACCESS (&spr_noaccess)
>
> What happens to code in translate.c that checks this? I don't think you
> can remove it.

the define was moved to internal.h (forgot to include in this patch, it's i=
n the
next one, will fix). I don't know if that's a good solution, but it's worki=
ng for now

<snip>

> >  #if defined(TARGET_PPC64)
> > -#if defined(CONFIG_USER_ONLY)
> > -#define POWERPC970_HID5_INIT 0x00000080
> > -#else
> > -#define POWERPC970_HID5_INIT 0x00000000
> > -#endif
>
> Where do these went?

Same as before:  They were added to internal.h and I forgot.



Bruno Piazera Larsen

Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/cli=
ck?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ=
7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUi=
puK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1w=
j0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXW=
nW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDc=
VzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIv=
qmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>

Departamento Computa=E7=E3o Embarcada

Analista de Software Trainee

Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--_000_CP2PR80MB4499E24FF645D0AEF2CC2D4EC7429CP2PR80MB4499lamp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; The solution to m=
ove it to spr_tcg.c.inc and including it in translate.c<br>
&gt; &gt; is a work in progress, any better solutions are very much appreci=
ated.<br>
&gt; &gt; Also, making the R/W functions not static is required for the nex=
t<br>
&gt; &gt; commit.<br>
&gt; <br>
&gt; Looks like this could be done in the next commit then.</span></font></=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Sure, I can separate it lik=
e this. It was just easier to make the commit like this, since</span></font=
></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I wouldn't need to undo all=
 the static removals and redo them for the next commit</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">(I tend to work through all=
 the code and then separate changes into commits, maybe</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">that's a bad habit I should=
 drop), and also I thought it would making reviewing the</span></font></div=
>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">next patch easier.</span></=
font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +void spr_load_du=
mp_spr(int sprn)<br>
&gt; &gt; +{<br>
&gt; &gt; +#ifdef PPC_DUMP_SPR_ACCESSES<br>
&gt; <br>
&gt; The define needs to come along.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Oops, another one that I fo=
rgot. This has the same issue as the one before, so I'm</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">guessing the same solution:=
 move the define to internal, so both cpu_init.c and
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">translate.c can access it.<=
br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +/* I really see =
no reason to keep these gen_*_xer */<br>
&gt; &gt; +/* instead of just leaving the code in the spr_*_xer */<br>
&gt; &gt; +void gen_read_xer(DisasContext *ctx, TCGv dst)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; TCGv t0 =3D tcg_temp_new();<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; TCGv t1 =3D tcg_temp_new();<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; TCGv t2 =3D tcg_temp_new();<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_mov_tl(dst, cpu_xer);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_shli_tl(t0, cpu_so, XER_SO);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_shli_tl(t1, cpu_ov, XER_OV);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_shli_tl(t2, cpu_ca, XER_CA);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_or_tl(t0, t0, t1);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_or_tl(dst, dst, t2);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_or_tl(dst, dst, t0);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; if (is_isa300(ctx)) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcg_gen_shli_tl(t0, c=
pu_ov32, XER_OV32);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcg_gen_or_tl(dst, ds=
t, t0);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcg_gen_shli_tl(t0, c=
pu_ca32, XER_CA32);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tcg_gen_or_tl(dst, ds=
t, t0);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_temp_free(t0);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_temp_free(t1);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_temp_free(t2);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +void gen_write_xer(TCGv src)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; /* Write all flags, while reading back check =
for isa300 */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_andi_tl(cpu_xer, src,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ~((1u &lt;&lt; XER_SO) |=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1u &lt;&lt;=
 XER_OV) | (1u &lt;&lt; XER_OV32) |<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (1u &lt;&lt;=
 XER_CA) | (1u &lt;&lt; XER_CA32)));<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_extract_tl(cpu_ov32, src, XER_OV32, 1=
);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_extract_tl(cpu_ca32, src, XER_CA32, 1=
);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_extract_tl(cpu_so, src, XER_SO, 1);<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_extract_tl(cpu_ov, src, XER_OV, 1);<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp; tcg_gen_extract_tl(cpu_ca, src, XER_CA, 1);<b=
r>
&gt; &gt; +}<br>
&gt; <br>
&gt; These two can continue being static.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Good catch again. But my qu=
estion (in the comment at the begining) remains:</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Is there a good reason to k=
eep them separate from spr_(read|write)_xer, since</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">they are only used by those=
 functions and aren't much different than other
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">read|write functions.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; Moving a big amount of=
 code like this to another file *and* rearranging<br>
&gt; the code within the file at the same time makes it harder to review an=
d<br>
&gt; is error prone. I'd move the code in one patch and rearrange things in=
 a<br>
&gt; separate patch if needed.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Yeah... I didn't know about=
 the automated sed command until earlier today</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">so it didn't occur to me th=
at it could be a problem. The rearranging was either</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">an accident, or a way to re=
duce ifdefs, but that can be a trivial patch later on<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; +/* prototypes fo=
r readers and writers for SPRs */<br>
&gt; &gt; +<br>
&gt; &gt; +#ifdef TARGET_PPC64<br>
&gt; &gt; +void gen_fscr_facility_check(DisasContext *ctx, int facility_spr=
n,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int=
 bit, int sprn, int cause);<br>
&gt; &gt; +void gen_msr_facility_check(DisasContext *ctx, int facility_sprn=
,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int bit, =
int sprn, int cause);<br>
&gt; &gt; +#endif<br>
&gt; <br>
&gt; The gen_* functions are only called from within the spr.c.inc file. Yo=
u<br>
&gt; shouldn't need them here.<br>
&gt; <br>
&gt; &gt; +<br>
&gt; &gt; +void spr_load_dump_spr(int sprn);<br>
&gt; &gt; +void spr_read_generic(DisasContext *ctx, int gprn, int sprn);<br=
>
&gt; &gt; +void spr_store_dump_spr(int sprn);<br>
&gt; &gt; +void spr_write_generic(DisasContext *ctx, int sprn, int gprn);<b=
r>
&gt; &gt; +void gen_read_xer(DisasContext *ctx, TCGv dst);<br>
&gt; &gt; +void gen_write_xer(TCGv src);<br>
&gt; <br>
&gt; Same here.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Relics of a different solut=
ion. Will remove for v2<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; -static void spr_=
noaccess(DisasContext *ctx, int gprn, int sprn)<br>
&gt; &gt; -{<br>
&gt; &gt; -#if 0<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp; sprn =3D ((sprn &gt;&gt; 5) &amp; 0x1F) | ((s=
prn &amp; 0x1F) &lt;&lt; 5);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp; printf(&quot;ERROR: try to access SPR %d !\n&=
quot;, sprn);<br>
&gt; &gt; -#endif<br>
&gt; &gt; -}<br>
&gt; &gt; -#define SPR_NOACCESS (&amp;spr_noaccess)<br>
&gt; <br>
&gt; What happens to code in translate.c that checks this? I don't think yo=
u<br>
&gt; can remove it.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">the define was moved to int=
ernal.h (forgot to include in this patch, it's in the</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">next one, will fix). I don'=
t know if that's a good solution, but it's working for now<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&lt;snip&gt;</span></font><=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt;&nbsp; #if defined=
(TARGET_PPC64)<br>
&gt; &gt; -#if defined(CONFIG_USER_ONLY)<br>
&gt; &gt; -#define POWERPC970_HID5_INIT 0x00000080<br>
&gt; &gt; -#else<br>
&gt; &gt; -#define POWERPC970_HID5_INIT 0x00000000<br>
&gt; &gt; -#endif<br>
&gt; <br>
&gt; Where do these went?<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Same as before:&nbsp; They =
were added to internal.h and I forgot.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen<span style=3D"color:#1F497D"></span></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttp://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswy=
iVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx=
5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG=
6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oD=
Mp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFk=
jH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU=
3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2=
BmF0NnDET6jMLuIqtCcVIch" target=3D"_blank" rel=3D"noopener noreferrer"><spa=
n style=3D"color:windowtext">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee<br>
</span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color:windowtext">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB4499E24FF645D0AEF2CC2D4EC7429CP2PR80MB4499lamp_--

