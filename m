Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D40A4E1B84
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Mar 2022 13:06:46 +0100 (CET)
Received: from localhost ([::1]:50652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVuKa-0008Md-Pp
	for lists+qemu-devel@lfdr.de; Sun, 20 Mar 2022 08:06:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nVuG6-0006Tr-OR
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 08:02:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nVuG0-0001NJ-J4
 for qemu-devel@nongnu.org; Sun, 20 Mar 2022 08:02:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647777718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jZX/g2tZ+VGdOfqIMjXstMdORX3LbjGPS49OSCwmuu0=;
 b=YjSDE9S/ModVnek3BmYsr6KzYdg9h4lgJscKg0WTxed6XNXGKemxYbyL/EINrZcO5vDbub
 Tpccr1PJ/TOxijaUfkbjUDiN7vganYZQ2WPxT0mTT9nrtjjYBLkhC5gsZTwwq+cqNqQH06
 VYAvdkbUBIMg7e7Kl3fTLchH1rz1BZs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-hF0yqmGuPL2GyFtdgxlmnQ-1; Sun, 20 Mar 2022 08:01:57 -0400
X-MC-Unique: hF0yqmGuPL2GyFtdgxlmnQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 er8-20020a170907738800b006e003254d86so300812ejc.11
 for <qemu-devel@nongnu.org>; Sun, 20 Mar 2022 05:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jZX/g2tZ+VGdOfqIMjXstMdORX3LbjGPS49OSCwmuu0=;
 b=Pg6Y5Csg3Ja6i+pDrW1jWNXhRPbE6aBwyzaWIfoYwIlNR3FyU0KUDXMNtNF+brl44/
 IfdsQefOkXGwne5OY0Cr1ohSC8uY6xZnESpEnnsuK1MIciYa4Fs62G/VysXjJ2c8UxHi
 GtToECW5QKBT4LvygeYF0588lxL60TUjwYQ7RU/BmF53e8G43Ri1LUpThEIKTaO7Z/mc
 jqyvPKtiAIdyQkWQXFCGUWz/Nbe6LR0EoSSYoy2VjwNgKAlZqudJ9fvpQKCOp9kWwpgO
 NiEWkxA7LZmTfsZolUJ50398ghDNT9WQEM4u/dv+FFwj2E9XjPKsWaN8I7/SrY3gpzJW
 +Q3A==
X-Gm-Message-State: AOAM530r6aVH5fqV87ud3mB0WjqkD4huJHtUf3ho8LFljDSTrPNxwndt
 BZNxOjSvgbmNeh84RyxZEOnbbZPotR1mXjq+J2UoQInbfaNx0XxjF2/qsS0iwb4JAxfmrOBvjSE
 W4lSnk8G1L88tRQw=
X-Received: by 2002:a17:907:3d87:b0:6e0:bef:c3cb with SMTP id
 he7-20020a1709073d8700b006e00befc3cbmr685077ejc.503.1647777716237; 
 Sun, 20 Mar 2022 05:01:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuNAqjrRA8u8YKwQj4ZgoWjCSiTW35AkFm6x59kdmA0ae0/LKmvMA3su2q+M6I3d98tYo+qQ==
X-Received: by 2002:a17:907:3d87:b0:6e0:bef:c3cb with SMTP id
 he7-20020a1709073d8700b006e00befc3cbmr685059ejc.503.1647777716013; 
 Sun, 20 Mar 2022 05:01:56 -0700 (PDT)
Received: from redhat.com ([2.55.132.0]) by smtp.gmail.com with ESMTPSA id
 ch26-20020a0564021bda00b00418f99695f0sm4875718edb.23.2022.03.20.05.01.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Mar 2022 05:01:55 -0700 (PDT)
Date: Sun, 20 Mar 2022 08:01:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 1/2] intel-iommu: remove VTD_FR_RESERVED_ERR
Message-ID: <20220320080145-mutt-send-email-mst@kernel.org>
References: <20220210092815.45174-1-jasowang@redhat.com>
 <CACGkMEtv3uZ6-K=E_=74EHLtRN0yBGO6WhL8MzSRvf+YB8+aDg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEtv3uZ6-K=E_=74EHLtRN0yBGO6WhL8MzSRvf+YB8+aDg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will do, thanks!

On Thu, Mar 17, 2022 at 12:38:35PM +0800, Jason Wang wrote:
> HI Michael:
> 
> Want to take this series?
> 
> Thanks
> 
> On Thu, Feb 10, 2022 at 5:28 PM Jason Wang <jasowang@redhat.com> wrote:
> >
> > This fault reason is not used and is duplicated with SPT.2 condition
> > code. So let's remove it.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c          | 6 ------
> >  hw/i386/intel_iommu_internal.h | 5 -----
> >  2 files changed, 11 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index 5b865ac08c..55281ee1b4 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -469,11 +469,6 @@ static void vtd_report_dmar_fault(IntelIOMMUState *s, uint16_t source_id,
> >
> >      assert(fault < VTD_FR_MAX);
> >
> > -    if (fault == VTD_FR_RESERVED_ERR) {
> > -        /* This is not a normal fault reason case. Drop it. */
> > -        return;
> > -    }
> > -
> >      trace_vtd_dmar_fault(source_id, fault, addr, is_write);
> >
> >      if (fsts_reg & VTD_FSTS_PFO) {
> > @@ -1629,7 +1624,6 @@ static const bool vtd_qualified_faults[] = {
> >      [VTD_FR_PAGING_ENTRY_RSVD] = true,
> >      [VTD_FR_CONTEXT_ENTRY_TT] = true,
> >      [VTD_FR_PASID_TABLE_INV] = false,
> > -    [VTD_FR_RESERVED_ERR] = false,
> >      [VTD_FR_MAX] = false,
> >  };
> >
> > diff --git a/hw/i386/intel_iommu_internal.h b/hw/i386/intel_iommu_internal.h
> > index a6c788049b..d0bb43ae87 100644
> > --- a/hw/i386/intel_iommu_internal.h
> > +++ b/hw/i386/intel_iommu_internal.h
> > @@ -303,11 +303,6 @@ typedef enum VTDFaultReason {
> >
> >      VTD_FR_PASID_TABLE_INV = 0x58,  /*Invalid PASID table entry */
> >
> > -    /* This is not a normal fault reason. We use this to indicate some faults
> > -     * that are not referenced by the VT-d specification.
> > -     * Fault event with such reason should not be recorded.
> > -     */
> > -    VTD_FR_RESERVED_ERR,
> >      VTD_FR_MAX,                 /* Guard */
> >  } VTDFaultReason;
> >
> > --
> > 2.25.1
> >


