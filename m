Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB814F52D4
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 05:33:48 +0200 (CEST)
Received: from localhost ([::1]:54340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbwQV-0008Nb-FR
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 23:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwOh-0007gx-OZ
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:31:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nbwOe-0006ri-9k
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 23:31:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649215910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HPWKzAY0LP2qvjWouVOFehmkkGblp5mm8+QVTWfLvOU=;
 b=iajfW0VbDbAkdwEyYRCW3T+gCz+XTagevXOxzJcCbcOGknIaG33ABOgGM1b0r4ZkEesgli
 BKsT/pN/LJTLq+6NfNeLyYaVTpqxfTPBu9XZcPqqOzodnXSANTDR9i/PERcKQZ9VJXATqb
 DoIjooXjlyIGwjn/2MHLOJXYtBrwvDM=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-513-98ts5Vn8OF-KxCoPBvok6w-1; Tue, 05 Apr 2022 23:31:47 -0400
X-MC-Unique: 98ts5Vn8OF-KxCoPBvok6w-1
Received: by mail-lj1-f199.google.com with SMTP id
 q5-20020a2e9145000000b002497bf0eaa1so379657ljg.5
 for <qemu-devel@nongnu.org>; Tue, 05 Apr 2022 20:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPWKzAY0LP2qvjWouVOFehmkkGblp5mm8+QVTWfLvOU=;
 b=DBJow0XG9yPu4L8m+INK84o0TaBNMXDVcjvqEInAky4nP4ONjn2rSW9Pc1lgaAYrNH
 lzT5y/vSzYm6CYuMSDie9W7sf6jC0N0dEbAKJLAiEJsytAvjCL5OHMF2dqEK0MFA1uMn
 Qoj3wjwiSu16puBUUMJMASZB3eb9aRbY51gFP94B8T3CE6cFpQHEE49q9b/HUIZpu5AN
 7RUeiWA83JuroSdf7jAkVFYp6qu0ZuoxdHCtOGyz5qtJ6rS9WwbkrUVh1mj4pBvLKHZv
 zVBw6TV+BQvYHNUcZozEXsZSlT50lOcW9C1yFULQyYk7RQ9dwDR64nghLCFOE7UFUsJk
 GLeA==
X-Gm-Message-State: AOAM530RHmH3LZEVEtIwyfz+NnIH1UFZW5HR2TgVjod22CuAITORu45v
 XiJAkEtr+lHH5fb9KAh6tJ+5NZ+s5JTQo3idhik3NQsxWdX3F2GdvIxUyw2L8XZRjAvwifhUxkD
 kU7A3g3zU3TTs+v/SFWEuRypKm0/2IXM=
X-Received: by 2002:a2e:b946:0:b0:24a:fdff:1205 with SMTP id
 6-20020a2eb946000000b0024afdff1205mr4037987ljs.73.1649215905934; 
 Tue, 05 Apr 2022 20:31:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1Sq4gyU6ijeuj0L05dGInDI/LDQtl2ZgHtSNzs/W/MWhWrSaVnvnAoKEULJKKZwT9Iw3vR02CAyfIcEXh4ps=
X-Received: by 2002:a2e:b946:0:b0:24a:fdff:1205 with SMTP id
 6-20020a2eb946000000b0024afdff1205mr4037971ljs.73.1649215905628; Tue, 05 Apr
 2022 20:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220321055429.10260-1-jasowang@redhat.com>
 <20220321055429.10260-5-jasowang@redhat.com>
 <BN9PR11MB527635384D3CD8F0FB4232388C1D9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEv4gN4=SzeWroMXdOouxQnzarQX_U5Jv528_fROoYNHyw@mail.gmail.com>
 <BN9PR11MB5276FB0451ABA184476BD4038C1F9@BN9PR11MB5276.namprd11.prod.outlook.com>
 <CACGkMEvpwFpzV44gLjscouLvcFc9-3Y4Qcw05vgX9ZvJha3-7g@mail.gmail.com>
 <BL1PR11MB5271699ED3A244F52C9D1EA68CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
In-Reply-To: <BL1PR11MB5271699ED3A244F52C9D1EA68CE39@BL1PR11MB5271.namprd11.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 6 Apr 2022 11:31:34 +0800
Message-ID: <CACGkMEsPQ1nj=sdjC5+7F-4C-GBv5XiejcxPc7231oU8NTfckg@mail.gmail.com>
Subject: Re: [PATCH V2 4/4] intel-iommu: PASID support
To: "Tian, Kevin" <kevin.tian@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Sat, Apr 2, 2022 at 3:24 PM Tian, Kevin <kevin.tian@intel.com> wrote:
>
> > From: Jason Wang <jasowang@redhat.com>
> > Sent: Wednesday, March 30, 2022 4:32 PM
> >
> > On Wed, Mar 30, 2022 at 4:02 PM Tian, Kevin <kevin.tian@intel.com> wrote:
> > >
> > > > From: Jason Wang <jasowang@redhat.com>
> > > > Sent: Tuesday, March 29, 2022 12:49 PM
> > > >
> > > > On Mon, Mar 28, 2022 at 3:03 PM Tian, Kevin <kevin.tian@intel.com>
> > wrote:
> > > > >
> > > > > > From: Jason Wang
> > > > > > Sent: Monday, March 21, 2022 1:54 PM
> > > > > >
> > > > > > +    /*
> > > > > > +     * vtd-spec v3.4 3.14:
> > > > > > +     *
> > > > > > +     * """
> > > > > > +     * Requests-with-PASID with input address in range 0xFEEx_xxxx
> > are
> > > > > > +     * translated normally like any other request-with-PASID through
> > > > > > +     * DMA-remapping hardware. However, if such a request is
> > processed
> > > > > > +     * using pass-through translation, it will be blocked as described
> > > > > > +     * in the paragraph below.
> > > > >
> > > > > While PASID+PT is blocked as described in the below paragraph, the
> > > > > paragraph itself applies to all situations:
> > > > >
> > > > >   1) PT + noPASID
> > > > >   2) translation + noPASID
> > > > >   3) PT + PASID
> > > > >   4) translation + PASID
> > > > >
> > > > > because...
> > > > >
> > > > > > +     *
> > > > > > +     * Software must not program paging-structure entries to remap
> > any
> > > > > > +     * address to the interrupt address range. Untranslated requests
> > > > > > +     * and translation requests that result in an address in the
> > > > > > +     * interrupt range will be blocked with condition code LGN.4 or
> > > > > > +     * SGN.8.
> > > > >
> > > > > ... if you look at the definition of LGN.4 or SGN.8:
> > > > >
> > > > > LGN.4:  When legacy mode (RTADDR_REG.TTM=00b) is enabled,
> > hardware
> > > > >         detected an output address (i.e. address after remapping) in the
> > > > >         interrupt address range (0xFEEx_xxxx). For Translated requests and
> > > > >         requests with pass-through translation type (TT=10), the output
> > > > >         address is the same as the address in the request
> > > > >
> > > > > The last sentence in the first paragraph above just highlights the fact
> > that
> > > > > when input address of PT is in interrupt range then it is blocked by
> > LGN.4
> > > > > or SGN.8 due to output address also in interrupt range.
> > > > >
> > > > > > +     * """
> > > > > > +     *
> > > > > > +     * We enable per as memory region (iommu_ir_fault) for catching
> > > > > > +     * the tranlsation for interrupt range through PASID + PT.
> > > > > > +     */
> > > > > > +    if (pt && as->pasid != PCI_NO_PASID) {
> > > > > > +        memory_region_set_enabled(&as->iommu_ir_fault, true);
> > > > > > +    } else {
> > > > > > +        memory_region_set_enabled(&as->iommu_ir_fault, false);
> > > > > > +    }
> > > > > > +
> > > > >
> > > > > Given above this should be a bug fix for nopasid first and then apply it
> > > > > to pasid path too.
> > > >
> > > > Actually, nopasid path patches were posted here.
> > > >
> > > > https://www.mail-archive.com/qemu-
> > devel@nongnu.org/msg867878.html
> > > >
> > > > Thanks
> > > >
> > >
> > > Can you elaborate why they are handled differently?
> >
> > It's because that patch is for the case where pasid mode is not
> > implemented. We might need it for -stable.
> >
>
> So will that patch be replaced after this one goes in?

That path will be merged first if I understand correctly. Then this
patch could be applied on top.

> By any means
> the new iommu_ir_fault region could be applied to both nopasid
> and pasid i.e. no need toggle it when address space is switched.

Actually it's needed only when PT is enabled. When PT is disabled, the
translation is done via iommu_translate.

Considering the previous patch will be merged, I will fix this !PT in
the next version.

Thanks

>
> Thanks
> Kevin


