Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C6263A19A2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:32:12 +0200 (CEST)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0Be-0000Nx-UP
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:32:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgF-0000YD-IW
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:43 -0400
Received: from mail-eopbgr790131.outbound.protection.outlook.com
 ([40.107.79.131]:55520 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgD-0005nH-D2
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GOf8PZoxQwXmRBlvdiaPFq1Pr2JsfiQdYqCUjPWjYY2GsHcjWNnCasYmI15Md/w4DT5i/Gv7m5oNk1YYj1IqqKPAfb6dZgl7s8VU7xddLrZl4cebnrFio7DWhHnbO8HyCi5XTnbL0ZbEFWqFikWIPv54Hl2h3VOOsie9Yk29SM2QTT/CaDqNLbweBVqHgX5SFc4ls5dWkoHF6QAeZMjVpeJlcXAWs+ZMs5tDYIa9qz/ktxbVGnsvQyhAQ1Hi7amTtqMVvPMAsnPNDAj944Ctwhet0a68hcdhKLXxhSOG74cjAnSjvTN5KI22gT5ufE9r6JpiJcX7AvT6FTzb+5JEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9dErpPG0+BH3ZIXwV3OGzl73fvo8lwIojdvsdwP1j0=;
 b=XiZoIwaQFq575faabHnTrythLAU3XMxzjNZPh62wpMNScDuLJ8vHeBR0yBqM8Xu6PkVenPUFMQ67v2CVBOzKfH0b9FTea0v3iAcY2TVViCY53J8xOh6DHQtIQaAq0Glg1Q0aNvlmJycwN3Yvysv38qHmNxlHFfhMQmkA6u7wP87KfrFIX9D2McU9l5g0cNOvIKrEfzEeF7qw7BUYoIL6OvbFReDHRkFUTISpCdUKpWGdGMr1lIm9QPYhxs5t6DzMiiAmlST6V/hkjP3SkZZv7DikOfnhH51s8Dam4H4Lq4F6J0YSTJeUdCLMjLbSgf6zU3HacJ2fllklK6LEWdhPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a9dErpPG0+BH3ZIXwV3OGzl73fvo8lwIojdvsdwP1j0=;
 b=GeGeD7SVYAuNb9MuwppvuMb8/YzjZlfmrkfhFXuI9JDrnpOjFPNUL+bCX+anxolyIU64Pl2lmP7iv9OsQXiPIY6uwocW0zpUkiS5HigqRIlSzisN7NjQLIEsD0jWx/sXrKO0leD+AQRQTAE7M1TBzWOQKKv1/eSWGgcXw+EKaCOROommRIwjKfYhzgQifAyz490I9wwMQ7LS4KWCALdKICQcs0oGYIHJPAHHZfn/t2oreG08s6kKkjO2GwnEmoVaPSNP22xVAGKUH4o0jRiggnDlqNBk62VsmrfiFXWFrp+xEjdpMyeq99LO2K5SWH7Ax13MwtLLyjVrXiWSlyTOAQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4979.lamprd80.prod.outlook.com (2603:10d6:103:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 14:59:36 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:36 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 26/28] tcg: Merge buffer protection and guard page
 protection
Thread-Topic: [PATCH v3 26/28] tcg: Merge buffer protection and guard page
 protection
Thread-Index: AQHXP6vuz9k3nRbx0kOR2BgqMY2U56sL/mRw
Date: Wed, 9 Jun 2021 14:59:36 +0000
Message-ID: <CP2PR80MB3668ABEA0A5665CE059EB930DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-27-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-27-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc426e34-d631-42b6-2e53-08d92b57331b
x-ms-traffictypediagnostic: CP0PR80MB4979:
x-microsoft-antispam-prvs: <CP0PR80MB49793FB67D42CA4B43DF730DDA369@CP0PR80MB4979.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0WXwGdPhLQOSJ/sAquCvF+BU5uA2HUMdBc2h/fhGpvNHNs6m9RNRdv9k8wl9iKub1pUh05xlMYXCBwoAUcyKVQtMY1/+XA6c3/DTwY6vsuKBYmgKPOaTqCSQWmZrtQUGeiAUhYCXy9sf6JoWUtlGwWLKsjsSlTKDUpQrl8ZYp6VnDYjek3loNOVNKDLHkFH0FzyxWjF0c0NWY0vI9a7Vcvik7BQK2Q/HB3CkNlukUC0cTc+4kNrFLeyXvdvrjdVQhzZ/dR8HhLQSqscdOX79df6ye1Y9isnBqKtBXBCWr2q02XfApbdoLL5J/YyXlRbHQ8MSI2v09bOhJdfpdtfgdBWeEZKrGJ3JDFNeD3crH9b5kWpib1p807ld0KuI3fGo6GWyb80Z61SEXo/0Rovrfk6+euU/JEIX2Yxn9hOhr5AQiToKVc1fz1vb6fZfnLdDpUw2z2z+Sf0jeuK8JYVAoCUALYtLV3JDcYAGl/nlGdl3pvKcTrTEeFMJpFZ5kyTctQ7LEqsdRiCGkpiZdDeoRpmq7/Jmseg7Q3sc33ty0x/Dziqo2pDZAeUKY2XwBc49hH6+hZ6ev1gJRJ4gpJhnjVd2rmgefnRJyoJxfebZ53ncjkMV6iLGm5WX56QzMdnJ3r2ansT9AbNbUgzLEyiCrhYb4VFRzjf2lazYd3vhSQ1n0KkPxyojEAw8G4XeOOGJ5vfpj1m5w11N6apGpaVh15SXVy7ycg42y0IGkimQjyE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39840400004)(346002)(376002)(366004)(26005)(316002)(110136005)(55016002)(38100700002)(66446008)(122000001)(66556008)(64756008)(66946007)(66476007)(2906002)(6506007)(478600001)(71200400001)(4744005)(8676002)(8936002)(76116006)(9686003)(5660300002)(7696005)(83380400001)(33656002)(186003)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?za7FUTwmNlDFnuTSD+HKRImU3yNjhRvEqkr9W+RGCCv0CIv28cgUICHUrZsh?=
 =?us-ascii?Q?TeBxEbx3sHGxXfB7TcFGeL5JHcXC+Vo2Z9360hLlvPl5x4OvLRo3lqMyxKX/?=
 =?us-ascii?Q?NiEoa10U8Q2Mwn2p5V6g9auhya2w0DVN6WvJ6Xg79ZOZt/WUtH1ysBMblbGH?=
 =?us-ascii?Q?0MgYsXpZsGv66YIaTLeL39aoqZunE/W1NEpqPbXajIWCiX0NMmnT5bfuoTLt?=
 =?us-ascii?Q?aYs12whebGcJmTmuh35IOHUWWLEQMpIiJS4KqaynBNbxURh+NVfI9C6dQMPI?=
 =?us-ascii?Q?mSc/tuHWR1M30IiT0Veu/+lAn1nfS37ghI7Nr4StsLC70NJJGbXzUuzvhaJa?=
 =?us-ascii?Q?3A39SHMKAfD4UpFF3cWH6K3WpR/T87Gu80Rp5fCX6KIvPHuTMoHApL1XODdj?=
 =?us-ascii?Q?Kvp60Ffpy9jj5VSB+uzBlzkv+GmEvO4DhJBGOjwow3K0At4bDPvjN2nr84v5?=
 =?us-ascii?Q?Y4O9dizWliVyZX3ykpd0X8mWcU1UGf9+Iv6ViS5CWkn3mjNsPUilwuiXiRrQ?=
 =?us-ascii?Q?3joTp+cbAO3jf0Z7nUlg8yRClbFO4m22RT7ecxq45Ps/rUsgm/g0zDmL5DMs?=
 =?us-ascii?Q?J9+otjERIYtvlua1fuwFanZoW5f9FqMRUprbrTgsQpyVHnb3FUQ8ci0Ecdfj?=
 =?us-ascii?Q?sPKFmCcuujT+KJyPF5UfV5chdQw3todPzL5JTljfEWAH2tbn9XlqKSOEFh8V?=
 =?us-ascii?Q?Skc3oyHFkC+KinxxwGRp60i1n4SM1tu8x260eqBN8CoArmxqXVTPrKPLkBfv?=
 =?us-ascii?Q?p2+8FBXKK+ivIEuNVFW45PwP/Z1HJfXU+viIwTMi6b/6tJUG1YONZOy5oBIW?=
 =?us-ascii?Q?A61mW3ma4zMrGAvAE7AmgEkXUd8eN4M2JEEyk81NNtD96E8E1ttYdMKZKJna?=
 =?us-ascii?Q?BzMal0A7XWZxBQsInuIzcjWnEZavFUnMFmvs3hx+NlFSPOFAznpTVOFUo38a?=
 =?us-ascii?Q?zd6RuttBYeU0wzi9r4CgBiGL04pElehtb4TgNJGsT78wPU4hJoe8hAwTZU9D?=
 =?us-ascii?Q?gxXLuU9Eqwxic14w1zKnpLGe8Ro3AgiSWAakYFk9LFE1KOWqQUBQA9xlJEJm?=
 =?us-ascii?Q?+aiekWruyasj21+tISTJjv4DHdjldrfQobpwPyXRgX0eyuL3UsGgOyAUvi10?=
 =?us-ascii?Q?u55h/0tH+VlXNgb2idkBL8y4XtaTby/s6BzQxN7xKD+gRccS6q1BNafmaEjl?=
 =?us-ascii?Q?o3zpUYF1P6AKwOp8nDpYaCEGAvAgLMAahYbbhpLsEMk8jXoVAze8pbdb+B4s?=
 =?us-ascii?Q?AhqgsZ2FcN3XFw6fWB9YZM2L9uiz9ziUwQBNIEZyD6WxiLkBa6IFT4zwO3MT?=
 =?us-ascii?Q?ZbWkvfsL6OSbrtOZr+FSAb+M?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc426e34-d631-42b6-2e53-08d92b57331b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:36.7965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VZHWHgzqpNiz+eH4+/L6oGLctYEYhEVIvnsc5nBFlK4MOz2+1AuowvNi5bqwydTGGPHo4jIanb3fFQnzOVtOjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4979
Received-SPF: pass client-ip=40.107.79.131;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM03-CO1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Do not handle protections on a case-by-case basis in the various
> alloc_code_gen_buffer instances; do it within a single loop in tcg_region=
_init.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 45 +++++++++++++++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 14 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

