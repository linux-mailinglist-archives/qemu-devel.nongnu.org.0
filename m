Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4356E35E551
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 19:48:40 +0200 (CEST)
Received: from localhost ([::1]:40136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWN9S-0004k5-Sz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 13:48:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWN4F-00040U-Bm; Tue, 13 Apr 2021 13:43:15 -0400
Received: from mail-eopbgr760131.outbound.protection.outlook.com
 ([40.107.76.131]:62886 helo=NAM02-CY1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWN4B-000864-5z; Tue, 13 Apr 2021 13:43:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWXazlSLYoPLeNhH/VuUF5NWJVBL8nNBgAzWkhLfbj+3lD+5ebWLmFHcRV1y74h2xWsr6P7/aJhnemJIUyVsdB4bdsQPjWLs35frYsY9iNK4eZwki2FxCRUEZ2f1cU6QHcodTrD9HWCxRJ+aubeEdnnU8Ma4zHJqk5GE5VZRNU7N9ki0HXD0nEBS/36f8X87UAUsF1Y1XXE2Tmw752fEcGYvj7Vj++aDyNif3Tqao80g8vyceM4HifDA49MkUKwy3itViYTNWUd+vh37NSVvSdEHXT99MwWK+vMFrHjK59c67lNi/sHrhLtDL2b+c559WsaEfte0uFsaoBB5BsBudg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y18EDkx5wgIPZPwIq2uZgmK+inLDs0nkdUkvj2IehMc=;
 b=Sd3vlavn76CPEeF+wdvRVdzWiwTC60HqIv0JSIXu37Kf5Oj8zDsf04DWvVWVW0ZbWsaF3u+knQ9Aa37JGsIicIm71zNzSPPn4rk52xpeiRRKq7c6HuZMt4nafLtjdthUGZcW6Kf4WZCkTrzdoTbe+0BXNA6VvUCWSI2X6nwLEzhiHQlQrdvPxvnx2cl4i73VaGySvbS/XZPsJCH/98NJAsjrDZOsenOJD53UqVdyAnBdMO1iAl1A3njYG7Lw8mvollz40XL3htwyQgyPMMezSLcD2vGIW8jIlmnYBbGPG08aNSK9jsABvS9TRgm3gs9KoBBElNNcYGiAArTu5ptcnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y18EDkx5wgIPZPwIq2uZgmK+inLDs0nkdUkvj2IehMc=;
 b=diMiOcujJJMLJmOX1ekuyLzxbl5dH31Drya5bw+g/TaW3YmMnhonjhM7nmAf04sOxLLNH1cxc32poEIobofKPvSu1ugevhfxB2ACyui5p0Uc9br33buenCwOA+hwJWiK8A3ietZm2N88eWi625s67rfbnQ4e9OH6v8pnNT55cyaCAHhb6k2Tpn+hW9BKXnErlyw+gCjqiR/pZFgBhwSMWG7DH+xXUDq62BDylUfsfwhyXllmos7Ro1YSbLBpPgoM2heNwNmXUXQWvZ4QNoNwUZdj9GFCQjFpL7XHyTwAoREctq4lDU67neMVT623TtGeSBt0oO3pQ9rrHsZQqRR83w==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CP0PR80MB4979.lamprd80.prod.outlook.com (2603:10d6:103:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Tue, 13 Apr
 2021 17:43:02 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 17:43:02 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXMIej4hDOonaOpEaWSp4QxcAALw==
Date: Tue, 13 Apr 2021 17:43:02 +0000
Message-ID: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:f76e:bbb3:9eaa:b6e3]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad64de09-d163-452b-e463-08d8fea395f2
x-ms-traffictypediagnostic: CP0PR80MB4979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB4979B55BBD28994BBE57ACE6C74F9@CP0PR80MB4979.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DNzI0SAvp6Dt+RBqtLmZbiwwFYxvQIlCWCXEOVP3dFDiUsGM/qIdv+cJIz7FAsyNNJYZ62Eu/hR7fzyGTpOeOeyHAQZxsuPPoUIVUJBSLCtlfs7a6IwkfSqeK4jQWUlwUt3a063M39WrR+TBht7iG/0Ny1kRxaqRMxdPQnF9bL4jQocB9pOz2sfDa884De9IwxvqOIxU+Kpq35DH2pnlujMbHU867JxDfLtUw5skE24grRsc8ANeXa/2K/NndKgc1VIEPCdUfGW080wMk41sHlMyXRqciMa2SkhIjoDS/cWrSAfjMb6nMKMaypVn2EpGyvAOi/DSMuQJb6fLNIizSIHlLSrExaxsxBmiBaTnDzH7RpAWWbU9v0ZMKKIQwBbKHCI+3sXRKd/sNbOdgMy57ccjhtd43ewoiIXD6VXmU2cG/jqZGrmTPyY9JSOceUgaO6y1aRJ1XMI0wMFGyv40vCxwldSmY7vwulNlghviNSPclkJammCU5zGF7A+46Lzt6xgS6XUQDPbDcjVzWr5Dd8TJ76+5PW4KKV94JdEQBlOknOViEazA2+ifO2pd9uUbPfvve2Jj5ayeO09U+Oy5KvSjhYxQZy0ZT0aCZwwCp0Z1f8xBVC5slTDxjYONjrn4ofeyd3nieRv3GWcJKcfr3+LQ9edU0TGadhSsofsJhYo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33656002)(166002)(8936002)(66946007)(66556008)(19627405001)(64756008)(107886003)(52536014)(54906003)(66476007)(122000001)(66446008)(6916009)(83380400001)(8676002)(38100700002)(5660300002)(7696005)(2906002)(21615005)(6506007)(66574015)(4326008)(498600001)(9686003)(186003)(71200400001)(86362001)(76116006)(55016002)(966005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?oenfIo507cq4ZIWs14vJGfhK1j0B5C4C4n44bCT5/E4EC8T3CSqMhO1Ong?=
 =?iso-8859-1?Q?fyXAksrfsoAioFr56a8p74dOlXqQRwbvjt5JIOk28nZGK970xuurJHxqH0?=
 =?iso-8859-1?Q?m369mK2XqlnMOL+D9edujO3VoBM6JH8rr1CVkL7Hxz1w0/Np3Q/pL9VmBU?=
 =?iso-8859-1?Q?Yzikv4RAwvZfGpdgDd/QdgXUJJ6ufw3dJIxXZc2H96O59Ncw4EYDWpRh3w?=
 =?iso-8859-1?Q?i/6Tyv9LpfU5p+JonjT4vhMJ/fJJs7MZGya1zvqOpmbQrA9tUagsW9C0Fh?=
 =?iso-8859-1?Q?pUg3t7wJeQRiIsqE+anUe6uqL2rge8g2BujPGHqEwNW7MilAdXkCk4zLj0?=
 =?iso-8859-1?Q?nW1pjMbHGTcpkRqY4AjvjdOj9obN2kQsFgi2WbxoTViIdpKAYXi+UnAo7p?=
 =?iso-8859-1?Q?r/OeOViM8n6MZvbO743SK0hcPYCn7DJM66BcTjGCTfAYPTu+7STTtmAF8W?=
 =?iso-8859-1?Q?iLsQptHvWJ0W9xEIZCSZtU/wlRp1+5UrRbl+D8N84cHzXSYv7Hj4SEkvbB?=
 =?iso-8859-1?Q?xT32PjHfBlhb/l4IBxSP17sifhJIDgPAcFP9TO/OIN5dScCIgZynAImU/+?=
 =?iso-8859-1?Q?kl/ScoRNJcE2TCxDOnf9PNWBHZKE688LHareFYuh7/XwMyytotqtDYAtnw?=
 =?iso-8859-1?Q?LO44LU156VEmlz0RHZ5U6w+3Z6MgexrDnEvg58jOWlf+1tjO4Vsn0Bjg1L?=
 =?iso-8859-1?Q?IVNw/UZgfOD+8m2tb3yR8e/tXIgQIqw6mVZV2c4ur4ywAIB8JTXNANyeui?=
 =?iso-8859-1?Q?5rJPPuefJoWVo8ZN3cRsheTOy8KqetaybpKLQV5XRVWT6t/8vbNOKoC2Ne?=
 =?iso-8859-1?Q?dDvsgkOzo7rRcR0ShdaadlfTaRCsTXLFZxIGPh71Vyp2WL9jJ53Jt0YbeP?=
 =?iso-8859-1?Q?7qkahYugCetVtCz/E5s/+dbbPiJTMxF2LvjJgwnRsq/wamJSdVYiyWeNLX?=
 =?iso-8859-1?Q?JuzU4Av24bJSLr7JHS8w7Qul2SbAdmwftTUJ6St1O1INT7iJ0MJsy6CKvN?=
 =?iso-8859-1?Q?Cktc50W9n0xwcZg2DnRnjvJd+lUkKqQKxWvIrFh8pZAaJERqvRb+ofpomW?=
 =?iso-8859-1?Q?m0E2ZTQQk1Wg4YvGSqxBFRMuDqUMm1gnQKAzbvXBXrhAq4SADfUCQ+o1jj?=
 =?iso-8859-1?Q?A5peuuzjrTYDkNWES6bH0K4B9+9NJDfZaZFEW6OoDklB+MzgJvGms8cIQF?=
 =?iso-8859-1?Q?TvmSy4/gbzNdTZco4an73/VmbO0OkqWVAcYV5fnLbPv1xY6DKURaPZj5Wi?=
 =?iso-8859-1?Q?VHTmGm9FdaE3+U/b9ZVodT4f+/NXw9vtNvseXNNUMtAnZs9aWjD7pP/emv?=
 =?iso-8859-1?Q?McvMRrgqVYsWPdHq/xiAVQwd+8AKUx8RX8GawsoFagg10ub/ZZZ3d74R4q?=
 =?iso-8859-1?Q?B8lX345JBDbiSrszOTBdlbvfmgaLrsFZ74/mGWMRKH9VF5Xvh3XhA=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB449996D26DEA4C27397EEF14C74F9CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad64de09-d163-452b-e463-08d8fea395f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 17:43:02.0643 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CaBA89Py+nwS0GiKfRu6obXMIq45zDb5NvspaYU6JCc0+Z9s3Dgu89d4KA38d2ALj12Ejb2kZj9htI1VXqMh1Yi+k2ZhaOnuY9+x9+rMQB4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4979
Received-SPF: pass client-ip=40.107.76.131;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM02-CY1-obe.outbound.protection.outlook.com
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
Cc: Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@linux.ibm.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB449996D26DEA4C27397EEF14C74F9CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> I'm actually not sure if we'll want translate_init.c for !tcg builds.
> It's *primarily* for TCG, but we still need at least some of the cpu
> state structure for KVM, and some of that is initialized in
> translate_init.
>
> I think it will probably make more sense to leave it in for a first
> cut.  Later refinement might end up removing it.
>
> The whole #include translate_init.c.inc thing might make for some
> awkward fiddling in this, of course.

I just checked, there is going to be some shuffling of functions
around, as there are some static variables defined on translate.c,
and used in translate_init.c.inc, some functions needed for KVM
on translate.c and some TCG only functions in the
translate_init.c.inc.

The trivial path is to:
* rename translate_init.c.inc to cpu_init.c (since it has to do with
initial definitions for CPUs, and it's not related to translating
anymore);
* move gen_write_xer and gen_read_xer into cpu_init.c, as they're
used for some sprs, and whatever needs to be moved with it
* move is_indirect_opcode and ind_table to translate.c, since they
are used to translate ppc instructions, and the things defined for
these functions
* Figure out what needs to be added to the includes for both
files to compile
* move opcodes and invalid_handler into cpu_init.c, because they
are only used by stuff in this file.

I'm just not sure about this last point. The stuff that use opcodes
create the callback tables for TCG, AFAICT. The better plan would
be to move all of that to tanslate.c, but might be a lot.

Can I follow the trivial plan for the first cut and leave a TODO in
the code for a better solution in the future? Or is there a nuance
about one of those functions that I have not understood?


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
Enviadas: Ter=E7a-feira, 13 de Abril de 2021 03:40
Para: Bruno Piazera Larsen
Cc: Fabiano Rosas; Thomas Huth; qemu-devel@nongnu.org; Luis Fernando Fujita=
 Pires; Andre Fernando da Silva; Lucas Mateus Martins Araujo e Castro; Fern=
ando Eckhardt Valle; qemu-ppc@nongnu.org; lagarcia@br.ibm.com; Matheus Kowa=
lczuk Ferst
Assunto: Re: [PATCH 1/4] target/ppc: Code motion required to build disablin=
g tcg

On Mon, Apr 12, 2021 at 12:05:31PM +0000, Bruno Piazera Larsen wrote:
> > A general advice for this whole series is: make sure you add in some
> > words explaining why you decided to make a particular change. It will b=
e
> > much easier to review if we know what were the logical steps leading to
> > the change.
>
> Fair point, I should've thought about that.
>
> > > This commit does the necessary code motion from translate_init.c.inc
> >
> > For instance, I don't immediately see why these changes are necessary. =
I
> > see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
> > why do we need to move a bunch of code into cpu.c instead of just addin=
g
> > more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just tryi=
ng to
> > understand the reasoning).
>
> There are 3 main reasons for this decision. The first is kind of silly, b=
ut when I read translate.c my mind jumped to translating machine code to TC=
G, and the amount of TCGv variables at the start reinforced this notion.
> The second was that both s390x and i386 removed it (translate.c) from com=
pilation, so I had no good reason to doubt it.
> The last (and arguably most important) is that translate.c is many thousa=
nds of lines long (translate_init.c.inc alone was almost 11k). The whole po=
int of disabling TCG is to speed up compilation and reduce the final file s=
ize, so I think it makes sense to remove that big file.
> And the final nail in the coffin is that at no point did it cross my mind=
 to keep the init part of translation, but remove the rest
>
> Also, I'm not a fan of big ifdefs, because it's kinda hard to follow them=
 when viewing code in vim. Adding that to already having a cpu.c file, wher=
e it makes sense (to me, at least) to add all CPU related functions, just s=
ounded like a good idea.

I think those are all sound reasons; I think not compiling translate.c
for !tcg builds is the right choice.  We might, however, need to
"rescue" certain functions from there by moving them to another file
so they can be used by KVM code as well.

> > Is translate_init.c.inc intended to be TCG only? But then I see you
> > moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-onl=
y
> > functions (gen_spr_generic).
>
> This is me misjudging what is TCG and what is not, mostly. I think that a=
ctually moving everything to cpu.c and adding ifdefs, or creating a cpu_tcg=
.c.inc or similar, would be the most sensible code motion, but every functi=
on I removed from translate gave me 3 new errors, at some point I felt like=
 I should leave something behind otherwise we're compiling everything from =
TCG again, just in different files, so I tried to guess what was TCG and wh=
at was not (also, I really wanted the RFC out by the weekend, I _may_ have =
rushed a few choices).


> > > This moves all functions that start with gdb_* into target/ppc/gdbstu=
b.c
> > > and creates a new function that calls those and is called by ppc_cpu_=
realize
> >
> > This looks like it makes sense regardless of disable-tcg, could we have
> > it in a standalone patch?
>
> Sure, I'll try and get it ready ASAP, and make sure I didn't miss one fun=
ction before sending. Just a noob question... do I edit the patch manually =
to have it only contain the gdb code motion, or is there a way to move back=
 to before I actually made the commit without needing to re-do the changes?
>
> Thomas, I'm adding you to this discussion since it sort of answers your m=
essage on the other one, about the functions used even in a KVM-only build.
>
> > IIRC you don't only have to exclude translate.c from the build, you als=
o
> > have to separate translate_init.c.inc from it, i.e. turn
> > translate_init.c.inc into a proper .c file and get rid of the #include
> > "translate_init.c.inc" statement in translate.c, since many functions i=
n the
> > translate_init.c.inc file are still needed for the KVM-only builds, too=
. So
> > maybe that's a good place to start as a first mini series.
>
> Now that I know that translate doesn't mean "translating to TCG", this id=
ea makes more sense. My question is, is it a better option than the code mo=
tion I'm suggesting? From my quick check on the bits that I haven't touched=
 it might, but at this point it's clear I'm very lost with what makes sense=
 hahaha.
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

--_000_CP2PR80MB449996D26DEA4C27397EEF14C74F9CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; I'm actually not sure =
if we'll want translate_init.c for !tcg builds.<br>
&gt; It's *primarily* for TCG, but we still need at least some of the cpu<b=
r>
&gt; state structure for KVM, and some of that is initialized in<br>
&gt; translate_init.<br>
&gt; <br>
&gt; I think it will probably make more sense to leave it in for a first<br=
>
&gt; cut.&nbsp; Later refinement might end up removing it.<br>
&gt; <br>
&gt; The whole #include translate_init.c.inc thing might make for some<br>
&gt; awkward fiddling in this, of course.</span></font><br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I just checked, there is going to be some shuffling of functions</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
around, as there are some static variables defined on translate.c,</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
and used in translate_init.c.inc, some functions needed for KVM</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
on translate.c and some TCG only functions in the <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
translate_init.c.inc.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
The trivial path is to:</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
* rename translate_init.c.inc to cpu_init.c (since it has to do with</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
initial definitions for CPUs, and it's not related to translating <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
anymore);<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
* move gen_write_xer and gen_read_xer into cpu_init.c, as they're <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
used for some sprs, and whatever needs to be moved with it</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
* move is_indirect_opcode and ind_table to translate.c, since they</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
are used to translate ppc instructions, and the things defined for <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
these functions</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
* Figure out what needs to be added to the includes for both</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
files to compile<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
* move opcodes and invalid_handler into cpu_init.c, because they</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
are only used by stuff in this file.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I'm just not sure about this last point. The stuff that use opcodes</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
create the callback tables for TCG, AFAICT. The better plan would</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
be to move all of that to tanslate.c, but might be a lot. <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Can I follow the trivial plan for the first cut and leave a TODO in</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
the code for a better solution in the future? Or is there a nuance</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
about one of those functions that I have not understood?</div>
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
<b>Enviadas:</b> Ter=E7a-feira, 13 de Abril de 2021 03:40<br>
<b>Para:</b> Bruno Piazera Larsen<br>
<b>Cc:</b> Fabiano Rosas; Thomas Huth; qemu-devel@nongnu.org; Luis Fernando=
 Fujita Pires; Andre Fernando da Silva; Lucas Mateus Martins Araujo e Castr=
o; Fernando Eckhardt Valle; qemu-ppc@nongnu.org; lagarcia@br.ibm.com; Mathe=
us Kowalczuk Ferst<br>
<b>Assunto:</b> Re: [PATCH 1/4] target/ppc: Code motion required to build d=
isabling tcg
<div><br>
</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Apr 12, 2021 at 12:05:31PM +0000, Bruno Pi=
azera Larsen wrote:<br>
&gt; &gt; A general advice for this whole series is: make sure you add in s=
ome<br>
&gt; &gt; words explaining why you decided to make a particular change. It =
will be<br>
&gt; &gt; much easier to review if we know what were the logical steps lead=
ing to<br>
&gt; &gt; the change.<br>
&gt; <br>
&gt; Fair point, I should've thought about that.<br>
&gt; <br>
&gt; &gt; &gt; This commit does the necessary code motion from translate_in=
it.c.inc<br>
&gt; &gt;<br>
&gt; &gt; For instance, I don't immediately see why these changes are neces=
sary. I<br>
&gt; &gt; see that translate_init.c.inc already has some `#ifdef CONFIG_TCG=
`, so<br>
&gt; &gt; why do we need to move a bunch of code into cpu.c instead of just=
 adding<br>
&gt; &gt; more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, jus=
t trying to<br>
&gt; &gt; understand the reasoning).<br>
&gt; <br>
&gt; There are 3 main reasons for this decision. The first is kind of silly=
, but when I read translate.c my mind jumped to translating machine code to=
 TCG, and the amount of TCGv variables at the start reinforced this notion.=
<br>
&gt; The second was that both s390x and i386 removed it (translate.c) from =
compilation, so I had no good reason to doubt it.<br>
&gt; The last (and arguably most important) is that translate.c is many tho=
usands of lines long (translate_init.c.inc alone was almost 11k). The whole=
 point of disabling TCG is to speed up compilation and reduce the final fil=
e size, so I think it makes sense to
 remove that big file.<br>
&gt; And the final nail in the coffin is that at no point did it cross my m=
ind to keep the init part of translation, but remove the rest<br>
&gt; <br>
&gt; Also, I'm not a fan of big ifdefs, because it's kinda hard to follow t=
hem when viewing code in vim. Adding that to already having a cpu.c file, w=
here it makes sense (to me, at least) to add all CPU related functions, jus=
t sounded like a good idea.<br>
<br>
I think those are all sound reasons; I think not compiling translate.c<br>
for !tcg builds is the right choice.&nbsp; We might, however, need to<br>
&quot;rescue&quot; certain functions from there by moving them to another f=
ile<br>
so they can be used by KVM code as well.<br>
<br>
&gt; &gt; Is translate_init.c.inc intended to be TCG only? But then I see y=
ou<br>
&gt; &gt; moved TCG-only functions out of it (ppc_fixup_cpu) and left not T=
CG-only<br>
&gt; &gt; functions (gen_spr_generic).<br>
&gt; <br>
&gt; This is me misjudging what is TCG and what is not, mostly. I think tha=
t actually moving everything to cpu.c and adding ifdefs, or creating a cpu_=
tcg.c.inc or similar, would be the most sensible code motion, but every fun=
ction I removed from translate gave
 me 3 new errors, at some point I felt like I should leave something behind=
 otherwise we're compiling everything from TCG again, just in different fil=
es, so I tried to guess what was TCG and what was not (also, I really wante=
d the RFC out by the weekend, I
 _may_ have rushed a few choices).<br>
<br>
<br>
&gt; &gt; &gt; This moves all functions that start with gdb_* into target/p=
pc/gdbstub.c<br>
&gt; &gt; &gt; and creates a new function that calls those and is called by=
 ppc_cpu_realize<br>
&gt; &gt;<br>
&gt; &gt; This looks like it makes sense regardless of disable-tcg, could w=
e have<br>
&gt; &gt; it in a standalone patch?<br>
&gt; <br>
&gt; Sure, I'll try and get it ready ASAP, and make sure I didn't miss one =
function before sending. Just a noob question... do I edit the patch manual=
ly to have it only contain the gdb code motion, or is there a way to move b=
ack to before I actually made the commit
 without needing to re-do the changes?<br>
&gt; <br>
&gt; Thomas, I'm adding you to this discussion since it sort of answers you=
r message on the other one, about the functions used even in a KVM-only bui=
ld.<br>
&gt; <br>
&gt; &gt; IIRC you don't only have to exclude translate.c from the build, y=
ou also<br>
&gt; &gt; have to separate translate_init.c.inc from it, i.e. turn<br>
&gt; &gt; translate_init.c.inc into a proper .c file and get rid of the #in=
clude<br>
&gt; &gt; &quot;translate_init.c.inc&quot; statement in translate.c, since =
many functions in the<br>
&gt; &gt; translate_init.c.inc file are still needed for the KVM-only build=
s, too. So<br>
&gt; &gt; maybe that's a good place to start as a first mini series.<br>
&gt; <br>
&gt; Now that I know that translate doesn't mean &quot;translating to TCG&q=
uot;, this idea makes more sense. My question is, is it a better option tha=
n the code motion I'm suggesting? From my quick check on the bits that I ha=
ven't touched it might, but at this point it's
 clear I'm very lost with what makes sense hahaha.<br>
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

--_000_CP2PR80MB449996D26DEA4C27397EEF14C74F9CP2PR80MB4499lamp_--

