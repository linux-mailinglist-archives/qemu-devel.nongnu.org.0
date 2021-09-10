Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA257406CF0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:35:44 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOggy-0002oc-2F
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:35:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOgeq-0001Ee-EW; Fri, 10 Sep 2021 09:33:32 -0400
Received: from mail-eopbgr80130.outbound.protection.outlook.com
 ([40.107.8.130]:5697 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mOgen-0000f7-0D; Fri, 10 Sep 2021 09:33:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5oUOVI2MSaJwDCI/zggApF+tST52KLjIUxHn8zja9Lr93P8IMRuSMd9q+SxoWKaC5DWAGNkjtN8yuDXhXg9EB6Vex/zkyVMDhMOk2r9xuUJtP3kbNDX7jdjSmNln+w0lR7UKg/btJAjb5PqHXLTqAc1UN2xWrg6VI8EOjEPNY96u6vBv/sXqHajKcnQXGIkNkmstRnXAo3yiB9WUdsF70JHH0SrJ6fnZWWX/0kbTy4HKQ+gKuJlR/zKwf3GtOuomWFVaU2OIxde6qtxC0IQ6bYqr+snUppeTdOxToAiq2ATOmGfFm9yNGHEZRCUI8MEo0lT6MKfHaMXob3S2vrUKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=ekhIYu2JqIUDthRA+lFT0AO7NZ9wRlyNe/Uu1Y9cefI=;
 b=M8ROV1ZqFEuLF0nUANhxpc174QFW1MdgZVqFgGc4E1rJ1lrd1Gme02jiV/XD734xtfPGXEGNWVbW95Mo0J+0Pqe57iH9TFLItomDHZexsubSiYUmW9U1bSINfEJqqGZzL952Dmz+j6XirDAQTwRG19n/C/TW9wknRyvFq4HP0zizOLfGcEuUrtwwBmYdSgKnZXTsyb17/j26ERr7mMcJxbUwhHC6OHlUglXF54lSmjWmdR9PRSBEnS/QBSDTkSq1UrDxjqIws7m3iWeSBCgd8zDtprw5YMYw/JA750VrEbbBdYMbXLJLkUtG9bri5jPTXO98NMFQaasPK3k78mfDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekhIYu2JqIUDthRA+lFT0AO7NZ9wRlyNe/Uu1Y9cefI=;
 b=olw+KU9F/8gGjCq4vGNDhRsGDUQOhRumVY7OFXPci2yKBJS8IsCF4JdQx1k6E3WbLX9gfXp/8lM4zsoJHgqTX48aobpjaW/KBiDHFZn+3BUARZ53YMbWb1OAGuEE4FR0SmO1+N3HeGKmBqKZVkoFUg8ZdZT268jWZwgGQ1JVF1U=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1652.eurprd08.prod.outlook.com (2603:10a6:203:3c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Fri, 10 Sep
 2021 13:33:24 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 13:33:24 +0000
Subject: Re: [PATCH v2] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>
References: <20210910124533.288318-1-sgarzare@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-ID: <3673a1a5-8c3a-18d7-a327-1176937cb50c@virtuozzo.com>
Date: Fri, 10 Sep 2021 16:33:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20210910124533.288318-1-sgarzare@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.100.5] (185.215.60.196) by
 PR0P264CA0196.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1f::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 13:33:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 54b2f2c9-3c2a-4c9e-bd99-08d9745f9078
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1652:
X-Microsoft-Antispam-PRVS: <AM5PR0801MB165278095C06880A297676B6C1D69@AM5PR0801MB1652.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8YLQd4NEQ8lojlrw15gGTdgjXehW9477seIRdnnBV008wf8rv8R1LKfGHh+QrgzIAl5kYhBL9QdoiZTTTckOpEsLkwRJ8cbsVEB4p1qV3n6CFEHkPRXfpmUzUPbsRjKAwosBc0z7p+q/xShoFa0T4Z7JWFDlmiolakDJoAtmQR58+Fwc4H+q8dZvJAGswzUoz1dOi/wgYXJMEhWUJG/Noh0I6WFnb3GIeWnaDJAz3sBtS6GNT0s8ZgD0fCUkBCdjzvbGMxrzi+suCjBD1i6B2cbLFPJQDDdcNuKAiSpPJKPhtVsQyOlmlKXJesaMNlqmHvymm2eW+2RKHILJ9TSqQaSf18wjpxgCBRiXp1mAiFE1SIjIsh8z7g37RaYSLQjU55hZZgTZOAV4A7pK/56sS8nnELwTrAC58bbfJ5a1VeV4PAZPqWzfSx92oF7jNGCMTI50AwBOdn9kGqoZLXtEZfzrNTpQAn4c+yiPGpaPzvc6ZRD2TNNLO42pv3dFQIbDBzNxScyh1fQYwIBPeLvwEfBD3OJaPCJiW5xRoulubdPtqSQL9N/h6/STrhilEpL3Cc8J38fNFwpHxpOaRHubsUlvEeAnoLUQL78fGDzFfQRfzU92+7eWZOQXOYIBT3K66xcdESd4qgBYLeBrU2dg0z0XdnD10AGrjQz4P4gUVlMJx9ciNhG08OBaDUDoTEKHDglnbfsEcOQdlEKZmfXORgjQcZzElfgaDDo9Gj/MiJx5xF0ClYO6Y/ExlrzTh9jMivaWffxSJKfBI6Ygg89FdwZGmPLjR6IMlEfcdZakiDPoxEtn3B6Ics0T5s7kaQERd9KmV0FiB5mStMgujHs7L3JAzrXrVrosISP3rhRIUdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(316002)(52116002)(54906003)(5660300002)(83380400001)(4326008)(8676002)(66946007)(186003)(66476007)(66556008)(31686004)(31696002)(8936002)(26005)(2616005)(956004)(508600001)(86362001)(38100700002)(38350700002)(36756003)(6486002)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VkF3MC95NTN1bWw1SlJhdkU1RkNBQWEwOXJlS1p6ZmROR1Rzby9ndHUxSzRE?=
 =?utf-8?B?eFNTZGdVMlV3cjJnTnZOcDNxL2tQeWd1VzZ6eFFtZEdlTnUza0lFQWZ1ejl5?=
 =?utf-8?B?d0R3bUY4bUU2RmQvVXFQaGtSZ0NKNzJieEZkUEtTL0llK0pLK1V5T2hWM0VM?=
 =?utf-8?B?enFMa2crS0tOSkJBMXNwc1NEcVNDaHV3QnZ3ZDFCRlU2L2dMUnZmTHFMUDcy?=
 =?utf-8?B?T2Jac00zeDJBK05WTGpEK24xR0swMDdLejVPVHlzdXpXOVlJMmk4UVphMjRU?=
 =?utf-8?B?enkyY2htOTR3dXBuelVRWFlaQ3RsQm5CTURzWHByaTU4cGlOVkVpelhiRVpZ?=
 =?utf-8?B?YlRZSW4vRE9KWHZUdk1GMkhUQTBEVDRiS1crY2tHWjJuT0dBckpsbzBEYyty?=
 =?utf-8?B?anM2aHhoQlA3WGJ3cnhTTzErZWhFWGpUaElXK3g2R1M4YVd3RDJsNkVZaVhv?=
 =?utf-8?B?bm1nbmUxUUZQTXNpT0Rkb0RDcGtVZVh6MWJET2Frelk2d21VOHU4WHJHbHRK?=
 =?utf-8?B?alNMZElmeEtzcG4xejB4NWhoVkIvUXZMWmdXUllHaldSRTR4eHczRjJQUW1i?=
 =?utf-8?B?NDlaU2FHWnVGd0lhRWYvb0RDR0JlTUhPUVYzQXppbjFUK1hzdjlFT1N2aUt3?=
 =?utf-8?B?NzIrNzBPa1RoS1pVZUM5a0k0ZytDRXhUS0hiVXRXTDY2allaYU0zYXIwbXZx?=
 =?utf-8?B?cjVTYTRrTG5oamF5Z2taWUNyYm5KN3pIcUo4OWowTkF0b1M2ZWlLNmRpVXZG?=
 =?utf-8?B?Vm52R3dSRFd1TmljdDZaNU1vSTN4K3NzakVEeTRReThXQzJnWll5SVl5UnJ5?=
 =?utf-8?B?UFRLUC9nZ0h0UVUrTXF6WmVrbDZQb3hZVDU3RTNGRExCSlBrOUNYUUFzL2Rq?=
 =?utf-8?B?dy9HTFZkd3Z4MDdrUm9sN2V4RmhDaVMxSURzOE1FZFVYTXVOMm9wK2VtMVBQ?=
 =?utf-8?B?NStHbEJrQ3FiSlhMemcrVjBicmlPTktvSjc4Q0RhQUJPUC81ZjYyLzBVK2N2?=
 =?utf-8?B?dW1ucExpL04wVlhnNmJEVjBVeUtlOEh0ZmtrNDd0bGZQNkQ3SzNxM0YybWVq?=
 =?utf-8?B?cUVTQzBWNGhoaXIybXU1d2V1a1RhRktEQ044WXlwbVZUcE5RNVRHeCtJWmZk?=
 =?utf-8?B?bDBML3B0MVlkaWJUanRBNXN4b0Y4Q3NwQk93MmUyMEc3K1VGU3NGVzdqemw5?=
 =?utf-8?B?bzF1UzBPb0pmV2hOS0J3dDZIOUY1UmZQQTNPUDFjWEw2aVEyRnkyZStxTGdW?=
 =?utf-8?B?ODZEbUhUMXZabmM5OC9BaDZnTFJLRndRNktLdkhhMXNNVVFaTWNUWHNQbXh4?=
 =?utf-8?B?NmVUNHFVRUpCZXg0Q2t1bE80L0MvWnNSSDdTcm9kY051d25sS0hCZlBHTy80?=
 =?utf-8?B?QmQ0enNnWXZFVUk5L2RncDJxN3NRd0d4alZuei9ieTNrMWdrVjdNY2l6Z2s0?=
 =?utf-8?B?S3E4TkRnK0dvamRFY0VEbFA0S1pMMUdJM3ZGZWd1bjg5c3I1RmJIVFA0T08z?=
 =?utf-8?B?MlhNNElvL1BDblY1R2J5cVJQWkovMk5RWm5UVVFIUjJKTnRySmw3YzFZZk14?=
 =?utf-8?B?TnFJc3hvYTQ0WXNod2lvSmZBa3RweXlnc29naWQ3VFZ0anJCN3hNcUpldCtO?=
 =?utf-8?B?Rmd6Smx6dlFGdUxodzZDTVF0b2xjdlk4YlZtNlU4VDJ2R1M4TFJPWXgwS21G?=
 =?utf-8?B?VEtIaEJZaUIxWGppZUxjYWJQOU9VcTdVY3ROMmx5YkdkcS90dm5UaHdSOE8y?=
 =?utf-8?Q?CdFCNp4LZ7fqvsBbqGYHqfolO6qwhFF2uejd+1U?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54b2f2c9-3c2a-4c9e-bd99-08d9745f9078
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 13:33:24.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW8VML3UqmFeTjBkSxFjjB3ds42qj9PiQ3cFqFJpU7Mwpt2SA0I8Eu5Y6lSUpbSQJuRQywlqMmQ7bHmtoUpO5gcCOggdWciQ8JZxWCtvQwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1652
Received-SPF: pass client-ip=40.107.8.130;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_NONE=-0.0001,
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

10.09.2021 15:45, Stefano Garzarella wrote:
> In mirror_iteration() we call mirror_wait_on_conflicts() with
> `self` parameter set to NULL.
> 
> Starting from commit d44dae1a7c we dereference `self` pointer in
> mirror_wait_on_conflicts() without checks if it is not NULL.
> 
> Backtrace:
>    Program terminated with signal SIGSEGV, Segmentation fault.
>    #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>        at ../block/mirror.c:172
>    172	                self->waiting_for_op = op;
>    [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
>    (gdb) bt
>    #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>        at ../block/mirror.c:172
>    #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
>    #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
>    #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
>        at ../util/coroutine-ucontext.c:173
>    #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>        from /usr/lib64/libc.so.6
> 
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=2001404
> Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
> Signed-off-by: Stefano Garzarella<sgarzare@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

-- 
Best regards,
Vladimir

