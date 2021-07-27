Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9493D7484
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 13:43:35 +0200 (CEST)
Received: from localhost ([::1]:48744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8LUk-0000ys-Pd
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 07:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8LTE-0008Tm-3e; Tue, 27 Jul 2021 07:42:01 -0400
Received: from mail-eopbgr80098.outbound.protection.outlook.com
 ([40.107.8.98]:52134 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8LT7-0006MJ-S6; Tue, 27 Jul 2021 07:41:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCryRN36n31a2graLsncsnNq7KBzYNSptt00l50Ab5J5OZ+1REkIYV42iZsF+TVOV2RtdHU83kbQokYXBb2I/D+1rr0GBFM6LS6qKqgxPpzwCc078Z6DyXiZMf6A7RaOGIJuapEo7UBKf4oenlNFAMXs+JmTSDOLPDXjrNcY2P8BoNoPEN8uWrL4jTBNRpgGj6o/Zkj8v1SR7oYpfWreO9UBolIxCHdvti4+N1HzMwmJp3Jhod8KXksQ0+B9yRU01ckqlmOLa12ZgtX52/1547TKp2sfyGUD5989j3PwGakyK267SRKqlFT0HyaA5AkN+7PE90MuHI+RNw3/9iPLFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOnMk6IVmhvqcm1ionnIbwvXBemOxUTAnMmNFzdvtYA=;
 b=SzuUwG+3+DxNebH1GWxPVUgwYJ91l6lvdGOV2wCm6EV7BC9k7sx+ziBJiV2fxRCdV0xCwMLOqicxFXRk9RgHAiC5mHuz/obedCk0xCzd3Prx991b4++g8tsYDjh4une8+VB9FL640wsUizX6SbJWwcX8V5OWMFNWy4tPWwNFOhdoYkOInqvNkLmz0axMPgQd7qeWVzVDH0p7XbG9U8cDhahIUEIKWs53wOAmi48WEz0JEut7O2XlHoqcEeqM5MdoOTJBNQvkmqRvhq08MMHeBNAbNN/WUMARfEDzvQYXxapaZ2CRkwfNK+53a4YamcOvfqsnbpcq68UkO9sb/sme7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOnMk6IVmhvqcm1ionnIbwvXBemOxUTAnMmNFzdvtYA=;
 b=LDhL7MMKS2SJRabyoulIovbudcmqdgog4gbnF+wmE8Gs7+k+hATT6mP4F3h6xkqb2TgLQ6d7N6/le/qfVmeSkNSKJ9j8KPGQ++hKKoZNlBOffaLT8HTff6FRixzWqm2t8j+Cx5Jwpvo9Gz1zYzckhVRtjATNuANvQGVV4KNHDO0=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3096.eurprd08.prod.outlook.com (2603:10a6:209:43::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Tue, 27 Jul
 2021 11:41:49 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 11:41:48 +0000
Subject: Re: [PATCH for-6.1? v2 2/7] mirror: Drop s->synced
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <92d60110-d201-aedc-3fa7-d6694be80260@virtuozzo.com>
Date: Tue, 27 Jul 2021 14:41:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726144613.954844-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3PR09CA0027.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::32) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 PR3PR09CA0027.eurprd09.prod.outlook.com (2603:10a6:102:b7::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.30 via Frontend Transport; Tue, 27 Jul 2021 11:41:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01698bb0-559f-4e69-f859-08d950f384f0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3096:
X-Microsoft-Antispam-PRVS: <AM6PR08MB309664B6B72FB0FB1429F3C6C1E99@AM6PR08MB3096.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Pyv2Tdwn7a8s5RAOWTlZQKaBKkQUhO5QxA6BXLQMWNBroGFld+wQQfyyDwX+yhKzECdIyFEByeIUg8DWO7C4Tu74y8Dnm9IuMG20Fc4SZYQQJ7vy2/EBOAwXGfuBAP0S0aMBIdUHkohFa0OjXGDxXv+0R/DVqWDsj/kG/7Uu9iM82ir+iOIbmb6AuFdVV+17XrLhu2y82F1U5waFbdL+gCdvgU+yFnpCLiCwG6ZzUso2jKKbMd6WYIisyGIOgXQh5ifbavHdD+DJwWcCuT+NX1++nm10Z3h6/7Bmos6IuutWxItrXEfVA/W3bWIasno2hRklS+gP5V+/tfiMiJfkk7uAJV0UDD/j8TjaBGrD3ST5u9T/PWvZHTElA2AUP5M2wYhnn9+beWkPsW4KO08KID9knqCNDUGXAvSSAmhm6CZevgbJFMQrZl6Cpi1dRVjJr1cqco1TPRzd4wZxbATPLmQoEEi9zMQsHBPQOM/niZXNc2/xvMGd7klVCx4sCxFQLUKL7yoAPoRzOMy/5PAberDO250SWvPbjkRygE0IaNLFdvsGgmZjE0tVI1txrbDRNlGYGWB+3sDwoLj+hTA5WQsRcjg7n+QWSQ7VjrXuIlIP2UvYT7ho7MjxMwsWkG/hr60fJUe2qvBMEhzGZYDnp+9A7aFPVZBUsfhAlF0PR2Gz5c7tARZx17U/0D9D9RayJpJqTLsEuyQA2pDQmPGnt2t94rUg/2wFd8lsUMm4LP4h8c4LkXRE18OGyShXbgCe1EPkF0LBXbvANpffDDt8g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(8676002)(54906003)(316002)(38350700002)(4744005)(31686004)(38100700002)(956004)(31696002)(66556008)(4326008)(16576012)(5660300002)(186003)(66476007)(2906002)(36756003)(2616005)(86362001)(66946007)(52116002)(6486002)(26005)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG9TalM5dU43UUFyeDFEODh1YVpSOVVHV2Uwa0R3ZUtTN3piaVZZSEFMeTNp?=
 =?utf-8?B?Y3A0eWlOUW1HUDlvM2VyS05SRG9GTWdoNFBFdWVUbk9sUm0wWEljeVBqK0Rr?=
 =?utf-8?B?aE44ckEwSVR5cTdBZG55bkhlbi9HMzVSRURValFoNjJ2SGtiTFBGL2I1aUF1?=
 =?utf-8?B?aCt4VjFGbGZhZFpDbUZldk45dTJNMzVJS0VEUmZ6Q05lNDA0OERZZTNGN0hO?=
 =?utf-8?B?U1cvYmx5QUVQMDdXYklEL0M1TmdsenBpRlVaUGIyOGdOYitNTCsvSUZITWRT?=
 =?utf-8?B?R0JvVE8wWUtTeGIxa0dCQkJVNGIzNnp4TVBIUktiYlZlRVZqMTlwL1pnanh4?=
 =?utf-8?B?TzVaQUhNQ1NmY0ZhVkRrQlRMa2hwWnlneHJlQzVINE9JWTIxRHNFVFl0c3VF?=
 =?utf-8?B?bnpqVlRpVktUbHR0WDhmRGpTcjY2T1A0S0xpL2s2UitIWkEwblFrQzdYNDVt?=
 =?utf-8?B?eTEvYmFVME1nV0ZOTnpXbnZDWjVHalQ5YlV6b2kxWGl6ek9jcDFNRTEzOGZp?=
 =?utf-8?B?M25RZGpHeTdwaHkwV25PMmxKVWZhaUhkSGxnVUlJQ29XMU9ZRk5nR2RyemFO?=
 =?utf-8?B?YVcwZkZMY3g1TjVtcXVvcVEzcEFqdHhVektkZ0YrWjIzR3lhalFHWDh0RkpS?=
 =?utf-8?B?eEw5SmM5TGoxZlZZN2UwZThoNXhLREtCNUw0eEsxWVdLd1Nib1VjL0l2OFhU?=
 =?utf-8?B?UzhDeHAxelNRK0xKbFpiUmxEbU9KNmxxeW5FcWI0aHMxZ2lpdUdWSC9ud2c1?=
 =?utf-8?B?YkJWWkhoenllcDlFNWJMa1BQR2c5SkZlRHBBeDhxRkx2Z3JzczVmaW5JT0dO?=
 =?utf-8?B?VCtNRWl0UVdSMHRiNk96VnBDN2RuSEI5MlpmUmZ2YStCNzhKMStGY3IzMTdT?=
 =?utf-8?B?U2NyVUxxeHFTbGZsTEQzOHZwY2dialliVDR4ZUxiWXhqakFiZVNrdFNjUzNK?=
 =?utf-8?B?OUJnZGRFam5hUHg5eWN5RGxWLzNkOFlnaHFVTWJmVWl2dE9sb1RyLzVKTzFv?=
 =?utf-8?B?b2g1WW5pWUxMdi9qSERXRFBSVkdJalZJWUxBSmY0N1RhUDdCM204Z3h5M1g4?=
 =?utf-8?B?aWQ3YnhuZGVKSkVIOGhOQzc5SHhuaWVXYU9jUHFTOURMM1pYTkFVS2Q2YUJB?=
 =?utf-8?B?VExRUFBTNVdzdlBZdzlGZkVtSm9jUFFPQTJJQ2N5bGR4akEvMmdURVNUQUtG?=
 =?utf-8?B?a1oreThmM25aYnZETnY2UWtHZmY1bUpoYjljbEVGNVhHNmg1eEY4WXNPcHFq?=
 =?utf-8?B?aHp3VWNuVlJMeC9FU0NwajJZa1lRN080Y2xvTWZGcktPekUvRTF6WjNKSjR6?=
 =?utf-8?B?anpsSFFvOGlVMWRuZTlHRktOUzkyTlNvME5JbFNCUmpMdjA5dGJCbzZ2Vndp?=
 =?utf-8?B?TGVhekRyWThuTGZ3cXk5b2wvRHRYdGNPLys2eXh3RGxVdUtRdUJsUzJlR0Yz?=
 =?utf-8?B?M3B2ZWpmaVo5eG80L1BuV3g0aW9uKzhPbFF2WGJNNFBHRGMxOWdtTExTS3hY?=
 =?utf-8?B?MldvVG9CaHB3aWZpTHpEdDV2TGd4ZjZCZFUyeHRHL3poUjl5MmYzcmc4UTVD?=
 =?utf-8?B?Zk5OTllQVUFrQzBwbmJOVUlQV2lGdXkxemRmWHZjTVBKNmh0Z1dzc2FrSThj?=
 =?utf-8?B?MjIxdjhLT3k3RWw0K3g0c29JaEV0L1VrM0lodzVMMFQwMm1wcWZZLzFWeDN2?=
 =?utf-8?B?UEJXWGRpOC9mYWhESFFZMFBVSXM5bStNclNmNjdRV2lrYThPVVdzRTVUeUVR?=
 =?utf-8?Q?tW/j/7LzxN8XVe0i/wQK/t959O/EqD94+YzPUyq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01698bb0-559f-4e69-f859-08d950f384f0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 11:41:48.9037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AZekMk3IadZitznlCCw+56k0LFF1CIyjKqBJBTWnfTkZuUNCnZ1zECL56Kwe/F1syytMk6e3eSwIbF6EzP7+zgmTBV9+UGDNnUDho4dZu5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3096
Received-SPF: pass client-ip=40.107.8.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.438, RCVD_IN_DNSWL_NONE=-0.0001,
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

26.07.2021 17:46, Max Reitz wrote:
> As of HEAD^, there is no meaning to s->synced other than whether the job
> is READY or not.  job_is_ready() gives us that information, too.
> 
> Suggested-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

