Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A73F8645
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 13:19:52 +0200 (CEST)
Received: from localhost ([::1]:40528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJDQ4-0007xl-Hu
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 07:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDPI-0007HC-MJ
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:18:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32326)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mJDPF-0006Sx-Cl
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 07:18:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629976727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KtqkKinc5BBHuRvRZLIoBDIL9gVbSQYSxvVb+auc13A=;
 b=HTyOhnoCpE7J0JhujKfycM1XCEtDGPRTRY/YVmg5aWbW5BUApD5KamN4m/Z6PVr7spVmhr
 GNy8fXfMZTpW/zqek6yrGwSdHNYLumIug9C+2w9LheShv89CL3aZCboYx1Cpyfm6jTigja
 CXjbVSgs/6CAb5F0fkWWoj6E3gfHv78=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-oa3sg7oWOS6WUC9FVo2-rw-1; Thu, 26 Aug 2021 07:18:46 -0400
X-MC-Unique: oa3sg7oWOS6WUC9FVo2-rw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9A5C11026200;
 Thu, 26 Aug 2021 11:18:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B888A6B541;
 Thu, 26 Aug 2021 11:18:40 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5CC0418003AA; Thu, 26 Aug 2021 13:18:38 +0200 (CEST)
Date: Thu, 26 Aug 2021 13:18:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: isaku.yamahata@gmail.com
Subject: Re: [RFC PATCH v2 20/44] i386/tdx: Parse tdx metadata and store the
 result into TdxGuestState
Message-ID: <20210826111838.fgbp6v6gd5wzbnho@sirius.home.kraxel.org>
References: <cover.1625704980.git.isaku.yamahata@intel.com>
 <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acaf651389c3f407a9d6d0a2e943daf0a85bb5fc.1625704981.git.isaku.yamahata@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: isaku.yamahata@intel.com, cohuck@redhat.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mst@redhat.com, seanjc@google.com, alistair@alistair23.me,
 xiaoyao.li@intel.com, qemu-devel@nongnu.org,
 Sean Christopherson <sean.j.christopherson@intel.com>, mtosatti@redhat.com,
 "Min M . Xu" <min.m.xu@intel.com>, erdemaktas@google.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +        /*
> +         * If TDVF temp memory describe in TDVF metadata lays in RAM, reserve
> +         * the region property.
> +         */
> +        if (entry->address >= 4 * GiB + x86ms->above_4g_mem_size ||
> +            entry->address + entry->size >= 4 * GiB + x86ms->above_4g_mem_size) {
> +            error_report("TDVF type %u address 0x%" PRIx64 " size 0x%" PRIx64
> +                         " above high memory",
> +                         entry->type, entry->address, entry->size);
> +            exit(1);
> +        }

I think you can simply use dma_memory_map() API, then just work with
guest physical addresses and drop the messy and error-prone memory
region offset calculations.

> +    entry->mem_ptr = memory_region_get_ram_ptr(entry->mr);
> +    if (entry->data_len) {
> +        /*
> +         * The memory_region api doesn't allow partial file mapping, create
> +         * ram and copy the contents
> +         */
> +        if (lseek(fd, entry->data_offset, SEEK_SET) != entry->data_offset) {
> +            error_report("can't seek to 0x%x %s", entry->data_offset, filename);
> +            exit(1);
> +        }
> +        if (read(fd, entry->mem_ptr, entry->data_len) != entry->data_len) {
> +            error_report("can't read 0x%x %s", entry->data_len, filename);
> +            exit(1);
> +        }
> +    }

Wouldn't a simple rom_add_blob work here?

> +int load_tdvf(const char *filename)
> +{

> +    for_each_fw_entry(fw, entry) {
> +        if (entry->address < x86ms->below_4g_mem_size ||
> +            entry->address > 4 * GiB) {
> +            tdvf_init_ram_memory(ms, entry);
> +        } else {
> +            tdvf_init_bios_memory(fd, filename, entry);
> +        }
> +    }

Why there are two different ways to load the firmware?

Also: why is all this firmware volume parsing needed?  The normal ovmf
firmware can simply be mapped just below 4G, why can't tdvf work the
same way?

thanks,
  Gerd


