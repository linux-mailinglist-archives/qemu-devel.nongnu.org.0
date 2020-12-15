Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 578332DB4AE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 20:55:36 +0100 (CET)
Received: from localhost ([::1]:54818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpGQ3-0003VR-CK
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 14:55:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpGOS-00032n-Fd
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:53:56 -0500
Received: from mail-am6eur05on2091.outbound.protection.outlook.com
 ([40.107.22.91]:57160 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1kpGOO-0000Cu-Pu
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 14:53:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBVQ4L4PB66XuwALLLvv0u+b7d41MxaPew1Yagmh3lyxji8n2l6ou7IgQYgyExQrDoG/J++CYR+KpL53O3UbJo8DHsaXiSIMLvvNhr7HTscElBQ75yUQBI5j6sYvnd6mwBSgBYIsvYp+DIx0sB8GBNMmPG/sPbXUs7Gn2xO+BmDWYFJDcEZMgvUFlPu+1LPjm8Tjx0/D0cDxOVeIpgzJax7V5j5m6ddzzZ5dgx1h0DmkLMzJ7ad0W4gMYFy+x+Z9OaPTrkvWb46imiPT7S2jckWa9I5Ieuc1JSW60kqM/T0ql/RlCwhCZ1s4iPD+WTEw/8IGd85YF5odRGYvmjKMCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZqsNWPWr8JWbNEIAqge4fVagluXDzbavxiMyEGkjDs=;
 b=UxINZGHdvmVhyNKX/rUkw0ydv/jiLMHzh60yGUziALTxl2rexQY7efgbTYrnWxjPyvxeCPrbmA6pG8lI8AHGlbzBEZqFJgY1+/MDxAypVJE8lnV5oMx87tEZsMWLnhQ8JNOZzNkltRtoXdjdsq/HASQd1mgdxXuFW9mSyFjRjEWy9EYLWe9QMBgW4SA4QbzEE8K1pmpWIB2eG/PY1AKzTHyVAZMz7cnC4j/0MtDd1Zb89VfO1GY1D8SnJZh6jBMLKI1AyhpAAD5tsQ/St2rlgHIEdDeEnFumJ7iajmeVKWOBm7OJKSya93S2Maflroo5FmH7PeoxogHOeoPLVfWqgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZqsNWPWr8JWbNEIAqge4fVagluXDzbavxiMyEGkjDs=;
 b=gXnQ84vU8ZtVgJcr7DnPWT9URNVbtAkEgGQpoFrfT3JjLQTgAzzGHF/dW8Q+qG5LnX/sblCazTg/GJrffb3myDCCA+SugNcVSRNS57f6UznVeW2PniPIvZ5D7Zl/H7MtPSh2s2UM/CAAjnR8nJzpK+8hxxmA+xTU2uQcVov/Z84=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14) by VI1PR08MB4014.eurprd08.prod.outlook.com
 (2603:10a6:803:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 15 Dec
 2020 19:53:15 +0000
Received: from VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9]) by VI1PR0802MB2510.eurprd08.prod.outlook.com
 ([fe80::ac70:da6f:e05d:1cc9%12]) with mapi id 15.20.3654.025; Tue, 15 Dec
 2020 19:53:15 +0000
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v6 0/4] migration: UFFD write-tracking migration/snapshots
To: Peter Xu <peterx@redhat.com>
References: <20201209100811.190316-1-andrey.gruzdev@virtuozzo.com>
 <3f19b8d2-0b4b-95e3-8a1f-a1cfe791a4e1@virtuozzo.com>
 <20201211150940.GC6520@xz-x1>
Message-ID: <2a1f164c-94ab-0d35-96c0-792524d9ef30@virtuozzo.com>
Date: Tue, 15 Dec 2020 22:53:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201211150940.GC6520@xz-x1>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0075.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::28) To VI1PR0802MB2510.eurprd08.prod.outlook.com
 (2603:10a6:800:ad::14)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0075.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Tue, 15 Dec 2020 19:53:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7fe8ea6-11c0-4450-e27b-08d8a133101f
X-MS-TrafficTypeDiagnostic: VI1PR08MB4014:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR08MB401464D38258180CEAE2F6059FC60@VI1PR08MB4014.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ac/1ReAEf0dkthJZepYtjzsSJ1WgOh7eKx3DbJqukHk8S+tnrL07pgXNUhnnfuMwcpSZXJV8WI4iVoGgthiBW1TtYaCnYerXym9StGX+JiULLRTzkauhO5rGYMFvoVI0XTMe6GUvHzq1NhN3PvcMPMX056IF1l2C0Y32oJwiKmGPY7KjnjaXDtGDCjnkWtzKXutG7ud+YU19l3qiaBPKI3VCKY0ul5MK66q7tpzNbr9XUDjx98IUpOA3RP5yJG+kNYdIZP6eumSNCgcHbRZkvu6IMFe6ZaZfoJfQ1XnOebJuQWUUj8NNPG1QwF9hHGJZxFBkrilZTZHsJSyiMbVEHbSozH0oFpDxD+X027jiVQswpoUDqP8C9cM+vlq380siirXzWbwt4R2WW0mt3Y2Ytx7himXZW/wF1B9EZdRfAnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0802MB2510.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(346002)(136003)(376002)(366004)(396003)(53546011)(316002)(2906002)(86362001)(16526019)(956004)(6916009)(16576012)(478600001)(44832011)(2616005)(6486002)(5660300002)(8676002)(66476007)(54906003)(4326008)(31686004)(31696002)(66946007)(52116002)(26005)(8936002)(83380400001)(66556008)(186003)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eGZwemQ3NGNMdFlWZDlCNmJzV2FCSnNnQzYvaHZLb3VCY0UwZkNyZ3R1VmVv?=
 =?utf-8?B?dVJwSWt2ZFZxM3MrQzM4aFNsVjhXWGZheU44OUVoN29tMXdwckkwWWtIKzNm?=
 =?utf-8?B?eEZqQ0lhOUpXSWlWL2tkNUlzVGEvTmNJUnRKWjhWNEp3cks1Qk94RzRHOFN1?=
 =?utf-8?B?R3VHMzVxOHdHMVRQT3lSOGU1MUdiOGgrNUQ4d2FQMUxVWEpxVW10R2NKYkRP?=
 =?utf-8?B?cE5oUm54UFFjWjdveVJ0YVl4eE1taGZGUnZTSWJPOWxodzFYOEZhUjR5dE4x?=
 =?utf-8?B?Vmd0M1QraE9WNWdEcGRGWkZ4OXdKc2NCRVhENTU0TDZQQ1NpSWJIOFlRTW9G?=
 =?utf-8?B?WVQ2dFZna3RiWkpDMmlLUkdkZkc2dXZzbUlDUU1icHc3aEtOMUFrYmtmNGE0?=
 =?utf-8?B?ZDhpQmMxNjFNeWdyNVJocU5BdHFEeTcwWDdmb1BtVHNUWmlnTDg2SUR1eWEx?=
 =?utf-8?B?L3hrQzdBKzZVdHJ0WDgrV2Y2MjhHQ3NCK0U4cGdxM1haNU1CdHVEUTRVWmhZ?=
 =?utf-8?B?WDdKUUROUzhXZjhKNzgxcnMyN1RxUklSbksxWGFjVVMwQkp5TStta1VoS1Zr?=
 =?utf-8?B?eS96cVQvOUpqNmJlMjEzTVVMUWxLcTRkNXl2Wk94dGlQbkxYdDdrNWVpVXRl?=
 =?utf-8?B?ZGdUVzQyWUNob0ZuU2ZvVDFYNXFnUThZWTAwNk5LRWdSbzh6VFEwQW9Zak1P?=
 =?utf-8?B?Q0Y4Z3FLRXgvYUk1aVFQcncwV1lsN2RKTkVmVnZkN2hYM1dsTVgyZ0RicUI1?=
 =?utf-8?B?c2t2UHpPMy9YbDdzUHBqVUJQOFp0aDRhUzdtNE5ndys2WGkvbGVENGRIK2s1?=
 =?utf-8?B?cThIanZKTi9BZURLWFpUYTIzbmtzNTlESldQYllBdWpWd2xTNDBNMXVSNmlo?=
 =?utf-8?B?MGdsV1VHOHRnN2wyeHlFc1R4b3BDUU9HcENkSERtWGFLMnRzbTFRUU13NGtF?=
 =?utf-8?B?dFpvemViVlRzR0RRQmYwRU5ONzNLV1JYQ1JONXFDQ3psdnM5eUhvcm96cGtu?=
 =?utf-8?B?MEk3MXBxUVRSWHgyR0R0Qk5YVzFFem9hQnNwRjgyZENVOE5mYWlxcnlid0RS?=
 =?utf-8?B?OHNDbU1wUmJRTWprRGg3aDVheHQ3SlU1RU9URWpVQkFVanJIZUhLc1k1TTMv?=
 =?utf-8?B?WVNNdS9Bd1EvQTBiSW1YcmV1c3B2Qms0WXZjZnZNWndmWGh3NTBDYzJxMFdv?=
 =?utf-8?B?bFFrMitjaGp0eFZRalNPenZTYXhKRVdwaTM2Sm5qUVZOUzgxYXJlbk50MFhv?=
 =?utf-8?B?R3VmVlVkUjF4cyswR2gzdkJEbzFTNi8rWk9LWHpUZkVHOGJZWXBXcDllVG4y?=
 =?utf-8?Q?gWsXoB4J4qDtE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0802MB2510.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2020 19:53:15.7744 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: d7fe8ea6-11c0-4450-e27b-08d8a133101f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2Dvys3+jPubxSu+gyBxy8zNktHUwkjJdA3QOSImZ6DqN8nO/DXMCfWS8ObOrnUNRtNel67u904Wtl9D67jEbL9CBt7GEPdS6YCFfuA9A2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4014
Received-SPF: pass client-ip=40.107.22.91;
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

Also, I've missed some code to deal with snapshotting of suspended guest, so I'll made
v7 series with the fix and also try to add more effective solution to reduce millisecond-grade
latencies.

And yes, I've used bpftrace-like tool - BCC from iovisor with python frontend. Seems a bit more
friendly then bpftrace.

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


