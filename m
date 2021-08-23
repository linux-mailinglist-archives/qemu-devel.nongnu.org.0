Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 231243F4AA5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 14:28:02 +0200 (CEST)
Received: from localhost ([::1]:56068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mI93Z-00041X-8I
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 08:28:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mI90O-0002XB-0F; Mon, 23 Aug 2021 08:24:44 -0400
Received: from mail-eopbgr140099.outbound.protection.outlook.com
 ([40.107.14.99]:44803 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mI90K-0002Rz-Fi; Mon, 23 Aug 2021 08:24:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggSHMxTvFESoXLNQQFN/Jli+r+ev4UkTflwljPEjbZmawf566qvDZR+YcjM4y2SOCJBc6pTiW4i+62YIE1b7fsmCMtFZHEzgm4zumsYZY1KwS1u/9WB+nLDrM6jEgFtETt6E1YH4fILlQETzlP0rwV9p/kkRjdl08uORalO3CQkUtsS0vupGa2XADG1Uy/vl5Je7MBPfEyq3YszWqVL/L4koKW9++qsyo7BW3JXaHyuwp5W+nW8R7EFF+Pjttp+/06raXzL7IM3eAuhokX+3/3BAAHtwK/Ps8xYhJNfo7FXwAE8U2weOKmBxw+U3EK9oNRJPdfXDC+yCGG+CEE/mwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBYrsaIx67F+RTfAbhBDad46rGsKcf9MeYzl5QZwD24=;
 b=Dmos7rLyTkweq4ViaNoSY70JqwnLnJiDhVBC/TsCH0WCBGd5gKIScGkxk5b4lQmJJQ9LdrS7BFSFqKT6cDp5nJlr0qlBG0kl1ok9DHMOEqg+8Zx5lMbQPf6ZORqKIWBYkl42x2U91q9xvJg2xDZL6Ww92XWNTJtN7vZYaLs7xThzIIR4nlauP2iriGzFRPah3LwurWl8C0/+fwAmFBYwddZrWevoCYRuiAkqM/Dok8oRywxJl7bfCggqH6EPzGhAkrXXZf+mMRpXgqoI0JfYsC5sKA8U/7O09/TweurMD8o5kayKq5PF1/cqQ26jp4vSR6s1fhyJL5oyj9rZxAIw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MBYrsaIx67F+RTfAbhBDad46rGsKcf9MeYzl5QZwD24=;
 b=pTK2p4y4DdJcM8yOFVARoyLkibtdE8gQY3grhxtGCAQwUOxhQ3fmx1hZ9m3wm8MHSV8KY4tKcQWf9iNLHOpZZQQn+wZa1Z1859ym2/5bQ7ve2kQmcAILFrAzcmp7LMiganKeCqb4d888hR7UCxfB0ORq/3SngufkIncQtcpt5RA=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1971.eurprd08.prod.outlook.com (2603:10a6:203:45::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 12:24:31 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.024; Mon, 23 Aug 2021
 12:24:31 +0000
Subject: Re: [PATCH 3/3] qcow2: handle_dependencies(): relax conflict detection
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210724133846.64614-1-vsementsov@virtuozzo.com>
 <20210724133846.64614-4-vsementsov@virtuozzo.com>
 <d5941c16-ea90-b093-b72e-312054c13642@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9a7dc1c1-cfa7-bbdf-719e-7a80804b1559@virtuozzo.com>
Date: Mon, 23 Aug 2021 15:24:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <d5941c16-ea90-b093-b72e-312054c13642@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0010.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.249) by
 AM0PR07CA0010.eurprd07.prod.outlook.com (2603:10a6:208:ac::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.12 via Frontend Transport; Mon, 23 Aug 2021 12:24:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc18e827-99f1-490a-ae44-08d96630f59a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB197131702A03F3031B1BD298C1C49@AM5PR0801MB1971.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GMcc+sthMoirCrIH6fduetdVbJ9geay+FSL5kjOqTL1X1qSJMjmPiYEtCb3lS3ghDGyU06/VQVjFz2eLfmZZai/kNpHQAf0Pv0nY1cEhELA9jqT0pkg9VgT/Z4ClaxC8mLI9Yg+1xy4OK/Kmn6OYMkafVg3hw4rDIv1j7gAibW4JgXm796zUXdJ7MRnsBmhJCZYha3PZsGS5I38fqk8pvgT5v8x9NLHDX6qkGOdWxIl58H0U7zh/+3to5S19P11woVNV9ITZGsCR0ay8/fzljYXTNiK1N+Dyf5cVu+JDc2CY9qnjI9mvvje3W7DaNx5H24am+Zc26FDUELt3fousuL0UPlUCOQMvopYkf6ZCPSFDcrz19rdhFQjlnbzc8rEjpLxKT8a0PzJVaLhvK2hmdogvAZgf3sD65lvSJR9VyhWz03XP8fEWpt6YGLMwf0ikdp3VBFKVVp6VpFXJJmM6dF0H6geTZpTP/1Zlm6cCrHDAE7RkDKHGSRysvG32Cvqw09j6Ow/BLJDS3KfYDn7PwhXMheqchbzSd9ztm7aEF7mBa8ejhddEByfmeJW7AKbqyC1XuFkvR1IdZD2tTmbPgb707OT35812rXJEAVvBOdYX7PsJiKb5xBZynxLvzA5fluBKSGlkTVHil2UUKiNYv4qJH52ydpm7ThZ50Kvf4cu+kS/WUnRenyJgpSTtmopO2sIDheeLxznCjF9BFxfAyXHwg+D6aXpgzhb0Z72WmdHmlPB4qnZ/qg6J1DMe4Ob3O7ftVfQRjpoD5axZsr+MazpvuJMDTsNVnZV7ABA8qX0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(38350700002)(38100700002)(16576012)(31696002)(6486002)(956004)(2616005)(186003)(4326008)(86362001)(5660300002)(8676002)(83380400001)(107886003)(66946007)(2906002)(36756003)(53546011)(66556008)(66476007)(508600001)(26005)(31686004)(52116002)(8936002)(21314003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OTR2djRMNk1odDI1UVhhSHFqT0ljQ2lSd0J5aWpheW9ZMXlXYW1PTkMzTm1K?=
 =?utf-8?B?YjVGUzRVSUFIKzRxR0ZCdXNDNk5EeU11VVBwUW8zYTk0RmdhUDd1Y2tSTUI5?=
 =?utf-8?B?UFJpMU9EZHZubmpVanlaM1NvUytnVlZzVC9xbWJlRFdHOEp6dHAzTlZnNmsz?=
 =?utf-8?B?bGNoWTM2MkJRS0V6emF3R01ybHFSYjlyZ2N6ZFJwVVdQeEUwUkFHQ2VCOHoy?=
 =?utf-8?B?SGdrdWp6eXJqcmtqMytBUnZFRGdPTzAycWRHUGIxajJTR2hEOU9tRzluaFdp?=
 =?utf-8?B?dFBXcTFjc2drTGNDcmdFdFFKcE1JRTk0Uk1Rc2w2UXV0ZGllM0Ftbm45RTc2?=
 =?utf-8?B?Rm5NZGlYNHU0OGMvc2FHeUVPMjdnOWNEUUV3Mk4vSGNua212dEdIc2lRNURW?=
 =?utf-8?B?dHdUUVN4MHVEbTFaZGtXZmM2RlVBWnNSV0lsVm5Sd0Q3RUZXY00wZjgzdGdM?=
 =?utf-8?B?U1k0NjVMQkVWaGl2SjcxVFhIT2UzS0hYOUJpZUVWZ2Jxa0Z6bVIxbCtpNVZY?=
 =?utf-8?B?dWxDa2NYL2w5eWI4YUJhcTBlTFRFYlVEUDdIZncvcGEzR0kraEt0UEc2UjRI?=
 =?utf-8?B?QmFIOTRyNW5FQmR0UXZqZlk3VHEwTjRkZ1psNk1zMGZJb2hwelRHQ2dsK3FX?=
 =?utf-8?B?WS8rVHJTYVQrZGpjMjRoaUQ1ZVk5T0JXcXRwYkFMRHFJVEw4Ry9OWHJjNkJJ?=
 =?utf-8?B?Q2pnWUh4S2R4dWJvWTc2YmpXc20xWkZSMjNFbGl6MWlyQ0lXdDg2V3JIaGJp?=
 =?utf-8?B?UjRXN1VydTBQYWdBUHo2VDhsVVk2TSs5Yy81MDRCQWcrcGNXemtveHlrV2lW?=
 =?utf-8?B?RWRmQUltd0xSOFgvSEx2OHl5SExabFp4emNPSWd3MHZEaVNVQzlrcWVsbmY3?=
 =?utf-8?B?ZHdtN0swV0tRR3pLR3NUZHJWMFAxemxrMWR6K2kzanhEdnd6N1c5UkNzODdD?=
 =?utf-8?B?TXhwT1ZrakV5M1ZUQmpyUnRDRVZSQUEyLzN3Mnl0QVdlc3dGNlFPbEF6NVBX?=
 =?utf-8?B?TlBPMFpReXNSS25CbjFsRy9Bc1ZSb2k1RXVMQU9ScEpuK2RZelVzZU9EMVk4?=
 =?utf-8?B?Nm9CUzc1UHk5eUdaemVVV0RRYlRwa0lKU1ZYdjJVYXJNUEoxVXRtNW9BYWk5?=
 =?utf-8?B?OGJCN1ozSWQ0RWhkTCtoNC9peEhPSkI0a2Zpd0ZIM0gxbXEvdjVVN0NreG9X?=
 =?utf-8?B?ZjYxNXl6Q25oOUR3YzJhWUVkSW5mWHZmdlB1ZURrTE4yM3g4MTFnbEtDNFJ2?=
 =?utf-8?B?dGFna25uYWF3bW5ENDVyRU9DcHFsbkhCZkZJLzJ3bHhIMTQ4aURNa0dOSXd3?=
 =?utf-8?B?MDFjZXd4Wm9pZmlWTnhvZ2o3RktObUppaVFrc2hYaWRsV1A2MCtSVmZWYU1C?=
 =?utf-8?B?eUk5cnA4b1pVSUViSWsxUHNKdm83d0RpMENVVE41NStKbitEbFpUYkcycUx3?=
 =?utf-8?B?UkpreVFwZlJtVVlhNzlub0VFbmF4OFhqbFBQdFpZNXFNbnFwNTdkQ3Z4RDF1?=
 =?utf-8?B?TDhETTJoeVFxTGFiT1hjbk1qVVZRMGJkYjc2Wlk0TUhKMWsvT0VXaEdjOWVB?=
 =?utf-8?B?ellnaTRMMDBvOUpZM0xxaGw5ZUZGYjRKUnhhMG80bFIzR1ZZSFdyQ3RMaEJi?=
 =?utf-8?B?Nkd2S2ROaFRJcDhzTjFiNVZDS2FLRmdTRFU3YWVzMUEyWWhYRGE1ei9KR0Jm?=
 =?utf-8?B?N0dUY0xOdXdUcTdTMEkzcmxwd2dxZFFESmNwZ25PaHhVclpTcTh0VFl0VGc5?=
 =?utf-8?Q?4ks1+FL0b03L49SjsgytCRdDaFO3YJjZpveRaNz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc18e827-99f1-490a-ae44-08d96630f59a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 12:24:31.5829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veyfo9p+9yGFYgUVRefyB56n0DGcoHqq9RtK3CwVE0yUjkOWWNJJylzdSrxTJeAGKNEiGBPhrHF9d3hECNh3Benreap7DxJFm04t+yOkEtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1971
Received-SPF: pass client-ip=40.107.14.99;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_NONE=-0.0001,
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

20.08.2021 16:21, Hanna Reitz wrote:
> On 24.07.21 15:38, Vladimir Sementsov-Ogievskiy wrote:
>> There is no conflict and no dependency if we have parallel writes to
>> different subclusters of one cluster when cluster itself is already
>> allocated. So, relax extra dependency.
>>
>> Measure performance:
>> First, prepare build/qemu-img-old and build/qemu-img-new images.
>>
>> cd scripts/simplebench
>> ./img_bench_templater.py
>>
>> Paste the following to stdin of running script:
>>
>> qemu_img=../../build/qemu-img-{old|new}
>> $qemu_img create -f qcow2 -o extended_l2=on /ssd/x.qcow2 1G
>> $qemu_img bench -c 100000 -d 8 [-s 2K|-s 2K -o 512|-s $((1024*2+512))] \
>>          -w -t none -n /ssd/x.qcow2
>>
>> The result:
>>
>> All results are in seconds
>>
>> ------------------  ---------  ---------
>>                      old        new
>> -s 2K               6.7 ± 15%  6.2 ± 12%
>>                                   -7%
>> -s 2K -o 512        13 ± 3%    11 ± 5%
>>                                   -16%
>> -s $((1024*2+512))  9.5 ± 4%   8.4
>>                                   -12%
>> ------------------  ---------  ---------
>>
>> So small writes are more independent now and that helps to keep deeper
>> io queue which improves performance.
>>
>> 271 iotest output becomes racy for three allocation in one cluster.
>> Second and third writes may finish in different order. Second and
>> third requests don't depend on each other any more. Still they both
>> depend on first request anyway. Keep only one for consistent output.
> 
> I mean, we could also just filter the result (`s/\(20480\|40960\)/FILTERED/` or something).  Perhaps there was some idea behind doing three writes, I don’t know exactly.
> 
> I think I’d prefer a filter, because I guess this is the only test that actually will do two subcluster requests in parallel...?
> 

Reasonable, will do

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/qcow2-cluster.c      | 11 +++++++++++
>>   tests/qemu-iotests/271     |  4 +---
>>   tests/qemu-iotests/271.out |  2 --
>>   3 files changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
>> index 967121c7e6..8f56de5516 100644
>> --- a/block/qcow2-cluster.c
>> +++ b/block/qcow2-cluster.c
>> @@ -1403,6 +1403,17 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
>>               continue;
>>           }
>> +        if (old_alloc->keep_old_clusters &&
>> +            (end <= l2meta_cow_start(old_alloc) ||
>> +             start >= l2meta_cow_end(old_alloc)))
>> +        {
>> +            /*
>> +             * Clusters intersect but COW areas don't. And cluster itself is
>> +             * already allocated. So, there is no actual conflict.
>> +             */
>> +            continue;
>> +        }
>> +
>>           /* Conflict */
>>           if (start < old_start) {
>> diff --git a/tests/qemu-iotests/271 b/tests/qemu-iotests/271
>> index 599b849cc6..939e88ee88 100755
>> --- a/tests/qemu-iotests/271
>> +++ b/tests/qemu-iotests/271
>> @@ -866,7 +866,7 @@ echo
>>   _concurrent_io()
>>   {
>> -# Allocate three subclusters in the same cluster.
>> +# Allocate two subclusters in the same cluster.
>>   # This works because handle_dependencies() checks whether the requests
>>   # allocate the same cluster, even if the COW regions don't overlap (in
>>   # this case they don't).
>> @@ -876,7 +876,6 @@ break write_aio A
>>   aio_write -P 10 30k 2k
>>   wait_break A
>>   aio_write -P 11 20k 2k
>> -aio_write -P 12 40k 2k
>>   resume A
>>   aio_flush
>>   EOF
>> @@ -888,7 +887,6 @@ cat <<EOF
>>   open -o driver=$IMGFMT $TEST_IMG
>>   read -q -P 10 30k 2k
>>   read -q -P 11 20k 2k
>> -read -q -P 12 40k 2k
>>   EOF
>>   }
>> diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
>> index 81043ba4d7..d94c8fe061 100644
>> --- a/tests/qemu-iotests/271.out
>> +++ b/tests/qemu-iotests/271.out
>> @@ -721,6 +721,4 @@ wrote 2048/2048 bytes at offset 30720
>>   2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>>   wrote 2048/2048 bytes at offset 20480
>>   2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>> -wrote 2048/2048 bytes at offset 40960
>> -2 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>>   *** done
> 


-- 
Best regards,
Vladimir

