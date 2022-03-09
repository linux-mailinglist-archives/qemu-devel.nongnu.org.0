Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C6D4D30D2
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 15:08:56 +0100 (CET)
Received: from localhost ([::1]:40354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRwzm-0005EG-V2
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 09:08:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nRwyH-0004WJ-0c
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:07:21 -0500
Received: from mail-eopbgr150094.outbound.protection.outlook.com
 ([40.107.15.94]:64145 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <amir.gonnen@neuroblade.ai>)
 id 1nRwyF-00037s-91
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 09:07:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5V5woztsINpMJJvVKyD7Usz5FPhR8Q1ipKFPTSw/XGMXg2lBdF+ydipZipPypRDzqgBoXP9kSdDP91toq/GzvIzxaLP+nxHTaNotJvf8bzN7+JGhLfgNuK2RTphIHEQ2T4DDCSeHu18Q93h2V2lI4fbfnt8nd414E++xe1pHUO1JzMyg/8XLLLvAAacJZ6L16hjFR7oopF3CQN30ImWbVvsIwFycA+8XKJ/rTMkjRiHpL2r20VEFDMCd7QfvTCznS52cAKtkEaVZAUTgYbj41x1x69rTHd9iaKOvxsIuBI7AVYguZyffrVkNYsHfJ8aehlc9jjsyn4QoUUrd7IJ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDi0RhLXE6Ro0JzvPqD222BfsDhBCnB+JHMR+MDOyfg=;
 b=nWZiHzoqOTB/UITM5XUbpHN2XFJ1Di7CDRC1cXRHtXTRey1fZ/AJxZmd8Nw9D0lvviXnnD69c5JK5Cc1e/F/UHe3tAt5mw0BmM1to4Z1GtLJ47A1RZAzq5XFU0qynbfBoXpBi7OpcZSPCUTG73i79SRhl0+HUFRXQjwGMdwthZdTGDge9IU7vR0pAdNpBfAEtpRv7lQvB2MLL+hlHwBUGKY6ZzTDczdPnVf/aF9ESAN8+BoUu23c2anG0ztlH87XX/kAcQ2HpyNQ7JjHX1wZDmRhxKawco3Fe6aZW+g6yxLpkUHC1EQfN3x37EhPBhWdzhQKiCY3h0ZkqXiaRShkig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neuroblade.ai; dmarc=pass action=none
 header.from=neuroblade.ai; dkim=pass header.d=neuroblade.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neuroblade.ai;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDi0RhLXE6Ro0JzvPqD222BfsDhBCnB+JHMR+MDOyfg=;
 b=iz4T4NF0qMMMcCc3Qn8yHedAAbIeRoP26I/zTp6Nud5pObDkY/VBsJ3HfnHkW+lMy3mTVPw+4tyef/St0hKCVAXDbyrgxJ0O00y4qIEqSAjDQvTUbPubh/JpqxwAl1xFpCw4pMTMG/aOFcR3oBiLi0vVc+Ml+g60fJLeXJAch3Q=
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com (2603:10a6:102:e0::15)
 by DB8PR09MB4454.eurprd09.prod.outlook.com (2603:10a6:10:153::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Wed, 9 Mar
 2022 14:02:14 +0000
Received: from PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b]) by PA4PR09MB4880.eurprd09.prod.outlook.com
 ([fe80::e4d2:93a3:35a5:882b%6]) with mapi id 15.20.5038.027; Wed, 9 Mar 2022
 14:02:14 +0000
From: Amir Gonnen <amir.gonnen@neuroblade.ai>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v4 24/33] target/nios2: Introduce shadow register sets
Thread-Topic: [PATCH v4 24/33] target/nios2: Introduce shadow register sets
Thread-Index: AQHYMr0UqgfPKlV5WkKXZi2TvuGjqKy3EbGQ
Date: Wed, 9 Mar 2022 14:02:14 +0000
Message-ID: <PA4PR09MB4880283917696C2597102A4FEB0A9@PA4PR09MB4880.eurprd09.prod.outlook.com>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
 <20220308072005.307955-25-richard.henderson@linaro.org>
In-Reply-To: <20220308072005.307955-25-richard.henderson@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neuroblade.ai;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7041756e-07d7-46c7-bc98-08da01d56a2e
x-ms-traffictypediagnostic: DB8PR09MB4454:EE_
x-microsoft-antispam-prvs: <DB8PR09MB4454EAEA467AA361650ED46EEB0A9@DB8PR09MB4454.eurprd09.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yQKBcEKlRb2d4ZHoJnjvY3lHSygdCeXQh4GNKCdur6Fm+FrrmOE7KNGrPPpjJUzkbHKdl+XjSlPuhQVkJjdsrP8DL1XrSzLmySNFsGRBchbR0ysRobAB3BiFii3lcnRli4FStalE0WHX5HEit0fPO3DpWh4G1tfQ/zK9QfSNXP8eB9+B75f5vjVjZkukdJp6QtA3JQlAKYitGpvT2czP2hG3PVmUkPaASvqimzhfb0HBS9pFnPTTIdq+i4GoYLb3btOQpAtSqP/ViAEyZSyNzBEPanJg+GAn6ijoBAodTZjlwmRvAg1zva0IOYCxxToith67HuInlem32ECc3PelLLybxJwSDtaniRsuv0nELyLu1jIM79OR3iNsCP4rZ8jvG6iKJ8XPdqBt3gtFrQXNteqizpaqRFTAdlnaGCOHdh2xauGshWmRrlq/WBHnnoY3CAP4nGol94EaIZULmcRyHfmDb3cLJsZMVGYdgVu2pX+R/7ch13EPd92Y9FfeY2N8LcjB8COrWsnOW36KjFppuk2o24W2MyuBuCyilmScpN1CZl+naOEOkcBw2tgsNNtAtcM1cMoxwhhxV7mCkYhmwoCZKXrwz5h2djL1LvwycVWu5M/aJ5z2YSt7hcZRVGxnnVUn00eqiUcPhCuTrLS3zxiX3je5/9B6wjM2XMdpEavCT8ReTRpbhJEAcnErOg9+0fc/07OWH8aqJO8BSRGTNg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR09MB4880.eurprd09.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(346002)(39840400004)(366004)(376002)(396003)(136003)(33656002)(38070700005)(508600001)(316002)(86362001)(54906003)(110136005)(107886003)(83380400001)(71200400001)(122000001)(38100700002)(66556008)(186003)(6506007)(55016003)(7696005)(9686003)(26005)(4326008)(52536014)(5660300002)(44832011)(8936002)(66476007)(2906002)(8676002)(66946007)(76116006)(64756008)(66446008)(4744005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VDnZSYs+05aAE26DdGgErrlC7dIM4CUjldKY15l3j4Ck38btCyqFjG1cPLtg?=
 =?us-ascii?Q?OsDTySX2ikRt+lwMOeOzUVCowK+fE9ltKGkkZWch1n9EY+9mPD6DRNLExpe6?=
 =?us-ascii?Q?Z0OJomx803tsR9My9m1cIS54ZXoQgJAT4gUwkFL1VkR7fouOKa06xmAKI72a?=
 =?us-ascii?Q?Zsi3eAEcecV2qXulo+Huat45ZLF5t0TnyksLD7HPNl1aZWsgk395rrQmEClG?=
 =?us-ascii?Q?RajFmTO8pYyKGff56zarA5UVJkt7QYJi+Cod4K/5rtqeTYsUc3MmUNW87s4Q?=
 =?us-ascii?Q?kxvcWy7VA4otkk31pH4OfEzgBvoaQEUwXpKbysAWehtHsTAn4JZ/qDCEgGNs?=
 =?us-ascii?Q?O8/XXk6ONFgIVsBxkA8USjZ0qLmvn5LjdHm1iWV7r5m00ylexz7SWLW9drt1?=
 =?us-ascii?Q?pbsLBq4shbHGiL+nkFyrNj0UaFtZY1wT5I11EYA/0h09GC8iXyP0uDmOXtpo?=
 =?us-ascii?Q?+/8YdhRXtTVHkZYO1TV0AAsr1YVlqVvqVu9Msk54AFXe4LKENdKyvC3frXi3?=
 =?us-ascii?Q?ZoOmbJ81Kwl7kzw//FUtPi6Q8XSVd+tW6JxI5a/aSfqzstxJXarQL1CKDH3k?=
 =?us-ascii?Q?RUzX58FZyKBfOOKgSaBoQ/0ZdBOemTiMniDX/3r2SpEwMCLpkTNkibTP2yhU?=
 =?us-ascii?Q?G54iokVkxTsQEgg6LzBXWglzOMQdfaWcfSJF8i4uFZQg/SBPNs3kyJhkg8tp?=
 =?us-ascii?Q?aizN9Tn1zXxsl6FeCst1JtF3tMIj0ttFtw7gqkTUYSytoF+/PnGnafzXw5Bf?=
 =?us-ascii?Q?AEwQu7cG9+lsQAx5IACJgXcJMQmVTCcSnZblK7KUi78wgagKptTJ9ssGtfyj?=
 =?us-ascii?Q?6RuGWMpBBClUkvLcCY+hFo12oQEfOl+rPfDndFsiZOx6649877ZPdNhYzaLT?=
 =?us-ascii?Q?H35RNIsAd7EV4QgPgZNUD8d96mN7OLTjQvtlnfIdKeZ8Ur+/rewulTzBYf1I?=
 =?us-ascii?Q?kVLIMVxzUdANTX1TZaAK3lR1jfwo9YOINXPX2HTMSi5GSd5VbaizWX3CbJt8?=
 =?us-ascii?Q?PNwAwhdvknvX41h4Yd5Gj8OqYFIQ5O5qmErFM6AFDLy7WGGADBVc0bfF9Gdy?=
 =?us-ascii?Q?GOjL1btheZuNk9LQkbe3fXN4Gal8VtMSnCoWjWIQQWMpNncxpIsQoKr6pFEr?=
 =?us-ascii?Q?39ksGklDgkXkpZc/01K3ce5XzjUwGXUaaiB+pI58dCeDkJoSu4WCbFJR3ntA?=
 =?us-ascii?Q?UgQ37+N/cGFNQw5Vb2LkRyDLI5q8B8OWg2+D9Sa+OtobgR2TH3rRMu/oIV3h?=
 =?us-ascii?Q?deUeuz4dV8Fyl8xgKs0yjq/UmKgHpFTZOw9DOtdArEeTKGy73HUK3FMBXqVz?=
 =?us-ascii?Q?FSTmCHeJclsUv+wNxM7us2gHv8aL3D56ThRb+L65GkC+RaNHbLMnTQyUK5rX?=
 =?us-ascii?Q?2/OaBNbF4Unjya0LMxeNMaiFkOwXa8FM9z8mLBMaIqBDBa0K+hUhlmqB/YQN?=
 =?us-ascii?Q?IwxM/j/qj1nBwNzssLbaw1e3gdWPVFWZ5jIAEAExbQp8qd96gY8bJS1KKzDB?=
 =?us-ascii?Q?m6LC7YQ8IxOlKM3wAs00kld3vahRYmB7j9MBoHd3X9X0G4ZC3lVCZwap3cIf?=
 =?us-ascii?Q?YDrRC5YLChD9UisAeCCP4n4JbQVw1aDMTomOwAUsQhA1G7TijyrBPPc6JEjC?=
 =?us-ascii?Q?qRnlvgY3jFwWyWmSEL/tCKTy4SDLMm9FgF9XKAQwcWDoUsbLcWsawWv4wiuz?=
 =?us-ascii?Q?1Y41QQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: neuroblade.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR09MB4880.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7041756e-07d7-46c7-bc98-08da01d56a2e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2022 14:02:14.6675 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 63c61203-65af-4cf8-98e5-d12f35edaefa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6CZpagMm51ZvxtFsLChzOWjVUy+tru80BMaKPpyWo3ktppOdlEsuSDcN60c4C78fPqqJUstmko49uIb8Flc0UZQbMlUY+PUDsdADD0UM1Ss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR09MB4454
Received-SPF: pass client-ip=40.107.15.94;
 envelope-from=amir.gonnen@neuroblade.ai;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "marex@denx.de" <marex@denx.de>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

How does "cpu_crs_R" work?
In your version you hold a pointer to the current register set instead of c=
opying registers back and forth like I did, which makes sense.

But how does TCG know which set to refer to when it generates code?
It looks like it's always accessing the same cpu_crs_R, so how does it rela=
te to the correct register set on "shadow_regs"?

In fact, I imagined it would be necessary to change "cpu_get_tb_cpu_state" =
and set "cs_base" or "flags" to STATUS.CRS such that different code would b=
e generated for each shadow instance. Otherwise, each gpr access would be i=
ndirect. I'm probably missing something here.

Thanks,
Amir


