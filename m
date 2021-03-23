Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 466AB346CEA
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 23:27:37 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOpUu-0006d0-C6
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 18:27:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOpPW-00073W-TK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:22:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOpPU-0005Mx-Ey
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 18:22:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616538119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=enJ7EAj+RFEf33zsCRjl6VLLrWWKm7DxIvTe6EdpoBU=;
 b=dU2ir3mRZ79Xejmw0Sg8rPRQBd3MXbR21bYkd69jX3GYcoOZTnPV9N/EEdadq3SiIxzQXo
 BmQ83DHo4c6hiC3Jr1yAsXooQTIZYPrdaJNmHJAWhItrMKrfwA1FYx8szgpqmiXhW2L2jb
 5lFkSKAj3tPEV1XrbQ+yhQbKCVHlvI4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-37-5iE5qg-tOlq2lF6fDmOQeg-1; Tue, 23 Mar 2021 18:21:58 -0400
X-MC-Unique: 5iE5qg-tOlq2lF6fDmOQeg-1
Received: by mail-qk1-f200.google.com with SMTP id b127so290089qkf.19
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 15:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=enJ7EAj+RFEf33zsCRjl6VLLrWWKm7DxIvTe6EdpoBU=;
 b=T7LEv1XUgL13ayAcFXJGVzzXsUjSkIBVtgJmuJjv8ZdbL0DRz9ErmNRwFAIjI6Wv9k
 ie3V2A+Ky5cqeH+08AqfB45LGtf+7Xj87+irqTJ7ohc8cVMxxG2QsDsleTjcyAOdysLq
 C4qGSLIhdQYnGxRr1cDoluUQw7Ka4LSkp46l3Bneyu9S0gGUexh0qFaAyPYODCpbjo9C
 6OLySsoY18NcGyJa7Iejdwj+JuWwmslVcARDnQQvLL+wzWVBNYYFxVwyHup1CTgJMvR1
 Lh6bFhZdDZA3ct9ozIIVPp/bb/D7XHeVlr2ruimuqnzPnWJmkhXK9hphkCVxm5jjTZnF
 Q2+g==
X-Gm-Message-State: AOAM531mu13D5lOzgFNVhzpP1fTLbU1bZcWZ7JQtrsrtemgB7y8gAuwD
 zc3lsrHcMfJFZEo5xz1EkpwMt+RcnMrce7aDt+HIfIWP416dXKVeVquSQWnjVx8xE8hJ4OTFDRB
 u0B5XatBicZzsx5o=
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr267050qkn.442.1616538117854; 
 Tue, 23 Mar 2021 15:21:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzA6Tm2XeeVKbreGDGvt2ECASam9bWFZ8HvHZx4wCdVaDDZ2xA9bB3xzjeQ3je9jUrips74w==
X-Received: by 2002:a05:620a:16dc:: with SMTP id
 a28mr267032qkn.442.1616538117551; 
 Tue, 23 Mar 2021 15:21:57 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id a14sm248739qkc.47.2021.03.23.15.21.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 15:21:57 -0700 (PDT)
Date: Tue, 23 Mar 2021 18:21:55 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
Subject: Re: [PATCH v1 0/3] migration: Fixes to the 'background-snapshot' code
Message-ID: <20210323222155.GA219069@xz-x1>
References: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210319145249.425189-1-andrey.gruzdev@virtuozzo.com>
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

On Fri, Mar 19, 2021 at 05:52:46PM +0300, Andrey Gruzdev wrote:
> Changes v0->v1:
>  * Using qemu_real_host_page_size instead of TARGET_PAGE_SIZE for host
>    page size in ram_block_populate_pages()
>  * More elegant implementation of ram_block_populate_pages()
> 
> This patch series contains:
>  * Fix to the issue with occasionally truncated non-iterable device state
>  * Solution to compatibility issues with virtio-balloon device
>  * Fix to the issue when discarded or never populated pages miss UFFD
>    write protection and get into migration stream in dirty state
> 
> Andrey Gruzdev (3):
>   migration: Fix missing qemu_fflush() on buffer file in
>     bg_migration_thread
>   migration: Inhibit virtio-balloon for the duration of background
>     snapshot
>   migration: Pre-fault memory before starting background snasphot

Unless Andrey would like to respin a new version, this version looks good to me
(I don't think the adding new helper issue in patch 1 is a blocker):

Reviewed-by: Peter Xu <peterx@redhat.com>

I'm also looking into introducing UFFD_FEATURE_WP_UNALLOCATED so as to
wr-protect page holes too for a uffd-wp region when the feature bit is set.
With that feature we should be able to avoid pre-fault as what we do in the
last patch of this series.  However even if that can work out, we'll still need
this for old kernel anyways.

Thanks,

-- 
Peter Xu


