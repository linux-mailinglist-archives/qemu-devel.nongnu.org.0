Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B12C2BB1
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 16:46:47 +0100 (CET)
Received: from localhost ([::1]:55320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khaWk-0002fe-7M
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 10:46:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khaV4-0001gu-PK
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:45:02 -0500
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:15877 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1khaV0-00046Z-Bw
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 10:45:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R1Tlk1JjhFAasBdO0Yz0ZoRvnH8vYK24BkKZ1iJ9ER9KVmoXwBkY899tmM1+7BNOqj4t8Lb6YYCQO1M0VC9cBLPqlrmGHxpEmjxZTj2WZeDbr+p7iUjebLwJU/11SooUxE69xE6cVXDnKmUv4zoWoo9fXwQ+D2yCM8kQFS3cCj0E6Ej2vmR1FqsooBGPwmiPpxKz+mQREuvmud4UhDLTIN5cdX52ODw0QAFib3XSuMtzfTatsw38UZTi10pBWt7Gszq6WQ9mkancySIIZEevIRs/b3ugp0mvU2hMTmgAXsKu4BDWq1+o8fU4mDSLarfFwIK6YyH+Y0kqf9H7w7y+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LekVtbwP3YuZ10W7pjVr7lem1WmUS4yWrnNCjpiW4TA=;
 b=Rpl22XtlREBtqycHgvBc9+Ih5zT0/5d5zbqwccn4Md4I4c6c87rcl8pP8JmllWabBiTBKMo6zvExA6z3Vn6QX1r60Bdv9ftdp58ZGfq7sk+iZteFOlJzQ71njkmOklEIXfSVggrvZeTENT84TgL7u+vbJ3kccQ0LMoilmbZ6OQdbH3F4ZDO/Gsn3uC/aQ+IdAGnr5fLgtyAZiytiNNB8Z/NWV9Bg6CkjqtHq5+O/M6vgx1Z5jS2i36BcAPbKxNafSrpWzhgieHDj1lAxZ0OeMFFT3oEHvSrqDzTH0nIssJcy7vHGdEd1qsi7A6brT1Zvg1F/Vhgk/yFGz6tXyFhL1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LekVtbwP3YuZ10W7pjVr7lem1WmUS4yWrnNCjpiW4TA=;
 b=wGxf+yjsY44IlmrRAo/Nfm5N59HAqKN9Xgj7h5nh7SdLMny+scdVBiS94KGjcVoqmrFw3TyNgWBixyWk6LFPypMSmM2mOeGtepzesnHgA3WAu9wcE69Kzh8xPR5IKXtsSdoZYVKxCo2NXOSk4964wYDxKQVf70FnAtTIeXvnsRM=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1650.eurprd08.prod.outlook.com (2603:10a6:203:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.28; Tue, 24 Nov
 2020 15:44:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.030; Tue, 24 Nov 2020
 15:44:54 +0000
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for monitor
 to read
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, den@virtuozzo.com,
 Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
Date: Tue, 24 Nov 2020 18:44:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
In-Reply-To: <20190710163610.GG2682@work-vm>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM0PR06CA0142.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::47) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.100) by
 AM0PR06CA0142.eurprd06.prod.outlook.com (2603:10a6:208:ab::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.21 via Frontend Transport; Tue, 24 Nov 2020 15:44:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 153adf4a-b14a-4568-75ee-08d8908fe368
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1650:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1650AA073DCFA8A989BAD44AC1FB0@AM5PR0801MB1650.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pMLMD6k40qnNSsz+n3IyzrfbhL07J9VROza5ZhtGmO4t2yw+UH1ZoIhrWRKXTm25fnGZTB+ILGAEVxLBoIQCIyPWw8/wtqi8lPJHMYpQ9zauy1bAD3WDnbsF6npcbeklphrkiTcT0Zlr73dml7SLnum13zUxrHcOQY/dvWLPzqWmGP/zt5ZkprZA34DZEVzK1E46Iu75jp6Qr/0/NzIc1MouIhg3kFtWlNaCSkRBwMSTqGfBNcPHIBP3MlNbmukbP6RsZxz1AxAfQIxquSBP0aXRxhzLTxFEg3Ta6IDyZl9ii/aQk9cEg8orQVt9coGpuvx6VFmEa+AlQeaMini3U/EIlJKPu38CkR4c4k0y2tQBjEtBc+qVmnyYmkld0Zlz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(136003)(39840400004)(396003)(478600001)(5660300002)(16576012)(2616005)(956004)(8936002)(316002)(110136005)(107886003)(83380400001)(31686004)(66946007)(6486002)(52116002)(36756003)(2906002)(26005)(66476007)(86362001)(66556008)(16526019)(186003)(4326008)(31696002)(8676002)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: xEUH+8GZDbd5SaV+lWhu5QTD08EEaNUwaZ39300o25B8psPQMfKhhS3SxqPfR8r8sOhOG1I6VA7wktLipnxU+kI3P7vjU/akHXj4zYodkP0+OdVubPj+eLhBfeQqLzNIcf2iEWA49vY+vw6T4ubIs38dL6JjLmxDtQd0u0gDFFMNCTAsHnIwrWCd+eE2eRDOSconxOfkm4OhBpByJ3l44KUL6L5b6HTU9x0ZDUGubK33K44tD3aZbrwyEmGQOsdlz8H01uymLB3pjd+R0FKTAEDvDANS+Yk2ft8XDKeoDbUEI5/NPJmtZGBTBZbjNYKfH4Y963Fys29hRZIvCfZLS0Ef5sQpk5lKS2oWgpjhAmIsvXrI2NWdCrBKQM7MZ//VLJ1Hu9M5eQ48CRUbSnFht7GQBnytIwwaX8jMKqb4EN9usopD05wAQ42e9CvhDjBkFNMjNqvlZOkxFHC/AmAKhVTdhjCrWme63DoQPZ8ttHIjc8qlGISn0gHhce2LQdjazuypm4lIQ2ik06s024j/B9CwhJ529+ZbV7eNjrGr+oIIXbv0WRJCOKeNdc/GMzeSASPTcGlj5YdapqpGsPPRQUFnTyHMZU0MTODvj+wSutKwi0UCJ5fKAhuON1AB4+8wQZOAin3WlzPliuc6DP97yTAjp4wLdPgu0pRnoeg4El4XiX9SkCe1NPHecsAUMDFxK1y/Y2N2kO3Lpl9P2KC8L2RB6Wl7BD/LUk5yTJ8btG1LnKh4utvNhYcmfAuR394peaT/LoCmvjIC6wrnkqE73d5Vg6KNB8oWgm58Kfyn+RjGLToHQbXsHZaZm0TI95Ggm+oxQVkYxz+8ThFNfQGMO6ve1k4PfWVLC6ufLqhGtsqz2jtbh6boOY6UEGn39Qt0j2DnzTeXZWxKFZczDRXUYQ==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 153adf4a-b14a-4568-75ee-08d8908fe368
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 15:44:54.4913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5W0qtWL40YgXBVlF/cFZblaYW4PpYtkIcK6mUNe6x+rYa9uPz8r7Cgj8q0gHmbvnK3yjpHVMwRDUjEToL2Gr0PKRyrr/C0uC2rTtbumfH1E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1650
Received-SPF: pass client-ip=40.107.6.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all!

This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read

We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.

10.07.2019 19:36, Dr. David Alan Gilbert wrote:
> * Markus Armbruster (armbru@redhat.com) wrote:
>> Did this fall through the cracks?
>>
>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>
>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>> a lot of unnecessary system calls and CPU usage in the system.
>>
>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>> didn't expect it to impact system performance.  How are you using QMP?
>> Just curious, not actually opposed to improving QMP efficiency.
>>
>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>> buffer size on the channel level. Fortunately, monitor protocol is
>>> synchronous right now thus we should not face side effects in reality.
>>>
>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>> ---
>>>   include/monitor/monitor.h | 2 +-
>>>   monitor.c                 | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>> index c1b40a9cac..afa1ed34a4 100644
>>> --- a/include/monitor/monitor.h
>>> +++ b/include/monitor/monitor.h
>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>   #define MONITOR_USE_CONTROL   0x04
>>>   #define MONITOR_USE_PRETTY    0x08
>>>   
>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>
>> This looks suspicious.  It's a request count, not a byte count.  Can you
>> explain what led you to change it this way?

I can explain, because that was my idea:

It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.
So, I decided that if we allow to read up to 4096, we will not add more than 4096 commands simultaneously. And that works..

Still, now I don't think it's enough: who guarantee that we will not read new commands when queue is half-full?

I think, that we just need two limits: QUEUE_SOFT_LEN an QUEUE_HARD_LEN (suggest better names). So, when QUEUE_SOFT_LEN is reached we do suspend the monitor (like when queue is full currently). And in monitor_can_read() we allow to read (QUEUE_HARD_LEN - QUEUE_SOFT_LEN). In this way queue will never overflow the QUEUE_HARD_LEN.

Also, what is the minimum character length of the command? I just decided that better safe than sorry, considering one character as possible full command. What is the smallest command which parser will parse? Is it {} ? Or may be {"execute":""} ? We can use this knowledge, to understand how many commands we should be prepared to accept, when we allow N characters in monitor_can_read(). So, 4096 is probably too much for QMP_REQ_QUEUE_LEN_MAX.

>>
>>>   
>>>   bool monitor_cur_is_qmp(void);
>>>   
>>> diff --git a/monitor.c b/monitor.c
>>> index 4807bbe811..a08e020b61 100644
>>> --- a/monitor.c
>>> +++ b/monitor.c
>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>   {
>>>       Monitor *mon = opaque;
>>>   
>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>   }
>>>   
>>>   /*
>>
>> The ramifications are not obvious to me.  I think I need to (re-)examine
>> how QMP reads input, with special consideration to its OOB feature.
> 
> Yeh that was the bit that worried me; I also wondered what happens with
> monitor_suspend and things like fd passing; enough to make it
> non-obvious to me.
> 

OK, I don't have answers..

Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.

I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.

If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.

-- 
Best regards,
Vladimir

