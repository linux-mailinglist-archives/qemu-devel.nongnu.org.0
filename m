Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842A7374990
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 22:40:32 +0200 (CEST)
Received: from localhost ([::1]:37790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leOJp-0001He-AY
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 16:40:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leOHD-0000IC-4Y; Wed, 05 May 2021 16:37:47 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:52956 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1leOH6-000103-Hv; Wed, 05 May 2021 16:37:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HUjEog7K85nQWzpkLMfWgxDUqFGHTOO3UhJORd0MH7OgLk/r8Hl2vbQhs9Z2v+1rRFHV2/kGhBHxmzORYtFec0kDOIu4zGbzTDs0JqARfo/fAtTaTfOjzb/soATvVlozfe6O4X43gD7OHRxLVLaPgmwPOA0lmGZJFXHZcHwo3GNjgFEDCKo8KWAkFuk9rA2eNrHJi9QqnDv097HdXueWHB7ePliWEcVK0IabsDK8vnIuQKeQB/eRF7kdgiwkrDhWyzOH9ouKZHhb/1Twsnfmz4RmA/+78727bxc+EK+5tk2QB8r3EkCILQC3BDZbSLTwdFkNjk2A+5dFB914ngA0ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2uMeLUnpKhrPOxhKEJwnKC8HdX2ebHXZjX7jigfp+M=;
 b=OVYe3qnLfHi7VIATcJbGdodRewOdEfZr4jyM6pkmVvwvCml3hkpUxRa+/0/C87+q4ZIOhen5IPBYS5SHHdjTJOylYzRBUktNnqsW9ycl/B6L2RMDpdMqOu8FgvO2uGHXbhtSgR+wCzQTorftaybvsdk8Z5IWnN3+IUNiby+tcDqBIuPzd0jcjdRoghEYrwCk5tPj71+/3UnKAtMqG5t4uFGp5diIhqJEQv+Zsc7F3qE4Z2eVPOcd5xzrLsjb6l7573a7q17OhlwAaxNRl1/MvsY26pGnC3EEEnkyjWFYAPh1jqp+cpjo2qwvCapNUrtB8ExNKSgtBkwW72YhSQfxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2uMeLUnpKhrPOxhKEJwnKC8HdX2ebHXZjX7jigfp+M=;
 b=tRM83W0HxWeaCxzhs3pdPp2GZNnjggVHXdx5e+xQVGbDMAX8tZl5nUSvC/2K5QcvJdIV2qvSZ8p/zfMYoKq2bW1xcSBbwtTQID6FZ9phZBLvvx3FKWbicFoOQlEu8Su5xuWhdaQ26/F1z+sgshRzdjeECYMB+uiIzLWWpdsL82k=
Authentication-Results: dreamhost.com; dkim=none (message not signed)
 header.d=none;dreamhost.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6423.eurprd08.prod.outlook.com (2603:10a6:20b:318::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Wed, 5 May
 2021 20:37:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4108.026; Wed, 5 May 2021
 20:37:37 +0000
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 morita.kazutaka@lab.ntt.co.jp, gregory.farnum@dreamhost.com
References: <20210503095418.31521-1-mreitz@redhat.com>
 <29db0d1f-2d60-7df6-e6d0-97b89cf636ef@virtuozzo.com>
 <11eaa840-a882-3ba9-3069-91501b4c92fe@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <e4fee62c-dec6-052a-9d9f-087bbe6b9530@virtuozzo.com>
Date: Wed, 5 May 2021 23:37:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
In-Reply-To: <11eaa840-a882-3ba9-3069-91501b4c92fe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.236]
X-ClientProxiedBy: PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.236) by
 PR2P264CA0047.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.25 via Frontend Transport; Wed, 5 May 2021 20:37:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 36cdd662-b55b-4d85-b2c3-08d910059e78
X-MS-TrafficTypeDiagnostic: AS8PR08MB6423:
X-Microsoft-Antispam-PRVS: <AS8PR08MB64230DA00658EC9DE89A1F60C1599@AS8PR08MB6423.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oCEewTzB/L5gLYVbS05zUT4z48ZQaPn7O9EHSN8SpnQ+ekhkY8SY8+6C/8PEvHfz5ujtF/BrjUX7AnTJoCbt7FoRatyu7NN9+kinI6F3+sBss1OqYm04jwyv5bDCdybTpW7NY0ys70qMIA6BlPDgAlEpkksnJYcRd9uZYvyGJIlqKJ16zIunD53QQn562YghaQc2zRhJFYUghjay7y3tyssiSHrBzeJINBoh9zUNsz3sHB48Mj19t5+QWvThhwGzOG/qV5TGkn7tQSxJEyA0BpCbgNOeg+aLAs9eQvP5Y9NinTDy4iV5eJBsWkeNxJJMDU5RkBpLlVqyNAzf35EeawNRY6ceXrN3PJLhkagoEYrbkkmIqgmJNI8QvXyUIBduw1h+gsqB1sjhjRfYxPj5C1kHUnwBm28NTqB4oDQFSZCvt4qcdEOSKXnMZPY8a5cufp9o9YJ9+g4XXWIuAVqfCw188WwKItGtpQKpZrJ29S8iRbRUn7lG6seEDX9XzBUPmv56CGuUcwBPzQS4OHjG/DIkQDiNdBb1BUWI9n3kee9zrFbFIHEE77GM2ls3tE3gZOHcn3jmpTdGCb7TrETq6zSBi17b2SoShek647OXaNvNIyOlzDEB6rl7VxPB9Cp4esfF6bG1BWXN+WlXqZ5qXqy/GCBL8ViuHTver5AW01qjITobx+dynPNALtHl/rPFBLmIEg56+RkaXkPM8QepxLgrkLfn4YTdUjDZD/Gx/cQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(366004)(136003)(396003)(86362001)(31696002)(66946007)(16576012)(316002)(16526019)(4326008)(83380400001)(5660300002)(66556008)(66476007)(186003)(956004)(8936002)(31686004)(2616005)(26005)(52116002)(8676002)(6486002)(478600001)(53546011)(38350700002)(38100700002)(2906002)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M2x0MXBubUxBRzMxUElBNGdJaVRXUE1uNjlVZEhVcVNpSURQcDdwL2VqMEMw?=
 =?utf-8?B?WDVjWGg3OFRuSVUraDl3am9ET2lTQ3ZEZWFEUDRxaHZQeDF4aWM5Tm82TzdS?=
 =?utf-8?B?dGF0alpsTjRjRkVIc3RzcWVTeStKcW5LQXB6VkgvS2g2b2trQmtuTHhVNlQw?=
 =?utf-8?B?amNWMURuY3JVZFdzTkg1Q2hVUFJoblRhVlM3ellHci8reFNzSkdVYXV0UUV6?=
 =?utf-8?B?VkpNMXZ1SEJYMDBlWHJ5UjRvcXJybWxZVGZzK2JGbm5FTytPQ2pSRGkvRlhp?=
 =?utf-8?B?MmR2TjkxNE8yMi9RRkdSNUtqeDBXUUZIQVcrbGpBT00vSFhEZy9HL1NSZmw1?=
 =?utf-8?B?TzlWZGk2M1ZNQzE0Q0laemdlY2hxZDRwSzl6N0VScUZYRklNRXNmSXE1SjZP?=
 =?utf-8?B?OUtTb1IvSEJOZnNFWkpqSEV5NjRyREpYb0QwTmpPVUpZblZGY2NPa1BJVFFH?=
 =?utf-8?B?NnkxWDNyTTg1QTA5Nkw2aHZCeThYSGdoMlkwVS9XdGkxVm1XNUh3Ky9Sa3pB?=
 =?utf-8?B?NkRVZjA1UFVKZENJQ2hINEhET2xvVkZzYzVrdXE1d3dRQzRlSE05SFRKaGVs?=
 =?utf-8?B?OTFRd2wzUzN0c3VRNGdXUy9aZFhVTGY4ZU9PREVnZzc3b0ZNazNwSk5NZGNE?=
 =?utf-8?B?NXIyOXRPM2NseWVaVU1ZSmlMSW1QbVBMckxOUGpsS2Y5V1NPanBpOGtlVmx4?=
 =?utf-8?B?SmNaeHBwdmNzZ3dzNS9NZUdDNjBRLzVCaXhUaDMrN1BKUmtVQjhwY2JUMVd0?=
 =?utf-8?B?ZHhTeGVmQTZRUFU3bmdLYi9CWFl3M3ZZbmFSeFFDUTlobGM4YWk1TTluaXZ4?=
 =?utf-8?B?MDUyckR2VEE1TUdhdkZZYXpUTzkySjdLbzNFZFpDVlR3akQvdlFDNFg1T3Jp?=
 =?utf-8?B?V1VNaGJRQzR6U2Y4eS9LZHNyNWRyMVh5SU5LU3FzU29ZNGdFTCtEQmhjeFJ0?=
 =?utf-8?B?T1hZR29nWGNxcmVIVEpVY08wZTEwcE5EbEdOVDl1T1V4UFBEeVZFT0c5Z0du?=
 =?utf-8?B?UUxKWHR5TGtrY3NKcGc4Yk9vSGZvQXdCK05PT2Vpcmg0bDgxb05PQ1ZLYnZz?=
 =?utf-8?B?QnJ4NUVPUGc0dTloelpueVNaYjZSSk10d05qbW5uMCthVzRuSC9HY3R0aW5H?=
 =?utf-8?B?ZVR0V2hHTmlqell4MEFTbHEwNllvdWNHUk04Z1lXNDF2U00ydVVwcmtZSTJj?=
 =?utf-8?B?eTBxR2pUVGd5em5qaHFQRHBoUk1mOWtlbmpMZWY5M0pXa015V3pGL0I4Y21w?=
 =?utf-8?B?ZGR2SWt1cVBLcEdqMnRiMlRHcTYwaFpKblV2RVgzeGVKR0dIM3gzdk1IUEJ5?=
 =?utf-8?B?d2ZDY1JZK2E1ci9iMC9OQUFYbXhiUE1RN09ub2RCZ0F4Z21GTDY0OExNNGVV?=
 =?utf-8?B?a3VDeWRubmN5bWJMR1gvNEduSlFQMnNwTDNmQzFpY2s2RGxodGt3MjhDRnFR?=
 =?utf-8?B?V0szS3dKSTBDa3RuTHZxekwyV3JxM0dhalVjd0ZKN3RlUlNyR1Z5bFJvUDEr?=
 =?utf-8?B?VllZWlUxV3Z5RnBnUHdDeEt1Zmo3ZjhsYmxUMzJrdVgvNU1GekNYNUJDSVJi?=
 =?utf-8?B?U2hpYTk2RlBmaU0vRDlQb1ZITXJNcFhKanVRVGFHaTZWMzlWNkY0R1NBZEtS?=
 =?utf-8?B?S2F1aEQvT2orZ01SL003YlExYjRUL1FwTTVNbEFwbnp6L2lCWmRyaUxuTDUr?=
 =?utf-8?B?enJGRWhUUGxLQnFhL0JCYnFiblcwcU9xQW9aZ1BuaDBSaVdUT0VFVWtqYk1Y?=
 =?utf-8?Q?WDZmuPJpwP7BhTXgNwtjkZTBYbep3hFlANnJYbW?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cdd662-b55b-4d85-b2c3-08d910059e78
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2021 20:37:36.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAiNLkGn+FO8OrBFElZy7col54i0hR8z8WaXAELmAHwkC03UtNKDRNYCjySmUOE3A3KCWPlfZU6DQZkwnyK7DbzUWXR/ajBuq2zvMTJi/nU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6423
Received-SPF: pass client-ip=40.107.7.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

05.05.2021 19:25, Max Reitz wrote:
> On 05.05.21 17:05, Vladimir Sementsov-Ogievskiy wrote:
>> 03.05.2021 12:54, Max Reitz wrote:
>>> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
>>> either bs->file or bs->backing. 
>>
>>> We close that child,
>>
>> Do we?
> 
> We *detach it.
> 
>>> close the node
>>> (with .bdrv_close()), apply the snapshot on the child node, and then
>>> re-open the node (with .bdrv_open()).
>>>
>>> In order for .bdrv_open() to attach the same child node that we had
>>> before, we pass "file={child-node}" or "backing={child-node}" to it.
>>> Therefore, when .bdrv_open() has returned success, we can assume that
>>> bs->file or bs->backing (respectively) points to our original child
>>> again.  This is verified by an assertion.
>>>
>>> All of this is not immediately clear from a quick glance at the code,
>>> so add a comment to the assertion what it is for, and why it is valid.
>>> It certainly confused Coverity.
>>>
>>> Reported-by: Coverity (CID 1452774)
>>> Signed-off-by: Max Reitz <mreitz@redhat.com>
>>> ---
>>>   block/snapshot.c | 14 +++++++++++++-
>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/block/snapshot.c b/block/snapshot.c
>>> index e8ae9a28c1..cce5e35b35 100644
>>> --- a/block/snapshot.c
>>> +++ b/block/snapshot.c
>>> @@ -275,13 +275,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>>           qobject_unref(file_options);
>>>           g_free(subqdict_prefix);
>>> +        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
>>>           qdict_put_str(options, (*fallback_ptr)->name,
>>>                         bdrv_get_node_name(fallback_bs));
>>> +        /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
>>>           if (drv->bdrv_close) {
>>>               drv->bdrv_close(bs);
>>>           }
>>> +        /* .bdrv_open() will re-attach it */
>>>           bdrv_unref_child(bs, *fallback_ptr);
>>>           *fallback_ptr = NULL;
>>> @@ -296,7 +299,16 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>>>               return ret < 0 ? ret : open_ret;
>>>           }
>>> -        assert(fallback_bs == (*fallback_ptr)->bs);
>>> +        /*
>>> +         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
>>> +         * was closed above and set to NULL, but the .bdrv_open() call
>>> +         * has opened it again, because we set the respective option
>>> +         * (with the qdict_put_str() call above).
>>> +         * Assert that .bdrv_open() has attached some child on
>>> +         * *fallback_ptr, and that it has attached the one we wanted
>>> +         * it to (i.e., fallback_bs).
>>> +         */
>>> +        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
>>>           bdrv_unref(fallback_bs);
>>>           return ret;
>>>       }
>>>
>>
>> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>>
>> ===
>>
>> I still think that this fallback has more problems.. Nothing guarantee that all format drivers (even restricted to those who have only one child) support such logic.
>>
>> For example, .bdrv_open() may rely on state structure were zeroed and not initialize some fields. And .bdrv_close() may just g_free() some things, not setting them to zero.. So we probably should call bdrv_open()/bdrv_close() generic functions. But we can't: at least bdrv_close() requires that node has no parents.
>>
>> Not saying about that we lose everything on failure (when actually, it's better to restore original state on failure).
>>
>> This feature should instead be done with help of bdrv_reopen_multiple(), and even with it it's not obvious how to do it properly.
>>
>> The feature were done long ago in 2010 with commit 7cdb1f6d305e1000b5f882257cbee71b8bb08ef5 by Morita Kazutaka.
>>
>> Note also, that the only protocol driver that support snapshots is rbd, and snapshot support was added to it in 2012 with commit bd6032470631d8d5de6db84ecb55398b70d9d2f3 by Gregory Farnum.
>>
>> Other two drivers with support are sheepdog (which is deprecated) and qcow2 (I doubt that it should be used as protocol driver for some other format).
>>
>>
>> Do we really need this fallback? Is it used somewhere? May be, we can just deprecate it, and look will someone complain?
> 
> Maybe? :)
> 

:) I'll send a patch later.


-- 
Best regards,
Vladimir

