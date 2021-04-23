Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 249FA369800
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 19:11:10 +0200 (CEST)
Received: from localhost ([::1]:46144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZzKf-0006zk-8G
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 13:11:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lZzJS-000661-1X
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:09:54 -0400
Received: from mail-mw2nam10on2069.outbound.protection.outlook.com
 ([40.107.94.69]:44000 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lZzJP-0002gN-LE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 13:09:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AH7XW0LY2lIrluJ7mHoYbeW4sMlCorAP1lhrF54btICbi7V3wTXLbiSh1ahVfO1nGP5n9ngXI5DTj0O4yDX/r60vyKlIJ/E53ViyVL5iOjkWwR/cIq3qhjABHmSEOHVXfGhvvlfNOp2M4RO+UVEPyOfUvA3x0iWRubTpgO3f5Qr5s+0SyRDxHJxDrJQOSd7As0nXXR/zuboI9YCAxfJ3vuZCcE6WdyR4MsAISbRv8AEDixwmmhaWME85KOFWw0e88pBwf9xLYMdeb3gNRsswbK+GSAFUNYX2HuuWHYLhiZGGb3Ih77rOkUASgl3PHZq4fLMKV4jQfwxoImTuRWPcAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CuIIIs0zQT4YU+HvlQ8LqZaOw0wf6yfmqWrPpv083Y=;
 b=LOk3TbbslTFqE+S89GcIveliWcJ+bRirVIgm+toB/uGzjS/EH/TENkNH8ukpqzxuYtbOn5d0ITvr7ca4UsFOBgWnS+xlOCB88Htw+jxigf0dzVVGRX7r8+LcwmlYUiN+pXZWIXiuzcJlwuOoyW3xHiDzV92IPefISsX6qz8CkERF9et6dFEunmK6DZ/AMXOch2pMGaQtuvE/Gw+SqSzCJRip6uk863jiJaFgMR3EAJiEoxVaLKrCyxf654zYBZi+rEI8GwTXyU97nO41JUAJNW7sYhHysyrH3KjZEbgNM5Xe5mxfm725x3TkZC7ftr8GpRj5cPL7t+hItJUSAM4ERg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+CuIIIs0zQT4YU+HvlQ8LqZaOw0wf6yfmqWrPpv083Y=;
 b=xgZ70tmK5TrMS6cRKJ94PQlWyQ4zOho0tno99ET732SUi82c8jNBUt684GJZ/uAB2VF/0b7DXd9CgFlIgAtYsbCKS2j/mzxFIld1ToQaFVPnh6IgaqiDeBKdoPfqvJja64Yu8Dg4KWrtqEAOO1U56XNGAHg/mcEWq2O/QbOdZj8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4544.namprd12.prod.outlook.com (2603:10b6:806:70::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Fri, 23 Apr
 2021 16:54:45 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::487b:ba17:eef5:c8eb]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::487b:ba17:eef5:c8eb%2]) with mapi id 15.20.4042.026; Fri, 23 Apr 2021
 16:54:45 +0000
Subject: Re: constant_tsc support for SVM guest
To: Wei Huang <wei.huang2@amd.com>, qemu-devel@nongnu.org
References: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <2455bd89-c3fc-ab4e-72c6-de36e569c0cb@amd.com>
Date: Fri, 23 Apr 2021 11:54:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a6662944-18ac-5075-1427-f92ae8e20163@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0701CA0037.namprd07.prod.outlook.com
 (2603:10b6:803:2d::32) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN4PR0701CA0037.namprd07.prod.outlook.com (2603:10b6:803:2d::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend
 Transport; Fri, 23 Apr 2021 16:54:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15edca72-310c-42b1-e82e-08d906787f34
X-MS-TrafficTypeDiagnostic: SA0PR12MB4544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4544C07006FE5287088D516F95459@SA0PR12MB4544.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HZp5OUv+91+IU+32waxJzBI6NFdm1/7zz8PEOtJa79C7ge/Nv6UJipY8ngRigxj0AWcI0xdSfzOkVPYtr51ORgSvUhVDU56biO/DBFVmtzl7t57K2hSZFwsU54orRpcMja3/uviAGr2WZDXIpaXt0RXgS8F9RkZWJac4G8b6UFob23krS1C5zUIGDJZuHvylRZpwRWku90FNCSSJBs7fHf2GDdwoNqFtvGyWPHIqmwjp0vfJa5Zq45r16wTBoi/qEv2iqj+tfQ4Qtxz7tpMDQfXtpTWJQZgVEJrmlFuG9YnfnQ8+vF3K5OIl7cw9yPvo/bOku9H+7m4xjGbOc663U+cHwFwjVQ8zxEWX2PcNV/P/TX5AsvwXYlHB0oZ3/AMoHO2JoYIhuWh9ezY8tDbpAIvkULzwMt050WcOqSNUM3e4pe8aO+zVfdX3GVqSw5iuSo40k1Y/o9K5sdmrLrU23m/LbLNByWbGx3518flruE5hMY72n81mgdEUtAz+RKK2pPfxITIMALoWdq2Tzd2YeXdOfPb9XgwsfdqPhc8A6zHig/n2WS0scf7Wbt1PhelrAmd0vXMbCUcGML7JPzNOoop/MzeyzJYAlEwboXrzVB6KqbWu8jjj9ew2ztQSbtgiqi6Ay/LgCuj9TvSqxy8cYcxOwwnsWeJx3m85jmq4zioj7eD27ewjDh73+xHpOadNHTUiDVjOPX1y2YTnpVJVfnPZ5CgpSmF3ZlKy53dozxQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39850400004)(366004)(346002)(376002)(396003)(136003)(186003)(4326008)(54906003)(5660300002)(66946007)(26005)(52116002)(8936002)(31696002)(6486002)(8676002)(316002)(16576012)(16526019)(2616005)(31686004)(36756003)(66476007)(83380400001)(2906002)(38100700002)(86362001)(956004)(66556008)(53546011)(44832011)(478600001)(38350700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eFpjS0dyd2pma1hERzJVbGoySFcxaVBSTGlXcUlRaFdiQVFsaVZWTklrOC9Q?=
 =?utf-8?B?d2JHK1ZHODBlNklJTE52VnJlL2FuOTQyOXNTUDV6Y1JRcHBlSDBYUm9BWGMw?=
 =?utf-8?B?TTNUK2I1Y2Y5dGZSNFFsVDRMZ0ZjaGNtVEVjbnBKb1hZRWpyMnNjS09CSTIv?=
 =?utf-8?B?MTNvWnpDMVBSY0UxV1lPQ1BEZ2E2UGJEbnNMeXVvN2czYzhPbWhJaFNsTzJV?=
 =?utf-8?B?Ni95RDZoUjFjekx3TTFTR25vOXNqbUw0czNiamVLYWFqQzE2blFtV0dERUdU?=
 =?utf-8?B?d3ZjYWlEM1BXL3pFQzZPQ1JUamRZQ0NIUXhlMjFleThCMnpHZldOVDAzZ1Uz?=
 =?utf-8?B?aVl1S1VacjBORVYvcmVDcmp0TE1QZGx6R0h2Vkxocks3TXZIZVNwRk40TmJy?=
 =?utf-8?B?Z2tkb0QvcW9DMWxmV3BlRTg3TU1CRzM2RDMzZmRoYXZ5YWtsTDdkclZOTElH?=
 =?utf-8?B?ZGxpUzFzL0kvSXUvREFsVVFBWkhkNDRuQ1dKbTJUTWwvcFMvTVdXOWdvbEky?=
 =?utf-8?B?NlpRVzFvUEpJdEU4L2xXbVJPeDZXZlozTC9nb25XZjJ0T21aTjc5bXl6WTlW?=
 =?utf-8?B?UG90TjEvVGFYMHlhL05jT3hrL1ZaU3p4UWF1aFB2b3hwcDJJOERBUG5yKzk0?=
 =?utf-8?B?ZzJSM2VQNXNYNU5DZjFwNE1MdHFmdlFvUkU2YmY2dmJEWjVUblBHNkxlU2ZZ?=
 =?utf-8?B?azZQWnJZbU5ieTg3SytMci9mbjFaNHFsbGtJNUNjZ203QmI1NGwzYm5kVHNQ?=
 =?utf-8?B?aXRlUWVSTHYzKzd6NE4zQ0dkTHhROStucTJWVnNPQmNtNXlOV3dVVDV6Zkxu?=
 =?utf-8?B?RENTQXI1ekxaQWhlU2MwUGFWQ1d0L0dxMTNqeUtUWk5ORFk2eHZFSGZ1V1Rq?=
 =?utf-8?B?TnVrMS9ibi8wMHpIa0NMUDBLTDVxRWNEdnRmcElCRGVOSWpDUDBISWZqNmpB?=
 =?utf-8?B?cks2bDhHenBiWVZOZ084ZVNSTUFKU1Vka0VjZ3VFczBUTldxaFNtQkxOUW96?=
 =?utf-8?B?V2JRdnFac2MzSElEb1o5S3Z2MnBmU2RZMmtvNTB5NjByaHF0UVN1bmV1eXI3?=
 =?utf-8?B?VDhlMS9YcnVwM20wMEswaWtXZVBnMnlXbUZXUVIxVHZVOUxNeUlTVlQ4amtX?=
 =?utf-8?B?dnhoUVFHSUJwZFd3b2tWOUk1SHJlblFoRTdERElLU3dsZldxZlgyU3loZC85?=
 =?utf-8?B?MTJBN0FLZmxaUHNyZ2s2VmdBcjN1c0toZXZrQTdXcDNxYVE3SEs2U2dIbzNQ?=
 =?utf-8?B?VkNRT25WbzNSOU9qWHZSdnNnc0FtaXR4QWt4V0NGQkgxTWpETjBrR1dZN3VH?=
 =?utf-8?B?bjFPaWdLQmkvTmJEOUw4bEcvYi9VcWZpV1c4Ynd6NEFZQ2lNM0lDazBEWTRQ?=
 =?utf-8?B?MDlSM3ErSldwUFV1bzc5eVhEU3pybnd5RTNRenlEMlNlNGRkM0MrbGRzLzBq?=
 =?utf-8?B?V3FsM2JwcE8zRzY2SERkU0xSYWhUcFo0Y0ExM0Y0cytCSlptV3dEaXdEQkY2?=
 =?utf-8?B?VXJZRXRxYmYxSVdmdy9rTTJZUnh2d0wvNWcxeXJMaGNLZjMwU1JjSEF1a0Rx?=
 =?utf-8?B?ZHhiSVg5alU2ZE5JTU5SODdVRHlMeVJkNlRsdnA2dERUN1BSTjU4bDNJRGFh?=
 =?utf-8?B?Rk4zTlN1d3hCLzBZTWdTTTBTUEFrbHFrNjJUUTBkUFdDT1YxZ3I4bGs4cXFD?=
 =?utf-8?B?akFmMEd3Rmltd214dGRKOEpyNDdEamR3K1hONXY4eGhYKzhVamQ5QkhBcmZs?=
 =?utf-8?Q?dMYgLSQN3RejnzOykni/lwm0u6P3uMjd5JRyt96?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15edca72-310c-42b1-e82e-08d906787f34
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 16:54:45.2430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PRAVBR9flgxrOp/dZuNMhpd7OksL3gv09xGDeJqYKIYzQKomAMWHx4b2Ap6Jgl7O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4544
Received-SPF: softfail client-ip=40.107.94.69; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, ehabkost@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Wei,
I dont know the background of this feature. I will let some else to
comment on that.

The patch exposes the feature TscInvariant to the guest successfully.
Tested it on my AMD box. I have few comments on your patch below.


On 4/23/21 12:32 AM, Wei Huang wrote:
> There was a customer request for const_tsc support on AMD guests. Right
> now this feature is turned off by default for QEMU x86 CPU types (in
> CPUID_Fn80000007_EDX[8]). However we are seeing a discrepancy in guest VM
> behavior between Intel and AMD.
> 
> In Linux kernel, Intel x86 code enables X86_FEATURE_CONSTANT_TSC based on
> vCPU's family & model. So it ignores CPUID_Fn80000007_EDX[8] and guest VMs
> have const_tsc enabled. On AMD, however, the kernel checks
> CPUID_Fn80000007_EDX[8]. So const_tsc is disabled on AMD by default.
> 
> I am thinking turning on invtsc for EPYC CPU types (see example below).
> Most AMD server CPUs have supported invariant TSC for a long time. So this
> change is compatible with the hardware behavior. The only problem is live
> migration support, which will be blocked because of invtsc. However this
> problem should be considered very minor because most server CPUs support
> TscRateMsr (see CPUID_Fn8000000A_EDX[4]), allowing VMs to migrate among
> CPUs with different TSC rates. This live migration restriction can be
> lifted as long as the destination supports TscRateMsr or has the same
> frequency as the source (QEMU/libvirt do it).
> 
> [BTW I believe this migration limitation might be unnecessary because it
> is apparently OK for Intel guests to ignore invtsc while claiming
> const_tsc. Have anyone reported issues?]
> 
> Do I miss anything here? Any comments about the proposal?
> 
> Thanks,
> -Wei
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index ad99cad0e7..3c48266884 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4077,6 +4076,21 @@ static X86CPUDefinition builtin_x86_defs[] = {
>                      { /* end of list */ }
>                  }
>              },
> +            {
> +                .version = 4,
> +                .alias = "EPYC-IBPB",

We dont need this alias. I think this is there only for legacy purposes.

> +                .props = (PropValue[]) {
> +                    { "ibpb", "on" },
> +                    { "perfctr-core", "on" },
> +                    { "clzero", "on" },
> +                    { "xsaveerptr", "on" },
> +                    { "xsaves", "on" },

You dont need to list any of these features again. All the old features
will be added implicitly.

> +                    { "invtsc", "on" },
> +                    { "model-id",
> +                      "AMD EPYC Processor" },
> +                    { /* end of list */ }
> +                }
> +            },
>              { /* end of list */ }
>          }
>      },
> @@ -4189,6 +4203,15 @@ static X86CPUDefinition builtin_x86_defs[] = {
>                      { /* end of list */ }
>                  }
>              },
> +            {
> +                .version = 3,
> +                .props = (PropValue[]) {
> +                    { "ibrs", "on" },
> +                    { "amd-ssbd", "on" },

Same as above. Dont need these previous features.

> +                    { "invtsc", "on" },
> +                    { /* end of list */ }
> +                }
> +            },
>              { /* end of list */ }
>          }
>      },
> @@ -4246,6 +4269,17 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .xlevel = 0x8000001E,
>          .model_id = "AMD EPYC-Milan Processor",
>          .cache_info = &epyc_milan_cache_info,
> +        .versions = (X86CPUVersionDefinition[]) {
> +            { .version = 1 },
> +            {
> +                .version = 2,
> +                .props = (PropValue[]) {
> +                    { "invtsc", "on" },
> +                    { /* end of list */ }
> +                }
> +            },
> +            { /* end of list */ }
> +        }

Here is the updated patch..
=========================================================================

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index ad99cad0e7..27287c1343 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4077,6 +4077,13 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+              .version = 4,
+              .props = (PropValue[]) {
+                    { "invtsc", "on" },
+                    { /* end of list */ }
+                }
+            },
             { /* end of list */ }
         }
     },
@@ -4189,6 +4196,14 @@ static X86CPUDefinition builtin_x86_defs[] = {
                     { /* end of list */ }
                 }
             },
+            {
+              .version = 3,
+              .props = (PropValue[]) {
+                    { "invtsc", "on" },
+                    { /* end of list */ }
+                }
+            },
+
             { /* end of list */ }
         }
     },
@@ -4246,6 +4261,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Milan Processor",
         .cache_info = &epyc_milan_cache_info,
+       .versions = (X86CPUVersionDefinition[]) {
+             { .version = 1 },
+             {
+                 .version = 2,
+                 .props = (PropValue[]) {
+                     { "invtsc", "on" },
+                     { /* end of list */ }
+                 }
+             },
+
+             { /* end of list */ }
+        }
     },
 };



thanks

