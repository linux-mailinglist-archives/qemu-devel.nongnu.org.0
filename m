Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C784444F2
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:51:43 +0100 (CET)
Received: from localhost ([::1]:34534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miIYA-0000bC-Q4
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1miIWk-0008G3-U4
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:50:18 -0400
Received: from mail-mw2nam10on20628.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::628]:1472
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1miIWb-0003U0-2z
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:50:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr237fumonEpkXqI8g37rvBeMZRXWV3XXV2r66+b+WKoA/9lWl8lbelSLdDwtkrgTzU3jUkCY7sSci/uFzhjJJY1bIOeHHlHr8ccWI9zi4Iocn4KfkIRnuCKXeq9CVu5aKdyqTQvPIAy32uaRJFTX5/jnwoHytC9PPEtlIgZjplxLhu4W2F0VW2X3RapJIjxJL6cwVwo97H1Imws0kr7ZZgIx4ZwMEAjBGjoq6xblPrweJKRueD3gTh+4M2PWRIy1HQ1OAxOxT3akv7kZviZA2U8MpQM3uB0Zxm2AqiXKZ7nBhCIDCAdtvYq3kUncx5CiDBq5fv8chv0Xs8RzD9s1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcsplQEZcAaQNVpKhRrRX/B1kbwIb1VO2M4zhSQZCx8=;
 b=DogoTCgwizX0C6BpO3+N227JpuOfZkQlfsbP4Lg3mj67IwviFzeT/L8xSPI26Hx22jNq42wrXaTMDXUftJXBjHUHugFvgzw0nFtOOrRpxZ6llBaEFCifhiMZFcb3qkFU7YOTMHeAmp6sYOOyauOEoHTW56DhhTaUjfuhhF2flHH/jS3zvHZfH3WK13W264GZR37Rl56Y1EHIpwIJql3us6PEGpAjoZSmtzcbcrAXQURku4cSM4jPWhC5ls+yJNYM6XVI5z0Uo993UyGUfRMjLsxxg0bKDNI6DYex0Ty7cvt+8namWhK0VfTnKMy0q9cWGGF5DwYYPH+Heq6MQNq/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcsplQEZcAaQNVpKhRrRX/B1kbwIb1VO2M4zhSQZCx8=;
 b=pl53NJEq4dgXoGD9X16XUGi67zvJew97iIvYcp+v0SgjHORcmX9pNNXxId+RCG+9ezAE9h1zeZa4JhzWk/OMmtCRYya2Xyvhp5euEUwpv0x/Q/dBGgRCKpY2YizLHQkN49vpf5oVCdfZ9B1yrQrbuxap4CdCSvisenqnzdtfKCc=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SA0PR12MB4511.namprd12.prod.outlook.com (2603:10b6:806:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 15:44:59 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:44:59 +0000
Cc: brijesh.singh@amd.com, Dov Murik <dovmurik@linux.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
 <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
 <9e4c0415-4153-e234-7c59-872e903e6567@amd.com> <YYKX7kmDE71NN8Sb@work-vm>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <f2dce4c6-1dbd-4bef-ad90-4e176db9d628@amd.com>
Date: Wed, 3 Nov 2021 10:44:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <YYKX7kmDE71NN8Sb@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR13CA0013.namprd13.prod.outlook.com
 (2603:10b6:610:b1::18) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 CH0PR13CA0013.namprd13.prod.outlook.com (2603:10b6:610:b1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.4 via Frontend Transport; Wed, 3 Nov 2021 15:44:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706dd56a-7fa6-420d-2814-08d99ee0e440
X-MS-TrafficTypeDiagnostic: SA0PR12MB4511:
X-Microsoft-Antispam-PRVS: <SA0PR12MB45116033B03D939AF40AAFCDE58C9@SA0PR12MB4511.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /OmfLUII7uyHLMGeHiLjkLLgn1val5mBKM2laq2D1c7p1gd1EfiPj2XszZpGaKtuIUTYJfqaO+MCLookaiSddWCShtpXiWubiNeJB42CbgeSamQI5HlN6kNFmvwp6yjy3tRP2mabKJL2Ssa2qrdPsPl4JdzrtJdtJ07dpsleDLlwZ2AiP/1tN0+5FbpApdC6Lj2CBezpdOxIVl8e4nFQNU4/qVjcZ53HoNwXJUfrox5pIW2ldDkTlH0WP9RiVMMLN2r7ZhAe0UOZB9mRkqS7SqY3VjhFrTDdTXqFFAfMrvq/MZ78JziZ54FLOeBEX4pYWm2kDXlNNDoxjf1TEw4B8PI52zLU9ROSkKGsqU3tSxkj+PvwkMic3rYBrZW9rDD5GC0JOJv/Trb/a2bJT5uRC4QCr9uuH5M3cV/bKpT/v7pX5Hiwhvn1T1Zt7GRthl1Y/fIRgByPmxieXK9wg72keJsMqH2jacXN1YewpvivntX5T1iejHbbIie63cViUWIY+Hb41k52TF3t75sN2JFmHZcbXCXyE9kZ+nynQbd6S6VM3UwP56ZXqYqWNnR4P+YqJd79ZG9ZOabt5xvBCRUzaBYJWbsDkAQqx/29ZqSfEOIPRSN60LSWS0/U1KKnN7q2J6E/zu3yb7P6RGE4MCpDtGvzDXxWDXm4IO2bWANXYZamQkAVjomD0MS3VjzK+TqCFCbwojV9ZKz1HI9Xvi4ISa6yrK5mB/A+vjH6tRKsoVQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(956004)(26005)(5660300002)(44832011)(31686004)(16576012)(19627235002)(54906003)(316002)(2906002)(186003)(38100700002)(6486002)(8676002)(8936002)(4326008)(53546011)(31696002)(36756003)(86362001)(6916009)(83380400001)(508600001)(66946007)(66556008)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHIyZE9NaGE1cnNuNGRsNklidGlYWHhNczVHTXZVQ25TVXJLNVo3MU9JZm01?=
 =?utf-8?B?SytaL2ZnZWNNaWM2V0EwMERPQno5T00vQXhoOC93THZqWlpVdzdGM09xbk5z?=
 =?utf-8?B?b3ozVUcyRlBIKzIrT0F3QzRwNW9NbXg2dkt5R1kwM05vUXJDVTJOM0hibUFR?=
 =?utf-8?B?cWtkMi9RQ25BL3BvT3dZeCtOQVlGNlhGang0QWlHcUJTZWNxVFE5NXppOVBR?=
 =?utf-8?B?ZnBqTnBDYUs1cm1mQTQ0Y1ZCcEsycWFKc3dkcWhEdkhyMDd5VWdqQlhMWkh4?=
 =?utf-8?B?c1M4V3NCUnJoYzZhR0ttUTFOYk94TURkRkhjbnpyTVFtVC9kVFpJT1FkMlJP?=
 =?utf-8?B?RTZ3UUhoNW02czBDOUlJMjJ2Ykdza0lCRUhNZDR1ZXIrYmdSbkdPeGdRSVQ4?=
 =?utf-8?B?L2pUN0lxVlV5WTQydFFrOTRUNmZHM09zR3VoNERKYkhtd0NsZlhEc2RyNFVH?=
 =?utf-8?B?UEZ3S1JiT3BpS3I3T3BUSkdGaG93M1lxaXZyRldyZ3JhTnNycUYzMS9hVkJW?=
 =?utf-8?B?MXYxL3R5aDVhNk80RmVSMWxmeEZwQ3owckNkSjZYMzMvQW1IWTY0L3ZhMEFR?=
 =?utf-8?B?Ym9hVHRMUDJud0kxNnR0TmRZM1NUUndVcGtSWWxTN3ZMRm93RUtIeGdUMU9t?=
 =?utf-8?B?Tk9yQ242ZHRmdEF2cGN3Sm91b3BFWEprZ0dvMkxRZ2k1T3FIRzhGaEorVlhC?=
 =?utf-8?B?dEtPUVNRRnRVaHhKNHhoVWZCVFExM0NBVDRqSlZtU1lidUd4cStBeXR3d1hY?=
 =?utf-8?B?UzhiaW9LRkxWSFYxRFdTencwMm9MWW9rQVhmcUdNbklXWHJXT0tGWmMva1dq?=
 =?utf-8?B?b1JZMnNTemxvVXBPdTdKc2FLZ3JBd2pIZ2VzL1F0MkExVk9PMUlMS2JUSzBM?=
 =?utf-8?B?RE8wN2ViV3BpT1l5NkhoUHhsbE8zUlZoRlBubmF1VUlObDRoQXBUdkZVM0xG?=
 =?utf-8?B?ZHMvMHpwUEVIU0ZSeVdzVlBRVkxQcmxqTVNzRnhKRmZ3NHdXRUlrVlRiNzM3?=
 =?utf-8?B?ZkZDZm1ZWXoyUDVtcUdkT0tFQ3VNUUdha1U4VC9hdTJxaWZUQkR5RjJSSzV6?=
 =?utf-8?B?VllsN2pMZGQ4bks4WEpYMERUem1NMlArVWtHUlZWMVhHYmt3S3c2eTBMT0s3?=
 =?utf-8?B?UTNtVXZEcjRIZ084Q0JYNFIyNmpyOE8rSm5DbFZrUjlyMVp6emdIZHNhcndW?=
 =?utf-8?B?WnBybHdsMXpjT0w4RGRSeUc5L0NBa29QaVA1UDM2Z1lxaFBrbXpWQ3FFQnZR?=
 =?utf-8?B?NFliVlBBSG9tRU5kbnVNNTZxZFNuWW83bVc5MDN2Y3Z4dTNRTmJyTWFtcHVL?=
 =?utf-8?B?L2U0V1owZVhFc3JoNzkwZEpkN3BOOUdyK1pEOHlFSmRUaEV1VGNGS1V3SUlR?=
 =?utf-8?B?ZjB6WW0zZC9xVmludkJhUmVmczRGRkpHczNodlMwTGtQbnJnOGhqVzlXMU4z?=
 =?utf-8?B?ZnFpOE5UU0NaWlgxRXVMZ3pWdU4xUEdLWENrNEdqSmRVSEYwbEQ2MEhZazVa?=
 =?utf-8?B?eVNMaTg5S0JDTTRLcUFUY2l4YmF2dXh3aUNGN3drVlBGdEd5Sk9kdHpNMmFx?=
 =?utf-8?B?WmEvdkVrRTc5eUNUSmd0TlRpN1BkNXFhL3pwOGdHSWZUL21Ga2hYb1FhZ1pS?=
 =?utf-8?B?WkpYMDdNTjR1b1p2WGN6QnZnaC9WbGpibW0wODVDMzJ5bzB2MW96aE1kZkU5?=
 =?utf-8?B?N2pFR203ajVKK3lWOE1SWDhCdHBGM1hUUEIvNUVKeHR5ZEl2LzlTOGtPenVJ?=
 =?utf-8?B?cGhUdVpZeVF1VDRQcTFMRTRWTGxUeGRDeTV3VVNCR2VzRmZneEUwUTdFMVJB?=
 =?utf-8?B?dUlwME5FUTRVTzFFMHFwa1BUVWlyeTljdzFxUUljdFArUUNsckZRTDZ2L05X?=
 =?utf-8?B?ZlBMdTVBL2lkQ211UTk5Y3M3aGN3WEVOcm1XUXNVSXhZV2VFVDUvR2NLY3Vu?=
 =?utf-8?B?WnA3cWZ5eHduSHBMQVNMYlV0MVVjM3A0bFQvUHBWdk5Ba0RZQkFzUU5tM2xj?=
 =?utf-8?B?bm8vdU9mWkRsVGwxU2tmbmU0Vmh5VFBMTHVuckkyY1lkbkpYbkp5UTN4Rzc1?=
 =?utf-8?B?SEI2RGkwWS9kSlQwdVUxQXh0eG9DckZmQmRxZ2djdklPYlVhcWwvOElJa05m?=
 =?utf-8?B?a1JZZCtIcVdXblhpQnB0bHVxbUlpcVFDS1BWeGRDMS9EVHQ5elNDQU8za1k2?=
 =?utf-8?Q?AJtaypHD7kHqHxTeaAihzzQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 706dd56a-7fa6-420d-2814-08d99ee0e440
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:44:58.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7idqOiHiAvb0hKgdnFAeiTDEoV3WU7zPrr09IEE5DK83Wz1gx/ArDETKDFE2NxnYiZ0voiBw9PQ37LbHVHgjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4511
Received-SPF: softfail client-ip=2a01:111:f400:7e89::628;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_NONE=-0.0001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/3/21 9:08 AM, Dr. David Alan Gilbert wrote:
> * Brijesh Singh (brijesh.singh@amd.com) wrote:
>>
>>
>> On 11/2/21 8:22 AM, Dov Murik wrote:
>>>
>>>
>>> On 02/11/2021 12:52, Brijesh Singh wrote:
>>>> Hi Dov,
>>>>
>>>> Overall the patch looks good, only question I have is that now we are
>>>> enforce qemu to hash the kernel, initrd and cmdline unconditionally for
>>>> any of the SEV guest launches. This requires anyone wanting to
>>>> calculating the expected measurement need to account for it. Should we
>>>> make the hash page build optional ?
>>>>
>>>
>>> The problem with adding a -enable-add-kernel-hashes QEMU option (or
>>> suboption) is yet another complexity for the user.  I'd also argue that
>>> adding these hashes can lead to a more secure VM boot process, so it
>>> makes sense for it to be the default (and maybe introduce a
>>> -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
>>> measurement from changing due to addition of hashes?).
>>>
>>> Maybe, on the other hand, OVMF should "report" whether it supports
>>> hashes verification. If it does, it should have the GUID in the table
>>> (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
>>> it doesn't support that, then the entry should not appear at all, and
>>> then QEMU won't add the hashes (with patch 1 from this series).  This
>>> means that in edk2 we need to remove the SEV Hash Table block from the
>>> ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
>>>
>>
>> By leaving it ON is conveying a wrong message to the user. The library used
>> for verifying the hash is a NULL library for all the builds of Ovmf except
>> the AmdSev package. In the NULL library case, OVMF does not perform any
>> checks and hash table is useless. I will raise this on concern on your Ovmf
>> patch series.
>>
>> IMHO, if you want to turn it ON by default then make sure all the OVMF
>> package builds supports validating the hash.
>>
>>
>>> But the problem with this approach is that it prevents the future
>>> unification of AmdSev and OvmfPkg, which is a possibility we discussed
>>> (at least with Dave Gilbert), though not sure it's a good/feasible goal.
>>>
>>>
>>
>> This is my exact concern, we are auto enabling the features in Qemu that is
>> supported by AmdSev package only.
> 
> I'm confused; wouldn't the trick be to only define the GUIDs for the
> builds that support the validation?
> 

The GUID is hardcoded in the OVMF reset vector asm file, and the file 
gets included for all the flavor of OVMF builds. In its current form, 
GUID is defined for all the package.

thanks

