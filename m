Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABF8333030
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 21:46:14 +0100 (CET)
Received: from localhost ([::1]:35216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjF7-0006MO-6h
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 15:46:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJibF-0000jS-FA
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:05:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJibB-0007Mi-HJ
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:05:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615320295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VnVJw0mUoWlvR4oUcurQR1ID0ATTbgo0v9El6/2vw4=;
 b=Mg7LG8GJWDbywTFJiA54OlaE1CgaHlM0MF3+Id4S7srz6hXNogHNshkfst9W5W6A9/2D85
 obOVK4l6osgJmCg4LQbUjP2KnBTcyq+WRbjXmQaMTOFSsOp4GR0hX6hwnCUwyMW7G2Nf9N
 oKBpQj070ByqWfCxdyspVbZs8ea/RPk=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-9UBT1qRwN9-8AA8lY2tMSQ-1; Tue, 09 Mar 2021 15:04:54 -0500
X-MC-Unique: 9UBT1qRwN9-8AA8lY2tMSQ-1
Received: by mail-qt1-f198.google.com with SMTP id 4so11283618qtc.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 12:04:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9VnVJw0mUoWlvR4oUcurQR1ID0ATTbgo0v9El6/2vw4=;
 b=TAGx0+6vaXNAGP2N4ml5U0ERfsnWPhDbxGrk/QdmmDpeb+nnyUrK75GaAsQIK+1qB7
 beDif/YtTe5OPp0Ze7lWuz7Eop3j1sGEP26OoWqmV2u2orz9b0uA1wzA9ngv5qxGMacc
 hrYgTPY1RT7+dAibsj8Y5jMK7Oum5gojI4tHbExkradrDSpgcxmPrWxm4A1IYkA6MkS9
 eLtr3VOBh6zCxJC12RleXFBl/0vX9neKcyRShulEh2SniWdBzN/ugWCk3HvrHefqfBur
 Ls85oq1IN+vXK+hSDbu80X6k/8Awr+HT6TTOs9tVA1eRiIXpzo21VzrZArhbEMgrrABV
 HokQ==
X-Gm-Message-State: AOAM5334rlFr8qs79m+JPEyPzVHQvgLRydlkI8dr0OhOBgtVM6TYcozN
 7qvxAils3VVAyjURQZSOfo7WZeTuTrY0PR3PvDhwvzVB5dk/jxSUX5xRMAvEYYdGqWlOd4jt4//
 g4zi5OiV+BZ2Yts8=
X-Received: by 2002:a05:6214:d6d:: with SMTP id
 13mr27959095qvs.60.1615320293519; 
 Tue, 09 Mar 2021 12:04:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0h6rCjsz6FpCKiQEzasdyob+Shl4vJoiLU/3F8aRwydS8NqDicavzN+seGBeRkSkBF+pcgQ==
X-Received: by 2002:a05:6214:d6d:: with SMTP id
 13mr27959080qvs.60.1615320293314; 
 Tue, 09 Mar 2021 12:04:53 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id f9sm9469319qkk.115.2021.03.09.12.04.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 12:04:52 -0800 (PST)
Date: Tue, 9 Mar 2021 15:04:51 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Message-ID: <20210309200451.GF763132@xz-x1>
References: <20210308150600.14440-1-david@redhat.com>
 <20210308150600.14440-10-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210308150600.14440-10-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

On Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrote:
> Let's introduce a new set of flags that abstract mmap logic and replace
> our current set of bools, to prepare for another flag.
> 
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  include/qemu/mmap-alloc.h | 17 +++++++++++------
>  softmmu/physmem.c         |  8 +++++---
>  util/mmap-alloc.c         | 14 +++++++-------
>  util/oslib-posix.c        |  3 ++-
>  4 files changed, 25 insertions(+), 17 deletions(-)
> 
> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> index 456ff87df1..55664ea9f3 100644
> --- a/include/qemu/mmap-alloc.h
> +++ b/include/qemu/mmap-alloc.h
> @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
>  
>  size_t qemu_mempath_getpagesize(const char *mem_path);
>  
> +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
> +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
> +
> +/* Map MAP_SHARED instead of MAP_PRIVATE. */
> +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
> +
> +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
> +#define QEMU_RAM_MMAP_PMEM          (1 << 2)

Sorry to speak late - I just noticed that is_pmem can actually be converted too
with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA for
use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
directly using MAP_*, I think?

-- 
Peter Xu


