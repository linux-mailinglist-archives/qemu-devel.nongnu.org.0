Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B92303DFA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 14:02:43 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4NzV-0001Yl-A0
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 08:02:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Nx1-0000GJ-Ss
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:00:07 -0500
Received: from mail-he1eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::719]:1922
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l4Nwy-0001eZ-Ht
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 08:00:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbR4IjJBAAL+4Q6iAwTvFtR0H6L9u549Xw0wasSg1qto+Nuf7IhJa8/AJKv4fcwDW9L1+nshdjrviyY3OTF/SytvqrhHAn9Hl0157YhC81KGjI9Q2/OmWqH/SKBYISTHwFCfnJiXAxGEXZm01FcaExzSDAH8CNY+Lem1KB9Bph7gWFEOrP6OXsZe/HWLs+T9d94k8D0I50G2TtyY/zWixsukYFIqCM9eRJf3OyAFpIAMMK3Rpnc+K2KsOUeZmXsHeMRIHajWZh1CDKvUjc4WVK7Kn9phEGmgLjv3QW2GIjlsijBoJAAI8hCYN50JfMjxA69iHMts6MqPtCop8Vdtdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD2ZPvmfHAi++tX/9R8L5S4yExFl3qnR9OVIds+dPmc=;
 b=BhR595WFOdzJw76osvWyO0TZ6fTrJUsAEFDbZpk+nBn5kIIu6eZMW7eFVyLHxz6ZKcFsCtnJZ12YLHAby+VMWUSiOzPxSZdq2Kn85iW0BdRpZIEcvBYNuoKL4fWwwhDTLZPuU2tf5URAR5v+j/FF00m0TTdqUdHZRnGVqkz/ACI3VD2d8SsqnWdJ2pH5AMK2mkpUSBxCxXiZHj/FAVUVGPixTeQZ6BDBOTPM3HIaQjIwFsz8cWWUPTUolUDIsdYkHNOEFEKYqxbWcB3itUehKK5gDjO7TPyjI3CDKg1DWmG4v22hhbnA8qVVgmH0V6LSdNlBWoGOuAtTbQ5YImeiuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD2ZPvmfHAi++tX/9R8L5S4yExFl3qnR9OVIds+dPmc=;
 b=ckf1XraYV1YOU7TwxQLvyhKPK9qJuNkeq64mcCfzJklplXxPKs1ojNssUP7b95vixL5ToH9WAapEw/raPwDxDNBf83cC/DaKIczqXUwmnGKnyYbtKnRXUd+6PMYR5Js0kH9PpEnM5WehQAQSfBEUnxufDkDrosIUhjEmxEcdiUA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM7PR08MB5447.eurprd08.prod.outlook.com (2603:10a6:20b:10b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Tue, 26 Jan
 2021 12:44:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 12:44:44 +0000
Subject: Re: [PATCH] coroutine-sigaltstack: Add SIGUSR2 mutex
To: Max Reitz <mreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210125120305.19520-1-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <7dc89925-764b-cdc6-8d25-0bae03d90be4@virtuozzo.com>
Date: Tue, 26 Jan 2021 15:44:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210125120305.19520-1-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [185.215.60.100]
X-ClientProxiedBy: AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.8] (185.215.60.100) by
 AM4PR05CA0002.eurprd05.prod.outlook.com (2603:10a6:205::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3805.16 via Frontend Transport; Tue, 26 Jan 2021 12:44:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d852756-b361-4c37-a914-08d8c1f82866
X-MS-TrafficTypeDiagnostic: AM7PR08MB5447:
X-Microsoft-Antispam-PRVS: <AM7PR08MB5447568A48B7FD6663459501C1BC0@AM7PR08MB5447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PEH03eTIAUJcA2+NR/mXCSdDoTRPEcvniPiVw2vP7tzlD6j7S8GPi5lTXc7/xShMUaZ7D5iAKsRrLyeqXv20BSJFrG7J9j3VcoNNOCWIOi6hO9YXhoqI5UyokGPOUr2gHyYal6dD7FLWq+TUA3CT/gzK5aGg0EM+ww5zvFZxAebX15hIy3SADhloFAX+JhADwAIBui3VJtfeVXFPyAgvwUBJ+4YYZ73xsAuteHL2/LtHAQF52Cx3SyKrHD0DOfR4tX0cMRolDlMDPE6rRLI9lbAa89aSij3C1L6YOzbpODmPMtHb2BsAwGLNHrVP0/skrOj51/oIDs0uSp+u0ddsNmJm4T9XEq/zvd6lohQUCLW12n70MzcfFytcwATc3i1woKz+Hg2kDTVRyd1ZmYGt1PV3jvDWFkC1Q6QYGKVPp3AcMkCu8c3U2ZeNL1c03B2GBH929nJeIkodckJhMiLO12c4QUQWUMORGo/D6jDJaJnSIAMAuFOKWjj48OVDoKNjI73T5vkqRhGV0X1HkUecpmvSW/G0bDoBB55T8sYi/KZOgZL8Rbn4BEBUSUamb5sq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39840400004)(346002)(366004)(376002)(52116002)(2906002)(5660300002)(36756003)(31686004)(86362001)(66946007)(8676002)(956004)(186003)(316002)(54906003)(83380400001)(16576012)(16526019)(4326008)(26005)(31696002)(6486002)(66556008)(966005)(66476007)(2616005)(478600001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Ymp3SnZWWW1xaFBMbFJRb2lBVGhMakdzd3NtZ0prWE5PcGtIM2JBY2pmZlRN?=
 =?utf-8?B?bVlYV0E4YUx3Um9UcFBxVlpJK0U1V0RtY0YwRXpxeVNGSUtoZVFmb0ZvTWtJ?=
 =?utf-8?B?YzNlOGwzR21EK2Z1bkFKWXQvaFRBdE1QVTJPT3FYOFV4YzlBS0lNWWpFTWRi?=
 =?utf-8?B?a3JoOU5xOU1qT0Z6UnhjTFBURVo0UnBMY3VLb0l2cThTaWxDdFc3WjdmdTRj?=
 =?utf-8?B?QjllVXFwVE5wVnhrdE5tWU5wYVBZd1NPYmZZWGY4RmtmV3FpRk9ETDFKMUtK?=
 =?utf-8?B?NlZuSnFndlhuWGF5MnpvYkkvKzZJN2lxcFpxeDN3bCtlT1RwMEtSTW0vVGxV?=
 =?utf-8?B?c2lUV0JHU293RVUvWnkvblkzZ1FudmNGK1A1UTB6TmpEOURySENHeEFRenNW?=
 =?utf-8?B?djczcUZzTXBVRXd5Um9MLzVRN1RuMXJ2NzJNNkhRNkMybWVmUG1UMzRrV2xw?=
 =?utf-8?B?USt0OGRnNWJhSWViL2NRS29ac1BOM3hsb0VMS2dUMGg0WjVMN1pVekdwZ01N?=
 =?utf-8?B?SGk4WTJGT05Pem9sUDM4QWl3dXN0VzJ6OWVrUC9QQ00xbEV3MFQrQloyay90?=
 =?utf-8?B?dG4vaUxjOG84NC9zSTZwZkMvT3FDemdqcmtndkVUa0JwOThXWW5YZ2xMdjNh?=
 =?utf-8?B?SG5yL1ljT1JYR3VnTG5aVGNZRzlpa1N4VENaRXpRSnJIK3VPMzJzdHo2M1Zs?=
 =?utf-8?B?SWQxd1JxOEFmeHdreitWNlh6c3kyOUYvdXhXbGVUU2NTK3NMVmRURlB2NGI5?=
 =?utf-8?B?aHMwT09lU09WcStMQ1gyUWtRVi9LMDZZS2kzbG9PdmNLL1VnWllNOGVTTXNN?=
 =?utf-8?B?K3Y1dHc3VDE4R082WnFpbStDVHkySnFlOUtFb28wWWJBR1Z4L1BuYWR6c3or?=
 =?utf-8?B?SkM5NWFUZ21WZk1kUm5yKzRFNjZnS2tjd0lXSkVQWG9RWVJhUUgrdm5YV3M5?=
 =?utf-8?B?T2o1dno2NzdWMW5TZVRiaWtwekpLNXgyQit1M3BiN3QrQjgxeU9oR2hnSGhl?=
 =?utf-8?B?MXBMQXF5QWp4alN2MnFzNHpaejZWdGJ1dG5KZDFJYXBDUUVHUlpkSkc5Zjln?=
 =?utf-8?B?VS9uNllIb2NpNmtWTjFiQk12clRSeFR0MFhOWDdZdjRIYXgxUEZEaWh3QnZx?=
 =?utf-8?B?WEdNU3JqWVlrYWhjWDFIRFA2a1Jia0VqV0pJQ0kzeldKdXZXeGlUS0xnaWVk?=
 =?utf-8?B?TkhXVDgxeXBySi9ZNzlzQWhnSVRGRzVPR0oyQkN5djlSdThsMmNueGNjR2N2?=
 =?utf-8?B?Z3R3YUJTME5aaDQzS0JLM0h1RXFucnZ0dzZrSzBZSGsrMnpQcVhqVS8zQ0JR?=
 =?utf-8?B?Z0IxTDd0YjhST2s2VCtPa1dQZ3dhOFVxUS9CR1BjSkVuRjRiK2RaeC9VaTBl?=
 =?utf-8?B?ckxpVUxGeUJnYnFrdzVDWmpyYi9kSGdEaVBCSWIxeVNSWmdSRjV6RlV0RXdh?=
 =?utf-8?B?UndvVTJwcWZmTktBdUhyN1g2T0RWbFBZdkdLRVZnPT0=?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d852756-b361-4c37-a914-08d8c1f82866
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 12:44:44.8464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKzXz1M1OxsH5Zllhv3FH4U2y2l9/LV41NUCAFk8x+jHlY2dWlnda4XG3Hqz4tui+xWhY8C4wLcBkdAp7pkMro+p6okg0IdlR/XbNPLicAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5447
Received-SPF: pass client-ip=2a01:111:f400:fe0d::719;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?B?TMOhc3psw7Mgw4lyc2Vr?= <lersek@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

25.01.2021 15:03, Max Reitz wrote:
> Disposition (action) for any given signal is global for the process.
> When two threads run coroutine-sigaltstack's qemu_coroutine_new()
> concurrently, they may interfere with each other: One of them may revert
> the SIGUSR2 handler to SIG_DFL, between the other thread (a) setting up
> coroutine_trampoline() as the handler and (b) raising SIGUSR2.  That
> SIGUSR2 will then terminate the QEMU process abnormally.
> 
> We have to ensure that only one thread at a time can modify the
> process-global SIGUSR2 handler.  To do so, wrap the whole section where
> that is done in a mutex.
> 
> Alternatively, we could for example have the SIGUSR2 handler always be
> coroutine_trampoline(), so there would be no need to invoke sigaction()
> in qemu_coroutine_new().  Laszlo has posted a patch to do so here:
> 
>    https://lists.nongnu.org/archive/html/qemu-devel/2021-01/msg05962.html
> 
> However, given that coroutine-sigaltstack is more of a fallback
> implementation for platforms that do not support ucontext, that change
> may be a bit too invasive to be comfortable with it.  The mutex proposed
> here may negatively impact performance, but the change is much simpler.
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   util/coroutine-sigaltstack.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/util/coroutine-sigaltstack.c b/util/coroutine-sigaltstack.c
> index aade82afb8..e99b8a4f9c 100644
> --- a/util/coroutine-sigaltstack.c
> +++ b/util/coroutine-sigaltstack.c
> @@ -157,6 +157,7 @@ Coroutine *qemu_coroutine_new(void)
>       sigset_t sigs;
>       sigset_t osigs;
>       sigjmp_buf old_env;
> +    static pthread_mutex_t sigusr2_mutex = PTHREAD_MUTEX_INITIALIZER;
>   
>       /* The way to manipulate stack is with the sigaltstack function. We
>        * prepare a stack, with it delivering a signal to ourselves and then
> @@ -186,6 +187,12 @@ Coroutine *qemu_coroutine_new(void)
>       sa.sa_handler = coroutine_trampoline;
>       sigfillset(&sa.sa_mask);
>       sa.sa_flags = SA_ONSTACK;
> +
> +    /*
> +     * sigaction() is a process-global operation.  We must not run
> +     * this code in multiple threads at once.
> +     */
> +    pthread_mutex_lock(&sigusr2_mutex);
>       if (sigaction(SIGUSR2, &sa, &osa) != 0) {
>           abort();
>       }
> @@ -234,6 +241,8 @@ Coroutine *qemu_coroutine_new(void)
>        * Restore the old SIGUSR2 signal handler and mask
>        */
>       sigaction(SIGUSR2, &osa, NULL);
> +    pthread_mutex_unlock(&sigusr2_mutex);
> +
>       pthread_sigmask(SIG_SETMASK, &osigs, NULL);
>   
>       /*
> 

weak:
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Side thought: so, sigaltstack coroutine implementation is not thread-safe. Is that the only bug? Or actually, the whole implementation should be revisited to check, could it be used with iothreads or not? Shouldn't we just state that sigaltstack coroutine implementation doesn't support iothreads? And do error out on iothread creation if sigaltstack coroutines is in use?

-- 
Best regards,
Vladimir

