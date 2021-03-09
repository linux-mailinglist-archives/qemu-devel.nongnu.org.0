Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A013330A9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 22:11:50 +0100 (CET)
Received: from localhost ([::1]:50810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJjdt-0006HQ-KJ
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 16:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJjQu-0006TT-Rh
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lJjQp-00057F-Rf
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 15:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615323497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m0JXqLEjPlvjclz+Ba4S3slnPocYCWYDOBiboU9fDD4=;
 b=hy9TycveIPGvEzVuhSZk0cbogs7ywZs9HfGGoCQjeJr7RmvWjvdeSitELd30upJRH3T6PY
 +alWSe88jk74h0smgs8J587ml76bMYR4WmmFHBvVUcNSZDfwbC1HOxjc7PzsTKSKgYo5O+
 itlZPy4la6xaQgtSprDbac/e0LsgChk=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-NLRopi8xObuc-fxNxGWLTg-1; Tue, 09 Mar 2021 15:58:13 -0500
X-MC-Unique: NLRopi8xObuc-fxNxGWLTg-1
Received: by mail-qk1-f199.google.com with SMTP id y22so6254239qkb.23
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 12:58:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=m0JXqLEjPlvjclz+Ba4S3slnPocYCWYDOBiboU9fDD4=;
 b=ji9pDLSuy5r9uShXjpdMHdhniQ0GFMECGrL8hoNlNluMUgMvx2lxk2FDBKU6zb0t3B
 C/YMPJU+A2OA5erDb692Tqbah6UKnDaxTyoNaEG3TJe2eDJFHxu7kuKP24i/xCiD6OG6
 WebMg9XESpnP7Er0bEm7otAx/PtT9J2WK45i7Yj+f8CW29lxAAedkKkWBNy5ZN2xzM8k
 4LUncYr9jyiap/Pn0GHziGPA9tMC0g1fqBe2D2/kwqS8a0KJhkvl4/vwMoA1SXYlwCSB
 5m7p3oxbRZBTARps0jF0m28uUfP5PrBa74QgVB1aKDRRdoI7Aowm9XT0X9iuz+SGmnuJ
 6DiQ==
X-Gm-Message-State: AOAM532Qi3Mjxg69GD9zX1WmGSEq4DORch7ZAPhsTRKfmwuPZZNuv76d
 jRujvvu4u6WLFQrU51y315RVwifZliYZprpsD8mwALxJwoags6CyLpGKdBDCkuXTEnLd71vJOMa
 KcJIscFnaqRqDjaY=
X-Received: by 2002:ac8:5a15:: with SMTP id n21mr27056782qta.85.1615323492657; 
 Tue, 09 Mar 2021 12:58:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwYELO6Td/AsAPPZQuhC2DX5YjL3Lmjo51LwWebb9gHm3jBtxlmmdAAciyW6MXVCENYip02Ag==
X-Received: by 2002:ac8:5a15:: with SMTP id n21mr27056743qta.85.1615323492111; 
 Tue, 09 Mar 2021 12:58:12 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id g11sm11187055qkk.5.2021.03.09.12.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 12:58:11 -0800 (PST)
Date: Tue, 9 Mar 2021 15:58:09 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 09/12] util/mmap-alloc: Pass flags instead of separate
 bools to qemu_ram_mmap()
Message-ID: <20210309205809.GI763132@xz-x1>
References: <20210309200451.GF763132@xz-x1>
 <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
MIME-Version: 1.0
In-Reply-To: <29372C8B-7F57-4AB6-99DB-5E73179D7555@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Tue, Mar 09, 2021 at 09:27:10PM +0100, David Hildenbrand wrote:
> 
> > Am 09.03.2021 um 21:04 schrieb Peter Xu <peterx@redhat.com>:
> > 
> > ﻿On Mon, Mar 08, 2021 at 04:05:57PM +0100, David Hildenbrand wrote:
> >> Let's introduce a new set of flags that abstract mmap logic and replace
> >> our current set of bools, to prepare for another flag.
> >> 
> >> Signed-off-by: David Hildenbrand <david@redhat.com>
> >> ---
> >> include/qemu/mmap-alloc.h | 17 +++++++++++------
> >> softmmu/physmem.c         |  8 +++++---
> >> util/mmap-alloc.c         | 14 +++++++-------
> >> util/oslib-posix.c        |  3 ++-
> >> 4 files changed, 25 insertions(+), 17 deletions(-)
> >> 
> >> diff --git a/include/qemu/mmap-alloc.h b/include/qemu/mmap-alloc.h
> >> index 456ff87df1..55664ea9f3 100644
> >> --- a/include/qemu/mmap-alloc.h
> >> +++ b/include/qemu/mmap-alloc.h
> >> @@ -6,6 +6,15 @@ size_t qemu_fd_getpagesize(int fd);
> >> 
> >> size_t qemu_mempath_getpagesize(const char *mem_path);
> >> 
> >> +/* Map PROT_READ instead of PROT_READ|PROT_WRITE. */
> >> +#define QEMU_RAM_MMAP_READONLY      (1 << 0)
> >> +
> >> +/* Map MAP_SHARED instead of MAP_PRIVATE. */
> >> +#define QEMU_RAM_MMAP_SHARED        (1 << 1)
> >> +
> >> +/* Map MAP_SYNC|MAP_SHARED_VALIDATE if possible, fallback and warn otherwise. */
> >> +#define QEMU_RAM_MMAP_PMEM          (1 << 2)
> > 
> > Sorry to speak late - I just noticed that is_pmem can actually be converted too
> > with "MAP_SYNC | MAP_SHARED_VALIDATE".  We can even define MAP_PMEM_EXTRA for
> > use within qemu if we want.  Then we can avoid one layer of QEMU_RAM_* by
> > directly using MAP_*, I think?
> > 
> 
> No problem :) I don‘t think passing in random MAP_ flags is a good interface (we would at least need an allow list).
> 
>  I like the abstraction / explicit semenatics of QEMU_RAM_MMAP_PMEM as spelled out in the comment. Doing the fallback when passing in the mmap flags is a little ugly. We could do the fallback in the caller, I think I remember there is only a single call site.
> 
> PROT_READ won‘t be covered as well, not sure if passing in protections improves the interface.
> 
> Long story short, I like the abstraction provided by these flags, only exporting what we actually support/abstracting it, and setting some MAP_ flags automatically (MAP_PRIVATE, MAP_ANON) instead of having to spell that put in the caller.

Yeh the READONLY flag would be special, it will need to be separated from the
rest flags.  I'd keep my own preference, but if you really like the current
way, maybe at least move it to qemu/osdep.h?  So at least when someone needs a
cross-platform flag they'll show up - while mmap-alloc.h looks still only for
the posix world, then it'll be odd to introduce these flags only for posix even
if posix definied most of them.

At the meantime, maybe rename QEMU_RAM_MMAP_* to QEMU_MMAP_* too?  All of them
look applicable to no-RAM-backends too.

Thanks,

-- 
Peter Xu


