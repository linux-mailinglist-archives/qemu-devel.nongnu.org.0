Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF02D2B9ACB
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:41:33 +0100 (CET)
Received: from localhost ([::1]:57750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfos8-0007U8-SM
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:41:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfops-0006cP-Lc
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1kfopo-0008GR-NG
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 13:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605811146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E4RCLJjFpTLT6TWFc0WexXTo+yPQxFAqhNfe0P5w5GQ=;
 b=FkbIsJMvBp01x2oi9M94ONhaQxFna4a2GTii+1o/Z7ztyEFy6jhIdKHdbjtPCm1wZ+7klY
 ibDxV46Wk/SNB4CiJMaD8dsr+LaS3pOQGEKd7ttzd4p8GRFTBr//70Du5I2ro1UoAEsNSc
 6upboPT5tJCNhvSdDC6X6PWKPtvfpkM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-OupzJqx_P-iykvG7HVM95w-1; Thu, 19 Nov 2020 13:39:05 -0500
X-MC-Unique: OupzJqx_P-iykvG7HVM95w-1
Received: by mail-qt1-f199.google.com with SMTP id n12so5402146qta.9
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 10:39:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E4RCLJjFpTLT6TWFc0WexXTo+yPQxFAqhNfe0P5w5GQ=;
 b=m6SlpCLXCjEp1JtkQpX8YZUswxFGbAFwuBcRfSI94ap5BLQPM53jd9RCZg/FcAG2Pa
 w2+YwhzLRi8OGMLmR0B7yzWGv9aVglzYpb80mugYMiPZlPPqUaYAFzaMDnr5oYKnL6Rl
 x/S81Mjm9XMWGtfqtweN+KHMDaCc+tBf7gguZyVm+lSSiT1hh0QCc/DdBn48SPTfrQ0m
 4tnfX74GJqELhk5/LXhkM8egP5X/RdWCYUkm5PWFyyZfsgoOI0i6U6nnZB3NxNroQVnR
 vQIOxokqJLjg4V2M39lksZAb/SFuIEmtQsgYPLlRDOMUx/yQR/1i/TZimS3EVoDxnHHp
 lKrQ==
X-Gm-Message-State: AOAM531LDxVOVlg/KJamci6NaEvI3I2ttui9E/lOozS4ph1veyWQR856
 +0gIevT052z9BXKBiNEQ77yQYKncnS5rIiKmAzYsVq69n91ElCGw3a1s4UJscFOPXHnxUuRRq96
 jlw9Y/DoPQpztFCY=
X-Received: by 2002:a37:a110:: with SMTP id k16mr13005783qke.285.1605811144527; 
 Thu, 19 Nov 2020 10:39:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOBq7w7SRLTB/HW5ToEThezO2wwKvqW4pOt1E/sAnDxfI7S4gvR1fm/6EvqpVI5qksRX9EzA==
X-Received: by 2002:a37:a110:: with SMTP id k16mr13005758qke.285.1605811144268; 
 Thu, 19 Nov 2020 10:39:04 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-20-174-93-89-196.dsl.bell.ca. [174.93.89.196])
 by smtp.gmail.com with ESMTPSA id w138sm401102qkb.130.2020.11.19.10.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 10:39:03 -0800 (PST)
Date: Thu, 19 Nov 2020 13:39:02 -0500
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v3 2/7] introduce UFFD-WP low-level interface helpers
Message-ID: <20201119183902.GC6538@xz-x1>
References: <20201119125940.20017-1-andrey.gruzdev@virtuozzo.com>
 <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20201119125940.20017-3-andrey.gruzdev@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, Nov 19, 2020 at 03:59:35PM +0300, Andrey Gruzdev via wrote:
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
> +static int uffd_register_memory(int uffd, hwaddr start, hwaddr length,
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
> +                "start=%0"PRIx64" len=%"PRIu64" mode=%llu errno=%i",
> +                start, length, uffd_register.mode, errno);
> +        return -1;
> +    }
> +
> +    return 0;
> +}

These functions look good; we should even be able to refactor the existing
ones, e.g., ram_block_enable_notify(), but we can also do that later.  As a
start, we can move these helpers into some common files under util/.

[...]

> +/**
> + * ram_write_tracking_start: start UFFD-WP memory tracking
> + *
> + * Returns 0 for success or negative value in case of error
> + *
> + */
> +int ram_write_tracking_start(void)
> +{

Need to be slightly careful on unwind on this function, because if it fails
somehow we don't want to crash the existing running good vm... more below.

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
> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +        /* Nothing to do with read-only and MMIO-writable regions */
> +        if (bs->mr->readonly || bs->mr->rom_device) {
> +            continue;
> +        }
> +
> +        /* Register block memory with UFFD to track writes */
> +        if (uffd_register_memory(rs->uffdio_fd, (hwaddr) bs->host,
> +                bs->max_length, false, true)) {
> +            goto fail;
> +        }
> +        /* Apply UFFD write protection to the block memory range */
> +        if (uffd_protect_memory(rs->uffdio_fd, (hwaddr) bs->host,
> +                bs->max_length, true)) {

Here logically we need to undo the previous register first, however userfaultfd
will auto-clean these when close(fd), so it's ok.  However still better to
unwind the protection of pages, I think.  So...

> +            goto fail;
> +        }
> +        bs->flags |= RAM_UF_WRITEPROTECT;
> +
> +        info_report("UFFD-WP write-tracking enabled: "
> +                "block_id=%s page_size=%zu start=%p length=%lu "
> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> +                bs->mr->nonvolatile, bs->mr->rom_device);
> +    }
> +
> +    return 0;
> +
> +fail:
> +    uffd_close_fd(uffd);

... maybe do the unprotect here together, that as long as any of the above step
failed, we need to remember to unprotect all the protected pages (or just
unprotect everything).  And also the RAM_UF_WRITEPROTECT flags being set.

> +    rs->uffdio_fd = -1;
> +    return -1;
> +}
> +
> +/**
> + * ram_write_tracking_stop: stop UFFD-WP memory tracking and remove protection

Didn't remove protections, yet?

We should remove those.  For a succeeded snapshot we can avoid that (if we want
such optimization), or imho we'd better unprotect all just in case the user
interrupted the snapshot.

> + */
> +void ram_write_tracking_stop(void)
> +{
> +    RAMState *rs = ram_state;
> +    RAMBlock *bs;
> +    assert(rs->uffdio_fd >= 0);
> +
> +    RAMBLOCK_FOREACH_NOT_IGNORED(bs) {
> +        if ((bs->flags & RAM_UF_WRITEPROTECT) == 0) {
> +            continue;
> +        }
> +        info_report("UFFD-WP write-tracking disabled: "
> +                "block_id=%s page_size=%zu start=%p length=%lu "
> +                "romd_mode=%i ram=%i readonly=%i nonvolatile=%i rom_device=%i",
> +                bs->idstr, bs->page_size, bs->host, bs->max_length,
> +                bs->mr->romd_mode, bs->mr->ram, bs->mr->readonly,
> +                bs->mr->nonvolatile, bs->mr->rom_device);
> +        /* Cleanup flags */
> +        bs->flags &= ~RAM_UF_WRITEPROTECT;
> +    }
> +
> +    /*
> +     * Close UFFD file descriptor to remove protection,
> +     * release registered memory regions and flush wait queues
> +     */
> +    uffd_close_fd(rs->uffdio_fd);
> +    rs->uffdio_fd = -1;
> +}

-- 
Peter Xu


