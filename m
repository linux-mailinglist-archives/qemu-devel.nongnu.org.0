Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D78354903C2
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:26:59 +0100 (CET)
Received: from localhost ([::1]:57676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NLt-0003IT-4i
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:26:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NIi-0001jp-DJ
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:23:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55658)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1n9NIb-0002aY-GX
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 03:23:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642407813;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEjJk4LK2sh0/lou2XhrvDelJc6JkYjtEXG/9ipxOrY=;
 b=V+8zM23hxq/knRlH29h/EAU62XTy0VsJ3KLAo6x4w1Q/HpPbTCVr6MRiS/CXa/RQyfHk0S
 QhvMQISv90py6P5jRAzkG/Iao44TLEowUFZsv4dAotzMmmIJYSCFDF7nUPTpC4uN+FUeZ0
 oy/WI+tVwBck3DYBqaV6/Llox0c4Tw4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-Aqe2lO9mOMGldSVPJFnAWw-1; Mon, 17 Jan 2022 03:23:31 -0500
X-MC-Unique: Aqe2lO9mOMGldSVPJFnAWw-1
Received: by mail-ed1-f69.google.com with SMTP id
 cf15-20020a0564020b8f00b0040284b671c6so2386613edb.22
 for <qemu-devel@nongnu.org>; Mon, 17 Jan 2022 00:23:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mEjJk4LK2sh0/lou2XhrvDelJc6JkYjtEXG/9ipxOrY=;
 b=hJdfzc208xIBGu2B2VrIM3CR9MIJqhTMz95nXpN8SsBHwfLQviofDDmiIKx3nVuWg2
 YCvllYduo7AOIvI9802nXdadDG7Bk5t3uWPif52iHGDpRhZs5Nc3zqAQE+pb91DDPa0a
 d+HnIauhcnarrQ80q2doeZ1XqISIszCs3Ww5pQQdzRuhwWSNtPHTa+Ao5rvtRiyYMoW2
 A2inB1JaNI4cSjw2+rf55MbA5ITx8y1XszUdtMwNCn3s4iKjcAbRc5dCcR/2SdA3TVhr
 LHih0RKGmDEvC82npYrVMFH86WEDdC+20k3nPzieSRx4qM1QX8NN+ZqdmpD0iBwdUFmG
 aRDQ==
X-Gm-Message-State: AOAM530NpdU3jHRtzK4P+NA2LVSP0U1WzVlTXhnNlkeQXJSEqRcrD4HX
 DV6y33SUsxtiATKpbcgbpAID87mmU6lP6r1t0oq9+MjZ9JgsiOawwScArYyRR1xfYsWE3ONwkDV
 ZaauP6yaFAVogIs4=
X-Received: by 2002:a17:907:6d8a:: with SMTP id
 sb10mr2031632ejc.86.1642407810576; 
 Mon, 17 Jan 2022 00:23:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVF5b+oFjczVlv+LDfOuCdDRTIl1cFgk2IsxqSoRtoP5xyvi0aepusGHYg8Xnjifu/AKKKdw==
X-Received: by 2002:a17:907:6d8a:: with SMTP id
 sb10mr2031623ejc.86.1642407810427; 
 Mon, 17 Jan 2022 00:23:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c705:dd00:68a1:1bd:6733:bde9?
 (p200300cbc705dd0068a101bd6733bde9.dip0.t-ipconnect.de.
 [2003:cb:c705:dd00:68a1:1bd:6733:bde9])
 by smtp.gmail.com with ESMTPSA id c4sm4505195edf.23.2022.01.17.00.23.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:23:29 -0800 (PST)
Message-ID: <b6c13230-4768-e61a-f7ff-7432242b1ce1@redhat.com>
Date: Mon, 17 Jan 2022 09:23:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/3] exec/memory: Extract address_space_set() from
 dma_memory_set()
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220115203725.3834712-1-laurent@vivier.eu>
 <20220115203725.3834712-2-laurent@vivier.eu>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220115203725.3834712-2-laurent@vivier.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Xu <peterx@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15.01.22 21:37, Laurent Vivier wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> dma_memory_set() does a DMA barrier, set the address space with
> a constant value. The constant value filling code is not specific
> to DMA and can be used for AddressSpace. Extract it as a new
> helper: address_space_set().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> [lv: rebase]
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  include/exec/memory.h | 16 ++++++++++++++++
>  softmmu/dma-helpers.c | 15 +--------------
>  softmmu/physmem.c     | 19 +++++++++++++++++++
>  3 files changed, 36 insertions(+), 14 deletions(-)
> 
> diff --git a/include/exec/memory.h b/include/exec/memory.h
> index 20f1b27377ea..c00c50943107 100644
> --- a/include/exec/memory.h
> +++ b/include/exec/memory.h
> @@ -2906,6 +2906,22 @@ address_space_write_cached(MemoryRegionCache *cache, hwaddr addr,
>      }
>  }
>  
> +/**
> + * address_space_set: Fill address space with a constant byte.

nit: Fill selected part of an address space with a constant byte.


:)

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


