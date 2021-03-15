Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6122233C5FF
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:46:34 +0100 (CET)
Received: from localhost ([::1]:55852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLsEb-00060a-0s
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs72-00045T-1X
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:44 -0400
Received: from mail-dm3nam07on2107.outbound.protection.outlook.com
 ([40.107.95.107]:46049 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lLs6x-0006Gc-GW
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:38:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdwuAF68RUVmOuV76PLge2gzXur0WTPWl4FOh+6XpOohd+ylTybFOVpilK84wCzvDG+jgiFSXDwWo/9itg4TmBztcC7R45sCgv/njeU2T0QlS7QI1Z8VFgE/+eeUdjceLAzaLsYokV1+S8r7UxgDQDGnY24lI4oEGv9HpIc9J9wPa+RDAAbdzY/fZ/ebjP6aAM+vIzsuili86a4yILznzvEy3/cobViMdoJMb8lBvhL5ZH6QkgtUBzrXnq4Zi2mX5bd0ZX3GFrQOxc04LG2ZAABOZR/ijSqfszqFQJb91n3nEjg0pzJAsV6YodPStRuxsjTgP94Z4fYKKmHYITADjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18hQ2sFx/exAn2/Ajqbb9gGeJjPnE6e1OZHXSLG9nEY=;
 b=My+eFPQKFJ/O4A98BXTEWPRtVhZIxbBorBod85tXgU3hiyeJVONDjUq28Cs8fy/r66ATS+iOVYTlYed49RHdipyIa+DNqChISfZ0V6miWiL6H64WC5dcGG2SHIYatKs5VJObH4uXl04q/zBV6wREPZyrbm2TBCUXZIXCg7SxtNK+IkwvN2KjdIv6PtbL072k6sO90ABWe0uNJDDKIbwb9aEJd5pLA0kjcs3gF9yrp7C3HZpjZmAVy/3QPvim8XahFEd5dPwY4FzbdeZ9yhBk8glBsHg2osHfGLwqaa0iYQXzlAoSjA0H0IMREMh+A0+1urcJdKBvyJuNKG8ckL8nOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bu.edu; dmarc=pass action=none header.from=bu.edu; dkim=pass
 header.d=bu.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bushare.onmicrosoft.com; s=selector2-bushare-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=18hQ2sFx/exAn2/Ajqbb9gGeJjPnE6e1OZHXSLG9nEY=;
 b=UcF+5Nv7McaoBAfo4wSrINT7phCNVtJOCW3k50qaRQuxzlrtT4g1gzFzXshkj/XZk6u3amKX4Hp4YbOgsrTaL2NrNGapL5RklC8YDDGf+Ux19aS2/lnBnHfSWkqkBx1QkFSot8fyC/ZeQE9bybRERFR2rHonp1Vqn1iGgVGOL5o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=bu.edu;
Received: from SN6PR03MB3871.namprd03.prod.outlook.com (2603:10b6:805:6d::32)
 by SN6PR03MB4286.namprd03.prod.outlook.com (2603:10b6:805:c8::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.31; Mon, 15 Mar
 2021 18:38:27 +0000
Received: from SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6]) by SN6PR03MB3871.namprd03.prod.outlook.com
 ([fe80::dda8:67d8:8d23:74c6%6]) with mapi id 15.20.3933.032; Mon, 15 Mar 2021
 18:38:26 +0000
From: Alexander Bulekov <alxndr@bu.edu>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] fuzz: fix the pro100 generic-fuzzer config
Date: Mon, 15 Mar 2021 14:38:05 -0400
Message-Id: <20210315183812.27760-5-alxndr@bu.edu>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210315183812.27760-1-alxndr@bu.edu>
References: <20210315183812.27760-1-alxndr@bu.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [128.197.127.33]
X-ClientProxiedBy: BL1PR13CA0323.namprd13.prod.outlook.com
 (2603:10b6:208:2c1::28) To SN6PR03MB3871.namprd03.prod.outlook.com
 (2603:10b6:805:6d::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mozz.bu.edu (128.197.127.33) by
 BL1PR13CA0323.namprd13.prod.outlook.com (2603:10b6:208:2c1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11 via Frontend
 Transport; Mon, 15 Mar 2021 18:38:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a878531f-3c5e-4244-5855-08d8e7e1855f
X-MS-TrafficTypeDiagnostic: SN6PR03MB4286:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR03MB428670E46F02307F1C4D07AABA6C9@SN6PR03MB4286.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5X82xcrkt6cGcu4CSHcJQX+IjW1+FSLcPu7IREf7Ub3eKJo5GQsMPtxu5ssBtp7nHa3JJWBjTFP3Yu+zxYKo5TMdaRCnLyJOBA9iv07YdB487+9QBQnlH0LENsV+CmzOTxZyCz0g4IjaEQQaZKlsJ/Nr9uCoO5DB9Anv546fQ9duEFKsIrxsMGymPKJ51cLCY31yiY0w+r//PyulEJ00Y2t+jKsXKmj/RxJdS5jf9H9qJr0WPX77qE0yg32/TFQDOJHq2e3qsHso0ywKRGFAKkCtcbtux6HeZ14EwxCarKm7aOiiyrYx7umLLdTK9u3pr1tJz3zDJIX3GO0aAeYxPKlnicMg4USvhc8ORsamyYpZ/Rv3LR4qDZk0rdgdkWRvjI/JoRx1YqaxZbhpRITrncE75Efl4NwRSNi6Z6teV6FX6ULC9qKEZk/lPfJXdZ0MXsWyK/VGTiA1W+Ta5yyrgmKWNnpjPvjy/Y7kkjJgYGb0XAwN9bRDYirN+5t32xtf+tyLH4CcRTKrQUiW5Oy7Uduw97i4PTjn1PD7PS+Id1Njttuz60malEjhxM6BUGPDmnLv9WBPcwkm/AAtTu4Jg5ACMFTUjB488b+bVEkK4w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR03MB3871.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(2906002)(6916009)(52116002)(786003)(26005)(66946007)(86362001)(6486002)(6666004)(186003)(2616005)(16526019)(8936002)(66476007)(1076003)(83380400001)(956004)(66556008)(54906003)(75432002)(478600001)(4744005)(4326008)(8676002)(36756003)(316002)(5660300002)(7696005)(41533002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RU1RS2MzdGJJcXM3aGRBWktzb1dCbTQwNzEvQWJIUEpYNkZkSVhaSFpQeUY5?=
 =?utf-8?B?VFhQNnNlbjRvaVIwMENEbk9BTlNWSzgzTWMyejVsMXNTWmJnUnoybkNhSFF3?=
 =?utf-8?B?QXRzRTd2ZjNZUEorVkYwaWI2ZDJvSGdRN1dpTHZVTlRFRDVLSTVpOWhFaXV1?=
 =?utf-8?B?NjA0d004UU9ub2JVVmcrOTI3RVY0NTFldUY3alAvUHEwb1hGQXRzTnNzWkVv?=
 =?utf-8?B?ZURyQVlFNlU3eUt3Tkc1NlNXNXg3UGlsL2YyRWN5NlBVMkZkeGZWRHJMc05I?=
 =?utf-8?B?aXZwWFozNFBkMnVXTW1aZTRaay9neThUZHFXU0JaaDQwN3ZPVUFOd25nKzhW?=
 =?utf-8?B?a1FyL1FpUXY0elJFZEs0RmMxR2dNQ3VmR2FPcFdlajdjMGk5L1JFazhkYTdD?=
 =?utf-8?B?RjlPSDlFY2IwZ0pxQ0ttcDVyL0ZSUDV1Q2JrbzZMd3RDc29lR2VKMHV5UUE5?=
 =?utf-8?B?VXBVRTlQY2xwWlc5d3pMVFFzTjVyMVNkZ0NONFRBQjdVNTlwbUJZaFg1OWMw?=
 =?utf-8?B?U3pGd2tWbS9XRTd5dnpsUElwZ3YyQ2pRejhDQjhmS253K2lLRUhxT0w0V3BH?=
 =?utf-8?B?RXg3QmlSZFd1QWhqdW9NakNLdzNrbi8wRFgzY1hveWt4VlB0ekVhRzAwU1dS?=
 =?utf-8?B?SWNKUmFNOWNqcUkySS9DQm1Ea2R2VXhDS2lDR21vVnh0bng3MFpQd0t3UHhh?=
 =?utf-8?B?YW5VUDNVY3RJZVJoTVcwUWhzQU4yZEJvcVBtbnBMbzlzb3IvU1FVZTVkeVpm?=
 =?utf-8?B?NDBmR3hWTUF0YUI5R1ZDVlZnT2xhVlEvakFHSkZVaEVtcUpJR2p3bnlvS3JL?=
 =?utf-8?B?cElWRXl2SFZsU1ZsYU9pa013OVZ3UkNaUUVXRy9VMjJSczAvNHp3M1dSYklo?=
 =?utf-8?B?bGxFZVF1OS9nL1ZrMWtseVYvczFXaXJabkhReUZwYTZMMVVhaU55azkvSklR?=
 =?utf-8?B?ZDBFSytuRkkvOHcrU05hZ0NsZ1NpMktJYk0zcWtwN0d3bk1odVREK3ZpQzZt?=
 =?utf-8?B?ZGVrSVczQlhhN0JsOHY1N3M3UVQvSUlWSk52UUZENzgyR2ptMFF4NG5qbkdi?=
 =?utf-8?B?NzRYSGxvYXUvZC9yaVA4WEVQbkJ0ajN1SXNtYjJkRHZ2SEw0ZmM1c3RIRFZE?=
 =?utf-8?B?bE93c1FMVDdDSlpubnFaV0Z5NXpXVmh4QzE3UHY4VEVldENXZEgwZjNRenBu?=
 =?utf-8?B?YjNHT1hKSVdqMk1oVTZ1VGpkWGhWRzBDYm1Edm9TaEJTY3NwbjhRdFFiTUtv?=
 =?utf-8?B?MGxMWEhqNWo1QTNCeXBlQkpIWjdUQzRrNjdKd2dLTWk3Zi9LaGFSbGE2aC9k?=
 =?utf-8?B?WEt3cFhQclM0L01EVEsxSWwvZklrZjJBaW1uQkdteHEzRHlCMEdCT3QwQk83?=
 =?utf-8?B?cnRsaS9oZkw0MitsMjZKQ0tONU1wT2xnZ0dHdHFkWG1URGo0dUFkanVaTWUy?=
 =?utf-8?B?RThwVXU0N0crWHI1bXUwOGlzbjF0ZVhSNDVXU3NXSzh5SHZ1Zm44b2t5aTQy?=
 =?utf-8?B?b2VZNXNIRzlycTBNYjkrOXJHUXBodFN2QmNCa1BocVZkS2ZyMWRUeENubjZZ?=
 =?utf-8?B?a2hvSWtQSGtFWTF1WlpzNzZwQncrcVlWeFk0R1llUk9YckZBQmJ2SC85NHdr?=
 =?utf-8?B?bmlaQjc0cFZmbWdRWHA3Mi84dHlRSVRwWFdTT1R5dTNsQWxXbTNQTldyb2V6?=
 =?utf-8?B?QjlxYjczZVlXem9vdlhwWm1XS1lRVmMvbktvYzAyMGw5STUwYnphMTJ1ODJ5?=
 =?utf-8?Q?bueibSSehAtqoXCb0Xj3tX9nGTlYMOyMqPvANDI?=
X-OriginatorOrg: bu.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: a878531f-3c5e-4244-5855-08d8e7e1855f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR03MB3871.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 18:38:26.7939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d57d32cc-c121-488f-b07b-dfe705680c71
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQ5eBVWhcrtQDPVEh1O9w57FuBw0O0u/Z+FWoUAs9eFFVwNHv2pVpuP54fPW875P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR03MB4286
Received-SPF: pass client-ip=40.107.95.107; envelope-from=alxndr@bu.edu;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
 Alexander Bulekov <alxndr@bu.edu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device-type names for the pro100 network cards, are i8255.. We were
matching "eepro", which catches the PCI PIO/MMIO regions for those
devices, however misses the actual PCI device, which we use to map the
BARs, before fuzzing. Fix that

Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/fuzz/generic_fuzz_configs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
index 5d599765c4..2454c627ff 100644
--- a/tests/qtest/fuzz/generic_fuzz_configs.h
+++ b/tests/qtest/fuzz/generic_fuzz_configs.h
@@ -177,7 +177,7 @@ const generic_fuzz_config predefined_configs[] = {
         .name = "i82550",
         .args = "-machine q35 -nodefaults "
         "-device i82550,netdev=net0 -netdev user,id=net0",
-        .objects = "eepro*"
+        .objects = "i8255*"
     },{
         .name = "sdhci-v3",
         .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
-- 
2.27.0


