Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B632936465D
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 16:44:35 +0200 (CEST)
Received: from localhost ([::1]:36692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYV8c-0005fK-Hi
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 10:44:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lYV4y-0003St-6g; Mon, 19 Apr 2021 10:40:50 -0400
Received: from mail-eopbgr790100.outbound.protection.outlook.com
 ([40.107.79.100]:32360 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lYV4r-0006im-4o; Mon, 19 Apr 2021 10:40:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODOxYwmAJcdvhxXoL+3SPMZd5yzkrjM/DQdjoqclYXYfo+jy7hJGSZjvEYzaPyC8ArftVpo3TfvILz78Q4LktbpGY2LVYpClLXZi8rEQpATd9Wue3oiuF1f9Ek/g3t97CeVgbwxMqamFqNL8w/Ek2oUFINjqEu3KNg36SGSZ04f1lh5hmgzfHbBA4V8jA9ol/vWQnXstl11A4k6jovnuklbRrKZ/dMT3WUJZtYaZlSQYEX9YilKTmNaT7VymaubzyiEdcV9n8fWmONcLJdLz5s3Ytj1cgCqYTX5JhGEMyuBfZBaBaYTVRmbZGyfRUqTs8bh0fXZRmH6vNwGTZUKDkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aZAcYQMIYZUDzrQkZcNgQVskaDNI1n+v807M4Ub5LQ=;
 b=k/MGOslxApK5ZYWMtxRLFKXWhn6f1GQpY+nduXEgnmpNwZafmNM48QzWQqv66ZI+7RiUFPDZHszNx1LmQpzV78AhF8bcNGqp6FyfbBKnVHbFBSfhOKOL1YPez/Ll2ssgOsYL5g5/4q1Mfsdh4wHF5aysk/mR8VeK6P/Rd7WL8n9Mm4bVR2l0ai5Ap3CwbuxcBD0SDKuyAgC0IfeSt6HClRfayS6Viw5Dsr5hVTX+8boAnPSdCq5a5vGbk9e2Ee4HHIWCkLpKZNB7UdVihC/rtfFM46k79PZ1YuUF4DcHZvS0L5PmhEpMFgzYUq93P8lPV7hocri1UpLJgSL3VD6t0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aZAcYQMIYZUDzrQkZcNgQVskaDNI1n+v807M4Ub5LQ=;
 b=BZScF5K2Tq7pIxoyBSkI/byP5332c9YENdocVRxslSrPixSkYGbLj7UvyPWgVqchrG1R6DPnwk2fjOPqpV5gBYZz5BBG6wbstDW9OInwVptZiL0DoK5gyknDJiH34mvadJirruHDuekrVmitV+hIKxpw8KYDNGAA13GS881Msd5YT0CtwRJeE+u6lN78bSVJZ95NJXn+CgNYLVjnzy60ScEIZ5iO5w/m1AEIM0/AFDOQpM0/XNbe/3diLL3Yz6BW8PecpS34VblyJM3BP5ccsu72KPzb3LPR5x8sp7auKEFwKUlrbe9OrEm0zDW+TWrdFiSdVXCNrEgnsnFPlTqa1A==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5314.lamprd80.prod.outlook.com (2603:10d6:103:5a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Mon, 19 Apr
 2021 14:40:36 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 14:40:36 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXNSNiQNnwIQba9Uy3D8h2kdKJGA==
Date: Mon, 19 Apr 2021 14:40:35 +0000
Message-ID: <CP2PR80MB44998EBF7704B13C79081093C7499@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:c811:a0ab:7232:b8b3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 92206799-83f2-432b-107a-08d903411826
x-ms-traffictypediagnostic: CP0PR80MB5314:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB53142772F31F9C47F8FB02CFC7499@CP0PR80MB5314.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gVNJRqcQ3DkNQK/mdo1Qjc+Y8BMruYzYu6akZebjaV4BTcDxrTC7mb0ZR+YR473zcvUGWpYJBLgKG3evdcc1JhM90au6oBrDrcO1HsvWVm3YdJA8j1gyLFvAfLCna1WwzI+FPtorjFUVVkOXcyB0qaeSERuJlEFtjD4jUtFdBYLRJMyBAbTAzPon9mx0U+2PzkoywkVV/ZrgoqDRvGTW20q/ZRvG81bRs3+rqBsMaUodppeHARsg+WxSmye6s6DnDkAFTj0/bEjVbX8Y90ukComhljnb785oPqCqmekKxNNjW85Owe00aO7qfnMz58VbYPwcQM4DM1u585plyOE/C4BsXrAJgIYxvSeUqI2RNV0I/arpxvm6PUJmk2T6NJIK31oqV5u9NdaYMnt7FghSeF+HWzRaG1VfyIByUuAkaMRz/DG4su1VIto9l2+ml/5V/iX75uJYxmJcV8S4BdhW5kc6QdRHRlmBV3zuL22OvovJ3jdWFXs5yIDo7uh3BiOmb3Sh/KcOCbcbb1Ps2LeAQKOF02zJNLaYAZRfd62nBGearV/yLaevBydU4sVpiDQ+nIScsGbwZ58nQbBeaqeikgo9n7g5MpxuyNhL/vwVttE8VsykHJYTf7kuNOqWDets4x8MT8RMMAj6GwWQ4NxxA51GPnH4LVUSe2xQelIpBKyyohChW5HCvZHyJ9lj3VJ7
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(39840400004)(376002)(136003)(346002)(396003)(71200400001)(21615005)(66556008)(66446008)(186003)(5660300002)(2906002)(64756008)(316002)(66476007)(52536014)(76116006)(6506007)(66946007)(7696005)(33656002)(122000001)(107886003)(86362001)(110136005)(166002)(38100700002)(54906003)(8936002)(19627405001)(478600001)(8676002)(55016002)(83380400001)(4326008)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?VZz31RJ2FpSWIkfIQU4gu3dzxwqR1JVTM/0Hfl6YHXf+BdBRNT6CKA5Yr1?=
 =?iso-8859-1?Q?WZZ5CQhUfUCPfxzhogv8Zv/a0UEYlDH5RknCqOCmeg6zfdbv4aN6hfwncS?=
 =?iso-8859-1?Q?xeRmt11ByaK6Z6dSqZ6ypRXjo4LrlC5RqlOdejy+Q60A2yecYWtdfADeXr?=
 =?iso-8859-1?Q?U5cFyoavIdpKC/qzlHnMipVb9wAKCLOz58Tieucq2dUdcQp007tSv0O61X?=
 =?iso-8859-1?Q?zQhwCfWU1quaw4T9CaiJoZozHwiGMoIVm8zBHvBOW8Y6mDB415l9OzK/qo?=
 =?iso-8859-1?Q?K9We+9fyuoSFAmeCAIqZvoOLoMk37UwvKgVD/l3JHOkm/zSo0ufkpl7WHs?=
 =?iso-8859-1?Q?4RxxJT+jqkpPCZONAgLGp8cVWEMimYv2a8hLig6QPBTwdN0FP9ssX0bqvJ?=
 =?iso-8859-1?Q?AHhdoSNExnoxF4YbRFSbus9YHnRai8N0ND2EIVO/ROdddpxNI4aq5u8DpA?=
 =?iso-8859-1?Q?VW1SDjDsADAXWblZxZL0kiW5DBHBMTQu15os/LocHUXzsdeGJXacd1PYtG?=
 =?iso-8859-1?Q?R1GZ//9hmdG/8pAg/cead2n0ImvNUXHDlpT51L4dOaTN9Pkpl/1RutbTF1?=
 =?iso-8859-1?Q?wDXoOFqbw+9UAsONcKENYtOWNd3YrW3lalTi0XTBa6kocTqDfPSbLECtBj?=
 =?iso-8859-1?Q?tphBOTGJsvbkIUd6oY5qQ4ug8A24A6gh37Tt5UaNXvWi2sSw/CLkwnWJui?=
 =?iso-8859-1?Q?FE/PszRBVJhn9hK/WWRdHuQ98NwjPX0pY5EHQ2wOvOtyOyjgym/CMj0tzQ?=
 =?iso-8859-1?Q?z2SZlS/dmLVFLwqP9RU6al22PsvqzLJLNB0uJu2OnF4V04Qimdh+7m01iI?=
 =?iso-8859-1?Q?xjY3DkXJYqcxhc1+VGmjrs7CAzqOi/KZ6AsVbgNzpSbN2h+ypKkcw8pJyK?=
 =?iso-8859-1?Q?OE5p+4fV30PuF4Z7HCm2R91e49UQMxilHsO5Ntr79CknChI0QeoVPA88Hb?=
 =?iso-8859-1?Q?tsnclt2ElWu+r8evwtIdhBcI3S3IfxrsE9Mfqs+ywCGoisP4UfF7q/0DqD?=
 =?iso-8859-1?Q?lrDJkz2A2midK3aRJnjbswa8NtIMwkFJIFsW9T8D0M2jfvM1SPH8SxN+NK?=
 =?iso-8859-1?Q?5WB92iTvVBTOdfLmTztMUIv3+y83OUP8TYmecsz7pMKURuHdt5iZct5Tlw?=
 =?iso-8859-1?Q?GJyh8OwLxiupuLFm3/QhUaFEhYJPLj5/hsFWNmdi5ejrQcdU4npQFHWvAd?=
 =?iso-8859-1?Q?p27zMs2LyAxC3/1KoKcfMKp1MnCIZzNajsPTc3c9KoJhDe8qw1vlcYeIsy?=
 =?iso-8859-1?Q?5IxYwcMSFUcEafqLmTAjBlo3ge3orJVSFTsngLFDVuzNWnGdNnWNm/cXAb?=
 =?iso-8859-1?Q?OmmWbdCQFFNYnXftB7Y/czvl8Ec0dzOk/RN6Cd2+/mC+8oJh/BhVpwqtrX?=
 =?iso-8859-1?Q?6UT3ZsbAKXDV2+FqvdZoePmVw4FTuCbIE6GF/GsLgvnyDQX36BaMg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44998EBF7704B13C79081093C7499CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92206799-83f2-432b-107a-08d903411826
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2021 14:40:35.9832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gzd5kz3qkZ9rnTIStEbXtQuwmRZyRdcxojZJTL2Q1sgjHilVRbm2Ja66PqlHroaHJcYKhDFtHVRfyUhebvauHXhQ/KA08UqHZ1XwZapaofU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5314
Received-SPF: pass client-ip=40.107.79.100;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB44998EBF7704B13C79081093C7499CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> > > used for some sprs, and whatever needs to be moved with it
> >
> > I'd leave them where they are currently. Instead what I think we should
> > do is to find a way to not need the uea/oea/hea|read/write callbacks
> > with KVM.
> >
> > Maybe extract a function from _spr_register that sets what is common fo=
r
> > both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
> > gen_spr* functions to first create all registers and then call both
> > configs to supplement:
> >
> > //tcg.c
> > static void tcg_gen_spr_generic(CPUPPCState *env)
> > {
> >     // these only set the callbacks
> >     spr_register(env, SPR_FOO,
> >                  SPR_NOACCESS, SPR_NOACCESS,
> >                  &spr_read_foo, &spr_write_foo);
> >     spr_register(env, SPR_BAR,
> >                  SPR_NOACCESS, SPR_NOACCESS,
> >                  &spr_read_bar, &spr_write_bar);
> > }
> >
> > //kvm.c
> > static void kvm_gen_spr_generic(CPUPPCState *env)
> > {
> >     // these only set one_reg_id
> >     spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
> >     spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
> > }
>
> I really dislike the idea above - it'd be way too easy for KVM and TCG
> to get out of sync.  Instead make spr_register() itself a macro if
> necessary, so it just ignores the access functions in the !TCG case.

What I was doing was to only register the spr once, and use the
accel-specific functions to set the relevant attributes, so spr_common
wouldn't need to where (and if) spr_read_* exists or not.
Would this work?

Just ignoring the read and write functions means we still need
to compile them, or at least stub them, otherwise we'd get linker
problems. And ifdef'ing them out of the calls would be quite a
pain to understand the code later on.



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

________________________________

--_000_CP2PR80MB44998EBF7704B13C79081093C7499CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; &gt; * move gen_w=
rite_xer and gen_read_xer into cpu_init.c, as they're<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; &gt; used for som=
e sprs, and whatever needs to be moved with it<br>
&gt; &gt; <br>
&gt; &gt; I'd leave them where they are currently. Instead what I think we =
should<br>
&gt; &gt; do is to find a way to not need the uea/oea/hea|read/write callba=
cks<br>
&gt; &gt; with KVM.<br>
&gt; &gt; <br>
&gt; &gt; Maybe extract a function from _spr_register that sets what is com=
mon for<br>
&gt; &gt; both tcg and kvm (num, name, initial_value, AFAICT). Then alter t=
he<br>
&gt; &gt; gen_spr* functions to first create all registers and then call bo=
th<br>
&gt; &gt; configs to supplement:<br>
&gt; &gt; <br>
&gt; &gt; //tcg.c<br>
&gt; &gt; static void tcg_gen_spr_generic(CPUPPCState *env)<br>
&gt; &gt; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; // these only set the callbacks&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;&nbsp; &nbsp;&nbsp; spr_register(env, SPR_FOO,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SPR_NOACCESS, SPR_NOACCESS,<br>
&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;spr_read_foo, &amp;spr_write_foo);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; spr_register(env, SPR_BAR,<br>
&gt; &gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SPR_NOACCESS, SPR_NOACCESS,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;spr_read_bar, &amp;spr_write_bar)=
;<br>
&gt; &gt; }<br>
&gt; &gt; <br>
&gt; &gt; //kvm.c<br>
&gt; &gt; static void kvm_gen_spr_generic(CPUPPCState *env)<br>
&gt; &gt; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; // these only set one_reg_id<br>
&gt; &gt;&nbsp; &nbsp;&nbsp; spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO=
);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; spr_register_kvm(env, SPR_BAR, KVM_REG_PP=
C_BAR);<br>
&gt; &gt; }<br>
&gt; <br>
&gt; I really dislike the idea above - it'd be way too easy for KVM and TCG=
<br>
&gt; to get out of sync.&nbsp; Instead make spr_register() itself a macro i=
f<br>
&gt; necessary, so it just ignores the access functions in the !TCG case.</=
span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">What I was doing was to onl=
y register the spr once, and use the</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">accel-specific functions to=
 set the relevant attributes, so spr_common</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">wouldn't need to where (and=
 if) spr_read_* exists or not.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Would this work?<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Just ignoring the read and =
write functions means we still need
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">to compile them, or at leas=
t stub them, otherwise we'd get linker</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">problems. And ifdef'ing the=
m out of the calls would be quite a
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">pain to understand the code=
 later on.<br>
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
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0);">
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB44998EBF7704B13C79081093C7499CP2PR80MB4499lamp_--

