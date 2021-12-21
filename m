Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB45A47C7A7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 20:42:17 +0100 (CET)
Received: from localhost ([::1]:38154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzl1c-0003Xc-Sv
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 14:42:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkvR-00011f-Ou
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:35:55 -0500
Received: from mail-vi1eur05on2099.outbound.protection.outlook.com
 ([40.107.21.99]:22497 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mzkvO-0004At-PS
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 14:35:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIZr63Tr5RCkKuAZGoBjUkH/hQ+g/bjTMoOGJ/ucUkSc4b++GOqd9xW6KMuX8Ctm1mnu1IAWZR3zvEyjP08cXts8zwX0L/XAeXqA0pN1tf/GfK4IdqUs9VqO2YT7OTPfTyG9ds5GwxfrR3L2mMECv47V6Xh3/3yeeZScX+Qlm6Ggk568nU1bz+UeqyCkCLWYB5ylAd8PofsvHGmI0eY7rCTxVM3fEYsCRkSWLEP0TcqA1PMX41XnBr2rwIyvJ3LXHGH5M9PpJtc01OoBsZeIXFo3cigUmeNv4N6pmpVTMP/vTxH/1T2THGggeFFPs8+dx3UuUY1VuPtqaP1do3ERkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuqJJ3XcGN9DjRzQNZ3OREMYcZVrj/PdnrUgy5avHVw=;
 b=O1wBq7mIsdpHqQUiUiae069Zjtz8fwXFnBCymBZUrxlrCbAxmYit2IUZYlXCCc6QVpj2bzehvb5y/DhrtZf3HwvdS+oxkfcARp8pzDbgGHb8sJufThDI9Zmib8gRqn1nEXrxJa9/2XsXCvf2l3wOPAunpqAUwfJ7to5+Z2fF6137OChRHneEfEY8JbVct87Dtg6S/wr1hU3jce7V/yJp9+xHW8mybsLfEQfJDwAeSyXpAn5FUqGabESPIcBjHeGHxuNtKrF19dmjmlMzFiEDVzCduheHOAgp0WVJgormAHkSWTkz3LUJlgR8wvb+pYmMaXhCQ5ly9hQ1zSEbVVYySg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuqJJ3XcGN9DjRzQNZ3OREMYcZVrj/PdnrUgy5avHVw=;
 b=Q1j/EDx5qLN1JiAbPxDpxs6vZNnMOs7qDjOoEC7bK343uzJMbDZe2ZqHxDUHvPSWVnfF7OVxqUsFdG1yzaYDGfA2CIqlPv9Oa+qukJOtPguKCDxY6EPJVFaPjUvpDeHOGocf7IZ6bC7YIjpYPI5qUivpc0TudezD09ueBeu7lQA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4964.eurprd08.prod.outlook.com (2603:10a6:208:157::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 19:35:14 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Tue, 21 Dec 2021
 19:35:14 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com
Subject: [PATCH 2/3] scripts/qapi-gen.py: add --add-trace-points option
Date: Tue, 21 Dec 2021 20:35:01 +0100
Message-Id: <20211221193502.114296-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211221193502.114296-1-vsementsov@virtuozzo.com>
References: <20211221193502.114296-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR0402CA0014.eurprd04.prod.outlook.com
 (2603:10a6:203:90::24) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb255941-11bc-4660-5e01-08d9c4b902ad
X-MS-TrafficTypeDiagnostic: AM0PR08MB4964:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4964F9F0463F9BCB2019D49FC17C9@AM0PR08MB4964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yR2Sw3EjKaQg18I4Weyc6AorepvebYsHtx9qvM/lDDK6Xt82OUQOPXJDZCQcoqoxp6CNpOwhtF3De2pmRWJlUtNi0WmEpcbZfLxPWJwXk2C2m/IPt2XnsmU+IvSWjVXCUf7YiM7Xk9NhYn43ITQRRce4LTQrboz6L9THp1oPN7n3QnSUDjawEPPdQghcE261xkJVIwATFzoX9faYzk3gzWY5kqBruEdqkyGveCjc2nra0zPHwVhBmJmrsFvg5/nlIacFo2S36myEghCgtlYmQ3dnm/eNCcC7IiSNp1tDa022wXBKSvDg/qJCdmjAXJfLsjjRr8fv24UqvXdt6wVaGnSDA049B7GXIzNRlS4z+T6J0XH6BUO1Mu/UtFbwHFmWbvepwFkjrzW9yHy4WUHtnyVlY4Alz9WxLjTbFfp/DadzDOk49wuRtdkoA4dS93WU5hnHk3BgvP/JGdjpH0Nhmhkbct4LzSw3ybH4dfLtwi5jGHIh4IHIPe2tUYhrtR0+bNAsAcqlK8sUMY2YckTygl4beU4Ks+dC3vBdRwiZMTsiS49ZeweLHZmqj+mMh4JZIRIEny/mfo+mhqBVrPv6HuYOAPUbGG7VhyexcDHfl8EhwjbDFJkfOxL86WzJBqY35t7wQa6qjFR7vFEXv9HEMkjmDEFFb2t/xpOSanOZuazZ2B33NoKcJ1Nto0ch7bLjCMq/XJ0ZrTcu9qz63TES4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(186003)(36756003)(6486002)(38350700002)(6666004)(26005)(66476007)(66556008)(38100700002)(52116002)(86362001)(4326008)(6506007)(83380400001)(107886003)(8676002)(5660300002)(66946007)(2616005)(2906002)(1076003)(6916009)(6512007)(508600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OVDfYqD9u4PSvLA0o7f4GVC84saZvkqwCCq97fIoJLucPwHXreLHb9JuPl9Q?=
 =?us-ascii?Q?2X7ElAXFoYtoMOvX1l4pr5DeEW8wYz4conT8qBinLw4LWU3bTgc5dITUH2GM?=
 =?us-ascii?Q?meD78MB20dQIrzoqyV1/y7E8R1BivbEiINLSjaySJlXx32R3F5hMdjgrdrWw?=
 =?us-ascii?Q?o6JtjR+7RS9Kd0/905rIZpgvIdkmmhDQ4y7/dQS4MTwzee6Itn/4lbdO9ZFs?=
 =?us-ascii?Q?B7V7zSWW+fH7OKSqUwenAz36ho/K2Fcb4u8pl5uV78A0ckCUtk05gKaqApre?=
 =?us-ascii?Q?IGQO9lFu5yWCvYpNPY9q/zg5qMLop1aaZ1A5W2/fSpISj4QKM/FnyrebGVHM?=
 =?us-ascii?Q?/3qV8Bd76+3nJLFevO7HTRfDWAZkjPJ87QHC0javyx07X6Bgv8PiaEoSfCmh?=
 =?us-ascii?Q?vUUTSSff2/3b+X6bwXzh2sMf+VpEribLDKaRzbXIfBua/YfUirbJNU9u3G0A?=
 =?us-ascii?Q?9dBaCNCJGR9qehrHML/fmQGVynKofcvMQZtuUj+ujJTSU1lajTq6j4Bmvz0q?=
 =?us-ascii?Q?Qp64ecu6rjPQWYspLmicK73hNSUrGVq2lg/uQr/ZXZb2aURAveuOoca7oE3c?=
 =?us-ascii?Q?PmbFIFkWc6peoeoRaiqZ87dfaW4y+FhSkxEOhjdHAcuIkCxUMs0rxPUt71T2?=
 =?us-ascii?Q?MrJ7/i4tfxlrWaRqapXK8TXAi9Jc8RFIUzCtTMLNVc8h08r4yXqMlRVgphxO?=
 =?us-ascii?Q?TIlgBjleeFGDpERA+VW9ZicBVa+L3WR3oPGUQRkGRzReIH7EyKY1157dN+0W?=
 =?us-ascii?Q?4P3i89DOVwq0GXRrRrgwwDAcH18HFvdSe/R47h76MMy3TWI2cpj2Gte1BWI9?=
 =?us-ascii?Q?i0FegC79XdTqBCn09la1hS9F4O3Q97SDJp8CE59dZhVI8nVSA/2/S35uNNJt?=
 =?us-ascii?Q?b6z1uc7ml5846cHuk2owfn4YrUpcDfZWx5jgUQcO8wcvExupaD4uHqlko5sg?=
 =?us-ascii?Q?o7AW32WURN1mT/xwyMSRw2VS+p96jZ81pu+zLO1O6/SJwdB32dpwpEFtkqZl?=
 =?us-ascii?Q?PIoa6XiFV9/QBNSb5R93r3dkbqKcdIo+9ZJDKqjV7/ecH6C4j/JA5WJQcwyk?=
 =?us-ascii?Q?b5qR5BCzcMnkMrhlnJTvd9GQRiN7WnojGi79PQZ0Ab8dy8bw9oLj/MMCdODT?=
 =?us-ascii?Q?pu+yfyW8BopdubFpTnv3Q03SazO0jLQXD6mLlS6fH306/iJLoBO51Hcvv92G?=
 =?us-ascii?Q?pGJ9qaYTjSeO8ZS85P//m4jE+kI2bgQJaggbp4L8lmlYOT6Fmxx9IAKHbLg/?=
 =?us-ascii?Q?2UZZL3rtMH5bs9gtj+MGOei+3F7fRH9vHG/cOyHWcRPC3JeYbXURqlUM4Hpn?=
 =?us-ascii?Q?CQLFyX7Zs58MifEbbC0SuHQ6UH3EzllsKncDNS22zgVk2fgDTKEyc/gv34/I?=
 =?us-ascii?Q?oLEA/pAuj+pIZl4nBHgnNNSgwU9cb0+Ib0AD4ghorVYwhfWF/ZRAw9SuhbCq?=
 =?us-ascii?Q?zNw/HjP1fBqlWtpS4dDGD+N49ztu9+QGn9T1ewZZEq9+a03yeS6Gy6sPdPKr?=
 =?us-ascii?Q?XLWOMzWFP3CJe790W6f5Y2usxxYnqtRs8nhacmend3syOT80RezvdrxZuDro?=
 =?us-ascii?Q?PpZ1/H9ZK+JE5YldBU4vf0DbX2ozeAdKdGWUZbxnfhLlzwqIG9ePe527firx?=
 =?us-ascii?Q?NMRYQGlmZe/tvr1nz8nMEG8qc1h0Rzl3LXmEU+dJNyUSQW82og8bUQL2UEWz?=
 =?us-ascii?Q?NkG0rZV9VmRY3+w9kHp0vNBSYdU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb255941-11bc-4660-5e01-08d9c4b902ad
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 19:35:14.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5BPqrWGzpHwvICyySCSllaj22Tn43NwrwiDNcu0H0VrYF/QSeGSmJlZM1LlSoeqLYjslFAvrOZpSu9pIvlU21shTGjB9CGZQM6Dh3bq2YTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4964
Received-SPF: pass client-ip=40.107.21.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Add and option to generate trace points. We should generate both trace
points and trace-events files for further trace point code generation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/gen.py  | 13 ++++++++++---
 scripts/qapi/main.py | 10 +++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..605b3fe68a 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -251,7 +251,7 @@ def __init__(self,
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH, QAPIGen]] = {}
         self._main_module: Optional[str] = None
 
     @property
@@ -264,6 +264,11 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gent(self) -> QAPIGen:
+        assert self._current_module is not None
+        return self._module[self._current_module][2]
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +298,8 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+        gent = QAPIGen(basename + '.trace-events')
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +310,12 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index f2ea6e0ce4..3adf0319cf 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -32,7 +32,8 @@ def generate(schema_file: str,
              output_dir: str,
              prefix: str,
              unmask: bool = False,
-             builtins: bool = False) -> None:
+             builtins: bool = False,
+             add_trace_points: bool = False) -> None:
     """
     Generate C code for the given schema into the target directory.
 
@@ -49,7 +50,7 @@ def generate(schema_file: str,
     schema = QAPISchema(schema_file)
     gen_types(schema, output_dir, prefix, builtins)
     gen_visit(schema, output_dir, prefix, builtins)
-    gen_commands(schema, output_dir, prefix)
+    gen_commands(schema, output_dir, prefix, add_trace_points)
     gen_events(schema, output_dir, prefix)
     gen_introspect(schema, output_dir, prefix, unmask)
 
@@ -74,6 +75,8 @@ def main() -> int:
     parser.add_argument('-u', '--unmask-non-abi-names', action='store_true',
                         dest='unmask',
                         help="expose non-ABI names in introspection")
+    parser.add_argument('--add-trace-points', action='store_true',
+                        help="add trace points to qmp marshals")
     parser.add_argument('schema', action='store')
     args = parser.parse_args()
 
@@ -88,7 +91,8 @@ def main() -> int:
                  output_dir=args.output_dir,
                  prefix=args.prefix,
                  unmask=args.unmask,
-                 builtins=args.builtins)
+                 builtins=args.builtins,
+                 add_trace_points=args.add_trace_points)
     except QAPIError as err:
         print(f"{sys.argv[0]}: {str(err)}", file=sys.stderr)
         return 1
-- 
2.31.1


