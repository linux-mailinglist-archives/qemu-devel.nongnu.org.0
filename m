Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1A0301613
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:52:21 +0100 (CET)
Received: from localhost ([::1]:57752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KGy-0004rD-PF
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:52:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3K00-00084F-8u; Sat, 23 Jan 2021 09:34:53 -0500
Received: from mail-am6eur05on2095.outbound.protection.outlook.com
 ([40.107.22.95]:23136 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Jzw-00070e-SJ; Sat, 23 Jan 2021 09:34:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6OJufPdh7XFxXP716+YSQftsG725La6SFPF8XdEnakvHixybIdGTuNMe3QlW16ajBxBn8kNTNvP6jJB7TAHAGiu5nZ6hdHki4DHbWf8hm/6xViHUC5WzyCrPZ3nyAfaAfSQlwQfCeSe+izRVFeFkrJjZZrsb0kyFVXk5Ctisttf26ROjoh651biX4IR6osOdJ6EoLs6AfmH0FcZQu3uRJfYT3uXDF2cPHbpz5Mh0nzv2oL12g2wiyxNRR8jHRQOn4KRt8k126aJJBzJEzg6tmK8VtlOjXEpmOqE5VpxrVnrxnUm7YzzYrZZ+ljl9GmPNMQNwM99/EoLVWWSnTcR/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeXEMAi+w8GZkVQyodMsO3KabZwYMfK8qRC30Dr4BZI=;
 b=Go2Ec0hRlWVObxvXhqL6khXFHrhUc+vEioufMYwN1u6xkC7Dx7oMQo0juh0U3RvXpBUew5YQR0uWQQRm8Hp+/5hASR28dvzL7irKaTcOlDy1KLlrQLZCxrY9yf9yZM7ihHyLVSxIX2M9TQDUiVseKfOleCZj/vAx6+GvG9zW3SlCdwWNvNRV1x7BAUqJI5OkRKTe1j6YoGzrwsbO9yEuu2s1NYW0pKxxYDc3PhhiQoTKnh5tPMcA9c1akwhSm/48WgIof1iryZS5eIcJrOWrkLSnCKCJpkIyZqLgvJpHch199LXsuCFxhz1YyrBmPS1jNmOfrIYjiOhtOBvGzct0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeXEMAi+w8GZkVQyodMsO3KabZwYMfK8qRC30Dr4BZI=;
 b=E40gG1nbSxLW2sCUQdv/3gzcwlPUeFLGILecGEQo3x6AYmInb3DEZbryRKSKI/lQqFr+XIIIWYvxXmRT65ZO03sNXeVs+0ZgKS7EOtaZINe5SuawfS5d3/aYlBLhY9Fq4lRY6o8r6ykh9fMpqVdg0wXulhdnlzeBibYNfkVdlo8=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 23 Jan
 2021 14:34:39 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 14:34:39 +0000
Subject: Re: [PATCH v4 13/16] block/io: support int64_t bytes in
 bdrv_aligned_preadv()
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
 <20201211183934.169161-14-vsementsov@virtuozzo.com>
 <f0b7dc87-dadb-42bd-6104-d6139b936f31@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0808c6df-0835-c29b-3a7d-9c1b3b095ddc@virtuozzo.com>
Date: Sat, 23 Jan 2021 17:34:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <f0b7dc87-dadb-42bd-6104-d6139b936f31@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.71]
X-ClientProxiedBy: AM0PR04CA0007.eurprd04.prod.outlook.com
 (2603:10a6:208:122::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.71) by
 AM0PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:208:122::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11 via Frontend
 Transport; Sat, 23 Jan 2021 14:34:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d7beb6-d785-4b1b-1584-08d8bfac03b0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB33838E8B96F498087635ACA4C1BF0@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y3T/FCN0/KGxb2jh90fT7V9Rh5m0ttbIbWiX3uzImBQtmrMzY9E9Emy2+HLvNWAbH+vUievU9N2dpKdVHk+s5Wz2WLOFJj+pWYUT8r6RHlQVOz16Hj8r+QMPq3SGWNr5Sg9PfIuKFosdNfp/Qi37XRjIuUukM01ef3YI0SUznChWqWbWuEm/P/k0Vi0SNrk6mB2sKuwXWLh1GYiCCz35NEZkDJ000lnMpifYv63RN049l3jw5BscqZOtf8FrxF/M1oCST4RNSnAVfu4plLbnH3pNFWy/8vB5hALMVXmU25PSt+6iD0jA0KzvUanwHLf6qNQ1zOTlnNvfrY8V7x5jTmHJwK0wgBedGNJ6YfbeGeCIkvCmtff8m7EBEsToiSq6zM055OfAfFkoIEJ5xoQyaIeawRg9ymPLuyV9rADAhnHM+rjwcRTaJhDOIC/8t7YGx80z9impdbaJx6T1eeyE5YEUpnRtg50+4FiLAuV+DDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(396003)(39840400004)(316002)(31686004)(478600001)(36756003)(2616005)(52116002)(4326008)(956004)(66476007)(83380400001)(66556008)(31696002)(16526019)(26005)(186003)(107886003)(8936002)(5660300002)(8676002)(53546011)(66946007)(6486002)(16576012)(86362001)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d0Y2eG1OZWwxSmFJbGxzQ1ozK1Yvek01NzlPWGxYMW8yTE9lR0VxZ1BMVXpC?=
 =?utf-8?B?UEpjQ2hxVEErRWE2R0dHVHpKMFVsVk5PeXBKNVBzcUFIbW9sZ041cnJBOEFO?=
 =?utf-8?B?QzlZWlFnL1E4SDRRQkNEVWcxdjZWby9vMUhsaXlzdS82R3Y3cFFYalNiUjZu?=
 =?utf-8?B?SUNvSXBiNTJqSTZVNGN5bUsxWmxHZzFpZ1REbnBWL0VSbjZRWHJzRHRxMGt6?=
 =?utf-8?B?YU1DMExIQjFZdjBITHcvSXcvMUpXQmRWTXpiTWR3Q2YzeXljSEE0aE1FSm0w?=
 =?utf-8?B?WlNvOEhQeHR1SWxDSG1jTjgrSGcvelc0ZkQ2SWdDNG8ySWxsYWhFL0REcXlT?=
 =?utf-8?B?TDgvUHZpWXMrRW4zVG9uTEpXMVVlSVlHOFcwajNxaFNySGRlWFhYZXZwSGNx?=
 =?utf-8?B?VjU2Q2UrOGZsRjV5NFoxaDNnc2hsWkNFOHlqVDNJR1o4TVdpQjQvOXlnWUM2?=
 =?utf-8?B?N3NzT0VxTmo4TjhkNCtxN2JBN2txd1hIOWFIVFFGUmFpR1ArQnRYT09BZEdq?=
 =?utf-8?B?cmF5ZnFVRTVZbkRXd2VQMTNvcjlqZUJoWjNvdzZOazhmcGpvV1pmMEgwUkZs?=
 =?utf-8?B?QlpkSHgxZ3VZa0ZCNm9mY2I2bFZCS0kyVUpZOTdXRWZ2V2src2RTNlFWN3FM?=
 =?utf-8?B?Sm8zb3NQbXh4NURFdzB3THYvVHFUZm00QXBWaytVK2E5cXJvNlhaS1U3YkNW?=
 =?utf-8?B?bFBXY3FvbndVdWRLdVZ4dlVTV1ZBNFNYQ0hhT0I0SUw3Z2c0TmZuOHJyQ2ZQ?=
 =?utf-8?B?R3V6a2QxU0lzWVd4aUkvWWZKeEFpNEJrUGRRYVlVZ2Y5ZzBIT1NKRFdMZEZR?=
 =?utf-8?B?Y3ZER0ovRUJMaGF0ejQ5NWNLUE9MSGxiY3V0cnNEWE1RNk00M3dtemZNa2lk?=
 =?utf-8?B?N0tTcUExWExoN2FFNVl3UEU1bnA0U2tIa1UwSEJqMUYvMXQvdkNPWG85S1lx?=
 =?utf-8?B?RHJ4STFMZ3dJbFg3VG9HdS84ZGpEY3lNQzU0bDAyL0VhbFRkSFNVb1dRYWhC?=
 =?utf-8?B?SkZVck5jL09xYlBsOUw0OXpCQ3owZ1lzNDliNVVsTEtVaXVydGZIaURGR1Js?=
 =?utf-8?B?Zk1kdElkT01GTFV4WjRDcThLL0hHMC92bWNTQWRCd0RWL216RU9Dam9rbmhp?=
 =?utf-8?B?U0xYcm9CNTRNWjdyeDZVaEtiL2FEWURseFRTZ0o2cXZiYnhQMm1NUDRUZStU?=
 =?utf-8?B?bWZ0ZFZaQTFoOFZzQVpQOFdKVmpRUEFiMmZIL0ljbXE1MlhBMEhlNXYrVzls?=
 =?utf-8?B?bGpraUt2MURnbVVabWhSYWd3VzNjVUJ2YlZWQ3A1dFhxZnZxaEVnZm11clJu?=
 =?utf-8?Q?e22ZbWFli2fJzQrvtibRxe8LBnSZ9KmNtD?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d7beb6-d785-4b1b-1584-08d8bfac03b0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 14:34:39.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: luzHBIXyVzygf8xZA9gNZC3ZvgOeURMPM7Anh1bVPo2wemDPyMwCtVJo3Vnw6RpEXgSXgoEPN3l80TU1/4RJ5yjzvqx5RctZ56YGabGQHGM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.22.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

22.01.2021 19:54, Eric Blake wrote:
> On 12/11/20 12:39 PM, Vladimir Sementsov-Ogievskiy wrote:
>> We are generally moving to int64_t for both offset and bytes parameters
>> on all io paths.
>>
>> Main motivation is realization of 64-bit write_zeroes operation for
>> fast zeroing large disk chunks, up to the whole disk.
>>
>> We chose signed type, to be consistent with off_t (which is signed) and
>> with possibility for signed return type (where negative value means
>> error).
>>
>> So, prepare bdrv_aligned_preadv() now.
>>
>> Make byte variable in bdrv_padding_rmw_read() int64_t, as it defined
>> only to be passed to bdrv_aligned_preadv().
> 
> Reads awkwardly, how about:
> 
> Make the byte variable in bdrv_padding_rmw_read() int64_t, as it is only
> used for pass-through to bdrv_aligned_preadv().

and also s/byte/bytes/

> 
>>
>> All bdrv_aligned_preadv() callers are safe as type is widening. Let's
>> look inside:
>>
>>   - add a new-style assertion that request is good.
>>   - callees bdrv_is_allocated(), bdrv_co_do_copy_on_readv() supports
>>     int64_t bytes
>>   - conversion of bytes_remaining is OK, as we never has requests
> 
> have
> 
>>     overflowing BDRV_MAX_LENGTH
>>   - looping through bytes_remaining is ok, num is updated to int64_t
>>     - for bdrv_driver_preadv we have same limit of max_transfer
>>     - qemu_iovec_memset is OK, as bytes+qiov_offset should not overflow
>>       qiov->size anyway (thanks to bdrv_check_qiov_request())
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/io.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 


-- 
Best regards,
Vladimir

