Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D59C3A18E8
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:14:37 +0200 (CEST)
Received: from localhost ([::1]:45520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqzue-0004wo-F0
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:14:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfk-0007qI-N1
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:12 -0400
Received: from mail-eopbgr820110.outbound.protection.outlook.com
 ([40.107.82.110]:4452 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzfi-0005UO-TE
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:59:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5ocCow5cZMgWGHMHC53pTbuUJWD6RGIHXAEYQWMHEqb42e+roejpF6nD11ehVhimOhKS20OmrFjzU8xJiK61q7cr7DBrchHiXazmwA/Zlqqvl2xRUqHm6AeMqUoXd1Ogx0Em5RKG4PibbPcQeGrKFMz3iLh/1cH6gMuaexxUBjUBX9vkod6500bI9NFJepMf5/wlMWys1sIRFxmyoZz8KS6G+cC1a1gq5ZBr63+G1DcpIlC+B8Wsl8OzV9mPI1eIG+ZvGgyL7sMDpM/lpR5pRhWXdJzu4RpKO1Do0P4vCbr0jmqd5YP89QAn+wmLR1xfrPkNiLMEOO+FoIhyvHMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7yTAFTMQJq8R0Kvuud9aBKNFQKhamHFFaVuwMdtRT4=;
 b=i/3I05Crd6T833XF+YvAaxf/mhkLGbZv7PRkH53Mm5f0x8eLJ1hGbRO1fD3k13GaEmsfW4PTzxl3XzRLz62zrER2i/XhFhosV6Zacbh6YQr2O6G+XUgmED5nt89PvkpKRBFd7C0qFzQtlqRzyuF8Lwy6kCmp7qmYsjr/f/U4jJoSDNNd6K+YrMD9T30dtmFsOr5RluyS2VOs8v74TuNvlyZ9pnOY6E+o1YIs8piiWuWinvnhWhTJv9UnN7tkj5zsJJVCqKhcNwAVl/84OR4b75yZX0mokRWOzcBM7VO4ghFZ6aULDhkoFmgHo6RIJlork/xgmwRJ+Oell+96PDn6Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7yTAFTMQJq8R0Kvuud9aBKNFQKhamHFFaVuwMdtRT4=;
 b=UrOl4e/WwfsujewJHswCiN21ToPZwwqd/l57xdr0cmSeOYKKiMrYgapTSPA0TY/0f9aO9beZXiE2yu0jKv7EkoSIMb8kt9hUXJmUziplsy5sQWh6YRoHivpLc52ghEPdtPY/QugRJ0SB92YfnnZko/KbSexklyZEE7jO3rdJkA8DUPKfBqa80AdoQizXuxDoowilEUEY49rB3j03ezYRd7S73nSsdR4/GUif+d5NpfPKREl67WxvyAmV3VpiYdsH/Ogm7w5ybCxg410481h+/UUmfuQzwWl7NdZ1Cj2DwFGRKoPvtVdSZLzQixwDZ9vkTNCGU5WpK3wO6HH1OYJPew==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4484.lamprd80.prod.outlook.com (2603:10d6:102:48::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.29; Wed, 9 Jun
 2021 14:59:09 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:59:09 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 20/28] tcg: Move in_code_gen_buffer and tests to
 region.c
Thread-Topic: [PATCH v3 20/28] tcg: Move in_code_gen_buffer and tests to
 region.c
Thread-Index: AQHXP6w6V/KqOQd6BUu0FZyentBSLqsL/Zxw
Date: Wed, 9 Jun 2021 14:59:08 +0000
Message-ID: <CP2PR80MB3668E2FD965963AB71F8BDD6DA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-21-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-21-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c73f625-eaa0-4637-a203-08d92b572286
x-ms-traffictypediagnostic: CP2PR80MB4484:
x-microsoft-antispam-prvs: <CP2PR80MB4484D8AE001CE5A8B8971C90DA369@CP2PR80MB4484.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J8uklRx/YrweAyFiUrUDibkKtEkkXkLtCP8ZKrBv71v5xklQSsfZnJEsQUl2/xjv0pYc4DkfEz4sPCjPTaOIvDEUUXRozjv7jYdx9a61pt/ihRSKSNFW7ybqw8qaOAuI1MGM51uRYfgK2+JqjFQZ7hz2l1FkjS9Ltctw+0Pc5i3mVL1s2U8DQnCbzyctyagqOZ7AdkEM6woCY+ammuxnMyqnJ71Sai5XnzKAVKVO6SJHUVT3c9/DF/eRQl5s7wGSLybIXF/HD8jPFda8szkneQqQ4K1GhT6465sBoIKiYTxDtxEvDB5tKV0TDY7pd/IpoNgS6ACa745XwglfAEhxh8HcL4jTEqqNfusE31V4gZ+ucjBDf91BnbaJpcFpRQ3pn+i4KEGy7UYyWrpYMbNf/tPHvSr71/eHDYAXfRlTbNTV0uyD4kEzJHv2+uvoJCbo2nlbt1VZt2wqDd4um0K/sQGeM62JM6V+sJf4SWVk2LlorJshhexOfRFN78Eqcs6fRELcI+/A9s43OgSn3zkY9gFn/qUEiZjPeOg2S8JX8qCxcI3xhu5TFYBm1pJu8XumHGKatu75FdleJkwzz1kiV/9glvFTL4sMahypP2pxxsF29UaHFZPRXALj2L2jlM1zgRgtsN6c2ZQa47Jkd8CZDfu+BSvnYNljEtv76Eugje9RZqbl+E/TVo050xyFGFDtfVZGX3qGyrVTZ0Pfu+MH/vnBrlPAxUwOnYyJAdNrf/0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(39850400004)(366004)(136003)(376002)(6506007)(7696005)(110136005)(26005)(2906002)(186003)(316002)(38100700002)(76116006)(478600001)(9686003)(64756008)(66476007)(122000001)(55016002)(66556008)(71200400001)(66946007)(8936002)(8676002)(52536014)(5660300002)(83380400001)(33656002)(66446008)(4744005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?yTJwZffT/bCQ2BQPFWBk7rP6FlO0nFjPKU3y7QCMYKNZ0cjjuGkY+BjVrtAT?=
 =?us-ascii?Q?TKPh9ZuAy4ft+RIiHQoIiMPWd1aiObi1Im6i8AhdMOq8jpKk4MNTbM56YFFN?=
 =?us-ascii?Q?+pcla2eD9DiylGpHEjnhMovZlv8XkQHFZb1YVABTBGca41HfnNdC+K1Knzux?=
 =?us-ascii?Q?UEeGACKkYp1QIX7ecOVc7ZK5ugdP5aJXiQtSyrHr5pnHg+sz0Y2af8zBHMuc?=
 =?us-ascii?Q?FcBCjHQhcBOGppr4XnU8094S/Bx7gR1Qt6mlrVoqFh6mf7DYVVVrKwDa0TKo?=
 =?us-ascii?Q?Kvllro2PslE/NI/Avy2GXjIl/alge0tIm7IZ63YEi4hhVgF0HN+QN4Xw0Cm3?=
 =?us-ascii?Q?c05PXFqhCnWVo9ItOEQDnVgUr7LRBKNVr6mk3QH4pT/JIT6PQYu4Mts84YE0?=
 =?us-ascii?Q?6e1DwJ3rEiZb1NGTFOTQnEMJ4JM+wuK8COUprxIY4hbpqPIu5vKTYXwlgGd5?=
 =?us-ascii?Q?5qCpyNzO2ZhC4eM5kFY9D7xZxrVDj2eZv34bVWr+/UbAqr2iUq+qTO+W2lsh?=
 =?us-ascii?Q?HWVGiijKWD8Dss9W/8PvG2XgSUuwjShmsGPpbRp2jnwrJzHRBjfJcWP5f9Z/?=
 =?us-ascii?Q?0ghqN99Z3NGEtX0E8cpA2GpKt6k1+djYs2+iqdU1lCw6rVMrqELPSZfs/nOJ?=
 =?us-ascii?Q?af0lqJdkR3yHSOGOuF0Z0mQAEJFog1PFUxjeOo9AYw+yrWXw5wM2bPUGWfes?=
 =?us-ascii?Q?eK+4OuwKZSwllW/0uN8xog8loVSJPKIoUf0U6EVstSl03BR5DtQrpUQ7aAAW?=
 =?us-ascii?Q?EBIxXpe+u/0eqzHhCca9j0wX6ykPhCbQWXG/yb7/U75rmMn7Ype4v/13z5qb?=
 =?us-ascii?Q?eHFtAwOYrrg5Y7MqxH9rHcUEI84gjr0/Dm+cUfDJihSlHyG88TFenggG1Vnp?=
 =?us-ascii?Q?tVMBCMs7+SMaRz2JPTmuSDn3UQfKTzjaTmScXByn6CK9lyKdHw2/2N+fiUpJ?=
 =?us-ascii?Q?gPyUX1wsUbs1zfDneyCrWs+bnrB8pNmx4jR06cueQlOl0dtWHZYGYHC2Czwv?=
 =?us-ascii?Q?SEraKEpKWpeukBg7NmNW/k05OuIoI/+pKHrIsc9bBuqdlo91S+OlWpQwGOEe?=
 =?us-ascii?Q?KOefYWMfY9lHWCyxPbvzs+u2D5xE8ujczPmiGDyrx5eapGaVPWZfHwiivHbB?=
 =?us-ascii?Q?ovOnGCEcMgfs1BTMvmheKk9QnF66fmd798It9/JayqgoGhVwaZ+F3qDWO4Fv?=
 =?us-ascii?Q?mdF06wfKYKkWz+A7sC2jSURH3SX74NZ7j0jcb0OUOI6jzRn7qav54i6G/7CL?=
 =?us-ascii?Q?8VUu+TlqLN6bTbCDRvIQ74fCKWbzLLxI/p5hl7qAqOk126+3fznSYAZUFgDI?=
 =?us-ascii?Q?24sXclEBFmmB5TGw/JzlMFRz?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c73f625-eaa0-4637-a203-08d92b572286
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:59:08.9044 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E0LQAcVj4OBDTla9S/zqKbBpYbsln8H7WR3DdSBT2CbCWB3HjJw7w5OhWk3AgiNPGgJdPSeBvKGu5/do+pkDTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4484
Received-SPF: pass client-ip=40.107.82.110;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
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
> Shortly, the full code_gen_buffer will only be visible to region.c, so mo=
ve
> in_code_gen_buffer out-of-line.
>=20
> Move the debugging versions of tcg_splitwx_to_{rx,rw} to region.c as well=
, so
> that the compiler gets to see the implementation of in_code_gen_buffer.
>=20
> This leaves exactly one use of in_code_gen_buffer outside of region.c, in
> cpu_restore_state.  Which, being on the exception path, is not performanc=
e
> critical.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 11 +----------
>  tcg/region.c      | 34 ++++++++++++++++++++++++++++++++++
>  tcg/tcg.c         | 23 -----------------------
>  3 files changed, 35 insertions(+), 33 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

