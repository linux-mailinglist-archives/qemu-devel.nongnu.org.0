Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E5732A835
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 18:33:53 +0100 (CET)
Received: from localhost ([::1]:60172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH8u8-0007kM-Lg
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 12:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8tC-0007HJ-9f
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:32:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28139)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lH8tA-0003UO-0H
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:32:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614706371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jlIWIZYzHD1EhL2tb//404goYHuWYrN3TLsE76K2ILs=;
 b=KrxPefr/MwQwK+vPPUiHrAyOK2k6JARAabN/RTMMPOnbYrjK7y6Jz6zfDwyFeKUtO00XNS
 vM6nU+xpo8ghrs38mHs3TsriSK8EljUBm41uBfFpFND7fMJ1u0Xf+Wf1KKcVsAojJdK2RQ
 uZOdhHvXKq4SJZ6bwDteMU/X35va3AU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-bp553fcANYy_ma8nC9X_ag-1; Tue, 02 Mar 2021 12:32:48 -0500
X-MC-Unique: bp553fcANYy_ma8nC9X_ag-1
Received: by mail-qv1-f70.google.com with SMTP id n1so15403015qvi.4
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:32:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jlIWIZYzHD1EhL2tb//404goYHuWYrN3TLsE76K2ILs=;
 b=k3V49xMEF/KXg+D0wjkwLX3Ospvvw98ga/E+zib6Qx/Qxr16mE2qmK2r/aU//JTWUI
 XRohqAarkMcyl2mZrQUInUq8UEPVakVN9k7266QyGniKQomq5DLVs5qRlQ8nI6ns2OXu
 9d4X+zktM58td7nzagMLJHQHCg2Ho4nz0Wv5GFfRFNe3EQY2KDYeb9E9KPOh7cExQpaW
 vQvkdy2k5TwpYcWRlo6Dhi2qMRhrApril0JJ5kxbCYgF0nrHWj0LV1rgZf4l8SKIzVUN
 OBVhW8D2+zgP/NZTVEcjGSGFJ5GN49vi/gz/7hY/qh0OmbxoiU9iIPhc3EXYQ+QlVKpK
 sH5Q==
X-Gm-Message-State: AOAM530qVjZzHXGFbdIVQw1Y54crypMijX8kH3kywvuQzRPjgaCzz/fC
 KYBN0ahj3VllMBM8p1SsiXwvU7N7EiJXWBUbntJgfhVoBZlf+MehPJWmm/iyt6qgT/yZB4AbI9t
 PcBcb07T11kjiOsk=
X-Received: by 2002:a05:620a:791:: with SMTP id
 17mr2959840qka.170.1614706367960; 
 Tue, 02 Mar 2021 09:32:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv2aftS50+NpY5Rxj4Em9ob46tG7td8IRzqUVLX4ER2B33/0EUruRU/OkJS/3TfKMcJ1EG3Q==
X-Received: by 2002:a05:620a:791:: with SMTP id
 17mr2959801qka.170.1614706367704; 
 Tue, 02 Mar 2021 09:32:47 -0800 (PST)
Received: from xz-x1
 (bras-vprn-toroon474qw-lp130-25-174-95-95-253.dsl.bell.ca. [174.95.95.253])
 by smtp.gmail.com with ESMTPSA id o79sm5803300qka.116.2021.03.02.09.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:32:47 -0800 (PST)
Date: Tue, 2 Mar 2021 12:32:43 -0500
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 7/9] memory: introduce RAM_NORESERVE and wire it up in
 qemu_ram_mmap()
Message-ID: <20210302173243.GM397383@xz-x1>
References: <20210209134939.13083-1-david@redhat.com>
 <20210209134939.13083-8-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210209134939.13083-8-david@redhat.com>
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
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-s390x@nongnu.org,
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

On Tue, Feb 09, 2021 at 02:49:37PM +0100, David Hildenbrand wrote:
> @@ -899,13 +899,17 @@ int kvm_s390_mem_op_pv(S390CPU *cpu, uint64_t offset, void *hostbuf,
>   * to grow. We also have to use MAP parameters that avoid
>   * read-only mapping of guest pages.
>   */
> -static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared)
> +static void *legacy_s390_alloc(size_t size, uint64_t *align, bool shared,
> +                               bool noreserve)
>  {
>      static void *mem;
>  
>      if (mem) {
>          /* we only support one allocation, which is enough for initial ram */
>          return NULL;
> +    } else if (noreserve) {
> +        error_report("Skipping reservation of swap space is not supported.");
> +        return NULL

Semicolon missing.

>      }
>  
>      mem = mmap((void *) 0x800000000ULL, size,
> diff --git a/util/mmap-alloc.c b/util/mmap-alloc.c
> index b50dc86a3c..bb99843106 100644
> --- a/util/mmap-alloc.c
> +++ b/util/mmap-alloc.c
> @@ -20,6 +20,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/mmap-alloc.h"
>  #include "qemu/host-utils.h"
> +#include "qemu/error-report.h"
>  
>  #define HUGETLBFS_MAGIC       0x958458f6
>  
> @@ -174,12 +175,18 @@ void *qemu_ram_mmap(int fd,
>                      size_t align,
>                      bool readonly,
>                      bool shared,
> -                    bool is_pmem)
> +                    bool is_pmem,
> +                    bool noreserve)

Maybe at some point we should use flags too here to cover all bools.

Thanks,

-- 
Peter Xu


