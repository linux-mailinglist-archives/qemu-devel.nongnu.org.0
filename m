Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9716335E73F
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 21:47:26 +0200 (CEST)
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWP0O-0008QI-FM
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 15:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWOw0-0006pF-1p; Tue, 13 Apr 2021 15:42:52 -0400
Received: from mail-eopbgr820124.outbound.protection.outlook.com
 ([40.107.82.124]:19240 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lWOvx-0004zC-VY; Tue, 13 Apr 2021 15:42:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHyEltbmGk47MNnenFvcF3TOSNIVlCbLGW4Pc/YFWzya2tDPIFM5BUvgw3JNIMRhKqdgv8Hc93lOd76XTKTiv0LEl55GSg4hYYGkeCU5GLzOTIu/UpLHl0Y1Kh48zUTH48xSy4iLsPxk2Zjm0mX2LgjNfOaRf3ruktPL8WRvPtQXHabuNksx5uJcYOCy13dgNakveDLS6b2z4ScV40X6i3soQ7BE6ToXQB2RVsaRbwoEq4wOWW7cjp0qDms7TZFf/7sLoRWUx9NrDYOK9sDyHgmZxxe7Eo8kwSHriWdbx27cSA+rOJeE9C4J81cdK5v2ewksoPSX15iTErdxXlpK6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXn7g293gRPgi2idJXQaMSdAK29OAGtU+Gi5zdzkCS4=;
 b=gql3o4mLSaw4ufr0MmCt/ORCmGDa7RxArqaEoX3lTnvhBmQD7yg42ULiSlSK62MqKIoPmwiihZMgzWukkyrJeSs/Sw22Q5qYlFxebz86FxYPkQtGX8pSXK+lKZsyW+2l8n3CYtZ435P+L5fk/9ZJEfYYO5K8KB18AW+JquG2vEzRHlFex1OEdiUeJGQmbMYg4hHgUEn0HMj8PtHH1/IlAEUAxRC18acnUmberCS1oHldYgdGIc3joiHJA5CLF2E3lXFPcKPlttT/rghTLoIVaMZuUL52zeFJpHKoIXQJr5o505ChuV7tCmdshxfzcejlTszV7UrN3c2TqOmNx5blAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXn7g293gRPgi2idJXQaMSdAK29OAGtU+Gi5zdzkCS4=;
 b=sUAMTwRsHho5XhSnoy3NPnjshZHUDwosr2V2JocTPBL9AIij0wruDZmtU7eC4IDiI+8tTKzYecRzPiuTWDu/2sa/eUxP8HApu+u4ac9RY8Bk7W2U/eokLFByJX3JAAbcYUD5rNQyU5zoSvlDaRt57CZuiBCWkwV/sbpITEEj8Lkx+kazaz8XXXv+zvyX0VPZL+9XTnEetxlPq0aFIZOmNsB1cmmaDl0pISn7e2uvU+23JiN2u59++Z5nodyYHess7+AYNXrUJqWvN/lql48rCtwDkt56GQcSxu/NESWV/li3RJZSmv5K2FsZlq+uBkaOh41BVKvRvOwhUxRf+DQwZQ==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB1906.lamprd80.prod.outlook.com (2603:10d6:101:a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Tue, 13 Apr
 2021 19:42:45 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4020.022; Tue, 13 Apr 2021
 19:42:45 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: [PATCH] decodetree: Allow custom var width load functions
Thread-Topic: [PATCH] decodetree: Allow custom var width load functions
Thread-Index: AQHXMJEyd2KIdutwYEeryQHfJ0nUtqqy2PuQ
Date: Tue, 13 Apr 2021 19:42:44 +0000
Message-ID: <CP2PR80MB3668BAEFF6D11C71218E3683DA4F9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210413181615.414685-1-luis.pires@eldorado.org.br>
In-Reply-To: <20210413181615.414685-1-luis.pires@eldorado.org.br>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: eldorado.org.br; dkim=none (message not signed)
 header.d=none;eldorado.org.br; dmarc=none action=none
 header.from=eldorado.org.br;
x-originating-ip: [189.0.171.137]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a339165e-ee8e-4cee-9a70-08d8feb44f55
x-ms-traffictypediagnostic: CP2PR80MB1906:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB1906F6F56792F33B53951421DA4F9@CP2PR80MB1906.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7aVP2oK3DFgcFgMQLJb3egX1LtEPuYbWp0dcxtudg7AoUGD78lJ5t9vhMGygwv7IuKDmWRmuwHPiPpZAXjb5h3GYd0doT9hfevCyQaYCNpF8HNUSCg1QvZ/8MSCbFidSfbU0c7vyEdTOiCqkFuPL4iuESBZDrl1uPiKmYIrYPggQb/T9+qbKLSMBaU4R0rh4hACovIaa8OLOlHYHON1/iFBtOpgbDsXmFCoB2exZblAAE0rup63rDN/EgpswRFiX8Xkbu00sDdUiZIQqrwBRbBAd4ow+JXZCrEeaeGVCz4uYNxEk7SX90UpNLQdeCU0FoTSYBXDDCgsJdRUJgQsGf88f2XE4n1KV5EwuWgjBfMB0rf2BQOYpS7CC9wXzIwXVYqmO3bIOjEOoQOAVoRFj/ERbEFEm82bIRfx0e8NKsIEfK9BBo0P5bHx5UwlcT2+nMJgGswcnNr+TaO7TcJCQn0G4e73Zt94coMUrd2Uphg5em3dt/oktTIGzYhGv2WeJKpJMhYu6W1y/1JqtHzy6HDsLQy1VEHWuB1wC7ou9zavyQ4klWWAUIfzhEGVVZjrst/taTjgVdjbCJE6irSYs3PtGeYVpTNS41pv0791yMPg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(376002)(136003)(366004)(396003)(39840400004)(66946007)(66556008)(8936002)(64756008)(66446008)(2906002)(66476007)(186003)(38100700002)(76116006)(110136005)(54906003)(6506007)(316002)(55016002)(26005)(7696005)(53546011)(52536014)(122000001)(8676002)(66574015)(5660300002)(71200400001)(86362001)(478600001)(4326008)(33656002)(83380400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?PnN5fHiTO0pcrSsazPqMdGQjyA0Wu/Luz8vNthibSpqznJ9Paolw7Jh4hu?=
 =?iso-8859-1?Q?gMZbGdAS+JvZT0hZDWhQllCJxysgmr/O7/hruJgWpgjgrjhj/ydFObGK48?=
 =?iso-8859-1?Q?uKI2uIO1eBeniuGZmtR5+l127LfrJrMCSivR/54NPw4x8stEAz+LA32zcm?=
 =?iso-8859-1?Q?iFaHLakpql35Vy+uCnzBXxLvz2lHw37zGqOWp20ja6GKXPiCDLHi9yn/UP?=
 =?iso-8859-1?Q?y8GYl6Os5QnduF94XwshouyvYuuSgceyKsaxdZUUAlFPj29ykhi3CGBjCE?=
 =?iso-8859-1?Q?sN4bCZsaPAfAxt7nlHynSTamLFdwtupeva2fWB0h2jIkaNjpTagfsSDHVT?=
 =?iso-8859-1?Q?8mGGoO08sXumK8THK/+UBNHHCCoxdFMq9NfXch8YRsMynCaK7wV9oO7GX+?=
 =?iso-8859-1?Q?kH0UpA+myE+gazV6b+TiGmT4iXj2CzhdYDwBKbQCC/jzbwIJxbuEbxxm5L?=
 =?iso-8859-1?Q?wwpjYAeKrQ+u7vx/Tn9lx/Ys19gizS4XjCoDjGDBkUzGoSHfZ87A6qp22B?=
 =?iso-8859-1?Q?ZLJwE/hhgSq3eGtSh6y1yNdOqEU83NL48WxqnzNHDGHUe9rFTCmroVHSRW?=
 =?iso-8859-1?Q?Ch9G/C6fab//5U5WTwkwqsjk3dFqxpRLaNTkrEH4bGT+PtVW/RPZlE8Er6?=
 =?iso-8859-1?Q?trZAqyPJvkC4x7PO68mugOKNJ4K21HVbXhxhjlO84A/uajvsZPxgI3eGNg?=
 =?iso-8859-1?Q?tX0LdNLgINLsModEwm/axyaB2JuLVnkcGhd+3lFM5FhMj4rwY9zrNiQRNG?=
 =?iso-8859-1?Q?3o6lA7ZsbSRE0a47egHva8VU1QyBgdb6VAT2iZ0rVqiUQ8tGVC0WWprcTj?=
 =?iso-8859-1?Q?mfUkIh1V8uXPP63FCfjqexx4Q/9TOBPCk9RrV52BrJdZFW6rlMQE+4EU/F?=
 =?iso-8859-1?Q?EUaZHRuuIY+iPUISW+BWPF2eZuV38g5p18LnockN6jJwmbH0OXRIJdwKg3?=
 =?iso-8859-1?Q?Diszw3nSXHTS8t7F69VOBlv5JQq+W6Q1lQ5IrZxf2bBJdUkWViw30HWDib?=
 =?iso-8859-1?Q?7o3DRwCuFzjmLpS/MJES8NjVq95PRDOXKMyjk/uL5+QW4vvhclFIccHi0K?=
 =?iso-8859-1?Q?wcxfcwPpSspC6LelObZKh4ci5OvARyE5gzd5aEs8HZiYrRbl0WndaKN228?=
 =?iso-8859-1?Q?MTZur3Av0FVPgxLPR8P/URGVNhlFI3+WFGqnkta92HFBWPOk5YApriM9iL?=
 =?iso-8859-1?Q?tO1uEmITiczBPBwpz+CaGTR63RjNkFL0xPNHtKec6DwnzRVD6VFGUunVoD?=
 =?iso-8859-1?Q?aapN5/SQt+MI76VYNf/yxzjFcP6MlO93yrMsAizZs7QPZMMj0hJJPammfo?=
 =?iso-8859-1?Q?m2VSUzZiAkF1d+hmSJa/6d7flPwK1PJYsW8k2Ufncg0Va2aEQN+6Tc+Dfq?=
 =?iso-8859-1?Q?DNlxvQIa8J?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a339165e-ee8e-4cee-9a70-08d8feb44f55
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2021 19:42:44.9255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MrEuYvvadRo5oxNigDmKo0w7LkJBE0D+mVuLNEo78VS81GZ+6eBOGpRSSteLDSaZB7rkEllgN+aXuR8PJOiuxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB1906
Received-SPF: pass client-ip=40.107.82.124;
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
Cc: "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Please ignore this. I'll resend as part of a patch series.

-----Original Message-----
From: Luis Pires <luis.pires@eldorado.org.br>=20
Sent: ter=E7a-feira, 13 de abril de 2021 15:16
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org; qemu-ppc@nongnu.org; Luis Fernando Fujita=
 Pires <luis.pires@eldorado.org.br>
Subject: [PATCH] decodetree: Allow custom var width load functions

This is useful in situations where you want decodetree to handle variable w=
idth instructions but you want to provide custom code to load the instructi=
ons. Suppressing the generation of the load function is necessary to avoid =
compilation errors due to the load function being unused.

This will be used by the PowerPC decodetree code.

Signed-off-by: Luis Pires <luis.pires@eldorado.org.br>
---
 scripts/decodetree.py | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/scripts/decodetree.py b/scripts/decodetree.py index fef5eeaf42=
..c88dbdb4c3 100644
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -1277,9 +1277,10 @@ def main():
     global anyextern
=20
     decode_scope =3D 'static '
+    noloadfunc =3D False
=20
     long_opts =3D ['decode=3D', 'translate=3D', 'output=3D', 'insnwidth=3D=
',
-                 'static-decode=3D', 'varinsnwidth=3D']
+                 'static-decode=3D', 'varinsnwidth=3D', 'noloadfunc']
     try:
         (opts, args) =3D getopt.gnu_getopt(sys.argv[1:], 'o:vw:', long_opt=
s)
     except getopt.GetoptError as err:
@@ -1311,6 +1312,8 @@ def main():
                 deposit_function =3D 'deposit64'
             elif insnwidth !=3D 32:
                 error(0, 'cannot handle insns of width', insnwidth)
+        elif o =3D=3D '--noloadfunc':
+            noloadfunc =3D True
         else:
             assert False, 'unhandled option'
=20
@@ -1400,12 +1403,13 @@ def main():
     output(i4, 'return false;\n')
     output('}\n')
=20
-    if variablewidth:
-        output('\n', decode_scope, insntype, ' ', decode_function,
-               '_load(DisasContext *ctx)\n{\n',
-               '    ', insntype, ' insn =3D 0;\n\n')
-        stree.output_code(4, 0, 0, 0)
-        output('}\n')
+    if not noloadfunc:
+        if variablewidth:
+            output('\n', decode_scope, insntype, ' ', decode_function,
+                   '_load(DisasContext *ctx)\n{\n',
+                   '    ', insntype, ' insn =3D 0;\n\n')
+            stree.output_code(4, 0, 0, 0)
+            output('}\n')
=20
     if output_file:
         output_fd.close()
--
2.25.1


