Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F21933A1EB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 00:23:07 +0100 (CET)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLDb8-0007a3-EC
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 18:23:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY7-00068O-1J
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:59 -0500
Received: from mail-mw2nam10on2091.outbound.protection.outlook.com
 ([40.107.94.91]:5920 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLDY5-0002Tn-KC
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 18:19:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gl1jeKr8C4Fasm+LF5IIWec/exiLrLuSjXVCZdZ0NEH5ACk9GHEjkq83uDAyKsbWJ/tzAdS189BZc6pxHHdeP4liUWX2LKhldW9LUw3o2UXaNAfJhVCtg1LJfBON8xPWBIgZRdvuA7KeEhjx5YpZSl54n1MyaOrqDc8SVFNFnkbBvu+L9W+QAnbJTJ5HJgCte5+cxREVKWkSl5SgPPcJ0OqI0qWmg6YwtcTO52pZMq2IkpDZ2viWXj5UCf6aoUKYxe9fSS44RfRM3Hk34uTTr7dMjQgcnRCcINilUGOxlshK4Xa3zSf8mzjUUl8HQPZgOkCYixenbAGsWxMibZ3WTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdOYX4cjbKQxdwbRlvK+GzGKEb9KVd6iBI+IPwJI2U8=;
 b=Xo2H0vk3Lmuefn6J0GiRHyr7ex0QKxnSKdZmbctT1iaYi+aAZL42mTQl9sPNlKM8qLZVSjjQ7yMi8qZ0XdN/KCYjwkOYZ9m+AO0WrEV1KCNHv/8LsGGUQzQ64NykSRddIRUtogrsZkOm7cTovMEuT1qTjECDW8YvB1yvLB9SSTOJ8zTBbq1EdlQUoiONsLJoaMJPQaY3bDMh4rDWvF7Nkfedof37kx6x+J0001HmKrodVDTRz+ga4opuFUvD5E1RRNM08kjMZccyqir5vrUB5RCLCvc0F1mHaBm5xbN62t5AYQ3AtO5jwxaIANZyrkHk3DPwteSzyDnMOZjzi2DanA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdOYX4cjbKQxdwbRlvK+GzGKEb9KVd6iBI+IPwJI2U8=;
 b=MSq3eZvyjmSxGFUcZr3e1fC02mn6msF+Xu+0QrvN6wRPAKPjNwKBAMNMfeBwkfmcvxjRuldEYLPoPoSMgdW1170C0rljCStkVUad9UH8cgX1gV/wGxAHLPtNRGWRrDn5iCOqIGz2dAOxtupKZhy/RqK1UBlQooIXG/89zNazA3E=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4446.namprd03.prod.outlook.com (2603:10b6:805:f6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Sat, 13 Mar
 2021 23:19:14 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3912.031; Sat, 13 Mar 2021
 23:19:14 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] fuzz: move some DMA hooks
Date: Sat, 13 Mar 2021 18:18:59 -0500
Message-Id: <20210313231859.941263-4-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210313231859.941263-1-alxndr@bu.edu>
References: <20210313231859.941263-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [72.74.210.193]
X-ClientProxiedBy: MN2PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:208:120::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR10CA0020.namprd10.prod.outlook.com (2603:10b6:208:120::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32 via Frontend
 Transport; Sat, 13 Mar 2021 23:19:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b00ccaf-e018-4a96-f528-08d8e6766ac7
X-MS-TrafficTypeDiagnostic: SN6PR03MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB4446B668CFD3095A0E33BA24BA6E9@SN6PR03MB4446.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jy78UWwcdzrepzD+vwqm54cbVw81/C6qM4nTlmCd6r69C2+tx3CmF1WvKBBt0VKILcZgA/S+YhnUe+rALrpDnhDCSSY9vYKJhy9NZiKao/V96SgpNac9wF/tDX/s5bLnqJ5J7rLFycGQi/+oG9Vl8TBMhZFQUzq49AbA7N/dvH6ehmsqQJgeMT8i/lDdoQx622K3NzbxihlBMJkKUJZC/WPeAGuqo0qNKieIPnWOF+wMQU4u5q5Exs/1YWTsDZ8oBZ8YnrBEBah8rjl/mS+kQ16oDWiWg09FqBOJj1aMNFaYYtytW66VtsfU8PTr6DXU1O13B4mCvQoFYuF71dNUJEAurXnBbBjg8qj1U8p0Ivv8dHcPiLlWLSGcLqWBL9JHl4QK+YYjZIMOjmHLK8mcLN/aRK2YVYTgIYUNa50erWN9aTXvYDStb8rzHlbyVCM7BuFqIUtwSAQ4TiSo/2Wi1RPbIUFvHv8h1x8jS5ahKwYowij+Uraz/KxPxQJm2FELHzUvVPo/++rbVG/UNUBRVBcTEejKDxmFZHlkJPatqVa1PFOXCvdct/oRk2z+7Noz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(478600001)(2616005)(86362001)(8676002)(6916009)(6506007)(956004)(36756003)(786003)(6486002)(316002)(2906002)(6666004)(4326008)(186003)(52116002)(6512007)(26005)(16526019)(8936002)(66556008)(66946007)(5660300002)(66476007)(83380400001)(1076003)(75432002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?rj3koCdkiVakKk9zt1kl8AGn/qo4BQh4fFADqaGUhN8pgJDoznOq72hk2fqE?=
 =?us-ascii?Q?rVJmSdn3IWirW9Y+wTKb4xgioG+m7e1a6aDtaqH65d9KlUtXsM5KNu9x001N?=
 =?us-ascii?Q?jfwOkhjzpyHikDs6vR7uqp6cxv38Zuca2GG1ERKCljQVRI/0N/LF53GRehKY?=
 =?us-ascii?Q?WexkeVBJHYgvonbVYaxqoGDK74dkzXn3XcpXEc0EhJbM2BWWFr3bJBmAHsSI?=
 =?us-ascii?Q?+mEobxEVPA2YuO/8bzI3J2OVcEgB2R98EKcnppcSljjs5RUEj4EzKWKXKOet?=
 =?us-ascii?Q?dNYoD3gR5dTAcv96NQePZJP1HvdaEZicVwgX9XhzQeF74IDI3fPUvSF0iuxs?=
 =?us-ascii?Q?DTMQQwtvyZvMsHqOB/Wqkt6mhTBZhEb/ow5O3zl5efzoEx9nHeUUMtiO/n/C?=
 =?us-ascii?Q?uAOEepUokaBp0kcVggAklGAAsTvWbnb84xARLVh39sdNYAoJE+i6Z1vjhO1K?=
 =?us-ascii?Q?StRKJzuNR05Bnm/rP0Gi7OS0gmtXnylnyEshQlkDwgrIuXRQrP3CUd7xsvqe?=
 =?us-ascii?Q?4vu3TSWFUp7omwiyCfULvimYJbTCLOkbLKuGxM2Heiftkei45Pwzi0Im2DuR?=
 =?us-ascii?Q?CpEL4iy5DrCPFJJgIZsR6lMka1mfuRR6jMIeuhgQqzB3ChWl13HqxmSFQi82?=
 =?us-ascii?Q?jbnhBUlzAykgyAOIJ+QZDIVRU+A0iplzXRxJbLyLFnwZ7ntBYp98zMnyYRT9?=
 =?us-ascii?Q?U1EVFjXSXUOZVcEfEIODF9yW8tjUuKW32vjYIan/ziiG2fpZ+njDiUnrDNCL?=
 =?us-ascii?Q?xVwW2zaHeWrgVVcRyGbbm0LSdA/6hVfcTtTN0iFTHnfpiw+OAJpJgpBkOxmp?=
 =?us-ascii?Q?qO40bvVM1OUsfJb24QKx7pKxz7U5s4/CRuX0Ap3IOzEIHqU8wMoy/+zLfR5s?=
 =?us-ascii?Q?srXUNGQsagvQ6WbmNBGp3kc3GBKhMyzCmhEeuwvOLoT+7U7/5Pd96Qh6F7Q7?=
 =?us-ascii?Q?/6nr2WEBXRPec+kfKgRpnXBAec7T+JsTe1yS7KSDNBq84U/I/3pp0e2DBACb?=
 =?us-ascii?Q?sIbWFL8chG5lFctljUsEW/BoWr/dGSPLkFE3K4gGjiDMOnOmln2URg6BRBK0?=
 =?us-ascii?Q?gow9ovgKMlF8zu1jDmUPt305PecfaAZJBD9qj4DhoRHCGevzhAhBqedTxkKK?=
 =?us-ascii?Q?Jea+zB4OUjsyuJr3cxbtoLupvwTZpD+3uafhVS9J0SW78lKmdA0MI2ulNMim?=
 =?us-ascii?Q?dfv8CngNY+6nzT8HU5CsuPLDnR8xWl2g3d6ZhIBCzjrWle7hf/CDZA9ZDn/K?=
 =?us-ascii?Q?WjhNjB4xYQJ2KVnfW9OM5WsH/F8eXN6A0l6n/7oxh0SpBu4eDIvCnMDSTNK6?=
 =?us-ascii?Q?42M/uUCjSbmG0qUHuKVuqBmN?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b00ccaf-e018-4a96-f528-08d8e6766ac7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2021 23:19:14.6570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgfsQvNRmuNina9o867rpP33BiBZvfdYPBs3lsuDfXdPRKbhbM41J1K+ftGurCbS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4446
Received-SPF: pass client-ip=40.107.94.91; envelope-from=alxndr@bu.edu;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: darren.kenny@oracle.com, f4bug@amsat.org, Alexander Bulekov <alxndr@bu.edu>,
 bsd@redhat.com, stefanha@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the sparse-mem device, we want the fuzzer to populate entire DMA
reads from sparse-mem, rather than hooking into the individual MMIO
memory_region_dispatch_read operations. Otherwise, the fuzzer will treat
each sequential read separately (and populate it with a separate
pattern). Work around this by rearranging some DMA hooks. Since the
fuzzer has it's own logic to skip accidentally writing to MMIO regions,
we can call the DMA cb, outside the flatview_translate loop.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 softmmu/memory.c  | 1 -
 softmmu/physmem.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index 874a8fccde..3b8e428064 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1440,7 +1440,6 @@ MemTxResult memory_region_dispatch_read(MemoryRegion *mr,
     unsigned size = memop_size(op);
     MemTxResult r;
 
-    fuzz_dma_read_cb(addr, size, mr);
     if (!memory_region_access_valid(mr, addr, size, false, attrs)) {
         *pval = unassigned_mem_read(mr, addr, size);
         return MEMTX_DECODE_ERROR;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 7e8b0fab89..6a58c86750 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -2831,6 +2831,7 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
     bool release_lock = false;
     uint8_t *buf = ptr;
 
+    fuzz_dma_read_cb(addr, len, mr);
     for (;;) {
         if (!memory_access_is_direct(mr, false)) {
             /* I/O case */
@@ -2841,7 +2842,6 @@ MemTxResult flatview_read_continue(FlatView *fv, hwaddr addr,
             stn_he_p(buf, l, val);
         } else {
             /* RAM case */
-            fuzz_dma_read_cb(addr, len, mr);
             ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
             memcpy(buf, ram_ptr, l);
         }
-- 
2.28.0


