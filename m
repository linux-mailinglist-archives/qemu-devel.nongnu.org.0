Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B88370340
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 23:52:28 +0200 (CEST)
Received: from localhost ([::1]:40110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcb3j-0008EX-EQ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 17:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZrD-0001OY-DN; Fri, 30 Apr 2021 16:35:27 -0400
Received: from mail-eopbgr800104.outbound.protection.outlook.com
 ([40.107.80.104]:9239 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcZrA-0002AN-8v; Fri, 30 Apr 2021 16:35:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R/7uoUi1LtyQJGdJneZNJzrcSTMiPZsInshiNLQGN1oA+BEdAkjumOidg40ZstUoSaIBzS4+7KFhchyWU3LdxUUgaY6XI8mjrIHl98tcL9EDspXvQzFM7lpzEygpENPeFWV0bn0c7Y/k8jzW62ne9/hVbis5kNKTaxIUICsLX26aGPkoTw5k0f5uSVSQxwid9AGpXb6ifccssO8PFdbjNbFo46f/zvMd78GKpDKwOOzirkCOSRReN47R0IC6oGkDGvtr8hz5/rbM58fDbSsAM9x+5Xh2sik/H12ciMMCj+wk26xsqSQ8o0GMutAGGRi7sQkwnrY8AUz41TsmcxeIrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbab60sNsCkRlJQM003vpVkPLTySztxVnjxNJztDlyQ=;
 b=mAA/2XyzbPX23O4UR5gA0p3rt2Clz3yqX7uv5zLfamL5uVLAQ9ULnXgvzfJqVW1RRcUeB1McyJN1JQGFS8CpAzKs/Upi8qgBAcjIo9fo/rEUsOf3nKh6a5H+nJUYZ/yaBcIGO4UB0wfKt99r1ZA4poA1saSwAY5OsKmul16xYr+mdACcqNfvsr3PWIv+/04XK2A0Ye52smNyBTLNRj+AO1K4jtIWssvFb7jwULMA1PUn35sezQSbvhWRr03ffbFhYA5phOIZ6PKeH+6s2Ab+st94C0uoGzxirNJW9UBWtrEZQKqlpCJ9hOctuiklwwY9cyWksBqCHGZ3UXZWUrc6sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dbab60sNsCkRlJQM003vpVkPLTySztxVnjxNJztDlyQ=;
 b=YRtxuTRUBR2paPw57xi076B0pwgZAbjzWq5/yrZZGTsLQH0pQIxBOZE1/9pg8oN+PAfSc/AXJPCB08X/mKsUS92wLeapIgjfXB4k8r9TWZQuuwc7XFShT5FMbLna/EFFedo4txoXhFqGOCHFH7wl1ofuVOBIGQkc+djjPHdwRk3X0cNYS0/MFeq2abXfi2ZmcUhsmg7cm+efaadg5ldK3cHd4sn0eYteHsH/xmpRL1RGm1Ejw5GWcZWz4z8N8/JInMak63WxGjHqEqt3qlJhOvoPJPPfxQWotlByiRd7Cl8kK8qXVsx8L0TWc+C5s0ASQy97+I02q1TcYvwf0u7tGA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1986.lamprd80.prod.outlook.com (2603:10d6:101:14::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Fri, 30 Apr
 2021 20:35:21 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 20:35:20 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 05/30] target/ppc: Add cia field to DisasContext
Thread-Topic: [PATCH v3 05/30] target/ppc: Add cia field to DisasContext
Thread-Index: AQHXPV5bNAH/Iq4iPU64HwyPrCQyvarNhcwA
Date: Fri, 30 Apr 2021 20:35:20 +0000
Message-ID: <CP2PR80MB36686C432D8CB61CCFE07B3BDA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-6-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-6-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc072fc6-9ee7-42dc-89f4-08d90c17794d
x-ms-traffictypediagnostic: CP2PR80MB1986:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB19869DDDC3F2AC323E44D693DA5E9@CP2PR80MB1986.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J6+Se+r4atGsj8qUeZGFBfarM36gtqDDBavH4Oxas5x2PXwcMLXj+Fbpl2SOt09FRSPouEH9ZoSVIUxjfpePrexbM93zVuakRCeUs3uzwcg3b41UM2IXgsjgAew4Dlm59di6L/tAoiaCI1QkeqQbgksa5rr2Q6gNDWCW98S8VrfmZNj7e8e8spnfdJE8OQ1t97r0cGJXDcy17/OPoD93xltl7v9jsF1Gd4dc3rWMsYikcKLQ5WfSPKB6PG2HmC325tpWMHGt+uUtzZ/avFgkTFULVQiygxiqTicHJsAhA3vC64lAjxNEzLJYiSKtobIKZTZ70uxynuQUVlHyAYN6E4fg6bR+BL0cB4WegCxobdIMxsnPZz4Gh/ZOrPmkQl6EZQ6Tjj7xfGHaRm2cTWnR6RAT4Op8st69EnfJUYZeRCNGWWnCCQNVBMHLakuBkEtCR/6FwaCFywCr/HyQWgHmw8APRxoUzN/aI3HDtfA1+J909C/a/YXWAncQQWM519NkoNCRMy6/lNGb9qAuppoPQI24zrUXHCJZWBpky9G5/5cPCPUOzkxHr392xKcdSkgWtLupQpGT2OU02+mQ7bkRKqBARZHVw4PXI+m8pWRrAc0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(346002)(366004)(396003)(376002)(8936002)(8676002)(33656002)(83380400001)(2906002)(186003)(316002)(76116006)(66476007)(54906003)(64756008)(86362001)(7696005)(66446008)(4326008)(110136005)(66946007)(52536014)(6506007)(55016002)(66556008)(122000001)(5660300002)(38100700002)(26005)(71200400001)(9686003)(558084003)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pUEfHTfCATCSoi2ijjpHe/5MpJmcvpthXLpDhbCqOm24UWtFKbiTfMHKBhdl?=
 =?us-ascii?Q?V8crDBfcF2rPiZHnbkVfri9cVUmnbXURfnaTWbGQhxqz1zJG+3Nh9ruZsUNx?=
 =?us-ascii?Q?RUI/zsNkVZDNJbYZ5Mlla8m94+2rmY47KuA98YWL4H6MR5dgSB/gCCzYEplI?=
 =?us-ascii?Q?umCyk6WVPwWZ1gpB/4ddwM/RCnA6M70cpwBNusiQl4quMHpNem6OYAm7D7Kb?=
 =?us-ascii?Q?3hX853cIBGZfSiMP8FBbmnuPiLto8LNGZILYZf1wCvR80whuudGQE/9CqoHY?=
 =?us-ascii?Q?isHYkIaA2TvEFuNwSkCgvYQ6bFv6DSqbwYqA0Qey2zL2vOUw1yUAeNrIDJ0K?=
 =?us-ascii?Q?MUhcIWlD/reRxuyni6kme7QDnq9F90Nb5pZXOr2KaEgBjUe6tpM4+mEj64KD?=
 =?us-ascii?Q?Edj/JJAWXnE2ywAR4CtdwWST8VcGox9ZuwzxURXxrf/S1ELVuWjj8pfUQ8MV?=
 =?us-ascii?Q?1j0FoyQskt7NWI4YTdsWToJDkz6hjn2eyVsaJTPGWCV40+Iezz0TZik8GMEi?=
 =?us-ascii?Q?hjbJdIGBFIBDmCz83m0xpWNKlUwD6BALSNf8C+VVxhvJDPEM6CSAQsrKxEyy?=
 =?us-ascii?Q?yHALi8dMzrFnj5wI0IvqaAmZP1pmP9QBoU/vNLdToeT2yzL69G1BwR3wIKH5?=
 =?us-ascii?Q?e4pS4gLdonS5MCVG6KrqYnD0rvwsJmu3DNBP9Nm2rcNqQ9z29Z6NGkfQIBso?=
 =?us-ascii?Q?XAAYue0tyrF+ALhaXtBuepPo4R75BacomSBHbheOmlsMh8UkiWi8Ue+rFqF/?=
 =?us-ascii?Q?/qJHODKoW/KUOCFTB/wxNgAdFUBw2OGmpftd0yRxpb7s7Xmc4s7etqWnDWry?=
 =?us-ascii?Q?EkG2qdNL+y78TWofgZreL/CFjMCp4cj2g9gcVWlVumZxqQxJMzEYUNnQANBk?=
 =?us-ascii?Q?QVmDruC5jAIZCvTiSzKhKzkMisABtkV7AsUpHZ9VZ/ymWRTY59fyqjBKyMfQ?=
 =?us-ascii?Q?/7GwyMAID4of4CUcNfAdRNtiCtLS010o+m96nTU2ZonWP9zWg9C0cpItQYjQ?=
 =?us-ascii?Q?s3x+Gdtox8QRMGwFNbt2ktpGrIQ77pUFUKKXmaYZNmczAke77k5jHaClQbL2?=
 =?us-ascii?Q?TxwbReul6hMQZCIjKaUO9OGJsOwAhaZYMqqk6eqArOT+DFNfhWzxbTYnmTrr?=
 =?us-ascii?Q?anB2tFnoasJ7UHDm0q+rvDwqqm8BtDWMd+XL203pEcPztTSsTcjXYuJI8D3s?=
 =?us-ascii?Q?qu9Z05lbDXVRfejYKkfQpA4tU5I/lSBp6va9MX7pGbD8G+acscaHBUtfAP1o?=
 =?us-ascii?Q?D2ZTYyyP31kchSzXonfCUWYrFADcmxXoK+KXnBB+3Qw1fZXFoDQtO9b0x4Tw?=
 =?us-ascii?Q?b5guEyAijQI5JOaAMVjf6j3E?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc072fc6-9ee7-42dc-89f4-08d90c17794d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 20:35:20.6532 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dw8eASuRS4dSO0EI7FyOugiZolCO7+fb4ohA36ttXiFv1vixNPzJRJHuA6OZ/x4yMkiVLbb63mDMjuuuXn2kVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1986
Received-SPF: pass client-ip=40.107.80.104;
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

> From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/ppc/translate.c | 34 ++++++++++++++++++----------------
>  1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


