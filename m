Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA888406DAA
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:37:26 +0200 (CEST)
Received: from localhost ([::1]:53988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhef-0000n9-FJ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhd8-0007eI-JJ
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:35:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mOhd5-0007Nt-Fm
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631284546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Ene66OOXVzMChhAiDNWTBOi9AdAT1IfqmurUzivDTM=;
 b=CsJx0zUlGR2TePOjloYE2gK0oLCCeqgoF8fR6pdFDvpIby7/NzU3pqaRVupxDalA1Xm0Iy
 NAUlxx5I7eO2pI8dvZ2L4NucHeezAmtr2PhVY0ccQlV4usXhHsov+8WCK06E88U7sR6/2s
 k12kj7Cpzz8CyYZ63E+2FKW5wf9IDTk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-8xBhXA9JMomcZpUibR2Ggw-1; Fri, 10 Sep 2021 10:35:43 -0400
X-MC-Unique: 8xBhXA9JMomcZpUibR2Ggw-1
Received: by mail-wr1-f69.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so600192wrt.4
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9Ene66OOXVzMChhAiDNWTBOi9AdAT1IfqmurUzivDTM=;
 b=w77u7yrujUbLwDFYoqJtpo9+TT4nARoFXN/O5fTXQs/ANQGwliFuvfrphUoWJxnkqa
 SGPkgEF2WJ+M4KYj0FXrC1bDb/qSbYNBzzdB+g9rRLf8wRgh1Z7rjmyPinG2eWprmMKK
 DFLkvUulqAD3vLhCX4KVnTracJ7Idbe4j20RrMDJIjuDsPMa50IZ2nkKaCIONWS6zolO
 TmdQwmA5QkIciln6BfAwr5S9ThFl2VPlvikxG37C5h7Wv0dmFW6w9krSeIpqGJNinELB
 PG3MdskOFKYWvicm94DxezGipD25n3jzrRBToHv/LmOhK3GHnJzst5jP116n68rfKp/W
 R68g==
X-Gm-Message-State: AOAM532YYQElebEPtRYVpLB1CcgydVTBiPZiihMfPwgMae0GtI5MPzE2
 EEjVp8zt5Jqt/xKQ+EcKeJ9181fz1e+G3rs24rC4CcvAiQ8hcKV+vw8MSaHTQsQXLAythR7K6Yi
 EDJrTxlrVYyNio0Y=
X-Received: by 2002:a5d:5490:: with SMTP id h16mr10092303wrv.170.1631284541943; 
 Fri, 10 Sep 2021 07:35:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzB0jd/bIA6vC/z30f+vvrmi5TI4bH5BskQwLe43fRNpN12eKO8GBw2wbm3Jkt0qa0NkKlnAA==
X-Received: by 2002:a5d:5490:: with SMTP id h16mr10092276wrv.170.1631284541693; 
 Fri, 10 Sep 2021 07:35:41 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id s7sm4846936wra.75.2021.09.10.07.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 07:35:41 -0700 (PDT)
Subject: Re: [PATCH v2] block/mirror: fix NULL pointer dereference in
 mirror_wait_on_conflicts()
To: Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org
References: <20210910124533.288318-1-sgarzare@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <0c50ffcb-c383-7441-f153-3b630d202c7f@redhat.com>
Date: Fri, 10 Sep 2021 16:35:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210910124533.288318-1-sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.09.21 14:45, Stefano Garzarella wrote:
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
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2001404
> Fixes: d44dae1a7c ("block/mirror: fix active mirror dead-lock in mirror_wait_on_conflicts")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> ---
> v2:
> - moved "if (op->waiting_for_op) {continue;}" code into "if (self)" too.
>    [Vladimir]
> ---
>   block/mirror.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)

Thanks, applied to my block branch:

https://github.com/XanClic/qemu/commits/block

Hanna


