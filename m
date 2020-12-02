Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 057242CC4E9
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 19:19:26 +0100 (CET)
Received: from localhost ([::1]:35936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkWiq-0006bc-IZ
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 13:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWhu-00065e-N2; Wed, 02 Dec 2020 13:18:26 -0500
Received: from mail-eopbgr80129.outbound.protection.outlook.com
 ([40.107.8.129]:56452 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1kkWhr-0007k4-0a; Wed, 02 Dec 2020 13:18:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VopJLMrPvQAWHrApTIkJ1mSaXs/SpAbdG9ZwGPFRm2jSOAMzSiNGC5SC6F2gRsKQqNfF4MuOpevRwC+wVyWJuF5tlCGX55pPG871oF7kx/DNDXXEcjs0zhFqdlkKfwY4rzuIk4V5bMtsqdtbvB7RdD3ljSy5DhBe5WvOm7HHMz9i5WW62e1eAJhviKkrdUeXGU+77YORD9BpdJRLbIbCSaJySoe37R+VfDrcU7uRG9gBkv8GcgUAHFfM9+48URZMKlSq6lMCbloY2nYCaDPEl2EU9xw6T9jN2LF3jyXTKoWzYBc0hUl5+wYN8m+pGK8GaKgrn1qiRgskjT7XFNYsUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/T8fCv+UoyCX5ZpQXsFg1vqIQvbrV27ELjF0j5P2yI=;
 b=BYY33MNK/fbCEh615Wkn24XMTOTvHknPf2ppVZ6PQkmsMjtqEHqyB9SxCsMg+mDOgJpOYDFFFl/VX4AiLJLAILCDdiFrThnXpowJGy5tmNP33oRpuVj5u999gYaG16Xhud/yeqEBL3imF9mvjlLRQk+42d+C1MDBjqVr73iiaqd/ZrhLH0WVT/XoVzYExy+RwKeJEjqjCorXaDPEq8PqFXngC+jg5zysxrlaConzOOo9ySI2Qz+VWE6rbKl6gDpzIRDFXM+dTcWuujbwSaP8ND83u2q9kicoQ6nxy5gHfwYvzM2o0/dV0Y7WcDfFYU30bJ61CO17Bl16WfpwvpO7NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5/T8fCv+UoyCX5ZpQXsFg1vqIQvbrV27ELjF0j5P2yI=;
 b=BfAAoHijSXmbAht8xBbeTsxnRWk3uzVzdJ+lDRZqsE+8/1FXRkIpt2VSc6mByCXDKIlSl64+gUgy/vCLkmtOfy74lcgFiBdr0cjQ/0IccWKl+4DMPclDeDcCyOg9lgeocq5TBlQqDa3X+4ZwYX116PFUEzt8WEKBY0atiB2TvSE=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com (2603:10a6:3:89::22)
 by HE1PR0801MB1915.eurprd08.prod.outlook.com (2603:10a6:3:4f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 18:18:15 +0000
Received: from HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4]) by HE1PR0801MB2124.eurprd08.prod.outlook.com
 ([fe80::c565:a7d7:a7ab:e9c4%10]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 18:18:15 +0000
Subject: Re: [PATCH v12 14/14] block: apply COR-filter to block-stream jobs
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1603390423-980205-15-git-send-email-andrey.shinkevich@virtuozzo.com>
 <a8405ebc-8dc3-4520-1e35-2bae6a962f79@virtuozzo.com>
 <467434b5-abaa-fdac-bfcb-844626e1d5f4@virtuozzo.com>
 <f8a956c7-c2dc-29c7-14b4-8e0d1b2ca9f8@virtuozzo.com>
 <e2547844-2820-11d8-749a-7c746536c6d1@virtuozzo.com>
Message-ID: <aba98ac5-38fa-ee1c-6523-2266e71d054e@virtuozzo.com>
Date: Wed, 2 Dec 2020 21:18:11 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
In-Reply-To: <e2547844-2820-11d8-749a-7c746536c6d1@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Originating-IP: [109.252.36.39]
X-ClientProxiedBy: AM0PR03CA0076.eurprd03.prod.outlook.com
 (2603:10a6:208:69::17) To HE1PR0801MB2124.eurprd08.prod.outlook.com
 (2603:10a6:3:89::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Admins-MacBook-Pro.local (109.252.36.39) by
 AM0PR03CA0076.eurprd03.prod.outlook.com (2603:10a6:208:69::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 18:18:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c24a4b65-e243-4796-a3bf-08d896eea2ab
X-MS-TrafficTypeDiagnostic: HE1PR0801MB1915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HE1PR0801MB1915DE8C9905871E95AFA120F4F30@HE1PR0801MB1915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9/OafOAS+5yb0aWJZdT9SoIu6ior1K4DIgz6TfY73me9Aomz8SvO/hrdZQ3zTAD9Q5btz9vRIg6WA8n9g63EQC7hQXOAciAA15LCZx4tP7EKY5Z7LEpKRBxYd/qIc3qC4bCti3F4jnz3+DOdkiIa1BHL9aRhn2B3lYYIKXVfBig5HdixZPM3/0GXmzOMaNm9XCRjQl5EMsjeHG8Yu8zln96i/FGYh4d8bWn+dK7fHjkbKdG22r3wSr+LqXre2Beg5E/8ArFdwwZHpohmAZ4/POw0nGnMy9H1i+UJQUlwcMbZtCXYdMH94iydQ8Er3ztXSMTOeE8gc94LaNEQJ+Nb4WjDeAgBgsRS1DwkF6IeWX2GxlVH8j5CzLA0OEKLIqUZqYtUNBuzZ2V6cLCVMex8PTakbp4ARqnAfrJ2wLLje98=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HE1PR0801MB2124.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(376002)(396003)(346002)(366004)(5660300002)(107886003)(6506007)(31686004)(8676002)(6486002)(26005)(31696002)(186003)(16526019)(53546011)(2906002)(52116002)(956004)(2616005)(44832011)(6512007)(316002)(36756003)(4326008)(8936002)(86362001)(83380400001)(66556008)(66946007)(478600001)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0ZyYlpkZHJaM1d5dzV3Z1RxSEljS3lCZnBqMlN5ZE1TZWxTS3F3bVZ2dG55?=
 =?utf-8?B?WlFDWUcxYlE2akI1QkdjWjNkMjBlMjhaQmNuMHVjb2lrTmdTMWswQ0NyRk1s?=
 =?utf-8?B?eGhkSTR3WjRUVUltb1NjUVludkdQTVRsTm85SDd4NHFGeDVtUEpLNFNIalBa?=
 =?utf-8?B?Vk9yLzh3K0RtVHRLYjFpTktDbHh4V3FjaVpoUHNOWE9BakFma0RablAvQ0ta?=
 =?utf-8?B?SEluRitzd0x4T2QybWJDSFRvenZPYVVnUDN0dFlUall5SU9lZW9yUllOOW9P?=
 =?utf-8?B?R0gxZGNSTkpua1JnYzNaUE55WmpacXczSGVXTGljKzV6aFNKWXN2WkJ2VmJi?=
 =?utf-8?B?VGFkZWF1YUVHeUVDOXBzb0U5cWJ2eVpwN0pYVHMva1R1d0l3QW1MQWRVQUxP?=
 =?utf-8?B?SFYyOFJTTXpzR3RLUmZ3a04yNTY4Y3g0b2dNUHBqemN3OHZobklUSm5wZWVt?=
 =?utf-8?B?UWVuWFNYa0szZU1aR0gvOE4rUWRiSGFKalpTTmlzMkEvL3Y1NlNtY0kydDkr?=
 =?utf-8?B?Z2MzZ2FJRHh0dmxscXUyV3ZqcHQxSEZFb3R2VUhTN05YUnh5N0Q5WmNobms5?=
 =?utf-8?B?Q2xrSjRzWFR2R2duVGVrNjF1QVo1d21BWTdyckZrVXMyc1RoUXlJTXBxb1JI?=
 =?utf-8?B?UlpJeFhFY09OTDh3ZXN6anNGWHNidGE5bEhjdGlLcnpYL0hDb1dWSVJhb3pH?=
 =?utf-8?B?SGUrSS9jaUtVUHBXcWZ1MzljL21ORXdpYzBLTC9USnpsNVROMkR5WW8yZjVq?=
 =?utf-8?B?SWRRSVpGY2pOOVRSTjFoZmx3UCtvdEJ3T2psUTR4WkVlQlRHUHN5enlUZmxS?=
 =?utf-8?B?VlV0RTd6VjdzS3VJVFNpYmxPbmRTWXo5M2pjS2tmalRKWnU5SENDUURXcWo0?=
 =?utf-8?B?aEtkbnJZMnRRYk81aEJFQnBXQUwvcjIya2szR0tZYmRlUFV2TXNTL2JWZ05x?=
 =?utf-8?B?WVZLemFXY1NPRE9VYzJVS05YY1U5MkVNWG0yOCs5SUk4QTdXeVdPZmh2UG1U?=
 =?utf-8?B?T1JmTXRPWncwbytIdWpxcDE2ZFF3QVNsdExrSC9UZzhTSXJxdzU2d3V0NVg4?=
 =?utf-8?B?SUR4N2VITmhhL2FPVXV4eWpGQ3ZXTGZKeHU0aHBpRGd1Y3kzZm9uUk1NT0Za?=
 =?utf-8?B?RzFUdnFnaS9uY3BuclpwQjRaSlNldm1WeUVkTHBlcENjblFFa01XR2tNdnNw?=
 =?utf-8?B?anNQaWZiQU1Va0wwVDR5Z0paVEJmY1hPS1F2N25UNW9KWDVra3Nya2FCdTR3?=
 =?utf-8?B?VjJtMDJWN2FkbU5xeGhMcEJnRmFveVJNbDBhTlczSmFHNE5KU01XYi93RUJB?=
 =?utf-8?Q?jx/wXldGRixlLlC51cFqdIJmnA7KN6aYry?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24a4b65-e243-4796-a3bf-08d896eea2ab
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0801MB2124.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 18:18:15.2703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kt4hE1+IlFs/e1G8thZnE6/zJHdsz4OahfKMZykJnIc/X78YNbft96OWzWsbIf3UTzUhOYIyso80u7u8c9M8FxgNq/s7lJwmyWLSKOTbRnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1915
Received-SPF: pass client-ip=40.107.8.129;
 envelope-from=andrey.shinkevich@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 27.10.2020 21:24, Andrey Shinkevich wrote:
> 
> On 27.10.2020 20:57, Vladimir Sementsov-Ogievskiy wrote:
>> 27.10.2020 20:48, Andrey Shinkevich wrote:
>>>
>>> On 27.10.2020 19:13, Vladimir Sementsov-Ogievskiy wrote:
>>>> 22.10.2020 21:13, Andrey Shinkevich wrote:
>>>>> This patch completes the series with the COR-filter insertion for
>>>>> block-stream operations. Adding the filter makes it possible for 
>>>>> copied
>>>>> regions to be discarded in backing files during the block-stream job,
>>>>> what will reduce the disk overuse.
>>>>> The COR-filter insertion incurs changes in the iotests case
>>>>> 245:test_block_stream_4 that reopens the backing chain during a
>>>>> block-stream job. There are changes in the iotests #030 as well.
>>>>> The iotests case 030:test_stream_parallel was deleted due to multiple
>>>>> conflicts between the concurrent job operations over the same backing
>>>>> chain. The base backing node for one job is the top node for another
>>>>> job. It may change due to the filter node inserted into the backing
>>>>> chain while both jobs are running. Another issue is that the parts of
>>>>> the backing chain are being frozen by the running job and may not be
>>>>> changed by the concurrent job when needed. The concept of the parallel
>>>>> jobs with common nodes is considered vital no more.
>>>>>
>>>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>>> ---
>>>>>   block/stream.c             | 98 
>>>>> ++++++++++++++++++++++++++++++----------------
>>>>>   tests/qemu-iotests/030     | 51 +++---------------------
>>>>>   tests/qemu-iotests/030.out |  4 +-
>>>>>   tests/qemu-iotests/141.out |  2 +-
>>>>>   tests/qemu-iotests/245     | 22 +++++++----
>>>>>   5 files changed, 87 insertions(+), 90 deletions(-)
>>>>>
>>>>> diff --git a/block/stream.c b/block/stream.c
>>>
>>>
>>> [...]
>>>
>>>>> +    s = block_job_create(job_id, &stream_job_driver, NULL, 
>>>>> cor_filter_bs,
>>>>> +                         BLK_PERM_CONSISTENT_READ,
>>>>> +                         basic_flags | BLK_PERM_WRITE | 
>>>>> BLK_PERM_GRAPH_MOD,
>>>>
>>>> I think that BLK_PERM_GRAPH_MOD is something outdated. We have 
>>>> chain-feeze, what BLK_PERM_GRAPH_MOD adds to it? I don't know, and 
>>>> doubt that somebody knows.
>>>>
>>>
>>> That is true for the commit/mirror jobs also. If we agree to remove 
>>> the flag BLK_PERM_GRAPH_MOD from all these jobs, it will be made in a 
>>> separate series, won't it?
>>
>> Hmm. At least, let's not implement new logic based on 
>> BLK_PERM_GRAPH_MOD. In original code it's only block_job_create's 
>> perm, not in shared_perm, not somewhere else.. So, if we keep it, 
>> let's keep it as is: only in perm in block_job_create, not 
>> implementing additional perm/shared_perm logic.
>>
> 
> With @perm=0 in the block_job_add_bdrv(&s->common, "active node"...), it 
> won't.
> 
>>>
>>>>>                            speed, creation_flags, NULL, NULL, errp);
>>>>>       if (!s) {
>>>>>           goto fail;
>>>>>       }
>>>>> +    /*
>>>>> +     * Prevent concurrent jobs trying to modify the graph 
>>>>> structure here, we
>>>>> +     * already have our own plans. Also don't allow resize as the 
>>>>> image size is
>>>>> +     * queried only at the job start and then cached.
>>>>> +     */
>>>>> +    if (block_job_add_bdrv(&s->common, "active node", bs,
>>>>> +                           basic_flags | BLK_PERM_GRAPH_MOD,
>>>>
>>>> why not 0, like for other nodes? We don't use this BdrvChild at all, 
>>>> why to requre permissions?
>>>>
>>>
>>> Yes, '0' s right.
>>>
>>>>> +                           basic_flags | BLK_PERM_WRITE, 
>>>>> &error_abort)) {
>>>>> +        goto fail;
>>>>> +    }
>>>>> +
>>>>>       /* Block all intermediate nodes between bs and base, because 
>>>
>>>
>>> [...]
>>>
>>>>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>>>>> index dcb4b5d..0064590 100755
>>>>> --- a/tests/qemu-iotests/030
>>>>> +++ b/tests/qemu-iotests/030
>>>>> @@ -227,61 +227,20 @@ class TestParallelOps(iotests.QMPTestCase):
>>>>>           for img in self.imgs:
>>>>>               os.remove(img)
>>>>> -    # Test that it's possible to run several block-stream operations
>>>>> -    # in parallel in the same snapshot chain
>>>>> -    @unittest.skipIf(os.environ.get('QEMU_CHECK_BLOCK_AUTO'), 
>>>>> 'disabled in CI')
>>>>> -    def test_stream_parallel(self):
>>>>
>>>> Didn't we agree to add "bottom" paramter to qmp? Than this test-case 
>>>> can be rewritten using
>>>> node-names and new "bottom" stream argument.
>>>>

The QMP new "bottom" option is passed to the COR-driver. It is done 
withing the stream-job code. So, it works.

>>>
>>> I guess it will not help for the whole test. Particularly, there is 
>>> an issue with freezing the child link to COR-filter of the cuncurrent 
>>> job, then it fails to finish first.
>>
>> We should not have such frozen link, as our bottom node should be 
>> above COR-filter of concurrent job.
>>
>>
> 
> The bdrv_freeze_backing_chain(bs, above_base, errp) does that job. Max 
> insisted on keeping it.
> 
> Andrey

I have kept the test_stream_parallel() deleted in the coming v13 because 
it was agreed to make the above_base node frozen. With this, the test 
case can not pass. It is also true because the operations over the 
COR-filter node are blocked for the parallel jobs.

Andrey

