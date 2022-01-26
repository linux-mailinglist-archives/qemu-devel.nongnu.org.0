Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EACE49CFA2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:26:20 +0100 (CET)
Received: from localhost ([::1]:54332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl7j-0001rG-0V
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:26:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktr-0001wZ-OA
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:00 -0500
Received: from mail-eopbgr70122.outbound.protection.outlook.com
 ([40.107.7.122]:37041 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCktp-0000NX-1s
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:11:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EFn1scNKdCPGTwofGgSRNr8VsWTvQ+Ov+0W/XUW5JjXUxdCtT44H52miNXLdYr687HRRKCi5i7NR9papn/B7M73DzqkqM0188yemCCYyfpqW8we8Xg4SpiK7Z0C5u5lNYdPSI9x75sSohhPm6Wy6sRTCgpJY0yFAGn12quW9kvABlGoLyIR4tqpmx7nSGPYoaqP6HAeeMJiOo7gUByZOHAimcwRN619O4XWx4FHF3TaPQDyRdW8awQBGL8JB6DT6n5bHGCkdyGLAvgNJKTJnqDDCOG+mILEqMBT49ABkDzJShWVZORvYCSCDN3OTMj29ahwvfW3AgK7EuGtPS+YPvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeoOie/m0ifg/eNPZYb2qekMU5+M/owtwa07LsCt8VU=;
 b=Q2ZVEpb3QBSzBubO4Is+Z9SkrFec/PZpUWb/MljI63EZ08e++kGJ6urkASUqK0xZ7DVnqTyy6vM6IdNITads1WbVC2JBEsyzZwRSo9jr3zOUXgr1hq+Ne2o4/W7efUwoi0f25TMnn7bc2KQAHE252SG8Yrdv/mY7WvyAwlHho6j1CEonPsyp2pA826s+6OW/dW7qGF5M3MLaUnS+433sged7CMCqq5Kfl/nUpt1oe7TaFTnbHplviBHzw6rajhXQHPZ9CCdN346a68n0NCaFs+/vx/Bkbi53z5EWWbk/a4PwaH5sLi6rw2CLA1eC7npLuCR3BGkYlQMXUtgRja3+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PeoOie/m0ifg/eNPZYb2qekMU5+M/owtwa07LsCt8VU=;
 b=QhWdGfPjiEguNlnUGv+qfgShz/kRrA9lPeFoco6GH06nX9a1UOqRsS60jaHu5Z1EvbJN62A8Mwnb2lXu5L0YgZ+Aey9Amq4vF9ymVn1dW/7QlUgqrm2NOTxbPn12bT7AgOBl0Xnzy1G6ReeEfeDr4PFGC3SBbM2DV5xAoJquM60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 1/7] qapi/gen: Add FOO.trace-events output module
Date: Wed, 26 Jan 2022 17:11:24 +0100
Message-Id: <20220126161130.3240892-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
References: <20220126161130.3240892-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::22) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7fb3fdab-2347-49af-3311-08d9e0e6893c
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5868142C61EFC56084D4E138C1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:148;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9+vTn3xpuyFOyBFdC0YjcG23V2/MqGZHdgC2SxWkmwpI3jCTzZQ+4WgfGPsL69/i16qCLXD+vgJDqQJJqPrR4sHD8bGwBnMKOHkIsQ3w2NDrbqToKtU99e8uTGgSss6a9iKWJdSAZYymsZ1I0ScjLG0+FWYKGQLAsZ9tItAV778IwthMnmwi9vLVwpLeKBnGHzvkZ8N1BqWllvhu8k2V1yFINq1XxBdELGPy8gduIURqtiYDOPXMwFXjZMMdvVqj9Oqr4jrkFTd3IxYdSPCEDePaVx3TBnhAdJJmg0yaU0xz7RrvCHvbc0iLIRtJQNym6XH34GYKoJpA4paeGYLOLsPUOjfbClpKLFmIJoWZFrMb6aXy/i+L22p9p3lcAD7rlVrO8F+5CUtaNBk4pqHEj1Cgu7HAjpz/E1zqjj4JoDoHz56Cce48Tbg/pzOOgX6OKa9bAsWSTwC6Vlr7w5yA/ZnyIRvu7IVr+an1uxRWbzCxFqHiAQo3bUCJ3oebjLR5L6G0Djapl3rhuo2kcDE4SACyi52AFCa2YstbyjeZQUdK8gKGIrb1orHvWLIQE5Z1fMbbjdGnypW3cjIgFL095U9kFYICct1gRSyklXoRq95132GIVPsc7p2/caY9LbbFvlMIUaqfVLJ0NakIT5lzC0ACfqS39T/IARlAxMfii8hITuKAKBreeLnpbJ588pBucAxTaa3gcdIjKll1tyITbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15UvW/lj23gBxtQzHBZamww6wnAdkBYsIiZ0/+FCdbJqf/A6lLrJmoP69lhl?=
 =?us-ascii?Q?QuZrwCF4H99BJrkTwne7HyNA+vhIGSg5Jk4OZlWRtMvkmIm+aogJUJhsdPeS?=
 =?us-ascii?Q?afC7DeVUVjuKk7cOKcu/0dmE/aDD7dXAdQk29eiHqifmUHvQDWTKUSUg2Ebi?=
 =?us-ascii?Q?8hhPMB0nDQ89A/DH3ITTl9j2cc40NaVGz5COIALMj04JmzQPuXpCBFE3pXUl?=
 =?us-ascii?Q?99ZzJ0qNJhY2dGGvVxYXLeciZ+3p/caqDOlZTkytvVkiTa4mqAtlVfkXpFeU?=
 =?us-ascii?Q?WW39ZdjOSQ7CaD5lUN93AlhVqZ7c28xBXEVPIcSXnOhTsfA2E2HIbOWOnfDg?=
 =?us-ascii?Q?ydcLYHRbGsSiiEtYVetyv97jiy0rU05Xj6309PL26tJ6bV+RJzrTj9Lp7HBP?=
 =?us-ascii?Q?oAL9ugvFTLsN3YmSMl8nMUeTeQhD7f6Ro4yA9IS3IdsxE8fbcL7eyG5CtVam?=
 =?us-ascii?Q?rA52rk1KRLZ0U2UIEXANvXucnnxqZ58YhAsJbTQ4kjiNb2Q0RSbZYwXsdUrg?=
 =?us-ascii?Q?PRifN4uZMUkh8MQuh3oRL0czj1/9QQfKCraIrwYaPY/4V8MUhFnYBlZSAduS?=
 =?us-ascii?Q?vTsY9Hqsd06qRwqc+W6eKu9WTgNSs+VPfvdj6tF/vYUK6XuFwhL6BGBVvVp+?=
 =?us-ascii?Q?E+pEfKWLwmjk99fZlYva1DdN4AMjmFueElh7PgDIhdHpSFmCJlrrMqwsmkHz?=
 =?us-ascii?Q?r3SlmSeHdF7crNwT8I5YR1lcrtEc3z7DXTOPCKUTNY/xUHBOAVH3Y/2IhFCn?=
 =?us-ascii?Q?BYqKr/a4cXbbDpcuwPaCi5ME4z4y05BCqo5HMRXCxopFOphs+SQi8QPsb2E1?=
 =?us-ascii?Q?31FjDY1wrnWBIZ0vsbb7vkubktEQrkPNcxKZe34dPaWex3T2pnbrSMvQEI2k?=
 =?us-ascii?Q?YjMk/rxdHE7h/8MfQ8yi0JrrdBiEx6PhTU009EpghoQE/mOlrcBcWh3X0HMH?=
 =?us-ascii?Q?lKh3i9xkkLbtzj6jzVz4kxXH6cRgKLCWDMwSV1TlyeUiLkyrITQz/m6NkGmh?=
 =?us-ascii?Q?JobZtO0Qk+cbxlHJxwQHnYLdFWuvsFe+9H5PBAYLRu/O0rE5stQF5YwD032O?=
 =?us-ascii?Q?jufAKxyJ3S0mleG+2nMNQrWwcYvxVclejzapYRUSfO6pfP8yHaoKSOMIQYC3?=
 =?us-ascii?Q?6Ex5Y5DwBwRuIl+Z38usCLcGUQmW128MA3mYyOD9BadXp2JPb3CdQSfkd9Nl?=
 =?us-ascii?Q?/0xIDIUXVHFzzkjndot5KzcGrEX4GymuPgyWh5JygunRQTsBidKPXtbQfmP7?=
 =?us-ascii?Q?yf85hMOUZCjj2evspQwmCBh/7f+X5Ou23d5h2tntc+nXc811xaNgxMSLR/8b?=
 =?us-ascii?Q?hjbKtFCWNNEe3FivK/AuYATM/PTm3Y/CVC6+yLv9hf2iw8yQyRYchXu0gLyv?=
 =?us-ascii?Q?a9fkce6MSQQ14GYIjEVEoIsYZqZtM449Ls4NVIIc0m4bAZUwLQ9CY8VNzUot?=
 =?us-ascii?Q?APKEibyx+vkdfIbeyZ3Gc9+Nzw+bocJd6zlIjLvJS5s/A7RVWxyO8G50LhkT?=
 =?us-ascii?Q?gicSqL6tgG/LLLjSWCpKtZK+x6WTjmpI0HtQJU+i0VVWrrxMzvBHJBoyXGz7?=
 =?us-ascii?Q?XJiktBfiGJGO858O5BxrQGnNCl/yCZWi3077QkHn/3dcY4ZNjr/3/GnKD0NE?=
 =?us-ascii?Q?V0LzWgNq3QH3lf3fdlZyDsr1R7YD9G0U/KssLbrPMNTFKeKLlBtfaipwPASs?=
 =?us-ascii?Q?r9KhRIS+OkRuZDK8uupiYEf5Khg=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb3fdab-2347-49af-3311-08d9e0e6893c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:40.2596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3D4XcdR8SjFi6+VL6PdzQ0EzYg92vhFd7d8ypFZSJoMtZFalKVE2yl+4LfQ4CxLbCej0fgg/+FAsf751ag32sLzVWLZpRYFUbiREm/Vtvvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
Received-SPF: pass client-ip=40.107.7.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 scripts/qapi/gen.py | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 995a97d2b8..113b49134d 100644
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
+                 gen_tracing: bool = False):
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
+        self._gen_tracing = gen_tracing
 
     @property
     def _genc(self) -> QAPIGenC:
@@ -264,6 +272,14 @@ def _genh(self) -> QAPIGenH:
         assert self._current_module is not None
         return self._module[self._current_module][1]
 
+    @property
+    def _gen_trace_events(self) -> QAPIGenTrace:
+        assert self._gen_tracing
+        assert self._current_module is not None
+        gent = self._module[self._current_module][2]
+        assert gent is not None
+        return gent
+
     @staticmethod
     def _module_dirname(name: str) -> str:
         if QAPISchemaModule.is_user_module(name):
@@ -293,7 +309,12 @@ def _add_module(self, name: str, blurb: str) -> None:
         basename = self._module_filename(self._what, name)
         genc = QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh = QAPIGenH(basename + '.h', blurb, self._pydoc)
-        self._module[name] = (genc, genh)
+
+        gent: Optional[QAPIGenTrace] = None
+        if self._gen_tracing:
+            gent = QAPIGenTrace(basename + '.trace-events')
+
+        self._module[name] = (genc, genh, gent)
         self._current_module = name
 
     @contextmanager
@@ -304,11 +325,13 @@ def _temp_module(self, name: str) -> Iterator[None]:
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


