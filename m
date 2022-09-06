Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CC55AF7F9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:28:06 +0200 (CEST)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVh36-0001SU-NM
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:28:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oVh1i-0008Qz-Pr
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 18:26:38 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131]:63148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1oVh1Z-00077b-1C
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 18:26:37 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 286MHmvN010622;
 Tue, 6 Sep 2022 22:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=btBo3+HxO1/YCeT0gKIpNgKGI3OkkP8Xew9DolXKuD4=;
 b=gCeNHOR7siWvaXI3Ec+Y9DohL2pUnC7tH+EjWEopag/YcM2uWfEstnWF9LWqBaFls7WW
 l623DP6XcMnOEzI4VJnA2L96tw04j3ySZ+cFB3qyhb70QP+e8uxxrpfKb6SSINtvwAeK
 feAXbYxEa97bDtVvecOHfYfGo9YOlkC+AYRBGegpgjjEuNmG+NeUCym6+Bzu2vfzScv7
 Chfcgs9nRyxCpSj79Lz1H6PzoO9tiOixeTZwjCR9EcyCjw4IWcza17PUiT3dTBM2B91n
 5o993B5XMWvFvtCRSYgTJr13WeILZbUWKuCxu9OL+cgeci3jLt3eXa3W3b802PzmYDHL 6A== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jdug3m2ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 06 Sep 2022 22:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5QCgyOg3a++TQiuBZz8BemeFJYQ39TGwHeSyovRWAjG+JVRxxA1vmesZzuUyfl4mDgsD+hHaY4jajPuwF6n3tJRtBX7HVzSVAqQ4+UbYsSEC+d4BN2SbnMsr/19nbekvORcMaKl6nw3cJiSDAKInFlT5kKAwIoROQU5wvYgv2CBQ1dcMmNkD4MEBhpXfvAUj9Rm35QzsTLaVHG/L/Vh05DTLTLZz3sZC2uGz9v1EqfuJ20F3ILMz+def04yBe4+iwwEQ3TQqzmOX2QT5y5VntRgyAvrcGBuqlInRPMN6RqiVoKxZCj/nqUbWwEV/F1M3g/iajnJrTT8GHSJ1J+AQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btBo3+HxO1/YCeT0gKIpNgKGI3OkkP8Xew9DolXKuD4=;
 b=G5FSSxTm9kJrjq9TMW2KflrIEDMC2RU73j/MfFtG9gnudQkPfgPjnMblqQLPSLmefFYrgRMxJ7V813vcXyqx2lWFgq6fliRoRn/oy06HTlMpYGhbFP65xFAuLw4MQ0s/0eKcuh7XeRqq3SRGkIPZwvtac3xpRfVRwN0XRF4zsES6WwIdYM9CHureUTxZbyeSpu1vyIdhoPnHLTiXjn8W5zCVZA9ewJZRp60R/iYSJKPVWS6ZfRElpk8IvWCe4RGGvzf6zMV320eJiCnC7BaGaDUaaAw+dw4xJ52+yVZ0vl4iBjxvRALyJW0QL3qi2mDXfj5y5/BW7ZzUj9o3C1tk3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BYAPR02MB5736.namprd02.prod.outlook.com
 (2603:10b6:a03:119::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.18; Tue, 6 Sep
 2022 22:26:15 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad:691f:8a68:f4a5]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad:691f:8a68:f4a5%6]) with mapi id 15.20.5588.010; Tue, 6 Sep 2022
 22:26:15 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Brian Cain <bcain@quicinc.com>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
CC: Richard Henderson <richard.henderson@linaro.org>
Subject: RE: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Topic: [PATCH] Hexagon (target/hexagon) implement mutability mask for
 GPRs
Thread-Index: AQHYvkn47UHSKPkKbUSObu6XDhnsea3S9qyw
Date: Tue, 6 Sep 2022 22:26:14 +0000
Message-ID: <SN4PR0201MB88086141CEDBE5911BD2324BDE7E9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220901212931.27310-1-bcain@quicinc.com>
In-Reply-To: <20220901212931.27310-1-bcain@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54e2321b-18e1-4870-8399-08da9056cf95
x-ms-traffictypediagnostic: BYAPR02MB5736:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: a/sKr1N8Ahi0eSlF4XFsgxmRUV4nm8AH8j/OGdCpLe/H1qhcbdVJvaBd7ZX1vZRmTwMZCpOYIFzUHD6Uu8sUWZ1UmmyJW1w0qmcwTzilgWEZDTVVO+Ym/Y+L83V9DSbPTlI/ezfcjS4wXsO3tMUrt2SMbD9Pikd42IYf4DsjxH2GLBelAg1JoROPneOKf6mSBjMjqDovLvL+73564AejDsVyd5jMAUaaP0l+x7G9ewZ0NreT8jANu61dFsYFrVmVbyZXSqYYxMXYGEL1R3u+9Pi0vw22kxWkfvLdXa8ist8ckZAETjxVJciHiTD3/udEhMdqKjeyPdh8xnqhr+4NxVtHKUE5GpkC4CXV8c1O71Ch8BqJ88jRtbKIpQ3yGVquda+Wgl1BoO1Z2r2ZzSn9MCXeq1HZOl3wGvcAdDhuYPP0hBdV4jH+lxF8rUYaXuorG5dKyZM5Fu9auHlP3+jGWwGwugM/jQhlmj17wIiN76z04grRdjlIjfp3o23/7HCa0ueLsVT5sjjTRIVeh3vVvwN5WiuNMU13hQLVLdfnblnV6bVnwJgUHsTRa9qsoQnDVJJrMmgHhp6wi+9ySMvl5KRNoOZiwx47TjmxurEPXvGhcIzRPS9u8HHRanJNgJNClYA4EjB4Pi7DSNoKYRakG5rANu93gfNdrEyLWjJWHOwVafqameyow2FGv4Un5DxtlyE4RvopQB8ii0no9o6RtmRxSna7nFFiJhSYQmvhTlrW1YojMTn934Rpqt2Jij9zYnq6cXzld3DxWc1nKp62qA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(396003)(346002)(376002)(39860400002)(478600001)(55016003)(83380400001)(9686003)(6506007)(110136005)(7696005)(53546011)(26005)(38070700005)(52536014)(316002)(8936002)(5660300002)(33656002)(86362001)(2906002)(4326008)(66556008)(66476007)(66446008)(66946007)(76116006)(122000001)(8676002)(41300700001)(71200400001)(186003)(64756008)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wBPRTSCDkYmiuiOeztBSOI4PPlCUgtIjiGzGx622jtaUHTOx8A4z5cNS+X/V?=
 =?us-ascii?Q?eWdpOFc63e4SzuGpz0zG72XIDf+T/IynfIjQGnedmwfT+9sOt1oNIxTm5GKV?=
 =?us-ascii?Q?gnw2AFzhKdngrUYOMvcsZalQo/AGlRoYzyj74AX3wG7fZEPG7Ew9qYi586cK?=
 =?us-ascii?Q?TromCx3S8hWr2EDd5GT2/k1wQQPeyh5YrSBcfuEx96lFQc/qyNdzZuyIwjC8?=
 =?us-ascii?Q?eJLmW+i5GHh56flktKHkINFRiJZfz1rmISqkA40/0s0AYa4bx2Rt/qenA/Bd?=
 =?us-ascii?Q?6A/1SZRn9uFrw1MlwaGB4JZgmDQxDOub5T8BZd7+XTwbzdLQOi/JKl7jJIzI?=
 =?us-ascii?Q?LRQJZS8+Y/ItZA89qBWItLoQg9sxikhyqoC8LWyIZoowiJanANapSmyvntNd?=
 =?us-ascii?Q?LIXwuJaMbI84Oa845ZC62PHUvNjVd9c7HLSkPCtfSNRQugZ/P/OtrRifwnbt?=
 =?us-ascii?Q?FpddUz5OzuGPw65C0nPJPhehLlh9v7je89bBg1LyQYiPSvJ8bztrQeJil5pL?=
 =?us-ascii?Q?2FeCkOnRWBpzNKKY3RWryTI+a4ti2qm91CFBVSvw0v/D225AA9/v1bhPoSmm?=
 =?us-ascii?Q?Rq+/2z4fTrMtwEeX1+EsF50eWSC5ORdeDJz7Z8WEov3EYKVa5NhvFcfm7Z1o?=
 =?us-ascii?Q?PLFC6KQoJITj7t9tbRNxjFmYMrszArb/JUbrlQEdk3Z3n6SiBHC1Ls7ZxAxL?=
 =?us-ascii?Q?B2LPePzVLAIUknDzC/h4aKBGmuPt7MARGVVABn4k1F4I/zLKi3WiyMxZwpvs?=
 =?us-ascii?Q?Uxyth6I2PzCUjFc87ZyMojPsmKbpG9ziaKeQaYMYQ520MXH9HemfpHn2kbYI?=
 =?us-ascii?Q?9SUMYXRxQgAFvx9Y1fuhGm9Sky/zF4mdFOexGq+jC1vO8sJ4ursaR745DXR5?=
 =?us-ascii?Q?6tZsrKhTOe1r7eKAZDZHoR6B0CHPHwJAKEzvB5EmEwKiKkIbNy2IIoSE20Zm?=
 =?us-ascii?Q?OzlwIkWNyfnp5RYpJgzzwAWG3mfUYU207AcRW4PiOo1dRB3CfMax+Zt8d0Mh?=
 =?us-ascii?Q?GKMV6I3hdaJe75p0Jrr1nV7r8hukEulH1uAIQyjqA9Bsd2LErn4EKrkRsBev?=
 =?us-ascii?Q?HtUfbr8Ke7Jarsfuz8eBz9ij4x1WYzXr0ZPLXvBe62kd9leEBFYcX/bfQnL4?=
 =?us-ascii?Q?oHKFT1KZWQcLOWiLQzGWOErmzC1OWaqhLYGSxRhqFCVtcp89efCq0SYRq0Zp?=
 =?us-ascii?Q?cVrC6uHZCZhFNR5bmq9cqVSH236Cp2H9+xrNZhJNiTBOe4aHTIL7DpX+68AJ?=
 =?us-ascii?Q?D1VcNYLTgdt6TjcTQ+OX3eOUdPwr5c2K75z271cwhXzMnbUntPP1ivYL0Eex?=
 =?us-ascii?Q?2eLOzNw8J/RjAI2mfNvgNXwsDFkQ8vIVyqTipkXmKz4sOOgk+WO0rt8azS/6?=
 =?us-ascii?Q?SH/nsOH1kv8Ts8rKpCvAGA88Tg1V32OeMSNF+5TiPygQucKaVk3GuZxJANAG?=
 =?us-ascii?Q?6APqUtsR1VR/WoIHkxi1Qi+0pTEGUgxZirGP47Dh9raCLruZxp74bh3wCRZK?=
 =?us-ascii?Q?UVfLIIh+ot5XeBIyXYYonh4XGlr3IIdADHVKiXs4TqU0e9QcxPHgX+tXqwsD?=
 =?us-ascii?Q?bsxm+pBygQROqETFWioa4GFjUg3f9s3HlcCgHNhr?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e2321b-18e1-4870-8399-08da9056cf95
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 22:26:15.0108 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dc5xolWGNyQ2z/ija7Bsc0YIBlLyPBVC642cESlaxf6psuE4gBW5wDUl8zGfksvQZTBOqq6R3vZFBJlsFqqtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5736
X-Proofpoint-GUID: aGTtZ6nnulSE6vohB31C5i18M28rI1Vp
X-Proofpoint-ORIG-GUID: aGTtZ6nnulSE6vohB31C5i18M28rI1Vp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-06_09,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=584 spamscore=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209060105
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Brian Cain <bcain@quicinc.com>
> Sent: Thursday, September 1, 2022 4:30 PM
> To: qemu-devel@nongnu.org; Taylor Simpson <tsimpson@quicinc.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>; Brian Cain
> <bcain@quicinc.com>
> Subject: [PATCH] Hexagon (target/hexagon) implement mutability mask for
> GPRs
>=20
> Some registers are defined to have immutable bits, this commit will
> implement that behavior.
>=20
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> ---
>  target/hexagon/gen_masked.c       |  44 ++++++++++++
>  target/hexagon/gen_masked.h       |  26 ++++++++
>  target/hexagon/genptr.c           |  33 ++++++++-
>  target/hexagon/hex_regs.h         |   6 ++
>  target/hexagon/meson.build        |   1 +
>  tests/tcg/hexagon/Makefile.target |   1 +
>  tests/tcg/hexagon/reg_mut.c       | 107
> ++++++++++++++++++++++++++++++
>  7 files changed, 217 insertions(+), 1 deletion(-)  create mode 100644
> target/hexagon/gen_masked.c  create mode 100644
> target/hexagon/gen_masked.h  create mode 100644
> tests/tcg/hexagon/reg_mut.c
>=20
> diff --git a/target/hexagon/gen_masked.c b/target/hexagon/gen_masked.c
> new file mode 100644 index 0000000000..faffee2e13

Run
    git config diff.orderFile scripts/git.orderFile
in your workspace.

This will ensure (among other things) that the .h files appear in the patch=
 before the .c files.  This makes it easier for the reviewers.


> --- /dev/null
> +++ b/target/hexagon/gen_masked.c
> @@ -0,0 +1,44 @@
> +void gen_masked_reg_write(TCGv cur_val, TCGv in_val, TCGv out_val,
> +    target_ulong reg_mask) {
> +    TCGv set_bits =3D tcg_temp_new();
> +    TCGv cleared_bits =3D tcg_temp_new();
> +
> +    /*
> +     * set_bits =3D in_val & reg_mask
> +     * cleared_bits =3D (~in_val) & reg_mask
> +     */
> +    tcg_gen_andi_tl(set_bits, in_val, reg_mask);
> +    tcg_gen_not_tl(cleared_bits, in_val);
> +    tcg_gen_andi_tl(cleared_bits, cleared_bits, reg_mask);
> +
> +    /*
> +     * result =3D (reg_cur | set_bits) & (~cleared_bits)
> +     */
> +    tcg_gen_not_tl(cleared_bits, cleared_bits);
> +    tcg_gen_or_tl(set_bits, set_bits, cur_val);
> +    tcg_gen_and_tl(out_val, set_bits, cleared_bits);
> +
> +    tcg_temp_free(set_bits);
> +    tcg_temp_free(cleared_bits);
> +}

In addition to Richard's feedback, you should do nothing when reg_mask is z=
ero.


> diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
> 8a334ba07b..21385f556e 100644
> --- a/target/hexagon/genptr.c
> +++ b/target/hexagon/genptr.c
>  static inline void gen_log_reg_write(int rnum, TCGv val)  {
> -    tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    const hexagon_mut_entry entry =3D gpr_mut_masks[rnum];
> +    if (entry.present) {
> +        gen_masked_reg_write(hex_gpr[rnum], val, hex_new_value[rnum],

You can't write to hex_gpr here.  You have to wait to make sure the packet =
will commit.  Put this result back into val and do the mov to hex_new_value=
 unconditionally.

> +            entry.mask);
> +    } else {
> +        tcg_gen_mov_tl(hex_new_value[rnum], val);
> +    }


>  static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, in=
t
> slot)  {
> +    const hexagon_mut_entry entry0 =3D gpr_mut_masks[rnum];
> +    const hexagon_mut_entry entry1 =3D gpr_mut_masks[rnum + 1];
>      TCGv val32 =3D tcg_temp_new();
>      TCGv zero =3D tcg_constant_tl(0);
>      TCGv slot_mask =3D tcg_temp_new();
> +    TCGv tmp_val =3D tcg_temp_new();
>=20
>      tcg_gen_andi_tl(slot_mask, hex_slot_cancelled, 1 << slot);
> +
>      /* Low word */
>      tcg_gen_extrl_i64_i32(val32, val);
> +    if (entry0.present) {
> +        tcg_gen_mov_tl(tmp_val, val32);
> +        gen_masked_reg_write(hex_gpr[rnum], tmp_val, val32, entry0.mask)=
;

See previous comment.  Put the result back into val32 and let the subsequen=
t code put it into hex_new_value if the slot isn't cancelled.

> +        tcg_temp_free(tmp_val);
> +    }
>      tcg_gen_movcond_tl(TCG_COND_EQ, hex_new_value[rnum],
>                         slot_mask, zero,
>                         val32, hex_new_value[rnum]);
> +
>      /* High word */
>      tcg_gen_extrh_i64_i32(val32, val);
> +    if (entry1.present) {
> +        tcg_gen_mov_tl(tmp_val, val32);
> +        gen_masked_reg_write(hex_gpr[rnum], tmp_val, val32, entry1.mask)=
;

Ditto.

> +    }


> a/target/hexagon/hex_regs.h b/target/hexagon/hex_regs.h index
> a63c2c0fd5..db48cff96e 100644
> --- a/target/hexagon/hex_regs.h
> +++ b/target/hexagon/hex_regs.h
> @@ -79,6 +79,12 @@ enum {
>      HEX_REG_QEMU_HVX_CNT      =3D 54,
>      HEX_REG_UTIMERLO          =3D 62,
>      HEX_REG_UTIMERHI          =3D 63,
> +    HEX_REG_LAST_VALUE        =3D 64,

You can use TOTAL_PER_THREAD_REGS (defined in cpu.h).

>  };


> diff --git a/tests/tcg/hexagon/reg_mut.c b/tests/tcg/hexagon/reg_mut.c
> new file mode 100644 index 0000000000..7e81ec6bf3
> --- /dev/null
> +++ b/tests/tcg/hexagon/reg_mut.c
> @@ -0,0 +1,107 @@
> +#define READ_REG(reg_name, out_reg) \
> +  asm volatile ("%0 =3D " reg_name "\n\t" \
> +                : "=3Dr"(out_reg) \
> +                : \
> +                : \
> +                ); \
> +

Remove this - it isn't used.

> +int main()
> +{
> +    check(set_usr(0x00),       0x00);
> +    check(set_usr(0xffffffff), 0x3ecfff3f);
> +    check(set_usr(0x00),       0x00);
> +    check(set_usr(0x01),       0x01);
> +    check(set_usr(0xff),       0x3f);
> +
> +    /*
> +     * PC is special.  Setting it to these values
> +     * should cause an instruction fetch miss.

Why would there be an instruction fetch miss?  The gpr_mut_masks[HEX_REG_PC=
] is zero, so this instruction won't change PC.

> +     */
> +    check_ne(set_pc(0x00000000), 0x00000000);
> +    check_ne(set_pc(0xffffffff), 0xffffffff);
> +    check_ne(set_pc(0x00000001), 0x00000001);
> +    check_ne(set_pc(0x000000ff), 0x000000ff);
> +
> +    puts(err ? "FAIL" : "PASS");
> +    return err;
> +}

Add some tests that do the assignment inside a packet and using a register =
pair assignment.

Thanks,
Taylor


