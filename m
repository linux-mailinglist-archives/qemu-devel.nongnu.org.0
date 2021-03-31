Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD4E350687
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 20:39:41 +0200 (CEST)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRfki-0000hn-Qp
	for lists+qemu-devel@lfdr.de; Wed, 31 Mar 2021 14:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRfiA-00087h-NZ
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:37:02 -0400
Received: from mail-db8eur05on2119.outbound.protection.outlook.com
 ([40.107.20.119]:23521 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lRfi5-0006Nj-VG
 for qemu-devel@nongnu.org; Wed, 31 Mar 2021 14:37:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ePWLCzbonPYJFO5RDZxVYnII3j3hEoXpYnDkj4N+6EX/5XdJa8A8bks0reo61+g3qspjO53jykOv/TDNoO2hT1WOTe1Iubf0Ax3H314Y++0cfie5MoBkThI2hm0hricz9JCqOBubf+QDWmKvQ8NvWZrwHqoM4d+uRc49rYPtJPm8MKl46xqT6jUb6Hv0nRUVUV48HuUs+uVtrO61XYSU4hvhZy9JmDT5czKdndg2PWg4TKhExScuihs0B/Q8tAsD9lBnljb/y8AZf4Qs0K6zGsrt/+47wlypluP00CgQ94kfBZYZZRj5QGljrH25OCNqOe+fTQEfekiXY6ud9USDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdBYU2adttdvb78Psiko5W7gkpZZegcj0zYmz58fDig=;
 b=lxUrDt8TCs9tqbTq4XdvaynvpDD/IocmN4u4bcWFQnIL/JVBlUbuszYoardYOwBX6w3es5AVM/wVnlRIIHRumYi2p8us4/8YxX6MXVX4nIFMDOzjSThBn1vCcmLx6yb0rUrtaA6PtXtEtLGkOz6IuDJbi6ufOZ84iMZ2CMapWXQ07/DuQhU5De73ceFghryYGPOwRaUYp1illG2k6aC3OufmsVdo7hWffFxo8RX1IvwP5C/UwTRQjZABfYBM91WeBrMc2/VReEK67Ym+mdsk0t34oAJCLlFv67f0iZXEEUpSrXcPhfgJrEgSESYVl90KvhONsTcOdpayJ/EOSfSVlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdBYU2adttdvb78Psiko5W7gkpZZegcj0zYmz58fDig=;
 b=GFuvaCdgl9ElNzUkZrcC736SyAGcF0Prxo49g9XGsGw8ekNt2eOkYyuLnT0KxGb7QlZkU6E9HM7nbL1u6CPFATYTHxoCN3UCoDjjeJl2JIsJB0ltF/w8lLyUtebEQfSmxhz34M8zs928Ebr/YIGekl0i2SoLtm+pvDf6K72MvX8=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM0PR08MB4436.eurprd08.prod.outlook.com (2603:10a6:208:13a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Wed, 31 Mar
 2021 18:36:55 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::a8e6:4693:824d:19f5%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 18:36:55 +0000
Subject: Re: [PATCH for-6.0 3/3] migration: Pre-fault memory before starting
 background snasphot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210331172803.87756-1-andrey.gruzdev@virtuozzo.com>
 <20210331172803.87756-4-andrey.gruzdev@virtuozzo.com>
 <cf44ad26-c7f0-ed62-e348-9e99d7d6ede8@redhat.com>
 <79c7a862-58d8-2fa4-da75-f299f1728d52@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <0555b956-2431-f3c7-cfbe-9a57acfb3cde@virtuozzo.com>
Date: Wed, 31 Mar 2021 21:36:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
In-Reply-To: <79c7a862-58d8-2fa4-da75-f299f1728d52@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [158.255.154.235]
X-ClientProxiedBy: AM3PR03CA0075.eurprd03.prod.outlook.com
 (2603:10a6:207:5::33) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (158.255.154.235) by
 AM3PR03CA0075.eurprd03.prod.outlook.com (2603:10a6:207:5::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.26 via Frontend Transport; Wed, 31 Mar 2021 18:36:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 724b3248-f141-47e7-2df8-08d8f473f58b
X-MS-TrafficTypeDiagnostic: AM0PR08MB4436:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM0PR08MB4436A0FE8A20FCA851D4EFBF9F7C9@AM0PR08MB4436.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1443;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EZn57XweHXBn4AIlcjCNSLvhjmkm48xbUOVybnJ/ojpj7OFkV3Q+HaCbkSiPGPEIOguXDF2hhSbTzKgNgKQMpM9yzhpI41sOoFrat7w8Eae+5qztNHvwU6wA8vdqPhSsh4v/Y7RXxubgNVvnXGMeipfh6N/u/lyC17KW4f19eIE7sq97dFXJFvR3rLwLLi580m3BJknAER7xlJNojMsO6eGjQ+P/Ero9AQ8mgm5ZNJMAn1Lz01/9YzLJFm3lGU3c2Vdhl/i/Ux+T4XXqm9o7fqMk8EGi1mB9XsvwSuzKeg9yB3pEts5nMN1XGFCd6D9F2qmByc19Tu5uho/N73NN/DZABZvkvLlgoldBjdEBF8alRokI/a5is20f3Liozr07OxWufvHZGIFS22y0msTHHxT2CPKBuNB5Qutg7rLOF9JD2b05raYzIeEGo+FbEMbJY3yg3ZL4/mq+DtW3aPo5vEnwgF97JrnMtnYPoXa7avOhAo6bL7w6J/Q6AS2gXSrXqWJDC+V2/2hmzIlLZM/RUfMgfaD4uNv7jsvWXQelqMgVuUPBtxXbmRSbBkSkewjIsGJN0qrFjR42mOfM7tyNl7X9JEv2lEsxBaaGBGmS5sFPIWeVsoGpwjpkLBb2DRpzep/QAEwMUXp1dqPB8KZjb5eliYDsxIR+xz2GhIAVHaKUU+fiWqcyX29ctHTVzsq/ZaVS00/waH9VYRu8STvAsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39830400003)(366004)(396003)(66476007)(2616005)(31686004)(956004)(16576012)(16526019)(26005)(316002)(5660300002)(31696002)(54906003)(186003)(36756003)(38100700001)(53546011)(8676002)(52116002)(83380400001)(66946007)(478600001)(6486002)(8936002)(2906002)(4326008)(44832011)(86362001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkNMYUVlRFM2QTdvY0JmeWtoMzk4ZkJxWlJQZUY1TEx4Mm4rai9mdENOTWR5?=
 =?utf-8?B?MTk2cW84aklsc0czUlJOZHl0czFRbG90MEloN3BMOGlBSDlPdlB0OGttZXBW?=
 =?utf-8?B?ODFPcWlRUFByTnBmNUNtNU1zYzV2cS91TDc3VWlYTFVXcjlUVjQ5bElaejZ5?=
 =?utf-8?B?dDlYTGx0N01QYTdHdmIzZlIveDhXVzVkbWQ0T0hDSnh6ZnlaWjFUWk5UUXRz?=
 =?utf-8?B?T0s4YUw2VGJTeTB4ZUV3N2JxU0FiOGJ5WEdFL1VEMG9jb0ZjRU1janJWNDJK?=
 =?utf-8?B?b2hnZ215WmEvMm1DYTk0NldJeElKdUV1bnB1T0pmbzlkUGN2aUc0MC8rWFdD?=
 =?utf-8?B?Y3dIZVNEdzZIUmpjYVF4bVR5UkZFOUZwZmkrM0tES0xUV29qL3Z6L2dDb0xo?=
 =?utf-8?B?ODZtakQ2ODNISmUrejVxcDZ4MmlMNmJsL1VMMGhqRWZwVGRZMzczdmFHeEJM?=
 =?utf-8?B?V1pBbHYvSWVEK0p5WmVlYW94QzRkeFgvOFJIanJmMGhWZjhwZ29xbU0ydld5?=
 =?utf-8?B?Y1lWeGdlbGV2dnFNWWN2SElWa1R5eVhmaytHeFBRaU0vNk1NWkszcGtvWFE0?=
 =?utf-8?B?THU0SjdDM3lVczlaM3gyWGJXSFFFNmdwM1Vzc2NpdHYzMVFHbDJ3bHlmLzZa?=
 =?utf-8?B?ZWxPdEZrS2ZHMTdidGlmaUpvS0xLYXBVMlp4enZOcVd4bUpSeFVIcXpMRmF6?=
 =?utf-8?B?ODlWN3dSNExESUVRQVJ1VU4rcGN0TTQzSHNhNVduSVRNTlFDY1hFQkdoRFVQ?=
 =?utf-8?B?cTdvZW9LYW5sWmkzbnI0NTRUVlpHbVNXU2FRUXdDalZpK3pmTzFlTEZZT1pD?=
 =?utf-8?B?VitlbG1MRWJOZzJGUXN3ZGJWQWtBTEM1dHJHQUlZUkxFOUc1Z1h5NTF1d2w1?=
 =?utf-8?B?ZzM3eVkyajFBZ0JYdVZFMmNJdE9zLzZHbHhMUnRHTVgwNVNPSk00amlxalBD?=
 =?utf-8?B?ZHlhRkVzaktRaTRud3VvT3pTWEZkYnVaczlQamNwMGxSeGtCZENucnNtRytF?=
 =?utf-8?B?MFBiSXJDM2NLR1dOUldVekNaUVdZV1RzaVlIcVdUMVZGVjFaN2hTT244YTdo?=
 =?utf-8?B?MW9IdzBIVUtOc25BZTY5RGpYSS8xRnJpZEx0SzkySlFqZ1BHQU9ZTTdneDcx?=
 =?utf-8?B?NXBDS2xMVkJsOUIwVHRFbkw5NW9obXFnclo0NE5nRFplOFhpeXNoc2N2R0tN?=
 =?utf-8?B?Y29FV0hsQzFkdXBqQnlLVVhON2FZRHNvdDZtNDMrV3N2QjVkVG5zUUZZUnZP?=
 =?utf-8?B?WlF1bUJvcFJqQ3NtRFBUTy80NFZXT0lrOVV5eUNoQmlhS1ZqdXl4ck9LZFBw?=
 =?utf-8?B?eFF6c0xLSlJ6dnVJc25za0hoMU92blhVREkrTUZNN2U1Rk9YMXFzZlNmVy9Y?=
 =?utf-8?B?RW9HUE8vY1A5cy9xL2g3WHZrYU5uby8zNVU3Uk43MWFDaGlsVm42cWNLb1pY?=
 =?utf-8?B?YVJDV3dkV1hFWHdUdlAxZ1RFc3Y1dll0dkJhdXJraG5SWGxkbUNBNXgvMksy?=
 =?utf-8?B?V2ZwdXk1L2pBUEVPSXdjMjZLRVd2c3VFZVV4TmVTN20xMWxHcFhVVVh0UzZw?=
 =?utf-8?B?ais2d1dpMm9BdWt4d2h2LzVKMFpDWjBEWk5XcEE2QUVHUUZpRk41QnNFd0lk?=
 =?utf-8?B?MTlFNkpYWTlGN2RMdjRaK3dFUllRRUZjSmxSUndmcW9sZ3l6R0tMdUJMNyth?=
 =?utf-8?B?ZFZrV3AzVUpPK0RwMkxWL0V0ZTVPNGVGUXJlRityR3pYWE5KL0hNM2tqenNO?=
 =?utf-8?Q?mZS1Ebir1TyAVPxz2CLUvUvWgHD+OBI4r8rxFU7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724b3248-f141-47e7-2df8-08d8f473f58b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 18:36:55.1610 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gMM2R1OIsTGgD5lNZsxDXomu8ELb5X4gwWPNHT8lGlQ7W81nAIE0O3np5dYqREIyrr7YYfmHAxQq4Glel2KPH0bbQKboKA4CxxOt2tH6gkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4436
Received-SPF: pass client-ip=40.107.20.119;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

On 31.03.2021 20:37, David Hildenbrand wrote:
> On 31.03.21 19:33, David Hildenbrand wrote:
>> On 31.03.21 19:28, Andrey Gruzdev wrote:
>>> This commit solves the issue with userfault_fd WP feature that
>>> background snapshot is based on. For any never poluated or discarded
>>> memory page, the UFFDIO_WRITEPROTECT ioctl() would skip updating
>>> PTE for that page, thereby loosing WP setting for it.
>>>
>>> So we need to pre-fault pages for each RAM block to be protected
>>> before making a userfault_fd wr-protect ioctl().
>>>
>>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>>> ---
>>>    migration/migration.c |  6 ++++++
>>>    migration/ram.c       | 48 
>>> +++++++++++++++++++++++++++++++++++++++++++
>>>    migration/ram.h       |  1 +
>>>    3 files changed, 55 insertions(+)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index be4729e7c8..71bce15a1b 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -3827,6 +3827,12 @@ static void *bg_migration_thread(void *opaque)
>>>           update_iteration_initial_status(s);
>>>    +    /*
>>> +     * Prepare for tracking memory writes with UFFD-WP - populate
>>> +     * RAM pages before protecting.
>>> +     */
>>> +    ram_write_tracking_prepare();
>>> +
>>>        qemu_savevm_state_header(s->to_dst_file);
>>>        qemu_savevm_state_setup(s->to_dst_file);
>>>    diff --git a/migration/ram.c b/migration/ram.c
>>> index 40e78952ad..24c8627214 100644
>>> --- a/migration/ram.c
>>> +++ b/migration/ram.c
>>> @@ -1560,6 +1560,54 @@ out:
>>>        return ret;
>>>    }
>>>    +/*
>>> + * ram_block_populate_pages: populate memory in the RAM block by 
>>> reading
>>> + *   an integer from the beginning of each page.
>>> + *
>>> + * Since it's solely used for userfault_fd WP feature, here we just
>>> + *   hardcode page size to qemu_real_host_page_size.
>>> + *
>>> + * @bs: RAM block to populate
>>> + */
>>> +static void ram_block_populate_pages(RAMBlock *bs)
>>
>> Usually we use "rb" or "block"; however migration/ram.c seems to do
>> things differently.
>>
>>> +{
>>> +    char *ptr = (char *) bs->host;
>>> +
>>> +    for (ram_addr_t offset = 0; offset < bs->used_length;
>>> +            offset += qemu_real_host_page_size) {
>>> +        char tmp = *(ptr + offset);
>>
>> ^ missing empty line.
>>
>>> +        /* Don't optimize the read out */
>>> +        asm volatile("" : "+r" (tmp));
>>> +    }
>>
>>
>> Reviewed-by: David Hildenbrand <david@redhat.com>
>>
>>
>> and might want to add
>>
>> Reported-by: David Hildenbrand <david@redhat.com>
>>
>> (also to patch #2)
>>
>
> Also, proper "Fixes:" tags would be handy as well.
>
Ok, thanks.


-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


