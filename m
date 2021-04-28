Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E2136D9DA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:51:31 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblXG-0000oe-35
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lblTe-0008Hx-9g; Wed, 28 Apr 2021 10:47:46 -0400
Received: from mail-eopbgr800090.outbound.protection.outlook.com
 ([40.107.80.90]:35568 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lblTZ-0004t4-Qy; Wed, 28 Apr 2021 10:47:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GklfNFbIhcC504qq7j/lRpGVXf34cBPhKMhZSxFYOuhO1bk6T7LbgwT7nB6pLOpu8nfANMrqjQJPYbhiCcxfExY8SgbhV1MVuTk+EAn0z8QFLx89lp1QlvFsC8c9ZyjaH1/aAZy3dKf1qzU7vFjGsmbd2ukJSs4993Dren/CFUrkQII0Alv8Fk1hmfB+dDiMloLU2JeGlj3tmPwyIpE5B7OpenhTDVRh++6cbVMxwRYfSy3TR3p6Ag9lFZxAPur2AxRYY1qD0wonChCfA5OPEWo8QWs4fJzYsggmd1W+o6cXY3lYc6mZMkQWNLA7H3RXJ5JvLXDa8T+H8syWlii1Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3pvHq5BieCyJV4wResoKbiSNlcuySXFEqZrBLeeI8Q=;
 b=WkAmbXS6DAVhotAGo1c1WGEORbOkZkzuR7ujls8oqzHDzc8MvsLVY1RBl0VHblelqSau0DVM97asjKIIhENEBx5/KtI1HGxD7sVpZWM7dxCW5NLwPcgW6f+XFocmtEtETvJQ2SX7B5Z1JIi99Xg5pE4Lfgmf6Jdxk0Bnd0mhhMQZc48HSjdsPtg+2yrjKZOOlBSS5bRkQgSIjHTSp4Xt94Dttd4KsNgPdBg+wxEuQZpMkNle6Yc4+hUVWCjb2Q7d56qQs5H2poUq7snHcS5CXGHlGwSJbnRE+ZV9XZtyi9NvcuDUlh4hedeTYeEe/GFWk48UPwQWRhvJ2WqKIKIn5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L3pvHq5BieCyJV4wResoKbiSNlcuySXFEqZrBLeeI8Q=;
 b=p3AAHHCtmXsmNtTPCkBY/vuXFnWMBQqE/izcPkMnPA7SVruBmfnU2sbndKb93xSTiTTrgBBUAkv0kb/74Qr2lzWw/dzKIN2fixdeAKUFpCl31UbpqLQgwPbV3ZTBOVRHxi7VTGZ4phaJGNzUHxDH1njnraNxPfVpvWLm/zzvKuHy9Dy3VlHOc3LlAaFLr34/gOOQns4uNDa6BtMEKGzQYOA/MjQwNgGWr1LPk42j5xF8T0GlqllgkmgH2ERwrXRO2w0+g/OXXj0FS1lQ2m4Efw1wXsTtXlITb9jV3nOpnUv4eAft1S/FqHzhvB4aLm38d6vW4YxpEYNtuTPs7oEWog==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CPXPR80MB5079.lamprd80.prod.outlook.com (2603:10d6:103:12::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 14:47:37 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4087.025; Wed, 28 Apr 2021
 14:47:37 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: David Gibson <david@gibson.dropbear.id.au>, Fabiano Rosas
 <farosas@linux.ibm.com>
Subject: RE: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
Thread-Topic: [RFC PATCH 3/4] target/ppc: Move SPR generation to separate file
Thread-Index: AQHXPDqOYntRa8dkakGvdaJuhDhEjw==
Date: Wed, 28 Apr 2021 14:47:37 +0000
Message-ID: <CP2PR80MB449987FB35CC5BC79CACDAFBC7409@CP2PR80MB4499.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gibson.dropbear.id.au; dkim=none (message not signed)
 header.d=none; gibson.dropbear.id.au;
 dmarc=none action=none header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:f709:3fc9:6467:977f]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bfd66704-baac-486c-e965-08d90a5490f5
x-ms-traffictypediagnostic: CPXPR80MB5079:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB5079908A2472063ECABBC306C7409@CPXPR80MB5079.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +XCpOi/X5piwxzHua3YOCyir4kNi00CtV5aoke9f86hxT2BmuYVMVFq9odh/JsDG55YYCIYkh2fcSk8WifSrfU4FJGIneMNhabsP1wZBomgE0XFadyQ0PiQYKPy0WmHC6gO8VJYRorpbphnxsmvj1tUikNpv2M8App0whoOn6zsREWFNzCra114s2K/mcXwY+ZQ9z4vchFPqNxLAdzkpyCUMyqgPBqmTX925b9SevlVjugH17cdpvAhJ1xxo1Qd6629ti7IaVJeHgk4Tx6t6Qv1NTLGZYn6d4TcJ4BtnmVwfOMqPtmT3BjRyux9lZP915dCSDrJ1sTpATIWFx28095w4TXEJ+VaQqg1SWIJ2yAAUJuXEwiyRqDvFBArG2eEEPI8JanNsYzrs6Qy5B4DIJzZUp4qdHMvsxUlqjdYDl+dnhjZrPD4qeof1s1kG4v7Oa+r5925W0gxG0ifXjHavTE8ygz1M1SHsyvh0CRrZ+iI3uRfZk/+XUu1lx6wBvIyhXY1RLm48y88CGXKQ0vkxBq5uBf0Grm+EwdjGoCCs+DdTEyw7PUTiFa7IimjZpFwid1HO+E7sZljIAavMUssIqfzT6QWpSoMFbP7W68lKaGu0+T8eBYLYJ2CupNQDwAAar8zeKInfB9ZUFSgSNftPyUGOCq5+96otslqPDiKj64kUxIrZ44lsnGQmhO2Kv9YR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39830400003)(346002)(136003)(366004)(64756008)(66476007)(66556008)(66946007)(71200400001)(33656002)(86362001)(55016002)(66446008)(76116006)(8676002)(8936002)(478600001)(38100700002)(122000001)(2906002)(316002)(7696005)(5660300002)(166002)(21615005)(6506007)(52536014)(54906003)(186003)(107886003)(19627405001)(9686003)(110136005)(4326008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?GoRXfw1zfZJT2vL3jgErujjxz5e1bZWn23Vp9JKZjyD8jf5N42dW2Yq86D?=
 =?iso-8859-1?Q?Uzd4yYNZI1El4APKEHuc2q6V8AMVYJXV63WbC0pPuYk1J1r5UczFwMQCfP?=
 =?iso-8859-1?Q?fHOBAluI2xDsf8JcQzT/C20q0INSswUhdVjY/fftFNh/iWkHIk6OrS7hIy?=
 =?iso-8859-1?Q?w+5Dor+96EHAC948xiTxSW5l024onBZdXFKUELOGwrU2AL5XYecqvW3Ahw?=
 =?iso-8859-1?Q?15cIpuVgBTchjhkbuiOWt9LLGWfaeFccu49wVsEIot/XzZvs3724a+I5b/?=
 =?iso-8859-1?Q?p0/EgzSR5C+LGUuPkjka9PRUj1pku13/i0IAnoky2ec5rD/ZraHpH73p5p?=
 =?iso-8859-1?Q?AnIUfvQtokgyPEzfsx/MUV8acKe7Al2UcPL/aPxOo11ns+oe9y2is7+3gi?=
 =?iso-8859-1?Q?opleT65a/wO1TUG/HGwKw8rjyazmkyDwoY6DVgQmc/WtC9EHbtIqCCedHH?=
 =?iso-8859-1?Q?ONqhxpkzlvxdcd2NAf3T5ZY6rxRcnqVT/0Eirvs1yFeDWd5Pmjp9bqL+Q7?=
 =?iso-8859-1?Q?SUkm8qiyPRVqWly5ajbLgIVWvMnLBy3W0TXFTrN/d5N8leQeAWFN1Sb6h0?=
 =?iso-8859-1?Q?47ArN6NaF3eQtLZc1LG5haaaiJUSLgrIhDdbAhU/y6e64nctLtsBYFtRRb?=
 =?iso-8859-1?Q?khjMzWdcMPhVdMQ0DxE8yQGYDeq6kbma9SbXNrli+yJ8i+u6BCmsFzMiWl?=
 =?iso-8859-1?Q?H+lN2CNi5hTQvFyZc74Cme0UF6Tq06Og5cHl3VqGym3IKD7FW/9C8SFDh7?=
 =?iso-8859-1?Q?g7nHFYsrU/jbKKQuRveP/UJsDMf/B/lvOQsJ9DhhHyHpk0BYkmgZdhppD4?=
 =?iso-8859-1?Q?t3mo+gLkqlB8S2e3Ce0/9UpGO6g3VisHlSA5+2cuHpwruzdhDKXfXy0gi/?=
 =?iso-8859-1?Q?DxvuNPHfDeYUIUkEKCBkvxQ1mM6PDjlCh+22TqaIa9gkUpkbXDzkXjz3N1?=
 =?iso-8859-1?Q?e2q1ZN6nONCJNdDPD5Y4mmZhJGFtyuNe+aV3UchGq4s/ItVNYOO9JzZZd7?=
 =?iso-8859-1?Q?2sqBT+R/XdyPX4YL8A092OLsmzRpYcJdkVQeYDUbrbhp0IucZArVC5TEYD?=
 =?iso-8859-1?Q?034sw3csXP61zUYarGgVY3Pgj6LQJE+Iq3qZwoqiJIKuazmDCMXAiZG/uV?=
 =?iso-8859-1?Q?ZhwSfEvB121h0w+aXDEwj/dmHgmXS1Nh9hAv/9Fgg7BoFmu+QvfgEQwFmf?=
 =?iso-8859-1?Q?g2YuciVQ8xCvE+QjP8eZ6ZQ9xxbuy4fo4cJSThnknwZrBXYDPMBBq3g2QU?=
 =?iso-8859-1?Q?s6QYOjYOy7Eoyv99XfW6NNP9IW8EhMrpDsLY72uBPYKeofJ3t05y+zoqTk?=
 =?iso-8859-1?Q?WTnS5zEftw5lERUevMH7T3Bh9rAejEZlIbUqWzJnQa4g2IEZ2VL7u4XIdu?=
 =?iso-8859-1?Q?2JFMeO+/kudgHfOYUYr6JgxU49u0vX+psMMl1svN1UbF26X8yz+TE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB449987FB35CC5BC79CACDAFBC7409CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd66704-baac-486c-e965-08d90a5490f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2021 14:47:37.1383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6d3pcHrOHbTWxCPzeT0RFYho1BNXS7NEPwTUTkm4Nph1g7bcBs9m7Lm2IOaiggfZv4Fuz4Q0DtquUy4rxl7/RTvYyJm+9MYJqRioH9T+ZXo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5079
Received-SPF: pass client-ip=40.107.80.90;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_CP2PR80MB449987FB35CC5BC79CACDAFBC7409CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > > This move is required to enable building without TCG.
> > > All the logic related to registering SPRs specific to
> > > some architectures or machines has been hidden in this
> > > new file.
> >
> > Hm... I thought we ended up deciding to keep the gen_spr_<machine>
> > functions in translate_init.c.inc (cpu_init.c). I don't strongly favour
> > one way or the other, but one alternative would be to just rename the
> > gen_spr_<machine> functions to add_sprs_<machine> or even
> > register_<machine>_sprs and leave them where they are.
>
> Right.  I think renaming these away from gen_*() is a good idea, to
> avoid confusion with the other gen_*() functions which, well, generate
> TCG code.
>
> I don't think there's a lot of value in moving them out from
> translate_init.  Honestly the more useful way to break up
> translate_init would be by CPU family, rather than by SPR vs. non-SPR
> setup

Right, ok. I thought we agreed to separate, but I can't remember the reason=
.
I guess less is more in this case, so I won't create the new file.
As for separating by CPU family: sounds good for a later cleanup, but I don=
't
think it's a priority right now.

I'll work on that renaming, I agree its a good idea.

> > > The idea of this final patch is to hide all SPR generation from
> > > translate_init, but in an effort to simplify the RFC the 4
> > > functions for not_implemented SPRs were created. They'll be
> > > substituted by gen_spr_<machine>_misc in reusable ways for the
> > > final patch.
> >
> > I'd expect this patch to be just a big removal of gen_spr* from
> > translate_init.c.inc and their addition into spr_common.c. So any other
> > prep work should come in separate patches ealier in the
> > series. Specifically, at least one patch for the macro work and another
> > for the refactoring of open coded spr_register calls into gen_spr_*
> > functions.
>
> Seconded.

Ok. Should it be 2 commits (refactoring, then macro) or 3 commits (renaming=
,
vscr_init, then macro)? I guess also that since I won't move stuff, I don't
need to fix the vscr_init, but it's no big deal at this point.

> > If you're only adding this now, it means the previous patch is
> > broken. As a general rule you should make sure every patch works. I kno=
w
> > that for the RFC things might be a bit broken temporarily and that is o=
k
> > but it is always a good idea to make sure every individual change is in
> > the correct patch at least.

yeah... sorry about that. I'm correcting all these problems.

> > > +/*******************************************************************=
**********/
> > > +/* SPR definitions and registration */
> > > +
> > > +#ifdef CONFIG_TCG
> > > +#ifdef CONFIG_USER_ONLY
> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,       =
           \
> > > +                         oea_read, oea_write, one_reg_id, initial_va=
lue)       \
> > > +    _spr_register(env, num, name, uea_read, uea_write, initial_value=
)
> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,    =
           \
> > > +                            oea_read, oea_write, hea_read, hea_write=
,          \
> > > +                            one_reg_id, initial_value)              =
           \
> > > +    _spr_register(env, num, name, uea_read, uea_write, initial_value=
)
> > > +#else /* CONFIG_USER_ONLY */
> > > +#if !defined(CONFIG_KVM)
> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,       =
           \
> > > +                         oea_read, oea_write, one_reg_id, initial_va=
lue)       \
> > > +    _spr_register(env, num, name, uea_read, uea_write,              =
           \
> > > +                  oea_read, oea_write, oea_read, oea_write, initial_=
value)
> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,    =
           \
> > > +                            oea_read, oea_write, hea_read, hea_write=
,          \
> > > +                            one_reg_id, initial_value)              =
           \
> > > +    _spr_register(env, num, name, uea_read, uea_write,              =
           \
> > > +                  oea_read, oea_write, hea_read, hea_write, initial_=
value)
> > > +#else /* !CONFIG_KVM */
> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,       =
           \
> > > +                         oea_read, oea_write, one_reg_id, initial_va=
lue)       \
> > > +    _spr_register(env, num, name, uea_read, uea_write,              =
           \
> > > +                  oea_read, oea_write, oea_read, oea_write,         =
           \
> > > +                  one_reg_id, initial_value)
> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,    =
           \
> > > +                            oea_read, oea_write, hea_read, hea_write=
,          \
> > > +                            one_reg_id, initial_value)              =
           \
> > > +    _spr_register(env, num, name, uea_read, uea_write,              =
           \
> > > +                  oea_read, oea_write, hea_read, hea_write,         =
           \
> > > +                  one_reg_id, initial_value)
> > > +#endif /* !CONFIG_KVM */
> > > +#endif /* CONFIG_USER_ONLY */
> > > +#else /* CONFIG_TCG */
> > > +#ifdef CONFIG_KVM /* sanity check */
> > > +#define spr_register_kvm(env, num, name, uea_read, uea_write,       =
           \
> > > +                         oea_read, oea_write, one_reg_id, initial_va=
lue)       \
> > > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > > +#define spr_register_kvm_hv(env, num, name, uea_read, uea_write,    =
           \
> > > +                            oea_read, oea_write, hea_read, hea_write=
,          \
> > > +                            one_reg_id, initial_value)              =
           \
> > > +    _spr_register(env, num, name, one_reg_id, initial_value)
> > > +#else /* CONFIG_KVM */
> > > +#error "Either TCG or KVM should be configured"
> > > +#endif /* CONFIG_KVM */
> > > +#endif /*CONFIG_TCG */
> > > +
> > > +#define spr_register(env, num, name, uea_read, uea_write,           =
           \
> > > +                     oea_read, oea_write, initial_value)            =
           \
> > > +    spr_register_kvm(env, num, name, uea_read, uea_write,           =
           \
> > > +                     oea_read, oea_write, 0, initial_value)
> > > +
> > > +#define spr_register_hv(env, num, name, uea_read, uea_write,        =
           \
> > > +                        oea_read, oea_write, hea_read, hea_write,   =
           \
> > > +                        initial_value)                              =
           \
> > > +    spr_register_kvm_hv(env, num, name, uea_read, uea_write,        =
           \
> > > +                        oea_read, oea_write, hea_read, hea_write,   =
           \
> > > +                        0, initial_value)
> >
> > This change is crucial for this to work, we don't want it buried along
> > with all of the code movement. It should be clearly described and in
> > it's own patch at the top of the series.
> >
> > If you add this change, plus some #ifdef TCG around the spr callbacks,
> > it should already be possible to compile this with disable-tcg. It woul=
d
> > also make the series as a whole easier to understand.

if we added this and removed TCG only files from meson.build it might
compile already (not sure, I think there were a couple of things that
used mmu functions), but wouldn't there be way too many ifdefs in that case=
?
The R/W callbacks are spread all around the file, and we'd have to ifdef ar=
ound
some .h files that are included in common files.


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

--_000_CP2PR80MB449987FB35CC5BC79CACDAFBC7409CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; &gt; This move is=
 required to enable building without TCG.<br>
&gt; &gt; &gt; All the logic related to registering SPRs specific to<br>
&gt; &gt; &gt; some architectures or machines has been hidden in this<br>
&gt; &gt; &gt; new file.<br>
&gt; &gt; <br>
&gt; &gt; Hm... I thought we ended up deciding to keep the gen_spr_&lt;mach=
ine&gt;<br>
&gt; &gt; functions in translate_init.c.inc (cpu_init.c). I don't strongly =
favour<br>
&gt; &gt; one way or the other, but one alternative would be to just rename=
 the<br>
&gt; &gt; gen_spr_&lt;machine&gt; functions to add_sprs_&lt;machine&gt; or =
even<br>
&gt; &gt; register_&lt;machine&gt;_sprs and leave them where they are.<br>
&gt; <br>
&gt; Right.&nbsp; I think renaming these away from gen_*() is a good idea, =
to<br>
&gt; avoid confusion with the other gen_*() functions which, well, generate=
<br>
&gt; TCG code.<br>
&gt; <br>
&gt; I don't think there's a lot of value in moving them out from<br>
&gt; translate_init.&nbsp; Honestly the more useful way to break up<br>
&gt; translate_init would be by CPU family, rather than by SPR vs. non-SPR<=
br>
&gt; setup</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Right, ok. I thought we agr=
eed to separate, but I can't remember the reason.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I guess less is more in thi=
s case, so I won't create the new file.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">As for separating by CPU fa=
mily: sounds good for a later cleanup, but I don't</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">think it's a priority right=
 now.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">I'll work on that renaming,=
 I agree its a good idea.</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">&gt; &gt; &gt; The idea of this final patch is to hide=
 all SPR generation from<br>
&gt; &gt; &gt; translate_init, but in an effort to simplify the RFC the 4<b=
r>
&gt; &gt; &gt; functions for not_implemented SPRs were created. They'll be<=
br>
&gt; &gt; &gt; substituted by gen_spr_&lt;machine&gt;_misc in reusable ways=
 for the<br>
&gt; &gt; &gt; final patch.<br>
&gt; &gt; <br>
&gt; &gt; I'd expect this patch to be just a big removal of gen_spr* from<b=
r>
&gt; &gt; translate_init.c.inc and their addition into spr_common.c. So any=
 other<br>
&gt; &gt; prep work should come in separate patches ealier in the<br>
&gt; &gt; series. Specifically, at least one patch for the macro work and a=
nother<br>
&gt; &gt; for the refactoring of open coded spr_register calls into gen_spr=
_*<br>
&gt; &gt; functions.<br>
&gt; <br>
&gt; Seconded.</span></font><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">Ok. Should it be 2 commits =
(refactoring, then macro) or 3 commits (<font size=3D"2"><span style=3D"fon=
t-size:11pt">renaming</span></font>,</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">vscr_init</span></font>, then macro)? I guess also tha=
t since I won't move stuff, I don't</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">need to fix the vscr_init, =
but it's no big deal at this point.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; If you're only ad=
ding this now, it means the previous patch is<br>
&gt; &gt; broken. As a general rule you should make sure every patch works.=
 I know<br>
&gt; &gt; that for the RFC things might be a bit broken temporarily and tha=
t is ok<br>
&gt; &gt; but it is always a good idea to make sure every individual change=
 is in<br>
&gt; &gt; the correct patch at least.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">yeah... sorry about that. I=
'm correcting all these problems.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; &gt; +/**********=
*******************************************************************/<br>
&gt; &gt; &gt; +/* SPR definitions and registration */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#ifdef CONFIG_TCG<br>
&gt; &gt; &gt; +#ifdef CONFIG_USER_ONLY<br>
&gt; &gt; &gt; +#define spr_register_kvm(env, num, name, uea_read, uea_writ=
e,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; oea_read, oea_write, one_reg_id, initial_value)&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write, initial_value)<br>
&gt; &gt; &gt; +#define spr_register_kvm_hv(env, num, name, uea_read, uea_w=
rite,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, hea_write,&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write, initial_value)<br>
&gt; &gt; &gt; +#else /* CONFIG_USER_ONLY */<br>
&gt; &gt; &gt; +#if !defined(CONFIG_KVM)<br>
&gt; &gt; &gt; +#define spr_register_kvm(env, num, name, uea_read, uea_writ=
e,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; oea_read, oea_write, one_reg_id, initial_value)&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, oea_read, =
oea_write, initial_value)<br>
&gt; &gt; &gt; +#define spr_register_kvm_hv(env, num, name, uea_read, uea_w=
rite,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, hea_write,&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, =
hea_write, initial_value)<br>
&gt; &gt; &gt; +#else /* !CONFIG_KVM */<br>
&gt; &gt; &gt; +#define spr_register_kvm(env, num, name, uea_read, uea_writ=
e,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; oea_read, oea_write, one_reg_id, initial_value)&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, oea_read, =
oea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)<br>
&gt; &gt; &gt; +#define spr_register_kvm_hv(env, num, name, uea_read, uea_w=
rite,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, hea_write,&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, uea_read, =
uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, =
hea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)<br>
&gt; &gt; &gt; +#endif /* !CONFIG_KVM */<br>
&gt; &gt; &gt; +#endif /* CONFIG_USER_ONLY */<br>
&gt; &gt; &gt; +#else /* CONFIG_TCG */<br>
&gt; &gt; &gt; +#ifdef CONFIG_KVM /* sanity check */<br>
&gt; &gt; &gt; +#define spr_register_kvm(env, num, name, uea_read, uea_writ=
e,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; oea_read, oea_write, one_reg_id, initial_value)&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, one_reg_id=
, initial_value)<br>
&gt; &gt; &gt; +#define spr_register_kvm_hv(env, num, name, uea_read, uea_w=
rite,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea_write, hea_read, hea_write,&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; one_reg_id, initial_value)&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; _spr_register(env, num, name, one_reg_id=
, initial_value)<br>
&gt; &gt; &gt; +#else /* CONFIG_KVM */<br>
&gt; &gt; &gt; +#error &quot;Either TCG or KVM should be configured&quot;<b=
r>
&gt; &gt; &gt; +#endif /* CONFIG_KVM */<br>
&gt; &gt; &gt; +#endif /*CONFIG_TCG */<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define spr_register(env, num, name, uea_read, uea_write,&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea=
_write, initial_value)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; spr_register_kvm(env, num, name, uea_rea=
d, uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; oea_read, oea=
_write, 0, initial_value)<br>
&gt; &gt; &gt; +<br>
&gt; &gt; &gt; +#define spr_register_hv(env, num, name, uea_read, uea_write=
,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; oea_read, oea_write, hea_read, hea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; initial_value)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp; spr_register_kvm_hv(env, num, name, uea_=
read, uea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; oea_read, oea_write, hea_read, hea_write,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; 0, initial_value)<br>
&gt; &gt; <br>
&gt; &gt; This change is crucial for this to work, we don't want it buried =
along<br>
&gt; &gt; with all of the code movement. It should be clearly described and=
 in<br>
&gt; &gt; it's own patch at the top of the series.<br>
&gt; &gt; <br>
&gt; &gt; If you add this change, plus some #ifdef TCG around the spr callb=
acks,<br>
&gt; &gt; it should already be possible to compile this with disable-tcg. I=
t would<br>
&gt; &gt; also make the series as a whole easier to understand.<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">if we added this and remove=
d TCG only files from meson.build it might</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">compile already (not sure, =
I think there were a couple of things that</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">used mmu functions), but wo=
uldn't there be way too many ifdefs in that case?</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">The R/W callbacks are sprea=
d all around the file, and we'd have to ifdef around</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">some .h files that are incl=
uded in common files.</span></font></div>
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

--_000_CP2PR80MB449987FB35CC5BC79CACDAFBC7409CP2PR80MB4499lamp_--

