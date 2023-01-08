Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9086616B7
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:32:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYZg-0006TC-HZ; Sun, 08 Jan 2023 11:31:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEYZd-0006Sr-S9; Sun, 08 Jan 2023 11:31:05 -0500
Received: from mail-dm6nam11on2060.outbound.protection.outlook.com
 ([40.107.223.60] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pEYZa-0000Xi-F5; Sun, 08 Jan 2023 11:31:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HxkOOg/WJ2eEKk9OhZXhh30G95sg5p7rRdz21CxYmOENykH47PxW9u0h7S1IHaIEYQ3/TdCVsjRbUyk9W0VhQqZXky1L3rWpr4e9va7Nxbuqehc6UqdL9PXyos4ZHKy0jmZCbLhpBZtO4V5FQkOgzG4HQq2udFWa1SyLphRZppbar+aob9VStIN9vPHAbkul2r7FJ+PhaRcbjgFtapvuLBE8Qx8K7/NWGsv0R4OOWaRJCWGyd4jiVmAJYMVZvvsT2eO0VfqZ7vkKQ57l1yE4ihGXd8L/gAH6D8UyAT7MRofQjNUyDIjj9bx8e7VV1/GJBu1NVj6ZIj+aLPckp/T90A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C8i25/r1A3CJUP+RYHwUzAtruOHIbOUXvtcgMc07oMs=;
 b=EYiF5kRNRWuCbMbWID9WNP1+d+NmsTxyHm18vSxef/SUR94aIwi7jTo7NjRl0NzjD6z11d+RJN1AyKAlyq5KwZBMnMDuuDlQShbtiG8zv96I9ciQVXEBRLj5B941CLXxZq9wklut6TsSodZ6u6xj56fifUino5ZGGxieEnMeizJb16WAdiH2ewwuyII5SVwaLMxM69jBtqWRyQpy9pw6l4n0f7S/C+j8w6xuYr8C9FWQz2uIP4/lhigUt703eijST9Fq2uE8KPw64DA5GAQYPIfLc34KwUCS480IUcMsynwxdKzLl+cUpG9G8uG4j3xIcsEBFyC0xUwa/5uG9aVFtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C8i25/r1A3CJUP+RYHwUzAtruOHIbOUXvtcgMc07oMs=;
 b=Kt5ZkBj1HG5/9LtvWit41778+AZ/ekUgoZSVrIcOD9gAz/BetO0BbJ5/VPnF5g8ClQbwoNQz+6etik2HFn9tWw/eLO50zvgCl//UIMwdH9PYDvbQgWM8WobGCjQkwjUf2eqMvPeuYAUY2Jmqc3oatHyb3okVhyb7wrQIjex6cSSbEgmkQ/B5AaYJbxnQeICwJOqlXHc7qC5d9ePQIDR/QRXZWOEWSvLdDTDEHl9anEyslWE6hx8HaXwp8woIPcQwh5ezz1+l2ZmZSjExVu+rNtYZEXSVt3NINqb7VBr/Kgy1kiDf7NZ/9oTkkysqt2Wk7XzLSRCUR/nCzuw0Yp2C8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by DS7PR12MB5816.namprd12.prod.outlook.com (2603:10b6:8:78::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Sun, 8 Jan
 2023 16:30:55 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::451d:1f37:aa83:f425%6]) with mapi id 15.20.5986.018; Sun, 8 Jan 2023
 16:30:55 +0000
Message-ID: <506fe99b-d0c8-ba53-004b-b80ed1a118b1@nvidia.com>
Date: Sun, 8 Jan 2023 18:30:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 03/14] migration: Simplify migration_iteration_run()
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
 <20221229110345.12480-4-avihaih@nvidia.com>
 <20230106105608.0d74a96c.alex.williamson@redhat.com>
From: Avihai Horon <avihaih@nvidia.com>
In-Reply-To: <20230106105608.0d74a96c.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0628.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::6) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|DS7PR12MB5816:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ae1b1a-0e34-4e31-4acd-08daf195b703
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: da/8kX0O8oQrRW7T8kSAMRYK6+3bmwjE1TBEYpDWz0qg5RgI/MaHz0BaaVIK7bHt0bogHURYfLZ8+VceeqY7c8oGDrwAzGGwrQ0K+xkgKkpZUMcXQjU/L9460hRFYTaY1vvqDCpNtZUXMgsRgffoD7YSMfeShfXvrQ3Ul/4qH3p6BfwC78p7KNFw3hP9EtNjMojkzYdDOdTLVUDiffzkbbF44lJDnBoNJ70cVGZ9jsIfoDuF4roTP2kH9I2e/htQL+JmLTYgfO0cgWWCvCmYUPpakBsY8/9HawxVe6av8/2R162nNeO/E+99hVHtLaoVPl9WjLHvGWZ8Rbz1tP93msKS/pT0cej3KhDDerrcYKf/0EcOOoCAILfDfW7jxmsfrw9xDEYI9+9er9wV22h1YivkfKGGkht6CUMCI+SAHtN1IFdwnAe9kV5t6RYeO2Crzn7+vOxG3yFeRS/ZRhLra2+XdqqAgTDshgth77321iUVvvd28uz4qbv6Xxh/c46F8rWWhGufKcWsoeudb0CuQ5pRwJcMz+7nGeVCexA4EM48Ux4T3VPvpgABMRXOA5yfElQwrx8Yb/x30BM1e5c0iSn11x8URrSpq2bAF2Z6PdXBELqtT6AQTOngjMqvUNz6ZVdIDl344DXvQB27I9S1fT+VnfPkUDdo60J/WYovAhLV6C19nQPEPkDMWafPOI2+46HERjbSfbUoLoPPX/qzkq5nNh90jn22dZNtqJwXy5F/h1JgOljvlnMZ/uJVABMz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199015)(316002)(5660300002)(7416002)(6512007)(26005)(186003)(6486002)(966005)(478600001)(2616005)(31696002)(41300700001)(66476007)(54906003)(4326008)(66946007)(66556008)(6916009)(8676002)(83380400001)(8936002)(86362001)(36756003)(6666004)(53546011)(31686004)(6506007)(38100700002)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDFPeEV6Nng1OTI2M0pYeCtZVVBDMkFyN1ZKbmlOZ2VacmdqK2ZGTGJTb2xW?=
 =?utf-8?B?UUt0bkttcy9haXVBUmFVSzkva1grL1c1M3QyekZZc042UWljeVBOMDFlRUlL?=
 =?utf-8?B?RisyS3RkTlV2aStFaHBZOXg5Q0hwUUlPWTNwdTlUNm9ONUc4UXBtZ0lNbUFJ?=
 =?utf-8?B?QXlHdkJKVXp3clRkcWtiV01ZMk5oM3BaYjY2cGNnem9kTWl3dXlUMmZSRHFU?=
 =?utf-8?B?TFJYQ3BiSmhrNS9zTTVvM2lCN0xnckd1T0h2YTRJUllPZFBidnVLeUgzbitJ?=
 =?utf-8?B?UThDbFhuWk1TRTdiRUY3eXd0eXZDbTFrRElQcndpcWNZZ1QrU2k1SkZBS3d2?=
 =?utf-8?B?WXZIN25lU1cwblpvcmRKdWJUMGRMdGxNeVRzM2VZcGpsalZ4S0k4UlZHY3Ew?=
 =?utf-8?B?T25sdHZVZFp6blhYSnVKU281blcyTks4TmhjbHNaTHl4WGFnOVZ4RHZndlNJ?=
 =?utf-8?B?SkxXWjMvdlZNd2NVSnhHdjh2VmNvY29jVWQ4RXdSczVrWmZXd05Fd0VSbDBH?=
 =?utf-8?B?bG5mK3h0aU5IcE83M1NKZ0p2a2FPempyeUNvSjY4V0o2Q05QemN4VUk4eHgw?=
 =?utf-8?B?TDlKNUFIV2tpRmhLcFJ4VWh0MHFTTG9ITFcxbFR4WGNuaytBS1Z1aktKYi9S?=
 =?utf-8?B?eGhHMXB1WlpsZ2FLeHYzRjEyUXhua2tCSjRPajdKMFY1L0t1OWtMWDVhT2VQ?=
 =?utf-8?B?V3BEcGRnNVhmUnhDdVFMTWh3LzlmcWZjTWtCSkV6bmtER1dMclRKUmxhaGNV?=
 =?utf-8?B?QjFDNDFScDFZbUlweTFrVHNZNUVwL0dsdHBIc1lOMGFENThEajBOeGx0YS9R?=
 =?utf-8?B?ZmtNcForYmpWLy92aE1JK0hncmRXOXhXU3F5WlBMSDBDNUxwS3JIdWxNeVh3?=
 =?utf-8?B?T2hKQjZNNEFJUkxqRzVVTnFCTk5uS3l0QTlUME4yV0FiQ0RuQnRqWlFxYm1B?=
 =?utf-8?B?cDNZL2g0MWJHRmVIVHNzSDNqYTR1YTFXZjhadFcxQ3NLMk1HYVVqMVhJUW5h?=
 =?utf-8?B?UHlGUE5aekJCZnpxa1liUFVHeE8wTWU5WFdzdVRVSUhsUVAzSmRoYVRFYlg4?=
 =?utf-8?B?VFdTMzNjMTN3MTFuU2dXSW0xbmQ1K3pYaWF6aEdGbm9VaFV6MUdXM1gxYmw2?=
 =?utf-8?B?YmNrS1RBSHg1am9LdFQ4bm9tdXRXd2NRUTVXbjkySmZOV2NGb3h1eGg3VGhr?=
 =?utf-8?B?VXBEZnJxN096YTBtcWs3N3o3QUdPY0xyVXlFNXUwUkZ1bVlYK1o0N0NqeVkz?=
 =?utf-8?B?bGVHclpNZGZZUS9yZWtDamVPNHo3YmZnWEN3SG5FM3YzUXQ0ZFppWXp4dHEr?=
 =?utf-8?B?VjZ2V1dIMmJ6YkFhWFVXZ0xYY285VU02SDJkRlVwa0ZsZklibkoyMjdmNUdL?=
 =?utf-8?B?TTJadzM3SWlyUUM3S2RsRUhNWm13eWd6bk1Xc3A3VnAwREJrRU1SSDh3bFJT?=
 =?utf-8?B?bEk5ckFyNm1iVmlGM1hmVVIwK1FhUGRGNFptaUZuSEtNclhMTHp5anBCN0ty?=
 =?utf-8?B?cWFMSmNzejRxNEJ4OGJ2NXJNSTljSVlFQkFXUHExMWY2TlJ3QW55c0JGNGNU?=
 =?utf-8?B?K0FQNERMTWIrMk56RFZmbFloM3g1Z2ExekxmTlIra0xIZnNObmhFekE3NFg1?=
 =?utf-8?B?SnIvalNzL1VLM1dlVHIzdkxIbWZ6V2xJNmZnaXRib2JCa3hxUE5tUVJGbUpu?=
 =?utf-8?B?MnFIT1FoOCtQOTRHYi85RlpJeGxYQm5kbjhRUk5WS1d1cThKaDh6QkVkY3dP?=
 =?utf-8?B?TU5uZ2YrM3lkOUtHZEJRQnR6N0xycDRBZm4vYkZybG9lYmtvenMyYVZUS2xp?=
 =?utf-8?B?WTFhVDhEUmMyUGJkNHVMcy9FKytjL1FtZkdqYk0wb1hBZ0ZOZmFRcmd6TDJQ?=
 =?utf-8?B?ZUZxakk5OVBvd01yS1BobGFFSVROWHpraE9uNXh1TndsOHZjaGhtWFIwMmFn?=
 =?utf-8?B?RXBLWmFkZ1FRSjZlZlZqVnF1UGxrK1RvYzFLS0ovdTdvRTNzQzI0KzREUHF2?=
 =?utf-8?B?bE1iZXZ4YS9qSXhMNUpBaC9CSGlEYjFhVDhhbmhWTU05a013RnFHV0pPdHR3?=
 =?utf-8?B?dWk3cG5HMnZ4eDdxQ2lwTTNUM0RBaThWOEh3T0tRV0dHTW5janZndHV0WTNs?=
 =?utf-8?Q?OSkGKgxCcdxBlFetDoKrhdA4l?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ae1b1a-0e34-4e31-4acd-08daf195b703
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2023 16:30:55.3119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmIZyKQCSlTV3Vmp4l3u2zKuMAKEf3zTMMaf6isqhorBcEDBzT5EC0lr6vgBFbkWkRK9gR4XICM9/+nroqmY9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5816
Received-SPF: permerror client-ip=40.107.223.60;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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


On 06/01/2023 19:56, Alex Williamson wrote:
> External email: Use caution opening links or attachments
>
>
> On Thu, 29 Dec 2022 13:03:34 +0200
> Avihai Horon <avihaih@nvidia.com> wrote:
>
>> From: Juan Quintela <quintela@redhat.com>
> IMHO, there should always be a commit log description.  Why is this a
> simplification?

Yes. It just rephrases the condition so we can drop the else {}.

>    What does it allow us to do?  Nothing later obviously
> depends on this, why is it part of this series?

Right.
This is part of Juan's RFC [1].
Eventually we didn't need the RFC because of the new MIG_DATA_SIZE ioctl.
Since Juan already did this work, I thought I might as well take some of 
these patches.

I will simply drop it in next version.
If a real need to simplify this if else condition arises in the future, 
it can be done then.

Thanks.

[1] 
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/

>    Thanks,
>
> Alex
>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
>> ---
>>   migration/migration.c | 25 +++++++++++++------------
>>   1 file changed, 13 insertions(+), 12 deletions(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 9795d0ec5c..61b9ce0fe8 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3758,23 +3758,24 @@ static MigIterateState migration_iteration_run(MigrationState *s)
>>       trace_migrate_pending(pending_size, s->threshold_size,
>>                             pend_pre, pend_compat, pend_post);
>>
>> -    if (pending_size && pending_size >= s->threshold_size) {
>> -        /* Still a significant amount to transfer */
>> -        if (!in_postcopy && pend_pre <= s->threshold_size &&
>> -            qatomic_read(&s->start_postcopy)) {
>> -            if (postcopy_start(s)) {
>> -                error_report("%s: postcopy failed to start", __func__);
>> -            }
>> -            return MIG_ITERATE_SKIP;
>> -        }
>> -        /* Just another iteration step */
>> -        qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>> -    } else {
>> +
>> +    if (!pending_size || pending_size < s->threshold_size) {
>>           trace_migration_thread_low_pending(pending_size);
>>           migration_completion(s);
>>           return MIG_ITERATE_BREAK;
>>       }
>>
>> +    /* Still a significant amount to transfer */
>> +    if (!in_postcopy && pend_pre <= s->threshold_size &&
>> +        qatomic_read(&s->start_postcopy)) {
>> +        if (postcopy_start(s)) {
>> +            error_report("%s: postcopy failed to start", __func__);
>> +        }
>> +        return MIG_ITERATE_SKIP;
>> +    }
>> +
>> +    /* Just another iteration step */
>> +    qemu_savevm_state_iterate(s->to_dst_file, in_postcopy);
>>       return MIG_ITERATE_RESUME;
>>   }
>>

