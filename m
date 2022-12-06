Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39786448A1
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 17:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2aPD-0007Fh-M6; Tue, 06 Dec 2022 11:02:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aOw-0007E0-Ps
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:02:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1p2aOu-0007HI-Mt
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 11:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670342550;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n0gJwfuyhRnvbA9CQGSlecNr9CHWLEpKxGRU/QF0Ejg=;
 b=AKzWyB+tmX0HzbOEFa5AtcPuVmD9t3HJW+C8wsj6Mvsy6h60WsN9XbPIljAxaRpdFMN5tQ
 9uf4bpKMNzstysiRJWfgk0+k05Ql7Dqy6QtykY40jK6lxh5/udKOO4XtGUPqJR5u2td6UZ
 gzuDB6NBZ/IQ6m0StEg9ex2+T/PvjBc=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-468-THeuKLxzO12zWidIQ-YT6g-1; Tue, 06 Dec 2022 11:02:29 -0500
X-MC-Unique: THeuKLxzO12zWidIQ-YT6g-1
Received: by mail-qt1-f200.google.com with SMTP id
 j26-20020ac84c9a000000b003a7e6d38e01so5143698qtv.14
 for <qemu-devel@nongnu.org>; Tue, 06 Dec 2022 08:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n0gJwfuyhRnvbA9CQGSlecNr9CHWLEpKxGRU/QF0Ejg=;
 b=C31x6zGjmgktmZ+UqHO0ZG9u2Tth2uZQSBmoV8OemwflN2DuUILasewQSuzk4r/WCd
 NE93Q6NvdR0CWDLzNzj3gapdO9QgZG/z8f0upPOHvHS55M4F1aDOx5Uzv9xxRGr2Tjaw
 DkjBlCYAduBHctnVSfH7XRF//l4a7rRiPoi7vO1CLHwgq5JPHt45BoX8x6fUf0yiJrPo
 argUlcAuTatK+rfL+eAzcLav8/hhmc56NYAX4NHEgKaLtNw7v9M3rXMxTFCvuT68J1nm
 D2UVeg44EEFBak0fcVc/TmudJ5GIBnMvGGGIb7J2KaD+SlJ/yLPttBV2wRAIQAIzXX4w
 LMcA==
X-Gm-Message-State: ANoB5pmyRBI2jwbqlesdqw4116ivs1k6ACwdu2xXVCx7ef6275s8sef9
 rZH7IxLC7rOnfUDIGdZzaITEkYoGCu9z/fuLQ2vJ2HiHeC/qI9whJo+RLrkn0aWkknYeeqrGyy8
 iJ2YBB7aGN5jyZ/Y=
X-Received: by 2002:a37:5343:0:b0:6fa:e242:ad70 with SMTP id
 h64-20020a375343000000b006fae242ad70mr74801196qkb.297.1670342548835; 
 Tue, 06 Dec 2022 08:02:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf51kA2Jk7MnhAqQradDR8yG3GJmfDEyIE/mSVjOrXtgQ4RJlZ836jPobzmmVteHd8/qlLyS7Q==
X-Received: by 2002:a37:5343:0:b0:6fa:e242:ad70 with SMTP id
 h64-20020a375343000000b006fae242ad70mr74801159qkb.297.1670342548316; 
 Tue, 06 Dec 2022 08:02:28 -0800 (PST)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca.
 [70.31.27.79]) by smtp.gmail.com with ESMTPSA id
 r1-20020a05620a298100b006fed58fc1a3sm2358967qkp.119.2022.12.06.08.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 08:02:27 -0800 (PST)
Date: Tue, 6 Dec 2022 11:02:26 -0500
From: Peter Xu <peterx@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] intel-iommu: Document iova_tree
Message-ID: <Y49nklvwOAvfxUaA@x1n>
References: <20221201162501.3864692-1-peterx@redhat.com>
 <9de7491a-0787-fca5-0738-da5e8288b683@redhat.com>
 <Y4j+8y8EnWkZor2+@x1n>
 <3240586f-1d8f-920a-0f7b-52322432ad92@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3240586f-1d8f-920a-0f7b-52322432ad92@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 06, 2022 at 02:06:54PM +0100, Eric Auger wrote:
> >>> +     * current VTD address space, because all UNMAP (including iotlb or
> >>> +     * dev-iotlb) events can be transparently delivered to !MAP iommu
> >>> +     * notifiers.
> >> because all UNMAP notifications (iotlb or dev-iotlb) can be triggered
> >> directly, as opposed to MAP notifications. (?)
> > What I wanted to say is any PSI or DSI messages we got from the guest can
> > be transparently delivered to QEMU's iommu notifiers.  I'm not sure
> > "triggered directly" best describe the case here.
> yes "transparently delivered" is OK. Or "guest invalidate commands can
> be directly passed to the IOMMU UNMAP notifiers without any further
> reshuffling". But that's nitpicking.

Will do.

> >
> > PSI: Page Selective Invalidations
> > DSI: Domain Selective Invalidations
> >
> > Sorry to mention these terms again, but that's really what the "transparent
> > delivery" means here - we get the PSI/DSI messages, then we notify with the
> > same ranges in IOMMU notifiers.  They're not the same concept but we do
> > that transparently without changing the core of the messages.
> >
> > Maybe I should spell out "!MAP" as "UNMAP-only"?  Would that help?
> yeah those are unmap notifiers if I am correct.
> >
> >>> +     *
> >>> +     * The tree OTOH is required for MAP typed iommu notifiers for a few
> >>> +     * reasons.
> >>> +     *
> >>> +     * Firstly, there's no way to identify whether an PSI event is MAP or
> >> maybe give the decryption of the 'PSI' and 'DSI" acronyms once ;-)
> > Please see above. :)
> ok thanks
> >
> > These are VT-d terms used in multiple places in the .[ch] files, I assume
> > I'll just keep using them because otherwise I'll need to comment them
> > everytime we use any PSI/DSI terms.  It might become an overkill I'm afraid.
> OK maybe just using the full terminology once is enough.

Ok, I'll add them.

Thanks Eric.

-- 
Peter Xu


