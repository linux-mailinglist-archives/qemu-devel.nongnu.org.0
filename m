Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA45358FCD3
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 14:52:20 +0200 (CEST)
Received: from localhost ([::1]:52542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oM7fg-0000BJ-1y
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 08:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oM7I5-0004RU-TE
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:27:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25701)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oM7Hz-0002e8-DD
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 08:27:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660220870;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=bSkmZuQeqiJz4URvwJ+ErmAisA6bcQiodm91gbu8JDY=;
 b=b/aon4tLkEgouJ9R/EyMFqv2q4drgteE2mZ6lEGCmVSrm2a09tGvMr6E8raMugX19I9qPz
 nYWbs4Io69nE/JvchlHGnx25o69YrPE05m+ytbRvXQalu+Ig41LD4fE9RKraaSqmy0esQa
 cskeJca3/oaA/ocyovpIKp7HQuB9HGQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-idcONbJnMn6AnQ-lVXfMgg-1; Thu, 11 Aug 2022 08:27:49 -0400
X-MC-Unique: idcONbJnMn6AnQ-lVXfMgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C395280A0BF;
 Thu, 11 Aug 2022 12:27:48 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.115])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 88EB72026D64;
 Thu, 11 Aug 2022 12:27:46 +0000 (UTC)
Date: Thu, 11 Aug 2022 13:27:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, fiuczy@linux.ibm.com, pasic@linux.ibm.com,
 alex.bennee@linaro.org, armbru@redhat.com
Subject: Re: [PATCH v3 1/1] os-posix: asynchronous teardown for shutdown on
 Linux
Message-ID: <YvT1wC0vi2juO5n3@redhat.com>
References: <20220809064024.15259-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220809064024.15259-1-imbrenda@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 09, 2022 at 08:40:24AM +0200, Claudio Imbrenda wrote:
> This patch adds support for asynchronously tearing down a VM on Linux.
> 
> When qemu terminates, either naturally or because of a fatal signal,
> the VM is torn down. If the VM is huge, it can take a considerable
> amount of time for it to be cleaned up. In case of a protected VM, it
> might take even longer than a non-protected VM (this is the case on
> s390x, for example).
> 
> Some users might want to shut down a VM and restart it immediately,
> without having to wait. This is especially true if management
> infrastructure like libvirt is used.
> 
> This patch implements a simple trick on Linux to allow qemu to return
> immediately, with the teardown of the VM being performed
> asynchronously.
> 
> If the new commandline option -async-teardown is used, a new process is
> spawned from qemu at startup, using the clone syscall, in such way that
> it will share its address space with qemu.
> 
> The new process will have the name "cleanup/<QEMU_PID>". It will wait
> until qemu terminates, and then it will exit itself.
> 
> This allows qemu to terminate quickly, without having to wait for the
> whole address space to be torn down. The teardown process will exit
> after qemu, so it will be the last user of the address space, and
> therefore it will take care of the actual teardown.
> 
> The teardown process will share the same cgroups as qemu, so both
> memory usage and cpu time will be accounted properly.
> 
> This feature can already be used with libvirt by adding the following
> to the XML domain definition to pass the parameter to qemu directly:
> 
>   <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
>   <arg value='-async-teardown'/>
>   </commandline>
> 
> More advanced interfaces like pidfd or close_range have intentionally
> been avoided in order to be more compatible with older kernels.
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  include/qemu/async-teardown.h |  22 ++++++
>  os-posix.c                    |   6 ++
>  qemu-options.hx               |  17 +++++
>  util/async-teardown.c         | 123 ++++++++++++++++++++++++++++++++++
>  util/meson.build              |   1 +
>  5 files changed, 169 insertions(+)
>  create mode 100644 include/qemu/async-teardown.h
>  create mode 100644 util/async-teardown.c
> 

> diff --git a/include/qemu/async-teardown.h b/include/qemu/async-teardown.h
> new file mode 100644
> index 0000000000..092e7a37e7
> --- /dev/null
> +++ b/include/qemu/async-teardown.h
> @@ -0,0 +1,22 @@
> +/*
> + * Asynchronous teardown
> + *
> + * Copyright IBM, Corp. 2022
> + *
> + * Authors:
> + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef QEMU_ASYNC_TEARDOWN_H
> +#define QEMU_ASYNC_TEARDOWN_H
> +
> +#include "config-host.h"
> +
> +#ifdef CONFIG_LINUX
> +void init_async_teardown(void);
> +#endif
> +
> +#endif
> diff --git a/os-posix.c b/os-posix.c
> index 321fc4bd13..4858650c3e 100644
> --- a/os-posix.c
> +++ b/os-posix.c
> @@ -39,6 +39,7 @@
>  
>  #ifdef CONFIG_LINUX
>  #include <sys/prctl.h>
> +#include "qemu/async-teardown.h"
>  #endif
>  
>  /*
> @@ -150,6 +151,11 @@ int os_parse_cmd_args(int index, const char *optarg)
>      case QEMU_OPTION_daemonize:
>          daemonize = 1;
>          break;
> +#if defined(CONFIG_LINUX)
> +    case QEMU_OPTION_asyncteardown:
> +        init_async_teardown();
> +        break;
> +#endif
>      default:
>          return -1;
>      }
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 3f23a42fa8..d434353159 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4743,6 +4743,23 @@ HXCOMM Internal use
>  DEF("qtest", HAS_ARG, QEMU_OPTION_qtest, "", QEMU_ARCH_ALL)
>  DEF("qtest-log", HAS_ARG, QEMU_OPTION_qtest_log, "", QEMU_ARCH_ALL)
>  
> +#ifdef __linux__
> +DEF("async-teardown", 0, QEMU_OPTION_asyncteardown,
> +    "-async-teardown enable asynchronous teardown\n",
> +    QEMU_ARCH_ALL)
> +#endif
> +SRST
> +``-async-teardown``
> +    Enable asynchronous teardown. A new teardown process will be
> +    created at startup, using clone. The teardown process will share
> +    the address space of the main qemu process, and wait for the main
> +    process to terminate. At that point, the teardown process will
> +    also exit. This allows qemu to terminate quickly if the guest was
> +    huge, leaving the teardown of the address space to the teardown
> +    process. Since the teardown process shares the same cgroups as the
> +    main qemu process, accounting is performed correctly.
> +ERST
> +
>  DEF("msg", HAS_ARG, QEMU_OPTION_msg,
>      "-msg [timestamp[=on|off]][,guest-name=[on|off]]\n"
>      "                control error message format\n"

It occurrs to me that we've got a general goal of getting away from
adding new top level command line arguments. Most of the time there's
an obvious existing place to put them, but I'm really not sure
where this particular  option would fit ?

it isn't tied to any aspect of the VM backend configuration nor
hardware frontends.

The closest match is the lifecycle action option (-no-shutdown)
which were merged into a -action arg, but even that's a bit of a
stretch.

Markus/Paolo:  do you have suggestions ?


> diff --git a/util/async-teardown.c b/util/async-teardown.c
> new file mode 100644
> index 0000000000..07fe549891
> --- /dev/null
> +++ b/util/async-teardown.c
> @@ -0,0 +1,123 @@
> +/*
> + * Asynchronous teardown
> + *
> + * Copyright IBM, Corp. 2022
> + *
> + * Authors:
> + *  Claudio Imbrenda <imbrenda@linux.ibm.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or (at your
> + * option) any later version.  See the COPYING file in the top-level directory.
> + *
> + */
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <sys/types.h>
> +#include <sys/unistd.h>
> +#include <dirent.h>
> +#include <sys/prctl.h>
> +#include <signal.h>
> +#include <sched.h>
> +
> +#include "qemu/async-teardown.h"
> +
> +static pid_t the_ppid;
> +
> +/*
> + * Close all open file descriptors.
> + */
> +static void close_all_open_fd(void)
> +{
> +    struct dirent *de;
> +    int fd, dfd;
> +    DIR *dir;
> +
> +    dir = opendir("/proc/self/fd");
> +    if (!dir) {
> +        return;
> +    }
> +    /* Avoid closing the directory. */
> +    dfd = dirfd(dir);
> +
> +    for (de = readdir(dir); de; de = readdir(dir)) {
> +        fd = atoi(de->d_name);
> +        if (fd != dfd) {
> +            close(fd);
> +        }
> +    }
> +    closedir(dir);
> +}

I know you said you're intentionally avoided close_range, but the
cost is that this makes 'proc' a mandatory dependancy.

IMHO, we should build with close_range support if it is available
in the glibc headers. Only use proc as a fallback if close_range
reports ENOSYS, or is compiled out.

> +
> +static void hup_handler(int signal)
> +{
> +    /* Check every second if this process has been reparented. */
> +    while (the_ppid == getppid()) {
> +        /* sleep() is safe to use in a signal handler. */
> +        sleep(1);
> +    }
> +
> +    /* At this point the parent process has terminated completely. */
> +    _exit(0);
> +}
> +
> +static int async_teardown_fn(void *arg)
> +{
> +    struct sigaction sa = { .sa_handler = hup_handler };
> +    sigset_t hup_signal;
> +    char name[16];
> +
> +    /* Set a meaningful name for this process. */
> +    snprintf(name, 16, "cleanup/%d", the_ppid);
> +    prctl(PR_SET_NAME, (unsigned long)name);
> +
> +    /*
> +     * Close all file descriptors that might have been inherited from the
> +     * main qemu process when doing clone, needed to make libvirt happy.
> +     * Not using close_range for increased compatibility with older kernels.
> +     */
> +    close_all_open_fd();
> +
> +    /* Set up a handler for SIGHUP and unblock SIGHUP. */
> +    sigaction(SIGHUP, &sa, NULL);
> +    sigemptyset(&hup_signal);
> +    sigaddset(&hup_signal, SIGHUP);
> +    sigprocmask(SIG_UNBLOCK, &hup_signal, NULL);
> +
> +    /* Ask to receive SIGHUP when the parent dies. */
> +    prctl(PR_SET_PDEATHSIG, SIGHUP);

Hmm, I was hoping you could just use SIGKILL to guarantee that this
gets killed off.  Is SIGKILL delivered too soon to allow for the
main QEMU process to have exited quickly ?

If so I wonder what happens when systemd just delivers SIGKILL to
all processes in the cgroup - I'm not sure there's a guarantee it
will SIGKILL the main qemu before it SIGKILLs this helper

> +
> +    /*
> +     * Sleep forever, unless the parent process has already terminated. The
> +     * only interruption can come from the SIGHUP signal, which in normal
> +     * operation is received when the parent process dies.
> +     */
> +    if (the_ppid == getppid()) {
> +        pause();
> +    }
> +
> +    /* At this point the parent process has terminated completely. */
> +    _exit(0);
> +}
> +
> +/*
> + * Block all signals, start (clone) a new process sharing the address space
> + * with qemu (CLONE_VM), then restore signals.
> + */
> +void init_async_teardown(void)
> +{
> +    sigset_t all_signals, old_signals;
> +    const int stack_size = 8192; /* Should be more than enough */
> +    char *stack, *stack_ptr;
> +
> +    the_ppid = getpid();
> +    stack = malloc(stack_size);
> +    if (!stack) {
> +        return;

THis should be fatal. How about using  qemu_alloc_stack instead ?

> +    }
> +    stack_ptr = stack + stack_size;
> +
> +    sigfillset(&all_signals);
> +    sigprocmask(SIG_BLOCK, &all_signals, &old_signals);
> +    clone(async_teardown_fn, stack_ptr, CLONE_VM, NULL, NULL, NULL, NULL);
> +    sigprocmask(SIG_SETMASK, &old_signals, NULL);
> +}
> diff --git a/util/meson.build b/util/meson.build
> index 5e282130df..63acd59bb0 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -2,6 +2,7 @@ util_ss.add(files('osdep.c', 'cutils.c', 'unicode.c', 'qemu-timer-common.c'))
>  if not config_host_data.get('CONFIG_ATOMIC64')
>    util_ss.add(files('atomic64.c'))
>  endif
> +util_ss.add(when: 'CONFIG_LINUX', if_true: files('async-teardown.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('aio-posix.c'))
>  util_ss.add(when: 'CONFIG_POSIX', if_true: files('fdmon-poll.c'))
>  if config_host_data.get('CONFIG_EPOLL_CREATE1')
> -- 
> 2.37.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


