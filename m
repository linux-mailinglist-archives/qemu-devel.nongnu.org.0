Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDC150C22F
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Apr 2022 00:11:55 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ni1VH-0006bZ-Ru
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 18:11:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ni1TN-0005gH-A3
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 18:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ni1TJ-0002bp-GC
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 18:09:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650665387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BMFVJm9dtShNkP7cwazUzGzZbdvMU804Fbi6xRxrS+w=;
 b=DWvIflU9LQcDxk37WLkNp2eN1GgNIBv2590j4iEjR8FzZQuIYeue4T+hftyMTBfI1p2kYx
 R4UGgffhbexopk844BYOz1XOswPaukN2TIK6oFGH8v6+VOAumoY262uTykYk1v64o6c+uv
 aWQjtB93hhWJVReOnYmcp+/UjochQ7A=
Received: from mail-io1-f71.google.com (mail-io1-f71.google.com
 [209.85.166.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-Gc46HwvrMC29tc5sWVFiEQ-1; Fri, 22 Apr 2022 18:09:46 -0400
X-MC-Unique: Gc46HwvrMC29tc5sWVFiEQ-1
Received: by mail-io1-f71.google.com with SMTP id
 u18-20020a5d8712000000b0064c7a7c497aso6206652iom.18
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 15:09:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=BMFVJm9dtShNkP7cwazUzGzZbdvMU804Fbi6xRxrS+w=;
 b=vYIBvLyA3WUBgqJky4pIEZ+KU6g1SPBOHNe0hOJg15uQS9uHwKppOarS1FSkqwD7f0
 v37l2Qf07QDFGWRLUZtZsGJP6DtDXEH7q97V3vx3RjnYcq8ANZRhhAV/Dw7SVfYv8eVd
 JVg1msnHDyKgwlBtZIN3mRk2y2ALKlkJf4B+upFc1FA1OKoinxN50zljrL8gw20PfHiI
 riHuxS+YL3DedQDidlKGbM7pI9XGRRwE95uRMl0AE5VL/i1aLUV17Z+qiFL84R58QKSX
 ibWu713Z8sKXfwrsWfALOMbGM6Z46w7Omi5Y7GIFDtdu2GGn/IbDzsQ2elVebzmt8ALf
 4loQ==
X-Gm-Message-State: AOAM532iDafrCfiXpMP6V/2cFTpaQHskl0FAcwrdcPHXxxmbKdCD/xyc
 pov8JpBxGxzYxDKTgwq7tlMiLkAmTdth+nn3fKTaECOTRISWV05ZIVanPQ9aYebplj3Hag/R3K8
 HhdxWdoubKNYlkxM=
X-Received: by 2002:a05:6602:2095:b0:654:a64a:2d4e with SMTP id
 a21-20020a056602209500b00654a64a2d4emr2830643ioa.214.1650665385982; 
 Fri, 22 Apr 2022 15:09:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOdEbofQIQYXeHyO6sATYR/uwesFuNph/21hLkAIusCEY3uun5JOIHUuWOXCX8kp4ftxTjBQ==
X-Received: by 2002:a05:6602:2095:b0:654:a64a:2d4e with SMTP id
 a21-20020a056602209500b00654a64a2d4emr2830627ioa.214.1650665385729; 
 Fri, 22 Apr 2022 15:09:45 -0700 (PDT)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 y21-20020a6bc415000000b00648da092c8esm2319383ioa.14.2022.04.22.15.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 15:09:45 -0700 (PDT)
Date: Fri, 22 Apr 2022 16:09:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Yi Liu <yi.l.liu@intel.com>
Subject: Re: [RFC 00/18] vfio: Adopt iommufd
Message-ID: <20220422160943.6ff4f330.alex.williamson@redhat.com>
In-Reply-To: <20220414104710.28534-1-yi.l.liu@intel.com>
References: <20220414104710.28534-1-yi.l.liu@intel.com>
Organization: Red Hat
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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
Cc: akrowiak@linux.ibm.com, jjherne@linux.ibm.com, farman@linux.ibm.com,
 chao.p.peng@intel.com, kvm@vger.kernel.org, mjrosato@linux.ibm.com,
 Laine Stump <laine@redhat.com>,
 "libvir-list@redhat.com" <libvir-list@redhat.com>, jasowang@redhat.com,
 cohuck@redhat.com, thuth@redhat.com, peterx@redhat.com, qemu-devel@nongnu.org,
 pasic@linux.ibm.com, eric.auger@redhat.com, yi.y.sun@intel.com,
 nicolinc@nvidia.com, kevin.tian@intel.com, jgg@nvidia.com,
 eric.auger.pro@gmail.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[Cc +libvirt folks]

On Thu, 14 Apr 2022 03:46:52 -0700
Yi Liu <yi.l.liu@intel.com> wrote:

> With the introduction of iommufd[1], the linux kernel provides a generic
> interface for userspace drivers to propagate their DMA mappings to kernel
> for assigned devices. This series does the porting of the VFIO devices
> onto the /dev/iommu uapi and let it coexist with the legacy implementation.
> Other devices like vpda, vfio mdev and etc. are not considered yet.
> 
> For vfio devices, the new interface is tied with device fd and iommufd
> as the iommufd solution is device-centric. This is different from legacy
> vfio which is group-centric. To support both interfaces in QEMU, this
> series introduces the iommu backend concept in the form of different
> container classes. The existing vfio container is named legacy container
> (equivalent with legacy iommu backend in this series), while the new
> iommufd based container is named as iommufd container (may also be mentioned
> as iommufd backend in this series). The two backend types have their own
> way to setup secure context and dma management interface. Below diagram
> shows how it looks like with both BEs.
> 
>                     VFIO                           AddressSpace/Memory
>     +-------+  +----------+  +-----+  +-----+
>     |  pci  |  | platform |  |  ap |  | ccw |
>     +---+---+  +----+-----+  +--+--+  +--+--+     +----------------------+
>         |           |           |        |        |   AddressSpace       |
>         |           |           |        |        +------------+---------+
>     +---V-----------V-----------V--------V----+               /
>     |           VFIOAddressSpace              | <------------+
>     |                  |                      |  MemoryListener
>     |          VFIOContainer list             |
>     +-------+----------------------------+----+
>             |                            |
>             |                            |
>     +-------V------+            +--------V----------+
>     |   iommufd    |            |    vfio legacy    |
>     |  container   |            |     container     |
>     +-------+------+            +--------+----------+
>             |                            |
>             | /dev/iommu                 | /dev/vfio/vfio
>             | /dev/vfio/devices/vfioX    | /dev/vfio/$group_id
>  Userspace  |                            |
>  ===========+============================+================================
>  Kernel     |  device fd                 |
>             +---------------+            | group/container fd
>             | (BIND_IOMMUFD |            | (SET_CONTAINER/SET_IOMMU)
>             |  ATTACH_IOAS) |            | device fd
>             |               |            |
>             |       +-------V------------V-----------------+
>     iommufd |       |                vfio                  |
> (map/unmap  |       +---------+--------------------+-------+
>  ioas_copy) |                 |                    | map/unmap
>             |                 |                    |
>      +------V------+    +-----V------+      +------V--------+
>      | iommfd core |    |  device    |      |  vfio iommu   |
>      +-------------+    +------------+      +---------------+
> 
> [Secure Context setup]
> - iommufd BE: uses device fd and iommufd to setup secure context
>               (bind_iommufd, attach_ioas)
> - vfio legacy BE: uses group fd and container fd to setup secure context
>                   (set_container, set_iommu)
> [Device access]
> - iommufd BE: device fd is opened through /dev/vfio/devices/vfioX
> - vfio legacy BE: device fd is retrieved from group fd ioctl
> [DMA Mapping flow]
> - VFIOAddressSpace receives MemoryRegion add/del via MemoryListener
> - VFIO populates DMA map/unmap via the container BEs
>   *) iommufd BE: uses iommufd
>   *) vfio legacy BE: uses container fd
> 
> This series qomifies the VFIOContainer object which acts as a base class
> for a container. This base class is derived into the legacy VFIO container
> and the new iommufd based container. The base class implements generic code
> such as code related to memory_listener and address space management whereas
> the derived class implements callbacks that depend on the kernel user space
> being used.
> 
> The selection of the backend is made on a device basis using the new
> iommufd option (on/off/auto). By default the iommufd backend is selected
> if supported by the host and by QEMU (iommufd KConfig). This option is
> currently available only for the vfio-pci device. For other types of
> devices, it does not yet exist and the legacy BE is chosen by default.

I've discussed this a bit with Eric, but let me propose a different
command line interface.  Libvirt generally likes to pass file
descriptors to QEMU rather than grant it access to those files
directly.  This was problematic with vfio-pci because libvirt can't
easily know when QEMU will want to grab another /dev/vfio/vfio
container.  Therefore we abandoned this approach and instead libvirt
grants file permissions.

However, with iommufd there's no reason that QEMU ever needs more than
a single instance of /dev/iommufd and we're using per device vfio file
descriptors, so it seems like a good time to revisit this.

The interface I was considering would be to add an iommufd object to
QEMU, so we might have a:

-device iommufd[,fd=#][,id=foo]

For non-libivrt usage this would have the ability to open /dev/iommufd
itself if an fd is not provided.  This object could be shared with
other iommufd users in the VM and maybe we'd allow multiple instances
for more esoteric use cases.  [NB, maybe this should be a -object rather than
-device since the iommufd is not a guest visible device?]

The vfio-pci device might then become:

-device vfio-pci[,host=DDDD:BB:DD.f][,sysfsdev=/sys/path/to/device][,fd=#][,iommufd=foo]

So essentially we can specify the device via host, sysfsdev, or passing
an fd to the vfio device file.  When an iommufd object is specified,
"foo" in the example above, each of those options would use the
vfio-device access mechanism, essentially the same as iommufd=on in
your example.  With the fd passing option, an iommufd object would be
required and necessarily use device level access.

In your example, the iommufd=auto seems especially troublesome for
libvirt because QEMU is going to have different locked memory
requirements based on whether we're using type1 or iommufd, where the
latter resolves the duplicate accounting issues.  libvirt needs to know
deterministically which backed is being used, which this proposal seems
to provide, while at the same time bringing us more in line with fd
passing.  Thoughts?  Thanks,

Alex


