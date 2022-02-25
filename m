Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BCF4C524F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Feb 2022 00:54:49 +0100 (CET)
Received: from localhost ([::1]:44574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNkQC-0003oz-3f
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 18:54:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFd-000764-Sp; Fri, 25 Feb 2022 18:43:53 -0500
Received: from [2a01:111:f400:fe0e::72e] (port=3086
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nNkFc-0005gS-94; Fri, 25 Feb 2022 18:43:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCF6oP/PVoFjJ+i6dZ+G53z9WKW1QmJbYBsD8qAnrqBM/qPkYzMfFoNpxCbBPKfaoX/Nhp+B4mnH8hC3+QP6p6cRr21bly6E6oTj68kT5DyfCMp0cv7/Gm/e/u/2heYZfxbia6KTEkYfwF2jRcrFNmxhX0n/nOcsohvmfEKUvAhGNWdgiDsgxb/qebHb/ZTSK/ZU8HQsLwoMRai7adwCSf8IvRjiOv/lT2U32HzxFScrfKze8Cusc8xFFuD7VS0zm2X+k9El0SkI7OHWHeUP+FFYC3KW8B+ysCdPxICc4zzbtoG8g2GbQJrfTBmonZnCF7rZ1qn7fI7d6VdAEA2mKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpYMv2OtT1O9fgMjd/+Fpj9jh+mObFnCzJVse/WK6KY=;
 b=gaWLlWHD36mrmDiMYxMcZLdrVvSW7psxUDsAvbCSdl5KWyiy+RJTgyv+EiFrAg25ILMkT/BGYkuOPeioHcKNLrXJyjBUuXUlisvuyf/av1c5VEHEgErMTUY4/3vOjayWV446s/Todpm1+tiSQtKVfV3ijB0GFRYEuaKIVt+bFvyVW9OgSUnZq5U0+dzcWykXMiRCCBPAnu6b1R3yMGNL0bo5bkll7yplUvqGGvVDBeUcaYF/0JwBfATP6nuVWr1uawXQwa0ymWu8dYY+LkOedGu++NCKB+QrO1Fd5/ab+Fp2q/q/Eye4QHQiVm4k1vsNN2SNIX2EOJvn3QxHWVZ/lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hpYMv2OtT1O9fgMjd/+Fpj9jh+mObFnCzJVse/WK6KY=;
 b=JwRMh8IttxGJzn5HV4QU/+BE9y+ERbivKtm5EUcydYhrW7LdoDPK2OjWOlSWj/raSgWIreyxGyCSstD1q0a9Jv9Vxo0SD7OjqzrezcGk7lqEqsqDTaMayH+G+DWmHxIoZEmAUg+RPRMsugxmkHEvOQ8lNajLJhBdrex+kyi8hEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB4172.eurprd08.prod.outlook.com (2603:10a6:10:af::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Fri, 25 Feb
 2022 23:43:45 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%3]) with mapi id 15.20.5017.021; Fri, 25 Feb 2022
 23:43:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com,
 armbru@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org, nshirokovskiy@virtuozzo.com,
 yur@virtuozzo.com, dim@virtuozzo.com, igor@virtuozzo.com,
 pkrempa@redhat.com, libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v3 09/11] iotests.py: introduce VM.assert_edges_list() method
Date: Sat, 26 Feb 2022 00:43:06 +0100
Message-Id: <20220225234308.1754763-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
References: <20220225234308.1754763-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0006.eurprd03.prod.outlook.com
 (2603:10a6:802:a0::18) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d6a1faf-73b0-4167-f1cf-08d9f8b8a976
X-MS-TrafficTypeDiagnostic: DB8PR08MB4172:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB4172F757D704820F85D9B710C13E9@DB8PR08MB4172.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hmj+PF5Q5ozDuw/3sNzoTrkCzKA+3XuH9uC5l9/QyacKPb3mHwJp8OJpUIPDmT9K0m03ir9RTVEUrQAu7MU3g1SVwrlpe4F3XAW3XkauPaTXAYKqV4deRGvLXXUAlAAuFko+vr/9VylT2rleTJkgkoDlgFVRdQvXMz62SiHsOG+v968+bRzcC7myDbyKXzVmJhfvFsSfCI+39JWtMunA8Y40JdY+aVhJOSGrJBCT8GSQ72O08+9oBbECJH/v29d+Ch964VnScKGQkkl0NuKMN8XcODt5RF3wIO3ePqnLqzIhHlLwUvLUvGbsSJ64TplnW0Mg+n8iqAPqHsOHpBIeW5UacF7YNyx57pF+YGp8h8unWAxdaI2YU/2Oe3RxFTb80frQj78tFipOBmYAnyxQYQS6XV05U9vbQq+1QO9KSkeYZPblctUOe7CmbRs/Xo51fwNEGh5eX54vEIQDW0XGa/xvVMCO0LBr/DQxgbczUcCNTh6rl3MklYbx3UhEf59hH2bW24qtwz5e3kz+1Wm7s4BMjigA+Ic0h28ynOAYLALtQaXjwlwrVg6jE4mBfO2JVOJ+OpesxiWOyccmXPyakKkj+a8ACsB+vfOMArl5tNfO5OlyTslfOq4xNplIPsU9ZvMo2m84w+x/IyuhlPmwGycwqirDMRGzmnHiH7xXriRxhFNAD5oKygCIBUoDGsoMuEs9wsFUmMOd4ujPXyzuLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6916009)(6506007)(8676002)(66556008)(5660300002)(83380400001)(6666004)(7416002)(8936002)(52116002)(508600001)(6486002)(6512007)(2616005)(26005)(316002)(36756003)(38350700002)(1076003)(38100700002)(2906002)(86362001)(4326008)(186003)(66946007)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V1/ZxOQiwqxNsK7W5gEseWZJOc7kBJUGxPf3ZxjLXA5DfPSBjaru3Lx34klH?=
 =?us-ascii?Q?qV74J8j/TrX5LAicNokfyMjfQ5UKVTd8FEV2DsRidA5CEvQi4v9Ewq6JRm50?=
 =?us-ascii?Q?XTWNhsWv/PTkuxFkAVExov+BmnjDUFbzI04zdMCYPvZXb3th10cHuaC/xgnI?=
 =?us-ascii?Q?pI9JgUUJXGHrl5F/sqGDoJunTIsr55uB++LNfYCEELpxgqjRbJGMhd59/ps9?=
 =?us-ascii?Q?4v4jigv9kedX1qHC0+TGG/pH7g6QoysWiQtQzXrMuYnZtpYjtm+HmGGExDPn?=
 =?us-ascii?Q?O4y5HKhRVIhPDDhP/YIbP/hv5jHW8wXAQ6RIfu9U0ZyJJSNPb3W44wPdF9CT?=
 =?us-ascii?Q?ORAGtLFo9A6Z0cvQBmwDIXJi4XIlDXsDFwJ7jvE44RBWMe4GmEAcrE7Gss7N?=
 =?us-ascii?Q?7KGoWkqDCm9EX8eKsXVraqm1bKEXg6JsFxJNPK4Fh2tRkMbLHkAgZhv8gBlR?=
 =?us-ascii?Q?It4amK19T127a21H9UGp9OXzGFYmM/eE0co9EV8MslrsCM0cx20MwcDURZAE?=
 =?us-ascii?Q?UmWhrOV1sD/ufCpEVeTPhiaPxJrmVlt505umUtED6L3ygQUqqK/fX43in51U?=
 =?us-ascii?Q?QiZdagddLdm4kSTsvtYqRu2flukw7/dNROF/PMdy9KUakGTJgq0IPvjcmJ+2?=
 =?us-ascii?Q?ClN0m16HIb3QQlPRW7rosPi8qPeh9wlCh8e5hjlC3TDclMSrkOwPXi7aDnNw?=
 =?us-ascii?Q?bnLi+u/mlz1/NxCn6CZwSa6Rec1dSuuLLKIezveMJtnPG8IvBxfJ18KXQk8o?=
 =?us-ascii?Q?3pf+q5LM4OSbD95fszpwTGrFbkQDz3a9I9RBTFJDzjX6pgkumaKsL1Mf8Nxl?=
 =?us-ascii?Q?Tijd/jXGCUspGC7S9nU7yNf7FSFoiz5h8JuRwb0rk6jEOB0yo2nRfQn30rpj?=
 =?us-ascii?Q?mEbvZ0ZFXvW76l7boN3R52ybYOIzTIWC3ZYBoQVRdWTk5f6PVAc2ZzDK6MfX?=
 =?us-ascii?Q?mP3hbALhkP4FOS/iCsEBQQxJCkaeLILtfSuSE3wm1kU0fAhlLgv7FeWK7Nje?=
 =?us-ascii?Q?tbTTrZ+ucafo1/ceP80ujX8UgtN848vns0OBYdSgtlg+xqtLTheeKrxPwgb4?=
 =?us-ascii?Q?qs7H0NI2LyUgnNiu0KpRv/++BJi6ztvRaEvTNTWqJiGqQnGGtGyF+ehC1zkg?=
 =?us-ascii?Q?kv4G9xBV9JbZvWtnyALdBzExRGsxsfR3npV5231wcjSTrDaFLsNQlG5Skwzh?=
 =?us-ascii?Q?TAle+pMExc6YaC4GLJ9Cbx1XajKK0q2knU6bBVxTGaODB5paxvLSsF4nh/Zd?=
 =?us-ascii?Q?i9bUGmYxngsSmy4lZRH9OyI2btt73z6QubFcvKLinW5/dh3BIfh0WDKD0/YR?=
 =?us-ascii?Q?4Jespw6K8DnViLPZQpRmq6TW/HM5DdClV8h7/5j5ev5CIOOngeVWRQNfnNMF?=
 =?us-ascii?Q?Uz2uRQbMlfY5mmonv8wzRVunCOu+oSFEFT4HAdECEiWYg4bOALUjAhiqjOI5?=
 =?us-ascii?Q?J1U6AJ/S1nR84sYiVVJIxLJUpP+fYB4NNNhUteo87CI4IWNsAM8q0DKB0pCr?=
 =?us-ascii?Q?1BItGRWFHyXlCWA/fM/W5hgLxYaDZ813jhS/jZ+cQHisiugqLKekNF7WLE+l?=
 =?us-ascii?Q?xBHqHQe9smfot+kH38xYbNslN6bBNAkaJRJptu626Ok1l1oZo9IwrZ+jQbOE?=
 =?us-ascii?Q?MPymb+10hKSLlWhlQIpz4twMpsuIZi+BssO2oB2osRz58gsMIYAMR+VkcdPF?=
 =?us-ascii?Q?AG8wMw=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d6a1faf-73b0-4167-f1cf-08d9f8b8a976
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 23:43:45.3419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eX90B0trBWHf6VELkFUaEhKifPFN/g4p6+ANf+DIoA8ef4+c2+ufW7ZAz/tag1GpZuJQXA9A/42dDGdcopanvfbEsHcp8FkZmAKYuHkJeOA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB4172
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0e::72e
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0e::72e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add an alternative method to check block graph, to be used in further
commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/iotests.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index ca17a5c64c..1b48c5b9c9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -960,6 +960,23 @@ def check_bitmap_status(self, node_name, bitmap_name, fields):
 
         return fields.items() <= ret.items()
 
+    def get_block_graph(self):
+        """
+        Returns block graph in form of edges list, where each edge is a tuple:
+          (parent_node_name, child_name, child_node_name)
+        """
+        graph = self.qmp('x-debug-query-block-graph')['return']
+
+        nodes = {n['id']: n['name'] for n in graph['nodes']}
+        # Check that all names are unique:
+        assert len(set(nodes.values())) == len(nodes)
+
+        return [(nodes[e['parent']], e['name'], nodes[e['child']])
+                for e in graph['edges']]
+
+    def assert_edges_list(self, edges):
+        assert sorted(edges) == sorted(self.get_block_graph())
+
     def assert_block_path(self, root, path, expected_node, graph=None):
         """
         Check whether the node under the given path in the block graph
-- 
2.31.1


