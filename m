Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CAD2DB4DD
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 21:09:05 +0100 (CET)
Received: from localhost ([::1]:36286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpGd6-0008T0-2Q
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 15:09:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpGc5-00083n-JW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:08:01 -0500
Received: from mail-am6eur05on2133.outbound.protection.outlook.com
 ([40.107.22.133]:32481 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpGc1-00020i-1n
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 15:08:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td5thY6lQmEcXrlsiq4i4dGBSNkaBDCfWkGOy8vYPNtnZqPY/IFNkHYeku19QLMS/GiUXGc44Avkgxnxe8B9qt+7eFeGXWI7n0nEywHb2X+j4d9Iy2yuPSuul9Gc5E66R5CKbemD4bl0L+uEDkxCfBANZobtiCXOlu2OrOYG75T0OfaFOJxrmSXu8/BIf5ErdW1z3vKlz/ifbDK0QaR+R1slFXFD9Cno2wTK5ZScuZbXAMqEqHsVymEQQ+6WduxWQFEuFVaYp5gvPEyjFbsy+wNXQ/HktdcIdLZ6+3qXUptPelXqKZwOASglojOJlFgZK7AhXrQ6rpWFcYPVkh5dGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbXpoHNs0sumAmn6gca8jl9HBcw7ZNkXq6o1/KkaLU8=;
 b=N64Qt272XFL6SDCvG//A2lsuXMMYivJXiutyHDXov+jHlGDqlKs11HjcaKODlDyGCUQ6grNx3hGDB1HiYbeAH3SQVYqG5Br4/kZv+g1WGz7XAwKOPoRjgze8TnO1IVegSYsY9/vpeY7JkRwzaG//YFceciY1IH8fA01Oq3F5f7E8l1wSmgvBso3eWBhdlxXLanO89Xu8I2/bs7+BB9X5HOA9ZZtZzLZY4DMu1vFpmA6BkNo5fbNHz4QdBoqZ7joyQJ1R/cOrtJqKqSTmnrWVO0bAccILCQZO2BagqVd07XRGDpP9oYNNMGKpe63VdSJSf/MBcmI6VqMJ2u7tHFEIjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GbXpoHNs0sumAmn6gca8jl9HBcw7ZNkXq6o1/KkaLU8=;
 b=WPOG66k/lboJSODw7wGExft3dVsrrEzP8C5YEj9Wucuo45SU4nq/HRiRxhz562npQ0MYwyO1rn0AKVCXof1EYZKzbPqdqEJpk448ckcwUC/UrBqtyHx07sh2guEGphltKAfVMhQqeYBf8g7vGPmq2G1C8JxDZTHSCMgVtWCJYLA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB4014.eurprd08.prod.outlook.com
 (2603:10a6:803:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 19:52:49 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3654.025; Tue, 15 Dec
 2020 19:52:49 +0000
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
 <20201211150940.GC6520@xz-x1>
Message-ID: <1869a9dd-f0b4-fe16-13e1-ad7ea8afc889@virtuozzo.com>
Date: Tue, 15 Dec 2020 22:52:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201211150940.GC6520@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::17) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0064.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 19:52:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8b7c2a-bab6-4a96-81e4-08d8a1330080
X-MS-TrafficTypeDiagnostic: VI1PR08MB4014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB4014C2CA2ADE47A6E07DABFB9FC60@VI1PR08MB4014.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Drr2fQXvTH83tO2eaxCrI3zXStRqmZ9c4mV+R4XvDEo8B7XxNLE2HIP0sjsZeaKE+V9fi3t+jNsV3TwU6p1BSwzsNq8/v7p0uWNus4cj3C4fTAodIs64bYglmWu4lyFRTi8xnsrWljIG3wfVmEy7i/SwZEuoZPzlum8hxceckPHthqNFQPmqd+1oSEk1TXBEkE/7v2obLqRYYJIOib0e13qFX4OBJ7KBaXwc2ixoipIf0IHfNBs3YRV2kEaGeUMCbJIhKIvplQTDs3JTSaWzxABKWK/eUA/8y5Q0nr90sXmAZA6TMAT23ili+MD84u0TF6ZVcHxD22Dc8UaUqfofGPrQUw35o7TNJsvnVp+VJnQ8RiDg9iYSvZPHxyJSUcdXUSKASyK3ZfUHaKZJG+0t5DhSa7l4Bkj2uNnAblexiNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(53546011)(316002)(2906002)(86362001)(16526019)(956004)(6916009)(16576012)(478600001)(44832011)(2616005)(6486002)(5660300002)(8676002)(66476007)(54906003)(4326008)(31686004)(31696002)(66946007)(52116002)(26005)(8936002)(83380400001)(66556008)(186003)(36756003)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGVNZ28zbTFRbU5yREh3Uno0SENyVFppU0xVT1hvNXp3cGxVYWU2NUtUazJB?=
 =?utf-8?B?aXcxcW5OMXZ6M2gzc2ljcGI4K1FhNU9IU1lVNGJtczRBV3l6NTdVNmFVOTl0?=
 =?utf-8?B?NmJXZ2RXdmJRNmx5Nk9vQTRxVnhuQnlNZmxNRndwWWJuY3lUbnAyOWRsTk10?=
 =?utf-8?B?aEVNQlQ1NlpLL3FKNHcrWkVXUTJkQWhZVmdkRHhjeHAxTk04UHdna0ZLL1Z5?=
 =?utf-8?B?NFU2REgyVTdjcEtkTW4zbDNCNFhwcW11eG1FbHBacG4wanlKSmY0VTBaM3Rq?=
 =?utf-8?B?alEwVHlrZDhqVHZ6NURhaWxWYTZ0UVJhK21IZWpqUlZTYWRobUtUSVRqT0pk?=
 =?utf-8?B?ekJpR29hekRCaHZOaXRWK0pQSkZQaGRaQlhkQWZxWUpOSU9lcnk0Y3pKWFJk?=
 =?utf-8?B?U1lmUVBRQlVxNVpIZUZSN1lCTmtPdG9UN05PbDN5aDNyVVUyazJ0WFBIdzdo?=
 =?utf-8?B?U1RENTBaaHdCRkpSeGlsZDBGMkVGVjNpalAvaFFaVmNGeWxIaC9veUxFeWdQ?=
 =?utf-8?B?aTJVV2VFclRlcFBlQ21BVHRMQkFici9CcFJEaFJZTTN2MVVaQ2NETEgxM09B?=
 =?utf-8?B?WVNPTGZSZVRtemxIZ0lUSTZYNlptdWxUWnNENC90dGQ5WGlIb05CWDhNWmtW?=
 =?utf-8?B?Y3pEYWtNQ1Y2c21seGhuOXdKOEZha2o2eUo0SHJ5bDFFLzRxVHlWV1piM05Y?=
 =?utf-8?B?Z28wUWpVNzlOTEhxL3pvSlQ3ZEtYRUpZajRUVndDb2ZHaWFGT1A5WjN4djk5?=
 =?utf-8?B?R0N6elZBVkZBWG1KNE1JV0JDVGFPdHhsY2FZOExLMlNxNXBoYnRHV2QxdWly?=
 =?utf-8?B?RVlFSWJqbEtxWkNUNCtadGw1RUYxR3ZFU2dqdEF3S0tVVHUzV2l4bWdYUnZE?=
 =?utf-8?B?U0F0NDJMY2d4eDZXSXBxd1J1Ym1taHhGaW1JQ1hkeHFtRG1Da28yNUdFdS82?=
 =?utf-8?B?a3V3MXRSbkluSTZXOVpucHNOWmh0ZnBUSUxPVHFNQ3grS3BlSlBIODJaT1dU?=
 =?utf-8?B?TWNBQUFhbXNyaTMrZ0tpOFMzWW1BdkZya1ZWYVlpbjNDMFFGRURsRWJmbEhX?=
 =?utf-8?B?MnYwVkVwQkVwYWNpY3hGUE5JYUdabk5xZFpHSS83UUVXYjZhL0M2c0IzVysr?=
 =?utf-8?B?YWZObytUVlRmVFd1eUFnamJ4VjMwNHAyVjZORGxOQVdQYTZ3SFJ4NnFFZ0hD?=
 =?utf-8?B?bEttSFpUM0Zva0hBOGlSMGVycEhGeUIyTWdQeVZGYTJZajJwek5PbS9sUFlr?=
 =?utf-8?B?dmxaTkpNSHcxemEzeTZPUjZKbEY3dTMrNXhuZldKa2M1UjZXVUs3YkloSWd5?=
 =?utf-8?Q?KI41jCSp7ZY0k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 19:52:49.4831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8b7c2a-bab6-4a96-81e4-08d8a1330080
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8q/4SFKE5YeM49a+FSEcqcyp4gMfCrjEGmchfGwmsUVV5UQgcbWZ7fSgbo5QGJmP0aLJ8G0ev8iYBMs64CgjgWSJgwS2Xv2sXi+jnJtx95Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4014
Received-SPF: pass client-ip=40.107.22.133;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11.12.2020 18:09, Peter Xu wrote:
> On Fri, Dec 11, 2020 at 04:13:02PM +0300, Andrey Gruzdev wrote:
>> I've also made wr-fault resolution latency measurements, for the case when migration
>> stream is dumped to a file in cached mode.. Should approximately match saving to the
>> file fd directly though I used 'migrate exec:<>' using a hand-written tool.
>>
>> VM config is 6 vCPUs + 16GB RAM, qcow2 image on Seagate 7200.11 series 1.5TB HDD,
>> snapshot goes to the same disk. Guest is Windows 10.
>>
>> The test scenario is playing full-HD youtube video in Firefox while saving snapshot.
>>
>> Latency measurement begin/end points are fs/userfaultfd.c:handle_userfault() and
>> mm/userfaultfd.c:mwriteprotect_range(), respectively. For any faulting page, the
>> oldest wr-fault timestamp is accounted.
>>
>> The whole time to take snapshot was ~30secs, file size is around 3GB.
>> So far seems to be not a very bad picture.. However 16-255msecs range is worrying
>> me a bit, seems it causes audio backend buffer underflows sometimes.
>>
>>
>>       msecs               : count     distribution
>>           0 -> 1          : 111755   |****************************************|
>>           2 -> 3          : 52       |                                        |
>>           4 -> 7          : 105      |                                        |
>>           8 -> 15         : 428      |                                        |
>>          16 -> 31         : 335      |                                        |
>>          32 -> 63         : 4        |                                        |
>>          64 -> 127        : 8        |                                        |
>>         128 -> 255        : 5        |                                        |
> Great test!  Thanks for sharing these information.
>
> Yes it's good enough for a 1st version, so it's already better than
> functionally work. :)
>
> So did you try your last previous patch to see whether it could improve in some
> way?  Again we can gradually optimize upon your current work.
>
> Btw, you reminded me that why not we track all these from kernel? :) That's a
> good idea.  So, how did you trace it yourself?  Something like below should
> work with bpftrace, but I feel like you were done in some other way, so just
> fyi:
>
>          # cat latency.bpf
>          kprobe:handle_userfault
>          {
>                  @start[tid] = nsecs;
>          }
>
>          kretprobe:handle_userfault
>          {
>                  if (@start[tid]) {
>                          $delay = nsecs - @start[tid];
>                          delete(@start[tid]);
>                          @delay_us = hist($delay / 1000);
>                  }
>          }
>          # bpftrace latency.bpf
>
> Tracing return of handle_userfault() could be more accurate in that it also
> takes the latency between UFFDIO_WRITEPROTECT until vcpu got waked up again.
> However it's inaccurate because after a recent change to this code path in
> commit f9bf352224d7 ("userfaultfd: simplify fault handling", 2020-08-03)
> handle_userfault() could return even before page fault resolved.  However it
> should be good enough in most cases because even if it happens, it'll fault
> into handle_userfault() again, then we just got one more count.
>
> Thanks!
>
Peter, thanks for idea, now I've also tried with kretprobe, for Windows 10
and Ubuntu 20.04 guests, two runs for each. Windows is ugly here(

First are series of runs without scan-rate-limiting.patch.
Windows 10:

      msecs               : count     distribution
          0 -> 1          : 131913   |****************************************|
          2 -> 3          : 106      |                                        |
          4 -> 7          : 362      |                                        |
          8 -> 15         : 619      |                                        |
         16 -> 31         : 28       |                                        |
         32 -> 63         : 1        |                                        |
         64 -> 127        : 2        |                                        |


      msecs               : count     distribution
          0 -> 1          : 199273   |****************************************|
          2 -> 3          : 190      |                                        |
          4 -> 7          : 425      |                                        |
          8 -> 15         : 927      |                                        |
         16 -> 31         : 69       |                                        |
         32 -> 63         : 3        |                                        |
         64 -> 127        : 16       |                                        |
        128 -> 255        : 2        |                                        |

Ubuntu 20.04:

      msecs               : count     distribution
          0 -> 1          : 104954   |****************************************|
          2 -> 3          : 9        |                                        |

      msecs               : count     distribution
          0 -> 1          : 147159   |****************************************|
          2 -> 3          : 13       |                                        |
          4 -> 7          : 0        |                                        |
          8 -> 15         : 0        |                                        |
         16 -> 31         : 0        |                                        |
         32 -> 63         : 0        |                                        |
         64 -> 127        : 1        |                                        |


Here are runs with scan-rate-limiting.patch.
Windows 10:

      msecs               : count     distribution
          0 -> 1          : 234492   |****************************************|
          2 -> 3          : 66       |                                        |
          4 -> 7          : 219      |                                        |
          8 -> 15         : 109      |                                        |
         16 -> 31         : 0        |                                        |
         32 -> 63         : 0        |                                        |
         64 -> 127        : 1        |                                        |

      msecs               : count     distribution
          0 -> 1          : 183171   |****************************************|
          2 -> 3          : 109      |                                        |
          4 -> 7          : 281      |                                        |
          8 -> 15         : 444      |                                        |
         16 -> 31         : 3        |                                        |
         32 -> 63         : 1        |                                        |

Ubuntu 20.04:

      msecs               : count     distribution
          0 -> 1          : 92224    |****************************************|
          2 -> 3          : 9        |                                        |
          4 -> 7          : 0        |                                        |
          8 -> 15         : 0        |                                        |
         16 -> 31         : 1        |                                        |
         32 -> 63         : 0        |                                        |
         64 -> 127        : 1        |                                        |

      msecs               : count     distribution
          0 -> 1          : 97021    |****************************************|
          2 -> 3          : 7        |                                        |
          4 -> 7          : 0        |                                        |
          8 -> 15         : 0        |                                        |
         16 -> 31         : 0        |                                        |
         32 -> 63         : 0        |                                        |
         64 -> 127        : 0        |                                        |
        128 -> 255        : 1        |                                        |

So, initial variant of rate-limiting makes some positive effect, but not very
noticible. Interesting is the case of Windows guest, why the difference is so large,
compared to Linux. The reason (theoretically) might be some of virtio or QXL drivers,
hard to say. At least Windows VM has been configured with a set of Hyper-V
enlightments, there's nothing to improve in domain config.

For Linux guests latencies are good enough without any additional efforts.

Also, I've missed some code to deal with snapshotting of suspended guest, so I'll
make v7 series with that fix and also try to add more effective solution to reduce
millisecond-grade latencies.

And yes, I've used bpftrace-like tool - BCC from iovisor with python frontend. Seems a bit more
friendly then bpftrace.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


