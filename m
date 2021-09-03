Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 124494005D1
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 21:29:05 +0200 (CEST)
Received: from localhost ([::1]:58212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMEs4-0007fO-3b
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 15:29:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMEje-0007yf-Ql
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:20:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mMEjd-0002L8-9s
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 15:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630696819;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i20T45BJF1NiLADLeDPYghnQPlDwihh+g3lyWoAfrKY=;
 b=Oe8KqyY2NeBGd/iocUFh6e54jnEicWSN8Mi6vQ3Ni136yogL8edY9orcwOj+J7S86C4q/2
 iFlnLw1r0oA6Tu1EDc1yO3GZKdTDazsQPVh1S20hPOXqi4RQoRahYUHbiwdl0iK1uebQ8Z
 07lrmYLmOvGuRIn1v/o7fmcqNl1kdMA=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-yUdoHiCoMPuQ9TcAF6u3OQ-1; Fri, 03 Sep 2021 15:20:16 -0400
X-MC-Unique: yUdoHiCoMPuQ9TcAF6u3OQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 p23-20020a05620a22f700b003d5ac11ac5cso275614qki.15
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 12:20:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=i20T45BJF1NiLADLeDPYghnQPlDwihh+g3lyWoAfrKY=;
 b=fcp0OqwrR7kIPW/6olMDJdojmc95Lbwc3+CLEBPzrKTHEKlN3+l5GqMa0VoamGfKJb
 HOsg01Hvf84bZ/wU3M7TM8D3yDSdv4/fBVq5igwBy+2aJ8GEZuTd9FxqEArNlp82He/2
 mMNifjwmf1jEB7Sd7ZnCtXr7yfQANVsWkXZ0M0q/gc8K6tkirOmRauWHTEmvmG2GqAAM
 xjJf2yDrWRXJhzpq/oNzdE7E5vWHEXCX9GbI4UflXu0UtM2jxcGh4wWVEThRm3eqWNgQ
 3JtYdUyfc9lrp7nqgH9BT2qpwbuL9R8wJmjtfOu4OsU2JzrfUvA4I4yN766S5pf55JOo
 mqeg==
X-Gm-Message-State: AOAM531+TeEm6nENkAewZdDPdkCiMrUPogVtegtNAKJDyL1mtI6CwHTC
 4+aFCbCJqYMlQIgRwe5ZQfzCbKwP5mp//7u+g+yGVlOrDYLnFpPp3Lw2DDZg0KKYs7V+TxE+KK6
 76LFd87gfnSbtZB8=
X-Received: by 2002:ac8:4d90:: with SMTP id a16mr514601qtw.190.1630696815759; 
 Fri, 03 Sep 2021 12:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkSyhtnQ2KM9SM5vgaewc74Ny3uBLuELRwavKEhpLW3k1dLLgAKHNZ3WtMKhcZmiKPuw5l+Q==
X-Received: by 2002:ac8:4d90:: with SMTP id a16mr514575qtw.190.1630696815570; 
 Fri, 03 Sep 2021 12:20:15 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::ad7f])
 by smtp.gmail.com with ESMTPSA id g5sm72298qkl.48.2021.09.03.12.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 12:20:14 -0700 (PDT)
Date: Fri, 3 Sep 2021 15:20:12 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 8/9] migration/ram: Factor out populating pages
 readable in ram_block_populate_pages()
Message-ID: <YTJ1bBVvsyHhIHsk@t490s>
References: <20210902131432.23103-1-david@redhat.com>
 <20210902131432.23103-9-david@redhat.com> <YTFQKKPK3evHAMWN@t490s>
 <bcdb8e57-7032-f5c4-469c-f423cce923ab@redhat.com>
 <4ed5a784-986b-67a7-f8e6-0245ef10c301@redhat.com>
MIME-Version: 1.0
In-Reply-To: <4ed5a784-986b-67a7-f8e6-0245ef10c301@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 03, 2021 at 09:58:06AM +0200, David Hildenbrand wrote:
> > > That'll be good enough for live snapshot as uffd-wp works for zero pages,
> > > however I'm just afraid it may stop working for some new users of it when zero
> > > pages won't suffice.
> > 
> > I thought about that as well. But snapshots/migration will read all
> > memory either way and consume real memory when there is no shared zero
> > page. So it's just shifting the point in time when we allocate all these
> > pages I guess.
> 
> ... thinking again, even when populating on shmem and friends there is
> nothing stopping pages from getting mapped out again.
> 
> What would happen when trying uffd-wp protection on a pte_none() in your
> current shmem implementation? Will it lookup if there is something in the
> page cache (not a hole) and set a PTE marker? Or will it simply skip as
> there is currently nothing in the page table? Or will it simply
> unconditionally install a PTE marker, even if there is a hole?

It (will - I haven't rebased and posted) sets a pte marker.  So uffd-wp will
always work on read prefault irrelevant of memory type in the future.

> 
> Having an uffd-wp mode that doesn't require pre-population would really be
> great. I remember you shared prototypes.

Yes, I planned to do that after the shmem bits, because they have some
conflict. I don't want to mess up more with the current series either, which is
already hard to push, which is very unfortunate.

-- 
Peter Xu


