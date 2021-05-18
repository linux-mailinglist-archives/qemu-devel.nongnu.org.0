Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C20387B9D
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 16:46:47 +0200 (CEST)
Received: from localhost ([::1]:56230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj0zd-000212-Q3
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 10:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0lN-0005Rm-7v; Tue, 18 May 2021 10:32:01 -0400
Received: from mail-eopbgr50119.outbound.protection.outlook.com
 ([40.107.5.119]:23670 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lj0lK-0003uh-3E; Tue, 18 May 2021 10:32:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEzn3HRgvJZyS+Z0vGAMTT+bRQ0q7u/Qg9fzkUAkKXOo2vlRmsD3tz13rWsFX65/1/BxTe4ksLI1z+xNL1i86p9jhD5C6BSc+y8nATX2veuD/zZzp1uzMdbU6HJV0FSpoa9A3g3s5aICdQpZQ/0IzbFeGYDZ5ephamZ7lCpZkMOExyuRN6bEr3/eHtSsdcmI0WRxaYXoKyGtU7t6/nm80xWqRI6jOSFSYC0d9myM8MAVR5ZmJGcr3tpebi5FlKlOniMK76hRjVcLuq4+Cw9AiMPx4FwhwIAHlFto0qHWpa4C78WJvtFoDHJSabyIEkF33AzyrOV8lvBiAnrMdpz46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWWdd68ubgcXnKQTgHEzCbOcEU/5Pg0dK3IIPnkey3s=;
 b=GGS5/EpGKWsWtfn6BOSEuWLKt4I7F5oUmei+MDPfyFhPrtroQbTkDHzb2B1I9S48vrXcc2bs1o8bgaO7nwNG7oHTRha1zpCKrZHtBsTUIXXr8z+iZQi2yPMg6DSj3Qvg87D6G8RZvpRKQ8BECKrjCNL4nGEILmJSarVXCtX5/k1gtRbw/i4rmop4TQfubAYfTzEmiYhRgAl+zo+2jkK9Jq0Uy6cIhhbs4yCA3zoFI97q5ikrMlutm8MvoEovKUrxSacz3zyAE/B87rIxTm2YKLc10kUHzRX9CPwRzPtV9AEP63owLMC6PlJ+fjX84UsVfPwa4x5gTZv4UgMFPV1JLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWWdd68ubgcXnKQTgHEzCbOcEU/5Pg0dK3IIPnkey3s=;
 b=f3ynd3F+9b+ggEATTPuZxQxdEYtRBuW9QS9XKXppBibA1WcfYWb4Gf8a/5zBxTN3RANDSTnaH233yYGtaD28HZJASpC2Z04GVNSkXy0rYPCq6te1hzDcmcnwVd1Sdbp/S/rWZN8ACM6pmi1kUM84Nlh2Xp0xtZSOuTUhyKSmdxs=
Authentication-Results: openvz.org; dkim=none (message not signed)
 header.d=none;openvz.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6871.eurprd08.prod.outlook.com (2603:10a6:20b:392::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 14:31:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4129.031; Tue, 18 May 2021
 14:31:52 +0000
Subject: Re: [PATCH 17/21] block/block-copy: switch to fully set bitmap by
 default
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 ehabkost@redhat.com, berrange@redhat.com, pbonzini@redhat.com,
 jsnow@redhat.com, kwolf@redhat.com, den@openvz.org
References: <20210517064428.16223-1-vsementsov@virtuozzo.com>
 <20210517064428.16223-19-vsementsov@virtuozzo.com>
 <c3ef61db-8573-e648-80c6-0997580de8d5@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <0e5ea244-9c10-8dda-a2bc-4211dc401e9f@virtuozzo.com>
Date: Tue, 18 May 2021 17:31:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <c3ef61db-8573-e648-80c6-0997580de8d5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.215.60.199]
X-ClientProxiedBy: AM0PR03CA0030.eurprd03.prod.outlook.com
 (2603:10a6:208:14::43) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.199) by
 AM0PR03CA0030.eurprd03.prod.outlook.com (2603:10a6:208:14::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.24 via Frontend Transport; Tue, 18 May 2021 14:31:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 297b38b5-9d6a-4e48-932a-08d91a09ae1f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6871:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB68710C1E0083D2340F175CB8C12C9@AS8PR08MB6871.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oqr4THVBUgQERvfOeeVdGc3GXWzcesOnqpZXmA3zI0GeHCjk5244sl5iV13VlLGZzL2oowCO0mmlhjvHDWm9mr6gmF7wF3Hg5/RmO22ruC+gxJD05JiFxwQgzaOdQcJOifgTEFYYRYeAO0FdafVHLbWDX1/SJRQUnrm4+XLgkXxWAFH0Wyfh3PHmnIO+vabyIqRXPLmFVn5I3uhm2RwdUVUsUal+N5gAvUZyEaT/as4tKjJz1+w9RTvOoYZMyxOy6aP9I8+/VgJgu1pWBKwpzXGz4GpcBxv2iGqulO2LVLjBFlSc2DZ0AdUx7gE01q+7t7JjgEHx6AErnzjABm5m5aIRwaWX1Y86exO0J/xPY4Dj9CZXLwUGWmBuzVzwfB3/MKoJls05azfNQBDKwWNaMMGV6BR2Ti8EWYrB91a8Rv4bVizcm70MCbr6e0jpEG9om1m59Rgdo7P3OSDZ24k1VSmTA9ngYX4aP+TVGQ1adK0HKTEQ7yGdFbABaYqlWtJXHWnFOwnOSsBzmSR1yJFyn8mhZ2FZ01OfSSl6wk4CRr1Bea70DVC71EW3bv4n6wmuEiZYoqNPzoKGnLy+mQvDnCc1EfgJf5/moAfOC0QOJBIehEZpoHrKi2uWSMRQh49u3ZUZ5WD89guvHQlR1UZADd9O50bvaat1InMh5r7HyrJxXHpAbz29kNixr7Lk3xsy7VQ37LtBTJQk0Hb28gFGfbv6YNV7Q7BMzJaWMETlCaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39830400003)(346002)(136003)(396003)(366004)(956004)(2616005)(478600001)(26005)(16526019)(31686004)(31696002)(6486002)(186003)(66946007)(16576012)(38350700002)(83380400001)(7416002)(66476007)(8676002)(36756003)(53546011)(8936002)(86362001)(316002)(5660300002)(107886003)(66556008)(4326008)(52116002)(2906002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WDd5eWhWYnBsZVNXU2hlSnEzOTFTdjJ1M2xVdW84cE5aUkVQY0dEdlI2M2NO?=
 =?utf-8?B?MiszT1laL2NJWkFaWm8wZmtrREplQzVoUkw1VDVIdlZnbGlXSVBjZThtUk83?=
 =?utf-8?B?bUY2UVpyei9waVJMVlZRZDNYa2dad1ZWQUZSaHhkejhJbVZFM0U3YTJEOFhX?=
 =?utf-8?B?S2hkbXFwZTdlMnZDeXNkcUZEOEJBenk2Qkhhc3hqUS9KZHliRmNBNVRzcDNF?=
 =?utf-8?B?S2RJb1dJM29uY095MGQ5S2g1NGxGSWtMRThzQWpBbGhtbytiYVRFUnRWcWlW?=
 =?utf-8?B?N0FYVDYyTW5mNDc0YXVFQmtUSExWU3lzdG12N1RMQmlTcGlmcU9mdlM1c0VD?=
 =?utf-8?B?NTVSdHlWQ21aV2NqdEVIMGtHZjZ5aW9KKzVQeWRnNHFLWDJUNDdUWUFmK3d2?=
 =?utf-8?B?UEdZN3p4dDZFMThqZ2lYNGQyYXpjVnpBZzRZY0drVEFiMk1LMXVjZVNaazFl?=
 =?utf-8?B?K21WdzVqcjVXR3JMNWpsNDVIeTJHUjEwdUpqUzJFalYxVDRuSTNyUDUySU1S?=
 =?utf-8?B?T2NUcVA0OVhYejVvYkVyN3lVNGZ1YnVjdk93SkRhMkczeEVzeUZZNFdCQ2Uw?=
 =?utf-8?B?eW9iempzMXVkak0xcGxzeDBvM25XamtWQVNucnhTUnQ1TU1YRUdjd25QZEJJ?=
 =?utf-8?B?SDJJa1FpSWVjN3d0bE9yWEU5RVcvMFR4VE14VDhxc0VBd0lqTTlBWnNtRTNs?=
 =?utf-8?B?V294VFdyN2MxeEFwK3hYUHBjQU1FbzNWYXlBL0ZXRXJBTkR5NDBTVDhFckJY?=
 =?utf-8?B?eksvdkk3SCs2dXc3NE9xRkZmOVVheW5ISE0wTkduclNHM09aNEpoanYrckxv?=
 =?utf-8?B?MGVoVHAwMWhFbDh6bGV6ZVllT0V3UWFsaGc1dUlJQ3p0QWtuMXVoQURDb2lE?=
 =?utf-8?B?Rk43RithOUs2WkhhUUJlaThZMXlzeFRHaVFTdElJM0tuR1RaZ3pCUGNyclU3?=
 =?utf-8?B?OEhyUWIxTzFHK0lQenVhSW9NWGEwMG1yeUl2NXVRQnRPTGgzZ2xSa2Y4VGI5?=
 =?utf-8?B?c1JMS2tMMExzREROTWh1bDJtUEZrbkFNK1o5S1JWK0p0UkNPZzVUVjdldWhP?=
 =?utf-8?B?WVBOZ0RLQWVoNWluNExCTTBOQWM5K09YR3NMcWtHeWQ2OUNraXZ0Q29KV1J0?=
 =?utf-8?B?dVZOdUFIeEVqejNuenJWckNmS2dsUm42YVlkdlNFVjJ2aWUxVG9neGN6anMy?=
 =?utf-8?B?dXd0eWN6RU51V3J6RzNlbmkydS9SRmRXOVZWR3Fub2t1SW5uYkgrY3RKaG1Q?=
 =?utf-8?B?Q043N0g2SGdLTCt2b3Q2bldsaW1wZWVEM3MzRmZEd2FORW5yNzRSSFNXaWNU?=
 =?utf-8?B?YjVoN0U5SncxamlscE5DbWdFTm5sUE5JMHpnWWZaZk9IMGZjNStvZHRIalZS?=
 =?utf-8?B?Z0tKSlU5VElPeGZBUXFuMFNBSU50WDVQcUtxUUhwMG53amtwMDIyK0h3aTJp?=
 =?utf-8?B?a0hZUDUxczlZdUw0WFg3K21jaUlVYjVWTWpjZHJiMDIrYWwyd283MDdibm9G?=
 =?utf-8?B?UWlHS3liQUZKMk9YbCt1cVU2Q3QybFE1T2FlTUF1RXhYNUNia0sxOEFBcWxJ?=
 =?utf-8?B?NzZMdW9OQUNRaVJPcEljK3hIaEhKRlVSbHU5QmFLTERJSzdGQWM4WnJkYUxt?=
 =?utf-8?B?emNxQUdEaG5WaUFSUll3TngzajNaZ2ZMRkI1aWF1dFU0WWhXTXE2WDJWeG1v?=
 =?utf-8?B?bW5wTHFOcis0VUV5RzBiOTRxLzNVMys2OEgrOXdwTTJUbnFsTjRkMEh1MXFv?=
 =?utf-8?Q?qeNLxkt/WpM+VUOzb/Ae67JvbDmw0BhuSFOwWik?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 297b38b5-9d6a-4e48-932a-08d91a09ae1f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 14:31:52.8844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujWWJ2FVlCc25NbG6xmZUGbqHf1ftHevd8fZCPpXo2rABIupbQ2mNIcC0mJnEJnp4t7klYC70vHCFsp+7PsOXFy65apAiZIyL7kMsfAwRS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6871
Received-SPF: pass client-ip=40.107.5.119;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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

18.05.2021 17:22, Max Reitz wrote:
> On 17.05.21 08:44, Vladimir Sementsov-Ogievskiy wrote:
>> block-copy has a bit inconvenient interface around dirty bitmap: user
>> should get pointer to it and than set by hand. We do need a possibility
>> to share the bitmap with backup job.
>>
>> But default of empty bitmap is strange.
> 
> I don’t know, I don’t find it strange.  It expects its user to specify what data to copy, so clearly it gives said user a blank slate.
> 
>> Switch to full-set bitmap by
>> default. This way we will not care about setting dirty bitmap in
>> copy-before-write filter when publish it so that it can be used in
>> separate of backup job.
> 
> That’s a valid reason, though, so:
> 
> Reviewed-by: Max Reitz <mreitz@redhat.com>
> 
> Still, I find it stranger this way, because I’m more used to “initialization to 0 by default”.

When I started to test this series it didn't work, because bitmap was not initialized. I fixed it and call original behavior strange :)

Probably better to keep block-copy as is and set bitmap in cbw_open. Backup code should be modified anyway, as it will get the bitmap after initialization in cbw_open.

Next step would be support for bitmap in copy-before-write filter anyway, and this place will be changed again.. So, I don't know, but it's not important thing.

> 
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> ---
>>   block/backup.c     | 16 +++++++---------
>>   block/block-copy.c |  1 +
>>   2 files changed, 8 insertions(+), 9 deletions(-)
>>
>> diff --git a/block/backup.c b/block/backup.c
>> index 90cca1ca30..706c54fea1 100644
>> --- a/block/backup.c
>> +++ b/block/backup.c
>> @@ -233,18 +233,16 @@ static void backup_init_bcs_bitmap(BackupBlockJob *job)
>>       BdrvDirtyBitmap *bcs_bitmap = block_copy_dirty_bitmap(job->bcs);
>>       if (job->sync_mode == MIRROR_SYNC_MODE_BITMAP) {
>> +        bdrv_clear_dirty_bitmap(bcs_bitmap, NULL);
>>           ret = bdrv_dirty_bitmap_merge_internal(bcs_bitmap, job->sync_bitmap,
>>                                                  NULL, true);
>>           assert(ret);
>> -    } else {
>> -        if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
>> -            /*
>> -             * We can't hog the coroutine to initialize this thoroughly.
>> -             * Set a flag and resume work when we are able to yield safely.
>> -             */
>> -            block_copy_set_skip_unallocated(job->bcs, true);
>> -        }
>> -        bdrv_set_dirty_bitmap(bcs_bitmap, 0, job->len);
>> +    } else if (job->sync_mode == MIRROR_SYNC_MODE_TOP) {
>> +        /*
>> +         * We can't hog the coroutine to initialize this thoroughly.
>> +         * Set a flag and resume work when we are able to yield safely.
>> +         */
>> +        block_copy_set_skip_unallocated(job->bcs, true);
>>       }
>>       estimate = bdrv_get_dirty_count(bcs_bitmap);
>> diff --git a/block/block-copy.c b/block/block-copy.c
>> index 9020234c6e..4126f7e8cc 100644
>> --- a/block/block-copy.c
>> +++ b/block/block-copy.c
>> @@ -296,6 +296,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
>>           return NULL;
>>       }
>>       bdrv_disable_dirty_bitmap(copy_bitmap);
>> +    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
>>       /*
>>        * Why we always set BDRV_REQ_SERIALISING write flag:
>>
> 


-- 
Best regards,
Vladimir

