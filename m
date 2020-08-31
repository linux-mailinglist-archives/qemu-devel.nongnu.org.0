Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C39325814F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Aug 2020 20:47:23 +0200 (CEST)
Received: from localhost ([::1]:34972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kCopu-0004Qh-K4
	for lists+qemu-devel@lfdr.de; Mon, 31 Aug 2020 14:47:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1kCol3-0005r2-Gr
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:42:21 -0400
Received: from mail-eopbgr750043.outbound.protection.outlook.com
 ([40.107.75.43]:51695 helo=NAM02-BL2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1kCol2-0007Sz-5h
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:42:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLzEmllLAPZOdSfsJC56EO9zGOCCddWEv8jYQ18WuHx9zHbn7jJX8AJtt6y5FJhux92CfpduYuQrYtUEFOD9B10LtZkRccFHUryHbUREIhrd5STjZ8efz4fRZgoZDxW35HZKvIYsIj3JFkI//ScJypAHcqf/2rZakntuGhVGGHylauxWpQmKiVqPIInRkurNqEv23MsgZTD+RmLs5IbyjvpWJVLr90xakRvMWfYvfQ3NJw1J/ZgIJJ4woFIj7jQIoWkl1xmX8YCXfPAUaXFp5VQG6RpCRdC2UFUytUn1w4rakGB1SHWo0mg9pKNnwKYrzvliBGeBjhU6U+uHGoZcIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9p0ovwqYrpmecY/lG8nSMN2vBRA6yCFMS067YaxtJY=;
 b=aKcRd48srridNhO9tWkNBNxBKmCvwYsv9flqZcsvt7feAkDE7vACYgnhZ+jSH5Ha4vHd10CrU4+KSxRydMJxTZKhLZXmoG/8A4aIcKhQKY217iAY9gQt4fWoERMBQ4uvJ01dnmBvjlhbN4kY8HPDeQQQ6EK6dhY88RRvdK5p3QnbnDMrevxHuDFPuyOOBQbuPUtba64VSngjSmNXhV8rSzpYiXxtU1giQ82LhtrbSJyeQ+jj5zfYiUUFL60GaNwLgIiKTjcAxE0GqD1100ciBo9djS2kCWDJXLGBBBvOFkwCJ5YPHzyj71TdgS22kAUGxPKNrzggPbKrJShX1piaJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e9p0ovwqYrpmecY/lG8nSMN2vBRA6yCFMS067YaxtJY=;
 b=TT0sRTugoTuB7GNqFNmG+3+0sh9/PsTaqYz5nOPmn7m0fz5bPFsjzpudFhGymBFBbx/WQcbC6Wt0C4TFC6wOKZYjI0OzOpE/kJV3/zkM0PkkNxv1zCli9kAxRQPBB4CJS2k+y7nyQUYe25rGES6NP1+zZeqjs4C8fmpHqRqoyMQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2559.namprd12.prod.outlook.com (2603:10b6:802:29::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Mon, 31 Aug
 2020 18:42:18 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::ccd9:728:9577:200d]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::ccd9:728:9577:200d%4]) with mapi id 15.20.3326.025; Mon, 31 Aug 2020
 18:42:18 +0000
Subject: [PATCH v6 02/10] Revert "target/i386: Enable new apic id encoding
 for EPYC based cpus models"
From: Babu Moger <babu.moger@amd.com>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
 imammedo@redhat.com
Date: Mon, 31 Aug 2020 13:42:17 -0500
Message-ID: <159889933756.21294.13999336052652073520.stgit@naples-babu.amd.com>
In-Reply-To: <159889924378.21294.16494070903874534542.stgit@naples-babu.amd.com>
References: <159889924378.21294.16494070903874534542.stgit@naples-babu.amd.com>
User-Agent: StGit/unknown-version
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0201CA0051.namprd02.prod.outlook.com
 (2603:10b6:803:20::13) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 SN4PR0201CA0051.namprd02.prod.outlook.com (2603:10b6:803:20::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Mon, 31 Aug 2020 18:42:18 +0000
X-Originating-IP: [165.204.78.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: dbdcac55-e85f-4a6f-bf3a-08d84ddd96c2
X-MS-TrafficTypeDiagnostic: SN1PR12MB2559:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB25599DB2131619C5A7BCC6BD95510@SN1PR12MB2559.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:126;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdP9x0UGoHtVr+AjF2HGzxN8VgDPwcyP0LPTdLdTeOMrCS0ve9FF4fZuFKZH6Zg3TKRm0zj+ixau2OWbIw/a0JDyQ31Sc2huxw8zfJErhzTOFkpDFF+Iot6zdRhc7w1hS9m9RRkH5ZbEWW9ifIpIjQ5v+cJYZ+SCLBAEZpZlPJiYVTs2D18Qu62AP0buPTiI4tlesFoq+sBK++/eCtIIsc5RFWOWGOkNaereD1tkibHUem+4zeFoVBIn+MupcKuGTdlhNJ7ZKk5Ifz4Cei/SL0dWYuFg4x0anRUoW/R5w0Xz92DpU2EuHeEcd3mfCht/mopdSD3cK179CzaekWrjww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(2906002)(66946007)(83380400001)(66556008)(4326008)(26005)(956004)(316002)(16576012)(5660300002)(186003)(66476007)(6486002)(8676002)(478600001)(44832011)(8936002)(4744005)(86362001)(52116002)(103116003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: P/O2FsT2RWezebM45KB3SNPkgypu6rkYCC9tb0qUZ4nrd9W3bs1I5KPRYl6BhfHziv5TN5NCq2vBJeux38kyPDUiUWaVUtMSK66zRUM9NhZ4Pcra3iHIr3qn/Sfk+9DPRKXpZkDxbcTTD8fc0vCPkwCVuolPgDIi3z2Z9lY47A4kCRYbbF1tdLW3CEISUw6KK/K8ktFKvB+aIAd8kzvhX/li+c1ph2rku+pJvzqAUf0WcVCtxDQbTNPE0xnzO4fmdDqu8HwkpdcH1Pd+E8iqsubyVlSMTSDKVsZguXe0rUwZrsolFlv5fcJdXKTLb/BkSjGd6GmyiG+G4eYNoa+6Y8+9hyZzuhkTpcKGsKHPfi1Rkn4x7b4DmureMUgmWR2dnjIP7L7ODahq82gKQlKoy0qsLcNyujx2LsmcazM0xRXNzL8I8kraAnbePFAkX0hRQ2aKeZP3smGpfFNELeG92BItFL+PDgFtd8/lZl2bHsRBT8iOnXHit2RAROEABCrn4WgW/fWE7u+xlN1aiJqjDSGsGWGHwLap4ygvMVYfbf09yAAFhI8chOFrhbM/krfqq+jPI+2Vthdloh6FHL/hF6z5Ah89mAE6vTzx394CpMUj/GKjxNE3zywLvqkqZ36cAKeKHi1P49gZJ881wOJsjA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdcac55-e85f-4a6f-bf3a-08d84ddd96c2
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2020 18:42:18.6590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BST5in+6AD/yG672+lfMZ6iy1DsuoKhGV5YhPe6ygfPVJlhSmkHTruD3NEA3C+HF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2559
Received-SPF: none client-ip=40.107.75.43; envelope-from=Babu.Moger@amd.com;
 helo=NAM02-BL2-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/31 14:42:13
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 FORGED_SPF_HELO=1, MSGID_FROM_MTA_HEADER=0.001, RCVD_ILLEGAL_IP=1.3,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: babu.moger@amd.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reverts commit 247b18c593ec298446645af8d5d28911daf653b1.

Remove the EPYC specific apicid decoding and use the generic
default decoding.

Signed-off-by: Babu Moger <babu.moger@amd.com>
---
 target/i386/cpu.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 173e6f4a07..c9c1e681c2 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3995,7 +3995,6 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC Processor",
         .cache_info = &epyc_cache_info,
-        .use_epyc_apic_id_encoding = 1,
         .versions = (X86CPUVersionDefinition[]) {
             { .version = 1 },
             {
@@ -4123,7 +4122,6 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
-        .use_epyc_apic_id_encoding = 1,
     },
 };
 


