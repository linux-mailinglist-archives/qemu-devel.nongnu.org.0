Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095C1425053
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:48:50 +0200 (CEST)
Received: from localhost ([::1]:52438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQ1B-0006rQ-2S
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYPxY-00046S-9Y
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:45:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mYPxW-0002lp-OV
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:45:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ+w+xZmuWyVT22Ibz0IJ05eFaWqMnSz+pdsdeo6N2o=;
 b=ZQYonlKJ1xGrQDwmHbAm0KZXEB3IEdRpk+zevZnRg11zXE61/4GU2P25zQf7YvRNr2NwyY
 w32ZdF012VmCaWEXe9e55RNXO5KTl8ik7XTM7ploQJPafIQEUfE1feuppPY6o2uXUMMwbP
 8ttxrO0RXwE9zI8MfkTeN3FuRcjypYw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-W7MefLKAPKq0LWzyr5ZEEg-1; Thu, 07 Oct 2021 05:44:54 -0400
X-MC-Unique: W7MefLKAPKq0LWzyr5ZEEg-1
Received: by mail-wr1-f71.google.com with SMTP id
 r16-20020adfbb10000000b00160958ed8acso4215914wrg.16
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=AJ+w+xZmuWyVT22Ibz0IJ05eFaWqMnSz+pdsdeo6N2o=;
 b=FZ9Nqoh5eBdBT6XPm1AoIkdDFebi8prJLhE6PJZfnGpO3SSdx5NHRXvTgZ8hR2J/df
 zpCzd3m9BhSyWoAH/q5jCxkw6xMh6QN8zN52nOWj4ST4uwMtHQE8jXpaetJdYOqQ9Q/p
 vG9L+RDoz9obl9RSZkKsoGp/HucPYDSL3MZowfaIpJAcaWgLQ+953/OgUtR2iBBvUjKL
 pBN7Bi1HrVPo9HnYlDaiRWSkwR1WYWE0Ittt161QLkT4AZI2H8kgobLCkPy1xuG3B99h
 r5p5HPi/mSxbP6B8p/DYDhLcwbgGEUJLdf7tLjIz4W+l2qo2Eck9h4U8wy4ilF+xUH13
 hxhg==
X-Gm-Message-State: AOAM532+/yYBY1p6NS5K93MuQDDZMOJOt6f9R6uQaz3L6wAbLeON+0lM
 twMN5DWv4oOuj+ACzRwSD1L2p+742Dpi+HKU0t9ttlSc4UqLJhTY843xuSJba44cgbpnHwCQJu3
 XQqazYK6DoTisvvM=
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr2349050wry.361.1633599892902; 
 Thu, 07 Oct 2021 02:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx/wgo5wFSWvtOIe54EYu22i1vDpzzxR/0q9lsC3WWwa1rSaekIViRPvoNxnNK6bk+DZLIqsg==
X-Received: by 2002:a05:6000:15c9:: with SMTP id
 y9mr2349026wry.361.1633599892727; 
 Thu, 07 Oct 2021 02:44:52 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v16sm1945569wrq.39.2021.10.07.02.44.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:44:52 -0700 (PDT)
Message-ID: <0656624b-7d8d-dffa-a8af-91dee72952b1@redhat.com>
Date: Thu, 7 Oct 2021 11:44:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] MAINTAINERS: Add myself as reviewer of the 'Memory API'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211007091949.319404-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20211007091949.319404-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.05, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/10/21 11:19, Philippe Mathieu-Daudé wrote:
> Having developed interest with the Memory API,
> volunteer to review the patches.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 50435b8d2f5..32b668e92fc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2502,6 +2502,7 @@ Memory API
>   M: Paolo Bonzini <pbonzini@redhat.com>
>   M: Peter Xu <peterx@redhat.com>
>   M: David Hildenbrand <david@redhat.com>
> +R: Philippe Mathieu-Daudé <philmd@redhat.com>
>   S: Supported
>   F: include/exec/ioport.h
>   F: include/exec/memop.h
> 

Queued, thanks.


