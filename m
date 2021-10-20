Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAAC434F24
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 17:34:49 +0200 (CEST)
Received: from localhost ([::1]:46586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdDc8-00086B-Rr
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 11:34:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mdDZQ-0006P0-Vr
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:32:00 -0400
Received: from mail-dm6nam10on2062d.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::62d]:11201
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1mdDZO-0004kG-FX
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 11:32:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOvWqb0ISqssazXgGbaLTdLgGtktlQm9gdnmkdX4KJuA/2mqwYytjNbpSuKGfUjylP7vyzQAqOJ04jY3+CTXtH+dOggIGyfvFR3WnodcGLrVNgIP40bBDaD9WWvoOI41ZoXTQukKnefmlABXTdntzA5SFshGwJOH6OKgoQtykrViFQXKh5YgDdvxft60mgfq9GFiwcP4hVtrOZlwgsklFERCo6jvEedVVYRQdm/V1PvsHCWHVSSTI87KM7CT9r8DmOwKRZxMRUzS6iITGxhyX2XuzLkVaW/1aaXIev5/ZeehGOz/3WMzsyhOCPE7mztJ33xM7wO3xONrBNNYHvAaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on7tyLFK47iV8OsthZixT6NHc6jC33nyW9ASdHG9cG8=;
 b=CPJJRLcWnf+626JEun/ZXEXbgeRs3IOA3UkfZFCmqS4Zl5DsDmfEh+jah4zx48ESc0/yNEFNJpAs/9MN1w5IOeZS9pC/Vb+S1bWXDK88rU31Yaz3yUQ+08+IJ/U5UT2bjWRxvNx6CHJqNV/XfmCN+yVO61JkrcVd3xpCKqofq7Klpkwp3Ng5vnVj/cyZ+FK4KMkOCDPZ5WtXnZouBubFAXSyzlIXvUFas746EMBEa31mPyeFzcEnoJBUtQyhALwoxsCvBSbTCdsPADlmmjrdI/LDjXGgZhzgZpuggZ30qG0KIWEVNJ9A/E5Sd4KxgJ585kGoTs8Mja+LHLVjSuAycA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on7tyLFK47iV8OsthZixT6NHc6jC33nyW9ASdHG9cG8=;
 b=d6Y2krWOIedp0qI7LT+yieXYTczNGiUYEobjQc9dnBTKZaUPNUK5NLr6ZlotIcMGD0LorHp1N7GC68OAeILQNjvxyzKfdGETKQuk1IDksMSJBh0+c/V6eN3xeF24t5alBpM5lgTzKrZ88+jUj9xKBQmmfQrYD5A5cEvP7ottHDg=
Authentication-Results: us.ibm.com; dkim=none (message not signed)
 header.d=none;us.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DM8PR12MB5398.namprd12.prod.outlook.com (2603:10b6:8:3f::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Wed, 20 Oct 2021 15:26:53 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::a87d:568d:994f:c5f9%7]) with mapi id 15.20.4628.016; Wed, 20 Oct 2021
 15:26:53 +0000
Subject: Re: [PATCH v4 1/2] sev/i386: Introduce sev_add_kernel_loader_hashes
 for measured linux boot
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
Cc: James Bottomley <jejb@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Connor Kuehl <ckuehl@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>
References: <20210930054915.13252-1-dovmurik@linux.ibm.com>
 <20210930054915.13252-2-dovmurik@linux.ibm.com>
 <3b9d10d9-5d9c-da52-f18c-cd93c1931706@amd.com>
 <9474f5d8-68c5-606b-a123-419556afe5d4@linux.ibm.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <c94afa49-fdfc-0f33-a4d8-2a9c30dd7812@amd.com>
Date: Wed, 20 Oct 2021 10:26:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <9474f5d8-68c5-606b-a123-419556afe5d4@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::27) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
Received: from [10.236.30.241] (165.204.77.1) by
 BL1P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:208:2c7::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16 via Frontend Transport; Wed, 20 Oct 2021 15:26:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 752bcec0-6c83-429f-b70b-08d993de0b26
X-MS-TrafficTypeDiagnostic: DM8PR12MB5398:
X-Microsoft-Antispam-PRVS: <DM8PR12MB53983C94E9BCD9BA89DE3260ECBE9@DM8PR12MB5398.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MHO2O2Cs11O3wBm7SQZBLHupkBt33KrLcwXX9JYyltOkm+eJafyQS4Oco8N6RUjwdFWL3MhsxH4c3FkDq1XHXP1Wd/X+kCVglqJMKvuTjSV3w9j3acIZE+Jh7G3TdtxiB+3Lfa1mrQ3tsn6++W6giRj8ltyYE/6ICYFNNrWtQComs0IPUXMHQDMTFrJglzdWrMg7CG+zZWK80Z5/EOdiMlTrJ8exy4teSYVjz3X1WbUxhaRzlLCGxrnAeoMJf1ERe8wWT+y2lyk/zcZmUWdoWQxkajx1IZMW68FZuxFFO1MgyBN6+baCZR0T2ijQDZlmMTf1CGgHkbG5uvB6awhr0UtahqWiJFywMyRPc1u2HB+ao5iP6rdtgWl3zqTJH1/QwHGVeZ7b99TABT7OEBUb9BhairE3vcdC56fr+A7ANjW2UQN5zc6DCnhDsxnd88Q+eyP1M1o67B5VZC8FpsDr/8DwKgNwVqo9vFRJrmVy4DiC2Pjz/e5ni4cMZflGaq5aD6rrvY2CuIS9FGkp72IJj7ZJXIR+Y1NuoH7J22/6ZY2hY9Kgz8tzz7HH4sCf+UY53IHBq9v1hKVafui39qy7d8mdDS9pItrY/z6oVaJFDM9L3tAOnH5TFaNr1LUhgY+lleRsWdY5yvBHrClXE0cGpP8yFAjG3FVcPeW11t7rEKbyyQ6c5bS9LE2P2O33xYwgnFSe5FRjY+TxrQQaceiFLV9zDL4pMYUUwYqUzWuOkh7uWNFyGDHbvEuCmwPL7QZd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8676002)(36756003)(31686004)(4326008)(66476007)(31696002)(2906002)(508600001)(66946007)(53546011)(66556008)(8936002)(2616005)(956004)(7416002)(86362001)(16576012)(5660300002)(54906003)(316002)(38100700002)(83380400001)(6486002)(186003)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUQ3SitmeWtZQStXOGFHTDZlOEQxT2lzY2VoSFJMVk8yL0hIOXFUOHNZZGxZ?=
 =?utf-8?B?YjBISUFicUxEMXJ5ZmJHeElQdWlJMkhINFVMYTJ3ZkdBMmFqOHJGcVRoVjFI?=
 =?utf-8?B?M01lZlBKTE9VY1JJdUhLeWtmamJjQ041SjY1eHdkdE5wWHdwNkdlUFgvMHcy?=
 =?utf-8?B?elRBUVZYenhKMUZCc2F1TGFVazJHZmdIaUlibWFraE1ZV0NsWmx5amhBY3l0?=
 =?utf-8?B?VFBEeTR4UVlFZ0hRaDRQOWN1Z2ZwUFR0T3BCcmFlQVFmYnFJMEVVOTh4cVAx?=
 =?utf-8?B?YWF5TzNFR05EWUNhNlEwNWRnSzV1dWlsOFcvbTY5MkNsbFVUMFB1UUJxTUht?=
 =?utf-8?B?QTNxbWZiOC9UTnlyaFh4ZXNWWE5IeGFNRmxST0xtcXprRVc0eU9VK3JzUStR?=
 =?utf-8?B?eExCYkVEdDRrMkF4aTVadGpoK25FQWwrTmJGOXJPWjNMazhZSlBUQitGTzFG?=
 =?utf-8?B?Z3VzTTJvOHRtK3NvK29zY090NXd2aWdZODNTRnFLOEI2a0Y1emVsRGxSRE5V?=
 =?utf-8?B?TnNDWno5K1lFU0h0amNaNW40ZGV3ZVpLckdLeE13Y3NyV0REK1ozbHlJOUJD?=
 =?utf-8?B?YlJhK20xZUJabzNHZHphL01EOXRvaVd2Z29sbmthdmlwNnhyLzRKL2xlL2kv?=
 =?utf-8?B?N0JTZkI0SU9lNVBIU1pqelRDUkluRE1lc0EvbEp1MTVVdExvQXowNWNMWXV2?=
 =?utf-8?B?MEdtRHVjVDk0Q3JJNVBmMmtQSW5IcTg4TVZDcVkxY09PemQzT0hWbUwwOHds?=
 =?utf-8?B?Vy9ubTJQTENhOVpFQ2FqT0VCd3hZdGFNS2UxZEMwL3JPc3N6OVNvdkg2dDAz?=
 =?utf-8?B?SVZvbnlvK0xqcTNub3Z1WVRIdmhrT05xeWQzN0lMcG8zWkpmWldJN0ZkZVZu?=
 =?utf-8?B?RTdhMHBObFpRZGdtMU9ZUERqR0p4RUluNWpBQUFId0RmemFYTEVpV29pTThv?=
 =?utf-8?B?cHN0QXJoeWZvdmtQZEFlbGg1Tlc5aWpUQ2lJd1gwREZTb2RKWmVSTEJ6RkVk?=
 =?utf-8?B?R0FydTJuZVQxVW5WMVlneGFDMkROenB0Ykt3VnhUam1OeWZBNFZLYUQ0N2dr?=
 =?utf-8?B?N1NtcG15WVp0aHhkYk9aUjI2d2IyZ3hxYTlLYmdWZ1ZaMmdlQnNTMXVybVlT?=
 =?utf-8?B?aWZ2dWdTSWVFVlY3NzVRMHl1Yy9wM0dXaVNCeG5GUFdtaWNFbWdvZk1RSDZI?=
 =?utf-8?B?VkliVE85REd5L3FWK2lNYlM5MVNLaUpNUyttOTludkEybXpLYmlwbDY2emFx?=
 =?utf-8?B?ZXZiQ1VYS3VIblVTeS9na0p3MjA4YnFoVFYvNGZ0aGVhR2ZjdE1BTFlwd0xU?=
 =?utf-8?B?TDI3TzVBTjRWTFZCeGcweU5YVEM5T3B2bmJOYlNpdldWdC92ZDczSXcwbzI2?=
 =?utf-8?B?SVI4elBIVFpVcG93VUxDQm1sWThWbTc2Nk1RNXRpRmFqamdvaGhDODlFRHlt?=
 =?utf-8?B?Y3hTdWJNSkExazdjWXNrL3NjRmtOSDhjbnlqR0VNcXdZTTRjazliSThyUVBm?=
 =?utf-8?B?YzNFVmgweTg5LzFMVVI0VW1qRDdqUWl0T0ttRVhMOFpWeHc4Z0RudklMM2hy?=
 =?utf-8?B?QkRhemQ4T05kY3hrdTFlcnNjRk1XWUxsMGsvREpwSHVweXlVTi9BYitydFc2?=
 =?utf-8?B?ekNrMWpjYjMvRUFFUUNycFlQMjN6cHFrUEEyRzA2Q0dYaHo0djZVT2QxQmtY?=
 =?utf-8?B?dkgzanVmcW5nV0lPandEcEwyaWUzS2tUS0xCUmpzTStxWVlLOUxSZVp5bGNL?=
 =?utf-8?B?WVJlNmVuNXh2MzkreU1tMUZ3MkJCYU02WmQvTHg1bFU0YzQzV0JsNXJvZUhJ?=
 =?utf-8?B?WXQ2UTVkUEc4MHFCTmJWR2ltMkd0UWozWDJYdnZ2di9nL2lVWTVMUGNQWVlW?=
 =?utf-8?B?ZXZ0VDkwSUZZSHlpeVJ6cVQvYnNkNWZyeUw0TVhtaU53OU1ta1lVVFRWTTh2?=
 =?utf-8?Q?rl7Rw3U2X1o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752bcec0-6c83-429f-b70b-08d993de0b26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 15:26:53.1473 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlendack@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5398
Received-SPF: softfail client-ip=2a01:111:f400:7e88::62d;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.267, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/19/21 1:18 AM, Dov Murik wrote:
> On 18/10/2021 21:02, Tom Lendacky wrote:
>> On 9/30/21 12:49 AM, Dov Murik wrote:
>>
>> ...
>>
>>> +/*
>>> + * Add the hashes of the linux kernel/initrd/cmdline to an encrypted
>>> guest page
>>> + * which is included in SEV's initial memory measurement.
>>> + */
>>> +bool sev_add_kernel_loader_hashes(SevKernelLoaderContext *ctx, Error
>>> **errp)
>>> +{
>>> +    uint8_t *data;
>>> +    SevHashTableDescriptor *area;
>>> +    SevHashTable *ht;
>>> +    uint8_t cmdline_hash[HASH_SIZE];
>>> +    uint8_t initrd_hash[HASH_SIZE];
>>> +    uint8_t kernel_hash[HASH_SIZE];
>>> +    uint8_t *hashp;
>>> +    size_t hash_len = HASH_SIZE;
>>> +    int aligned_len;
>>> +
>>> +    if (!pc_system_ovmf_table_find(SEV_HASH_TABLE_RV_GUID, &data,
>>> NULL)) {
>>> +        error_setg(errp, "SEV: kernel specified but OVMF has no hash
>>> table guid");
>>> +        return false;
>>> +    }
>>
>> This breaks backwards compatibility with an older OVMF image. Any older
>> OVMF image with SEV support that doesn't have the hash table GUID will
>> now fail to boot using -kernel/-initrd/-append, where it used to be able
>> to boot before.
>>
> 
> 
> Thanks Tom for noticing this.
> 
> Just so we're on the same page: this patch is already merged.

Right, just not in a release, yet.

> 
> 
> We're dealing with a scenario of launching a guest with SEV enabled and
> with -kernel.  The behaviours are:
> 
> 
> A. With current QEMU:
> 
> A1. New AmdSev OVMF build: OVMF will verify the hashes and boot correctly.
> A2. New Generic OvmfPkgX64 build: No verification but will boot correctly.
> 
> A3. Old AmdSev OVMF build: QEMU aborts the launch because there's no
> hash table GUID.
> A4. Old Generic OvmfPkgX64 build: QEMU aborts the launch because there's
> no hash table GUID.
> 
> 
> B. With older QEMU (before this patch was merged):
> 
> B1. New AmdSev OVMF build: OVMF will try to verify the hashes but they
> are not populated; boot aborted.
> B2. New Generic OvmfPkgX64 build: No verification but will boot correctly.
> 
> B3. Old AmdSev OVMF build: OVMF aborts the launch because -kernel is not
> supported at all.
> B4. Old Generic OvmfPkgX64 build: No verification but will boot correctly.
> 
> 
> So the problem you are raising is scenario A4 (as opposed to previous
> behaviour B4).

Correct, scenario A4.

> 
> 
> 
>> Is that anything we need to be concerned about?
>>
> 
> Possible solutions:
> 
> 1. Do nothing. For users that encounter this: tell them to upgrade OVMF.
> 2. Modify the code: remove the line: error_setg(errp, "SEV: kernel
> specified but OVMF has no hash table guid")
> 
> I think that option 2 will not degrade security *if* the Guest Owner
> verifies the measurement (which is mandatory anyway; otherwise the
> untrusted host can replace OVMF with a "malicious" version that doesn't
> verify the hashes). Skipping silently might make debugging a bit harder.
> Maybe we can print a warning and return, and then the guest launch will
> continue?

That sounds like it might be the best approach if there are no security 
concerns. I agree with printing a message, either informational or warning 
is ok by me.

Lets see if anyone else has some thoughts/ideas.

Thanks,
Tom

> 
> Other ideas?
> 
> 
> -Dov
> 

