Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB86AB1EC
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 20:40:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYuDY-0003hB-Ez; Sun, 05 Mar 2023 14:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYuDN-0003fr-Hq
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:40:15 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYuDM-000415-0b
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 14:40:13 -0500
Received: by mail-pl1-x642.google.com with SMTP id ky4so8060962plb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 11:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678045210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=q8V6VN4dIg5GeMwdP9RwHnaEWv8+L81LouLBxL9MY+g=;
 b=C46tVgYD0tBn2HRpEVSwcaKM2/Cv8fp8DJORRC26AcI9Bl9iwuPYaCavEB4JVKMvyg
 v4YrcZ9YvN5O7yEreY/KyDsfat23lCcHKc2iD4nVLp8Tu56G2onAvnOE2lAJoNnv+Pc/
 S68scFmUmHVvusyXI0SWLw7O+FXrvGRMR+s7KaNCv6Qhp6uTFh2J1pvWP2Toq9pWL5eG
 TUzmZZ2J8tDy1jgnIaXx9PSOvUYa2Ka86eGKIxL6AbpKV6s0liP2kpGAfp34i7xZYrr1
 a6py3kq2MiIeHfOXngzr3WL92bNi6N+2bioTCzjp1+mpxMXhZhxFPJrARBRqraRJIEFo
 f79w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678045210;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=q8V6VN4dIg5GeMwdP9RwHnaEWv8+L81LouLBxL9MY+g=;
 b=qicyEH9RVZwflYiUnhIQ2rxdOrJ1dQWwOf7vhTFIusL1Si/eLSTCaAtqTYVdzzrx3O
 XeM47KBjWw0UoSev4kFHqthTPRhWZcQlPoMaHmW9jrTG9CHUqWRHezZJrzZidNsGKXsZ
 x83sDdSnYRQZfSdu4ZVqkBRHc0MDpcezH/fDQodygR8sZwZPc7sPZFJkEsO2J7+ld7dr
 TeH2B5RvDbC1KsVgls2XvzGLTRyfdSS/WaNn8hJOCCB66wjROt8JyqIo1+wfAlHUNxIh
 7C0KdOgFUEgS6YvkDPQnkhJMDo4raxKxj6EwQ9gTynU8z/HgGicpguYVB5VTRXuPUgCO
 +1pA==
X-Gm-Message-State: AO0yUKXmSeTSepaqKEL53VaEQsnSLzG4N8zpJYzkt73RGf0qrhpCyxNf
 hN+Wv4GYdOiu9wBG1GjDfQonBA==
X-Google-Smtp-Source: AK7set/v7ljAzLLK4ANI25nBgB9h2D83/3bYvB26/HfWdOBDuqXby9sTKpmZ10EE/6rY7DT9wg6ezg==
X-Received: by 2002:a05:6a20:6a0c:b0:cc:a93:2b82 with SMTP id
 p12-20020a056a206a0c00b000cc0a932b82mr11174767pzk.58.1678045210213; 
 Sun, 05 Mar 2023 11:40:10 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:d15:390f:de71:e264?
 ([2602:ae:154a:9f01:d15:390f:de71:e264])
 by smtp.gmail.com with ESMTPSA id
 c18-20020aa781d2000000b005a8b4dcd21asm5059067pfn.15.2023.03.05.11.40.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Mar 2023 11:40:09 -0800 (PST)
Message-ID: <890c61a1-a25f-e8a9-5ff7-db49b05b6935@linaro.org>
Date: Sun, 5 Mar 2023 11:40:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 8/8] physmem: add missing memory barrier
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-9-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230303171939.237819-9-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/3/23 09:19, Paolo Bonzini wrote:
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   softmmu/physmem.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 47143edb4f6c..a6efd8e8dd11 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2927,6 +2927,8 @@ void cpu_register_map_client(QEMUBH *bh)
>       qemu_mutex_lock(&map_client_list_lock);
>       client->bh = bh;
>       QLIST_INSERT_HEAD(&map_client_list, client, link);
> +    /* Write map_client_list before reading in_use.  */
> +    smp_mb();
>       if (!qatomic_read(&bounce.in_use)) {
>           cpu_notify_map_clients_locked();
>       }
> @@ -3116,6 +3118,7 @@ void address_space_unmap(AddressSpace *as, void *buffer, hwaddr len,
>       qemu_vfree(bounce.buffer);
>       bounce.buffer = NULL;
>       memory_region_unref(bounce.mr);
> +    /* Clear in_use before reading map_client_list.  */
>       qatomic_mb_set(&bounce.in_use, false);
>       cpu_notify_map_clients();
>   }


