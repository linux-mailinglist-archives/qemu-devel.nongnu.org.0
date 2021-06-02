Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F419F398ADA
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:37:33 +0200 (CEST)
Received: from localhost ([::1]:41284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loR3t-0007JM-1h
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:37:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQrh-0004l1-1Q; Wed, 02 Jun 2021 09:24:57 -0400
Received: from mail-eopbgr00131.outbound.protection.outlook.com
 ([40.107.0.131]:12403 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQrd-0001sC-KY; Wed, 02 Jun 2021 09:24:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z4uIKt19M1/2MAHy1GkrFCCRDOwmuLOpj1+JDG0P0QKnJh8dELFYg27B4Vf5BxK2A+FoT5ZhyVPuEMETWqroLuvGOOLEx0KhDyBmAKr3M6uaR/+hW9bfYbNCew4RGhPmt7pVKyv9lVCPCrnQwFu86AdY6ace4VqeN3hbIWvP6bzkLxH554JFXT+jiAtleRMjg22niTARyX1kddPi8rpH61PDEQ/tkpOXGlpN2lOddyaZYFEWTFaNqI/hI0rmrpzJ4RMkfCmlb4LwUZwul3136n/U+pOz6RgpAQ9feiG9a/TJZoTdDY6ChaiQAid5zydF7oThtZlux3cfU/Z8F54FvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hZSvKsgaHFWJm5yU/5+p6Wq62Qtck3VMedXZyxxGPA=;
 b=nBFPLHLqd6Lt9SiwrdUA6m82NhEe620RtXRXA+iy2yqBuMosPgLuu211AHAY8MuBZJHSF9l1E34mpCCakQx7NSKFUdqrw6ZPR2mSexxmwm9AkD1umYQpj3EtEz8jNXrpyphhP3o7oH9g8L6aYU0yWKmoPBs/AAOdEz0fpgqI7fZ9ZsTR2NTdHDXYHNXWkLkiMrGWrmccvyVEG1i4rr51jzhdmpylbHJrNJb5m789cRas07Gwg1ASID75WJeG07M/QKAn5/PIkes1y/2Gs2R/SlPGatuIjsO3h9IcrVeQTbghis+g8H5fgXMsj9P8KB4D7szg5BOWbIiba0sKF0MsYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5hZSvKsgaHFWJm5yU/5+p6Wq62Qtck3VMedXZyxxGPA=;
 b=rLmfQqayBM75Ply6JIZh3SfLJ2/+XVrw4kgeeX54Mdr4ALkmAtZWKw2xPieoDqC0Qjkr1ZmDGJbDIvLmZpWOd6Mv0WGqSuTvF4l9CNmGMtd13nuPSHNuOQavFkUXJCwKhi8NCHogkRjLkNtR/ce/B2dFZMvtc2Xcd7yHWbzSNbM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3383.eurprd08.prod.outlook.com (2603:10a6:20b:50::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 13:24:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:24:49 +0000
Subject: Re: [PATCH v3 5/5] blkdebug: protect rules and suspended_reqs with a
 lock
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210517145049.55268-1-eesposit@redhat.com>
 <20210517145049.55268-6-eesposit@redhat.com>
 <43b0217f-4d3a-9380-c91e-ee86fe461c40@virtuozzo.com>
 <0bd35c32-d987-f007-392a-08c116e026c2@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <83dce85c-9e7c-f249-8eef-6008b4e71a4b@virtuozzo.com>
Date: Wed, 2 Jun 2021 16:24:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
In-Reply-To: <0bd35c32-d987-f007-392a-08c116e026c2@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::37) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.211) by
 AM0PR10CA0027.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22 via Frontend
 Transport; Wed, 2 Jun 2021 13:24:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b3d74ae-e542-42c7-cda4-08d925c9cc46
X-MS-TrafficTypeDiagnostic: AM6PR08MB3383:
X-Microsoft-Antispam-PRVS: <AM6PR08MB338335989FC0A510FAF3B723C13D9@AM6PR08MB3383.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3173;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t+1J2MVAa/aRG3/GhwZHTA4V8EAnzY94fdOj51npIbaMoTPZPuRruwKpHp1xDEkagPzrbtWi9tv3GDwV9jfjNOforFeeDia72RGALEzwfJqg0of6H2fpr10eWcLVM/hdRpHBagvInIYippvge2M4Gp6mCG6HUDkLPDo4VTmwfZ5XiyRZbLdpdTU0Id/KE5JoewhfpkDdZNvnWZnZju6IekmXFVVHYcNR3tpmGIrFJIy1QgkIigVlT55lylvu1CEQIk2anXClpcDf8R3hTYes5CnMRq6kBYKJtbumUzWd89+NZUT2/VQ3aR1cT5XHCWyipDj+WDew/hijoWpLPcEwwVdk9NomL5QrcrE70aWOkWhR/KttuAQxcskH0JlwM9tbKkFpf+TDFJtkeo4rYw9ixoQ3CR5f4dHsUQ1zJVdsuTvbIovrTOVujdjkiykEHnNh9MVfGd6zxyazVhvRmDxUn8eVRFM4iMklOEOpqjgoBVjJsPi5ajUmyrNkfHnXQcLZMfabmDWjjf0DE8Le1gAxueQqEAof97/EAz5Anl2MtK8S7yVrjbXh1lMqWHH9ty+CLt14J1MRleBeWM42PkQMoIykKeBTlhi+qZK5gpY1SzFTw2PvJX9ksKS0bTy56yWoxEA2ghu2OgupolgPK1GcZopkbCn9X7psk+8z1JG3sjs3dr1XZ/6aLI12v2DrHqTmVNfSeRzpTq5U654avl5BkG66ZXzvKo+a8KrjiaDZmAU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(366004)(66946007)(52116002)(6486002)(5660300002)(16576012)(316002)(31686004)(31696002)(2616005)(16526019)(66556008)(956004)(54906003)(86362001)(8676002)(4326008)(26005)(15650500001)(66476007)(83380400001)(478600001)(8936002)(38350700002)(2906002)(38100700002)(53546011)(36756003)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?R3pCWDlJZS9GMnJmUEI4MTVsTFdYOUZlWXBKd0UrV0JhelhZSTJ4YWtFS0V3?=
 =?utf-8?B?a3d4TllEVGNjTDBzVUdpMW1BSk8wZFJqdU9Dd0NSME4xcEdWeUxhUEhvVHl5?=
 =?utf-8?B?ZE1hQlROdnpwT08xaFZlQ282Qzg0QmpLZkdHeDV4aG9KbHJ2dXllL29EY09I?=
 =?utf-8?B?V1lLQVk3RkdEOE9GekZpS3lBdGxuT2dPWXc0NDNEREQ5VGdBY0d2SS90QjNv?=
 =?utf-8?B?Uzl0WkU2VzRrN1FrNlJjY0hqVll2SEZSQ3diNVd4REhyalJ4WmIzSWdET21H?=
 =?utf-8?B?L1ByU0FzdXg4dnhnT3U4RjVNZThpYnB1b3dHOHl3dDV1R3lZT05vcytmL3RU?=
 =?utf-8?B?R01NTmNvRSsrUU5rN2I2R0Nadi9xSG9oSkhnM3lRQUxQVFU0eXFXR0ZjVU1G?=
 =?utf-8?B?d0dkWTFFcFVoN29FTnhRU01RM2pqT1pHU2VnNmVmWEFVZWFjcmVqc2syYWhG?=
 =?utf-8?B?Q2dqQ09lL0lDYWZYZm5GeGJtMkRZZy96YTR5SndYWVUvamtOVi81M09Nampz?=
 =?utf-8?B?bnhtUCtVMzdqR3hYbVA2NExMSndaMjlZUWxULy8rblFGdDhESDFIUGtiZG1q?=
 =?utf-8?B?TWxrQlBpb2pJU1pXbEFEVzRXTEszOE16anR2NkdVcHJpci9iQVRlWTlzSk4x?=
 =?utf-8?B?QkhyckI2ZDZWZlF6QnYzNFBpbFYxZi9va0VwMTVXUzlxeUM2TDhTc0xYbXRM?=
 =?utf-8?B?RzFRQjI3OHBrVTlOdzNmUFNtbm1tZ05FRlFHZkc2VCtTV25EdGxhdUs1aXBl?=
 =?utf-8?B?amhTNE0zdW04UFZORUFraGdZdXVjakIrVENBL2puR0pvZjBWaXpqTFhmNkpO?=
 =?utf-8?B?YlhOd01hbVAvM2c5bU1NS1hRTFl0QzJ4N3Rjank1MWpGeVgzVnVWbDVhVkZS?=
 =?utf-8?B?ZnFYbjdQK3A4K2JQUEozZmZNekFHN2VPU3ZJeThMa25pSHhJZHZmR2ZlTzhu?=
 =?utf-8?B?c3JUS25TR01wNk9IZmE0ZVlyR05IWG5yVEIzV2tMMnc5K0hUbFR6WDFYRkhZ?=
 =?utf-8?B?SVFOdWpVaFZGZ0tsTHo4c1JZb1VoSWNncG04Qi9QZTV4R25qa0Jwamh0WnpU?=
 =?utf-8?B?NXVGVVViZUFDaklqU01DRFczZnZRVHZoL1g3THY3ZEc0bmo3cDJqaEd2Vml3?=
 =?utf-8?B?K1N5QmpRUTRSaEgySkJ6Wm1JQUV5R09MU2Q2SGVmTThBbDhBR3diVlFuWkVi?=
 =?utf-8?B?Y1VkTk5ncTNqVnh3cm50RnRwdW42a1I5UDlDb2hvdktEVEFZZXBnRHBrYmlJ?=
 =?utf-8?B?TUx4SWZXdmFMclRidTcvYXhndzNVTktNVm5iRGQwWlFBcWlFdnRMZUZxcWFU?=
 =?utf-8?B?R3J3aGxkMmljVmJDK2doOWorYlpFMUorNUpCbkdnRm54a3JTTWxRN0RiNFJH?=
 =?utf-8?B?M1JNYVU1K3dFa2xGS29sa1R5VlJKU2MycXFoUjV5K0dhdjdPUFljVzRkR25v?=
 =?utf-8?B?UXRSVS82ZE9wOGFLbGs2SndPUVlWbEJVajVzalBPSW5rdmcwVU4xRTV6REpa?=
 =?utf-8?B?cXA3OGo2dk8ySzh0Vk9oa0tpc21NWkw5Z0dKNSsrWWxzMnJHQVMzZlU4SHJH?=
 =?utf-8?B?UHF6QllEbHZYNmhLOEExOU4rUU9ITGRKZEgrNHh0K3BVZ1hDUmVVMXgvL1NN?=
 =?utf-8?B?U1JlWTBobmlXaHV3eStGQ0w1eCtCSjhmcVpQUTc3Uit6blhtRktROHExZUFZ?=
 =?utf-8?B?M3RYSTNKa1dGRk5Kc2NNRnNONmlGQVpyTXEveFZtQ0tHK0JHSHd3V2dPREtS?=
 =?utf-8?Q?XFwMMhFOJFWL9DwMVF36OcXdIYjNxw8v8jFh+o7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3d74ae-e542-42c7-cda4-08d925c9cc46
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:24:49.6179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0Ox8LOmXLFHVcDGRalHc8eOVNuPaQDOFYpZQaT0kL3JtkA0f2/SoKXyAmFcCH3n+cEGdV+ZdidPlhdBin3fI5QIx+DZvJImzULjdMB7BbU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3383
Received-SPF: pass client-ip=40.107.0.131;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7,
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

02.06.2021 15:59, Emanuele Giuseppe Esposito wrote:
> 
> 
> On 01/06/2021 10:39, Vladimir Sementsov-Ogievskiy wrote:
>> 17.05.2021 17:50, Emanuele Giuseppe Esposito wrote:
>>> Co-developed-by: Paolo Bonzini <pbonzini@redhat.com>
>>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>>> ---
>>>   block/blkdebug.c | 53 ++++++++++++++++++++++++++++++++++++------------
>>>   1 file changed, 40 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/block/blkdebug.c b/block/blkdebug.c
>>> index dffd869b32..cf8b088ce7 100644
>>> --- a/block/blkdebug.c
>>> +++ b/block/blkdebug.c
>>> @@ -54,6 +54,7 @@ typedef struct BDRVBlkdebugState {
>>>       /* For blkdebug_refresh_filename() */
>>>       char *config_file;
>>> +    QemuMutex lock;
>>
>> we'll need a comments, which fields are protected by the lock, like in other your series.
>>
>> and also a comment which functions are thread-safe after the patch.
>>
>> remove_rule() lacks comment, like "Called with lock held or from .bdrv_close"
> 
> Will apply these feedback in next version, thanks.
> 
> [...]
> 
>>> +/* Called with lock held.  */
>>>   static void process_rule(BlockDriverState *bs, struct BlkdebugRule *rule,
>>>                            int *action_count)
>>>   {
>>> @@ -829,9 +840,11 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>>>       assert((int)event >= 0 && event < BLKDBG__MAX);
>>> -    s->new_state = s->state;
>>> -    QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>>> -        process_rule(bs, rule, actions_count);
>>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>>> +        s->new_state = s->state;
>>> +        QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>>> +            process_rule(bs, rule, actions_count);
>>> +        }
>>>       }
>>>       while (actions_count[ACTION_SUSPEND] > 0) {
>>> @@ -839,7 +852,9 @@ static void blkdebug_debug_event(BlockDriverState *bs, BlkdebugEvent event)
>>>           actions_count[ACTION_SUSPEND]--;
>>>       }
>>> +    qemu_mutex_lock(&s->lock);
>>>       s->state = s->new_state;
>>> +    qemu_mutex_unlock(&s->lock);
>>>   }
>>
>> Preexising: honestly, I don't understand the logic around state and new_state.. (and therefore, I'm not sure, is it in good relation with patch 04)
>>
>> It come in the commit
>>
>> commit 8f96b5be92fbd74798b97b1dc1ff5fbbe249ed11
>> Author: Paolo Bonzini <pbonzini@redhat.com>
>> Date:   Fri Sep 28 17:23:00 2012 +0200
>>
>>      blkdebug: process all set_state rules in the old state
>>      Currently it is impossible to write a blkdebug script that ping-pongs
>>      between two states, because the second set-state rule will use the
>>      state that is set in the first.  If you have
>>          [set-state]
>>          event = "..."
>>          state = "1"
>>          new_state = "2"
>>          [set-state]
>>          event = "..."
>>          state = "2"
>>          new_state = "1"
>>      for example the state will remain locked at 1.  This can be fixed
>>      by first processing all rules, and then setting the state.
>>
>> But I don't understand, whey it should remain locked..
> 
>  From what I understand, when bdrv_debug_event is invoked the code before this patch will simply change the state in 1 - 2 - 1 in the same rule iteration. So following Paolo's example, having these two rules in the same rules["..."] list, will make only one bdrv_debug_event change the state from 1 to 2, and 2 to 1 (if they are ordered in this way), removing both rules from the list.
> 
> This is not the expected behavior: we want two bdrv_debug_event to trigger the two state changes, so in the first bdrv_debug_event call we have 1-2 and next 2-1.

Oh, understand now, thanks.

> 
>>
>> And this logic is not safe: another event may happen during the yield, and will operate on the same s->state and s->new_state, leading the the mess.
> 
> Yes, I think you are right. The state update should go in the same lock guard above, like this:

Agreed.

Probably good refactoring would be return new_state from process_rule, this way we can drop extra state variable s->new_state and use local variable instead (like we do for actions_count)

> 
> WITH_QEMU_LOCK_GUARD(&s->lock) {
>          s->new_state = s->state;
>          QLIST_FOREACH_SAFE(rule, &s->rules[event], next, next) {
>              process_rule(bs, rule, actions_count);
>          }
> +       s->state = s->new_state;
>      }
> 
>      while (actions_count[ACTION_SUSPEND] > 0) {
>          qemu_coroutine_yield();
>          actions_count[ACTION_SUSPEND]--;
>      }
> 
> -    qemu_mutex_lock(&s->lock);
> -    s->state = s->new_state;
> -    qemu_mutex_unlock(&s->lock);
> 
> The other comments below make sense to me, will also apply them.
> 
> Thank you,
> Emanuele
> 
>>
>>>   static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>>> @@ -862,11 +877,14 @@ static int blkdebug_debug_breakpoint(BlockDriverState *bs, const char *event,
>>>           .options.suspend.tag = g_strdup(tag),
>>>       };
>>> +    qemu_mutex_lock(&s->lock);
>>>       QLIST_INSERT_HEAD(&s->rules[blkdebug_event], rule, next);
>>> +    qemu_mutex_unlock(&s->lock);
>>>       return 0;
>>>   }
>>> +/* Called with lock held.  */
>>
>> I think, it would be a very good practice to include into convention:
>>
>> May temporarily release lock. >
>>>   static int resume_req_by_tag(BDRVBlkdebugState *s, const char *tag, bool all)
>>>   {
>>>       BlkdebugSuspendedReq *r;
>>> @@ -884,7 +902,9 @@ retry:
>>>               g_free(r->tag);
>>>               g_free(r);
>>> +            qemu_mutex_unlock(&s->lock);
>>>               qemu_coroutine_enter(co);
>>> +            qemu_mutex_lock(&s->lock);
>>>               if (all) {
>>>                   goto retry;
>>> @@ -898,8 +918,12 @@ retry:
>>>   static int blkdebug_debug_resume(BlockDriverState *bs, const char *tag)
>>>   {
>>>       BDRVBlkdebugState *s = bs->opaque;
>>> +    int rc;
>>
>> Hmm, you can simply use QEMU_LOCK_GUARD
> 
>>
>>> -    return resume_req_by_tag(s, tag, false);
>>> +    qemu_mutex_lock(&s->lock);
>>> +    rc = resume_req_by_tag(s, tag, false);
>>> +    qemu_mutex_unlock(&s->lock);
>>> +    return rc;
>>>   }
>>>   static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>>> @@ -909,17 +933,19 @@ static int blkdebug_debug_remove_breakpoint(BlockDriverState *bs,
>>>       BlkdebugRule *rule, *next;
>>>       int i, ret = -ENOENT;
>>> -    for (i = 0; i < BLKDBG__MAX; i++) {
>>> -        QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
>>> -            if (rule->action == ACTION_SUSPEND &&
>>> -                !strcmp(rule->options.suspend.tag, tag)) {
>>> -                remove_rule(rule);
>>> -                ret = 0;
>>> +    WITH_QEMU_LOCK_GUARD(&s->lock) {
>>
>> And here, instead of increasing nesting, let's use QEMU_LOCK_GUARD()
>>
>>> +        for (i = 0; i < BLKDBG__MAX; i++) {
>>> +            QLIST_FOREACH_SAFE(rule, &s->rules[i], next, next) {
>>> +                if (rule->action == ACTION_SUSPEND &&
>>> +                    !strcmp(rule->options.suspend.tag, tag)) {
>>> +                    remove_rule(rule);
>>> +                    ret = 0;
>>> +                }
>>>               }
>>>           }
>>> -    }
>>> -    if (resume_req_by_tag(s, tag, true) == 0) {
>>> -        ret = 0;
>>> +        if (resume_req_by_tag(s, tag, true) == 0) {
>>> +            ret = 0;
>>> +        }
>>>       }
>>>       return ret;
>>>   }
>>> @@ -929,6 +955,7 @@ static bool blkdebug_debug_is_suspended(BlockDriverState *bs, const char *tag)
>>>       BDRVBlkdebugState *s = bs->opaque;
>>>       BlkdebugSuspendedReq *r;
>>> +    QEMU_LOCK_GUARD(&s->lock);
>>>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>>           if (!strcmp(r->tag, tag)) {
>>>               return true;
>>>
>>
>>
> 


-- 
Best regards,
Vladimir

