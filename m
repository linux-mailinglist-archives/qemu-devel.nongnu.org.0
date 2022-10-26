Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9A60EA7A
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:44:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onnDM-0002tk-4F; Wed, 26 Oct 2022 16:41:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnDH-0002LE-HT
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:41:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onnCU-00085m-By
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:41:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666816827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zp24GueRSDXr/SsGMpQHu3N0C7lCHXG5Ay57+x9v7Vw=;
 b=C7nu96nn3A9pmzpbx4weGQzAlf3teRR+A1OsnRuhjgn+TPoC57gbhv6ZXIzI9SO2pU7QVt
 2RMyZX13HDuGIQWIljh9j2ovt0rtjvV+DlW0DfQQjyAOH2sffFzMYqx0NtIn89dHtBbhnU
 LW4JYAFtGaO14YTf97lfl8cTECu8VDw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-336-sPX_JN0AMmqo9O52TVn8pQ-1; Wed, 26 Oct 2022 16:40:26 -0400
X-MC-Unique: sPX_JN0AMmqo9O52TVn8pQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 i83-20020a1c3b56000000b003cf4ff1b917so175496wma.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:40:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zp24GueRSDXr/SsGMpQHu3N0C7lCHXG5Ay57+x9v7Vw=;
 b=aviQPbb9RRXQscXZjL82Kfbt2uK5xsBt4NWr8DbKyyU0hbYQR0UoYT4LTobpotxHnA
 eZ8OMAfEcJdZ2mp1eY9ANGhr3I/SBXKKloTrA/2FGYLk9ICx5OqsjHCHHvIxfwkfHI8L
 M4dqQE2iRVXrpqmnnv872X8xjJ6y1a8RxM/idL4vjS0DkWy4ndZeznWT6oGu1a6VHjgH
 13HpkMVHc5IPLKnJ5XfZw9RozoKPtfNTtSQCLnT+SCAuoRINr0ZR9pHZn01ewzamGKQr
 NjGGnfJ1FP6x24wxcxDqergEVcUK6PCBkAqjnmoTuYqzblBwboR2vh7+k0wlX6qnhKch
 /7rQ==
X-Gm-Message-State: ACrzQf3B6y8tV+mtX/JxpcuMFJYc7ZbEBJiAVR1bNO3bp0cBc3frnAWL
 L4RdzFc+LyzKg+FU6r6xDrdRjeUGDjzwSvK9bsd9+ZRel+xobcaA5kD+BvLjoPLdBAdkDdfT4V0
 uIWUwg0+AbHBF2GU=
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr10945850wrn.696.1666816825360; 
 Wed, 26 Oct 2022 13:40:25 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FHb10PxeKTrdWTgjMlFKFcEcUcp4ip0PyYukup64yhOxr91GJ+eTzYxk4CLc10YEO5iZxeg==
X-Received: by 2002:adf:e64e:0:b0:236:76a9:446 with SMTP id
 b14-20020adfe64e000000b0023676a90446mr10945833wrn.696.1666816825080; 
 Wed, 26 Oct 2022 13:40:25 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 d5-20020a05600c34c500b003cf4d99fd2asm1913441wmq.6.2022.10.26.13.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:40:24 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:40:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>, jasowang@redhat.com, pbonzini@redhat.com,
 peterx@redhat.com, david@redhat.com, f4bug@amsat.org,
 sgarzare@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 1/2] vfio: move the function vfio_get_xlat_addr() to
 memory.c
Message-ID: <20221026164001-mutt-send-email-mst@kernel.org>
References: <20221025163734.965367-1-lulu@redhat.com>
 <20221025163734.965367-2-lulu@redhat.com>
 <20221025105518.0a56c662.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025105518.0a56c662.alex.williamson@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Oct 25, 2022 at 10:55:18AM -0600, Alex Williamson wrote:
> On Wed, 26 Oct 2022 00:37:33 +0800
> Cindy Lu <lulu@redhat.com> wrote:
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index 7ba2048836..03940c551d 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> ...
> > +        /*
> > +         * Malicious VMs might trigger discarding of IOMMU-mapped memory. The
> > +         * pages will remain pinned inside vfio until unmapped, resulting in a
> > +         * higher memory consumption than expected. If memory would get
> > +         * populated again later, there would be an inconsistency between pages
> > +         * pinned by vfio and pages seen by QEMU. This is the case until
> > +         * unmapped from the IOMMU (e.g., during device reset).
> > +         *
> > +         * With malicious guests, we really only care about pinning more memory
> > +         * than expected. RLIMIT_MEMLOCK set for the user/process can never be
> > +         * exceeded and can be used to mitigate this problem.
> > +         */
> > +        warn_report_once("Using vfio with vIOMMUs and coordinated discarding of"
> > +                         " RAM (e.g., virtio-mem) works, however, malicious"
> > +                         " guests can trigger pinning of more memory than"
> > +                         " intended via an IOMMU. It's possible to mitigate "
> > +                         " by setting/adjusting RLIMIT_MEMLOCK.");
> 
> Looks like the comment and warning still need to be generalized for
> shared use here.  Thanks,
> 
> Alex

can be a patch on top? concerned about meeting the soft freeze here.


