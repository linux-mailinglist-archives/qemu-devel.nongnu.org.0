Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C944A492B
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:17:49 +0100 (CET)
Received: from localhost ([::1]:46572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXV6-0007Eh-Of
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:17:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEWQ8-0004n8-1G
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nEWQ5-0006tY-No
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:08:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643634482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WRpSjXOlc1w0z+7e7PsTgMAIuptachVmi4oNFF/AMac=;
 b=TN+/4PLK6i9R6wTdBhNGXIAxSLU1+HkDUdArXcuuASfbnPyOKlVBLLdcUykBaykPwH+u2H
 +2SN4G88QMeTfwMJZbkW5rtRr8i5ewSuAb/i53Isu80Rs+lDZRiD8TJYvCF+o2BIO4blnU
 xjW6aH3T/do8p7xQRJL2/VDZeDhWP6c=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-21-8uf_lANzMF2jOTwUhsBtSg-1; Mon, 31 Jan 2022 08:08:00 -0500
X-MC-Unique: 8uf_lANzMF2jOTwUhsBtSg-1
Received: by mail-wm1-f72.google.com with SMTP id
 s1-20020a1ca901000000b0034ece94dd8cso10344841wme.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 05:08:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WRpSjXOlc1w0z+7e7PsTgMAIuptachVmi4oNFF/AMac=;
 b=Rj2OoXvnTZLG4AmcOPgewIB+j8Vlhbxs8rv0GxWd8UCnVY+pSofixti94Vm+AAw8+7
 /14TZQhBuayMb8NpZMc6OxO0iM9UUOrhS2Qp27YVZSjY8XRzJ0XhOnBlY/uRGseDb696
 vFZ2W4yB3ziDs61bclmupk2h4RUzMGujHyLxFtFOJIG6KPnIMegmqdy5pBV4qA/qWQv3
 hj6O7Y5N7h+efSfm1CwhJhYyczdf70zteQEog0TXbMfmrac2fnbtBKG64Yahub3P7HmC
 Rh/VaKVv5d1C7C+Jl0XkwYgjCwXcYxVyPaC4HgZ5C3d77kQidZu6j/myamuf5nwpMXuw
 LQmA==
X-Gm-Message-State: AOAM533UhVWF29IOlYzW8Lx9vA9LuSMjRb/MCkG3wAcknaCebzc6+9el
 iSMuEVQTwHHWuFuC7OoFi9NHFtZJBik6Hp0HLaSgX37qj3RqLYdJ4UYAZIBbjbuDNm9aKhIT3F/
 kn1/6JsdjoMm0qQk=
X-Received: by 2002:a05:600c:40b:: with SMTP id
 q11mr26648880wmb.43.1643634479348; 
 Mon, 31 Jan 2022 05:07:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxJRPPl+pZlllthe+vUbA6IRVZQZwR6zBoLAczR6LRlTb0BivKaUPXzjeY3g3DlX0RUhuQJ6g==
X-Received: by 2002:a05:600c:40b:: with SMTP id
 q11mr26648859wmb.43.1643634479141; 
 Mon, 31 Jan 2022 05:07:59 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id w22sm12018962wra.59.2022.01.31.05.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 05:07:58 -0800 (PST)
Date: Mon, 31 Jan 2022 13:07:56 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 3/4] virtio-iommu: Support bypass domain
Message-ID: <YfffLBO47Sh3uq1b@work-vm>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-4-jean-philippe@linaro.org>
 <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bf447d9b-c039-ccdc-f24f-ab8b56c1b196@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: lvivier@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 thuth@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 cohuck@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 Juan Quintela <quintela@redhat.com>, mst@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Eric Auger (eric.auger@redhat.com) wrote:
> Hi Jean,
> 
> On 1/27/22 3:29 PM, Jean-Philippe Brucker wrote:
> > The driver can create a bypass domain by passing the
> > VIRTIO_IOMMU_ATTACH_F_BYPASS flag on the ATTACH request. Bypass domains
> > perform slightly better than domains with identity mappings since they
> > skip translation.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/virtio/virtio-iommu.c | 32 ++++++++++++++++++++++++++++++--
> >  1 file changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> > index ec02029bb6..a112428c65 100644
> > --- a/hw/virtio/virtio-iommu.c
> > +++ b/hw/virtio/virtio-iommu.c
> > @@ -43,6 +43,7 @@
> >  
> >  typedef struct VirtIOIOMMUDomain {
> >      uint32_t id;
> > +    bool bypass;
> I am afraid this will break the migration if you don't change
> vmstate_domain.
> 
> See static const VMStateDescription vmstate_domain.
> Also you need to migrate the new bypass field.
> 
> Logically we should handle this with a vmstate subsection I think to
> handle migration of older devices. However I doubt the device has been
> used in production environment supporting migration so my guess is we
> may skip that burden and just add the missing field. Adding Juan, Dave &
> Peter for advices.

I'm not sure about users of this; if no one has used it then yeh; you
could bump up the version_id to make it a bit clearer.

Dave

> Thanks
> 
> Eric
> 
> >      GTree *mappings;
> >      QLIST_HEAD(, VirtIOIOMMUEndpoint) endpoint_list;
> >  } VirtIOIOMMUDomain;
> > @@ -258,12 +259,16 @@ static void virtio_iommu_put_endpoint(gpointer data)
> >  }
> >  
> >  static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
> > -                                                  uint32_t domain_id)
> > +                                                  uint32_t domain_id,
> > +                                                  bool bypass)
> >  {
> >      VirtIOIOMMUDomain *domain;
> >  
> >      domain = g_tree_lookup(s->domains, GUINT_TO_POINTER(domain_id));
> >      if (domain) {
> > +        if (domain->bypass != bypass) {
> > +            return NULL;
> > +        }
> >          return domain;
> >      }
> >      domain = g_malloc0(sizeof(*domain));
> > @@ -271,6 +276,7 @@ static VirtIOIOMMUDomain *virtio_iommu_get_domain(VirtIOIOMMU *s,
> >      domain->mappings = g_tree_new_full((GCompareDataFunc)interval_cmp,
> >                                     NULL, (GDestroyNotify)g_free,
> >                                     (GDestroyNotify)g_free);
> > +    domain->bypass = bypass;
> >      g_tree_insert(s->domains, GUINT_TO_POINTER(domain_id), domain);
> >      QLIST_INIT(&domain->endpoint_list);
> >      trace_virtio_iommu_get_domain(domain_id);
> > @@ -334,11 +340,16 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >  {
> >      uint32_t domain_id = le32_to_cpu(req->domain);
> >      uint32_t ep_id = le32_to_cpu(req->endpoint);
> > +    uint32_t flags = le32_to_cpu(req->flags);
> >      VirtIOIOMMUDomain *domain;
> >      VirtIOIOMMUEndpoint *ep;
> >  
> >      trace_virtio_iommu_attach(domain_id, ep_id);
> >  
> > +    if (flags & ~VIRTIO_IOMMU_ATTACH_F_BYPASS) {
> > +        return VIRTIO_IOMMU_S_INVAL;
> > +    }
> > +
> >      ep = virtio_iommu_get_endpoint(s, ep_id);
> >      if (!ep) {
> >          return VIRTIO_IOMMU_S_NOENT;
> > @@ -356,7 +367,12 @@ static int virtio_iommu_attach(VirtIOIOMMU *s,
> >          }
> >      }
> >  
> > -    domain = virtio_iommu_get_domain(s, domain_id);
> > +    domain = virtio_iommu_get_domain(s, domain_id,
> > +                                     flags & VIRTIO_IOMMU_ATTACH_F_BYPASS);
> > +    if (!domain) {
> > +        /* Incompatible bypass flag */
> > +        return VIRTIO_IOMMU_S_INVAL;
> > +    }
> >      QLIST_INSERT_HEAD(&domain->endpoint_list, ep, next);
> >  
> >      ep->domain = domain;
> > @@ -419,6 +435,10 @@ static int virtio_iommu_map(VirtIOIOMMU *s,
> >          return VIRTIO_IOMMU_S_NOENT;
> >      }
> >  
> > +    if (domain->bypass) {
> > +        return VIRTIO_IOMMU_S_INVAL;
> > +    }
> > +
> >      interval = g_malloc0(sizeof(*interval));
> >  
> >      interval->low = virt_start;
> > @@ -464,6 +484,11 @@ static int virtio_iommu_unmap(VirtIOIOMMU *s,
> >      if (!domain) {
> >          return VIRTIO_IOMMU_S_NOENT;
> >      }
> > +
> > +    if (domain->bypass) {
> > +        return VIRTIO_IOMMU_S_INVAL;
> > +    }
> > +
> >      interval.low = virt_start;
> >      interval.high = virt_end;
> >  
> > @@ -780,6 +805,9 @@ static IOMMUTLBEntry virtio_iommu_translate(IOMMUMemoryRegion *mr, hwaddr addr,
> >              entry.perm = flag;
> >          }
> >          goto unlock;
> > +    } else if (ep->domain->bypass) {
> > +        entry.perm = flag;
> > +        goto unlock;
> >      }
> >  
> >      found = g_tree_lookup_extended(ep->domain->mappings, (gpointer)(&interval),
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


