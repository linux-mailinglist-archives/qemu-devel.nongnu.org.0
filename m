Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3264B346A85
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 21:58:31 +0100 (CET)
Received: from localhost ([::1]:40542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOo6g-0007Lg-2G
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 16:58:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOo4s-0005JA-FT
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lOo4p-00019U-Mv
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 16:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616532995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tv0wmzhJBPrgalqwQ23EfiBRNZABMdEe4tElieFJS+w=;
 b=hYe5JaOPdm9///W6NQONSMBWURP3kPxbsz/BCs4FtF+wjHSbRMc/N8HLAdMYlacZ8uQ2MS
 iVAJQ5jxvQr6dATFEnvjYP45QMwqkH8z6BslBd1xlIilUou8RbZtk6GeH4JbKIbSl87c+n
 no69RjRX8ph/LFi2KnxGHHloIp88dUs=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-cTIQ440iPo6z2DLXuBoUJA-1; Tue, 23 Mar 2021 16:56:32 -0400
X-MC-Unique: cTIQ440iPo6z2DLXuBoUJA-1
Received: by mail-qt1-f200.google.com with SMTP id j2so1989294qtv.10
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 13:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tv0wmzhJBPrgalqwQ23EfiBRNZABMdEe4tElieFJS+w=;
 b=TCO0QN5845HNpjdZ31NOFTNrBdK4ildRcN4Nfv8S6E4eMNd1MPbXVCZmxJr5tDNQrP
 MVcC2+tYkK4h59dl8sqt1HF3bAZRz7sARM7beYS2v8OhXBFhBbsHhTvq0YYZohkiyFtP
 DvcK0BDq1vNnpBM29iTbYjNQCFqQcwZ7Jbl7xNSHfWj0CMciWk4XEGWjN4tvv9p2LitY
 Fh2bOgfJ3gtK2L0C1EWgzEaY4iSlydvdi/kgNMkqCOP8BK2gnwb/Wid5YT2l6DtAue3r
 jw3gjNxDN0IJPKQ3svfsSs3v2PpPHWPR+NQOJBQMNHC49CcXl40yoMF67iii1mV4Xh8P
 lNaQ==
X-Gm-Message-State: AOAM532B53RMt2Ltczw7bnl8C0ZD+mTh8Ukn5mgI94FYJi6n8JWImRSm
 FsAN7wIHNZmGdRii4DlF+pSUu0BkHVovCiWnYru0MTG3j7hKn36tduQ5w+GIiZHFvKvtWTBsPkz
 eGlUyAy6y1gFkVS8=
X-Received: by 2002:a05:6214:d47:: with SMTP id 7mr6750163qvr.48.1616532991655; 
 Tue, 23 Mar 2021 13:56:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYVLAOtLji8l0GQpfIPAa9VS1Dfz6l4PeKdOihpstk/x08cckBWCnEXK1DVz+y2Hnv4epMyg==
X-Received: by 2002:a05:6214:d47:: with SMTP id 7mr6750145qvr.48.1616532991469; 
 Tue, 23 Mar 2021 13:56:31 -0700 (PDT)
Received: from xz-x1 (bras-base-toroon474qw-grc-82-174-91-135-175.dsl.bell.ca.
 [174.91.135.175])
 by smtp.gmail.com with ESMTPSA id o197sm73133qka.26.2021.03.23.13.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:56:30 -0700 (PDT)
Date: Tue, 23 Mar 2021 16:56:29 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v4 11/14] util/mmap-alloc: Support RAM_NORESERVE via
 MAP_NORESERVE under Linux
Message-ID: <20210323205629.GN6486@xz-x1>
References: <20210319101230.21531-1-david@redhat.com>
 <20210319101230.21531-12-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210319101230.21531-12-david@redhat.com>
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
Cc: Marcel Apfelbaum <mapfelba@redhat.com>,
 Igor Kotrasinski <i.kotrasinsk@partner.samsung.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Mar 19, 2021 at 11:12:27AM +0100, David Hildenbrand wrote:
> Let's support RAM_NORESERVE via MAP_NORESERVE on Linux. The flag has no
> effect on most shared mappings - except for hugetlbfs and anonymous memory.
> 
> Linux man page:
>   "MAP_NORESERVE: Do not reserve swap space for this mapping. When swap
>   space is reserved, one has the guarantee that it is possible to modify
>   the mapping. When swap space is not reserved one might get SIGSEGV
>   upon a write if no physical memory is available. See also the discussion
>   of the file /proc/sys/vm/overcommit_memory in proc(5). In kernels before
>   2.6, this flag had effect only for private writable mappings."
> 
> Note that the "guarantee" part is wrong with memory overcommit in Linux.
> 
> Also, in Linux hugetlbfs is treated differently - we configure reservation
> of huge pages from the pool, not reservation of swap space (huge pages
> cannot be swapped).
> 
> The rough behavior is [1]:
> a) !Hugetlbfs:
> 
>   1) Without MAP_NORESERVE *or* with memory overcommit under Linux
>      disabled ("/proc/sys/vm/overcommit_memory == 2"), the following
>      accounting/reservation happens:
>       For a file backed map
>        SHARED or READ-only - 0 cost (the file is the map not swap)
>        PRIVATE WRITABLE - size of mapping per instance
> 
>       For an anonymous or /dev/zero map
>        SHARED   - size of mapping
>        PRIVATE READ-only - 0 cost (but of little use)
>        PRIVATE WRITABLE - size of mapping per instance
> 
>   2) With MAP_NORESERVE, no accounting/reservation happens.
> 
> b) Hugetlbfs:
> 
>   1) Without MAP_NORESERVE, huge pages are reserved.
> 
>   2) With MAP_NORESERVE, no huge pages are reserved.
> 
> Note: With "/proc/sys/vm/overcommit_memory == 0", we were already able
> to configure it for !hugetlbfs globally; this toggle now allows
> configuring it more fine-grained, not for the whole system.
> 
> The target use case is virtio-mem, which dynamically exposes memory
> inside a large, sparse memory area to the VM.
> 
> [1] https://www.kernel.org/doc/Documentation/vm/overcommit-accounting
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


