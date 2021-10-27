Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FF043D1EA
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:54:22 +0200 (CEST)
Received: from localhost ([::1]:52812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfp09-0005pF-Gw
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mfouU-0006L3-Gc
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:48:30 -0400
Received: from mail-mw2nam10on2060b.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::60b]:22752
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mfouP-0002by-Vo
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:48:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0UqU6V5zOGhvQyop8dW0dXrQ9TJZE1EGBxKrMdpLxiGYi4wS0o+67ifsJhj1Nj6mfyQJ5JrptSglBnmUyNKtbSp0fPbOBJyPadI6EwNygBEdI7P58ioFwnTeUgM14OQ6dkHZcFRqB1kPqIOP1EzpDA8y2deKC1JlPRq/CNF02BFx9xbwhoJrO2PC8CTochWZ6TvzGQbsY22zp1QEctHhn0IeAdrIm+S6a0kHwzuRkPu7dE1TMI+rIDrLRR1KzKQlRGLkrIs2MHHb/w0J1eAA5A/K+TrXxDUHr5pU585wMMc0xYQcV8Ly3cKIWXUr8xSHHrwWCeAoVgX0OsXiuHkHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frSLzDC5FeWJFHT8/iFF7LpkK7fDB8AD7U8i1INu0Wc=;
 b=KNMq2z/7UIL14i++kOVLhctTqv0pg/6Wuf1MGTohOg13qfQNxYtSe/1IgOAcAbehQhyc6xDr3griVBpAP9moIR73okflvxfGN3Sa4vtkt1g5+CVaxdC28jOQRRjFJTUu5CW+neUEv5Yo9UVP5AB2vQDhy/BMNlfCS5e/vVOvA2jCNGZwi8tEyM4Rt85eoRzkUclf76FK1DOGkgE6at1kvfO/4sPaz8/qhDOHd0LRr6mR064sd7bGrAz+n5cX0Y9sdxmSrCAYc8Wj3MO0AdEriWKdV9qwrn65cPe0o+4Eimi+8oubeebAb6U/Zl+fuiv7j1fzAG2hnRfy3o8MEnv8ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frSLzDC5FeWJFHT8/iFF7LpkK7fDB8AD7U8i1INu0Wc=;
 b=omEtycCVdjxbyXe15Nm1hix6RLCngAQ+FBqo2a7Afh3OHht96zjneIOQfW8jU3BgWY26Iv1xTkRPZaF6Iry5VnAXhDOEUkJtW9R7tXbbHisGVtDnoSPzcXIceQ0VjgeFjuYXZo8UhAnoC8/6OrlPcZorR/dSKtNTYrd+vWi068U=
Authentication-Results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB2639.namprd12.prod.outlook.com (2603:10b6:805:75::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 19:43:18 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 19:43:18 +0000
Cc: brijesh.singh@amd.com, James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Tom Lendacky <thomas.lendacky@amd.com>, Dov Murik
 <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
 <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
 <9474f5d8-68c5-606b-a123-419556afe5d4@linux.ibm.com>
 <c94afa49-fdfc-0f33-a4d8-2a9c30dd7812@amd.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <001dd81a-282d-c307-a657-e228480d4af3@amd.com>
Date: Wed, 27 Oct 2021 14:43:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <c94afa49-fdfc-0f33-a4d8-2a9c30dd7812@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::19) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 BL1P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 19:43:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d2e80e9-925b-401e-9063-08d999820606
X-MS-TrafficTypeDiagnostic: SN6PR12MB2639:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2639BADA5C4A72DDB93A0BBFE5859@SN6PR12MB2639.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B5M2T6npP93QS5ZO4VYIpALEriTT+LOXc7ew5Kb8n7jexfNOitYHFJ7/n+xwbRAHZf1zchc/DuKnyF7EqVQqeb/IYyDMGbg2JNb5DbNaILR8oyPO1LlWDnnM9IxGZUe7sGx6MdZcJPoKGZHO8VCM7SbFFCQQHFolsFHaV0VSZcuwqNS6uGU22xgSJ3qHZTOZhaCzv8X1HwIVS33G01RYtci1plZ7G51LoxEuNl5T6OEcTcEG7Vk1TVDo1MKqYuguf4VcuAaifs7f/OF0Ykipfq9Q+Q1TgeSAkI4ObtdczYmtEkxSuwDkewKkEnXlXw7N1TQuHtziJBPkXlUPB773YsEgNWfdNXX0t2XeWRG12Hzc8WIn6GUxhOhwVVn/XrxPia1FofnBwMfQzbdnN+jOtB7gYtz3Ki7sBzoxOSG8MT91DRXQl8yDB1yh15hPtvBOxRB1IwJSyGKX6RR7EcT3Dt9r3kdtvASYNKQsyOVG7ZRQzpBZeE9blLoLMQas3d/yl/S5IP7jxmPn70URQ17p082iEVKLVDLFUWpRlTyzrdR2GDfS+4wN1VLSwkhjYCNEgr53E110AVxC6BPtL9qOaLPRfCYfyX6UskijtdL8L8YEjsjR/1kB+r7Vq5JwK8hQ7CmyoAabb4CCRE73YyfeB+/Jbxjg3wkmFrrkvO99yydHHgAmWog3N3lCXauUlGq8sm/v4/d0zGshTHuHm5EVsjhWtkH+0GuYE0ctT5DeiBI5L5Y4jOLLNuf8lWk0TDJq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(66946007)(186003)(956004)(7416002)(31696002)(8676002)(26005)(83380400001)(4326008)(66556008)(31686004)(53546011)(6486002)(66476007)(2616005)(44832011)(54906003)(6666004)(36756003)(316002)(110136005)(5660300002)(86362001)(16576012)(2906002)(38100700002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWNMbzFpZkkydGdNOFk2WTJ6SkZYTmF6RnZjdFA5WGlwUTEzQmtsMHJEQVJi?=
 =?utf-8?B?RjlmdURBVkpBQXZqUU9qYzFFc3dZWVdWSE1JTm92SkVvUEprQjdOZGM2d1pz?=
 =?utf-8?B?em4xRTFwd1hrdFVSSUkzOWZMUHF0TGRNVjdnNzkzc2RRazRPcTUyK2llNWRi?=
 =?utf-8?B?aFR3bjZBUlE4ZWh3TlRoaGRRNmErNE5lQ3RmQTd3akpFK1pKS0x3a3ZsVEJa?=
 =?utf-8?B?Z0RKU3R5YW16TkhpN1lWY3hNRkZwdnYrZWIvektHd0drTFEzSzVCYmpraEZT?=
 =?utf-8?B?b2pqTGlydGRrcmxTMFdEWXBSbHA0dlpBTEhsOERmVVRtOEV2OVRjZzE4ajhT?=
 =?utf-8?B?Z1lhQTZXUzhTSkhKaXUrVzhQZ3UvZWplMzRRMWtBYXgxRDdvQkV3M3cvSE1U?=
 =?utf-8?B?bWc1blpyTytZc1lIazFKQ3p5NTJZeU91c0VUYmxtSTYzOWYwb2FPZ0VlWHZB?=
 =?utf-8?B?Qkt3K2xjOUhOTEZ2MnVWVmU5YVk3cU5paFB0c0g0K2FXL3l0eWxZTC9DOE5H?=
 =?utf-8?B?cWZaZ0VYa0JoVjlVYzNZWmhVRzJ0aUZhRjB3ZlFXRzlzUUJ5VzhMdWwwcXVu?=
 =?utf-8?B?OWlWejlMSjY1dGxtNkJ1UUg0aE0vNUlRZ082b3U1VzhnSUFvNmF1WHBTcHl2?=
 =?utf-8?B?czJsRGpHa3FKbE9xRmJsdFZNMmllOWx6YkJmcncxdnoxWFh3TnBBZVBhZjRw?=
 =?utf-8?B?YnhYb2pQSHQzRDNNRUJEUzZEYzgvK3JDY3VMWU5kaWJBQ1p1NnRPOFgvOGIw?=
 =?utf-8?B?Mm5vZFB4UmNUNTN1QWVwYnVHYUg5UkQ4NFVQSDlsY0l4bWNTYmY4UndaazVm?=
 =?utf-8?B?YjFVczNaakl0RjA0TXUrSkdZaHppMXordkhxU1FLdXA5VjdvVUtUV09NaDIv?=
 =?utf-8?B?WVZQd0Nia3lrY2VWL0F1WkJqUnRkcWRvWC9LQkpMTEZ2MThWeE5scG03aTMy?=
 =?utf-8?B?ZkdBTHhnVTN1eVpmaFpSTmxwamkySE5MZzVFMFJ5T2Rra1RWRmxRS1pwaitx?=
 =?utf-8?B?aGVmcWRoYlpLT2p3Y3lnN0RPODNQcVBveTZSaHBSWTZmY2lDcXVKNHRWMnJj?=
 =?utf-8?B?OVZKemljUXlaYlpXRUhoNXU0RVBCVXg3REtheU9sOVc3QyszWE9LcDNiYktq?=
 =?utf-8?B?N0F0bUVoZnpQQ3NUZTQrK003c3FJbDVsR0R1N3FJOENzYkhQWmwvRHdPbUow?=
 =?utf-8?B?OWFvVEFGcVpod0NlMHBnZzZUVC93a1lMVVJBb3M0YmxVTmhPaUVWVUVJLzhC?=
 =?utf-8?B?Z3VNRXgzWk1oU0JDOWZna2VtQVgyUUE0ci9pOWZpZTBLS0hUdlAyRVJFZlVt?=
 =?utf-8?B?dkR2cGZLU09xTkVqS3NRN1NZTzhPVWRSK2R6SncvbER4RlVvOTExeU9VOGRB?=
 =?utf-8?B?MUUrS3hNRzBLaFlhb3RDT1BTOG5EaXFQdm83WG5EOUNRQ21UZTNZK011UkhZ?=
 =?utf-8?B?eWVmbHF2U1dnemd2SWdjWWtoeTkvSUpDK1c3MGtBcGgxY2YxYUhIWTMwMFZ4?=
 =?utf-8?B?eTJkUGlLQW1GVWpCY1U3b2lIMUhYeENuWlFrQW1mR0JnS2xqVGczZ3VrbDdG?=
 =?utf-8?B?WlRtTlFNZ211MVArNUxUWmJ4WGJiTW53bDhoTmdLVGswclFWQ1lQTEdJNGo1?=
 =?utf-8?B?djIvMnYyMnFaOVRXR0REeHIxOWR5R0dTdWJIOUs1YTJKU2daWjVjY3lXZTR0?=
 =?utf-8?B?bThkWEwzWHBiMEZHQ2tndjF4SGFBNjJFQlhoUnB0b3VuZEo5djRpNVZpZE41?=
 =?utf-8?B?NG11eld0dm16M3hyL3pqVlhsdzlYNHZTVzZCZGxWdlJSaHBCYTZTZGFsSkR1?=
 =?utf-8?B?QXB0QTRyM2NyVHhZQmxYTysvUEZlSExUcldCaHIxV01yL3kzdmtPK1NFVnFV?=
 =?utf-8?B?S2dHaXVJOEV1Q0Fhdm05aVRsbVB3ZU9ybnpOd0NSSGJxMGI5Sk50SkNPYmg5?=
 =?utf-8?B?NHgrUmg1MnVDMnNEaVJUOEtZdzNRMGRHenhwVms5QVc4ZjMwNnRBTS9WaUxh?=
 =?utf-8?B?SjhXR2I0UEhpUUVwMnp6V2J3clpVZnZJd2swblYvTm9FNGNYeVVHZTRFeDBR?=
 =?utf-8?B?OVQrY2xrWHd2NktrRFFuZkdpQ01qUTJTcWk5MXpWZ2Uwd0V2d1V6MWVDOWlr?=
 =?utf-8?B?R3l3NFBQczFMNFBqeE1vWmJ3WTBGS1g1NjZJMUprazRzTFltL1VwT3hickcv?=
 =?utf-8?Q?KNP2G9nKpUjZQDMJDviXMcM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d2e80e9-925b-401e-9063-08d999820606
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 19:43:17.9195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpoClDowq7sEIykkAV3IECVg6oYGP4ovN75m1LTG+0ByUgtPDA4w5DL/MZ9sxJMcluZIlpbcN3ND4Jzh3GFr8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2639
Received-SPF: softfail client-ip=2a01:111:f400:7e89::60b;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.847, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dov,

Sorry for coming a bit late on it but I am seeing another issue with 
this patch. The hash build logic looks for a SEV_HASH_TABLE_RV_GUID in 
the GUID list. If found, it uses the base address to store the hash'es. 
Looking at the OVMF, it seems that base address for this GUID is zero. 
It seems that by default the Base Address is non-zero for the AmdSev 
Package build only.

Can we add a check in the sev_add_kernel_loader_hashes() to verify that 
base address is non-zero and at the same time improve OVMF to update 
*.fdf to reserve this page in the MEMFD ?

Thanks
Brijesh

On 10/20/21 10:26 AM, Tom Lendacky wrote:
> On 10/19/21 1:18 AM, Dov Murik wrote:
>> On 18/10/2021 21:02, Tom Lendacky wrote:
>>> On 9/30/21 12:49 AM, Dov Murik wrote:
>>>
>>> ...
>>>
>>>> +/*
>>>> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted
>>>> guest page
>>>> + * which is included in SEV's initial memory measurement.
>>>> + */
>>>> +bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error
>>>> **errp)
>>>> +{
>>>> +    uint8_t *data;
>>>> +    SevHashTableDescriptor *area;
>>>> +    SevHashTable *ht;
>>>> +    uint8_t cmdline_hash[HASH_SIZE];
>>>> +    uint8_t initrd_hash[HASH_SIZE];
>>>> +    uint8_t kernel_hash[HASH_SIZE];
>>>> +    uint8_t *hashp;
>>>> +    size_t hash_len = HASH_SIZE;
>>>> +    int aligned_len;
>>>> +
>>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data,
>>>> NULL)) {
>>>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash
>>>> table guid");
>>>> +        return false;
>>>> +    }
>>>
>>> This breaks backwards compatibility with an older OVMF image. Any older
>>> OVMF image with SEV support that doesn't have the hash table GUID will
>>> now fail to boot using -kernel/-initrd/-append, where it used to be able
>>> to boot before.
>>>
>>
>>
>> Thanks Tom for noticing this.
>>
>> Just so we're on the same page: this patch is already merged.
> 
> Right, just not in a release, yet.
> 
>>
>>
>> We're dealing with a scenario of launching a guest with SEV enabled and
>> with -kernel.  The behaviours are:
>>
>>
>> A. With current QEMU:
>>
>> A1. New AmdSev OVMF build: OVMF will verify the hashes and boot 
>> correctly.
>> A2. New Generic OvmfPkgX64 build: No verification but will boot 
>> correctly.
>>
>> A3. Old AmdSev OVMF build: QEMU aborts the launch because there's no
>> hash table GUID.
>> A4. Old Generic OvmfPkgX64 build: QEMU aborts the launch because there's
>> no hash table GUID.
>>
>>
>> B. With older QEMU (before this patch was merged):
>>
>> B1. New AmdSev OVMF build: OVMF will try to verify the hashes but they
>> are not populated; boot aborted.
>> B2. New Generic OvmfPkgX64 build: No verification but will boot 
>> correctly.
>>
>> B3. Old AmdSev OVMF build: OVMF aborts the launch because -kernel is not
>> supported at all.
>> B4. Old Generic OvmfPkgX64 build: No verification but will boot 
>> correctly.
>>
>>
>> So the problem you are raising is scenario A4 (as opposed to previous
>> behaviour B4).
> 
> Correct, scenario A4.
> 
>>
>>
>>
>>> Is that anything we need to be concerned about?
>>>
>>
>> Possible solutions:
>>
>> 1. Do nothing. For users that encounter this: tell them to upgrade OVMF.
>> 2. Modify the code: remove the line: error_setg(errp, "SEV: kernel
>> specified but OVMF has no hash table guid")
>>
>> I think that option 2 will not degrade security *if* the Guest Owner
>> verifies the measurement (which is mandatory anyway; otherwise the
>> untrusted host can replace OVMF with a "malicious" version that doesn't
>> verify the hashes). Skipping silently might make debugging a bit harder.
>> Maybe we can print a warning and return, and then the guest launch will
>> continue?
> 
> That sounds like it might be the best approach if there are no security 
> concerns. I agree with printing a message, either informational or 
> warning is ok by me.
> 
> Lets see if anyone else has some thoughts/ideas.
> 
> Thanks,
> Tom
> 
>>
>> Other ideas?
>>
>>
>> -Dov
>>

