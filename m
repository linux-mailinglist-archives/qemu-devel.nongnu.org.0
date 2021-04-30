Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575EA36FB9C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 15:38:57 +0200 (CEST)
Received: from localhost ([::1]:57052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTM8-0006Qp-BQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 09:38:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcTDJ-0007bY-4G; Fri, 30 Apr 2021 09:29:49 -0400
Received: from mail-eopbgr800124.outbound.protection.outlook.com
 ([40.107.80.124]:28863 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcTDG-0004qV-Nu; Fri, 30 Apr 2021 09:29:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L+Tr65osC6EbUvC8ryOJwj5aWjBigwiC28wd1Je1wckczIxvW6Nx9jbeCcnN9qUf+k0UVZAAo96Od28Zv4B1i/wxBTZ913rB778ORTyclyzFa1WYWQF1JKDIT+1NlLnSo2O/GEzUNjOHLkQL8DzwHkXIIF79YDtKPJWcg6fpV9s4IQjFtruT4z1Zx8EoJJbNUhbybmItKdZbgVEU+QK6vjlW9ZeAeh2M+JNTCAkyWu3QUpsICWnpbvHl996VFNL2ay/LfRGWjayD8LRCVft81WlilBzzTheGpq3KpxUSI/it6FXjVZ98abG+HNkFL1ZoLCqW3a5G+fTiwrYZsfl7Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpDzzTDH2IWo+d2ofxUJVsxiy+W3SuerzNMn7ULg+Eg=;
 b=dUy9ATQrRyo3+57+RR3s8VBG1lsFf4RKLBcVxwvk2EpOfj80Qr5wpJha48aZmsWdmH5zvP+FVIDYkVniZtD3UqYwog+EpT20hYHl9wCIISkPpToCEGrLJHyn02bNMnALkFtwUKlx6LB3BhupZukemgXQDYJzwSZ7z5L11L9Liwb5oSmaAFTue6Bs8sapmEJh9uqR4YJHsFET1J8NOBTvZtbPTdBG/kZSxSxSmO3ehwBMc8IxOUv9Kx5SRm89+0CAdjR1B1jX9vvcuuFk3bCPzNLSAmG/yXs884SWt0R13LNMqSy/VcJUKLmAlgvFf2n0dIHJyM7tSTNEKi6J2CoLqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NpDzzTDH2IWo+d2ofxUJVsxiy+W3SuerzNMn7ULg+Eg=;
 b=sNcDVmdISft++4ffVwcbTv5PdTi5ATZMYkfoKTrI2RbC8m21u/nEVZvjse/kWoJck2jiq9xx4VGdQz488dtVOzvAJODMMRBM59oC664L0oRmZP++dBqTJgpqJtNPUiyCgJJfRnCrB+PB6MHLCNPKjJiR8LYa9t+LMfL8MX6xwkxV18EpKwdzgPwZj5HPA+n/dTjXYxbgstp0xi+Tdj0eabcAMaDnsxAwZuBow0dwb9oQCIBUXQEUru0YcHRet2gYw/4Rbf8lBGxNiSOrgpGIFCZMxguA3jdd16QEkngswUQp9E1LiJqhpMND7Ywz3i1DKLM8vgk/9shRF56EQ3G/IA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0131.lamprd80.prod.outlook.com (2603:10d6:102:27::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Fri, 30 Apr
 2021 13:29:42 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 13:29:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 04/30] decodetree: Extend argument set syntax to allow
 types
Thread-Topic: [PATCH v3 04/30] decodetree: Extend argument set syntax to allow
 types
Thread-Index: AQHXPV5b0f6fDTOIpkiJbgOTqruGLarNDs5w
Date: Fri, 30 Apr 2021 13:29:42 +0000
Message-ID: <CP2PR80MB36687688385A7F0A3DC07D50DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-5-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-5-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93bfa94e-c926-42e7-2b2b-08d90bdc0332
x-ms-traffictypediagnostic: CP2PR80MB0131:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB013152BE6E99C1A044692EF4DA5E9@CP2PR80MB0131.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XAooU/QsPx47QixN4ZHr7M5CTC5kKj02u1fIPQ/sDnhoGwCCcOf9jzw3emagPsqbvLPJTqjsunHA5GacWfp8ZgeUXXm3Y0QkjTMcCV+VTutB5U8DObyiLUkqcS0UuCeMA1GEVTaBpKrYzhe/4Yb0Q55rAEnV7zHctFIn6SooHGtXiX6FCKn7ZkT/GKN/7mRXtMD6FgoCP66EDVeY75B9WmphxIlgHZTr8xUKQQJTxQs9wQGCObx9YXOPoapX6lNb5Ij01khMNrU1qrI9fHxTywz1m/SOD5gYLfILsMs1uCsiQOSO0uG62INQc5dCt2JsLR/ih+bJ98zlcfzb/993/CDMCdgkm06KYKm6hsSQ9YltJenpucPBiJW3wlDKL3PFVLXcEpks9cTv2Mhx9t0pjac1ZKsmVyF13TN8JmMIrm/LfERzZ+qlj67gRQ2yUs8c/XSO8EIQlico46rW82ZkWPFOrdof18EtQpxVyG7yI1vQsZ61Rpezfp8K6XwXwrPf2W3PdGQeQBpcKsBUz9YUJBeHxRcWZSz6AJNvCj+GsRKn7D3vjJay0+ML/KnbS1Honz3hoLfgj0NjyEvg8IZ6WDz2o4TaQefxtcMK2wn/ZYk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(136003)(39840400004)(376002)(366004)(396003)(52536014)(2906002)(33656002)(66446008)(66476007)(71200400001)(66556008)(76116006)(7696005)(6506007)(66946007)(38100700002)(122000001)(5660300002)(64756008)(478600001)(9686003)(4744005)(86362001)(110136005)(186003)(8676002)(54906003)(8936002)(316002)(83380400001)(4326008)(26005)(55016002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oM7K+v6PvYFugP4xFckHB7vYf/K95FsHdlAs1kDjjUqBLTvcrGHK+IkDt4cl?=
 =?us-ascii?Q?V3vagEPpR8Rh4PC87h9ECrZ+NXg7b5MoqaSyPJUovOoPml8qRZjkycjzzK0X?=
 =?us-ascii?Q?UCpuD2yKMU2TLWg59/euTg0H0OHFhZ3WE8m1AkomVuE83wO1P4IQar0/y0S4?=
 =?us-ascii?Q?rU7xhpsf2Rl++cOxlhVAuzHDRZDCRaEvl2fdMhjVGoatial2n2GV6JNK5Cm4?=
 =?us-ascii?Q?rEj2Jex1dZs7MXai0nWLvm801YsG4h+dZ9WPcZNgLWG/Gk7K0kxDTeN9ted7?=
 =?us-ascii?Q?5ZMN2eJE13hVjuA0vZMb0YXf4sfZVrh2ldZT+U9Azm8nil5ZQ20wykOBdN9q?=
 =?us-ascii?Q?SqMKAj64DxGO42y7eAP7jDieo7lilgeurrlkfyfnGP3ltwlD9gmRvK/nf2lp?=
 =?us-ascii?Q?GWFpnvpzgUdiiIKNT+zoi48bmHvNyjkxTe5E8kwkhjzXT704vvbpBxDmyRXa?=
 =?us-ascii?Q?BM2QE90f3A+ueKIOef0XBr/8he6yeXXXLpjtgUpX3utzHI+h8sIvh94NRjRu?=
 =?us-ascii?Q?bNifXPtQxO/uGYthmF5sjjFbwCXkPcMk2sOyI6wpcWP/7RUTyHwb56J5zXLx?=
 =?us-ascii?Q?paeoytOjLwv/KU207Pnh5O6+aldxLnqTMljnosacSz98p3KMD7pDnhwd7Y8W?=
 =?us-ascii?Q?3pr3CGS69r0HH+r3R+jZ2AF3/3iLa1Nmk8JE7Vbo3AT4HDXKRkpXgF0USOLw?=
 =?us-ascii?Q?gotCvyh2K3qLp0woNhdwiPHcjuaD1qQDF1L1HiynSWXWaiFukS3snGkTfrTz?=
 =?us-ascii?Q?PDsKK0q32Xpm4uzwil5XoY91bIB8rO/pmCcEo9o2ZpPsFvPNDrteA3SoU6Nf?=
 =?us-ascii?Q?YYuHKLg+pekaHihdldMKLLdyVSTzeUK3398Ntya8jm+qnmpW6Yto98dWITbq?=
 =?us-ascii?Q?6mHL9zYgkszVFonvlX1QBxP2Fgcu7UpIgnHkosQh1ES34vwf/vb8pFaOpBGs?=
 =?us-ascii?Q?XfCgY7oA4NYRAToath5DOJ4bb7rfY38mZfB561ZFW/dMzKFx1clzVlb9SE4j?=
 =?us-ascii?Q?XEfAzgCbqs/Gg7isNPuB0SU+XvrBGOODIJBqLFwJYFsq2e7iaRw4qcJm0YFA?=
 =?us-ascii?Q?sEJyGTemTLV69WKOVrEvEabSy7u4t5lGFNRLiF7Wto41Py8pIJwMK33mplGb?=
 =?us-ascii?Q?KYypTbfS5Lw/bzP2EaeVv4WwHmdQ/rDo945ZL5P4HaR9qezObaLcNW/1BWQ9?=
 =?us-ascii?Q?ownZA0VjCgq475bLJvOLn/ytKBaSYsCmX9OcpVqXPbceyOKdaW0iUnda2f8j?=
 =?us-ascii?Q?ylQoGJ6Fi/SliYiY/JC1KOdsVpH2EPlMNmDvPchZVcFgyV92QcidUSuUOLo+?=
 =?us-ascii?Q?HdmRgrhL4y/sT3BbXaV6dECy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bfa94e-c926-42e7-2b2b-08d90bdc0332
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 13:29:42.2366 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YzyPwXpR+NykiQxdzQVB4ZnVZ3DW1DYxLUGq09XxyppTFCFUrGO9txKPOjVrY1+Uv7obRCUfbk+n3xs8sfki5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0131
Received-SPF: pass client-ip=40.107.80.124;
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Rather than force all structure members to be 'int', allow the type of th=
e
> member to be specified.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/devel/decodetree.rst             | 11 ++++---
>  tests/decode/succ_argset_type1.decode |  1 +
>  scripts/decodetree.py                 | 45 +++++++++++++++++----------
>  3 files changed, 36 insertions(+), 21 deletions(-)  create mode 100644
> tests/decode/succ_argset_type1.decode

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


