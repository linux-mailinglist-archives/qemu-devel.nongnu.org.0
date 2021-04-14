Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE2B35F456
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 14:57:52 +0200 (CEST)
Received: from localhost ([::1]:46442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWf5b-0004rg-PH
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 08:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWeFw-0001Us-0m; Wed, 14 Apr 2021 08:04:28 -0400
Received: from mail-eopbgr740095.outbound.protection.outlook.com
 ([40.107.74.95]:51680 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lWeFs-0007kq-4N; Wed, 14 Apr 2021 08:04:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MR7h8wLtFRC/AJ+vFCu7GDGHz0jOceLsKMBHundAo9lDOalIrpgvD7vA0Da6KEzk0k3ZwnY/X/St0oc4j+3mpR4FGgc6IMEnaXoV56hvNvZO2AkXmRYT8VZQKCbAFtHmTpanX/hL/XYN7SgspP972CtptIauJ5/uo86vgdbMbEGM17+USdUSwK9/0GC/lXIeI1opFoBzCM0UgcEBNddTafIdHMXxgVDg97IOJ5h9JqAWM3cP/BlV6RUSiCHi0VHajfGdsgJgMhywNhoAom1j/ADl5D0xoT3EFfaucQpoWh7Ra5lH0T8s3ULGMud+5rNjoTsBrNgfhPxAjxcEXuSomQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peuyAblf9d2hcUSKYArAh/bK+K4q57eS48lOyjEAzOk=;
 b=INJ90K8K9idZSoyXBIJkeyKEeLq4PZy9sjKtDKM2PxB+eFY56HsvvGXE1NJAM7hfqAR721DhTUmGK00XczML/IYIk0f7SL1Xtp95xmiE/aJGY7oCLK+Hirn8FXbHUCQeifHcOGSqwZV8860R58NYTxm/3nLxCliVEMKyTLBJTVYJ47tleomkEB9Ijga1nHllBR154p0a6ZEPjuvY2hIR8SrP5cTz+tcXqMWqpEiKrrg8/cCR06LvHsbOGAbmZ7Wc4PCZA+GIsVZrVBfgUB+vkEO9JNnM/xB6nqFcg+R+qHtMSuOhvaS0k8/bGcrz89sFUbsNDMur+wIqFXxkGkQ5sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=peuyAblf9d2hcUSKYArAh/bK+K4q57eS48lOyjEAzOk=;
 b=x6re+vb4/xhaBjp21IBD5NO8FUjIPs8vwIByn8SvqbciPv38cFGMjYTNvMH3RyX2rVJNb5u9hyQ51Zz5NhqF6GjIqzXMZi9nTdOukTSV8yy/rFzfkEQpZo2LAK/jGmxdDkr18XS078B/8fgtjGPnFU7MfthVaSYyIvLQ+u6za2KKoDAnJ3vJFjyKMqi8YQ5DBnT/Z607Ed4C7rd4T+hAoWRcl2VJnquH+8VmzX+L+LgwkZWIu4fvJk0SWK09Cru1YAi8CN591qHw9d+GWlwWmVn7oDoPuc1zvh5MQt/6LajBGi4dDIyY/UXc5233Q/esUizvYBMPzNh0WbEI0N6gtg==
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com (2603:10d6:102:45::19)
 by CPXPR80MB5191.lamprd80.prod.outlook.com (2603:10d6:103:12::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 12:04:20 +0000
Received: from CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b]) by CP2PR80MB4499.lamprd80.prod.outlook.com
 ([fe80::8c79:76c:3d1f:d59b%7]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 12:04:20 +0000
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
To: Fabiano Rosas <farosas@linux.ibm.com>, David Gibson
 <david@gibson.dropbear.id.au>
Subject: RE: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Topic: [PATCH 1/4] target/ppc: Code motion required to build disabling
 tcg
Thread-Index: AQHXMIej4hDOonaOpEaWSp4QxcAAL6qy+cGAgADjnXY=
Date: Wed, 14 Apr 2021 12:04:19 +0000
Message-ID: <CP2PR80MB4499299F2C3FA96E4942BCDFC74E9@CP2PR80MB4499.lamprd80.prod.outlook.com>
References: <CP2PR80MB449996D26DEA4C27397EEF14C74F9@CP2PR80MB4499.lamprd80.prod.outlook.com>,
 <87o8eh50ge.fsf@linux.ibm.com>
In-Reply-To: <87o8eh50ge.fsf@linux.ibm.com>
Accept-Language: pt-BR, en-US
Content-Language: pt-BR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [2804:14c:482:7ed1:af22:840d:1c02:6531]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f2428adf-022d-4913-ff70-08d8ff3d6f9f
x-ms-traffictypediagnostic: CPXPR80MB5191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB51913A93E5AF5F89E5A6F096C74E9@CPXPR80MB5191.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fgFeGbDfiUjupzKkYECNROIla87FsXZL35S9d+y6jR8RCleQMgZ6yNvs0HJfd5QkoSC/xbacmw17PqSeOdskHsiSDLGWtw/eGjGs2mz6FoYzoLChTU2r9B+/SzKzvY0c0soLeRg4s8gV2NK+AfpBNbS8JRw43f5MOzsPCr8NsCryaxyXVYCrARveCdysEYl0isi/ZregraBQdbWAuPO9avWTL48G4NJ0v2VgrYfWgipJeBFt7MydoR0mepsTe88Ml3rf4rPpe5+sUJSvxfvP7Zz/IV8llxUevMWLaZbGO1WD3JztmwDpW9fGuWMsAUujM17YXyNQir4+nnbhcQEY4C7+W+w6/ACLt42Q71HAcTOu5vW1pdcfI3iC858vfEEtcgP/JzfS5fx9GzK4BD+LrKIBVqGZrgE7Tk9ABp5uvOJC+UF2XEPzmOwOfX39nDNPT5HtcBS4c6m9FmrM/p6AvoImhynB2Sirnw/VZc+hMpR45FyZmhbMgnHg7My1TNo+iv05C3IPEOlQY+HIb2ldqHdUCJuSUBCR3Yg8Zg8BA24cZaIyULvJy3ZfbWmuN0h8LbPK6aQ27rFCFpoqI9omiFxTKu5uhkp6gdRUyidjEtm42LAaSFJSNMVQ0ImaXrw3g01Zl8MZCivh3PWhuPzXhcD6cJ7qE55aJ694yZ7iu+WiWRPW7FycxKJytd6heeoN
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB4499.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39850400004)(346002)(136003)(376002)(366004)(396003)(54906003)(7696005)(8936002)(86362001)(76116006)(122000001)(19627405001)(66556008)(66946007)(66476007)(66446008)(64756008)(33656002)(110136005)(8676002)(38100700002)(2906002)(316002)(71200400001)(186003)(9686003)(55016002)(21615005)(478600001)(5660300002)(107886003)(52536014)(6506007)(4326008)(166002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?oAgzHwIV7r9q1GUjSs5AT+NVX2d/EpqDiNezOZ5dJ8BtQ15BxFxY+AioXz?=
 =?iso-8859-1?Q?0DZzNnnOe+0X7s6ruoS8y3tbWtDtfFm3HhXGPCKdhoVkVJzh5O40hFfPLn?=
 =?iso-8859-1?Q?jvATFkDgNK++iesejJ8GWFe5sEZ4mPI0S/GjOgF6T8G5iE50PzXGdrTm0y?=
 =?iso-8859-1?Q?+y9cPS7LNI9vWgZBKtDsnb+LN/2KEJ0WsTbiMvpSc/ai15XrSAbYUUFVy4?=
 =?iso-8859-1?Q?ZmUoS74yChV1p6o1iMSkodyRlRNCwHPsKY7pPM/snBL8HD+SPoKTtZ+pGc?=
 =?iso-8859-1?Q?Vcg9os1MgYXUxRl2zD7d6eluLsLuvwRGPztOArsa2ec1X6IT7IkBnFmZ7Y?=
 =?iso-8859-1?Q?LJNPgPp+WJUUX8W+kLZLVclV0lWrcFPzCkDxbdJpd9NAWUTyCmQuPCFJJE?=
 =?iso-8859-1?Q?prAHjZKCY5boAmiJqTPN2TcEbUDkh3RyaMTo9cMYVR33ZH9y6JUxcIyI2V?=
 =?iso-8859-1?Q?Tjm122gtf+WskCOf1If7yeNr+asVVcPskOH93tU5DxoG0IaVDA4YbAquMD?=
 =?iso-8859-1?Q?yMEL+Oi4qlIUVbrItXKcgFWXagUED5XGEj8jdz7i7cgiKuDVLsKaSb9L3d?=
 =?iso-8859-1?Q?9qmD78ni1vVuFcFbRq40MEURguzFAu32Q53/V7qeqxx7u6OHmFPnP7680T?=
 =?iso-8859-1?Q?nhTyNajgB7sQSQdzRRKk3sepangjXoyAhye4sXULwG95Kw82vDmQKxXcC1?=
 =?iso-8859-1?Q?KjOnwvFYAhFbysRh4f5b9jOzXqTmESMTE1Gda5BTCzFY8e7tnp+Q/ji6fM?=
 =?iso-8859-1?Q?W/Z3E2MVV5f9x8z2cH9SKZIXip+LyELdOfXGN1QcEEYRGP6izm1yvyEwzJ?=
 =?iso-8859-1?Q?5kxWKCTq9Loj86X3MPDLB+egp5lCAOoYFuBtbFUP6xSjOeVAKcU19h1WIv?=
 =?iso-8859-1?Q?y4/mci15h42SpSw4uPlYJnh7OQ0C9ZdAYT8gdS8j9+VcThpMJb3GLAq3Rt?=
 =?iso-8859-1?Q?GiyH2n172+kVsFwQ7Ai/R4c07nq9cjlFJIXEI2J9JkXGQMt55JTKhRBXe6?=
 =?iso-8859-1?Q?Rvp7Z5emc12u/SmdtQl45/uA+w33Kuy00vrXg0KCPkOsu3ttg7djMVhxjC?=
 =?iso-8859-1?Q?qqusb0p5yGDScPe5fInO5sEJyeAhY6oM3RoZKDWYpiDwha9mTrj4dCjcSR?=
 =?iso-8859-1?Q?mMPOVSObIS0sISQk5amKhxwaaWaj7fJVZ/u93Y+b4k8QJgwkI6+nNhCK7E?=
 =?iso-8859-1?Q?q23uC/wgSHnFEMHz+ErxKW7ICreGopdotOaW6Xyc6X5wJh4hfct7Mf5/qA?=
 =?iso-8859-1?Q?RCWDSw25SX+mA7s4ZQeK3/IzFYuu7hV2/gFiyYEOFkDECxU0KihArAnBXx?=
 =?iso-8859-1?Q?hsXPepK9cnBHRMsHrwNy6oei97TvWecgHNA7NwBsVHURBao4QAQX9h34It?=
 =?iso-8859-1?Q?tqxiGvqUyxsMPEmH1reo63RN9SQGwP7IBd/xEDKitsrQ4vI4yKApY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CP2PR80MB4499299F2C3FA96E4942BCDFC74E9CP2PR80MB4499lamp_"
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB4499.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2428adf-022d-4913-ff70-08d8ff3d6f9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2021 12:04:20.0461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: slrhPE2zhPlvNLuSoz42l1y8eV/I9U9+4mmypVzyeoFKmy/URl0dP/cEOmAq4jFmcyCD3LHQ7zDKj2X+bNJI+kWtT0kOZnjROkXuwKSw3Bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5191
Received-SPF: pass client-ip=40.107.74.95;
 envelope-from=bruno.larsen@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
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

--_000_CP2PR80MB4499299F2C3FA96E4942BCDFC74E9CP2PR80MB4499lamp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> > * move gen_write_xer and gen_read_xer into cpu_init.c, as they're
> > used for some sprs, and whatever needs to be moved with it
>
> I'd leave them where they are currently. Instead what I think we should
> do is to find a way to not need the uea/oea/hea|read/write callbacks
> with KVM.

so we'd also move all callbacks to translate.c, right? RN, gen_write_xer
is only used in spr_read_xer, which is defined in cpu_init.c

From a quick glance, this would be almost 3k lines, so bigger patches
are incoming (side note: I tried to use that git config to show that I only
changed file names and deal better with code motion, but it doesn't
appear to have worked, is the wiki correct about this?)

> Maybe extract a function from _spr_register that sets what is common for
> both tcg and kvm (num, name, initial_value, AFAICT). Then alter the
> gen_spr* functions to first create all registers and then call both
> configs to supplement:
>
> //tcg.c
> static void tcg_gen_spr_generic(CPUPPCState *env)
> {
>     // these only set the callbacks
>     spr_register(env, SPR_FOO,
>                  SPR_NOACCESS, SPR_NOACCESS,
>                  &spr_read_foo, &spr_write_foo);
>     spr_register(env, SPR_BAR,
>                  SPR_NOACCESS, SPR_NOACCESS,
>                  &spr_read_bar, &spr_write_bar);
> }
>
> //kvm.c
> static void kvm_gen_spr_generic(CPUPPCState *env)
> {
>     // these only set one_reg_id
>     spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);
>     spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);
> }

by default, KVM already doesn't use the callbacks? Or would we have to
also change where these registers are accessed? If the first one is right
this looks easy enough.

> //common.c
> static void gen_spr_generic(CPUPPCState *env)
> {
>     // these only set name, num, initial value
>     spr_register(env, SPR_FOO, "FOO", 0xf00);
>     spr_register(env, SPR_BAR, "BAR", 0xb4d);
>     ...
>
>     // have these stubbed if not chosen via config
>     tcg_gen_spr_generic(env);
>     kvm_gen_spr_generic(env);
> }
>
> init_ppc_proc()
> {
>         ...
>         gen_spr_generic(env);
>         ...
> }

I'm guessing we'd need to do this to all gen_spr_* functions, this is just
an example, right?

> Can anyone see a better way? That would be much easier if we could
> afford to say that TCG and KVM are mutually exclusive for a given build,
> but I don't think they are.

Instead of stubbing, we could also create macros that turn the function cal=
l
into a nop if the config was disabled, and add "if kvm_enabled()" and
"if tcg_enabled()" if needed. I don't see how TCG and KVM being mutually
exclusive makes this easier, unless it has to do with where they are
accessed (idk yet where that is).

Another option is the solution I prototyped in [PATCH 2/4] in arch_dump.c,
having ifdef encapsulating kvm and tcg calls, and if/else blocks. I'm also
open to suggestions on how to do it better (:

> > * Figure out what needs to be added to the includes for both
> > files to compile
> > * move opcodes and invalid_handler into cpu_init.c, because they
> > are only used by stuff in this file.
> >
> > I'm just not sure about this last point. The stuff that use opcodes
> > create the callback tables for TCG, AFAICT. The better plan would
> > be to move all of that to tanslate.c, but might be a lot.
>
> translate.c seems like a better place indeed.

ok. But is it worth doing for the first cut?

Also, looking now, I see definition for exception vectors and some
exception handling code in it, which I'm not 100% sure what to do with.
It's starting to seem like should actually make this translate_init.c.inc
into a mini series of its own, if we're going to make this the best way
from the start.


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


--_000_CP2PR80MB4499299F2C3FA96E4942BCDFC74E9CP2PR80MB4499lamp_
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
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; * move gen_write_=
xer and gen_read_xer into cpu_init.c, as they're<br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; &gt; used for some spr=
s, and whatever needs to be moved with it<br>
&gt; <br>
&gt; I'd leave them where they are currently. Instead what I think we shoul=
d<br>
&gt; do is to find a way to not need the uea/oea/hea|read/write callbacks<b=
r>
&gt; with KVM.</span></font><br>
</div>
<div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
so we'd also move all callbacks to translate.c, right? RN, gen_write_xer</d=
iv>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
is only used in spr_read_xer, which is defined in cpu_init.c</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
From a quick glance, this would be almost 3k lines, so bigger patches</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
are incoming (side note: I tried to use that git config to show that I only=
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
changed file names and deal better with code motion, but it doesn't</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
appear to have worked, is the wiki correct about this?)</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; Maybe extract a functi=
on from _spr_register that sets what is common for<br>
&gt; both tcg and kvm (num, name, initial_value, AFAICT). Then alter the<br=
>
&gt; gen_spr* functions to first create all registers and then call both<br=
>
&gt; configs to supplement:<br>
&gt; <br>
&gt; //tcg.c<br>
&gt; static void tcg_gen_spr_generic(CPUPPCState *env)<br>
&gt; {<br>
&gt;&nbsp; &nbsp;&nbsp; // these only set the callbacks&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; <br>
&gt;&nbsp; &nbsp;&nbsp; spr_register(env, SPR_FOO,<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; SPR_NOACCESS, SPR_NOACCESS,<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &amp;spr_read_foo, &amp;spr_write_foo);<br>
&gt;&nbsp; &nbsp;&nbsp; spr_register(env, SPR_BAR,<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; SPR_NOACCESS, SPR_NOACCESS,<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; &amp;spr_read_bar, &amp;spr_write_bar);<br>
&gt; }<br>
&gt; <br>
&gt; //kvm.c<br>
&gt; static void kvm_gen_spr_generic(CPUPPCState *env)<br>
&gt; {<br>
&gt;&nbsp; &nbsp;&nbsp; // these only set one_reg_id<br>
&gt;&nbsp; &nbsp;&nbsp; spr_register_kvm(env, SPR_FOO, KVM_REG_PPC_FOO);<br=
>
&gt;&nbsp; &nbsp;&nbsp; spr_register_kvm(env, SPR_BAR, KVM_REG_PPC_BAR);<br=
>
&gt; }</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
by default, KVM already doesn't use the callbacks? Or would we have to</div=
>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
also change where these registers are accessed? If the first one is right</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
this looks easy enough. <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; //common.c<br>
&gt; static void gen_spr_generic(CPUPPCState *env)<br>
&gt; {<br>
&gt;&nbsp; &nbsp;&nbsp; // these only set name, num, initial value<br>
&gt;&nbsp; &nbsp;&nbsp; spr_register(env, SPR_FOO, &quot;FOO&quot;, 0xf00);=
<br>
&gt;&nbsp; &nbsp;&nbsp; spr_register(env, SPR_BAR, &quot;BAR&quot;, 0xb4d);=
<br>
&gt;&nbsp; &nbsp;&nbsp; ...<br>
&gt; <br>
&gt;&nbsp; &nbsp;&nbsp; // have these stubbed if not chosen via config<br>
&gt;&nbsp; &nbsp;&nbsp; tcg_gen_spr_generic(env);<br>
&gt;&nbsp; &nbsp;&nbsp; kvm_gen_spr_generic(env); <br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; }</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt">&gt; <br>
</span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">&gt; init_ppc_proc()<br>
&gt; {<br>
&gt; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gen_spr_generic(env);<br>
&gt;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ... <br>
</span></font></span></font></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<font size=3D"2"><span style=3D"font-size:11pt"><font size=3D"2"><span styl=
e=3D"font-size:11pt">&gt; }</span></font></span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
I'm guessing we'd need to do this to all gen_spr_* functions, this is just<=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
an example, right? <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&gt; <font size=3D"2"><span style=3D"font-size:11pt">Can anyone see a bette=
r way? That would be much easier if we could<br>
&gt; afford to say that TCG and KVM are mutually exclusive for a given buil=
d,<br>
&gt; but I don't think they are.</span></font><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Instead of stubbing, we could also create macros that turn the function cal=
l</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
into a nop if the config was disabled, and add &quot;if kvm_enabled()&quot;=
 and</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
&quot;if tcg_enabled()&quot; if needed. I don't see how TCG and KVM being m=
utually</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
exclusive makes this easier, unless it has to do with where they are <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
accessed (idk yet where that is).</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Another option is the solution I prototyped in [PATCH 2/4] in arch_dump.c,<=
/div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
having ifdef encapsulating kvm and tcg calls, and if/else blocks. I'm also =
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
open to suggestions on how to do it better <span id=3D"&#55357;&#56898;">(:=
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56898;"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<span id=3D"&#55357;&#56898;">&gt; <font size=3D"2"><span style=3D"font-siz=
e:11pt">&gt; * Figure out what needs to be added to the includes for both<b=
r>
&gt; &gt; files to compile<br>
&gt; &gt; * move opcodes and invalid_handler into cpu_init.c, because they<=
br>
&gt; &gt; are only used by stuff in this file.<br>
&gt; &gt; <br>
&gt; &gt; I'm just not sure about this last point. The stuff that use opcod=
es<br>
&gt; &gt; create the callback tables for TCG, AFAICT. The better plan would=
<br>
&gt; &gt; be to move all of that to tanslate.c, but might be a lot.<br>
&gt; <br>
&gt; translate.c seems like a better place indeed.</span></font></span><br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
ok. But is it worth doing for the first cut? <br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
Also, looking now, I see definition for exception vectors and some</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
exception handling code in it, which I'm not 100% sure what to do with.</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
It's starting to seem like should actually make this translate_init.c.inc</=
div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
into a mini series of its own, if we're going to make this the best way</di=
v>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 11pt;=
 color: rgb(0, 0, 0);">
from the start.<br>
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
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif; font-size:11pt; col=
or:rgb(0,0,0)">
<br>
</div>
</body>
</html>

--_000_CP2PR80MB4499299F2C3FA96E4942BCDFC74E9CP2PR80MB4499lamp_--

