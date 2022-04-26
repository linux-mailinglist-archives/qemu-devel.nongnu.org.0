Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 428C051054D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:22:38 +0200 (CEST)
Received: from localhost ([::1]:46642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOtZ-00030p-D3
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:22:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njO9o-0004NK-7M
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:35:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1njO9h-0004c4-Bw
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:35:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650990912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LfsfOstOihKjpZcpPA+lYDNuveMEExmShKa1N/TShik=;
 b=dZ0Jxj78zfzzYzSwQDxLfNo4wQTN+eCs3CPsUonHWNozPaTTa5Fov9IMyP4H+BHNPO6Q85
 Exm/9u38sG/nUffITC5KIyGNkD2v0ROuQliKoDgQ4RXjxZv+PNI7Usgt+kFZy47s+3Lqtp
 TwOP9K4J42nnJVOmzRugWwRnOrJT4i8=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-T5yAq1TsN7ieZyq39qQI7A-1; Tue, 26 Apr 2022 12:35:10 -0400
X-MC-Unique: T5yAq1TsN7ieZyq39qQI7A-1
Received: by mail-io1-f72.google.com with SMTP id
 q5-20020a0566022f0500b00654a56b1dfbso14552238iow.8
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=LfsfOstOihKjpZcpPA+lYDNuveMEExmShKa1N/TShik=;
 b=2iub0UJWJlqZO5LU+3UfQQyPEPCA901RFCwrvAMJU+TX2mtOyHr/0xgJV7oeyHXBLL
 oSux+A5xlBPYz1QV3BUncrZ3FjnvYK+KsM76dr2qnHO2tfZ1q9X32k2n/3bRgJcyaSxD
 KWpJyi7qn/kjrlqwJna2UsaYBkb34ez+cnCpLXazaA4U22xrbL28lzFl0c1GSL+vG9R4
 nhddV/Oq/M339RpjDNOPIZk68cyi4v0MHXrOLY4TspkB8tomyXo6q5jOhBE4mZ55N+ag
 d4TbugDuh1gfBX7P8gIxcIjSw9v8SWRmf9PyBvok851izw5IE/JYAxAxHxLcXKudYRp6
 IODA==
X-Gm-Message-State: AOAM531tkB9zV9KmpX3pEPN+vFiTcZsCBeVWQC6ddGaZBZFNtasutu9Z
 Dcu86p3htbeqGJt3gS+VvoOYJvdeWUMWDiM+YObDabMQHBImojz8UXTdc4GGm/hwBbKxit92AV3
 sM/GxakJmDHEnwSo=
X-Received: by 2002:a05:6e02:19c8:b0:2cd:6c70:1090 with SMTP id
 r8-20020a056e0219c800b002cd6c701090mr9792476ill.212.1650990909520; 
 Tue, 26 Apr 2022 09:35:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxS/wvN70OT99iYPeBPbnWvoQ3P7FmUM0RaRI3UQnFPCLKb1fMCWp9FKCRoz5y2K67IFl9DgQ==
X-Received: by 2002:a05:6e02:19c8:b0:2cd:6c70:1090 with SMTP id
 r8-20020a056e0219c800b002cd6c701090mr9792439ill.212.1650990909065; 
 Tue, 26 Apr 2022 09:35:09 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 k22-20020a6b6f16000000b0065434014fd2sm9559873ioc.18.2022.04.26.09.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:35:08 -0700 (PDT)
Date: Tue, 26 Apr 2022 10:35:07 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220426103507.5693a0ca.alex.williamson@redhat.com>
In-Reply-To: <4ac4956cfe344326a805966535c1dc43@huawei.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
 <4f920d463ebf414caa96419b625632d5@huawei.com>
 <be8aa86a-25d1-d034-5e3b-6406aa7ff897@redhat.com>
 <4ac4956cfe344326a805966535c1dc43@huawei.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "jjherne@linux.ibm.com" <jjherne@linux.ibm.com>,
 "thuth@redhat.com" <thuth@redhat.com>, Yi Liu <yi.l.liu@intel.com>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "mjrosato@linux.ibm.com" <mjrosato@linux.ibm.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "peterx@redhat.com" <peterx@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "yi.y.sun@intel.com" <yi.y.sun@intel.com>,
 "chao.p.peng@intel.com" <chao.p.peng@intel.com>,
 "nicolinc@nvidia.com" <nicolinc@nvidia.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "jgg@nvidia.com" <jgg@nvidia.com>, Zhangfei Gao <zhangfei.gao@linaro.org>,
 "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 26 Apr 2022 12:43:35 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Eric Auger [mailto:eric.auger@redhat.com]
> > Sent: 26 April 2022 12:45
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>; Yi
> > Liu <yi.l.liu@intel.com>; alex.williamson@redhat.com; cohuck@redhat.com;
> > qemu-devel@nongnu.org
> > Cc: david@gibson.dropbear.id.au; thuth@redhat.com; farman@linux.ibm.com;
> > mjrosato@linux.ibm.com; akrowiak@linux.ibm.com; pasic@linux.ibm.com;
> > jjherne@linux.ibm.com; jasowang@redhat.com; kvm@vger.kernel.org;
> > jgg@nvidia.com; nicolinc@nvidia.com; eric.auger.pro@gmail.com;
> > kevin.tian@intel.com; chao.p.peng@intel.com; yi.y.sun@intel.com;
> > peterx@redhat.com; Zhangfei Gao <zhangfei.gao@linaro.org>
> > Subject: Re: [RFC 00/18] vfio: Adopt iommufd  
> 
> [...]
>  
> > >>  
> > https://lore.kernel.org/kvm/0-v1-e79cd8d168e8+6-iommufd_jgg@nvidia.com  
> > >> /
> > >> [2] https://github.com/luxis1999/iommufd/tree/iommufd-v5.17-rc6
> > >> [3] https://github.com/luxis1999/qemu/tree/qemu-for-5.17-rc6-vm-rfcv1  
> > > Hi,
> > >
> > > I had a go with the above branches on our ARM64 platform trying to  
> > pass-through  
> > > a VF dev, but Qemu reports an error as below,
> > >
> > > [    0.444728] hisi_sec2 0000:00:01.0: enabling device (0000 -> 0002)
> > > qemu-system-aarch64-iommufd: IOMMU_IOAS_MAP failed: Bad address
> > > qemu-system-aarch64-iommufd: vfio_container_dma_map(0xaaaafeb40ce0,  
> > 0x8000000000, 0x10000, 0xffffb40ef000) = -14 (Bad address)  
> > >
> > > I think this happens for the dev BAR addr range. I haven't debugged the  
> > kernel  
> > > yet to see where it actually reports that.  
> > Does it prevent your assigned device from working? I have such errors
> > too but this is a known issue. This is due to the fact P2P DMA is not
> > supported yet.
> >   
> 
> Yes, the basic tests all good so far. I am still not very clear how it works if
> the map() fails though. It looks like it fails in,
> 
> iommufd_ioas_map()
>   iopt_map_user_pages()
>    iopt_map_pages()
>    ..
>      pfn_reader_pin_pages()
> 
> So does it mean it just works because the page is resident()?

No, it just means that you're not triggering any accesses that require
peer-to-peer DMA support.  Any sort of test where the device is only
performing DMA to guest RAM, which is by far the standard use case,
will work fine.  This also doesn't affect vCPU access to BAR space.
It's only a failure of the mappings of the BAR space into the IOAS,
which is only used when a device tries to directly target another
device's BAR space via DMA.  Thanks,

Alex


