Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5752F631A1A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 08:22:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox17r-0007Dn-HU; Mon, 21 Nov 2022 02:21:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ox17d-00078C-8f; Mon, 21 Nov 2022 02:21:43 -0500
Received: from mail-dm6nam04on20607.outbound.protection.outlook.com
 ([2a01:111:f400:7e8b::607]
 helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1ox17a-0007iz-Rv; Mon, 21 Nov 2022 02:21:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUiTh5Ioq0DXgiDfD2suPLcepH+XWW5r/L5ql3+VpdpMKmRE3nu2TH72owABtvzNMpZx72axFQPWoqfazxkkGEyeZmcQurnARgai0KuQFyXAPNU8iY6T4HkdugGJLBF80KK3Q1fPxquSuZy2ELNMEs8HZWuvpRThPycZmlj2E6qIZGEhVOhK8lhRa0vT8fFJA7kdcBHqx5Ind2pbkpi8/flEBw9CquxeuwkQCTCisnN1ztl+Vlo8B1tfHw58yrrxF4SG83Gb4IwoI+rsxzD0ss12xt4j1Ty4eSn0yebBxP52Xt/1YtFV9uviFAEp1AWtt2vycjdrbwbH1CLjY9WacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zf9PgNqHTpU/kJ8UC3MxN9uR6/l1vGMnMCIeZuAJKK4=;
 b=XXCJlzKmWE3077vPyp3OCEkgumDFLgBFmTTIs8Rd7gugKlvAb8OSAUAFLSlfnA/o95ZNyuVwyQR3lbsmtr6KYvx5JvtmV8g9Fq1i+7wWAIv0CUZ/YBi62tCSAHNwBR0kqJ7N+8PbDLpoDGvzJqttd7dX+0rQPdSnQIALeWBXtkYTnsHliB3YHRUFtISvfB9zGbRfgfiM5r6dtRPCxlByZLUtYZYYQWr8BM7tfwfNwEqmVXz78cFbIn0vpHsXSnDIGxxvJ+ZejwAEhDphxYHwIFJHNa7c+Tn7gHGhrgB6F3y0uGZ6kYCHuCY+KKythaWfkCIEORUupY8cjD3JAw+r2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zf9PgNqHTpU/kJ8UC3MxN9uR6/l1vGMnMCIeZuAJKK4=;
 b=MMmzzDQgIk2euvmLMt9kJqS1rewAHtHsZopW0torV+Ep5ecxdFQwxr6Ao5jOwoQPvFvRxh688oJeGg9VOSUwF8zJk1j00TTwITmER7bWKm/V5S89IHEJMLg/j3P1t3TLVlXQExEUmFJM3R1oxWDEv09OaLx5EX9ICeNdzFGNOWCRvtU/isMur8bfVlQgwiw5qYRdOPt34iQ2HhzJE9swGCA7NbjM37OCh4xsUl3wIfseO6Rmpv5OTA0G4FhJ3gya4B4ksqDZgNSlcZJAhdi6iUqUuar9RhL9JLM4mQEsuGAyfbpKkN0H/m0O5MkdiA5cm3oOj7ct/bil1SGBNlgnIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB5549.namprd12.prod.outlook.com (2603:10b6:5:209::13)
 by SA1PR12MB6726.namprd12.prod.outlook.com (2603:10b6:806:255::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:21:34 +0000
Received: from DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece]) by DM6PR12MB5549.namprd12.prod.outlook.com
 ([fe80::820f:1fa0:9353:bece%8]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:21:34 +0000
Message-ID: <58611bc7-e05e-7be9-00eb-b92696c5df3b@nvidia.com>
Date: Mon, 21 Nov 2022 09:21:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 03/17] migration: Block migration comment or code is
 wrong
Content-Language: en-US
From: Avihai Horon <avihaih@nvidia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 Kunkun Jiang <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
 <20221103161620.13120-4-avihaih@nvidia.com>
 <0950214f-167a-9176-0ae3-15518d4e9d5a@yandex-team.ru>
 <88bcb40d-0ec0-e991-dd89-deb241a3063c@nvidia.com>
In-Reply-To: <88bcb40d-0ec0-e991-dd89-deb241a3063c@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0102.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::17) To DM6PR12MB5549.namprd12.prod.outlook.com
 (2603:10b6:5:209::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB5549:EE_|SA1PR12MB6726:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b60e280-84f0-4242-4c73-08dacb9104ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+2I09DBrN4sDAGHQyCfHGr1hOzl2FuCwkVcR+xLUXUCdOV5RO5fAAEj0noNBNvV3bp87hbtw+lcEF2eMNnAVmLdbBo3GM7snCECrDqc0Go8GsD2HViiguuMxwxHl0g9kyb432zKjjUqavCqiiCmmoNgjHNKjYNK/a0wReoQbyVtj84vtdidGBkgOtk+XNHAnSz7xIG05fpTq7z4X/S/gQNhQa1GDI41Zv9V+6WMrDcudze3/jkqcA0BQ8ugsmbh3uc/C426JPAlLVPW6sF44nq56MBHcxVwlPfQVFhN0wAvigMJlgy2R57hW/ipl0ddPcxK+WGmmDZY7PVTmxxDSbuWpNYDZ+O99SuBFCaGau9q4dGNxjv6Bf0UOToxfOlXGFYDTis7jiTZ4yH08PWQL1oU2+7Tej1oZy4Lnun/oXKSj9SNiRImKv4Are4zky7AYwToMVRfGVaQnF0OVgLWHsDjUat8+3n7fA97UYbtG7gvTkCk+Eu0tZrQk5j1p7/dBQhpCOfC4rR21sNKnrP2h6ExcW7SD5sNW/Zmcvilce/lzeyJtZzNkvjUxPabpsZ4S+h7o2gYcr6AFx1BCkaSZHWt2+eUl01NlpoivseTQDJKWqSNJa4Qs0N/ac3jqlwtVCV2QQr7lpB86xDOYWPFt+GsrK/Xc3abCatM1Whe0469qIjfR+OMAxiSSMogmFagzqkVO7IX3W4b6jvEe8mJzcPGXlWlkW5W70rbUtCXw2Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB5549.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(451199015)(86362001)(5660300002)(31696002)(4326008)(36756003)(8676002)(2616005)(186003)(8936002)(66556008)(41300700001)(26005)(6512007)(6506007)(7416002)(54906003)(6666004)(66946007)(53546011)(6486002)(478600001)(66476007)(316002)(38100700002)(110136005)(83380400001)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?elc5cXF5NHlhS094ZmE4Mk5WNVdKVXZOZURRUWk2dlhuV0phUCtuSmRiNzRE?=
 =?utf-8?B?bHQzUlB0OGpReENjU1JIekx4MEtLd3NZUVBwb01mOW5YWkVvKzFNOXhMZXI3?=
 =?utf-8?B?eHdLSVpXZXIrK2xmdkZIT3VOUHJMQVBMNFVTbzVyejVlZkZ2b3pQTEdTQWdQ?=
 =?utf-8?B?a2ZBSFZvNlRPTFZBeUtYL25GR0VtR3Y3NE1tcGxhV0hPNWZUNE15d2tZL0tK?=
 =?utf-8?B?d0lSdVFrQks5WjdGMm9vNzZGVW9KK1I0YnlrK08xdk5YWFdiNHpxYXVZL09t?=
 =?utf-8?B?RG0yWmRlaDhQVWFVcUZGUkZua0VKb3pqTFlMNWJZcGV4YlRsMDFVemFEY0Yy?=
 =?utf-8?B?Z0lOSHI1MytKenBINTFZMHdhZ293QVpqanBVZ3F3aFhvVkkzVUZmUWM2dmt1?=
 =?utf-8?B?VldMREMvV3M5WFoxSGRGQUt2TmpkQW9janUzdE1EdzR0UFN3N2Z2SzlFN3VM?=
 =?utf-8?B?dmpvNVVyRG1zbEpkWkV3VU1QWDRjb1V4amlqZGF6Mjlid0F1S2ZKMC9iWDZn?=
 =?utf-8?B?MWsydDYvMjJMV3MxTngrQzJOUzBlQ1BrUmJpd3BpaW5FR0J1K01sdUIrTGZZ?=
 =?utf-8?B?N1FZL3J0Yjk4RXRtL0V5cXdkVXBpMCttQ1p3ZzlRcUR5RG95ZFhFTmdXbCtj?=
 =?utf-8?B?M1I3NmZwUmpIVFZoa1dtbmdUVkFGakU2VlNKTlFWc3h2TkV6MWlDV3BTVFln?=
 =?utf-8?B?VGlvaWRwMkNISlQwVEYyWVA4ZU5jQkdjT05OWEx3aEtZRU5VdDM0bm5nVlYz?=
 =?utf-8?B?bXEzb1BWYlpKSlhGS3BVNC9mOVNDc3p3WC85dldqd1h6QVc5bXZ2SC9qTG1I?=
 =?utf-8?B?K0cwUXlXTmF1YkRkc0hudk1HOXkrd2NHcjRTSHd0T2IvVC9Xc1NCa0syOStE?=
 =?utf-8?B?eFBwNW9zbjFScVBEbkI1clJYR2N1OXROOWdieVhnY2Z4UEZELzhadG40dUp2?=
 =?utf-8?B?QkV1Sm5EWVRia1N4M2pkb0ZnQVhrc2c5UDk2Q3Q4NzJtOGJDeVVSeElROVVW?=
 =?utf-8?B?eXZZZU50NlYwdjJBVFFPNTNuWUZRS243VEVCejA5MFVLOGVodE5yL29SZnlI?=
 =?utf-8?B?c0VYSzhySFU4SUZTd2drNDEzbUI5U0xOWWY2aGZLTHpvUmdOMEJOTkRtMkli?=
 =?utf-8?B?R0orSG5lRlJsSXI4UDVQTTBPRmRYdXQ2RzV6NWtkWDJvcVZoUVJCRFhDTzgv?=
 =?utf-8?B?bUhYZ0RUM2RtRVF1Q1RTRGV0Z21EZWNiOE1CYjA5NWJ0Q3l4NDgybW9GNUMv?=
 =?utf-8?B?NGJIZ3hUMHJwb2F3VHQ4b2lidEJTZXBqSno4RHVaQ05OQXc4cW1mQmNMQkpD?=
 =?utf-8?B?VExXa3MvUXVnQmNTNlFKV0ViV3lpRzl5cDNwYnBDYnA0SWZIS1RVMzFEUXda?=
 =?utf-8?B?VTk2cVN3TW1UYzMrcjBwUlN3YldzeWNGYkdpMXJyaGIxUEtQLzVFY1BxZ3li?=
 =?utf-8?B?N2RSMkh2UXRnUDZQd0Zhb2QvYnZEM3NGM2pRQ204eEFFb3pyYWZUZkpVV2Zh?=
 =?utf-8?B?a1RWK1FIZG1uM3lBSDF1cXUzayt4Rm81UVlkd2s1elNRQ00vTW5LVmlwRDIw?=
 =?utf-8?B?dytOSlc4NnNKMllNRTBSWGRCOCtxNWpBQXZSY2NYVHBtbU44clpoQzg0L2VI?=
 =?utf-8?B?bFRRRmw3MjZ3VzAxa2JxSnVxVS9HNGh6ZkJUUDYwNlFCWlJWK0NkNHluS0RP?=
 =?utf-8?B?NGpHdEFWSmJLNDZGbVoxTmI3WFVJcmxLeExWS1lTMGNvWW9XNEZ4RStqYnZ2?=
 =?utf-8?B?dVNKcFdOVnpHWlJJRFVaUXlxLzBjTlZCb3VDalBMcjdJNUlwTm1iZlYvdENL?=
 =?utf-8?B?S1NJKzdMdFlENkRVL05OdUFDZkloSWhjNWViaUtnbDdmbVRydUpxWXg3SUUy?=
 =?utf-8?B?NFdTYWVSWW1ZaE9VTGZweUFRQm5OSWZiMFp3WFBlVVJXZlI1WjdXMDFaamZt?=
 =?utf-8?B?QzYwNUpvL0Z0RzdZYXN0cXIyYktNMW8zYnBqbU44Z2hHd3ZPZzhNSzB5NVV5?=
 =?utf-8?B?c3F5LytqYnBOcHRqSE0zSnE5c0cxTDVQWElmQXEzKzhPamZhUWlPemJ1OCtu?=
 =?utf-8?B?b2t4L1R2RXpHR1ZrbjBLYUZrOG1YYUtDUlZ0SVVrbXpMT0RFRnNOVkI3YlZy?=
 =?utf-8?Q?Km1uv18YSjJTkgg2fFC0QIi/s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b60e280-84f0-4242-4c73-08dacb9104ef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB5549.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:21:34.3282 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3jTiyMQP3XUKe22wIe+Avsek+hZ7CAobx8o8Ybuf6dU1Ry6HX8FuBH9sSo9S21RQIdiNF6FIBf/Wa2NPbfEvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6726
Received-SPF: softfail client-ip=2a01:111:f400:7e8b::607;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ping.

On 10/11/2022 15:38, Avihai Horon wrote:
>
> On 08/11/2022 20:36, Vladimir Sementsov-Ogievskiy wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> On 11/3/22 19:16, Avihai Horon wrote:
>>> From: Juan Quintela <quintela@redhat.com>
>>>
>>> And it appears that what is wrong is the code. During bulk stage we
>>> need to make sure that some block is dirty, but no games with
>>> max_size at all.
>>
>> :) That made me interested in, why we need this one block, so I 
>> decided to search through the history.
>>
>> And what I see? Haha, that was my commit 04636dc410b163c 
>> "migration/block: fix pending() return value" [1], which you actually 
>> revert with this patch.
>>
>> So, at least we should note, that it's a revert of [1].
>>
>> Still that this will reintroduce the bug fixed by [1].
>>
>> As I understand the problem is (was) that in block_save_complete() we 
>> finalize only dirty blocks, but don't finalize the bulk phase if it's 
>> not finalized yet. So, we can fix block_save_complete() to finalize 
>> the bulk phase, instead of hacking with pending in [1].
>>
>> Interesting, why we need this one block, described in the comment you 
>> refer to? Was it an incomplete workaround for the same problem, 
>> described in [1]? If so, we can fix block_save_complete() and remove 
>> this if() together with the comment from block_save_pending().
>>
> I am not familiar with block migration.
> I can drop this patch in next version.
>
> Juan/Stefan, could you help here?
>
>>>
>>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>>> ---
>>>   migration/block.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/migration/block.c b/migration/block.c
>>> index b3d680af75..39ce4003c6 100644
>>> --- a/migration/block.c
>>> +++ b/migration/block.c
>>> @@ -879,8 +879,8 @@ static void block_save_pending(void *opaque, 
>>> uint64_t max_size,
>>>       blk_mig_unlock();
>>>
>>>       /* Report at least one block pending during bulk phase */
>>> -    if (pending <= max_size && !block_mig_state.bulk_completed) {
>>> -        pending = max_size + BLK_MIG_BLOCK_SIZE;
>>> +    if (!pending && !block_mig_state.bulk_completed) {
>>> +        pending = BLK_MIG_BLOCK_SIZE;
>>>       }
>>>
>>>       trace_migration_block_save_pending(pending);
>>
>> -- 
>> Best regards,
>> Vladimir
>>

