Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A70260EA2C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:22:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmoB-0008La-FJ; Wed, 26 Oct 2022 16:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmo6-0008Io-S8
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmo4-0002zL-So
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:15:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666815320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C6aKXfqD6s0UoSz0vncXrx2wqKFOtcB92mD1GSABeGg=;
 b=GQU1Qpve0JnAVXaY9HTQ/sY5AO8Nt5fNHc9+jX5emsk2umsKUErxRrX+7XJL2RUCqml0dq
 lcMbzSl5w0AyRGLNzHRm2DlmyardNf8Tqb2Z1qq5RFrLY6dRJu1WKo3ybTPtnFI9ud16HW
 FPj+FSYxLhO/ZGDCQEXXQZ4ahZSvgFA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-7T0Ue2_gM56Q6OZ2k8z3wg-1; Wed, 26 Oct 2022 16:15:18 -0400
X-MC-Unique: 7T0Ue2_gM56Q6OZ2k8z3wg-1
Received: by mail-wr1-f71.google.com with SMTP id
 o13-20020adfa10d000000b00232c00377a0so6393352wro.13
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:15:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C6aKXfqD6s0UoSz0vncXrx2wqKFOtcB92mD1GSABeGg=;
 b=FVGVvggcYA475ynSoHrCF5E08lPCFdFU+wz6mqLAYFbs+6z6CqdIuhEIjoQaRROz/G
 ErhjWaCUTkz4AtkF9I2fT/i90DkcbPEoPYXR+YdYmuC1tNRwRhGyWXMOdfG77npD7Db5
 awb7zuebopnpWwjWPHiJL1MXvEUr+LguUFdchH7ixFT6Ss8fvAby8yc+pxXKLKUiZBnF
 ZvDW/9fTCGxkT3103rrmdXEZqqvJG2rz2rZxJzo6O9MgHqYFsX+i2gYuQyhZQdm45X4v
 T3jAxWbFQ7Gl7V9r/cY0BIi/N2rQlPlMBip0a00Fb68UG09u8I+vfqSA+voZhj20+OFp
 zvjA==
X-Gm-Message-State: ACrzQf1rBpf6GgkwgM4nYsdCRyuKa1TptzwznfXc3ZoT0XTj6GsF4C5f
 0jgSCuOOmj15yjHZ4H/5JI6R3MXi9D5pveHr/n++YoifbNv8ms8DZzA7oZyVAHEOiyjTdITZgxt
 L/k+jwH97enSbJu8=
X-Received: by 2002:a05:600c:1d02:b0:3c3:e6f0:6e4b with SMTP id
 l2-20020a05600c1d0200b003c3e6f06e4bmr3657706wms.202.1666815316061; 
 Wed, 26 Oct 2022 13:15:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6n9g7K37AGF98D05l1F42OXiQ/kJtsIJIccSH0DJYN2bOLugg65OdIRFynLqVZq0PJWSCffw==
X-Received: by 2002:a05:600c:1d02:b0:3c3:e6f0:6e4b with SMTP id
 l2-20020a05600c1d0200b003c3e6f06e4bmr3657684wms.202.1666815315809; 
 Wed, 26 Oct 2022 13:15:15 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b003a6a3595edasm2572130wmp.27.2022.10.26.13.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:15:15 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:15:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 linux-cxl@vger.kernel.org, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, ani@anisinha.ca, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH 0/4 v3] Multi-Region and Volatile Memory support for CXL
 Type-3 Devices
Message-ID: <20221026161412-mutt-send-email-mst@kernel.org>
References: <20221026004737.3646-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026004737.3646-1-gregory.price@memverge.com>
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

On Tue, Oct 25, 2022 at 08:47:33PM -0400, Gregory Price wrote:
> Submitted as an extention to the multi-feature branch maintained
> by Jonathan Cameron at:
> https://gitlab.com/jic23/qemu/-/tree/cxl-2022-10-24 

BTW pls set subject prefix for all patches, and put it before the patch #.
-v parameter to format-patch will do this for you.

> 
> Summary of Changes:
> 1) E820 CFMW Bug fix.  
> 2) Add CXL_CAPACITY_MULTIPLIER definition to replace magic numbers
> 3) Multi-Region and Volatile Memory support for CXL Type-3 Devices
> 4) CXL Type-3 SRAT Generation when NUMA node is attached to memdev
> 
> 
> Regarding the E820 fix
>   * This bugfix is required for memory regions to work on x86
>   * input from Dan Williams and others suggest that E820 entry for
>     the CFMW should not exist, as it is expected to be dynamically
>     assigned at runtime.  If this entry exists, it instead blocks
>     region creation by nature of the memory region being marked as
>     reserved.
> 
> Regarding Multi-Region and Volatile Memory
>   * Developed with input from Jonathan Cameron and Davidlohr Bueso.
> 
> Regarding SRAT Generation for Type-3 Devices
>   * Co-Developed by Davidlohr Bueso.  Built from his base patch and
>     extended to work with both volatile and persistent regions.
>   * This can be used to demonstrate static type-3 device mapping and
>     testing numa-access to type-3 device memory regions.
> 
> 
> This series brings 3 features to CXL Type-3 Devices:
>     1) Volatile Memory Region support
>     2) Multi-Region support (1 Volatile, 1 Persistent)
>     3) (optional) SRAT Entry generation for type-3 device regions
> 
> In this series we implement multi-region and volatile region support
> through 7 major changes to CXL devices
>     1) The HostMemoryBackend [hostmem] has been replaced by two
>        [hostvmem] and [hostpmem] to store volatile and persistent
>        memory respectively
>     2) The single AddressSpace has been replaced by two AddressSpaces
>        [hostvmem_as] and [hostpmem_as] to map respective memdevs.
>     3) Each memory region size and total region are stored separately
>     4) The CDAT and DVSEC memory map entries have been updated:
>        a) if vmem is present, vmem is mapped at DPA(0)
>        b) if pmem is present
>           i)  and vmem is present, pmem is mapped at DPA(vmem->size)
>           ii) else, pmem is mapped at DPA(0)
>        c) partitioning of pmem is not supported in this patch set but
>           has been discussed and this design should suffice.
>     5) Read/Write functions have been updated to access AddressSpaces
>        according to the mapping described in #4
>     6) cxl-mailbox has been updated to report the respective size of
>        volatile and persistent memory regions
>     7) SRAT entries may optionally be generated by manually assigning
>        memdevs to a cpuless numa node
> 
> To support the Device Physical Address (DPA) Mapping decisions, see
> CXL Spec (3.0) Section 8.2.9.8.2.0 - Get Partition Info:
>   Active Volatile Memory
>     The device shall provide this volatile capacity starting at DPA 0
>   Active Persistent Memory
>     The device shall provide this persistent capacity starting at the
>     DPA immediately following the volatile capacity
> 
> Partitioning of Persistent Memory regions may be supported on
> following patch sets.
> 
> 
> Gregory Price (4):
>   hw/i386/pc.c: CXL Fixed Memory Window should not reserve e820 in bios
>   hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
>   hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)
>   hw/acpi/cxl.c: Fill in SRAT for vmem/pmem if NUMA node is assigned
> 
>  docs/system/devices/cxl.rst |  74 ++++++++--
>  hw/acpi/cxl.c               |  67 +++++++++
>  hw/cxl/cxl-mailbox-utils.c  |  23 +--
>  hw/i386/acpi-build.c        |   4 +
>  hw/i386/pc.c                |   2 -
>  hw/mem/cxl_type3.c          | 274 +++++++++++++++++++++++++++---------
>  include/hw/acpi/cxl.h       |   1 +
>  include/hw/cxl/cxl_device.h |  11 +-
>  tests/qtest/cxl-test.c      | 111 +++++++++++----
>  9 files changed, 443 insertions(+), 124 deletions(-)
> 
> -- 
> 2.37.3


