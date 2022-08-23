Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF7D59D6C1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 11:54:42 +0200 (CEST)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQQcL-00071n-DD
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 05:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQaC-0003fR-1n; Tue, 23 Aug 2022 05:52:28 -0400
Received: from mail-eopbgr70135.outbound.protection.outlook.com
 ([40.107.7.135]:2344 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <den@virtuozzo.com>)
 id 1oQQa9-00015k-Uc; Tue, 23 Aug 2022 05:52:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvT6dRoIeo8/mRWFU91gb5rdb2P+C/ly3Fdibb6jnC8BEnWWrciVg9x53KzqRQp/a1UZCYFbtBNdOOgdpb6m7Gmcc9bQeQAb20DdnyXPqUP0D4JbsPFW7B6LHAosi0/5MYNQmay9KmxaGZiWXurvKM00755n+B2Jhz9nlyTe5oMd5AT27fThpwuZopXCp4m5ENGsoI8yuKoyjlIc8WvgMa9ZByzfsBTsp541C6oV6LVxwOgQmlEaFrOpAuvfqBFCdAvTL5h1Z0dWKI5tKVKGcPzoJvnd/0gApQX0bM9wmX9X8s72aKOP3txJT47W5jN+NqFNB+wNSzXgSZnYIOiSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dzrQxiAZNUZ+o8ztaGMWx2b12vo/v/L6N44OYjCv79E=;
 b=gx62w5DnzMt1rwK5OLEwOzN/UdP1CC0zdIPuwqGwXDgL3BzCC3EQWb3A5snX5XNKf32dwSJ9khcrSZUlL1OT6duspPJ+SnCB4FbB5Vh/U88Ga7/a7gs0yPcjgcpXNb8EHsvct0O5GQ0LWbbt+pw08mMOFmHOpki++7IRl+/QJ9mhyNrbJUJy9LzLItBLbNLu5rIctjFCxz9gxcmfiQIiNTs/5rBdL3rknlgVinlUlWZZgjP6r33fN18ITghC510opXY1iRMo1BHbB6jB2pV9TMYwh8YoUTp2jes5Mps5rYBqSwZrx3UjB2fPJD24uaudK2mP+PQlxfgYT5/tx3Y/0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dzrQxiAZNUZ+o8ztaGMWx2b12vo/v/L6N44OYjCv79E=;
 b=wp6LqP5KC2wnsyIFElC6ZufISbGRMHPscDWabQYPwJh6/AcVA7zGbtbb1qLiIgpeuoninuTot1QZh7I/3I8bRx0tDGfzYSh3yaeev2SyWgaYiP6/Yq9LfyBImQRtnLBpsn43bBxIviGH1KJfCJ9klnmghtatRVbqFB9x5nXIdoX4272N1OnlT4hAlazzFeMEWaBJgdZK4rAVY4P99MEAfIGuFlJfVxMKRzKDlchnoiP2SsM0jftF6YVWWMvuZwdf1sGKp+kxcuUWC0HqjNrXP6pkZLk7i11/DAxkhoOyle+g83h4Gpulfs7oI3ZHymLJVpgDY15RIfbl8/xjgIr2Zg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com (2603:10a6:102:1db::9)
 by GV2PR08MB8368.eurprd08.prod.outlook.com (2603:10a6:150:bd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.19; Tue, 23 Aug
 2022 09:52:20 +0000
Received: from PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d]) by PAXPR08MB6956.eurprd08.prod.outlook.com
 ([fe80::813d:902d:17e5:499d%3]) with mapi id 15.20.5566.014; Tue, 23 Aug 2022
 09:52:19 +0000
Message-ID: <3d483cee-ebc5-6c83-66e2-2eba2272fefd@virtuozzo.com>
Date: Tue, 23 Aug 2022 11:52:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/1] MAINTAINERS: add tree to keep parallels format driver
 changes
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>
References: <20220823084020.26311-1-den@openvz.org>
 <39a7ead7-6e8c-428a-65dd-7332d4c4e619@yandex-team.ru>
From: "Denis V. Lunev" <den@virtuozzo.com>
In-Reply-To: <39a7ead7-6e8c-428a-65dd-7332d4c4e619@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P193CA0011.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:bd::21) To PAXPR08MB6956.eurprd08.prod.outlook.com
 (2603:10a6:102:1db::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f08754-2f24-43d5-61d0-08da84ed2b6d
X-MS-TrafficTypeDiagnostic: GV2PR08MB8368:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q4IiGgMqadW80FgQhQNdDGchboguLK9TbPw9XyiFMnXUKtz7NGZCx3dFoKmAC8ezeA2NktYldJnG84APEOIVZTSv3LL5P+aSuYk8VSYKHhkT7YJwaR5vDHH+Vjz9VRqoHPIkAK6ArlDCrpF5xfImHzLHyyo2nfcwmDcM+hmIrEwIaAwVgyjxjjE4zNkanBCbsh72SA6LmMahhOidOUjDKlxBhXtdZiM/7dUWAY2fR3rlJ7sXMU+Jm78i0A0UMRiP2AINsK5nc/j9rxNVDj3LtRhRuP54wKBDfSeenwGXC/fUfuW4FIw6wM4dIaxuWqk+Way5zlWukypBvAKBL1M1Vkrj5KWR4jWXfPrOF6k8P4TbD6xuhNI2iwqp3+MxoaQmzi5t0j5PhFYquLorl+tzWKNVfeVwvnFy/fDWFzZ9jPaHy29qtTL2S3Wr8iNpKnRnyJU0d/F9zkeOz7OPQ/tsLvInFaa0ZRC4FjFj3/4wjeVjHOyjxg5fMz+ULJxo+/waYbF4S4nzPRSZVuyF8Dl9R7BOAfldWo8FC8bFdsgKdgGJTugK//i/reX1MvEsFn0/HhzDUHg6pBCcTuK6HLA2Cgtu4YSHkT/oRmRMMS/cwJKsGrCerjPPW7dBVL6M2imGX0LCwPzeLDQBUqIgJLGP7DiN3LnKDuctoehlqN1Rf+lPcr/DMHsbFQYWH7b2OuQjsfICCfysUaSLyAIpfUAoBYJa2jIwjek2Cs1QEgNydHSMHDkCaSnqLbifLQj4iunzH/po/mJfbas9ikkwAdDuW4mjos+k6GvPHr+cp76n1o+rDTIGLMbJ5v1gCl7ktOkBWpgEDajzBni48DW5z4nB0JLDo64t09V6GJnQSDgRxzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR08MB6956.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(39850400004)(396003)(366004)(346002)(376002)(41300700001)(6506007)(53546011)(36756003)(86362001)(31696002)(52116002)(6512007)(26005)(83380400001)(31686004)(2616005)(966005)(186003)(6486002)(478600001)(66476007)(66946007)(316002)(66556008)(38100700002)(38350700002)(4326008)(5660300002)(8936002)(8676002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDRaT0dmRy82RFpJR0ZYNnVSa3VPVGk0OGhGN211NDVaNlRNTlJ5NHFQVXkw?=
 =?utf-8?B?aEZ4VnFaM0ZscEZqcVJWaFlHWWZZNy9hWm51TS9lYk1qWk1VcjVkLzNqVlJa?=
 =?utf-8?B?aEpNUXJSMWlXbjY4TlpONllMYVBjdXpsRk5IRS8vZCtwV0UvRVdadEJ6bWla?=
 =?utf-8?B?dm9WTzYzakpKRitlcmdyNzJpZTZDQVpCR2NtVE5PM2Q4ZjQ4NzBlQWJwcW9j?=
 =?utf-8?B?Q20wZWZadXZuNTJ3QTNnMk1YdDVMTE82WFd1bExIT0hWWE5sRUdsbGNJSWo1?=
 =?utf-8?B?ay9JUUJlQlRtQVdUNWtwTitWMy9uN1IyRGZ5OVBhWmU5TSsxRncrR2FlME1I?=
 =?utf-8?B?ZURNYnB1ZjRiY3RaWkVQWFNrVlRqSGVPRXUxRW9IcWZ5VTBXQnVNWjRsSTJJ?=
 =?utf-8?B?dGlVOUdaS2lhKzVad08wWXFTeksxd1Y4azB0dk9sSkJCLzFvK09DN0R3SmJv?=
 =?utf-8?B?WDB5OERzT0c5NW52LzY5aEVNSU9ZRXFpY0xqMmxDbHB2TlZvVnAvMFBrVDJO?=
 =?utf-8?B?NU8vVVgrbHBSMjdSbi95d2JnaFZweDI3WDRvLzNpRVlxZEpiMk1wSkk3M3RV?=
 =?utf-8?B?eTdWRGpCOGRxQXhDTldrUHh3eHIreTU4YU4wMFZRNzdPY2UrdFBYVnJTV1Bt?=
 =?utf-8?B?T3IzN0NJaUxHNmNPRmw3YlVDRDBZSVgwK05DbEh1TGtPbHpLeW9TOE80YjFJ?=
 =?utf-8?B?SmpaR1NvdnUvL1RleWhFVWY2NFhGY3YvRVFxK0U4MFF2aUMvMDlWTTlUODdM?=
 =?utf-8?B?MW5VNEpva2FuSWFkQXVkU1NNbngvOEdub0JtQXh5djBOL0lUMnRya002eDFo?=
 =?utf-8?B?bWNMcURnUUNHRU1nWXRYVk9QSFpYOE5mMlYwV09FSUptcFhCZjJLclczemg3?=
 =?utf-8?B?RWpoKzdyY09nZmhIWTBycVVhNXU5QlZsNzEvTEZsUVF6WFhVNlJWd2lKTnhN?=
 =?utf-8?B?RjNaK3U1WGk0Rll1MHAxZW1sK1p2cndHckN6d0FaSlNzc3luaVZDb0pIbVhW?=
 =?utf-8?B?dFRwcXRUNUcvU3FyNnF1Y2pCN0xBZ3prUmtxZDdPdTk1VDZTSElwRHY0eC9V?=
 =?utf-8?B?YWRpMm1pdnZ2NVdxZGtZMmdOTmpNWlJDU21XSzhNcDBxOS9TM0VLY0FlM3ZN?=
 =?utf-8?B?R1c1ditZY29qeXN3bFBaR1RmZHJwUHdodElxWG9rbmpSS2hoa3gvTWFySkJ2?=
 =?utf-8?B?UTJmUnE3M2ozUjhVaDI0MGJlb1lCblZhYVRGdzFiWjBocmJzaXhGYWRvMTlw?=
 =?utf-8?B?NWY1WjNlQit3aE9lL1NyS0llSmVJTnhNSE1lY04rVDhyVStSVGZJV2JXaWRL?=
 =?utf-8?B?NUNvNFNNblBvbW5JUTd4WE1xWnpLTGxjd2lxbmRVQ3R6bkN2a3lRbklBRWRi?=
 =?utf-8?B?RlYzSSt1b0d0Z3I5SFR2NVJDUDJYeG41aXdFSDJQMWNkTXhSdHRMNWV4cVRN?=
 =?utf-8?B?NnBCTXd0RkhOd3dVMUtIYkk2QVMreXI3S3RkRzc3c1VwT2VoL1d5cWZsYytB?=
 =?utf-8?B?SVF6Y0lad1VVUmRNZ0JoSUd4eHBvK1JVR1JjMWxieXFKTmdpL0dzczA2eTZH?=
 =?utf-8?B?aWhDNlVmeUNKakdqNGp0VFZnRGExN2UwR1NUclZZRUNhTDA3eUEzMGo2a1N6?=
 =?utf-8?B?a1FCMHVkY2NlVzRzdC9TbDNTMi9HZ3dwRVZhbk5qaG5SK1FpR0RTRWo1SytG?=
 =?utf-8?B?YXRuZjFMUnRXd3g2Q2Z1MXRrZDF4R1RvcVNxSWQzckREMlRNL2xlL2VoMHNB?=
 =?utf-8?B?UW0rUzN3MTZLaTlVcDhTM0ZaNHhDdUNndjNmbTJOa0hyOHVhc1cvVWROWXRR?=
 =?utf-8?B?YVEzdlpDbENVeXc0WVNSazlmSElteXp0MGRKM05rOFdDd0hFaEFaQWk0K01w?=
 =?utf-8?B?SGMydlRmb3pySkl0cDZsRDNBVWJOamluOXUzblpncHRLSG13ZGZ5bzNFMWlh?=
 =?utf-8?B?Wkg0RG5MNWNlN2xzT00yWmlvOFdBSCtEWFVGdDE3MkF0M1RXRCttM2xGVXRV?=
 =?utf-8?B?Ynh4cnRIdHh6cGlBdXJFaDVjOHVLMjAybVhCcVViWGlHRUE4eG81Rk0zTUhi?=
 =?utf-8?B?Qko0VDM5cUxzaUVJYnhDTUVvQzB4c1htYWdhT3lFdk5DMEVYczVkZjJZUDky?=
 =?utf-8?Q?ziAJ98juEZlQoHTyYSZ8+7ZP8?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f08754-2f24-43d5-61d0-08da84ed2b6d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6956.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 09:52:19.7988 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra9UMnJfyr3ILZ4D/zzUzHHwQGmhdB1Jh932D54GJf5IBCxqUZpF9lqOnddjvYKuSQbvXqKPE3fRWq+RZkmglA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8368
Received-SPF: pass client-ip=40.107.7.135; envelope-from=den@virtuozzo.com;
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

On 23.08.2022 11:42, Vladimir Sementsov-Ogievskiy wrote:
> On 8/23/22 11:40, Denis V. Lunev wrote:
>> Parallels driver changes are driving by me for now. At least we need to
>> get functionally complete check and repair procedure for now. This
>> would be a good educational task for new people from Virtuozzo.
>>
>> Signed-off-by: Denis V. Lunev <den@openvz.org>
>> CC: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> CC: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>   MAINTAINERS | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5ce4227ff6..b8dcf6f350 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3512,6 +3512,7 @@ F: block/parallels.c
>>   F: block/parallels-ext.c
>>   F: docs/interop/parallels.txt
>>   T: git https://gitlab.com/vsementsov/qemu.git block
>> +T: git https://src.openvz.org/~den/qemu.git parallels
>>     qed
>>   M: Stefan Hajnoczi <stefanha@redhat.com>
>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>
Wow! Queued the first patch to the tree :)

Thanks!

