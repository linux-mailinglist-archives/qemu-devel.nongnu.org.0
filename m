Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3044443164
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 16:17:46 +0100 (CET)
Received: from localhost ([::1]:44802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhvXl-0001jf-MT
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 11:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mhv6A-0004Fj-Q7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:49:16 -0400
Received: from mail-co1nam11on2073.outbound.protection.outlook.com
 ([40.107.220.73]:33896 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brijesh.singh@amd.com>)
 id 1mhv66-0001mE-PH
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 10:49:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJOSd/dlAMHkRJA1G0zt79h71vOc3BxuxOGwYqJu6Y76NaatIep9Tn8MJpeHrBlvdzB7Go43pejUVkaetNnTVz8LETvyiNZdrkY0b6sZzVxnynmgFinQ2mHlxefWLmy/yzCHtyVp6DSpBqZvtA7dkZWvA2KilrYHx0zi2NJv98KYhyRuSnuk16JE3D9WO9f0nTAYXCy4MJG7GDGtHUk2/FTPr7Hi2gLFgm3gJr6y5llyDCMpXa01tff6ksDl2ZNuhU4KoSCcPNIgYsDn3riLpAe19C62wvz6LqO7XGpD2m/bsYU7gqDHW/H/R9BDQ/Wn02HC7nluMO2IKdcFgguIhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kM11VHTyITQZcOjfUghPk/TqqM1PHMSRty130HT3He0=;
 b=Ib88MZm3wKGtYIS0hDzmIXo8ikct6ww4JNmb9TfYf6+Fwx4u6JR1pxDAA34AVSq44lB478jakDnW1W3hiTV8uGFG1GQjtsqxN+u9+/gmFhWVd7Oc3bjWpkM5ChHt/wSNCTshmJi/k7cw4wPCrrvk2Z9KMwRryKyUtYmldqtnFGSe1xLEBnB1UoKl7tXcVhb85YNeQXWGxDjU6QwhzO9nj3HNDT8eM37zqlMHpJgFae6JymYznrQ21byXT6r4Tw1UAxCIaPWT91lVlFtaf9zyvNg0voP7a3XjYvpmXCT334T8Fkk/DIwgjEQVsw6DcHYciVW7syyP84NR8mDbeBfC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kM11VHTyITQZcOjfUghPk/TqqM1PHMSRty130HT3He0=;
 b=lD6m1xIlYd3tq6o3yPjJqwv1IpYg8LdaXwSlC/RzUpf7ktPslgJ3All5tKIZC0Pu2LOsKlLrvZBVkAq7OkPWym33EQHGy4H+mgvg9qy0aA/3xSJqk5ligQNtij1s4BetBsRPz1PK9HJ9LZIxLkDICndNukAgMScCqPC1qYZJdk0=
Authentication-Results: linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2718.namprd12.prod.outlook.com (2603:10b6:805:6f::22)
 by SN6PR12MB2783.namprd12.prod.outlook.com (2603:10b6:805:78::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Tue, 2 Nov
 2021 14:49:02 +0000
Received: from SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c]) by SN6PR12MB2718.namprd12.prod.outlook.com
 ([fe80::e4da:b3ea:a3ec:761c%7]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 14:49:02 +0000
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
From: Brijesh Singh <brijesh.singh@amd.com>
Message-ID: <9e4c0415-4153-e234-7c59-872e903e6567@amd.com>
Date: Tue, 2 Nov 2021 09:48:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <39de4c3a-4351-3705-0962-7bb8d496fe28@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0049.namprd03.prod.outlook.com
 (2603:10b6:208:32d::24) To SN6PR12MB2718.namprd12.prod.outlook.com
 (2603:10b6:805:6f::22)
MIME-Version: 1.0
Received: from [10.236.30.107] (165.204.77.1) by
 BLAPR03CA0049.namprd03.prod.outlook.com (2603:10b6:208:32d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14 via Frontend
 Transport; Tue, 2 Nov 2021 14:48:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d7839db-cb42-445b-15d0-08d99e0fe8f7
X-MS-TrafficTypeDiagnostic: SN6PR12MB2783:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2783125D692565BEB6E72336E58B9@SN6PR12MB2783.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l3oACRxtGh/DF+POmx2Rnas0H8g3iXQcfUiGvsf7A6uqRjVxOiLbSqvuoCvWsXWE54/TfcfsMmoQ9FTX+Cr3siHFEvf0Cwn+vEN+3X0VlTBNU8sXLERfJHVtgdV42OUQLAhT/KPatfxEe+SpyiYICFkL+5Ng4cysP7zTFdamqI11iT98StVExiBufSnlyzrC4zKVTyfD4ZL4UF4CztVOAwKEJWlCi77eBrGdYq9dnUokNLOW4xJl3qx0LJVh2ndpcQ69++U2bfRaMrpDqGsVE4w5BAcN0D8+AZFHXQJTAxofCA0Dtfj06YoCzGe14T/jVjWj5bEd7wFrWKrIkgVkQBU9HZP1AGizWICW1AbV2cq1z6NGHZV4eHYYdhbOIyF1f5h3JLXwRsDhAAiBWn55uAIuDVmJughSEClH656bOuBneH1X39Ej9pju6Fi02FrfoBdLBxZbeRYlm8ji+XdfvZkiKL2Ag62DAqcmLSEJnUAbNqDHyMt7Ldw7O0TNIqrAHcVS3XAd5czleB+p2oOAGzKBnsfB7CHXpFEPUxi5OMB1ic2AKlxod46/6LHqgFMDP+OeMr5jlm9+Ao+TomlxzQNXt6dtoVn9dvxulzoC5CKIULkJSY2CgN70lEsH2pOkBBtSO+1/Sv5DFdcItutee9wQYPQ2akvgNBQvO/fLdwjY1jjxh97CgyG5Vdyh9RMknaOlWZZvmRjDke73Xa6vQuppwY31O/uo4bu/dDwEOpjFoFh6lrMj7waxCwWxuImKNzR6n+BmpZqxFP7X5N3h5b3lyguUYcveS+ssrBy5CWJt9T4NnBqcdM62X0mwkutObfdFdVlbuLN9m7FOproYTuTaXOWew1YhA0WskynR4h4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2718.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(31686004)(53546011)(5660300002)(19627235002)(38100700002)(4326008)(44832011)(966005)(45080400002)(6486002)(83380400001)(508600001)(54906003)(8676002)(66946007)(8936002)(66476007)(66556008)(2616005)(956004)(2906002)(26005)(186003)(316002)(31696002)(16576012)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WU5nWXg0QjEvem54aTVtRlIxMEIvaW80RHlHb21heDI0eGpKUEEwSFVRa3gz?=
 =?utf-8?B?TmJLWFNYNWdta21hUnBCZmVHMmdMd0ZpczNWNkoyeDY4eks5TnVQUUI5K3Bh?=
 =?utf-8?B?NERTd3lKck9VeWxvenA3WEwrL0hWY3V6ZVJGeFZCSzhjZzAwRXM3NEZSenVw?=
 =?utf-8?B?bERSY2lXZ1dCOTBiV0hKNlYxczJkdEtiR1dCK0FHS21ub1F3VVkxUjVJZkFF?=
 =?utf-8?B?WTVMd1g1NlAxNEpQQTROT3JvS2YvUE83SGtWMU1ad3l3TThhUnQ1eDg0K3h2?=
 =?utf-8?B?Q0ZjM0JnR2hsaktEMXNBeFZGbGtpVEdCSUlLRk11UzFidkg3MlJkU0NDTzNi?=
 =?utf-8?B?S25GcDUwcWN1NTBYWk12STVHZUY2bUZOOGpiTE9zWkZJbDJhRXB2N1dKZmta?=
 =?utf-8?B?bE42WFBUKzJVSXcxUVIvWG1SQTN3NzhQTXB4MmlYUHR4T3FmQzZTSlpFaXNu?=
 =?utf-8?B?VmZJUFRxVkw1RkowbGJNQkJ6Y1JnTFdOREdNY0MyeHpRbnNMb2lPMGRFbHd2?=
 =?utf-8?B?OE1qUUdJcGI5dkI2VXRGZlZpQURleHVuQ3JxTHFLcHpMbnRIOFFYSSs3Wm5l?=
 =?utf-8?B?VTFkYzVvOGM2Mml6YnRvbXNtKzMxd3ZCQVRGeWg2S2M1SHp6bjdCakVFR3Z5?=
 =?utf-8?B?WkhKc1BURENjNkdKb2hpaGRzcC9VMGpDb2l0SFUvREpCZXNiUDNldjBlVjli?=
 =?utf-8?B?VHJhOUVEQ1pYaXUwcWVWaTBlZmlCVnRKcEgrOEJHMFJTMXRHYUFMOVFyQlNG?=
 =?utf-8?B?N2I2NDVEaEZlT1U2MS93dkcxa2RQUGxKMTRObGRpUGIzeGloN2Zjd01pVEhO?=
 =?utf-8?B?eXI5dWZiRWY0b3ZHYnoycVVlMXh5NXg5dk1lUEF6RWdia2VVUlVnUmFOeUlr?=
 =?utf-8?B?TGVOOE8wbDJUalVNTUhiNGVzQ3VxcHI4cnVxSkRvNjczNG5oRHI0Tk5WRTlV?=
 =?utf-8?B?QVBmZlpZbWNNQUhPbnR6Z1lzWmUzVjNQaGhKNm1wc0dodkd3bGNNY1NXT1Zz?=
 =?utf-8?B?dWN4ZmtWWWtTc0hLS2VLdGxRUGJDK2hGdjgydWFJMTR6N1p6WkNZUUs5UUNB?=
 =?utf-8?B?WU4wZVJHSGtMLzFCSS9DK2dZYmNic0d3SFBudWpPNWl1M01kQ3g4SVAwQUw1?=
 =?utf-8?B?eVZJTUNzOVBGcFREM3RDRnBXSDJhVmNkVktHdHpQb1B1aU5kWEtXTmllR09y?=
 =?utf-8?B?V1IrUjlnaGN0ZzVlNmRkUzVSNGpBb3g4NEx4TmJFS05SQ0oydks0eUttUWUr?=
 =?utf-8?B?OHFSS2YrZmdseHpXUy93ZnpJelJ0Ryt0cUl1bVQzUWRKU1lTMjhlcU9MNmI0?=
 =?utf-8?B?dzF5S0NVVDUrNDdNUXJiM2tCZTBnd09md0hOYll6Y2JnbHQ4SWl4R25KSzRo?=
 =?utf-8?B?SXhXTFM2TitKZmtNK0dDQUFDNHNFdE4rS200cnNOc2tESXc3dXRTeU5ZT2cz?=
 =?utf-8?B?cUV5a3dKeG1qQWxkNDVRODJGSWJ6R3J1YmVwcHkxdkVYbmZTdmhocU40S05H?=
 =?utf-8?B?U0dWcTMxbkxnUlRpZmtFL05USlJPbjQxb0N2TCt0ZEd2OGVDKzRHcHZ6Nmpu?=
 =?utf-8?B?dGpZVmRmM2hqYlk5Qk5mSzJPSnpRM0wzTTlLUE9uVVNCOVAzb25OUXdLaDlk?=
 =?utf-8?B?VkprQnNaREV5TCsxd01kWU9GZ2cxb2V6NDlyRWdySHlob2ppZFFrQXNYeUw4?=
 =?utf-8?B?aTcwYmY5T1BqdVVBdDdQVnYyMCsyRnBCVWtvZk52bTEyaGRQcjdWT3ZuOUM2?=
 =?utf-8?B?OG9vODRvVVJYRm1YY3hTMVNjaW54Q3JPL3BHZzN4Z2hxdE5SbWlXeXJuUERN?=
 =?utf-8?B?enEvQUFIU2FqenY5OHZDUmM1djkyNXlEL2JUd1hZYnQ2d3ZwckFMZ1hlUEZq?=
 =?utf-8?B?U1Ard0lPYXZmU0c0RlRENW9RYzdobTAyM1ZiQjRuR2daRkFaSGpwZlA1dHhG?=
 =?utf-8?B?WXRIM3dzMFBpeEdhckhtM2ZpSTVJdVNYK2JWbXV0WlZybTJwRzJIYjRlbXh4?=
 =?utf-8?B?cG0ycjZDbjYrSFhiakhxcjJUcWJ1V2pRdFVvajVRQ3R6N3U0Q1ErMVlFVjN1?=
 =?utf-8?B?NGl2Y0tSWCt0bGJGaXZwbTBxUmJ2cVkzZmlaUkhtS0dvYWRQNVdGbVNDbEtD?=
 =?utf-8?B?dURqZnBEK3liVUtPUmx1UGJrNzFyR01SQzdHdy85bHUvV2o5eUpraU9rMjJt?=
 =?utf-8?Q?cYTyNLIIX9gZDcK8ubrKXso=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d7839db-cb42-445b-15d0-08d99e0fe8f7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2718.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 14:49:02.4358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6mc3MRs7eb82Wwo1TxFvZV7VrJKdABCjp5ckh2dEsAvSWWYnqlzi4Af+CQ0xrsyLsfgZuN/Dl+rl7iUJS0DXtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2783
Received-SPF: softfail client-ip=40.107.220.73;
 envelope-from=brijesh.singh@amd.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_NONE=-0.0001,
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



On 11/2/21 8:22 AM, Dov Murik wrote:
> 
> 
> On 02/11/2021 12:52, Brijesh Singh wrote:
>> Hi Dov,
>>
>> Overall the patch looks good, only question I have is that now we are
>> enforce qemu to hash the kernel, initrd and cmdline unconditionally for
>> any of the SEV guest launches. This requires anyone wanting to
>> calculating the expected measurement need to account for it. Should we
>> make the hash page build optional ?
>>
> 
> The problem with adding a -enable-add-kernel-hashes QEMU option (or
> suboption) is yet another complexity for the user.  I'd also argue that
> adding these hashes can lead to a more secure VM boot process, so it
> makes sense for it to be the default (and maybe introduce a
> -allow-insecure-unmeasured-kernel-via-fw-cfg option to prevent the
> measurement from changing due to addition of hashes?).
> 
> Maybe, on the other hand, OVMF should "report" whether it supports
> hashes verification. If it does, it should have the GUID in the table
> (near the reset vector), like the current OvmfPkg/AmdSev edk2 build. If
> it doesn't support that, then the entry should not appear at all, and
> then QEMU won't add the hashes (with patch 1 from this series).  This
> means that in edk2 we need to remove the SEV Hash Table block from the
> ResetVectorVtf0.asm for OvmfPkg, but include it in the AmdSev build.
> 

By leaving it ON is conveying a wrong message to the user. The library 
used for verifying the hash is a NULL library for all the builds of Ovmf 
except the AmdSev package. In the NULL library case, OVMF does not 
perform any checks and hash table is useless. I will raise this on 
concern on your Ovmf patch series.

IMHO, if you want to turn it ON by default then make sure all the OVMF 
package builds supports validating the hash.


> But the problem with this approach is that it prevents the future
> unification of AmdSev and OvmfPkg, which is a possibility we discussed
> (at least with Dave Gilbert), though not sure it's a good/feasible goal.
> 
> 

This is my exact concern, we are auto enabling the features in Qemu that 
is supported by AmdSev package only.


> 
>> I am thinking this more for the SEV-SNP guest. As you may be aware that
>> with SEV-SNP the attestation is performed by the guest, and its possible
>> for the launch flow to pass 512-bits of host_data that gets included in
>> the report. If a user wants to do the hash'e checks for the SNP then
>> they can pass a hash of kernel, initrd and cmdline through a
>> launch_finish.ID_BLOCK.host_data and does not require a special hash
>> page. This it will simplify the expected hash calculation.
> 
> That is a new measured boot "protocol" that we can discuss, and see
> whether it's better/easier than the existing one at hand that works on
> SEV and SEV-ES.
> 
> What I don't understand in your suggestion is who performs a SHA256 of
> the fw_cfg blobs (kernel/initrd/cmdline) so they can later be verified
> (though ideally earlier is better).  Can you describe the details
> (step-by-step) of an SNP VM boot with -kernel/-initrd/-append and how
> the measurement/attestation is performed?
> 
> 

There are a multiple ways on how you can do a measured boot with the SNP.

1) VMPL0 (SVSM) can provide a complete vTPM (see the MSFT proposal on 
SNP mailing list).

2) Use your existing hashing approach with some changes to provide a bit 
more flexibility.

3) Use your existing hashing approach but zero out the hash page when 
-kernel is not used.

Let me expand #2.

While launching the SNP guest, a guest owner can provide a ID block that 
KVM will pass to the PSP during the guest launch flow. In the ID block 
there is a field called "host_data". A guest owner can do a hash of 
kernel/initrd/cmdline and include it in the "host_data" field. During 
the hash verification, the OVMF can call the SNP_GET_REPORT. The PSP 
will includes the "host_data" passed in the launch process in the report 
and OVMF can use it for the verification. Unlike the current 
implementation, this enables a guest owner to provides the hash without 
requiring any changes in the Qemu and thus affecting the measurement.

One thing to note that both #2 and #3 requires ovmf to connect to guest 
owner to validate the report before using the "host_data" or "hash page".


thanks

> 
>> Adding a
>> special page requires a validation of that page. All the prevalidated
>> page need to be excluded by guest BIOS page validation flow to avoid the
>> double validation. The hash page is populated only when we pass -kernel
>> and it will be tricky to communicate this information to the guest BIOS
>> so that it can skip the validation.
> 
> So that again comes back to the earlier question of whether we should
> always fill the hashes page or only sometimes, and how can OVMF tell.
> 
> How about: QEMU always prevalidates this page (either fills it with
> zeros or with the hashes table), and the BIOS always excludes it?
> 
> -Dov
> 
> 
>>
>> Thoughts ?
>>
>> thanks
>>
>> On 11/1/21 5:21 AM, Dov Murik wrote:
>>> Tom Lendacky and Brijesh Singh reported two issues with launching SEV
>>> guests with the -kernel QEMU option when an old [1] or wrongly configured [2]
>>> OVMF images are used.
>>>
>>> The fixes in patches 1 and 2 allow such guests to boot by skipping the
>>> kernel/initrd/cmdline hashes addition to the initial guest memory (and
>>> warning the user).
>>>
>>> Patch 3 is a refactoring of parts of the same function
>>> sev_add_kernel_loader_hashes() to calculate all padding sizes at
>>> compile-time.  This patch is not required to fix the issues above, but
>>> is suggested as an improvement (no functional change intended).
>>>
>>> Note that launch measurement security is not harmed by these fixes: a
>>> Guest Owner that wants to use measured Linux boot with -kernel, must use
>>> (and measure) an OVMF image that designates a proper hashes table area,
>>> and that verifies those hashes when loading the binaries from QEMU via
>>> fw_cfg.
>>>
>>> The old OVMFs which don't publish the hashes table GUID or don't reserve
>>> a valid area for it in MEMFD cannot support these hashes verification in
>>> any case (for measured boot with -kernel).
>>>
>>>
>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F3b9d10d9-5d9c-da52-f18c-cd93c1931706%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7Cffa0a5981860476c3bcc08d99e03d3d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637714561554218974%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=591wZvEzQQQ6JBjLDhGnvEM8fxX6iky9yxlWn2pifjI%3D&amp;reserved=0
>>> [2] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fqemu-devel%2F001dd81a-282d-c307-a657-e228480d4af3%40amd.com%2F&amp;data=04%7C01%7Cbrijesh.singh%40amd.com%7Cffa0a5981860476c3bcc08d99e03d3d7%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637714561554218974%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ihwNJjetXq5I0WaLjEFzhtrKMbj%2FaFmOmn1xYlLowjg%3D&amp;reserved=0
>>>
>>> Dov Murik (3):
>>>    sev/i386: Allow launching with -kernel if no OVMF hashes table found
>>>    sev/i386: Warn if using -kernel with invalid OVMF hashes table area
>>>    sev/i386: Perform padding calculations at compile-time
>>>
>>>   target/i386/sev.c | 34 +++++++++++++++++++++++-----------
>>>   1 file changed, 23 insertions(+), 11 deletions(-)
>>>
>>>
>>> base-commit: af531756d25541a1b3b3d9a14e72e7fedd941a2e

