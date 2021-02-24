Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3793240FC
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 16:59:57 +0100 (CET)
Received: from localhost ([::1]:40904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEwZw-0001xA-P6
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 10:59:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lEwVr-0006Kf-TR
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:45 -0500
Received: from mail-eopbgr680085.outbound.protection.outlook.com
 ([40.107.68.85]:8891 helo=NAM04-BN3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lEwVp-0001nl-5z
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 10:55:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGamSlJ4MkBB9b1U3rY6LvT5l21GwQAwlTZsgvqzot4ChN66EpGgAqRREp+PSNKHUsPQpcpQuvRsJIgJ/GLMEwW6JIu8QSHDlP210K51mTsJ260vdlY3jKxbt7Grd88fmVJwlB8CioRQAJtpnc8Yz73ezH2mZwh+FTCxLVtmyg8d3+FWbHV9ZkXCLs/1MYyn9ATbudaweKE+7P3rBBUsB2ySgbDvFflnF2mTE/Nd64IdYJU+NJspVY2qffyypp5PiTyQDV9ts8xW0R1t4dErZ3x2I8y5uLszPILDFZk/yD5nT5U1uyhuVIwadICt8BvNcoQJXetOfUDZIQzL+0oaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h2QDLG0cFiYfr73jFSvVQFLq2rnEnGH2Oi8gVIeLDE=;
 b=erDkRQ9C7mvH4osWaCnr0QBCvUCOhyhquW3QuUg5VhX+1LyXGjj3nyfQciYOkZdwo85+DCdRKX2xuquLiIGhcpEf8PM0S5hPJMNh9NcTp6m76FzHEW2PFzKWVvO/fyELIJCtt3SyQa2tGt9iulUQ0PzwX/NDqAiYpCXUlyoVzgLLQuEoUK/b0CvcCWaCqbw2ow0xIcseEnLZ43ARBWOfY7mh7P2YDMTuF7Y5UAkNVPsvui7jsXmFLGif/fLmpI7joshUcaKpUHUcgfedvhNawybdV4VtjnTWgx7sU2Uzyie0ZS6hNwxcnSYSmzKtMIRbeeE1bKitW5DYNG2kTDXLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1h2QDLG0cFiYfr73jFSvVQFLq2rnEnGH2Oi8gVIeLDE=;
 b=RhT2qyrsVfX1CflleyCLpsvtPxVXNdH9g4sf30GjWEDU+4kvAAoIB6catPJS/TNoU99JIEN9xiyb4B3e1NBV+JQoQkBuOwRZGYOtJLyONdf+hwta1cn/yDyaAPdkJWLBxSBQ7GdGrRHLz6I542Imdt/Qu3JWN6z3XUija59J49o=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 24 Feb
 2021 15:55:38 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Wed, 24 Feb 2021
 15:55:38 +0000
Subject: RE: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
References: <161290460478.11352.8933244555799318236.stgit@bmoger-ubuntu>
 <CAM9Jb+hOeKrQ1QxZm5zB1LioMNuyzzTObM8XL+zatqP7KdESWA@mail.gmail.com>
 <d2f234a5-e753-5a4e-97db-21bd0a0a69eb@amd.com>
 <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <cd9a84a3-f151-fa00-0b34-2652824bbbfc@amd.com>
Date: Wed, 24 Feb 2021 09:55:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAM9Jb+hESq1yEbPcMWhJTVWoUK-es168bHoOayQ_N1vh3tdRRQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA9PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:806:20::6) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SA9PR03CA0001.namprd03.prod.outlook.com (2603:10b6:806:20::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Wed, 24 Feb 2021 15:55:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 98ea2596-dd12-429b-f582-08d8d8dca154
X-MS-TrafficTypeDiagnostic: SA0PR12MB4480:
X-Microsoft-Antispam-PRVS: <SA0PR12MB44804C24FA9BF2DAFD82C169959F9@SA0PR12MB4480.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kt4KhRlpyr6rL/ZFYIN4Y3tjv18FKMAgaeZeRv9fgn/YxU9xiIt6YaEz3InooaEdNDaFQDjqrgFqEkQ9O+Qwv6VJLQXMetF3uO4AxnjmPrVQYeqBecsnnGS0YDN43awva//Km+ZJLz2OWqHaa/9CpfCXQDoBRNoHnqTgQGc3gRMGW+C0Jng902XAxMm62lUAgCmSsO/hWyvk0yoW5sHVyzb85DO7S1qfAUZVE2XOeoRWjOGjUOWk8FqbRH8oblHNQBJQog8G/HPSFU75OQS3rq/xSW1Z5CmeBsLpc2H/ShqAy49MZCBmzt60ysB3kQC34y/0eawVZ374+SCIgIcaWK3JOizShF9OQ5/Yf1BzPDcIyKNVdUEc+pKpr3+1+kNzDqy94L3oHS+fX0U9sUOAPN0s7hb73aLlih3SXKthWBO1ubMqSA05BYx21p4T5DgRbxiZKoqDozxhIiNu9rWrc4XewCYjSNSGvyMe/QHIjb18qxkgy7M2ePaLOt9C875OVQLVQ8xF5W0I1/wVCNjfNvScTxWZezq1wyGx0HjYrjeEogJoZvyus20RH+Gm68vxckg49SmInJ5EB8Tw9Y9htZdEGjbyVLt/fXLigdfJX3c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(31696002)(66946007)(66556008)(316002)(66476007)(86362001)(31686004)(8676002)(8936002)(36756003)(2906002)(6486002)(52116002)(6916009)(2616005)(4326008)(956004)(478600001)(16526019)(186003)(26005)(53546011)(5660300002)(83380400001)(44832011)(54906003)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WjgwVCtjQzVPallkWjU4VUJXNk5Xand4UDhqTENWb2c0c2RXSjFzaEZYb3B3?=
 =?utf-8?B?MVAxS1BzMXFOelJrQzZaeEFmME92TE1oWVA3SUJnQTdWSno0TlBBQ2QrMlh6?=
 =?utf-8?B?YnRVREZLbkd0WU56WVhWaDV4UkF5Z1ZjWFZpbW1DWElsM0ZYTGN4NDVydW9n?=
 =?utf-8?B?dGFVdzhBU0M3bkY0TTB5NmIxOUhFYkVDK2Z0Q2lpQlAxb3N1c1phczNkRUlV?=
 =?utf-8?B?MVJBMXFSMGR0Vmd3SmNtei9wWDBCVTBBMGE1cUZGUHhQSFExeGtwbEZHQlRE?=
 =?utf-8?B?ZlhLak9oOEgxUzBIWkFLbWo0bmFHTjdlaHZaeXYvbUovQzBYQnU0TndUYkEz?=
 =?utf-8?B?MnhtaUpCbGdKOVBHRHpJN1dROXVJalVSV2NqZ1hOdWdlM3R4R1l5QWJ6YjEv?=
 =?utf-8?B?end2WkI5cXZndmZZQ2k5N05SNkRxbzRGdlFnU2VmNkwzQzNIZmxHSDVlS1R6?=
 =?utf-8?B?V3NOb2ZCVzgwWFF1NFNKTkJSbW5mRFdqVjFJZW1rSEFpdW5VTDA3MGM2YXBt?=
 =?utf-8?B?L1R4OHpnZDdYY1hGMjRLbWwxUXdiVkFpWk11YlFZK0gzN2l5VjcvaWZOeVhl?=
 =?utf-8?B?U25ITTcrNWhKWWsvNGNmQzhydkc1RG12cjV3TCtHNnFsVU9oQ0p4eXJaRVdz?=
 =?utf-8?B?SWZpaUh3R05mZmhSckQ3MGlYNGJSU3p0TW4rTE5yODBVSTFZQTY2TUlpaWtv?=
 =?utf-8?B?bnRXQm9JbnNRZ1puSEdiYi9PZU8zZ1FOLzhFbEpXbzBQRWJFSTAzY1Robzk1?=
 =?utf-8?B?aWpDQ01VcFNsS3NZWGc1YWZpanFNblgrN0MzbXlKdkI2RmlKS0Y1WWVaWFhi?=
 =?utf-8?B?eHdoakF6NlZKdENzVEh5V0tCMHQ3MUppakhVelcwYjhKUUpXaE9ZYS9yQysw?=
 =?utf-8?B?disxSXZmN3FDL3ZCZVhRUXhCeFdIOFE5MHk1U2NKSlZZRHZMSVFRckRMdlly?=
 =?utf-8?B?Vk5YcVE4YVFLTVAzZjB5ZjRtaWRiZlNSZ2Q3cnFDbWFyeFJaM2pXMVBYWitH?=
 =?utf-8?B?aWszaXN5VE9IaFFLQWRzYVZGY1JvNEZNeGEvU1RrOFNqVDdpVXpwNG9XOVdN?=
 =?utf-8?B?YnlKZVNNY3dQWmJmaVh3bzJIV2RLQVhIRVJONnVyTFNGNXI5U1E0Z3F6MnF1?=
 =?utf-8?B?S05NdGM1U2J6QXNuQk1zSitXRkE3RUQ4R2UvL3ROMzZOb0c4elJuUDNjWE1C?=
 =?utf-8?B?ZGFOMStjZ0N5Z255YjdJUDArcXhyTnBrZmNEUXdVMGJZUjZBNFR1cHlHYjV0?=
 =?utf-8?B?OVluTEFsZDF2UWw4U3o3Q2ttQlk3NmdCYktqbkZyNDE2c29haEdMMUVFbW5y?=
 =?utf-8?B?RkNUTFNvNjNYYjNtZkQ4ME1tRlh2MWxIWDUxbDAvRXhSSGJjcldsY0xRZE5H?=
 =?utf-8?B?YmsrcWZmdkJ0ZGQvOU1DOVlwSTRqMXB0bXlWZDhYMThCajVtVXVpbUZYdWk3?=
 =?utf-8?B?SWlYY0dtN0NHUWMrV3c3cVduQ1VwaUFJdnFUWEYxV2dvWDNXcnY0c0x4RHB5?=
 =?utf-8?B?RnFDeDV0WmJDWlpEMmxWMUMzSk42c2VhWENKQmdTMjZwdExkZTlvSUg5eFBY?=
 =?utf-8?B?Z0pDdi80S3BvNHN3WE1pQmwwdjZ5TU9vTEtGa1JNUUhJNjdaRTQ2c3hFTUxy?=
 =?utf-8?B?MFN3RE9kaXplam1OLzBvSzg3dGJIZVNxcnU0WFhmMUlPRjdud2JkVVM1UXl2?=
 =?utf-8?B?T1IzYVRlMktLM2RwT3F3bGpEd01XcklPRzRmV1EvSFhRT2RBL21DMy93d2tW?=
 =?utf-8?Q?dlOJU0/ul8GBrvIV2d1+KFDLqjaI71uJNUpZ6mM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ea2596-dd12-429b-f582-08d8d8dca154
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 15:55:38.5238 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vjLiQe0MMBawrxSM1HBuqfB5x29wcvWfhw94vHVUDIJqZHOQwjjwELlbIlxqnhfG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
Received-SPF: softfail client-ip=40.107.68.85; envelope-from=Babu.Moger@amd.com;
 helo=NAM04-BN3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Pankaj,

> -----Original Message-----
> From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
> Sent: Wednesday, February 24, 2021 2:19 AM
> To: Moger, Babu <Babu.Moger@amd.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>; richard.henderson@linaro.org;
> Eduardo Habkost <ehabkost@redhat.com>; Qemu Developers <qemu-
> devel@nongnu.org>
> Subject: Re: [PATCH v2] i386: Add the support for AMD EPYC 3rd generation
> processors
> 
> Hi Babu,
> 
> > >> +        .features[FEAT_8000_0008_EBX] =
> > >> +            CPUID_8000_0008_EBX_CLZERO |
> CPUID_8000_0008_EBX_XSAVEERPTR |
> > >> +            CPUID_8000_0008_EBX_WBNOINVD |
> CPUID_8000_0008_EBX_IBPB |
> > >> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
> > >> +            CPUID_8000_0008_EBX_AMD_SSBD,
> > >
> > > Don't have SSBD flag exposed in default EPYC-Rome CPU configuration?
> > > Is there any reason for this?
> > > Or do we need to explicitly add it?
> >
> > I think we missed it when we added EPYC-Rome model. I was going to add
> > it sometime soon. As you know users can still add it with "+ssbd" if required.
> 
> Thanks for clarifying. I also see CPUID_8000_0008_EBX_IBRS missing for Rome.
> Will it be okay if we add them now for Rome?

It is normally added as v2 for compatibility. Like this.

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 24db7ed892..f721d0db78 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
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
+                    { "model-id",
+                      "AMD EPYC-Rome Processor" },
+                    { /* end of list */ }
+                }
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "EPYC-Milan",
> 
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c index
> 6a53446e6a..b495116545 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4161,7 +4161,8 @@ static X86CPUDefinition builtin_x86_defs[] = {
>          .features[FEAT_8000_0008_EBX] =
>              CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR
> |
>              CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
> -            CPUID_8000_0008_EBX_STIBP,
> +            CPUID_8000_0008_EBX_STIBP | CPUID_8000_0008_EBX_IBRS |
> +            CPUID_8000_0008_EBX_AMD_SSBD,
>          .features[FEAT_7_0_EBX] =
>              CPUID_7_0_EBX_FSGSBASE | CPUID_7_0_EBX_BMI1 |
> CPUID_7_0_EBX_AVX2 |
>              CPUID_7_0_EBX_SMEP | CPUID_7_0_EBX_BMI2 |
> CPUID_7_0_EBX_RDSEED |

