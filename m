Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8006DD0B2
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 06:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pm5NL-0004Hw-Id; Tue, 11 Apr 2023 00:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiichi.tsukata@nutanix.com>)
 id 1pm5NF-0004HS-K4
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 00:12:53 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiichi.tsukata@nutanix.com>)
 id 1pm5NC-0008Mb-AY
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 00:12:52 -0400
Received: from pps.filterd (m0127844.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B3pW0l016159; Mon, 10 Apr 2023 21:12:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=proofpoint20171006;
 bh=1bGP+zW7WN5HizFa2ithhiw9nfR0odeK1hOtwfXH/tA=;
 b=2qjPsQOGAtDWNYeVaY9fVYC4Gd8OHOpnF7AHdV/grhbM2FIiOd9Ng1hdsiPlRj1A6jgQ
 CKhbprv5Vb+zUSCsrs6+k7/n+4lThmThYQQSQYVHZQOYrDNXHMfl6Dl4TxAJ4wyaub2N
 N9fcVp6yjBs/niXAistMTr9QQtXkfagadonmboxIuHrtNUlK9QLC2GYwpxmqJ/rStIDx
 VfFnWtbVGM/9u/KoH9Adt3Wd3CkbWPQdMymE1URQC96i79Ma9ELoxV5xEQDei2G1HYIX
 3GWKOIgh2Wj2KZAZYC4lg5xDHvRIQkS+M6AJX10QNK0MkzD6lKtPu7nLajIeCOnEj4vM aA== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2172.outbound.protection.outlook.com [104.47.55.172])
 by mx0b-002c1b01.pphosted.com (PPS) with ESMTPS id 3pu7t3vkre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Apr 2023 21:12:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y05JBB5/dq5Oa320U7mIXCzOX9Wkfvd5ypoBW4Lb5H7D4W3+qVgnoD2aQpk8a57+PWNkXfohDE0zAwgR6ACHC59kj9XxI+hxBb5DC2+XziBPhLM1DH9PjYEwJ5C/3oGqfHe3aYMdzvUfvHTKPSohdarD9BOln6f1v99lvf6NJ7jzvuF1iXFxvKfKszwk1hJEC00vG1ycZTS6CwWgvN7M7+uVwlBwau4oNZr4W6+uCXqwZA9fRALXjYRee9mUxH3KUnF2ZWnC45Ob0YY5yqgV/FswkS0U9E9rGy1Hux13ybh0ja/aFvI+UtmwtU0XjYPt39I8c3gm0Qa+tQcgt7rVAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bGP+zW7WN5HizFa2ithhiw9nfR0odeK1hOtwfXH/tA=;
 b=aoQ2YB7mwK/FuAx5ujaKQ1uchiS3aKbgcKDz8e3A2zjhQNW2pSKIfW7QJSxxXEm2nxzCWY0lFoQmvyoaskfl3w81Ay4DBbOLKVJyXCzpc6VZPFSD/fPEDMUOqov3bDLsqRfdkwpu523b7TfM8bxrakmHcZ5A8kamsHLoa/wkPGd8bCeiTYlOSQKzievL8UOT9UrAgUW4o0HpdVjOc40YFwMXc6V7l/e9qXdY1rMVUxKb39e6W9khOi6sB94valCModtKfLz8spbatk/zCxzWQi/Ope5hwUuBvE7kfzlistwcUeC29wjJKwitHGDGTGRFLnzzygfkTmd6r6fhtvX9lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bGP+zW7WN5HizFa2ithhiw9nfR0odeK1hOtwfXH/tA=;
 b=IG4P9IDDCLFeUPYIUQD68nnTNYrNUpnrusaQoFf6mXYeUx3R0MV1iscHcEcm6zz6E8V6XQyJk9gSKkujhBpKk0D8WUiCG7ZrDI6sTXv6F5Nd2g9bgrrVIbydgUSKUdXKho3xkgiyRNVdRgZjJYMM+rI2ygZzHDuxepke+3keRUoTeyMHqKVtkMEdX9V35PiKYz/nZofP9oB41ngOoLKrqQaT3x9oim3t/8jy02uqyaohNHYfh6pzs7vubT3ebbkpTsBVbJBN/0LzFemzYBWQ8Ke2Y5/7COWY7chYTWubo22/nHsiOuWuDq3C2ffu8hC0ZQhjgLsByGnXnnfjbjheUw==
Received: from CH0PR02MB8041.namprd02.prod.outlook.com (2603:10b6:610:106::10)
 by MN2PR02MB6734.namprd02.prod.outlook.com (2603:10b6:208:1d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 04:12:44 +0000
Received: from CH0PR02MB8041.namprd02.prod.outlook.com
 ([fe80::805e:f9:d681:309c]) by CH0PR02MB8041.namprd02.prod.outlook.com
 ([fe80::805e:f9:d681:309c%4]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 04:12:44 +0000
From: Eiichi Tsukata <eiichi.tsukata@nutanix.com>
To: pbonzini@redhat.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 thuth@redhat.com, philmd@linaro.org, peterx@redhat.com,
 david@redhat.com, qemu-devel@nongnu.org
Cc: Eiichi Tsukata <eiichi.tsukata@nutanix.com>
Subject: [PATCH] physmem: use PR_SET_VMA_ANON_NAME to set ram block name
Date: Tue, 11 Apr 2023 04:11:58 +0000
Message-Id: <20230411041158.66728-1-eiichi.tsukata@nutanix.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::21) To CH0PR02MB8041.namprd02.prod.outlook.com
 (2603:10b6:610:106::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR02MB8041:EE_|MN2PR02MB6734:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d99aba-bae4-407f-627d-08db3a43002f
x-proofpoint-crosstenant: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ytl6YKin534ye6xkv4Hj8zocLPawe+7xFYJJjTB2e/UTsmhqBcPtGb7XjFJA5uHA5Dvz0alyRHrCTYQtbPQ77qswZb9GBcngw90PZQp3IEhU5XwD6uunT4hun0FZDKmg/tVwq0MyeKGOfLFCbwGPrva10EzY/rKfqADFq6xaW/PJrmfhNekmNozEw6iJwmQo/KpPqnoi7WbJwxfjhYVMtLUGEXDP++od775Z+NU+2ivhPm3pvHiXPb8NT3aO6d+quEKfkX8QuSIrSyW4y7zMcx0pBo+ojcU9b3dBmVSQyJYECNFhCnxKmaXNoDymeyAbR4phdEEcxsnWNjSDZ7jFXPW/XBhmv+JxI32VBmAXTCCW/080HD0vByuiWEAZAkMsV9tHAUlIXRRvIPysMOLSHUSZ5NnhdXPRpCv0hoi8zZdGdSo4SdicJl+7CZP2P5vN2/FKONaL/BsTl90KExcHUEsoIyQeMThXFhNHFKqSWl0KV1ACHzYdxHTrjFfEyQUWWg3ovSXv/h5QUgN6jVcnwvFREoVLqWRtHlrz1zeFwYdjvuETqSkj2ONBudBw+cBuGg2r/4I0dYsWUBhotAfd2uSdBEQdykPburTjEsGnJ3qFnKQhR5qQyQP31T2zgfi/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR02MB8041.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(26005)(6506007)(6512007)(1076003)(6666004)(107886003)(5660300002)(44832011)(2616005)(2906002)(83380400001)(186003)(4326008)(36756003)(8936002)(6486002)(52116002)(41300700001)(478600001)(38350700002)(38100700002)(316002)(66476007)(66556008)(86362001)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DfefLlvBDEOHTNAGYBq3KtAkABanhNk7JFa5m02Wd80aPvMGjZxgzOyruXVD?=
 =?us-ascii?Q?lJxfxeU4Kga61qe3ZahE3iAUe+jCmYnpeGDCJr2hJdHQxMnZrThYuo6GQVvk?=
 =?us-ascii?Q?gEVvRwIywGr+dhaRCN0SoVpI4pRqHh2bAvccWE4UxaIyn0Pb1ZNZTRYt4aTy?=
 =?us-ascii?Q?zvCB8Or+K54K1HpOYqBUkySa9CPxjxKF6tKR+i24uc7CZKw6b0d6s3xjvqgO?=
 =?us-ascii?Q?R29sFqy8JHL200cv/RLcpv98AMX10quD5Gak8CmCLy7xu01IlsczZeZ2aTCW?=
 =?us-ascii?Q?JyDkMERfHg0LH2KaaFFxXkpoV1qkBQwGCPt4pzll1bmTw0BKi9WwqGrLauWw?=
 =?us-ascii?Q?B1HyfJK4DsztcgUhyIN5GBwgNjVQp4B75F3s6pBsvKUECLb/XRHXRvfMvZwg?=
 =?us-ascii?Q?ElazCyqawhHemvtZTPH+LpXbX+9luw4kMsthas5Y7xOrA6+GXkRdFibH/Ear?=
 =?us-ascii?Q?tKFvzsVkzYIveaN1/Y6ioPFxATSM5DkumtB5RwxnhtvQrTgcdSnKzURJ5Kwr?=
 =?us-ascii?Q?/y4xAzCIhybVBtIFicKUN+YIBlfya7UBNLVzd6qb7mZOOP+Omuhyi3SC0X42?=
 =?us-ascii?Q?opyYGRrvc76OxEK4wI5XFX0bq+OvRHB0PHOaBhFvyo82rMgWASxXO/lFgWSD?=
 =?us-ascii?Q?NxxdRaixoypD3X5OqeLW5lV/GWdD5Y9wC8uG5zw1EQpzV4wYQgkwpI/jr+N7?=
 =?us-ascii?Q?OEoHRSZo2ifkaQxENqAyV5J5A6WfeYHM2wjMPF84yAgsNG33Zh7JzU1aekpJ?=
 =?us-ascii?Q?RZT/X3dnYx/CYxIRxStn73zLg2CJk21jAqh3gR0El0kDhj5FSlzQhcHhYyX2?=
 =?us-ascii?Q?T/6c4XS0RPKXMFCF79FkVXekKsePx6HEFln4X6tyrm3BRDpFyu0aSWr85zeP?=
 =?us-ascii?Q?CT6K1nS5IpM78mBP48r/RxX92gd/LbNNyZudDwdThzcN4ALQho3lKtMTsS+j?=
 =?us-ascii?Q?NjhN9MXcUHl2x6b4Nl/AQnuBlWmhL78TE12msj6eRE6YeMd6xFj8XtBcZRW6?=
 =?us-ascii?Q?cSzVMwL9K6aA9cbgN/vX1nJvg/NUqgXIBFJAsviu0uUor/m6RgiJDbiL/G3C?=
 =?us-ascii?Q?zjkpH6LoFgpFr9z9kRnXvvHVgyYQXhAp/aNPGU/KO+0B0pextQky/8ijziSE?=
 =?us-ascii?Q?o4EmwYezyLM3r0h+B4ZwLeWVYNVW9I//LX/sLjjNPoAh/pmHQ48H4z2O7pqv?=
 =?us-ascii?Q?B0rMz2lTD36YaHdV4/MR27lz4heYdkdww3ED4UIC2021t3qsCVczWxM3xew0?=
 =?us-ascii?Q?T91HdDVCmY76fkV9JjBzfd/lBBKc+yB9XsILguZXYAPmxjL94YNaymfwKEzM?=
 =?us-ascii?Q?dAUKtiyIr8StrUAuXeO27MOaeB8q6kwlYxJvmL1r7XdCZg901KDY8CabMMou?=
 =?us-ascii?Q?9a3tpPe/mA3b6aODgGOb/XoctHUmba1UiSbpxGbxvUZClDH2s/blBqFXiYTj?=
 =?us-ascii?Q?k/WjGOw6zJPSMGN1tLJ78exWcxpTyiJ9AMlS8PiGYsFl2YDTNe5g4zJWkneu?=
 =?us-ascii?Q?VwmSRI5QJK7JwUEAHpnncAJ1FqjGqnBIzhW7yV8SAEElPXyWgEwAgrehzGRZ?=
 =?us-ascii?Q?pY0nw4yyUahJKpMqnh9mkObuvaXZ2IrE/xXu+TxOncJdf5KugvSdBPldiAkC?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d99aba-bae4-407f-627d-08db3a43002f
X-MS-Exchange-CrossTenant-AuthSource: CH0PR02MB8041.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 04:12:44.4727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1hN6rq4gmeriNad3Z+kSeX6LRXk4s8S0Koj76rHt1j/FEXru10Bx2h1W0MUCRqTgCvJgEUgx1LR20ReKJqo3qej1tNND07G3g1ncYsw73OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6734
X-Proofpoint-GUID: Ol_0gM5TulDXKU40rx7jev3L2M_2oovw
X-Proofpoint-ORIG-GUID: Ol_0gM5TulDXKU40rx7jev3L2M_2oovw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-11_01,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=eiichi.tsukata@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use linux specific PR_SET_VMA_ANON_NAME (introduced in v5.17) to set ram
block name in the kernel. This makes each ram block distinguishable and
can help debugging and inspection. The names of ram blocks are shown in
/proc/pid/maps like this:

  7f00e9400000-7f00f1400000 rw-p 00000000 00:00 0      [anon:pc.ram]
  7f0115200000-7f0115201000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/rsdp]
  7f0115400000-7f0115410000 rw-p 00000000 00:00 0      [anon:/rom@etc/table-loader]
  7f0115600000-7f0115800000 rw-p 00000000 00:00 0      [anon:/rom@etc/acpi/tables]
  7f0115a00000-7f0115a40000 rw-p 00000000 00:00 0      [anon:e1000.rom]
  ...

Signed-off-by: Eiichi Tsukata <eiichi.tsukata@nutanix.com>
---
 meson.build       | 2 ++
 softmmu/physmem.c | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/meson.build b/meson.build
index 29f8644d6d..aca889f5f0 100644
--- a/meson.build
+++ b/meson.build
@@ -2040,6 +2040,8 @@ config_host_data.set('HAVE_OPTRESET',
                      cc.has_header_symbol('getopt.h', 'optreset'))
 config_host_data.set('HAVE_IPPROTO_MPTCP',
                      cc.has_header_symbol('netinet/in.h', 'IPPROTO_MPTCP'))
+config_host_data.set('CONFIG_PRCTL_PR_SET_VMA_ANON_NAME',
+                     cc.has_header_symbol('sys/prctl.h', 'PR_SET_VMA_ANON_NAME'))
 
 # has_member
 config_host_data.set('HAVE_SIGEV_NOTIFY_THREAD_ID',
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index e35061bba4..4fe3e14193 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -80,6 +80,10 @@
 #include <daxctl/libdaxctl.h>
 #endif
 
+#ifdef CONFIG_PRCTL_PR_SET_VMA_ANON_NAME
+#include <sys/prctl.h>
+#endif
+
 //#define DEBUG_SUBPAGE
 
 /* ram_list is read under rcu_read_lock()/rcu_read_unlock().  Writes
@@ -1810,6 +1814,11 @@ static void ram_block_add(RAMBlock *new_block, Error **errp)
                 return;
             }
             memory_try_enable_merging(new_block->host, new_block->max_length);
+#ifdef CONFIG_PRCTL_PR_SET_VMA_ANON_NAME
+            prctl(PR_SET_VMA, PR_SET_VMA_ANON_NAME,
+                  (unsigned long) new_block->host, new_block->max_length,
+                  (unsigned long) new_block->mr->name);
+#endif
         }
     }
 
-- 
2.39.2


