Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806A337397F
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 13:35:05 +0200 (CEST)
Received: from localhost ([::1]:41584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leFo0-00089t-FI
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 07:35:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leFil-0004PT-7D
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:29:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36012)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1leFih-0004LI-JW
 for qemu-devel@nongnu.org; Wed, 05 May 2021 07:29:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620214173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H5lFo8RLqDaoJW/D4YPZe4yJRF4oUDCInUbs4qZwYXM=;
 b=OH8wmxo6a5r2f1q7GA5sOuJJVY3WzCqbJzlZcOpq+7wfixNrajMCkh903Pfj5/4pDUMk4S
 SPQa+uiWeCY4whJ7k41/bar63dviFNls6cuoJgMwL+dGcVfmPLEgtclHNkQqZMUeL8DStW
 oYDLPIuQUO1bC4gVb8Q+LydWHhovKi4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-506-PN5CEexsPC-1kGaqOuDKSQ-1; Wed, 05 May 2021 07:29:31 -0400
X-MC-Unique: PN5CEexsPC-1kGaqOuDKSQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 4-20020adf91840000b029010d9c088599so575148wri.10
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 04:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H5lFo8RLqDaoJW/D4YPZe4yJRF4oUDCInUbs4qZwYXM=;
 b=jSGdTvVIXQ2bKzEUUfsGndlk57HAHpH0Yb5UBPpEBXBD1tTPYpV+Dm1H6Gmgw7OPGR
 FvcxohyZDe7IfJh5Plo9KsjYsfdJ7IdfcK0T3/QG3E8izDIPCh1560Fqvc4xTcNi7kpi
 rywJZP5z3VC7NtlzBIkwcnRrIErnb41+jcO3uf14+CXwRcFZmcDrfrRUEYFKSJN+M+s5
 KH9nQcfY9NspWBTAYc7pvub4M5YiaKWvblWy0kQ7E4hNmJePeE3EukEGbC2O3w4Ubtzs
 J6GIu+lSHoQTWWbxMJm9bw8cjdfvnsLJnco8MUECx9+hurp+Mti9nuCpWmE+n0PMI4Yn
 ME9g==
X-Gm-Message-State: AOAM530GExEPUBKCnl47nESRUiEpHiTEIcH+dMCPeANfCYcTPrAscgA6
 btzAwF/NSGKUkqqugcEqmxB1A29Vm7mFlV+t6GohINi3NW8p3pRLbKt9p7LSiBuj5AiLd3Uw4/N
 1mcPlXEbp/3AoT3U=
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr31764489wmq.38.1620214169017; 
 Wed, 05 May 2021 04:29:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTKLQqJ1t3GZp8uVKC3u2ejoU5SqrE5mA5cCzR2Q12d4PpLjeGBSN0IOCGYLiTYVe6Pex8GA==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr31764457wmq.38.1620214168668; 
 Wed, 05 May 2021 04:29:28 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id s15sm13761689wrt.19.2021.05.05.04.29.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 04:29:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/8] block: protect write threshold QMP commands from
 concurrent requests
To: Stefan Hajnoczi <stefanha@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210419085541.22310-1-eesposit@redhat.com>
 <20210419085541.22310-3-eesposit@redhat.com>
 <YJJdl+wNvxgl83Km@stefanha-x1.localdomain>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <36588682-2390-9d1e-dfe1-33827b1fcf90@redhat.com>
Date: Wed, 5 May 2021 13:29:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJJdl+wNvxgl83Km@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/05/21 10:55, Stefan Hajnoczi wrote:
>> @@ -119,10 +118,8 @@ void qmp_block_set_write_threshold(const char *node_name,
>>           return;
>>       }
>>   
>> -    aio_context = bdrv_get_aio_context(bs);
>> -    aio_context_acquire(aio_context);
>> -
>> +    /* Avoid a concurrent write_threshold_disable.  */
>> +    bdrv_drained_begin(bs);
> 
> Is there documentation that says it's safe to call
> bdrv_drained_begin(bs) without the AioContext acquired? AIO_WAIT_WHILE()
> contradicts this:
> 
>    The caller's thread must be the IOThread that owns @ctx or the main loop
>    thread (with @ctx acquired exactly once).
>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 

Well, I cannot remember why this patch was correct at the time I was
working on them.  Patches 7/8 on the other hand were okay because back
then bdrv_reopen_multiple() called bdrv_drain_all_begin().

Overall, what survives of this series is patches 5 and 6, plus Vladimir's
take on the write threshold code.

Anyway, things have gotten _more_ broken in the meanwhile, and this is
probably what causes the deadlocks that Emanuele has seen with the
remainder of the branch.  Since this patch:

     commit aa1361d54aac43094b98024b8b6c804eb6e41661
     Author: Kevin Wolf <kwolf@redhat.com>
     Date:   Fri Aug 17 18:54:18 2018 +0200

     block: Add missing locking in bdrv_co_drain_bh_cb()
     
     bdrv_do_drained_begin/end() assume that they are called with the
     AioContext lock of bs held. If we call drain functions from a coroutine
     with the AioContext lock held, we yield and schedule a BH to move out of
     coroutine context. This means that the lock for the home context of the
     coroutine is released and must be re-acquired in the bottom half.
     
     Signed-off-by: Kevin Wolf <kwolf@redhat.com>
     Reviewed-by: Max Reitz <mreitz@redhat.com>

AIO_WAIT_WHILE  is going down a path that does not do the release/acquire of
the AioContext, which can and will cause deadlocks when the main thread
tries to acquire the AioContext and the I/O thread is in bdrv_co_drain.

The message that introduced it does not help very much
(https://mail.gnu.org/archive/html/qemu-devel/2018-09/msg01687.html)
but I think this must be reverted.

The next steps however should have less problems with bitrot, in particular
the snapshots have changed very little.  Block job code is very different
but it is all in the main thread.

Paolo


