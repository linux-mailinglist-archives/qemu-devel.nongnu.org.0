Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F85632AC5F
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 22:46:16 +0100 (CET)
Received: from localhost ([::1]:55616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHCqN-0008LQ-3o
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 16:46:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHCp5-0007os-Oy
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:44:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lHCp2-0007eI-4M
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 16:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614721490;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nuZqaL0Hz7l2sOX7V1GibqFEAzncTdboOiku8Z7049s=;
 b=JzD6rRYYbruyuxmE+KskyeFElYOikpdhclP7dyh85la+qyWLngNMAJiAqPZ8PmIW9DtnNO
 +xn22nu6z+6oOmTuIgIIdf0Id8AanzevJJsxjMWf936vwDhhsVSoif+Xjy70Bt4ZPzwAHY
 zu8ovC1FNZOny+RjFUCKezCjDK/XXLk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-RExYfN17PsupRtzk3nD8Vw-1; Tue, 02 Mar 2021 16:44:49 -0500
X-MC-Unique: RExYfN17PsupRtzk3nD8Vw-1
Received: by mail-qv1-f69.google.com with SMTP id m9so15942206qvu.11
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 13:44:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=nuZqaL0Hz7l2sOX7V1GibqFEAzncTdboOiku8Z7049s=;
 b=UJY4RYY1044zmItZ6cYQKhFRGZZ+8zfK5R1kanW+pBPYqGL9++vfQhhV2diVTjWjTx
 +X191ydAoJxkuytcF4WPK5b1686mJHKMGdOG4nVg1yoYvmWEx5Wbi9bgfp4y4X+jN7DL
 AX9sXyCdcygL8HZBwvstKOtRFzUfVCsFgKPIsF99HpQ1GA/BoyZxQ3PDUPtHoq+liSTw
 /SbB5SoD5T7iYIq8J8nyWDiI6QXenMYUGr7sMQrVpQgiIEQtJgrxxZtLmzdQaUX9agmC
 oBmMu2V/RebzPxeO5hrUJIZLJHoqY7ud19pooxiHPD9bKqcyw8luzW7Uc0hrcw5PtCOh
 yY7A==
X-Gm-Message-State: AOAM5319j0To/Gk0IyxSRBROZPc9MVPp5XwF/CPY04tjKm0k3XxOtuGI
 CPkgMiP7r63nSbCgQhmzW39HYuBnFSxdZxn8XPyzBvJDAUQ5erImixIGE4fGbbL9eOSHrS0Z1Sc
 adqwORIqGm0H9aKA=
X-Received: by 2002:a37:ea1b:: with SMTP id t27mr22909067qkj.348.1614721488476; 
 Tue, 02 Mar 2021 13:44:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDZJD4C41CJ3VRUgdlgyeNAq+kW7jeNAmFRX4YmRFujGvId363w2XQ7fzLgwFkbqSdqqqT/A==
X-Received: by 2002:a37:ea1b:: with SMTP id t27mr22909029qkj.348.1614721488216; 
 Tue, 02 Mar 2021 13:44:48 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id m5sm6999666qtu.45.2021.03.02.13.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 13:44:47 -0800 (PST)
Date: Tue, 2 Mar 2021 16:44:44 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 8/9] util/mmap-alloc: support RAM_NORESERVE via
 MAP_NORESERVE
Message-ID: <20210302214444.GQ397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-9-david@redhat.com>
 <20210302175112.GN397383@xz-x1>
 <522c672e-9c16-48ef-24a8-3687b5332b2a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <522c672e-9c16-48ef-24a8-3687b5332b2a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 02, 2021 at 08:01:11PM +0100, David Hildenbrand wrote:
> On 02.03.21 18:51, Peter Xu wrote:
> > On Tue, Feb 09, 2021 at 02:49:38PM +0100, David Hildenbrand wrote:
> > > +#define OVERCOMMIT_MEMORY_PATH "/proc/sys/vm/overcommit_memory"
> > > +static bool map_noreserve_effective(int fd, bool shared)
> > > +{
> > > +#if defined(__linux__)
> > > +    gchar *content = NULL;
> > > +    const char *endptr;
> > > +    unsigned int tmp;
> > > +
> > > +    /* hugetlbfs behaves differently */
> > > +    if (qemu_fd_getpagesize(fd) != qemu_real_host_page_size) {
> > > +        return true;
> > > +    }
> > > +
> > > +    /* only private shared mappings are accounted (ignoring /dev/zero) */
> > > +    if (fd != -1 && shared) {
> > > +        return true;
> > > +    }

[1]

> > > +
> > > +    if (g_file_get_contents(OVERCOMMIT_MEMORY_PATH, &content, NULL, NULL) &&
> > > +        !qemu_strtoui(content, &endptr, 0, &tmp) &&
> > > +        (!endptr || *endptr == '\n')) {
> > > +        if (tmp == 2) {
> > > +            error_report("Skipping reservation of swap space is not supported: "
> > > +                         " \"" OVERCOMMIT_MEMORY_PATH "\" is \"2\"");
> > > +            return false;
> > > +        }
> > > +        return true;
> > > +    }
> > > +    /* this interface has been around since Linux 2.6 */
> > > +    error_report("Skipping reservation of swap space is not supported: "
> > > +                 " Could not read: \"" OVERCOMMIT_MEMORY_PATH "\"");
> > > +    return false;
> > > +#else
> > > +    return true;
> > > +#endif
> > > +}
> > 
> > I feel like this helper wants to fail gracefully for some conditions.  Could
> > you elaborate one example and attach to the commit log?
> 
> Sure. The case is "/proc/sys/vm/overcommit_memory == 2" (never overcommit)
> 
> MAP_NORESERVE is without effect and sparse memory regions are somewhat
> impossible.
> 
> > 
> > I'm also wondering whether it would worth to check the global value.  Even if
> > overcommit is globally disabled, do we (as an application process) need to care
> > about it?  I think the MAP_NORESERVE would simply be silently ignored by the
> > kernel and that seems to be design of it, otherwise would all apps who uses > MAP_NORESERVE would need to do similar things too?
> 
> Right, I want to catch the "gets silently ignored" part, because someone
> requested "reserved=off" (!default) but does not actually get what he asked
> for.
> 
> As one example, glibc manages heaps via:
> 
> a) Creating a new heap: mmap(PROT_NONE, MAP_NORESERVE) the maximum size,
> then mprotect(PROT_READ|PROT_WRITE) the initial heap size. Even if
> MAP_NORESERVE is ignored, only !PROT_NONE memory ever gets committed
> ("reserve swap space") in Linux.
> 
> b) Growing the heap via mprotect(PROT_READ|PROT_WRITE) within the existing
> mmap. This will commit memory in case MAP_NORESERVE got ignored.
> 
> c) Shrinking the heap ("discard memory") via MADV_DONTNEED *unless*
> "/proc/sys/vm/overcommit_memory == 2" - the only way to undo
> mprotect(PROT_READ|PROT_WRITE) and to un-commit memory is by doing a
> mmap(PROT_NONE, MAP_FIXED) over the problematic region.
> 
> If you're interested, you can take a look at:
> 
> malloc/arena.c
> sysdeps/unix/sysv/linux/malloc-sysdep.h:check_may_shrink_heap()

Thanks for the context.  It's interesting to know libc has such special heap
operations.

Glibc shrinks heap to save memory for the no-over-commit case, however in our
case currently we'd like to fail some users using global_overcommit=2 but
reserve=off - it means even if we don't fail the user, mmap() could also fail
if it's overcommitted. Even if this mmap() didn't fail, it'll fail very easily
later on iiuc, right?

I think it's fine to have that early failure, it just seems less helpful than
what glibc was doing which shrinks active memory for real, meanwhile there
seems to encode some very detailed OS information into this helper, so just
less charming.

Btw above [1] "fd != -1 && shared" looks weird to me.

Firstly it'll bypass overcommit_memory==2 check and return true directly, is
that right?  I thought the global will be meaningful for all memories except
hugetlbfs (in do_mmap() of Linux).

Meanwhile, I don't see why file-backed share memories is so special too..  From
your commit message, I'm not sure whether you wanted to return false instead,
however that's still not the case IIUC, since e.g. /dev/shmem still does
accounting iiuc, while MAP_NORESERVE will skip it.

-- 
Peter Xu


