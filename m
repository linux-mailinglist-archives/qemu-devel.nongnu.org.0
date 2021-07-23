Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748F3D3C76
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 17:31:45 +0200 (CEST)
Received: from localhost ([::1]:44224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6x9M-0000YG-2o
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 11:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6x6E-00077g-O1
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6x6B-0003Dj-4Z
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 11:28:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627054102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IW2j5C3fYmX+4K1gOAo9JPVDmK7GnLKzldSC15c/Dcg=;
 b=b94/GaL6ps0KIa1i/Iy2DUWelLe9STzyHYF3bb4ZteU1u4P2l9818vfGWhP/+IGBqjqUq2
 N82nf1TtOl5ywsbyf/2IVodxGHujjL5DJEw/fJYl3hx0NmzvA3etqjll1S5Uuel9duzUcf
 DXlVLhcijx4qevJt+CNB+Sa/PW+MWwY=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-td9X9nxuNKGMVVBksUPNNQ-1; Fri, 23 Jul 2021 11:28:21 -0400
X-MC-Unique: td9X9nxuNKGMVVBksUPNNQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 15-20020ac84e8f0000b029024e8c2383c1so1350599qtp.5
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 08:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IW2j5C3fYmX+4K1gOAo9JPVDmK7GnLKzldSC15c/Dcg=;
 b=sinNkRlSXmv4V0+ndgrKIODwTDQS+UKr5j8dvvYOy1ykky7fR4Al/Vf5CrPYzI9ATZ
 rhmLYaRlvWKRNwD+pQvBq07C6VwS60om+pDqSQU1FY86KIFxf2G2DIt9vOgsTopzSd3k
 cORknuwou89asnisUgQGHBiWVJq1bMPbXB2pQppz3GTEcD/l5zSVSciCxXA38cHsFp/2
 XGikgX21C1Y/cQ1w7xWkZjXx32cj+OlRcFgm5Ju0yuheTau5k/2niS4iFJ10SheialLH
 bVYzjSNkIqUB1TTWb7yxTqWCSRgBKt06ubQGB+hkt09GeWwOjM8vpZmbouaFrmIUIukV
 U1FQ==
X-Gm-Message-State: AOAM532HE8URtDZP9SM+FDlxSyCdmoIfDNEwl0Iv+hABTUihtSvjg6m/
 y8jGVzdSH+CcO8lmsHLB3g6sc9D0dyfTwEGLqg+JRXYAyvrDJz4W2iNTG/s8NEfDrROz+fXazix
 RUcZHBmlvOyrWyTI=
X-Received: by 2002:a0c:ff01:: with SMTP id w1mr5316765qvt.28.1627054100980;
 Fri, 23 Jul 2021 08:28:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6opvqXDL9v1bRP+rXVytCXJLkIrv2LBePRcRK/YRPjCFu+6ZLkRjw6fhgJRasUnveC8VOHQ==
X-Received: by 2002:a0c:ff01:: with SMTP id w1mr5316734qvt.28.1627054100737;
 Fri, 23 Jul 2021 08:28:20 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 6sm14532939qkv.115.2021.07.23.08.28.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:28:19 -0700 (PDT)
Date: Fri, 23 Jul 2021 11:28:17 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH resend v2 5/5] softmmu/memory_mapping: optimize for
 RamDiscardManager sections
Message-ID: <YPrgEXkl2wsXYs03@t490s>
References: <20210720130304.26323-1-david@redhat.com>
 <20210720130304.26323-6-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210720130304.26323-6-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 03:03:04PM +0200, David Hildenbrand wrote:
> virtio-mem logically plugs/unplugs memory within a sparse memory region
> and notifies via the RamDiscardManager interface when parts become
> plugged (populated) or unplugged (discarded).
> 
> Currently, we end up (via the two users)
> 1) zeroing all logically unplugged/discarded memory during TPM resets.
> 2) reading all logically unplugged/discarded memory when dumping, to
>    figure out the content is zero.
> 
> 1) is always bad, because we assume unplugged memory stays discarded
>    (and is already implicitly zero).
> 2) isn't that bad with anonymous memory, we end up reading the zero
>    page (slow and unnecessary, though). However, once we use some
>    file-backed memory (future use case), even reading will populate memory.
> 
> Let's cut out all parts marked as not-populated (discarded) via the
> RamDiscardManager. As virtio-mem is the single user, this now means that
> logically unplugged memory ranges will no longer be included in the
> dump, which results in smaller dump files and faster dumping.
> 
> virtio-mem has a minimum granularity of 1 MiB (and the default is usually
> 2 MiB). Theoretically, we can see quite some fragmentation, in practice
> we won't have it completely fragmented in 1 MiB pieces. Still, we might
> end up with many physical ranges.
> 
> Both, the ELF format and kdump seem to be ready to support many
> individual ranges (e.g., for ELF it seems to be UINT32_MAX, kdump has a
> linear bitmap).
> 
> Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Claudio Fontana <cfontana@suse.de>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: "Alex Bennée" <alex.bennee@linaro.org>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Stefan Berger <stefanb@linux.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  softmmu/memory_mapping.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/softmmu/memory_mapping.c b/softmmu/memory_mapping.c
> index b7e4f3f788..856778a109 100644
> --- a/softmmu/memory_mapping.c
> +++ b/softmmu/memory_mapping.c
> @@ -246,6 +246,15 @@ static void guest_phys_block_add_section(GuestPhysListener *g,
>  #endif
>  }
>  
> +static int guest_phys_ram_populate_cb(MemoryRegionSection *section,
> +                                      void *opaque)
> +{
> +    GuestPhysListener *g = opaque;
> +
> +    guest_phys_block_add_section(g, section);
> +    return 0;
> +}
> +
>  static void guest_phys_blocks_region_add(MemoryListener *listener,
>                                           MemoryRegionSection *section)
>  {
> @@ -257,6 +266,17 @@ static void guest_phys_blocks_region_add(MemoryListener *listener,
>          memory_region_is_nonvolatile(section->mr)) {
>          return;
>      }
> +
> +    /* for special sparse regions, only add populated parts */
> +    if (memory_region_has_ram_discard_manager(section->mr)) {
> +        RamDiscardManager *rdm;
> +
> +        rdm = memory_region_get_ram_discard_manager(section->mr);
> +        ram_discard_manager_replay_populated(rdm, section,
> +                                             guest_phys_ram_populate_cb, g);
> +        return;
> +    }
> +
>      guest_phys_block_add_section(g, section);
>  }

As I've asked this question previously elsewhere, it's more or less also
related to the design decision of having virtio-mem being able to sparsely
plugged in such a small granularity rather than making the plug/unplug still
continuous within GPA range (so we move page when unplug).

There's definitely reasons there and I believe you're the expert on that (as
you mentioned once: some guest GUPed pages cannot migrate so cannot get those
ranges offlined otherwise), but so far I still not sure whether that's a kernel
issue to solve on GUP, although I agree it's a complicated one anyway!

Maybe it's a trade-off you made at last, I don't have enough knowledge to tell.

The patch itself looks okay to me, there's just a slight worry on not sure how
long would the list be at last; if it's chopped in 1M/2M small chunks.

Thanks,

-- 
Peter Xu


