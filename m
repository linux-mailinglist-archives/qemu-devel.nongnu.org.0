Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4782EF0E5
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 11:53:18 +0100 (CET)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxpOQ-00036g-0X
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 05:53:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxpN9-0002cc-5g; Fri, 08 Jan 2021 05:51:59 -0500
Received: from mail-he1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70e]:28678
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kxpN5-0007jd-In; Fri, 08 Jan 2021 05:51:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcGoMwIRZuWheByBxGQxnKALjQYfdoDgoQkdYz0SQ4gWDhS4L/n+PwT/x/AFhe96gzKLeQLW4204eST76ETLO53ls4HeF9tMHOre9k503mmsvVAnA/dLhqiaw3zWqnai5fz2wEKbKE4Ke/gGOVWhUWAFS7oGBX7TBHfGUTEfKapg2/spUrExjau3NifhVSnDyj0B2oGY4FV19VbSpPk0ngnPuxyU3OaNzJ1hd1Fg5zdu4Ll41fP4BKZNt5RvBylW3IfkzifosuyctttWvjHfbh7KFUIROFoCq9IWbusPzB5ZqpF6uQtzFL1RBPFeMjryNIgx982rxKwqhgTNyEEaXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgOo9JHQnDRYyVHhbeJhc4MkhrF76ahJ4qg5ICFt7Wo=;
 b=KL+KzdmN8jepQYr0tbaJQ5PQA0qooz08sn4EVs+EdKuorGy0h11d+yR1sZoJeRId/t69uVinAcswA5/ZydMHQgp8DnCYPSY9YntEaAvFQIkkPtTpXEAsXsodxv7/0jLPm6f9CnicD6kbjHoZ7C+KpdixDO+EsdyUKBoan3St3e7nUJI9hj4HL+19LutBJobwLPcRt6GsU4IuwfWcs+xMcEluq7/9Ht/DASCJFvDOWM2ogxPo1+Rqc+M+bApzh7gA+UqfIEThV46cP+Vd/2LEUzB5AJ4Zot0T2nzhCqIv3EbTIxwNu7UEq4D9VpIVoAU2uz45nXsHLLEfdgNN1nKqJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgOo9JHQnDRYyVHhbeJhc4MkhrF76ahJ4qg5ICFt7Wo=;
 b=sxxpLmNP3X5idhkQJOrQUEYh/ucLOMSyXV3b4VT5EkKA7qIC7nlVrbjlXWBH5c+H2eIA1blYGCys14l/1O5C3MvJdFAyR1CgK6vQvIAufXcYtc7S8JuGB+1+w3HkK0Zi8l4qHm8iiSkeK1uNNyVPUdT1/I4qgxsVci2NchgauHw=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4949.eurprd08.prod.outlook.com (2603:10a6:20b:ee::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 10:51:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 10:51:37 +0000
Subject: Re: [PATCH 4/4] block: introduce BDRV_MAX_LENGTH
To: "Richard W.M. Jones" <rjones@redhat.com>
References: <20201203222713.13507-1-vsementsov@virtuozzo.com>
 <20201203222713.13507-5-vsementsov@virtuozzo.com>
 <20210107095817.GA2673@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <d3413d86-845e-ec9f-83b7-75c0720c1656@virtuozzo.com>
Date: Fri, 8 Jan 2021 13:51:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <20210107095817.GA2673@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0029.eurprd04.prod.outlook.com
 (2603:10a6:208:122::42) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.119) by
 AM0PR04CA0029.eurprd04.prod.outlook.com (2603:10a6:208:122::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 10:51:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c812f56-8410-43b0-698e-08d8b3c35f33
X-MS-TrafficTypeDiagnostic: AM6PR08MB4949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4949D92D5E53434B875B542BC1AE0@AM6PR08MB4949.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mf6sAa9IYTECSWM7OCBkNzImTJdTJG0gOAJi1PYPMhRStEB/hJAJWULPh8P1IdPXj6THWmLngoM7rFOysDVASq6ZsbMNjFMkN7bH+bwMS3rzhLtefl7U9lKhLhRCQMBqBi6ugkrTyvmbQ1FhxE2QOFdBnQbQC/D2BnqB4MY1pn7CU70fXARoE1/lm45z2vSGA8zdCZpNQ2/WhckkDPHFgFmlNfAkaLB+lnzJIej8u/6XV+8hMoVCDcb+a/ZfjvJ0au+Q+tIH4hO2NLTMsrMPTgPVaQAgkU6KaJpkmfcv63ncw7G+hl7C4e1OrP1Y22vRS+48FCegAuKUi+cJOl76tgeOdvIleRLWMWWnGR+lGo5k3qsS+5u6ph+rDYNZdlGmS9ujL9yr5eK64/FHQBpMPu4T/LXUPkBKtlB1z4eb2wWLK5scvva22dOotPC1sya/aU/6ZXAZfDkiBudNnblHWDeCTUBOt3s+KucQANhhomhmUUr/AoK8YD7N3XtVoGnTXNlG9XHSyo3dPZygMU2jA/XehRjQPqVaUrEKWgeiwKfm8KB/qsZ0GsFGHqC468VZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39840400004)(346002)(396003)(31686004)(6916009)(2616005)(83380400001)(26005)(31696002)(86362001)(16526019)(6486002)(8676002)(186003)(4326008)(107886003)(52116002)(956004)(316002)(8936002)(36756003)(478600001)(2906002)(966005)(16576012)(66476007)(66556008)(66946007)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?V3BIekRaY1ZPVVMyQTZVcVg4aVplWmY5dnhCK090TW1SZWREZDk2RDRLR3BC?=
 =?utf-8?B?MXRFU3RjZkVna28wcVRPUXZNYlF1dmFmS0NOcWZUdm9OSTUySDYzVnNOYWFl?=
 =?utf-8?B?bmZsblpMdm9WdzdXY0JVMmlLWDJxdnppdkdRWU5BQTNETFduL2tqTjM5SjFx?=
 =?utf-8?B?cldtcFloa2hlMFl3QjBXUjVFbjVrMnd4alB2THFtR3ByaThiaFA3OS9BN2Nr?=
 =?utf-8?B?Y1VlU1JwUC96L1UrNXBwQmlMaXdvRnhWYjlKVWxCY2lmeUtPOEJXM210Ymhi?=
 =?utf-8?B?bUlyb0hSK1dRNUxDUHY2eWk1dUVEbzVaQVdtV3REVkdDWWNJRy9ZNkdSeUJG?=
 =?utf-8?B?K1dZL1ZiODdKNUd4czBjblpQZnpzNG5ReGlSYlZvVXZ5dkRkRjdrM2JlZ01S?=
 =?utf-8?B?ZlJMWmZLT2thVVd4VWNDRmlsNjNMd044dEV5cW9QMmNqUWc0NVVvMmFGUzhy?=
 =?utf-8?B?YWtGWng5UGhGVUFZOVRHcXhBT3dXdUdyYjFpLzNjMExDT3A3NnFwZlh0TzQ1?=
 =?utf-8?B?cGsvRTFwSlVYR2ExTVdOYjJlVjNPL3JIenhJdXdjUWFKUlRLVE83U3Y1N3Fq?=
 =?utf-8?B?TmdUTDNvYjJ4QnVuTUJRakEwYzQyd0JhdmNranYyTXdMbG9sRFkwRGdhQWQy?=
 =?utf-8?B?bjBwSUh3ZzQxdHVhbjk0eUprU21tY0h4UEZYa0QvOTJiTlRzaERzL0dpMWVY?=
 =?utf-8?B?Ykk0ZDZnTUp3bWdkZ0I1bnVIeWxQWG83NTBmNTYyZTd0ZmYreFF1dWF6cXdB?=
 =?utf-8?B?MzBkK1BxNDNTVUlaZnQ1UGgxZEY2UUd4Y0J4eFNlN0h5c2JickFsc1NDcE1i?=
 =?utf-8?B?R2NnVlU1Mi9FQzJGaEhYRlMxcE9RR21OL1phTWN0YVNXUTJaY0ZPWklGaVRK?=
 =?utf-8?B?a3B4SVc0Z05FdXVOc2FlM1NjUjFrY0JnSjFxSlp6OXpzOC83amNiam41VXFv?=
 =?utf-8?B?L0l1SVpnTTY3SFV0MTRmSC9yMTEyTXVucjdDODVYTG1hS3hpRDlTV1Q2QWln?=
 =?utf-8?B?WUp5dWl2VmJIN3diOXIxSE5iblNsdnZVYjU3ZWw2WWszSGdiNEhMNkRuQUp3?=
 =?utf-8?B?M2FnSHpDY0tlZzJBRS9sODcrM29vV3BUcVYrWkRsL2Y2Lyt0SndyTlJ0SVNj?=
 =?utf-8?B?NUx2WUNwbmdVakN3YVpzdmR5S1IvSkQxYnFKaXlQRlZmUndvdE05NVdzSjdK?=
 =?utf-8?B?UFVmWHUzWG1YRGNXNWg4SzF3QkZSMFE1bHgwL0MxY1BEcHZJUjdmMGNFSU5O?=
 =?utf-8?B?OFl0WVJxNzdvRnVTM3dkcElCSVZINGQ5RTU2aDFrZWR5TDhVYnpIcGdtV296?=
 =?utf-8?Q?NEQ9HSy/q64/Ab2T0I/T7PcUHRszhPXEvh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 10:51:36.9636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c812f56-8410-43b0-698e-08d8b3c35f33
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 95+f6655pjFXG+ajtg3/su1M5URqSsInu3mMUBPORr9jYUDrIhL+bf7eEuw/jbVnce8vKj1MsK25TRI+LN+cgZxkY66dj2o0zPH3TcYQqWY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4949
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.267, SPF_HELO_PASS=-0.001,
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
Cc: fam@euphon.net, kwolf@redhat.com, berto@igalia.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

07.01.2021 12:58, Richard W.M. Jones wrote:
> On Fri, Dec 04, 2020 at 01:27:13AM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Finally to be safe with calculations, to not calculate different
>> maximums for different nodes (depending on cluster size and
>> request_alignment), let's simply set QEMU_ALIGN_DOWN(INT64_MAX, 2^30)
>> as absolute maximum bytes length for Qemu. Actually, it's not much less
>> than INT64_MAX.
> 
>> +/*
>> + * We want allow aligning requests and disk length up to any 32bit alignment
>> + * and don't afraid of overflow.
>> + * To achieve it, and in the same time use some pretty number as maximum disk
>> + * size, let's define maximum "length" (a limit for any offset/bytes request and
>> + * for disk size) to be the greatest power of 2 less than INT64_MAX.
>> + */
>> +#define BDRV_MAX_ALIGNMENT (1L << 30)
>> +#define BDRV_MAX_LENGTH (QEMU_ALIGN_DOWN(INT64_MAX, BDRV_MAX_ALIGNMENT))
> 
> This change broke nbdkit tests.
> 
> We test that qemu can handle a qemu NBD export of size 2^63 - 512, the
> largest size that (experimentally) we found qemu could safely handle.
> eg:
> 
>    https://github.com/libguestfs/nbdkit/blob/master/tests/test-memory-largest-for-qemu.sh
> 
> Before this commit:
> 
>    $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
>    image: nbd://localhost:10809
>    file format: raw
>    virtual size: 8 EiB (9223372036854775296 bytes)
>    disk size: unavailable
> 
> After this commit:
> 
>    $ nbdkit memory $(( 2**63 - 512 )) --run './qemu-img info "$uri"'
>    qemu-img: Could not open 'nbd://localhost:10809': Could not refresh total sector count: File too large
> 
> Can I confirm that this limit is now the new official one and we
> should adjust nbdkit tests?  Or was this change unintentional given
> that qemu seemed happy to handle 2^63 - 512 disks before?
> 
> Note that nbdkit & libnbd support up to 2^63 - 1 bytes (we are not
> limited to whole sectors).  Also the Linux kernel will let you create
> a /dev/nbdX device of size 2^63 - 1.
> 

Hi Rich! The change is intentional.

I think the benefit of having clean limit, allowing us to align up bytes to some alignment (which is a common operation) exceeds the loss of 1G at the end of 2**63 range. We get simpler and safer code. And anyway, new limit is not much worse than 2**63. If at some point we have a problem with it being too restrictive, it's than very likely that 2**63 would be too small as well, which will require so much work that our a bit more restrictive limit is unlikely to increase the difficulty.


-- 
Best regards,
Vladimir

