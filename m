Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D644DC94A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 15:53:04 +0100 (CET)
Received: from localhost ([::1]:54554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUrUr-0007tl-1p
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 10:53:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUr29-0001R6-Ln
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:23:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nUr27-0007t4-Uw
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 10:23:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647526999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JoxAuWDh4bMHWjL4tsgFHmKG4uetEXSsToAaUcC25Iw=;
 b=AYWvCxTtFvRbdKK33PYZhCTeIaVPzgvRPW7KGF+a5t3eAZPCIPPq96MOwiNMDpeybvHdrf
 9f2WzL7r300vLdYN8htz4bv1F1xiz7cr9kPCf1qA3sWJsF0fYXxWWOwrGQKODFkslj7g38
 Cl/H+ezhmAhI1XqrgXfrKlTTblB1QKY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-FlBKU1r5N9e0mQXOpO4wjA-1; Thu, 17 Mar 2022 10:23:18 -0400
X-MC-Unique: FlBKU1r5N9e0mQXOpO4wjA-1
Received: by mail-io1-f72.google.com with SMTP id
 g11-20020a056602072b00b00645cc0735d7so3244561iox.1
 for <qemu-devel@nongnu.org>; Thu, 17 Mar 2022 07:23:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=JoxAuWDh4bMHWjL4tsgFHmKG4uetEXSsToAaUcC25Iw=;
 b=wz5wtabeAQp3F3+0djvjMBF4FbK4PHVIG95x1VJ54OXn96MFmTxJeIRgF9L0QTgETO
 JZN6UyXr29+kLBoeDR1Mn7WkBi+Yu6s+Nr50TD98RYZX2tFHTHFunQKWy6vfWUgYfogU
 oi8p0Pp8BeCpNawaCNZPCeXtgT/BoaV6wM3q7qp7h1E9Yhgcv7T58Id6OxTd2K2/SqJB
 ONQl/RqezaKHoxJa5quxUwjHsuHtpLcOL0Qy8s9FDKYhpg5gOzg+9rPWJQnshylu0So6
 L+fvi1KHnd9ZnIxAk+/S1G8gHC4cM6P0FfVNkbXSuk+K6pmqZDqeWl4SndpRkiZPuba+
 d4aw==
X-Gm-Message-State: AOAM531rcEZ69KRZJv89O8I/CIZ71YmHF8nLH4UNPmdkggEYmGGwv/sW
 wU9B066qv/0t/P8sNZrUObT7Bjitr1o177xe6ql+YF/g6g29/dknoOT9Gep9FrEC6px5mazHS2I
 jGOszfjccAf5HhEo=
X-Received: by 2002:a5d:9651:0:b0:641:6371:fb77 with SMTP id
 d17-20020a5d9651000000b006416371fb77mr2309192ios.99.1647526997313; 
 Thu, 17 Mar 2022 07:23:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6DuPcrHfITlV7sd1d6SFeilPiFs5P06YcrEL9jeriYjBL8edK4TinYC9svNBMoLIWMAK3kQ==
X-Received: by 2002:a5d:9651:0:b0:641:6371:fb77 with SMTP id
 d17-20020a5d9651000000b006416371fb77mr2309180ios.99.1647526997057; 
 Thu, 17 Mar 2022 07:23:17 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y5-20020a056e02178500b002c7b57c0a3fsm3593001ilu.39.2022.03.17.07.23.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 07:23:16 -0700 (PDT)
Date: Thu, 17 Mar 2022 08:23:15 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH for-7.1] vfio/common: remove spurious tpm-crb-cmd
 misalignment warning
Message-ID: <20220317082315.0a293120.alex.williamson@redhat.com>
In-Reply-To: <826be3d2-8403-5d8f-9eee-f58b15bc1c32@redhat.com>
References: <20220316202951.294860-1-eric.auger@redhat.com>
 <20220316170818.5b4f0032.alex.williamson@redhat.com>
 <826be3d2-8403-5d8f-9eee-f58b15bc1c32@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 17 Mar 2022 14:57:30 +0100
Eric Auger <eric.auger@redhat.com> wrote:

> Hi Alex,
> 
> On 3/17/22 12:08 AM, Alex Williamson wrote:
> > On Wed, 16 Mar 2022 21:29:51 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >  
> >> The CRB command buffer currently is a RAM MemoryRegion and given
> >> its base address alignment, it causes an error report on
> >> vfio_listener_region_add(). This region could have been a RAM device
> >> region, easing the detection of such safe situation but this option
> >> was not well received. So let's add a helper function that uses the
> >> memory region name to recognize the region and detect the situation
> >> is safe wrt assignment. Other regions can be listed here if such kind
> >> of problem occurs again.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> ---
> >>  hw/vfio/common.c     | 26 +++++++++++++++++++++++++-
> >>  hw/vfio/trace-events |  1 +
> >>  2 files changed, 26 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
> >> index 080046e3f51..b58a38f5c57 100644
> >> --- a/hw/vfio/common.c
> >> +++ b/hw/vfio/common.c
> >> @@ -861,6 +861,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
> >>      g_free(vrdl);
> >>  }
> >>  
> >> +static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
> >> +{
> >> +    MemoryRegion *mr = section->mr;
> >> +
> >> +    if (strcmp(memory_region_name(mr), "tpm-crb-cmd") != 0) {
> >> +        return false;
> >> +    }  
> > Hi Eric,
> >
> > I was thinking more along the lines that we could use
> > memory_region_owner() to get the owning Object, then on
> > that we could maybe use INTERFACE_CHECK to look for TYPE_MEMORY_DEVICE,
> > then consider anything else optional.  (a) could something like that
> > work and (b) do all required mappings currently expose that interface?
> > Thanks,  
> If I understand correctly you just want to error_report() misalignement
> of MR sections belonging to
> 
> TYPE_MEMORY_DEVICE devices and silence the rest? Is that a correct
> understanding? I thought you wanted to be much more protective and
> ignore misalignments on a case by case basis hence the white listing
> of this single tpm-crb-cmd region.

Ah right, so I'm just slipping back into what we currently do, fail for
memory and warn on devices, which would be a generally reasonable long
term plan except people file bugs about those warnings.  Crud.

I guess I don't have a better idea than creating essentially an
exception list like this.  Do you think it's better to do the strcmp
for the specific memory region or would it maybe be sufficient to test
the owner object is TYPE_TPM_CRB?  Thanks,

Alex

> >> +
> >> +    /* this is a known safe misaligned region, just trace for
> >> debug purpose */
> >> +    trace_vfio_known_safe_misalignment(memory_region_name(mr),
> >> +
> >> section->offset_within_address_space,
> >> +
> >> section->offset_within_region,
> >> +                                       qemu_real_host_page_size);
> >> +    return true;
> >> +}
> >> +
> >>  static void vfio_listener_region_add(MemoryListener *listener,
> >>                                       MemoryRegionSection *section)
> >>  {
> >> @@ -884,7 +900,15 @@ static void
> >> vfio_listener_region_add(MemoryListener *listener, if
> >> (unlikely((section->offset_within_address_space &
> >> ~qemu_real_host_page_mask) != (section->offset_within_region &
> >> ~qemu_real_host_page_mask))) {
> >> -        error_report("%s received unaligned region", __func__);
> >> +        if (!vfio_known_safe_misalignment(section)) {
> >> +            error_report("%s received unaligned region %s
> >> iova=0x%"PRIx64
> >> +                         " offset_within_region=0x%"PRIx64
> >> +                         " qemu_real_host_page_mask=0x%"PRIxPTR,
> >> +                         __func__,
> >> memory_region_name(section->mr),
> >> +                         section->offset_within_address_space,
> >> +                         section->offset_within_region,
> >> +                         qemu_real_host_page_mask);
> >> +        }
> >>          return;
> >>      }
> >>  
> >> diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
> >> index 0ef1b5f4a65..6f38a2e6991 100644
> >> --- a/hw/vfio/trace-events
> >> +++ b/hw/vfio/trace-events
> >> @@ -100,6 +100,7 @@ vfio_listener_region_add_skip(uint64_t start,
> >> uint64_t end) "SKIPPING region_add vfio_spapr_group_attach(int
> >> groupfd, int tablefd) "Attached groupfd %d to liobn fd %d"
> >> vfio_listener_region_add_iommu(uint64_t start, uint64_t end)
> >> "region_add [iommu] 0x%"PRIx64" - 0x%"PRIx64
> >> vfio_listener_region_add_ram(uint64_t iova_start, uint64_t
> >> iova_end, void *vaddr) "region_add [ram] 0x%"PRIx64" - 0x%"PRIx64"
> >> [%p]" +vfio_known_safe_misalignment(const char *name, uint64_t
> >> iova, uint64_t offset_within_region, uint64_t page_size) "Region
> >> \"%s\" iova=0x%"PRIx64" offset_within_region=0x%"PRIx64"
> >> qemu_real_host_page_mask=0x%"PRIxPTR ": cannot be mapped for DMA"
> >> vfio_listener_region_add_no_dma_map(const char *name, uint64_t
> >> iova, uint64_t size, uint64_t page_size) "Region \"%s\"
> >> 0x%"PRIx64" size=0x%"PRIx64" is not aligned to 0x%"PRIx64" and
> >> cannot be mapped for DMA" vfio_listener_region_del_skip(uint64_t
> >> start, uint64_t end) "SKIPPING region_del 0x%"PRIx64" - 0x%"PRIx64
> >> vfio_listener_region_del(uint64_t start, uint64_t end) "region_del
> >> 0x%"PRIx64" - 0x%"PRIx64  
> 


