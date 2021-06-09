Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225D3A18BC
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:11:23 +0200 (CEST)
Received: from localhost ([::1]:37608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzrW-00083F-3O
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:11:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeV-0005MF-Pe
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:55 -0400
Received: from mail-eopbgr800137.outbound.protection.outlook.com
 ([40.107.80.137]:31454 helo=NAM03-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzeU-0004YC-6R
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:57:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cUbBbdYFPwbnpsbNgvRiK3fhmvWOxk+s62maSsUKcUljxtkv+NPr6F3PWolpaxE7wL2Cdue5Pzou5jBw1PRoWAPnEOh10d484CcOL+M/wViq6dBFMbgR4SxILFASRBmZZn5tdNA6GcaNQ42ILC7Q/i86zGNUE9cT5wSmEigBW4PLD3SlirXJNNpRyl+P0WIMhP798UBNnno3KaeklnTBniAxhubHGdZshp8vHS+QDs1zfJYWZoo98f8wb2C+qViWDX33+RoK0hyuvkrDW+jZA/anj1H9tAq0Z0Lr05LNfJcREABy0GOy2tG4K9vQbhi3ErfZtLn3SuFfAs72zEqW1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klmleTefE+2PUJzi6qJHLcuENzPTQikfei1Gbi0eHdM=;
 b=XlLMQQJeuHZEski1JnaW8wy91SNCBGU+PyC00lnJxBdWyD5vVyJ/+x5Ha8oZH3dfHh/xRPi+axSpH9mf9puvhPdTCvyNp5uIk8tR6aAonMcleyKoiTTlGcquozNcojL3ZchEY93YTywlWxn0scNfj7/QE/4N+Q1yokrwDF9XeM5ZsQ3/P32Gqoh2OmKIEFNKaBD5h4S3WvT5m/P0dtu8snMB8MR6yYtIm9KYvyGpwfQtedfOSjfb/6KEd6oUQlws+uoC7s9+zbUG9UnHrK6NaSTNOo3MKfRGNrO/9ozTYYkiYFwVOednIOosKKUB46DJGK5o7/CpK/s9LZaDqv+lfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=klmleTefE+2PUJzi6qJHLcuENzPTQikfei1Gbi0eHdM=;
 b=kU5NNOcOm32IpLjlBsmeLZ4kMQ0AsVXxtcOop9tyXLEICuOj1a2kT4WpsRyNIkN+UJ4RRGfDxUr8EkHn25hxPtmVCAe/GO3aZJOe+/umcelagpvgdVVnJqmbjXg62AiyfQDypE2tztokm2GR5q8/ynQ8Ok/HfKOrpFFR4iQPAINXkPl6U8ulMpyAlkecVzbaW+1uoyRdHgkUnhcbJi24x0PPdIsg6v3YcbIdUFbdiFSjvdkn9DsYZPLyiWmJKyFFQ9vyHYzqLgwXsBtDGYSrasc1U0Hj+F5XNmLjM+CATgaGAjT8XrTV9vKb+OjLCA5rJmGIbDAMoemQUj1wobFFGw==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:57:52 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:57:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 11/28] tcg: Create tcg_init
Thread-Topic: [PATCH v3 11/28] tcg: Create tcg_init
Thread-Index: AQHXP6oVI2LTMDI38EGdnubbjzKw+6sL+xKQ
Date: Wed, 9 Jun 2021 14:57:52 +0000
Message-ID: <CP2PR80MB366811A4CDC0CD22E0B82490DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-12-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-12-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2e269e9-fd1b-4bf8-92c7-08d92b56f4b6
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017D4682B4E93601F226645DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MijdscOexwXj0Ch5XgwFoHJg6740lZ6D2aui5VRR39sX0BKYX318lCOoB20qNMzETgkcioOAq4bOb8/QOXap6zBN9ISE9lKqZTQfMPOM9TyloSYyuWhgkt9ZMDkY/P0Fm+WaSksd0ES/c3+VcXCsv2YKdQ2LR3a6LbLyLirOfQPfFFGK6QCI1v3k6fprcwfMfsIyoIXDO83xLSdcNtzDaxiywNP9mCGklLL24+qquhKZMW3s9ShQNhS0tD8xpuGoXMkOfD9I9o9pUzzY0lGfHhGETzMq+ctNeMiQwg2u7LKaaa48GvDxNlmxuMGH0hg6SBb5yvCandzkpYGGxY48lNb5SJcQFeJZEArEL3KC8fV6QvG/jMEhziQP4poRQm3JVY1e9FN9tEVJZIcqCYaGfhUQhLffFSLkUKMOAXONFfNpg9nUI/vjz/V2a13T4TtuSezNOE7+bngXO53CCJ0HYtVZkorBzUUOZQec3TAhlbeJJg+btesyGxB/M0H2slUSexQPMOAsfhqCnce2peWTsDLMkwD+gxNclBr985RVJPX07ZKFHY09Yfx9rwritV5EXSht/AbLuJjGysLGE9Uewgbzpb478SbCDjMOFxSDqld7KvrLueDNnEA2+/5FEe0I6m3a7wIr047bOfCTSHPhtfKof7YEHQcW3PyaXaFcl6MBiJAMinKoA3HZj7oUyPg9cNmu6Qn3kPzd9gK9BVWx4k8qz84xHXUj8mAyk2D7/r0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(396003)(346002)(136003)(376002)(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(316002)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(478600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?IeFOxQDWlQFMEKMkJCVrGxD4fIHNiuNr/MJjD+2ZvtOa/JHGiDcD9Us0imRd?=
 =?us-ascii?Q?pcRc9/Tj/twJmU4qUP/nWarbZjbV7ehx+5vcNr5+KRNyfaQ5EYGChpZsqbKr?=
 =?us-ascii?Q?7ZxiaTcByvTKcGEGMuXIMVhoz61KOtzhNOZKV2eJF4PQzEudoXX61Z98UNUo?=
 =?us-ascii?Q?IfOw0I+A02WlY9KkalZAYWk15LrwtT9UHjGp0qAgLlvG3cFLlxRX6XRJjCg+?=
 =?us-ascii?Q?L7AwizjSXJ4Chye7kwf7okrIlsmIm413JAPAku3TBZ2O61GTMhhki0dtCOe9?=
 =?us-ascii?Q?pc2n7G9gis+vPhdYXqVWKkPWGufpFe3f8oGr3V1APNw2W41aJNa4+Qz2Q1ll?=
 =?us-ascii?Q?PjU+lomeskDCp/oK1JfKNm223K4HcjCAF3rn3WG7S6U2AyDyo6Aq2z6nmBlS?=
 =?us-ascii?Q?br3p7kpZlc10WS2VrErHa4lVssErVSFT1p99JAiVI+jcw3LHlr8aeTJl0BBm?=
 =?us-ascii?Q?6TTBLjH+AYjT+l+qeO075EvydlH2HYy4byLLLp5dj/NQfJzYd3aFYTVFNsmu?=
 =?us-ascii?Q?kahLq9+ROw0msrYGO8NV6tTlf1+eTctFqjVqBqbNUn2dct/tzard1NyDmwqC?=
 =?us-ascii?Q?fBe063taVVMzGUccajG0QRDvDL+2WJtgpZRrBPQxUjQQGXfN64kOZ4mr41mk?=
 =?us-ascii?Q?I3BB1psrDqVS0BY9JwRA7k0X4oETkphDOfPHj+Qhj1RJUhy583GCP9aIb4B6?=
 =?us-ascii?Q?Nmu1ejrqTZDmWgPrvClGsn5RwozjLQpo53njbS/n1z7S5f/gEIk6uBd5w9QK?=
 =?us-ascii?Q?MZfhJ6fW+V2VUBhudGTPtI4rzwYplJpbHpkKvt2Q4u/Hm7zrnm4B8ojO7ylS?=
 =?us-ascii?Q?BRcSyYoFhPZrNHA6W2npuXT7jO9+CsJNw4Sng3k143HwxMzJt6Bml2K/zNKu?=
 =?us-ascii?Q?UHBDXi97QRTpaZ0y2nW5DxWEciMweKErKekCgHyBRRy/fc5PyoFAlNeQRHQu?=
 =?us-ascii?Q?jey2Gc/OAkobeIEUJytG9x/nian/BfX3eK3NJJSdfIqf/FpIUh/3KBkZNFS/?=
 =?us-ascii?Q?vv3LdUtbpWuYWTm6VJzq1N9oayyVbzYvbGE6teh8GZm8/AkENyL6lXIjtxKI?=
 =?us-ascii?Q?y8T7KBZmZ32/5SJT6NpqzwWUdo0PHIL9HEBrNiR2zBodSzgUFdHW5gtcwMRY?=
 =?us-ascii?Q?IZsc0tkGW9eEB9Mjl3lpcoRHkXwkF6vj0u/0RO7LovJVe5x8wR/9bvvW1U9b?=
 =?us-ascii?Q?rOy3g02X7FiSpOubEf+1z/m3i0QW1P4KBkCI+VAyaLsZbVwMRl43ntTXAPYs?=
 =?us-ascii?Q?7y+23tafp7YKVoFiVDnXwJtkcK88fkagKzdGAazPEystAQPYAaVRIQqRm0Yu?=
 =?us-ascii?Q?rkX8KOZ57b1wVKyjYzPeadvU?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2e269e9-fd1b-4bf8-92c7-08d92b56f4b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:57:52.1144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J60XUzx8rTRHAhMHzpKFt2dOCNTLI7dPt7wO30s0rl/3DaCGMLE8TzGE9gVx+mTz69/TirX4YlaTtS7rgpeY1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.80.137;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Perform both tcg_context_init and tcg_region_init.
> Do not leave this split to the caller.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h         | 3 +--
>  tcg/internal.h            | 1 +
>  accel/tcg/translate-all.c | 3 +--
>  tcg/tcg.c                 | 9 ++++++++-
>  4 files changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

