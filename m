Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF5B49CF84
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 17:21:41 +0100 (CET)
Received: from localhost ([::1]:44296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCl3E-0003b7-3z
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 11:21:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkuE-0002DV-BP
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:22 -0500
Received: from [2a01:111:f400:7d00::70c] (port=30528
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nCkuB-0000NL-9M
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 11:12:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e2JOkAbTvOv2pGK5BhkWkDNoZjIfXTMtxNt/JIpM8eO1mgsEAeRpnP1EHv8fSe8W/KHL5avNgu7ubbGonVL6HBbFups/SEvfCkwtfy03p2rQePklW3j3XS4PBMHJJxi5wj4apEfWZUhkbxeQFks+pW4He4gaqFvjUBMVsFLqIRF1iM778s5IX7dxcNrItyzhH08XSXWqyatKb8td/o9IYooT8YeeQTYbzk3lIsxVIWSDhovbxfTr8IkGyEWkqt1FQ1QnI9p1D3cIKws+imiyrD1ni3fovEQR1kIOdv5jTsbkGkWfmBxRN4BJiDzR3Lbz5nptgygL5tSeaSM8Ej+WHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mX2uQOMSzYmepCKxpD5s6E6piUwo4ekbiFXnsC2rgMk=;
 b=PcYQ2MuRydNx7fmg2kXpEB8fCO9mpHZq38Nb/nZEU1PJ0lxdNwg02zX5zFg0sBo51QWAJ5W2Mx5ZIGIfpFnTLsft+grNdiyk3uCWEF5PIzdC64t/z7bWa55U9Z33LpL6ZbtQWxXV3nlBFPDzOPPzOoh0x5CQmWRP2O30fXcqZUSVYKx1+Udtta+cWsVnlMXiuph1CxdwutAPCNHAZZIPzSpcWZlF9K7qw3ituBSk6WLUFJqhGn6zFAhXJx2JMHSTVi6SHVadrkrqcwFVo//neNv526tf8P6pwU01fmdvjCnVsm7vTbyagS0sxVSmRiIQqIlNEizmj0E+ZPvA0iKYzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mX2uQOMSzYmepCKxpD5s6E6piUwo4ekbiFXnsC2rgMk=;
 b=QY4sBxlGN1lAzXA7bdCajpnIYmfl9FUeKer2JL3M90E4D7IZYx8+W81wTrB57om25uBt+GV3vxBUPtzSdaD31YmQFltcNzN7lGYvV0GSw7Uk4VoUc63T2TBCNeuJnoDFWN2RDCjUijAKpo6sRuzsoM71Ne55IBd16juZn7+F1PY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by PR3PR08MB5868.eurprd08.prod.outlook.com (2603:10a6:102:81::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Wed, 26 Jan
 2022 16:11:43 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Wed, 26 Jan 2022
 16:11:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, michael.roth@amd.com, armbru@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, pbonzini@redhat.com
Subject: [PATCH v6 5/7] docs/qapi-code-gen: update to cover trace events code
 generation
Date: Wed, 26 Jan 2022 17:11:28 +0100
Message-Id: <20220126161130.3240892-6-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: da6f765f-0635-494a-2dc1-08d9e0e68b12
X-MS-TrafficTypeDiagnostic: PR3PR08MB5868:EE_
X-Microsoft-Antispam-PRVS: <PR3PR08MB5868AF743F059652C75569CBC1209@PR3PR08MB5868.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:348;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FdUc6ch9+D1IB3E2p478hhyyaDXtkNUcwp0Rps3Xgnh1jq3BAXyoMwHmjeORbi86kPEjSZw9mJAA44INokAgjUT9/ISY/jDLLtn/ZywqNvJD7zlkEDWBr9YJORxR4LXt9JKqFx+BkDr+6mx+mFUfmwfZk+buejLPqMuaEZOPs/u9h8oKVbGEODn9BUcQ8qw6rfuJVN6pCK358kKfSa5L8dqSjm+07J+8hzOyUJIX9OA7THsbuGDldy4EUeUo42vm6j/xHPYOUbD8SBiUVHmvMf62uczrvzV3cQd+gCcM0llZmAZp2T+xFIvJaOZy6P2v1ohqlZ3uevjZpbNjJw/+q5ppzWGVQKQ6G5RZYcTE47CkctvMZVhfRxlD7YoFjnPmnMNhR6khjHa1kLx95cLHBsShcnqD9ES9zR4xkQCGaUhfJFrsLkNY2oncQHAmZf9caF9Kf0bq6ywd+Veuz8ESLeGZk7x1Vq0Xpx76nWLDJ+VkOxTqkCJQFaKx74TnQJQlpOdwroQLAACJ1kgF/V/Dyf9nBRUuhPBX6en3ijGFltbORHNs0bUt36RQQ788VO50QAFS+UkJwsB+q07PJB7SR12OWWN3rLFa+bCN1w3pjKUbYpo3JdNnxy4tZmj0+74cEHbXDhB/MiR0X7mLG3+A04FHhlQa+TujOIjt8izMgmN1acadZ4+8M37u6qh6nHo4MrX4EpaiXr6bYDqV1Vco+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66476007)(83380400001)(8936002)(6916009)(4326008)(8676002)(26005)(38350700002)(86362001)(186003)(38100700002)(1076003)(36756003)(2616005)(6486002)(2906002)(66946007)(6512007)(66556008)(15650500001)(508600001)(6506007)(52116002)(6666004)(5660300002)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qt5KCu8cJO2BXEIg2EhINvEFQuvOO7c+oQYvLmsfWPCzZp1ygyOuML67FteC?=
 =?us-ascii?Q?zqFExaumEYtQvRHFXDu7hFe6AbysHEl9H4liseCinD52MsuOwqMKmmBOnMBC?=
 =?us-ascii?Q?/Hxd/pTq6rZbMasD8U3piwWll7fcXysA0u4aiP86FBAqX/Nn2NJyRw2tNWR6?=
 =?us-ascii?Q?ihHjQzypMVLRkByB8uGXS1wYMTHvtAp+JXh20Vc56oDdrQf3wMP1SSLDLbIS?=
 =?us-ascii?Q?0zkFWKTb/oNNweNqX6MBhaQ/niSAJ2v3GaOhoJ77gOiDYTR/6j3hMLe3uJ7q?=
 =?us-ascii?Q?aTf/Dg9pSACmgKeKxWBpp1lInWbf61xS/eT/T7NWaGI6eUh18v5i/CAlSi/m?=
 =?us-ascii?Q?mCbBiJmHxeXP+pAWZw73jjlHAiiT66by6dIw0NdvJmd7NqvzWwjCDl0xTvpl?=
 =?us-ascii?Q?qoqdz+59PFY5bYvl+cw0iHoZIQhGntb7ygYUbBIb98RLtwVDaHo+Mhrst786?=
 =?us-ascii?Q?e/JWAQls5NGgHyko9L+Nmz5uzgfIdRirHEw6bGmZTR952C8dfuOxJfibkRPO?=
 =?us-ascii?Q?FpEiAdsAGr9VYcb414VVL82YQ1dB/S9Y5ULpjnJGhbtCMYkXJqb/sArJRrhy?=
 =?us-ascii?Q?LmiBWFoabwO/Groh7zUGE805vIjyQhR5Kqq9Vkv3tffaAf6v4jIXu9ibBeC6?=
 =?us-ascii?Q?/IMK8Q1bydpVnFmVdgN3hueUq5PRlzVEfw/BKxhcNrP7iak71bz8sU4pymTo?=
 =?us-ascii?Q?KBj8fF+UeY+l8qCrNx2ZJ9HDizKrQi3+lyvO4RO9BrnnlNt7dolLdo/rFJpW?=
 =?us-ascii?Q?4LDXe/M+uIPzRXxGk0ogB2rgjj4q68DSJCdP4/RPae9vDcdzgi0fGOJjMxDF?=
 =?us-ascii?Q?pIcgkscyKmHXrSQ8BC6bnx0g6jY9VpmwtGzDWf0EDOOOnv0/DAxrq+t0y8aC?=
 =?us-ascii?Q?CePJzZIksZBxV2WpO5FkWsvgQ4zrcV0okYtE+Nu3VWHeBiVJlJWUaARRChWc?=
 =?us-ascii?Q?GPwvm3mfRX804lkKnnI3I9wv9mMg9dKurRqKnVIo+eHbH0ViT55SGkFaVtJ6?=
 =?us-ascii?Q?06U2IN+QTuj43ZMNCwnaDQPTJtD3PC19AqRK48rCEp/gUhB2CCpxpZij0sO7?=
 =?us-ascii?Q?DHjMfLcr8eRceFa42kFxFJ4xMR0vXiTQcIdVwZEUg2/bTR/7HkGWLFYm0ZCz?=
 =?us-ascii?Q?H2lxMCb8mWXQ6b/QUfnVy94Gna73a5ZLlGliR/xXPtz74lwNgHThaFycaPWy?=
 =?us-ascii?Q?1sN9tp2AHQbVJ3slPNAnOwszpIDeUPWGekksr6aueScarE8rl50Y8jXb8Q1j?=
 =?us-ascii?Q?Q0vCJ0Xl7yylAKjV498EgL6vj17UMpldnOtmBZdAvs6+afzAxq7GXsdfZp/3?=
 =?us-ascii?Q?F6ejPgukstRUbP8cdGCsM4ZmgxnsPm/5UlNVDzTJWgEwTCsi+wFmd4/5mhtR?=
 =?us-ascii?Q?+kCIhHoez4rFKp1GfWm0FfOsfRaldJ0yqodNFMvfgTTB9/ijAmqVhk3vVOmb?=
 =?us-ascii?Q?zZtomCr0NlzVVd+eqNJclm6zyvUyZsYcu+6p7W2qmU4n4Fex0IJSrmpY4veW?=
 =?us-ascii?Q?GxouXVYyzlczK72NvO39/b75X8/EHyLSRuvlgvYR40yqUp+OuQCLjlwrYunU?=
 =?us-ascii?Q?KKT7jY5e/LlmFsmLsWNiE5hmRxgqMWSnxE8ockFdqTLWimf49WRrzt9cSbY2?=
 =?us-ascii?Q?R854ChF8uz/Ocf6khTSEebN10uI4NhiHhxPBhMOkHS8lMFq13STKSB1YW7QI?=
 =?us-ascii?Q?JfGMa5ugv7vP3eWoJqti3bhil84=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da6f765f-0635-494a-2dc1-08d9e0e68b12
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 16:11:43.0740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KO/Ioz4iIjfHOPzl7cFHUMVsh/ubXHbnhNAsLJxRMhSvTblB4K63LEfHS3g7GArDTJ/3LZPw93pgFIwZtBWmVDWpZFuGatUBjjokChGUP40=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5868
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::70c
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::70c;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Previous commits enabled trace events generation for most of QAPI
generated code (except for tests/ and qga/). Let's update documentation
to illustrate it.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/devel/qapi-code-gen.rst | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index feafed79b5..246709ede8 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1630,6 +1630,9 @@ The following files are generated:
  ``$(prefix)qapi-commands.h``
      Function prototypes for the QMP commands specified in the schema
 
+ ``$(prefix)qapi-commands.trace-events``
+     Trace event declarations, see :ref:`tracing`.
+
  ``$(prefix)qapi-init-commands.h``
      Command initialization prototype
 
@@ -1650,6 +1653,13 @@ Example::
     void qmp_marshal_my_command(QDict *args, QObject **ret, Error **errp);
 
     #endif /* EXAMPLE_QAPI_COMMANDS_H */
+
+    $ cat qapi-generated/example-qapi-commands.trace-events
+    # AUTOMATICALLY GENERATED, DO NOT MODIFY
+
+    qmp_enter_my_command(const char *json) "%s"
+    qmp_exit_my_command(const char *result, bool succeeded) "%s %d"
+
     $ cat qapi-generated/example-qapi-commands.c
     [Uninteresting stuff omitted...]
 
@@ -1689,14 +1699,27 @@ Example::
             goto out;
         }
 
+        if (trace_event_get_state_backends(TRACE_QMP_ENTER_MY_COMMAND)) {
+            g_autoptr(GString) req_json = qobject_to_json(QOBJECT(args));
+
+            trace_qmp_enter_my_command(req_json->str);
+        }
+
         retval = qmp_my_command(arg.arg1, &err);
         if (err) {
+            trace_qmp_exit_my_command(error_get_pretty(err), false);
             error_propagate(errp, err);
             goto out;
         }
 
         qmp_marshal_output_UserDefOne(retval, ret, errp);
 
+        if (trace_event_get_state_backends(TRACE_QMP_EXIT_MY_COMMAND)) {
+            g_autoptr(GString) ret_json = qobject_to_json(*ret);
+
+            trace_qmp_exit_my_command(ret_json->str, true);
+        }
+
     out:
         visit_free(v);
         v = qapi_dealloc_visitor_new();
-- 
2.31.1


