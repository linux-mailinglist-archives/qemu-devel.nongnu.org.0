Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E422E084C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 10:51:47 +0100 (CET)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kreKX-0004ng-K3
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 04:51:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kreJX-0004HF-NA
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:50:44 -0500
Received: from mail-eopbgr130122.outbound.protection.outlook.com
 ([40.107.13.122]:63203 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kreJU-0003iu-DN
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 04:50:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABczqGxd1BuTrWcVExtbohYb39h4xymXjzCzf4hXV075jsZTavAonGlVlTfZ9+qmWmKBu+Xvx+i+cnGLhD99lxlj/1vqbNDvTU0QRXYmKONX4F3DMnb0CR++T0HDbZbWpHWJyTCl9m91esNc51dmyZS39P++77PmcxOD4xo2KTsOrzVFHXgnpZrh6mCWtw0hNnIWDMiWhQTadrlYYmpwPYgrPRarQqECj8jyGKe9HrAFLjJmKnjSzA17AmqjzGZjMDSyTE2Ktv3r/Nse6mC5ImpRwm33P4J4pf6IKtuahyfYhLs5byOdRHTZ0v9YbQBX2yJDe6gX/rYWf2YAW5stzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bumm+R4JAlfPRGvEDhFo+5WYgMJcMInocqEPXnVCQs=;
 b=TZAvRbV71RIzYZ/C8DghZHYjrgCL6vwTr0oP4JmoauvYcKqiQGOhxTsqQNMoROI8LJ3pLRrIENG4uub9EVBP9lZy3wzxsYSXspuPN8sFbCFHv988ThLSF+IlZNz1Y/23Kau6LIXHmxv26WtMRzGRvrBjZcThj/7Mld9F3AtiQ/7ibREe3Krmt/8T4xZwgcXm3BTJNUUtE1dts+VQiYbuqKLDD1ugBvYcT1dxnYfg/uooWdPGqjFRwN/6dwS4l/ggfpgwBCFIYp1ceoNXBJP7zFQoJn8MfivdkS0jFlikiC6EsbvLIJm9f2x7BjB78IuteNKwqI4OfKCfOEqAuCKs+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Bumm+R4JAlfPRGvEDhFo+5WYgMJcMInocqEPXnVCQs=;
 b=Ch2mM2d03zp6gll8toieNgJp8Oh+H98J4U0oAwQMhJRPaxehNGjs9hg3XwZcooSxrRUexp40YHqNNRMOrfWBBvYuJpRmAnAGrylRJ3xi5qzjy/yl2i5BVGPYu9JNyWBOkKO9iL9ph7M6xR7baRaaumOQ7+yftoOR4x85tJ9TgkM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6280.eurprd08.prod.outlook.com (2603:10a6:20b:29b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Tue, 22 Dec
 2020 09:50:34 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3676.033; Tue, 22 Dec 2020
 09:50:34 +0000
Subject: Re: [PATCH 3/5] net/tap: tap_set_sndbuf(): return status
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201221190609.93768-1-vsementsov@virtuozzo.com>
 <20201221190609.93768-4-vsementsov@virtuozzo.com>
 <30577d97-bd0b-5f07-643b-ffa8e966dee9@amsat.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <4fadc0a7-ccbe-869d-483e-371350da98c0@virtuozzo.com>
Date: Tue, 22 Dec 2020 12:50:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
In-Reply-To: <30577d97-bd0b-5f07-643b-ffa8e966dee9@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0302CA0021.eurprd03.prod.outlook.com
 (2603:10a6:205:2::34) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.92) by
 AM4PR0302CA0021.eurprd03.prod.outlook.com (2603:10a6:205:2::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.29 via Frontend
 Transport; Tue, 22 Dec 2020 09:50:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c49f442-ac06-4e27-6938-08d8a65f0760
X-MS-TrafficTypeDiagnostic: AS8PR08MB6280:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB628056EE33F1E2FFE40B3B16C1DF0@AS8PR08MB6280.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:370;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: onGhWDM15dP8Ut5AvnfuMH9tbpuSNClSVqUgXIuC7M5y0L4rZkz9ujHbDg7oaDdQnobPHmx5CtkGzojV9jXZCV2aBjLRhc4LFf6VSHFHjujyaI+zeoscrXZ+YTAbZXybvN5Mic80dopthq8LNdSH3RZhi9VIo45OTK8Zi2Ixbpgikb3AUM0Hq30SNDKGnZbLHqZLVxQAiHruc7sYHJq8RU9w/Z8jAyPJSSJ1p3mLAUBrl66SJD51aUOkkYAU8YrYhBLg7xVK8jouiUCIGV7fqv5W2B7ZKlitW5nCfnCOeHb8JhEWDjS4Zf7j3p99EUhfigN/Dr2haSbsZptl5iqzj1Y8Kr1FriLBqfSkZG/CUO6ec54Af6jQLIlu9D1vP5yD8lS/B9DjPlzB7Fb7QlLi+ssmc+/m7dWZifeuUbj8bKPvd1wiu2nJ64AUHVGXAZKjgD6+IzMP2DXajYBtudyRZd8JFEbNG/HyMQR7hpTeROk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(346002)(39830400003)(136003)(66946007)(478600001)(31686004)(66556008)(4326008)(86362001)(53546011)(36756003)(6486002)(186003)(66476007)(2906002)(8936002)(956004)(2616005)(26005)(31696002)(8676002)(83380400001)(16526019)(316002)(16576012)(52116002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bk5zZVRvR1ZOcGZTZXBVT1dXRXV6cElrN1k5aElYMXlCZmZySitWZW5leVoy?=
 =?utf-8?B?UzJxVnFqRkdnSjlKWjhaelN1VFIyYk1KMFQvbmlkRmRaK3d0bnRrUHVkejEw?=
 =?utf-8?B?aEI1cDhXSTIvb3BuakUwVmxERlV0bml6YWNBYS84ODM4dU5GUUVUQkxQY0U2?=
 =?utf-8?B?VHI1OGdrQjFWSnJQREFEUndVWVZ5NFNBZnY1R2J0TnZhTVZlKzB5a0Fyd0VY?=
 =?utf-8?B?SDA2eWZuRGZtYmw3M0UveTd2eCtvRExtUVowejJXS0FvcURId0tjTVk4L3pt?=
 =?utf-8?B?REFTZUh4Y0hneVEwWXIxMERHaVlPZVBNVkJlTkZXcllBQUVHY1kzeVpiak56?=
 =?utf-8?B?aUpBMTZWRjFXN0pGcm9CdFRTLzdMa1VTbnNNSTdwWVRvdWNkZWJpLzF5WU0r?=
 =?utf-8?B?V3dvZlJOV0x5NTJ0cVlWYk9oU0RRb0VPNXNTU28rZWh4T1Z0dGdsTTZ2cXQ1?=
 =?utf-8?B?Umk1T1Q2QmVEc0lBQXJUT2NEcE9wQWRiMXNZL0JZVHdoSHJuWDh4emNTR2lF?=
 =?utf-8?B?OG5OaThyNTBRRk9BRGNMa1ZXa3c5NkhCM3V3bTdXQWxJL3pTMDRCYVA4SndB?=
 =?utf-8?B?WjM3TEhZVWROaDRHcDFrOGJnWklBMkRVbW4vM202emp4VmN6TTZBdnVuVTVn?=
 =?utf-8?B?ZUs2WGM3UG5OMjRsMkR6eW1XMkFuTlZBSU1hTWEzKzIwRklpbjVtS3N5a0kz?=
 =?utf-8?B?V0Q2QUNHMGdKRjQyNXpObmxCWk9saTRpMFRUdm1PZzd0Wms2VkJKczdmajdu?=
 =?utf-8?B?ZGFJcmtpb1MwdGpHSTBWU1prTW1iTTZ5eUlwZmFyQmZjUG9UbjVHUkQ1U3RU?=
 =?utf-8?B?elhvU2tHQjA3N1ZzTkNvdnQ5ZzdHdStnNWFQNWttNExhaXNkelRvcHB2WDQ5?=
 =?utf-8?B?YmhNL2NrT2orQlRUQldYUSt5NE5NcEJoUWZuTjlYOW5VcUVWZ09UTEJCOXpQ?=
 =?utf-8?B?K052U3JlUG9TUmtaWVdkZklmWDdVbFJPcnUzOWcva3B2OUN0eDhxMjUxVGE3?=
 =?utf-8?B?K25BUVNZQXFnSEY5ekwxTDZkYThmWDF1VXRZSWE5VEo4NUdNMEQrOTRUcHNq?=
 =?utf-8?B?d0t4SmxjOTI2aVQvV2tvU1h4eUNXWDRjNXZCWm4xNlR1MEVjc1FGVzRWWTB4?=
 =?utf-8?B?dHJ5eUhkNVVwUXBWeHhtdDFxcTQyYjhINFF3THM3bmpCM0ltejlTTGpyd3k2?=
 =?utf-8?B?WjJVYUsyaWQxQUlqZWVlOC8xZUFxa0lFSFVmTWMydU5XRDJvMHpXcVpIMjRq?=
 =?utf-8?B?aTZJUDZnZ3l4OHE0ZjdsYzlpT0xkTHhtS3ZiMlNWYll5Mmg5UWgxVHU0T3l5?=
 =?utf-8?Q?9zJb4rqEEj5kx0vtSmCpvIrCb/RjJSl9xK?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2020 09:50:34.8011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c49f442-ac06-4e27-6938-08d8a65f0760
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R0eaOQ/CM2zpNAgXcDBvLJcr9dgFdaQxJ+PRZPCRcI02/i0UpQQonZa4UYzuAyvjxUW88ZaoWdj4G6Lxh/8UUDMvlIuLmAzpYxSj8MMA3e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6280
Received-SPF: pass client-ip=40.107.13.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.233, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: den@openvz.org, jasowang@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

21.12.2020 23:12, Philippe Mathieu-Daudé wrote:
> On 12/21/20 8:06 PM, Vladimir Sementsov-Ogievskiy wrote:
>> It's recommended to return a value indicating success / failure for
>> functions with errp parameter (see include/qapi/error.h). Let's update
>> tap_set_sndbuf().
> 
> For simple "success/failure" a bool type is enough.
> 
> Preferably using bool type:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

0/-1 return status is highly used in net/tap, so I decided to follow it.

> 
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   net/tap_int.h   | 2 +-
>>   net/tap-linux.c | 5 ++++-
>>   net/tap-stub.c  | 2 +-
>>   net/tap.c       | 6 +++---
>>   4 files changed, 9 insertions(+), 6 deletions(-)
>>
>> diff --git a/net/tap_int.h b/net/tap_int.h
>> index 225a49ea48..57567b9f24 100644
>> --- a/net/tap_int.h
>> +++ b/net/tap_int.h
>> @@ -33,7 +33,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>>   
>>   ssize_t tap_read_packet(int tapfd, uint8_t *buf, int maxlen);
>>   
>> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
>> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp);
>>   int tap_probe_vnet_hdr(int fd, Error **errp);
>>   int tap_probe_vnet_hdr_len(int fd, int len);
>>   int tap_probe_has_ufo(int fd);
>> diff --git a/net/tap-linux.c b/net/tap-linux.c
>> index b0635e9e32..c51bcdc2a3 100644
>> --- a/net/tap-linux.c
>> +++ b/net/tap-linux.c
>> @@ -130,7 +130,7 @@ int tap_open(char *ifname, int ifname_size, int *vnet_hdr,
>>    */
>>   #define TAP_DEFAULT_SNDBUF 0
>>   
>> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>>   {
>>       int sndbuf;
>>   
>> @@ -144,7 +144,10 @@ void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>>   
>>       if (ioctl(fd, TUNSETSNDBUF, &sndbuf) == -1 && tap->has_sndbuf) {
>>           error_setg_errno(errp, errno, "TUNSETSNDBUF ioctl failed");
>> +        return -1;
>>       }
>> +
>> +    return 0;
>>   }
>>   
>>   int tap_probe_vnet_hdr(int fd, Error **errp)
>> diff --git a/net/tap-stub.c b/net/tap-stub.c
>> index 6fa130758b..473d5e4afe 100644
>> --- a/net/tap-stub.c
>> +++ b/net/tap-stub.c
>> @@ -26,7 +26,7 @@
>>   #include "qapi/error.h"
>>   #include "tap_int.h"
>>   
>> -void tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>> +int tap_set_sndbuf(int fd, const NetdevTapOptions *tap, Error **errp)
>>   {
>>   }
>>   
>> diff --git a/net/tap.c b/net/tap.c
>> index 75b01d54ee..33d749c7b6 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -661,10 +661,10 @@ static void net_init_tap_one(const NetdevTapOptions *tap, NetClientState *peer,
>>       Error *err = NULL;
>>       TAPState *s = net_tap_fd_init(peer, model, name, fd, vnet_hdr);
>>       int vhostfd;
>> +    int ret;
>>   
>> -    tap_set_sndbuf(s->fd, tap, &err);
>> -    if (err) {
>> -        error_propagate(errp, err);
>> +    ret = tap_set_sndbuf(s->fd, tap, errp);
>> +    if (ret < 0) {
>>           return;
>>       }
>>   
>>
> 


-- 
Best regards,
Vladimir

