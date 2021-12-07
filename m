Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F546BAA3
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Dec 2021 13:04:03 +0100 (CET)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muZCU-00035m-5K
	for lists+qemu-devel@lfdr.de; Tue, 07 Dec 2021 07:04:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1muZAD-0001tx-Hg
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:01:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1muZ9y-00086V-4G
 for qemu-devel@nongnu.org; Tue, 07 Dec 2021 07:01:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638878484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OCBtn/zdkfz53nsh8kBuECmPoV5gXsHn9XBCbOW2zJg=;
 b=VnF7w9d2RlxA6zv1WYn1XNSjjF9qN4XwRgEDbTRs6hjEvpMAMckI0peHNv8gloU4n72jqh
 1xzCKpeweK4etc7IT2nGSrR6Q/ohsNTo0AQWR+FN7XdY+FNnk+M0vbcOqMO1rk/xdRVPm0
 kV31CP9YEa6T96QA56Jaos+D3YU2Wnk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-k6g_4iCOO-C0Hkln5QDViw-1; Tue, 07 Dec 2021 07:01:23 -0500
X-MC-Unique: k6g_4iCOO-C0Hkln5QDViw-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay34-20020a05600c1e2200b00337fd217772so1260433wmb.4
 for <qemu-devel@nongnu.org>; Tue, 07 Dec 2021 04:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OCBtn/zdkfz53nsh8kBuECmPoV5gXsHn9XBCbOW2zJg=;
 b=Jc+n1lcwKhpI9m2yW6qKLgSKbc+W0e+52/Gb6eCRTOBDLVqrMlHT7/ARv7fH8ij0Ge
 W9+APdbZXxIQX1W2R0h4XHwhiPTy99kU5ClLPEWkBkLamQQgCSA0uk7OQOGEF1yItDqc
 pJguPEy4eKsO84B3Jw7bLXE1N8nMjLagIBzXfmWmrRJ2hcmmhHV6eK+YEp9U0OtViB7S
 Wdzu+DhzvF7nlw93D2vSbWy7eMVHACr2TUr9fsU9shgh0fhBFTpgzX+4n8agTWAT6svs
 uSAbIaIa6bQMjzpCin541WH9QjJwbCZQxUFWZzeLjz+2qg6YT7DvR5m1f3PqJ2cTFUNJ
 W8kg==
X-Gm-Message-State: AOAM530y0f39+R6uA/RFOcl0m6QZmAiL2Jf/o0L28IDDqujgcBI1agQR
 2xInPIbhcQ/ZUF6nxbU9y9416j5g7pwO7CXHrG/UlsKUkAZAfEfxIG6yNbJ30Zkoh2Q69XiMvtI
 ynZw1qIpIc/VNpvo=
X-Received: by 2002:a1c:e918:: with SMTP id q24mr6619271wmc.108.1638878482497; 
 Tue, 07 Dec 2021 04:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxRUcTD1zLLzt96Tfg3lxwS+JX/VCjEWrXgZOiazD26qZcAj9pWpSpwM1ikWFZPRtxrD08OQQ==
X-Received: by 2002:a1c:e918:: with SMTP id q24mr6619212wmc.108.1638878482131; 
 Tue, 07 Dec 2021 04:01:22 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id f8sm3007003wmf.2.2021.12.07.04.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Dec 2021 04:01:21 -0800 (PST)
Message-ID: <ff84b2f5-4737-7c25-a944-43a0774a2865@redhat.com>
Date: Tue, 7 Dec 2021 13:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] mirror: Avoid assertion failed in mirror_run
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
References: <20211207105619.3205-1-wang.yi59@zte.com.cn>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211207105619.3205-1-wang.yi59@zte.com.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 wang.liang82@zte.com.cn, qemu-block <qemu-block@nongnu.org>,
 xue.zhihong@zte.com.cn, Long YunJian <long.yunjian@zte.com.cn>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[CC-ing qemu-block, Vladimir, Kevin, and John – when sending patches, 
please look into the MAINTAINERS file or use the 
scripts/get_maintainer.pl script to find out who to CC on them.  It’s 
very to overlook patches on qemu-devel :/]

On 07.12.21 11:56, Yi Wang wrote:
> From: Long YunJian <long.yunjian@zte.com.cn>
>
> when blockcommit from active leaf node, sometimes, we get assertion failed with
> "mirror_run: Assertion `QLIST_EMPTY(&bs->tracked_requests)' failed" messages.
> According to the core file, we find bs->tracked_requests has IO request,
> so assertion failed.
> (gdb) bt
> #0  0x00007f410df707cf in raise () from /lib64/libc.so.6
> #1  0x00007f410df5ac05 in abort () from /lib64/libc.so.6
> #2  0x00007f410df5aad9 in __assert_fail_base.cold.0 () from /lib64/libc.so.6
> #3  0x00007f410df68db6 in __assert_fail () from /lib64/libc.so.6
> #4  0x0000556915635371 in mirror_run (job=0x556916ff8600, errp=<optimized out>) at block/mirror.c:1092
> #5  0x00005569155e6c53 in job_co_entry (opaque=0x556916ff8600) at job.c:904
> #6  0x00005569156d9483 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>) at util/coroutine-ucontext.c:115
> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests
> $12 = {lh_first = 0x7f3f07bfb8b0}
> (gdb) p s->mirror_top_bs->backing->bs->tracked_requests->lh_first
> $13 = (struct BdrvTrackedRequest *) 0x7f3f07bfb8b0
>
> Actually, before excuting assert(QLIST_EMPTY(&bs->tracked_requests)),
> it will excute mirror_flush(s). It may handle new I/O request and maybe
> pending I/O during this flush. Just likes in bdrv_close fuction,
> bdrv_drain(bs) followed by bdrv_flush(bs), we should add bdrv_drain fuction
> to handle pending I/O after mirror_flush.

Oh.  How is that happening, though?  I would have expected that flushing 
the target BB (and associated BDS) only flushes requests to the OS and 
lower layers, but the source node (which is `bs`) should (in the case of 
commit) always be above the target, so I wouldn’t have expected it to 
get any new requests due to this flush.

Do you have a reproducer for this?

> Signed-off-by: Long YunJian <long.yunjian@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> ---
>   block/mirror.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/block/mirror.c b/block/mirror.c
> index efec2c7674..1eec356310 100644
> --- a/block/mirror.c
> +++ b/block/mirror.c
> @@ -1079,6 +1079,8 @@ static int coroutine_fn mirror_run(Job *job, Error **errp)
>                   s->in_drain = false;
>                   continue;
>               }
> +            /* in case flush left pending I/O */
> +            bdrv_drain(bs);

I don’t think this works, because if we drain, we would also need to 
flush the target again.  Essentially I believe we’d basically need 
something like

do {
     bdrv_drained_begin(bs);
     mirror_flush(s);
     if (!QLIST_EMPTY(&bs->tracked_requests)) {
         bdrv_drained_end(bs);
     }
} while (!QLIST_EMPTY(&bs->tracked_requests));

(Which I know is really ugly)

Hanna

>   
>               /* The two disks are in sync.  Exit and report successful
>                * completion.


