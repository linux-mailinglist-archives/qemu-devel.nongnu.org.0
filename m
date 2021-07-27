Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1793D75A2
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 15:14:08 +0200 (CEST)
Received: from localhost ([::1]:58500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8MuN-0002ir-6g
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 09:14:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8MtW-00020l-2c; Tue, 27 Jul 2021 09:13:14 -0400
Received: from mail-eopbgr130125.outbound.protection.outlook.com
 ([40.107.13.125]:3619 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m8MtT-0002yc-Ng; Tue, 27 Jul 2021 09:13:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mC93M2LUNI37sQq1U6XYJHiyQm830416l2dmAkecO+9kPrTF/6c8k5egEdvw0uj9ewh/v6hD6ySnrWAtapPHolWYbNyT4Ae2aI9bsi5ALlWwldoyi0QCQBPgwtGX0t1l860o1CMxkHoKHK5/2mhxJVMQfq6EpExDHTKfppRyH36DQJpP1NEYojER2dVgxndlkp1SG4ZcjOSCXDe3P1G8I5Zx1hRx+wzIMrcyqochuL4x0a7bwHORbLAtqkvfv3cboAA64WrEdB0ONbRKbO1piK3pQFHQ/v8DiH7xm4rMJ84ohXriNS0RjG64qCAB73vOhGUftDBUv8WW0O38k3djbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYXnO0s8AGk9L53FSWaJBtYbZvGu0zSNMZwWYFkg+Vc=;
 b=aRs9Zzc2LOHdJ3RDFQs7SNUuYfPWkzazo3Dmky+CfLCQk5mPdURU1o7vaHTz4Dj+WqM+U+hSAnT+TcbbyXThhq2V4qnUpde/sg8GVlnyBQuHoPGWip9Tj8ot8g51DpyZeOcP9ggEKVD2LI/zaS5TUVu5GzG308Z1JRZkneIwBpzQIjXPoM5ZJy1CHF22n1JB9V5SYTpzJXHRIhIJ4XOQvOpHOPX7CkOk+5eRIbf1Pjec+udQzfo6RJKDZifQwVCuUJF6M8/SW4tftF6h7b/HRwbGWqmcw18C3CDnnOkRbHNwEWi6HFYA6v3tDSzuTmq/vV1mwXZAcVQSGAizn43xzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYXnO0s8AGk9L53FSWaJBtYbZvGu0zSNMZwWYFkg+Vc=;
 b=B6fBrSaQnuwP3Y3LPACvNsN1iJ76utIJ5Ku0EHpq4VNy4G9SYkHa9ssyeZzy3NbUgP56vxIZ5kxciNuIJMVc+gQRaNxpmMD64eRRA7SFBIBhyWmSaS3owFbVRDXhA5DagRyzJVEfNmPsazOTZnFHYSQMdDe/AR+RZosxC5g8tAA=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3093.eurprd08.prod.outlook.com (2603:10a6:209:41::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Tue, 27 Jul
 2021 13:13:07 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 13:13:07 +0000
Subject: Re: [PATCH for-6.1? v2 6/7] mirror: Check job_is_cancelled() earlier
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>
References: <20210726144613.954844-1-mreitz@redhat.com>
 <20210726144613.954844-7-mreitz@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <be900ee5-f9c4-cee6-e3c6-66aeb0a0d89f@virtuozzo.com>
Date: Tue, 27 Jul 2021 16:13:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <20210726144613.954844-7-mreitz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM3PR07CA0147.eurprd07.prod.outlook.com
 (2603:10a6:207:8::33) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.211) by
 AM3PR07CA0147.eurprd07.prod.outlook.com (2603:10a6:207:8::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.7 via Frontend Transport; Tue, 27 Jul 2021 13:13:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4ea0b8a4-65d5-4972-7a84-08d951004669
X-MS-TrafficTypeDiagnostic: AM6PR08MB3093:
X-Microsoft-Antispam-PRVS: <AM6PR08MB3093F3E48FC74BC21FFED873C1E99@AM6PR08MB3093.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iZNVnQs6Thmb4HK8n7py7ty8rrSelQINoxRHVp344ZMzFcp0TxT4zH1BtGCRM04wI4lz6yE0Ws1AVj1ssG7EJpaffxf2Km7Y6ZQyjpdAIBAMQ3KTMENk87exoRrqqXnU64D2QrYv14JGTxcw779f6BvSMVNFCl4azAzPRp+vYSVD7FVO91MccxGUeQrf+/ajIetamdQK9PxP+u7p+7kGD87IgF/rnXSMeSHD3e2M0nznPZsYIYSZMKjdNLhA+IBMAr43V0+iABa/AIu+XSJVvlAA0H/gp8KOUcFrMzPQkXUrNCnToCL70kO6LOKRCrPy6Jqvut75NSfQqObWi2b+HGRClr2kxFQKB2JphBNkFmVya/OCiyv2mDJOfpF8VinJ+mULoms+T74tRO4i1P80GApwFb3T27GGbsiYhKNBWm6u4fXbj8V6RMZGgPZUAvKmMH4cdy5CY3Y7dvYrdtGwm7yiA6HobT9pXeZ4ma4Odd0LBpT4sE0IFAcM2bFTKIjS5RYA7M/L2zTLRQEUphDxwyuRR8fsIGnw7R+oLEwS1ghVq1HcFeQh0fjqfrHOnuCJo/DZFYVMTN7mrqd4kt1WEawRXhw3yy0PDBVPpOznZOROH64Ff8V0cBTWLl+JTYFEbtPu+OWWMpwABBqfPSA2diKz4KeT4aLTYOjfIW50e2MYpl/qVzGQA+n0Zf7RgVtP0VJumxGjVRY7sfNnQQzTQ/9WgAKvu19eFnGIt6A6jzjRP2DGryfPRR1ikHYslrOkDmG2zLdLJWCI0zOeVDMxjZDZRL2a+WpARIVzwRDTYrmfTsQdMWWTkJCWArfqHSMwuPqt6zVXDUyk/MCgYoHPGW52J7r39hvqSZ95+gD6W18=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(366004)(346002)(136003)(396003)(2906002)(31696002)(86362001)(316002)(66476007)(6486002)(4326008)(66556008)(36756003)(38350700002)(8676002)(83380400001)(54906003)(5660300002)(956004)(66946007)(966005)(52116002)(26005)(8936002)(186003)(2616005)(478600001)(31686004)(16576012)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0I4TWdqWE9pSHJxUzRoM1oxWG9Ba1V2dFN2TVdQZFROcGlXSnloOTF4L0Uw?=
 =?utf-8?B?b1ZPcE5NN2xhVVdUZDNtNmllbWluOVlMMjZoRGdMcDhHRUUyZ0FpZEljTHor?=
 =?utf-8?B?YzJTNlFIWndkRXVBZTNOK3B0VUFjZkNtbkE0UVhINFBIWnlkeW1tTlgyVHhD?=
 =?utf-8?B?MVA5MStTZ1I2eGFCN2lic2lOTWgyelptY0I3MnQ1U3dJK2w0cFhkdkJrb21i?=
 =?utf-8?B?bFpKaDd6cU93MUh2Q0hzdkVkNDJrRGxJOTBSQWtsMklHN0dMZm01RHhKT3ZI?=
 =?utf-8?B?TEZFbEFiT1gzRkxoTU50R2hIOGJsRmgvZnVOdHZQTGxxSC91RzdMN0NyMHZZ?=
 =?utf-8?B?UklVa1g3Ly9QOFFObUNSMkdJcytzaXhMUWVPYzVsMFYzS0NidktkSUc0VFpY?=
 =?utf-8?B?ekcrRjlVL2pxd1lTNjhVQ1FuTzR6d0ZBRXZGY25GcUVLZ09yYkFpS2U1eGRQ?=
 =?utf-8?B?RHcvNVo4Z1JJUkhoaU9xcXQ0MW1EZlhDUVN3QTVyS1hVUS94cVp4d0ZoMGZ4?=
 =?utf-8?B?VVZmR0xXK0RVUkNJTFl0ZEw4TzJLbEVzNmRMMGhyTUtmYmdQS2g5L21TWUdS?=
 =?utf-8?B?UTBvN0lBQ1plUldNZjhaQjFBblRINFpVbXRGSjAzUkpRV3dITGFSOUpNQ1Y5?=
 =?utf-8?B?b1BCemRnM2FXS3E2UkFwdGNYdGRHTEhvUHRoaVpaWHJvTlhFcmhlaXVEcE5r?=
 =?utf-8?B?U2NjczRVc1JNU0pyRU1xb1N0a2JYTXdvdVZiU2JpNkJkS2VkSVd1WWF3SUYw?=
 =?utf-8?B?M1R5dVlRNlN5dFA3TWxmc2pVS0NOcm80SndERS9UbHZ0QW4wUzVOTE1RLzg0?=
 =?utf-8?B?dEVkTkFQRi9FU0IybjZGTjlzeUs4eXpLSDdLRXhDdndNa05mK290Q1lpamRO?=
 =?utf-8?B?clgxUWZTMnBCS3ZPZEdmd2g0U2V5ZlNXQ2RLUDZSeXB6aG1iVDYrZ3VjT1Nn?=
 =?utf-8?B?WEttZGlycXRyeGZtUTI1NlRFWGs2eE9MRlFiMlc1NEFEZWVkZVMwcVlmb2t4?=
 =?utf-8?B?Z0pha0R5akxpTEZMU2JkZFdFRWlWbG1JS1MveDdNdWRrZjFFZXBPNi83OHMw?=
 =?utf-8?B?bWFxN3U4eU5ldGhqd0FkWUNuRThLS0h5Q3V4K2N4ekJNWkJPdEVqSkQzSzNk?=
 =?utf-8?B?TFNsaG1PMzROd0JJVlRiM3huR0xaRTNFWU1DRmM1S25CYTNBMlFkYTlCNDdp?=
 =?utf-8?B?THdEUFpxb25nVTVDMngzZU5DYkJxRWR2cVZ6ZjBESmR4eDRFMWRVZEdZcEdm?=
 =?utf-8?B?czNZdFdocDBHQW9SaDdJMXkvM2Q0OHQya1h0dUg2VnRXYU5leFh5S3hHeFFP?=
 =?utf-8?B?cXF6c2Vaa0JBdU9yMGRyL1NlYVI0b2h4bmVtZXh2K3kxQ1VUSWs1YXhMTFh4?=
 =?utf-8?B?UDNDQTNrTWliSzFnUm1TVDdPVzlpWW9XaG1YK2syaEtPZWo2ZWd2T21vYndn?=
 =?utf-8?B?MVBYUDhhQ3FlRnV2RWpLSkk1QTNvdFhmZHZjOHdFSnpJeVFsOVFLZCtnL2lM?=
 =?utf-8?B?eHowanUrZGRwZWFUeUNxSWpERGZkc3RmRnZwQWxGSlZCdXRBSUhxQnVoOXd1?=
 =?utf-8?B?MkFoL2FSZFFPcWhSZEViUlVvUkx1NzZ2R3I3cHcxR1hoSmx1YThpYm53bzBv?=
 =?utf-8?B?bTVONFJEdEZZVDkvVm45SmhBUjNJUjJwTERIRTNQc0d2alFRWWlEQlBDWmJk?=
 =?utf-8?B?RlJlRHU1clpmRUk0NzBuMmw5M1VETXMxTXhPRTlENVMvbllVZXlTR1ArSUlZ?=
 =?utf-8?Q?SoKxtqBjGUzhUIJhDtpJ+VthGTaU4UXQWs3dhTe?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ea0b8a4-65d5-4972-7a84-08d951004669
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:13:07.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aRzrRdP8VySofOIgnSYmgtScGne4OyZ/H4eQnpR7ZIOKGCn4qIwqIjP6SJLA+eLyUR+AWbC3ZLlV9Cwz8YjahsbaVIhe8GMqPtWkQRaxQKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3093
Received-SPF: pass client-ip=40.107.13.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
> We must check whether the job is force-cancelled early in our main loop,
> most importantly before any `continue` statement.  For example, we used
> to have `continue`s before our current checking location that are
> triggered by `mirror_flush()` failing.  So, if `mirror_flush()` kept
> failing, force-cancelling the job would not terminate it.
> 
> A job being force-cancelled should be treated the same as the job having
> failed, so put the check in the same place where we check `s->ret < 0`.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/462
> Signed-off-by: Max Reitz <mreitz@redhat.com>
> ---
>   block/mirror.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/block/mirror.c b/block/mirror.c
> index 72e02fa34e..46d1a1e5a2 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -993,7 +993,7 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>               mirror_wait_for_any_operation(s, true);
>           }
>   
> -        if (s->ret < 0) {
> +        if (s->ret < 0 || job_is_cancelled(&s->common.job)) {
>               ret = s->ret;
>               goto immediate_exit;
>           }
> @@ -1078,8 +1078,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>               break;
>           }
>   
> -        ret = 0;
> -

That's just a cleanup, that statement is useless pre-patch, yes?

>           if (job_is_ready(&s->common.job) && !should_complete) {
>               delay_ns = (s->in_flight == 0 &&
>                           cnt == 0 ? BLOCK_JOB_SLICE_TIME : 0);
> @@ -1087,9 +1085,6 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>           trace_mirror_before_sleep(s, cnt, job_is_ready(&s->common.job),
>                                     delay_ns);
>           job_sleep_ns(&s->common.job, delay_ns);
> -        if (job_is_cancelled(&s->common.job)) {
> -            break;
> -        }
>           s->last_pause_ns = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
>       }
>   
> 

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

