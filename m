Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AE2C6CCE
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 22:05:45 +0100 (CET)
Received: from localhost ([::1]:58890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kikw4-0001e7-Fi
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 16:05:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kikuY-0001D5-Da
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kikuV-0008Sy-8J
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 16:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606511045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i2/dRtOuvhvSk3o68clscms5tYZWhEp07lrknaDlFBk=;
 b=aPPcG5NzRsD28j+tEmZUa3TwwLoP9AzZEIR7leZabuXk2WSGopGJOdNeP1DnYhadttoVxR
 LZz+Fq1X6IEGXHDiP2tkHQ2Nj+WVuGiFpzNXwkuPPS26XED9Pd2GZCWZBOy+kqygV1MxWL
 mf8LHnbdb2rZy5DiEYyQ0/oZwr+/sXc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-8B6xctoUNy64Jpre4hrzSw-1; Fri, 27 Nov 2020 16:04:04 -0500
X-MC-Unique: 8B6xctoUNy64Jpre4hrzSw-1
Received: by mail-qt1-f200.google.com with SMTP id o1so3868877qtp.7
 for <qemu-devel@nongnu.org>; Fri, 27 Nov 2020 13:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i2/dRtOuvhvSk3o68clscms5tYZWhEp07lrknaDlFBk=;
 b=MLuJqDHu1Zu7gF3s/f0YT/EFNkuZXvhC41ZuVRPqn2qswSQgp3gMe7zyg420wpmuE3
 vFhsNFxTQq2tOm6X2psw1tMgfhcVx0OpnUKwv4SH5vr1IyaCJOiJtD/OhjD8NpE5WBUX
 8QZLly63H3o/f2alMvHnRS4SJ/oxCSmJdZ/plZtJ3Z1b9lJL8+V7CR/BreAdzt/VlmAK
 1XTzRmipmItscrXLVkibP7RZf+B1WD7zIJ/zvXmfzeVqPnNcvzFkrLj1nFpTomiKJWNO
 kAnMlLlTFd+4f2lLgY+avRV1wH8d0MG4ZJMptvlKz1/fnKZYHPrnvlotgFYreocxpfBF
 IMoA==
X-Gm-Message-State: AOAM531WIEMzrUcgSzydEhDyPAg7O49w1ScRJcta/6b1npxJc1tw8/EM
 xzLPhyART9iU24EaD6K11Pg8QcQzzaZH/fyiaTnNbXTZTPm4wG2bMDbOOicqxtGf8i1HnLZ0fcV
 BT42RNCKxsph8y8w=
X-Received: by 2002:a05:6214:40d:: with SMTP id
 z13mr10000501qvx.60.1606511043381; 
 Fri, 27 Nov 2020 13:04:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxH/otpKg9TgWRv62yB5nR1NWhiBOXAuwhpLRU28OGg7Frrz0yIT277aGTx7nsZmxOw3oiCrA==
X-Received: by 2002:a05:6214:40d:: with SMTP id
 z13mr10000466qvx.60.1606511042986; 
 Fri, 27 Nov 2020 13:04:02 -0800 (PST)
Received: from xz-x1 ([142.126.81.247])
 by smtp.gmail.com with ESMTPSA id r201sm7230184qka.114.2020.11.27.13.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 13:04:01 -0800 (PST)
Date: Fri, 27 Nov 2020 16:04:00 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v4 2/6] introduce UFFD-WP low-level interface helpers
Message-ID: <20201127210400.GF6573@xz-x1>
References: <20201126151734.743849-1-andrey.gruzdev@virtuozzo.com>
 <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201126151734.743849-3-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 26, 2020 at 06:17:30PM +0300, Andrey Gruzdev wrote:
> Implemented support for the whole RAM block memory
> protection/un-protection. Introduced higher level
> ram_write_tracking_start() and ram_write_tracking_stop()
> to start/stop tracking guest memory writes.

The whole patch looks good to me in general.  A few nitpickings below..

> 
> Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> ---
>  include/exec/memory.h      |   7 ++
>  include/qemu/userfaultfd.h |  29 +++++
>  migration/ram.c            | 120 +++++++++++++++++++++
>  migration/ram.h            |   4 +
>  util/meson.build           |   1 +
>  util/userfaultfd.c         | 215 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 376 insertions(+)
>  create mode 100644 include/qemu/userfaultfd.h
>  create mode 100644 util/userfaultfd.c
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 0f3e6bcd5e..3d798fce16 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -139,6 +139,13 @@ typedef struct IOMMUNotifier IOMMUNotifier;
>  /* RAM is a persistent kind memory */
>  #define RAM_PMEM (1 << 5)
>  
> +/*
> + * UFFDIO_WRITEPROTECT is used on this RAMBlock to
> + * support 'write-tracking' migration type.
> + * Implies ram_state->ram_wt_enabled.
> + */
> +#define RAM_UF_WRITEPROTECT (1 << 6)
> +
>  static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
>                                         IOMMUNotifierFlag flags,
>                                         hwaddr start, hwaddr end,
> diff --git a/include/qemu/userfaultfd.h b/include/qemu/userfaultfd.h
> new file mode 100644
> index 0000000000..fb843c76db
> --- /dev/null
> +++ b/include/qemu/userfaultfd.h
> @@ -0,0 +1,29 @@
> +/*
> + * Linux UFFD-WP support
> + *
> + * Copyright Virtuozzo GmbH, 2020
> + *
> + * Authors:
> + *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef USERFAULTFD_H
> +#define USERFAULTFD_H
> +
> +#include "qemu/osdep.h"
> +#include "exec/hwaddr.h"
> +#include <linux/userfaultfd.h>
> +
> +int uffd_create_fd(void);
> +void uffd_close_fd(int uffd);
> +int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
> +        bool track_missing, bool track_wp);
> +int uffd_unregister_memory(int uffd, hwaddr start, hwaddr length);
> +int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp);
> +int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
> +bool uffd_poll_events(int uffd, int tmo);
> +
> +#endif /* USERFAULTFD_H */
> diff --git a/migration/ram.c b/migration/ram.c
> index 7811cde643..3adfd1948d 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -56,6 +56,11 @@
>  #include "savevm.h"
>  #include "qemu/iov.h"
>  #include "multifd.h"
> +#include "sysemu/runstate.h"
> +
> +#ifdef CONFIG_LINUX
> +#include "qemu/userfaultfd.h"
> +#endif
>  
>  /***********************************************************/
>  /* ram save/restore */
> @@ -298,6 +303,8 @@ struct RAMSrcPageRequest {
>  struct RAMState {
>      /* QEMUFile used for this migration */
>      QEMUFile *f;
> +    /* UFFD file descriptor, used in 'write-tracking' migration */
> +    int uffdio_fd;
>      /* Last block that we have visited searching for dirty pages */
>      RAMBlock *last_seen_block;
>      /* Last block from where we have sent data */
> @@ -3788,6 +3795,119 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
>      return 0;
>  }
>  
> +/*
> + * ram_write_tracking_start: start UFFD-WP memory tracking
> + *
> + * Returns 0 for success or negative value in case of error
> + *

(extra new line)

> + */
> +int ram_write_tracking_start(void)
> +{
> +#ifdef CONFIG_LINUX
> +    int uffd;
> +    RAMState *rs = ram_state;
> +    RAMBlock *bs;
> +
> +    /* Open UFFD file descriptor */
> +    uffd = uffd_create_fd();
> +    if (uffd < 0) {
> +        return uffd;
> +    }
> +    rs->uffdio_fd = uffd;

May need a rcu_read_lock() here to guarantee safe access to
RAMBLOCK_FOREACH_NOT_IGNORED.

> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +        /* Nothing to do with read-only and MMIO-writable regions */
> +        if (bs->mr->readonly || bs->mr->rom_device) {
> +            continue;
> +        }
> +
> +        bs->flags |= RAM_UF_WRITEPROTECT;
> +        /* Register block memory with UFFD to track writes */
> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
> +                bs->max_length, false, true)) {
> +            goto fail;
> +        }
> +        /* Apply UFFD write protection to the block memory range */
> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
> +                bs->max_length, true)) {
> +            goto fail;
> +        }
> +
> +        info_report("UFFD-WP write-tracking enabled: "
> +                "block_id=%s page_size=%zu start=%p length=%lu "
> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> +                bs->mr->nonvolatile, bs->mr->rom_device);

Is info_report() by default printed?  Change this into a tracepoint?  Please
refer to functions named with trace_*().

> +    }
> +
> +    return 0;
> +
> +fail:
> +    error_report("ram_write_tracking_start() failed: restoring initial memory state");
> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> +            continue;
> +        }
> +        /*
> +         * In case some memory block failed to be write-protected
> +         * remove protection and unregister all succeeded RAM blocks
> +         */
> +        uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length, false);
> +        uffd_unregister_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length);
> +        /* Cleanup flags */
> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
> +    }
> +
> +    uffd_close_fd(uffd);
> +    rs->uffdio_fd = -1;
> +    return -1;
> +#else
> +    rs->uffdio_fd = -1;
> +    error_setg(&migrate_get_current()->error,
> +            "Background-snapshot not supported on non-Linux hosts");

Accessing the global var seems an overkill to me.  I'd simply return an error,
since iiuc if we gate the capability bit well, then these paths won't really
trigger at all.  So it's just to pass the compilations.

> +    return -1;
> +#endif /* CONFIG_LINUX */
> +}
> +
> +/**
> + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
> + */
> +void ram_write_tracking_stop(void)
> +{
> +#ifdef CONFIG_LINUX
> +    RAMState *rs = ram_state;
> +    RAMBlock *bs;
> +    assert(rs->uffdio_fd >= 0);

Maybe too harsh - we can return if it's invalid.

Meanwhile, better rcu_read_lock(), as well?

> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> +            continue;
> +        }
> +        /* Remove protection and unregister all affected RAM blocks */
> +        uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length, false);
> +        uffd_unregister_memory(rs->uffdio_fd, (hwaddr) bs->host, bs->max_length);
> +        /* Cleanup flags */
> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
> +
> +        info_report("UFFD-WP write-tracking disabled: "
> +                "block_id=%s page_size=%zu start=%p length=%lu "
> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> +                bs->mr->nonvolatile, bs->mr->rom_device);

Use tracepoint?

> +    }
> +
> +    /* Finally close UFFD file descriptor */
> +    uffd_close_fd(rs->uffdio_fd);
> +    rs->uffdio_fd = -1;
> +#else
> +    error_setg(&migrate_get_current()->error,
> +            "Background-snapshot not supported on non-Linux hosts");

Ditto.

> +#endif /* CONFIG_LINUX */
> +}
> +
>  static SaveVMHandlers savevm_ram_handlers = {
>      .save_setup = ram_save_setup,
>      .save_live_iterate = ram_save_iterate,
> diff --git a/migration/ram.h b/migration/ram.h
> index 011e85414e..0ec63e27ee 100644
> --- a/migration/ram.h
> +++ b/migration/ram.h
> @@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
>  void colo_release_ram_cache(void);
>  void colo_incoming_start_dirty_log(void);
>  
> +/* Background snapshots */
> +int ram_write_tracking_start(void);
> +void ram_write_tracking_stop(void);
> +
>  #endif
> diff --git a/util/meson.build b/util/meson.build
> index f359af0d46..c64bfe94b3 100644
> --- a/util/meson.build
> +++ b/util/meson.build
> @@ -50,6 +50,7 @@ endif
>  
>  if have_system
>    util_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus.c'), gio])
> +  util_ss.add(when: 'CONFIG_LINUX', if_true: files('userfaultfd.c'))
>  endif
>  
>  if have_block
> diff --git a/util/userfaultfd.c b/util/userfaultfd.c
> new file mode 100644
> index 0000000000..038953d7ed
> --- /dev/null
> +++ b/util/userfaultfd.c
> @@ -0,0 +1,215 @@
> +/*
> + * Linux UFFD-WP support
> + *
> + * Copyright Virtuozzo GmbH, 2020
> + *
> + * Authors:
> + *  Andrey Gruzdev   <andrey.gruzdev@virtuozzo.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/bitops.h"
> +#include "qemu/error-report.h"
> +#include "qemu/userfaultfd.h"
> +#include <poll.h>
> +#include <sys/syscall.h>
> +#include <sys/ioctl.h>
> +
> +/**
> + * uffd_create_fd: create UFFD file descriptor
> + *
> + * Returns non-negative file descriptor or negative value in case of an error
> + */
> +int uffd_create_fd(void)
> +{
> +    int uffd;
> +    struct uffdio_api api_struct;
> +    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
> +
> +    uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> +    if (uffd < 0) {
> +        error_report("uffd_create_fd() failed: UFFD not supported");
> +        return -1;
> +    }
> +
> +    api_struct.api = UFFD_API;
> +    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;

This might be too strict if we want to reuse the codes with postcopy to run on
old kernels that only supports missing.  Not a big problem for now; we can work
on top.

> +    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
> +        error_report("uffd_create_fd() failed: "
> +                     "API version not supported version=%llx errno=%i",
> +                api_struct.api, errno);

(A few strange alignments... won't complain but fixing would be even better)

> +        goto fail;
> +    }
> +
> +    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
> +        error_report("uffd_create_fd() failed: "
> +                     "PAGEFAULT_FLAG_WP feature missing");
> +        goto fail;
> +    }
> +
> +    return uffd;
> +
> +fail:
> +    close(uffd);
> +    return -1;
> +}
> +
> +/**
> + * uffd_close_fd: close UFFD file descriptor
> + *
> + * @uffd: UFFD file descriptor
> + */
> +void uffd_close_fd(int uffd)
> +{
> +    assert(uffd >= 0);
> +    close(uffd);
> +}
> +
> +/**
> + * uffd_register_memory: register memory range with UFFD
> + *
> + * Returns 0 in case of success, negative value on error
> + *
> + * @uffd: UFFD file descriptor
> + * @start: starting virtual address of memory range
> + * @length: length of memory range
> + * @track_missing: generate events on missing-page faults
> + * @track_wp: generate events on write-protected-page faults
> + */
> +int uffd_register_memory(int uffd, hwaddr start, hwaddr length,

My understanding is that hwaddr is for guest physical address space.  Here
I think either uint64_t or "void *" may suite better.

> +        bool track_missing, bool track_wp)
> +{
> +    struct uffdio_register uffd_register;
> +
> +    uffd_register.range.start = start;
> +    uffd_register.range.len = length;
> +    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
> +                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
> +
> +    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
> +        error_report("uffd_register_memory() failed: "
> +                     "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> +                start, length, uffd_register.mode, errno);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +/**
> + * uffd_unregister_memory: un-register memory range with UFFD
> + *
> + * Returns 0 in case of success, negative value on error
> + *
> + * @uffd: UFFD file descriptor
> + * @start: starting virtual address of memory range
> + * @length: length of memory range
> + */
> +int uffd_unregister_memory(int uffd, hwaddr start, hwaddr length)

Same question on using hwaddr as above.

> +{
> +    struct uffdio_range uffd_range;
> +
> +    uffd_range.start = start;
> +    uffd_range.len = length;
> +
> +    if (ioctl(uffd, UFFDIO_UNREGISTER, &uffd_range)) {
> +        error_report("uffd_unregister_memory() failed: "
> +                     "start=%0"PRIx64" len=%"PRIu64" errno=%i",
> +                start, length, errno);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +/**
> + * uffd_protect_memory: protect/unprotect memory range for writes with UFFD

It may look strange if uffd_protect_memory() can also unprotect stuff...

Maybe rename it to uffd_change_protection()?

> + *
> + * Returns 0 on success or negative value in case of error
> + *
> + * @uffd: UFFD file descriptor
> + * @start: starting virtual address of memory range
> + * @length: length of memory range
> + * @wp: write-protect/unprotect
> + */
> +int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
> +{
> +    struct uffdio_writeprotect uffd_writeprotect;
> +    int res;
> +
> +    uffd_writeprotect.range.start = start;
> +    uffd_writeprotect.range.len = length;
> +    uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
> +
> +    do {
> +        res = ioctl(uffd, UFFDIO_WRITEPROTECT, &uffd_writeprotect);
> +    } while (res < 0 && errno == EINTR);
> +    if (res < 0) {
> +        error_report("uffd_protect_memory() failed: "
> +                     "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> +                start, length, uffd_writeprotect.mode, errno);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> +
> +/**
> + * uffd_read_events: read pending UFFD events
> + *
> + * Returns number of fetched messages, 0 if non is available or
> + * negative value in case of an error
> + *
> + * @uffd: UFFD file descriptor
> + * @msgs: pointer to message buffer
> + * @count: number of messages that can fit in the buffer
> + */
> +int uffd_read_events(int uffd, struct uffd_msg *msgs, int count)
> +{
> +    ssize_t res;
> +    do {
> +        res = read(uffd, msgs, count * sizeof(struct uffd_msg));
> +    } while (res < 0 && errno == EINTR);
> +
> +    if ((res < 0 && errno == EAGAIN)) {
> +        return 0;
> +    }
> +    if (res < 0) {
> +        error_report("uffd_read_events() failed: errno=%i", errno);
> +        return -1;
> +    }
> +
> +    return (int) (res / sizeof(struct uffd_msg));
> +}
> +
> +/**
> + * uffd_poll_events: poll UFFD file descriptor for read
> + *
> + * Returns true if events are available for read, false otherwise
> + *
> + * @uffd: UFFD file descriptor
> + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
> + *       negative value for infinite wait
> + */
> +bool uffd_poll_events(int uffd, int tmo)

Shall we spell "tmo" out?

Thanks,

> +{
> +    int res;
> +    struct pollfd poll_fd = { .fd = uffd, .events = POLLIN, .revents = 0 };
> +
> +    do {
> +        res = poll(&poll_fd, 1, tmo);
> +    } while (res < 0 && errno == EINTR);
> +
> +    if (res == 0) {
> +        return false;
> +    }
> +    if (res < 0) {
> +        error_report("uffd_poll_events() failed: errno=%i", errno);
> +        return false;
> +    }
> +
> +    return (poll_fd.revents & POLLIN) != 0;
> +}
> -- 
> 2.25.1
> 

-- 
Peter Xu


