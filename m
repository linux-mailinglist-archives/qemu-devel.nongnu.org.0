Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4FE3A1934
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:21:06 +0200 (CEST)
Received: from localhost ([::1]:60944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr00u-0007Fs-6H
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgJ-0000cS-7J
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:47 -0400
Received: from mail-eopbgr790131.outbound.protection.outlook.com
 ([40.107.79.131]:55520 helo=NAM03-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzgG-0005nH-4a
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:47 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeC6fiM7cbM3rhGq1hOzF4xYWatPGsZnm2q+XC2F7pSs9BNqOuwSDDGsviidijB3+w3Xo7BUq80WgJrWb43HhexOYZazz6kFgVBU3Tl5oUnQMrCnLRHAsAUC2u86FzTBgk75Fvf9s6uY9IzzMju2/PZeygSBK5sRyeM6NpxHd/lUOZoPx+xedV3joxWafdk7Y/IHvYa203yCqL1DbJon2tDnxI5nPy7cUvFYMkYL4KIwhvtrSp5psU/BW2Tlou5fYgKQlyOwTpck+rlHIIWpjVnXzK4iW7MJVMsXPolzHSYsd51LT1pcK22TiAKhoXBjMUPas5hKrLP6ndHMfoAN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9uD/wKIhnUq1vtjkUWOfAdgomtJ7/7Rb7Uzdcr3LnA=;
 b=bp1ajL9kLUt9lKKJ5J4uD0Vwokgk7cwj96+RtcvHHzfu1c5MvnWkX+SwRA8aSqRSfYJ55TCOFN4ab1ppBe4f6ONaVLZ9uEVQXndsAuxRqv83IlSlLX1nqouepuwL3mkep5CLWYDjqAYgkd+5DQC0eQ2DafKuLDykJmlFK8e3AX+Vmy2BMZ7mTy9QPcxt5Ij6OZ1vSyo/INPmXr4VDFfj9z80fES0wR6LwUCgrVfo8Wd0hh0JTNDD08M1SovHYaZAMvSB/jAWQlum3P8K+hQi6wQYxD0W4bpMek0n/OkmBi1BOTQmJr5EumsyAmYu/Fzgim6oledGuETJRve+jToYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9uD/wKIhnUq1vtjkUWOfAdgomtJ7/7Rb7Uzdcr3LnA=;
 b=KHZoAfTGwS/MFFy7s2g1f1QLQeTUA0dyJVwG4SfEBe9UHMh0aPc19tQN8M11EKXMR/+/l6PKPbrePMg75IKMyKqtB/ddqXJ4o4AcIx0SbkScukutn3zIydSxvHZhWxGuz1d/3fuOKPyUcl5v2dpJ2cB0woMz+qHXYIoAFdgy/MPcmmmW/y5JEy+7FFWRyaLOagUwDvO9vlUDPWRx9ZyG9y1bz7J81b28/HoGAY9rOCTfgDzXzWlneimEsSTbDPCaP2ZhVS32PqZFWoCipkUOqHEtfcnq+vj+HvCkbbGNH34oi/jvOtV3B6+/IconAbCe0iD0MMK1xmA3SfSMSa8hEw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4979.lamprd80.prod.outlook.com (2603:10d6:103:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Wed, 9 Jun
 2021 14:59:42 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:42 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 27/28] tcg: When allocating for !splitwx, begin with
 PROT_NONE
Thread-Topic: [PATCH v3 27/28] tcg: When allocating for !splitwx, begin with
 PROT_NONE
Thread-Index: AQHXP6wLSEiLGJvpn0q4fAjSPN24NKsL/nRQ
Date: Wed, 9 Jun 2021 14:59:41 +0000
Message-ID: <CP2PR80MB36685F4CEAB13D25CDDA499CDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-28-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-28-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee34da6b-4c32-4548-df06-08d92b57363c
x-ms-traffictypediagnostic: CP0PR80MB4979:
x-microsoft-antispam-prvs: <CP0PR80MB49798656B35A11ADE9CF07A3DA369@CP0PR80MB4979.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F0lzp/dVNaRa2C3WwGOKQnDv+U4DOxY0H6p3rUex2qIopCAAHVHnZXKcckCIhnFwPGr8A7ckqfjYd1th+M0Db6g05iaVdpQbWJ+1TyHerFMANlUIRE3kJ4l4apofRMhmilOgMEHtHEeuz89d5ZhldRgPnaSQ3Hr7kjhi1cYTRMOMiKi64/XLNuSz84fz9Z+doLw0HaKT36yjb8pSkIFLnfvXUA/Gs3ecYYJl1gsbIDzxzafTGiTWjIhW4wjsDbUBbWrzfP3DKl3WhLe9/nxor7Xl8fWBGUfrX7oHybbMr8UIPupCJlffaUZGeId+NeRIkqNSMIgbcZj3GdHryu+0oB9AT2sPGrwu5yt4A9IhZg7pTNYAsIIzR+lkZioamumg1T9h99bbdiSL4omPXqCUV1nsvLb1lzZOJtqUn3JAC5bXWCwQj9vPn7QZFBxAYRYZ0oHqrqP/SZDqInp5csHpZPah9ZI1UHGcZimfyGDjL7NrlNWIfvqSfOCi2m0QYYngllsf5UoAKVjZ4dt69SnTVuLJ3nzQZsgfk1lk8yfictgUGfLFoKlrCHho91b0uIwC2e60C+brSLxVG6FsUiHGsaqfqAYTBoUp+/cGj+uApHPp21BKlp98Ch1zeRk4TXKKYCwLDNz6mUcCKZPk3QDVhob3IBr+NdngBN2NedLQUKaa3+Iy7EQyY9Sj8O5QW4j08AuQbzL06DJ2EQoQ8DoN/6MihGgsEFQa1bTU49xU9Vc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(39840400004)(346002)(376002)(366004)(26005)(316002)(110136005)(55016002)(38100700002)(66446008)(122000001)(66556008)(64756008)(66946007)(66476007)(2906002)(6506007)(478600001)(71200400001)(4744005)(8676002)(8936002)(966005)(76116006)(9686003)(5660300002)(7696005)(83380400001)(33656002)(186003)(52536014)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?subnrvtLFpSQ+br2N5QRuO2ulzLUAnOX/EgMSbCXmDIpi+8b4qWj8Fn7u9B+?=
 =?us-ascii?Q?Pp1HLbHA8RUg9y4TlAZKRt3FmZ06Yx1CDvIKxx2SpTMFbGfQWjyV1U8mdnS0?=
 =?us-ascii?Q?iVxQ+0kAGdSVy2EKWefbdI9VXKYPWNdurlk3/K9eODsn1AXF5LsPoRrQRYfN?=
 =?us-ascii?Q?5aS83s16VU1o+Bk+1aygVctv0GW6CCUG6hysLBbVkwHZ1+tx2aCYzwJB++l9?=
 =?us-ascii?Q?pZHunc+3X0rreAoe01+v56rC1ciXSvScrh5BmQvi/YkNxmHX68U6nayNRoDL?=
 =?us-ascii?Q?uDrCgYpqOMHMko/xk7U4UQmflm/4yLZGdkn1EwI4of5x+s01xMpejipiBt+A?=
 =?us-ascii?Q?N9OmlQzO2Rk5UChKiHaXipiLqEfcnxcd+GhyE0qoOr8LgmQY4+5RLbKJ0psq?=
 =?us-ascii?Q?MucjvAgulJmRooM5UaPHjxgdqT8X0KguaKVmKqYZTd+yQ7pyKjGjO2BJ4v8D?=
 =?us-ascii?Q?odFy+CO/VJ9a+rlhZRYyEaSTIe1u7EGZYMmv9t4re3pnEa+/mv3HAwKbP9/a?=
 =?us-ascii?Q?ZxtPHUaZnBhueeFDKBNcFbREuxONL5dT2fsaKKKjd1MTK0gTgbaaqDgBpzsD?=
 =?us-ascii?Q?8nSNURdk1BySC5eICoMvdQF9boJ6LuhuPtNJSnAvNHdYQ4JXpbGs99DN9Yla?=
 =?us-ascii?Q?Edxf6+twCxpnAmb3nzGzmilHVeI9+ZpsEXbEx5F44J+x1f2VC2C/qzSMSSPd?=
 =?us-ascii?Q?tOhsv+Bn+EKtO/PXtdIk7PG+rnMsyuIEkDCgUjHZKJlEj4Av2DPy2KSV6Xlu?=
 =?us-ascii?Q?pFGHirHIOu3/rhD3qBdSxI4L4RVorMXZybGKPw3fIdNlMfblCxUU95r/Ckq6?=
 =?us-ascii?Q?mG9H2rwctOSe/vqNzchLK20JFqOfFjUrdFJEf3pK0KchLdXMVFwVUciEQPer?=
 =?us-ascii?Q?q4J3ZY052xQlqmhn+RefozxtG3tKgGfZUhiJCg2qr0hVRwzHSzAKFm3WaDtC?=
 =?us-ascii?Q?vVgWFnOali5R1P/9Ol2VmdwouVYiX6k1rCXwJ2PNmDCdWPVHyw+ACsrXxrbW?=
 =?us-ascii?Q?Wwy7q0WgzCD2Wf7ETUzSrw/UgnK4//eoK0BNhPWe4xUHu8YpgbVUfSbFcNb3?=
 =?us-ascii?Q?wLq9ML0dEXm8fYU96m2i66DFBgdbqasm4lm2e+9tl9yElwRIG+IiVy9iGv2d?=
 =?us-ascii?Q?2tK+79YaS+/1QFvkcJXgIJ80HGQcH/fpM4OsTcC+zIbcl+2YhN4ig/oUCYtN?=
 =?us-ascii?Q?zTV6SLUhkl+quhvVuaKToVJeDABqHRtnbDh4D3MkrQunIqzbJj3EW22OFadt?=
 =?us-ascii?Q?LfOG3kEHxeWfZBnZCth5g+reORr+mOEq+gauDefFXWVeib4yDQxEmk0CHm4u?=
 =?us-ascii?Q?m6gGceHR/FtDnb42SZ0/X39m?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee34da6b-4c32-4548-df06-08d92b57363c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:42.0194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QVtLbxqQXn6zYmIHqcIK7A/OTDvhDh9GDOvSVt+KbkGgH2dHyt/VmNwWLFGJZaoYj967CSDVqbYoVRpHKRb5jg==
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
> There's a change in mprotect() behaviour [1] in the latest macOS on M1 an=
d it's
> not yet clear if it's going to be fixed by Apple.
>=20
> In this case, instead of changing permissions of N guard pages, we change
> permissions of N rwx regions.  The same number of syscalls are required e=
ither
> way.
>=20
> [1] https://gist.github.com/hikalium/75ae822466ee4da13cbbe486498a191f
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/region.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

