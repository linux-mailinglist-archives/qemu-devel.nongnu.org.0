Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43FD470816
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 19:07:01 +0100 (CET)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvkIO-0005m1-JF
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 13:07:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvkGu-0004wb-Hi; Fri, 10 Dec 2021 13:05:28 -0500
Received: from mail-vi1eur05on2106.outbound.protection.outlook.com
 ([40.107.21.106]:22211 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mvkGr-0000w3-Ke; Fri, 10 Dec 2021 13:05:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyWmiQXN+qAe3uOhdrNFgZ79LaS6OJ870FCkhAipDwEZXnKr20/crUrOyemtfiaa+Ucgm8PodqrsamSIZ8hYA3ytmCc9Y1/luZq0nWEDx+lEi4g8MRDgPJ9zC42jf4DmmZC4BDY07+Xtv7RMQTRn2tgTPd6oaHchKnhSwqQBLeF+DJ0I3skHC5cQFueghXxJ0qw+oFzB13prTbM4yvElmKkDVzbCthQeSk0Hy433N/RKA5usCtmrtnAwxqq22mS+KJWUQdpj+P3I+TD03er+jVq8D8IHaZ/nYAHR2UHL5IDOc5unNI9kyTpM5eeIzolX/QXNJ5ejpLGgW/GkL2+iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+PtdjNg5XYdR0hWOR+aDTQEmj+cH6X9sz8kC/kW3GM=;
 b=mnsDyRCI4GlzwqJSKzkF73r+qBWxGAnO2IwvpdIlLiB2KCzXbmcjJkZ8IooxwBjme75BEq2a0Cu7WIjrusbwH5WCrDM4XFVNk0dZRj4XHmqSju9+Hw2vBwqUzrYjcW5GYqjeGB0zJaNetTirY1uMo6EIYcEG0Hj4pghr6R5+YztQgyihYuqirVCNOJqU87tD0E20HdLSvFkIqrUxn9gd3udqw9pSN4fCXCByjkot6bzLee/yPhg8uW/HzUYaPW1blw0kDQfS4sWK3ZSv1MV4h95wWGRsOjVzlO+iWmimCvQz/E/OxG1anX+z/1IhyNSTlSbI3ql4cghyNDF5XsC5ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y+PtdjNg5XYdR0hWOR+aDTQEmj+cH6X9sz8kC/kW3GM=;
 b=WzVoggJsBRdjN6CjtinfaB4KmbntZ9h8uHFUSYse82lXfNL3sfo+Vi1KMLo2fwiUs73QptZ5sRhGzUGmq9FvwCZbFJvXJBWYreIVU806UGb7rucQOuZltDAtVq8Dz29NcwZMOCXS+WlASvXE/gi0rCs4zBK17icXCmITUdciFq8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB3812.eurprd08.prod.outlook.com (2603:10a6:208:fd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Fri, 10 Dec
 2021 18:05:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 10 Dec 2021
 18:05:21 +0000
Message-ID: <8035e971-b668-d4b7-2caf-62601dd46b19@virtuozzo.com>
Date: Fri, 10 Dec 2021 21:05:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] spec: Add NBD_OPT_EXTENDED_HEADERS
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: Eric Blake <eblake@redhat.com>
Cc: nbd@other.debian.org, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 libguestfs@redhat.com, nsoffer@redhat.com
References: <20211203231307.wmtbw7r72tyzkkax@redhat.com>
 <20211203231434.3900824-1-eblake@redhat.com>
 <f05c680a-73c3-b0d2-dbdf-c0bcf1ca3530@virtuozzo.com>
 <20211206230047.q5xc5enodbicf3gw@redhat.com>
 <45f22ac7-a36a-0c40-7198-267a2f46e71a@virtuozzo.com>
In-Reply-To: <45f22ac7-a36a-0c40-7198-267a2f46e71a@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::7) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR3P281CA0071.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 18:05:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8b0f636-e097-40c9-c0bd-08d9bc07a17a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3812:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB38124A3F21FF9CE4904E10C7C1719@AM0PR08MB3812.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K9FFZNxWHTiLW7DSnf496dPD+9CYcTvfXDt2A94AsfAOPVcmfjP2Zt1w6I6U9QKJMm6mM/jYyJdn04BA/xSlbTxZPFWnzJZf3Ucgqhn8NsTn7R5Dmn0YIqv/JkJhPoQa7cl0n++RGwJs+qp/O1eU9310LGjtEbMVjB4q4MhCiYIzryzgZOqBqBAd//p1BLCI9F2Lh5r6od3QYzxzzK6M3h+g3WKzp1IGTzXxJUtMDF8o1WZxkS+WTQmCfDNsDq66b0yQcGAEj9h+dsGc2ThrJXajsmzMlyDHcSCCNkHaxRSpwrBxE+3rCDBn0xdP5uHbYFZxNYe3iP/1C0qGPVTlf9rQ4gmFP/SH+gxZDgJTvn9GP0ZzrPgqynQiY3zjUttEhzkziw5ZHJ2tRoyAWNMgTd5p6J2a0EcsG4F1NrsgLr55Gln9Qncz5xE5f5MD+owDCQHlWiR+asK6A+nPaTxtwi/KL6wnr8vxF6JpprNUIi3fFwGooUI+/waDPoZ8ULDVpyshc5B1Mlkpun/gi/qyvFHwjxEGWlkb9WbPAdP9u+g3pbuW25EjlFyhPzYZ6SeWMh4fQkOmR8xOucuRZrD5xpk/gWjy+UxPoLHk3jmjXQsAFApG1FQFQpnVN+WkOtpa1GyoJjOyUHi25IjuXS29sOUishXK6znKJHm2AMtmNkMqpNCTCIHbmJjQHIaxtHkjdcWj0En6LeCHUesg2yMzib15RptzYQRFfT0v71OXx+0KEWtoNDzRNMUBfW+t1PTGxkKM+Lw9VqbvF8r1FASBMQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(508600001)(6916009)(52116002)(956004)(36756003)(5660300002)(2906002)(86362001)(4326008)(8676002)(16576012)(66946007)(8936002)(316002)(186003)(26005)(83380400001)(38100700002)(38350700002)(6486002)(31696002)(31686004)(66476007)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzVRWTVaM3lNekl1OUErTU52SkdmcURtNVVvVkRBcHE3YjFYWi9kcmhlek01?=
 =?utf-8?B?a05rc0RGOVRUamQ0ZDJ6UFBXTHgwNU5LQkRPSmh6WGJpZHEva2NaQlFObVdw?=
 =?utf-8?B?cXpzMlBZQWZ2M29UMHdnQVJxTXZpd3BKWjRiQ1Nra3dwdnFsMEZOVDZZTi9D?=
 =?utf-8?B?aENuVHB6cURxK3dnVU1iVVNQY0tHdUozMDFzd1pxY0FDYnFSWDZGL2krWnE1?=
 =?utf-8?B?SkE2c2pPb3hwNjFvQzZ2MWNHNzV3OGtxREI2dkxuM0orUDV6V3RRbjQwTDkx?=
 =?utf-8?B?RWFCMmt3VTl0Rnl0K1BDR2NraS9hNzUxNG9jeHB5NzV4YVZWYXY0M3IrSllG?=
 =?utf-8?B?eWJqM2lEZ2s5ak8weHg5VUxQcFJiNkFjem1FZXFENEE5dVN5OGtpY0lzMGhK?=
 =?utf-8?B?Y3lXb0JBMXVYcjlEZHdyM0NsOTNvRFp3a1NuTHZ4ZTNTeFBaVUU5eDBTSEM1?=
 =?utf-8?B?R1pzTzAwOW04a1I2RjFvajY0N3JsRFhlWjcwdHBicEJ5NVVPUGlZL3hNanJC?=
 =?utf-8?B?K3VxaDFhR2xPd09jbkRvb295b01iUVJxRm5WM0kxRVdJOSt4ekpXVEhROUtV?=
 =?utf-8?B?eTczUnk5MUxReXpZajJXNmtXUlRjcVIyeWxITGpHa1lWWUtqeWdIazdHbEVz?=
 =?utf-8?B?emJLa3R3M1ZSVXNxeG9lTVJNbkxiSWtJdGRkQ2t0L1pTak1jcjJnV3JVK3dL?=
 =?utf-8?B?N21XNjNkUVhUWGdLZCtEdzBqY3dKV1N4SEozdmx4SEszMWtyVitzTWM4dHhR?=
 =?utf-8?B?eDJpSHk2cFJLU1FXUzE0dk55SHlUZGpzOFZRcmF4M0NRQTRlZ0pEWEdyTWpq?=
 =?utf-8?B?TFRub3k1T1ZKc3dGUVRTNDZFaXFvS3Vua0x2U3B5M0c4dEtyRktpM1YwYmkv?=
 =?utf-8?B?bFlyZVcvQ3A5bkpEQy9nekV3aExDWmFpZ1hUdW1uMWNTSXkvMko4VnBxMVE1?=
 =?utf-8?B?cjJZL1M0RDAxalF0bnVxbUZhQkhsVkFkcGdscnYyV2U5UVArSHlDaTRjRVdQ?=
 =?utf-8?B?WGQ3NnNLODdrdFR4ZXN0SFI1QUpkRjduS0laUkl4S1g1L0UzcDJvd3J0OHIv?=
 =?utf-8?B?SWE3Q2dlY2d4ZG1JUVdONGhhejk0bE1OVTFSR0NMY0dqNWFBVExPcUtxaFBZ?=
 =?utf-8?B?VzkyRHE5WENGQkJvZDNNbm9Uc2RHTlZaRjJoc0RzOFd4ZGZBWnVNUjVSZHVs?=
 =?utf-8?B?Rkg5YTY0V1BobGY2OVBvZmMxUEIyV1loYVpaZ3R4NitOeHBZKzIwUzFmQm1P?=
 =?utf-8?B?anF5cmI3TzU5QmtPMG80cXZwVnFyRXl6Z0dRWThrVml2eHZQZC9NUFMwanhB?=
 =?utf-8?B?UHVjYjFSdFZnOGxuVkdWbDI2cXRJQlZqeCs2WXpKVnJUSTdoNCtHTFFSZ09U?=
 =?utf-8?B?T2pzWVdrNWFmZU9Oa3U1a3V2YnB6K09RQ3d3anU2QStLQzJzT1orbU5uL2lh?=
 =?utf-8?B?VjFFTVJjSERSVktLeGdhUFJrM2Q3bU9TT1JkTlE3eGprU0poY1hnWk5kUWEw?=
 =?utf-8?B?OEVRSFFTNWxlTGorNXBWV3J0TUZWVWdkV1Q0WGh1WGZOQWFkcHowTnVLVFhJ?=
 =?utf-8?B?YVRMQW1yTUsxcUJrclhEWEJaUEE0d3hMcTZOOHNWNzFYUkNLSlR5enFUaU5D?=
 =?utf-8?B?eW9GSkxUMFM5cmJHcTNyWXUxS1krY3JKZTlzcWlhZGxPdGU5eGtaalFHZmt5?=
 =?utf-8?B?c1lJUUJaajVHaG0yekVjd3NpUGlOR092YjZDU2VpYytRYVVJdUQrb1hUWlYv?=
 =?utf-8?B?bGJxNUVDSU8wVDIvMzZkeGZoM3N5UnhURmZ4eVk3VmxRVnJxbk5ka1RGdFlN?=
 =?utf-8?B?Wk90WGpRc1gzdmViRlZPYzc4dWhSVFMzQ3ZTbkhYNG80Nlpaa1ZCYkRRc0o4?=
 =?utf-8?B?QlVicDEzOGY3QkZxcWRmVkg0RzBIU1htNUIrNitjdHVLZ2t2bHJoUFFCV3R2?=
 =?utf-8?B?QXhzdHA4UDB0SW0yZmVwenRUeWNya2w0SFF2TFhHQnp1N05hODhpaVdrUjI3?=
 =?utf-8?B?OW9TWWU0N0hrU0dDUVNLU0UwR2REOTJYbzZRbmNsRUpJK1pvbDkyMll0c1Jy?=
 =?utf-8?B?bEhXTDIxN2k5dzZNVmI3VlBrQ0NuengyZjBzZVlXOXdISUx5N1lkUEFyUU1O?=
 =?utf-8?B?dGVNWGQ3dUQ3N2N1aTJWSkdPdkdWWnFWamUxMXloZ2hIN2VCVTEwMG5MeG5G?=
 =?utf-8?B?emtsRmJuZjNGOGcwRzk0OE8zcGlCeWJYYzdScjRZa290MFRETFlLOHRnRjcz?=
 =?utf-8?B?OE13Mi9DenNDSmJEVEdWdXM5MnR3PT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8b0f636-e097-40c9-c0bd-08d9bc07a17a
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 18:05:21.2841 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hvZIA5Pyn3pTSPs1SJJQi2liWfrowOp4W01VwZD8pMgaGbzQuzPu5VQTTASH4ausA/rmqSpd2viwLU5SorGUjrfAegperOFo+ONRJgAyrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3812
Received-SPF: pass client-ip=40.107.21.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.317, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

07.12.2021 12:08, Vladimir Sementsov-Ogievskiy wrote:
> 07.12.2021 02:00, Eric Blake wrote:
>> On Mon, Dec 06, 2021 at 02:40:45PM +0300, Vladimir Sementsov-Ogievskiy wrote:

[..]

>>>
>>>> +S: 64 bits, padding (MUST be zero)
>>>
>>> Hmm. Extra 8 bytes to be power-of-2. Does 32 bytes really perform better than 24 bytes?
>>
>> Consider:
>> struct header[100];
>>
>> if sizeof(header[0]) is a power of 2 <= the cache line size (and the
>> compiler prefers to start arrays aligned to the cache line) then we
>> are guaranteed that all array members each reside in a single cache
>> line.  But if it is not a power of 2, some of the array members
>> straddle two cache lines.
>>
>> Will there be code that wants to create an array of headers?  Perhaps
>> so, because that is a logical way (along with scatter/gather to
>> combine the header with variable-sized payloads) of tracking the
>> headers for multiple commands issued in parallel.
>>
>> Do I have actual performance numbers?  No. But there's plenty of
>> google hits for why sizing structs to a power of 2 is a good idea.

I have a thought:

If client stores headers in separate, nothing prevents make this padding in RAM. So you can define header struct with padding. But what a reason to make the padding in the stream? You can have and array of good-aligned structures, but fill only part of header structure reading from the socket. Note, that you can read only one header in one read() call anyway, as you have to analyze, does it have payload or not.

So, if we want to improve performance by padding the structures in RAM, it's not a reason for padding them in the wire, keeping in mind that we can't read more then one structure at once.


-- 
Best regards,
Vladimir

