Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BF30B2EB
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 23:46:47 +0100 (CET)
Received: from localhost ([::1]:53128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6hy2-0003NE-CL
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 17:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l6hwK-0002qJ-MU
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:45:00 -0500
Received: from mail-dm6nam11on2086.outbound.protection.outlook.com
 ([40.107.223.86]:12513 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1l6hwH-00066n-Qx
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 17:45:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Eh3+gTHs53d8ggKCVpNiSaIrMJSiMjj6bfHRhccqUtL/IWUYpLG9LBcICzJjcAgMmTRYFQ5bADiacCIar7YmjrxsR9OoGlAlVBBtUa9SQ0fM18QL3PTgge1sCY20Nrh95h4PomlGz1ls4KHnwH9m+NopgmbqtdUyKvktWKIsDBdJy2zCb5bDQXRzQ55mmt9P6PeTKdV+RQr2lRNZl+F7ECmmkG+JAiVALxmbxrjnobCc50mzCDXeTVqVi+tynNIOCraU38VbRTsMMg3ABZghhn41SH/kaLCtkcrJNO7HGiN7I9cw8wnVg3mqjxRg5rZ5YY7Qsh1hXDOj7EyTfj9kUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjKvR0pXRs0OeRLbNb1gbYg9LpVQ0c3i7DfBAjRE92s=;
 b=eeGFm+AK/f7fVPr68jQWlcYJqtNWHObQISGumb7NKwCZ+X8X3mPwrlN3lQl6Gn6a49CMaMvbYgR0aQtLjm3uZZhC/nSvgbrK/b8BXgMBwyRWBVIwZyCZB36B3AiN24GZwU2nQPF5THSuEEa7AamQ5zbp1D0ZDcUj5dOFrsPRavKP5lsohtJU9s1jaRvv5dv5HMzzPaOHACt+EKUWQlWEzbS8aw6l0aGlGqyjcIHz4FLAkg5RURGM0ZYvdVMQ5jbtwF/8CltNVpAc0kei/CEZMVO2CdyZAnPImRtXgluA8OXVJhgdn3u6vlCUyl02DDSpDVUX24cMGeO1InDgamfCDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjKvR0pXRs0OeRLbNb1gbYg9LpVQ0c3i7DfBAjRE92s=;
 b=X1Nl6tATV8+Wx6Zsyhzf29QZu1tbwEDN6eT5VzbE/ESKlyp0Q1lOZ4jHoo4i+3xv61KWIqvLfAH27NG7AGEGYZZE8dD3FWTgIerI7F8+GhQtqcmFdXPXY0Ht5KgUg0mYPda9jpYHNXrylyHOri0114SXqL2IUJt4ikgfMh6u7xE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SA0PR12MB4558.namprd12.prod.outlook.com (2603:10b6:806:72::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.22; Mon, 1 Feb
 2021 22:29:51 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3805.027; Mon, 1 Feb 2021
 22:29:51 +0000
Subject: Re: [PATCH] i386: Add the support for AMD EPYC 3rd generation
 processors
To: Eduardo Habkost <ehabkost@redhat.com>
References: <161133338780.27536.17735339269843944966.stgit@bmoger-ubuntu>
 <20210201221627.GH3872207@habkost.net>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <0ad4017d-e755-94a3-859e-800661bcd2d1@amd.com>
Date: Mon, 1 Feb 2021 16:29:50 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210201221627.GH3872207@habkost.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SN4PR0501CA0096.namprd05.prod.outlook.com
 (2603:10b6:803:22::34) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SN4PR0501CA0096.namprd05.prod.outlook.com (2603:10b6:803:22::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.8 via Frontend
 Transport; Mon, 1 Feb 2021 22:29:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0827826a-b5cd-4b56-34e4-08d8c700e406
X-MS-TrafficTypeDiagnostic: SA0PR12MB4558:
X-Microsoft-Antispam-PRVS: <SA0PR12MB455810FD3CD22878E14E457895B69@SA0PR12MB4558.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SOfoy9cPzRDkYf88MWZ8qKAzAsATQG+YM8o1Gp74I2HOcpTNfeGl1soLhlsq18sobfyOTvm4G5NTsWr0LTeNbe2aUMsHtXuNW5bu5WIInr29LUo2aJSRB4GQhATZqJShcypqSq7Or9LtCwhYQuE5ROItKt9MFO1YtGPvSdMamDS8p7hS9bKhg8nHhIFmmzsKgEKhutp4AXuMIyLtqlyLagn3xn6KN7dvHqK/xbDeEkTXYZupu+6VYGRUPndzIAIztObMXfTmY3B8e5lZh1m2q5P3zj1D8WICl4C//VC0rkFfcPeYOa1VSWzYUdolqVxpS/41aXu3np/jttxHXPKAJ1bCji0Esa9mGf3dd7HWYbt6whuOv4FMogtE5xipD2stgI0Si6Ask/w4TjxEwzU5rsr40FE+b03niXhz1qS4dxWWtGF31OYvair+mTVC0utMvNu8NyjZRtlnlomPkk1Fx/5TcC5FcOwS3SRE0lbhM7UOWmJD9k0Uf/8ljjv0RPI7ck5QOXLoiInaNIW+Zsisxs1MZrQ/WrQYmYrO+OFmhjsLk7oTbY77J8S08EcdDiD2iSZGZPkCepcRIWegmse85YUjP2sVPzONiqpkUFJIm1GNEEHP5IIVFPLECoVF5Kf/ZVQxeMvRIdBkrL1VrE3F9UBggmsAMa0NJEaF0PZjUGKRGa+Lk4Gbg24sutLmT+XJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(366004)(396003)(136003)(2616005)(36756003)(6486002)(31696002)(956004)(316002)(6916009)(52116002)(83380400001)(2906002)(4326008)(16576012)(53546011)(44832011)(31686004)(478600001)(66476007)(16526019)(966005)(186003)(8676002)(5660300002)(66556008)(66946007)(8936002)(86362001)(45080400002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M0dWS3Rpd25QdnA3VFI1YktnWUo2YkxheEFUZ3c1aTFHdmhhTGtobTI3VmxL?=
 =?utf-8?B?bzBKS3ljNUZrVDVwUW1OYVdHV2d1UnZaN2EyYU55aGd2UjVMWWdVNHBaeTND?=
 =?utf-8?B?a0hxa1UzNGhxbVFUZUlBajd0N0FTR2x4QWYyaGdVVDhaZkZGemplbmp3ek5y?=
 =?utf-8?B?d2J6QjJHSEgwZnU3RzcrUVJIbmxxQS9hSzQ2bEpGbFJJTmdIeWVjL1o0U044?=
 =?utf-8?B?REdPNzlXckxtOVVwR0laZFRDWXRrWlpDT1V2L3JWR2ptRmxIeU16NGtxWHM2?=
 =?utf-8?B?eDNsbnJieVRCKzdnSHB4YnQvQW9LRGFxYzBtL3lVTWlKNmZoZEptdGNHZWZy?=
 =?utf-8?B?MDJHTWxhTXF0UHBxd1VCRGN5dWNPeDJJQXk3V1BsTUhvRURaMjFpWUdLZmdi?=
 =?utf-8?B?UWVtTnFtNDZ0ZjVsTHhqVHdEanR0WklrQmkwME5MdThyRVEwYm01QkUvWmlv?=
 =?utf-8?B?dFJOUzJQalV0WTNEeE9acXVBM1gzZGxqVUpLeTBjUTRmd21DNTByYmxHblg4?=
 =?utf-8?B?bE1rNlRKZnpnSmpFLzF5UW5GbC9VNHlrVTdxaWNWY2cyYTNjVHJZbFZHaFAz?=
 =?utf-8?B?bVI4ZnUzS0tkWnZXV3VhREV5c3N0dXNEYmV4OERKNlcveTdnaWxNSXFkWmtT?=
 =?utf-8?B?SUgrOE1SV0RoSG5sV1gvSis3aEkwVGQ5Sm1YcXQwVThRc2pDUURLRVB1K0Fi?=
 =?utf-8?B?QjdrMFFPSUJRbUxtWUtiTzF6QVVJSW84ZGhuZzJGR1IzeXlkWUgwTjc2UG9Y?=
 =?utf-8?B?Q2gzVm1RZlJuVjVXTEJSTWpjM2V4OStvZm5vMXhCMURRVU9iYTg5dW1zSysz?=
 =?utf-8?B?TnQ4b29XZDdjSk1DRGxKSW1JN3BVTEpERTdVSG1ZL3lQS0JjOEprL1NTbEcy?=
 =?utf-8?B?TTJ3emdjM1d1WThoQ3dPd0JKNFdINFFMZVM0ZzFDTkM0Smt5REJKYTRuakNu?=
 =?utf-8?B?MktuRm8xbTlqZTluSEZjbkptaWhNVDV1MzVmWVpDRTRhdmg4eXdPOGdVTDJ4?=
 =?utf-8?B?Z2dJM216eXQrVFBqekJQTTdna1VLU0ZOcGRZUkxLV3hvaEFtK09JdE1oY1lp?=
 =?utf-8?B?VTZ5dmhNd3p5Z1phTnZ6aWdwWEo5SU80cERFTU82dmNlaVNQOUhSbzl0WU5K?=
 =?utf-8?B?UTNLaXZld2FQdHo4K1AweS91TGJQWnNkeDdGaklmcWQrbTlxbXYyRDRTb0xz?=
 =?utf-8?B?Rm44ZWRCdHJEZUhVenBYcGxSVUJEQ1o4SzVRQUFnd3hvK0ZVM3NGTGJMUzJM?=
 =?utf-8?B?cElLZVdIR1ZmZWdtbnY2eFBnb1NNbVZ1TDI2eERvRnVleHNLY0tHOTZLdXFW?=
 =?utf-8?B?MWlCYWVyZnVvNDdvampBOUJNYmRkVFJPbExNYVhxSm1WNDRvNUhpNkdEZ0Mr?=
 =?utf-8?B?SEJyZjFDc3htRGNTeE1LdTU4Mlo5UmFxdW1ZWmJjdXhzTldUNkpCaldjOEZh?=
 =?utf-8?Q?2p3d033q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0827826a-b5cd-4b56-34e4-08d8c700e406
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 22:29:51.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJc66mq4mIXvUCwfk5g66zID9uWOknF6hhALc8WYvLIol0FqVqlpSNknJrVwbgfY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4558
Received-SPF: softfail client-ip=40.107.223.86;
 envelope-from=Babu.Moger@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo,
Please hold off on this patch. I need to update this patch.
Actually We need to add one more bit to SVM
feature(CPUID_SVM_SVME_ADDR_CHK). I was planning to do that this week.
Got busy with some other priority. Will send it this week, Sorry about it.
thanks
Babu


On 2/1/21 4:16 PM, Eduardo Habkost wrote:
> On Fri, Jan 22, 2021 at 10:36:27AM -0600, Babu Moger wrote:
>> Adds the support for AMD 3rd generation processors. The model
>> display for the new processor will be EPYC-Milan.
>>
>> Adds the following new feature bits on top of the feature bits from
>> the first and second generation EPYC models.
>>
>> pcid    : Process context identifiers support
>> ibrs    : Indirect Branch Restricted Speculation
>> ssbd    : Speculative Store Bypass Disable
>> erms    : Enhanced REP MOVSB/STOSB support
>> fsrm    : Fast Short REP MOVSB support
>> invpcid : Invalidate processor context ID
>> pku     : Protection keys support
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
> [...]
>> @@ -4130,6 +4180,61 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>          .model_id = "AMD EPYC-Rome Processor",
>>          .cache_info = &epyc_rome_cache_info,
>>      },
>> +    {
>> +        .name = "EPYC-Milan",
> [...]
>> +        .features[FEAT_8000_0008_EBX] =
>> +            CPUID_8000_0008_EBX_CLZERO | CPUID_8000_0008_EBX_XSAVEERPTR |
>> +            CPUID_8000_0008_EBX_WBNOINVD | CPUID_8000_0008_EBX_IBPB |
>> +            CPUID_8000_0008_EBX_IBRS | CPUID_8000_0008_EBX_STIBP |
>> +            CPUID_8000_0008_EBX_AMD_SSBD,
> 
> This breaks query-cpu-model-expansion, see:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.com%2Fehabkost%2Fqemu%2F-%2Fjobs%2F1000347471%23L350&amp;data=04%7C01%7Cbabu.moger%40amd.com%7Cc472108231e74551a34a08d8c6ff0975%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637478145976001070%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=UggCEUXrcWCaRLgyClQ53lLnWDqu6%2F9bnxcyJqjy68s%3D&amp;reserved=0
> 
> 20:11:28 ERROR| Reproduced traceback from: /builds/ehabkost/qemu/build/tests/venv/lib64/python3.6/site-packages/avocado/core/test.py:767
> 20:11:28 ERROR| Traceback (most recent call last):
> 20:11:28 ERROR|   File "/builds/ehabkost/qemu/build/tests/acceptance/cpu_queries.py", line 31, in test
> 20:11:28 ERROR|     self.assertNotIn('', c['unavailable-features'], c['name'])
> 20:11:28 ERROR|   File "/usr/lib64/python3.6/unittest/case.py", line 1096, in assertNotIn
> 20:11:28 ERROR|     self.fail(self._formatMessage(msg, standardMsg))
> 20:11:28 ERROR|   File "/builds/ehabkost/qemu/build/tests/venv/lib64/python3.6/site-packages/avocado/core/test.py", line 953, in fail
> 20:11:28 ERROR|     raise exceptions.TestFail(message)
> 20:11:28 ERROR| avocado.core.exceptions.TestFail: '' unexpectedly found in ['fma', 'pcid', 'avx', 'f16c', 'avx2', 'invpcid', 'rdseed', 'sha-ni', 'umip', 'rdpid', 'fsrm', 'fxsr-opt', 'misalignsse', '3dnowprefetch', 'osvw', 'topoext', 'perfctr-core', 'clzero', 'xsaveerptr', 'wbnoinvd', 'ibpb', '', 'amd-stibp', 'amd-ssbd', 'nrip-save', 'xsavec', 'xsaves'] : EPYC-Milan-v1
> 
> The root cause is the lack of name for CPUID_8000_0008_EBX_IBRS at
> feature_word_info[CPUID_8000_0008_EBX_IBRS].feat_names[14].
> 
> I'm applying the following fixup.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 06c92650a17..8d4baf72e5b 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -1033,7 +1033,7 @@ static FeatureWordInfo feature_word_info[FEATURE_WORDS] = {
>              "clzero", NULL, "xsaveerptr", NULL,
>              NULL, NULL, NULL, NULL,
>              NULL, "wbnoinvd", NULL, NULL,
> -            "ibpb", NULL, NULL, "amd-stibp",
> +            "ibpb", NULL, "ibrs", "amd-stibp",
>              NULL, NULL, NULL, NULL,
>              NULL, NULL, NULL, NULL,
>              "amd-ssbd", "virt-ssbd", "amd-no-ssb", NULL,
> 

