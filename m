Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C5479A9E
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Dec 2021 12:55:51 +0100 (CET)
Received: from localhost ([::1]:36632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myYJa-0001Qn-1p
	for lists+qemu-devel@lfdr.de; Sat, 18 Dec 2021 06:55:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYHH-0000Wy-0i; Sat, 18 Dec 2021 06:53:27 -0500
Received: from mail-eopbgr80108.outbound.protection.outlook.com
 ([40.107.8.108]:53382 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1myYHE-0001hj-DH; Sat, 18 Dec 2021 06:53:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4rD29K2MuhSuPEZapjAaz4dm/pVRKRvH9QjQ5QMhd3u8FuEgCt5N79fzzsXL9F5w+nzUcKyjzpIqdt+j8L+7zV2rIo6RXG1Nap8grMLjXc07j3rBWy+2IN/C6fQ9wN8qFysj1E3JKw74T81OcGaXHyYogBjTHa0roAF51rqsOEdVAnvyHmS9yYt5JjwzlpqHFyUDunln++zJ1SV8ZfdtEzprGwLfHI3hVx+q2NCUDD+nzf/0BsF3dMwvYvs87gw847obAjg382XNGAMoy/GHoh+/a84D9U6ONPVvRHHwoH03ULb66UmUhnwh0qNfMmwNsvU0JlbBVem97qQFu4Qeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4udXFVkZrsw72R1vczk5ycDrEqjIUmclD+qTdsF105I=;
 b=T5NQDPeIQ5Ir+U+VV21x6sJtLjsg6aSW1HIbadUXjQ/W9iL/Cw1hhqmYuNb5zEenTvVdYFogjQjAjF3pei8bJAKOQlRlEDtnADldo9G2GW/G+qkcq9XyxaYPNR8/Ws6Wu1jGcPfJVHwis6TEgsIp9CbqBNEJqzZoKl0Fjbgzw7E1sFB9umzmVCz+CxHTh9QYzLkTZAlyD1KXcDWrPWTNnr4jBjCplQOF5om+X4A9CAFGSVqbv53IVee3dpaqq4TGI9Db1OiAOH/yTbmXGlU5UW6UKrNVYlJAB03ObBE9aE5LVkIh2wCy2NBUTwZvTmPDjjGcAKNgtuPx3YkAJxZ6hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4udXFVkZrsw72R1vczk5ycDrEqjIUmclD+qTdsF105I=;
 b=D2Exi75/dWfT3zMeKzWPeYXqPVyneh3FYopiSpQxx5RoxuRt7Q0sqBrEICEpp+8hWJ5gw1VQtGg+KfoclI+PUzVsgH/WaDiaOQtQyKjJZKmNanOpUNBVEMvYe8LP+4XxekrGqZuew+4O3Kde6dff7bS4caaif7/BpZn3KwcR3UQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4068.eurprd08.prod.outlook.com (2603:10a6:208:12b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15; Sat, 18 Dec
 2021 11:53:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Sat, 18 Dec 2021
 11:53:20 +0000
Message-ID: <e3d234fc-6937-61e0-c4d6-988196f16a09@virtuozzo.com>
Date: Sat, 18 Dec 2021 14:53:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 05/14] block/mirror.c: use of job helpers in
 drivers to avoid TOC/TOU
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org
References: <20211104145334.1346363-1-eesposit@redhat.com>
 <20211104145334.1346363-6-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20211104145334.1346363-6-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::14) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from [192.168.100.10] (185.215.60.230) by
 FR0P281CA0045.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:48::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Sat, 18 Dec 2021 11:53:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 06c72320-51e5-4318-1739-08d9c21cfc8f
X-MS-TrafficTypeDiagnostic: AM0PR08MB4068:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB406866DBFDA00BFA58E7CD8EC1799@AM0PR08MB4068.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OPbC3G4+eI8IPGQb0bO5UcC1kn79iXqoJkZcr0UKpgzx2eepBP693jC5rwwZd7oLZqgQyVr9w2vFzF+o/qp7cofi3DOwgYZcYWsKBNQVqBwIlBdUeL9emOKix2MhYVgi5X9kBM+ujIF3x080LnnVIazypk6qzlzI+Rd++erjJYI2/8YysMXeMO3Ac6CETt+UHfcBgmr7GJYUoiFLzlwvIMFiqZbm4hItSqeiqAxU2W0LTlheeq2EEdEjg0rNSOM9hbODIS857v8ahDTttc/fEj8L1BfPJ7V/f2tTL92oleFLksjmpVF2urjFrF0QKph8wAjKnB7INVDnKtOh2YEjf+a+gYo4w6nXu+0ERUD4vIsLKu8Ir1RB+b+ldcTFAKlj/alAXl+mNOp97Zd7tvVooOkchsW3RpAa2tu/IB9A5BBJ8TCAndZvwxAh7/uX4VXEY+Y8MOSV8AMwyRluMOwONIAWmgwXI8HWR8hw5Sc3zQGB1kq+tKUjIdi8FnMBiHvtkzz2UybvOrbrxkV0EPNy2KdmoZEJd15o5qww5FET0B+gMyg4zm/h/jxBgpbB2R1A+vpqEMnHGldaZvebZAxYfC6HEnq/7wtx86NK9McqIOYL5KcuVyTPl9+dxIn91eljHAAc5qMDW26DL3FcmqOk4f+dro8Sdezsd/BJCanDzggANUCXzodJn0bJTsH489t1pJ6D4mHWYbhA0XP6e9B7pnYhuCKy+aE1mFR3mClIwTUusm08+LCp5rdkDpbbQ16/iBGBN5mJCfVY7wsc86e6CA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(31696002)(316002)(54906003)(2616005)(36756003)(6486002)(956004)(38100700002)(83380400001)(7416002)(38350700002)(31686004)(66556008)(66946007)(26005)(2906002)(8676002)(66476007)(4326008)(52116002)(8936002)(86362001)(5660300002)(508600001)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnlNMU5UZi82VGwrQjA4UkhxRzV2VHBiUFNwazF3TGl5SERIeGh0WEN4d3h6?=
 =?utf-8?B?L1Y2cnNNUjFJSnh0V0JRZHcxUXJwWUtoNWR2ZkJQZFJCWWI4RVNuMUVLY2gz?=
 =?utf-8?B?UlRqNFQwQkpKK0ZWQVdKZkcxMGJMUGVhTjRibVFqRFJTZW1ybDIyVkxOb2d5?=
 =?utf-8?B?M3VEczYyTmwxTi9aYVlucHcxTkJTVk5ZMm1ldkR4eS9Ca1NneFJsWG5FdWdO?=
 =?utf-8?B?ei9LM281d3RhZElFYTI5dm1NeG1xd1B1V3NMYUd4NE9RLzVESVhEOUZFaDJi?=
 =?utf-8?B?TTdwK3A1M2R6ZUpMUnd1amRxcjhRN3haL3IwREx4ZUFLYjFVaEg3czRwNmZx?=
 =?utf-8?B?UTY4TWhGMHlPOFl5Y25GQXNlWHJCeXZEMzlWUHdhUHVWdng1MWhTbmlLazNG?=
 =?utf-8?B?NS83R29jTWthTmxDeC9jZFMwbXZZN0Qzb1NlZUcrM3BRbkdIeVY3UlYvSzBx?=
 =?utf-8?B?c09zQkR4cjVtTlh2UFNrTTUrb1Rtd0VVeUUrNjRyOXgwQnFpQzlITjhWUzRk?=
 =?utf-8?B?SUN0cGllWE1mNmxkTnpBZUNnbHBpQ01LM3dqVzREVjN1MlRlclV5Q2ZEQmVw?=
 =?utf-8?B?dGVwK3o1RjJTNTdsN1hkVHlKcjhtRDJSL2NIZko1enRMOWpaRU43Z09DS0Zo?=
 =?utf-8?B?TG9Hek8wMENhb29UQnVGelhNN0JzTU5XSkZBdi9JR1VXRkk3UGFoUzArMUJY?=
 =?utf-8?B?SWdxaXJSTW5lV0k3cTdWNTRhLzBKME5hQ1o1UmRCOC9Kbm5YVmwrcHNUZjJB?=
 =?utf-8?B?eDJNRWJBQmlMcHhBcjhyOHc0YitpVEVWL1pONlQyenJlQVFCZUt1M29nUXo0?=
 =?utf-8?B?WU5LelNMZ1NVVk9PRnR4dUgrc0tVcFg4NHk2UEpDMzRaUlZSSDJDUUhDcUcx?=
 =?utf-8?B?YnBBcGNoMEN3Mm05b0I4bGkyd2NyVXFYbmJqcWErdk5pUnQxTDNVL1puYkVM?=
 =?utf-8?B?NXRnNHJLUVVlQngxY05DYktJK0IxNW9pT3ZTMVNuMzgzd0MvTnRHbzRBRWkw?=
 =?utf-8?B?VXp4RmVvbWk3WXJGVk95Z1cwalFDRlJqTmQvbi9vT3ExWkJoYmFTWFhIdGt2?=
 =?utf-8?B?QVZhM2JvWGVpUEdDZnR5UGo4QjhpWTNidlBSTjN0TEtxTWJicFRsMFlnQWw5?=
 =?utf-8?B?QUxyeHA0cTlreGIzMmhaOGsvbWw0eWdFYjIraWVTeXNHakNCSURTOXZJbmtp?=
 =?utf-8?B?akpRbWNOcnNQUEdqZjZEWkd1NS93aE5tcjV1cm43c0crdXhZOFdOWUhEQmpj?=
 =?utf-8?B?MUFZNHpreG5wZlRrUXRPL251MjlmV29JUm1FTWMzcEQ5cHo0UUtNQ0RFMWVj?=
 =?utf-8?B?NG5PZnJBbG41azk4OVhlMVp3aXlmRkRsekFhRWNIbGNBMlJLaTh2cytEaUE1?=
 =?utf-8?B?SHlyTFdpQzUrSDRzQ3hPMWUxK01qalovRmorZDhVWE9BbEVhRlplaGwzaExQ?=
 =?utf-8?B?U2lWUGdtc2N3eU9kNk8zdmtpKy9BTWQvckk4TXVHc1dpQlk4WXNMeE5jLzRO?=
 =?utf-8?B?MTR0bFJJR0JXTXFicFc5K1BXcnN6alhnMlBlRkNGaUkreUJ0TERva2FEbWFs?=
 =?utf-8?B?QXlENU9taW1vVFBDQjl1ZkdYVVBlUTNOSXkxZnBqekhiaG1GZUhjTFBwK3lD?=
 =?utf-8?B?ZXZqaVB4d243amZVTE9jeXBRYTlkVm4wZXhqZUFJVGtBQTJBT3R6OTVqbW1o?=
 =?utf-8?B?bVNPVDhZS0laREhiSExKSGJIaldQcXFPdmxhSTEzWGJYcTB5aGFOSFhMUHov?=
 =?utf-8?B?bHZrSDB6d1hqWFhEMXVoQ3JnNERQTUEvWmZvKzFENWhIRVFCZUpPOEZCZ1Ri?=
 =?utf-8?B?OVVwL0duVDViQXpWTDB4VG1YckU5d1NLUEcwb0JPaEtLeFdQSWkzWmhrL29I?=
 =?utf-8?B?U3NmVkowQlMyRXB0Tmg4QTR6ck5waW9RWXF1YWlGUzFyMGlscVNXTzM0TU9F?=
 =?utf-8?B?YStWa3I5NVZhUGd5ZXlXUnQ4dFRUVklvVnRqQmNlaTZQbkgxcHBJY0kxK2Zm?=
 =?utf-8?B?SjRpNXQwdkR6MVVVTTRHMng2SlhIVllvRFRLNXg3WnYvdHh6Vjl2ODk2d04w?=
 =?utf-8?B?QW5mdHdWREk2YjNRaWI2RjFtUmpXWWI4V2NZVlBXRzFRc2ZwdEpKWDhCTEd0?=
 =?utf-8?B?ZFBoMUpVL0hVUzJUc1FlakgrV2pzMXNXNzgwTXRIUjBRc3hzTTU0Yys3MGNo?=
 =?utf-8?B?NHIvaVdOemQxTnh3Vkx5M2szUnNTY2xoVkg2eVNRM3cvU29MSzV1WVlZOTVZ?=
 =?utf-8?Q?xjUvVcGbkShfRiw0VGw8fc3Bks6xAyrFoLoWVMkqbk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c72320-51e5-4318-1739-08d9c21cfc8f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2021 11:53:20.3506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /6exgc9VrSdXZX3rDkLjf/x2b3c+XsJm6USE6bHJM3kGTNNhL7ZQOLhJZ4CxCYLR25dd50jmoMlOLjBXhf+6naFK51HyXLpXJJ0DHhtBI2I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4068
Received-SPF: pass client-ip=40.107.8.108;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

04.11.2021 17:53, Emanuele Giuseppe Esposito wrote:
> Once job lock is used and aiocontext is removed, mirror has
> to perform job operations under the same critical section,
> using the helpers prepared in previous commit.
> 
> Note: at this stage, job_{lock/unlock} and job lock guard macros
> are *nop*.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/mirror.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 00089e519b..f22fa7da6e 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -653,7 +653,7 @@ static int mirror_exit_common(Job *job)
>       BlockDriverState *target_bs;
>       BlockDriverState *mirror_top_bs;
>       Error *local_err = NULL;
> -    bool abort = job->ret < 0;
> +    bool abort = job_has_failed(job);
>       int ret = 0;
>   
>       if (s->prepared) {
> @@ -1161,9 +1161,7 @@ static void mirror_complete(Job *job, Error **errp)
>       s->should_complete = true;
>   
>       /* If the job is paused, it will be re-entered when it is resumed */
> -    if (!job->paused) {
> -        job_enter(job);
> -    }
> +    job_enter_not_paused(job);
>   }
>   
>   static void coroutine_fn mirror_pause(Job *job)
> @@ -1182,7 +1180,7 @@ static bool mirror_drained_poll(BlockJob *job)
>        * from one of our own drain sections, to avoid a deadlock waiting for
>        * ourselves.
>        */
> -    if (!s->common.job.paused && !job_is_cancelled(&job->job) && !s->in_drain) {
> +    if (job_not_paused_nor_cancelled(&s->common.job) && !s->in_drain) {
>           return true;
>       }
>   
> 

Why to introduce a separate API function for every use case?

Could we instead just use WITH_JOB_LOCK_GUARD() ?


-- 
Best regards,
Vladimir

