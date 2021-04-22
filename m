Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0003680BA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 14:42:24 +0200 (CEST)
Received: from localhost ([::1]:37720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZYf0-0006kj-8b
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 08:42:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lZYY2-0002wa-0y; Thu, 22 Apr 2021 08:35:10 -0400
Received: from mail-eopbgr790134.outbound.protection.outlook.com
 ([40.107.79.134]:2800 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lZYXu-0007RI-4w; Thu, 22 Apr 2021 08:35:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4kVALI8Y4f/58KdpHJoAMkCVw5E0lXzjf2RXjzfoiztm2fE6p9GfoO+IMIEysTxJMlHpuq1LpmGBGlakFipx6OHKHfI8y+mm0GU5Hj+5jMMpXENQ4lXvKoS9vmXrNhqVEeEtC/lKFVG0aNk5gfu5hzpeuo9anap8WjmoessfZRYgEGd+vXLL7+mxGLz18kKPYdVQnDAyJY6PaLHRSZDKXepjo2hzcoi/LjTh0bSaf9iz3oO/pXuD7lDRSl5KbFJdBZ2kJFhbfyKIIDK7mD5JncpHvEgQJUIjC1X9rbqP+A1ZZkW4qkEsU3ubiaSaBJcJSyaTLmMa2mdEoNUSMweCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2wKbQuD25O4Opc00A9MOlNjixI/OB8/E1ryfJgNR1k=;
 b=fUoy6B7nUgR3aJ3TLhEvRGsMYRoSCWo5ptRVpfZG5srxigIMVGybfvmXynluIWYhg+hPOChKYP1+7xJVRE+0V6UumeHc7SXvob8gWHGAosiMai/QvgDm2O2ZJT4JXpG6VCV7UiBl+rOYoaku3D0JuMDRxraB+3gpL0mrHYGmS+/TQHLMuWPnrZQnOhbpGHG6Oy3HUqYi3hXIeB/gj7h2xjJ2a3m9cx9vL0ewbzCFbeKMkvowZdyIWoTZLXodAldzTVrJHInoDKmut4kx3VUk4QpZwTfd7EArnj32NkyS6Az640VpaSmSTx2CRqxqwUpYYrzGOYdK5lPDOivaJGll+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2wKbQuD25O4Opc00A9MOlNjixI/OB8/E1ryfJgNR1k=;
 b=igcWjTTA2lJ9EE35dH//4/cs12KpjgkzoZ+AvepFkOZHreflSKGoTYDzLLdKcEBosw4zIJkG+79mD/B35cfNx0UQ9Wm8c+fC1rTEoWyDJ+33gpGZCTB9bXwgHe+LUqPNG7fn1FvpPnk+TKNlcpM8zx4H0fshHMPa3Pz8yImzN1cjHaz1EOcOIW+IsxdykfIdAehMnhcoBDA/2ZIKaPj1f9c6r4H/eCH9dfIhfALlwb0VykClF307km+qvOluHKLQWWPl9qRXnvxznEU7Yw4E8rybMRO7e6vlXD6Vv/dyukBhRQ3j8KeBLX1akcntxRPNyl9pm4uzjp2KdGjm+N13pQ==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CPXPR80MB4967.lamprd80.prod.outlook.com (2603:10d6:103:9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 12:34:56 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4065.020; Thu, 22 Apr 2021
 12:34:55 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXN2hQ+6ch1mzZa0+go8E8CBF19A==
Date: Thu, 22 Apr 2021 12:34:55 +0000
Message-ID: <CP2PR80MB44990338BCF641993404B901C7469@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:450e:1599:3947:d5be]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b063325e-e8d5-4ba4-0186-08d9058b08fa
x-ms-traffictypediagnostic: CPXPR80MB4967:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB49677FF621E66F1A819F8548C7469@CPXPR80MB4967.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: x9TW1zeORI7YmYwolfIJnGpw29AG5RoYwLW7NE0qvuaKU5TAcv9tpAc3J6q6ERwxMCd3CAn+S2oF0Hdazzs+EexkX2xFfu3v3wppfLGRs4BPxZT5bDMCW7WAV3w6QqYYQmzZvvsYdrmkVcYQZnqxLIlfnwtd69UgejqHNdfbg+4Vj48eW9+xLjxGfdDjVFVFqrdHpFPfnnfQrnSK3a4qZiRcDWNbl+oOnPpzaPs13ArZ92jlHZ+3dvrj3YbiIglzzA234nCfcc7H/wLygfoCZbX3QGg0ToPyab9XmkvEdu2IaZs7HFqexCmhIdHXvKCj7F0DLXdSpOM+NEs+n7lSZPip3C7BG4eR+Vlek0Q9/PJJEF73ugwepKV3q9wGORXzbzwTtCBQC9TQr0oUh29e5dXLwvWWBFUzfkI/YHQyrteH8Q+OXQm0ae+c+W5LhUjj8DRQ5ytM5TyBLSkVCy4C0ELVqt56bxQmk3hyxhwg8TmVa954EgP3wj3wu2NGCzvSHCFhp50lnnLdQvpOs06RhRbciNf2q1VBjAEkMTlzJZ1WvjmCrrTvh+FHI3KIeftucwxkBdO9GnhvWBM8bdCBCFnS6mMq02024Yc5Ca+5Y+m8u92B9iIglCdGWirV18rsR/JhAzziP/eJW4Ny7EvR/Brcb80JxWyInhELXOUiGEfVG25eoRPHXUQj9Z29pJl6
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(39840400004)(396003)(376002)(346002)(8676002)(54906003)(21615005)(83380400001)(107886003)(122000001)(4326008)(316002)(166002)(7696005)(6916009)(478600001)(66446008)(66476007)(186003)(2906002)(86362001)(64756008)(9686003)(66556008)(6506007)(5660300002)(52536014)(966005)(76116006)(33656002)(71200400001)(8936002)(38100700002)(19627405001)(66946007)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?C2W5+b+7q+EMA5eCJwujvSyhpSCV0dAe31Uv4X2qHZGo8S1Ya3uBough51?=
 =?iso-8859-1?Q?wKDufsoGwRIC/QQObiuPRYhnFerCjwb34ATJFY/hs8DybX0d60e0GwoHgw?=
 =?iso-8859-1?Q?v31xmJcc52a+pfb69pf0qCP0ap1580E1oI+2JiDNDbQTIWucNcQzKZJMk0?=
 =?iso-8859-1?Q?PeEScLF/TZuna8U0qpfMEIPiCeyYZ/cSvs9Z13oSOZm5j7XDMyUGlxSgR9?=
 =?iso-8859-1?Q?jgNm5WgbOObcZMqwxvRltcQ6GovCj6lTF48xmXbb6lbJyxejezVVr/2EtQ?=
 =?iso-8859-1?Q?BHfM++fwOhcY3SC0NWT/drQgfqqVzsVKu2MpTGJZWsQ8srTBbqYrhkOX+4?=
 =?iso-8859-1?Q?yMooYnG9uJhHMzSL/j9Zj6EH52WQDoMU+TWE8karq9BUYlQwfwYXRrL3qr?=
 =?iso-8859-1?Q?xOWx2KbX75bgj26yiUyL0SXCeV1gT4Bxc4hprmN5poEYOusWykZSXjwVwJ?=
 =?iso-8859-1?Q?+7AzBeZ/iVYZG2exfzibkwf+LthvmsUz/Vpiru2b6c2VXanlz1FG1INaF9?=
 =?iso-8859-1?Q?IPhpg1l3jCGSaL8uqfpvt8X4bCtAomvgFr41SmGvuYLW2kcLtdAzvLjPb0?=
 =?iso-8859-1?Q?OCTaAY9PusICFVmr/MmQcrDUDfICJh5y3ziamqDntWF8841B+oKgl+nIj+?=
 =?iso-8859-1?Q?vjpkkG8zXivkaQC55fahrLYCfCY5pO3FkeFC2TYNSiSf1ebdhRkrZoJogt?=
 =?iso-8859-1?Q?TG3yXEtpi6mCrFq3I6Ie2lzwPEYJp6S4KdrLn8PQVrXQ4yYDlFMFuPUdHf?=
 =?iso-8859-1?Q?DE/1ShwibFIbjddHgMI77ABQZzfyk+Zx2t8dH/nkCo/GX0mzaokwojWXG1?=
 =?iso-8859-1?Q?pXUofm5azZGsf9IoGP+jOT4pSldNL5sAgVNQLbyjlybntEDJOJIARm8jF7?=
 =?iso-8859-1?Q?vxDvIazcey40fpVv83M2WTnUCa2odi2GKXKdNpg9kvdrCEy9H9sOw31jhi?=
 =?iso-8859-1?Q?SKYeUaIY/q89kB/tT+K4pMXpsoTJYXJFCseUbW3skheQmtgJgSMzge2QzD?=
 =?iso-8859-1?Q?CDtp1P4Il/NWvoaUiQjH5G+BV8rT8X4jIJfZlpbDUSg2I/YC7tWvWFlUKE?=
 =?iso-8859-1?Q?4+rGCKtXaUWJvV5hjH1AW+ZjaoDFzRIO6Vlz0AS9LeN+D160M4UR3S4j6Z?=
 =?iso-8859-1?Q?rSk4JyzxOTavSVoeDrBXSdZQLbY1CNjB93HawOSkPx/gT9pl65t0qv5R3y?=
 =?iso-8859-1?Q?H/GQxD0X+xCQ5FLY8XYFOsde9fZAl8brKZE2dqzjECxYA//su31sMCCmud?=
 =?iso-8859-1?Q?3mavqrnnWWYHgwLZm7b9TDIZSbB8DqJkmX9steF27u1OgQsKfAyPj5ZuDv?=
 =?iso-8859-1?Q?x8/Ok0W506wNgkdx7jCTJA4wPeR3+s1SQcwjeCUKnJTNAa3ubA84qjcg4w?=
 =?iso-8859-1?Q?3JLEHPTKxzTHrsBTbzcrbvCh9tJU1C66WGJfroKJxsUg+0tATK7CQ=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44990338BCF641993404B901C7469CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b063325e-e8d5-4ba4-0186-08d9058b08fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 12:34:55.5872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tNqx9TUGysdRSK96ot+WzyW0lWdEJZ3Jm10wE7b07A3qboDmgc5dN1Sd5UXg6LOhM5nfn0pijmRmdIOGO4iph86wunfz4W8buBBRUORIszc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB4967
Received-SPF: pass client-ip=40.107.79.134;
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
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

--_000_CP2PR80MB44990338BCF641993404B901C7469CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > You are correct! I've just tweaked the code that defines spr_register a=
nd
> > it should be working now. I'm still working in splitting the SPR functi=
ons
> > from translate_init, since I think it would make it easier to prepare t=
he
> > !TCG case and for adding new architectures in the future, and I found a
> > few more problems:
>
> Actually looking at the stuff below, I suspect that separating our
> "spr" logic specifically might be a bad idea.  At least some of the
> SPRs control pretty fundamental things about how the processor
> operates, and I suspect separating it from the main translation logic
> may be more trouble than it's worth.

Well, all the errors that I got were related to to read/write functions, wh=
ich
I was already separating into a spr_tcg file. The solutions I can see are t=
o
include this file in translate.c, and either have the read/write functions =
not be
static, or include the spr_common.c in translate as well, but only for TCG
builds. Both solutions sound pretty bad imo, but the first sounds less bad,
because it's a bit less complexity in the build process.

Other than that, I don't really see how we can support a !TCG build without
separating SPR, exactly because they are very fundamental to the processor.
Am I missing something? I fully expect to be, at this point, things are
turning out even more complicated than I expected



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
De: David Gibson
Enviadas: Quarta-feira, 21 de Abril de 2021 02:13
Para: Bruno Piazera Larsen
Cc: Fabiano Rosas; Thomas Huth; qemu-devel@nongnu.org; lagarcia@br.ibm.com;=
 Lucas Mateus Martins Araujo e Castro; Fernando Eckhardt Valle; qemu-ppc@no=
ngnu.org; Andre Fernando da Silva; Matheus Kowalczuk Ferst; Luis Fernando F=
ujita Pires
Assunto: Re: [PATCH 1/4] target/ppc: Code motion required to build disablin=
g tcg

On Tue, Apr 20, 2021 at 07:02:36PM +0000, Bruno Piazera Larsen wrote:
> > > What I was doing was to only register the spr once, and use the
> > > accel-specific functions to set the relevant attributes, so spr_commo=
n
> > > wouldn't need to where (and if) spr_read_* exists or not.
> > > Would this work?
> > >
> > > Just ignoring the read and write functions means we still need
> > > to compile them, or at least stub them, otherwise we'd get linker
> > > problems.
> >
> > Not if you use a macro which will simply elide the references in the
> > !TCG case.  Actually I think even an inline wrapper will do it, I'm
> > pretty sure the compiler is smart enough to optimize the references
> > out in that case.
>
> You are correct! I've just tweaked the code that defines spr_register and
> it should be working now. I'm still working in splitting the SPR function=
s
> from translate_init, since I think it would make it easier to prepare the
> !TCG case and for adding new architectures in the future, and I found a
> few more problems:

Actually looking at the stuff below, I suspect that separating our
"spr" logic specifically might be a bad idea.  At least some of the
SPRs control pretty fundamental things about how the processor
operates, and I suspect separating it from the main translation logic
may be more trouble than it's worth.

> 1. Global variables being defined in translate.c and used both there and
> in spr functions. The variables in question are: cpu_gpr, cpu_so, cpu_ov,
> cpu_ca, cpu_ov32, cpu_ca32, cpu_xer, cpu_lr and cpu_ctr. The easy way
> out is to have global "getters" and "setters" for those, but I'm not sure
> it's a good solution.

Yeah, that seems really messy, plus those are special variables used
by TCG generated code whose operation I don't really understand.

> 2. Static functions defined in translate.c, used there and TCG-related
> spr functions. They are: gen_load_spr, gen_store_spr, gen_stop_exception,
> gen_inval_exception. The easy solution is adding a prototype to internal.=
h
> and removing the static, but again, not sure it's a good solution

I think gen_*() functions should stay in translate.c, since they are,
explicitly, about translation ("gen" for "generating code").

> 3. gen_read_xer (currently in spr_common) calls is_isa300, defined in
> include/disas/disas.h, which is a macro that dereferences DisasContext.
> However, the struct is defined in translate.c. This one is pretty easy, I=
 think,
> it's just turning the macro into a function, but since I'm already e-mail=
ing,
> I figured I might as weel ask.
>
> Finally, since most read and write functions are static, I added them to
> spr_tcg.c.inc to be included only with TCG, as a quick fix, but I would r=
eally
> prefer some other solution if there is anything better. Any thoughts on t=
his?
>
> IIRC, this is the last thing holding me back from an RFC with this motion
> patch
>
>
> Bruno Piazera Larsen
>
> Instituto de Pesquisas ELDORADO<http://clickemailmkt.eldorado.org.br/ls/c=
lick?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuK=
XZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1u=
UipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI=
1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5i=
XWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IW=
DcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDY=
IvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch>
>
> Departamento Computa=E7=E3o Embarcada
>
> Analista de Software Trainee
>
> Aviso Legal - Disclaimer<https://www.eldorado.org.br/disclaimer.html>

--
David Gibson                    | I'll have my music baroque, and my code
david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
                                | _way_ _around_!
http://www.ozlabs.org/~dgibson

--_000_CP2PR80MB44990338BCF641993404B901C7469CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; You are correct! =
I've just tweaked the code that defines spr_register and<br>
&gt; &gt; it should be working now. I'm still working in splitting the SPR =
functions<br>
&gt; &gt; from translate_init, since I think it would make it easier to pre=
pare the<br>
&gt; &gt; !TCG case and for adding new architectures in the future, and I f=
ound a<br>
&gt; &gt; few more problems:<br>
&gt; <br>
&gt; Actually looking at the stuff below, I suspect that separating our<br>
&gt; &quot;spr&quot; logic specifically might be a bad idea.&nbsp; At least=
 some of the<br>
&gt; SPRs control pretty fundamental things about how the processor<br>
&gt; operates, and I suspect separating it from the main translation logic<=
br>
&gt; may be more trouble than it's worth.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Well, all the errors that I=
 got were related to to read/write functions, which</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I was already separating in=
to a spr_tcg file. The solutions I can see are to</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">include this file in transl=
ate.c, and either have the read/write functions not be
<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">static, or include </span><=
/font>the spr_common.c in translate as well, but only for TCG
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
builds. Both solutions sound pretty bad imo, but the first sounds less bad,=
 <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
because it's a bit less complexity in the build process.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Other than that, I don't really see how we can support a !TCG build without=
 <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
separating SPR, exactly because they are very fundamental to the processor.=
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Am I missing something? I fully expect to be, at this point, things are</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
turning out even more complicated than I expected<br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
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
<br>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%;">
<b>De:</b> David Gibson<br>
<b>Enviadas:</b> Quarta-feira, 21 de Abril de 2021 02:13<br>
<b>Para:</b> Bruno Piazera Larsen<br>
<b>Cc:</b> Fabiano Rosas; Thomas Huth; qemu-devel@nongnu.org; lagarcia@br.i=
bm.com; Lucas Mateus Martins Araujo e Castro; Fernando Eckhardt Valle; qemu=
-ppc@nongnu.org; Andre Fernando da Silva; Matheus Kowalczuk Ferst; Luis Fer=
nando Fujita Pires<br>
<b>Assunto:</b> Re: [PATCH 1/4] target/ppc: Code motion required to build d=
isabling tcg
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, Apr 20, 2021 at 07:02:36PM +0000, Bruno Pi=
azera Larsen wrote:<br>
&gt; &gt; &gt; What I was doing was to only register the spr once, and use =
the<br>
&gt; &gt; &gt; accel-specific functions to set the relevant attributes, so =
spr_common<br>
&gt; &gt; &gt; wouldn't need to where (and if) spr_read_* exists or not.<br=
>
&gt; &gt; &gt; Would this work?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Just ignoring the read and write functions means we still ne=
ed<br>
&gt; &gt; &gt; to compile them, or at least stub them, otherwise we'd get l=
inker<br>
&gt; &gt; &gt; problems.<br>
&gt; &gt;<br>
&gt; &gt; Not if you use a macro which will simply elide the references in =
the<br>
&gt; &gt; !TCG case.&nbsp; Actually I think even an inline wrapper will do =
it, I'm<br>
&gt; &gt; pretty sure the compiler is smart enough to optimize the referenc=
es<br>
&gt; &gt; out in that case.<br>
&gt; <br>
&gt; You are correct! I've just tweaked the code that defines spr_register =
and<br>
&gt; it should be working now. I'm still working in splitting the SPR funct=
ions<br>
&gt; from translate_init, since I think it would make it easier to prepare =
the<br>
&gt; !TCG case and for adding new architectures in the future, and I found =
a<br>
&gt; few more problems:<br>
<br>
Actually looking at the stuff below, I suspect that separating our<br>
&quot;spr&quot; logic specifically might be a bad idea.&nbsp; At least some=
 of the<br>
SPRs control pretty fundamental things about how the processor<br>
operates, and I suspect separating it from the main translation logic<br>
may be more trouble than it's worth.<br>
<br>
&gt; 1. Global variables being defined in translate.c and used both there a=
nd<br>
&gt; in spr functions. The variables in question are: cpu_gpr, cpu_so, cpu_=
ov,<br>
&gt; cpu_ca, cpu_ov32, cpu_ca32, cpu_xer, cpu_lr and cpu_ctr. The easy way<=
br>
&gt; out is to have global &quot;getters&quot; and &quot;setters&quot; for =
those, but I'm not sure<br>
&gt; it's a good solution.<br>
<br>
Yeah, that seems really messy, plus those are special variables used<br>
by TCG generated code whose operation I don't really understand.<br>
<br>
&gt; 2. Static functions defined in translate.c, used there and TCG-related=
<br>
&gt; spr functions. They are: gen_load_spr, gen_store_spr, gen_stop_excepti=
on,<br>
&gt; gen_inval_exception. The easy solution is adding a prototype to intern=
al.h<br>
&gt; and removing the static, but again, not sure it's a good solution<br>
<br>
I think gen_*() functions should stay in translate.c, since they are,<br>
explicitly, about translation (&quot;gen&quot; for &quot;generating code&qu=
ot;).<br>
<br>
&gt; 3. gen_read_xer (currently in spr_common) calls is_isa300, defined in<=
br>
&gt; include/disas/disas.h, which is a macro that dereferences DisasContext=
.<br>
&gt; However, the struct is defined in translate.c. This one is pretty easy=
, I think,<br>
&gt; it's just turning the macro into a function, but since I'm already e-m=
ailing,<br>
&gt; I figured I might as weel ask.<br>
&gt; <br>
&gt; Finally, since most read and write functions are static, I added them =
to<br>
&gt; spr_tcg.c.inc to be included only with TCG, as a quick fix, but I woul=
d really<br>
&gt; prefer some other solution if there is anything better. Any thoughts o=
n this?<br>
&gt; <br>
&gt; IIRC, this is the last thing holding me back from an RFC with this mot=
ion<br>
&gt; patch<br>
&gt; <br>
&gt; <br>
&gt; Bruno Piazera Larsen<br>
&gt; <br>
&gt; Instituto de Pesquisas ELDORADO&lt;<a href=3D"http://clickemailmkt.eld=
orado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTaswyiVb1TXP3jEbQqiiJKKGsxOn=
8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8Xx5PzCVNt6TpGrzBbU-2Biu0o=
69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2BG6VvNBoa1YzxYjhCdFS9IfAN=
IaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3oDMp7KKdJPM68iKuI2jiRH5v4=
B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5dFkjH4f279sVQpOtyjw5xAqj34=
M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMtlU3zwbQUBCgL30fQoJPcRPMGK=
yOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H-2BmF0NnDET6jMLuIqtCcVIch=
" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"NotApplicable"=
>http://clickemailmkt.eldorado.org.br/ls/click?upn=3DUPoxpeIcHnAcbUZyo7TTas=
wyiVb1TXP3jEbQqiiJKKGsxOn8hBEs5ZsMLQfXkKuKXZ7MVDg0ij9eG8HV4TXI75dBzDiNGLxQ8=
Xx5PzCVNt6TpGrzBbU-2Biu0o69X5ce-2FW-2FOk1uUipuK0fZnWXJEgbRw-3D-3DJY4T_wWk-2=
BG6VvNBoa1YzxYjhCdFS9IfANIaBzDSklR1NyyrKOI1wj0P-2BdBFcuO4FnHcsA1MyHu0ly1Yt3=
oDMp7KKdJPM68iKuI2jiRH5v4B0d8wf3chU3qy5n5iXWnW1QjSaNFHOgELzxaP-2FnesTeBgJ5d=
FkjH4f279sVQpOtyjw5xAqj34M6pgNRAxVvuXif4IWDcVzXg1FzfYlEfkKzr9vvpA3Hg8kitwMt=
lU3zwbQUBCgL30fQoJPcRPMGKyOY8RmoAlXNqTJYDYIvqmfnI7KLUvw6vKB5R-2B5q1FJRAzX7H=
-2BmF0NnDET6jMLuIqtCcVIch</a>&gt;<br>
&gt; <br>
&gt; Departamento Computa=E7=E3o Embarcada<br>
&gt; <br>
&gt; Analista de Software Trainee<br>
&gt; <br>
&gt; Aviso Legal - Disclaimer&lt;<a href=3D"https://www.eldorado.org.br/dis=
claimer.html" target=3D"_blank" rel=3D"noopener noreferrer" data-auth=3D"No=
tApplicable">https://www.eldorado.org.br/disclaimer.html</a>&gt;<br>
<br>
-- <br>
David Gibson&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | I'll have my music ba=
roque, and my code<br>
david AT gibson.dropbear.id.au&nbsp; | minimalist, thank you.&nbsp; NOT _th=
e_ _other_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | _way_ _around_!<br>
<a href=3D"http://www.ozlabs.org/~dgibson" target=3D"_blank" rel=3D"noopene=
r noreferrer" data-auth=3D"NotApplicable">http://www.ozlabs.org/~dgibson</a=
><br>
</div>
</span></font></div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB44990338BCF641993404B901C7469CP2PR80MB4499lamp_--

