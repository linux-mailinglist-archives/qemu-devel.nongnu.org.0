Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4DA478E31
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:45:58 +0100 (CET)
Received: from localhost ([::1]:35556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myEUe-00054w-2i
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:45:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myEND-00054L-CV
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:15 -0500
Received: from mail-bn8nam12on2102.outbound.protection.outlook.com
 ([40.107.237.102]:4416 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1myENB-00070Q-OL
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:38:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TU9l722pPDhU8Pw30COMQID58KMG1iP91C9lrhREWGNpXKAaUeFESWDjCixV/lr8hCzNlP0BF/VuA+5MB/N6GS56mpAmLiaB5Bn6B45IyVX+Qc0Q29puW2qg4YhICmWvVqnGICNTd83BTghZsgju38iWB1al8/qWfEMpnseLTI1yVJbkA9bsekGfhpI8VZe8TvXrpIlIBHsBMAe+njLPTgOP6N1s3PtXj1p6SpnCOHD6ZctYUJxaNxFQPy/4wM+PS87VxleFU6QYSK+d1AViWS7+SKjzInE99TJxHhWBovB7dUmpYxZHZ2OZTTgl5t2f+snAYaV3m+tm0YC0cFaHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miInYwJhRoviLDWuQHw49wpJpOL629Qso9R3i7VOjOU=;
 b=R0lzodxV5YcD+8LRRT9O5WX1QLMXGKXdhUe80jWAKcstC1QN6X1jwhAPtGgH2rVGYfz2uWbzG+kaSHNONrHFpGl67u1JrskgZ7xJbj5D/d3dPkju0TQeR87L/umJ9Qah0+oFi+eMhgjdx7Eb79LkYMmuuK+RFG3sBckQLOZnhblIizHaQcZTQyTj1uSoEVFfzgs7PKHpS7Kts33NH6vRrAWkLYLHL8+WskMO9Gl2bHUFzDBhDWIwfdhn4DwSb5AZqXc+k6I/hU9ntmV3A6PHAB5gtfY728G5tW4b5cCXMquDZ99K08mgilRTjvSE45N89wPIUQd5OuE2Q1kZao3+1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miInYwJhRoviLDWuQHw49wpJpOL629Qso9R3i7VOjOU=;
 b=gxsBxVoJYCcnkR2EMldPci7VyKmLer0poL7bqOdqm0OzldjdQC300pveRzJo97dosBVXcYkCj+QnQaDojPqBrSXnnchwyrKSs3MtCUeGxlI03iz2bwDyzh+4Mx6qp/XGEQLj/9o4lnsGzzSgZsCzRee2Rp/MRMS1MaUpBwfFWSiLx+hjKQMr4NPfFY6nbd8E0u5wJsuT5eq36ZArPUW3L6P57FRo8RpS7mjE2jqv1mUI438cUfTQrNz854gCqMlhEOb2T/ZvhKqFzUV8ZbcIeoDBjiiWWk3sflczifzcfDiXO0dN20pfPJAC3NEWOSuENT0HDANAXIWHfpfSL68vbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SA2PR03MB5724.namprd03.prod.outlook.com (2603:10b6:806:113::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Fri, 17 Dec
 2021 14:38:04 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::6cf1:fa6a:fb65:131%3]) with mapi id 15.20.4778.019; Fri, 17 Dec 2021
 14:38:04 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 1/2] memory: fix dma-reentrancy issues at the MMIO level
Date: Fri, 17 Dec 2021 09:37:49 -0500
Message-Id: <20211217143750.50641-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211217143750.50641-1-alxndr@bu.edu>
References: <20211217143750.50641-1-alxndr@bu.edu>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0305.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::10) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81ceb6b6-b765-4d18-98d4-08d9c16ad58b
X-MS-TrafficTypeDiagnostic: SA2PR03MB5724:EE_
X-Microsoft-Antispam-PRVS: <SA2PR03MB572485C8F0A96DD2F24E369DBA789@SA2PR03MB5724.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:172;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n8IuF7eSNWBbcu5wCElP3rdoQiMuTD48z/bHplqW017Rq5YvTBpdrrssfJuS5aevlpdbut5nIMf2y+qobBvvJMhlyxacizfm0yuL7wWm2bbM7b1ZgUKdCn5vS1MiiViQ9esZkigFl7zD1OkbRvy+SBstqeBmDpbPuoeVsuaqbPFaiPAcz/nSalwXC+s2a7cKmYXT0o6SXdb37lPvtnDI0XFkvJQhQ2G9SvQ8V5ytFyWVd7UCu8o9WC0zLe/3X5c0oW2KXQGPnAO/rKAHDoRrIyAeYOAr9qyV9fCU9pxt/PCZDDV1Qe5XGjUcA3pclFd9EjZf25t1gwnS2NLnnqumjdLq9wtaIKNUlc9kta39D+NFrqyy9ZndKdUUF7QwzpVzAfCc5wtomxKGgZp7J/8R1ipUv/axiC3WkAon0NSpNGcCVGGzYRXMkHCpD1B4bkBF6C2MlJzVNOL8hyobBGd2nyeVXUTLFYSckhovZwxfU0JMBBpWZMvHhaDpSGH++07m6FnPDOArSig1W4Rwtwt+CoyBsaoEmrty2++6IRgeSa4R1FPQj98OugQs2u2vNQytBHlgeMxfnu713pptA6DYPPQDtAE5/EgG6ddGnjZfEmzk7uZnuWHGujy/aKTPdVM3Uq9qn7jcQuG3f7txuXd53477trJu1mcls/j84dwzI+kiME3pyMA9sg+HUSJBWWLtg/vLDDByUKTwdvcBbORPWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(66476007)(1076003)(4326008)(316002)(6512007)(36756003)(786003)(54906003)(66556008)(26005)(5660300002)(66946007)(75432002)(83380400001)(8936002)(508600001)(38350700002)(38100700002)(86362001)(52116002)(186003)(6916009)(6486002)(2616005)(6506007)(8676002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4mU27oYUBgRFrJw3o03dhHIKMnkAWaJiKiQb+FVpsLwOHebEnv1MdIXYBJmC?=
 =?us-ascii?Q?niO8ckNiMWQHhOBDMp4b9Z4vF4Vb/tnFmP5XFGatU9/h5UmAeGoIuSimtz2n?=
 =?us-ascii?Q?bDffSLUaw26fDdLijNIy4faYu2/ZSaxp4wwgzYDjyM0BTXhM/8kTwUSu53VM?=
 =?us-ascii?Q?p8rnOQSdAadnaHhja3HDrLFsqtp9FPFUkIxMS2dyuQdJxLrjXP1d4HexwZYU?=
 =?us-ascii?Q?G93amzmt8DplVIjUMYjDie5cZtQdua/hdACPDBvEEzADbHXDnr0eKp05Pa6X?=
 =?us-ascii?Q?8BBXrdjJ/lbauSkIJKef3ndVdGVMlY8BZboBvHSpJG1bRZN8c9lMwk+FQVUg?=
 =?us-ascii?Q?5H+SNRG73ZGdHaIvJdKx7uhEMutZLTQ7qKtcC8GMZyDqS7/lS6Ge7lsv7Aby?=
 =?us-ascii?Q?TVq+yPwBfcfuuGdNmABkbqENc2SawF1zyeIuL6mYLe0MeTlrxbIhjKGNSPbI?=
 =?us-ascii?Q?7A+kJJg79RP7XhFSwu4CLyJfhktNtw5VvU7WehYJpiTgTKisvyoLPYBTk/Vw?=
 =?us-ascii?Q?2nUmyT2L4ge6wk1S/q4nZxAt9eWdTRivK20ZXOz1MZyCa3yvd0JnEL37/I3l?=
 =?us-ascii?Q?5ux+9zqPUzAMrRg06m70uYo1A/MR0oYbW2c+AUQVgiz9yQ9YKzMThnNBqrhk?=
 =?us-ascii?Q?F2qJjY/vmH5bDo4aelSQukcYlEFA3GCxKgieS1Cv9BHdWskjbvd7JF+t6mT9?=
 =?us-ascii?Q?WRNc6VE/39wnwuX/N6Jxt0SLp3qYkIwAwxsVm+03Cgti2pIEEojafYczCJoV?=
 =?us-ascii?Q?PwUq3KWq2mREeHyUSuIBBNjgxndGGsBDaD2QaQ507kF8RLJjeXi7I82X3b+1?=
 =?us-ascii?Q?KGSD2+ET02ie/MKQza5zsWzQaM+PMKfTJIuyBpvzUXRnxsoe65CIaWVvs6mV?=
 =?us-ascii?Q?Nitkxt/fuRTnTuOV4MzPHy9q9x62nRtDmO9vpirICLNtoyen+r14/SVivtW8?=
 =?us-ascii?Q?xZQlzcDvu3NH/ighAaiRnwq8z0nJasXNyXdRo7mPDfxwTnXrQYdh+4k6wMII?=
 =?us-ascii?Q?LvlrDBntwrDt/ApyIXDPhGaQSCEzEfMS+DzS8t52hAGVlGZ6iagr0hIHuN+J?=
 =?us-ascii?Q?UxWKqMvHLiWfGZdGxkNRI2dZqRuFvi4n/Vaw8wtjnqIHlZvyNRYon5COB/ep?=
 =?us-ascii?Q?3KjU33N6pbGkUTecjqa6hSFaI04Pib98fQOTjDUPktAAD+d2KPyJPZ+/gfmq?=
 =?us-ascii?Q?CzFXH28hVqJyoq21NowrJ2GclxDCar9tIJVQWrwp5GNEDpTVtRHlbWun2Rwv?=
 =?us-ascii?Q?UE4ZDUBfMsJlHUu58ci1pidgsCKMf0azJB7mo9TBwxc5IL/Qs5PHOWPxu53s?=
 =?us-ascii?Q?G+ofk/CnrbsiE4fMX8Su45Wo+f+B8Xvea1VCK9XkVcsfOW3BdlGw4tqzoPUX?=
 =?us-ascii?Q?C9TVzmt1rgpZkHjG3Kdz6yywx14IyAAChky1CsKwp0zh3fVf929W7ZtcAjXp?=
 =?us-ascii?Q?SILPf7+ThiTwsPrCF/6c7iP++uHoH0mkxkPp9wraLDXpph7NcXWtLxECWxv3?=
 =?us-ascii?Q?FGAbDuAwp4bXKsgv//P/3zgAueRwSj1+4ec9wBXezxoKc8ZSy+ssjrFvHQ?=
 =?us-ascii?Q?=3D=3D?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ceb6b6-b765-4d18-98d4-08d9c16ad58b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 14:38:04.5414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUQUbs29d4Jylzdt7caoDTmG+CUxP7XeiePhuBuJmvn8zFUpLwWPa0on20kGx34w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5724
Received-SPF: pass client-ip=40.107.237.102; envelope-from=alxndr@bu.edu;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.998, HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a flag to the DeviceState, which is set/checked when we call an
accessor associated with the device's IO MRs.  This should prevent a
device's MMIO handler from using DMA apis to access it's own MMIO
regions.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
---
 include/hw/qdev-core.h |  1 +
 softmmu/memory.c       | 15 +++++++++++++++
 softmmu/trace-events   |  1 +
 3 files changed, 17 insertions(+)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 20d3066595..7b93b017c5 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -193,6 +193,7 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     ResettableState reset;
+    int engaged_in_io;
 };
 
 struct DeviceListener {
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 7340e19ff5..229c63a68d 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
     uint64_t access_mask;
     unsigned access_size;
     unsigned i;
+    DeviceState *dev = NULL;
     MemTxResult r = MEMTX_OK;
 
     if (!access_size_min) {
@@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
         access_size_max = 4;
     }
 
+    /* Do not allow more than one simultanous access to a device's IO Regions */
+    if (mr->owner &&
+        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
+        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
+        if (dev->engaged_in_io) {
+            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
+            return MEMTX_ERROR;
+        }
+        dev->engaged_in_io = true;
+    }
+
     /* FIXME: support unaligned access? */
     access_size = MAX(MIN(size, access_size_max), access_size_min);
     access_mask = MAKE_64BIT_MASK(0, access_size * 8);
@@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
                         access_mask, attrs);
         }
     }
+    if (dev) {
+        dev->engaged_in_io = false;
+    }
     return r;
 }
 
diff --git a/softmmu/trace-events b/softmmu/trace-events
index 9c88887b3c..d7228316db 100644
--- a/softmmu/trace-events
+++ b/softmmu/trace-events
@@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
 memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
 memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
+memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
 memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
 memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
-- 
2.33.0


