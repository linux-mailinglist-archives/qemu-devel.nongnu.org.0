Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F6C3A1894
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:07:42 +0200 (CEST)
Received: from localhost ([::1]:56264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqznx-0001aS-F2
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzek-0005mC-0U
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:10 -0400
Received: from mail-sn1anam02on2108.outbound.protection.outlook.com
 ([40.107.96.108]:54854 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lqzei-0004q7-6A
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 10:58:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GGSrgijYKXWDs2osH0llSMkjpt1FhbZNAgBuXkacAVZtgb+bsWquOdSIrQx8E2qmlD9OYzT7RgTHIPPJUNABzizHlUzWY/wdosjnzFMh7/0YvGfTW+/evpSShQxGBttg/7AXSUVDQWnAZ8JxNRqh4ffrHDT8tNwMUXDAuRqWOp1W2o1Oh2Az/GPPqbW7LrBlr+P/U6K7poI/h5r3xZATZBQb4gGRko8/ISxDP13mhI+eJMB4S76tqGYoyfl1+NJbo0UcLmuwuKiBC9zPUC0J8ph17npxEN6n9HPXgwpZ4UmNQ4L+3TM1ZEMOzbhXPiLlZOY0zknPrEYuNI5KAkjWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqJYDQlER+TjCPu0Z8wDp8yItrPOgtzvxFz+dlTaWAc=;
 b=lllPSzoe3Y2YjbwNFE9l9r96t4/LnN0gO5t6ZTnIIAArfNomsvM+uac1ZtwgE/uUc2kxab+O+WcYassq7qrWWTyIDrQWJoh3rLMnqWn8vOqvPIA5RhCP/2QS2jN7+uJHe7unsKl69qz05x5Op/yy2Gy2uZfgtFRtD87QyOWUx4lLINruirMhdIr9qwADMBe7eSy1HXKb1pug6xPyTQ4BQLwI3A6HhJWjX+PpyMDKdr1rfpMyZroEBgzTEMuz9Ym2hsqaouObRkw60GwYVcOg91xaez4TZHDRdo/Wy42M3appO7LayiElRYBaEk1Yj7L8N2l3dEuPI+6n4hf97rEa9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqJYDQlER+TjCPu0Z8wDp8yItrPOgtzvxFz+dlTaWAc=;
 b=W/E95h4IBj2gzOH2RKSnQAbjOO9+Hb3L/xei468fxS7kzOaKLCpGjdR3lmhGG8OrQ5kMeajW5g+QKEZPxRhTj7e9/JNYQi7cAhyxou4q7Lii63BH5Ea1GEMFhoBE6xxN6rlkq1IkX4aKLSpRVyzoNUV7UqolNItGxPZJ5uycdV2UpsiRtIeFmcnVXZD4Nr4I1FOFIp6sUyvPDZEAQgFIyx3sV2wbFB5j5p6uAgq/x73iRfG0Qjd4q0FYNqTuG4oa7GZxoLjv1xXGuyNcDPql6mWW1jBpc+OTHfLS2+C2rSlgGoM+nPMp/mb/6zb9seNoLEsQpLMgb0HC648fk0642w==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB0017.lamprd80.prod.outlook.com (2603:10d6:102:1d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Wed, 9 Jun
 2021 14:58:05 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::dccd:868e:fcb8:72c3%2]) with mapi id 15.20.4195.030; Wed, 9 Jun 2021
 14:58:05 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into
 tcg_init_machine
Thread-Topic: [PATCH v3 12/28] accel/tcg: Merge tcg_exec_init into
 tcg_init_machine
Thread-Index: AQHXP6pSMB2m/0rC2kil9x/BTFNUC6sL+yIg
Date: Wed, 9 Jun 2021 14:58:05 +0000
Message-ID: <CP2PR80MB3668BD3BD55F799F0554F95BDA369@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210502231844.1977630-1-richard.henderson@linaro.org>
 <20210502231844.1977630-13-richard.henderson@linaro.org>
In-Reply-To: <20210502231844.1977630-13-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.102.146.220]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c82e8d6-6822-41d7-3c64-08d92b56fcb2
x-ms-traffictypediagnostic: CP2PR80MB0017:
x-microsoft-antispam-prvs: <CP2PR80MB0017E06CDBC4BFD31E4A87E9DA369@CP2PR80MB0017.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: B2ClghX0kYe7jY/25j2tOjywjRg/2TRVOx4V7o0LZtIGzgiaLGKYEXAy+4sqyRYG3bVSxcaRd3m7L3bhNyb9qz8kwKX18vGzOfBtQpKEiFiKuPPThRQ8tH/adlH3s8wngXB+eNf3S5tvVFRkdmR+Av8qh0MxPrtaKVpqqjplUGaLBfY/bTD0Dki/selH1N1Xr2FBrliqRv77SvJTnmM3MSaLVrRsplju4IqL0HY3FGqrD1ny+w0BcJuQ317lHWAWlj+JbUB0kz1B4HtVN/q/fjp2x3U3t2qVWKSKHQQkTouljp13L36irU+8CQtRG3yh2XDQc/iDl1bPZzGBzOe1347+AgQPx8tKi0rmsdPiFpdtLwzfagtIFK9g0vJQErEBpf6MiqvhGMhDHWv1B+ga/8QJhICQLSuJOHNUdFbyPvHnQmu8IHjiCOHO53o8GylqOHx0ylfJFNTjkX1mXAat60zeo0fQe4Xrz3yu0WfDV6q3uzbw+XT0l2KkHIW9sBmTfzjikbLT3jWk+HYoWT1UHE5oB62dL95wzQ23DbN/sd3uNu2TkEN1cXUTu0nvAJuxf4N9R7eTtTw/TcMz7XW3A+2g1oKki/nSJZwwvYelS1BOK8/ShxDf9a8x+UV9JNgazsWZeT87Hg4MmKjTJECTJRL26rPRFnSpw4LE7uE9HMJrDtwAkc4DW1K1klOzD2VBnrRVFzCkLIBKTaFyolbGvb4F/whrnaNa2MpLIKgdYuo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(122000001)(86362001)(2906002)(26005)(8936002)(55016002)(4744005)(5660300002)(7696005)(33656002)(83380400001)(186003)(66946007)(66446008)(8676002)(110136005)(64756008)(66556008)(76116006)(66476007)(498600001)(52536014)(71200400001)(9686003)(6506007)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Q8pyrhqQXMPUBbAJSLOncNYQfuif8/duWxCQnmhg1I1IgQfZMaCHyvCvust0?=
 =?us-ascii?Q?O5+4UpryQOOwIVMqSmBe3LhF4/0kVRfTKZnkH4gMfp2S4WQK2tYOJHNm1rOq?=
 =?us-ascii?Q?kA7b/YfLNfN3EKtlxpG9seyL4xCIjOD9BcxpDj3X8BUH2bbKZ87LKRdqDzfo?=
 =?us-ascii?Q?rvdvaP1BJIwD7LFNU7JfVq73GlF0RBTwHhuRuhN2oCA5T/cEMqn+Xs0KRDGB?=
 =?us-ascii?Q?qH8TOET7ncWwsCGq5Ngh5PIJC2nLRJK0jAFtuwNn6M736bbqV0sCVvdrE3ED?=
 =?us-ascii?Q?x7Qb79pmPBCuS8exvFLFFck66O4tyvbm+UaFsE60ujKNA5DkYHQWKKAyTs1G?=
 =?us-ascii?Q?pPlgfhN4THsmIT3/1svNcJaWIkUG5HgMbMkuU+OV3XzSeUWo+3AxqQTAqCfP?=
 =?us-ascii?Q?iiVgSRj4RNA7Ut8SHdkgnqeY4C5fKwTDEqmJMQuC63vtdnDTEtAIyt7cQq61?=
 =?us-ascii?Q?5wQOUOj9dsBzJhG/QeJX95CF8o6hY2McJQJwFUu0LX3mXC09bof10OUCaX7c?=
 =?us-ascii?Q?XD4dn7jZqUJ30d+qmM6d1Ak3sO5JrJKSUnmZbpjAMyL2NCQ/rGovy+9hpWCI?=
 =?us-ascii?Q?JWv2RyFF+YKWb3bZhkDLeFJ9xTqGrD9Re4kErDBkmcIEc96NiTzd4fmiwfR0?=
 =?us-ascii?Q?t0cnQTEmRHeD+PAG9lIFs+79bze7wI+9+xtD/Kp/MFARVrm0yTq5RX1KsADi?=
 =?us-ascii?Q?ycqCDF6v4M1fu4YBizYazuGZm2+lsVOFTADsz1owk2/khMcyUcQsXUqDYKwv?=
 =?us-ascii?Q?9CTYFn+zXLdnzfkVeeuubQSon33kcePf3DG19mtKwGvoA9AsIEzEEOcQG3tE?=
 =?us-ascii?Q?EzLFzT0UmGsV9OkBRuzljHu/6JDrLfSQeT5edozjJQapZWebmWu8L62vnFqu?=
 =?us-ascii?Q?mafEbi3kBah/m+zgxPpr96noVM0TRFuTsPslHH87LXYl54L+7mIYFXeXPdqX?=
 =?us-ascii?Q?S8q0gVLzpaX1bFhGok/bJeId+y22OBwm2kpOSyMxJdzd4ymnWPaBLQP5nde/?=
 =?us-ascii?Q?NmqWSUV4dQhfMq2SADzajTHYd7zlxErteWBHXCQANMVMYNtaCHQU5WkouzIL?=
 =?us-ascii?Q?JvSdB+VWccsLH2Plllparfu09qGf1ZPw+VHdgB3V4C6Dc2gy0w5T/kC2ZaKL?=
 =?us-ascii?Q?PLKjG0VH9B4qsce6CjXYJ6mMokcEOrEaK2xKnTWrF/YSsuZGc5RJDV1gL2Ay?=
 =?us-ascii?Q?Uyi3p8jfbAnhVn6wZd6JrlZ4cyJCN9vNpoNLqAk+BVZbzhs0RJYALZDWr4IJ?=
 =?us-ascii?Q?rbxOdQiw2QAfm9oPOrMLFrVS93qt8+XuT1+H/BoiE9+Na+PgRUqAVRrUbcQX?=
 =?us-ascii?Q?GeBH8cPB1coH7NgN7FAOM4tx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c82e8d6-6822-41d7-3c64-08d92b56fcb2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2021 14:58:05.4468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGin58BAyiDmg2blNb7UN9J40Wnnz7A8prToE5RqMf86HgZuSkrnqLovna8dEAkapF5OhyLTxAi+bRpYkASC1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB0017
Received-SPF: pass client-ip=40.107.96.108;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
> There is only one caller, and shortly we will need access to the MachineS=
tate,
> which tcg_init_machine already has.
>=20
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  accel/tcg/internal.h      |  2 ++
>  include/sysemu/tcg.h      |  2 --
>  accel/tcg/tcg-all.c       | 14 +++++++++++++-
>  accel/tcg/translate-all.c | 21 ++-------------------
>  4 files changed, 17 insertions(+), 22 deletions(-)

Nitpicking: there's a comment in bsd-user/main.c's main() that should be up=
dated now that tcg_exec_init() no longer exists. Currently:
934     /*
935      * Now that page sizes are configured in tcg_exec_init() we can do
936      * proper page alignment for guest_base.
937      */
938     guest_base =3D HOST_PAGE_ALIGN(guest_base);

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

