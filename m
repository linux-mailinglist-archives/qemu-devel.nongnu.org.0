Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D1A32B902
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:44:16 +0100 (CET)
Received: from localhost ([::1]:53404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTfa-0003dl-TW
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:44:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHTeP-0002nm-VK
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:43:01 -0500
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com
 ([40.107.93.52]:65043 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Babu.Moger@amd.com>)
 id 1lHTeN-0003ly-Sv
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:43:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXMXkZDYXazWuLZMyAN9ExYonJaxVECGBDAn7f6PnvTt1aQoa35Mkbtf5Kw6LfQdRJivP0T+15uWQt3tFvN8z9xHdQltnXWoBJv4Mr3wTH5BZ0l+DPBDYYriJddsLhOMpLtib28SrY8KaTL79JTvI6gcT9rOlzuXYcQpaH9C/VSVqXvz08CEGzEXlVeOpRV1T/GeCM3SNmedCIn1JohcqjrE3RYv72//2nXmXen9xwlFhpL6py/NQB+nRTpLnBGaaeo4NkyaTTYBgRPD0dO+E3zMswJ/IDwk5+iijE7f3VCmn2sIldlaXhevC7Qbo2aIrNSSbkDt0i6yBqQ9dzaZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5mHcV24R5yCy0blTWWmOyCE3pvywE2bVnYKc1fUYJs=;
 b=ZP+t89oAkhdNQRxjaZF+i8TMzFCpEhpW/Uxc/GcwQbJBLOHZHDDA3R/p59SGXHOw5DlZBQRV/EI4R2k/Un2aM2ToUNVOA0ATZibWLoQ+R6VGkYYz+lQeV6a1a3Xo7ABEyYZPwxHnYYQjeNnUCvuKECmDk93ai9Xhkjp7/w0spXCYB3LIURWpAxFsf9ZBMfaSBhIAVFhL6xJEt5UlzPRgXmStP91bBA4U0W5CW5BqjXrHtjTPzByYWsS1XUf7N3D/aSCnAIWZL6ZiuUrOvQVUcnczm4qPUfw67IFyf2jjmx9R5p8Q6M/2CN+OJ1gfP7biicRCm5ONjpmKgKhqpvMf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5mHcV24R5yCy0blTWWmOyCE3pvywE2bVnYKc1fUYJs=;
 b=DVoguQqH12Eko2QlHaz6q8P68HyTEgy5h7BxS5m+Ix1Qx1AMH1zLlOA2O4DmEoMjXO/vazI6PcbuPk8ui1zQNzSn9seIpYk/KyilH2v6a0OSxIHemFtyJpltmgaF4Srs8r+uR/5d2YHY5YoyyQFeJJYLHMYKKpW3F984owRCcOM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2560.namprd12.prod.outlook.com (2603:10b6:802:26::19)
 by SN1PR12MB2462.namprd12.prod.outlook.com (2603:10b6:802:28::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Wed, 3 Mar
 2021 15:42:55 +0000
Received: from SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff]) by SN1PR12MB2560.namprd12.prod.outlook.com
 ([fe80::8c0e:9a64:673b:4fff%5]) with mapi id 15.20.3825.040; Wed, 3 Mar 2021
 15:42:55 +0000
Subject: Re: [PATCH] i386: Add missing cpu feature bits in EPYC-Rome model
To: David Edmondson <dme@dme.org>, pbonzini@redhat.com,
 richard.henderson@linaro.org, ehabkost@redhat.com
References: <161472000062.17527.13517059335871466534.stgit@bmoger-ubuntu>
 <m2h7lslgix.fsf@dme.org>
From: Babu Moger <babu.moger@amd.com>
Message-ID: <349e6a0a-7849-357f-ef56-b881e2212de4@amd.com>
Date: Wed, 3 Mar 2021 09:42:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <m2h7lslgix.fsf@dme.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [165.204.77.1]
X-ClientProxiedBy: SA9PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:806:20::29) To SN1PR12MB2560.namprd12.prod.outlook.com
 (2603:10b6:802:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.236.31.136] (165.204.77.1) by
 SA9PR03CA0024.namprd03.prod.outlook.com (2603:10b6:806:20::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Wed, 3 Mar 2021 15:42:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7d8b1618-62bd-45a1-ccde-08d8de5b02e9
X-MS-TrafficTypeDiagnostic: SN1PR12MB2462:
X-Microsoft-Antispam-PRVS: <SN1PR12MB2462685C29A47B7958CE7F4295989@SN1PR12MB2462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lndunvmwCTPxyuDHFZnNLYGWq0ZavyGZbDPCIgmPC++bxFttOaltNNSHZoHd34Ae7wuMyuTb9AvS2HH8E6RKrkZbLNXZlJsD6cAH2PnPHqtbGrGtEfy2y5Ry/St5Mu5vLf5Cl9QdznL1GwciKy8RTY1MBLL31jtpM38JTMA7hG5k186ckcO/hPrtkUkADZedySY2sv+dEKqBsFF9Md7pqvpmfbWp60adzV4cN0JY+b23mjWwJUlT+OBYXA1u+/TKU7/ZnMVojRUGvomI62akowML6mgzEg7RuZXGJgoguFrNVJQcbd+ntD72QpePtT+Ff50WLrzP5MN0yoRKZyotQziom62PuEDBuZzJWjNMnB+KdNEJtn2fy+ABwHzn6t5sP8yuU3vgYnL2uv2jJwa9JZB2trSxNTcVDCtbhRoRTfzFKLkUrW/8bNLXs++DpU+3Nw74mtQJVTzDP+A6DvZDdzNtl29bYVlzC8+lARGImnrkKQJ5IAf6EoOlfpG/aWnGSMHBTpR36P6DFY5jO3MEmJf+vcW11DBhIF0i4+2YB4YF8nMDm+Gz6QMkWbTk/Vi9MCR3Pr0fT+EzA3xzEeprPXJkdBCcH3E99H0sFbrnkAI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2560.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(16526019)(316002)(52116002)(4326008)(186003)(8936002)(66946007)(6486002)(5660300002)(31686004)(36756003)(478600001)(66476007)(8676002)(2906002)(66556008)(2616005)(956004)(53546011)(44832011)(86362001)(26005)(31696002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ZUJjNnZXZmRXbzJJY0cyL25PRDkxNitSTk9tRzFWYzJPVHdlNjV0enI0ejdq?=
 =?utf-8?B?bk1sbCtMaVkvb2JUL0poc3ZHUHRSNUNzODZqWS9xSEdsdXFlcEIzdHA5TThQ?=
 =?utf-8?B?Q2p3QXk5MjVKZnNEcDd6Y0N6UnNrWkhwZ3ZUd0RRWEtaMEJJNWVQVDVoZUF1?=
 =?utf-8?B?eVZkNVQyamEyTjJ6R3lTNng3MkJJLys0UWlZaWRHVDh3RjduVU5JS2oxSWtw?=
 =?utf-8?B?eTNIZ0hET0JzWlAzL3FLWVArNjRyZCtQUCsxLys3Z2VVLzM3S01LdmtDZXp2?=
 =?utf-8?B?aGxoRVEra0dGSVJRd1ZseUphVHIzcUJ2Z2FZdjJVVTFWOXV0ckFTL0Zoa1hQ?=
 =?utf-8?B?bWVTYlJna1dZcGlUWnorclFaczB0cFdUTlFldXF0bFhyR1M2ZFZPajREUi9m?=
 =?utf-8?B?OEtxYXRjc1hsMG5abWFhelZZQU9lS3hENGJyaGxqY2REU2d3WlhQQ1lad2Vu?=
 =?utf-8?B?TXZMMEZHYzZPZFJvUnlYSnppU3B4NHVNcm00dzR3MEVQQ1U4SXpGWUxLN1Ft?=
 =?utf-8?B?WDZRUXNDVWE1V3lXb1VZWXRuSnlqKzE2NXpNOGRsVldvZCtLMDVIVWphT2hk?=
 =?utf-8?B?aFZWUTVIR0pGL1E5Ui9XbjNvV3V2eDdSUmdlcndVZloyMThXdE8xbjZyd1Rt?=
 =?utf-8?B?MVFOVElONFprcUpFcWFac0t1Y3ljMFhWN0t0WEwvLzNFMk9TaTRDSE1TQzBX?=
 =?utf-8?B?WGRsc2NBdTFTTDNxZitaV09HdnRKM3JaQTZ5Q2tqNmtrZW9sNGxKenM5SXVh?=
 =?utf-8?B?NmtybkxiZlZSK1JDcjl4eXliZ3Yxd2p0Nk9VejQySmJ2NGJsbmZSQ3pnU2Yy?=
 =?utf-8?B?Um9CVmkyT1EyR3pTdDVjZm13WVNzWFRReCt0QWxtK2ZpQlZDVmMveElyWDRJ?=
 =?utf-8?B?WFNRcUYveGo2VmtIRnRMTWozSXhtaGdhNERGVjZNdlQzaVJob1ErNXN0bE02?=
 =?utf-8?B?ZFVjVjBpT3VqTXIyZkdCZjE5NDlRUEN2bkp0TVN1aExIdEExQk9BMTFhZmVX?=
 =?utf-8?B?ckxZQXUrS05UbVlMNVRMWTh1MXJDMi8vTE5aVlpMOGlhYmpxWUpGYzBWN1la?=
 =?utf-8?B?dDd2NHRjRXNtbjVJcmlRMG4zdTNSNU1vdStJYklzdGNXdXk0Rk5UMDFsbzc2?=
 =?utf-8?B?MjhXSWcvVXFqd0VzNUlab3kxUmpTbVpvZDRYUEZvcC90UjZYVTBVcXprbmNR?=
 =?utf-8?B?UDU3clpCeHJlL3lRWlFxUEVPRVF5K081TTZUcFR5UzNranM1RG0yS3JjMWRH?=
 =?utf-8?B?THZtN3JLWG1seTdPU0VZNW1PSXU1c3RUTXpkYUxnTjk2T0d1WW00SWF1OWh0?=
 =?utf-8?B?UklUcDZzQ1UyTUt2RkczVU1wTXRxVVI5QkNJNDhhejkrQWNhUlV5Y3B6ZS92?=
 =?utf-8?B?Rmp5MXoxVmZtUDdmNXV5UTdpbUNPYSthbTJlK3hiK3RnbUlHa0lsdU9vVE0z?=
 =?utf-8?B?T0tVYXByUnplOWQvUkU2YXMrZDlQQWlFbk50WU1wYVUzSXFtNkVFZDdzZUJx?=
 =?utf-8?B?RVo4aVBGMUJOeWMxdU9VdUhMMzBtZFFEUUE3WVF0UkhGaTlLbXJyQ1FnQ1cr?=
 =?utf-8?B?eFdFdkh1VDEwdktIVHpaVHN0MWRJeitiWlJkQU1ERWtIV0R1ZkJOMWNvQTh6?=
 =?utf-8?B?SEFQNS9maVVPSjZZOWNwbXM5enh6R2pXYjJ4bjRwaUp1OFcxS2dMS3duelV3?=
 =?utf-8?B?UURsSUhVN1M5a1VkMzM2eWE4NTJNWHRnNGE0T2pWZEFmUXdkTEJWMjFKRERS?=
 =?utf-8?Q?yZ4ce/I0RGIcnpKkhvKRj4O+H3YoydfFNC7cWFf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d8b1618-62bd-45a1-ccde-08d8de5b02e9
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2560.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2021 15:42:55.6025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OJcvnZoZe4taUf8bREGEboHqMpzaKsnBqqv8p7a8pMZLvmEh2EvzqnzSH88L+UP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2462
Received-SPF: softfail client-ip=40.107.93.52; envelope-from=Babu.Moger@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: pankaj.gupta@cloud.ionos.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/3/21 3:42 AM, David Edmondson wrote:
> On Tuesday, 2021-03-02 at 15:20:00 -06, Babu Moger wrote:
> 
>> Found the following cpu feature bits missing from EPYC-Rome model.
>> ibrs    : Indirect Branch Restricted Speculation
>> ssbd    : Speculative Store Bypass Disable
>>
>> These new features will be added in EPYC-Rome-v2. The -cpu help output
>> after the change.
>>
>> x86 EPYC-Rome             (alias configured by machine type)
>> x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
>> x86 EPYC-Rome-v2          AMD EPYC-Rome Processor
>>
>> Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
>> ---
>>  target/i386/cpu.c |   14 ++++++++++++++
>>  1 file changed, 14 insertions(+)
>>
>> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
>> index 6a53446e6a..9b5a31783d 100644
>> --- a/target/i386/cpu.c
>> +++ b/target/i386/cpu.c
>> @@ -4179,6 +4179,20 @@ static X86CPUDefinition builtin_x86_defs[] = {
>>          .xlevel = 0x8000001E,
>>          .model_id = "AMD EPYC-Rome Processor",
>>          .cache_info = &epyc_rome_cache_info,
>> +        .versions = (X86CPUVersionDefinition[]) {
>> +            { .version = 1 },
>> +            {
>> +                .version = 2,
>> +                .props = (PropValue[]) {
>> +                    { "ibrs", "on" },
>> +                    { "amd-ssbd", "on" },
>> +                    { "model-id",
>> +                      "AMD EPYC-Rome Processor" },
> 
> If the model-id isn't changing, is there any need to specify it?

ok. Sending v2 removing model-id. Thanks

> 
>> +                    { /* end of list */ }
>> +                }
>> +            },
>> +            { /* end of list */ }
>> +        }
>>      },
>>      {
>>          .name = "EPYC-Milan",
> 
> dme.
> 

