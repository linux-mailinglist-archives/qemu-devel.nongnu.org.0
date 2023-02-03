Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5030B68976A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:00:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNtm9-0002z3-UA; Fri, 03 Feb 2023 05:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNtm7-0002yG-Cn; Fri, 03 Feb 2023 05:58:35 -0500
Received: from mail-vi1eur04on071d.outbound.protection.outlook.com
 ([2a01:111:f400:fe0e::71d]
 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.zhadchenko@virtuozzo.com>)
 id 1pNtlx-0004rq-My; Fri, 03 Feb 2023 05:58:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvR9VLthEQGxgn0kaEWsYSm4J1YGXaE+y/1chguTXI7pVh3dNmK7MsJCNQcQHhFZvGtVNzN+MoJerrO4KXd7JHWRXG7w/l+2v2Xw0Q3OwiKWLV4/WUa+RW1mWT1GxIBXRtI/YpppK5I5ZzNqdST//oBwUjY2zXACHjxZLacAuq4Oak99za1JS6V0sl4PzIUrm8WV0jfzdHzzXJIqIk1ybOT1p9w8UF4pcHDX3OCLxYNMgpYnZYi3VmMUC7xge3XByTPILgc6B0z6rXsvwkIXBbu8efI6fx7ZesbRipNRfrsPUxTHmLmQcZ3NgmE6WdAUG229jRVjtAFzCqaSCJcSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xH1K/73t04UcDdSVwK1ntiKL6aqvedKEMgVPesTVWrk=;
 b=Zr1+DS39u8ppiRQwHvyczq+PEVxaLCwTAu56mFCTybu37ClAoVPDzu85KQCVkWZNHFX5wuxJEwRc4JmLZeKCkrqY4Si+m5V0UrUidBPft0SJQQ3lPI2pzRS2cYJvj4NLowmIvLTxzhZkXNKaWI9qinME/p0PZwt2s6Dyf8LWQjIcGlARQH56OHll8bz102v3Cl/Eoo/oUdmO2Ig5MH+VVZoYVIv8ReQl0EwvDFy9Jlj5hFEDBDyRILn3mHpbSmPn9vtj5J8ixMq4+d9dowKVITDuL3To+L5wNfYY+yXyrIAP6bD2ByivOf2ChH/FWJtYnM1/vsTJIFRDydLdnxZ2Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xH1K/73t04UcDdSVwK1ntiKL6aqvedKEMgVPesTVWrk=;
 b=AsNkyN3hci6MjFmhPhqsKGyIQn/LbwjvRaliBMoUa0H6CHMGLi+Ygdzmzeo77VKcvj/+osGZOJwr/QJFYlBQ1NdOLZYKG0VDgLWill/j2L3CSAcpeGLbZSEo9zjgYgXGQRmRnffrWApj9/3vStJNX1vjQIo6eQnAvZC5Zu01H4KTtwtfvEuSJC5ZiRSY1qJs29zkQVrBc4U7RFbPr1+xbj7Ydnf4Fo0bAzUef0zicFJ3gFZQb8f7e2uza4Us/CcxfxP0NrMmSbQv7RhDl3lqOY9Aveu66j28BTvo8wU3vMBYm5WfUB/DU3+Z1kQJ2Z+q1u0EdAepl3GFgOLBsOhxtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com (2603:10a6:20b:1d4::16)
 by PAXPR08MB7441.eurprd08.prod.outlook.com (2603:10a6:102:2b9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25; Fri, 3 Feb
 2023 10:55:25 +0000
Received: from AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::d216:1e62:dc40:6ff1]) by AM8PR08MB5732.eurprd08.prod.outlook.com
 ([fe80::d216:1e62:dc40:6ff1%3]) with mapi id 15.20.6064.031; Fri, 3 Feb 2023
 10:55:24 +0000
Message-ID: <b03aa8ad-c917-b43f-443e-1fe7ee959b23@virtuozzo.com>
Date: Fri, 3 Feb 2023 13:55:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH] hbitmap: fix hbitmap_status() return value for first
 dirty bit case
To: Eric Blake <eblake@redhat.com>
Cc: vsementsov@yandex-team.ru, hreitz@redhat.com, jsnow@redhat.com,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20230202181523.423131-1-andrey.zhadchenko@virtuozzo.com>
 <20230202193944.63qcqpvklyoslode@redhat.com>
Content-Language: en-US
From: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
In-Reply-To: <20230202193944.63qcqpvklyoslode@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To AM8PR08MB5732.eurprd08.prod.outlook.com
 (2603:10a6:20b:1d4::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR08MB5732:EE_|PAXPR08MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ae4fd2-ba4d-4663-a0b1-08db05d52728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3FYHHwmKC1ShXe7XSejUovxV3K3TRw6wREvHjgfOU8EOE+PtPCS2iEAKxMsZgQfw9haAEQLW8h2vkbHCwRbASj+rUN5iX4vzsGA4jCN0lhlTmzBaiBeH20qcxcmYNvYNl4SO1UwOYMX2JlYOuTcnb8Jzv8TlMgQF3M3mGCznYhLLWGfWYyW3tXwcXBv1b+4WS162DuV2KeEm7Dj4TcIaNlaEa93J22jBQK5J7PXF6ykdfH26n2MhobRGPn2lIapIYg+DtMjLPzI+Kgg9Pk8Kb6bUn/9xVKToy/OQJI2rmHBe045rJ0rdOJN/JzLHFXZlTwLtgp05yJNTHQ6t1EvIqEottHyDJdz/Z4dyG0q2nkBkzX8XOEgXitjOxT8gk3iNG/GLaGvFYHHq0Mr7XJLc6wY/yuOjcXxvsN9rQGIU4WV0ogw3fyiPcRl4d5m74USMaFPZ6rNqn0JdNeiYpW9Qvt+J1jg6xM7hkCKr2royOxL1v6Rz7lVjDqQIRHcaYCD5A0zj3dRI8K1cYTj/0HgFW9QCX6DuN4F0dTEh6C0awY3U+Aixx4/3uZbo0ZWrZr+V1/MVcNzpRa8bSS32XOCSJS21Glk3RZDcG2QJtiqBMgtXJdHVVcRPsukxuq+OZx7qqpNxYrCHeWiAilY0EUHUT3yAPjZ/DcPWWjlS75u6t8LkMvsjSV9H3GT4C9ImCD4MgEeipNoV/xmK6DBmBkoIvQaeQOVPq5Obgj4n6T36Hryd+aFjhPQ9WmSVXq0XAxFE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM8PR08MB5732.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(376002)(346002)(136003)(39850400004)(396003)(451199018)(31686004)(2906002)(4326008)(86362001)(36756003)(5660300002)(478600001)(44832011)(6486002)(53546011)(6512007)(26005)(186003)(6666004)(66476007)(2616005)(31696002)(41300700001)(8936002)(6506007)(316002)(38100700002)(8676002)(6916009)(83380400001)(66556008)(66946007)(14143004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEU3TTU0a2F6QkY1QlRGOXVEdzBablRvYVNsb0dOejYyQVVCMU0weHcvc0Vk?=
 =?utf-8?B?NGJBYXRQL0sreVhKMGFnSkhHaTlna0xROTYvbjZsb081L3NVeUg5QVNIUkxW?=
 =?utf-8?B?UXVyd3l4bC9weHVuZmhxa2tIUGR5UXVFMDg1TC85a1ZuaTJOTnY1cUovaURP?=
 =?utf-8?B?RmNUNURhUGhHUEx3YURTR1lnakRlZmJ3a0txcVBWTFF6NHRESFlyWXVSSGZY?=
 =?utf-8?B?Rjk0dVA0dU9Kek9FMDQ0L0R0a1dMY1JXMTU4eHRsdGlZK3dGTUs4T2ZVOXkz?=
 =?utf-8?B?MUNZYWR2ZnhXa1ZodllleVV0eGN1VmM4Zm82NlFVay94NWJGa2JXNWZmcEdw?=
 =?utf-8?B?a2dhdEpCVysvaERjQzNpUWdGZDAyUURKblFoN3hxWUQxOVQvclJnbmIweDlq?=
 =?utf-8?B?c3pUSjlGZ293cVZtRDVYWndiOFNyVkk2blQ3SUV0OW44d3dPWjBMSzBNT0Fm?=
 =?utf-8?B?V25wRW5BSEU0RXorbG11TWdIcVNXWEMrbkdDZkVSMklFWCtTQmUrMERTS1pC?=
 =?utf-8?B?bVhrc2F0S2drd05YdDg1VnhBczlRS2pIc3lJMUdDbGpIZXJXSm1pdGQwVWUy?=
 =?utf-8?B?M2ZuYVAxczVheHRJNmN1WWVSVjJLRFE3K2JkNjJxR0d1TDArMUIvWWdvMUM5?=
 =?utf-8?B?VDRzdXdybmlGWk51cnJxVE1pMWFVV2ZMbFphTVVGTGtYVkNnTmtCYjFHM3Zk?=
 =?utf-8?B?U29qd2RxL2R3b2s0TzZkdG5JQW1qYTNiY2h3Wit0N2hhL0g2TWVNSTdObkhq?=
 =?utf-8?B?c3RPN1d0bHZPb2xOT3R4MzJHVExiNDQvYno2Uk4yeVBQUWVGTmFSdGUxQnN0?=
 =?utf-8?B?UCtZYUNJN0Vwc09ET0lqT1JJb3o4RzFDdGdacXo4YThydElZaEVid0ErSHBG?=
 =?utf-8?B?YXMzdUJtQlpuWTZzZk5yMGd6Qk1GMklqQ3dIaXF0YWRNVmxDcUN3OWFHRVNC?=
 =?utf-8?B?Y01CTmZFazFrRDU3OHkyYi9wbmNWRGhCTmIzQ2VzZFM1VDF3V3RlU2pzczR2?=
 =?utf-8?B?SnNQcS9FdjQwVEZrR2RLWjYvV1RMTE1sU0RzeDZacHQzR3lQVHhHTjh4SURs?=
 =?utf-8?B?K0IxQnJOV0I4UDVwZlNzOHFCRG0rdWFqaWxpRkJqMEFRSlhESklEb0cwOW9i?=
 =?utf-8?B?elFaSDg2M0JIZTBwanF5clJldkJOL1ZRSDNRYncxUW5jN21BMTBra09yWjE2?=
 =?utf-8?B?Q1FMcHZwL1RnY0l0bkJWVmI5QmxhTU9SN1pSbWYrQTQ5M2d4bmpORmdRaHNT?=
 =?utf-8?B?SitDTGVqTGlFNDdIemVEaDdhUzgxMXJWT2lmbUlVSFg5STVidEU2ZUd0cS9U?=
 =?utf-8?B?dnluVHg4cTZiQjhJNU4ySXhIVmZEVUxvTG1TL2ZXYXBkamJGVlIxdEtXZXNE?=
 =?utf-8?B?Zkl5Z0U5U2tqeG9oSDYxbmpkSkhJY0ZtWHJGdXhJRWdUNTF2RWFDc0g2c1NZ?=
 =?utf-8?B?bUV1Y2RvYnh3RHZSVlo3eEk4ZDVlOEFETmh2eVNkbm1NYTlJRGlscWNseXY5?=
 =?utf-8?B?VTY0c0w4UE9FVitYR0VjdWRFOW5kRlc3RlNzOGs3c2JFbG1uckdVYnE5T1Nk?=
 =?utf-8?B?SHQ1dUNvTkJkVHo2Vk51QXdDQkc1YjZmZ3ZiYlZ1Vi9PRjJNWmhyUWFTTTVY?=
 =?utf-8?B?T2xyRVJOTzZ5d2hFWEp1VU9QeWdGdHhJU3J3UFQ2WFBtWFVsc3laSmFqYUw5?=
 =?utf-8?B?VnhSYmxBbGZ4LzNEeENSQnJYMEdXcjdHTEl4b20xN05DVHB3NTllM292ZCtU?=
 =?utf-8?B?QlNXTU5ieU0yMHdaZnQzc25nbTN6dk5kVkljenB1VDRpcW9ZMWJFWHdHUWpZ?=
 =?utf-8?B?QWhmSTBOYlhxQ0orTkhEdzdXczhma2ZzemZLN3BYbmY1Tlllb0Q3Y1dCeTVv?=
 =?utf-8?B?ZEVCd3JxK3FBMTdFTzFER3hsZmVXdFh0WUs2SHFwMkU0TUdDMVVWSHNyUlA0?=
 =?utf-8?B?OTVQTE5Rd3lGZGlNS2JXejkzQ2NzOWdqbHpPODBBZFdoMUx1R1VoeEEwanRy?=
 =?utf-8?B?dVlZdlBBOUNFbnphUitETUNIcFRGREJFNGFwdy8rblNXS0d0OUhOWElWYnZy?=
 =?utf-8?B?YndzNDRmeGpidmE1OFZQMTh1bm0xQ01IYktyV3NPaEh5VFMraFg3b1RQNTlS?=
 =?utf-8?B?MW03NDZsTTRZekZvUWovM0xSTUxueElzM2ZnOHV0QW94eUhpMjFqY2QyQWFM?=
 =?utf-8?Q?FNkUqSSnP8fXoj7+UU2KOUw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ae4fd2-ba4d-4663-a0b1-08db05d52728
X-MS-Exchange-CrossTenant-AuthSource: AM8PR08MB5732.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 10:55:24.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJgmr6a9bmHkqAk+ju8zGG9HgjOBnoMMtkVsgTXiK87HwN9tU24vZNpVBmybk7Q+N8XuFOza7FAXFxcApa04/W70VIe/w2v4nwYCeD70Sug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7441
Received-SPF: pass client-ip=2a01:111:f400:fe0e::71d;
 envelope-from=andrey.zhadchenko@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2/2/23 22:39, Eric Blake wrote:
> On Thu, Feb 02, 2023 at 09:15:23PM +0300, Andrey Zhadchenko via wrote:
>> The last return statement should return true, as we already evaluated that
>> start == next_dirty
>>
>> Also, fix hbitmap_status() description in header
>>
>> Cc: qemu-stable@nongnu.org
>> Fixes: a6426475a75 ("block/dirty-bitmap: introduce bdrv_dirty_bitmap_status()")
>> Signed-off-by: Andrey Zhadchenko <andrey.zhadchenko@virtuozzo.com>
>> ---
>>   include/qemu/hbitmap.h | 2 +-
>>   util/hbitmap.c         | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> Eww, nasty bug; looks like copy-before-write is the only curernt
> client of this interface.
Also this only happens when copy-before-write is used in conjunction
with snapshot-access (7.0+), so probably not many people is affected.

> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> Is there any way to enhance an iotest to add coverage for this code?
> 
Looks like yes. copy-before-write uses bcs bitmaps, which is 64k.
So changing existing test

diff --git a/tests/qemu-iotests/tests/image-fleecing 
b/tests/qemu-iotests/tests/image-fleecing
index f6e449d071..7eda9a2c6b 100755
--- a/tests/qemu-iotests/tests/image-fleecing
+++ b/tests/qemu-iotests/tests/image-fleecing
@@ -34,23 +34,23 @@ iotests.script_initialize(
      unsupported_imgopts=['compat']
  )

-patterns = [('0x5d', '0',         '64k'),
-            ('0xd5', '1M',        '64k'),
-            ('0xdc', '32M',       '64k'),
-            ('0xcd', '0x3ff0000', '64k')]  # 64M - 64K
+patterns = [('0x5d', '0',         '128k'),
+            ('0xd5', '1M',        '128k'),
+            ('0xdc', '32M',       '128k'),
+            ('0xcd', '0x3fe0000', '128k')]  # 64M - 128K

-overwrite = [('0xab', '0',         '64k'), # Full overwrite
-             ('0xad', '0x00f8000', '64k'), # Partial-left (1M-32K)
-             ('0x1d', '0x2008000', '64k'), # Partial-right (32M+32K)
-             ('0xea', '0x3fe0000', '64k')] # Adjacent-left (64M - 128K)
+overwrite = [('0xab', '0',         '128k'), # Full overwrite
+             ('0xad', '0x00f0000', '128k'), # Partial-left (1M-64K)
+             ('0x1d', '0x2010000', '128k'), # Partial-right (32M+64K)
+             ('0xea', '0x3fc0000', '128k')] # Adjacent-left (64M - 256K)

-zeroes = [('0', '0x00f8000', '32k'), # Left-end of partial-left (1M-32K)
-          ('0', '0x2010000', '32k'), # Right-end of partial-right (32M+64K)
-          ('0', '0x3fe0000', '64k')] # overwrite[3]
+zeroes = [('0', '0x00f0000', '64k'), # Left-end of partial-left (1M-64K)
+          ('0', '0x2020000', '64k'), # Right-end of partial-right 
(32M+128K)
+          ('0', '0x3fc0000', '128k')] # overwrite[3]

-remainder = [('0xd5', '0x108000',  '32k'), # Right-end of partial-left [1]
-             ('0xdc', '32M',       '32k'), # Left-end of partial-right [2]
-             ('0xcd', '0x3ff0000', '64k')] # patterns[3]
+remainder = [('0xd5', '0x110000',  '64k'), # Right-end of partial-left [1]
+             ('0xdc', '32M',       '64k'), # Left-end of partial-right [2]
+             ('0xcd', '0x3fe0000', '128k')] # patterns[3]

  def do_test(vm, use_cbw, use_snapshot_access_filter, base_img_path,
              fleece_img_path, nbd_sock_path=None,


 From 64k chunks to 128k chunks (so at the read moment we have N bit 
dirty and N+1 clean) produces the following for one of NBD test cases:

--- Setting up NBD Export ---

{"return": {}}
{"return": {}}

--- Sanity Check ---

read -P0x5d 0 128k
read -P0xd5 1M 128k
read -P0xdc 32M 128k
read -P0xcd 0x3fe0000 128k
read -P0 0x00f0000 64k
read failed: Invalid argument

read -P0 0x2020000 64k
read failed: Invalid argument

read -P0 0x3fc0000 128k
read failed: Invalid argument


I am not good at qemi-io tool, I guess that EINVAL in that case means 
qemu-io found out that image data does not follow requested pattern?

Also this does not trigger for non-nbd tests since backup job is 
probably copying one cluster at a time.

