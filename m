Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CF3478CFD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 15:02:28 +0100 (CET)
Received: from localhost ([::1]:38706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myDoY-0000ST-Fo
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 09:02:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDks-00063y-Kg
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:58:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myDko-00024O-JT
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 08:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639749513;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HWa153A1Sh2M4GTKtf7tfGjwOaoq3uilZzw6GI+LKD0=;
 b=CnCd4NOG91XVQ991XpOraO/fWjnV1wPKhz63FjYHDCObg+gV393ydMju+1d8v6seolzjkK
 6TYtUbmAHcY/j0lVV4VZmsUACOsrUfssH6EtTfNxcgeztSb6z4plL8zjPCDgJ//9EdTVzf
 ilZh/+Zdpix+yhs2FccuYT58IrIqmNk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-uIl8YnXPPWm3-yW4dA3lqQ-1; Fri, 17 Dec 2021 08:58:30 -0500
X-MC-Unique: uIl8YnXPPWm3-yW4dA3lqQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso2982093wms.4
 for <qemu-devel@nongnu.org>; Fri, 17 Dec 2021 05:58:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HWa153A1Sh2M4GTKtf7tfGjwOaoq3uilZzw6GI+LKD0=;
 b=tw2yeR1/iNapp6BWv7cN62ct9hv87q3jAhiPi2hr/drxpRjlQuOp+eQmv+8zQ2MUVL
 9ZN3Ig4WgRDla0V97yHfNc8DVtW3B5JvhMVwJAHgRC27wzATgImDWykcor/ZxJe1tlZl
 RCQgnzdjd/lV5imJfriQpB3KIMO7DCdit6FcmYpsuCf2fcTnEJrSB9ITO6BEqG8v5yGB
 I+Qh3Soj9NcAcuYT5/TKQSb8ENKvEwFFN4niHFhBufG+gJFnY97KzXCoUfkyz9FZT+MU
 ntOAG8bFd/lVwpZG+T7aKUC8JgrrcXRPYBXC8BMcmEvkbpjxCG0pFYAQyBEkCznNMg8O
 xFww==
X-Gm-Message-State: AOAM532CY9meNdMyfZfIoDiMuxjDWhf/pt9iUR336efbrk7xELTgHMQo
 25ALCCUO+CGPhk8AydimRax/onjq3170B5Oda7AQYpiAT0bqXdzLM25AWiTdOaOHfXOzSA/Adt9
 Ec74JIxN8Q2iF1hU=
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2618439wre.469.1639749509077; 
 Fri, 17 Dec 2021 05:58:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzsuVOlKfjmx62XdIt8efGhUsdyvPxYlOJ/PuY6nkF26mmp+cmoflLvUlS5CszsBURVjYkUrQ==
X-Received: by 2002:adf:9e49:: with SMTP id v9mr2618406wre.469.1639749508856; 
 Fri, 17 Dec 2021 05:58:28 -0800 (PST)
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id w25sm7609509wmk.20.2021.12.17.05.58.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 05:58:28 -0800 (PST)
Message-ID: <380ea0e5-a006-c570-4ec8-d67e837547ee@redhat.com>
Date: Fri, 17 Dec 2021 14:58:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] memory: Fix dma-reentrancy issues at the MMIO level
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
References: <20211217030858.834822-1-alxndr@bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211217030858.834822-1-alxndr@bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.716, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mauro Matteo Cascella <mcascell@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Li Qiang <liq3ea@gmail.com>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Peter Xu <peterx@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Darren Kenny <darren.kenny@oracle.com>,
 Bandan Das <bsd@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/17/21 04:08, Alexander Bulekov wrote:
> Here's my shot at fixing dma-reentracy issues. This patch adds a flag to
> the DeviceState, which is set/checked when we call an accessor
> associated with the device's IO MRs.

Your approach is exactly what Gerd suggested:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg831437.html

> The problem, in short, as I understand it: For the vast majority of
> cases, we want to prevent a device from accessing it's own PIO/MMIO
> regions over DMA.
> 
> This patch/solution is based on some assumptions:
> 1. DMA accesses that hit mmio regions are only dangerous if they end up
> interacting with memory-regions belonging to the device initiating the
> DMA.
> Not dangerous:  sdhci_pio->dma_write->e1000_mmio
> Dangerous:      sdhci_pio->dma_write->sdhci_mmio

It doesn't have to be dangerous, see Paolo's example which
invalidated my previous attempt and forced me to write 24
patches in multiples series to keep the "niche" cases working:
https://www.mail-archive.com/qemu-block@nongnu.org/msg72939.html

> 
> 2. Most devices do not interact with their own PIO/MMIO memory-regions
> using DMA.
> 
> 3. There is no way for there to be multiple simultaneous accesses to a
> device's PIO/MMIO memory-regions.
> 
> 4. All devices are QOMified :-)
> 
> With this patch, I wasn't able to reproduce the issues being tracked
> here, with QTest reproducers:
> https://gitlab.com/qemu-project/qemu/-/issues/556
> 
> This passes the i386 qos/qtests for me and I was able to boot some linux/windows
> VMs with basic devices configured, without any apparent problems.
> 
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Mauro Matteo Cascella <mcascell@redhat.com>
> Cc: Qiuhao Li <Qiuhao.Li@outlook.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Li Qiang <liq3ea@gmail.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Laurent Vivier <lvivier@redhat.com>
> Cc: Bandan Das <bsd@redhat.com>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Cc: Darren Kenny <darren.kenny@oracle.com>
> Cc: Bin Meng <bin.meng@windriver.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Stefan Hajnoczi <stefanha@redhat.com>
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> ---
>  include/hw/qdev-core.h |  1 +
>  softmmu/memory.c       | 15 +++++++++++++++
>  softmmu/trace-events   |  1 +
>  3 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 20d3066595..32f7c779ab 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -193,6 +193,7 @@ struct DeviceState {
>      int instance_id_alias;
>      int alias_required_for_version;
>      ResettableState reset;
> +    int engaged_in_direct_io;
>  };
>  
>  struct DeviceListener {
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7340e19ff5..255c3c602f 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -532,6 +532,7 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>      uint64_t access_mask;
>      unsigned access_size;
>      unsigned i;
> +    DeviceState *dev = NULL;
>      MemTxResult r = MEMTX_OK;
>  
>      if (!access_size_min) {
> @@ -541,6 +542,17 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>          access_size_max = 4;
>      }
>  
> +    /* Do not allow more than one simultanous access to a device's IO Regions */
> +    if (mr->owner &&
> +        !mr->ram_device && !mr->ram && !mr->rom_device && !mr->readonly) {
> +        dev = (DeviceState *) object_dynamic_cast(mr->owner, TYPE_DEVICE);
> +        if (dev->engaged_in_direct_io) {
> +            trace_memory_region_reentrant_io(get_cpu_index(), mr, addr, size);
> +            return MEMTX_ERROR;
> +        }
> +        dev->engaged_in_direct_io = true;
> +    }
> +
>      /* FIXME: support unaligned access? */
>      access_size = MAX(MIN(size, access_size_max), access_size_min);
>      access_mask = MAKE_64BIT_MASK(0, access_size * 8);
> @@ -555,6 +567,9 @@ static MemTxResult access_with_adjusted_size(hwaddr addr,
>                          access_mask, attrs);
>          }
>      }
> +    if (dev) {
> +        dev->engaged_in_direct_io = false;
> +    }
>      return r;
>  }
>  
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index 9c88887b3c..d7228316db 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -13,6 +13,7 @@ memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, u
>  memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_reentrant_io(int cpu_index, void *mr, uint64_t offset, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_sync_dirty(const char *mr, const char *listener, int global) "mr '%s' listener '%s' synced (global=%d)"
> 


