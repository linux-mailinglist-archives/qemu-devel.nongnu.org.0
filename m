Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E4732B904
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:46:53 +0100 (CET)
Received: from localhost ([::1]:56636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTi8-00059A-Og
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHTgv-0004Oy-5o
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:45:37 -0500
Received: from mail-dm6nam10on2045.outbound.protection.outlook.com
 ([40.107.93.45]:34049 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHTgs-0004mf-V8
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:45:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAnI/z5uf3h1esDT88EsLNKQIJlsJeOYOFTB+J80Tqy/5Xk3Woq0IqrpGP9NM7FRPeuWOAnQ8u+3rgdz7TVVtxX/uyIaBIEsY2cVtuM8EyifPHbmJbK3yPHzMz7mJymgKk9nhZrfLXGjXg2RIvS6piY17zLvYLoPCBlpLq+ex5gF4f8NPPg4Whknx2fYq/wvrBz7EUE1XaAg9Bm15tHtyCrjVtWTqvyOZCitOD4pWZzj/tSw3SkUNaYQAcEf/LXVQfCu4GxHqAFXyAQcarTZ98leSSkwlxnS/O5WHxmY3NbrJE5gAvuMmRvvQRwwsys87QsgSXlCepX2iP2IQoXSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5tjS0Awli1sH0rhzGIFads3eI+zbVeVDMB3h8GiPe0=;
 b=UNn57Rw0iYHdqpsUaEVK/f+CpK+zYU7PgukQbN4MnVLkCcfgjwjaip6t8NRmyiLowVvUxbS9Ar4IV6zOJThU9XArRx1HTR7PUnD/PR/Ptv/C2bbeiAlbHJfdt7edl/7WTp1raiDMQo8OMAGmmiTcFWT3OkmY4havvFYKZEFOqOMCTCuK/NRUccrIzAd8pgLB6PZr6KHDc1wkHxcHNNukgWNHqHx68wqYI5P3jPMxrjTJvpw+PbmOZT2TlvddHcNPeR7NaQlUAQl08Xniau5loD0g5a8+D0s7UuFzCuz7oG5nn+QkNdKgIsVsLcynBcyyY0OjdU4s/BZ5alMGI+Z/EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5tjS0Awli1sH0rhzGIFads3eI+zbVeVDMB3h8GiPe0=;
 b=2zcJwf3QED36ALxVfo8FrezwPKc9F6dwVEKoaD8mD0CksY/E65oUxhZmY0CMU58yLC9dzbBn6HqBcBhbI7b0gBdPu58LHgDgZAn0Y9trHq6lV3KjZWU/IS6MBvAE7abEqKRMv2q5VFipY5lxjVgLVsvWDKXHaoP9DhU98Q58/Ic=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2462.namprd12.prod.outlook.com (2603:10b6:802:28::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 15:45:31 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Wed, 3 Mar 2021
 15:45:31 +0000
Subject: [PATCH v2] i386: Add missing cpu feature bits in EPYC-Rome model
From: Babu Moger <babu.moger@amd.com>
To: pbonzini@redhat.com, richard.henderson@linaro.org, ehabkost@redhat.com
Date: Wed, 03 Mar 2021 09:45:30 -0600
Message-ID: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
User-Agent: StGit/0.17.1-dirty
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA0PR11CA0004.namprd11.prod.outlook.com
 (2603:10b6:806:d3::9) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [127.0.1.1] (165.204.77.1) by
 SA0PR11CA0004.namprd11.prod.outlook.com (2603:10b6:806:d3::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 15:45:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c2cfc3d9-20f0-4f44-d7ec-08d8de5b6029
X-MS-TrafficTypeDiagnostic: SN1PR12MB2462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB2462486AC3395DA9BD940CD795989@SN1PR12MB2462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R8zEZXkpXT6lbwCROPKRglGSgoda2/TMn5njjSwN6JGxpdg/fv7ByozPjFAfR/CrmhDeR1AmKHtB4czGHmoo7OZ7r3ppUkGMD5HRz0m5YdIkXhU5FTHt1o9JePGRKCGpRLc1gKBqu/hnwSZmmx2xsTdK6BM0k8IECLyK86u4Z8nqDY89B1GNO+TaFPuz2yS6nHV1XEG+MGfnadT2fCpBHd+w6rrKGXyp8TlAcpQ9QXr9OqwItWK94wGkbTESqsA8Q6qe3iqwI4gI5+PS0AJHkSswqYX74l440jFCP9CgtSTFeDO7VRnUVI04ByjuYCV7UZp+1QEdIoYdAjQHBcgR2GPRw60QIwQvHps7gTdYbnqawjhEAMPpoDlSkyIpMYg5tUZ9EnWBXNm+ANTTO9g8cjNaalsa8BxsW0WO5/RqbnyCczXXBP2l0+xCCqqxOFsy9eez1G95pL+/oTNkfaUa9txECbhPqVvKAKD+oLm0pyAQkM5Xfz39Ki/rjml3bpMOLnLjSkSop7SGGgTZzeVCGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(7916004)(39860400002)(396003)(136003)(366004)(376002)(346002)(16526019)(316002)(52116002)(4326008)(186003)(9686003)(8936002)(66946007)(6486002)(5660300002)(478600001)(66476007)(8676002)(2906002)(66556008)(956004)(103116003)(44832011)(33716001)(86362001)(26005)(16576012);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cHFPZTlRbDJhTjhnbE9MQmtCTDZvcWNkWHJrOEZhZXo2RVg1dWtOazF3bHBG?=
 =?utf-8?B?NlBjakpkd09vUzV0VVZWU1NjOC96LzEwUzVJeDlpU3FaL1IybFJrd3lPelZL?=
 =?utf-8?B?cnlUdWJnUXlRcmNHdGE2TzNLSjVpV1AwZThkemVCbzlFV2VvQndYNEtIMXhp?=
 =?utf-8?B?UnlmYlg1dTNoVGp6N2dVUUhWNjRCKzlhNWU2YnZPRDJBQ1ZTRDdKVGNUTDkz?=
 =?utf-8?B?ZjFwd2pyU3I1VmhPM0tlVzFNZ1N0OUdPRG9OOTVia2h1Wjk0SlVVVjB5MHNC?=
 =?utf-8?B?cFNNbStqMTRzV3F3NVh6M1J6SXFCTlVKckZCNEplNStoL2ViUlEybDNGNllv?=
 =?utf-8?B?Y2R1dTNFRU1WVm1tOW5id1hPbkZrbDZVS3RvMVdCTmVSODFOS01nWlRQVU03?=
 =?utf-8?B?QzVLbjdEU0gyS1V1dkoyMHBnUnRDUU5FYzNEUXBURjB1ZEJuQkZWUlhFQnNm?=
 =?utf-8?B?T1JTdko0eHE2S3FIeWlONWo0d1JLZjgzdEMrOHpiaUxIakxaaU1BekZVMnFH?=
 =?utf-8?B?SzBaODJ5QnlTZmQ1L2xCUk5qUlZDd29wZXM3K01UeWI3alZSQ1pxa0hnSDBJ?=
 =?utf-8?B?MjJvNHZUb0VIK0xkYWFDb21LTXg5SlNiWW5DemhSMzcxbTFIdDhzRVNBMGs1?=
 =?utf-8?B?ZWxmNk1wOGNhcTBCdFdXMFQ4WFoydXk4S0c4Umg0RnVmMkU2RmtBRU41NjIr?=
 =?utf-8?B?RnZjNjBVMVNuTDk1T3JiT0ZmKzBzc1VmTDdvQ2ZEajc1MHZBMFd5dFZtb0F0?=
 =?utf-8?B?R0Y5cXFhdXk2bExJajRNaVBLVFFJenhIVkNZM2tOTTVBMFZBR0Vnc1RrRVBQ?=
 =?utf-8?B?VDh1QmpKdndQdDAvdmJ6ZTdHVmpYZnZ5RGlCNGVrdFRCdXVNRE9IZks2MUFt?=
 =?utf-8?B?VlZKUWVWbXh6TEUzVjhsZlVmSVhNOVZhWE16UzkzU1kzWTJiSi9NLy9hWHpl?=
 =?utf-8?B?c2xEa3g0QjZDRk9MdCtmYS9RNStFWmVRTHFNTzhRdWwwTjVjYTY5blZrYStl?=
 =?utf-8?B?dHYzbXdQZFFyZmVCWUZNVEJyT1RPN2NMMGxQemhvZWN4emJ4MXpTYnozTTVE?=
 =?utf-8?B?Z20wUE1Uc0ZCZDBlMjBSOUlZSWRKdk5RRWtFK0hBNzlmbWZIN3FkWmUzS3Jt?=
 =?utf-8?B?bWJhTGdwS3JSdjUweVdZbllLamY4bGx0VEpFdHprd3RGWEphb2F1STdtajA0?=
 =?utf-8?B?MHducE51WUUybWlOeHlDemFEbmVQVmtSZTBWbWRxRTJtL3h2SkttYTZzZ3E4?=
 =?utf-8?B?NEhRaWNwWm5VYWdiWnhzWVNiMU8yL2V0UGNqeXg0MU1DMGwvY2ZaVXdxalhQ?=
 =?utf-8?B?U3czVkw2SzhSLy9wWGdhUG4yR3phTlplVjM0eEJER1hQTy84NCtHVzU0aDFi?=
 =?utf-8?B?dzRMbmE4NGRLL043U3ozMlBEa0hSQzBCbnhtWDNhdCtseUI1R0xZTGo3MDdi?=
 =?utf-8?B?UXRFSFJudVRLNTJLTDhUeFJxZTkzRVB3dHJvM1hzR09kc2ZQWmh3SENzaFBr?=
 =?utf-8?B?ak9vMFhXRzBwc2ZIaEFOWEJoL2U0aitUVTdMTnJWbitqdE5lcGs2cW1hRHhG?=
 =?utf-8?B?NTk3OVhwdHczWEQ4UVpHSjNBdDJlZVNzY3F3M1VPYWwwbExydUd4WjlLTE5K?=
 =?utf-8?B?WDluVEVUcW0xQnRTaFBDaG5QeGJBaXcwN3dCNzZiNXZDRTc5UWl4TzNOVlpU?=
 =?utf-8?B?SGVSQktvaFVtMWVSdzdDcjNqTG5LY2wrc1dPYktBdjNrTFJ1eko3dTBXTlpR?=
 =?utf-8?Q?E1IOzMytleVaL9YiWt6b5PogEvgd0Dbh9oD0pGA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2cfc3d9-20f0-4f44-d7ec-08d8de5b6029
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 15:45:31.2628 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhamE9M1x77jh4Qz1pJbDz1aBRXaL2S8EQKOgTntNhQRErC3Zb0nuFeS3uxIv0cC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2462
Received-SPF: softfail client-ip=40.107.93.45; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: babu.moger@amd.com, pankaj.gupta@cloud.ionos.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Found the following cpu feature bits missing from EPYC-Rome model.
ibrs    : Indirect Branch Restricted Speculation
ssbd    : Speculative Store Bypass Disable

These new features will be added in EPYC-Rome-v2. The -cpu help output
after the change.

x86 EPYC-Rome             (alias configured by machine type)
x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
x86 EPYC-Rome-v2          AMD EPYC-Rome Processor

Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
---
v2: Model-id remains same between EPYC-Rome-v1 and EPYC-Rome-v2.
    Removed model-id in the patch.

 target/i386/cpu.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6a53446e6a..30e7188b0e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4179,6 +4179,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "ibrs", "on" },
+                    { "amd-ssbd", "on" },
+                    { /* end of list */ }
+                }
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "EPYC-Milan",


