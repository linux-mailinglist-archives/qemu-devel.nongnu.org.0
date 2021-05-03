Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F683715A6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 15:05:49 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldYGi-0000cU-DN
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 09:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldYB1-0006QK-AG; Mon, 03 May 2021 08:59:55 -0400
Received: from mail-eopbgr790097.outbound.protection.outlook.com
 ([40.107.79.97]:20156 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1ldYAz-0000Dp-Kl; Mon, 03 May 2021 08:59:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cu4VoLULynMUw6kmPg7ERdbIKAEbEhaRlGJusU/FexGPCQm8+VtwcLlkb0qqEvbILhWq/4QRapPjsXr2vsHCEs077mu5xT36UqBbMFRP/N4UsQgZiOuVMhT8ZxEqeAOin3NDsw5rKahwz7TwwQ/SssvX22+99QpYan3WZLXEe5iFvzBwh7QnweiLiAKF//YCVcqya2VTWIJPxhk7TWEW6uVeTMhKoU3wn/Y3c/5SKTbqF5NJst3zMPbjxXNvE2qDbz0ZGp5NHfjjXBp9pu7n+4SJaVOJgZTkx6mMRg5SI0D+le5Ay4tZT0qvuLNQ2PkEY+YA550KF3KLbk+kNDttTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzuHRc6HNk56qwHmsutdLIisxZpLWSy+F+EfsK2LkuY=;
 b=lbZUMjKvif8K/N1SbV6tnhbsAsSiEd2d14PUghRqfys+vLLdFpr81hfNvPTTvjGFoZ2lICS+2Q9X0LH13GwDJNGPVV5ouc7YIgP6eALGCQzI9sNir3BkZNEZOiOEjUqhA5Be5bv5wJrvhnUYQF++lcURtNYX8j+6bZAxEVBgmlOxf+oJrW9eMtI+yPawnxK56Hmw4TqigsqUHmSTKHEXu0cPwdrn/4nxa0XR9SUCLNPx0jNzNhw2AfA77GUPWWmU1siePzUnTqf/ulgvraVIFNOoXdNoXcAXlJHEJqaLW3Ok8jbKmJMGcf98oWVzm37Wr8Pa7STHzFE2Bm5boW3LZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzuHRc6HNk56qwHmsutdLIisxZpLWSy+F+EfsK2LkuY=;
 b=i2K8gzIYoOidiMNAVBZqIdKpdp87mjTJnIJ0WY1J3hwCau0uNzq3Va3YqlHuZUXlwHbDIAw0I6RE/So6fL6KgT1WtTtnzEL927JtSVrcKFnTcxoJeOVGei4YjHUb0BdFpteGhsjpk86HHNb7VpZ/pJnjS8Yj/d5AMbEjqVvLATUeA/RPVNyyPJEJ8+vuxxTyPCuuhY9kKu3R7aWYw7834QWU7tJcKre/Ewp/kN1zw8kBq0TpcgFiVafvy2E0v056aEotMzbE1s0kJL5EGgQj8fdtlDM3D2Hz19KABtxXNpKjeN9sTANFVlAKw//TC52ZZVm0xoYnZvd82BPky54Ukg==
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com (2603:10d6:202:25::14)
 by FR1PR80MB5179.lamprd80.prod.outlook.com (2603:10d6:203:1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.38; Mon, 3 May
 2021 12:59:47 +0000
Received: from FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6]) by FR1PR80MB3670.lamprd80.prod.outlook.com
 ([fe80::2c95:a735:2e00:5ee6%6]) with mapi id 15.20.4087.043; Mon, 3 May 2021
 12:59:47 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 08/30] target/ppc: Remove special case for
 POWERPC_SYSCALL
Thread-Topic: [PATCH v3 08/30] target/ppc: Remove special case for
 POWERPC_SYSCALL
Thread-Index: AQHXPV5f35PKueEtMkC2cvsP0EyJJKrRvYrA
Date: Mon, 3 May 2021 12:59:46 +0000
Message-ID: <FR1PR80MB367046E51F6BC4A533FC0698DA5B9@FR1PR80MB3670.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-9-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-9-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e0a9689-917c-47e4-d9ba-08d90e335462
x-ms-traffictypediagnostic: FR1PR80MB5179:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <FR1PR80MB5179A9C3B3A212BBDA369EF2DA5B9@FR1PR80MB5179.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:489;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NaVTy5wJBScb/dsBTMjgNVUa/eam2rXmVvpjcZKdVxoMS9eqVSVuVK32BuN8GbWizGZ7tdHUYhKD49A6Js0kjouyQdmvSzqnCyZwxZyONxk/M9LuRvGaFFPO78rv3D3ChPF/l7rWE8X7RQ9hG/UfGoUqjJuTqek9X9KrjNPvhXmY5WuIiAWM12lmk1GzA6Aw5Dr1WTmFVLXRXOk0czy2W7rg8H8v9aKxobqjW7WHlkv2W2OaDxOpsPNfTgk2afM3Utic5AkJw9LfX6ijT2CerzQOMunFlI1omPuD7pXiqEIkZlzdNSj8D+PvpoIMy5+X7AkT4JY2BiUdCdYEJh1US9P/Me73zmWkQ96x8O6+nyyas0M6JkBPpCg9+ZqDVcBgxwutFcaqKFuhfSaMHPyxOGyQDgglFEkOX4w2gMtlKfbRi9+QyXzp9M1wwpM2vXwRvVjP3PQCoIsOpnzmMGWF9yk3edYeDI/69OrnrSECCC4w4OdlJWDZ38Bijn2Oosgq1UI8O2BgX8j1lLYiYRhYtkQYVdQkR8A0sgL/Hg6yz0HN1VX+3JydWd16hVrPpoLwUYYPyiHyGcJe7SnJPflppOkr1PpQ0yoDSq9YzuY2HyM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FR1PR80MB3670.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(396003)(366004)(376002)(346002)(4326008)(83380400001)(110136005)(66476007)(66946007)(64756008)(66556008)(2906002)(66446008)(76116006)(52536014)(186003)(5660300002)(478600001)(54906003)(7696005)(558084003)(26005)(55016002)(38100700002)(9686003)(316002)(33656002)(6506007)(122000001)(8676002)(71200400001)(86362001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8qD8lK/ovVIa3Vin7rGs6zNaDERk4SRcYdo+ZzokMMMDJxmEYXc9aBCOABzp?=
 =?us-ascii?Q?AgpLCgopUrHCIi5Z59CV2XeToP1U64zX2GHsKFsRSTbw47eJnmZF+rZnQWiC?=
 =?us-ascii?Q?eE1tBlrROh3yligynlAEkHypv470PBo3ehytiIN8jWUy+atm8rLzpd6eXMlE?=
 =?us-ascii?Q?sUspU5izYY5wqBe0T2SjmAoETNV0OnXLvOPKqZnBR2ggQiddgf7fNVd1TS4f?=
 =?us-ascii?Q?M5XfrE+hXi+V7IJwb3PpQbu8TcyZrL6GCwtXuGtYEwan4Z27S6sIsuoMwUbH?=
 =?us-ascii?Q?IXfnJzzKpNU6OxjVldkWtesTCHoiYuDRGj3qDyJdBdN5+1M/NbFHbT4AsZXG?=
 =?us-ascii?Q?/6e2qPyBuvIjLZxxK/ZwAtSt3l+uzgGgbYVsFQk6/0G1F0HD91Mg/xYYrVCH?=
 =?us-ascii?Q?e929dmhzvje8N8w2mD+3/M7iEYpk//9Vu3C1u1Wd0MiU0c64PZiOQLLPGnRS?=
 =?us-ascii?Q?KXUd8qElSJbFcwsX1VyLtf/PoLZHM24+V3l3YmhGRh4THhoznPNhBXBs/Dyy?=
 =?us-ascii?Q?9EUXlyCpK9DWvaj/aKazh4lnj4ii86xNPkeDjewU+pxG+5tg1h1byAb3IP8e?=
 =?us-ascii?Q?jQlLjfvBscSpLekZu66nw8GPWcT44BytytLyUxkiquYGVQJFl4CvoZWB8ht1?=
 =?us-ascii?Q?p+A9Ez5BkX3MAqhl5uFNmy7HaPISerHbup1HfQ1or3diMkcndVRQS4oZpfar?=
 =?us-ascii?Q?WJfoQO3zADpPAwxUZCFKrbFsK7mSwWHrKs6xCUe08sE4cUTP+VIaank3AbY7?=
 =?us-ascii?Q?Slw+Ajzi9+HPPVBASLPWXbMpcPbixXcnmP6hd+984vp0OzxRQ5nSiZ6QqByG?=
 =?us-ascii?Q?47yv0OPTChegNYB4+/dMxm7244cqYKyKlBK2lA1PRRoYgrbLEeuCGbdppEn1?=
 =?us-ascii?Q?CwPCLxeAEJaUUo9S5Xbcn84/uAmuOwoFngGCDfsYgzUGJ2yWzfx2hq1Md9Pg?=
 =?us-ascii?Q?5ubXEQRUueRkQn2wWk4KJlvO4KGNmSvN3Ust2G7CPBDqv8YrEOOwnqT4oFrR?=
 =?us-ascii?Q?sTpHcpVfZ9RbyWstYTwwz1+9qAINU1/EjVaVLePggnlnI3lwxAMwFEwMRvss?=
 =?us-ascii?Q?BlV9QgCWhJynYDCehWc0+egTxl9ctd+0E5zZzVTL+jOgrJE2Mqf64V8RIeVp?=
 =?us-ascii?Q?i36Is3B92jgbWqg37VHzt2uANopZ1PEUM+MtZ8SoLIbC2wPJGKA4z+MCZnn9?=
 =?us-ascii?Q?a6EI3sZIeU9RhU1uagTIFKjPfwUt7t8Nr0jHASCY+Qm7EiMdr7y6Ts5e8qAb?=
 =?us-ascii?Q?+flbFD1pRsDwNR1mwq5bWp5igtg+nthaODwYR8b0AvBvOOleSkSUbwjnXVRX?=
 =?us-ascii?Q?+kM8X8cF6qaq1hWRSgu95kQO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR1PR80MB3670.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0a9689-917c-47e4-d9ba-08d90e335462
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2021 12:59:46.8970 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bl5PbLRzj36Pncp9TObZ0SYhQi7hUZZrN4q+itKENGBVrNRKatvOVR2TQE7QP4SHmVMKSsMTvrCLgmgoyYrfGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR1PR80MB5179
Received-SPF: pass client-ip=40.107.79.97;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, TVD_SUBJ_WIPE_DEBT=1.004 autolearn=no autolearn_force=no
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Since POWERPC_SYSCALL is raised by gen_exception_err, we will have also s=
et
> DISAS_NORETURN.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


