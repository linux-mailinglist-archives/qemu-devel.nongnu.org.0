Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1437B595D2B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 15:23:05 +0200 (CEST)
Received: from localhost ([::1]:46280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNwX8-00033N-Qh
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 09:23:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oNwUx-0008NW-QU; Tue, 16 Aug 2022 09:20:48 -0400
Received: from mail-eopbgr70105.outbound.protection.outlook.com
 ([40.107.7.105]:34179 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oNwUt-0001lN-DI; Tue, 16 Aug 2022 09:20:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uk1e2V0jN8WzSkpAY+gZnVMeZ9WXjNZyk9I1a7gR21zcWh5aUYczrid8CIwxycj112MRAy9j6a1+6sYR4AY9e80Pa5ykBuAGK8+sYWSsviRBnDTRY9hbQyRklBedDx4445MDVC7R4uIlGlId5adNiE7KTmzbfZHxjO+ecR2r6aQ8kauwFafsXxb6CTAIUXjNBQycHi1Rq1H7JOump2r6LtSFqdjW81Wjhl/Qygk0O1qixlBmUBNgZyUDMl/BDQKGxFPgxXpGkrZ+vQL2X8Ts8XWpRG32au0ome/sXGKbRt4eX2cGM824xf8m1a2qTiGrCez2PCXNrxouwnYj9hRDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUiMa+5cVaESqnF03D9QvKUGMtQcmOWIObEi/E5/0/w=;
 b=NqxnZAFKxVao6qGdTU6qqJiIuaMmzFGEPexoIOzu9MITjq4wo8+gb0kRQjZAqZ3J4mjADRKPJtgfsQ9dg39fEBopckaZ34go57oXsXSirraYZtREQoM2OPUAmukDXLcfFuJyob8UbVLTB35OtwSvgy2Hvfota6mu4qr2VJvR6r1xhX7zyLyyNmYAwDlmbCEt3LhcPp7I8KxT/pjtO/VXjh70nJcV3eVDs3ZgQdFSgbfVl4ipfA2v7TFaWinLu6TfdL0IKoKNrR9PFzeqdTx6+Z1wj8YKxSdhg2FmKMFBcTwngevZkyyJMF7SDsx6Qi192GVIsBuXBpusAVSxyA62YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xUiMa+5cVaESqnF03D9QvKUGMtQcmOWIObEi/E5/0/w=;
 b=LxEozEFeChNIPnWCu8u+hxJU181KaE0psoEYwvE4lTuPRUAM+BxaKX1h8TsG+4S3mgBuAp0a7uT22homqHXuLWN8sd+1QJnAM/u7Dv5/tqqDYwXzDVypr1ZM3Nh9IsNJtFTWM/Azk3qWO8FqnSNHTZcDbewVVeHyJV7GiFO7uN/AhxW8ky8N5oWPUVbnPHDBF3QElUkYJg5sOMw7+OtHcUbNkR+ydKE4k2VKBykfh4i4tzFKkFKrxuZXyfmnD8U7PgAAnitwT9sBZuXY6jGKSWS7uKmP9uukqnJOVVdFAeXKCluoqCZ2EcLiDBF3ylKNQPZJhNzs3WPkonxFow3MzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by DBAPR08MB5591.eurprd08.prod.outlook.com (2603:10a6:10:1ae::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 16 Aug
 2022 13:20:36 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%4]) with mapi id 15.20.5504.028; Tue, 16 Aug 2022
 13:20:36 +0000
Message-ID: <4a0a94f4-81e2-370c-bfc3-50256340a7bf@virtuozzo.com>
Date: Tue, 16 Aug 2022 15:20:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 0/8] parallels: Refactor the code of images checks and
 fix a bug
Content-Language: en-US
To: qemu-devel@nongnu.org, stefanha@redhat.com, vsementsov@yandex-team.ru
Cc: qemu-block@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 Alexander Ivanov <alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0024.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::37) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55f3a738-5463-4e53-7634-08da7f8a1b20
X-MS-TrafficTypeDiagnostic: DBAPR08MB5591:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bjnQIBwDzhLE7m4GASHoqHH/+cVd97j40eDLWzpyG9Tkkc3uUKpigUUBVJ+72MfCM8b5jdSO6CyFanfFI2UduTjuZrUCH2aQF7I1b4souDZc6VhFsE6qPhpGNpEbMZQFz72NriUeuSx9q7cEO6vV/HR0gJ81XlB+h1YYFQgHZsZI3MukAuFuKKIixQpXfMs6WcNogZ0BBkwyL4Nugs5LlIjRD28+HuZbpN2SzM72zrsbpYwZqa4cFM1R6nQVlb1TLj5Bzk9xIGKZANtrt80mD3/ALlgZbPt7sCviu+29cvnLOmEcSq/HbZrAmYahq0PPPZCNKFNWGdv1UfEp7nEDgF++3KjRPfDIbEilLE8uLPzMTtm0lQhRkmMYrjE9zHUPBB7j51+B6skOdSQJSUCK3NF9hr2+fHSQIyti80kK/FI+Y/vanpswtGhaBrTigaPXMzmyt8GchYI6UcQHTGq0CHtbtSHEJH/oWxL++xX8bC25C5iG8lgRYR3F/K6mtVTljbvZSsmCTdHWPV58nIb4rvAZ/7nveOAkSoq14ix+N07hbUpSdph+69s79nNQDNFnxYX/A9LNriBrgKk4E+fzXIIFVWkQNbKQjEjYAvg9kVMWpzGToKRrTYVBgbA52RoFGjBH5bHLVMMulbOZfd3CRHGVmLgNO8+aiW7cNoKY0snA9E/qRjokef2E9RcLyHraXRLyRIJh0K2kZ3fE0ZvdhgqXbJOmRCwKqs6UxpUq56NvKWWS7WWWy6EPmkPU9RROpYTPh9NZ/cx8lus6mBn54rTnuYNSzWzE3E6BemztkrAbBrYUyvGf8bBItPo1O87g0rHXA3e3WahC3cFgE6WnOGAivVQkYkZrzpbuX1FuCkfUQDzAW3TU00A3fZ/V5Sn3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(346002)(39850400004)(136003)(366004)(86362001)(31696002)(83380400001)(38100700002)(4326008)(66476007)(38350700002)(8676002)(316002)(66946007)(66556008)(2906002)(5660300002)(8936002)(6506007)(26005)(186003)(107886003)(2616005)(36756003)(41300700001)(52116002)(6486002)(478600001)(53546011)(6512007)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWd6enJ4Qi9Da29IL2ZydzF3UWFQU0I1YW52YlM1Ujc5YjBrVFgrTW5CTTha?=
 =?utf-8?B?cXg2UDNWUHNaN3ZwUjVzbTdpSlErcW9aQkJDL1ppZUhOOE5sUVRPUWt1c0dG?=
 =?utf-8?B?MWZsNWlxbXc1dGh4a3l2UW9IY2VMczdjU0hxSVExdHlid1BaSjRHU1p2TUVx?=
 =?utf-8?B?RXA4VTkrSW1pUW91OVFuMEJwQU1ueCtYeVE4ME5kZzdPTW9nb2lua0VydG80?=
 =?utf-8?B?NjVCVWxVd1I1ZFlhWlZSeU8vMGRRbnhHUjdGdWxwUXd4WnI0VkxZTlJxc012?=
 =?utf-8?B?LzZFK2ErV0JaVFdBVzlBZUsrck12WVVHRmM0NmdWZ3g2dFFhRUxOS1V1SkN0?=
 =?utf-8?B?djlkdW14ZjVkSlRGWjJCMHgvWVk1RVg2OUZZZDBRL3o3aGFKTEluckFjQzRY?=
 =?utf-8?B?WXRLUG1IM0Qzd3krZ2U0VldySzBXZC83UExVTk4yTkgyb005Z2xOcXQyUkZP?=
 =?utf-8?B?NTRiS2dJQUJFTW55dDdEZzhiMk45OFlXWklubVJ6N2hqTkw5ZEtLdmFxSnpB?=
 =?utf-8?B?b1BzdS9YM0VXR2lyYTJvYlhFNGNiaFE1ZzdVSzBYVmw4YjdFL0NVRnhEeXZQ?=
 =?utf-8?B?SXJtdzZOZktNVFo2djdtaVdHK2diQk9NemJUM2puS3EySlFyN0ptQ1dsZG5h?=
 =?utf-8?B?VWNhQXdKZTJGcVZ6cHlzSkZ4VVM0VWlXa0FGRmE4WEtkaHpSUXc0d0M0YmRK?=
 =?utf-8?B?VHVuMmlFc2lZRTZ2dE5pUVlHSWtWTEVKeThPV0Y4MUdXU1RXVkR5Zi9uUDgr?=
 =?utf-8?B?aXN2WitOKzRsR01JdWw0ektrUko3VExhM2svUnlOTFZ3bmg4bjI2eDJzSGlp?=
 =?utf-8?B?Y3pnMHJORW9vckZSV3NwcjlMQ1AxZWpvMFQyOStiajEvUFNrN05rdWVJZU9j?=
 =?utf-8?B?QW0wNnR6YTQ4K0N2MDM5VkJ1S25LQnlxN1N6Q3k4QW91WVVqQjB5aFg0V1Vx?=
 =?utf-8?B?ZkRiMG1YblJ6K3FuRENMSHVKT1VoSmtadmRQLzc2eFRBY1BXRFliVTY1Z3JF?=
 =?utf-8?B?ZEVvSTBSRGs3K2ZjZ09GSWc2N3ZYNDRFcU8ybVBtV1RTYmsydE1pR1hYbmxk?=
 =?utf-8?B?Zm5NQ2RaalYzdU5qbDVjaDBwVldrSFRxc1YzMmdUZ3YxOWliaWo5NDUzMkZH?=
 =?utf-8?B?cjd3WnFjS1lGNmJlZnRIZXIxWVM5cytQY0RpUWVoVS8wc0hRY2lFM0UzUTdM?=
 =?utf-8?B?SnFva2d5bDArTmx5YTliTVNmQ3YvR21UcElEeGF0M2FyTHVHa0t0aUNPSHJs?=
 =?utf-8?B?d0RYSzBKUUcwOTBXZEZHZ2hXOUplK1VGdXZZWVNKMnNGbWNWOEE3QVNvR0ZL?=
 =?utf-8?B?alNxblkvNXdsZnh0KzdoRnRRb0RueHhFaDZtTVowSnM1cENHa016M096amdE?=
 =?utf-8?B?UHYyZHVLU0F0NEliZ2YzbVM0OFFIblNWUzJDQTdmVnlPMTZyTUlobkpyMlBw?=
 =?utf-8?B?MVl4TjNabjRUMGpjdEdnbjlVY2lyd25yMXAzc1dETEVrd2ZhRVFPTVliMFV5?=
 =?utf-8?B?U0ZlV1p2VmpLeXM5aEVnSkxxSWpHTFhUWEU0V2diVHZUYmwvZnRySE5WeWgy?=
 =?utf-8?B?MVBaY203UENGV05QSnFtRFN6SGY4c1NCTll5eXFTRDNoL284ZDd0ZjR2T1Fu?=
 =?utf-8?B?UkFJbFdtS2E1YkFMTEF0d1dXQW9vYUtwV2JqajQvNnVBZDNZTFJXenMxVVky?=
 =?utf-8?B?Z3llNFJZaUQ1TGN1aEFvZFFtZkprcW1KeU1salA5ckRJM1VtcWllMjR2ZW5U?=
 =?utf-8?B?bjkvcWE0OEgxVUZtSjVIYlVybU1qWGxpTGFFcURaNUhXeWVKZzNSZXZwTHVQ?=
 =?utf-8?B?WVFHcWZHcUxLN1NTYjVTT1F3VHNycTJTVll2U09JMy9DdFM4aExUYVNkcGJp?=
 =?utf-8?B?cW1kT2JhdVA2VThsN0h6MnJxRmN5dm12cWNhMFRjcFBQb3B5VGc5NExCZnY0?=
 =?utf-8?B?TGZqY3hhNWU1ZzlVMS9rVEZ0RUxvRktkNmloQW0zaU9qMWlIZ1A1STBpM284?=
 =?utf-8?B?V1VzQUl2MmJ3czFsWG1CbHZwWGFzTVdpdXdQcHg1alh5amZybHRuUEc3bTNX?=
 =?utf-8?B?NzRQaUJ6MlE2MkNkUmNaTlVpckRYQUUwN3BqZGJobDdBdkd4Qjh0YlhrYUZL?=
 =?utf-8?Q?Fo5qMiFV+TY6LuRuO9p7Reru+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f3a738-5463-4e53-7634-08da7f8a1b20
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2022 13:20:36.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haao7vks/zNR+ZzofGRB0ay97nY5Lk8y+ph22HJKlAq97lg6sEL3nKZn8rJLkpwjUQ8/S4QRI57Yf6mHED0jEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5591
Received-SPF: pass client-ip=40.107.7.105; envelope-from=den@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15.08.2022 11:02, Alexander Ivanov wrote:
> Fix image inflation when offset in BAT is out of image.
>
> Replace whole BAT syncing by flushing only dirty blocks.
>
> Move all the checks outside the main check function in
> separate functions
>
> Use WITH_QEMU_LOCK_GUARD for simplier code.
>
>
> Alexander Ivanov (8):
>    parallels: Out of image offset in BAT leads to image inflation
>    parallels: create parallels_set_bat_entry_helper() to assign BAT value
>    parallels: Use generic infrastructure for BAT writing in
>      parallels_co_check()
>    parallels: Move check of unclean image to a separate function
>    parallels: Move check of cluster outside image to a separate function
>    parallels: Move check of leaks to a separate function
>    parallels: Move statistic collection to a separate function
>    parallels: Replace qemu_co_mutex_lock by WITH_QEMU_LOCK_GUARD
>
>   block/parallels.c | 188 ++++++++++++++++++++++++++++++++--------------
>   1 file changed, 132 insertions(+), 56 deletions(-)
>
Reviewed-by: Denis V. Lunev <den@openvz.org>

I am happy with this code now.

Stefan, Vova,

can we take this to block-next via one of your trees?

Den

