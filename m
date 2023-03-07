Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E466ADC69
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 11:51:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZUuP-0007ZK-0o; Tue, 07 Mar 2023 05:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZUuN-0007Xy-11
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZUuL-0008CY-LF
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 05:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678186261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9XSHzaVtRzRoozowNTKE+1EZ0IZYYr1A5a29mBhM/FE=;
 b=RWBywfQVNAMk9t4/0iAc9yzpfcT4igdYfVLPpWWaEQApu6KDRjnq8/P2GCn+rjEGWCzGvk
 6eQUau2rH4zFd5GklKqIuRiy59AhknTr0a9i9x0NdOMLu5qdCPInnmZ/s5iaNtebCwVY1G
 bItyXO2GY86JrY+4cIwMetFw1KR5NMU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-QB2a1pL7ODSNNf791XuRDw-1; Tue, 07 Mar 2023 05:50:57 -0500
X-MC-Unique: QB2a1pL7ODSNNf791XuRDw-1
Received: by mail-wr1-f71.google.com with SMTP id
 q7-20020a05600000c700b002cd9188abe5so2098435wrx.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 02:50:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678186256;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9XSHzaVtRzRoozowNTKE+1EZ0IZYYr1A5a29mBhM/FE=;
 b=2sVWzvMWFvtlhA5HmYq11bkNGPxq1MQoHsyn/RS4SIqVuOQjfb7z176ODs2WUTDJ3h
 0EjpFkEzTBDL8XixddYRZ9kFGBbFbnOmLSZcRlfXb3qSkk7bI2kwKa3MQe+WN8FaDs7D
 aI4MsqFj10/s1W+wme18FwRQj7ShQxqVgzrIavaBhiKLUT5a/OnknUiR3DbRU13W8KOS
 krSVgpd+N7oh96AipNf/3K9hdYqGx60ar9CCnAuZ+NkIvKE0dCz1UYRe1P2AOBMQh9GV
 VSlTfHej6KocMbMok5kTY0KQhJIK92VuFuhAtSEI7y3S91Vxyew84D+jvf2Uk+/d7phc
 5Vzg==
X-Gm-Message-State: AO0yUKW4uSRCFuQBoHeY9Dowb2kkwBVKR9fxCrd+azRCusXt8DIdPQwl
 WDFnurlJ5K5jNrwByNbJor8PhgVuLt0Zt8NLQ+SljZa5s9jqoNe/DQDoOAmYYE1Y1uFws8cOSqM
 Q9PC2vz3ctUflwbE=
X-Received: by 2002:a5d:65cb:0:b0:2c5:5ec7:43bc with SMTP id
 e11-20020a5d65cb000000b002c55ec743bcmr12484733wrw.18.1678186256190; 
 Tue, 07 Mar 2023 02:50:56 -0800 (PST)
X-Google-Smtp-Source: AK7set8gqEp/sntML03sCP71EPYdDzDSX40WzwxNpw9tNsysdoUi6DUZcGGz5MS97Y7LSTzda/t7vw==
X-Received: by 2002:a5d:65cb:0:b0:2c5:5ec7:43bc with SMTP id
 e11-20020a5d65cb000000b002c55ec743bcmr12484719wrw.18.1678186255890; 
 Tue, 07 Mar 2023 02:50:55 -0800 (PST)
Received: from ?IPV6:2003:cb:c707:a100:e20:41da:c49b:8974?
 (p200300cbc707a1000e2041dac49b8974.dip0.t-ipconnect.de.
 [2003:cb:c707:a100:e20:41da:c49b:8974])
 by smtp.gmail.com with ESMTPSA id
 w12-20020a5d608c000000b002c552c6c8c2sm12347885wrt.87.2023.03.07.02.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 02:50:55 -0800 (PST)
Message-ID: <2b9359f1-c428-6ce8-d3f1-887e837bd3f6@redhat.com>
Date: Tue, 7 Mar 2023 11:50:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 5/9] aio-wait: switch to smp_mb__after_rmw()
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com, richard.henderson@linaro.org
References: <20230306223306.84383-1-pbonzini@redhat.com>
 <20230306223306.84383-6-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230306223306.84383-6-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06.03.23 23:33, Paolo Bonzini wrote:
> The barrier comes after an atomic increment, so it is enough to use
> smp_mb__after_rmw(); this avoids a double barrier on x86 systems.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   include/block/aio-wait.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
> index dd9a7f6461ef..da13357bb8cf 100644
> --- a/include/block/aio-wait.h
> +++ b/include/block/aio-wait.h
> @@ -85,7 +85,7 @@ extern AioWait global_aio_wait;
>       /* Increment wait_->num_waiters before evaluating cond. */     \
>       qatomic_inc(&wait_->num_waiters);                              \
>       /* Paired with smp_mb in aio_wait_kick(). */                   \
> -    smp_mb();                                                      \
> +    smp_mb__after_rmw();                                           \
>       if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
>           while ((cond)) {                                           \
>               aio_poll(ctx_, true);                                  \

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


