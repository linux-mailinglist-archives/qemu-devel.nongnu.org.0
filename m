Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B085A406B48
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 14:18:08 +0200 (CEST)
Received: from localhost ([::1]:35716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOfTr-0003xl-Ob
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 08:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOevw-0004Yf-Gq
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:43:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mOevs-000793-T5
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 07:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631274179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9WBvCsx/l/IRfVTWvY3wVCQnl6LuTf2XUGMie7GHA9o=;
 b=hvEmN6Cajk8UOkHPSZch4b66AydijcDd5zMc5IRrrjHjTSiTbdjeXoHSCtaFJCS/ntYPcu
 YaLDO4RyEX4yBemkFXD1rR/rF/Q9RrhrU4xuvesJu9IfV5I3vAn59CyAlBf716Z3vO40Sq
 wWovPaSVulG5kSYdAyzwLWTDaa0Ad2o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-ykxzEcsUMMuRm8EAr8rWOQ-1; Fri, 10 Sep 2021 07:42:58 -0400
X-MC-Unique: ykxzEcsUMMuRm8EAr8rWOQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 g4-20020a056402180400b003c2e8da869bso774111edy.13
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 04:42:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9WBvCsx/l/IRfVTWvY3wVCQnl6LuTf2XUGMie7GHA9o=;
 b=skl+bgfYci4C49o8uVC5fyY4ZQmqm3v/iK10lBR9QHL3h/fVzKYJOA5HaMpLXeSjpQ
 wOpiCWzNIHvBM0dWrw2dAkG9ufQ6UAbt5Vk+SqmSP1z8Qt6916U6TTgS/HDAbSR7jlqX
 /SFVhj/PBKe2+LoruPe/ktGJko27CjnNeWIUDAB5DMsfOzodSrp/kGswR8mnGcnMutD9
 9qf3AH82/KZiFuc4Q8Btl7/N+dQuGK+7+ePN5VVEhALWsf76tr2jHkGjiOcHvHgvTlaP
 5Y8lJJsWCCTJpQXV6OvU/0c+uUdb1BD0erndmwYBaumC3romFahxE5xcSY5btItQakZR
 RSmw==
X-Gm-Message-State: AOAM532ZKuhbBCofNb0SgNrYMsnE9mcDUnYC/hI+IuUewtydI6eG8c3k
 k6liqaWcy8W9Wkxl1RU48rcAgHgQPtcmKK2Zq1j30Bwy2YUpoB1XPpghoai/i9FuNQvBAaiXbVb
 31HU7jUBDPk25W9U=
X-Received: by 2002:a17:906:95d7:: with SMTP id
 n23mr8627394ejy.479.1631274176157; 
 Fri, 10 Sep 2021 04:42:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvl1hOrN6ZSQOjUMcKb7f6ohYS8PiNfch22eWL+YOcWn680G7FdpQ/9+9fZ06fJjc1F4VRIQ==
X-Received: by 2002:a17:906:95d7:: with SMTP id
 n23mr8627353ejy.479.1631274175711; 
 Fri, 10 Sep 2021 04:42:55 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id oy11sm2273025ejb.104.2021.09.10.04.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:42:55 -0700 (PDT)
Date: Fri, 10 Sep 2021 13:42:52 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
Message-ID: <20210910114252.v3si2per5jraxm6c@steredhat>
References: <20210910085600.137772-1-sgarzare@redhat.com>
 <b56ce8a9-d366-e3d5-d516-0631231b218f@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <b56ce8a9-d366-e3d5-d516-0631231b218f@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 10, 2021 at 01:37:40PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>10.09.2021 11:56, Stefano Garzarella wrote:
>>In mirror_iteration() we call mirror_wait_on_conflicts() with
>>`self` parameter set to NULL.
>>
>>Starting from commit d44dae1a7c we dereference `self` pointer in
>>mirror_wait_on_conflicts() without checks if it is not NULL.
>>
>>Backtrace:
>>   Program terminated with signal SIGSEGV, Segmentation fault.
>>   #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>>       at ../block/mirror.c:172
>>   172	                self->waiting_for_op = op;
>>   [Current thread is 1 (Thread 0x7f0908931ec0 (LWP 380249))]
>>   (gdb) bt
>>   #0  mirror_wait_on_conflicts (self=0x0, s=<optimized out>, offset=<optimized out>, bytes=<optimized out>)
>>       at ../block/mirror.c:172
>>   #1  0x00005610c5d9d631 in mirror_run (job=0x5610c76a2c00, errp=<optimized out>) at ../block/mirror.c:491
>>   #2  0x00005610c5d58726 in job_co_entry (opaque=0x5610c76a2c00) at ../job.c:917
>>   #3  0x00005610c5f046c6 in coroutine_trampoline (i0=<optimized out>, i1=<optimized out>)
>>       at ../util/coroutine-ucontext.c:173
>>   #4  0x00007f0909975820 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91
>>       from /usr/lib64/libc.so.6
>>
>>Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
>>Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
>>Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>>---
>>I'm not familiar with this code so maybe we can fix the bug differently.
>>
>>Running iotests and the test in bugzilla, everything seems okay.
>>
>>Thanks,
>>Stefano
>>---
>>  block/mirror.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>>diff --git a/block/mirror.c b/block/mirror.c
>>index 98fc66eabf..6c834d6a7b 100644
>>--- a/block/mirror.c
>>+++ b/block/mirror.c
>>@@ -169,9 +169,16 @@ static void coroutine_fn mirror_wait_on_conflicts(MirrorOp *self,
>>                      continue;
>>                  }
>>-                self->waiting_for_op = op;
>>+                if (self) {
>>+                    self->waiting_for_op = op;
>>+                }
>>+
>>                  qemu_co_queue_wait(&op->waiting_requests, NULL);
>>-                self->waiting_for_op = NULL;
>>+
>>+                if (self) {
>>+                    self->waiting_for_op = NULL;
>>+                }
>>+
>>                  break;
>>              }
>>          }
>>
>
>Hi Stefano!
>
>The patch is almost OK. The only thing is, I think, you should also put 
>"if (op->waiting_for_op) {continue;}" code above into "if (self)" too.  
>Look at the comment above: if we don't have "self", than we are not in 
>the list and nobody will wait for us. This means that we should wait 
>for all.
>
>So, with my suggested fix, you'll simply roll-back d44dae1a7c for the 
>case of self==NULL, which is an additional point of safety.
>

Right, I'll send a v2 with this change.

>
>Still, I wonder, where we check for conflicting requests when create 
>usual MirrorOp. We don't call mirror_wait_on_conflicts() in 
>mirror_perform...

IIUC in mirror_iteration() we call mirror_wait_on_conflicts() at the 
beginning, then in the cycle we call mirror_perform() where we create a 
new MirrorOp and we add it in the `ops_in_flight` list.

At this point, should we call mirror_wait_on_conflicts()?

I need to understand the code better to follow you... :-)

Thanks,
Stefano


