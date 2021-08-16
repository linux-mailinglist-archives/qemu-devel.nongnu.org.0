Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34213EDEEA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:02:28 +0200 (CEST)
Received: from localhost ([::1]:43454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjkZ-0007FV-QL
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:02:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFjam-0001CE-1M
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:52:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mFjai-0003PJ-QN
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 16:52:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629147134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nfgbyFPaAzJcSHWgnvNt2e2J+38+Wn3Ek9DJ021Nj9M=;
 b=T9BBlc1DZLaYcxL+kbrOhclzW4IT7tlSOZ7BI7uwNB0j9vs2dsEssYk1Vl1uKZiXEe/r7C
 VC9Zzemi+gpXR6Anu08RZZ49zyt+W/qm6r4YKREpbU+YVyFzaARpY3wkSKkG0IYV3VKUjY
 8nXCGfj0hQmVIWPCB+myWt7rwk8RzW0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-565-pomWE_ygNvOH-OERRPoJEg-1; Mon, 16 Aug 2021 16:52:13 -0400
X-MC-Unique: pomWE_ygNvOH-OERRPoJEg-1
Received: by mail-qt1-f199.google.com with SMTP id
 l24-20020ac84a98000000b00298c09593afso2015264qtq.22
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 13:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nfgbyFPaAzJcSHWgnvNt2e2J+38+Wn3Ek9DJ021Nj9M=;
 b=EG6vK9lzYp6kRtf7Wf9lsyd0ZntSBtP97+KzanzTiD4xze3R+UTE/0kit6nQb+6fg9
 w08KIAkWHskun8C9N0vjR2TF34sBCrdQVdtkNjH+l+y5l5TdiyYzorS4AxYOmm6ZGblg
 zJsMKIGDJTzvlByqQlpSe2ia464oSgWt58QI3boVq8I5biC2s6+orQqE1oB+8kdsxVdE
 4HD+Ay80CBqdA0NuykGQZr5rQdrlEv+SYEhOIv/2BBczVdyaosmFU7hWEX/7WWJBvito
 dWZmSnQL7rQfUpgDsJQ8AvjaVFdyyP0ZATEp517Ur1qi3sQCMENkjJgBurtk1ZF213sp
 PCrA==
X-Gm-Message-State: AOAM533U9gcd5OwwCAXqWjtLoi4/f71DdiCwGOk9/6WnCLH6RZJ5dwkN
 hp4rx6FI8ysNH3o6kEakjnchY2WWMVMnzWsC8Q4r19BU9w3iYDjIjD0XLCVd19fb//3GCdJKG7c
 qQU2u3JAgWRTxOls=
X-Received: by 2002:a37:e406:: with SMTP id y6mr267951qkf.248.1629147132906;
 Mon, 16 Aug 2021 13:52:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw6L/08eqF6wx8iJ8YjdsVKsd/p/WaY0guoDMEXJagmd761Z5TGEhC29vBD23jSDVUFZL7Aqg==
X-Received: by 2002:a37:e406:: with SMTP id y6mr267931qkf.248.1629147132654;
 Mon, 16 Aug 2021 13:52:12 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id y67sm9354qkd.58.2021.08.16.13.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 13:52:12 -0700 (PDT)
Date: Mon, 16 Aug 2021 16:52:10 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH-for-6.1 v2] softmmu/physmem: fix wrong assertion in
 qemu_ram_alloc_internal()
Message-ID: <YRrP+tDsIyL3MaWO@t490s>
References: <20210805092350.31195-1-david@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210805092350.31195-1-david@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 11:23:50AM +0200, David Hildenbrand wrote:
> When adding RAM_NORESERVE, we forgot to remove the old assertion when
> adding the updated one, most probably when reworking the patches or
> rebasing. We can easily crash QEMU by adding
>   -object memory-backend-ram,id=mem0,size=500G,reserve=off
> to the QEMU cmdline:
>   qemu-system-x86_64: ../softmmu/physmem.c:2146: qemu_ram_alloc_internal:
>   Assertion `(ram_flags & ~(RAM_SHARED | RAM_RESIZEABLE | RAM_PREALLOC))
>   == 0' failed.
> 
> Fix it by removing the old assertion.
> 
> Fixes: 8dbe22c6868b ("memory: Introduce RAM_NORESERVE and wire it up in qemu_ram_mmap()")
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
> 
> v1 -> v2:
> - Added rbs
> - Tagged for 6.1 inclusion
> 
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
> -- 
> 2.31.1
> 

Today I just noticed this patch is still missing for 6.1. How many users are
there with reserve=off?  Would it be worth rc4 or not?

-- 
Peter Xu


