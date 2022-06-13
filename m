Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3B65485E1
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 16:51:37 +0200 (CEST)
Received: from localhost ([::1]:51672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0lPi-0004PK-6z
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 10:51:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o0lNQ-0003YM-Mk; Mon, 13 Jun 2022 10:49:12 -0400
Received: from mail-mw2nam04on2132.outbound.protection.outlook.com
 ([40.107.101.132]:7740 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1o0lNN-0001uX-JN; Mon, 13 Jun 2022 10:49:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N0VeLODRfheAGlD3qnMnxvn+xQoUati2pXbU9LAOq7ZILye7FKIkZlnX5HwzhkHwQ16p72tpYfaX6y2KuGQKYalVoPg3jvE1XX3gvnXCG9Jq2NdLbJFkX0UyQfzKl4WDWn9Wyu8/Xpz3Pur9KFjOyb30OwrAQqrfCjPXdeYEv9F3xqe/vjZqvuCy8gI9+zJst0gJdtZtJotv3nyx9APlSdf/ROwl/KSDDVuhAQIviykKvnR0WtUiDzYDwlYU7Q2s9gKgAV25tE7ldtfEk3SoyGxwOZ6i7/Q83YMGjYy3dXK2WqG+GrL/h8lOKsg4BbOXuUMo1iY61UzGQ/8J0EarHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96jPfVPTsdLuoVQUKFq5rCSyLhS2OuUA8favAd51/IE=;
 b=J7E6jsZ5GbFYlDvzFp/ANqkIcpsTGTnZAhz98xvQ1ctJnR5gwb2dyrMpuI54NAAvXZoVhRR9PPgFYSVD2XOR3dYWsoj0hqvtguYORJXE1tM+LdM0CX4eBeZWtO1IsRqbu3RMo+O/PIwrJBy1/xvaWkY5khj344scDFUX3hF2Oc/lZF3oJryUc9Cb8QQMABGtVTX4sKhGOpoAXpbgAVfsPRQhq/kaf28TbnaJ1mfbehI+WZXZP/GD4l8LU1fAiEx0fEqeE6dPPNnNZ0TXWFKTUC+A1xuy3sTQxWRywN3gGeOZ6be8RTewQsDluEPQTJorTBZjegslqVWAn0ysO1MVFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96jPfVPTsdLuoVQUKFq5rCSyLhS2OuUA8favAd51/IE=;
 b=p95lTjIUA1UA09eiRst6FgySUVVhJCorctpyKDnN6+4vwZmjdAIDGo80x5NCqdP7vSZQkRfN8LN360+Ee5EA/RMfb8LBtROUnmfX42AAS2Cl/jAthmizAMmTiDCbnpbb5wwlvSSDFChv/vh4IeejMS/8oz10bvmveFvO422/PdDJCuLApUeBOMo/FXINqRUrWFOy2rp4JS1CL2hNc2PyUeJsblo4xSb7XK0ALNU8+rdjYNbLBNOoqPtYjTo1L18n2uSTgOXHriON38kcrfwPJhAWLI+sCPDwVVeG3Ww7R7BEye5wqSqTRmnRDH+Kn3pk5WBzGzRRFn9Pk7Tp17vdQw==
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com (2603:10d6:102:3d::17)
 by SC1PR80MB4976.lamprd80.prod.outlook.com (2603:10d6:300:1c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 14:44:00 +0000
Received: from CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07]) by CP2PR80MB3969.lamprd80.prod.outlook.com
 ([fe80::fc59:c02f:9409:5a07%4]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 14:44:00 +0000
From: Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-ppc@nongnu.org"
 <qemu-ppc@nongnu.org>
CC: "richard.henderson@linaro.org" <richard.henderson@linaro.org>, Matheus
 Kowalczuk Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH] tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]
Thread-Topic: [RFC PATCH] tcg/ppc: implement rem[u]_i{32,64} with mod[su][wd]
Thread-Index: AQHYfzQETlFMKXHJmEuJd0q0tHuElw==
Date: Mon, 13 Jun 2022 14:43:59 +0000
Message-ID: <20220613144350.642278-1-matheus.ferst@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.25.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=eldorado.org.br;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 04e04d65-de3a-4bd7-b048-08da4d4b2714
x-ms-traffictypediagnostic: SC1PR80MB4976:EE_
x-microsoft-antispam-prvs: <SC1PR80MB49769582023EB3016C63733CA1AB9@SC1PR80MB4976.lamprd80.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RjpvCb+MFW1c90xM/Chpja23iZs6RkkN6oZXKaTO89AcZSXCNNA66tRekWJD19R68yJ25dl9vsLNDEfxMbpsE/8M1ZEDWzVz0ZU4KdAj3wc+TjFr6wgBDJkb0EGxKBHvifvtnkTVKDqQjnGVmR/Uho38aAIY+JLNuXp9nq0e3OH6p3EKPnXK5WlAAOiae4zv736ohGO9Ec2ih6AQFIn/BOVNfARHjx+btfM2SzL0Qc0mHq/ICG9o9Bbys659FJC7BuN7TFbgGtTAKA3QNKpfIbStOkIFVm3uQ/gQY6xOcrB9nlJdscl7dLZet5/17QZOuO2VmUtjHRPlaZhmNwfwPKts23SAaC7Uwz/ByfLunYA0rgLdJiADsf8/fiEJRAhluDP6c7utcR/4tbb1y5Gwqsn3pDlOzhHHiqOiRprqNgmsSphQQYZ/SvcRdtyg0GBJY3shcp3P655j64UWR4FzZ47U8qA+RRYHs/nZvuZD/xMqGvz9u8QRg08UPplfk96TBtYxYrlJirgyyMOpJzCmpjgwEY6Jt1Dmff1canpqP0n8Qwv/0mJ3RxVxiti1sfDxvcjNICkNucNkGVnSkLCEcVb4+EcAxtYCZUJHO7bL7SCun6AmBouCvpktlWMwLODScMZp1y5iMG3taPCUOoANONR7eMGLij56vaAGCAKpHyUlSTDBsXQ19IJYTg4RNw4fUkRkdzWF4Rlptac/nLIdxg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3969.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(186003)(2906002)(38070700005)(122000001)(316002)(1076003)(6506007)(107886003)(8676002)(71200400001)(2616005)(508600001)(66446008)(8936002)(76116006)(66476007)(38100700002)(86362001)(66946007)(5660300002)(66556008)(6512007)(26005)(64756008)(6486002)(54906003)(83380400001)(110136005)(4326008)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hHcH1mKJea6lKog5OSiLmc0QpvNf1F6qoVBzjQD8JYcYKBTE/qZFXRcduv?=
 =?iso-8859-1?Q?6VNCu9GEdo1YixWiDV1i2sXAlyZEK2I/cXeiywwrrUKU7HWywZ64clRigK?=
 =?iso-8859-1?Q?rnGN2E1eWoO6zRryrGqEHImWy+UazTNJmyzFrEapjaMZr+RxAX48doOuPb?=
 =?iso-8859-1?Q?HJs51FQtc6WViplCPuWsFKmHGYRg/MANQCbJ4FZx3v2mEy+SDz7j5wCijy?=
 =?iso-8859-1?Q?1btYvWj20fOkp1lDqpzLCXQci3K6HxNEV3DSBxEmqcFyWxtnuSXW+GQPrh?=
 =?iso-8859-1?Q?l2O3q0MhWZsgJo3Y54wjGIVfitc78ApL0kfNvq7xfG8VOH1l0AFrCtUh3S?=
 =?iso-8859-1?Q?wMc85n26XDmlw2GlPIRNdiy1/msDz+L+2wDbNjUAkPamFTeRZeu4s8wF5h?=
 =?iso-8859-1?Q?a9AodV9R3W832HGeKE3ifps1Wv5KxvA3SUlK8bFr6Ts32rbUdhu6UnwLsX?=
 =?iso-8859-1?Q?DBXhP+1h+X2+/kBfOhS4WAOPWOEPxZRAcLWhr3YmYPcLC6kSmNP0tHAw62?=
 =?iso-8859-1?Q?G36WCZfBL9lI9hN0IzGbx4vNR0BoqIj0SowktnolydcOoFPVAegdcKWvXU?=
 =?iso-8859-1?Q?4wSnbcghVfkKzWJwqrnUyTn1zZhtTbht8OXjAGsdJw+yly5g1ZG1mFzXAw?=
 =?iso-8859-1?Q?SGLQ5q0Q+p+8S5iBn0kzMRYuZv/6Du5yHTAQN7AW0vg4X5OvbwCQEgLEev?=
 =?iso-8859-1?Q?SQqd4XdVzCc0EJEFJW/rnOXD3XKlo5qbnyCktLILoo5Cp0ma8t1J/9fWqA?=
 =?iso-8859-1?Q?tv79VRnjSJZawuNPipPcLiAX6t4SlukVLOATWp64eyHZutveNXQ0UktIBJ?=
 =?iso-8859-1?Q?delI9rGk9UK8rWG33KeI8b6Ui/Fs1PhtM62Ps/l6OxMxX9z17jvgCuxiMG?=
 =?iso-8859-1?Q?OBckZUEdsPpzXoDoExuk/ZWYooYu6cVlPdXb0+7F2nYmz5BssZ+EN9SV2c?=
 =?iso-8859-1?Q?tISgBg1vRMyddiMgacEE1/jjFBn0O/xGlGhOsbJsX6Su039DgzYjg1OyBW?=
 =?iso-8859-1?Q?a6JgT0xeWXik2wZm/wzwsV2WrxXfFuDB0u3bda4fTzOzw8ngmPZ8LfYlAQ?=
 =?iso-8859-1?Q?OxsMtmhVhIb+h9TlPg/1qwN3yBurorjkhC+CTCoxzNP7uVjPhFXba34gSN?=
 =?iso-8859-1?Q?bWUWS6ooxMlxDwZgrSBvd3C3VPQZfjF7fStcCMalu92lIYR9GwHSzS3FmC?=
 =?iso-8859-1?Q?lx65OqQJNzbtnxuAxTWUdfhkB2YghWiPAbR6a91naG7iNHDrIxGWUGO3w3?=
 =?iso-8859-1?Q?1kKdNdyJiKrZZXl9wI9jhJutXM/dFCrqUaDPeFwXnSBbB83xVLDltpwV91?=
 =?iso-8859-1?Q?hbyKXHqZESLW2IuA5UdyhaJoV3fhdg/f0HQpbCzhy0KdBJszQfiRfBUJI8?=
 =?iso-8859-1?Q?Ed55UR3Q0RrxWaxnyD9vsrNm0PsDsphQECaZa/wpTUQygWwPL6WLHYih5W?=
 =?iso-8859-1?Q?M04qiVE7enMSRQDgTtBk+0/ggTDfUN6Zg2L7xeb/h65FT99rcU5k/C+SAx?=
 =?iso-8859-1?Q?9NRjaZZWe+ctK6dFOjn1H+00LDmDhunvWLorMCTonWW6zLnOuXzwCpZPhy?=
 =?iso-8859-1?Q?+XmMlJxiM1Hxw1yApZNw5+cf97J9QaJlVMsGvSrWCitGyX2trPWDk5OwxE?=
 =?iso-8859-1?Q?sAcNpFg9iYt7lWlbWyqtnrgGVQHdjw+lM7sWzJNI4pFIuG18h7AHz8X0yI?=
 =?iso-8859-1?Q?/RhAYQTQnFGo3FrzOFH4m+5Y6vefl0aPTE4BhGbqAr45QsPPodxkOay9ZK?=
 =?iso-8859-1?Q?IGwqtodyWVZfK5AK9JNHrEEqMYA/BJYbLVNLjN+aWRUPgCm8p2xElCSmfF?=
 =?iso-8859-1?Q?b605RPKabYAjbo9tt3Fmh3JS6tWpi5pTY7zhdsPcfZFidVIz/RXb?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3969.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04e04d65-de3a-4bd7-b048-08da4d4b2714
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jun 2022 14:43:59.9430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ER8LNpGDkXrWcycMuPptCu6ezkcZYjiWByPLfaYgsgHZFszKhU2+PjUHCm98Xe21NRBAbIbqywm5/1hsQO8B8xb1UUtiqxZhO5q/yZjo2lI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SC1PR80MB4976
Received-SPF: pass client-ip=40.107.101.132;
 envelope-from=matheus.ferst@eldorado.org.br;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Power ISA v3.0 introduced mod[su][wd] insns that can be used to
implement rem[u]_i{32,64}.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 tcg/ppc/tcg-target.c.inc | 22 ++++++++++++++++++++++
 tcg/ppc/tcg-target.h     |  4 ++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index de4483e43b..1cbd047ab3 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -371,6 +371,8 @@ static bool tcg_target_const_match(int64_t val, TCGType=
 type, int ct)
 #define MULHWU XO31( 11)
 #define DIVW   XO31(491)
 #define DIVWU  XO31(459)
+#define MODSW  XO31(779)
+#define MODUW  XO31(267)
 #define CMP    XO31(  0)
 #define CMPL   XO31( 32)
 #define LHBRX  XO31(790)
@@ -403,6 +405,8 @@ static bool tcg_target_const_match(int64_t val, TCGType=
 type, int ct)
 #define MULHDU XO31(  9)
 #define DIVD   XO31(489)
 #define DIVDU  XO31(457)
+#define MODSD  XO31(777)
+#define MODUD  XO31(265)
=20
 #define LBZX   XO31( 87)
 #define LHZX   XO31(279)
@@ -2806,6 +2810,14 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
         tcg_out32(s, DIVWU | TAB(args[0], args[1], args[2]));
         break;
=20
+    case INDEX_op_rem_i32:
+        tcg_out32(s, MODSW | TAB(args[0], args[1], args[2]));
+        break;
+
+    case INDEX_op_remu_i32:
+        tcg_out32(s, MODUW | TAB(args[0], args[1], args[2]));
+        break;
+
     case INDEX_op_shl_i32:
         if (const_args[2]) {
             /* Limit immediate shift count lest we create an illegal insn.=
  */
@@ -2947,6 +2959,12 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc,
     case INDEX_op_divu_i64:
         tcg_out32(s, DIVDU | TAB(args[0], args[1], args[2]));
         break;
+    case INDEX_op_rem_i64:
+        tcg_out32(s, MODSD | TAB(args[0], args[1], args[2]));
+        break;
+    case INDEX_op_remu_i64:
+        tcg_out32(s, MODUD | TAB(args[0], args[1], args[2]));
+        break;
=20
     case INDEX_op_qemu_ld_i32:
         tcg_out_qemu_ld(s, args, false);
@@ -3722,6 +3740,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpc=
ode op)
=20
     case INDEX_op_div_i32:
     case INDEX_op_divu_i32:
+    case INDEX_op_rem_i32:
+    case INDEX_op_remu_i32:
     case INDEX_op_nand_i32:
     case INDEX_op_nor_i32:
     case INDEX_op_muluh_i32:
@@ -3732,6 +3752,8 @@ static TCGConstraintSetIndex tcg_target_op_def(TCGOpc=
ode op)
     case INDEX_op_nor_i64:
     case INDEX_op_div_i64:
     case INDEX_op_divu_i64:
+    case INDEX_op_rem_i64:
+    case INDEX_op_remu_i64:
     case INDEX_op_mulsh_i64:
     case INDEX_op_muluh_i64:
         return C_O1_I2(r, r, r);
diff --git a/tcg/ppc/tcg-target.h b/tcg/ppc/tcg-target.h
index e6cf72503f..b5cd225cfa 100644
--- a/tcg/ppc/tcg-target.h
+++ b/tcg/ppc/tcg-target.h
@@ -83,7 +83,7 @@ extern bool have_vsx;
=20
 /* optional instructions */
 #define TCG_TARGET_HAS_div_i32          1
-#define TCG_TARGET_HAS_rem_i32          0
+#define TCG_TARGET_HAS_rem_i32          have_isa_3_00
 #define TCG_TARGET_HAS_rot_i32          1
 #define TCG_TARGET_HAS_ext8s_i32        1
 #define TCG_TARGET_HAS_ext16s_i32       1
@@ -117,7 +117,7 @@ extern bool have_vsx;
 #define TCG_TARGET_HAS_extrl_i64_i32    0
 #define TCG_TARGET_HAS_extrh_i64_i32    0
 #define TCG_TARGET_HAS_div_i64          1
-#define TCG_TARGET_HAS_rem_i64          0
+#define TCG_TARGET_HAS_rem_i64          have_isa_3_00
 #define TCG_TARGET_HAS_rot_i64          1
 #define TCG_TARGET_HAS_ext8s_i64        1
 #define TCG_TARGET_HAS_ext16s_i64       1
--=20
2.25.1

