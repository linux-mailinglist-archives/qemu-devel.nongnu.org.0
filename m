Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0360334492
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 18:03:23 +0100 (CET)
Received: from localhost ([::1]:60752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK2F0-0001dK-N9
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 12:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK1g0-0006jV-N1
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:27:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lK1fx-0003pJ-Ap
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615393628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jomi3F65pfmGU3Uh/g+dRU4ouAkupmGJUjWfyTZlZXI=;
 b=LvjbnAdsV683Dj0E2tKF4Ii6L5YVjghWJtWbMwy8GYWpIOEZuPKEOsZciu8RKq11HEQMXU
 UG8tCmYMl6QJZ5GOiEhGZIAmBUcA8ae85kZywBNyqmllZam+1ZBqZzP7yBiz5v+VgHzkZU
 42sNm9YupxY9fcWMr7LvWKJn0OmNSrM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-7RAVq8E5M7yxPyPTL6TNWw-1; Wed, 10 Mar 2021 11:27:06 -0500
X-MC-Unique: 7RAVq8E5M7yxPyPTL6TNWw-1
Received: by mail-qv1-f69.google.com with SMTP id h12so13073702qvm.9
 for <qemu-devel@nongnu.org>; Wed, 10 Mar 2021 08:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=jomi3F65pfmGU3Uh/g+dRU4ouAkupmGJUjWfyTZlZXI=;
 b=iQ7NXBvjjHzdxyOc3ftKtpcFDPG7yk9/Gu7G4AbpXdTRBmGd0Wqf1kbo+Bnq9D299u
 OFeMUHMhQr2+6e/XUmovPFkxZm1TSuwEP2kfFOSobOTUK5T2gurBH3jq1WxXMPC99MN4
 R8A6DcyguBGgMjGSJ+Dr1PisK9lum3ucCvhqx3aoHdGfPJuLft1FjrqMeaoCss9HU0uK
 3bs6yob0k5NUwlwoymDici/WFQW+916iklzNk4utpGqvoQ7QdJG/iDhAdqpFJX5lPYFb
 pbbNZhpJ6rC+dmouXeGN+EfQk2111T5K9B891QXoDyKyLeTcqI5gjpDwP3NfKMhW1bxV
 TndQ==
X-Gm-Message-State: AOAM531nL05rcNQVzJxlB7GBinWpust/HMYvWjCchiThwDXzKavKbAwG
 dAqri9iD/tIg1ZnWoC+KGS5YpC9udlM6Aoa8n3T9qwutRVSfUvJ/GZoIywFm/6CpkTFro27trnJ
 I9gDtZipDH1ALKJU=
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr3315716qtv.299.1615393626218; 
 Wed, 10 Mar 2021 08:27:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwG9hF4s81gu7DBdNfu0rRXQUfcS0nYv7hQOOYiUq9LE+XNgZcK2G/ypRdr7xB5tYnzWH+LDw==
X-Received: by 2002:ac8:6e85:: with SMTP id c5mr3315677qtv.299.1615393625861; 
 Wed, 10 Mar 2021 08:27:05 -0800 (PST)
Received: from xz-x1 ([142.126.89.138])
 by smtp.gmail.com with ESMTPSA id y20sm11995295qtw.32.2021.03.10.08.27.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 08:27:05 -0800 (PST)
Date: Wed, 10 Mar 2021 11:27:03 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Message-ID: <20210310162703.GA6530@xz-x1>
References: <20210309200451.GF763132@xz-x1>
 <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
 <20210309205809.GI763132@xz-x1>
 <8f1f955d-f3b8-298b-eb43-b5d51824af44@redhat.com>
 <1831f4b8-9dd2-4fc1-c3cd-1e789a7bc37f@redhat.com>
 <2a597019-4847-1af8-bceb-1664cee108b1@redhat.com>
MIME-Version: 1.0
In-Reply-To: <2a597019-4847-1af8-bceb-1664cee108b1@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Greg Kurz <groug@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 10, 2021 at 11:55:58AM +0100, David Hildenbrand wrote:
> On 10.03.21 11:11, David Hildenbrand wrote:
> > On 10.03.21 09:41, David Hildenbrand wrote:
> > > On 09.03.21 21:58, Peter Xu wrote:
> > > > On Tue, Mar 09, 2021 at 09:27:10PM +0100, David Hildenbrand wrote:
> > > > > 
> > > > > > Am 09.03.2021 um 21:04 schrieb Peter Xu <peterx@redhat.com>:
> > > > > > 
> > > > > > ﻿On Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrote:
> > > > > > > Let's introduce a new set of flags that abstract mmap logic and replace
> > > > > > > our current set of bools, to prepare for another flag.
> > > > > > > 
> > > > > > > Signed-off-by: David Hildenbrand <david@redhat.com>
> > > > > > > ---
> > > > > > > include/qemu/mmap-alloc.h | 17 +++++++++++------
> > > > > > > softmmu/physmem.c         |  8 +++++---
> > > > > > > util/mmap-alloc.c         | 14 +++++++-------
> > > > > > > util/oslib-posix.c        |  3 ++-
> > > > > > > 4 files changed, 25 insertions(+), 17 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> > > > > > > index 456ff87df1..55664ea9f3 100644
> > > > > > > --- a/include/qemu/mmap-alloc.h
> > > > > > > +++ b/include/qemu/mmap-alloc.h
> > > > > > > @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
> > > > > > > 
> > > > > > > size_t qemu_mempath_getpagesize(const char *mem_path);
> > > > > > > 
> > > > > > > +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
> > > > > > > +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
> > > > > > > +
> > > > > > > +/* Map MAP_SHARED instead of MAP_PRIVATE. */
> > > > > > > +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
> > > > > > > +
> > > > > > > +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
> > > > > > > +#define QEMU_RAM_MMAP_PMEM          (1 << 2)
> > > > > > 
> > > > > > Sorry to speak late - I just noticed that is_pmem can actually be converted too
> > > > > > with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA for
> > > > > > use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
> > > > > > directly using MAP_*, I think?
> > > > > > 
> > > > > 
> > > > > No problem :) I don‘t think passing in random MAP_ flags is a good interface (we would at least need an allow list).
> > > > > 
> > > > >     I like the abstraction / explicit semenatics of QEMU_RAM_MMAP_PMEM as spelled out in the comment. Doing the fallback when passing in the mmap flags is a little ugly. We could do the fallback in the caller, I think I remember there is only a single call site.
> > > > > 
> > > > > PROT_READ won‘t be covered as well, not sure if passing in protections improves the interface.
> > > > > 
> > > > > Long story short, I like the abstraction provided by these flags, only exporting what we actually support/abstracting it, and setting some MAP_ flags automatically (MAP_PRIVATE, MAP_ANON) instead of having to spell that put in the caller.
> > > > 
> > > > Yeh the READONLY flag would be special, it will need to be separated from the
> > > > rest flags.  I'd keep my own preference, but if you really like the current
> > > > way, maybe at least move it to qemu/osdep.h?  So at least when someone needs a
> > > > cross-platform flag they'll show up - while mmap-alloc.h looks still only for
> > > > the posix world, then it'll be odd to introduce these flags only for posix even
> > > > if posix definied most of them.
> > > 
> > > I'll give it another thought today. I certainly want to avoid moving all
> > > that MAP_ flag and PROT_ logic to the callers. E.g., MAP_SHARED implies
> > > !MAP_PRIVATE. MAP_SYNC implies that we want MAP_SHARED_VALIDATE. fd < 0
> > > implies MAP_ANONYMOUS.
> > > 
> > > Maybe something like
> > > 
> > > /*
> > >     * QEMU's MMAP abstraction to map guest RAM, taking care of alignment
> > >     * requirements and guard pages.
> > >     *
> > >     * Supported flags: MAP_SHARED, MAP_SYNC
> > >     *
> > >     * Implicitly set flags:
> > >     * - MAP PRIVATE: When !MAP_SHARED and !MAP_SYNC
> > >     * - MAP_ANONYMOUS: When fd < 0
> > >     * - MAP_SHARED_VALIDATE: When MAP_SYNC
> > >     *
> > >     * If mapping with MAP_SYNC|MAP_SHARED_VALIDATE fails, fallback to
> > >     * !MAP_SYNC|MAP_SHARED and warn.
> > >     */
> > >     void *qemu_ram_mmap(int fd,
> > >                         size_t size,
> > >                         size_t align,
> > >                         bool readonly,
> > >                         uint32_t mmap_flags,
> > >                         off_t map_offset);
> > 
> > What about this:
> > 
> 
> 
> The only ugly thing is that e.g., MAP_SYNC is only defined for Linux and
> MAP_NORESERVE is mostly only defined on Linux.
> 
> So we need something like we already have in mmap-alloc.c:
> 
> #ifdef CONFIG_LINUX
> #include <linux/mman.h>
> #else  /* !CONFIG_LINUX */
> #define MAP_SYNC              0x0
> #define MAP_SHARED_VALIDATE   0x0
> #endif /* CONFIG_LINUX */
> 
> 
> and for the noreserve part
> 
> 
> #ifndef MAP_NORESERVE
> #define MAP_NORESERVE 0x0
> #endif
> 
> 
> But then, I can no longer bail out if someone specifies a flag although it
> is unsupported/not effective. hmmmm ...

I see, indeed that'll be awkward too.  How about keep your original proposal,
but just move it to osdep.h?  That seems to be the simplest and cleanest
approach so far.  Thanks,

-- 
Peter Xu


