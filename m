Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5730532490
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 09:57:44 +0200 (CEST)
Received: from localhost ([::1]:43716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntPQF-0007Lj-Iw
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 03:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntPOa-0006Ne-KL
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:56:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ntPON-0006sG-Nh
 for qemu-devel@nongnu.org; Tue, 24 May 2022 03:56:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653378944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bdp69dT09Hiro57kG2ivw7ovkPDmrAYaW1pJ4X2/9lQ=;
 b=UDbjfgAazahs+8/EMTsbGBiEfiv0okBltLrleaY0fXA7cdKMLdBVUkQk9tuK/b4yJiPANV
 KR4hIGcvMaoMg7bb3AXPc6BcRXCoLWETG2qTTIZCtxDeQ7Jy5i3Rp4MZIBEsq0Ww69BxeP
 3aVwajvvGFcENfRXog+yAv/y0pZMoNI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-2ddS_p2fPf6IeNmQpZXtgw-1; Tue, 24 May 2022 03:55:43 -0400
X-MC-Unique: 2ddS_p2fPf6IeNmQpZXtgw-1
Received: by mail-ed1-f69.google.com with SMTP id
 h11-20020aa7c60b000000b0042ab2287015so12118231edq.3
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 00:55:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=bdp69dT09Hiro57kG2ivw7ovkPDmrAYaW1pJ4X2/9lQ=;
 b=QyXoKi3CtNIXSz7wNILbxNsl8y2FeXrm2o0FZuGicqH1zYFDJU36PNi58fXXO7qBgy
 j608AzweSdK+1eE22SqEk/0lS2EkO2lullBYs70sv2u6rxOk5X4i6mFsGYH8VaHcBym1
 OvlK7QmO0qPts1meO4WSYP0y7+hVJGyy78Hu5d4KD7dJjKBHFluMq1jn/GqI/AnNKiVF
 HhwaEw0oxtrgWfpgGImXCGOFwp6b585+l/YkttDJ1sRboQqvB1fWioyPAzxf/NPZekVj
 Su4tIXOfvW+ECMbu62nK3esr0pNw2UR3POMk7IZLkvPn+CZ2lJVZchDdq2ApxTdhxnlD
 ZwGg==
X-Gm-Message-State: AOAM533o3HZ/FloiY2/O8Ktzw6wzhtTJOK5oaauYz586kpENw6VjRnHQ
 krdZ9L1AfgrnkQaAXjAJP+G2r6D+uk79An6nSdAms3ztIy47fPHzAHhmBPSYydUdaPEnOYOIO9k
 A6kAPvRvZozAjbf0=
X-Received: by 2002:a17:906:d193:b0:6fe:9a92:6c4d with SMTP id
 c19-20020a170906d19300b006fe9a926c4dmr21560188ejz.49.1653378942017; 
 Tue, 24 May 2022 00:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwXjCoxsIRjctNKarfJn42n7E4yOJJ7l/F2Ktc7MIeGYFUmZDp8TTqSGjmFz46f14kVHsegeQ==
X-Received: by 2002:a17:906:d193:b0:6fe:9a92:6c4d with SMTP id
 c19-20020a170906d19300b006fe9a926c4dmr21560167ejz.49.1653378941758; 
 Tue, 24 May 2022 00:55:41 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 ej23-20020a056402369700b0042a2d9af0f8sm9305728edb.79.2022.05.24.00.55.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 May 2022 00:55:40 -0700 (PDT)
Message-ID: <67993f7d-bc84-9929-0a28-10a441c3d5bd@redhat.com>
Date: Tue, 24 May 2022 09:55:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20220426085114.199647-1-eesposit@redhat.com>
 <YnKB+SP678gNrAb1@stefanha-x1.localdomain>
 <YoN/935E4MfinZFQ@stefanha-x1.localdomain>
 <cc5e12d1-d25f-d338-bff2-0d3f5cc0def7@redhat.com>
 <6fc3e40e-7682-b9dc-f789-3ca95e0430db@redhat.com>
 <YoUbWYfl0Bft3LiU@redhat.com> <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH v2 0/8] Removal of AioContext lock, bs->parents and
 ->children: new rwlock
In-Reply-To: <YopRejAj7AbIXH9i@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/22/22 17:06, Stefan Hajnoczi wrote:
> However, I hit on a problem that I think Emanuele and Paolo have already
> pointed out: draining is GS & IO. This might have worked under the 1 IOThread
> model but it does not make sense for multi-queue. It is possible to submit I/O
> requests in drained sections. How can multiple threads be in drained sections
> simultaneously and possibly submit further I/O requests in their drained
> sections? Those sections wouldn't be "drained" in any useful sense of the word.

Yeah, that works only if the drained sections are well-behaved.

"External" sources of I/O are fine; they are disabled using is_external, 
and don't drain themselves I think.

Mirror is the only I/O user of drain, and it's fine because it never 
submits I/O to the drained BDS.

Drained sections in the main thread can be special cased to allow I/O 
(wrlock in this series would also allow I/O).

So I think that the "cooperation from all relevant places" that Kevin 
mentioned is already there, except for coroutine commands in the 
monitor.  Those are a bad idea in my opinion and I'd rather revert 
commit eb94b81a94 ("block: Convert 'block_resize' to coroutine") until 
we have a clearer idea of how to handle them.

I agree that it's basically impossible to review the change.  On the 
other hand, there's already a substantial amount of faith involved in 
the correctness of the current code.

In particular the AioContext lock does absolutely nothing to protect 
corutines in the main thread against graph changes---both from the 
monitor (including BHs as in "block: Fix BB.root changing across 
bdrv_next()") and from BDS coroutines.  The former are unprotected; the 
latter are protected by drain only: using drain to protect against graph 
writes would be a matter of extending *existing* faith to the 
multi-iothread case.

Once the deadlock is broken, we can proceed to remove the AioContext 
lock and then introduce actual coroutine-based locking.

> Possible steps for AioContext removal
> -------------------------------------
> I also wanted to share my assumptions about multi-queue and AioContext removal.
> Please let me know if anything seems wrong or questionable:
> 
> - IO code can execute in any thread that has an AioContext.
> - Multiple threads may execute a IO code at the same time.
> - GS code only execute under the BQL.
> 
> For AioContext removal this means:
> 
> - bdrv_get_aio_context() becomes mostly meaningless since there is no need for
>    a special "home" AioContext.

Correct.  bdrv_set_aio_context() remains useful as a way to set a home 
AioContext for sockets.

> - bdrv_coroutine_enter() becomes mostly meaningless because there is no need to
>    run a coroutine in the BDS's AioContext.
> - aio_disable_external(bdrv_get_aio_context(bs)) no longer works because many
>    threads/AioContexts may submit new I/O requests. BlockDevOps.drained_begin()
>    may be used instead (e.g. to temporarily disable ioeventfds on a multi-queue
>    virtio-blk device).

This is a change that can be done independent of this work.

> - AIO_WAIT_WHILE() simplifies to
> 
>      while ((cond)) {
>          aio_poll(qemu_get_current_aio_context(), true);
>          ...
>      }
> 
>    and the distinction between home AioContext and non-home context is
>    eliminated. AioContext unlocking is dropped.

(I'll reply on this from elsewhere in the thread).

> Does this make sense? I haven't seen these things in recent patch series.

I agree, and yeah all these are blocked on protecting graph modifications.

In parallel to the block layer discussions, it's possible to work on 
introducing a request queue lock in virtio-blk and virtio-scsi.  That's 
the only thing that relies on the AioContext lock outside the block layer.

Paolo


