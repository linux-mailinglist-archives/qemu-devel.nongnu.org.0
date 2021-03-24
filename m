Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E439347CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 16:45:07 +0100 (CET)
Received: from localhost ([::1]:55834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP5gw-0004um-Bx
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 11:45:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP5eL-0002zn-Lo
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lP5eH-0007i5-Oa
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 11:42:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616600533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sNgcKws2cRyiFaGSoI2KmH2k0nOuKy9mX8Tg6jBAj2k=;
 b=OBf6+ooAwVLSdb8uGXdwKnsGxOHwirNKzNt0xy/ukQKln9a4kkwnfKcoO5FIUlAdjCIAIY
 j2AZWZppUsyej1cTtWnI6Vz+XJ9Tr4+hQKNFzK7wErQLi5Yc/fiRTeVhuHGsubfSDe6Xn3
 Ofr9cVTqrgE746mihBazr/npLoqujKw=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-_b2BfEYBPJu6Zw_1ZOp6KQ-1; Wed, 24 Mar 2021 11:42:04 -0400
X-MC-Unique: _b2BfEYBPJu6Zw_1ZOp6KQ-1
Received: by mail-qk1-f198.google.com with SMTP id g62so1868499qkf.18
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 08:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sNgcKws2cRyiFaGSoI2KmH2k0nOuKy9mX8Tg6jBAj2k=;
 b=tbmX1kh9LzlDD7exiCDKe2N5lMy4mS5yzn8hcXXmkfvuujBXD4e/usJP8YSJnA+vdV
 RG95rORxDObR3s4MmwwMmfFg7TartNQvNPwGWLk9MGKZabM3MDsiAwqEXAxisV6O3J8s
 TB30mjge1R/HKcTRETGI/AG5FHxtY13rmw7u76rR+qvnVO2Ija2YZJtQmYLs6oiNuCaT
 uLMi+Bg/Z71+CwULECbtNk93ypXL+WXznRu1WBl+feHqRa5dI8SI7155sVL5mKcFBjhh
 KKJuNSrdwUsdpVaFoU3BPMt0vsxn8T80NxwmVp7S3R2FEzuuFMT1fmMoEklRy061cikm
 I7lQ==
X-Gm-Message-State: AOAM530g1sVTUp0ry51l9v5+Vo00+KJfjTOtScSmmG7zU33i4+yGxZxW
 uFVQrU7zr8OOXOd1F2rPfUixCGAunO/GSWYc/Zt9ZRpspJwqn1xF40XR59Bnbn/zPSKTTce9BoS
 yZ5YjCadjQidwpcI=
X-Received: by 2002:a37:bbc4:: with SMTP id l187mr3656845qkf.153.1616600520704; 
 Wed, 24 Mar 2021 08:42:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJcMsDXUapr/jjqgHRQoAG3KyC0zQ3I9/025pgXPKKIWUapM6kj/eBPhOx53U4Vt/2UokiXg==
X-Received: by 2002:a37:bbc4:: with SMTP id l187mr3656815qkf.153.1616600520413; 
 Wed, 24 Mar 2021 08:42:00 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id t188sm1974838qke.91.2021.03.24.08.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:41:59 -0700 (PDT)
Date: Wed, 24 Mar 2021 11:41:58 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 0/3] migration: Fixes to the 'background-snapshot' code
Message-ID: <20210324154158.GC219069@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
 <20210323222155.GA219069@xz-x1>
 <65f1ebcd-fac9-0923-33e7-889946066b40@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <65f1ebcd-fac9-0923-33e7-889946066b40@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Den Lunev <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 24, 2021 at 11:09:27AM +0300, Andrey Gruzdev wrote:
> > I'm also looking into introducing UFFD_FEATURE_WP_UNALLOCATED so as to
> > wr-protect page holes too for a uffd-wp region when the feature bit is set.
> > With that feature we should be able to avoid pre-fault as what we do in the
> > last patch of this series.  However even if that can work out, we'll still need
> > this for old kernel anyways.
> 
> I'm curious this new feature is based on adding wr-protection at the level of VMAs,
> so we won't miss write faults for missing pages?

I think we can do it with multiple ways.

The most efficient one would be wr-protect the range during uffd-wp
registration, so as you said it'll be per-vma attribute.  However that'll
change the general semantics of uffd-wp as normally we need registration and
explicit wr-protect.  Then it'll still be pte-based for faulted in pages (the
ones we wr-protected during registration will still be), however for the rest
it'll become vma-based.  It's indeed a bit confusing.

The other way is we can fault in zero page during UFFDIO_WRITEPROTECT.  However
that's less efficient, since it's close to pre-fault on read but it's just
slightly more cleaner than doing it in userspace.  When I rethink about this it
may not worth it to do in kernel if userspace can achieve things similar.

So let's stick with current solution; that idea may need more thoughts..

Thanks,

-- 
Peter Xu


