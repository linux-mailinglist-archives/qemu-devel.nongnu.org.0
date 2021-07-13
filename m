Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530463C69FD
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 07:54:55 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3BNe-0000Z1-Dn
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 01:54:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BMn-0008Jg-F7
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:54:01 -0400
Received: from mail-bn8nam11on2070d.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::70d]:30144
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1m3BMl-0003DD-OU
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 01:54:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dj+g++XpCh48LpZVFMYSaeoZDriqQYVWYBR31NHJpV6DaXZnLOShiromOC4+NyDsd6LounjPzwR86D3d1rut9uRfedD/4I9Rg3bQew1k8pyBUAYgg96wk4bzvCJNWL+R4Uh7K7wW0cmNz/EzAFPfQrwRaPHpQeGL4+zPwz2hmnt8jP1CGwHZyo8yIPJmoQMpOG9cP9RoMTXywmIN9JRc3a8TUNi60kISEOoVPz1Pkz+IRttfe45Whma/tf0LTQMTBTp1/Q9gHlidf3M0f/KllqhjGs9zTaYJBbiqkhwUhAJkRhjFa8xRH9ckzrwzhDogZV8YUdXRHlcE6zy3T6oc4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF9aTRQnvRLf1kNFgJ7H+mEonbE0DzCv3qCtz16lMqc=;
 b=KCYIBCsGe13pYyphFVMecfx3SvhAJCiezlCodz2o87tdTbKqBAnXJ4Hxe2Hzq5LRZi6llej9Ot2uf/4AGfI4sc28UrXniZw5SkMhTJwv4UVKxWcqw4yMtqjsLAMcHYEeHIpdYpKS0sr/I+gmZXQvwg8NpFJNyaeyTdvMczG9Y/4km243gLBF5dDMG1mJp1Ap3ZczrEZYsK6z077ukdLf8cNLOFWCTj2G3PJ17sWOq3gdAQ7HV22K1iQlasaHVXQtO6t80cm5aEDXgoJeTMBi7th7pK2e72sxh7fZmSgru9c3So0fDgFKpEhm+b9pewr3hrdMFu7QklrAjcd2d8sH5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF9aTRQnvRLf1kNFgJ7H+mEonbE0DzCv3qCtz16lMqc=;
 b=kjGbGt5vi3KsjuSjX4cAICiHV03gUI91ys16YI9lSaNQ/hGugsexftmVniPL3bEMZCWTKC4d4vBstVpQFAMulo+oK6+rBYdhhIYfZfLcYo1e33zwENzFBxmD8A2aPalhpdKdNwd7vo1xr42ikAG4LPgWLxo4HKBYX77NW9Ev3tQ=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN2PR03MB2285.namprd03.prod.outlook.com (2603:10b6:804:d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.22; Tue, 13 Jul
 2021 05:48:56 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::24fc:a5d:be8d:eb3f%3]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 05:48:56 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/3] fuzz: fix sparse memory access in the DMA callback
Date: Tue, 13 Jul 2021 01:48:34 -0400
Message-Id: <20210713054836.154421-2-alxndr@bu.edu>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210713054836.154421-1-alxndr@bu.edu>
References: <20210713054836.154421-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:208:23a::33) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from stormtrooper.vrmnet (72.74.210.193) by
 MN2PR03CA0028.namprd03.prod.outlook.com (2603:10b6:208:23a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend
 Transport; Tue, 13 Jul 2021 05:48:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c79a7481-c2f7-40b2-d188-08d945c1e747
X-MS-TrafficTypeDiagnostic: SN2PR03MB2285:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN2PR03MB2285A17227F6C40EAFDC6BF8BA149@SN2PR03MB2285.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +CiOPWDYnELz88Txbr/PBo9Ht0GY+UM/3AGROC42ZomAHhFdoXPU7AjMIY2pBS9md7PHWQu2eCoR0JbbfP7/C6XYLmqhedQfP6ybQz2Jx9PfqEsA6rT2vfLXh1q8lpvCuraIBjIpDgpAIo8SooskgWT5DuHXr7WWUF57+GU7ckC+SgStyikHiZZuGSTffaNma9+nG7s1cqq9xovYpEKclFFZukTKJCRp751/NoSkEIAuC8+9wEfCY0Azd1+csA/jWhsSRlI7b4AnapHRk4+hlWr6jtEEjLyycxSzzSekgFtcWgmzgWiAI1Sfc1r84baH4zFgRc/JxiRS4ESXWor/gEAYR0xKzpzg8evgO0SkxA1WjNIFXzqfKzunZYddMV+GJzkb4jJSC3MMs9YVY/+yTRfqMAK6B36VRwyMvtra+6gnaFyArP0QhIzvjUkBS9GV/EgndtTNoHzzApvgG2M97m361mhQAvvVsPxZ8iWmtPQm2zFhltuNkGZ+9njlMWqQsZln1vbqkN5Xzc5fSsV5RSM4RHJxXH1m0oOPcNr8n+nkJzQD4QV0TZedDL0vOnbtv+nx8H3/vPNeODALiRCbm6Zwp36qh+DJDZOP83cxeiTFRoY6LqEuQHM1VmRZR7KJ7gHQX/p61r1qudp5y0sPQE61xCVTSsCscYiwa1atlsjTynBkNtFfPSODKFdz5gwyl2agfiZMfKHTFUQv5GEN+g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(75432002)(26005)(8676002)(36756003)(6506007)(86362001)(52116002)(6512007)(38350700002)(8936002)(316002)(786003)(38100700002)(956004)(6486002)(5660300002)(2616005)(66476007)(66946007)(66556008)(4326008)(478600001)(54906003)(1076003)(6916009)(2906002)(83380400001)(186003)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckhFMEZYRlZMYmlHdXYweUJPbUpPTVczczhQZ3Z2dDEvR0FxWEVyOVBJYXJx?=
 =?utf-8?B?YzlsSlhPWFRpSnVRWnNFc1k0T0RJclJEVjlNbnY0Q1hjVlZPNitsRkoxaUJm?=
 =?utf-8?B?ZDUvL1d2eFhvZHZpVUJ5MW5CL3NRN3pIalBvRkI0NVNUQy9RRHNoM3RJbjR1?=
 =?utf-8?B?ZVNIYk95RVVPTGVPSTZpSWYwUzRuVXYvdGNRcGFORTI1SnFRZHk1M2FxZXBj?=
 =?utf-8?B?Q0NIenlvZzU1a3pGQng2UmZoOVZIdzZJUEgyU28rUzEzYXRCVWlRR2MyZ25P?=
 =?utf-8?B?SXE3NU9VSzE0MS9YbmY1MjlvZEhSU2t0cFBOL09YQmF2ZHJPb1hVbU5uZW1O?=
 =?utf-8?B?S2h3Ky9oaW5KTnNiTFBUdnBIUThHd1dnRXRZd0xPYkd1ZEhpMGtGdE5TZFNF?=
 =?utf-8?B?RllSamE2ZnlPN3lmcDlxdTl0dGpVL2ZZdkoreVM3RnN1UGUxcVl0YXJGc1Vm?=
 =?utf-8?B?VmlsOW9ReCtoaUFOSG94ZUc1dmUxeDlRWXBHQTRsTWYwQ1l2NXYwb2ZzYUpv?=
 =?utf-8?B?MEMzMW1HR25oK3V5cVp5U1MwTGhMK29NQWNMZmYrTXBNNFppYWdyK1pRL0E3?=
 =?utf-8?B?TjAxd0VFSWx2dS93ZW9zdVVHais2YkhBNmlDNzhPcEF0OHZFTGNYYVBUd1c4?=
 =?utf-8?B?MU90OTUxS1lUcElRUGNxQkJqbUhRcHdPbkt6K3pGZERVOEV5bFM0eTdBZWNo?=
 =?utf-8?B?T2VpOW40ekZEMUFmNW9lWTE3SzFUaXpoV0xnWkVzRk5TOGorSDBDazQ3eHdi?=
 =?utf-8?B?VEtsOExlT1ZWVTNSV01xL3dxWExEMGhZOUk1TXBtbXJLTkFoQkxSV3pNM2Qy?=
 =?utf-8?B?Yy9UTVVsd2VOYkZ6NFRUbHBSSDl6RUpFb2JLK3F1NldjbGlCK25LTG5OaVgr?=
 =?utf-8?B?OW41ZG9wMzdXM2xSY21qQXB3VG1wOHptSGVicitZeVArNFV2RnZrVHRCdjIw?=
 =?utf-8?B?OTMwcDdSSHRGUjRlUWFLSGZRZkgyTzU4THE2OFNQV1YralVXSExxdURTMjIy?=
 =?utf-8?B?aFplSGZaeER0RmRjMTlqY3h5c2FJOGc2VEtZRTBvWlR1MElMMEF2d1lQK1ZO?=
 =?utf-8?B?R054SGtIWkpxYnVUV3FKWHRibjFGaS9NQUJ1UWw0YTlSbU9OYkRWMis4U0lR?=
 =?utf-8?B?VEpXZU5jbll4UXpOMHFpNFN4L3NDcmlBTUx2UnlXdnhhZGtKOEE5THh4QWtQ?=
 =?utf-8?B?dlAyWG1OQ0FYN3lpd0VJakJmUWhRWmZsZHl5NHBNbnVkdm5WVFpzSkplK05s?=
 =?utf-8?B?SnU3Z2d5NS9FL0tHZGVDVWVsQnZRYkdEdmJ6MGYrZVY3RnJ5Sm1UblJERWRz?=
 =?utf-8?B?Y0lZaDE4L0pNUGRBeU95RGZSNW5QZjIreS9QeVBxRFRSU2c5QUpyQW1ncVJF?=
 =?utf-8?B?TDdDVHkzK1BQTVdoeGFJeGpLRzdvWG9tWWM2M3dJYUFoa3NkVnZrdlFKKzRt?=
 =?utf-8?B?LzFxNC9YWUxvUHdiTVltZldQbnZtM2RyZDVIZlBFQjhzUm1KWVFlRGpxVzNx?=
 =?utf-8?B?TWtjdlBBRzRwUHJoek43R0Q2alptRytiNitnOE1iWUVqZnpUTll3UnZCRko0?=
 =?utf-8?B?RXc1TlluWFpLS3F3UnQvNmFBNUl2bDdad1IzZmk3bFk5SkY2QzdCZ3NoUkI5?=
 =?utf-8?B?NDU5K2RzRnFkT1lLRmdVYlBlU0VrZ1dwcGV5dGoxNkdXOElvNjVUaXU0ZmNT?=
 =?utf-8?B?aVBtdFl4emhpekZVbWt5WHZHd0Y0VXhDb0Y1N3NQQitOZ3M1SnN1djhUYTk2?=
 =?utf-8?Q?ZUnKSeFLs+RA7xem1I1hwdEOwkwRYNMFIxcEQ6l?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: c79a7481-c2f7-40b2-d188-08d945c1e747
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 05:48:56.2393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zQ/2IZu/5IkKAvIxXlYhNMIs5eJqJu1Yqn8L0yFhg5HrMUbNZfX9kuNm5SM93cKS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN2PR03MB2285
Received-SPF: pass client-ip=2a01:111:f400:7eae::70d;
 envelope-from=alxndr@bu.edu;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.998,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_PASS=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code mistakenly relied on address_space_translate to store the
length remaining until the next memory-region. We care about this
because when there is RAM or sparse-memory neighboring on an MMIO
region, we should only write up to the border, to prevent inadvertently
invoking MMIO handlers within the DMA callback.

However address_space_translate_internal only stores the length until
the end of the MemoryRegion if memory_region_is_ram(mr). Otherwise
the *len is left unmodified. This caused some false-positive issues,
where the fuzzer found a way to perform a nested MMIO write through a
DMA callback on an [address, length] that started within sparse memory
and spanned some device MMIO regions.

To fix this, write to sparse memory in small chunks of
memory_access_size (similar to the underlying address_space_write code),
which will prevent accidentally hitting MMIO handlers through large
writes.

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
index 6c67522717..0ea47298b7 100644
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -240,10 +240,17 @@ void fuzz_dma_read_cb(size_t addr, size_t len, MemoryRegion *mr)
                                       addr, &addr1, &l, true,
                                       MEMTXATTRS_UNSPECIFIED);
 
-        if (!(memory_region_is_ram(mr1) ||
-              memory_region_is_romd(mr1)) && mr1 != sparse_mem_mr) {
+        /*
+         *  If mr1 isn't RAM, address_space_translate doesn't update l. Use
+         *  memory_access_size to identify the number of bytes that it is safe
+         *  to write without accidentally writing to another MemoryRegion.
+         */
+        if (!memory_region_is_ram(mr1)) {
             l = memory_access_size(mr1, l, addr1);
-        } else {
+        }
+        if (memory_region_is_ram(mr1) ||
+            memory_region_is_romd(mr1) ||
+            mr1 == sparse_mem_mr) {
             /* ROM/RAM case */
             if (qtest_log_enabled) {
                 /*
-- 
2.28.0


