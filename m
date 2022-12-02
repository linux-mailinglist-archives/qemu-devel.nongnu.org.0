Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7DC640D02
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 19:23:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1Af3-00026e-4Z; Fri, 02 Dec 2022 13:21:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p1Af1-00025k-Dx
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 13:21:19 -0500
Received: from mail-dm6nam04on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::62d]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p1Aeu-00039D-Gm
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 13:21:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E2WQKw+MzIylEXQmPhnf/4W8M6wgI+baxH74TxpwJerlF7NBl6UvdRlJp/zRn3djoEm20eVDaAVrPqsOC+AMOnZZg/vXJL/tc+ft2+2SEeYfgbNClpIwpg5CnPx/01vDzOWy+TisrR8ZhZoVU4zi+8/fT87gJTMYSsLd35r+Yx1B+Z9VT6hdc7AyoIvjQ75fb0UZ5x1SYCiRE6vs9XPgeLAFnZrCqycsxTys/mz08MRz++Gy+8f7MgCC8PE2ScwQfVZQrpV2P/R7xdw2hF066sKTN6XYVMNDDuXm2kqY09qN8WAzJx5PmkZdUkWlNzqZFyceFiROODORuExY9/gKBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BZ69CHRlfdN4I3hVCpWV/lfxUwjlocGG+HP+RS/t750=;
 b=Ndsh+Rr4Kf3tHUiXKYoDLTZZzOP0IX3RrTgpKXkN7lh460Gs9UgHiSSG4tyJ/8gGeKrdSiib7hhCInGGfJrK2tc0nsNf7Dw2IQ2UFplrxmiIrwwBXV3z+4YXkQIY7fDRQW4Oi9pLfkxJ/Ho1HTUVhfA3yhmol9AxtO2B938FuOBD6IxVARgT/slVVI53wygY+NC9pTxYcOaKomYBe5eZD2yz+otRiD2AUabp1hq+05rOO82yCtasqsAbCC2EEdcz2p1Cjsgm9xY8FngunCXFLk3RWYv7raFVsTbcb3zK7+kD2peOQT08yi3/PvlvOs6dXRVfe7cSN9Pcg2GK7vjJmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BZ69CHRlfdN4I3hVCpWV/lfxUwjlocGG+HP+RS/t750=;
 b=m+9KqDxzbXRY3uJpnKd6PLAHXlDGcjz2bHhvgo7K0v3ht940wXnhoTbQqyQyWPrBsqkZ3/Ex3FvEItsGVkUVjtlGbQ/ScHxiw5xVvvV3wPbyXWhc4gvaHRqAfB7IuvuAwQeride1Zs9HTpSupFa0tsUggcMNaNMdFGjtRA72aPg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10; Fri, 2 Dec
 2022 18:21:03 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::b955:9b0b:3b7e:40bb%6]) with mapi id 15.20.5857.023; Fri, 2 Dec 2022
 18:21:03 +0000
Message-ID: <2864aede-36cd-c55b-dc51-71f7ce40017a@amd.com>
Date: Fri, 2 Dec 2022 10:20:59 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and
 error_setg_errno
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: qemu-dev@xilinx.com, stefano.stabellini@amd.com, alex.bennee@linaro.org,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-8-vikram.garhwal@amd.com>
 <e7922267-9a87-8936-942e-e73a789672f9@linaro.org>
 <871qpitcdb.fsf@pond.sub.org>
Content-Language: en-US
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <871qpitcdb.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0228.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::23) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: af8f74b4-2cc9-4e70-f064-08dad491f7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L8YVxEvpeVVY6otBec37zqgODdTIQLgflo92hPasglVlBiRZej4ZP/MsYJd27Df4kj1mFW8fSyu6yux13Q7GRKcC+ZaVKPYpsx86N5YZNTMvEwmvSkt68hENJwpXMfd1ybYvCYdDt/E1Ig1EpJJOdUhE4Vnd0IxjEOZ81mPMmc2o0ddhbr3eEgXGRTQD8Qkf+6ax8bDrWsFa9lnC3CyHzlNzZTU2jrFEY6Be2f6u9suFnrq7DVK0gt99QXEpce2HwmLMuZ2cutsSimyP1J59ncuUo3X2BpcREPii1TWCJi/bzmRJL/vhozi715UeLZJXRMdRVlDlohNiyYv/9VLOpcj+0plf6Bm7X2Is3osDcwsuINKNszqQxL8/WetPFXJiDK3bzOBfSBcdFY3ovEdHsBBh0vqHpMzKU/aqmewGHUS7/XaC0/YZQyf8JNX01A20aLj3yrKpVUHzcYqlOTUnPMIw7twC70SZTwsJqVESzU2Ln0IiVZVGSDg6ZRIyXOvzyTohZFPzEFigUzLQEf8LFSbOmYYGp6XsnTvZISX+B5sfBTv7WD4kRmrbO0CiggrUUVOvk1i+idzFVGy/BRrS/8DVog4MfaGrs19hH0iP5ShfM5xt4+mZBAvLn+W61bb/OO4nDEoSuvI7AtyvqV7P/1/0CbdecFR1Evcn6Gkv1WSNL+oDxtaa7fYLAibh/75O8gmdFW81uOAVZVWvjZC6LkMbjrnNV08+xHoPSlWGF5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4409.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(346002)(396003)(136003)(366004)(451199015)(41300700001)(44832011)(31686004)(5660300002)(6666004)(4326008)(110136005)(54906003)(2906002)(2616005)(8676002)(8936002)(36756003)(316002)(66476007)(66946007)(66556008)(26005)(6486002)(86362001)(38100700002)(478600001)(53546011)(31696002)(6512007)(6506007)(186003)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVdibzg1RGEvQkVpaWZjZEluRHB3alpKQnlWT2UvUUZuY1Y3OU9rQmhWV1hV?=
 =?utf-8?B?dkowNHFkK0psMVB6dGJqam10VlVsS2IvaWI3dzVFSEhFT3h3QzUxN24zZDJu?=
 =?utf-8?B?QUc0WUg1Um1JSWJSdGVrdlNLZzJ5OHYrVkt2dTJQN01OVWZBVzNCbXZ3NUZF?=
 =?utf-8?B?YUdtcExYVHRZdFBLaW9uQm5xU1VUYU5MSnUxVWt4eHh6UndhcVJMM3JGZGZO?=
 =?utf-8?B?K1RYUk1QR29tOFdmbW8wb213cGhLUWRxZklDN1B6a293Vi9YYWVlQzRzREth?=
 =?utf-8?B?cWtEc25BaVFjTmdrQWt5YVd1RE1jNzZWUmI4dnZoWStSQ2dKNmpOYy9nV0xV?=
 =?utf-8?B?UkNXa3V6eUxSYlNVRzBnT0p4VkRnV0hnOEFtaHVZRmVRYU5RZitDQmo3RXpL?=
 =?utf-8?B?UlJseEM4L1VETVdvb0k4cWQ5RzhvUy9nS0RDcEJmZVdFM3NxSmY2MUZyQkx0?=
 =?utf-8?B?K3VIaytwa3RvWmQ5ZWhpbjhLYjVKMkQrbitacnIxbVJUd3YybDdQMDJjRjVm?=
 =?utf-8?B?aGJsUjBpNUtpK0JaWDVQU0hNeEFHSmJHUE9JMHBZZlExY0pCRnVaYUM2NXNM?=
 =?utf-8?B?NFlwQU1QREZsTENDTit0bDh3MXZYUW01WHZUa3VNVWRiZ3hYSGFZRUl3dzVx?=
 =?utf-8?B?aGxIOExhQjJmTzhFTGNoV0NaVnhVUnBwYjY0b01RMDRvM2U5OTZLMzZoZldo?=
 =?utf-8?B?ZjJxeDY5NjRrMWdiSEJpaHJTdEtQdGkxVjBzTkJETGZ5citYbXpkMUNaTldJ?=
 =?utf-8?B?eHBwZEVHbDhaNjRmN1FiU3B5RTlVV1d1U0VtU1dQckdFZW5XNUY2dTN3bElR?=
 =?utf-8?B?b1JjVXpSdGN2UWVTZnFqaVI2NjJNTkUrSFRTMUF6THpmRHRTL3N6c053bDRo?=
 =?utf-8?B?VWxzS0dra2RNWEg2NEQ3QWZNNVlXLzJoayt3N2tXT1VubFB0M0ZUUytvQTZm?=
 =?utf-8?B?eHNCaW1DV3Y1VnNtbWdJRkZJNE5qbU1FdmFLYSttWHJSRCtNYXpLVmFtam5Q?=
 =?utf-8?B?ZXhONlNjUVVBZzVPMm9weWNwRVF0VHR5VUMvSXBMUG92WXNRRmlKdG1kUzVm?=
 =?utf-8?B?REdWZVpJbU9INitHUGdFeFE5dnhkczZYdWdyNFk3MjZTU3R5Z2Z1bzhGU1Za?=
 =?utf-8?B?TW05UXhyTkNiSGV3K0ltRW9kMGpoUEJweCthUGNnQU13SFd3QW9Db0h3SkZ5?=
 =?utf-8?B?bGYrNktBNFBHVFpxcXZ3UHBFcVVwcnNVNEJ5UGp3bVdVelUyaEpzMjcyU0ho?=
 =?utf-8?B?R2xVYUlBQUlEays5Y3N4dXFYYURQRk83d0VWWFkrRUkvZmVOeEhKRnpmSkR2?=
 =?utf-8?B?NUNnbzVscWdMZ2grRElDeDZFVEczQnJ5WUI2Y0VTZTBiVnd6dDYzcXd4Q2JM?=
 =?utf-8?B?K2Fmb0s0aUtvbzAxdXZBU2kvSGhXam0wM0lmN09ZL3diVkQxMnJEUExIRWxr?=
 =?utf-8?B?d3B1cWgxcHRFU1ViaXJvVk1UOURSUU5hSVpiejZvUFZOVEc5Tm04S0Y3YjhG?=
 =?utf-8?B?dEppRjlVcXkwQVhlUjJXWUZjWnV0eEdtNklTRS9KcDE2Smp0cE5HTGY5a3Y2?=
 =?utf-8?B?MU9TMU1rVjE0K1VqL3dFb3pJaGg2aXllQSsvZXhsZEpUWGk3NEtqUWdUTTN6?=
 =?utf-8?B?ZkoxcjNmNldkZDhjd2VMMWpjTHdKTFFZNW1hSkNpUG5LN0pvNHhvdUZKRmVp?=
 =?utf-8?B?cXJxRzJlcXJXUnNQSjFFRVE2aittMGFJc1ZOOUY5VGxEQnJVNEtqMkR4RmZT?=
 =?utf-8?B?bDMyMmlmazF5bzNHNkZmUHNCVXFpTmZtWTF3Y25WWWlGZG9FMlVOcGNYcE5B?=
 =?utf-8?B?UDFaUlhPWjZBMHJQQTZ0aloxSCtxcHhaQ1RpcVhCb1FIeXpqSkJMT3VUSXpG?=
 =?utf-8?B?b0U2bWw0SlZGQ0ErNHBJRCtsaTZ6R1pDN0xZTXZmd1RWU0pHMUlVTFcrdTNS?=
 =?utf-8?B?VXY2M2dyQzcyeFF6TkZWRXQ3OTNBdkFaRVNlenRDTXBsLzVjZ0lUcGUxQmZ5?=
 =?utf-8?B?REpOdC9Qcy9heWdZZDFjZWw2RDdPYUYyTFhTUDVvbGUrNzg5T1k2dDFGZHMy?=
 =?utf-8?B?R0hnS05kNXY0YW8vYXgwV3N0MTA2QlRORUZVVlhacnZudFArOTVqbDBvL2lq?=
 =?utf-8?Q?WrqKAJIzxB0CEfMXxaSe+ikfJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8f74b4-2cc9-4e70-f064-08dad491f7b5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 18:21:03.4491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Va47j+57Nkq+GudKZ52lRu+xkFUhaIQlP8JMdh+NBYQ46GDQKgtu8FToWor8pi4lkJTxm2ZYmAhteBD/qclIdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::62d;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Markus & Philippe,

Thanks for reviewing this one. Please see the question below.

On 12/2/22 12:53 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
>
>> On 2/12/22 03:59, Vikram Garhwal wrote:
>>> Replace g_malloc with g_new and perror with error_setg_errno.
>>>
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> ---
>>>    hw/xen/xen-hvm-common.c | 15 ++++++++-------
>>>    1 file changed, 8 insertions(+), 7 deletions(-)
>>
>>> @@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
>>>       xc_interface *xc_handle;
>>>       int sts;
>>>       int rc;
>>> -
>>> +    Error *errp = NULL;
>>>       unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
>>>    
>>>       if (xen_dmod) {
>>> @@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
>>>               return;
>>>           }
>>>           if (errno != ENOTTY /* old Xen */) {
>>> -            perror("xendevicemodel_shutdown failed");
>>> +            error_setg_errno(&errp, errno, "xendevicemodel_shutdown failed");
>> See "qapi/error.h":
>>
>>    * = Passing errors around =
>>    *
>>    * Errors get passed to the caller through the conventional @errp
>>    * parameter.
>>
>> Here you are not passing the error to the caller.
> Instead, you're leaking its memory.
>
>> Maybe you are looking for the "qemu/error-report.h" API?
> Plausible.
>
> Also, @errp is the conventional name for the Error ** parameter used to
> pass errors to the caller.  Local Error * variables are usually called
> @err or @local_err (I prefer the former).
>
> [...]
>
IIUC, error_set_errno() is not okay as it needs to be called with errp 
from caller. But error_set(&err, "") is okay with locally defined **err 
= NULL;
Is that correct understanding?


