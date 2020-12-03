Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5932CDEC2
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 20:26:45 +0100 (CET)
Received: from localhost ([::1]:33046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkuFZ-0004CZ-0D
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 14:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kku8U-0006tT-Az; Thu, 03 Dec 2020 14:19:32 -0500
Received: from mail-eopbgr70098.outbound.protection.outlook.com
 ([40.107.7.98]:2181 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kku8P-0008VC-62; Thu, 03 Dec 2020 14:19:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObGCz97tFTLxUhVGWq4kecElpXIezYqJK44565+CD+BZRmMkKIXCS3JtgY0P2mZkDTMXo/6B25WXtMmjb0dnpdM8lzlPqcQBafSwQby7kWrnGy1mNYFw+WtKHJ9JOJ/l9MkX498PpXG7a83/BeSI22GlvjCKDiSnrKOZ+Xz+raS2hv1HvTtgBXYkycRXA2b+LEPfN8/jFv1C+vyggBxQqDYyi+xjh6pX9ZJ4K9mFPeJcmw1SoAeDRy48SFK+snKwseCJI765vfkGK75jDGRgfHiLTSrjLOjCehhWZx9XajuyJsXj6oKMF2aa3AzLOH+fWPyvhhJyql5CchpStRm7Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kkmxsZeQ6FxH2VSfzMTn2SQEdrdahkWi71XmzZJnbs=;
 b=BMZhd6qtDzv95g/c9ekRSU/Uk8BxO7N0FdAsinJOoEvi+XEr6Qa3wKPB2bpXqvqnwZMHE6Z7quZZtU7w4fH+Z+HG8J3n57fjDDj6BJFGYVYDTy71OBxyWu7okpCl+a/nelm7Mq8VEt8ntliJtAlQJ9tQtcyBz2ZLUfQMBIqHSbQHzwU656/31LcNFfZdJrQFlDTB1AB4WMg9Ms2Sr2xo9WUD3Svyd2A0QzVGnRDLu5g1umr4OXI/TUs1ESnArNL5MRtC0xYw5xQ/cZg4/sOm29P0HHecjbJ2BOcjmZZXx81HxisF7jm2disYdTaVIBAs9wIBTHeeO5EpAalUG+JgKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+kkmxsZeQ6FxH2VSfzMTn2SQEdrdahkWi71XmzZJnbs=;
 b=eJZPkqGHcEhkUZZqB3AWCWwOptcaRG9fkM+urlpviGUedy6EtxDwHtccmOghN9wSbM7dyOq+ZrHsZPXzf37Du2Liuba2QJhkm2/Qt8oE8jNh8MopSu1VqLKZZg1VFGonf74b/Y9OXOn4NYSYOTD0jyeAhLZ9Y8u3C7jUZUqTwfg=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3766.eurprd08.prod.outlook.com (2603:10a6:20b:83::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Thu, 3 Dec
 2020 19:19:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.020; Thu, 3 Dec 2020
 19:19:16 +0000
Subject: Re: [PATCH v12 14/14] block: apply COR-filter to block-stream jobs
To: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, armbru@redhat.com, jsnow@redhat.com,
 eblake@redhat.com, den@openvz.org
References: <1603390423-980205-1-git-send-email-andrey.shinkevich@virtuozzo.com>
 <1603390423-980205-15-git-send-email-andrey.shinkevich@virtuozzo.com>
 <a8405ebc-8dc3-4520-1e35-2bae6a962f79@virtuozzo.com>
 <467434b5-abaa-fdac-bfcb-844626e1d5f4@virtuozzo.com>
 <f8a956c7-c2dc-29c7-14b4-8e0d1b2ca9f8@virtuozzo.com>
 <e2547844-2820-11d8-749a-7c746536c6d1@virtuozzo.com>
 <aba98ac5-38fa-ee1c-6523-2266e71d054e@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7f99d2a3-7088-4a4a-b2ea-c4d34370d7e2@virtuozzo.com>
Date: Thu, 3 Dec 2020 22:19:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <aba98ac5-38fa-ee1c-6523-2266e71d054e@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM9P191CA0030.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.91) by
 AM9P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21c::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 19:19:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d7ffda-93d1-4f5b-7774-08d897c05389
X-MS-TrafficTypeDiagnostic: AM6PR08MB3766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3766E82E51D64DFE936F99F4C1F20@AM6PR08MB3766.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:561;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fzYz8QVh7DPitox7vXbuMQvAP+AVhAOo6O48b7Yy+Tq/9XdOGNuaxaWo46yVHRgbWPxkeFNj+Dra/kNsuAwrciTwVwF9ZPVGdsATUrPrNy1dwaRchp+vKDpxcv1d3nfTr8Ct74jfsdjxd6QePevbwcYU1HJUfvX9R0NCISbaTyQR61iq+jIAfcmmszd8Ku+pWvlE5n4S+fbAQBSwWHaldLq0RcxJiwOiXdkdEmu5JQ5vislH/Qd7vdm1j8owpCLQEtpEjJqwO/iQhdOkvouX3ts/AJvXtiWnFsqFV709ILCAT1+7JD0GUNF2gKrqs2NTrYiIFVAomQ6t9R4Y/SUsrdS/eCc45ZReLYK18LbBU8ig4RNPtzD5v7rLrjaRO5uijC34fyBQBoblHNAATgBIG5jILHBsWZlX/G6CudS9iik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39840400004)(956004)(316002)(5660300002)(2616005)(16576012)(4326008)(66946007)(66476007)(36756003)(66556008)(31686004)(6486002)(83380400001)(31696002)(52116002)(2906002)(186003)(16526019)(53546011)(107886003)(86362001)(8936002)(478600001)(26005)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MExoRlNSSFFIdjRIZzRWTEZKSlIzNkIzZkFMWWJMSzZydXMyckpmdFh1R1BI?=
 =?utf-8?B?M0k2cVRlSHdCMVNSRktRTkE1NmZSeUNWcXQ2T0ZuakhONkg2ek9NYVl6R2h2?=
 =?utf-8?B?eis5NkFEWUxKcHBFb2NoUnN1ZTB3WEdCOE1qNFZrb1hRc3RYd3VXcDNSNnl4?=
 =?utf-8?B?OGpCaDErYjZxaFJQUTIvY1VETzkvczRJWXNpWDU0V1lhTkZZUDNtc2Z1MnNQ?=
 =?utf-8?B?MGhzL3pEcER4SUdtKy9qem5rQndxNGJ2bDNwKzROMWRXK2MxK3lzWmV5N05S?=
 =?utf-8?B?TWJaeEFQeTVDSnc5NGNFa2p2UHpicVIyMzVrKzRsV3FXV2wydU11ek8vblJy?=
 =?utf-8?B?enpnOGJaKzV1THNzVW9uWDFQQVZwTGNDU1NWRC9COGpYbkxsQXd0T1Nhemg3?=
 =?utf-8?B?aXZVeHd2MTJucWJsMzlObHkzYTNlNnpyM2ZuTDduV0EyNXBxKzF6WFh1bjAv?=
 =?utf-8?B?ZXg3RnRGNG5wdnBON2htaHdYZFl1M3pTRmV6bFNPT1A1RUNtcWlvSlNHbDdK?=
 =?utf-8?B?dFo0Yk1VS0U1U3dpNElaQ2VPSFoxbCtXcEVEb3Y1MDZycUpXVU51N1lFTHBB?=
 =?utf-8?B?NkNUMUI2enN3OEtoN2JEYzZsd282SUJlZUVuK1ZWdXlWZXZjbVo0dUdFYWlY?=
 =?utf-8?B?WDVPaVdZcXFBK2RSdHczV09UcHppVXA1citkRHZBSUtpclR1dnhrWTlmYURC?=
 =?utf-8?B?ZDRSeG5Ga2pTY1VyczU4eWlLNW1VRDdJN0hXbHJwc0dxK0Y3SCtRR0Z3aE9a?=
 =?utf-8?B?WnBqRjhkV1VzM1p4c0dJbU9JQ0x3anpGM1pRZzIwSTJIaXI5QXpxakMwZFRR?=
 =?utf-8?B?MzBFWk5MRE1NL1NTaHF6aXVFUXBUSEdsNUoyUXNOQmFNSW54VjlCRHMwejF4?=
 =?utf-8?B?VU9vWjQ0SVlPb0RReEt4SWNhN1dLR1dvWE1tU2RNY3dVVGFjN1ZIRFVRUWRN?=
 =?utf-8?B?TElQeU9hU09OY3JCbjlVSHlvTkYwWHNFRE9HWTdXTllPbTdMemg2WjJUOWhm?=
 =?utf-8?B?V2poei9OTS8vT2E5bGlQdHlTdjI3NzFxVWx4ZnFtNHNFWW5hYitrUkpTTkZZ?=
 =?utf-8?B?bWEzYXIxVnIyd2hKSks4a0JZSmpTd3MvSll5M1NNY0UySERON29KYmEwOGJV?=
 =?utf-8?B?MFpIeFo1Mk9GYVRSeENSYnBSR25OeEhNdjhJVGp6NGk5NWxJVGo2RERlWnBl?=
 =?utf-8?B?aDhVM1E1cXAvZnFHMWVxR1FWTWRDNVdNMnFHQjg1YTQxREhialdZNzBacEdG?=
 =?utf-8?B?N0N6a2FwQ3JwUVlZSDJOWFJWaDZ1TG92REdBVm9LZ2R3OXBrRnVhbUNjSmZS?=
 =?utf-8?Q?O2SyRJyvJlrHjQ01akjMZ9K7XBf8swp8XP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d7ffda-93d1-4f5b-7774-08d897c05389
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 19:19:16.5690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdRmVkJ2Uq31Rblh94/5Hphy9jCZc/8VqwGTv7w5dMTxjA7LAIz8QF4AUTHd1sE8Ms/7ssyUNgYWI84MCVcJd2v1vuJ63lVxp7/rvsnHnXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3766
Received-SPF: pass client-ip=40.107.7.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

02.12.2020 21:18, Andrey Shinkevich wrote:
> 
> On 27.10.2020 21:24, Andrey Shinkevich wrote:
>>
>> On 27.10.2020 20:57, Vladimir Sementsov-Ogievskiy wrote:
>>> 27.10.2020 20:48, Andrey Shinkevich wrote:
>>>>
>>>> On 27.10.2020 19:13, Vladimir Sementsov-Ogievskiy wrote:
>>>>> 22.10.2020 21:13, Andrey Shinkevich wrote:
>>>>>> This patch completes the series with the COR-filter insertion for
>>>>>> block-stream operations. Adding the filter makes it possible for copied
>>>>>> regions to be discarded in backing files during the block-stream job,
>>>>>> what will reduce the disk overuse.
>>>>>> The COR-filter insertion incurs changes in the iotests case
>>>>>> 245:test_block_stream_4 that reopens the backing chain during a
>>>>>> block-stream job. There are changes in the iotests #030 as well.
>>>>>> The iotests case 030:test_stream_parallel was deleted due to multiple
>>>>>> conflicts between the concurrent job operations over the same backing
>>>>>> chain. The base backing node for one job is the top node for another
>>>>>> job. It may change due to the filter node inserted into the backing
>>>>>> chain while both jobs are running. Another issue is that the parts of
>>>>>> the backing chain are being frozen by the running job and may not be
>>>>>> changed by the concurrent job when needed. The concept of the parallel
>>>>>> jobs with common nodes is considered vital no more.
>>>>>>
>>>>>> Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
>>>>>> ---
>>>>>>   block/stream.c             | 98 ++++++++++++++++++++++++++++++----------------
>>>>>>   tests/qemu-iotests/030     | 51 +++---------------------
>>>>>>   tests/qemu-iotests/030.out |  4 +-
>>>>>>   tests/qemu-iotests/141.out |  2 +-
>>>>>>   tests/qemu-iotests/245     | 22 +++++++----
>>>>>>   5 files changed, 87 insertions(+), 90 deletions(-)
>>>>>>
>>>>>> diff --git a/block/stream.c b/block/stream.c
>>>>
>>>>
>>>> [...]
>>>>
>>>>>> +    s = block_job_create(job_id, &stream_job_driver, NULL, cor_filter_bs,
>>>>>> +                         BLK_PERM_CONSISTENT_READ,
>>>>>> +                         basic_flags | BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD,
>>>>>
>>>>> I think that BLK_PERM_GRAPH_MOD is something outdated. We have chain-feeze, what BLK_PERM_GRAPH_MOD adds to it? I don't know, and doubt that somebody knows.
>>>>>
>>>>
>>>> That is true for the commit/mirror jobs also. If we agree to remove the flag BLK_PERM_GRAPH_MOD from all these jobs, it will be made in a separate series, won't it?
>>>
>>> Hmm. At least, let's not implement new logic based on BLK_PERM_GRAPH_MOD. In original code it's only block_job_create's perm, not in shared_perm, not somewhere else.. So, if we keep it, let's keep it as is: only in perm in block_job_create, not implementing additional perm/shared_perm logic.
>>>
>>
>> With @perm=0 in the block_job_add_bdrv(&s->common, "active node"...), it won't.
>>
>>>>
>>>>>>                            speed, creation_flags, NULL, NULL, errp);
>>>>>>       if (!s) {
>>>>>>           goto fail;
>>>>>>       }
>>>>>> +    /*
>>>>>> +     * Prevent concurrent jobs trying to modify the graph structure here, we
>>>>>> +     * already have our own plans. Also don't allow resize as the image size is
>>>>>> +     * queried only at the job start and then cached.
>>>>>> +     */
>>>>>> +    if (block_job_add_bdrv(&s->common, "active node", bs,
>>>>>> +                           basic_flags | BLK_PERM_GRAPH_MOD,
>>>>>
>>>>> why not 0, like for other nodes? We don't use this BdrvChild at all, why to requre permissions?
>>>>>
>>>>
>>>> Yes, '0' s right.
>>>>
>>>>>> +                           basic_flags | BLK_PERM_WRITE, &error_abort)) {
>>>>>> +        goto fail;
>>>>>> +    }
>>>>>> +
>>>>>>       /* Block all intermediate nodes between bs and base, because 
>>>>
>>>>
>>>> [...]
>>>>
>>>>>> diff --git a/tests/qemu-iotests/030 b/tests/qemu-iotests/030
>>>>>> index dcb4b5d..0064590 100755
>>>>>> --- a/tests/qemu-iotests/030
>>>>>> +++ b/tests/qemu-iotests/030
>>>>>> @@ -227,61 +227,20 @@ class TestParallelOps(iotests.QMPTestCase):
>>>>>>           for img in self.imgs:
>>>>>>               os.remove(img)
>>>>>> -    # Test that it's possible to run several block-stream operations
>>>>>> -    # in parallel in the same snapshot chain
>>>>>> -    @unittest.skipIf(os.environ.get('QEMU_CHECK_BLOCK_AUTO'), 'disabled in CI')
>>>>>> -    def test_stream_parallel(self):
>>>>>
>>>>> Didn't we agree to add "bottom" paramter to qmp? Than this test-case can be rewritten using
>>>>> node-names and new "bottom" stream argument.
>>>>>
> 
> The QMP new "bottom" option is passed to the COR-driver. It is done withing the stream-job code. So, it works.

Yes. But we also want "bottom" option for stream-job, and deprecate "base" option. Then we can rewrite the test using "bottom" option, all should work

> 
>>>>
>>>> I guess it will not help for the whole test. Particularly, there is an issue with freezing the child link to COR-filter of the cuncurrent job, then it fails to finish first.
>>>
>>> We should not have such frozen link, as our bottom node should be above COR-filter of concurrent job.
>>>
>>>
>>
>> The bdrv_freeze_backing_chain(bs, above_base, errp) does that job. Max insisted on keeping it.
>>
>> Andrey
> 
> I have kept the test_stream_parallel() deleted in the coming v13 because it was agreed to make the above_base node frozen. With this, the test case can not pass. It is also true because the operations over the COR-filter node are blocked for the parallel jobs.
> 
> Andrey


-- 
Best regards,
Vladimir

