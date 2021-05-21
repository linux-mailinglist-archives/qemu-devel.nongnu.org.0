Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA6A38C7BE
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:22:37 +0200 (CEST)
Received: from localhost ([::1]:35780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk56m-0001QW-2N
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lk54B-0008Sw-1T; Fri, 21 May 2021 09:19:51 -0400
Received: from mail-bn1nam07on2096.outbound.protection.outlook.com
 ([40.107.212.96]:44270 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lk549-0003gZ-7f; Fri, 21 May 2021 09:19:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ld6dST/YPBm3dmmo5kPmecVL4gN2bfsyeNveleABGSMydoeOSst9whbqgRT7/ldviqLAkifiT+kaYRNLkruNYpUm7nDK3TFePNnP3kKTfEMi7g4TC7yxldNxW6agcHo2nOWqUQkbSnpLJVVbvbhztxoQIpidneNVYbdXsliUjUkmvAyaNyab8mEmICzt0LbmDsjLTzMtda/gJ+6YXcEx6XkK0/WLCUgTqJJ8iL5PxAglad2ce6OPOwgUQNDLZ4JZXKi8DHcUCQEeuGGJucY9Rbm11dqyfdcduzAHAar7kELYGhOKRRa1g7t4xGU1dLbHXZuguD/I4iM+UrzJ+dtQVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q81PNOpydaduClHmdRQLMvDlyIpB8H0/fKyk4EzsLjs=;
 b=O+ViJnGrSOuBQY/MyXlhbDIDIOZuBfewsPmsK/mBP1f+lYAXcx7S8VONeJ8ZEE4bH7yjs7RugjFon2dbEJOGY78dRDOeSXGJnlZzO7dcd5aleBADRLNegHtWvulKvfnCHlTv40NL5N66LIxJhI1NUxftV1h7b/sd9tCVpm9OabOO8EKRfnUAXdruyoWSkwRtZ9U/IoqFmNF2LZ53OlK3opbYvtiwd+X+6T2fzL77w/WdypV5JJMPTsyC8W8TIm0UJp0jb02PuJqROeuhiVdKlerC7kznDUG0rQD26V9GsKFeaKcbSM4dfyqA5H6hbFMewjaig7JV70XRoMNwQIjq2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q81PNOpydaduClHmdRQLMvDlyIpB8H0/fKyk4EzsLjs=;
 b=eQYTMugowx7mXolDfGeigBlcIX13sNsIAA503NaLknjQCPf6KdkwMae3UgkwXJJYHrQsd8/obbrhk9x5Um/egcnRLlRVQey48ea9KUxRoCQlWP+wfBLHe5Zn8/FysRsyv/Q3MV2zbJk0zNxuzyuS+4CHCHcmiQ0mzO5yd50om/fHkSvui+cUoRdB7EyAupcoWqabl1+deQ30dxAHgK9GQg2jRQNXRXUK+bFNF5JSFVTTEhAfLHGYXR0J80kMQ+EIVsSQNGcPfuiKJ+ffd1QdDheKV17RnsS+VVDT701qY9Gyi4GGHngvY4PBs3DbBm8nHrc+FNBS6d0UqkIvyvjSxQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP0PR80MB4979.lamprd80.prod.outlook.com (2603:10d6:103:26::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 13:19:45 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4129.033; Fri, 21 May 2021
 13:19:45 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files as
 C source
Thread-Topic: [PATCH] scripts/checkpatch.pl: process .c.inc and .h.inc files
 as C source
Thread-Index: AQHXTbGhpGcdkYFLGkiXYWJlBXkga6rt7B2A
Date: Fri, 21 May 2021 13:19:45 +0000
Message-ID: <CP2PR80MB3668FEA34CD5D69348F3F75CDA299@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
In-Reply-To: <20210520195142.941261-1-matheus.ferst@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [177.9.76.236]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b10b07c0-ce32-4299-9454-08d91c5b1a52
x-ms-traffictypediagnostic: CP0PR80MB4979:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP0PR80MB49794653A8AAE10DDB7E81C6DA299@CP0PR80MB4979.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1728;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fh5RfU9+jtu19FsF0CDjSjLgzhLQbYdlAn/xLMHIGYM1urOoasb/6pkWebGBW882bQMLQMbk7JsBGKyl7MKhv0RDIHY6RsLhkPkhwWW6Bb6DA6xyPm3EgQ1ebYCx3Ui3RwnY/0hnKDzyV0u/0XzJFI9qkTG2+No/Sw1M5OgCYB0pxjVhrpZrvYeKTccqDMLbk9s+7ir1gAPOOggXVKqXBw5wscCPeqpkcOEb21jhkbJoAVmAGmDu22QuHx6G29JtNTMa6uWMhgQekYKZXQ0r47OIPDcirvM7pOoe65FkWbFzOXwU3AgLDaLQpxp4PmqgROGY7k6UMNCTVtlRk2CctVdEhYdKJmhwm39jOHayCarGAB5yxtUuOoALj86iuUT9kjGWbAwUi3fwzLsLeOs957zu2QJz0jc2WgXuYsms906D2Q6Y759nDwFA44g6jmo9aewC/bVE23W2qXq+8LchXpKto9D0/97A3hn00Y7zMpUd2A3EninITyWu6v1MCHxscIm9Xjiz9dCLOeTJGRhlI7ORhYvEdwhfq+Wyar6ncwO4wElcUpePSUl47jefhc5Cc+Um+oWH91MdgcPiZGey8/JAh1lDiDOLdMvcivuLcmYVvIMFFNSIbvc4jwhRdba04y9zr+v5ItlwRY0BNrSBXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39840400004)(346002)(136003)(376002)(76116006)(33656002)(186003)(66946007)(66476007)(110136005)(8936002)(54906003)(7696005)(66556008)(66446008)(83380400001)(478600001)(26005)(107886003)(64756008)(38100700002)(122000001)(316002)(9686003)(450100002)(558084003)(2906002)(6506007)(86362001)(52536014)(55016002)(71200400001)(5660300002)(4326008)(8676002)(142923001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cAnT0o7YI0MP2qdfOXF6AU8GVbJAfTrR8dUV1moyAfVdhz8WZwwYvlZKaaqz?=
 =?us-ascii?Q?hwkzdJjxZfhNVcCfKDCIPTzuBcFVUIZ+nQIikItByAUoFBP79E44YtQCGpSs?=
 =?us-ascii?Q?k+N4CaRWvBh8xzW8n4pUT3jcezKoo+ieKgyqP7M21uaH5jF6J3UwuDtM8ji4?=
 =?us-ascii?Q?Auas6u8ygDU0plgvvpa6nlJHiHebxY2YcYdQSAZ0tt8k7XCU1amwXdEFN6YJ?=
 =?us-ascii?Q?Jx5wn8/owzvmzcJ3KwHkcGRGLZkjaS1jLHn/d9XmA5hHwng7yQJXYljBMOe4?=
 =?us-ascii?Q?euuKGj76I38MsYKTkMVBhVwYE0QoD97HorzhlVBaWZA/DR8+9LIRUfa76vHQ?=
 =?us-ascii?Q?icTuNhuC62ajsvcJDB64elf/cNk4yb7Ik8eJ6/Fe1pkueLm9QLqWRf+FajRt?=
 =?us-ascii?Q?6aPTgn90JaM+7F7nV5kFiQ4PZOm9WZ7nM/p5i+oP759uaNa6Xaa9ZG/rg9Sv?=
 =?us-ascii?Q?gaWLoXTjrGXTEDrFtMBSaOxEp55R6NGvdZQe8xwDwLDmeuf1rnbni2OOHwdx?=
 =?us-ascii?Q?N+tl0J6ZkW+Werfl2kFQun6epj5hiUrtTGItTC/cLIpE53OHZoC1I8rZk+07?=
 =?us-ascii?Q?nuZqbO8CXlcFog8+AcdC2jLG60rWzOeF9dKh1DEEVNiGfIoR0CnSum6FNlDW?=
 =?us-ascii?Q?O4AvRAw20h717UeHlZ+9C/nksWHpd8OEBNevL7x9+4wvo+VfDtJw5yEcfPMq?=
 =?us-ascii?Q?rfmWmrUv5UKhB4DyL20qOIjuN5fS0xcmLd0LhWzsyC0M7dfytqePNnjJYDQc?=
 =?us-ascii?Q?L4tAq2ZxBbZDAKTkFF3HQIOlzTQUh85XgVnRLZFoTNBLUPRgRXLwvfXvHYJW?=
 =?us-ascii?Q?pHOsfkNxRsYi2FaRRaoGAI9nLf05OKeci9u3knt/xBCFubkLwnuowOWVB+Ox?=
 =?us-ascii?Q?sD4GUoBToAcZkviyax7yBzjpDsIV4Q89SJMf+J96r87EozUl+S83Ut/49Goq?=
 =?us-ascii?Q?XRLCdMMQW9Z/4AcafUiSilvgeSJ4H7PaGgUQc+GlRZIehOo/KduaAMLZYKzR?=
 =?us-ascii?Q?r41X2fZUsXG+TCdfdGE4b5HNY384HAXan7ydENtQIMJzlqwelPbZsvzZx6Rs?=
 =?us-ascii?Q?JBVQ0zX8IKjxWR8vXJKjMVwisF4LNR8xyX5Coq1zmTIDj6BC0+3HOpcqhts5?=
 =?us-ascii?Q?+ZlvGy0l1C0HSOgCtWNyiGsp+0AOOFvi0fgd2SOByRZqny9TdRZSmiuN2z1J?=
 =?us-ascii?Q?S1guPXYrZ0KCORARM0TIS7af4mggi4ceKllgV7ZngTWxuE1rym2bXp9Blj9f?=
 =?us-ascii?Q?+NByiXsmy95sw4FD9VJMCq7Jnujy2OX2DunAzUOekgVSiBnizgSwo3Eom1zG?=
 =?us-ascii?Q?/Vc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b10b07c0-ce32-4299-9454-08d91c5b1a52
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2021 13:19:45.7637 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u3yTTLwpo/48l+ZOaJ+cPxYpsLA0HW7Y9kc4LfVjNsxjxAq1/A4BzwjBzF2/UBJBlpkeWKFu/HlWf/96Eale0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP0PR80MB4979
Received-SPF: pass client-ip=40.107.212.96;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>=20
> Change the regex used to determine whether a file should be processed as =
C
> source to include .c.inc and .h.inc extensions.
>=20
> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
> ---
>  scripts/checkpatch.pl | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


