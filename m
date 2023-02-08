Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8E168F1F6
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 16:28:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPmLP-0007o9-CP; Wed, 08 Feb 2023 10:26:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPmLH-0007nq-6c
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:26:39 -0500
Received: from mail-dm6nam10on20624.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::624]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Thomas.Lendacky@amd.com>)
 id 1pPmLE-0002VP-Gt
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 10:26:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRW2D/MuPcqGsi3VFiPDGzQbbm9lIJ09Z+8N/nQ1vwExDpwQKL/dK2LO+Fs/OBY1v990IE3KsGO7024uBWaGUEtzojrVlUrwONW0HDJYwQszYDfuoUVaU7w8eAHxWkUTcOMB85XCtON3R5IAG2jLE2xzBDK8V4/e/FkUN6BuPbm9gfD8cakUPmaEbhHse4aW3M/FHQF6OvgyV9cerAqB6aLLk3Hy90hQ/Bwg9zRjju0XVAnLiIgD2qEQj0byor2PRQ1cVYkt+tYZCC8BrKOWwepzNbftpjDVsin46krjx5P4aGpL5Rh/iEeMdNalQ3bGC/bHqGRNr2Np69T9z2S/SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reTtNilic9sXNAuP1gsP7r5Fa2Tbihv0/WbKgemPiwc=;
 b=f+ork3l4bLZ6f8gkokXzylpl0hQ+c6DrShaFe0FB0U7HU45tKMtAy7Bm5aGJjUYT8xQ/RnNCqfyO+jtv0kQaHVJWZKTri1L93hh/9ORgRbEAGJm6G97ygpoMNUH4U/rtkodevLj9yZKB2FUma5ItlPE38ZMo1sGiQ9I6akClHLCt/WQpUtDx+8HC2zBc0iuIV8AAf0WelzhxH5az6ilILe44XmQFsLNFE6GW6HuMjUjio0FXyMOOc5VncQZ5SlxjU/OsxE0yzZMTDznhQp0Ltv78Hu51ofx3bE6TfS5KBvIX0XwxoK7FK8Rv18oqyIEhSpFqTJuO6LcE9VuhiuAqig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reTtNilic9sXNAuP1gsP7r5Fa2Tbihv0/WbKgemPiwc=;
 b=wWE9CtnetJCyN4mg9Zd2S3+qheA33tgxs24QwPYO3BdoN/tnXI/MrgrVaGSt0pY6UFobyyg6HT3INJqxroqe/NUY2ngzoA8orES4CsnUMifqcBiXsTQXIgenC1KOocyfAR2KlnJJ6qt8dXVAFPbnp6as1ZjgpW08GceB9QRPPvg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5229.namprd12.prod.outlook.com (2603:10b6:5:398::12)
 by DS7PR12MB5767.namprd12.prod.outlook.com (2603:10b6:8:76::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Wed, 8 Feb
 2023 15:26:30 +0000
Received: from DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c]) by DM4PR12MB5229.namprd12.prod.outlook.com
 ([fe80::6cc0:9c7a:bd00:441c%5]) with mapi id 15.20.6064.036; Wed, 8 Feb 2023
 15:26:30 +0000
Message-ID: <5ac2a4bc-a7a3-49ca-67c7-96df7e152dd7@amd.com>
Date: Wed, 8 Feb 2023 09:26:28 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] x86: Don't add RNG seed to Linux cmdline for SEV guests
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Dov Murik
 <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org,
 James Bottomley <jejb@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>
References: <20230207084116.285787-1-dovmurik@linux.ibm.com>
 <20230207164117-mutt-send-email-mst@kernel.org>
 <23f28bd4-7adb-3bb1-7148-7dfbb57871d5@amd.com>
 <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
From: Tom Lendacky <thomas.lendacky@amd.com>
In-Reply-To: <CAHmME9rrqRY0gOVBav4LjMypmu6uicx3vD9kozApyFoytNg84Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0052.namprd14.prod.outlook.com
 (2603:10b6:610:56::32) To DM4PR12MB5229.namprd12.prod.outlook.com
 (2603:10b6:5:398::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB5229:EE_|DS7PR12MB5767:EE_
X-MS-Office365-Filtering-Correlation-Id: a83043ac-82d2-4b88-ce62-08db09e8da90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hGIcIj869W8kxB4Ievv8gPSqWI61+Pyh3tL6pzyWqosUMg3n+s2oCFdoFz2EbcV1Nzj9PU8w80YbmDrEVrG3H7SZrOIF2v1qSsZTSGOYlXQ4x9STYaGWjCmI09CMG3Qw6l9gVlxmczNR0eRIJAE6YyBUW5JVcT7nBc08ZnUJ9lQ+yua9pLO0gu99IKJnSnr2VzdoFNUAIdgX8MWuUN8YfIS12/zuj9DKcpmeuiemVr0UssXPySqVlxxExzpOLgEbBmc6jHfDRxZ1BlLPWjQ4E5P9qdxJIXavc3O7BWjJFL/LC0W8hUWjz2+Cc51gA9hW1LX4rLBPfSd+y+gP5kC8HasX38XPNJBrsVlV+EHVM3NDE0W9BmewS7lfLZ14V3ET10Ju9JTv19QPrlWEqQ7RhBvPr0U4wQ5us4d03PWhklaQwMg5hZ79ZaYoSrdYohgDpp4qoFvy6FYSEpQRKR9dOi5Q6EMHoA8P4uStVfrrlYYQSyJ8bfP0UGY4X/c8ygncPe066DyVpDwYvQvNrQnP5uE0nLhwS7glPVOFdGT3RKlONufNj0LnrTeSu4UylaKNKdXtFxazZ4URy1ButF8JOhd9B0nWMbCs3LaKZC8dIKDPoQD65B/CmsjTO8KXiQUksSbnKSve+QaYTCZV/Gq3EYLmspF2TLXZ12J6eKlCenpifb4D9dfpv9ZPxvq4vMCzi5epW87aWckCF2hhl5yQOH2506OTFCvfyhuaJH1l5aMwFZQEHnt9Tqr3r2PRs1QNpnB9EyykOaY3QAXhEoLlEr9cXCRcCmEgPiTJJgSos7JW1v7s9HOL8MoqZ8dh7lid
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5229.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(366004)(346002)(396003)(136003)(451199018)(86362001)(31696002)(36756003)(38100700002)(186003)(316002)(41300700001)(8936002)(66556008)(66946007)(8676002)(5660300002)(54906003)(4326008)(6916009)(66476007)(2906002)(2616005)(83380400001)(478600001)(6486002)(7416002)(966005)(6512007)(6506007)(26005)(53546011)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzkxaFF0cGlFeWprK1FscUZOWTZGbEpBQVQ3b0tSQ2ZhZjdNbTdNU29MNDhl?=
 =?utf-8?B?b3NsanZ4UVh1M093Y0kwMjF6b0tzRHZEZkRDb3FXUU1RUW1Rblp1T0FGbEUx?=
 =?utf-8?B?MVVSazBETWVYQjF3TWoxOGYvaDYrUExLbzJ4eDl3YnFFdE9nVWUvZXE0NkNp?=
 =?utf-8?B?WlZ2a3lUdkZnamVOcVpxSmIxZ0xwN0NWeE4rVmtzaGEvNm5KQ2cxdHI0QkFI?=
 =?utf-8?B?bDNqS0c0YUpKbjdlYmR3RC9oU1k4R0M1bHpaQnIxQ0Jyend6bXdXWVQzTGV2?=
 =?utf-8?B?MkJINEplNzhyTFlEdEJQcTRDZ0lUbVIvUWZBaCtmK0ZhWDJ3WTllZ2FRZmVW?=
 =?utf-8?B?djlYdzR4Y0FscnJEK2lEVkxrRTc4N1c1aWFqYXRkaDdCNjNrUDZubWhXY09r?=
 =?utf-8?B?bDNBWjdmajFyN0RoSGlOaTljaXg4UWgwbmpHc094WGVWcDc1WTlQZFh2QUhQ?=
 =?utf-8?B?R3FtRWZIREJIMU80bGFPdGgvUVYrWGFJMUtZRWlCUWxTb3VjMDNna2dGRHQw?=
 =?utf-8?B?bE1iTXZnN0xTYUNHMFI3TzVGQk5OZ3hXb2VHbVRSU09NZm84T3EyK0hZdjd2?=
 =?utf-8?B?SUs3RzVvV29NQ0E0bzVmMzFPREJQMVUxdmFZZG01SzFIaHpoOWwxaVU2clpF?=
 =?utf-8?B?OERvZzhVYUNaSVk0RkZSL0s0NTY1Y294MVU5Q0Y5alhBbTZKVW53QjRSamxL?=
 =?utf-8?B?ZnBiQ1FpdWE4TFJ5emFsWnpRbXk5OFJEMmJMbFExRlhxVGRIL1V1S2Fhck1S?=
 =?utf-8?B?RXY5VmNtWklhWkVjR3Q0eXJEbkZEejNlVC9qWVVyaUk4QmQ3ZlhWbGgrSUxL?=
 =?utf-8?B?OHVSV0h3TzlpclJVNlVNL3lIb1k3bm0xeXhoRW1ucit4bmN0VWpXdVZJS3JI?=
 =?utf-8?B?cHJaa0hzaCsrMkJwK2RDQmpJZFMvN0FENkUySDR4ZHREM2lCNmNoUzZ2UUJm?=
 =?utf-8?B?T2dXelR0VkRqdHJuNnJDYS9PeTIzckZpRWVRc0I0MDM3b05MRG0zTG1ITzJK?=
 =?utf-8?B?a1VicDNDSEthM2JBK1dSWWFaSVZlanhJQ1htSFZhRTU3WGlUZVVYQWUrbDdo?=
 =?utf-8?B?M0w0eVUwQ2wrSzAzNHRTZEwrUXp0Wkt4WlQrZ2VzWkxjMFdDNks4bUNla1Bi?=
 =?utf-8?B?a3RnWEc3UEdRZEhyaW9KOFRpMVJ3aEJYSnp5aHE4WUgraUxYQ3RFVDlBMzZS?=
 =?utf-8?B?OFl3RHVrdHJDTkZjMnFMMkgrdnUrZS9IeWU3eXRPOU96ZzVBcHB2UGhXdkxt?=
 =?utf-8?B?S0FmTlF0S085RTF2d1NFWHFBai9QZTFDdXpTQVJRNkMvWnZPd2VhWXcxc2FS?=
 =?utf-8?B?a2JGN2lJcFlhOVZCUkhJUVZEYWJjR3VjckU2ZHNid2x1Vzh6amM2REltOVBm?=
 =?utf-8?B?UVdLUDVNdWxTZThXTUJ0azNnM1JFR0FrQ3lEN1VBWlVJcWJNS1dBdTZZV0I1?=
 =?utf-8?B?V2VCS1hmeE91bkNYd2FjWUJnRVhpb0ZUNlZjR1JXUHlOUlljWmwxbk92MW5V?=
 =?utf-8?B?bUxEVE94OU4xT2ZaZTlaeVZ0b3BqM1V4bjNHTHVYUUNONXJNR0tRZERlb1Bo?=
 =?utf-8?B?OVZ1dE1RbU5taHE4c0NScCtrTW1SVFpibCthTlpBVkpwYjdTdndxUDlXbDZo?=
 =?utf-8?B?T0dqODMvQ01CcnlEYjJmUSt4RnBlV20rSTFJRmQ2OWo2eUdTS0MybnhlUTZi?=
 =?utf-8?B?Qlg1V1BEeVEvRWdGV1VJQWh2a3JuMkc5eVJWWUhac0crZUdGb0IyNEozL0Vq?=
 =?utf-8?B?ZTI4VlNjemVCaUlLZXJmYWdXMjJxTzZnd2ZxQmlQaFNnbjNXbG9EeU5Tdmts?=
 =?utf-8?B?Z0VabVFqaVdJQjVRQlJZa0hMV0V1Sm9xL1JqamFFRmtRWnVRU3lTS1pjRTBB?=
 =?utf-8?B?ZnBCSjVQdkttMXYwd2xUcmh4dXp6bUJpczdEMXVGcGFqK3lkcHZ0YUFjV0JM?=
 =?utf-8?B?RXNoZlNwQ0VoZjhmMEhFaWYyZ05mSmhURmJjbzJYMyttZTlWbE1XU3I2SUY5?=
 =?utf-8?B?VkxXZVlwQ0I5bHM5cTN5MlpEdkowbWd6cDMxMVBZQVRoU3Byc25FRm1xZWk0?=
 =?utf-8?B?WFNza1dQcVVwMW41RHdBR3JncTZEOHR4anRLL0svSVBKbnBORDAvTkhVZWdz?=
 =?utf-8?Q?vcenfUI2qQOykh792lTniy6YE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a83043ac-82d2-4b88-ce62-08db09e8da90
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5229.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 15:26:30.8605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XUoiulYyOtg7O3UOyKgMktN0riTjktIF46flGgoN6PWJGjfw/6O8/7o2pRzMI+WT0nGQqnjuklabH602MwXMzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5767
Received-SPF: softfail client-ip=2a01:111:f400:7e88::624;
 envelope-from=Thomas.Lendacky@amd.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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

On 2/7/23 17:24, Jason A. Donenfeld wrote:
> Hi Tom,
> 
> On Tue, Feb 7, 2023 at 8:21 PM Tom Lendacky <thomas.lendacky@amd.com> wrote:
>>
>> On 2/7/23 15:45, Michael S. Tsirkin wrote:
>>> On Tue, Feb 07, 2023 at 08:41:16AM +0000, Dov Murik wrote:
>>>> Recent feature to supply RNG seed to the guest kernel modifies the
>>>> kernel command-line by adding extra data at its end; this breaks
>>>> measured boot with SEV and OVMF, and possibly signed boot.
>>>>
>>>> Specifically SEV doesn't miss this feature because it uses UEFI/OVMF
>>>> which has its own way of getting random seed (not to mention that
>>>> getting the random seed from the untrusted host breaks the confidential
>>>> computing trust model).
>>>
>>> Nope - getting a random seed from an untrusted source should not break
>>> anything assuming you also have some other randomness source.
>>> If you don't then you have other problems.
>>>
>>>> Disable the RNG seed feature in SEV guests.
>>>>
>>>> Fixes: eac7a7791bb6 ("x86: don't let decompressed kernel image clobber setup_data")
>>>> Reported-by: Tom Lendacky <thomas.lendacky@amd.com>
>>>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>>>>
>>>> ---
>>>>
>>>> There might be a need for a wider change to the ways setup_data entries
>>>> are handled in x86_load_linux(); here I just try to restore the
>>>> situation for SEV guests prior to the addition of the SETUP_RNG_SEED
>>>> entry.
>>>>
>>>> Recent discussions on other (safer?) ways to pass this setup_data entry:
>>>> [1] https://lore.kernel.org/qemu-devel/da39abab9785aea2a2e7652ed6403b6268aeb31f.camel@linux.ibm.com/
>>>>
>>>> Note that in qemu 7.2.0 this is broken as well -- there the
>>>> SETUP_RNG_SEED entry is appended to the Linux kernel data (and therefore
>>>> modifies and breaks the measurement of the kernel in SEV measured boot).
>>>> A similar fix will be needed there (but I fear this patch cannot be
>>>> applied as-is).
>>>
>>> So it's not a regression, is it?
>>
>> SEV kernel hash comparison succeeded with Qemu v7.1.0, but fails with
>> v7.2.0, so I think that is a regression.
> 
> Please let me know if this series fixes it:
> https://lore.kernel.org/all/20230207224847.94429-1-Jason@zx2c4.com/

I applied this series and it did fix the problem.

For SEV, there were two problems associated with the RNG seed support:

- The first is that it becomes part of the SEV LAUNCH measurement and 
therefore makes it impossible for the guest owner to be able to validate 
the measurement because the guest owner won't know the value of the RNG 
seed that was included in the LAUNCH measurement.

- The second problem is that the RNG is set and measured as part of the 
kernel-hashes support in x86_load_linux(), but it is changed via 
reset_rng_seed() before actually booting the first time. So the 
measurement taken in x86_load_linux() will never be the same when measured 
by, for example, OVMF.

So the addition of the !sev_enabled() check is definitely appropriate for 
the RNG seed support check for SEV.

However, is the change to the DTB check appropriate? Does the DTB vary / 
get updated before booting? If the DTB file is "constant" then the above 
two problems that face the RNG seed support shouldn't affect SEV. @Dov, 
does that make sense?

In any case, you'll need a version of the patch(es) that can be applied to 
the Qemu v7.2.0 tree to fix the regression.

Thanks,
Tom

> 
> Jason

