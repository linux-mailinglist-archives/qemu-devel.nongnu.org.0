Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C2B341780
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 09:28:51 +0100 (CET)
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNAV0-0006uc-AS
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 04:28:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNAUA-0006U8-Ne
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:27:58 -0400
Received: from mail-eopbgr150124.outbound.protection.outlook.com
 ([40.107.15.124]:14880 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrey.gruzdev@virtuozzo.com>)
 id 1lNAU8-0003n3-2k
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 04:27:57 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJwlO3mk6Yx9ZgzLKQR48MXTn3u/ZGxBEQSxMb6LnlXFgxFiXokLXRhEQ5OLfRDhKs9/xiLKKHZIaE01WTLiEYXW0CGIEiieQAvQXM2vFs6qmg17NS8e2LI0+iriOQtB9BmwXaZ0sscTIZor0/qR1uFs07rvhup3HCf9miuL1z09YtXIdrTwz+9ehv1lj8zsLfn81aPdyZAbHZecfLMgXlCX4vjEQJa9RLvLHmN16y+A0BDc50IVxEitGdhbetlo4nsJt+D/vKK2wu9bz2EElZ2DWa/zI5QXbieQfvJ8UC6akfxf+x5FPPFUrL33M0uq2gWNkk7gU96ek2uQZsWdnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvapmxS7nG1tXaBmeh3H6BkaJAzB/G8rx56otRUUB2Y=;
 b=DREhORhxj1h+O2p3yNqlsi6B1Vji3GXzN+A02/+eQi/m7ICdHccTSP4qgG8Nr0zFh8K+k0ss/GnyCcgCVhWVyAKvBaWr4iDadOQvZ8XkOqwp7b8k/pBMGzsvBzUj7YVwvZV09sfCIFNSNvfNkIQjJYV7LbAaYOmLPlkYO4NEcZF+0AvxcQe3vtboh5qOr6k5xg3pyu1dXLP7cGRvts6FlqOqwngEWeIXK7w3WKomKQIJSPZDvkWQyusTTnTtgGOwSABNaQUhAcbFfMORGxlr0O06pqV/ZGvDJUxVZUL2JBk8DVAQD6XryEi2t2YDTbEVdwOUESyGN94YKohg+im42Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GvapmxS7nG1tXaBmeh3H6BkaJAzB/G8rx56otRUUB2Y=;
 b=WdTLY0Jg8g555y4Dx0JS+7hMxvXQ+j09ugPCZw5fPJfkshG4ZoKijo0Wo8A+DMLyX8Zzrda+FOXdc5hYC3MU2eT68abcWvG9zzl3OC9I88SsbktzgHBNJ/MKq4uLt70lGENScyJsCF9hYvOGcNUJQi3vQ3MwVhP7RNqtSXUVZWU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com (2603:10a6:208:e4::15)
 by AM4PR0802MB2180.eurprd08.prod.outlook.com (2603:10a6:200:59::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 08:27:52 +0000
Received: from AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b]) by AM0PR08MB3364.eurprd08.prod.outlook.com
 ([fe80::7440:fead:287e:949b%6]) with mapi id 15.20.3955.023; Fri, 19 Mar 2021
 08:27:52 +0000
Subject: Re: [PATCH 2/3] migration: Inhibit virtio-balloon for the duration of
 background snapshot
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: Den Lunev <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20210318174611.293520-1-andrey.gruzdev@virtuozzo.com>
 <20210318174611.293520-3-andrey.gruzdev@virtuozzo.com>
 <1892eefd-4405-705d-9242-50145c0d3fcd@redhat.com>
From: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Message-ID: <aabbd493-5610-f8dc-ce58-ae8fba3ab283@virtuozzo.com>
Date: Fri, 19 Mar 2021 11:27:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1892eefd-4405-705d-9242-50145c0d3fcd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [95.165.26.68]
X-ClientProxiedBy: AM0PR10CA0084.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::37) To AM0PR08MB3364.eurprd08.prod.outlook.com
 (2603:10a6:208:e4::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.64] (95.165.26.68) by
 AM0PR10CA0084.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 08:27:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696dd58f-ed80-48b8-4329-08d8eab0e32b
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2180780DB5C3294D2914A2F79F689@AM4PR0802MB2180.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:42;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wmKeO1hl++tEbaq1ByJnGH+yotveWW0h0qZN0WBS4MUQKKtl+ukzgzZMnfJW/NANCdohhtqNbwzIqMAcHjzYFx7MikXQOj72AVhAcMBQBmyzy1eMqnJpsvqKgJ8fqnSXCwB5DmO+vlcm/5F9kj00dEMgYQjCZWCXVwtmWNByUNSwrzUNmL1oH/f3/YDS7jGUrJw4wE2gULNR8x98bVM1fVnUIGRA4KcJusY3WBkMuU7LdwmMR8+PbeODNnhnzQIjlOljyUHPA0iZkd/1iS59cbaFARj60sYbYhNFaP1nC7YXM9X0h/KNxWB354bxoltTptD3ytFA3YsNbGCJjRHP0Ca/9CIFVSSopyRDcbBYf3ODoSTfVHw/yPBaN7A1orzV57kHqbbnZSd2aFgHpnkKW5ZM2GITHuxgzMf5ursw0XURLXy/dSl49D2TKck1GF3lOZoirso2s5UdSV3Tp7gDjJUIKi3piHhUtDfp/X02Ay0qQHH3lpkk2Wnm79H3n3bxlQ0b3rDDCdU6EVri8I2C9GREPQOzQ62FKA5b3HIw4F8Lm6aTouGo7LumQhDIxh2O6tqFbAnTPM0+v2w960qXATyKIte5TfYLaQROzCTVZnwjaIy9NeUVFTii9U+uM/bbBRMk8CtFoZsDP6LpZy8NfXgkR876iiVW6e/Jd70fkLwstRlao0/CP7/fV/CY8HIcKMOJX9sdpaHJoyRxI+A9Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0PR08MB3364.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(396003)(346002)(53546011)(8676002)(5660300002)(478600001)(52116002)(4326008)(38100700001)(6486002)(86362001)(2906002)(316002)(956004)(2616005)(54906003)(83380400001)(16576012)(44832011)(26005)(8936002)(31686004)(31696002)(186003)(16526019)(66556008)(66946007)(66476007)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?T0NBaWpFZVBZYU1iZmVSYkZSRFhpN0VodUdicU1TK0pTdWp1K1ZWRG5HWHZY?=
 =?utf-8?B?OHMvVWQrZ0VTNENxRURzQWludVRBMlFiTFE2aENFODRlOUoyeXFIdCs4bFF2?=
 =?utf-8?B?cGV1ektVVXZ2M1lFN2pVaHNGZmxreHNYRlVka081Zzhjc3k3em5mUVBCdjNK?=
 =?utf-8?B?WEdKS1NjMk1DaXJzNWRENTFIa2dzQ0RCOGVyRG5EQzRuekR4cGJ4djZEQVIx?=
 =?utf-8?B?Sk5sT3FiL2J2NzhDTmhJZnJXYnVJcE5LUDBRekU3anM5N3I2dWNwQWcreElM?=
 =?utf-8?B?ZnJHeFhMQTVndldvVFdmdTN3Mk1nK0RLaG56anI0WEpLektJaDdKZEtCam9k?=
 =?utf-8?B?Q2tyVE5saWkrNFpBSW1ybEUyMEpsakRXZWdjUkoyaS92VXJoYjM0b3lSTkRI?=
 =?utf-8?B?N0ZHYS9hMnZRZU9uVzZQSG8yN28yRk1jdWNOS3RiVGtmVTVmOWtQK0dyQVlT?=
 =?utf-8?B?a3V6SnI0RTNFQmkwcWtyUHdnYzVOV0l1RHNFWWhORlErcmlIVmZxbm4wbnU0?=
 =?utf-8?B?bFl1U1B2aTRkTGNoL3QwaEV5ME84WDZXSnA3akUxcTRLU1c2VE5zUXQ5NGxQ?=
 =?utf-8?B?YnpCa1A1TTR0bEJncS9pczY0ZTZtV08yVk5KTjkreVVnZWUra29FTWt3a1Fu?=
 =?utf-8?B?US9zQWVZdDhiaUt1dlhYdGRXQXoxRVVvSmhiTkZXb0w0S3JWcFhXZ1VXelQ2?=
 =?utf-8?B?M05TQURldXNjb0pjdlZFSjlhdjQwTmw3bHJCcWYxc3ZMczQ0aHdaZWF0dGow?=
 =?utf-8?B?eldBd1lKaDdiaFYwMWI0aHBsbDZLUzNlTzNoK2VlUkVyNGF3OGd5UHduS3cy?=
 =?utf-8?B?YURhL09EZEEvb2F3N3Jab0JFRWhHM09JSXlmQ0EwZzVuTmVqRkdJRXphd21J?=
 =?utf-8?B?ZG5zSit5dktmcFJqbnZiWXRTdWxzaGMwaUg5N1FhWHNKeUpMN29ZYWtzd1NL?=
 =?utf-8?B?Y1ZWQnpEa05NUXlwWTI0NW0vRzdoejh2eDY2WC8xUHI5ZUlsSWtLODY1S0g0?=
 =?utf-8?B?SDZ6WTNZdXExeVAraWh1dTBCWGk0Tlhock9pT0hnamZZSmFQVWJCU0dJc0hy?=
 =?utf-8?B?YklPbkg3a2ZBTjdKeHlCZ1lNNkRQbWdVUjNtSzlabC9qZmVndTNZa21Qcnli?=
 =?utf-8?B?Q2pXMDhLd1RwZWtyVFBSZm1HbjJnMDJZMW8xMnI5NzVwWjVsR0x1Mkc1UEJk?=
 =?utf-8?B?Ynp0TUw2Q3VjVWQrb1FjbmRaeUs0cUZVWjFqdVpia0tsbDEvSDJ4Zk0yZWRw?=
 =?utf-8?B?dm9KZWlHNTAramxKMXNtUFZWeVNlcjhsb1FTRnRUbEc3ekFYY0xocSt4T2tV?=
 =?utf-8?B?TVN2eHZITWdDalp4ZlNselFEd2Fsc25nUDJ6aGtUdGZOSjExRGZVVlBxQmwv?=
 =?utf-8?B?QkkrQkVIWDZjV1ZuZG1jeW9Lb2k1Qk5LSW5VMUozbnhNcHVJTUwzNUV6QVN6?=
 =?utf-8?B?N3FwZDVMRVZrT1BtOXcyaHRDY21TZ041bG9kU01mN25KbThqd2VpS1JjWHY0?=
 =?utf-8?B?Vi9ZUnpyVTlpTmZZWmhuZXZKVG83SGNZdkh4a1FYYlphd2xmckZIZGNRYkk3?=
 =?utf-8?B?MVhFdXdTNlhvaG91YnFHSHFQc3l1S1J4Rm9ENnpLWHkwRUFCNmdmeFlVVkFk?=
 =?utf-8?B?MzZWK3VIaFpXT1BvM08yZU1VYVRBdmE2c0hISDdSTmZkOExrTitaSVpteTY2?=
 =?utf-8?B?MmMxdVorOURPWE9Bc05Oc3lXSUF1VzZwYW02czBiZ0ZVZHVpbVlkOTVqNTdj?=
 =?utf-8?Q?8BlsExgDkfH7VXLFIxaXYkP3lwwmihh8wWO5eZy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696dd58f-ed80-48b8-4329-08d8eab0e32b
X-MS-Exchange-CrossTenant-AuthSource: AM0PR08MB3364.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 08:27:52.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PY5FDomZU8Z41YZb95pAuq9o1oyO2uYY/3HGotdYEGJN+Z/fOY0eyfu4dDjeDR9V0GeDmO7sMrYbqcQMSBFCXuoGV/WVwMVQrZOsedwx6Mc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2180
Received-SPF: pass client-ip=40.107.15.124;
 envelope-from=andrey.gruzdev@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 18.03.2021 21:16, David Hildenbrand wrote:
> On 18.03.21 18:46, Andrey Gruzdev wrote:
>> The same thing as for incoming postcopy - we cannot deal with concurrent
>> RAM discards when using background snapshot feature in outgoing 
>> migration.
>>
>> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> ---
>>   hw/virtio/virtio-balloon.c | 8 ++++++--
>>   include/migration/misc.h   | 2 ++
>>   migration/migration.c      | 8 ++++++++
>>   3 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
>> index e770955176..d120bf8f43 100644
>> --- a/hw/virtio/virtio-balloon.c
>> +++ b/hw/virtio/virtio-balloon.c
>> @@ -66,8 +66,12 @@ static bool 
>> virtio_balloon_pbp_matches(PartiallyBalloonedPage *pbp,
>>     static bool virtio_balloon_inhibited(void)
>>   {
>> -    /* Postcopy cannot deal with concurrent discards, so it's 
>> special. */
>> -    return ram_block_discard_is_disabled() || 
>> migration_in_incoming_postcopy();
>> +    /*
>> +     * Postcopy cannot deal with concurrent discards,
>> +     * so it's special, as well as background snapshots.
>> +     */
>> +    return ram_block_discard_is_disabled() || 
>> migration_in_incoming_postcopy() ||
>> +            migration_in_bg_snapshot();
>>   }
>>     static void balloon_inflate_page(VirtIOBalloon *balloon,
>> diff --git a/include/migration/misc.h b/include/migration/misc.h
>> index bccc1b6b44..738675ef52 100644
>> --- a/include/migration/misc.h
>> +++ b/include/migration/misc.h
>> @@ -70,6 +70,8 @@ bool 
>> migration_in_postcopy_after_devices(MigrationState *);
>>   void migration_global_dump(Monitor *mon);
>>   /* True if incomming migration entered POSTCOPY_INCOMING_DISCARD */
>>   bool migration_in_incoming_postcopy(void);
>> +/* True if background snapshot is active */
>> +bool migration_in_bg_snapshot(void);
>>     /* migration/block-dirty-bitmap.c */
>>   void dirty_bitmap_mig_init(void);
>> diff --git a/migration/migration.c b/migration/migration.c
>> index 496cf6e17b..656d6249a6 100644
>> --- a/migration/migration.c
>> +++ b/migration/migration.c
>> @@ -1976,6 +1976,14 @@ bool migration_in_incoming_postcopy(void)
>>       return ps >= POSTCOPY_INCOMING_DISCARD && ps < 
>> POSTCOPY_INCOMING_END;
>>   }
>>   +bool migration_in_bg_snapshot(void)
>> +{
>> +    MigrationState *s = migrate_get_current();
>> +
>> +    return migrate_background_snapshot() &&
>> +            migration_is_setup_or_active(s->state);
>> +}
>> +
>>   bool migration_is_idle(void)
>>   {
>>       MigrationState *s = current_migration;
>>
>
> Reviewed-by: David Hildenbrand <david@redhat.com>
>
Thanks!

-- 
Andrey Gruzdev, Principal Engineer
Virtuozzo GmbH  +7-903-247-6397
                 virtuzzo.com


