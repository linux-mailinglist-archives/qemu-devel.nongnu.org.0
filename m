Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 736AE4B1384
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Feb 2022 17:52:34 +0100 (CET)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nICgK-0000ws-Ik
	for lists+qemu-devel@lfdr.de; Thu, 10 Feb 2022 11:52:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAxs-0007h2-Of; Thu, 10 Feb 2022 10:02:32 -0500
Received: from [2a01:111:f400:fe0c::712] (port=5455
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nIAxp-0005z9-5X; Thu, 10 Feb 2022 10:02:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E9NEN6lztWBLKMExjS+q4/I0SIhlG2p4nkI6Bdl9us1MW/7mrN23gfN0Ig5rccu1ej4BfUG0IqWLtY4ozyPh7q4H7hlgNjciXeWxchpJMRk41lsc0uSr+OcSRkp0GvgkafCoCamZ5hOU6ZHsK7wXvH96pLYJv6r1jHEoOT9uaj84aY5Ko1qBiEy8tgDFhPv5f93Osem6pc1UnnQj0A6gdXsG/ybhCFOiaouB8rz+cownZmi2dP+aqiwi/SxKjfzqjCE3PbAAfZoDHKeMLiJ0is5fHAcj3+0wtQtmFCvEsnqRVRKrGeDjcfn88X/ph0tnHge33L52maSJSy3IEaV0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMGwGABQKmEGnB947qbwg2X+HxALRHX7rNrVY+wNq30=;
 b=MqA7aT7iXlpjMejD5U83YKJgbBpHGE/TB5XlRksUHWa4XpuRwkqeE1KdNrtWOGji0hrdGW0Zajx2xfeJX92voJWxs5Jo83tg4rrqgQu+6dAq8KMvLPAw+WvmxKnx3gWBJUqW2arQnKg3VxH924KJYBRt5OXQ7MqNLmNn7U0m8XFhrj8M2Eia2STR1/vtf8BO26ztSth68ohne06Z0l/QML1c7taI0TUIHGm3ouu3fH++NFWjGjpVEaUPcs1hvdw2mYdduZcfQTKAZNzuRPNqzn+I8sVOAk41WcnUipukKFYcmQN3RtaFU1dBA/53rbLKOHymhRT8xNSmsr5EdXa/yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMGwGABQKmEGnB947qbwg2X+HxALRHX7rNrVY+wNq30=;
 b=nTKTH0QHugjupbVUslKX9C82wZe7/HpX/KSvs4hUcNkkFK/xNfND5WvMb4ujBT49ADmtnI3m6I9S8GsPWuq/Plvx0o8v2jp1pmRo/hJJA4O6ouhSKIvzqBPjHt2AXdWdgVaHaieFILs8KVA8IgTmQkxHFDB6KpSu9vbawGOwRoQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by DB8PR08MB5129.eurprd08.prod.outlook.com (2603:10a6:10:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Thu, 10 Feb
 2022 15:02:25 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4975.011; Thu, 10 Feb 2022
 15:02:25 +0000
Message-ID: <f8619333-4212-4b5a-765c-91ef8ef07130@virtuozzo.com>
Date: Thu, 10 Feb 2022 18:02:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/6] jobs: ensure sleep in job_sleep_ns is fully performed
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-devel@nongnu.org
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-7-eesposit@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
In-Reply-To: <20220208153655.1251658-7-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0031.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::9) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 41166c60-9dd8-4a9c-f737-08d9eca6592e
X-MS-TrafficTypeDiagnostic: DB8PR08MB5129:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB51296B93E7BB0A850E335EE2C12F9@DB8PR08MB5129.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lyImUNJzkWAG4Nd/YuLMC04JO985miO9f3LWCmHqNKdaS2YbxiFNw/y5l0zG6H5g/Donsyt0dntVvKDTpJNgtDHaerntjmyWe9IxZ+uuLaxFL+IBquzkoa0NqNSRilz78YPjNm9596RTzAw11c5LK2wlKPNGXqQ4K3eFzKyo4+98bidOFpVsY1Z8VXsGvj7AiwHB4tWemO1rNjm1veOr69HcCxDSn4bb5BZ7ZuJd/6iAgLx2FQMNPfUg+kYwboIXK6WZWMNc/eWa8CZ1VJEX6R+l/nIaJoBeSWStaOyMC6onj3NoxC3JNj048TXQUpoTNIBXYmmCkFFYR4IR1ivCDLobE+f6egtvnzG7p0iw8WSB/h9MLdga7tKTBQvOW7i4uybkkOq/ddkOF4596wbabCNRFSgoCE5KNXlIHQUxqrxSaHnwTud0n5EsP6wefNIczWxaWYA3nXjIRsOpR19vd9+g0zxv0dCgwMy2DXcZbCM5OOlurUaOiARGoR3nu4LAyXbTn0WzdZRhR+K11JRETdzfgp9GpLPVF3bEcXwzVYh+B+dQF6xa7gjZH+Mvlppwhjh1Y+lJfu49BRTex/pjbcBcijjr6leFHzsOECX4ncDTC9rcrN7fGV7lxP+98Bt26vVvIJjiVPf/Mqai1AX6e0tLIFKDI69Ga0t/OzJgQNARlptEUSSTi2eB2AJE1xjUP9TD/7hJsP3n7OYtLJrTtoLWyabbHqKiBIVXzxSu87TBBVEg9fGMjYF6Cvd3zEo6Sn+2F7sZlcH1+mtAXx2meQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(5660300002)(31696002)(6506007)(6512007)(86362001)(54906003)(316002)(66946007)(66476007)(66556008)(8676002)(4326008)(52116002)(83380400001)(508600001)(6486002)(26005)(186003)(2616005)(2906002)(36756003)(38350700002)(31686004)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGtuN1NRUFZackc1SjR2dzRJbElUZ3RiNE9IczZaQWhrN0t4bDAyb2I3UlN1?=
 =?utf-8?B?eFZqL1IzQWhIcUlGYjkzQWxkS1lyT0J4Wk1DTlMrYTI3Qmh0YXI2K3J1NWlK?=
 =?utf-8?B?VTVQUTJVc3hvUWIvd2h0WmpjZDF3bG1kSkF0Z1JZcmlTbkpna2ZhWU4xTnF1?=
 =?utf-8?B?TVpIL1oyK1psTkRCRktyUktSK0VlWDU4aGRmS3lOclU1eE40UU1CNHgycHRM?=
 =?utf-8?B?QzdtTWEzSFFKeW5tZzc0UTRabFUyaDZhTnNQWTVHRnhHaHdwZjBpVGpkdTMv?=
 =?utf-8?B?My9LWTNSMUZsMis3OS9veW8za0MrY3k2SkFPT0FNRmQ0MVdzZ21rWW5nR2U5?=
 =?utf-8?B?bXNIUnliaW9vbHp1czdqcFNRSlVnMjRuNG9tWU55NS95QXg1WXUzMDRTekZ2?=
 =?utf-8?B?TDNkRE9zSlh6cS9tSE5kcmJSRHJxQUNodnU2UXIrbTlVWWNUSmt4RVB0U0x5?=
 =?utf-8?B?bnFnSU9qVFpkRFRHYzFhZmlxbXNuY1UvMURNS0VzNGMvSWd6Mlo1R0pkZGE2?=
 =?utf-8?B?NHNJSTc5bTk1bk5idVhoZVVieno2enBOREVEMlFTT1JVOU5MYkUvaUJEKzQ1?=
 =?utf-8?B?ZlhKcVRyZ3ltVjdPRDJ5NGtpRG54WXJIbEJZQmdZNXg4UHRzZ09odDhud085?=
 =?utf-8?B?YlpTNWZQdE5GdnR5bS9ML2E0cUZpZnZnd014bzRLUGZMQlVZSVZzbTIwSDRM?=
 =?utf-8?B?ZzNDZzhHbDhuVlpCSFBlUDBXQ0pMTFJZSjJrY3RaQ25vMTk0Sld4Q0dVVURv?=
 =?utf-8?B?aDlDbWFMYWprT1V6WDZNbDhKQ3o3bmtBOS8vMXU4VXlpakhETDBjYmpwZ2h2?=
 =?utf-8?B?NlUvVWNJdC9CR0dwc2plSWpaKzVxQkZZK250SHYzdUlWbkhUVVA2dEN3d1E2?=
 =?utf-8?B?My93SlBDdGxHb3E5dmJ3QVNoRUlBeS9ZNEFpR0hZRzh5dlBWVC9NTDYyekNn?=
 =?utf-8?B?VE1Ob1FPemlHYVY3VW53U1NtZHhvc2hpQm5vTHQrd2N3V0Y0RmU0Uis3dlFq?=
 =?utf-8?B?SGxRZmRNT0VrM0lReTFVWXh1andwVnF4T2V3VXJzOGRwVGI5QWR5bXVEdWRN?=
 =?utf-8?B?QVR0VTR4NXc5VzlxMVU4SVVuaGhsOS91dWZHWVdFK1NtVnRTeXlNN3FiUG44?=
 =?utf-8?B?endzTUVXVzJXVDBDQlhDTnRXZXlCWXA0anlRQ2hiTkxHQTdVOVVVa2xBQ1c1?=
 =?utf-8?B?czF1aGQvZ0hpN3ArSEE1L1ZWUVR5S3FCT3JuMlNnVUVIZnpLSllZRjdyWTZE?=
 =?utf-8?B?bHIzSjVyamljOXVSYTJhWGdPUHNQN28rb3RtMHFqYlZ4a0lFeDhwZmgvTDF4?=
 =?utf-8?B?ajN2QWlaS0IwdHhEbzMxMU9DS005Q0NITTRTd2h4VTBYMU9SOCtwbUhXLzFs?=
 =?utf-8?B?MnRRNEZVenEzMktaMEFzVW93ZnU1dy9UWFI4ZEV4R1ZDckR0TGphaGsvbm1C?=
 =?utf-8?B?MFVvNDQyQVFNVG9qaFFyb1NuTkNjSGwwZDhSMXRIMkFFcnhuMTJqUnVieWxX?=
 =?utf-8?B?UjZRL0YySlBHdmJGTlNZeXpKWUJtQXFDdXZ5QngxZUI1RHZ0Y09zVFVpblZp?=
 =?utf-8?B?QWdEMDgvbDhWaHJTbmRHNmZLZEl1RUQ5bk94WmNaWXBGUGtDeTZYdERMVndX?=
 =?utf-8?B?VlEvM3Y3VU53VXpHZkRTMVZ1NjkxL2NpSHFiNVhlSGVBQjg2QVJMbVFCMU1D?=
 =?utf-8?B?TTNSRjcxcGFyMHFJWWpYOUJibWpVUlhMWTV1d3h3QW5tNTBhOGhhSmFXL3pq?=
 =?utf-8?B?aGZIQ3pmUlp4TmZabi9abzZiR1I0YThPSjhLS05SNmtYMjFidlozV3Uzb3VU?=
 =?utf-8?B?blFnaDJ0RFJQVlpkajF0QVpBR0ZBQTJCeGlCN1N5ZUQ5VC9sdGE0REZZNXlX?=
 =?utf-8?B?U1dQVUtNMkhuMEtHL0lkUTRJMks4eHRBV2pMS05WN0tqQ3pqNjdNVHlod2RF?=
 =?utf-8?B?c2F3cFJPQURIVGNGLzN3U3FHOWoxMFptT0txQUxvckZONWVUU3ZVaEczMDZ3?=
 =?utf-8?B?aHdzRUhWcHhGV0JpcDRuck5aK2ZxRHk2ZzhUU2xYbTk5QjVRWXBsMjFFUEVi?=
 =?utf-8?B?YmRwZlJsck1tZkdqR3BwUmhEdjBzeURBNm9VQllTRG1IZDVVMC96MVJsMkdl?=
 =?utf-8?B?a3E0eG8rclFIRDBJV3hYS01qeHFkNHB2S1ZOdGR3M3kvVEhEY1dRVVpNQ2Yx?=
 =?utf-8?B?d3BnY051ZUxLZGwyZ3M0THE1WkU3VHZCcUtCQWlyS2t5Q3dLWFJxaW10VHFF?=
 =?utf-8?Q?OZiU2h5d+Tog9+MqM54q6clj6kx8XaaaxEUWrSSGAU=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41166c60-9dd8-4a9c-f737-08d9eca6592e
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 15:02:25.5696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HOQHgvWOrWbyEGx2EltkLyJ0B5lv4ZkgbO6QSb8+tz3azAIJds5zQRxL6b27bNLj/l48tnFDtBrZ/sM//RTwgmFTeoulS6OCd7NxYYWN+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5129
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::712
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::712;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

08.02.2022 18:36, Emanuele Giuseppe Esposito wrote:
> If a drain happens while a job is sleeping, the timeout
> gets cancelled and the job continues once the drain ends.
> This is especially bad for the sleep performed in commit and stream
> jobs, since that is dictated by ratelimit to maintain a certain speed.
> 
> Basically the execution path is the following:
> 1. job calls job_sleep_ns, and yield with a timer in @ns ns.
> 2. meanwhile, a drain is executed, and
>     child_job_drained_{begin/end} could be executed as ->drained_begin()
>     and ->drained_end() callbacks.
>     Therefore child_job_drained_begin() enters the job, that continues
>     execution in job_sleep_ns() and calls job_pause_point_locked().
> 3. job_pause_point_locked() detects that we are in the middle of a
>     drain, and firstly deletes any existing timer and then yields again,
>     waiting for ->drained_end().
> 4. Once draining is finished, child_job_drained_end() runs and resumes
>     the job. At this point, the timer has been lost and we just resume
>     without checking if enough time has passed.
> 
> This fix implies that from now onwards, job_sleep_ns will force the job
> to sleep @ns, even if it is wake up (purposefully or not) in the middle
> of the sleep. Therefore qemu-iotests test might run a little bit slower,
> depending on the speed of the job. Setting a job speed to values like "1"
> is not allowed anymore (unless you want to wait forever).
> 
> Because of this fix, test_stream_parallel() in tests/qemu-iotests/030
> takes too long, since speed of stream job is just 1024 and before
> it was skipping all the wait thanks to the drains. Increase the
> speed to 256 * 1024. Exactly the same happens for test 151.
> 
> Instead we need to sleep less in test_cancel_ready() test-blockjob.c,
> so that the job will be able to exit the sleep and transition to ready
> before the main loop asserts.
> 
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>

Acked-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

