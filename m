Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2075A356FD9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 17:07:39 +0200 (CEST)
Received: from localhost ([::1]:47986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9mK-00050o-3K
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 11:07:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lU9eW-0000rT-LY; Wed, 07 Apr 2021 10:59:32 -0400
Received: from mail-eopbgr750134.outbound.protection.outlook.com
 ([40.107.75.134]:9865 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lU9eU-0004bB-Ob; Wed, 07 Apr 2021 10:59:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UzSpZVKu1+snlo4a4zQ88Ee9XnIu/FsuUi/k+bLTvPqsAb8HYOcXJS8DGMeX6u37c24QgaTdaBU0Z6iYnlBssi60oudeV3K4z+M+I4kBM9Z5h3qXjnP43/z3IC2LEYrw2CncH8PT/oiGPEd1WBWpSRlGLVZgkH2ujaZtYa8L+g6KrpgTg9KIYgY4X2fM2sdg1JhFKIyu3nguSYkhfKgyf4XHUv8u0kc3OarLAvJxtEr++q4T3uRHQJ3hrm2SOKchGs9OHfz6LTr3UQTsi0ZkH2fSV4bm7m/+muqhGdskiR0onaM/P5c+3D7a0u/UZvCtFE5f4f5UzAFkC6R7oYbmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4Iz+b5cGjhzzitZLfRV649fTJ9nmsP+WFMynrl/OI4=;
 b=d74jAAM0irFUNX00Hauv/V3Nbex5p1EabW6uZOa+VnsYQQSwQcjE0kY+4PB0sQNZWgze0aP3nwEGSCjYUEoKfoq6+ckyHa3DbgPG9arKLpEVacIGQlg/9wJlKULJoWVFrnRytDGZPhLJly/cEEdCg7jwHYrO1Fy+xs5OqGO1bjcezZrrTZxrwHcGT8atPRXljbTO1fCnSmYWryB68+2aP5Xt0jtP29/9EE4Za5ppeZ+/H6Te/aOMVtWDehxAT30z+WSz+KyagPdcuJC97FcMSxwLmszJtTl16o3muOcSyVaCTmmzzC7Vbtu6Da26UC2EyAiAW80r/ffD6Ga89fePCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p4Iz+b5cGjhzzitZLfRV649fTJ9nmsP+WFMynrl/OI4=;
 b=vIASLH/9/pAMyS7Bd3BygDARAf+HmYMLnNrI+6kNscpqVZiWp41Dw2snAYFRn9KrP/LMvRl85AUZ3KpxhitPQonvp2Avov/r0YNz39fwxUVaXteHy8d57PxO0d01Lx/vohlUFAcb1KJDCAgxshw60Lj6JFqMpOAyTI5AIEC95WHbvvedIjAJDjrF87+UHlRhDQINDqr0Msj7M+W4KITmj+2r8h0i7RWMctjr9fEJa+Qklun/ZucICYvWykTyAEhpMhfGgxhWkXHENsoxbxOpUJlvj/eFj8OcZvsip9EYHTOsl5frXMpFJp9pxtbv8wbKR8ZjRdb0Z61X3ISdTWBmMA==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB3522.lamprd80.prod.outlook.com (2603:10d6:102:34::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Wed, 7 Apr
 2021 14:59:24 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.3999.034; Wed, 7 Apr 2021
 14:59:24 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH 1/1] decodetree: Add support for 64-bit instructions
Thread-Topic: [PATCH 1/1] decodetree: Add support for 64-bit instructions
Thread-Index: Adcru3f/1C/JJpODS4CYUeUmi1rLbg==
Date: Wed, 7 Apr 2021 14:59:24 +0000
Message-ID: <CP2PR80MB36688C896376D6D8601E1EB5DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.188.65.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 72ee198a-b593-4925-8d00-08d8f9d5bbe8
x-ms-traffictypediagnostic: CP2PR80MB3522:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB352293FD55316DE8369197DCDA759@CP2PR80MB3522.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aeVZB1LC/5D5FVv9I3nLHXDxBgLrGpPlwC907/5XQEh7DHZT9bs2oykhhRo5M2CG1Rlku7cboXzEDyASnPFjDOJXZ3M+naHmyBsWNNhrYc52rF/FWHB64sR2wV3ULA7iXliTL1+T8X0C3+Dm4KwWLzhTnjF2RHBSVRyaF41/t+iEzKHpE0vUYbmxav62HGYjOj9Ezbc5TD2r+1mJqDOar/wpXpWqKrqUzgUjUun/wBQYkSQddWKTxfrNv3ZbECSmRDwybTbRMYiy8g2gvWa1grT2nxRaq3L+EqOsv6JJeGeN3hEHob9Pzltr/bIC6tZTNQKtNu2Z8DPZTdn3Ew5zKOtreGOAHeNqyIUBIS0Gz3EOjNBPxgdRLpXxBk84AM9IvPhHh7NOFz8BaMZRuwYCV5B3Tm9VERSvKVwzJoN8P+sg9eIVubcuRXkmco9fXVudshQnRIEi/8F0AICc91RsSAVHmAgNyiRkzsXOI99+tQlFEoJvFgSsmpP7fKaZYehayNiJXu2d1ZiDHt/78eUVrQBYFwblpb2ZjvodltD2reSrVmWH1jpyNyQa53Zl4aNTw/ZVUxKVYyJZygQDuLqI497Y3a9aqRNAcrCrKng8kRKDLXpzRPI2+jmK7yKpgNRBDKRbEm9OR8QIqWczc0CyWRoA+m+UuXNC125sXFqdALU=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(396003)(39850400004)(346002)(136003)(6916009)(478600001)(52536014)(8936002)(5660300002)(316002)(71200400001)(7696005)(54906003)(2906002)(38100700001)(76116006)(64756008)(66946007)(66476007)(26005)(9686003)(33656002)(186003)(8676002)(55016002)(4326008)(107886003)(83380400001)(6506007)(86362001)(66446008)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?8pHlIbEsT6eFw1am/KnUYDn+YUeuU0nIShV8ykQKdHUGWbl7WEGoO8Mj5j62?=
 =?us-ascii?Q?/vISLi6VDOjh0g2PJGl9ANMNhDg0Btsp6DtXH8pSixVmEq8a9k/w20nL7xeT?=
 =?us-ascii?Q?tToQ8yAGqulO+b441NrPE8spIYRTEnj2hKInh8wcAf2kuNBK57okZtWcXDXJ?=
 =?us-ascii?Q?TIl0i5t//2ebzfVQIP7YnUk08Hn0qJAY9eGO2s59z9xNgQ3kL4DHSAq9nelr?=
 =?us-ascii?Q?Ot124FmDNgSqmL4ecAZX6Z9BFeQaScSlUY3YQxG78GDwPhg63KUdyJW6sGGW?=
 =?us-ascii?Q?hu28gRmB1mmC9Q2klG3aDNOA9Lo1jg11LYPQrPu/a8nV663bUDQVkL33Ss2R?=
 =?us-ascii?Q?IUQESjUVsSoHSoegXezSn739hdtiQuA4U2BEYlOq0DUddM+qhXoGu5DQQJBE?=
 =?us-ascii?Q?Y/qDmiX8D0F1bJYc3B+W8VMXhEfDie0MtemFTwTr/eDChgddst7z2aLPI7rn?=
 =?us-ascii?Q?F7oLbOY1RewV4zWa28AoXAwYeGdvZGRmELAkPp4uD9b9xoqqGs4yIDT+Zd4I?=
 =?us-ascii?Q?1bX3kS/DJlr6lPm15MPHZgUFiA2NhbylpDptslpCNpegKbCeARm1cRT5w/iU?=
 =?us-ascii?Q?AksZLQ24qg0O33HWBfnBYFbrZXV4cG+sVyHJ1zR65ORJriZoL2Vt7mYWtDVc?=
 =?us-ascii?Q?g+LcEeGc+ylVkvIaywOjiU1pb2YCJLPSv2ONlL//2h4N+NrwVps5zH6XHwPQ?=
 =?us-ascii?Q?3QfBV3feWDnn5VyFePTRxEwgTXpkp3IvVxH2kZM3j/sAvNyTZo/HClXQLpFY?=
 =?us-ascii?Q?cGzrts00+KviHaJ7+As1IBIOZdhwFshmalECNpMIot6eE0/9kcVlHtmTIl4L?=
 =?us-ascii?Q?6hFLHdSoVBc4hUs9/raAN2KPJf2/C7/RtcW7Hi0pSI/Lm58nUsIGf3VrFvd5?=
 =?us-ascii?Q?61fI/n+w5aB4XdiJPQNnGwHYiZ2hrizWoeN2DKb1zp2piVq+DgcDD6ox7vHA?=
 =?us-ascii?Q?DfFhc3rOu4rvKR79EnI00i8fkk8zEPGrCXiY1nywqLXUA1WvXeJoGVqaJ03C?=
 =?us-ascii?Q?DcPvYoL553Qoiw2J8qqG3gT1SdePrWmc5Pt7nqoib0EBKpgdb/XVMu0W3qgV?=
 =?us-ascii?Q?VMvIzXiEK7jA5r2zWmYbJ9LPsMCSfN9/rtBR56mP1W14swP+TEIi+hKB7VYR?=
 =?us-ascii?Q?Mc7Yegd0Bh0UniiS85luYD21ZzE874k07gAs4w+GKDGGH0WbZbEfFB6uNoiO?=
 =?us-ascii?Q?+3JkEG2XX+b1uEY9TptJ6/MLYg0fE70+FD3fyFrFCpsGVKCYfMv9pYt2Mc+/?=
 =?us-ascii?Q?H0dP0uHRsVPw7zZh1luky+eW/SUq3VDXZ87j7uNSmFYQbq9nTatadLhvU3M5?=
 =?us-ascii?Q?ucbd8PMbdkZ40L+u0QTv7rAX?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72ee198a-b593-4925-8d00-08d8f9d5bbe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 14:59:24.6769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UouGjyJrJd3CiubtOkAFnTLkoQazsR/HmK/KfWjhlm8HnSJH7xfnaNp2dK309L2i4jfFEL1OywI6CdCCCAJP8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3522
Received-SPF: pass client-ip=40.107.75.134;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
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
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow '64' to be specified for the instruction width command line params=20
and use the appropriate insn/field data types, mask, extract and deposit
functions in that case.

This will be used to implement the new 64-bit Power ISA 3.1 instructions.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 docs/devel/decodetree.rst |  3 ---
 scripts/decodetree.py     | 25 ++++++++++++++++++++-----
 2 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 74f66bf46e..505267234d 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -40,9 +40,6 @@ and returns an integral value extracted from there.

 A field with no ``unnamed_fields`` and no ``!function`` is in error.

-FIXME: the fields of the structure into which this result will be stored
-is restricted to ``int``.  Which means that we cannot expand 64-bit items.
-
 Field examples:

 +---------------------------+---------------------------------------------=
+
diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index 4637b633e7..3450a2a08d 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -42,6 +42,10 @@
 output_fd =3D None
 insntype =3D 'uint32_t'
 decode_function =3D 'decode'
+field_data_type =3D 'int'
+extract_function =3D 'extract32'
+sextract_function =3D 'sextract32'
+deposit_function =3D 'deposit32'

 # An identifier for C.
 re_C_ident =3D '[a-zA-Z][a-zA-Z0-9_]*'
@@ -185,9 +189,9 @@ def __str__(self):

     def str_extract(self):
         if self.sign:
-            extr =3D 'sextract32'
+            extr =3D sextract_function
         else:
-            extr =3D 'extract32'
+            extr =3D extract_function
         return '{0}(insn, {1}, {2})'.format(extr, self.pos, self.len)

     def __eq__(self, other):
@@ -215,8 +219,8 @@ def str_extract(self):
             if pos =3D=3D 0:
                 ret =3D f.str_extract()
             else:
-                ret =3D 'deposit32({0}, {1}, {2}, {3})' \
-                      .format(ret, pos, 32 - pos, f.str_extract())
+                ret =3D '{4}({0}, {1}, {2}, {3})' \
+                      .format(ret, pos, insnwidth - pos, f.str_extract(), =
deposit_function)
             pos +=3D f.len
         return ret

@@ -311,7 +315,7 @@ def output_def(self):
         if not self.extern:
             output('typedef struct {\n')
             for n in self.fields:
-                output('    int ', n, ';\n')
+                output('    ', field_data_type, ' ', n, ';\n')
             output('} ', self.struct_name(), ';\n\n')
 # end Arguments

@@ -1264,6 +1268,10 @@ def main():
     global insntype
     global insnmask
     global decode_function
+    global extract_function
+    global sextract_function
+    global deposit_function
+    global field_data_type
     global variablewidth
     global anyextern

@@ -1293,6 +1301,13 @@ def main():
             if insnwidth =3D=3D 16:
                 insntype =3D 'uint16_t'
                 insnmask =3D 0xffff
+            elif insnwidth =3D=3D 64:
+                insntype =3D 'uint64_t'
+                insnmask =3D 0xffffffffffffffff
+                field_data_type =3D 'int64_t'
+                extract_function =3D 'extract64'
+                sextract_function =3D 'sextract64'
+                deposit_function =3D 'deposit64'
             elif insnwidth !=3D 32:
                 error(0, 'cannot handle insns of width', insnwidth)
         else:
--
2.25.1

