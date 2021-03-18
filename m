Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA7C3400C3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 09:21:24 +0100 (CET)
Received: from localhost ([::1]:56812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMnuF-0008RL-0B
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 04:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMnsu-0007pG-Uk; Thu, 18 Mar 2021 04:20:01 -0400
Received: from mail-vi1eur05on2123.outbound.protection.outlook.com
 ([40.107.21.123]:25441 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMnsr-0004XH-Vt; Thu, 18 Mar 2021 04:20:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrhpTWW1Z3M+anfbFrY6/CLfAmIggw9hhrCXSEa4fH+GOImzYAELX38i74yOALLUFF4guWfa44HJLYxUwJ/K/AIB14f1seoCAeL4V+oWVlnSiktnW1pR1tIUTlVY9SmRicCxOrytkYQvFr0CUMbRc69igIChQCemRiOuuWPA/uW7FaqQkNXNlHVGKYl+wpOqzlBhKQw3TEenQqpRDAEgBgpb0v5eYcmAItT0BRj60gS/UEcqoC/GPoEo2aULx0msKSplxntNYnjiYQdqlfu3Li2puEPcPIXh86xDn/dmOAVi4pGdY6AE/xGg6plv+pdc+IXU3KA9uJGcG2E8G3zrFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnQQwuW/BA/bAjnynOF1xkr2PqR07omCdldNfIchjJ4=;
 b=ljFeL3pAfpeIr928eRGRlKZRDCS3lnm7HlvCe5InCGlKD3ECJLySQrYTH8Y4Ai5xgNGRzuHmpGdgj438rer0NQNJaD1vgx+6PuGbB2Ucvu/57zOCjn7Mv261rMgvhjDJGRwmOBLYCrkzB0Lc3TOnvVh0c8Ah5kCd/YCp1j/u1Svr+FPDb1zGzbrX6BTyrwGtETMzJvu6fstN/bYQP2Uj3/sU2C0WRZKyrpC0UDo3D/JAxU+JMGKbQlSpnuB19vqiBuGdZhDxKcwY0GkFGWBcjo707nVrrZL5kzaB9w5gpAd6ltlkcZYMfqNCfJoJbg4UMJNs5kRvgI9jrBthK4Sd0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnQQwuW/BA/bAjnynOF1xkr2PqR07omCdldNfIchjJ4=;
 b=oYNNIOtU35Xrl7tN5apTXG5qlzeBM9hAC5mK5kkDl8H9XYKOfQLP29pqteMbLqy5Il2zb1txjq2lWy/NAHHJm3tZuICblXkCh2JzvkzzWQllBG6V73Lc4jjwBtMDo/Gn2exqBhM22dAphISsbDndP+z3Tk12JLyqacHh4WmhOOo=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3285.eurprd08.prod.outlook.com (2603:10a6:209:4b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 08:19:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Thu, 18 Mar 2021
 08:19:53 +0000
Subject: Re: [PATCH V3] file-posix: allow -EBUSY -EINVAL errors during write
 zeros on block
To: John Snow <jsnow@redhat.com>, ChangLimin <changlm@chinatelecom.cn>,
 qemu-block <qemu-block@nongnu.org>
Cc: kwolf <kwolf@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 mreitz <mreitz@redhat.com>
References: <2021031008163294066310@chinatelecom.cn>
 <284d4c03-b7b1-cc77-c187-3dc468e83e0c@redhat.com>
Message-ID: <9dc8158a-7ee2-1dfc-e6fa-ed6b72caf581@virtuozzo.com>
Date: Thu, 18 Mar 2021 11:19:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <284d4c03-b7b1-cc77-c187-3dc468e83e0c@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM8P189CA0030.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::35) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM8P189CA0030.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Thu, 18 Mar 2021 08:19:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d100d69c-c76d-4909-85fc-08d8e9e69b77
X-MS-TrafficTypeDiagnostic: AM6PR08MB3285:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3285EF0294EF3F18DFA367E4C1699@AM6PR08MB3285.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2331;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hg0SZWNWYfySkhCF/DXDCB6ls6ZHkNvoM5Tyjhe5XjTlfOhkYsrxQHyIa0TMu43zS8zGCTxPSqJq72Oc1n2bD1WHndqkeS0PxrTMQqKYcoJI5hBfYBVnJtNQ8OZ0MMFwESRlepxjmngWbFWut0mLeeiY1CidXfVXCDcXSRPn0fGMZpWgPoA2g3xxeJwrxS7BHiB38N0N7U6cRq8ugQOwpIcx4AHuT09QinVaGvfP6x0Pbq1DiN23Mb2BCY4oq8gH4mShBSXPf2rOmc6lFXljTehuV7ywImAP8pZSgXeYhbO77wq+U16yLm0+i/21KGwjJ2DJZzPxKmvTgoq1qT6QUFPsBvQApAV83SBOR/AVb5XRx1bQGFUfpPvh6kM9fjGCzxjiNV7VnW3YWm9K+Wru9SgmgqySjSjaP1y4bBDOOGmclmdDVmf2sBzrZhyrPLKBt/60BW4okNpQbsBi2rnmlxikQTZD6nOquO2FIi3/alJ8tkYtLjw5na5ZxZoiRJ87k3t4zrQIZ0sni/S9NDzp2Ft7iIaspb5ZehmNKSZHyDzfh2UUE3FVibAHD6HS1PUwrpSwGL2i1iJN6zuaRDI+Qp7ZKDaEIHhC9IuK0zxgzjtJp7TYYVzTGKdh31tVFRSdzUjWQeOTzp5NNtImLk1KuonC+MV5b4Y25W21ouTVHqWpLa/DXW8tyJuIhMg97HHh5GeAfp5UI4EUNGCStGr3t6pLhwPU14Sg2qn1Gyzgt3xtPqzUlVcLbTGnkJPHwL1Y0EKNjkeRuynr8OmWHgmjQA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39830400003)(136003)(346002)(366004)(16526019)(54906003)(66556008)(186003)(66946007)(52116002)(966005)(66476007)(478600001)(5660300002)(53546011)(26005)(16576012)(31686004)(2906002)(110136005)(31696002)(956004)(4326008)(2616005)(6486002)(36756003)(8936002)(316002)(38100700001)(83380400001)(86362001)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?2GDfOpg1qyzMBChLZ/Dh1tzw9YSDqjW9akbDoZRBcA/A1ap8YgkFT5gs?=
 =?Windows-1252?Q?FSmNtYtMBD7tJC9eFSAgz5MgON5FksPG/HZEw03gsZfLYz9ROO2V9FTc?=
 =?Windows-1252?Q?RahZxUF5nCepwWBYAHhXlUqfsJ+yc/OTmwRe//Sv3Hti4iOPQbLgSBfr?=
 =?Windows-1252?Q?UONMkgYsMmA6Pv6peDxY9HepISztCgsZXMNcwQrCcA7Dy1wJ60u3eQfq?=
 =?Windows-1252?Q?SNfk1pLrSebLg5e0vchRmUrdoDpOfepHEQkOcroNlOQAXYVtTrvQy8I1?=
 =?Windows-1252?Q?9Xyh2rn1Rhkg6tQmP7RcZB4hu0pFWBMq0EalVEb+YcD5IpUJHfUCcuF5?=
 =?Windows-1252?Q?9e45GSK3Yt8KvyDqyFpSRmiILnLUCkysJUDHQeJJkR5/0ZCiUOg5wiEv?=
 =?Windows-1252?Q?GWV+RU+DsJJePU1EUAjmT8rKb329NTSOoYv0bY+MbWS+GahHTeAcuCWG?=
 =?Windows-1252?Q?Fxv8508ORTT0H2IxE8mgP2ifxKShouoE1XBjiSs1zRHP2mdq2/VuGsW5?=
 =?Windows-1252?Q?2eA0oK7U3JUUyO3B5YI/DNvtGz0am0OVhCm2I8SjAbovlteTOd7BhCru?=
 =?Windows-1252?Q?+SF9uL74ZQqQ7KM5Gd79fceg14ApaMXPnVkxwmOU4sQnCrCJ185ccQlr?=
 =?Windows-1252?Q?5wOl4UbcPy+n7CpdwT16MNnys4VMfNk7BROxv6mb+SETDcDTy6dc+QT3?=
 =?Windows-1252?Q?SRHqFezv7dkT2DkhQkP1qmp2xHML6nBpHGCz0hVa6NQGfVhKkJnp0AJ5?=
 =?Windows-1252?Q?Rzv5LeD3JQ0IGRI4wpdRJZo8CSI7pt1LespyuEXKxMrxvu1JnSajAYeM?=
 =?Windows-1252?Q?87++j4fhA+Ky7fXGvktUSusSqpAhpHsodlPQQS83zmKxqRHdIgTHn07T?=
 =?Windows-1252?Q?2Zakih3hFMlWBjjW8ao5jQB1vuuboread5NzsAEGE7awMgm8D01kdRqa?=
 =?Windows-1252?Q?+7oB9ucJhYoUgXN8Uc7Ij6mChsUey8zaK2f8UNcDA6geYMOWZEjUEhrY?=
 =?Windows-1252?Q?87V5ef5GYPljtbhkgv8NZtQbhPvA3Mk8wsgx/dJT2G32LfjibdfHGDSO?=
 =?Windows-1252?Q?xEKbSfB4ecvzF/wOtFokgmcmQ2MdYpEqnOdi3qvynL7nfFFeHc43u+TZ?=
 =?Windows-1252?Q?jEPazuoRUK6sdbUjRRL+q8z3f9CtWFz3au45i4Cj2dnQe1fsAHD/5WaL?=
 =?Windows-1252?Q?8+h2+5rc8YKczqrqg3/1cFhSYtwoLTPBsJ3eMMHAswDqLXUbJr7uW4GZ?=
 =?Windows-1252?Q?zDfyK0G0FQvaAj82HCagQUczEBspXM6Rjy/2BCdrC9R5sczFypkSDUQq?=
 =?Windows-1252?Q?UZ2AGkMxjvp9tZC9SWXvgTm4PYig0shEeI65v3XJkREgSTcc2i5WZ6bS?=
 =?Windows-1252?Q?GI53HvgaP8d8ZRdpwpZNEUto8fDf56B/tBuN2nVLcOcNTOdRC36OsXLV?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d100d69c-c76d-4909-85fc-08d8e9e69b77
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2021 08:19:53.4430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TCZubVeBol7IIzlztq5QRLtFH2HtO1JEWQ5BeY2mO1m0jvwoOivhB3Jr3L3iikvyEugRLLK07lZ5FIioMK4rkkWF9BmyZUm95CGI0FlCxl8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3285
Received-SPF: pass client-ip=40.107.21.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

18.03.2021 02:23, John Snow wrote:
> On 3/9/21 7:16 PM, ChangLimin wrote:
>> Since Linux 5.10, write zeros to a multipath device using
>> ioctl(fd, BLKZEROOUT, range) with cache none or directsync return -EBUSY
>> permanently.
>>
> 
> When do we get -EINVAL? Both of the commits referenced below don't specifically mention it, so I am not sure in which circumstances that might arise.
> 
>> Similar to handle_aiocb_write_zeroes_unmap, handle_aiocb_write_zeroes_block
>> allow -EBUSY and -EINVAL errors during ioctl(fd, BLKZEROOUT, range).
>>
>> Reference commit in Linux 5.10:
>> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02 <https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=384d87ef2c954fc58e6c5fd8253e4a1984f5fe02>
>>
>> Although it will be fixed in 5.12, I think it's good to avoid similar problem in the future.
>> https://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9a626cd99@kernel.dk/ <https://lore.kernel.org/linux-block/53689a67-7591-0ad8-3e7d-dca9a626cd99@kernel.dk/>
>>
> 
> Wait, if they're fixing the function to actually apply a different fallback path, shouldn't we *not* allow EBUSY?
> 
>> Signed-off-by: ChangLimin <changlm@chinatelecom.cn>
>> ---
>>   block/file-posix.c | 9 +++++++--
>>   1 file changed, 7 insertions(+), 2 deletions(-)
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 05079b40ca..4e132db929 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -1629,8 +1629,13 @@ static ssize_t handle_aiocb_write_zeroes_block(RawPosixAIOData *aiocb)
>>           } while (errno == EINTR);
>>
>>           ret = translate_err(-errno);
>> -        if (ret == -ENOTSUP) {
>> -            s->has_write_zeroes = false;
>> +        switch (ret) {
>> +        case -ENOTSUP:
>> +            s->has_write_zeroes = false; /* fall through */
>> +        case -EINVAL:
>> +        case -EBUSY:
>> +            return -ENOTSUP;
>> +            break;
> 
> oh, we're not "allowing" them, we're treating the failure *more seriously* so that we avoid attempting to call this function ever again for this FD.

No. s->has_write_zeroes is set to false only for ENOTSUP came from translate_err, this behavior is not changed.

The only thing the patch does is _returning_ ENOTSUP instead of EINVAL and EBUSY. And I don't understand why. I think that at least for EINVAL it's just wrong.

> 
> Can you please add a brief comment here, something like:
> 
> /* Linux 5.10/5.11 may return these for multipath devices */
> 
>>           }
>>       }
>>   #endif
>> -- 
>> 2.27.0
>>
> 
> 


-- 
Best regards,
Vladimir

