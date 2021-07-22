Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447A13D2896
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:02:10 +0200 (CEST)
Received: from localhost ([::1]:60002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6c5I-0002Eh-NG
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6c3v-0000sj-Fq; Thu, 22 Jul 2021 13:00:43 -0400
Received: from mail-db8eur05on2118.outbound.protection.outlook.com
 ([40.107.20.118]:23264 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m6c3s-0008QA-FX; Thu, 22 Jul 2021 13:00:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AnpLhpAzLEByzIkkO34sTD6FsuU8eX2Aze3wnfW2j1O/SJ3czTiiv9FNcJ2kqwIJqV5VhhcFMHsQ4bi4/N+EbqSLwq7YBd/vOnbFwnQDYLvPc6CpU3MoMj94ubte5SYxy5NdiuPkbt7keY/WhCXcOH158XwFjgmJNpLe7togNJHnWEpO0nLDttpSLGyo/mNLgkyB5sjqEPxYHEzGoRWoaeZZ7EBYpl3Hv4XWr/NDu7hjCO9B8pKgkmfOPY0gwrCLjcu/q2u1Y55hLEoa8rFfkNbD9nkjdJxdjmKFoqk4Ejhus8eTqkf14aSd+Qgp3ggFSUlSdX+tQ4BxFaeFQIC8xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR12oMlmehFYZz039sPr2vus9KdAEOVyI465y5OjB78=;
 b=B62ZTx4uuCbhS9rHqSkmreKcojTnhaDlp59xxa1SbrBcNB0Mqxi/ON7ZbbZSjYZas/C2hY/UA1u/4jjDJwcRB5mlvKhZO4dM3771GUUkG70f9zip+qpeu7E2dweLB500WeXrkGjw+H5TgGmwjO08h8pHKQouSzQeacbXZUQCe0Bg//bymTeQ4chxxrwy9aL6Lnl/3WpWGe9VBSeFu0iYVGtnFPzYwY0sfMdPRmhaaqCnqPvd+rsNg8irDoj/0vlRSjOZR1GlU9d5n+ppu5e2QWgGIpJaQsS9ZgPGmMQRJNKNJcLjErEYBjpveD253C4IFb2KgCotN+66XP+MCbiKPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MR12oMlmehFYZz039sPr2vus9KdAEOVyI465y5OjB78=;
 b=NOTgKo8TliQjwqKXu9noMQPglRHq/o6k+sd7rFQ3oIoK+eZbramkKGME8F47lhyLutM39hQkqaAJJXbgi9JsvDXsLAjZP9pQMvcoUoFEnPqnKnkIKmb3/ZNGbofnXsQoKhPnpTiMTUM1Eq/XLWhgB98bJMkrYSLirCSwLphxLzw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6806.eurprd08.prod.outlook.com (2603:10a6:20b:39b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Thu, 22 Jul
 2021 17:00:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Thu, 22 Jul 2021
 17:00:36 +0000
Subject: Re: [PATCH for-6.1? 2/6] job: @force parameter for
 job_cancel_sync{,_all}()
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210722122627.29605-1-mreitz@redhat.com>
 <20210722122627.29605-3-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <9eabd8dc-6117-924e-2da0-1cd99607108c@virtuozzo.com>
Date: Thu, 22 Jul 2021 20:00:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210722122627.29605-3-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0090.eurprd07.prod.outlook.com
 (2603:10a6:207:6::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM3PR07CA0090.eurprd07.prod.outlook.com (2603:10a6:207:6::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Thu, 22 Jul 2021 17:00:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ebd21d-603f-44df-2fa3-08d94d323996
X-MS-TrafficTypeDiagnostic: AS8PR08MB6806:
X-Microsoft-Antispam-PRVS: <AS8PR08MB68068B1029E71F274F329AA3C1E49@AS8PR08MB6806.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z05clonUp4Bo4kjwgNzP8yOCHtyJU9mxrMYyudHC4EmoqgtaRsH4K5lElzIKqEgcs7gD2EBsOSEnpPXr1TIbcz6U5ImntsMu01oK5CsVScDN3damPFQwCA5MZczg4AWYP+weXa8biOs3CHnKKZtKDXABpLqKGeoi9THfs76WGhC90mz3UQ7c/v3T3PNdRUtIpqGxS55fBbpJg4XsrOxFWmT0ybPcPT/2NSfaKFOH39cZjCpuNWkCNn48CrbSu6cjHgfKCRHElmsohuk9zg1UvEznjvNlQJlwZ8E/9PirjBOVMTzn7kOQSaGRLf+3ektE1gLGxS6N/HEykexE7owgek5MVSB7I21ABsPOPYbwA3lqOhm5B8BllJn21hh5iZWaIjUIRdkq5JTBl+6dCX80p2fh/p3ULDehp79/ITAZV8r787L86ZmXeZdqAGH+Lh94h6IQiwu41SdUGyF5zAQvJjCkuy2ptAAbrG5I1BlTnkxTkc3HONVuMmIAzWL3gGs6TLFBd56v16SEq3MAcimuCx+dMpSMg+i6I2oSweYf25ipsJON+9SgVNnejEYIsRd9dl7UCr7gRvoWoBgyxGRDt6OVFuoro0JfGsZvLgD03gWQCewvdXdqkiLxM6nKKWQoODnMN8plIMcUVbYUv2Zh9Mk9UsBCm7RyjFGnwBhkO/v7/L/SeI+0KyLwQhdFGxEpih9IN4Usp3tSHEdqIocS4TrKBI4wW8gKDr0tWm2fM3SYFguyLR2ofcjl4dXCrSAyeSuJCyCRtrbvCQGJMih+4qSiqUAxxcQoGbQp93c1Uu6Q2GkeoR6ag4n+Tyv2yvXl1aRYqMZRaejh29ui5mpx+bVdxwLk826pJxZu2z3Cyxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(39840400004)(396003)(346002)(316002)(66946007)(8936002)(31686004)(38350700002)(52116002)(26005)(478600001)(2906002)(6486002)(8676002)(38100700002)(956004)(2616005)(31696002)(54906003)(86362001)(4326008)(66476007)(16576012)(36756003)(4744005)(83380400001)(186003)(5660300002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUpZaXFIVjFpRWRvRHc1WkZBMzIrR0U1Y0dBNDBZdEduU0dpUElqRngzMzRJ?=
 =?utf-8?B?czBJRUtjdFlNd2tZSkZsSHozTVpWblVqY2tIM056WnZGUXRpenVPSVVwSytD?=
 =?utf-8?B?SHk4M3VpN0RjYXRtMXk3Yk1obFc2NkJ3Ri9vVmI0TDBncEpjMk1CdzFwb1gy?=
 =?utf-8?B?SVRPaXEwTXRtK3dTQUtaVXNLWi9KTWI5elpzTWdjQm40QjZrbTJJS0ZhRUtu?=
 =?utf-8?B?OXN5aVgySE9HK2k0dCt6d3NvT0Q3ZFFRN1VBT0RBY25YWWN1bXlLTWRsbG1E?=
 =?utf-8?B?cWlwM0dXUnlDT2pOZXpMZTYwUUNpVzhuUUlYZmRFQ2lkU0RLS2VQRnA0WmVP?=
 =?utf-8?B?ZnN3eHlVWGxSKy82S21uQVZEd1I5L1dwdWVIdC9mVGFtazExejA4bWh6bGFX?=
 =?utf-8?B?ZUdiVHJVNU14T2U4ZHpzZ2FhRCtVcjAyN1V4c1Erd1V4ZFIyRmFqVjBLS2lG?=
 =?utf-8?B?SDFtUGRiaWx1NmttSTVHeEMzTW5xSzgzV2hnblZpTDcwR2lDTzVXbmJKME9W?=
 =?utf-8?B?M0Y0bGUrR0JPZDczeGZsVnJRVHhEdUYvY2hVWnB4L0hOeGxRVEFwWUFnTnRo?=
 =?utf-8?B?Zmw3N0VYM2hTelZLQnk5QTZjamVtVTM2VjNwa0J4cnVFQVg0eVBIaHZoVGVH?=
 =?utf-8?B?TVdBNS9KeXkvMUpuaTNuZUxNMHFPSzcvUUdPdUlzbDJMYkdrTGVwMkFCMElj?=
 =?utf-8?B?MUdLMnhtWEY2SXA5cHJkQWZTMUNWcEdxemxGLzJZdjdwUFg0clZkdmIvQ013?=
 =?utf-8?B?amJOS1c4K29rS1FGSE1weDZPQ3lsTDZVMnB1c2UwL2Nsb3FtODVsVjZYM2VR?=
 =?utf-8?B?TnpBdVRCRytjNHUvWjFGV2ZhdGYvUDdpYlNJSldMU2VicURqcVpzU1BxWDhX?=
 =?utf-8?B?U2IybWFoODN5UlRxWlFBQlZZb2RxT3c5NjFHRTRqMXJJUlROZk9UVTZDV1Ay?=
 =?utf-8?B?dHdrUXB1MU4vODBmeGxEYTFYK0Z3bVdueWdkbGVyYmd5OVNoNGJnS2R2TFhj?=
 =?utf-8?B?OUUyWUhKdjh0YW5BeDVETWNzeWZtSFowZ2RwWmtUTHhVZ3Y1d0lFMmMzZ3pJ?=
 =?utf-8?B?bXZwa0NvUWpjK2wwL2FHTm9IVHJMN1dSd2dQV2I4YmI0cEVkdXVUNjlhdElz?=
 =?utf-8?B?WEdseThrOENtU2tyUVlvUkdLdlJ6eXN3ZVBra1MzUEV5bVVKcStTeXhvc0tZ?=
 =?utf-8?B?b0pwYXd5VGhNdktBZUpueG1kbVhSTGd0aWpSbXlRYVJuNUxmSzZ1T2R1OFhX?=
 =?utf-8?B?bzM4NkFXeGNTTG9Ra1JqKzdHRDM0RVpzK3dCc3Vobko1RVl0TXpuZ2FYM2Qy?=
 =?utf-8?B?ZDlQYzRKdXNzVWYvbytaUkxxV2RYQ29Mdkw3Tzg3WUZFYUhrc0kvYWM3S2N5?=
 =?utf-8?B?VS9Nb3BKdGR2bzhqcVl6eVRUZUZRR3dSSjR3VURaYURJOWVBOGNoc1JaaFdW?=
 =?utf-8?B?bEFyamJaUFpoeC90U1h1VEhRWWhDRUgyZE45UjdmV3pzcGRGQ01UZEZFZmpV?=
 =?utf-8?B?enFrYnBNNS9ES1RBaTVlVGExeC9DeExBTkYvTnZtSDhDSUFiMHJNUFhVdVBl?=
 =?utf-8?B?T3YzMzVvcEZTQ0JkeVNiQUlMWmZBR2lPdk9PZ0tJOHYzTXFuVE5tMGNLc3h1?=
 =?utf-8?B?WDJHWnlwaXpzN1ZBa0pOK0FaNmo2MmtacEk4NnREdXgzUkxFL2ZuU0VUTVZL?=
 =?utf-8?B?YzVzQ1BkSVhFV3NhN00zRjVJS2hURGwycGhTTW1qMlVBVnRTODQ3RDFOQUZq?=
 =?utf-8?Q?EC4s6ROS2h5rLA2cCng1Nhi/3R//gKORXkz+QOw?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ebd21d-603f-44df-2fa3-08d94d323996
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2021 17:00:36.2669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXOhDDMSLHSGcK1Gil3Im7SGQ1kmVJ5P/kxj1BISXp23mWlbHUAWzKqn8x4Uw5fd4wm7aP+TmHOjnQI9Zmi27HFeEkiA3daJ1NemJ/M8H88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6806
Received-SPF: pass client-ip=40.107.20.118;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.203, RCVD_IN_DNSWL_NONE=-0.0001,
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

22.07.2021 15:26, Max Reitz wrote:
> Callers should be able to specify whether they want job_cancel_sync() to
> force-cancel the job or not.
> 
> In fact, almost all invocations do not care about consistency of the
> result and just want the job to terminate as soon as possible, so they
> should pass force=true.  The replication block driver is the exception.
> 
> This changes some iotest outputs, because quitting qemu while a mirror
> job is active will now lead to it being cancelled instead of completed,
> which is what we want.  (Cancelling a READY mirror job with force=false
> may take an indefinite amount of time, which we do not want when
> quitting.  If users want consistent results, they must have all jobs be
> done before they quit qemu.)
> 
> Buglink:https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz<mreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

