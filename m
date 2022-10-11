Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C11CD5FAC1A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 08:05:29 +0200 (CEST)
Received: from localhost ([::1]:47740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oi8OO-0001JK-QP
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 02:05:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oi86z-0001sp-9H
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oi86v-00024E-Js
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 01:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665467243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SyhWNMlQymQcZLYC2p09McvGhpaukBU7izV0U9ibGEc=;
 b=RsXCGj9i2GhyitfMA/ChPbcC66+MY4NcPw4qFIPtSPrtY9vby1Xc1AeT+j4sq5h9x33/jW
 CDxM+dN9Hy37DFJWXiR4Vs7WUH0N+AD9uitrqjstfn9ZOPAz7/DfWdGB1gETtLx9iyxAcD
 TYMWt1lTbAeEJbk97cwZ2ddNhccQLzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-vKBQ2KoHPJqou2jxAiHRdQ-1; Tue, 11 Oct 2022 01:47:22 -0400
X-MC-Unique: vKBQ2KoHPJqou2jxAiHRdQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CFFB85A59D;
 Tue, 11 Oct 2022 05:47:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2723B492B09;
 Tue, 11 Oct 2022 05:47:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D123721E691D; Tue, 11 Oct 2022 07:47:19 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: qemu-devel@nongnu.org,  Michal Privoznik <mprivozn@redhat.com>,  Igor
 Mammedov <imammedo@redhat.com>,  "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>,  Eric Blake
 <eblake@redhat.com>,  Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH v2 3/7] util: Introduce ThreadContext user-creatable object
References: <20221010091117.88603-1-david@redhat.com>
 <20221010091117.88603-4-david@redhat.com>
Date: Tue, 11 Oct 2022 07:47:19 +0200
In-Reply-To: <20221010091117.88603-4-david@redhat.com> (David Hildenbrand's
 message of "Mon, 10 Oct 2022 11:11:13 +0200")
Message-ID: <87czayj4ig.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

David Hildenbrand <david@redhat.com> writes:

> Setting the CPU affinity of QEMU threads is a bit problematic, because
> QEMU doesn't always have permissions to set the CPU affinity itself,
> for example, with seccomp after initialized by QEMU:
>     -sandbox enable=on,resourcecontrol=deny
>
> General information about CPU affinities can be found in the man page of
> taskset:
>     CPU affinity is a scheduler property that "bonds" a process to a given
>     set of CPUs on the system. The Linux scheduler will honor the given CPU
>     affinity and the process will not run on any other CPUs.
>
> While upper layers are already aware of how to handle CPU affinities for
> long-lived threads like iothreads or vcpu threads, especially short-lived
> threads, as used for memory-backend preallocation, are more involved to
> handle. These threads are created on demand and upper layers are not even
> able to identify and configure them.
>
> Introduce the concept of a ThreadContext, that is essentially a thread
> used for creating new threads. All threads created via that context
> thread inherit the configured CPU affinity. Consequently, it's
> sufficient to create a ThreadContext and configure it once, and have all
> threads created via that ThreadContext inherit the same CPU affinity.
>
> The CPU affinity of a ThreadContext can be configured two ways:
>
> (1) Obtaining the thread id via the "thread-id" property and setting the
>     CPU affinity manually.
>
> (2) Setting the "cpu-affinity" property and letting QEMU try set the
>     CPU affinity itself. This will fail if QEMU doesn't have permissions
>     to do so anymore after seccomp was initialized.
>
> A simple QEMU example to set the CPU affinity to CPU 0,1,6,7 would be:
>     qemu-system-x86_64 -S \
>       -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
>
> And we can query it via HMP/QMP:
>     (qemu) qom-get tc1 cpu-affinity
>     [
>         0,
>         1,
>         6,
>         7
>     ]
>
> But note that due to dynamic library loading this example will not work
> before we actually make use of thread_context_create_thread() in QEMU
> code, because the type will otherwise not get registered.

What do you mean exactly by "not work"?  It's not "CLI option or HMP
command fails":

    $ upstream-qemu -S -display none -nodefaults -monitor stdio -object thread-context,id=tc1,cpu-affinity=0-1,cpu-affinity=6-7
    QEMU 7.1.50 monitor - type 'help' for more information
    (qemu) qom-get tc1 cpu-affinity
    [
        0,
        1,
        6,
        7
    ]
    (qemu) info cpus
    * CPU #0: thread_id=1670613

Even though the affinities refer to nonexistent CPUs :)

> A ThreadContext can be reused, simply by reconfiguring the CPU affinity.

So, when a thread is created, its affinity comes from its thread context
(if any).  When I later change the context's affinity, it does *not*
affect existing threads, only future ones.  Correct?

> Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/thread-context.h |  57 +++++++
>  qapi/qom.json                 |  17 +++
>  util/meson.build              |   1 +
>  util/oslib-posix.c            |   1 +
>  util/thread-context.c         | 278 ++++++++++++++++++++++++++++++++++
>  5 files changed, 354 insertions(+)
>  create mode 100644 include/qemu/thread-context.h
>  create mode 100644 util/thread-context.c
>
> diff --git a/include/qemu/thread-context.h b/include/qemu/thread-context.h
> new file mode 100644
> index 0000000000..2ebd6b7fe1
> --- /dev/null
> +++ b/include/qemu/thread-context.h
> @@ -0,0 +1,57 @@
> +/*
> + * QEMU Thread Context
> + *
> + * Copyright Red Hat Inc., 2022
> + *
> + * Authors:
> + *  David Hildenbrand <david@redhat.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef SYSEMU_THREAD_CONTEXT_H
> +#define SYSEMU_THREAD_CONTEXT_H
> +
> +#include "qapi/qapi-types-machine.h"
> +#include "qemu/thread.h"
> +#include "qom/object.h"
> +
> +#define TYPE_THREAD_CONTEXT "thread-context"
> +OBJECT_DECLARE_TYPE(ThreadContext, ThreadContextClass,
> +                    THREAD_CONTEXT)
> +
> +struct ThreadContextClass {
> +    ObjectClass parent_class;
> +};
> +
> +struct ThreadContext {
> +    /* private */
> +    Object parent;
> +
> +    /* private */
> +    unsigned int thread_id;
> +    QemuThread thread;
> +
> +    /* Semaphore to wait for context thread action. */
> +    QemuSemaphore sem;
> +    /* Semaphore to wait for action in context thread. */
> +    QemuSemaphore sem_thread;
> +    /* Mutex to synchronize requests. */
> +    QemuMutex mutex;
> +
> +    /* Commands for the thread to execute. */
> +    int thread_cmd;
> +    void *thread_cmd_data;
> +
> +    /* CPU affinity bitmap used for initialization. */
> +    unsigned long *init_cpu_bitmap;
> +    int init_cpu_nbits;
> +};
> +
> +void thread_context_create_thread(ThreadContext *tc, QemuThread *thread,
> +                                  const char *name,
> +                                  void *(*start_routine)(void *), void *arg,
> +                                  int mode);
> +
> +#endif /* SYSEMU_THREAD_CONTEXT_H */
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 80dd419b39..67d47f4051 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -830,6 +830,21 @@
>              'reduced-phys-bits': 'uint32',
>              '*kernel-hashes': 'bool' } }
>  
> +##
> +# @ThreadContextProperties:
> +#
> +# Properties for thread context objects.
> +#
> +# @cpu-affinity: the list of CPU numbers used as CPU affinity for all threads
> +#                created in the thread context (default: QEMU main thread
> +#                affinity)

Another ignorant question: is the QEMU main thread affinity fixed or
configurable?  If configurable, how?

> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'ThreadContextProperties',
> +  'data': { '*cpu-affinity': ['uint16'] } }
> +
> +
>  ##
>  # @ObjectType:
>  #
> @@ -882,6 +897,7 @@
>      { 'name': 'secret_keyring',
>        'if': 'CONFIG_SECRET_KEYRING' },
>      'sev-guest',
> +    'thread-context',
>      's390-pv-guest',
>      'throttle-group',
>      'tls-creds-anon',
> @@ -948,6 +964,7 @@
>        'secret_keyring':             { 'type': 'SecretKeyringProperties',
>                                        'if': 'CONFIG_SECRET_KEYRING' },
>        'sev-guest':                  'SevGuestProperties',
> +      'thread-context':             'ThreadContextProperties',
>        'throttle-group':             'ThrottleGroupProperties',
>        'tls-creds-anon':             'TlsCredsAnonProperties',
>        'tls-creds-psk':              'TlsCredsPskProperties',

[...]


