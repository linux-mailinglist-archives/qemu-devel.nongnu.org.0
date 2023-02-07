Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 064DD68E465
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 00:27:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPXMU-0001sr-O7; Tue, 07 Feb 2023 18:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPXMQ-0001s3-VB
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:26:51 -0500
Received: from mail-mw2nam12on2041.outbound.protection.outlook.com
 ([40.107.244.41] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPXMO-0000vq-Ag
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 18:26:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtrIYhGJtrvlQUFKqIwU+THRKlVFLg0AvhBEiWHf2qEmwWtnWEKwVOMXS1q2s83BUPpQNTucWGofS8Uqt9Jf8opykxgIHMBooyrIp4EPDsrZZoekLdRHcQEuDLgCltspM3UeOtN73m3KMv1Ggkdb/YutU5CWQGFP8Bd1nH3S25A/XVR0/5VCjU2bAk73PJkgLgqExirtLL/Qc45vIaXQj7DSFcOM4bQszPIaTfov/SgU/o1dxVW/sGC0/3IR3ogluN1/YfhGh9jaO9VaCr9ifrhyZLp4sxNmKkCt1MCCJ7+nGmx8ZL/aIL4x5mmw8wlLK4Y1oQf5gDgkaUN84pppvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUaEyi8Dy4GvDPffx+Vqd/l/gPAYMatNT0+EFLd8iBo=;
 b=XtWDGtRbCWEvZdVSpnO25dQAPKqKG/yYm+wAV8vRb2HyPC1Pf3d/+q/SXDLdxmIru/HohFCJUmJQ4sXHSntxAKNXMbjimGQPGBc6QLECsxYWWvacBnuGUR6obOr6z40WfdsgizoTAsAtEA/hYOmYWULv0jF4HCzj5gCFs7SoCxZC1KgMlnvPkZFy7omUtxDQQk3wQA3LF6vgPJXV6i79NOEG0+zFZ1oeYyQnra8f3W2lcdwx+uYw2RIiqYhIsIO1JsGwIBTt56K3KXxYz29jZ458e7Jzh7/+nOcfc9bCwUjrDvflovFTR/cFsSI8voaZYynuowyeGBJlB2rGRyLXrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUaEyi8Dy4GvDPffx+Vqd/l/gPAYMatNT0+EFLd8iBo=;
 b=UxrHnPnepD9sERqow7lxPwpKr4+Sz4tUnPRhlybp+umqnHPMOSfaFkWyesNGqOpqZhrsRG5JTbxoihN21JMgY+/shiPB2jczjWk2IAb5+DjJxb2qL3qp3sKQJ97t2dGbkbXevyeqpuax2ANI4ORCvntmz6577JfuQfMV8Yh0W9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Tue, 7 Feb
 2023 23:21:36 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6064.036; Tue, 7 Feb 2023
 23:21:36 +0000
Message-ID: <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
Date: Tue, 7 Feb 2023 17:21:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>
Cc: qemu-devel@nongnu.org, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <20230207164117-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR0102CA0056.prod.exchangelabs.com
 (2603:10b6:208:25::33) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DS0PR12MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: 811ce671-abbd-4b99-b1af-08db09620ea1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4MJBtjHDzjWhy8o4+bC9s6jMlGfx43JNeY1f5AVUVZmLPhcERchbYXfS/5XSOVsECFUCPVCA+1rCt5GyjJ9Z4oeIzHNSKLF7r9sjo8Yi0cPpkaU1oO6jh6WMYKfbnsq44Ay9tmmoJxWsWKoC8CFHhnCqrwNiXqbrihX0WzmV8q8izdaCdEOR2efFZy/+6Vmwuzw4hG+NMqpcNVGkMwmXiGRkpBSVtyEDmP+YA6RxMMNDq2ur2MtC5uDQxNv7ABlQ8qm4jpzogADavyAVd4JD9hMELZGgvos7cfxiWPa4pUI2oiHz2iHj8t49KOWgFziDxMMXIJDSqoG1ZmOslMR37DTjpizBQX+3DhKh6k/S2p3qYWGHBljuOHBsxRFgj3I/eU+UOfAIYud8ZZi5XKunL/qhAUCgcNutFj8aHhEEdqEKaCkBHvLBqawpMi69XR4kx+AQ396hzUBCoQWxbc6O7uwVj34FMZIavLot2G2ECI6NrZypMaarblUqy7yXCFQzc1uDJwGhSeS6XOBY7l4tYMYM2FmkixUUO7pN8jgXlBj+/i708sTnkmUzPtFvc6RDoCOp6vxbsPCjW6UT6BbTQX86Ovk/7cEqmeWQtsJt68efB/fjMZ9H235j+ZO+JNQhflG4lJKHcGckSbLJM6bpjz65wW3F5TpRWVxZc3ynxDg80qGkRoqj9H17OjLNEqmksLbbyD44MCoxi/oErIFc7a37uc/JdTzAufLj+lmVQYKK8vpHhzzx2iJTHxWxaQfZtV2TKLx7w/sFJoblE0siYg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199018)(2616005)(83380400001)(110136005)(54906003)(316002)(66946007)(8936002)(5660300002)(66556008)(66476007)(4326008)(6506007)(478600001)(8676002)(41300700001)(6666004)(6512007)(186003)(53546011)(26005)(966005)(6486002)(36756003)(86362001)(2906002)(38100700002)(7416002)(31686004)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z25RMzkwUFNjS3JRWnZYUTdrdVFmN1IxekJDZTNaMnJkemlEZ0pIL1VtSzlj?=
 =?utf-8?B?Z0FrV1BwbjdIN3lwcXc3ejRvVUhVZHhvaEFKNGdQRUFzNUVKR0k0UXVIT2VG?=
 =?utf-8?B?SE9Eb1RPV1hYSVAzM0ROemMzRTh4MFVIdjFZbnFUdnFMWjBQdlhLcFNYKzBE?=
 =?utf-8?B?THl4WTdKSyt2OWJFcHhKMSsrenNXMTEyRWthUC9LVUdqb3FLTU1sNFUzYUZ3?=
 =?utf-8?B?dHBhb0tBQnlCc04yZkNtNUlJWlpZb2VGQVVyN3d6OTZJa0puL1RqaVVKRkha?=
 =?utf-8?B?ZG1QQ3VjUjcwblZzUC9NdWc4b3VHS3lkb1pBcm9jRG1ISy9CSTVOU0dqU2JP?=
 =?utf-8?B?c3dxNU1YVFdhOUU2bFYyV2V0eEVSa2crbWxSNjZYM3NjckRmSFk3RXVzZlZa?=
 =?utf-8?B?Skw5ZjVOQXlSaXk5OVArM241Yy9uUW5pT3U5TXlnNk5zVjlWMjZUTFFWbzlv?=
 =?utf-8?B?bEZaN3I3NWRjUklHbHZiUTZMY1I4RGs5d0RZSHB6a0w1YVJuWlFVSGVISXdT?=
 =?utf-8?B?dVUrS2dGTHh0bWdGUDh5S1pjK0d3NkJYOWVFMDM3UGU5YnlwM1VSQTJXM3Zw?=
 =?utf-8?B?OTVEMDB5Y1ZmU25hekhuQjFmMERGb2tUOUZYcUZ3eDJuMlJBcjZJOEZRaHJq?=
 =?utf-8?B?V3VpUnlSelJSVGhjenJJWTVZV1hJMXYzYjJkclJuSTVaZlFQcFhjb3oyb0Ra?=
 =?utf-8?B?aEhRVmUyNWI0TUhqVkxucDlZNjJUWnZTcWNBbEE1bEp1MmVYM2ovcEtIYmlC?=
 =?utf-8?B?R1M4RXhwTExkQWlNd0I1MW5EZWk2NU9HZGQzZkZmdEtPV3E0UzhBWEdjbVpt?=
 =?utf-8?B?RzB1S2tQWm55QmdLZjBjQ0ZoT0l1WlR0Z1RjamdSc21KQzREVDJQb29lMkNH?=
 =?utf-8?B?M2R3SnF4bFRBazVkdTBqclpKbmxJcHp0NXFiK3BvNEFucDF3ZVFwODA3SGxK?=
 =?utf-8?B?VHQrQlJlbG9rc3pUNUhrS1lvM1FuTzRIU05TTndKeTZLNTJhcFZhWks1RGIy?=
 =?utf-8?B?TlB1RGozWTFWNTBmSS9PZDhTUGI1U1g3TUU3Vm15cEo3T1VhVU1temZjU1Ft?=
 =?utf-8?B?djJDV2JwQlF5MEZndjBFWlVUZmxIeUZpUFJmTCt3Q1o5UnJ5S01KS1ZlQ0xy?=
 =?utf-8?B?TXlLMnZXVmU4U2RINlAxQndHTDJURW5vTVhQdDluK0EvamEySHR6ejBtRVRO?=
 =?utf-8?B?cFBpdGJHRWZLcktMaGppMjUzd0ZWQUdUb2RjUjNuSkFON2ozVGVsTWxMaGtB?=
 =?utf-8?B?b1d2Tkd0TnN2d0kyYy9IWmNobEduSHloL3NJYWZZVW1DSGRMTjUzNXdVbnFl?=
 =?utf-8?B?d09ldVlCN05Objc0Q3h0M25ReE5rRjFwZ09sN0VIQlp6OS9mdWFSb3BMcDQy?=
 =?utf-8?B?L05VNTViTStrblZuakErNVc4RkE3NGZMb1djRGlra1dmY0dkK3pFaTA3Zkh4?=
 =?utf-8?B?SFJueVlpL0VLcy9la3ViN2IxM1lGRitzOGFkcnhXYXlEak9xb3JsK09oczZE?=
 =?utf-8?B?VFZIWHJhZGMyeC94anErVDdLYllIbU5reGYxaE52cVR1ejhmdDlLTGdCTE5n?=
 =?utf-8?B?cUhmOGxZRzZWM1d6eDh6NGxIdUhucnh1ZFh4eWFmSEhOQ01ONGVWUzVHamcr?=
 =?utf-8?B?cVRNZjRhNnRDeVVvVkxqMXhodXNPTVNWbmJEalZRZXhiMmxLTGpzdURNQlA2?=
 =?utf-8?B?V1FNWitFTHNoZFB6RG9CZDVKNkd5Z2svNDIvNzJXSG01cGljTkFOZFRiaGZl?=
 =?utf-8?B?VjJSODNRejRWUDByZmV4UTVVN2hvK1RaL3NlRHBaeVJKdUNXaDlIbklqdkpi?=
 =?utf-8?B?TkprMmhIc0pOQmdVaDMzZGE1TXcxdDl1MzZxZ3dCV3RjazQ5SkFURkZZZk5P?=
 =?utf-8?B?dzgxVDc5cVVJSHgyTjNNc0l1SWFDS3pINHhOMGdhYTZKamh0d2RGWXNSbDJY?=
 =?utf-8?B?Z3RTYysrNm9KM25FM0VkYU53V1hpMkRlVjlCbVhHK3d2ZU40L0dRVWgvZlQr?=
 =?utf-8?B?YWhLLzZBNVphQjd4c2ZEQ0dpVHpyVFVnd3VWWFpVY0d2ZWlqdEx6cUkzTm5Q?=
 =?utf-8?B?TW1NZEVoR3ZId2Q3Q21FWVpTSjcwS3NRRW53K05EMEFsTHhkdHNvSDkycDBD?=
 =?utf-8?Q?xlDMfe7dKbO2bGSB/LcRtdMw0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 811ce671-abbd-4b99-b1af-08db09620ea1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 23:21:36.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWrg3p2CVC9ZeUuwwCWaMMNTRcrI5WXfFrbMVV0iB7wsIvb7UZfYek+Eja6f6xiEQkMN7LUUXL/umKkRqF1bZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6486
Received-SPF: softfail client-ip=40.107.244.41;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 2/7/23 15:45, Michael S. Tsirkin wrote:
> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>> Recent feature to supply RNG seed to the guest kernel modifies the
>> kernel command-line by adding extra data at its end; this breaks
>> measured boot with SEV and OVMF, and possibly signed boot.
>>
>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
>> which has its own way of getting random seed (not to mention that
>> getting the random seed from the untrusted host breaks the confidential
>> computing trust model).
> 
> Nope - getting a random seed from an untrusted source should not break
> anything assuming you also have some other randomness source.
> If you don't then you have other problems.
> 
>> Disable the RNG seed feature in SEV guests.
>>
>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>
>> ---
>>
>> There might be a need for a wider change to the ways setup_data entries
>> are handled in x86_load_linux(); here I just try to restore the
>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
>> entry.
>>
>> Recent discussions on other (safer?) ways to pass this setup_data entry:
>> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
>>
>> Note that in qemu 7.2.0 this is broken as well -- there the
>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
>> modifies and breaks the measurement of the kernel in SEV measured boot).
>> A similar fix will be needed there (but I fear this patch cannot be
>> applied as-is).
> 
> So it's not a regression, is it?

SEV kernel hash comparison succeeded with Qemu v7.1.0, but fails with 
v7.2.0, so I think that is a regression.

Thanks,
Tom

> 
>> ---
>>   hw/i386/x86.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
>> index eaff4227bd..e65a83f8df 100644
>> --- a/hw/i386/x86.c
>> +++ b/hw/i386/x86.c
>> @@ -1103,7 +1103,7 @@ void x86_load_linux(X86MachineState *x86ms,
>>           load_image_size(dtb_filename, setup_data->data, dtb_size);
>>       }
>>   
>> -    if (!legacy_no_rng_seed && protocol >= 0x209) {
>> +    if (!legacy_no_rng_seed && protocol >= 0x209 && !sev_enabled()) {
>>           setup_data_offset = cmdline_size;
>>           cmdline_size += sizeof(SetupData) + RNG_SEED_LENGTH;
>>           kernel_cmdline = g_realloc(kernel_cmdline, cmdline_size);
>>
>> base-commit: 6661b8c7fe3f8b5687d2d90f7b4f3f23d70e3e8b
> 
> I am beginning to think we have been hasty here. no rng seed
> should have been then default and requested with a flag.
> Then we'd avoid all this heartburn - and SEV might not be the
> only workload broken.
> Maybe not too late. Jason - objections?
> 
>> -- 
>> 2.25.1
> 

