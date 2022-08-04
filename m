Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B6A589FAA
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 19:04:20 +0200 (CEST)
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJeGh-0000iv-7v
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 13:04:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJe9P-0001xg-8w
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:56:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oJe9L-00053i-2r
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 12:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659632201;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=SGNhJivg8PCW3NUQvcCxlbYFqr0QaMS0QQ3hFvOd4fk=;
 b=WiMcvJ/lB4vknstCW43I5DCsLtbEGfGaF9UYbfwX5tlJQUOLR5LvuyPsHhJTCKg9vtn9xs
 Gux5TyzIlGeK4xsb2xr3TamGugCTk9VC9bpUgRIMcqjvVOCrUTZ6w8jlx9kOC6LCvHjGuB
 ItUQZQ7Gtth8fAYc1n5R+jqzenA8NWM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-Lc4QmSb1Nt-PK80npq4Usg-1; Thu, 04 Aug 2022 12:56:40 -0400
X-MC-Unique: Lc4QmSb1Nt-PK80npq4Usg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C1738001EA;
 Thu,  4 Aug 2022 16:56:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.223])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 359B840C1288;
 Thu,  4 Aug 2022 16:56:37 +0000 (UTC)
Date: Thu, 4 Aug 2022 17:56:34 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, david@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, borntraeger@de.ibm.com,
 frankja@linux.ibm.com, alex.bennee@linaro.org
Subject: Re: [PATCH v2 1/1] osdep: asynchronous teardown for shutdown on Linux
Message-ID: <Yuv6QtPCtABMc7J4@redhat.com>
References: <20220803173141.52711-1-imbrenda@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220803173141.52711-1-imbrenda@linux.ibm.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Aug 03, 2022 at 07:31:41PM +0200, Claudio Imbrenda wrote:
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
> The new process will then simpy wait until qemu terminates, and then it
> will exit itself.
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
> to the XML domain definition:
> 
>   <commandline xmlns="http://libvirt.org/schemas/domain/qemu/1.0">
>   <arg value='-async-teardown'/>
>   </commandline>
> 
> Signed-off-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
> ---
>  include/qemu/osdep.h |  2 ++
>  os-posix.c           |  5 ++++
>  qemu-options.hx      | 17 ++++++++++++++
>  util/osdep.c         | 55 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 79 insertions(+)


> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..bb0baf97a0 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -23,6 +23,15 @@
>   */
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> +
> +#ifdef CONFIG_LINUX
> +#include <sys/types.h>
> +#include <sys/select.h>
> +#include <sys/unistd.h>
> +#include <sys/syscall.h>
> +#include <signal.h>
> +#endif
> +
>  #include "qemu/cutils.h"
>  #include "qemu/sockets.h"
>  #include "qemu/error-report.h"
> @@ -512,6 +521,52 @@ const char *qemu_hw_version(void)
>      return hw_version;
>  }
>  
> +#ifdef __linux__
> +static int async_teardown_fn(void *arg)
> +{
> +    sigset_t all_signals;
> +    fd_set r, w, e;
> +    int fd;
> +
> +    /* open a pidfd descriptor for the parent qemu process */
> +    fd = syscall(__NR_pidfd_open, getppid(), 0);

We ought to open this FD in the parent process to avoid a race
where the parent crashes immediately after clone() and gets
reparented to 'init' before this child process calls pidfd_open,
otherwise it'll sit around waiting for init to exit.

> +    /* if something went wrong, or if the file descriptor is too big */
> +    if ((fd < 0) || (fd >= FD_SETSIZE)) {
> +        _exit(1);
> +    }
> +    /* zero all fd sets */
> +    FD_ZERO(&r);
> +    FD_ZERO(&w);
> +    FD_ZERO(&e);
> +    /* set the fd for the pidfd in the "read" set */
> +    FD_SET(fd, &r);
> +    /* block all signals */
> +    sigfillset(&all_signals);
> +    sigprocmask(SIG_BLOCK, &all_signals, NULL);

Technnically this is racy as there's still a window in which the
child is running when signals are not blocked.

> +    /* wait for the pid to disappear -> fd will appear as ready for read */
> +    (void) select(fd + 1, &r, &w, &e, NULL);

While using pidfd can work, a stronger protection would be to use

   prctl(PR_SET_PDEATHSIG, SIGKILL, 0, 0, 0);

this guarantees that the kernel will deliver SIGKILL to this
process immediately when the parent QEMU exits.

We should probably do both in fact.

> +
> +    /*
> +     * Close all file descriptors that might have been inherited from the
> +     * main qemu process when doing clone. This is needed to make libvirt
> +     * happy.
> +     */
> +    close_range(0, ~0U, 0);

Shouldn't we close all the FDs immediately when this process is
created, rather than only at the end when we're exiting. I don't
see there's any need to keep them open. Doing it immediately
would be better when using prctl(PR_SET_PDEATHSIG)

> +    _exit(0);
> +}
> +
> +void init_async_teardown(void)
> +{
> +    const int size = 8192; /* should be more than enough */
> +    char *stack = malloc(size);
> +

You need to block all signals here.

> +    /* start a new process sharing the address space with qemu */
> +    clone(async_teardown_fn, stack + size, CLONE_VM, NULL, NULL, NULL, NULL);

And unblock signals again here.

That way the "everything blocked"  mask is inherited by the child
from the very first moment of its existance.

> +}
> +#else /* __linux__ */
> +void init_async_teardown(void) {}
> +#endif
> +
>  #ifdef _WIN32
>  static void socket_cleanup(void)
>  {
> -- 
> 2.37.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


