Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D82401B38
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 14:29:38 +0200 (CEST)
Received: from localhost ([::1]:55690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNDkn-0002ZX-09
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 08:29:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNDjB-0001SZ-5T
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mNDhD-00012W-CM
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 08:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630931152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qdR2xbRj4VqzaCSz8E/O96zK/L3Jz0A73ySsrzdYY60=;
 b=WBVAtqDBeLMkKq+Pzfu43OcYEBeG9qgFeFlXPlhCyyM+kyL3UL0ujIH98T91FOyTuG+fUQ
 bH4YmhSxwCwqZAROglDZZ0lLJZ/SZwy87+aiRXLOtWlQjGlSLNsFXn0fhR8Z0XjZSGgvDJ
 IfyDj1UxOgRgqTdi/bU6PQ+73ezoNps=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-2tRs1cWePaSBmrdnxzcauw-1; Mon, 06 Sep 2021 08:25:51 -0400
X-MC-Unique: 2tRs1cWePaSBmrdnxzcauw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r17-20020adfda510000b02901526f76d738so1170656wrl.0
 for <qemu-devel@nongnu.org>; Mon, 06 Sep 2021 05:25:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qdR2xbRj4VqzaCSz8E/O96zK/L3Jz0A73ySsrzdYY60=;
 b=aeSBhoygNHskKMha2i2ghCmUu9drOupK+KLfoUZLRvvFA58NinZhSfRudf94yrucjx
 h2gKKemKnzljq0LrmFXuOxH4zdhzGO3T1VgvkvQVUn89Lqn6KkAWxsWKm21BnLcGt5Ld
 uVCEcLSjS7leMlT/9rFeoXiIFJsI5G1gIZda0B+OdjvCiNwWumQ4jTe6xkA3TkKwNM1K
 aN7GvZaXQwThNGLCyg1Cs39B7DvwuiNfs5WClee4E81WbvfsIzopjaVUvu7hvcFYWKM+
 HB0l2sTYIHxo46pjmOLTTIGyqOAJHDvYmqRoizYBgQrgh7N1uRS7wi3UsvZ3h/4jMmib
 FqaA==
X-Gm-Message-State: AOAM530h7RK11eyMA69sqT9NDswoSXAs4GT4JhQe5gasQVUjwNCA6iVv
 B5P3aT9yRZBwzbIxwoo8Udd3HkBvQ/GgzAQYSyiDyLazDpck70ZfbInhOpLCeQNAMFBIGmEVfI0
 ZU5paPBh5msWqAfzgD97upde6tbeoE9mzhJEjH4fIgF/JLAfnagSeTajMe1xfZ9g=
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr12690715wrz.369.1630931150189; 
 Mon, 06 Sep 2021 05:25:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMyP+taC4esGgk6nlc8RRXDFqVrlrC6PHHkYNfD0BhsUO76OMv4syAQzGu3cdVgKPyq0rOnA==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr12690692wrz.369.1630931149940; 
 Mon, 06 Sep 2021 05:25:49 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6323.dip0.t-ipconnect.de. [91.12.99.35])
 by smtp.gmail.com with ESMTPSA id
 17sm6973161wmj.20.2021.09.06.05.25.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Sep 2021 05:25:49 -0700 (PDT)
Subject: Re: [PATCH] docs/devel: memory: Document MemoryRegionOps requirement
To: Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Xu <peterx@redhat.com>
References: <20210906122020.5793-1-bmeng.cn@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5ca64439-7d68-e7d4-975c-429a9e744825@redhat.com>
Date: Mon, 6 Sep 2021 14:25:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210906122020.5793-1-bmeng.cn@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.09.21 14:20, Bin Meng wrote:
> It's been a requirement that at least one function pointer for read
> and one for write are provided ever since the MemoryRegion APIs were
> introduced in 2012.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
>   docs/devel/memory.rst | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/docs/devel/memory.rst b/docs/devel/memory.rst
> index 5dc8a12682..7b589b21d2 100644
> --- a/docs/devel/memory.rst
> +++ b/docs/devel/memory.rst
> @@ -344,6 +344,11 @@ based on the attributes used for the memory transaction, or need
>   to be able to respond that the access should provoke a bus error
>   rather than completing successfully; those devices can use the
>   ->read_with_attrs() and ->write_with_attrs() callbacks instead.
> +The requirement for a device's MemoryRegionOps is that at least
> +one callback for read and one for write are provided. If both
> +->read() and ->read_with_attrs() are provided, the plain ->read()
> +version takes precedence over the with_attrs() version. So does
> +the write callback.

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


