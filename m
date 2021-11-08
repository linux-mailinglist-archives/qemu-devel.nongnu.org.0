Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8216F449E68
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 22:44:59 +0100 (CET)
Received: from localhost ([::1]:38562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkCRm-0005XT-7B
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 16:44:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mkCQN-0004rH-BB
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 16:43:31 -0500
Received: from mail-dm6nam12on2073.outbound.protection.outlook.com
 ([40.107.243.73]:65341 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mkCQG-0002Xz-J1
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 16:43:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNM16pLzEiu0EVBtbNLqhLPOQDyVJbv/+bldFy9G9fxgaxzlxj0Ap9gDVToRrKN/+AcT8Xzqav9UNpRK24hBkk5e3iWIiFzHsEdcTaFYqaGgrFkCUC7E9uEf5jgL/y9FGcUK6p4ysFo7eM/y4s+cDs2U0qGy51lnePCdm8m3Qxu41oKJ8cn9Q3+Q1e/wD+Ja4JOHYHQGA4oFloMESfrgcUzx9xmb9hoWFpxsbnQgoyyz1vKNl5ATnKJf4Y2dyrAW7SM6hBM+3EWdzg1vVYdHwSYl5JP5WtH/EFgOlCo7i7rUjQ8ZhcFfbZHRv5q1otHwCQ/pWpF+/HtYEw4IehUh+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3v7k5MN1ZeThy21BC+N4/pUAYWTkxDtusPaFZ8Sc7w=;
 b=W+wlZVBdruiwl3Vzj5ulh8R42ayG5B0neMde2RJxsNOgFPI/FGlVTYdBBxlCEpSnsb5C4QPutVdhGSFMnwq3qP3ZsTENoyEDQQToA7UBb8XLwO4Xf8Q8lt0gr/wWnVDiQml/sOSUW3SiXvvb1RKOnRhMW3G6WFA2cMQYCKsOMwRqwQQYXnecspv5lvfptc3vgnQstdijK1eyzsuim6NlHPoHXIxt1MEFUCV6OYYhvrBK6V3wE0RkCzaMHT7ygyKHs/xFkrVsp4ApKe5jxZpvJqNjZv88xP2rZDE5xwyPUin7NpKRNy5/i7GTPAf6iyv4I9DmPZGjc+XnAL5Wd84pIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C3v7k5MN1ZeThy21BC+N4/pUAYWTkxDtusPaFZ8Sc7w=;
 b=1kzeicoL0kQuJ0h965SLcCB1Q+nzo/doDbT23SidUlCO8pklajFqZqEgXoDUgnlaKFC2PEqlnlj7qfuIiwtPUnGm9IZvnNOh6mhDee8QOhzJKKBMtRAfnw0CQaxwG88wQmvJgW+tkO9wQ/TMGR/qTvrZWrMKAr4L19ObE09lcYk=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB2768.namprd12.prod.outlook.com (2603:10b6:805:72::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 21:22:37 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 21:22:37 +0000
Cc: brijesh.singh@amd.com, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Ashish Kalra <ashish.kalra@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 James Bottomley <jejb@linux.ibm.com>
Subject: Re: [PATCH 0/3] SEV: fixes for -kernel launch with incompatible OVMF
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <0291b6fc-b613-5eae-77a0-b344020a8376@amd.com>
 <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
 <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
 <56fb584f-26c2-5592-e065-5dcf075c72e5@linux.ibm.com>
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <eb6d99f4-f9d1-4cd2-d391-dc3c57c28112@amd.com>
Date: Mon, 8 Nov 2021 15:22:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <56fb584f-26c2-5592-e065-5dcf075c72e5@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:610:b0::25) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 CH0PR03CA0020.namprd03.prod.outlook.com (2603:10b6:610:b0::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13 via Frontend Transport; Mon, 8 Nov 2021 21:22:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 142f96d5-ad6e-4029-8da7-08d9a2fde304
X-MS-TrafficTypeDiagnostic: SN6PR12MB2768:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2768788C13F7B3889C06D766E5919@SN6PR12MB2768.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dv1ysygv2wsLZA2l4ZCVZ8AiSByesgOgn41WFFgGvYOVCVNTgpe9L44zPDybznxitEfS4clhaBg0P2abW5qVlwcMxIf9eChLtIJ1DQLilqQigvPK4vvELxgxL3IYeQyqkq/rNiYAkyUtghB7ZoC7qFvjQFNHjSh72RjrBILmwaOZzjK5vwT2sppI4KiyJRIu3TnbNUz2Atqni2Rojz3btrOGsEPEU9aRMJjNiI77rnubQbrU7yjfeDMoOVOJ26YcpeaG9J1jzvBCNfALCKGyQbxfuEQcTSkG6S7xdPysZDJwRXHwdYejjLoUz4XR3ezVM+FwoJ0U771qgFIZYQS4m6Rg3WWABjTJSC/+Ornz8pYapTyMXvFwrHLSTqt7YvHnenFqv24UPvREwBVnINP+xpJ17ji+GnigB596UjWnDjOjPs9RfGI4zFxK5j37MXUa7GZBoiuzfFIbtVJONf/4ynmFQEthA0o/OYqdm/txJlMwJNcSCIm6y0Cnusu5PRzUM8/M3LAZDsg9Vq8q1zjK0UeJakjJDArzkHRmmSyQLIkCNcN8RYiEEBQnXskjiZ9Ol4EYPSUoi8sqrLK04JdtAyTB89Glc58NP9Lxl9epcdJBZb5EG76ThB3uZg8zdNhEWpepSQAcgKemC/riaYZgO0eEMgcWBS2pGyu4N0Ds9LtAW0YTcEGi3FfaR3d9B+iw8wku8Vw1ipXuCbcokeeOxbMKkGwJPkfjw79ji0EcjCQ97z7OG23wkxglvs53vAd2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(2906002)(31686004)(36756003)(31696002)(66556008)(66476007)(316002)(86362001)(186003)(38100700002)(8676002)(54906003)(16576012)(4326008)(66946007)(26005)(508600001)(6486002)(2616005)(956004)(44832011)(83380400001)(53546011)(19627235002)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VlNuN21FNVVyN0twZjdqWjQxdm4xcHVsampoaThJdzhNYjEraW4zQzdEMXVB?=
 =?utf-8?B?a0xJM25HRXl1ZWhCZFBHL2Jpa0NPVkRKL01qN2xsbnJSQVBnMDhjSDFaK1Rw?=
 =?utf-8?B?YVFHSTAvZFo2YzlXVDZhYUFjdDBkU1hkSy9scHZaWHVzbm9TakZkUEs0K0pS?=
 =?utf-8?B?UXBCZmsrTUVKRFpqbkFJcExpRDJldzkxN1cxK2tKVXR2RWQ2OVE0L3lIY1c4?=
 =?utf-8?B?TDlHTk40QlVvU1B1TE42YzExVisrdzVtLzJUdUI2dUd5UXZrZk1NT1p0WFUx?=
 =?utf-8?B?L3V2RmNrSXRHbnNnbTBRQTQvMUFxQzhRUHV3RmMwbG9CaTZxcUc4WEk1UTUz?=
 =?utf-8?B?NDJCK0xMTkJYRVlSSTRZS1hJNUpESlpYVkhuazB4eUxlTGhFQXVJc3Vud0NF?=
 =?utf-8?B?ZTZmK0VIcTd1RGtDQ2YySm9qMGlqSnRXU1NVQkZ4Wk9BODIybTg1V3VvNUl2?=
 =?utf-8?B?LzlETU45MXU4M04vdXlrQWQrWlB2WWlCNjV3K1FuUkxRNG9aWE5scmZ4cFVp?=
 =?utf-8?B?OWYyNGZLWTk0NmJuNjltdlA0RDJUVU5NRVd0blhGaUJaWXI4TFhlZHpWOU42?=
 =?utf-8?B?NzVLUllyVW91bFhQdUtzY1RLM1Rwak9PbThlaUw1TVdzUDhja2wrV0JSU01G?=
 =?utf-8?B?TjFtRUU0dDlIaVV5MEFvMkNLbHkxdHc4TDl4YlYwNGoyRkRQNHIvSWFRTURH?=
 =?utf-8?B?SUlkQUZFNERKSDJBT1d4VEJyd0Z2Y0M3RnRKWEFFckI1dHRDT0ZoVklwZE5K?=
 =?utf-8?B?aVBTSDRsVWZrUnNSVkdZTGRwMUh2d01OVWFtM3cySTdmeElFZEFnZDA3aTlQ?=
 =?utf-8?B?VEtKandXL3ZzcUl0dUQ5aytSTHpaTWcyYyt4bzUzQVU0MHZUb05JNGFhZ0h6?=
 =?utf-8?B?S0E1QjREdGRORS8xQUNid2k5c3RXclVaTkNQbm13RWQzTW5wUktMcHNHbEE3?=
 =?utf-8?B?QjM1eTFaVXd5SGM3VklyRUlWdFQ1VEtKb1NPQVVGQVNoN004MVpPSXR4dlA2?=
 =?utf-8?B?QkYyNnhCQm8yMmhndytJdmEzNkVqeVhRVm1EZlRkZW5acmgrQlB5TnFzUUNW?=
 =?utf-8?B?RitianEreEhkN2hPYnFMOFBLeEtSZFJzQy9zbEhBOFJkNndwblpLbjF5VDBR?=
 =?utf-8?B?eEtzcWxMclAwTE92c2c5VzlWS3M5WWxscldpNVVTb082d0JBTGl3bHJOTm14?=
 =?utf-8?B?UGxEZExHVnZYaFJCZG4wOWRobktKdkdqbTBuQ2I1RTBnMTBaNGd5VlJhY0lw?=
 =?utf-8?B?ejJST005bXZObVl5aU56czZaZUF5a2hibFY3SzdMcTZWUUMrUUtwSUN4RXJs?=
 =?utf-8?B?MUY2d1I4Vzc2RnlNRXZHQVhGR05IVC94TVFBcWQ1b2VTTVZHNm5QRExBRXlm?=
 =?utf-8?B?OXEwZ2hST2dibS9zajdEZjlYdkErbnhnT05HWDB1aFVGb1dzOFQxRndKZlM5?=
 =?utf-8?B?M3V3d2Mxd1JxaTZWTEhIZWRhMXdNQVp5Vk5TdzFQaXV3Ny9HNzU4bDM5U2lO?=
 =?utf-8?B?NzFlWjh4cWFhTllKaUtkRHo5T1E3TVlkTnBNdE93bmNuQ3g1YjRaMXMzZWRq?=
 =?utf-8?B?dDhqOFpMTUVCMVc0aCtrY1NCL3B4Uyt4L2QrazdwYVBzZ0dNbzJMZWswSlRl?=
 =?utf-8?B?SFd3RkF4d3E3cmlCOEk2aHVIR3cwSUUvTWpYTDdNMjBpMXRlNkxqRkRCdXVH?=
 =?utf-8?B?c1lhUXU4OFBUcjJOTUIyNTJ4aTQzMERpU2hHNkVVSklYekVQWDk4Q3AxWXBr?=
 =?utf-8?B?bWkvcGhZWFdQTG9EVzEzV042M0NXc0NhaytGeUxUNDQvQmxqMDB1REJXWUIx?=
 =?utf-8?B?WDhmK01teHgveE01emp2ejkzbVRXeUpUV0tsZXhRUGhrbWhGNG1lVUppTDA5?=
 =?utf-8?B?Q2hsUGtMcytJYW1sTTNrUTFhYmRFMTg0L1B0OGw1elowaWdlKytiQ1JhOUdO?=
 =?utf-8?B?VHZKUVA0UDRpMXFxYTNYK1EzZW5Pem9nejFrZW4zTm5vVCt1YnRJQXdUenhH?=
 =?utf-8?B?ci93ZHRQUlExUDZ4MHJFaWdsQnJnVnprUG0xQVQrdVJvVi84N3dKUys1Z0dS?=
 =?utf-8?B?SGM0VlBHdjVrYU1rWmkvS25QeGFXV3Fid1ZDVHJFdWNMd1V2b0lCbUlYbUU3?=
 =?utf-8?B?OTFMQ0V3NWZJNUo3dDlmOXptVk8wQ3pZaVdDTG4ycE1MNEJQMlYzMHllMzlN?=
 =?utf-8?Q?7O0pVksdIKCYPbtHaZ7xF34=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 142f96d5-ad6e-4029-8da7-08d9a2fde304
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 21:22:37.1426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXIBvmvJSFwQ7/YA1v8BnPmYTm1tAMWFvBKf3tgNGl22EXmI63/opabRvbv0/qYrokrzHr0uqVVPFJNAfND/8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2768
Received-SPF: softfail client-ip=40.107.243.73;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-3.06, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/5/21 1:32 PM, Dov Murik wrote:
> 
> 
> On 02/11/2021 16:48, Brijesh Singh wrote:
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
>>> suboption) is yet another complexity for the user.  I'd also argue that
>>> adding these hashes can lead to a more secure VM boot process, so it
>>> makes sense for it to be the default (and maybe introduce a
>>> -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
>>> measurement from changing due to addition of hashes?).
>>>
>>> Maybe, on the other hand, OVMF should "report" whether it supports
>>> hashes verification. If it does, it should have the GUID in the table
>>> (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
>>> it doesn't support that, then the entry should not appear at all, and
>>> then QEMU won't add the hashes (with patch 1 from this series).  This
>>> means that in edk2 we need to remove the SEV Hash Table block from the
>>> ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
>>>
>>
>> By leaving it ON is conveying a wrong message to the user. The library
>> used for verifying the hash is a NULL library for all the builds of Ovmf
>> except the AmdSev package. In the NULL library case, OVMF does not
>> perform any checks and hash table is useless. I will raise this on
>> concern on your Ovmf patch series.
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
>> This is my exact concern, we are auto enabling the features in Qemu that
>> is supported by AmdSev package only.
>>
>>
>>>
>>>> I am thinking this more for the SEV-SNP guest. As you may be aware that
>>>> with SEV-SNP the attestation is performed by the guest, and its possible
>>>> for the launch flow to pass 512-bits of host_data that gets included in
>>>> the report. If a user wants to do the hash'e checks for the SNP then
>>>> they can pass a hash of kernel, initrd and cmdline through a
>>>> launch_finish.ID_BLOCK.host_data and does not require a special hash
>>>> page. This it will simplify the expected hash calculation.
>>>
>>> That is a new measured boot "protocol" that we can discuss, and see
>>> whether it's better/easier than the existing one at hand that works on
>>> SEV and SEV-ES.
>>>
>>> What I don't understand in your suggestion is who performs a SHA256 of
>>> the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
>>> (though ideally earlier is better).  Can you describe the details
>>> (step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
>>> the measurement/attestation is performed?
>>>
>>>
>>
>> There are a multiple ways on how you can do a measured boot with the SNP.
>>
>> 1) VMPL0 (SVSM) can provide a complete vTPM (see the MSFT proposal on
>> SNP mailing list).
>>
>> 2) Use your existing hashing approach with some changes to provide a bit
>> more flexibility.
>>
>> 3) Use your existing hashing approach but zero out the hash page when
>> -kernel is not used.
>>
>> Let me expand #2.
>>
>> While launching the SNP guest, a guest owner can provide a ID block that
>> KVM will pass to the PSP during the guest launch flow. In the ID block
>> there is a field called "host_data". A guest owner can do a hash of
>> kernel/initrd/cmdline and include it in the "host_data" field. During
>> the hash verification, the OVMF can call the SNP_GET_REPORT. The PSP
>> will includes the "host_data" passed in the launch process in the report
>> and OVMF can use it for the verification. Unlike the current
>> implementation, this enables a guest owner to provides the hash without
>> requiring any changes in the Qemu and thus affecting the measurement.
>>
> 
> Is there a way (in the current NP patches for OVMF) for OVMF to call
> SNP_GET_REPORT? Or is this something we need to add support for? Will it
> mess up the sequence numbers that are later going to be used by the
> kernel as well when managing SNP guest requests?
> 
> 

The current OVMF patches does not add a library to query the attestation 
report yet. If required it should be possible to add such a libraries. 
The VMGEXIT is available to both Guest OS and Guest BIOS. The sequence 
number should not be an issue. As per the GHCB spec, the guest BIOS will 
save the sequence number in the secrets page reserved area and guest 
kernel can picked the next number from that region (its same as the 
kexec approach).

> 
>> One thing to note that both #2 and #3 requires ovmf to connect to guest
>> owner to validate the report before using the "host_data" or "hash page".
>>
> 
> For direct boot (with -kernel/-initrd), I don't understand why OVMF
> needs to contact the GO.  If OVMF can fetch the host_data field, and use
> that to verify the blobs delivered from QEMU via fw_cfg, it should be
> enough.
>

Well, I am trying to match with the current model in which the Hash's 
are provided through the secrets injection for the comparision. In other 
words, the attestation is completed before OVMF does the hash 
comparison. So, if you want to have the same security property then you 
need to perform the attestation before comparing the hash'es because a 
malicious HV may bypass the guid check.

thanks

> Later in userspace a user program will contact the GO with the
> attestation report (which measures host_data and the OVMF memory). If
> the measurement is not what the GO expects, then it won't release the
> secret (which should be necessary for the actual meaningful workload
> performed in the guest).
> 
> 
> This should mitigate the following attacks:
> 
> 1. Rogue CSP replaces OVMF with a rogue-OVMF that doesn't actually check
> the hashes (the GO won't release the secret due to wrong measurement in
> attestation report).
> 2. Rogue CSP uses "good" host_data content (kernel hash) but delivers
> malicious kernel via fw_cfg (stopped by OVMF verifying the hashes).
> 3. Rogue CSP uses malicious kernel and its hashes in host_data (the GO
> won't release the secret due to wrong host_data in attestation report).
> 
> 
> -Dov
> 

