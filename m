Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFCF48097B
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Dec 2021 14:18:20 +0100 (CET)
Received: from localhost ([::1]:35640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n2CMt-0003FU-9U
	for lists+qemu-devel@lfdr.de; Tue, 28 Dec 2021 08:18:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CLf-0002Yi-T6
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:17:03 -0500
Received: from [2a01:111:f400:7d00::707] (port=2486
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n2CLT-00082Y-M0
 for qemu-devel@nongnu.org; Tue, 28 Dec 2021 08:17:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTFaKOqjo/0StuOdcgijDzWnUe6/gZuTh28K+q0LK5XFvAT5wabaaV3vu4G8aJ1Clg/OYpIhHb7Ck532W22oVgZkiZ6ZgqGDdtHuSK7FIencdel9eNpU2NCFGz5QNj8AZC4Ob8i68VLLz/9/EwTf5ywmIuZW8yQ4tN4SqefUv2IyMmeuaYTp4ZDSiRznE4SUDxk3m54c4yVs6orGOr8EfR58C9rES+CzTUU70Gw/M4g+fA2O9huEnyMCog+LP8Dih9KP37JVh7d5boLyY+OSXaJj/2jRLwc8uwHbMIMpIB7xTzDkqMngCCYUWH60NQ9qKzCqvp4EjNAIY77yoXRs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2M0ty6uxlVBBQVop7HoTY18TqPOIGQaJZmy67+5I7jA=;
 b=VcCCrjFqeYEYc7Xtg+4UB3k96JU337PL0NlOb2eN/PhWcnqHau9DanzwO2UGv6kTJ1uSGgxwGCpox7a6CbdzQdHzCoi10AN3x6YSVrKLJThkL3RponaHNcvLhvK+VRRLjn3PhWwihIqAsLMYr9qn/O5ez1+Hk1kF5/vG4/KK3MQvCO9Pjpg7K3KBnsyqfsvxsnGf+IHVgRaYsUK5Gn1H0SwNYPYjLuovBAN/ipa0KI4d0PGyZSUAzh1JG2WHUJXHUuqf1AO4+ghk+rOAduAb7htsNhDDZOOMpWdhLw6LD2xgn02LT0FGscLhXLyKEIVJLM+7wWWvHBHSX2JQroOvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2M0ty6uxlVBBQVop7HoTY18TqPOIGQaJZmy67+5I7jA=;
 b=ugkvMGFgfvtxUtrgesJ4N7mxbQ2vr9L0X/Hs2Qva3k6eOYGZZw0IfoLQJuiahw6pLocZRw/ok3ybmwHkcyT/b4TraNgkb2aOaR5JKuEeemUmj7cxotn1d9IKlkiaXuGjKcBW6JgCKVrQOemrbaaWN3BcBmW2tPQmu9TzpgppcO8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4435.eurprd08.prod.outlook.com (2603:10a6:208:144::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.19; Tue, 28 Dec
 2021 13:16:40 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.023; Tue, 28 Dec 2021
 13:16:40 +0000
Message-ID: <59c6a7b3-0de6-c7d9-5234-e6401347e077@virtuozzo.com>
Date: Tue, 28 Dec 2021 16:16:38 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 4/6] migration: Add ram-only capability
Content-Language: en-US
To: Nikita Lapshin <nikita.lapshin@virtuozzo.com>, qemu-devel@nongnu.org
Cc: quintela@redhat.com, dgilbert@redhat.com, eblake@redhat.com,
 armbru@redhat.com, eduardo@habkost.net, crosa@redhat.com, kwolf@redhat.com,
 hreitz@redhat.com, den@virtuozzo.com
References: <20211224111148.345438-1-nikita.lapshin@virtuozzo.com>
 <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211224111148.345438-5-nikita.lapshin@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0069.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f72435-6245-4977-0438-08d9ca0448ff
X-MS-TrafficTypeDiagnostic: AM0PR08MB4435:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB443530F2C9888AA595806C5BC1439@AM0PR08MB4435.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:376;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dyAle1c2y5OxRK0yg6Bpcq5+yi/ih4a+TmJB6J0e5HDwa0u64qfmRE+tdHIAeZ/XjnqTtNwmU4vonUxyL8dt4sZKoOm2im1v2QNaFwnHgGL0PoCYekSrdXqPX9wSw7yjbUuvzRXv+NTpJiGjPu175emjshrd5ijVqpVu1Yg2oNwR6AVmHXs8XqkkxwjWmttdJ1+02hmrV0VQHSR5GiQVUm7A0kfsTnwViCd5MrFwAckGXeqoDCF088MNMYQT1E/v29Ylfhcxqipcu8rj7rctF1IUEW+YyKlAiRS8lN6e/jbfoLvKRta/Vjtm2NiRkJ+w7H1pAXc3ciikEThalh5soZ/aHJgOexOttnLBhgC7w5ZCI+4yhVVH48GdgyVFBpoRuCtEuzBg8WpEGjTm5DPcVsbsgO7Pcr0f6OXAWQKD2HYILucEB1Fcls8R0gAINUU/JiQn86aNtNuEWhci0Dc2B8Pb2NhbbDAeOPOYlZRrAdO7hgV0nqbOsvyuimvdLFZEvwwW2fPd4c+tSo68wH2j2GVf6N9Nl9T5eYGyaiXouEulx5icsCDyyQqWCpxhBy3neH8wkDYZGNxMcdCCteKxlQiyo2HM0nVBdHdI09w9IcdqRDyJaJcub4NEr8dpPlSJxfEOmA5cKeuf0Us22Ih4pThT38Qkj62DvCDX004h16R7j6rsstAbtlqD/n35irC++bisU5+qTbOpYTAfwjE2cPGG+AUD5qVucY5TQ/1Kb8XHagiRNjaqm9QsDrtGlDUn2AqwGaX7Mw7wxXosA5cJKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(2906002)(66556008)(6512007)(8936002)(31696002)(26005)(52116002)(36756003)(38100700002)(38350700002)(6506007)(316002)(66946007)(83380400001)(2616005)(31686004)(186003)(86362001)(8676002)(4326008)(6486002)(508600001)(5660300002)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUVGdEUrOG05SFltRTVkLzQzU2pDc1grQmNCV3ZlSXBjNnlGYUl3OVdPQzlq?=
 =?utf-8?B?MjN1UGZjUzlFMjJPWXZLbkwyWGxiYW1qUDFORTgyUmpydUJ1QkhqNFdtU1FQ?=
 =?utf-8?B?L3cyV0s4cUFIeVp6RFVNODN0QzlVT1k0SmsxTkFlZ3RZTmo2MXRyY3dscjht?=
 =?utf-8?B?Q0Q0UjA5VWxJVjdKMlkrakpkUFNRcmJUWFRNMkRybjZvbzFlU2paaTdQZWI3?=
 =?utf-8?B?OUxtbEhwcDV1YlFRN2s4MFc5dHhWKy92N2srd0svVWY2cTlUQ2ZXc2pDNXVz?=
 =?utf-8?B?eGVCaDBNazRBb0JJQUhPM09henBIeTgrTDZPcHZwbmM3dmt2T3VaSU96bDY4?=
 =?utf-8?B?NEY5NlFCNkFQVG9SdVJ4ZVRoUjEyQk1jK2ZKbzdGUUMzekpkU1kxeHZxL0tU?=
 =?utf-8?B?d0owMHV3d1hVK3BuV1JiaVJpMStTWU9wVkJ5T3BUNmRvT1poMnZGOXVRNjhp?=
 =?utf-8?B?WkxmSDBKRGgrNHVqQkp6UnVqd0o3Q2Y1cWNwTjBWbSsyQUZiL0ZxbjdOR3NR?=
 =?utf-8?B?eitWelBvS09PSlY0dmhlYVdzWUdjRit6Tkk5YmdMR2hjTzZyVFcyMS9aajRE?=
 =?utf-8?B?bkUyU3YwUWtpWHllcEdvRERMTm9XVERIODJXZkZBVlI2ZDA3S3BpUDlsNVpV?=
 =?utf-8?B?OEtGK2hVc2ZoMHBwaTdkclcxUTZOaTI2aHJlUHN5Wk9iUzBPSk1vTDY0TWhz?=
 =?utf-8?B?Z1VWSHJQTHlxdE1JVWJHaFhsUjhxSUFDYTJNdkJ1K2JUWjZFcWR6RHY2OU43?=
 =?utf-8?B?UzlUWjVGMUMrVHpaRU1TTXh6UGdXd3hia21haTJqTE1HQmVWSWVXeFpVaXJr?=
 =?utf-8?B?Tms2N0tsTnFGVjY3WVFkcDlTaVN6WUREREtZcjdHbFFCWENNZS9TUFpMOCtB?=
 =?utf-8?B?cVhOMEUweVV1VEU1VlY4c0tmaUJOY1R6Wnd0UUdjb3FkN1NaaVBEV1VvV0FC?=
 =?utf-8?B?UVYwYWVGOGlnZjl4SXpNaEhBQ3E1ZlVWeWdSRit1KzRpRjI3ejFHVTVjdHc3?=
 =?utf-8?B?ZGZhc1hIV0wrVk42MmdsWHprQVgyNUpmazkraUh1V0Q5b3kra0syZ1NkTG1k?=
 =?utf-8?B?a2Q3UG5hcjczbng5VzRLYXcxa1lWMUdnNTJXK1NWRU1GbExXd0QvTytyUEc0?=
 =?utf-8?B?TDB1cHUwY0E5NldkbTFPcms2NWZhSW5mME5oZWRwNHBBOCtNZGFsN3NjaGta?=
 =?utf-8?B?RmNHU2lwVjVDSnVob0lGQVZjck1PRVNQVld6TUkxVmFEMU42Ung5UlE1WEhT?=
 =?utf-8?B?MkNGT0lFSnFjaE9oRENWeU1lVUcweDBWTk92c3BZZjQwMXJkY21LYS9tNmh4?=
 =?utf-8?B?VlRlQWJRbzhVMGR3MURHakZ1WUxCTC9TalNaZnhLV0lDbmNDZW5tTzJLT0lO?=
 =?utf-8?B?Z1lSUmt5TEVBZk13UHkvOTFNZEZUdHdWMFA1RDc3STBRS283RjFENzBmcEwx?=
 =?utf-8?B?UGxQWVU0UUhYYjBUTGF5NS9iV2k2THRiaTlFWWVFMGhOeXJtajBOUmd2TFNL?=
 =?utf-8?B?NUloa2Zud0tEeUl3UEJBZlEyajRFS0tkZkxNL2pJNXZZVkdPNGFzR2t2ZFRQ?=
 =?utf-8?B?UE5aaUhKM3grM0RGSHpsRGVkc0JRRldscnN3SC9mRWRqTkNPaHlWY0poV2Rt?=
 =?utf-8?B?Y1kzcTBKRVhJWFREdCtYVnV3WFQ5aFFabEdCVm5pcjU3M1Y3TW4xL1JEb0JI?=
 =?utf-8?B?VG1KMDEwaGZzUHVVdHZaZDNlZUFuc29kTlVGZTA2a012M3FINlNNVy9IZFhx?=
 =?utf-8?B?Ukp4THNUQWhDaElLQm11dlNCY3JNblZIeUYrN2U4QlI0UTJyb1BoMEtWQ3pk?=
 =?utf-8?B?NlJrQTVhYUVzTmZNR1RmaURWSy82MlBxNDFuR08zcktYVGVGaHpaR1lWTXJY?=
 =?utf-8?B?c0daUU1YODliRWJqM01iU3YvbmlEWU9BMWRjNm1mOW0zMEtOV2NQTmJmMHlW?=
 =?utf-8?B?cmZRSlBjZzB3ME00Zk1YTnZwemYrTDhqQUlLb1c3V3J0RHpYWUk2MGFFYjhK?=
 =?utf-8?B?dFlsRVVqOEZmaHdzRXhHdjZLU3pzemhaVkRtNjlScmdOOUw3R0ZKRE1KRGd0?=
 =?utf-8?B?WUtnNDNpbHdVSGhYcGtOQ2luYlQ0Mk03aWRrc0xwVjN6NmdzcTZ4VGdDUDdr?=
 =?utf-8?B?RmpReHZsWHdTaHhFOGthM2lDTlEzMDczWWxza2JOMk9pdXNQb3BEdi8wQkYr?=
 =?utf-8?B?cmVRa3Jyc0FJU3FsbnM0L1BsMzcxK3RjbzhJWFc3VFU3UE1ndE9LTThwMVJx?=
 =?utf-8?Q?u3xfgNw1QbyIOcY0JJsg8Sc7Bfa6eTtlxe9fKz9CcU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f72435-6245-4977-0438-08d9ca0448ff
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2021 13:16:40.4394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EqK6VmIQDm54MzK6Oos87YlyQsueN51GsGHGDsuJy3j7cvkpMzB1to5erWWXArgh1irlE9+ac/0YpADp6n7HaMV4bPQyU19ehGZs8gRa2X8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4435
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

24.12.2021 14:11, Nikita Lapshin wrote:
> If this capability is enabled migration stream
> will have RAM section only.
> 
> Signed-off-by: Nikita Lapshin <nikita.lapshin@virtuozzo.com>
> ---
>   migration/migration.c | 20 +++++++++++++++++++-
>   migration/migration.h |  1 +
>   migration/savevm.c    | 11 ++++++++++-
>   qapi/migration.json   |  7 +++++--
>   4 files changed, 35 insertions(+), 4 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 006447d00a..4d7ef9d8dc 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -1257,6 +1257,14 @@ static bool migrate_caps_check(bool *cap_list,
>           return false;
>       }
>   
> +    if (cap_list[MIGRATION_CAPABILITY_NO_RAM] &&
> +        cap_list[MIGRATION_CAPABILITY_RAM_ONLY]) {
> +        error_setg(errp, "ram-only and no-ram aren't "
> +                         "compatible with each other");
> +
> +        return false;
> +    }
> +
>       return true;
>   }
>   
> @@ -2619,6 +2627,15 @@ bool migrate_no_ram(void)
>       return s->enabled_capabilities[MIGRATION_CAPABILITY_NO_RAM];
>   }
>   
> +bool migrate_ram_only(void)
> +{
> +    MigrationState *s;
> +
> +    s = migrate_get_current();
> +
> +    return s->enabled_capabilities[MIGRATION_CAPABILITY_RAM_ONLY];
> +}
> +
>   /* migration thread support */
>   /*
>    * Something bad happened to the RP stream, mark an error
> @@ -3973,7 +3990,8 @@ static void *bg_migration_thread(void *opaque)
>        * save their state to channel-buffer along with devices.
>        */
>       cpu_synchronize_all_states();
> -    if (qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {
> +    if (!migrate_ram_only() &&
> +        qemu_savevm_state_complete_precopy_non_iterable(fb, false, false)) {

Here... [*]

>           goto fail;
>       }
>       /*
> diff --git a/migration/migration.h b/migration/migration.h
> index 43f7bf8eba..d5a077e00d 100644
> --- a/migration/migration.h
> +++ b/migration/migration.h
> @@ -359,6 +359,7 @@ bool migrate_use_events(void);
>   bool migrate_postcopy_blocktime(void);
>   bool migrate_background_snapshot(void);
>   bool migrate_no_ram(void);
> +bool migrate_ram_only(void);
>   
>   /* Sending on the return path - generic and then for each message type */
>   void migrate_send_rp_shut(MigrationIncomingState *mis,
> diff --git a/migration/savevm.c b/migration/savevm.c
> index ba644083ab..e41ca76000 100644
> --- a/migration/savevm.c
> +++ b/migration/savevm.c
> @@ -249,6 +249,7 @@ typedef struct SaveStateEntry {
>       void *opaque;
>       CompatEntry *compat;
>       int is_iterable;
> +    bool is_ram;
>   } SaveStateEntry;
>   
>   typedef struct SaveState {
> @@ -802,6 +803,10 @@ int register_savevm_live(const char *idstr,
>           se->is_iterable = 1;
>       }
>   
> +    if (!strcmp("ram", idstr)) {
> +        se->is_ram = true;
> +    }
> +
>       pstrcat(se->idstr, sizeof(se->idstr), idstr);
>   
>       if (instance_id == VMSTATE_INSTANCE_ID_ANY) {
> @@ -949,6 +954,10 @@ static bool should_skip(SaveStateEntry *se)
>           return true;
>       }
>   
> +    if (migrate_ram_only() && !se->is_ram) {
> +        return true;
> +    }
> +
>       return false;
>   }
>   
> @@ -1486,7 +1495,7 @@ int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
>           }
>       }
>   
> -    if (iterable_only) {
> +    if (iterable_only || migrate_ram_only()) {
>           goto flush;
>       }

[*] ... and here you care to avoid calling same qemu_savevm_state_complete_precopy_non_iterable()

Seems better to check migrate_ram_only at start of qemu_savevm_state_complete_precopy_non_iterable() and do early return from it.

>   
> diff --git a/qapi/migration.json b/qapi/migration.json
> index d53956852c..626fc59d14 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -454,6 +454,8 @@
>   #
>   # @no-ram: If enabled, migration stream won't contain any ram in it. (since 7.0)
>   #
> +# @ram-only: If enabled, only RAM sections will be sent. (since 7.0)
> +#
>   # Features:
>   # @unstable: Members @x-colo and @x-ignore-shared are experimental.
>   #
> @@ -467,7 +469,7 @@
>              'block', 'return-path', 'pause-before-switchover', 'multifd',
>              'dirty-bitmaps', 'postcopy-blocktime', 'late-block-activate',
>              { 'name': 'x-ignore-shared', 'features': [ 'unstable' ] },
> -           'validate-uuid', 'background-snapshot', 'no-ram'] }
> +           'validate-uuid', 'background-snapshot', 'no-ram', 'ram-only'] }
>   ##
>   # @MigrationCapabilityStatus:
>   #
> @@ -521,7 +523,8 @@
>   #       {"state": true, "capability": "events"},
>   #       {"state": false, "capability": "postcopy-ram"},
>   #       {"state": false, "capability": "x-colo"},
> -#       {"state": false, "capability": "no-ram"}
> +#       {"state": false, "capability": "no-ram"},
> +#       {"state": false, "capability": "ram-only"}
>   #    ]}
>   #
>   ##
> 


-- 
Best regards,
Vladimir

