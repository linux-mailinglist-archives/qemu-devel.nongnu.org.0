Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A5357799
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 00:21:14 +0200 (CEST)
Received: from localhost ([::1]:37860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUGXx-0005Oy-0R
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 18:21:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lUGVj-0004gX-UT; Wed, 07 Apr 2021 18:18:55 -0400
Received: from mail-dm3nam07on2099.outbound.protection.outlook.com
 ([40.107.95.99]:31488 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lUGVh-0000Yt-Ts; Wed, 07 Apr 2021 18:18:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REAdnE1BBHEmELKT82Z+ICzpRP18YtAbQfsHcWa3jnq7UNQqTvTaIwl3PTW58+QXHklw4ua/YEsZ7Y1Qko7GPxxzL3EwF0bWCX5Vrp0vM4lfVTb0r9mTp1gYYiiOlTnXOCYoBr6RlDbriKFOGgPCMNadjqiSnfjibgUoKDU+7RdKW9g6wbgPeVLYs7muMLvcQEzFw8CLqqnFF5jhiAplqliIrZSZE+W+mZ1AlzS2AzoQ/Q1M1UZnE1Hp94AOhS0cz95XFFXKbgJlEICz6f7k5ajwobRfVr8lw1o/qSjNf91FGL1+uRMOqSXX0x9uGTmzY5AU7m+7aIsgPBD9McSjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XV2onAAlaWDfZbfCqIzqGc52yB+4ASBRByB29KBpAY=;
 b=CHXKpxetEdsyRWsRFkvPM1JyyDK1IN5AtOJgoREfjcoCZZxABAcjTEJlWfJLzJ4/EiZC8UaODdhuYmAPqJZ0dwCFcJfrdHzofqHcKJ+i+MoHYaq5bjLoG6up+rkPAb1BJrfSvAepNHpEAu8KYneY/qVCGafIhhgHVd+OwZtgaHkdb1DzMN+7q4ioHFxFQDhX/xeJ5rFTplJFahEi4vEtNYXl6UhEVWraZcLaxLDkR2KH6INJz5cdj8kCXg3kGITxhwiGC7uAwlUNG2YlA5K+hYqj28HL3ZJxgUJhxU+VYgc4pM6xY2yk3qOfzvAkDtjgI25FYvXYExDMpoDaptDB2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6XV2onAAlaWDfZbfCqIzqGc52yB+4ASBRByB29KBpAY=;
 b=Ci1oA2OD/13We02thrhk8kEhXaLROOHDtuN0UtIGITbex3oWpuK+3B0FwoINmkrhxw8d+jJqjFzgYeHWpFSMuFxHGmJGZIZ2bWS4J5hssdExOw4AgpOOQ5CUN1K7NdINn0zunnJg73M8I/B+jnDRCsbDvnksNVPkWLn3pXayUa0N29+pf08Y1BNpVoBaYcMdBSzx2yLcAOE8GFf9K7gOHhypaqAiGBb9Ya8o9QpygJCq2b1bbM/682fMfn8vGCDkTQP5CcDy7AOvmHe0hrWjiySrYTY1c4bMsATEdJNH8IZMNqwNqTx9WHCfeAZ6wBTscbB6ZYtvTxVkigD2F/hVSQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CPXPR80MB5367.lamprd80.prod.outlook.com (2603:10d6:103:48::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.16; Wed, 7 Apr
 2021 22:18:49 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.3999.034; Wed, 7 Apr 2021
 22:18:49 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: [PATCH v2 1/1] decodetree: Add support for 64-bit instructions
Thread-Topic: [PATCH v2 1/1] decodetree: Add support for 64-bit instructions
Thread-Index: Adcr+9lqVTSiWhrwSiaI9clDmKvHGg==
Date: Wed, 7 Apr 2021 22:18:49 +0000
Message-ID: <CP2PR80MB3668E123E2EFDB0ACD3A46F1DA759@CP2PR80MB3668.lamprd80.prod.outlook.com>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: nongnu.org; dkim=none (message not signed)
 header.d=none; nongnu.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [177.188.65.23]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3a4bd15b-9eaf-4ace-d513-08d8fa131eb3
x-ms-traffictypediagnostic: CPXPR80MB5367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CPXPR80MB5367465273752DA4E05ECD3BDA759@CPXPR80MB5367.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EQcsXCyFsHKqhnx/9frL24sYEbAVQbVi7fgeaiCYAFwS/hZ1bdL9kl+I7RVY+bo3ibZfWMGFwW0BSTvDZksIOg8NAm+vVJBwy3edwmX6FCx149uLHSZH03HlyN+EA+Jxxzx/Sl8UBAjD/oYJz59bvU1b6BgFEnWf/C9fcJ09e0vtbLq0D5oWZkCx7MZ88ScVgSHUtZRaWZ3W5QqzGTDywDIPxoK2tljYhTVG41O7LonQkgR/UlHGhiK5JB499omo8shJpGgdmMMzjFQO1hkXTxzasnwRnI+Tuk3ScsTte4fQD4P331AUghxnlVMg5jeNmGNNmqORvnZwg44+V6rlcpxJIuNzZFGN8J9it4q6dsjCb7SrUatlx+KaKe2ZvRk96c/nb2BUS4gtpTXx18HAXxBZmmuiDWaD4KMp0W7W21lLLskq9KDSBH4MUJVodX90YVaq7gCWXy/sGqu4bGOUEoehGISF1KSOySmRXDBHLoo8kTD30ecjpNw//CTQJ2vlI0xk9QWhlgbnZRAQpbWeTrMcaN6UwTfTcYiXhQBJRFuF+pzx8pNjS8MgPjlj6PsN9a//pY/zzo9ypmSra+NsjW4IDtMcVraunTLhkvI8snfdphsTzrU9Hh44OH2QfQ9f3L79q8zNARR50/NOFlg9X4YeDrmfOJpYlHdifrh1uwk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(39850400004)(136003)(396003)(366004)(71200400001)(66556008)(66476007)(76116006)(66946007)(64756008)(5660300002)(33656002)(66446008)(83380400001)(8676002)(55016002)(38100700001)(6506007)(316002)(54906003)(7696005)(6916009)(107886003)(478600001)(4326008)(9686003)(2906002)(52536014)(86362001)(8936002)(26005)(186003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5fTcHF4+UHEiDTOYW1nOOMSMRxpvgyKYXniMkWC0wZWws5IBqfg8zkONHi7Q?=
 =?us-ascii?Q?vP+grAnOl2IHBVB+L1fK8L63rFxj5fPCJhgNRWT/763fcK7oawunUoX7Lc7S?=
 =?us-ascii?Q?47yp6RWr2AWvuv2cOmebxmw9pdbm+sDRwYj0NOw0QzJhvYUE0d5P659MBYJK?=
 =?us-ascii?Q?FHIMHleS5xTOT5zUBd9aGxAy39naOGncyVMNOJOXRdO3DQQW2ZT9FZEl+YhW?=
 =?us-ascii?Q?1AEJ1A7V2Z1E23uZMjnnK+qmUc5bKkkcHfHVpqcRt8gJLd16jvhGRrlo3vI2?=
 =?us-ascii?Q?heLAVFSZjIBXMboloQfixKBTv+CxHYaKoxw2ZPalvxkoW0GvnI1VsoXnOp3e?=
 =?us-ascii?Q?tB9DeBioSDVvgkk7q7b0ytfHMhibOKmweS6uNrK6DwvF6S2v5aAK0OMP0BJm?=
 =?us-ascii?Q?treWNYSs9I+HHDbrMg+XCJbBfyjTi+gC+cD9Ayz9PYAXqvbUoZx05Zsfkm1l?=
 =?us-ascii?Q?Tysii4px0ZYG8lPQlhyXPeS6aKFL0NNuph9J3h7VVRjXc3jOEwvpDpxi2M/y?=
 =?us-ascii?Q?L7Fgndlk2KJ+5jf2Ruap129DzG5lVbfsLZ0a+jUIsl9784GYoYe/BPqQA+N3?=
 =?us-ascii?Q?8CzAneMDKlpxk0C+zsG4JN32wfAtdFwH52iC+Acl4gu4TgwEbrJIPmsUjIcN?=
 =?us-ascii?Q?yYHP53sejLBOnvjpOVdeWWxi9f5u/ZdcA5K+J+Msvinz65XojAj9VtYY3lEG?=
 =?us-ascii?Q?0YgutV0Ph7oD8OpSATF4dUmfaDemLkKfmSeJv6H0eqQ2Ebj+ZBuivyCYVes5?=
 =?us-ascii?Q?qLycD5oLuRvmpg8bkEm9xPU5/31yXm1cd+zIGbmQUE3D+iMdchnJ94i8YEnV?=
 =?us-ascii?Q?y6EiD1TuG6rMLPtS9rxt5KUiqu2iyU1Q6UhodVNu+ObYALcIZoXlp8lD+msn?=
 =?us-ascii?Q?i/4ZpiPdOITSIkRgodL2N3dAMGXUChh2NHk076ACXG+1qpiUsxXMIF+yMRug?=
 =?us-ascii?Q?+NfUWVx3jjVMXEKYqOJhWbeD0y+3sJCBgugtYOFGX6pgT8wy0SRD0hOhLW0p?=
 =?us-ascii?Q?BnMuO0569fVZWdFVIgMO90NNTAXBOMOzC0357rFJP28RqNk4Ev0CGQOuWPy4?=
 =?us-ascii?Q?R6/S6YqgbRbcJpTVuv/O1n6mrOsPcQ4Ns6Sl/0fuRKyeYw42r0BvyZKxLk8Q?=
 =?us-ascii?Q?gsHk053+C9hExIVSRYxAvsGJFWU1hJiShcHqMtRavQTjx61KPs2OOEzmdiSh?=
 =?us-ascii?Q?EcAKanCdNqrZq5q5fkYvZvH1mECKPjpnVVOb6U16PxHqZ/oyk7je+9tZcmEj?=
 =?us-ascii?Q?OlAJaIiH/0qkHPNkRwf3Z1ng6AD8fxdb4DMHpFmujjXXt+5w4mzE3n4iZS/B?=
 =?us-ascii?Q?Rryr/m04OVTBnHUchxI8W1wM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4bd15b-9eaf-4ace-d513-08d8fa131eb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2021 22:18:49.8601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i2jdXwctxZtg9xPTOfiV7ZJRuxYLiFKK3yr+Pp6r6RK94UxQkckfct4yriAV+BC0qJ+LUpnc5f17r+lwLNuXyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CPXPR80MB5367
Received-SPF: pass client-ip=40.107.95.99;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow '64' to be specified for the instruction width command line params
and use the appropriate insn/field data types, mask, extract and deposit
functions in that case.

This will be used to implement the new 64-bit Power ISA 3.1 instructions.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 docs/devel/decodetree.rst |  5 +++--
 scripts/decodetree.py     | 25 ++++++++++++++++++++-----
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/docs/devel/decodetree.rst b/docs/devel/decodetree.rst
index 74f66bf46e..d776dae14f 100644
--- a/docs/devel/decodetree.rst
+++ b/docs/devel/decodetree.rst
@@ -40,8 +40,9 @@ and returns an integral value extracted from there.
=20
 A field with no ``unnamed_fields`` and no ``!function`` is in error.
=20
-FIXME: the fields of the structure into which this result will be stored
-is restricted to ``int``.  Which means that we cannot expand 64-bit items.
+The fields of the structure into which this result will be stored are
+defined as ``int`` when the instruction size is set to 16 or 32 bits
+and as ``int64_t`` when the instruction size is set to 64 bits.
=20
 Field examples:
=20
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
=20
 # An identifier for C.
 re_C_ident =3D '[a-zA-Z][a-zA-Z0-9_]*'
@@ -185,9 +189,9 @@ def __str__(self):
=20
     def str_extract(self):
         if self.sign:
-            extr =3D 'sextract32'
+            extr =3D sextract_function
         else:
-            extr =3D 'extract32'
+            extr =3D extract_function
         return '{0}(insn, {1}, {2})'.format(extr, self.pos, self.len)
=20
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
=20
@@ -311,7 +315,7 @@ def output_def(self):
         if not self.extern:
             output('typedef struct {\n')
             for n in self.fields:
-                output('    int ', n, ';\n')
+                output('    ', field_data_type, ' ', n, ';\n')
             output('} ', self.struct_name(), ';\n\n')
 # end Arguments
=20
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
=20
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
--=20
2.25.1

