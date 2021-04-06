Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BAA355B97
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 20:42:43 +0200 (CEST)
Received: from localhost ([::1]:35020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTqew-0001vm-Dv
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 14:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lTqar-0000gA-Vy; Tue, 06 Apr 2021 14:38:30 -0400
Received: from mail-eopbgr800133.outbound.protection.outlook.com
 ([40.107.80.133]:17040 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lTqao-0004Wu-M2; Tue, 06 Apr 2021 14:38:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TaDLZAwu4Z8B0aNdihLoz6fNM3IUC7sgcZGyNI5vryrwh4KcgSJ2yqVcMfecWT7aCOeQGAQAOZ9MYfPQQd9FnJBUhdTEFXbWKgKeCqS77LIbXny8M4ZCNI1wwJV86KYhpzJLGSiNvq04MXfADpv+erJEAGxJoOIIwpoEDVKPPyR5AVhwRX3+yD5ZnPDwGqlAy2/od9+Hn0UvUFyfyxqkDKysKIvSvv3eGJQDHXvHl8vTY7IRjbOYY6G2ixSr260YNKI/UuO54oSaRffN26JjXR0ZAZWywMF++fYsC+aRwibpeDr8hnPUqC417rsuS/DX77nMU8HJ+RyplWpYcSI2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z12oKaMndz5BdZFOoclo076j0zIvp05TdSE8bOUm/aA=;
 b=X/fj+PKwV/R9VmUCYHG4xzEh3ZSL6F9dNvmf1uMVQ0beFgKNMtc6yousRD6SSM2k4U7cKLPAMRSTy+hUWlcUshRMgVnMRlqth+/z4ZgvtkK/i0WLMZul7FUANRIWKfxh6/0uL2c1v7fdQXmaTET6naNrBXAfCZIrEsyZXT/m4CE6vtkjz0juopM4F2uigRw0AWgL6q5lRpZCcsW9GEgsoqHE6oiaOnUWhNZoFNIEf/wrENvQzKjh6jie1OYJOuUgOP8CICbMcQt7xksJuXyxVwVHLVGJfnqSlWJAcvCjIGnzP+5wznxDIXu0IhPBD3xRdPFdpm6H9ZIKmF14i8g/vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z12oKaMndz5BdZFOoclo076j0zIvp05TdSE8bOUm/aA=;
 b=iZB3KH1A/RZEzpjyeU904UQOrCvKhwhgQbwTJfeho+HI0F/n9eppazF4mMjTqR20PoeOzxJfr22NWGUXJln0H3jw8RmSYGhnn0Q8MtIrZkff5F67iq7qRs2RGnI2yEQ/g0SIOcEcaps5PeP/+ESJfkHmyw45R+mfaEDh3EC90S9gDeOvhj49wfA7y3NPs5Eo+ye6ZRcuRjO7pw4NOx5Sd/DX2IsR9N9iUy4NNdPYVfXOqsjLVl2Xourts05AkHgP0cwhJnCSwjGhKGftn2302vwnf3G+U3Ah6s4ZcHdmGgBk1L0jrnzPkIVz9T4bzrmwsBJnsbZPggqJVwPJXtKecQ==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB5027.lamprd80.prod.outlook.com (2603:10d6:103:24::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 18:38:21 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::aca2:c55e:bb3f:5a3b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::aca2:c55e:bb3f:5a3b%3]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 18:38:21 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: Discussion: Patch series that adds disable-tcg option for ppc
 targets
Thread-Topic: Discussion: Patch series that adds disable-tcg option for ppc
 targets
Thread-Index: AQHXKxDR+ekDhiDubk2ygw9GomFkgg==
Date: Tue, 6 Apr 2021 18:38:21 +0000
Message-ID: <CP2PR80MB4499C5000C0178C1594A5424C7769@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [201.82.34.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe3b0ea4-20a6-478b-456e-08d8f92b278c
x-ms-traffictypediagnostic: CP0PR80MB5027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB5027AD621AF0CBFAD4673B99C7769@CP0PR80MB5027.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bw4EHry204VToMR3sKIXYpfznzdId4WTDLjwJFq9GrCAW3LSs60ECNjohRgj1jDjnZzvYFlbQr5QQ3dfrHq/Cp5AFnJ60e249iRRcS53qIPmASaru71hJps2EMF3y+e21nAka3LdlmhuFU4T6Xgvv9IyNXbBd3XH2+pjyPu78qknwwAHhbnx2Imz7uMZbZNQqXdry1FGiXggz3yo5/vmFdMUbCF+eXqk19KMxlOzlqNYB9J0TgE6scxHqAwKzpzE2vINBayOOHuMHd+ppanviTf8NcYLfBIDw6Z9R3T11uw/+Qbj1n1qQtfEc3oAqwl9FQNVre7oHxY/PWi1PAuCvQEnqSt+bObnrW3SBdhaXDbZlOMps6CqqlUeJpuoH2AMNCYbANR0pMJz/yowfMh6e/P47U0xqtrn8uoo6JqMurtXIQlTojMvTF2LeLji4iWpiFexu0fnEVZmyWIK7lfHSuHw5Aij+zg1Ew4mc80SiZGJHPtKj57eitESbrLod7Zj5e6JdCD8h03dtp667EftTU1ue7KW0MY7GqCe8+Vy4ECU7IFdg3tq87bDfCg70LOYTn3bQG1vYN+Jq105G9h0pA85Vd6aTVAhauEtlsYmg6zPUMV7P1tiiMGEdkq54ybhV4Vrx1y1wOuuNLr96fuE9/Te08TBRZs5wAgA2GXVfFb9nCD+jXpV8xg7ELIhvjM5XC7VmYZzIYCa/TYyKR/xKo69g1MRExZ5ViLKICSpTymg8S4kQG1iyzr5QeBVL7y/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39830400003)(366004)(136003)(376002)(396003)(66556008)(21615005)(7696005)(66476007)(2906002)(33656002)(186003)(64756008)(66446008)(19627405001)(76116006)(91956017)(6916009)(478600001)(38100700001)(4326008)(55016002)(86362001)(66946007)(54906003)(6506007)(66574015)(107886003)(26005)(83380400001)(316002)(8936002)(5660300002)(166002)(8676002)(71200400001)(9686003)(52536014)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?BoOCYN6ZkVDNG/SMaaIwGIv6orCVI1vRA+7xwYL6KMQSDwVwhPO8Bn5aYc?=
 =?iso-8859-1?Q?69PKhW1dPlWoD3KjG8/XEjUfF32mHcB+yqzXC9F1D/q7gSfbIulgRly0cP?=
 =?iso-8859-1?Q?cqH4+1yGvHCKeEG3Cg6z8ErJHAHaEDvQckAkTK7G12V0TVuXnXvEDDsyqH?=
 =?iso-8859-1?Q?WWapRrAUCZI53KahoE5PsHCk5kZ4FUoyFbOkAxnBVAAL/6iTgjfkKEgsV/?=
 =?iso-8859-1?Q?xDnCW4ZClpYVkTZXsX1sWyDtoNuVQ7ACQkKwDSedDyAAdVkWvlrHye/wMe?=
 =?iso-8859-1?Q?i5Rzx15XjkARvXPEkTJZOV3DKb8CzxjhptH02wkG7I3cliIa6lbs0KZmYT?=
 =?iso-8859-1?Q?+XzUlaJC8wsvYw/F2gMvT+vSk0v2oQCK27yHc58bK3IbwzrvC/S19DNnRi?=
 =?iso-8859-1?Q?6fMgSPk/HWOcxXpjSrhszbl2oRHIwja9NZaN70ab12yMWOMMtFL1t23k8t?=
 =?iso-8859-1?Q?PmZ1HykbKQ3T/J8Wmar+JjTpAWMxPT+z2wMTpKi5fpwWSWffAWQEFLw5+9?=
 =?iso-8859-1?Q?y37z653o+EHgVVfay9/1TU691Zvx0gRcFQMmVRjlK0GEAmdb+h9ZQW86OY?=
 =?iso-8859-1?Q?mBA23KdsLPdyQTBUyfM/O//BuX5wfbmSIb2Jde6T5tqb76sONxubSfSTnJ?=
 =?iso-8859-1?Q?NIRlA4zbx/PHWN9MsbxyU2W/GXZmuPDNN1o6v4KJEdRVE8QnhExZzFcWit?=
 =?iso-8859-1?Q?KDIRjnRGLzqPXbWAK0qTPS6zLQoOoCIslmr+yAmq+gqHJIBYlDgcaQVj14?=
 =?iso-8859-1?Q?qvIAWCSpH7kp0OTriRvw8ZeI+xvfh0eYqEQedpKBQiO0rD/Y1KzqMuuer/?=
 =?iso-8859-1?Q?hPGz8SSTv7C+3btrTwJp0ycgyDxzUqtJmQDqWsBFqqR/wtuaA1jJoxioRA?=
 =?iso-8859-1?Q?2hn0Sl5jAh0/5FF/1bIZyYSacT1/lC4RVfIXcAoqeQST5hX3jGJ5JHp9HY?=
 =?iso-8859-1?Q?5ksQeTHR7U6smrWbiZkgWiVeCurrIpQQMJan0z+9W5NFY9+Wi5CsVuQ2vB?=
 =?iso-8859-1?Q?nuSxb+iXtM0j4KDxksdzrUS0ecLksaQIUm1EZaF4OvdZ1M2aRoFwYCTQgG?=
 =?iso-8859-1?Q?rSINaai5RX4t/IA/dX/VaOtpCAofLQ8RciwPQlP54N4c/PrrMTOyVojG6p?=
 =?iso-8859-1?Q?20WDoBxIPpq/BFw12jad/JOrXpg2/buWs1IEWbCZwcV1iKzhpc9PQX2RZX?=
 =?iso-8859-1?Q?lI+3Fv5dYF2W1wU7NCU+mwmh2vQpQHAfwRJF8VSySu6KZTp/XK87bCoNvY?=
 =?iso-8859-1?Q?Q9y2RzV7NtBVU2yLGyHIxlYc7OowxE+VleN92O5dqYigV1T0bC/R8JpGn4?=
 =?iso-8859-1?Q?N9S16E5Ayj8WunAOblBV3AX7Ftg/yT0m6QCqgzQMkbMGoKc=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499C5000C0178C1594A5424C7769CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3b0ea4-20a6-478b-456e-08d8f92b278c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 18:38:21.3300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YQ1vDRXTh0LTX58woIHhILweXQP5TGjXOylepGSXUL1nc8jWBGIJEFzL73iCOTKlbyKQUq8/RiNnD5z0SdDinwdQ5r22ToZw+wDc2rlgQM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB5027
Received-SPF: pass client-ip=40.107.80.133;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB4499C5000C0178C1594A5424C7769CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> t's usually best to focus on logical changes, rather than
> file-by-file.  That said, I'd probably suggest changing the .c files
> first, then changing the meson file.

OK, will do!

> I'd lean towards building a whole series, since I think the individual
> file changes won't make a lot of sense on their own.  That said, it's
> ok and encouraged to post a relatively early draft of the series as an
> RFC, so that the overall idea can be reviewed, even if it has obvious
> omissions (just mention them in the cover letter).

Good to know. I'm guessing that the RFC should at least compile, though, ri=
ght? That's mostly what is holding me from sharing what we have so far.

> I'd expect  mmu-*.c to be excluded.  Those are softmmu implementations
> which shouldn't be used with KVM.  It's possible there are a few
> helpers that will need to be extracted, though.

weirdly enough, removing the mmu-* don't give compilation errors, but linke=
r errors. There are a few helpers that we'll have to see how to deal with, =
but something that I found odd is that cpu_list and all it's related functi=
ons are defined in translate_init.c.inc, instead of cpu.c like most other t=
argets. I'm thinking about moving those to the cpu.c and follow the general=
 standard of the rest

> You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe
> some other parts of the spapr code: there are a number of hypercalls
> that we implement in qemu for TCG, but which are (and must be)
> implemented in KVM when KVM is in use.  So, I expect you'll need to
> suppress compilation of h_enter, h_remove, h_protect, h_read and
> h_bulk_remove at least in the !TCG case.

Yeah. there are 6 files dealing with spapr that are having linking problems=
, though some might be because of the cpu_list problem... But I'm a bit con=
fused on how to interface with KVM, do I use an ioctl explicitly, or can it=
 handle it implicitly? wenever I google or ask on IRC for KVM stuff the ans=
wer is usually "KVM handles it" so I never know if/when to call it

> Sounds fine so far.

Awesome! As the first contribution, I always feel like I'm missing somethin=
g, thanks for the help (:


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
Enviadas: Ter=E7a-feira, 06 de Abril de 2021 03:11
Para: Bruno Piazera Larsen
Cc: qemu-ppc@nongnu.org; qemu-devel@nongnu.org; Lucas Mateus Martins Araujo=
 e Castro; Luis Fernando Fujita Pires; Fernando Eckhardt Valle; Matheus Kow=
alczuk Ferst; Andre Fernando da Silva
Assunto: Re: Discussion: Patch series that adds disable-tcg option for ppc =
targets

On Mon, Apr 05, 2021 at 01:32:18PM +0000, Bruno Piazera Larsen wrote:
> Hi all,
>
> The team I'm working on started to work on adding support for
> building the ppc target with the disable-tcg option. However, we're
> not quite sure on where to start with such a big patch.
>
>     * Should we focus first on changing the .c files, so that it
>       will build when we finally patch the meson.build everything
>       build correctly? Or should we start by changing the meson
>       file, so that everyone agrees that the excluded files can
>       indeed be excluded?

It's usually best to focus on logical changes, rather than
file-by-file.  That said, I'd probably suggest changing the .c files
first, then changing the meson file.

>     * Should we first finish the whole series to then mail it, or
>       should we send one file at a time, as soon as we have them
>       ready?

I'd lean towards building a whole series, since I think the individual
file changes won't make a lot of sense on their own.  That said, it's
ok and encouraged to post a relatively early draft of the series as an
RFC, so that the overall idea can be reviewed, even if it has obvious
omissions (just mention them in the cover letter).

> So far we're thinking we'll need to:
>     * change 6 files (arch_dump.c, machine.c, mmu-hash32.c,
>       mmu-hash64.c, mmu-radix64.c and meson.build);

I'd expect  mmu-*.c to be excluded.  Those are softmmu implementations
which shouldn't be used with KVM.  It's possible there are a few
helpers that will need to be extracted, though.

You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe
some other parts of the spapr code: there are a number of hypercalls
that we implement in qemu for TCG, but which are (and must be)
implemented in KVM when KVM is in use.  So, I expect you'll need to
suppress compilation of h_enter, h_remove, h_protect, h_read and
h_bulk_remove at least in the !TCG case.

>     * exclude 8 files from the build (dfp_helper.c, excp_helper.c,
>       fpu_helper.c, int_helper.c, mem_helper.c, misc_helper.c, *
>       translate.c, timebase_helper.c);

That looks about right.

>     * create a new one that holds stubs.

Sounds reasonable.

> Does this sound about right? This is mostly guesswork based on how
> x86, s390x and ARM are doing it.

Sounds fine so far.

--
David Gibson                    | I'll have my music baroque, and my code
david AT gibson.dropbear.id.au  | minimalist, thank you.  NOT _the_ _other_
                                | _way_ _around_!
http://www.ozlabs.org/~dgibson

--_000_CP2PR80MB4499C5000C0178C1594A5424C7769CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; t's usually best to fo=
cus on logical changes, rather than<br>
&gt; file-by-file.&nbsp; That said, I'd probably suggest changing the .c fi=
les<br>
&gt; first, then changing the meson file.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">OK, will do! </span></font>=
<br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; I'd lean towards build=
ing a whole series, since I think the individual<br>
&gt; file changes won't make a lot of sense on their own.&nbsp; That said, =
it's<br>
&gt; ok and encouraged to post a relatively early draft of the series as an=
<br>
&gt; RFC, so that the overall idea can be reviewed, even if it has obvious<=
br>
&gt; omissions (just mention them in the cover letter).</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Good to know. I'm guessing that the RFC should at least compile, though, ri=
ght? That's mostly what is holding me from sharing what we have so far.<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; I'd expect&nbsp; mmu-*=
.c to be excluded.&nbsp; Those are softmmu implementations<br>
&gt; which shouldn't be used with KVM.&nbsp; It's possible there are a few<=
br>
&gt; helpers that will need to be extracted, though.</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
weirdly enough, removing the mmu-* don't give compilation errors, but linke=
r errors. There are a few helpers that we'll have to see how to deal with, =
but something that I found odd is that cpu_list and all it's related functi=
ons are defined in translate_init.c.inc,
 instead of cpu.c like most other targets. I'm thinking about moving those =
to the cpu.c and follow the general standard of the rest</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">&gt;
</span></font>You'll probably also need changes in hw/ppc/spapr_hcall.c and=
 maybe<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt; </span></font>some oth=
er parts of the spapr code: there are a number of hypercalls<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt; </span></font>that we =
implement in qemu for TCG, but which are (and must be)<br>
<font size=3D"2"><span style=3D"font-size:11pt">&gt; </span></font>implemen=
ted in KVM when KVM is in use.&nbsp; So, I expect you'll need to<br>
&gt; suppress compilation of h_enter, h_remove, h_protect, h_read and<br>
&gt; h_bulk_remove at least in the !TCG case.</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Yeah. there are 6 files dealing with spapr that are having linking problems=
, though some might be because of the cpu_list problem... But I'm a bit con=
fused on how to interface with KVM, do I use an ioctl explicitly, or can it=
 handle it implicitly? wenever I
 google or ask on IRC for KVM stuff the answer is usually &quot;KVM handles=
 it&quot; so I never know if/when to call it</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&gt; <font size=3D"2"><span style=3D"font-size:11pt">Sounds fine so far.</s=
pan></font><br>
<br>
Awesome! As the first contribution, I always feel like I'm missing somethin=
g, thanks for the help (:<br>
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
<b>Enviadas:</b> Ter=E7a-feira, 06 de Abril de 2021 03:11<br>
<b>Para:</b> Bruno Piazera Larsen<br>
<b>Cc:</b> qemu-ppc@nongnu.org; qemu-devel@nongnu.org; Lucas Mateus Martins=
 Araujo e Castro; Luis Fernando Fujita Pires; Fernando Eckhardt Valle; Math=
eus Kowalczuk Ferst; Andre Fernando da Silva<br>
<b>Assunto:</b> Re: Discussion: Patch series that adds disable-tcg option f=
or ppc targets
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Apr 05, 2021 at 01:32:18PM +0000, Bruno Pi=
azera Larsen wrote:<br>
&gt; Hi all,<br>
&gt; <br>
&gt; The team I'm working on started to work on adding support for<br>
&gt; building the ppc target with the disable-tcg option. However, we're<br=
>
&gt; not quite sure on where to start with such a big patch.<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Should we focus first on changing the .c fil=
es, so that it<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; will build when we finally patch t=
he meson.build everything<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; build correctly? Or should we star=
t by changing the meson<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file, so that everyone agrees that=
 the excluded files can<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; indeed be excluded?<br>
<br>
It's usually best to focus on logical changes, rather than<br>
file-by-file.&nbsp; That said, I'd probably suggest changing the .c files<b=
r>
first, then changing the meson file.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * Should we first finish the whole series to t=
hen mail it, or<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; should we send one file at a time,=
 as soon as we have them<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ready?<br>
<br>
I'd lean towards building a whole series, since I think the individual<br>
file changes won't make a lot of sense on their own.&nbsp; That said, it's<=
br>
ok and encouraged to post a relatively early draft of the series as an<br>
RFC, so that the overall idea can be reviewed, even if it has obvious<br>
omissions (just mention them in the cover letter).<br>
<br>
&gt; So far we're thinking we'll need to:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * change 6 files (arch_dump.c, machine.c, mmu-=
hash32.c,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmu-hash64.c, mmu-radix64.c and me=
son.build);<br>
<br>
I'd expect&nbsp; mmu-*.c to be excluded.&nbsp; Those are softmmu implementa=
tions<br>
which shouldn't be used with KVM.&nbsp; It's possible there are a few<br>
helpers that will need to be extracted, though.<br>
<br>
You'll probably also need changes in hw/ppc/spapr_hcall.c and maybe<br>
some other parts of the spapr code: there are a number of hypercalls<br>
that we implement in qemu for TCG, but which are (and must be)<br>
implemented in KVM when KVM is in use.&nbsp; So, I expect you'll need to<br=
>
suppress compilation of h_enter, h_remove, h_protect, h_read and<br>
h_bulk_remove at least in the !TCG case.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * exclude 8 files from the build (dfp_helper.c=
, excp_helper.c,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fpu_helper.c, int_helper.c, mem_he=
lper.c, misc_helper.c, *<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; translate.c, timebase_helper.c);<b=
r>
<br>
That looks about right.<br>
<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; * create a new one that holds stubs.<br>
<br>
Sounds reasonable.<br>
<br>
&gt; Does this sound about right? This is mostly guesswork based on how<br>
&gt; x86, s390x and ARM are doing it.<br>
<br>
Sounds fine so far.<br>
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

--_000_CP2PR80MB4499C5000C0178C1594A5424C7769CP2PR80MB4499lamp_--

