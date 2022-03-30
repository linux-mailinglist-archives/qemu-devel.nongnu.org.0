Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D58184EBCE2
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 10:46:43 +0200 (CEST)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZTyU-0002nY-FR
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 04:46:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZTkV-0008OG-DN
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:32:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21105)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZTkS-0006iA-2D
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 04:32:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648629129;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3WCgs4AjoOMwjugBSsBUwAduwdWB7Of3I7n0yGJiB+c=;
 b=DW1n5kAh9ik/kI0wdBqzizNs96uVpLowExSQotWvR9WLEt+Ee7S9LgRHSacdrO6ulb1GlE
 wTC6efjDgypwRnRao6h+CLQWz0b6A8khD/IMcH8jwlu5q91mIweXu1X0yaHTaWwhJ+NXEw
 r1Oh3meHH32fNDUAhNCofYlbZe8ZRSk=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-280-rD6OH_bNMyWVt0TJUUDF5A-1; Wed, 30 Mar 2022 04:32:06 -0400
X-MC-Unique: rD6OH_bNMyWVt0TJUUDF5A-1
Received: by mail-lj1-f199.google.com with SMTP id
 e3-20020a2e9303000000b00249765c005cso8436870ljh.17
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 01:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3WCgs4AjoOMwjugBSsBUwAduwdWB7Of3I7n0yGJiB+c=;
 b=EW3bNnNobHDVpR7BzWtT24v6ZrTHvZGdkeGQLl9i8TDE/qfFYRw3I8qYNG+LJuDGYy
 D40wnDevObdYYlKA2g2OMpmgpXagWjzSuo1MGvwrPfjbtB/Nr0b1IiuKyqcCCfunjBUx
 8PZ7SQAI/sHU+iOme1a1kK3q5prsJoEWidnsJF9/1weOm+LpTDs1sYVMoynrvKWrLnnF
 aUYvp592T38gdqNKkUhJze6LyxibBS1dI8vNXzChmnYaKjBC6LIiZi7y34rs8oVPvjxR
 nF7gsZVsH+v4PhxaT3MzK3+6KQ30UsOEV+Jy7JW/XqTZWwekCU7NvDoZVgxe1VcWNzKt
 0y0Q==
X-Gm-Message-State: AOAM533wJgi3NwKYWid6vnqbbgsFHmE/DAb62hBmFWbNBsOsU21gxpsl
 quEBk9mUyw0P/iJAbH4iLIWYp+E1Q22yf9tw+KkUxzLPPmstKouj2KRBlNBTgRyFdJ2iUddbAaZ
 bnsuEnKXEvraaX/yKuj9LWiSSzl4PoAQ=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr5835800lfk.587.1648629125077; 
 Wed, 30 Mar 2022 01:32:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9l4ouMJeGYLqGreLHL7+mDQIXwfjG6gVxlq31r9wCWAwvUWGvt02WHhuw8l1JkW2zbWb8jjeHQgaPkEU82Mk=
X-Received: by 2002:ac2:51b6:0:b0:44a:6da1:b193 with SMTP id
 f22-20020ac251b6000000b0044a6da1b193mr5835786lfk.587.1648629124764; Wed, 30
 Mar 2022 01:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
 <BN9PR11MB5276FB0451ABA184476BD4038C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
In-Reply-To: <BN9PR11MB5276FB0451ABA184476BD4038C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 16:31:53 +0800
Message-ID: <CACGkMEvpwFpzV44gLjscouLvcFc9-3Y4Qcw05vgX9ZvJha3-7g@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>,
 "yi.y.sun@linux.intel.com" <yi.y.sun@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>, "mst@redhat.com" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 4:02 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Tuesday, March 29, 2022 12:49 PM
> >
> > On Mon, Mar 28, 2022 at 3:03 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Jason Wang
> > > > Sent: Monday, March 21, 2022 1:54 PM
> > > >
> > > > +    /*
> > > > +     * vtd-spec v3.4 3.14:
> > > > +     *
> > > > +     * """
> > > > +     * Requests-with-PASID with input address in range 0xFEEx_xxxx are
> > > > +     * translated normally like any other request-with-PASID through
> > > > +     * DMA-remapping hardware. However, if such a request is processed
> > > > +     * using pass-through translation, it will be blocked as described
> > > > +     * in the paragraph below.
> > >
> > > While PASID+PT is blocked as described in the below paragraph, the
> > > paragraph itself applies to all situations:
> > >
> > >   1) PT + noPASID
> > >   2) translation + noPASID
> > >   3) PT + PASID
> > >   4) translation + PASID
> > >
> > > because...
> > >
> > > > +     *
> > > > +     * Software must not program paging-structure entries to remap any
> > > > +     * address to the interrupt address range. Untranslated requests
> > > > +     * and translation requests that result in an address in the
> > > > +     * interrupt range will be blocked with condition code LGN.4 or
> > > > +     * SGN.8.
> > >
> > > ... if you look at the definition of LGN.4 or SGN.8:
> > >
> > > LGN.4:  When legacy mode (RTADDR_REG.TTM=00b) is enabled, hardware
> > >         detected an output address (i.e. address after remapping) in the
> > >         interrupt address range (0xFEEx_xxxx). For Translated requests and
> > >         requests with pass-through translation type (TT=10), the output
> > >         address is the same as the address in the request
> > >
> > > The last sentence in the first paragraph above just highlights the fact that
> > > when input address of PT is in interrupt range then it is blocked by LGN.4
> > > or SGN.8 due to output address also in interrupt range.
> > >
> > > > +     * """
> > > > +     *
> > > > +     * We enable per as memory region (iommu_ir_fault) for catching
> > > > +     * the tranlsation for interrupt range through PASID + PT.
> > > > +     */
> > > > +    if (pt && as->pasid != PCI_NO_PASID) {
> > > > +        memory_region_set_enabled(&as->iommu_ir_fault, true);
> > > > +    } else {
> > > > +        memory_region_set_enabled(&as->iommu_ir_fault, false);
> > > > +    }
> > > > +
> > >
> > > Given above this should be a bug fix for nopasid first and then apply it
> > > to pasid path too.
> >
> > Actually, nopasid path patches were posted here.
> >
> > https://www.mail-archive.com/qemu-devel@nongnu.org/msg867878.html
> >
> > Thanks
> >
>
> Can you elaborate why they are handled differently?

It's because that patch is for the case where pasid mode is not
implemented. We might need it for -stable.

Thanks

>
> Thanks
> Kevin


