Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CFF60EA41
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 22:28:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onmtR-0006cD-Eg; Wed, 26 Oct 2022 16:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmtP-0006bm-34
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:20:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1onmtN-0003vO-EF
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 16:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666815648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iMK9jr9zoAfLQlG2jo7i7WIctUibwX1/9pxN9jjJW9I=;
 b=PPNqzb2uOdfOdjEYL7e5lrdaln7smz199GDMgLrvRs771A3O1ByIJ/9uYbldjMxoCHUZiu
 CtkwfE/vtXBjPWgXm5a/8E44Lrv/ByNkDjf4N2TdX1INH1EGqIr/Pqou/A3h+3IqiLrWJE
 SlByhMp7Lv7sM6ynm9tVD+96ezGYQwk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-235-Q7LybRIwO9m4aeQ2cRELAg-1; Wed, 26 Oct 2022 16:20:47 -0400
X-MC-Unique: Q7LybRIwO9m4aeQ2cRELAg-1
Received: by mail-wm1-f69.google.com with SMTP id
 i83-20020a1c3b56000000b003cf4ff1b917so153405wma.2
 for <qemu-devel@nongnu.org>; Wed, 26 Oct 2022 13:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iMK9jr9zoAfLQlG2jo7i7WIctUibwX1/9pxN9jjJW9I=;
 b=dEhniUq1PG7eHb/n4GjTftqOimc86MA8IUcS1IZ2ZtohzvZ0Tn+uAk5Nz1GBoU1l5U
 uADdgCVikyRjmOOjDVHvM6MAeaXQ/k+tW+pMV7fVHbs8ZaKDZQnr6+4on/ByfrxxLEk4
 /uDHoUtSkjg3cilFv3q7JATCKmUBsB25aSdOeqAMHN8+ghOooyUvx0+MQS+S+/zDBnKW
 x+OhaZx+vcd0Nz3r9i3mQeZVk0yIj/2Goy15EnP7M47nrAQCPiBvSaqVinRXXGOGOtol
 qQTI6rXhicZdjtvtn807ug4tx3wHcCfqpONikVuBC7uAtTJ471a4w/d3fjxiiJ0Rj65d
 4Y5w==
X-Gm-Message-State: ACrzQf3lRbZ+nBUWHneDi9drOKTMgU9nHHPE6HaDdvwrMyKDFv7W6PfK
 /WDzVIKgC5OLtZK97ki51UEgAy2VLxRYXjRaNeocdfUCAWmFTNrCD90ZlIXMYB+8MMFhFMrq3KE
 COk8P1gkOqDZ1l9U=
X-Received: by 2002:a05:6000:1882:b0:230:9595:4131 with SMTP id
 a2-20020a056000188200b0023095954131mr30793982wri.17.1666815645753; 
 Wed, 26 Oct 2022 13:20:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6eHxrK+FeNK+3jt7r188S8PQKVbeNP7lC3PpzTCL3K4HydYehPuzJlOU6c/+K27YZdkuRp6Q==
X-Received: by 2002:a05:6000:1882:b0:230:9595:4131 with SMTP id
 a2-20020a056000188200b0023095954131mr30793962wri.17.1666815645511; 
 Wed, 26 Oct 2022 13:20:45 -0700 (PDT)
Received: from redhat.com ([2.52.15.7]) by smtp.gmail.com with ESMTPSA id
 q16-20020a05600c46d000b003c6f426467fsm2815080wmo.40.2022.10.26.13.20.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 13:20:44 -0700 (PDT)
Date: Wed, 26 Oct 2022 16:20:40 -0400
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
Message-ID: <20221026161815-mutt-send-email-mst@kernel.org>
References: <20221026004737.3646-1-gregory.price@memverge.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221026004737.3646-1-gregory.price@memverge.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
> 

I am not supposed to merge this patchset yet, right?
That branch has a bunch of patches not yet posted for review.
Pls add "RFC" in the subject when that is the case.

Thanks!


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


