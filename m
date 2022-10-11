Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1871B5FBDD9
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 00:23:00 +0200 (CEST)
Received: from localhost ([::1]:42648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiNeN-0002s6-7N
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 18:22:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiNby-0007BQ-7o
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:20:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oiNbu-0006zg-LT
 for qemu-devel@nongnu.org; Tue, 11 Oct 2022 18:20:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665526824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0NEFORJdOwYlR2zzBzKEPwjPd7DSRD0p52+NJISxyoI=;
 b=HwDLrP6zKZ242s9vpRzrROMoNckpIL4YhnXwNiTdzx6Vf0nogfo5eJyolson9+EO0wAp30
 1u9d0hsT/gVFhLLrVPS7Ug6/D+Nua9ouS/ygRcvRKGffm+uISI4obnrL82uBmKk824hg6R
 TGzUYVDomnfH0r2b2++6Vb5DZn7mAnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-522-tenFv0NzMbeOicbGRohw0w-1; Tue, 11 Oct 2022 18:20:23 -0400
X-MC-Unique: tenFv0NzMbeOicbGRohw0w-1
Received: by mail-wm1-f70.google.com with SMTP id
 133-20020a1c028b000000b003c5e6b44ebaso125846wmc.9
 for <qemu-devel@nongnu.org>; Tue, 11 Oct 2022 15:20:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NEFORJdOwYlR2zzBzKEPwjPd7DSRD0p52+NJISxyoI=;
 b=rZ3JNtKJ9zYJtqBKkTLnI7HJ9m3aIzwSQgLtsplYoBOIpeaZIPD06toPVkejs31ZRK
 aD1y0OKuiAVZKSktnhlcK8StgDqNmoyppGkA2RdOykdohOaWKL/HJ7H6zraT5yhuWorV
 4qdScU3TI6Lwq42fK7b+cku9YY/HJUmYq45azEbq1lJxUrEzLrzofXirVGD440zlarrW
 KjVlXtLhxGqrTeXArgRJTdTPCl920ocu5AaeOGBXnoUdzyEwwqQnib1gQJ4QrMI9c6LL
 suY46ZjaBXkFett3b17hrJhxYzB3xFgl2KHqUk5hZ2G/AF7OBvGYNe4gIiLUmYD1jh63
 nnsA==
X-Gm-Message-State: ACrzQf0L2vP3K+CS0oMN+DBbB4kNn0WwQJN/RoPyQVHq9hkMblnVLeiO
 cZrxqEcV5CRqxgipp/Jq9cZW5qWqe8ArXdhF4MCqJXtdj897gt90wEbzjLSspHEumq+t6MITw5x
 H2yOhiicuMwDsd7E=
X-Received: by 2002:a05:600c:5398:b0:3c3:dccf:2362 with SMTP id
 hg24-20020a05600c539800b003c3dccf2362mr772378wmb.89.1665526822114; 
 Tue, 11 Oct 2022 15:20:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM54wOj//MiQEisE+SI5/Y98QnLVSoW7tEMuslXUPLCXY2FWlK9Zeu8jC5mn494gW6g8lMP4ZA==
X-Received: by 2002:a05:600c:5398:b0:3c3:dccf:2362 with SMTP id
 hg24-20020a05600c539800b003c3dccf2362mr772362wmb.89.1665526821881; 
 Tue, 11 Oct 2022 15:20:21 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 s13-20020adfdb0d000000b002302dc43d77sm6770490wri.115.2022.10.11.15.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 15:20:21 -0700 (PDT)
Date: Tue, 11 Oct 2022 18:20:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: jonathan.cameron@huawei.com, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, alison.schofield@intel.com,
 dave@stgolabs.net, a.manzanares@samsung.com, bwidawsk@kernel.org,
 gregory.price@memverge.com, hchkuo@avery-design.com.tw,
 cbrowy@avery-design.com, ira.weiny@intel.com
Subject: Re: [PATCH 0/5] Multi-Region and Volatile Memory support for CXL
 Type-3 Devices
Message-ID: <20221011181936-mutt-send-email-mst@kernel.org>
References: <20221007152156.24883-1-Jonathan.Cameron@huawei.com>
 <20221011211916.117552-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221011211916.117552-1-gregory.price@memverge.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 11, 2022 at 05:19:11PM -0400, Gregory Price wrote:
> Summary of Changes:
> 1) Correction of PCI_CLASS from STORAGE_EXPRESS to MEMORY_CXL on init
> 2) Add CXL_CAPACITY_MULTIPLIER definition to replace magic numbers
> 3) Refactor CDAT DSMAS Initialization for multi-region initialization
> 4) Multi-Region and Volatile Memory support for CXL Type-3 Devices
> 5) Test and Documentation updates
> 
> Developed with input from Jonathan Cameron and Davidloh Bueso.
> 
> This series brings 2 features to CXL Type-3 Devices:
>     1) Volatile Memory Region support
>     2) Multi-Region support (1 Volatile, 1 Persistent)
> 
> In this series we implement multi-region and volatile region support
> through 6 major changes to CXL devices
>     1) The HostMemoryBackend [hostmem] has been replaced by two
>        [hostvmem] and [hostpmem] to store volatile and persistent memory
>        respectively
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
> 
> CXL Spec (3.0) Section 8.2.9.8.2.0 - Get Partition Info
>   Active Volatile Memory
>     The device shall provide this volatile capacity starting at DPA 0
>   Active Persistent Memory
>     The device shall provide this persistent capacity starting at the
>     DPA immediately following the volatile capacity
> 
> Partitioning of Persistent Memory regions may be supported on following
> patch sets.
> 
> Submitted as an extention to the CDAT emulation because the CDAT DSMAS
> entry concerns memory mapping and is required to successfully map memory
> regions correctly in bios/efi.

As there will be v8 of CDAT patches I expect there will be a rebase
of this patchset too.

> Gregory Price (5):
>   hw/cxl: set cxl-type3 device type to PCI_CLASS_MEMORY_CXL
>   hw/cxl: Add CXL_CAPACITY_MULTIPLIER definition
>   hw/mem/cxl_type: Generalize CDATDsmas initialization for Memory
>     Regions
>   hw/cxl: Multi-Region CXL Type-3 Devices (Volatile and Persistent)
>   cxl: update tests and documentation for new cxl properties
> 
>  docs/system/devices/cxl.rst |  53 ++++-
>  hw/cxl/cxl-mailbox-utils.c  |  23 +-
>  hw/mem/cxl_type3.c          | 449 +++++++++++++++++++++++-------------
>  include/hw/cxl/cxl_device.h |  11 +-
>  tests/qtest/cxl-test.c      |  81 ++++++-
>  5 files changed, 416 insertions(+), 201 deletions(-)
> 
> -- 
> 2.37.3


