Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BAD32EFF2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 17:23:16 +0100 (CET)
Received: from localhost ([::1]:46186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIDER-0007xK-2d
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 11:23:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIDC4-0006N8-3Z
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:20:48 -0500
Received: from mail-eopbgr140135.outbound.protection.outlook.com
 ([40.107.14.135]:64899 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lIDC0-0006xe-8Y
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 11:20:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WG+KxY8Pkrq6wit3Lomf6iosdsigDa4+7Trx25X1aSdFysuB1915VcMdY7fDiw/MAfQkbuefzmkPIkjLEFylKDvWROe01DzAoOKeIe5TGGZzJ3cEKgLezJBbNfe7Noaxy4scq4Coyammvx9Pqvbcoi+HTiOuDcox54KW0p/ZpWQ2F6dPZ0xvEI1I0vIufBciQt6OvQDgYKznaU69RHSFtYIuYFf4PEJ2ifnnRcWqDxDcK1UqPrPZHQbn4aEyaP0aNvYA7BycPvDee0aJanK/H8pw9JLcatwqhPXR4WLXsdk6j1bH8RQ5lAe4Fyrn9KwcQKhmbOsKoFWVh6yhJsEN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e/5dvYN2ZjgyLhAYdtRHhRTafD83vq12VYPl3PaMhU=;
 b=GESuojZ9xMbsBGlykeBzHyb/LLocTsN9kVjJdRIb8TWj0EPIYthRsrDSbH9WFzpflK4FsZBpiBl4Ngxh9qZOun4mHyHy2kd0QFgEMye4pcw31VsbP7VjRlBkOHHYdN2FTxizQxZjhjk7K2Oy0LePHdAU0s+CSqLvAr1BQrXDTaCciY58ZbVxozVqOw+gelcSyBaJKT5bOOUbW6P7qv7e3g63BvkaLTUlZ+BMgWm1bKt6qWaqaOBnbtkQWRW5BluGHAN4J8YiYITsnAej+u/5Cn4JarhgkHqkwkFQIt+6EUCkSAs/OX0N+jrRsMSG6QkALSXuW+D0RiYJgwFh5EtLXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5e/5dvYN2ZjgyLhAYdtRHhRTafD83vq12VYPl3PaMhU=;
 b=Hw0gq0GDVO20cBYREkuo34A4JTvacGpgLxhMz+e12cun/nrfllmjo9mcgkXragA2jyaVjqhLmINsJH9DawsO1WLY9p0yLQC9BRVEskBLOFHW3GUdSQ1Z3mhHnSc8wbDNzr2ZM2VVoONTVUfu2Biq6cuHKelHJ8BO5U8TGp7tv+g=
Authentication-Results: virtuozzo.com; dkim=none (message not signed)
 header.d=none;virtuozzo.com; dmarc=none action=none
 header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Fri, 5 Mar
 2021 16:20:38 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3912.024; Fri, 5 Mar 2021
 16:20:38 +0000
Subject: Re: [Qemu-devel] [PATCH] monitor: increase amount of data for monitor
 to read
To: Markus Armbruster <armbru@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 den@virtuozzo.com, Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
References: <20190610105906.28524-1-dplotnikov@virtuozzo.com>
 <87lfxfy67u.fsf@dusky.pond.sub.org> <20190710163610.GG2682@work-vm>
 <31dd78ba-bd64-2ed6-3c8f-eed4e904d14c@virtuozzo.com>
 <02668cd8-7c1c-6bae-edcb-1123ae026983@virtuozzo.com>
 <87ft19zo66.fsf@dusky.pond.sub.org>
 <405eb948-cab6-869a-80eb-cca4c99f110d@virtuozzo.com>
 <87im65vasl.fsf@dusky.pond.sub.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <fce5bb3f-5d29-4a16-f572-4f9ca31e1e7c@virtuozzo.com>
Date: Fri, 5 Mar 2021 19:20:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <87im65vasl.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM4PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:205::38)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.202) by
 AM4PR05CA0025.eurprd05.prod.outlook.com (2603:10a6:205::38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17 via Frontend Transport; Fri, 5 Mar 2021 16:20:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34cf3bcb-496a-469f-3eef-08d8dff29ccb
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362375C50FBC4A45080E41C4C1969@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U90TN/OI5K91+4FVFHxwxXEAXjrQZ1+KhTBMaZpGKCQZoXeQXO80ilyP2bZiCNLYwB3PZnE7BK+JHul0qMtpvSngfheyA3cJKH+wscPi+Rzho9f+rRnD0KFXm1WlKSlIx8cNJiuA3yVVmybLCYWlumzgIn2W9FNjj2HdK5tbxxdS4XImz13alFUm6TG5w9l27xRB3fS/vWb9Ju9XwOlEtuLc3JzzA21jRsjY3JwKw3cI3x/Lr2Vzw8swwcaenFRBaSrP14tmTfD103OqP5FhZbv1EKa14oHupjwR2ROJ07Ks3Gk/FpvEvcfvZy2+PZDBNLU9xwn3YzFvBV0gtGorUakgC6dlcAAdaa8VwRJzLMy2qqk/Ra+6VhGzGmvnJamhv2uhWObTRdu7JYMhbVi05tySgZIrfpn3NqIoQAQtp9GmqksUhp2+C9wenNUuOejDsOwfkHN465UELC3OswAnLzQngikHyl72kAR//DZMbj2DnwjxFgFWlKd4a9+1cJsjSy8hjHQeY6bwdNUo5PJY7yIcs4+xh+b7eKipASfVdZ3n02S5Az2wSWefDR12O4M292ItuMm+xqETgbpzqAR99zG1qYunrNTAbX9GpkXG59M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(366004)(396003)(39850400004)(66946007)(2616005)(316002)(83380400001)(2906002)(8936002)(8676002)(956004)(6916009)(4326008)(66556008)(66476007)(478600001)(26005)(52116002)(31696002)(16576012)(36756003)(31686004)(86362001)(16526019)(54906003)(5660300002)(186003)(107886003)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RFRNZ1NsSFhFaGJKMU4vL3pDd0pZL1dJVW9jM3Awcmc2RG5NYXFUc3U1WHZs?=
 =?utf-8?B?U3ZSRGVuRW16eTc4OTlEUjlveVJtYndVNFFPZU5TbUJFaWNoRmcwbC90L2k5?=
 =?utf-8?B?Y0JzdldHM1kxNW1SbWF1TXljREVUSnJFclJzdS83RG9aVnc1b2lDSm5BdnBX?=
 =?utf-8?B?Q3V1ak9WZmZyclF0aHFTUXArQTA2NEp4WFE2ODNFRHZmNk50R0FSeTZ5WVNi?=
 =?utf-8?B?L29HWVkvc2s0MlNFRWhER25RanhERzJZemZ4UW9tdDhNSFZjK1ByUTYzeE1J?=
 =?utf-8?B?Uk9mUlUyb1hXc2MxUDNDdmE3RkxRZ3c1N3RpZHIxcHNsaFliWkNBTzlkUU8y?=
 =?utf-8?B?WGIvczBRUGtKNGpVK2lvcTJqWEd5dElLS1dWUmpla045eVo2WWkrSXFoZTE0?=
 =?utf-8?B?UkZBL0tncWlnYjVLTThXMHkzSkF1NTdmNmlGWGZVSi9LbllyMkk3THRKbnpp?=
 =?utf-8?B?K2h1Qy9IRnNXY1BjejN2OW1YM1k2U1Z0NkRzSXV0K1IrdldQeDQ5cTZXN0pU?=
 =?utf-8?B?Uml6ZXJlS2JnQndFM3BOWDhpbjM3RFdiRnBXQ2VjMnlWVWx2S0VJdStpemRB?=
 =?utf-8?B?NnpZQ1FCdnpjTWpiOFY3ckl5dHZWQVkxZEpQWXlsZDVDa0xZUTY0UjE1NHlv?=
 =?utf-8?B?STR2NW1CTnA4dklrVXN6WUU2YUpmcWttNFRWUjI2c0U3a094c3pWYjk3Y2Zv?=
 =?utf-8?B?UkkwdHZCRFJaV3ZPc3JTWG81UFd3YVE1STNQV0p4Nnh4Z2V1Smd3OVlwNGNp?=
 =?utf-8?B?RHBQV3Zkc0NWZnUwZkpPbytsRkZqbEdJcmtpYThxMXNNOHl4RnZEcHllWHA1?=
 =?utf-8?B?SUtLVE12ZU5LQ25WRnVxMkxoRHpPTVpJSzgwOVpiZmE3TXN3cmtleTRFVVVr?=
 =?utf-8?B?bmxzQVJBWXBwVWhCK3BQOFFzNkpRK3ZIc1lYaFhERm8yQlhTWm9SMjRNZmZP?=
 =?utf-8?B?Q0NFdjByOWhVZFEvT1BkOXl6YXFadkUxa0tEZFdVNzlVaFlmN0poNnNlL1dM?=
 =?utf-8?B?ZEpQV0dzcm1GdTNmL1BKRjdYcTdWYWwvRENOeUNVVUtyZUtrc2lKdDFVbU5t?=
 =?utf-8?B?T1d1VG92d3dzeDZNVGkyRnBjMmc4UDBHRTY3NEFZazdLZjhpd1hHdFdaUGxz?=
 =?utf-8?B?QWlGZjFhMTNidXZraXl3WWoyTXlYNDFRNUNtSzlON0hWQ25jUFVleE44RzFn?=
 =?utf-8?B?dFZmenBDU3JuVTliTWxxVzJMLzVHUmtqcWtvZGpieWJkVlZ0eWora1dvWDhY?=
 =?utf-8?B?MHNOeTc3cHlnNlpZdWVNWExjeTZZNTA5bGNSVWRYMXo5K0ZCZ011UG41WW5K?=
 =?utf-8?B?aTQxM0NkTWRBT3puOXJyTytUTjY4VzhvRzYxUVRzNmhHK0dtdXNhL3RUUzVk?=
 =?utf-8?B?ZHFaVEE1U25tZTBrZnYwcjAxeU5BWEVTRC95YnRyY2o0cDJhU0xWSXpqdmNk?=
 =?utf-8?B?SUlzZGRLeXErRXpxK0tUSVR6dEtBcEVUd1cyeXBLVTV4cS84MHJ5blo3ZjJ3?=
 =?utf-8?B?cXBnNGtFOFVKWVlBWXBEcGhLNnV1THNkVEt2djNpMEVVNDg4UnZDYVFVdWFE?=
 =?utf-8?B?N2txcFplV3B3RVNaZXdQUXYwS2tERE5YbUdEaGtmMWpUdkUvcFUwYVV6eWNW?=
 =?utf-8?B?d1FXUzFESXlLdktMUnRacWI4SEMxT2sxclBXSzJsMkNlUW1sSHVlWWJXRHAv?=
 =?utf-8?B?bGxZeG91c3ZhSm9EN2xwT0FOU01uK0ZKNVFNSWpYUkJVL0l1NXc2SzMwU3Jt?=
 =?utf-8?Q?+4hkuxidIRj9qoP9v5dM2I9r73Gx8Jo8VaAy2U3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34cf3bcb-496a-469f-3eef-08d8dff29ccb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 16:20:37.9501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CAxNwO3siwbf3Ub+4V8ZHgLT57Gsk1Xiw6utbf8Wl4pL5iYX2Cy88ccQj2d+TmHtImubONwJUerayUcdeezhHKqJx/UMFzg78vmJIxY+8NM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.14.135;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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

05.03.2021 19:13, Markus Armbruster wrote:
> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
> 
>> 05.03.2021 17:10, Markus Armbruster wrote:
>>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>>>
>>>> 24.11.2020 18:44, Vladimir Sementsov-Ogievskiy wrote:
>>>>> Hi all!
>>>>>
>>>>> This patch isn't outdated, it applies on master with a little conflict atomic_mb_read -> qatomic_mb_read
>>>>>
>>>>> We have new series "[PATCH v2 0/2] Increase amount of data for monitor to read", but I do think that we've started from wrong point. And actually we should start from this old patch.
>>>>>
>>>>> 10.07.2019 19:36, Dr. David Alan Gilbert wrote:
>>>>>> * Markus Armbruster (armbru@redhat.com) wrote:
>>>>>>> Did this fall through the cracks?
>>>>>>>
>>>>>>> Denis Plotnikov <dplotnikov@virtuozzo.com> writes:
>>>>>>>
>>>>>>>> Right now QMP and HMP monitors read 1 byte at a time from the socket, which
>>>>>>>> is very inefficient. With 100+ VMs on the host this easily reasults in
>>>>>>>> a lot of unnecessary system calls and CPU usage in the system.
>>>>>>>
>>>>>>> Yes, reading one byte at a time is awful.  But QMP is control plane; I
>>>>>>> didn't expect it to impact system performance.  How are you using QMP?
>>>>>>> Just curious, not actually opposed to improving QMP efficiency.
>>>>>>>
>>>>>>>> This patch changes the amount of data to read to 4096 bytes, which matches
>>>>>>>> buffer size on the channel level. Fortunately, monitor protocol is
>>>>>>>> synchronous right now thus we should not face side effects in reality.
>>>>>>>>
>>>>>>>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>>>>>>>> Signed-off-by: Denis Plotnikov <dplotnikov@virtuozzo.com>
>>>>>>>> ---
>>>>>>>>     include/monitor/monitor.h | 2 +-
>>>>>>>>     monitor.c                 | 2 +-
>>>>>>>>     2 files changed, 2 insertions(+), 2 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
>>>>>>>> index c1b40a9cac..afa1ed34a4 100644
>>>>>>>> --- a/include/monitor/monitor.h
>>>>>>>> +++ b/include/monitor/monitor.h
>>>>>>>> @@ -14,7 +14,7 @@ extern __thread Monitor *cur_mon;
>>>>>>>>     #define MONITOR_USE_CONTROL   0x04
>>>>>>>>     #define MONITOR_USE_PRETTY    0x08
>>>>>>>> -#define QMP_REQ_QUEUE_LEN_MAX 8
>>>>>>>> +#define QMP_REQ_QUEUE_LEN_MAX 4096
>>>>>>>
>>>>>>> This looks suspicious.  It's a request count, not a byte count.  Can you
>>>>>>> explain what led you to change it this way?
>>>>>
>>>>> I can explain, because that was my idea:
>>>>>
>>>>> It's a hack to not overflow the queue. With just the second hunk we overflow it and assertion fails.
>>>
>>> I can't see offhand how that happens.  Got a reproducer for me?
>>
>> Yes:
>>
>>
>> [root@kvm master]# echo '{'execute': 'qmp_capabilities'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}{'execute': 'query-block'}' | ./build/qemu-system-x86_64 -nodefaults -nographic -S -qmp stdio
>> {"QMP": {"version": {"qemu": {"micro": 50, "minor": 2, "major": 5}, "package": "v5.2.0-2359-g0b9242f339-dirty"}, "capabilities": ["oob"]}}
>> qemu-system-x86_64: ../monitor/qmp.c:400: handle_qmp_command: Assertion `mon->qmp_requests->length < QMP_REQ_QUEUE_LEN_MAX' failed.
>> Aborted (core dumped)
>>
>>
>> [root@kvm master]# git diff
>>
>> diff --git a/monitor/monitor.c b/monitor/monitor.c
>> index e94f532cf5..41679241b3 100644
>> --- a/monitor/monitor.c
>> +++ b/monitor/monitor.c
>> @@ -562,7 +562,7 @@ int monitor_can_read(void *opaque)
>>    {
>>        Monitor *mon = opaque;
>>    
>> -    return !qatomic_mb_read(&mon->suspend_cnt);
>> +    return !qatomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>    }
>>    
>>    void monitor_list_append(Monitor *mon)
> 
> Hmmm...
> 
> We always parse the everything we read.
> 
> We suspend the monitor when the request queue is full, and resume it has
> space.
> 
> When we read one character at a time, this suffices: when input is ready
> while the monitor is not suspended, we read one character, feed it to
> the parser, which produces at most one request.  This request surely
> fits into the queue, because the queue is non-full (or else the monitor
> would be suspended).
> 
> When we read a sane buffer, suspending the monitor doesn't suffice.  We
> need to suspend parsing, too.  Feels feasible.
> 
> [...]
>>>>>>>>     bool monitor_cur_is_qmp(void);
>>>>>>>> diff --git a/monitor.c b/monitor.c
>>>>>>>> index 4807bbe811..a08e020b61 100644
>>>>>>>> --- a/monitor.c
>>>>>>>> +++ b/monitor.c
>>>>>>>> @@ -4097,7 +4097,7 @@ static int monitor_can_read(void *opaque)
>>>>>>>>     {
>>>>>>>>         Monitor *mon = opaque;
>>>>>>>> -    return !atomic_mb_read(&mon->suspend_cnt);
>>>>>>>> +    return !atomic_mb_read(&mon->suspend_cnt) ? 4096 : 0;
>>>>>>>>     }
>>>>>>>>     /*
>>>>>>>
>>>>>>> The ramifications are not obvious to me.  I think I need to (re-)examine
>>>>>>> how QMP reads input, with special consideration to its OOB feature.
>>>>>>
>>>>>> Yeh that was the bit that worried me; I also wondered what happens with
>>>>>> monitor_suspend and things like fd passing; enough to make it
>>>>>> non-obvious to me.
>>>>>>
>>>>>
>>>>> OK, I don't have answers..
>>>>>
>>>>> Markus, David, could you please help? Or, what to do? We of course don't have enough expertise to prove that patch will not break any feature in the whole monitor subsystem.
>>>>>
>>>>> I can say that it just works, and we live with it for years (and our customers too), and tests pass. Still, I don't think that we use OOB feature. I remember some problems with it, when RHEL version which we were based on included some OOB feature patches, but not some appropriate fixes.. But it was long ago.
>>>>>
>>>>> If nobody can say that patch is wrong, maybe, we can just apply it? We'll have the whole release cycle to catch any bugs and revert the commit at any time. In this way we only have a question about QMP_REQ_QUEUE_LEN_MAX, which is quite simple.
>>>>>
>>>>
>>>>
>>>> ping here, as a replacement for "[PATCH v3 0/5] Increase amount of data for monitor to read"
>>>>
>>>> If no better idea, I'll make what I propose above (with two limits) at some good moment :)
>>>
>>> Digest what I wrote above, then tell me how you'd like to proceed.
>>>
>>
>> Ohh. Honestly, now I don't have time to dig into monitor code and prove that everything is good. It's OK for me to postpone it for some future time.
> 
> I don't require *proof*.  I do need a bit more help than "this patch
> works for us".
> 
> Weak correctness arguments can sometimes be offset by good tests.
> 
> One obvious testing gap is receiving many commands in a single batch.
> The existing tests don't cover that, because they send one command after
> the other.  Evicence: the crash discussed above.
> 
> How much effort you can contribute is of course entirely up to you.
> 

Hmm. An idea. What we want: read more than one character at a time, as it's inefficient. May be instead of modifying monitor_can_read() and therefore influence monitor behavior in unpredictable way, we'd better add a separate read-cache, and just read through this cache?

-- 
Best regards,
Vladimir

