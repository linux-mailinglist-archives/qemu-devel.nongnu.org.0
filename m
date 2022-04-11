Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E54FC104
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 17:37:53 +0200 (CEST)
Received: from localhost ([::1]:33058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndw6y-0003gS-Nf
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 11:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ndvqL-0003mx-UE
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:20:42 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:64762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1ndvpu-0004VN-Ni
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 11:20:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1649690414; x=1650295214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sMRZz5hwRURMatGV5tnG99J7Tk6Mrla7jHabAdcvRnQ=;
 b=gd3xAFEu6I7N9n0AbKH9nM7K4a0tY5W1USs2gXUts+bEkPF1OHdyw5kW
 LMHK7PfKE37/6TXJTvTipGLhjWjAQTB1IBUoGAQ2xUFlssWwcy+enzOOh
 D1xxkKzkxlc/ja0Kb7BxlGlJKzk2tBUUmUJRx5rpT8NK/nwbxPt0khjpb U=;
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 15:20:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OppXd/hy9NvUdx47WE9r3W5bAFwOz5y9KjX9alqWi1RVErNPYw6jjIThLEimu7eFXzucd35xcCIqOwVfWfU5WrJxo2pqU0vLPfn85/Z3rcJFrz6m2NoR3jsn+aTum4NQzwBDe3oMKNL+EQ696hRWLlt3HULxe32VGOOz5fwm2O/nLKM7HVbHHgl1ZMkFTk9ppqzFIdgPXXEG3+ugDdzQAQD+Am8pIfoFLHxa+Z/Sz3Eixqo5S3tLsc1UfcZxf2t7l/+ce3pedfmpUNt612JbxllfjP+9jnGAYZ1HZjKFBVXGdiPe0Z06jJBeWxDr4Xl5i6OPOMWVsOueboFfX+heGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMRZz5hwRURMatGV5tnG99J7Tk6Mrla7jHabAdcvRnQ=;
 b=hi1vgr6+mbg5iq9eRVFSG+xIxqZpKXJ3b3ZJ7bLOeZYy/eN1aVjrHG11ctZvlFz+y75g7NG5dsCNlKysAT8TiBOGch3MZHbzXynrkyNeCQMFJ9JNz9bPRzE1+Sq2JDSEyYOaDDiMfJi/Ry2Ro9ajUQmvomaamau5f24clbrNPEUmIwCye0kR9EYyk7Ap/KMFZPM6lDrAYI2flZep1K60nzMWXC5AN+IRIyUWKhMMMUBGBPXC0Ogj5wyhnmVjkPzMHLHYm3EcYz2a1Fbtu3rFz2AsMpOGZMnfHn4217B5WoQcKgfI65PMXZXXnmMM7Ju5kQ4SgVldPp9IzXaEu3xKBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by DM6PR02MB6940.namprd02.prod.outlook.com
 (2603:10b6:5:25a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:20:09 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::5c0b:b589:ed93:eaef%9]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:20:09 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Anton Johansson <anjo@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Thread-Topic: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Thread-Index: AQHYHdpgoR/GH1Z2RkujlSiWH7YU+6zrL9Jw
Date: Mon, 11 Apr 2022 15:20:09 +0000
Message-ID: <SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-11-anjo@rev.ng>
In-Reply-To: <20220209170312.30662-11-anjo@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58aa390a-316e-45c7-907f-08da1bcec3fb
x-ms-traffictypediagnostic: DM6PR02MB6940:EE_
x-microsoft-antispam-prvs: <DM6PR02MB69408A45B5617844A57E8C07DEEA9@DM6PR02MB6940.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8jQIC6AYb1r2ytvL4oy3gC5XtGUhqEnpVOq2jtTrwrcBuA49wzwmNg9whAND1x/06X7/qHEKuCR4rW9LLBjM9FVkj8ArZyoke897rEbwlqMrWmVAUHAM0VbVd+MClrD6kGRIgaKqnQL6j2ByoGR/4tCj6EFEJoQNO2+QguBNcNVvONKxpFbulLIt9k6bIDekJufc5UQpZOZvMz1xAlo0TCtk+zu55rURu3fgDc69PzLqoxNygipxi/RzEXsBVzOu+pCN5D4LErpA6xA034/6HsT7zwhKOLKy21os++MznmCHNyqkDnYY/SNlm8/FStlktYhOqS3/JhdhEffs4MEvN5UIFOmPVkX05yZGf/OZ83PBLHYuyCIUdPqBbXRFVFX0iMzlYLyHa9PPvVl4/XX5fAB18gTZNHOoxwmt6gG8b/uWlMf6t1qELx4/GzJNnFAJ6T5qNIVeionkmyIjVgHsDBdWrC2vJLIYEtjFGLwVqYoKL5wDlCPgQw24p+B/yghf/+WxE4C9VPhGSfRxPgKj8tg15u3bgEVXuGE3zMv5/mwxuxat0lfLz7l2EgRiwTeU0QD4LoPo+oU9WKUHOr7GtpAwvRaF+bi9daAVi8gHXD5iT9obcFeV6OYZi2qS4KUqltnpgko44TVjykfzTYejW6qX7PmSwII+4Ai6QdoPs0Oh5PT5/MUrjdEtyHIaFDvo5tXfHj5kNM1E1NvIqFi0CA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(38100700002)(122000001)(5660300002)(54906003)(110136005)(2906002)(53546011)(9686003)(508600001)(33656002)(316002)(6506007)(7696005)(186003)(26005)(71200400001)(64756008)(66556008)(66446008)(4326008)(66946007)(8676002)(66476007)(8936002)(55016003)(83380400001)(52536014)(76116006)(86362001)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dFzGyr8Bk96nJybtEzxGP+THy/IgDc0Euwop7BYTiSpt6IDuJ6FGGPs+2lXy?=
 =?us-ascii?Q?4+O7YdRRDurk/aeoq3+AVW0szJKAjTB6qu+OIeKdm/luOH3qDCDyfWQ1nVf+?=
 =?us-ascii?Q?B99o07mYKlD2Y0n6HC6X/wqhkx8fAJ97A3YAC5YqFP+g2WtICM5eiCGInAMB?=
 =?us-ascii?Q?WdG2Kqh6ZbAVTXTDfcbQgsnqD5z9RxT1aNlMCF+NG6COiaM80jRAJBivD0jb?=
 =?us-ascii?Q?UfiEuGNFwQS6jNZBxlGMBQdUr6Nb+kyhb2SWMQkfgpU12ZP68uQBBhOagTRO?=
 =?us-ascii?Q?iSPnK9zoGSQK1r8zsMgb/iA0ROTrF5rS3ooxJ3IGYtNc0v6n51deBD2iFUPx?=
 =?us-ascii?Q?4H3iwU2lFvKKCkuNi6ENt/xlw4NsQSUi9QH0ySLablgm4Q3bA0xofJ4cg2lf?=
 =?us-ascii?Q?yrUxfeyPpj1CVOoGmAOnfZ35h6b661WPaJoAKVqgJPiOKKOnBPO5pGKveACh?=
 =?us-ascii?Q?/SZz+U91kd9BsQiRvpvC3h49OArr85V/om7oLRcJbQjJE8LZc5+6jJp4daxy?=
 =?us-ascii?Q?Yz8YNyW/UMJKKCs+RA7YGvEaJj53X2sDZZGU/AWt8QygP9g6KJmzoyij9Zx8?=
 =?us-ascii?Q?eQPMc+LDp7fbiF+vt92wsblqB3aecdj8RIOHIro7P1ySF9wmPdzFuGLL44zL?=
 =?us-ascii?Q?zEv2LPKEJUnu7CT7gXuF/5IT0rNj483cBWRw6PgxgIguWSXcUOEzdfHAz1A1?=
 =?us-ascii?Q?2wfmPWO5R0WN5slyTXTtUTFdZLgQ/W3WddHv9MxF0Fh2oVLRHdyE+U1MMQKD?=
 =?us-ascii?Q?2SqzuQayRVVsKjCPlYieCQ+73ANPJR2dxFjva53Pt5W3LlIjH8LQQeEbw3UZ?=
 =?us-ascii?Q?yBFcZt1pvxsqyh4XxVRmaVG0Ghs+8tucaHzPPt2o2aJVIbohJ74g9y2x6hz2?=
 =?us-ascii?Q?aRJZi9FSQDpXBXtOSh+9zMu5emTQFj8/KWNnhAhJiWP7Vy2VQclbh9zRoxGP?=
 =?us-ascii?Q?PicT1rBKTb8G1KLaFLQlY7giZ5SNy4fzOpc92A1NrjVt02DEmTpYZTuAYw5f?=
 =?us-ascii?Q?l21ZCx6O8raN0cbIGjkZJyhKqrPaBJ87JYRvQfVQiH+K4IFIouH1S4h9BIgk?=
 =?us-ascii?Q?58r6TzC+nIpLCPMkzpLYFnSn/qWOygM7GhfOc2raWflsubGv1xmQZl2KAR5D?=
 =?us-ascii?Q?MNeqQx4DRfgV9JUu7+kMoburcD4emW48iO0WuwvNLHjY8ywNcEQ5KAl0lYcC?=
 =?us-ascii?Q?Rb6afFV7Iwwdz6+WhOPHTwoyxUl2j3RDahLows1P7Jax6FYVgvtf6tfDlvNz?=
 =?us-ascii?Q?lWsqzV+pxJBrlhuCNuBhoTD6BaDs9GJ/DuSJsQMvz/psRlMEyxlBCXL3MPBG?=
 =?us-ascii?Q?/xqtGo6mWvVdJRM+a6q5MQ58VQ/vTqk7PFf+eHqowsdaEki80ws57V1R9mHY?=
 =?us-ascii?Q?Xqfwv3hvOV5DpeLUGG1sUFOVRPSLwO42ve9BUaXHoM8qny9jDBseaJ1HGxB9?=
 =?us-ascii?Q?E3mE3QfZTrdgwtqVpoizQFrom+rgxO4b4plsKylkHJTVg9OIR9KkpeORdKLx?=
 =?us-ascii?Q?m3PmiH+eJVJ9F5Cu/roAY2SQtNZp10lpipADdSkyuVZ60HH/tNhWbsGkFreE?=
 =?us-ascii?Q?jxHiYkk4ltwpMs6q/f/hTHDvp9zvNQP4km5wxoYUiOJeQ5z5HDZVK10rFGGY?=
 =?us-ascii?Q?qfA+2KO9gTYJG6Il3qNQoqarqr06SqCfkd3LgZ53s+8J9hriAyPMrjfRYs0N?=
 =?us-ascii?Q?Kl3HoL05zAPhJul+bzUr4sPN3YCD4NHTgVmO/kmyriDo4ZQnYJKL0NKCk6jh?=
 =?us-ascii?Q?+gKe4pcbsQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58aa390a-316e-45c7-907f-08da1bcec3fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 15:20:09.0510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W5ccxXGyHiU75FBJYIRkmpdktSGJxTjGPxpZyWxl8aXxccAdwisBp4IaD53z0eEAeBTWJNeNHORRoF+UJaW/6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6940
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 Michael Lambert <mlambert@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Anton Johansson <anjo@rev.ng>
> Sent: Wednesday, February 9, 2022 11:03 AM
> To: qemu-devel@nongnu.org
> Cc: ale@rev.ng; Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; Michael Lambert <mlambert@quicinc.com>;
> babush@rev.ng; nizzo@rev.ng; richard.henderson@linaro.org
> Subject: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
>=20
> Signed-off-by: Alessandro Di Federico <ale@rev.ng>
> Signed-off-by: Paolo Montesel <babush@rev.ng>
> Signed-off-by: Anton Johansson <anjo@rev.ng>


> diff --git a/target/hexagon/idef-parser/parser-helpers.c
> b/target/hexagon/idef-parser/parser-helpers.c
> new file mode 100644



> +void gen_set_overflow(Context *c, YYLTYPE *locp, HexValue *value)
> +{
> +    HexValue value_m =3D *value;
> +
> +    if (is_inside_ternary(c)) {
> +        /* Inside ternary operator, need to take care of the side-effect=
 */
> +        HexValue cond =3D get_ternary_cond(c, locp);
> +        HexValue zero =3D gen_constant(c, locp, "0", cond.bit_width,
> UNSIGNED);
> +        bool is_64bit =3D cond.bit_width =3D=3D 64;
> +        unsigned bit_width =3D cond.bit_width;
> +        value_m =3D rvalue_materialize(c, locp, &value_m);
> +        if (is_64bit) {
> +            value_m =3D gen_rvalue_extend(c, locp, &value_m);
> +        }
> +        OUT(c, locp, "tcg_gen_movcond_i", &bit_width,
> +                     "(TCG_COND_NE, ", &value_m, ", ", &cond);
> +        OUT(c, locp, ", ", &zero, ", ", &value_m, ", ", &zero, ");\n");

You shouldn't write zero when the condition is false - you should do nothin=
g.  Try a test where OVF is already set.  You can't overwrite the bit with =
zero when the current instruction doesn't overflow.



> +        if (is_64bit) {
> +            value_m =3D gen_rvalue_truncate(c, locp, &value_m);
> +        }
> +        gen_rvalue_free(c, locp, &cond);
> +    }
> +
> +    OUT(c, locp, "SET_USR_FIELD(USR_OVF, ", &value_m, ");\n");
> +    gen_rvalue_free(c, locp, &value_m);
> +}

