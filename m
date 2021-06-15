Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 406483A877F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:29:00 +0200 (CEST)
Received: from localhost ([::1]:34224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCry-0005eb-Sp
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1ltCql-0003mi-Bh
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:43 -0400
Received: from mail-he1eur01on0721.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::721]:43428
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Aleksandar.Rikalo@syrmia.com>)
 id 1ltCqj-0003Vn-1p
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:27:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMQriPwXf5N4bFqr3QTrEVhMfhDW9aLhPFR3a2TzAxcOfAgFjRs/J9knxYowdxt/pw4XBBkzSPahCpF06H0THFAxBBhBDuWNF+6Ty3La/p1yGpUxiwmVPRadOuxWpgxuaCAuFctJndyxEpBF0Md3mJBa0f9YdIaSzOcGdOirQ3Lc1B+UnQudB/K3WbwXromsI2Du3QUs/VQgpIlcTFQ0jpehTuggBlS/6/H9K0RWbo8pwtS4RcvT2FEsPwrgmR0kV9dKEYGN8v/eNJCGEb+zenos5EtB8KHaacy4TZkRK7GaxvEgw5sldLotGuIkn7mbpwdmN2wIbBbENWpley9qaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvZ5NVhaoxwETCw0iWn/C8EozcTiLQnhc7IAKCqZt4E=;
 b=N7LMsF4W+2QvE0HFDHpwQWfXbMPN9kmb0Kr/SiO2wZll24pgW/19/UepkZ+EH6U1+z5zXNd1HXFnbnz4/oG51ZbhGH0wR1f/R/irUPLPcCQ2BPytKiHGEVqlrh8Xv/Q3USgZMvR14nnYtNSqcvbHE2VMpXOgKDuVZc8ilxZfEv6obRMT0rWstLMZFI1mCNPKmzGwDD63ue1GZkyZTNAS7o1fEe676xs9Gth8QYvRH27T9hGIRcacOdJYoeQh1XAfefXeG4djTOfUHZxGPPZE8WhbBxbc6Oe53q7bVlGqOSe2sK0J30GzcAKm88T+tWOiCNTXxrugxLqyyp64f9c/6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=syrmia.com; dmarc=pass action=none header.from=syrmia.com;
 dkim=pass header.d=syrmia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syrmia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvZ5NVhaoxwETCw0iWn/C8EozcTiLQnhc7IAKCqZt4E=;
 b=n7rXujdqOn5517Gt2bpmB7hx5CuRvCshVyLDeGmUgJSZJzPqSoVn+j/0xgm8yvW6JbHt1deeZ/KUemTFdqVoZJt8WgkZBEonr/BK9uMBSAAKZOEM2+W/43ZncedhFC7ikumuJqTqeVGuaw9SifoELjpuha7OzrDd5F2NAXB6oAA=
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 (2603:10a6:803:1e::32) by AM0PR03MB3667.eurprd03.prod.outlook.com
 (2603:10a6:208:4d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Tue, 15 Jun
 2021 17:22:35 +0000
Received: from VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::11a1:b50a:4f39:48e0]) by VI1PR0302MB3486.eurprd03.prod.outlook.com
 ([fe80::11a1:b50a:4f39:48e0%7]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 17:22:35 +0000
From: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH] target/mips: fix emulation of nanoMIPS BPOSGE32 instruction
Thread-Topic: [PATCH] target/mips: fix emulation of nanoMIPS BPOSGE32
 instruction
Thread-Index: AQHXYgnvIKewTCFUIUuoPkxQC9/zOQ==
Date: Tue, 15 Jun 2021 17:22:35 +0000
Message-ID: <VI1PR0302MB34869449EE56F226FC3C21129C309@VI1PR0302MB3486.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=syrmia.com;
x-originating-ip: [213.198.255.183]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d48be043-d5d8-4716-fe34-08d930222aa1
x-ms-traffictypediagnostic: AM0PR03MB3667:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR03MB366715ED3D85D94A11B55B549C309@AM0PR03MB3667.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:949;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ptMaPCLvoQHRSU3QfMv8f5QHakJyPfvEkXF+T8q/I3P28vkJNQbOuEyHvcRVOlsAYt8/CYMWcBiqBqzgnXxWL/WaxRR3Pwhk5e6PmUlfnQSSzJ9L6aeYLVpwpkqu/y2MPT1KbKvcVzGIxGMALT1k2ZsSZmA4PSa6UcbxhyNReFS/mvv/SRXAiGAdjGyaeIzhrg8z7LpFE09DLMzjmOfzDmHppqUBd6QgLYEg98HrTMgOEQQIH3lQJLyKuqWHf+nIVJI8zQOA9XX97Rcw8dY75BVsYuBgJF3u4PUgzecPmwt1bgeh275d1LX0HuECtym+PtthGGNYFRX7GqZjT62q+en99Ix7vaG52zWzqwQQMVrInHZ4YyJmM+1GkBECxHwLBy98vgigzhSFnfNHH/M9h2Tl+O7oMabDU7e/IjwkPXip2d7GnnUcadYR/3e69hWiELsfpqdP/0ah2FPkhVDZdd/9tWN7Uc+4vM12vgx6xccP06/ugV/tBFiS+c2b+7C18gnH8SllmKNZC7Qac4eP4yajMw9h/5X5k+0RghTofcrB2hzwda2CdHDlgxzlAeW74i6919EsZaItWs1RIOeO1VpA3KBBd9VqG+5wE93ZmY4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0302MB3486.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(39830400003)(346002)(366004)(66556008)(66476007)(122000001)(52536014)(64756008)(19627405001)(66446008)(5660300002)(4326008)(38100700002)(186003)(6506007)(7696005)(66946007)(26005)(71200400001)(86362001)(33656002)(2906002)(6916009)(4744005)(478600001)(54906003)(8676002)(55016002)(8936002)(9686003)(316002)(83380400001)(76116006)(107886003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?uXnu3vlFuEsR+QCAaOw+bBD/YNR5gkFloHFgGwd839VqakjDlvBBMOXZ?=
 =?Windows-1252?Q?t1hP5YbVQVsuOZLQsTGVqN9D28zNFroKZDFseijxsnc+9DCZKX0v5RPD?=
 =?Windows-1252?Q?NF5G9hyJMu2Jsfgwr2Gv7n3Li3OD4vSqBNyqVDycE7c9elqSawdYIkeY?=
 =?Windows-1252?Q?pUm/qEP6vCh96akF34BPd0J/PNDLxWDB1jLySNL+R5G6+fxYjEQZvORm?=
 =?Windows-1252?Q?5P/LW+V2dGfMOGCr/j9AVZAOXccQRxkWg0LM8Dgm/8VyQebTvNHGRua4?=
 =?Windows-1252?Q?dG5C4QNLeccvMD9zNV9uQVyz+tmnZbKv5u8YauvPZKpG3otZPEqhkZFW?=
 =?Windows-1252?Q?lLobD9XDGoeMkXRLKxZIth39yCsHJs3ZslKMcaarUti3fnV5HWcr/bEl?=
 =?Windows-1252?Q?tNvR+tuFTpz1KyjxGOMoULOQ8phIxILI+tk4NK7f2dwI9/YRXaBtKc4E?=
 =?Windows-1252?Q?+XxqWrv1L/zMBy6SimkxGtXbFDAFePeiDACyBkKuOWM5FK4wnHRyDYkN?=
 =?Windows-1252?Q?+UL+BAJGF2T1+uCaA6Vdutq/AR0ww47GcjJI5POKwAIAJgSYgZkStCSP?=
 =?Windows-1252?Q?BNR2tgMN7Ifbkx1zCfq6XQa8mTQvDQw1mF080jr+sSrrRmOCToFL7y30?=
 =?Windows-1252?Q?Y7QYeFZa8BchRnt+zQUOaVoYhYlKjyh38XCYmZsgIunMU2dZTXy1fdq0?=
 =?Windows-1252?Q?hhlqo1qih3ha/U0hjFYMojwuIwsytq0zzI/9Z3xaZ2J5DQkDibpeKQPa?=
 =?Windows-1252?Q?P4/wxRU5g4wJv6dSHfQKTqx29Xgze24EBJVx5NisbO9Kg3a2v2QlGCKZ?=
 =?Windows-1252?Q?5sBhJlP8+lPsRYJtuZM6qxB4CUKwQjfRQk+mVweGi/HJXUGJtpg/OLRl?=
 =?Windows-1252?Q?mEzud4jSTtPJa7vP4S/JKodWvz66Va7jQsxy17hV+Bp9uqAbHfQPs1Qh?=
 =?Windows-1252?Q?YWxxhINJiCGSif1477vJu8MJ0UJyA7nVk4i9Zdb5QNEJuKShPGjAggxx?=
 =?Windows-1252?Q?q+/+ks55KJsmBH5O+TKO7ghdoQnkTowaGrXES8H6kZTdHcKD1tDE0mvP?=
 =?Windows-1252?Q?n0Ri2oQZI88/aS+5atyqM6f1X3TMUNHJjhxqyRtXpuyh1x42BbmD+gP7?=
 =?Windows-1252?Q?uweyeqQE4+vqjFZejsvzzp6nFUY6w5QU/1RSnfRMpU4Bufb5Dci4maJ6?=
 =?Windows-1252?Q?YVgDTEnQN2iB1CUZGMktfUSXBVjIWGQLwOQp6XhN01xQC2WvogQG5Swv?=
 =?Windows-1252?Q?3SxetvVD9ql8NRY3atvIAu6AsB21i7ShiMw9Siyyt0+yG9nwq7oTnRHv?=
 =?Windows-1252?Q?NcN8eCmnu690S903wDfT4MJUeKeg/cf8HlGPl/ncw3NItOzalAOehcfs?=
 =?Windows-1252?Q?oEW7h3Gh5iccxtMlqdSNl+RjpJWiyFOEwmU=3D?=
Content-Type: multipart/alternative;
 boundary="_000_VI1PR0302MB34869449EE56F226FC3C21129C309VI1PR0302MB3486_"
MIME-Version: 1.0
X-OriginatorOrg: syrmia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0302MB3486.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d48be043-d5d8-4716-fe34-08d930222aa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 17:22:35.1157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 19214a73-c1ab-4e19-8f59-14bdcb09a66e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 956w0vp6FP2rRCTjCsLCSaA7CoMog3cYosUQlFz8RL8foLFW+H0wEhjlgBnl3ctangYbDYtn+Vh5Lt0ByBZwyNXy9QoZ93lCda4QwYdq+n0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR03MB3667
Received-SPF: pass client-ip=2a01:111:f400:fe1e::721;
 envelope-from=Aleksandar.Rikalo@syrmia.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Aleksandar Rikalo <Aleksandar.Rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?Windows-1252?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 =?Windows-1252?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--_000_VI1PR0302MB34869449EE56F226FC3C21129C309VI1PR0302MB3486_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Per the "MIPS=AE Architecture Extension: nanoMIPS32 DSP Technical
Reference Manual =97 Revision 0.04" p. 88 "BPOSGE32C", offset argument (imm=
)
should be left-shifted first.
This change was tested against test_dsp_r1_bposge32.c DSP test.

Reviewed-by: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Signed-off-by: Filip Vidojevic <filip.vidojevic@syrmia.com>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 797eba4434..2d0a723061 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -21137,7 +21137,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSState *=
env, DisasContext *ctx)
                                       extract32(ctx->opcode, 0, 1) << 13;

                         gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2=
,
-                                              imm);
+                                              imm << 1);
                     }
                     break;
                 default:
--
2.25.1

--_000_VI1PR0302MB34869449EE56F226FC3C21129C309VI1PR0302MB3486_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Per the &quot;MIPS=AE Architecture Extension: nanoMIPS32 DSP Technical</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div>Reference Manual =97 Revision 0.04&quot; p. 88 &quot;BPOSGE32C&quot;, =
offset argument (imm)</div>
<div>should be left-shifted first.</div>
<div>This change was tested against test_dsp_r1_bposge32.c DSP test.</div>
<div><br>
</div>
<div>Reviewed-by: Aleksandar Rikalo &lt;aleksandar.rikalo@syrmia.com&gt;<br=
>
</div>
<div>Signed-off-by: Filip Vidojevic &lt;filip.vidojevic@syrmia.com&gt;</div=
>
<div></div>
<div>---</div>
<div>&nbsp;target/mips/tcg/translate.c | 2 +-</div>
<div>&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)</div>
<div><br>
</div>
<div>diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c=
</div>
<div>index 797eba4434..2d0a723061 100644</div>
<div>--- a/target/mips/tcg/translate.c</div>
<div>+++ b/target/mips/tcg/translate.c</div>
<div>@@ -21137,7 +21137,7 @@ static int decode_nanomips_32_48_opc(CPUMIPSSt=
ate *env, DisasContext *ctx)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;extrac=
t32(ctx-&gt;opcode, 0, 1) &lt;&lt; 13;</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;gen_compute_branch_nm(ctx, OPC_BPOSGE32, 4, -1, -2,</di=
v>
<div>- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;imm);</div>
<div>+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp;imm &lt;&lt; 1);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;}</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;break;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;default:=
</div>
<div>-- </div>
2.25.1<br>
</div>
</body>
</html>

--_000_VI1PR0302MB34869449EE56F226FC3C21129C309VI1PR0302MB3486_--

