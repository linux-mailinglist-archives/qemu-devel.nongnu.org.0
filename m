Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5A392243
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:45:07 +0200 (CEST)
Received: from localhost ([::1]:44592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1Kr-00011o-TM
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1BY-0002yg-64; Wed, 26 May 2021 17:35:28 -0400
Received: from mail-eopbgr800103.outbound.protection.outlook.com
 ([40.107.80.103]:7491 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lm1BU-00009y-Fr; Wed, 26 May 2021 17:35:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5K2mkAdGa3r91jY5ZNIfXfISlbqrpNVLgYd3rN32PG24TamvSBNgIqU4+egDyM4IEumTNwUOm4ASnUQNSOko93FioVqHwCUyHDgnR8ptbuYuTqcVwo4UcJcLQWSslkC5cefZK7hTf2LCTG97tHNn1mKnLHk//hjEKXVIzJlYHRChFDybZ6KRCHJDOUrzCggka7iw5Vcfq2CofjasfACoc6PdC7X82M7T1Lj2Y3oz+nv17ol2So3Uib1nx59dDFTpGH3UuzYmAhICpvZLJkTTW5lVEN/s60dnpUDB4KHRvTiV3dgDdNTFJRQDK1/n6U6fvbTgtmGkk6HmV4UEB/N0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt/y998erTOvBw3rSMdTy6gHtwa2TMXUCq5xAKnbkc0=;
 b=Ju827w3PjJUKFa/mNZaHwRbG8AnlLjC9KuCW6EDjnBTRbsVwCJRx72Eyb+5w1LxQUn4hD1YNuFjn9uAg6n/ENf7P2NyLofWQWcZEp5HNI2C06+5zFpeKsu5vBzjM01U8p0JQsnwXetNuMJyR+ETaq4QwEwOPbC+eGSSCCfjZjFR7aBdcGJLD/pHYjuVFcvGYf6YHkbbe5z4Rqr6R6R7dbvuwUo6zhsWBGvo/a48lVdAHtvt2vCsQw1hTpwSU1Cz9ZSGisnNrQscLCvzdyUOQ7CKhVAHPpKYeL6Gk6je3CeUHMcUE6ykw5+hVDcNzS7TW7aCDpcI9ZUNaJkb31yybxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lt/y998erTOvBw3rSMdTy6gHtwa2TMXUCq5xAKnbkc0=;
 b=DwbFPVA8SdIB6uDrwSzcpB1MIyO/XhxlgF15CRAuWco4Zk91mPC1XrGnV/eFhD8IibFU4xcSO18etj3XLD5EEXUaiMjeMM7mrTYkoltjOyw8yRqUr9qwPL8+OH/881CBXxnwqFAz+++ZIrDJdTKN+ufoyJZ+MLoDV+HqA7jfaMsmxZxjtH1jeIhM8V7CX01ZyFesY2MN75P8O5tpIo61h20CkdyGs8/9ZRszALpEJREZfvxtCIBDO4QJIH4S5pbSOCeQ1wtDs2HjREzPCwEr5x57V+N6tlKlpmJ011ZJ7o9W+k4kVyxH/ovwoepkxeOom0mGve3d7/rD/gJ4UuT8Dg==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4370.lamprd80.prod.outlook.com (2603:10d6:102:49::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Wed, 26 May
 2021 21:35:19 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4173.020; Wed, 26 May 2021
 21:35:19 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH 3/5] target/ppc: removed mentions to DO_PPC_STATISTICS
Thread-Topic: [PATCH 3/5] target/ppc: removed mentions to DO_PPC_STATISTICS
Thread-Index: AQHXUmzZfZUbsus+qUqYw3MHEovNTKr2SIfA
Date: Wed, 26 May 2021 21:35:18 +0000
Message-ID: <CP2PR80MB36687B0B1863720E817CE49ADA249@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
In-Reply-To: <20210526202104.127910-4-bruno.larsen@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab050227-3088-4e71-887c-08d9208e28b9
x-ms-traffictypediagnostic: CP2PR80MB4370:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB4370CE74828DC121C7CF9B70DA249@CP2PR80MB4370.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:119;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MOx5qWcjLJXx1kD1dFp//pXd3eTFJ/eCr27rsZ5CxXAoT05EVyU4TGtc/2PjcMvamRi3RYsq7DNFtN0j6vrndcsGG7k4VSnaN9vH6UKMqpRZo+9QrjMrKTgiWgBd+hGEuIG+suSBMsLw1EaDynyfkPuskSki8wE2XgdEgqfgqrqae5NAqxqYWa9bcIByfTZ3bZEOC7ZJey0OHHa67/rxHgBxxo9rwlrdKhFhKY5yXvcSmNC85RDjgqgcsjiykIwoiX4nuCWHsKz7FCLd0qg34gt2ozSGaNXXwmCvonx8+rnztVcv1g3y+Hz/LAXyJtbjz/Opr4KsSUXS/d45vHzpa9NSW3Ln1wN9Vc1uCC4OCrClg/JKX1Q3eqx+aKE4EEgN+fwycjolOeM0k1Se6e2HAJbDj4zn/GYbm24wgYkVG8s+4ccSY8aqzf8xaF72KxlMRa1gTs+WOJtJJA7g2+/2Fd+BemPYtxXoDOnJ/n4b/K7XGdWWap5xAmkHYon9hATCQnpU8WhhSGssXWrSgFcFuigm8ty/t+NRhv/2ua8HC6zjXaRApbCo2lNTlplvXBlTPsqrpoHv7gFKb9++L60zTe0apTeamI1DUSOV2RslvxhwUoUVgoo8hAZ4+HnV9+yeyH9WPwUNd8sZ3260gnis1Hq4WqX1N8KW0wd0FqX9lEWNt5lTfDOl+513GFq4kK7WkvEed/0QAYmNHczXNolBLmPpuPlXPnP0LF/Z8MXOhpE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(366004)(396003)(136003)(39850400004)(4326008)(9686003)(2906002)(83380400001)(8936002)(33656002)(5660300002)(52536014)(122000001)(478600001)(55016002)(186003)(316002)(26005)(54906003)(86362001)(110136005)(4744005)(8676002)(38100700002)(66946007)(76116006)(71200400001)(7696005)(6506007)(66446008)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?hSsYL9Uh6mxj9Ap9nskQphfOPdF3Uw71gazzE88hT82iFr3Lq9OMGwa1S7?=
 =?iso-8859-1?Q?8fhH309H87H5rHosreM9OopfOa0lPXXd0mucxf571MoYShFXabZsRTUf1Z?=
 =?iso-8859-1?Q?f4VSYwGyGW/BTQuvytrt34gCPXEAxVuL6a2Nz8mmfEKuGlIjDEtX0sRkH+?=
 =?iso-8859-1?Q?mE0NppWJsIu6plZsxyK+YCP+qNPRDIHsmi1HcxTKlsF/zUqgfVXEMC1NG8?=
 =?iso-8859-1?Q?nFingCy5abbUjOiQBArwZoappz4G57NxjSe069S9oreZ28dFoei/VOxnOf?=
 =?iso-8859-1?Q?weWDk+k0Fc6Kjffi0TeTcYVZgwbiKX56HXu0IJVMIvEYbYC6WaNuVg3vu5?=
 =?iso-8859-1?Q?aa8/HSoU7GVerkZ0DVZCdSgy3Pa9Y0qy8k6+LelGdncw3MFv7GXC5Y5PPR?=
 =?iso-8859-1?Q?S6Z6Wex7vJ4SjqaIu5m8MAmtyydZtJ5u7wdNG25v4jCkyEUEGWxynS6VR8?=
 =?iso-8859-1?Q?LXktZw4mzehAiO/zRZV7u0gS7weI5xyZe+mlQUjWGyqsNolPOq6yB8ORWF?=
 =?iso-8859-1?Q?jeLtmsGf40TPpeNBGuZw7w7hA0DL701D403jio2OsziswtQqhrg9xY2ZwI?=
 =?iso-8859-1?Q?wkkFYDyC8qTjRqI48G2MW0rrh7WwATbSUvFCYjHWtkkmY4d4NwZP3U452t?=
 =?iso-8859-1?Q?SjdgwK2IQLBpj5YVXSNKBoADiocCgw2tUHoiEChbPh9xw+5yDCp/98QHWc?=
 =?iso-8859-1?Q?8ZEQ6+MhE2FAkYai227sf/exgBxE/qx1kTKCGuGpfxMP2QwL3Uq2mQCAXo?=
 =?iso-8859-1?Q?ACnmPextiZMraHAvcPv2pnCwiPrP/oLAEIZ3GzpmMBgoUdes72mzN0dZ8T?=
 =?iso-8859-1?Q?9U15N83aL8FmumX2IGTNiwnp2A9SDAcJRSAWD6tsgAe1D8RxybbUMaokuX?=
 =?iso-8859-1?Q?ryWLQK4Zp8+uAaU1txVrtrP2VvQtPEOmTJlPXqu6JOBrHnqX9uCmEjwqm4?=
 =?iso-8859-1?Q?ANYlXWta5FNX4EtoHP2cXd+oJIUa06b2Ri8mPCplstlK9vT1sbGt04Tvn4?=
 =?iso-8859-1?Q?NxV1RdIxIKQzd2KkcrS7hCeLwcWQZHUjrIekDhZyNj6RIDtIFwcQcuCfIo?=
 =?iso-8859-1?Q?rFE9OeeLiGD14sZFqkM/K64gAI59eJOaSVE09i9ftV6DHWwZ56fPYVLhuj?=
 =?iso-8859-1?Q?vnKiAcBaZimiuvuzo/mlJeDRthG9LsHo/biECOMLK9nEeC2fHjAUxOGt0C?=
 =?iso-8859-1?Q?gWceWs308BGyzK3q86PyrI8iVlJQt3ZxV6BPcnQFDaS1fSUJQM80i2C/gO?=
 =?iso-8859-1?Q?vNG0aIV/L9ZgkI/pBZ/Wt/4VaKeszOu9wLBIgP3k/f105w1Uzvphk0+IQ3?=
 =?iso-8859-1?Q?W75kxoUFaWzE/sfJ2HOFehTLfKoGsdgr5NVd+tnd/tvq0QI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab050227-3088-4e71-887c-08d9208e28b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 May 2021 21:35:18.7649 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XKS3JYEQyTllNQ3b/gQcSGeOxpmiNGgMeNxrD7NSEin2ooL1j8eBhp5mLIG/IO6MQ0zhnqJF7tHZSjRr7yrkYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4370
Received-SPF: pass client-ip=40.107.80.103;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-DM3-obe.outbound.protection.outlook.com
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
> Removed the commented out definition and all ifdefs relating to
> PPC_DUMP_STATISTICS, as it's hardly ever used.
>=20
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
> ---
>  target/ppc/translate.c | 16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)

The change looks good. Just a minor note: part of the commit msg is wrong, =
where you mention "PPC_DUMP_STATISTICS". The #define is DO_PPC_STATISTICS, =
and the function was ppc_cpu_dump_statistics(). You're probably referring t=
o the former.

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO <http://www.eldorado.org.br>
Departamento de Computa=E7=E3o Embarcada
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

