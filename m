Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96E3DDC6B
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 17:27:41 +0200 (CEST)
Received: from localhost ([::1]:57344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAZqu-0007dr-G7
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 11:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAZpQ-0006sT-S1
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:26:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mAZpP-0004C7-7l
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 11:26:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627917966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GIe8Qj693MWlLj8KmdL/MUqBpn0P6W+duj616GAHpao=;
 b=NP8DqHNtHQK0AQ/x7L6hiQiQdtecyiSa6FCsI9jF0Sp1w8hH/q3IaUub2Yqf/WWsBpV6Nv
 qpC/pzUW4zeSW0s8SxT2Y+GppJ8rqMaoUxRIXJwPN5nWtPrwVcQE8WfkUtzUX8UsyjylzZ
 1LTVdQPSrLqh0nzXpU9+qwPvzlEEraM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-WgBrtUXCMSyRVh6mbWDeCg-1; Mon, 02 Aug 2021 11:26:05 -0400
X-MC-Unique: WgBrtUXCMSyRVh6mbWDeCg-1
Received: by mail-wm1-f72.google.com with SMTP id
 o32-20020a05600c5120b0290225ef65c35dso5177592wms.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 08:26:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GIe8Qj693MWlLj8KmdL/MUqBpn0P6W+duj616GAHpao=;
 b=MFsFWH3wlaKQtVjXVW56d5TpvrAxB8jpHpWzEIzcmV6lrM5aCPbYgzqzX/VtUU78c5
 CHl4j58eqhiN/l8UWVRkoVbw8c9D3jwl5buDYU43NYo6XrUFr+YBW7+f9DhXdSQzlHAB
 LvRPlPl8l/uy2FXjS3f9jgH0x0ImvWUFYmKuzdbLVm8glHy6GpPSSocPr2A99en13Scj
 xxrVz1ius4AZci57qDxqcggnXfuwZoMQZzBsNMTrzStZpanT8/NKqyJdL//D7cZupAl2
 eukdSLfbbK4hgOY9kPve0cK7AlKHjxKtPdAwMPeW0B6GRcNlgpxePfcD2YdKJM1vtIYG
 IY9A==
X-Gm-Message-State: AOAM533DpRCYoWJNtcqHBfm659GYjQnilBsoD4jcS4SvD+VlUdnzOu61
 2IkLSaIliDET68AHNBqYpByHgBjlClZSE9kIqvjXzYYffOS2i4Vk49GR3PSdqRm6RYzoqHB8VQp
 B50/E0cIZI7AQFBk=
X-Received: by 2002:a1c:188:: with SMTP id 130mr17819995wmb.122.1627917964044; 
 Mon, 02 Aug 2021 08:26:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyTwmYknr+4s/bnCp7HEDHVdaZW5LarcohYo89EnrwuY66Xyuwg50Rln9hbofS0ouNKEM4/w==
X-Received: by 2002:a1c:188:: with SMTP id 130mr17819980wmb.122.1627917963872; 
 Mon, 02 Aug 2021 08:26:03 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id v6sm11564669wru.50.2021.08.02.08.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 08:26:03 -0700 (PDT)
Subject: Re: [PATCH v1] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20210802152238.10783-1-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4fb72846-d3ab-9488-a755-de9c6e4cf47c@redhat.com>
Date: Mon, 2 Aug 2021 17:26:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210802152238.10783-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/2/21 5:22 PM, David Hildenbrand wrote:
> When adding RAM_NORESERVE, we forgot to remove the old assertion when
> adding the updated one, most probably when reworking the patches or
> rebasing. We can easily crash QEMU by adding
>   -object memory-backend-ram,id=mem0,size=500G,reserve=off
> to the QEMU cmdline:
>   qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>   Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>   == 0' failed.

Oops.

> Fix it by removing the old assertion.
> 
> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  softmmu/physmem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3c1912a1a0..2e18947598 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2143,7 +2143,6 @@ RAMBlock *qemu_ram_alloc_internal(ram_addr_t size, ram_addr_t max_size,
>      RAMBlock *new_block;
>      Error *local_err = NULL;
>  
> -    assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC)) == 0);
>      assert((ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC |
>                            RAM_NORESERVE)) == 0);
>      assert(!host ^ (ram_flags & RAM_PREALLOC));
> 


