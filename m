Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA6634091A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:43:48 +0100 (CET)
Received: from localhost ([::1]:54856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuoN-0007PZ-KQ
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:43:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMukM-0004wt-Q8
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:39:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:46619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMukI-0004qM-Bk
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 11:39:35 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so3627454wmf.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 08:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=trxLBi+uUEHnyOiFt/O7VB4TGyvOMkeURqT3UCXFhmQ=;
 b=Z7Z3iQr7IIZSsdqVsLjy1+WQgxE/6ZzHKLVVRGsMSxrB50hAUx2ERxyGuJuUhUlkYW
 vHsdLbU2yXwMwWgQEBr7d32jV4XOtKYGeXRhU/sP+40NswSlxIIQlDofncdrryQQr+N8
 +D5KhjRq32Hn2WkxFgdZZNvnzmr1MGTMks4gG7qaGJAu2zTePgRhTP1hTN7r8/gLhxxj
 3m2ceZNxLHoDMW6l5WKK0/A1v4nPLrdDVTnE03/g6t2kweZxlAERuc0Cl4FG84r9Wcqp
 hwX8wF55Pyu63v2JzlMEHK8q/qymFumkZ0cjY9d8jTP/n+onhWOmZ2UWpY238+gm6AQE
 O/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=trxLBi+uUEHnyOiFt/O7VB4TGyvOMkeURqT3UCXFhmQ=;
 b=jlRvKN+p8LBwaFjDaPv840FWlpjXjzdsWbLGbUY3ww+bMzHy6sgfECArDGnuoJ1fNu
 cWVRobdL8vSTzAm25AxxSC18lVYE8SuVkRwHrBntL6vI3xahbbXv41oha7NRXvpOuT4p
 Xnr+QTA8o8RT+R9bspAyAZrtbKHGDnVPa0FkMElGhzUiN2lCYc7qn/Ih6xryQfzP32r6
 0aZ68TIjk+7U4z7CTp7p/KPby18f+1kIg6WArI4DWgF6Ya/evx/nc7PrAtSKiOQTTJVf
 +OlJA9BqVvzxcwynkbTYyKQlmWhkUm9Ke9Saj5mwipMPt3tqtrFUfUFxQ3rJ63D7ey2N
 Tm5A==
X-Gm-Message-State: AOAM531w9hfBCJtHs9GvVN87qeH9dUQUsQR1DnrV5jc0MjXQosXJ0FQl
 wrWs+jIl1GXflrVMqmUVEos=
X-Google-Smtp-Source: ABdhPJxxrHVmUolQegAe2LS5y0DLAWhDToKxxcPEl+1IwHMPtg9bPeXQtHiKVNYA33Hih0DLZcNLQQ==
X-Received: by 2002:a1c:ba88:: with SMTP id k130mr4316816wmf.42.1616081972862; 
 Thu, 18 Mar 2021 08:39:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id g16sm3593795wrs.76.2021.03.18.08.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 08:39:32 -0700 (PDT)
Subject: Re: [PATCH] memory: Display MemoryRegion name in read/write ops trace
 events
To: qemu-devel@nongnu.org
References: <20210307074833.143106-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8892fbd6-a63c-ef02-78f3-935e4f95dbb1@amsat.org>
Date: Thu, 18 Mar 2021 16:39:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210307074833.143106-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping?

On 3/7/21 8:48 AM, Philippe Mathieu-Daudé wrote:
> MemoryRegion names is cached on first call to memory_region_name(),
> so displaying the name is trace events is cheap. Add it for read /
> write ops.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  softmmu/memory.c     | 12 ++++++++----
>  softmmu/trace-events |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 874a8fccdee..d4d9ab8828e 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -444,7 +444,8 @@ static MemTxResult  memory_region_read_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                     memory_region_name(mr));
>      }
>      memory_region_shift_read_access(value, shift, mask, tmp);
>      return MEMTX_OK;
> @@ -466,7 +467,8 @@ static MemTxResult memory_region_read_with_attrs_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_read(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_READ)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_read(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                     memory_region_name(mr));
>      }
>      memory_region_shift_read_access(value, shift, mask, tmp);
>      return r;
> @@ -486,7 +488,8 @@ static MemTxResult memory_region_write_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                      memory_region_name(mr));
>      }
>      mr->ops->write(mr->opaque, addr, tmp, size);
>      return MEMTX_OK;
> @@ -506,7 +509,8 @@ static MemTxResult memory_region_write_with_attrs_accessor(MemoryRegion *mr,
>          trace_memory_region_subpage_write(get_cpu_index(), mr, addr, tmp, size);
>      } else if (trace_event_get_state_backends(TRACE_MEMORY_REGION_OPS_WRITE)) {
>          hwaddr abs_addr = memory_region_to_absolute_addr(mr, addr);
> -        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size);
> +        trace_memory_region_ops_write(get_cpu_index(), mr, abs_addr, tmp, size,
> +                                      memory_region_name(mr));
>      }
>      return mr->ops->write_with_attrs(mr->opaque, addr, tmp, size, attrs);
>  }
> diff --git a/softmmu/trace-events b/softmmu/trace-events
> index b80ca042e1f..359fb37cc8d 100644
> --- a/softmmu/trace-events
> +++ b/softmmu/trace-events
> @@ -9,8 +9,8 @@ cpu_in(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>  cpu_out(unsigned int addr, char size, unsigned int val) "addr 0x%x(%c) value %u"
>  
>  # memory.c
> -memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> -memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> +memory_region_ops_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
> +memory_region_ops_write(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size, const char *name) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u name '%s'"
>  memory_region_subpage_read(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_subpage_write(int cpu_index, void *mr, uint64_t offset, uint64_t value, unsigned size) "cpu %d mr %p offset 0x%"PRIx64" value 0x%"PRIx64" size %u"
>  memory_region_ram_device_read(int cpu_index, void *mr, uint64_t addr, uint64_t value, unsigned size) "cpu %d mr %p addr 0x%"PRIx64" value 0x%"PRIx64" size %u"
> 

