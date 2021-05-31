Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89001396772
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 19:50:34 +0200 (CEST)
Received: from localhost ([::1]:40782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnm3d-0000V1-Hm
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 13:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lnlzX-0006ed-F5; Mon, 31 May 2021 13:46:19 -0400
Received: from mail-dm3nam07on2124.outbound.protection.outlook.com
 ([40.107.95.124]:8833 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lnlzV-0004GU-6x; Mon, 31 May 2021 13:46:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e6fnskkWPY84LBAtyEJtTXkpoKugqRxjOrZxcMiv32eCh9fUCZ+AdZ4cWNYGUa1MwKLUILAWRzMpw025T8lQ8S+jffDumXW8PwE8tbV50mH1OL2rAuPSdS2MQP9A9iL0MY65BT1Fs76nQ6vW2Pt3BQCAtUjn1krEcWgm2Qix6XKp5cdM0x0Baj9982gnClFtA1MhMAtoyqv/zg//goodKImsialU9iYu2/hvG7+RnXkIOJXsd+kTMBsOANdlozp7WYUikT/nuMKnf0YIJcJVBc39PrbWHzYG1/sVrfDof3NUHdBpjMOTotNegGk8hDLR3dVLOckZDRfk4AbXVqtSmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ0a9d/Yth6z5y03r20Vn5te33ZOViGMfDm01osOuKE=;
 b=DyZbOZBlToXt5Ko+IH7WLV5K7h/j66S0qW5+KKP3aQjc0oWenuX+2ISB+rr4U+dJI/Wu/FhL86F0y6VqpxQ4ZzxTSZUHUGX4jEnl77kJsy1nfCL5INjqpypTgceaW5H3XlEUVZtfv2Zx7FkamJHora6NI9s3kfzN9N+43mxXKTtmrCGvhW+GD0cQyX3qVHycsB2GufxOBXrmKNol+jQyQzw/Xb36DIMF2ThGlJ1BkZBC7BvqSqjlgMpgGlT1UJukz3iosScUSQEK6DOlOjuvBLynVTszRyfx0dSSvJbHBIN/1PQe77pawHGwmasYluN3rEvwlGLW+sgDspA5PHNdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJ0a9d/Yth6z5y03r20Vn5te33ZOViGMfDm01osOuKE=;
 b=f7R9K2fUHHS659fe4A9JMbxvS9jtIlhgFp3IkaxbsUf4+OGSsrEQk3AwgIIx57fXXU5Cau4W88S0SfFfZ05hnYOfAiag2Jfi/Bot9xrOOD2WzyO7CRosAddwiwBaJwTKIQNbocE7YsCi1oqpVc7bbUSDpVgiLuFMO+N0f//I1/+zk+mzLCn+9O+imfLuujd5U7UaAiQ7hKjmuZto+UYKXr2IO3lv/GKyU4v+E0YhNAs2zqrdd/kCPkU1PYRvkma4F6iQmcJH/2nGxGL+L9JgBQB0Tw3gQYBfNIJJsiluP8Ppac2+FfFcmG3HzRIZ+9HHogT4KfxxpLkZ06MLoRbkPA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB5459.lamprd80.prod.outlook.com (2603:10d6:102:f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20; Mon, 31 May
 2021 17:46:07 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.030; Mon, 31 May 2021
 17:46:07 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 4/4] target/ppc: removed all mentions to PPC_DUMP_CPU
Thread-Topic: [PATCH v3 4/4] target/ppc: removed all mentions to PPC_DUMP_CPU
Thread-Index: AQHXVi1PjRFgBHaH/USXDWoNK7Q1Qqr93IcA
Date: Mon, 31 May 2021 17:46:07 +0000
Message-ID: <CP2PR80MB3668B881BB8849805BB576A7DA3F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210531145629.21300-1-bruno.larsen@eldorado.org.br>
 <20210531145629.21300-5-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210531145629.21300-5-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.249]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 835d12a4-2c48-4f2e-b4c0-08d9245bf83b
x-ms-traffictypediagnostic: CP2PR80MB5459:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB54590ED8F9F87EED92C2197ADA3F9@CP2PR80MB5459.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:913;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kePVD7VcfvOjAel9/xtzlDX3aa2WmT5/0rXOqNy/pBXqO8QgWflPM5BLQ8XmAziVFdvQcPrXo8tuD74He5Ar7vi4Q3oAo1Ztloit2yvQZC1Zzg2vueMd+YeOqTvI0lToz4UKUzNizsAkLZ9YOdDfxpIpPTsTAP2b6267bgKEbE53t+8446G/Oj5Lc3NKQxE9FDvGkUpuwY4GDfz+7743/X1exEJ6MZwvROsOiOzYW76hlGDafQuTooZ4GTSKqOlflCZnFU4ckATJ6GPl5p161/BC2UdPvpzYKHWPM28p5at2O2Nd5J49dqy1RN740ulFLl+P2j7H4RvxztxH9pN8Ma4K+EtCmY72X4Am1itQBKuxFDaRL760f9gIB8PxPD7ZUd4Fal/rWwR6QMNmptvVTVqpH9E7gLTllerPdcaBtGnQzUbkEHPh3YuUsy5/gLjOTyw1dkQJOJi4NQztL06AdTJLEvLc19MsXdMMMbKRDXD2vjwJJZjwW+mQgfur3i5u2X7wa6VT5xzVmyvDnXpxTmpU36LE1Bwt9wUAKMkk82ZgMeQAEvHAVaE5TkyJsoTLQbSVYtCPNWoBMfoJ/B5LaJ/3U1LQLbNif9ClOGqZES7s9qk3IP4AKzTD1Wv6w+3nbVaJ5gXiQpL9nnlQ5UuiZYCkVuGC+4pnXSpU4ZzDdBLJrBxqbxj43HhhRUXflMxV/V+PUsSDw3xYFcrEusxGrJG0iJqBRthSHccS0BADA8g=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(136003)(39840400004)(346002)(376002)(366004)(9686003)(316002)(33656002)(4744005)(55016002)(52536014)(4326008)(66946007)(6506007)(38100700002)(110136005)(54906003)(122000001)(71200400001)(66446008)(26005)(66556008)(8676002)(8936002)(83380400001)(186003)(66476007)(478600001)(76116006)(7696005)(86362001)(64756008)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Z5QrMNPAK2ZpE7vc3JoD7bPFpFbeZkhyx4N/7D7UppWHCOk1fnohbEOe5cfI?=
 =?us-ascii?Q?GJkKvG9rWEMuBpNkFjiiGZ8lnlZ/ClfhmzsUG/3q+GvCuSc59sGBbMha9Tda?=
 =?us-ascii?Q?xkOvQ1tK68CbImYI0wwfOkaFiTUQgxTwUsgdIShUKrb5C3Gh1LmMbFts1w+a?=
 =?us-ascii?Q?Tf/9UTuuDX2ivRTRpsH2t9p/pcAaXrRsopc9Bq+7/UsesEkNeZp/oYeWIHhW?=
 =?us-ascii?Q?Sxvx3JpdzOeGeewhMMOrkAfQ+RcikEl3sYy6rk8vPXFek9cXdicLjJcVqYxK?=
 =?us-ascii?Q?R554bRiRjgLFnEkfcCBofrjsm6Bs4U4MrDS5x7icqmIdC+kQGnp81irPERU2?=
 =?us-ascii?Q?zP0Wd0V1OZbxNKqarTO27ZXxj8EHa0lPxA9of9cCBjWbTvcBWambJLcMpGWZ?=
 =?us-ascii?Q?i/bW2OWkOvFbpAMI8vR3J8O0Y7cq6RykKV85IN5j83dwHMngVG6a++fiEqwe?=
 =?us-ascii?Q?9HGUPa+emQRLbQWNphYXnrk9iv+Sg2J8BxYnoypB+0FQuHB7PELbFpi7OyDA?=
 =?us-ascii?Q?scRvk2UgCqyf0t0+/tsnxDh0rcG3TgnIMrLYwpv5isWQWlCZg4RQB9IbNONy?=
 =?us-ascii?Q?dn5Ev337byEaYp/RZOBWJQ+4ugn5p0O2SYwOUpPMlF6OcdtL00m7lSjIsH8Z?=
 =?us-ascii?Q?+jKCZ0SMWGPW2de8w4LQxr62O52EUBUpNt0x0R3F4XGC7+NKel5sBDJfuxZj?=
 =?us-ascii?Q?ElEuwy8Kcmbk0FZXNdqSXBL6RP6Tl9MSIn1hG+5DHBJsJdPEFlR0U/4b9Mgh?=
 =?us-ascii?Q?vr3kwLU8BqCWQZuk1G+S952RuJ/doCC+AAdmwlZCFFAX7Puc/X5M8TMd3B6M?=
 =?us-ascii?Q?wXGYxOX0kH0sgAJGzQqmnE+WFXdb/gnud88IpAlQvSp1nvGYa0Kvx8WdbXDT?=
 =?us-ascii?Q?Bt47B+oGmCkmhMm+DC40784cxJmkqtwFa/h8vf6ZGyzjhp4GMqEU0xcYDjI1?=
 =?us-ascii?Q?Z8aZM+LkJqozXPsl31RjHjC/EcTztrca1o0QpHGZQuNx5iOLrM4+0ZIoIK34?=
 =?us-ascii?Q?4T7buXKQIE5nIZ01K2wpAN2cMMu8T+krbNB+LkzCqUtQBnI6rGIgBqg81hoc?=
 =?us-ascii?Q?i73F1S8dzENdOPHbgEvlr+kd2eOH3OfSpZ33kcpAS3cKL81iDONE59CL3BD9?=
 =?us-ascii?Q?DLcXH5fOJ6ebL2Lg/dpZNrZyxbEP2BUkGDfJx5rPpbiMTfBHsFQtAZ0BVSFT?=
 =?us-ascii?Q?NE6LiO3hGlTMt3YcUU994SwPomuf4dGQ7cTFDU29pIT+amy5+q0rQyPahkyT?=
 =?us-ascii?Q?PtbRbfU5SzLCtGOI5jQtXSMq6kN6UOgZmnhQ7ShTdUbbZvCnF7+eg/0zFjKZ?=
 =?us-ascii?Q?uBM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 835d12a4-2c48-4f2e-b4c0-08d9245bf83b
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2021 17:46:07.2443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72bd/h+qD6vuR8BznaQwmZIw8yUIZIG4YL5WR+yxqL1zDU5OTRCurc5VnwHlgcqN0mUfiSnDmAUMz6/FNvzEjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB5459
Received-SPF: pass client-ip=40.107.95.124;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "farosas@linux.ibm.com" <farosas@linux.ibm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Greg Kurz <groug@kaod.org>,
 Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>,
 Fernando Eckhardt Valle <fernando.valle@eldorado.org.br>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> This feature will no longer be useful as ppc moves to using decotree for =
TCG.
> And building with it enabled is no longer possible, due to changes in
> opc_handler_t. Since the last commit that mentions it happened in 2014, I=
 think
> it is safe to remove it.
>=20
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/cpu_init.c  | 205 -----------------------------------------
>  target/ppc/internal.h  |   2 -
>  target/ppc/translate.c | 105 ---------------------
>  3 files changed, 312 deletions(-)

I believe you lost Richard's review for this one. In addition to approving =
it, he also noted the a typo in the commit message ("decotree" -> "decodetr=
ee").

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO=20
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>


