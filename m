Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949C12FA7AB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 18:40:31 +0100 (CET)
Received: from localhost ([::1]:53702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1YVy-0003b7-L4
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 12:40:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1Y5g-0007e9-B2; Mon, 18 Jan 2021 12:13:20 -0500
Received: from mail-eopbgr50117.outbound.protection.outlook.com
 ([40.107.5.117]:16390 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l1Y5d-0001Rs-Cm; Mon, 18 Jan 2021 12:13:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adUa3sVUDUXC8uULpeWlNdq4lP9l2nCmmtU1QUX3sjt4bnZ2PxpDyYVSFsjUfXfiuYRpjKq6u+a8N7YsjNHRlAZyF5MdGaw8MWA2eXO51s3RzRjk+dNs8rw1wToHo9eoYXfpLfqcCLmJdEscm5NI5so3dhfUuqDFnSkwf06j7VmmN1ViBILgGUN3DEKjxhQhzwdcYtwlvWQCKSB/KJeHnMIc3ogEIqUesk8lG5d7w377wii7f6+iJ19fwgzDm2tffS7pXTJJ3vxKK+GpYA6A6t9vBe8pU3AOPuA+QC+HUrXBzAdQjea8BgHysi7xDZTv8JlUL/Ivo8iCsLZHoHhQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kJBI0Ya4GUZMer686+hu/Vwn0mJrUNxknpyNZK6tLc=;
 b=GPvJGDkvwANIdq3YAC9CNshyCsnhK22vSq23PexFQtU3UZboE3Cu5nYawsis8pic7S/nt2k7x3P87BQyl03DfErbCUWu+pExYLoQZv7/H4Rxe8deefERofuq8ftDWG0Rqq717Nxwdu0Yqw0uAKIoNy69plYRb7aX7WOXjACb4RDtklHnhuXLDKwfwQDHkiPNYwfZ19mKRSSVK2VBLhxFSrQzD8C48lBGy03tBpI34PK4weX6JpnNNSWPrb64GWuK19TPbzpXFmeCgdVQgBlTHoCHJrwFMok95bnYS341kupJzeRvyNa/rOKOuvwbPtJBaZG8xuJIRQ2R3dfqdjOxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kJBI0Ya4GUZMer686+hu/Vwn0mJrUNxknpyNZK6tLc=;
 b=B2JqS/kDA4ZgkcKFMAVWvfuW4zYRNgkRvRsRwOv/6EV6gCSpqXu0LIguVRNOoGjAqz1e4r9mYlqhoAgTG4OYDlLy2ScFHj8YdH5MBNQgHPDFYdl55JW9wCjRgvgQEIYkZpS8Zc8BFClcf/A3Xz3t9MHELvvNUAL3Nd6Y/45MaYg=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4070.eurprd08.prod.outlook.com (2603:10a6:20b:a3::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Mon, 18 Jan
 2021 17:13:13 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 17:13:13 +0000
Subject: Re: [PATCH v2 02/36] tests/test-bdrv-graph-mod: add
 test_parallel_perm_update
To: Kevin Wolf <kwolf@redhat.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
 <20201127144522.29991-3-vsementsov@virtuozzo.com>
 <20210118140521.GC11555@merkur.fritz.box>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <411d5239-1a84-9207-3148-f3289764c572@virtuozzo.com>
Date: Mon, 18 Jan 2021 20:13:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118140521.GC11555@merkur.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.76]
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.76) by
 FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.6 via Frontend Transport; Mon, 18 Jan 2021 17:13:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96c2574e-2795-49fc-10df-08d8bbd45673
X-MS-TrafficTypeDiagnostic: AM6PR08MB4070:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4070BBB649B77F8AC58B0786C1A40@AM6PR08MB4070.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rZamyPL0sVNQhl4OmqTt+Sp/jgdMTto7Oz6MoE3wgPBeu7qvU2twdWmD0R7Vo1ciCelWv4IHoPYpXysK6K1E/q++rO5CsrpBztjbGNDieh3suC7ma2dDhflODwccu6wr7CO4uG+et7iRC6bXKreMXU0209HF8Mp6bGcO9OzrSHM0kNVRzzx/fKKkeMt3WM7Px169uKty9VNbZtxcxcvYMXIE9yF4TvtX8s05jnyqDIMw72gc3kkS7S2Pg4lLKMdvg2h3dgF2681S10kkPHAJ/VkIaKEX3Z0bLfUFrbAj9GYGMuqxyu4P1fsj2gwaV8NrUdqyDuVGKlOi8trVbmjOa6u+Q4bTCc+BLnEHHHCa5KS+1Zl8o7nRs6sBcpgkILSyQMTqELsdpCTrD/Ui0nG9jjKbwURVK6ad0s5Cl5tPPPr74L/yKh2LnPUE8xaG5MoH/k1MP741aN2FBqwRPSpwRIq9x+Ht25GzhA3eQOCelyc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(136003)(39830400003)(366004)(396003)(4326008)(8676002)(36756003)(6916009)(2616005)(186003)(52116002)(956004)(478600001)(26005)(6486002)(107886003)(83380400001)(316002)(31696002)(16576012)(66556008)(66946007)(31686004)(86362001)(16526019)(66476007)(8936002)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?czFIa2VUUkdUUmF5WnIrd1hRcTk1RWZlSVN4WnhRUk1WZit4OWRESXNKZElN?=
 =?utf-8?B?VXlDS3VEUG4rcEkyWnVXdzNHRXVuUUJOOUNsVkR0K3c3eEhyMEgxVjNKZFEx?=
 =?utf-8?B?UEJmM04zbWk2NWFmbnVwOGo2WU1UWE9rb3BYSGJtVnJySldNOUJwdlpkYTNx?=
 =?utf-8?B?L0tYNmhvNFRjd1pWY1JheUZTNkZCVlVqYVFhN245L0xpUHpaWjliTVJKdStB?=
 =?utf-8?B?SUdtb1hHR3RVdFBiM0NBSkhpOHZDYi9TYjRGM1QzbkNWaWNTK3M1a1hBaXN2?=
 =?utf-8?B?NzJZYUh1V3ljaUVDUFFNZ3pYdlU4b2Jkb1FhZkt5R1g0aXEzb3RUVEJicGNx?=
 =?utf-8?B?UmtPcHY3VlNhckJqVEZwMFZMa2prK0k2RzRzYVFXVmVRak10T3B4b0NCZEJs?=
 =?utf-8?B?QzhZc2NZTStmSzFhNE5Rb0F6OTIxRWNqcVFFR2ZkTW1SK1lVUlRyTU8zZDIr?=
 =?utf-8?B?VXpSbUowZ1JCc01iNCtSQUpUbFc2UDZ1ZDRzTis3NHJiN0tWeURlU1dKdjV4?=
 =?utf-8?B?TXBJQ0w1YS96UlZrVVdpV1d1QVU3SVpGaEdUcGlJVnE2WXpBRGdLa3ZuNmN5?=
 =?utf-8?B?STNEelYxbWx0VEkrWjUxeGRBM05SMWM5OTJJai85dnA3OHA2K1o1NHJTaUZl?=
 =?utf-8?B?ZXRxRFJXQzdRN3lsTW5OS2FHL1c5MU9MQlk3NURjd25KQzZmcEZzQ1JCZzZ3?=
 =?utf-8?B?YjFWM0ZXQ3pmVUZNSHNvZzV6RUcwMkoyelRlY3llYm9ObkswY1lBbTVvWkJM?=
 =?utf-8?B?ZGhBTUhGdWtvMkw2M3ZtT3hiTXYvTE04QnZ5YTYxL1d0YmxqSW9aUm5KeWUz?=
 =?utf-8?B?Y1p6UkNXbEJMQU1pM0U1QktiM1JsVUVFWFZUTnF1UkdtOXEyV2JlTGZMRzBN?=
 =?utf-8?B?T2hXdTl4NTN5VFB1UGZ4cUhUeHN2WXdsM28yYUhCSXEyd1FXUTNwL1RSVmZJ?=
 =?utf-8?B?WjV1RWxQcDV4VzVWNzRUYWU1U0ZBQzBrdUt3d0lkbi9ieWJoRU9pRktFWEJ1?=
 =?utf-8?B?OHBFRnRhU253cTRTbWloNCtGSEMrK09qaTFZbUdVdU1JR1l6RXlXeXRsekUr?=
 =?utf-8?B?L29EWHlJOVV0RjY2SjM2OXFjUUJPRUxmL1Q4ZHY1Y01SMTVvcEFPbG4vSjdk?=
 =?utf-8?B?ZXY0NkQwVVdid0t5ZTdiZVJZZEpSNDdiM2UzUVhCMU9QZC9FdWZRaE5aNFR2?=
 =?utf-8?B?WGptbUdsb2M3SnNpT2dUYW4zTUFveHl0SHN2ZkhBcE80dVp1WEllN3JTOWVv?=
 =?utf-8?B?TDZDV1d4dFUzcTBlLzJLUmlEL1FpejdOYWlLNTd1N0dLdk11VGpWcXJySkpm?=
 =?utf-8?Q?5ZRpoNWA3UwZCaVG61zVhPFnYmkQXjUEV9?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96c2574e-2795-49fc-10df-08d8bbd45673
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 17:13:13.4396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03162s0mo3THZfMns8DK9pk9h+4PUnlHkMv3bv1O2UgV/rYskjWgfyGGgSYj2+kAT6ClvVlZWXaV5tvVgo5DKUkalXMyO99HmBMQa4IAi6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4070
Received-SPF: pass client-ip=40.107.5.117;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.194, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu-block@nongnu.org, armbru@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

18.01.2021 17:05, Kevin Wolf wrote:
> Am 27.11.2020 um 15:44 hat Vladimir Sementsov-Ogievskiy geschrieben:
>> Add test to show that simple DFS recursion order is not correct for
>> permission update. Correct order is topological-sort order, which will
>> be introduced later.
>>
>> Consider the block driver which has two filter children: one active
>> with exclusive write access and one inactive with no specific
>> permissions.
>>
>> And, these two children has a common base child, like this:
>>
>> ┌─────┐     ┌──────┐
>> │ fl2 │ ◀── │ top  │
>> └─────┘     └──────┘
>>    │           │
>>    │           │ w
>>    │           ▼
>>    │         ┌──────┐
>>    │         │ fl1  │
>>    │         └──────┘
>>    │           │
>>    │           │ w
>>    │           ▼
>>    │         ┌──────┐
>>    └───────▶ │ base │
>>              └──────┘
>>
>> So, exclusive write is propagated.
>>
>> Assume, we want to make fl2 active instead of fl1.
>> So, we set some option for top driver and do permission update.
>>
>> If permission update (remember, it's DFS) goes first through
>> top->fl1->base branch it will succeed: it firstly drop exclusive write
>> permissions and than apply them for another BdrvChildren.
>> But if permission update goes first through top->fl2->base branch it
>> will fail, as when we try to update fl2->base child, old not yet
>> updated fl1->base child will be in conflict.
>>
>> Now test fails, so it runs only with -d flag. To run do
>>
>>    ./test-bdrv-graph-mod -d -p /bdrv-graph-mod/parallel-perm-update
>>
>> from <build-directory>/tests.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   tests/test-bdrv-graph-mod.c | 64 +++++++++++++++++++++++++++++++++++++
>>   1 file changed, 64 insertions(+)
>>
>> diff --git a/tests/test-bdrv-graph-mod.c b/tests/test-bdrv-graph-mod.c
>> index 3b9e6f242f..27e3361a60 100644
>> --- a/tests/test-bdrv-graph-mod.c
>> +++ b/tests/test-bdrv-graph-mod.c
>> @@ -232,6 +232,68 @@ static void test_parallel_exclusive_write(void)
>>       bdrv_unref(top);
>>   }
>>   
>> +static void write_to_file_perms(BlockDriverState *bs, BdrvChild *c,
>> +                                     BdrvChildRole role,
>> +                                     BlockReopenQueue *reopen_queue,
>> +                                     uint64_t perm, uint64_t shared,
>> +                                     uint64_t *nperm, uint64_t *nshared)
>> +{
>> +    if (bs->file && c == bs->file) {
>> +        *nperm = BLK_PERM_WRITE;
>> +        *nshared = BLK_PERM_ALL & ~BLK_PERM_WRITE;
>> +    } else {
>> +        *nperm = 0;
>> +        *nshared = BLK_PERM_ALL;
>> +    }
>> +}
>> +
>> +static BlockDriver bdrv_write_to_file = {
>> +    .format_name = "tricky-perm",
>> +    .bdrv_child_perm = write_to_file_perms,
>> +};
>> +
>> +static void test_parallel_perm_update(void)
>> +{
>> +    BlockDriverState *top = no_perm_node("top");
>> +    BlockDriverState *tricky =
>> +            bdrv_new_open_driver(&bdrv_write_to_file, "tricky", BDRV_O_RDWR,
>> +                                 &error_abort);
>> +    BlockDriverState *base = no_perm_node("base");
>> +    BlockDriverState *fl1 = pass_through_node("fl1");
>> +    BlockDriverState *fl2 = pass_through_node("fl2");
>> +    BdrvChild *c_fl1, *c_fl2;
>> +
>> +    bdrv_attach_child(top, tricky, "file", &child_of_bds, BDRV_CHILD_DATA,
>> +                      &error_abort);
>> +    c_fl1 = bdrv_attach_child(tricky, fl1, "first", &child_of_bds,
>> +                              BDRV_CHILD_FILTERED, &error_abort);
>> +    c_fl2 = bdrv_attach_child(tricky, fl2, "second", &child_of_bds,
>> +                              BDRV_CHILD_FILTERED, &error_abort);
>> +    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>> +                      &error_abort);
>> +    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
>> +                      &error_abort);
>> +    bdrv_ref(base);
>> +
>> +    /* Select fl1 as first child to be active */
>> +    tricky->file = c_fl1;
>> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
>> +
>> +    assert(c_fl1->perm & BLK_PERM_WRITE);
>> +
>> +    /* Now, try to switch active child and update permissions */
>> +    tricky->file = c_fl2;
>> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
>> +
>> +    assert(c_fl2->perm & BLK_PERM_WRITE);
>> +
>> +    /* Switch once more, to not care about real child order in the list */
>> +    tricky->file = c_fl1;
>> +    bdrv_child_refresh_perms(top, top->children.lh_first, &error_abort);
>> +
>> +    assert(c_fl1->perm & BLK_PERM_WRITE);
> 
> Should we also assert in each case that the we don't hole the write
> permission for the inactive child?
> 

Won't hurt, will add

-- 
Best regards,
Vladimir

