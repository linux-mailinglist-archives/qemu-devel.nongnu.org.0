Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 371744ADF6E
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 18:24:00 +0100 (CET)
Received: from localhost ([::1]:52882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUDf-0004UA-AQ
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 12:23:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nHTU7-0000EI-Mu
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:36:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nHTU0-0004bE-UV
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 11:36:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644338206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6btMsE4Kj3Db1rAcaGwbj3XTbov2oFdXG2LcOpMeehk=;
 b=WuGECtTNDArZKUsXychvJtDFtN7wuNXCMdr5DrPj7JrS3LJcLetfug08pGaiytGIxErwG5
 7ummKMtrpvGcdsnROSRkQr8FK/PXPT4UmLU3CvjMQ8lfJwWo9ZsMSHSDGraNV6XX0WfdH5
 far4deGE1dHDRcmhJHQ8o76nAeGWFI8=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-zdM0VACQPluyijjC1mqlAA-1; Tue, 08 Feb 2022 11:36:43 -0500
X-MC-Unique: zdM0VACQPluyijjC1mqlAA-1
Received: by mail-io1-f71.google.com with SMTP id
 y124-20020a6bc882000000b0060fbfe14d03so11829414iof.2
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 08:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=6btMsE4Kj3Db1rAcaGwbj3XTbov2oFdXG2LcOpMeehk=;
 b=a0rfcK5tseQ5kdrl9hYRZrAr55qiBetnOyYAxytEKjVoZDau26hO7EETKMKa8YT/Y6
 C4yd8uV1wXrVMltqfhmK9Yw9Aptu4XO9NuuTuAuVPJFxH5ZgosSZuTCLQQALv26BsJ69
 wJ72Q13JGivfR6QBxQiZsqZ7+KOotlvf82mMfzfD5haR5IH39tJt8zrRZEaVd9xpVm+q
 UQ7lxlyEWTSkoIARF44cY0kbX1QXXO/EIwP0vxziskGkwT5+89wHYCI5A+ih5ehZwBLH
 4xcZhgPLtcpbW1vswueDiimpFx2aCzbeixTFXqPMWw/ly3AlpOtyaW71HMjtwSv497dg
 hI1A==
X-Gm-Message-State: AOAM531/gJJTriVc59ikK2TgiUreDTb+SLjnDvegHbZ9Z/YfsXORwjUQ
 7sv1dvjqsFx9oYE23huZ+bHleasdE+uqrAtF8JIvh/Eats1XROuFbaCLmgZXG+N9Si5sgNMZ+Pf
 74ojWWHS13+a/TGU=
X-Received: by 2002:a5e:a806:: with SMTP id c6mr2401618ioa.112.1644338203118; 
 Tue, 08 Feb 2022 08:36:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyOrIfibXGwrfYy0mAvLHE/m/MoWSU2my/Erjlq2Dfxey2pAy/3jQHGA9Sc/wwtPmSr1Y0evg==
X-Received: by 2002:a5e:a806:: with SMTP id c6mr2401608ioa.112.1644338202889; 
 Tue, 08 Feb 2022 08:36:42 -0800 (PST)
Received: from redhat.com ([38.15.36.239])
 by smtp.gmail.com with ESMTPSA id k2sm8336863iow.7.2022.02.08.08.36.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 08:36:42 -0800 (PST)
Date: Tue, 8 Feb 2022 09:36:40 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 1/2] tpm: CRB: Use ram_device for "tpm-crb-cmd" region
Message-ID: <20220208093640.1b8a54f8.alex.williamson@redhat.com>
In-Reply-To: <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
References: <20220208133842.112017-1-eric.auger@redhat.com>
 <20220208133842.112017-2-eric.auger@redhat.com>
 <CAFEAcA9teH-ejt3NKh1rqQPToM_S-DC2JdHUkMof4YwHXoaXtA@mail.gmail.com>
 <3b1f9d56-81e7-d59e-0a02-9416eae6b914@redhat.com>
 <CAFEAcA_4+BQ=YwVpY7qfxp=FygyWa+y0tDDkEQwhY1qDRDX-tQ@mail.gmail.com>
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
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: quintela@redhat.com, stefanb@linux.vnet.ibm.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, f4bug@amsat.org, eric.auger@redhat.com,
 imammedo@redhat.com, david@gibson.dropbear.id.au, dgilbert@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 8 Feb 2022 16:01:48 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 8 Feb 2022 at 15:56, Eric Auger <eric.auger@redhat.com> wrote:
> >
> > Hi Peter,
> >
> > On 2/8/22 4:17 PM, Peter Maydell wrote:  
> > > On Tue, 8 Feb 2022 at 15:08, Eric Auger <eric.auger@redhat.com> wrote:  
> > >> Representing the CRB cmd/response buffer as a standard
> > >> RAM region causes some trouble when the device is used
> > >> with VFIO. Indeed VFIO attempts to DMA_MAP this region
> > >> as usual RAM but this latter does not have a valid page
> > >> size alignment causing such an error report:
> > >> "vfio_listener_region_add received unaligned region".
> > >> To allow VFIO to detect that failing dma mapping
> > >> this region is not an issue, let's use a ram_device
> > >> memory region type instead.  
> > > This seems like VFIO's problem to me. There's nothing
> > > that guarantees alignment for memory regions at all,
> > > whether they're RAM, IO or anything else.  
> >
> > VFIO dma maps all the guest RAM.  
> 
> Well, it can if it likes, but "this is a RAM-backed MemoryRegion"
> doesn't imply "this is really guest actual RAM RAM", so if it's
> using that as its discriminator it should probably use something else.
> What is it actually trying to do here ?

VFIO is device agnostic, we don't understand the device programming
model, we can't know how the device is programmed to perform DMA.  The
only way we can provide transparent assignment of arbitrary PCI devices
is to install DMA mappings for everything in the device AddressSpace
through the system IOMMU.  If we were to get a sub-page RAM mapping
through the MemoryListener and that mapping had the possibility of
being a DMA target, then we have a problem, because we cannot represent
that through the IOMMU.  If the device were to use that address for DMA,
we'd likely have data loss/corruption in the VM.

AFAIK, and I thought we had some general agreement on this, declaring
device memory as ram_device is the only means we have to differentiate
MemoryRegion segments generated by a device from actual system RAM.
For device memory, we can lean on the fact that peer-to-peer DMA is
much more rare and likely involves some degree of validation by the
drivers since it can be blocked on physical hardware due to various
topology and chipset related issues.  Therefore we can consider
failures to map device memory at a lower risk than failures to map
ranges we think are actual system RAM.

Are there better approaches?  We can't rely on the device sitting
behind a vIOMMU in the guest to restrict the address space and we can't
afford the performance hit for dyanmic DMA mappings through a vIOMMU
either.  Thanks,

Alex


