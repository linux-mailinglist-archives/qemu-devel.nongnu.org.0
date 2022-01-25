Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE63249BE1E
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 23:00:54 +0100 (CET)
Received: from localhost ([::1]:57626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCTrv-00039Z-72
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 17:00:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToR-0000LA-Vp
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:16 -0500
Received: from [2a01:111:f400:fe0e::730] (port=45285
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCToQ-0002Hu-FD
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 16:57:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OXeIWgvwjLqWRjXK8q3hncuKmmV6wgNM9A/CyiNgCLxpbto5MDX24b9Xp84E2+oGtXiKZMdBZWdXbUsTBr66Bf9awVvO+S674TUfFOEDfGuBqyggkLMxgEFkktLOHrewZtMJNL15Onxukmc5reyiL8En/Wsvwq/4uMvKo5FYfYznZzMTbkPoDLBX04PrR+iSgMAd/Z7fmsXyg0yBFUFELKFL32REPu/kPXy3YYqJeBwdPYFB+O2JTXaxN/Ob8N1qimR33Z55C6z0N71nQ3D5sdC8EOQes600EVwCtZ0dzkJ1Qul+mIqjIvb/Pg671RwDJKU2wdOpaxmK22bCpgymew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZJXw1XbbFlWi8NF93qnESYcCJ4iSWrjY3fwRgXbqmLU=;
 b=jN760fNoEZHoi38+JjDUnqt4wAub2AF4MkqU4PlWUPCwo8eCtMo5xmUnnn7x9qoyLZEUT5qrnVW+TMWNzy/wHQ1/yyspC4LkFFvKvZyh9k776gqbMiEfXJVJ4+oA1OsAl8GTHIwuaq0sSoS06vilKq4HFAEtNewY7sDwqBGz+SO6VBIV4EeSeOIdWWXFKO1ErOH+D4bELPBUpdPU9ipQoFoBoEZCu8+xlYTLzLir1zhlNCbKQjzh80ELRqyva4mIuBhBkV0/2gt8XHEhhVj/prYewO8p+dvoBcag2bmJRIes3unZcQxb/ac4pmuKQ+8SiZyZWGoJHEvtiIVixDkrCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZJXw1XbbFlWi8NF93qnESYcCJ4iSWrjY3fwRgXbqmLU=;
 b=Tda+1RkojzS4H70nb0dRgrZYxa3rj0SEeIwZ8/H9D8G6oJuGMmBL2MgrluA4FCJhI8tR58A/B4fJmwCsrn6dhvZp/rP4x3oDP+xrZPNCTqRajnYZbK9cVoIeEwehUKE0Y6ebNZag6vPm740UiX3jA5XPOMqzy/Hl4KT6vcPJOMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Tue, 25 Jan
 2022 21:57:08 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Tue, 25 Jan 2022
 21:57:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v5 1/7] scripts/qapi/gen.py: add FOO.trace-events output module
Date: Tue, 25 Jan 2022 22:56:49 +0100
Message-Id: <20220125215655.3111881-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
References: <20220125215655.3111881-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0075.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::23) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 000a7b58-fd60-4153-6540-08d9e04da197
X-MS-TrafficTypeDiagnostic: DB7PR08MB3082:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB30823B6893FBBAC82A714E97C15F9@DB7PR08MB3082.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u70wAeqDKKkQuiArALoVueQC+elJk7d179f/mbilLTDkXJrrY4SHtN48BhD0lZJnHSkK7FX/9nxcyxMpWtGozVw8Qkltv1cmFnVG7+RmungWXWW6NpikuFqGHSjh6uMkfXtnswb+UMuWDEARYZ65WCo4nTrJDrQWbXY3Afh3p04IZ9uwIe0MpAFZsQrXFN8OUi2A8pj6iokzS6wJDFWxyC6RDm3jGVy7o27sZHWKTWL0My8R6XQOEPH38XlvgxpBmBqSRiP1VI5ntpH9fTcIRx+dgYFmu1qpf+GkPHM1Oc+ekszfiY9ei4nTWdC7VMN7KDxQfSYvNtXSSP9C1zMvPob4OunpnJwtwGOMVBC31de3DXBx2/mJnJyLOgdq50uNAHp86h+sWToUzv630FXdpY1aZYADuQYdXcH19MaLxeXiuX6Y3/YQV99C+HRrksn93uHuZUI1a5Y6SaqxZV1UcPSxdXk++a/LwsITzfSYQn6RDPDwu8wumIL9nvEcY9PagAzKTGCKP9JMoIJJi1sbZhw1Yn7nwNs+QnRDsd9CZs5L8tXSBsg7vGVFJAMWhWRdDXUbqs8KpBgnXvDOkKsm1B8RLx/XD3SXXZz+3Kil6FNvi628oQIkn3cX5ZkUNQUHHSRbU8qHh7PSc5rgX0gy4JvZuJS0qLU6gWWx058WU1wZLJqAo6X8PLUE32R2q8TfhZwEWi5STCDpmvzYkbmLEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(2616005)(6916009)(86362001)(66946007)(186003)(36756003)(8676002)(38100700002)(8936002)(38350700002)(508600001)(66556008)(66476007)(5660300002)(52116002)(6512007)(6666004)(2906002)(83380400001)(6506007)(316002)(6486002)(26005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kZ8xJr64lZ54K4fD1q9Arw0OcLBNl+akuJHMfPF5B50hwcoxKDqZCJbKzQEg?=
 =?us-ascii?Q?FM27meZFPtu+NTZbN+5NBixsPyV/hcuGCQKgdJry+TnzcxeNqHzWWoAj2KAy?=
 =?us-ascii?Q?O6cdd6eRDO63RfRv0to3RD3YlSkoUQKlsQH8m9E8coWYS72grfyZGua3x9wY?=
 =?us-ascii?Q?rpJCg8ixpEtKvoJNAqMOpuwBq9KNK+usbKh9MXP+K9Ksok3cM8ZYuKHKb7H6?=
 =?us-ascii?Q?EA39vUgpBQI1jTWqNmOUKWhFy/Og5nokVNjlAlveWc+P09cs0qjQTPxS1T/z?=
 =?us-ascii?Q?m0TXFAObfD8eSTQyvEyyZC9rcOJEEx2hjUlEyf68u8tTCRpaV75KlmlUlJc1?=
 =?us-ascii?Q?mOXzzibAfWzHLjMTBhLrzHDk1ECygJfOIIxiSEexN4+6wvhUmizwKIF6GvBc?=
 =?us-ascii?Q?VJfOx0e5rzDXuWIRss6veV3chs/ltvP6v/XN1FBeR1Eg4bXJqIbdOZftCBGk?=
 =?us-ascii?Q?ZCzMclW8I+neQSUrvPblXkJl68oDHao+N52A5lL2MB4h1DCd7tCRyHwyhJaP?=
 =?us-ascii?Q?tUmZOZ2A/qHzkzc2Y2KZxjKox8h7/8dOSJK88JFRibvHAkeoLlxOhjbuKye4?=
 =?us-ascii?Q?asDT+DdLx12In7nrE2J5lJSEH2sVlWCEWHZNHeIOe01Tmjq30XtL0U883BDV?=
 =?us-ascii?Q?z+4Lxqg4M4lYlQGliRCjHmpuGyHUsPNGveoDlaOo0/wEFCaIkQ7kUZloMufD?=
 =?us-ascii?Q?TxfmsuTvFnYATTr7Hd74PBPNFfE+OO4ZWydUzd3uN5ogH8+pZzrdLlLK8F/z?=
 =?us-ascii?Q?rxcBaueYXdplhKuAOhdFrzuDinv6FgeweegIydyxQ4wHW8JI3hlamqBnao1h?=
 =?us-ascii?Q?dvWNeOmJ2PKWtACzxV+MRXmn4A7OMGj+aJD0E84MNUd3bYu8ZgmpxesaQau3?=
 =?us-ascii?Q?8zAqvKuiC0pouij7UMQ/Pgz9KN9CaF0gy4RM7trxgbyh/CXFtsosyXkH9Vgz?=
 =?us-ascii?Q?tRKaBxNg1UFgZMUUx9wRhWhQyh7HReX5iQpXgxJpqZ5uk8yaefpQ0JpGKqgG?=
 =?us-ascii?Q?PcwVPQW2/c7eaA6HLDeYR8cIFKYQkxdz8kyy8ktrNLvvT4FmeNANDkwnSk3y?=
 =?us-ascii?Q?gviReSrXKEnXfLxQou7rLX6xG2g6MXuN8hJw4C5ZM+hF1XbOJAEv9UIJKTaZ?=
 =?us-ascii?Q?8Z3LEowdBgcAqO+GrbueJbsI0vA4PsvF4kCrwVnUJ55TBiXSg8dliZebuof4?=
 =?us-ascii?Q?EidUEtO9MX1bIJaQ8xnA32nwQeEtrdrhOj+YtkB9O0yYWRdpe1Ld2cmcdx6x?=
 =?us-ascii?Q?oNNT8TpiK1h29oOieoIj96jUnccshhDAMHPzoOKqXb3V8KIXqsyqr4N5Xksf?=
 =?us-ascii?Q?9NXilquiGHVtgnxf9uTdcBKw5G1I5EOnt7NKc63xoH5jN3PXwHiy8qoto4X8?=
 =?us-ascii?Q?PmSJHYA/HqOL/V/SH40vu6t2QVKKaWE5xPBcBHbl7wCAu3l6vIqYOsbL+qhr?=
 =?us-ascii?Q?MehIrXpy2GDkjMajHNBPG4zf+MrLUGCy4G4i5Yj3g59EOu7S7dnAzJaw9YDh?=
 =?us-ascii?Q?DKnOfQPtZ336RFdlDZBhQjAROQt6c7mXLZq6hlFq6d/wq3RF/XL77RcX7daD?=
 =?us-ascii?Q?Q+xT25wLURXMVdZPJ1FHa/P6iDfoOoNaylhi3hVrZUXXbLHwKooxhbJ05ltk?=
 =?us-ascii?Q?TI+UDqzb7LZw+vxEhxOkEOw71L9IkUgoqP/3xaNFFrhrBGWf3Z0NYypJ8lHu?=
 =?us-ascii?Q?banrxHP5j9P1N4O9/0PrgH96iOA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000a7b58-fd60-4153-6540-08d9e04da197
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:57:08.1229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZxLhV5Etp8I9gwetyEuwrhyhH9kFwh3Nm/NXOiQKKnEDAzzgm2lHq5CEHU6jc/X+yxNK1a9VqTiI0vh0ZooCITeLJRL7YzjuuoUao0R0tDg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3082
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::730
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::730;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

We are going to generate trace events for QMP commands. We should
generate both trace_*() function calls and trace-events files listing
events for trace generator.

So, add an output module FOO.trace-events for each FOO schema module.

Since we're going to add trace events only to command marshallers,
make the trace-events output optional, so we don't generate so many
useless empty files.

Currently nobody set add_trace_events to True, so new functionality is
disabled. It will be enabled for QAPISchemaGenCommandVisitor
in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 scripts/qapi/gen.py | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..a41a2c1d55 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -192,6 +192,11 @@ def _bottom(self) -> str:
         return guardend(self.fname)
 
 
+class QAPIGenTrace(QAPIGen):
+    def _top(self) -> str:
+        return super()._top() + '# AUTOMATICALLY GENERATED, DO NOT MODIFY\n\n'
+
+
 @contextmanager
 def ifcontext(ifcond: QAPISchemaIfCond, *args: QAPIGenCCode) -> Iterator[None]:
     """
@@ -244,15 +249,18 @@ def __init__(self,
                  what: str,
                  user_blurb: str,
                  builtin_blurb: Optional[str],
-                 pydoc: str):
+                 pydoc: str,
+                 gen_trace_events: bool = False):
         self._prefix = prefix
         self._what = what
         self._user_blurb = user_blurb
         self._builtin_blurb = builtin_blurb
         self._pydoc = pydoc
         self._current_module: Optional[str] = None
-        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH]] = {}
+        self._module: Dict[str, Tuple[QAPIGenC, QAPIGenH,
+                                      Optional[QAPIGenTrace]]] = {}
         self._main_module: Optional[str] = None
+        self._gen_trace_events = gen_trace_events
 
     @property
     def _genc(self) -> QAPIGenC:
@@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gent(self) -> QAPIGenTrace:
+        assert self._gen_trace_events
+        assert self._current_module is not None
+        gent = self._module[self._current_module][2]
+        assert gent is not None
+        return gent
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +309,14 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+
+        gent: Optional[QAPIGenTrace]
+        if self._gen_trace_events:
+            gent = QAPIGenTrace(basename + '.trace-events')
+        else:
+            gent = None
+
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +327,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
         self._current_module = old_module
 
     def write(self, output_dir: str, opt_builtins: bool = False) -> None:
-        for name, (genc, genh) in self._module.items():
+        for name, (genc, genh, gent) in self._module.items():
             if QAPISchemaModule.is_builtin_module(name) and not opt_builtins:
                 continue
             genc.write(output_dir)
             genh.write(output_dir)
+            if gent is not None:
+                gent.write(output_dir)
 
     def _begin_builtin_module(self) -> None:
         pass
-- 
2.31.1


