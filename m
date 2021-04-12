Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0619235C5EF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 14:11:20 +0200 (CEST)
Received: from localhost ([::1]:38604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVvPS-0000PT-01
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 08:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVvK5-00088o-Gc; Mon, 12 Apr 2021 08:05:45 -0400
Received: from mail-eopbgr790109.outbound.protection.outlook.com
 ([40.107.79.109]:34048 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lVvK0-0005es-FD; Mon, 12 Apr 2021 08:05:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnkZsSB7NPb9pVjmNHV50UJAnuLPuz9L1gDZL+9jGADCahqhBYuHclXsX+EAIhDYrtAbZ2N244AkCOMzVwIGNj1hGPQDVE5IVYfKLiG+lw4MUU1/oDTA8bJDVM7aIQeMdoVEqSR2q6ESrDwBkfjkzBPRpY/X6rr1z6rdWM3tgqpUyW4UK53zF/ISkWtfAS7PoOzzbgreSsVIYh/ciE79Yf9sOnbgzSpNn21oD1y76o3qNp8Dip0nWEDtJfGiAujHFQltFnqc22uqhvx0RUxqFADH4Kk8vf50SjaV1ek9atgXaH5itQISkXnDX2My6cVoINuPF2Sx3upVFQmymC/RHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5UL8MbkQYBirW7jsY/gslnbB2msGY8xOkQ/sZg86FI=;
 b=JU1J0+zykaCezkhA0FbUqzxpcM+KKSP8sBw6lkaTOZzg19XlOWhgp3HG2aPqE66HB5haNRQWiBuYEcbEWnrNOX6MKGViffIX6Y+dqBnIRoahT1JlG/ZaXvu2ywMNqPDN2gBAd7F28VQ2IAHT74zoubUtjg0tE6jq+0vGnKt9jGRpo/jT7hbB4iylH5Qho0eom/1ypoCbLfPFLrJhsMLvy/GKSOj7v6oSDCf6u6iFpZO0Kh6+ttBFj+JAYTIjTnVSsY7HdWbCFDo9hBT7rz0VD6N1bAWdz9OJtUH+qgfeCM2AxK/sViwdQ5Tuo1tpCMDW5ACKcW0WB5mUoGdOLjefTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o5UL8MbkQYBirW7jsY/gslnbB2msGY8xOkQ/sZg86FI=;
 b=PJ8TZ18bf+KMWKD5ZBihy+dZZeSTYU4lGDE8D0YAj3kgmHjyMxP1B0z8oTPxD8rx/cFlkZvzac2AL4Vq3z9ROTtvOWbNd0IlPljE1e+mAPdWw6g8eKNPN3DdIcr2VEKfbVco9sq8ABRUP4Fjv8Hrs2KRXIvXE9Zxp9xaeBQolwy35K7Q7Kw0DaZ3CUEXjD1ogrT1uzFJigpgCHIDNr6GwNAx301bW349bai9vTsl49aPTcs4l29HBsgJFzn1tvVzbyGhIa08DMOk8xTwLo2ppKPD3n2IjD9sCFHtMR/ugBZIL9w1U7oLQRp0lUlh1AUGNwtvgAZ4w3zg8Kc5io8T7w==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CPXPR80MB4981.lamprd80.prod.outlook.com (2603:10d6:103:6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Mon, 12 Apr
 2021 12:05:31 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 12:05:31 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXL5GD0gmMVLjcNEmxDdsct0vpHA==
Date: Mon, 12 Apr 2021 12:05:31 +0000
Message-ID: <CP2PR80MB44994CEF7BA3C917016749B0C7709@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [201.82.34.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a81327fb-4f28-4fcd-279d-08d8fdab4513
x-ms-traffictypediagnostic: CPXPR80MB4981:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB498118D944357DEC62F9C446C7709@CPXPR80MB4981.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: em+oiMXI4ARczy2pSSq2FtwGHLkCLZvvTNYr+YMNGBASGzGQi2XLNQsZzesZWp4u1jPFE68bYrP0l0+WhidmsXFMJIKzsM/gPhgQ87DLOHD7GYe/RQWh9YMhODQ+E6w5ZmPPiQG9P8c3T8PD0xd791efutgszxB41QghDMH2qxd7Uajk+7ZUIBUBJ40q4NjskXjPMzfwox0x6MxOzXODhkoh4H/KtoI3Dp3yw7+HoAUJ9PeEJlTv/l2q+aCFx+/Tq69BRFeKDrU7WeT3KD6kKTqRWM3nLAWOltK7Rb+QMsAQ0F1ab/DYrNuJUc3/PKd6dyPm4pUfweQMh7dlJbCvdtsJbsqwD7pZM5I4RTA9H4ZvrbTbICq7ivKkgwmjd8HxeXz75IzEmlu1feGLsRxXXu/s1XABRDiAL02F16s6EzCbpgXdrYc0BnIsuyuXcQmWSMbAwX1nyDePGHGH+2A52XV4KmKXcbr6CGAGjt5sQoernpTcR7MT5Pn2gj4j4qq0TFgRt045ePo7VoFAhGtgrF0+oP/7zISW8XDA1iEkluFZGh+UBS3HDkWKDj/v3eGxzvQXvcQgeh+Nfjv22hj7Ji9QGbQIZJettOeUsktQU/rhja+rQ2LDPFHM/iGwFCZlmh70HFufesWow049x9gEpSs7XY6+0EcOsSMBDyn5lpFUjDLGQWZxIKSCIYJy7J57
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(346002)(366004)(396003)(376002)(136003)(83380400001)(55016002)(52536014)(64756008)(9686003)(71200400001)(66556008)(6506007)(66476007)(66446008)(66946007)(5660300002)(38100700002)(166002)(76116006)(19627405001)(54906003)(2906002)(316002)(26005)(110136005)(107886003)(186003)(8936002)(21615005)(8676002)(4326008)(7696005)(86362001)(33656002)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?KzBw6RrJfDlfbRRKkxFq2XhSiPTEdGHBw2JzS3VuliA+CaIZN9g/WMuF77?=
 =?iso-8859-1?Q?cDvUywIkrA7GiEsGmkrbpOibiSHcx0xlcNyGHySsr5utUVu4rxwPLvyS0B?=
 =?iso-8859-1?Q?V/9Bq9OMmHljg/dLk5/eTeeR0SFkatbRJMEWXFbdv/ofAEWH/849NPmj2f?=
 =?iso-8859-1?Q?BzklWd8j+88Ifls9jLAka2Tz5fq2PhHR3kaCi1bWit3x40JpHd5jAqjgYA?=
 =?iso-8859-1?Q?3iSyz28PEX2ZNPH7tpxPIdQHhn184hHDFYDOo0UD+QaQ5zGOQ7DbY+g3W4?=
 =?iso-8859-1?Q?Tc58X/Ak+jWHTF6bQLF/4my6Rb/x7EnuiXXytpdUPr3Hd2vbwJ3uspj5/Y?=
 =?iso-8859-1?Q?yHvfvvVLYIBU4Yy/VSh+A37sih7vtdi4BEahz9zSyq3aNEAk2n/OneD6RF?=
 =?iso-8859-1?Q?9hktlINdhyF596jmbCpK+HlYSv55cWqNl37JTYtalVcg5AkxIx6xZU2bkZ?=
 =?iso-8859-1?Q?EPt85/Bq7kg+BOo+GbaDtT6oOIvWX9wmPNYPVmcDahh/PRvVqJsSFYT10I?=
 =?iso-8859-1?Q?kb2/n42Yy2YD0Zp0BjoEUb0J6lKUeG/zsH4vPFfG9xAZjT3/hk8f3zzx7M?=
 =?iso-8859-1?Q?IrA4sgb0f0r17ECTMavMNpgExyqzbNGexfwmCglarW+ZpbSH4bZ6gqHok4?=
 =?iso-8859-1?Q?JwAORnDmuOFAvjM0BPi8alUuqzhxFj5svwA8HQONVa0H4uzVtVlfguMO+W?=
 =?iso-8859-1?Q?OxTLO1XyMWy2Y1jsjdx6JGOEAm9Ri3Bcr2VmGSht1+lxfLdn/D6ZF94THn?=
 =?iso-8859-1?Q?ym7jESE/7ePryWhDmYr8wWf7V9tD/jPay8lwgNTv4lzTieaMMa/D63KepQ?=
 =?iso-8859-1?Q?9oO0T2j/nIaX2AETMAaROWQEz5ZANsOOtRfLTVfObaNweH7YYjls/S2hHx?=
 =?iso-8859-1?Q?IIDpu07ta5UA4HtnswIPkxY2mCvugou/FCAjGQh7nqXqVyHuTWQGsrkDjC?=
 =?iso-8859-1?Q?sitmvjt3f5EWe0c6zi4zgny4MiLmuJlJBfnULeZBe/1zGsCz3U6YWdSDwY?=
 =?iso-8859-1?Q?gEa6f5URXoWdljZeXBb9b6bp3jVnNFjCBUI0YK0W1B0Qx9ywsL/LEuSPsO?=
 =?iso-8859-1?Q?Qk4Ac1cVxV8p0OweE+1Jp3qT/XbtZgKlkQAgySz4pemlmGK0Xlkw0Yo0/V?=
 =?iso-8859-1?Q?TIpZx8141mB77dWoAZ2NsP9KKAV1VAyki6ZOKT5teE8YUnj4syFo+/7fK4?=
 =?iso-8859-1?Q?ov1RRIu4HzTn7P2r1j2MQwWqHMnUELz752WCVg/1GM/fThcMiXdQkYNdGt?=
 =?iso-8859-1?Q?dH/1v4b8DIrdH0rdGTC2wfBeyWBEDSgCF5n/14+AGwnGe9fRODZ1Eh9YV9?=
 =?iso-8859-1?Q?YtU0nxy6vYZy5AjE/nFGK2lnv5zHulNNfLm7u4pTBB+ME8E=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB44994CEF7BA3C917016749B0C7709CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81327fb-4f28-4fcd-279d-08d8fdab4513
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 12:05:31.0584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cIof4rswcdVDsdxaY0pbAjKNHRZ4BAqyaMojo/z6vtL+iK0PoMipaTGWRqbvVNTu9G8Sy+3GoXVOcLY3pJMzE8/ms+uZGRqdWcJUNgXUoX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB4981
Received-SPF: pass client-ip=40.107.79.109;
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
Cc: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Andre Fernando da Silva <andre.silva@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB44994CEF7BA3C917016749B0C7709CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> A general advice for this whole series is: make sure you add in some
> words explaining why you decided to make a particular change. It will be
> much easier to review if we know what were the logical steps leading to
> the change.

Fair point, I should've thought about that.

> > This commit does the necessary code motion from translate_init.c.inc
>
> For instance, I don't immediately see why these changes are necessary. I
> see that translate_init.c.inc already has some `#ifdef CONFIG_TCG`, so
> why do we need to move a bunch of code into cpu.c instead of just adding
> more code under ifdef CONFIG_TCG? (I'm not saying it's wrong, just trying=
 to
> understand the reasoning).

There are 3 main reasons for this decision. The first is kind of silly, but=
 when I read translate.c my mind jumped to translating machine code to TCG,=
 and the amount of TCGv variables at the start reinforced this notion.
The second was that both s390x and i386 removed it (translate.c) from compi=
lation, so I had no good reason to doubt it.
The last (and arguably most important) is that translate.c is many thousand=
s of lines long (translate_init.c.inc alone was almost 11k). The whole poin=
t of disabling TCG is to speed up compilation and reduce the final file siz=
e, so I think it makes sense to remove that big file.
And the final nail in the coffin is that at no point did it cross my mind t=
o keep the init part of translation, but remove the rest

Also, I'm not a fan of big ifdefs, because it's kinda hard to follow them w=
hen viewing code in vim. Adding that to already having a cpu.c file, where =
it makes sense (to me, at least) to add all CPU related functions, just sou=
nded like a good idea.

> Is translate_init.c.inc intended to be TCG only? But then I see you
> moved TCG-only functions out of it (ppc_fixup_cpu) and left not TCG-only
> functions (gen_spr_generic).

This is me misjudging what is TCG and what is not, mostly. I think that act=
ually moving everything to cpu.c and adding ifdefs, or creating a cpu_tcg.c=
.inc or similar, would be the most sensible code motion, but every function=
 I removed from translate gave me 3 new errors, at some point I felt like I=
 should leave something behind otherwise we're compiling everything from TC=
G again, just in different files, so I tried to guess what was TCG and what=
 was not (also, I really wanted the RFC out by the weekend, I _may_ have ru=
shed a few choices).

> > This moves all functions that start with gdb_* into target/ppc/gdbstub.=
c
> > and creates a new function that calls those and is called by ppc_cpu_re=
alize
>
> This looks like it makes sense regardless of disable-tcg, could we have
> it in a standalone patch?

Sure, I'll try and get it ready ASAP, and make sure I didn't miss one funct=
ion before sending. Just a noob question... do I edit the patch manually to=
 have it only contain the gdb code motion, or is there a way to move back t=
o before I actually made the commit without needing to re-do the changes?

Thomas, I'm adding you to this discussion since it sort of answers your mes=
sage on the other one, about the functions used even in a KVM-only build.

> IIRC you don't only have to exclude translate.c from the build, you also
> have to separate translate_init.c.inc from it, i.e. turn
> translate_init.c.inc into a proper .c file and get rid of the #include
> "translate_init.c.inc" statement in translate.c, since many functions in =
the
> translate_init.c.inc file are still needed for the KVM-only builds, too. =
So
> maybe that's a good place to start as a first mini series.

Now that I know that translate doesn't mean "translating to TCG", this idea=
 makes more sense. My question is, is it a better option than the code moti=
on I'm suggesting? From my quick check on the bits that I haven't touched i=
t might, but at this point it's clear I'm very lost with what makes sense h=
ahaha.


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

--_000_CP2PR80MB44994CEF7BA3C917016749B0C7709CP2PR80MB4499lamp_
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
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; A general advice for this whole series is: make sure you add in s=
ome</span><span><br>
</span></font></div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; words explaining why you decided to make a particular change. It =
will be</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; much easier to review if we kn=
ow what were the logical steps leading to</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; the change.</span></font></div=
>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">Fair point, =
I should've thought about that.
</span><br>
</div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; &gt; This commit does the necessary code motion from translate_in=
it.c.inc</span></font></div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">&gt; </span>=
<br>
</div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; For instance, I don't immediately see why these changes are neces=
sary. I</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; see that translate_init.c.inc =
already has some `#ifdef CONFIG_TCG`, so</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; why do we need to move a bunch=
 of code into cpu.c instead of just adding</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; more code under ifdef CONFIG_T=
CG? (I'm not saying it's wrong, just trying to</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; understand the reasoning).</sp=
an></font></div>
<div style=3D"font-size:11pt"><font size=3D"2"><span><br>
</span></font></div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">There are 3 main reasons for this decision. The first is kind of silly=
, but when I read translate.c my mind jumped to translating machine code to=
 TCG, and the amount of TCGv variables
 at the start reinforced this notion. </span><span><br>
</span></font></div>
<div style=3D"font-size:11pt"><font size=3D"2"><span></span></font><span st=
yle=3D"font-size: 11pt;">The second was that both s390x and i386 removed it=
 (translate.c) from compilation, so I had no good reason to doubt it.</span=
></div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">The last (an=
d arguably most important) is that translate.c is many thousands of lines l=
ong (translate_init.c.inc alone was almost 11k). The whole point of disabli=
ng TCG is to speed up compilation and
 reduce the final file size, so I think it makes sense to remove that big f=
ile.</span></div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">And the fina=
l nail in the coffin is that at no point did it cross my mind to keep the i=
nit part of translation, but remove the rest<br>
</span></div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">Also, I'm no=
t a fan of big ifdefs, because it's kinda hard to follow them when viewing =
code in vim. Adding that to already having a cpu.c file, where it makes sen=
se (to me, at least) to add all CPU
 related functions, just sounded like a good idea.</span></div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; Is translate_init.c.inc intended to be TCG only? But then I see y=
ou</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; moved TCG-only functions out o=
f it (ppc_fixup_cpu) and left not TCG-only</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; functions (gen_spr_generic).</=
span></font></div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">This is me m=
isjudging what is TCG and what is not, mostly. I think that actually moving=
 everything to cpu.c and adding ifdefs, or creating a cpu_tcg.c.inc or simi=
lar, would be the most sensible code
 motion, but every function I removed from translate gave me 3 new errors, =
at some point I felt like I should leave something behind otherwise we're c=
ompiling everything from TCG again, just in different files, so I tried to =
guess what was TCG and what was
 not (also, I really wanted the RFC out by the weekend, I _may_ have rushed=
 a few choices).</span></div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><font size=3D"2"><span style=3D"font-size: 11=
pt;">&gt; &gt; This moves all functions that start with gdb_* into target/p=
pc/gdbstub.c</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; &gt; and creates a new functio=
n that calls those and is called by ppc_cpu_realize</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; </span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; This looks like it makes sense=
 regardless of disable-tcg, could we have</span><span><br>
</span><span style=3D"font-size: 11pt;">&gt; it in a standalone patch?</spa=
n></font><br>
</div>
<div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">Sure, I'll t=
ry and get it ready ASAP, and make sure I didn't miss one function before s=
ending. Just a noob question... do I edit the patch manually to have it onl=
y contain the gdb code motion, or is
 there a way to move back to before I actually made the commit without need=
ing to re-do the changes?</span></div>
<div style=3D"font-size:11pt"><br>
</div>
<div style=3D"font-size:11pt"><span style=3D"font-size: 11pt;">Thomas, I'm =
adding you to this discussion since it sort of answers your message on the =
other one, about the functions used even in a KVM-only build.</span><br>
</div>
<span style=3D"font-size:11pt"></span></div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; IIRC you don't only ha=
ve to exclude translate.c from the build, you also
</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size:11pt">&gt; have to separate translate_init.=
c.inc from it, i.e. turn
</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size:11pt">&gt; translate_init.c.inc into a prop=
er .c file and get rid of the #include
</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size:11pt">&gt; &quot;translate_init.c.inc&quot;=
 statement in translate.c, since many functions in the
</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size:11pt">&gt; translate_init.c.inc file are st=
ill needed for the KVM-only builds, too. So
</span><span style=3D"font-size:11pt"><br>
</span><span style=3D"font-size:11pt">&gt; maybe that's a good place to sta=
rt as a first mini series.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Now that I know that translate doesn't mean &quot;translating to TCG&quot;,=
 this idea makes more sense. My question is, is it a better option than the=
 code motion I'm suggesting? From my quick check on the bits that I haven't=
 touched it might, but at this point it's
 clear I'm very lost with what makes sense hahaha.<br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<span style=3D"font-size: 11pt;"></span>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Bruno Piazer=
a Larsen</span><span style=3D"font-size:11pt; font-family:&quot;Calibri&quo=
t;,sans-serif,serif,EmojiFont"><span style=3D"color:#1F497D"></span></span>=
</p>
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
n style=3D"color: windowtext; font-size: 11pt;">Instituto
 de Pesquisas ELDORADO</span></a></span></p>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Departamento=
 Computa=E7=E3o Embarcada</span><span style=3D"font-size:11pt; font-family:=
&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><br>
</span></p>
<span style=3D"font-size: 11pt;"></span>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont">Analista de =
Software Trainee</span><span style=3D"font-size:11pt; font-family:&quot;Cal=
ibri&quot;,sans-serif,serif,EmojiFont"><br>
</span></p>
<span style=3D"font-size: 11pt;"></span>
<p style=3D"margin:0cm; margin-bottom:.0001pt"><span style=3D"font-size:11p=
t; font-family:&quot;Calibri&quot;,sans-serif,serif,EmojiFont"><a href=3D"h=
ttps://www.eldorado.org.br/disclaimer.html" target=3D"_blank" rel=3D"noopen=
er noreferrer"><span style=3D"color: windowtext; font-size: 11pt;">Aviso
 Legal - Disclaimer</span></a></span></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_CP2PR80MB44994CEF7BA3C917016749B0C7709CP2PR80MB4499lamp_--

