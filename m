Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4D72D829C
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Dec 2020 00:10:47 +0100 (CET)
Received: from localhost ([::1]:57520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knrYk-0007A7-MK
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 18:10:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1knqh4-0000Sq-O1
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:15:18 -0500
Received: from mail-dm6nam10on2065.outbound.protection.outlook.com
 ([40.107.93.65]:60369 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1knqgz-0000oQ-Uy
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 17:15:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=is+b+DOmoS1Dt82peX9q+1L+uTzDO/IRa0SM0FKyCrmt88VSjqOo/XX+Sr7AjgYFhFn0IJYzDxPhU2df6+FFGoPTwv2lcAJq18/PLJLVGGzlNOuWyCTSqCwd6S4TTI8fwseHa85704SI8OYBC7s8cVi9xYIMKhUVuEYPz4Oq3Ne/t4LGMQfyKX64vUvhEnrgc/zyyQpRJOf8zWZKuW3ciKGF5IDPIhs8LP5f0NFMGI2ZxfL+Rr3oeMLQfDRovtFrxiixqfEeKj4+FQKcYvmimGIJ2HmFeepEyUOySlGG0zYVxU/kJZUJn/MLhoTDj+ewnCcXsd3ZJbSB4xO65y/ebw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duwFcLxk1GLZ062tOPAzXha/eGyqwgRpriSC8FlQmdg=;
 b=KNzLRiCR4o3Kk4OMGg0Dx2BZGeXnIXoSCLEq2oYoe08FqlaG9V/5xDE7y5P0jBR3sjAICCXtjdyYwp7xn/n+Lbi/WKuws8ZrvdLCbSei5S3l2Lkqjs0deHqvSdUVzI0iEIq2C6XvX3RNUxtyty0AAL+Jn9gEdjzTLB+w+LnDdw/ggZShX/XudzfNZLdyERpFa6csKnmrFUlwt8u9XojeLFJEfUufiBOT2qLKF/qdcjkT+0AHERrBREFaGlVyzKXm5CmwI558YhFEGSe4n6lJckGXNHHmf67JgS8hf7/1XQJe2Nz3DQ4wRtnS4IgJwmYL99slPk7D994lz3l9nvvL/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duwFcLxk1GLZ062tOPAzXha/eGyqwgRpriSC8FlQmdg=;
 b=thvu0NI9Vz5HDU8uSRM+w0DcG/ItOxge6Q1CiNC2fy+wL61wlGPh9Yei6ymz15Bn5ua5U0cVjPsYb7U4G7jTlwiuJrEG8CjA7cljb1q2UxfRYAe5s8GPcdcZn17qI2PZu8g3aj852our2WlWmxBEThqcQChhozIKsR/bzwlEIOs=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB3467.namprd12.prod.outlook.com (2603:10b6:5:3c::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.17; Fri, 11 Dec 2020 22:00:10 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::d95e:b9d:1d6a:e845]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::d95e:b9d:1d6a:e845%12]) with mapi id 15.20.3654.017; Fri, 11 Dec 2020
 22:00:09 +0000
Subject: Re: [PATCH 3/3] sev: update sev-inject-launch-secret to make gpa
 optional
To: James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org
References: <20201209172334.14100-1-jejb@linux.ibm.com>
 <20201209172334.14100-4-jejb@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <afe66ae1-a1d9-c017-b05d-12247350338b@amd.com>
Date: Fri, 11 Dec 2020 16:00:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201209172334.14100-4-jejb@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SA9PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:6e::29) To DM5PR12MB1355.namprd12.prod.outlook.com
 (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SA9PR11CA0024.namprd11.prod.outlook.com (2603:10b6:806:6e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21 via Frontend Transport; Fri, 11 Dec 2020 22:00:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9e60595e-9448-4914-8697-08d89e2020bf
X-MS-TrafficTypeDiagnostic: DM6PR12MB3467:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB34677803C58584EEA472B093ECCA0@DM6PR12MB3467.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAMxsUE39X6VeBfEzt84iGPPqBm+wbkGS1BCVOdqraw8SVjxEQdbkAPfTkMFRdVuMN94/NdXn1WrGQXqhU/Qfu9bBshxPDDw8M2xApJEQO4MObwt0dTPNmotwyr5Mhjl+4TUX+CLuu+jiZdMoVMYfIznDJxZxqjtWiIaC9vkVmXD78nP5hhV2MkfpnZVTjlrWrX1K2exwDCXj5g7dVeZrgOvWxyWfsu1ampRacwz9XXEvsKhC1lD7NNU0m07XX4X99X629P24MJziMvh4l3+E1fvy1EXBbwZuU500EBI0YaMJUv8UGBC/eKe5o/VMQjy5/6dL6rquLMEp7nTM60ullzS2TeiOkZsxdv8lxBM3aZ1cIeP81bF/tK0R0n8kMf9HcOZ4TCiYzpSYH4m7mH2IwxW6bSDb0D1iGJfX1TMN/U3qmL0Xalann/MoSIQMBeNYaa1PAp02kdrWCl5iwjGyVjhL5q7tXkhdNMKF8ApVxxF1d0q4EzzE3ffqiCxl9zq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(7416002)(4326008)(36756003)(6506007)(66476007)(956004)(16526019)(26005)(2616005)(186003)(31696002)(66946007)(66556008)(8936002)(8676002)(54906003)(6512007)(86362001)(2906002)(31686004)(53546011)(83380400001)(34490700003)(6486002)(5660300002)(508600001)(52116002)(14743001)(219293001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aDBxdDJKMlVGT1QwVEROanU1S2lPV0ZPVTMzRnB6R0JSM2RTbks2OVZnMzBZ?=
 =?utf-8?B?ZU42MzdSVDE1MnY5cHg2TTVrRHBGaHUzQ0NCbkRXRTFHRnFwTlR3aVR4NW5n?=
 =?utf-8?B?WEg1Y1IrVEs4c3MrUWN2K0pkUHNJLzI1azlRMkxMZTdDRTliTjA3OW1hMVMv?=
 =?utf-8?B?cCtqcGFBTC9lWFNIVmtScWpNSmVFRG11djRoeTNxcmpUaFd3YmR2U1lzTHhG?=
 =?utf-8?B?Z3lGWElUK2U3RkQxWXkxTUZhaTE1V216UWRhQVRQQmdLMTdOZGNxOU8vUGxu?=
 =?utf-8?B?VUp5blJaVHAxQkpZT2w1Ymp2RERKcTROWUdyMW5USXNmYWcreFVLVlJuanlU?=
 =?utf-8?B?SWFtcTVqL250Z2tCdDZwR0p5VkhRL2dxaE51aXl1WUtCTERsZjRMVlBweFc2?=
 =?utf-8?B?T3A0TVZnMEN3RFYrandNQzFzSWNYQVhydFptSjRqeDJNQWpCYThvL0RFZFZh?=
 =?utf-8?B?TGI1aGlESWNKYmxtK1pHMmsyS0ZsNk40eVBubmE5clF2YWt1TDhWZGFLVnNq?=
 =?utf-8?B?ekV4N2xDdU0yamQ4NG5HUzRSaXVxQ1krTU9XOXlhN3BqWms2S2t0aEY4QStC?=
 =?utf-8?B?R0NwaTlWK2t2dFpCT2tKL1c2OTRHbVcvSC9HQ29qeDhiUnAwT2M2aXVScGJR?=
 =?utf-8?B?MGxNTFlnY2JVR29ZWHI2NVFBRDJ5alpROU4vQ1NKL09ObWFGZXY1SXdoVXUv?=
 =?utf-8?B?U29NNzAweTlHUVMrZ0ZhZjA0UHdEdE9UQ0w0b1BkTGpDMWFhaHJXTjMzSmQy?=
 =?utf-8?B?NUNPZ0JBYUZFU3FKV0k1REJ1Q0lpSGdGbG9GSVFJZGFWMTcwcEFVbk1CWXRa?=
 =?utf-8?B?bkZHcmlEajU4RXhIMXYvUHVCMXFjYnBPTzNZU1NtSThCUzhBZWF1WExGWVZK?=
 =?utf-8?B?QzR5Yy8wU0dPVFhYV09oNUpPNnBDcTBzOHhoM3g2VThUai9TNVQrYjkyVFY4?=
 =?utf-8?B?YUJQMEJNakM2azNLRWNlSjlGYU42azNENG5LTncwZlZySll1WlI4M1k4Z1Rh?=
 =?utf-8?B?Q2ZvYUcwMHl2RjUveTJIbnhJaVpNOEhsalh6ZXNpcHJPVEswS1Z3M0RMS0hN?=
 =?utf-8?B?T1BQamZFWERQMzlwREtuSU95bFBUbmdoT21sMG0reE9RZGJUNno1R2xFempU?=
 =?utf-8?B?OU9wWnltTEJ6UFI3aTh0U2FldDl2WVNvL2VnbHl0VUlvZnIrUlRYVUp3REJM?=
 =?utf-8?B?Vy9vRUJTYWlicFgybWFzY2hHLzlDL2RrVHh2R1Y1SnBpdTllRHNFblBpRXVh?=
 =?utf-8?B?bnhTc1c1Q2N4dE43a0RPeU1jTEpuS2lXNDFhVHNDYy84aHlsaTNaZVV0bnpw?=
 =?utf-8?Q?OKxULANeb7II/lq5pRon7uH3PoVsrcsbwn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 22:00:09.5831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e60595e-9448-4914-8697-08d89e2020bf
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lnMGoWAeYIqAGrlKl/96vwfAQuYvsnsFHv+G9dz7NUQuHA2hqwH7lAloAljhQA6nhVfKePMN9/Cq6lslhsjOpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3467
Received-SPF: softfail client-ip=40.107.93.65;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: ashish.kalra@amd.com, brijesh.singh@amd.com, david.kaplan@amd.com,
 jon.grimm@amd.com, tobin@ibm.com, frankeh@us.ibm.com,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, dovmurik@linux.vnet.ibm.com,
 Dov.Murik1@il.ibm.com, pbonzini@redhat.com, berrange@redhat.com,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/9/20 11:23 AM, James Bottomley wrote:
> If the gpa isn't specified, it's value is extracted from the OVMF
> properties table located below the reset vector (and if this doesn't
> exist, an error is returned).  OVMF has defined the GUID for the SEV
> secret area as 4c2eb361-7d9b-4cc3-8081-127c90d3d294 and the format of
> the <data> is: <base>|<size> where both are uint32_t.  We extract
> <base> and use it as the gpa for the injection.
> 
> Note: it is expected that the injected secret will also be GUID
> described but since qemu can't interpret it, the format is left
> undefined here.
> 
> Signed-off-by: James Bottomley <jejb@linux.ibm.com>
> ---
>   qapi/misc-target.json |  2 +-
>   target/i386/monitor.c | 22 +++++++++++++++++++++-
>   2 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/misc-target.json b/qapi/misc-target.json
> index 4486a543ae..1ee4e62f85 100644
> --- a/qapi/misc-target.json
> +++ b/qapi/misc-target.json
> @@ -216,7 +216,7 @@
>   #
>   ##
>   { 'command': 'sev-inject-launch-secret',
> -  'data': { 'packet-header': 'str', 'secret': 'str', 'gpa': 'uint64' },
> +  'data': { 'packet-header': 'str', 'secret': 'str', '*gpa': 'uint64' },
>     'if': 'defined(TARGET_I386)' }
>   
>   ##
> diff --git a/target/i386/monitor.c b/target/i386/monitor.c
> index 1bc91442b1..a99e3dd2b3 100644
> --- a/target/i386/monitor.c
> +++ b/target/i386/monitor.c
> @@ -34,6 +34,7 @@
>   #include "sev_i386.h"
>   #include "qapi/qapi-commands-misc-target.h"
>   #include "qapi/qapi-commands-misc.h"
> +#include "hw/i386/pc.h"
>   
>   /* Perform linear address sign extension */
>   static hwaddr addr_canonical(CPUArchState *env, hwaddr addr)
> @@ -730,9 +731,28 @@ SevCapability *qmp_query_sev_capabilities(Error **errp)
>       return sev_get_capabilities(errp);
>   }
>   
> +#define SEV_SECRET_GUID "4c2eb361-7d9b-4cc3-8081-127c90d3d294"
> +struct sev_secret_area {
> +    uint32_t base;
> +    uint32_t size;
> +};
> +

Originally, the idea was to allow expanding of these GUID based structures 
by pre-pending data to them, but based on how pc_system_ovmf_table_find() 
returns the pointer to the start of the structure (based on the length 
found in the structure), I believe that expansion could be done by 
appending to the structure, which seems more logical. For example, if this 
structure is ever expanded, it can use the third parameter of 
pc_system_ovmf_table_find() to get the length and compare that to the size 
of the structure to determine if new version of the structure is present 
in the firmware.

Otherwise you can't do the nice easy assignment below:
   area = (struct sev_secret_area *)data;

You actually have to do some math:
   area = (struct sev_secret_area *)(data + data_len -
                                     sizeof(QemuUUID) - sizeof(uint16_t) -
				    sizeof(*area));

or add the QemuUUID and uint16_t fields to sev_secret_area and:
   area = (struct sev_secret_area *)(data + data_len - sizeof(*area));

Or we make the decision that these GUID structs should never change, just 
add a new one to the table if more info is needed.

Whatever we decide should probably be documented in both the OVMF patches 
and the Qemu patches.

Thanks,
Tom

>   void qmp_sev_inject_launch_secret(const char *packet_hdr,
> -                                  const char *secret, uint64_t gpa,
> +                                  const char *secret,
> +                                  bool has_gpa, uint64_t gpa,
>                                     Error **errp)
>   {
> +    if (!has_gpa) {
> +        uint8_t *data;
> +        struct sev_secret_area *area;
> +
> +        if (!pc_system_ovmf_table_find(SEV_SECRET_GUID, &data, NULL)) {
> +            error_setg(errp, "SEV: no secret area found in OVMF, gpa must be specified.");
> +            return;
> +        }
> +        area = (struct sev_secret_area *)data;
> +        gpa = area->base;
> +    }
> +
>       sev_inject_launch_secret(packet_hdr, secret, gpa, errp);
>   }
> 

