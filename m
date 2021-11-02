Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E77A44325F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:08:47 +0100 (CET)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwL7-00023K-Th
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwDW-000218-Sl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:00:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhwDU-0006q3-Et
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:00:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635868850;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LOuNi1J3rdjnjQ3cFgi5MdeWevvohMm/hpai/d99CXo=;
 b=GEndSTDq3FIPInuBOEOFhaDNI/N2qRD0cKrKuy/R7csmh3oH6xOagl+4ZdzrUAZMLXiGg4
 mI8WlBxpABZ1+oTcvsfmJyrmXPlNKLzEC7pNYBhpP08+YGpcfcCynok862Hz8Qq6jLXHha
 v7SQ7LqbMZ7QsC5ZNtqTjSiAecXDRkI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-UwiC05mOPdaIylOwPojs0Q-1; Tue, 02 Nov 2021 12:00:49 -0400
X-MC-Unique: UwiC05mOPdaIylOwPojs0Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l4-20020a05600c1d0400b00332f47a0fa3so1017407wms.8
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=LOuNi1J3rdjnjQ3cFgi5MdeWevvohMm/hpai/d99CXo=;
 b=vxsulem03SahMMh+XMXIga/I0r71qOXym4ZJw5kQZkn+JJWP6xvxpGFncdm6R/Cty+
 2Mq1xd39f3bFNmb2F5I9slwbFaWvjs4cmESPVSZ+XvQKayVD8Ej3pYma/mtrXp63htvX
 zhFz/SCbdp+tUpZwKYJh37sGP77mmVkmNaopGPPwVj0U26IDINs0BLhyGp8FWpisGWSz
 RiMLaxNBe/Gh1VnOXlFIboWFI57SbzHGw1wwm1+a2Q0FAfwXseegJ1g+C96eA58FhUgF
 jYdXgjltSSUw26W1Y79KiQO2jS0x5KrAdzNNph+tZXezNFOayUOG3IIp9ZbFeQkZcZG4
 yODw==
X-Gm-Message-State: AOAM532v9vTefHhCcn6u02iqxTpCmg6eIN0eso+V0ZMSyESvIT+FyW/0
 Jn5jzNvvdR9mPTngfq1/aSSLJS79yP0cmwUPrsj1jE2rejeL09351vc3WWR97dTvnH7taaEtyZp
 yj6OqpzEGOqxkslU=
X-Received: by 2002:adf:e84d:: with SMTP id d13mr28872410wrn.72.1635868848504; 
 Tue, 02 Nov 2021 09:00:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0Qf2yjZ/X0vrrJgQKs4Wv1yKg9gReSmnwkfjWpNFDNgDkSs+s9Vr/ZAa9/91gdAyRd08tUA==
X-Received: by 2002:adf:e84d:: with SMTP id d13mr28872373wrn.72.1635868848344; 
 Tue, 02 Nov 2021 09:00:48 -0700 (PDT)
Received: from localhost ([188.26.219.212])
 by smtp.gmail.com with ESMTPSA id y7sm9067742wrw.55.2021.11.02.09.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:00:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: "Rao, Lei" <lei.rao@intel.com>
Subject: Re: [PATCH v2 3/7] Fixed SVM hang when do failover before PVM crash
In-Reply-To: <1635753425-11756-4-git-send-email-lei.rao@intel.com> (Lei Rao's
 message of "Mon, 1 Nov 2021 15:57:01 +0800")
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
 <1635753425-11756-4-git-send-email-lei.rao@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 02 Nov 2021 17:00:47 +0100
Message-ID: <87wnlqh7io.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: quintela@redhat.com
Cc: lukasstraub2@web.de, zhang.zhanghailiang@huawei.com,
 lizhijian@cn.fujitsu.com, jasowang@redhat.com, dgilbert@redhat.com,
 qemu-devel@nongnu.org, chen.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Rao, Lei" <lei.rao@intel.com> wrote:
> From: "Rao, Lei" <lei.rao@intel.com>
>
> This patch fixed as follows:
>     Thread 1 (Thread 0x7f34ee738d80 (LWP 11212)):
>     #0 __pthread_clockjoin_ex (threadid=139847152957184, thread_return=0x7f30b1febf30, clockid=<optimized out>, abstime=<optimized out>, block=<optimized out>) at pthread_join_common.c:145
>     #1 0x0000563401998e36 in qemu_thread_join (thread=0x563402d66610) at util/qemu-thread-posix.c:587
>     #2 0x00005634017a79fa in process_incoming_migration_co (opaque=0x0) at migration/migration.c:502
>     #3 0x00005634019b59c9 in coroutine_trampoline (i0=63395504, i1=22068) at util/coroutine-ucontext.c:115
>     #4 0x00007f34ef860660 in ?? () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91 from /lib/x86_64-linux-gnu/libc.so.6
>     #5 0x00007f30b21ee730 in ?? ()
>     #6 0x0000000000000000 in ?? ()
>
>     Thread 13 (Thread 0x7f30b3dff700 (LWP 11747)):
>     #0  __lll_lock_wait (futex=futex@entry=0x56340218ffa0 <qemu_global_mutex>, private=0) at lowlevellock.c:52
>     #1  0x00007f34efa000a3 in _GI__pthread_mutex_lock (mutex=0x56340218ffa0 <qemu_global_mutex>) at ../nptl/pthread_mutex_lock.c:80
>     #2  0x0000563401997f99 in qemu_mutex_lock_impl (mutex=0x56340218ffa0 <qemu_global_mutex>, file=0x563401b7a80e "migration/colo.c", line=806) at util/qemu-thread-posix.c:78
>     #3  0x0000563401407144 in qemu_mutex_lock_iothread_impl (file=0x563401b7a80e "migration/colo.c", line=806) at /home/workspace/colo-qemu/cpus.c:1899
>     #4  0x00005634017ba8e8 in colo_process_incoming_thread (opaque=0x563402d664c0) at migration/colo.c:806
>     #5  0x0000563401998b72 in qemu_thread_start (args=0x5634039f8370) at util/qemu-thread-posix.c:519
>     #6  0x00007f34ef9fd609 in start_thread (arg=<optimized out>) at pthread_create.c:477
>     #7  0x00007f34ef924293 in clone () at ../sysdeps/unix/sysv/linux/x86_64/clone.S:95
>
>     The QEMU main thread is holding the lock:
>     (gdb) p qemu_global_mutex
>     $1 = {lock = {_data = {lock = 2, __count = 0, __owner = 11212, __nusers = 9, __kind = 0, __spins = 0, __elision = 0, __list = {_prev = 0x0, __next = 0x0}},
>      __size = "\002\000\000\000\000\000\000\000\314+\000\000\t", '\000' <repeats 26 times>, __align = 2}, file = 0x563401c07e4b "util/main-loop.c", line = 240,
>     initialized = true}
>
> From the call trace, we can see it is a deadlock bug. and the QEMU main thread holds the global mutex to wait until the COLO thread ends. and the colo thread
> wants to acquire the global mutex, which will cause a deadlock. So, we should release the qemu_global_mutex before waiting colo thread ends.
>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@cn.fujitsu.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


