Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7257345947
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 09:09:09 +0100 (CET)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOc68-0001E8-H6
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 04:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOc4H-0008Jm-30
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:07:13 -0400
Received: from mail-eopbgr10128.outbound.protection.outlook.com
 ([40.107.1.128]:38276 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lOc4C-00055e-Os
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 04:07:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVgnFZeSNHFJl8UAcoY+tC5STpK7LbnFKqqfp7O57CbSYiDg8i8QiAylH/JWQcOiiACXF7IRUvZREKGtONo+ec16+8PvGZAKfZKxok6IYBQfRK1jhrPcOPRwox3jtRGqUKsTzM+KRMnKrVFw9h73Bm3TFKmoYbwFd+Kbq0CjduI5j6WBOaqy1469HQXV0tB72TTOpGmIziFajSThtQH0AscI2nhINnx6Xse9Cyz0OsN8WxhkqF5jdjkTOLgqWsu3n5OEElu2UW5B55qDNKJJmgCY5R7uQ2ppWjMxJ6w9ArPlAnAcuBZts5FCRbD4JzaZlXQQIhRDFmjp6KID+AtfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJMZ9Te2GGpy8rEJnOz5YlbfEFEOxO5/K6hWiM9uelw=;
 b=OBAswiieMwxcyo1CuUYeFo1p0B5seh34Mi07kuq+0dF/I591N9SYHvI7S4eu0OMsOB4qt8FaJMp/b80sqc2wk11u4FqdDnWGe7WxMdt7Wy3Lk0DIiohK1ZhDQcX7DRoQ5g7nDZ0dVXhtBSr1MIhlL0cMtYAMvI9GXFRn+1RujmLYI6oVySjKXHEYnnVdOyQJhLsyNIlsgqoMT6NMYzK7LRp0u6clVVyb8DTMXvNwgSCa8ly4XIVnshFGTwAYyvB13HD2jrbVSYXVecASCBeGIco7u39O+nayDdKi6zbvEXkO00PQryWFy/hxFUp9j4KYbb2F698RAsz0Wtx53Rt+Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJMZ9Te2GGpy8rEJnOz5YlbfEFEOxO5/K6hWiM9uelw=;
 b=XKOO1N6SIdj83wKVmy8UvQuHfkpg5YKUwJEWWSv5NLJ9uBq1UEnvi/2muzeHiitd9NCPqh64GJsRLWBT+Ex/D01rhqnk5Nh00M6uhoewFGNGktHm43NZ/RIQMDtguL1Ij+fYmIXaMyJXM4noOMkGcZKRn7EoaFol1T8HIYYKSJk=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB2995.eurprd08.prod.outlook.com (2603:10a6:208:5f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.25; Tue, 23 Mar
 2021 07:51:59 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 07:51:59 +0000
Subject: Re: [PATCH v1 1/3] migration: Fix missing qemu_fflush() on buffer
 file in bg_migration_thread
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, Den Lunev <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210319145249.425189-2-andrey.gruzdev@virtuozzo.com>
 <20210322201716.GG16645@xz-x1>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <2fb49f83-e31c-8c93-50b7-833026b06518@virtuozzo.com>
Date: Tue, 23 Mar 2021 10:51:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <20210322201716.GG16645@xz-x1>
Content-Type: multipart/alternative;
 boundary="------------093A0B3D12F52E8622441133"
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR03CA0011.eurprd03.prod.outlook.com
 (2603:10a6:208:14::24) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR03CA0011.eurprd03.prod.outlook.com (2603:10a6:208:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 07:51:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f88fe02-706d-432f-70f1-08d8edd089b5
X-MS-TrafficTypeDiagnostic: AM0PR08MB2995:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB29953096184B3A0AA9DE69CE9F649@AM0PR08MB2995.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5u18QZPM7F+54W7AkadVx6fPl6Hz5qTDq1WseqsZIwTriQ7WqjfDhH3vHspZNixOvApi6cYaeIOTm8+296eFa6nKrikhCD5Q1Rjxm5Nzxc2g/z8nw1KVAq8w/2jwugTc9o/8ON54kG2bay4wqjiWAsrXjbSrovEizVDIF3GMWcJnTIUiXDq8Rbyfi/NGTQDc+lbQgLbDYQtGBB+EBLJMdizoaFajtU49kw+6zIMYzzVYG0fBQqjqUA2jiDr69LwhqKTorvCeWdIeOoXnqRAJY0IfmFrjjSEI31IMcsGABWPiT9s2ztksnO5ITQ/3qPFYAJwRa0DKtPIu0sJqbII4dSDTz+WWr1VTpp2fX+Bmi7DkfP9Fi8BGRsqI7iLTrRR8ttYu/Sqlj0K7/KGFP3+11ChUaVw8Kee7rQCxqKHlbHTyzMroqfA0cSZI7t+7mJ/8dPbcvR4Eqwy38/p+SUGjiuZjakHLa69vh/JVBJq6sQZL06pxHOo1flsDUoBcR4fodiMQidzOQqj+urI/33/fBy54nzIZjsKMhH/gIHk0GdO3kkhmxYe/ba0F7t0Qn8RoMaJTgsF9sDnfOF5jeNqdoKUXpxxCMt7ySMW3ngdMWZZsgwrg17MIFDOXEOtP4dZUCJF0th7VgpTtOj0u6tKbpvVq49R0J39IWI0QGhBjK5QjvR1AfBhGPpdatCjaGd53F6BuiSUbcWdLp7pg45ePOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39840400004)(376002)(366004)(136003)(31686004)(2616005)(956004)(33964004)(44832011)(83380400001)(8676002)(52116002)(66556008)(54906003)(16576012)(186003)(16526019)(26005)(316002)(6486002)(478600001)(66946007)(66476007)(5660300002)(6916009)(86362001)(53546011)(31696002)(4326008)(36756003)(2906002)(38100700001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MnhrallONngyK2g5QlR3cHUxRjhrNlBPR1JZTVIySEswZS9TNC9EOHVsb1Vk?=
 =?utf-8?B?Ykg3YkY4TWV6NTBNV0RiRGQ1VVB6alh5VDhkenhrOEhNRndPRTdTclZRc0Zw?=
 =?utf-8?B?SCtidFk4OG5weldMR0JvTXRldXBoRlBUT3hjTXlEOFI2bjBnS1kxbXJPV3dX?=
 =?utf-8?B?Q2VuZUF0NnBKdys0dWR5SS8rcWptZ3ROQXlvTlpLdWxncTh6WjBMRG8xSlI4?=
 =?utf-8?B?VVBPWWlvZ2FlRmtMc05Qd3llUnZwdms4QjBDdzdLbUxiVkliTWdpb2hTTHZO?=
 =?utf-8?B?N29Da3VhUGxTYUNkU3lEM2diVXkzU1IyU0hIOFh0dTFENnkvVHV4cHFtSEdN?=
 =?utf-8?B?eVp5MTBaZENtazMvTXFvUmUvdTFGTnRGVCswWFIzRjFaU0tTa1BLWGRHZlI3?=
 =?utf-8?B?Z1AzR0tRcTJjaVlkMGsvN0toSXhLQjFURHE1R09vN1V0K3NqZ1AxRkM4akJo?=
 =?utf-8?B?M0hUS2djWjVEakFtOFU0SmdCNlJ3YW1SNk11c2F6NmJMcEZBdHQ3eXRIcTgz?=
 =?utf-8?B?YUdNeVRsV1VMWnk4K25iNkFYZEhEeVZMVTBLSmt2NExhZENyMWpsRlViODZh?=
 =?utf-8?B?djhjenBRdWsyeE5XRTFXb0dlWWlkSlc3RE4vdUpUeVoyZ2YreTNiR0EzZGpY?=
 =?utf-8?B?SEh3STRGZmtHZmRnY2VtM0VvTFNxWHdCNmxCN3V6YkhwZTIxRVhxMVJJV1pR?=
 =?utf-8?B?VHM1MGpvN3VMZ3NQdFlBaVhlUjJUMWx4MStIbUVzSkVRRnUxOG41SFlmOWx3?=
 =?utf-8?B?Nkwyd09FT3E4ZzVaOGlpa1JZZUlHV3IwWHQ0dmQvSjhIMzNmM2ExeFkwSmtr?=
 =?utf-8?B?cmtBL3F3S1FMTG5SS2FrTFQyNXoxSlFwb0VFQ0NXWmJjYXQ4VGdDYU1ReEsz?=
 =?utf-8?B?ZVBUVzVGZm1nakVKYlBzV0Q0Rk9HTXRRaHhZMnhBSmVoM2hmSXhzWjR1R0pQ?=
 =?utf-8?B?RDF3SWx0aThqSVhibU1jeldWKzZ2SU1oaDVnOFViT3JTeThiU0VITU45VkZ5?=
 =?utf-8?B?ZXhab2t1b1B1TFNpeFRRRUwrVDVRY2NydUpFbVZaSlU4YjVUQ0drSUV0SDJq?=
 =?utf-8?B?N3dtQ1lWSnd6eE9MaEZxOTFMWlZwMVZucWE2TTdpakhKWk4xTk8wZEhxVlM4?=
 =?utf-8?B?dVBjV2V6b1dUcE1yR0JhY3J3dVhmcmpmR05FNm9lTVRhZDQxQ0ZkQVY4Q1Ri?=
 =?utf-8?B?dnVralVjWlBIYW9RYWxZcy9rMHRvVm9RQ3BXK0RET3RSWGdqMDBSTFgvcEQ2?=
 =?utf-8?B?M2hEOHl3U2FZWmNnSDB5NkJ2cWh0LzVyalkzQjl0eFYxcTBXUlQrNnFTNllQ?=
 =?utf-8?B?WkI0N2dMTWdlbUhFRW1wNDRZTGp6b1FFZXYwQjNidnZKVDBZUmt4NHRINHlm?=
 =?utf-8?B?eko1dzVoZlI5WGdCVGJITGFZSG9sVGxyZkdyZlNQZUljWkpGb1gvYmZYbElP?=
 =?utf-8?B?WXVGcTdQKytyRjRpclQwcVd0WitUdFhoNE5xdWI0NldncFJUTENRb1Irdkhr?=
 =?utf-8?B?VlhYVnV1SWwxQ0tsd1J3bFFvR0VQQVk2cXFzU1dGeGE2RFpiUDhOdjJIMC9j?=
 =?utf-8?B?aEQ1SnlzTWNhMG5Menc5R2NrTVBMaTZ6MnN5TkhDaWRyeUtYbnBHeVFwRVVG?=
 =?utf-8?B?Z2F4ekdVQXpJL3JWdTk0cjIrTVRaTm9PemVjbEEzRGZGREQ0bVU2ZFZZanlC?=
 =?utf-8?B?RmlhRlZ5RUFaVTBLQ3Vyd0RGNTV4MVlWMkwrSy9GWXZqTktXMGtQWU90eEti?=
 =?utf-8?Q?O2wmSwZ/p2vIRP2/Xea9j6UcHREgANFhUFefW9r?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f88fe02-706d-432f-70f1-08d8edd089b5
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 07:51:59.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hwPdpyiwaIcznF2gat7pAHAh+q4eGnhPLiKmnYcs7bLL4bLsH69mMZMMMGzr2fpo6RZ1uVkwZcBbxhzDZDOTOI268IMQEag6BEmeDOHbQ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB2995
Received-SPF: pass client-ip=40.107.1.128;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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

--------------093A0B3D12F52E8622441133
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22.03.2021 23:17, Peter Xu wrote:
> On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
>> Added missing qemu_fflush() on buffer file holding precopy device state.
>> Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
>> Typical configurations often require >200KB for device state and VMDESC.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   migration/migration.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/migration/migration.c b/migration/migration.c
>> index ca8b97baa5..32b48fe9f5 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
>>        * with vCPUs running and, finally, write stashed non-RAM part of
>>        * the vmstate from the buffer to the migration stream.
>>        */
>> -    s->bioc = qio_channel_buffer_new(128 * 1024);
>> +    s->bioc = qio_channel_buffer_new(512 * 1024);
>>       qio_channel_set_name(QIO_CHANNEL(s->bioc), "vmstate-buffer");
>>       fb = qemu_fopen_channel_output(QIO_CHANNEL(s->bioc));
>>       object_unref(OBJECT(s->bioc));
>> @@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
>>       if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
>>           goto fail;
>>       }
>> +    qemu_fflush(fb);
> What will happen if the vmstates are bigger than 512KB?  Would the extra data
> be dropped?

No, the buffer shall be reallocated and the original content shall be kept.

> In that case, I'm wondering whether we'll need a qemu_file_get_error() after
> the flush to detect it, and whether we need to retry with a bigger buffer size?
>
> Thanks,
>
I think for QIOBufferChannel we don't need that, as I can see from the buffer channel
implementation.


--------------093A0B3D12F52E8622441133
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 22.03.2021 23:17, Peter Xu wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210322201716.GG16645@xz-x1">
      <pre class="moz-quote-pre" wrap="">On Fri, Mar 19, 2021 at 05:52:47PM +0300, Andrey Gruzdev wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Added missing qemu_fflush() on buffer file holding precopy device state.
Increased initial QIOChannelBuffer allocation to 512KB to avoid reallocs.
Typical configurations often require &gt;200KB for device state and VMDESC.

Signed-off-by: Andrey Gruzdev <a class="moz-txt-link-rfc2396E" href="mailto:andrey.gruzdev@virtuozzo.com">&lt;andrey.gruzdev@virtuozzo.com&gt;</a>
---
 migration/migration.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/migration/migration.c b/migration/migration.c
index ca8b97baa5..32b48fe9f5 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3812,7 +3812,7 @@ static void *bg_migration_thread(void *opaque)
      * with vCPUs running and, finally, write stashed non-RAM part of
      * the vmstate from the buffer to the migration stream.
      */
-    s-&gt;bioc = qio_channel_buffer_new(128 * 1024);
+    s-&gt;bioc = qio_channel_buffer_new(512 * 1024);
     qio_channel_set_name(QIO_CHANNEL(s-&gt;bioc), &quot;vmstate-buffer&quot;);
     fb = qemu_fopen_channel_output(QIO_CHANNEL(s-&gt;bioc));
     object_unref(OBJECT(s-&gt;bioc));
@@ -3866,6 +3866,8 @@ static void *bg_migration_thread(void *opaque)
     if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
         goto fail;
     }
+    qemu_fflush(fb);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
What will happen if the vmstates are bigger than 512KB?  Would the extra data
be dropped?
</pre>
    </blockquote>
    <pre>No, the buffer shall be reallocated and the original content shall be kept.</pre>
    <blockquote type="cite" cite="mid:20210322201716.GG16645@xz-x1">
      <pre class="moz-quote-pre" wrap="">
In that case, I'm wondering whether we'll need a qemu_file_get_error() after
the flush to detect it, and whether we need to retry with a bigger buffer size?

Thanks,

</pre>
    </blockquote>
    <pre>I think for QIOBufferChannel we don't need that, as I can see from the buffer channel
implementation.

</pre>
  </body>
</html>

--------------093A0B3D12F52E8622441133--

