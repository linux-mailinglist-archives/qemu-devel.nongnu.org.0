Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D46C2C47DB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Nov 2020 19:45:09 +0100 (CET)
Received: from localhost ([::1]:40376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khzms-0000IB-RO
	for lists+qemu-devel@lfdr.de; Wed, 25 Nov 2020 13:45:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khzlB-0007tC-6a
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:43:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1khzl8-0003b6-Io
 for qemu-devel@nongnu.org; Wed, 25 Nov 2020 13:43:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606329797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XVGwBy4ycTONVbiL6NY2SatRbHhkmecjVK6Khec68QA=;
 b=HgN1wpWuO5WXoEWG1glARnrlP1c3SLNGFTSy54Qyvfd1HIR74Crsb6LE5A4hZ5AW3GOqua
 yu9V7nAnkkTthr0v4+wHT5FcR2/ZGdKoejsrQPE7yTNV4G3oqtF+rZCeB8KUlX4AUD9rTY
 eQA9VZSwbrW7FIm6iV5mh1C5BffO2GQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-3D2Wlp3HNaSMrw-hkV8enQ-1; Wed, 25 Nov 2020 13:43:15 -0500
X-MC-Unique: 3D2Wlp3HNaSMrw-hkV8enQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BFAD8180E473;
 Wed, 25 Nov 2020 18:43:14 +0000 (UTC)
Received: from work-vm (ovpn-115-12.ams2.redhat.com [10.36.115.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A5719C46;
 Wed, 25 Nov 2020 18:43:09 +0000 (UTC)
Date: Wed, 25 Nov 2020 18:43:07 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
Message-ID: <20201125184307.GJ3222@work-vm>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
 <20201124175712.GM3366@work-vm>
 <24483c0d-107f-427e-87b1-f4e039bfe486@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <24483c0d-107f-427e-87b1-f4e039bfe486@virtuozzo.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> On 24.11.2020 20:57, Dr. David Alan Gilbert wrote:
> > * Andrey Gruzdev (andrey.gruzdev@virtuozzo.com) wrote:
> > > Implemented support for the whole RAM block memory
> > > protection/un-protection. Introduced higher level
> > > ram_write_tracking_start() and ram_write_tracking_stop()
> > > to start/stop tracking guest memory writes.
> > > 
> > > Signed-off-by: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
> > > ---
> > >   include/exec/memory.h |   7 ++
> > >   migration/ram.c       | 267 ++++++++++++++++++++++++++++++++++++++++++
> > >   migration/ram.h       |   4 +
> > >   3 files changed, 278 insertions(+)
> > > 
> > > diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > index 0f3e6bcd5e..3d798fce16 100644
> > > --- a/include/exec/memory.h
> > > +++ b/include/exec/memory.h
> > > @@ -139,6 +139,13 @@ typedef struct IOMMUNotifier IOMMUNotifier;
> > >   /* RAM is a persistent kind memory */
> > >   #define RAM_PMEM (1 << 5)
> > > +/*
> > > + * UFFDIO_WRITEPROTECT is used on this RAMBlock to
> > > + * support 'write-tracking' migration type.
> > > + * Implies ram_state->ram_wt_enabled.
> > > + */
> > > +#define RAM_UF_WRITEPROTECT (1 << 6)
> > > +
> > >   static inline void iommu_notifier_init(IOMMUNotifier *n, IOMMUNotify fn,
> > >                                          IOMMUNotifierFlag flags,
> > >                                          hwaddr start, hwaddr end,
> > > diff --git a/migration/ram.c b/migration/ram.c
> > > index 7811cde643..7f273c9996 100644
> > > --- a/migration/ram.c
> > > +++ b/migration/ram.c
> > > @@ -56,6 +56,12 @@
> > >   #include "savevm.h"
> > >   #include "qemu/iov.h"
> > >   #include "multifd.h"
> > > +#include <inttypes.h>
> > > +#include <poll.h>
> > > +#include <sys/syscall.h>
> > > +#include <sys/ioctl.h>
> > > +#include <linux/userfaultfd.h>
> > > +#include "sysemu/runstate.h"
> > >   /***********************************************************/
> > >   /* ram save/restore */
> > > @@ -298,6 +304,8 @@ struct RAMSrcPageRequest {
> > >   struct RAMState {
> > >       /* QEMUFile used for this migration */
> > >       QEMUFile *f;
> > > +    /* UFFD file descriptor, used in 'write-tracking' migration */
> > > +    int uffdio_fd;
> > >       /* Last block that we have visited searching for dirty pages */
> > >       RAMBlock *last_seen_block;
> > >       /* Last block from where we have sent data */
> > > @@ -453,6 +461,181 @@ static QemuThread *decompress_threads;
> > >   static QemuMutex decomp_done_lock;
> > >   static QemuCond decomp_done_cond;
> > > +/**
> > > + * uffd_create_fd: create UFFD file descriptor
> > > + *
> > > + * Returns non-negative file descriptor or negative value in case of an error
> > > + */
> > > +static int uffd_create_fd(void)
> > > +{
> > > +    int uffd;
> > > +    struct uffdio_api api_struct;
> > > +    uint64_t ioctl_mask = BIT(_UFFDIO_REGISTER) | BIT(_UFFDIO_UNREGISTER);
> > 
> > You need to be a bit careful about doing this in migration/ram.c - it's
> > generic code; at minimum it needs ifdef'ing for Linux.
> > 
> 
> Yes, it's totally linux-specific, I think better to move this code out of
> migration/ram.c, as Peter proposed.
> 
> > > +    uffd = syscall(__NR_userfaultfd, O_CLOEXEC | O_NONBLOCK);
> > > +    if (uffd < 0) {
> > > +        error_report("uffd_create_fd() failed: UFFD not supported");
> > > +        return -1;
> > > +    }
> > > +
> > > +    api_struct.api = UFFD_API;
> > > +    api_struct.features = UFFD_FEATURE_PAGEFAULT_FLAG_WP;
> > > +    if (ioctl(uffd, UFFDIO_API, &api_struct)) {
> > > +        error_report("uffd_create_fd() failed: "
> > > +                "API version not supported version=%llx errno=%i",
> > > +                api_struct.api, errno);
> > > +        goto fail;
> > > +    }
> > > +
> > > +    if ((api_struct.ioctls & ioctl_mask) != ioctl_mask) {
> > > +        error_report("uffd_create_fd() failed: "
> > > +                "PAGEFAULT_FLAG_WP feature missing");
> > > +        goto fail;
> > > +    }
> > > +
> > > +    return uffd;
> > 
> > Should we be putting that somewher that we can share with postcopy?
> > 
> 
> Sure, maybe to util/uffd-wp.c + include/qemu/uffd-wp.h.
> What do you think?

Or how about a userfaultfd.c somewhere?

Dave

> > > +fail:
> > > +    close(uffd);
> > > +    return -1;
> > > +}
> > > +
> > > +/**
> > > + * uffd_close_fd: close UFFD file descriptor
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + */
> > > +static void uffd_close_fd(int uffd)
> > > +{
> > > +    assert(uffd >= 0);
> > > +    close(uffd);
> > > +}
> > > +
> > > +/**
> > > + * uffd_register_memory: register memory range with UFFD
> > > + *
> > > + * Returns 0 in case of success, negative value on error
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + * @start: starting virtual address of memory range
> > > + * @length: length of memory range
> > > + * @track_missing: generate events on missing-page faults
> > > + * @track_wp: generate events on write-protected-page faults
> > > + */
> > > +static int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
> > > +        bool track_missing, bool track_wp)
> > > +{
> > > +    struct uffdio_register uffd_register;
> > > +
> > > +    uffd_register.range.start = start;
> > > +    uffd_register.range.len = length;
> > > +    uffd_register.mode = (track_missing ? UFFDIO_REGISTER_MODE_MISSING : 0) |
> > > +                         (track_wp ? UFFDIO_REGISTER_MODE_WP : 0);
> > > +
> > > +    if (ioctl(uffd, UFFDIO_REGISTER, &uffd_register)) {
> > > +        error_report("uffd_register_memory() failed: "
> > > +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> > > +                start, length, uffd_register.mode, errno);
> > > +        return -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +/**
> > > + * uffd_protect_memory: protect/unprotect memory range for writes with UFFD
> > > + *
> > > + * Returns 0 on success or negative value in case of error
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + * @start: starting virtual address of memory range
> > > + * @length: length of memory range
> > > + * @wp: write-protect/unprotect
> > > + */
> > > +static int uffd_protect_memory(int uffd, hwaddr start, hwaddr length, bool wp)
> > > +{
> > > +    struct uffdio_writeprotect uffd_writeprotect;
> > > +    int res;
> > > +
> > > +    uffd_writeprotect.range.start = start;
> > > +    uffd_writeprotect.range.len = length;
> > > +    uffd_writeprotect.mode = (wp ? UFFDIO_WRITEPROTECT_MODE_WP : 0);
> > > +
> > > +    do {
> > > +        res = ioctl(uffd, UFFDIO_WRITEPROTECT, &uffd_writeprotect);
> > > +    } while (res < 0 && errno == EINTR);
> > > +    if (res < 0) {
> > > +        error_report("uffd_protect_memory() failed: "
> > > +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> > > +                start, length, uffd_writeprotect.mode, errno);
> > > +        return -1;
> > > +    }
> > > +
> > > +    return 0;
> > > +}
> > > +
> > > +__attribute__ ((unused))
> > > +static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count);
> > > +__attribute__ ((unused))
> > > +static bool uffd_poll_events(int uffd, int tmo);
> > > +
> > > +/**
> > > + * uffd_read_events: read pending UFFD events
> > > + *
> > > + * Returns number of fetched messages, 0 if non is available or
> > > + * negative value in case of an error
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + * @msgs: pointer to message buffer
> > > + * @count: number of messages that can fit in the buffer
> > > + */
> > > +static int uffd_read_events(int uffd, struct uffd_msg *msgs, int count)
> > > +{
> > > +    ssize_t res;
> > > +    do {
> > > +        res = read(uffd, msgs, count * sizeof(struct uffd_msg));
> > > +    } while (res < 0 && errno == EINTR);
> > > +
> > > +    if ((res < 0 && errno == EAGAIN)) {
> > > +        return 0;
> > > +    }
> > > +    if (res < 0) {
> > > +        error_report("uffd_read_events() failed: errno=%i", errno);
> > > +        return -1;
> > > +    }
> > > +
> > > +    return (int) (res / sizeof(struct uffd_msg));
> > > +}
> > > +
> > > +/**
> > > + * uffd_poll_events: poll UFFD file descriptor for read
> > > + *
> > > + * Returns true if events are available for read, false otherwise
> > > + *
> > > + * @uffd: UFFD file descriptor
> > > + * @tmo: timeout in milliseconds, 0 for non-blocking operation,
> > > + *       negative value for infinite wait
> > > + */
> > > +static bool uffd_poll_events(int uffd, int tmo)
> > > +{
> > > +    int res;
> > > +    struct pollfd poll_fd = { .fd = uffd, .events = POLLIN, .revents = 0 };
> > > +
> > > +    do {
> > > +        res = poll(&poll_fd, 1, tmo);
> > > +    } while (res < 0 && errno == EINTR);
> > > +
> > > +    if (res == 0) {
> > > +        return false;
> > > +    }
> > > +    if (res < 0) {
> > > +        error_report("uffd_poll_events() failed: errno=%i", errno);
> > > +        return false;
> > > +    }
> > > +
> > > +    return (poll_fd.revents & POLLIN) != 0;
> > > +}
> > > +
> > >   static bool do_compress_ram_page(QEMUFile *f, z_stream *stream, RAMBlock *block,
> > >                                    ram_addr_t offset, uint8_t *source_buf);
> > > @@ -3788,6 +3971,90 @@ static int ram_resume_prepare(MigrationState *s, void *opaque)
> > >       return 0;
> > >   }
> > > +/**
> > > + * ram_write_tracking_start: start UFFD-WP memory tracking
> > > + *
> > > + * Returns 0 for success or negative value in case of error
> > > + *
> > > + */
> > > +int ram_write_tracking_start(void)
> > > +{
> > > +    int uffd;
> > > +    RAMState *rs = ram_state;
> > > +    RAMBlock *bs;
> > > +
> > > +    /* Open UFFD file descriptor */
> > > +    uffd = uffd_create_fd();
> > > +    if (uffd < 0) {
> > > +        return uffd;
> > > +    }
> > > +    rs->uffdio_fd = uffd;
> > > +
> > > +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> > > +        /* Nothing to do with read-only and MMIO-writable regions */
> > > +        if (bs->mr->readonly || bs->mr->rom_device) {
> > > +            continue;
> > > +        }
> > > +
> > > +        /* Register block memory with UFFD to track writes */
> > > +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
> > > +                bs->max_length, false, true)) {
> > > +            goto fail;
> > > +        }
> > > +        /* Apply UFFD write protection to the block memory range */
> > > +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
> > > +                bs->max_length, true)) {
> > > +            goto fail;
> > > +        }
> > > +        bs->flags |= RAM_UF_WRITEPROTECT;
> > > +
> > > +        info_report("UFFD-WP write-tracking enabled: "
> > > +                "block_id=%s page_size=%zu start=%p length=%lu "
> > > +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> > > +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> > > +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> > > +                bs->mr->nonvolatile, bs->mr->rom_device);
> > > +    }
> > > +
> > > +    return 0;
> > > +
> > > +fail:
> > > +    uffd_close_fd(uffd);
> > > +    rs->uffdio_fd = -1;
> > > +    return -1;
> > > +}
> > > +
> > > +/**
> > > + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection
> > > + */
> > > +void ram_write_tracking_stop(void)
> > > +{
> > > +    RAMState *rs = ram_state;
> > > +    RAMBlock *bs;
> > > +    assert(rs->uffdio_fd >= 0);
> > > +
> > > +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> > > +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> > > +            continue;
> > > +        }
> > > +        info_report("UFFD-WP write-tracking disabled: "
> > > +                "block_id=%s page_size=%zu start=%p length=%lu "
> > > +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> > > +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> > > +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> > > +                bs->mr->nonvolatile, bs->mr->rom_device);
> > > +        /* Cleanup flags */
> > > +        bs->flags &= ~RAM_UF_WRITEPROTECT;
> > > +    }
> > > +
> > > +    /*
> > > +     * Close UFFD file descriptor to remove protection,
> > > +     * release registered memory regions and flush wait queues
> > > +     */
> > > +    uffd_close_fd(rs->uffdio_fd);
> > > +    rs->uffdio_fd = -1;
> > > +}
> > > +
> > >   static SaveVMHandlers savevm_ram_handlers = {
> > >       .save_setup = ram_save_setup,
> > >       .save_live_iterate = ram_save_iterate,
> > > diff --git a/migration/ram.h b/migration/ram.h
> > > index 011e85414e..3611cb51de 100644
> > > --- a/migration/ram.h
> > > +++ b/migration/ram.h
> > > @@ -79,4 +79,8 @@ void colo_flush_ram_cache(void);
> > >   void colo_release_ram_cache(void);
> > >   void colo_incoming_start_dirty_log(void);
> > > +/* Live snapshots */
> > > +int ram_write_tracking_start(void);
> > > +void ram_write_tracking_stop(void);
> > > +
> > >   #endif
> > > -- 
> > > 2.25.1
> > > 
> 
> 
> -- 
> Andrey Gruzdev, Principal Engineer
> Virtuozzo GmbH  +7-903-247-6397
>                 virtuzzo.com
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


