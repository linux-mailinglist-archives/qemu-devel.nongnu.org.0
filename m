Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640F3DA7EA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 17:54:18 +0200 (CEST)
Received: from localhost ([::1]:48170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m98MS-000595-Jk
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 11:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m98LF-0003Y7-Vu
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:53:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m98LD-0007WN-00
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 11:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627573977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J+XO+Mo3Cx4HScZtlf/ddyQM8CpEvG1bpMhz9xt5Az4=;
 b=jIN8bGObMALsUQhYz/F2WtjX6YIYIQvNnOP+0hKqWX2IPKWniMGrrJqbF/3DMeTdBEQPHY
 16qrdRukq765XsbMlviakaTSlEQlv2iqqhSIAmJm42bCkcJNLpgujBjUwWnfPK5oC/OhRU
 0tFQ/SUAZaOVwKs1DUWFtlmsjlCyG00=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-Xmy_RM1SOn2v-c1RhlNqjA-1; Thu, 29 Jul 2021 11:52:56 -0400
X-MC-Unique: Xmy_RM1SOn2v-c1RhlNqjA-1
Received: by mail-qk1-f199.google.com with SMTP id
 o2-20020a05620a1102b02903b9ade0af31so3606754qkk.1
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 08:52:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J+XO+Mo3Cx4HScZtlf/ddyQM8CpEvG1bpMhz9xt5Az4=;
 b=ezOVk2H9eaZqebnvFoBAql1WyJNdkehmcWIyi5NO0P7dIvzVoPHbQxhhHCMpIcoH5p
 rClUkjMxRGvZFa/U8sdU29S9pryWyL6GL4wd8Y7XqyDfhWEoxJT7OkIh5y9MWpNrjmAe
 UHrgltoMT76tJZVXh0UemcFIa3Pmmk4F/kMohSjKCZdHQ94ivEpceo0SbmfvEFTC6pAW
 g14iXcT6YG3qckgePza1MhnDx6Jc0AF8zSmiiLWDrnE/UZaxQkyuNg26iORVeszZJHC/
 nBQMFjKK70+ecCvwGU/4dvondUEm63stxRHQy1q1IfTgdwPXCrkaZkFqkjme2qw56CIp
 wVIg==
X-Gm-Message-State: AOAM533BsHgpeIpJldHKnGV/hkz+sgDvJnQ+yqe1he0k4QoHEUkQ4Jqp
 K8qUu0kvk3V8gN4WkgWriUiQNQccnl2deN7tcxP3Fn9ChnLYDQ3IYnecifI2T9Z5cIJXnWEF5i+
 9dlX3UHU366IeSp8=
X-Received: by 2002:ac8:59c8:: with SMTP id f8mr4643845qtf.345.1627573975755; 
 Thu, 29 Jul 2021 08:52:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA9K8KO6w0TCYnTeXbOcqz70Lf5GPFVakZd+txzkpo6mY4jl/gW23wlbJKIAjOhFZU66CevQ==
X-Received: by 2002:ac8:59c8:: with SMTP id f8mr4643820qtf.345.1627573975445; 
 Thu, 29 Jul 2021 08:52:55 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id u11sm1952274qkk.72.2021.07.29.08.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 08:52:54 -0700 (PDT)
Date: Thu, 29 Jul 2021 11:52:53 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v2 5/6] migration/postcopy: Handle RAMBlocks with a
 RamDiscardManager on the destination
Message-ID: <YQLO1QoOIu8dlaEq@t490s>
References: <20210721092759.21368-1-david@redhat.com>
 <20210721092759.21368-6-david@redhat.com> <YPrvfST43SFOMA1F@t490s>
 <2ce949f2-6950-5404-70e4-73a2e41b4ca8@redhat.com>
 <YPsP8+STD836MO3L@t490s>
 <124693ef-5595-85c9-da5a-8f8e6a827c19@redhat.com>
 <YPs+cO7u1eXMomE0@t490s>
 <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <de4bd533-efaa-a6e5-c73c-01016d0f229c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, teawater <teawaterz@linux.alibaba.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Marek Kedzierski <mkedzier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 29, 2021 at 02:14:41PM +0200, David Hildenbrand wrote:
> On 24.07.21 00:10, Peter Xu wrote:
> > On Fri, Jul 23, 2021 at 09:01:42PM +0200, David Hildenbrand wrote:
> > > It can happen in corner cases and is valid: with the current virtio-mem
> > > spec, guests are allowed to read unplugged memory. This will, for example,
> > > happen on older Linux guests when reading /proc/kcore or (with even older
> > > guests) when dumping guest memory via kdump. These corner cases were the
> > > main reason why the spec allows for it -- until we have guests properly
> > > adjusted such that it won't happen even in corner cases.
> > > 
> > > A future feature bit will disallow it for the guest: required for supporting
> > > shmem/hugetlb cleanly. With that in place, I agree that we would want to
> > > warn in this case!
> > 
> > OK that makes sense; with the page_size change, feel free to add:
> 
> I just realized that relying on the page_size would be wrong.
> 
> We migrate TARGET_PAGE_SIZE chunks and the offset might not be page_size
> aligned. So if we were to replace TARGET_PAGE_SIZE by rb->page_size, we
> might accidentally cover a "too big" range.

I'm wondering whether we should make the offset page size aligned instead.  For
example, note that postcopy_place_page_zero() should only take page_size
aligned host addr or UFFDIO_COPY could fail (hugetlb doesn't support
UFFDIO_ZEROPAGE yet).

Btw, does virtio-mem supports hugetlbfs now?  When with it, the smallest unit
to plug/unplug would the huge page size (e.g., for 1g huge page, sounds not
helpful to unplug 2M memory), am I right?

-- 
Peter Xu


