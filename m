Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DD84355EE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 00:35:32 +0200 (CEST)
Received: from localhost ([::1]:34198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdKBH-00022b-CK
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 18:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3W-00029Q-De
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:30 -0400
Received: from mail-eopbgr740130.outbound.protection.outlook.com
 ([40.107.74.130]:33335 helo=NAM01-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdK3U-0006fG-RZ
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 18:27:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AXmeHHlG6CITW6KnVQN/VxVWvoaoX9HUOzknMyzl58B9LttjsnGDu3EFWUMoKgXHXEFqkeQrd867b3dzRi+SA9Hi0WHIYb6wu+YZs2SJnMtavpTk1vPMaU7Hjjqu9Sshik9ztPl/QAOaevtePNV2q4lF4eE691pTkY7c/TIqv1aFeHp0hRy8bEnOMD8m4XS1/u/tp/IpV5aMd+YbBU54l4CPPSzdy78ZTyBslsGxq28ZXrq20G04HHX0yaKdIuPeNYRxCacD+qV/gz2vnAUQJspreh6UeU80N+utoYOEy5xTsZV4wFkBj5t4PTYO/92emdH9AEfmh6v2w+PXWVMZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ltoBxR9ytPa8574M7ioynAhG84t3OiCe5byC6y0ORQ=;
 b=etuYmw4mgws+nSlfYs3dNl2ga6Xo/Lj9acTQIG68+1uVlKSkaJe9dA4ym9EqYtstBR1UBbfwt/6veM2dtrenj8r3piWD23oMc8DEq7LyyP5FTjsUDli+jKCGs1+fweO2+ForU4YyOfkMOUEW9CgS8lfyEqgGLnI4xr2A5DaCFltP1AWDAEdGiHpU87kUC1NHa+ajroeuKz2YXy1i2QZG9/Tq5HURraUPfug2O8eB3QHtTeKSFifk4al5UgIReAdpQx05Q9ghSMmQGTXV73bc0EyOjLxhwpnKT0ujBdXI/hNDA9OO0lsr6z/u3ZF56Td4bgK11utqvRW6lFUapK7gHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ltoBxR9ytPa8574M7ioynAhG84t3OiCe5byC6y0ORQ=;
 b=egCj+cWIN7LyIIieUYNfJngXfystQZPNBhE1icre1RHy86nKtgk9e7tFpUCoi9IRcmhS0Wy8uR6CcwoVuybOyj6Lt2/+KFT6il65cECmSP7riybYHuGP6TNZuj7MV/hsB6FV8dyol7VlTueVs8NcajdWo2tQWSM83FA0HuFQ0T8zohZcqfjbPCk/TilgXtCqAAsoPpy6vX02I1rn4PT7UuX5z6M50KCXMGkJ2g+Vz2L8lhmIZaGHMTqd4A5xZ+HrPzztJwCnSF60cP64+3IV+CCF6SvEr62tBSlZMCHcD691HoYxZq+gb6mWHzRC+xbTGtJEkwC+Rik5JZSWtYLTdg==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB4482.lamprd80.prod.outlook.com (2603:10d6:102:49::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 22:27:11 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4608.019; Wed, 20 Oct 2021
 22:27:11 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v2 05/48] tcg/optimize: Move prev_mb into OptContext
Thread-Topic: [PATCH v2 05/48] tcg/optimize: Move prev_mb into OptContext
Thread-Index: AQHXu7atvk2AKDjvIUmJHHQGhNprwKvchUjA
Date: Wed, 20 Oct 2021 22:27:11 +0000
Message-ID: <CPXPR80MB5224BCC5E895EA3FF13469AFDABE9@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
 <20211007195456.1168070-6-richard.henderson@linaro.org>
In-Reply-To: <20211007195456.1168070-6-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6434352d-b966-4f9f-6fd6-08d99418c289
x-ms-traffictypediagnostic: CP2PR80MB4482:
x-microsoft-antispam-prvs: <CP2PR80MB4482C98FA44FB4B616D0DD94DABE9@CP2PR80MB4482.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9gPoIBmNEgH81w42s9ZdVIqcfMxEzdRKZqLaANa7kltCVVpaeNpE94uYjVQMXixYx2myEIB9uDLowB6qnYrulTp58Ui/Xq+h38teeAzGF5Xpbsf2hcHYMWCr8OG+pZO++aRgsYJ5JgKjiQEpJGwHlMCzYerq0lPV4SByXcb1NmGk3WVXkp3Yw6fvDswI8z5MUedy+O5hEItb4hisgPom/WfiUipmoryN+g3MeH736kgdhfba9leBy4ld0Rml3TKrz3ahGAn/Y+uhAsihxOemyUy41QPQE383bt1LmM3g6LTnx8EWjG4gZqBgV/iwChWyzlvh+2+BUUdsIjgwope8ZB9RQ0HfJ+2HeHN3wBgIg1J/Ta1DuckthkTzpZCfO1yfZt2Y1p4ZJcjrqy36Gj/B7A1b9M8I8IdsRByYyM2FG4x64USgPnr+Tph5ESXlsWyzhS5siHu6O+FUcq/TLHvW4QGoI8/DEPh6Nuh4IeLZ83Ak734h1kM5h7j2w2ApCnES17eJVmy7vQ9TVLwNFyUSbn5VFk6JI4WTfsBwc6Vt9AtEFOLpJIAnm/DsQMcRWCmlCKvBruqmESupG6h2DnXzYkib086Uguz2IEWjORiMz6RWSdPZjuKOMaLxWNH3rpsSGxJz93chEd11b6x1f7ixXCTQn6L9uvJbKw+nbhSw4jE2mqF7QbPxTDytk4+9o8g5xgXC6tzv6RMjHRRHvIhLcBWF2ZO/w2gk7vKX755Tb+I7F5SUadjD06pFrnr1IqQcIt84UXhwj1H9Y4y7e2ThepQnHkILhi0yevHhjLGiCn0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(66476007)(64756008)(110136005)(52536014)(122000001)(33656002)(316002)(26005)(2906002)(83380400001)(508600001)(76116006)(86362001)(9686003)(55016002)(7696005)(38100700002)(66556008)(66446008)(8676002)(6506007)(4744005)(66946007)(186003)(71200400001)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R/3HeqcAbFcEpwOmAGb9+usea0gV/ZcIZDs0ipTdoq9UqwPCZO3/8RGi9ZLV?=
 =?us-ascii?Q?j7L4HR03qDJdmmPQ1skYgD1N+nm+FiCpMisZsNEBPVf3ZdxzOHd86M8aXK/n?=
 =?us-ascii?Q?dmPdvl2egL0sD3wahGJTkKTiWI0z9p6g4Oxpqk0Ee9FQDVc8hTkxhKbfVhYv?=
 =?us-ascii?Q?aPQoi++fOgN8XpZCtcnbALJWGAWXpKrtKhnre8aBLa4F//IyQtR45UR2SxvP?=
 =?us-ascii?Q?db579gCExccSzID9Cl+9xYOnqniXN1uzcAuBR6lzhn139zZbTLj8iBqYCOkR?=
 =?us-ascii?Q?DB5FWmNROBDOAy7+n0peEGN0JAy+57jszZPCoS0EzoQcM+hs/KNPCht/IG/C?=
 =?us-ascii?Q?U1TEq0wnUEH/3KRKxAE/uHKOs9QXja949piKNBgtgn/IxAqD0HiDCWlEjGFa?=
 =?us-ascii?Q?CPOSQRZ0SUMcxwQmehMVZvT3Wxd/W7YI+goe6Yozm7EVLnF6iAMbx5gfPcP+?=
 =?us-ascii?Q?GbdG/+2/yooJI2UT/4spnMHwBi8NAHlkEliD5ck24htpk1D+ONKEN4q9M1r6?=
 =?us-ascii?Q?eP5FgmSFbIdIrakRsElJzYC434idBbb0HXSk0nhBTuwQ/mcF+BvbgVqNjPQU?=
 =?us-ascii?Q?il9wOQl7nKb7SshieBf6UkSxxkoX9d+Kz/567s9eNqnXm5wd/TUkax5G31ou?=
 =?us-ascii?Q?HkmnBefGSogH6BsQUrbFSqmOwh41/Q+JuYP67dtGGwmhXySbg5vb7siTr19+?=
 =?us-ascii?Q?nJTXr6u+fSw0LGKnJcLT+wVFpZwwmLQ5/h5iwsuKcpqZC8uLaFwBJiPWN/KP?=
 =?us-ascii?Q?2+JDA3uCtZQ1IZzR0qzw9eBIMXfN8lSNcXjL529Dp0BEUC5LaYGCazDQjf4S?=
 =?us-ascii?Q?OMO2IjJFSqoVLUNzs3uSIjwh0Yh6OGasjQhfG+ptunKwks0SAxUwkBOQwpb2?=
 =?us-ascii?Q?TdaRg9cv3nRKGYPnT+V8SsKJHO0/h3SQH9A9Ji5m6SH47Y1g9BHKttZt4YcB?=
 =?us-ascii?Q?LKvYerrgREgUIbDFGgvVx3tBT1+Biy+6Jk1+BCfurAEXYHSu0kt+Wtokw2IH?=
 =?us-ascii?Q?pChcgFp/SZtqmdq/lZQ1/d7bhMkBKcB3FPX2vFJe2okb4ILj7SBHXb6j4+Ay?=
 =?us-ascii?Q?roFpULNOvvnzaziRzq9aFZnCb1MszMw58W6TrWmSevg4wO+tgBcjMlovhyu7?=
 =?us-ascii?Q?PTmlZ0KA3veWgL2o+dBnTror+wl3qpGgORWUwe3l2calAEE0RLh0JgSRQVSk?=
 =?us-ascii?Q?Zlx98X6nkHsBkWCAce+ta4OOgKYO+kofES8Y4bb4KkQ1GMSz7a9BRLftHbBE?=
 =?us-ascii?Q?hmxfUcNlGjRg55w22IA0FuSMWX4iudeksMzCpC43W7538d02gCrFkLNcyUEO?=
 =?us-ascii?Q?a0QzuRNBbMWEg51LNXQ0tB4c?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6434352d-b966-4f9f-6fd6-08d99418c289
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2021 22:27:11.2049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4482
Received-SPF: pass client-ip=40.107.74.130;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> This will expose the variable to subroutines that will be broken out of
> tcg_optimize.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

