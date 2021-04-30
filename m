Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F336FA24
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:29:17 +0200 (CEST)
Received: from localhost ([::1]:45102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSGi-0005bZ-PH
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:29:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcRFH-0005qM-SY; Fri, 30 Apr 2021 07:23:43 -0400
Received: from mail-bn1nam07on2124.outbound.protection.outlook.com
 ([40.107.212.124]:38786 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcRF9-0002yU-PR; Fri, 30 Apr 2021 07:23:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPQ6+BFCdBX8+IariOTA9pQ0fccvPO/M1a9Rcqm/qSS4NohN7iNvcjJIKE8XF1OSkm1xFlQ8wV3C/f2ymmMxH57gByL894KGdAsXkzS3u/M9UDhmzjNGZwQr3OOvZ/MRDPavxF932/LJ9he9+ISdgmYejNI8AYbCq8oxKPUfW0qUgrrG531ikSu8fhb5x00niByn4YKu44XXCaEsVS9gD/mNA1GDSiFEE5hGzxZ30yaJ07/AM9K0y+XPzBcx5ZfetaV6MmQPFs1CfN1L54W6qYDoVs20nDaPsxSSuadV/Eh+lO8DEg3jx3azYCQY2NQMgB9YqvOjx/AkbpPYyG8vWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1shyGD6pjwC6XEy8W/sO3YgXF8jhWRyZxR/h31dIKo=;
 b=S46GJKeurDJmhBbsi6dHxIzyk8eACDqdcxxjEfceF6BrIvS/NMQ9Xmsg/uregebhS5yNrbIfgLZC9hrmXSNsAOv6mXL9gz9T8SikUNNdelkMBqGuksSPfW7nQbkmwYzc58usNPBiUJRHY70GVkkdxyZ4zZahA7fxthhb1DkgSwxu+qwkzH284x7N15Y0BK7Mv8JzpIDSrslQF82xQGS05bcVvMuWpx7G/Wp9Dn2MXbvkO3I130svKvdab/n3OhDjaMQkECgZeiELIhOZtS+8z9T9oCGmSTkiORijGK/DnSjV3NdNRwz4FLGvKOiNeidfKBd0TMxLPQPng5scAcrvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1shyGD6pjwC6XEy8W/sO3YgXF8jhWRyZxR/h31dIKo=;
 b=0Z8xtPqeEKFCWBk9Apt4DNb3Z0FzAmq34LQ/Lbeduk2kMBxhk1Cj/E0Fn/s3OkzqewPdtd1IjuSRobXXAYLETGSlC/W3JcIZ4BMCRjc+Anl8lpKnWyPBHX4MiNcnBsZypi1U9qdIpNY1DbNN1Rr3E1Ojml286OUNCteuHHEQAQOTVEB87nM61Wn7h8dbyhTliViEcZ7ofwaXyBIQiNh3pPcgBBjfx6LLdpPg0eKMXe56ySZv8fn4KX9Lr7tz3FEd4KnKfIoqzgRmDvg8giozVRahBBwWFh0h8Y0UhanOA9mGOQbjXFa7Z89cwO3/CEuNqfKUNpT/HZzILVjGzR4Q+A==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5207.lamprd80.prod.outlook.com (2603:10d6:103:c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Fri, 30 Apr
 2021 11:23:29 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 11:23:29 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Topic: [PATCH v3 25/30] target/ppc: Move ADDI, ADDIS to decodetree,
 implement PADDI
Thread-Index: AQHXPV5k3zAZHai+oE6zYD4tIOrCjqrM6yQA
Date: Fri, 30 Apr 2021 11:23:29 +0000
Message-ID: <CP2PR80MB3668052FF0C559D6D092B0C7DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-26-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-26-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [187.10.24.48]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b91723c6-8c62-4bd8-e608-08d90bca6174
x-ms-traffictypediagnostic: CPXPR80MB5207:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB52074E7BF81EAA9C8CCA98A8DA5E9@CPXPR80MB5207.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Soc/SkpIDWxnsbZIdCuVPcFW4t7nBMScEsOmVovwOnz6an0ZwMYa+3eUxpqs8Iu1xQ4eaTbmOmLxmHBpwSEgm/3VuxzUpqBcVv5zIJ1Gk105fITwFFBqDsA+SG+E+oPeF2Rx3Fl2k+1RZSS3geGZD1euVaVfx2sMC9ODvL9UpZePURG0yEhHcubNvX9i5kBgUFYH+tsYDIwA6xocNWlxlxNTNQbhvEiHH/+A01uqGKm4C86RITLJ7orZvznuOJpX6gMaESoUFRyoV3dnxSPKNUkZIpiIwNYPtuAxy6JroS+QBxFV5+0YNdzqrm0J3B//ig+nkftaD8nny1Tcf2i3RYwPHCPY6+js00BBjH5kpDuX5BxTUFH3p9IS3z6BUmC2k/YdXCK85Hwm3BIb6YCgPJzBd8Gu4nWTbWd4K/N9lVsuw+zx3Cx8LEerocd9RZe6uSikM0L4L77efY5rp143Ldq6J+W/PXIYrF+nUoAn8mlCq6mDq88vVSKYpIfQazitzER9LEEOVCOuoXB37AD6WKmgbl6ZUo3oT688J5IeA7MOukQx6Zhrvo4Ayl0o9MhN6O1MM1LPvUSVk1kzgUtaoZke8oQyv3Gh561LcOtv0/9uyuj7CTtxybDHRlAeYmc0eiyGPvKj5l8MbfzR1og0gFwNmiB/9Acs0/3zO2uFgomeTeMt0fXvJ3jjWrorfnkR
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(366004)(39840400004)(136003)(376002)(396003)(9686003)(55016002)(5660300002)(7696005)(38100700002)(2906002)(122000001)(33656002)(6506007)(8676002)(8936002)(86362001)(71200400001)(478600001)(83380400001)(52536014)(54906003)(110136005)(4326008)(316002)(186003)(76116006)(26005)(66446008)(66476007)(66556008)(64756008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5jE0TyZR6NcDbgOugcZEkBcMqTLxBp6COASS5Sr2au8cBEurroDowJl78USg?=
 =?us-ascii?Q?QRupydE/2rWCAGCCT9077EKUu80AVYRc3t8Ub1aUgPLdwsQUDhg8ErM6V0bj?=
 =?us-ascii?Q?DreoGo2uRBc8IFLg1Wq2YPUP6YtzFpmV5/aEy682Mhf3pL2pwGmap0Ab4REW?=
 =?us-ascii?Q?+eCaw6U4eSWhQQqXDddqgX1oiGdjV/3pQGY1u2in1fnVkYROK6LgpFs0PkZB?=
 =?us-ascii?Q?AE1jPa6zSw9c17c/QvKfWYLPPBmHrzv5+2q0XdBKcHJh2uoAaaz6PCpx0WJf?=
 =?us-ascii?Q?pdAzo6BYhayPF3CKtlfeLwRkuDd6Kps3UcL3crfJXtdw7l1XVGOfooKnZlJw?=
 =?us-ascii?Q?+eqd/FepCRuYflCFIp9scEJSkAAZhaiLWYxY0obv1X/Zz4LECGoHk2f5DvHn?=
 =?us-ascii?Q?LgQaRPuxzdUn1JpZX2NGIONHygXqJS/Uyio4VNl/Q8yUO6Cn2ePHvgAw7L7n?=
 =?us-ascii?Q?p1o1JvdsfpddxTBqk2/bxS8NqR8s9EfFF+3zB9iQsoyH4IMzzGYKZMVr0mlJ?=
 =?us-ascii?Q?s9waB1TdjhIGNFR1LM/P7rx5/EjCMiFD1953pxwy459gsJLM9xve4iunfMWq?=
 =?us-ascii?Q?J70S0NmxXBJvbSAwmQf4fI51ePCYkrtoxYZ40PH1NiMcQ6znHr7T+j3pXaRG?=
 =?us-ascii?Q?BD21P5SvOLtFxtV6Vz2FkJa0YEZc3QtmqlTLIBMqGuSJj19/3iDJrWEAyUrG?=
 =?us-ascii?Q?g0rdUML9fRbbUi/on4d2sTFyXwF44knL1pg6iJKkLN+izt/p+k49VDKOf7bV?=
 =?us-ascii?Q?q9W7LbH6/RfRvqiHSjwP432PSruxXNuHP7WQPqZ3BKUiHa1Wz7gRhluCdAW/?=
 =?us-ascii?Q?j1sw1dQ2MVQyJMWszUpWV0BlX6CuLPSNlnFrbv0fu8pii48TH2VBJr3YTKfP?=
 =?us-ascii?Q?zF2NivGx0xJBl4yE+77wQdSyrCmGLB/dGq83rlOFbedYz5zQCsfhmi7TMbt+?=
 =?us-ascii?Q?g7eNuX3mJbVRiZsBev8gY6IJnfzcITZJUEJCMoN0NW6yBshgTBknATZRY+gE?=
 =?us-ascii?Q?i8gB/641VnpG0Li9790pRKhngojL/raYTtMe1C3t+yIS8fLCy37CN9nm8BAL?=
 =?us-ascii?Q?KuLD+QV4obkOFiOQq8ELYa1sXLUkadxGl7EbNohShh2sl0bavD9seVYHKqKj?=
 =?us-ascii?Q?/9V1qkgH+vHth+XtGAu2rAzVq9fruhCppCcKwDkwip7vO1NzK78a+ABgJu+5?=
 =?us-ascii?Q?qolKfCiQL2i/pjxYN4wk44TNndPPklDiXtumFoaX0zVv1OjocwAJZcM157Gx?=
 =?us-ascii?Q?Znb1VfheuVGnZgpgMuI4cX2s+2u4oZhpol6Ytoih2aZTuVh8sm19+t6+pzao?=
 =?us-ascii?Q?i4LImcqJesoJzP7unxnilIZA?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b91723c6-8c62-4bd8-e608-08d90bca6174
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 11:23:29.5196 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xlqX9x9rj0c4lGHjWDPxZFdPSBZnQKR0qih0Bwc35WRvQSwXT18iHA4eBD2cmcEEs3752HioCpx/m2lHq+/isQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5207
Received-SPF: pass client-ip=40.107.212.124;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
> +&D              rt ra si
> +@D              ...... rt:5 ra:5 si:s16                 &D
> +
> +# If a prefix is allowed, decode with default values.
> +&PLS_D          rt ra si:int64_t r:bool
> +@PLS_D          ...... rt:5 ra:5 si:s16                 &PLS_D r=3D0
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            001110 ..... ..... ................     @PLS_D
> +ADDIS           001111 ..... ..... ................     @D
> diff --git a/target/ppc/insn64.decode b/target/ppc/insn64.decode index
> 9fc45d0614..f4272df724 100644
> --- a/target/ppc/insn64.decode
> +++ b/target/ppc/insn64.decode
> @@ -16,3 +16,18 @@
>  # You should have received a copy of the GNU Lesser General Public  # Li=
cense
> along with this library; if not, see <http://www.gnu.org/licenses/>.
>  #
> +
> +# Many all of these instruction names would be prefixed by "P", # but
> +we share code with the non-prefixed instruction.
> +
> +# Format MLS:D and 8LS:D
> +&PLS_D          rt ra si:int64_t r:bool  !extern
> +%pls_si         32:s18 0:16
> +@PLS_D          ...... .. ... r:1 .. .................. \
> +                ...... rt:5 ra:5 ................       \
> +                &PLS_D si=3D%pls_si
> +
> +### Fixed-Point Arithmetic Instructions
> +
> +ADDI            000001 10 0--.-- ..................     \
> +                001110 ..... ..... ................     @PLS_D

I think we should reconsider using the same .decode file for both 32- and 6=
4-bit instructions, to avoid duplicating argument set definitions, and to k=
eep the prefixed instructions close to their non-prefixed counterparts. For=
 ADDI/PADDI, something along the lines of:

&PLS_D          rt ra si:int64_t r:bool

%pls_si         32:s18 0:16
@PLS_D          ...... .. ... r:1 .. .................. \
                ...... rt:5 ra:5 ................       \
                &PLS_D si=3D%pls_si

@PLS_D_32       ...... rt:5 ra:5 si:s16                 &PLS_D r=3D0

PADDI           000001 10 0--.-- ..................     \
                001110 ..... ..... ................     @PLS_D
ADDI            001110 ..... ..... ................     @PLS_D_32
ADDIS           001111 ..... ..... ................     @D

That's where I was going with the original patch, using the varinsnwidth su=
pport from decodetree.py.

And, in order to share the trans_PADDI/ADDI implementation, maybe add somet=
hing to decodetree.py to allow us to specify that an instruction shares the=
 trans_XX() implementation from another one, such as:
ADDI            001110 ..... ..... ................     @PLS_D_32 !impl=3DP=
ADDI

This way, we could (and would need to, in fact) keep the 'P' in the prefixe=
d instruction names, but at the same time avoid having extra trans_XX funct=
ions just calling another one without any additional code.

For the load functions, we would then have:

%ds_si          2:s14  !function=3Dtimes_4
@PLS_DS_32      ...... rt:5 ra:5 .............. ..      &PLS_D si=3D%ds_si =
r=3D0

&X              rt ra rb
@X              ...... rt:5 ra:5 rb:5 .......... .      &X

PLBZ            000001 10 0--.-- .................. \
                100010 ..... ..... ................     @PLS_D
LBZ             100010 ..... ..... ................     @PLS_D_32 !impl=3DP=
LBZ
LBZU            100011 ..... ..... ................     @PLS_D_32
LBZX            011111 ..... ..... ..... 0001010111 -   @X
LBZUX           011111 ..... ..... ..... 0001110111 -   @X

PLHZ            000001 10 0--.-- .................. \
                101000 ..... ..... ................     @PLS_D
LHZ             101000 ..... ..... ................     @PLS_D_32 !impl=3DP=
LHZ
LHZU            101001 ..... ..... ................     @PLS_D_32
LHZX            011111 ..... ..... ..... 0100010111 -   @X
LHZUX           011111 ..... ..... ..... 0100110111 -   @X

PLHA            000001 10 0--.-- .................. \
                101010 ..... ..... ................     @PLS_D
LHA             101010 ..... ..... ................     @PLS_D_32 !impl=3DP=
LHA
LHAU            101011 ..... ..... ................     @PLS_D_32
LHAX            011111 ..... ..... ..... 0101010111 -   @X
LHAXU           011111 ..... ..... ..... 0101110111 -   @X

PLWZ            000001 10 0--.-- .................. \
                100000 ..... ..... ................     @PLS_D
LWZ             100000 ..... ..... ................     @PLS_D_32 !impl=3DP=
LWZ
LWZU            100001 ..... ..... ................     @PLS_D_32
LWZX            011111 ..... ..... ..... 0000010111 -   @X
LWZUX           011111 ..... ..... ..... 0000110111 -   @X

PLWA            000001 00 0--.-- .................. \
                101001 ..... ..... ................     @PLS_D
LWA             111010 ..... ..... ..............10     @PLS_DS_32 !impl=3D=
PLWA
LWAX            011111 ..... ..... ..... 0101010101 -   @X
LWAUX           011111 ..... ..... ..... 0101110101 -   @X

PLD             000001 00 0--.-- .................. \
                111001 ..... ..... ................     @PLS_D
LD              111010 ..... ..... ..............00     @PLS_DS_32 !impl=3D=
PLD
LDU             111010 ..... ..... ..............01     @PLS_DS_32
LDX             011111 ..... ..... ..... 0000010101 -   @X
LDUX            011111 ..... ..... ..... 0000110101 -   @X

--
Luis

