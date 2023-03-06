Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61CD76AC0E3
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAtJ-0000rY-3D; Mon, 06 Mar 2023 08:28:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAtC-0000r8-8J
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:28:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pZAtA-00070Y-Pf
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:28:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678109307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDvzgBeuMpm0YHt9UeuV89oKu9MdqDhsHvs/+I1WIZg=;
 b=GgIaNJngcYujmsR7upsSCVmUVeCL2iMhnJBIkOiA0xOER+Z/4fKpqld3wJN+gHcAIWxuhO
 P9R8FAKPW5o9O+l9OQZCI3gcxjuaAsc47IVI+aQnuWmQLTibeu34n8gS5G5ACxfMn/XzqX
 OoMhn4lIWMp5+FFYeh3Pp43LEiUOUVs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-Cv_lUYVGMd-3ay-d3k-Z2A-1; Mon, 06 Mar 2023 08:28:23 -0500
X-MC-Unique: Cv_lUYVGMd-3ay-d3k-Z2A-1
Received: by mail-wm1-f69.google.com with SMTP id
 c7-20020a7bc847000000b003e00be23a70so6758614wml.2
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:28:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678109302;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JDvzgBeuMpm0YHt9UeuV89oKu9MdqDhsHvs/+I1WIZg=;
 b=hcG1BTI6N9hN2ZeWwqQysSS5y3yGGxM6/QGh/jX4TMKt5zsEFK1bfaV85vd3kVDf4O
 nC+6EPEQEdBgjcfwIteQCHtOHpAsqGvG6DQPrCy8fuTW6GHstpZJQ+VWnTCLc9vePfU/
 N6p4hKb7S3mQnftBUicX9UBhgi/zX7C7kUUvUJ8cvSODWTAPLuTTInZgmNR1UZDHeUwC
 433U4OIFbPutRTjcpQJyMi1VKorj/PyxyrQ0FuMPbfdfluydeaQP8ejXM0Pqag71tJrL
 8h+WxTiYxejDu1Vg8sOOe0kfvVQXzIMwjwVyVYea9PsxpB/mc1QzRG5z0xtwq1qm3oOQ
 ymlw==
X-Gm-Message-State: AO0yUKXQ1My7LuvFIjL7OuJqdv/66zUYjTVmUdJLlYDc7l5Hus7p40vx
 EjrGfHeuiGyXudR3dSJbZD3Nce1lLuGw3UR7McByTxZkp8fbY1UmZlY2hX4sfjutHBjZV4GCRC7
 T1xAQZvBBJ1T6KIk=
X-Received: by 2002:a05:600c:4ecb:b0:3e7:b17f:9af1 with SMTP id
 g11-20020a05600c4ecb00b003e7b17f9af1mr9554564wmq.22.1678109302747; 
 Mon, 06 Mar 2023 05:28:22 -0800 (PST)
X-Google-Smtp-Source: AK7set/oQ93xtfQ8TFIA5wl6c7uIrKCmQVCbEX4k1li0BxxejpAjgi1XA5o/P/o2AUAfNkeMTtXmuQ==
X-Received: by 2002:a05:600c:4ecb:b0:3e7:b17f:9af1 with SMTP id
 g11-20020a05600c4ecb00b003e7b17f9af1mr9554542wmq.22.1678109302377; 
 Mon, 06 Mar 2023 05:28:22 -0800 (PST)
Received: from ?IPV6:2003:cb:c704:3500:b8a3:191c:eae:cc05?
 (p200300cbc7043500b8a3191c0eaecc05.dip0.t-ipconnect.de.
 [2003:cb:c704:3500:b8a3:191c:eae:cc05])
 by smtp.gmail.com with ESMTPSA id
 c10-20020adffb0a000000b002ce72cff2ecsm260077wrr.72.2023.03.06.05.28.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 05:28:21 -0800 (PST)
Message-ID: <419d5a46-1f6f-7848-21b8-4dca3dfb8c34@redhat.com>
Date: Mon, 6 Mar 2023 14:28:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/8] qemu-thread-posix: cleanup, fix, document QemuEvent
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, stefanha@redhat.com,
 cohuck@redhat.com, eauger@redhat.com
References: <20230303171939.237819-1-pbonzini@redhat.com>
 <20230303171939.237819-3-pbonzini@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230303171939.237819-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
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

> -             * Leave the event reset and tell qemu_event_set that there
> -             * are waiters.  No need to retry, because there cannot be
> -             * a concurrent busy->free transition.  After the CAS, the
> -             * event will be either set or busy.
> +             * Leave the event reset and tell qemu_event_set that there are
> +             * waiters.  No need to retry, because there cannot be a concurrent
> +             * busy->free transition.  After the CAS, the event will be either
> +             * set or busy.
> +             *
> +             * Neither the load nor the store of this cmpxchg have particular
> +             * ordering requirements.  The reasoning for the load is the same
> +             * as qatomic_read() above; while moving the store earlier can only
> +             * cause qemu_event_set() to issue _more_ wakeups.

IIUC, the qatomic_read(&ev->value) is mostly an optimization then, to 
not do an unconditional qatomic_cmpxchg(). That's why we don't care 
about the order in particular.

>                */
>               if (qatomic_cmpxchg(&ev->value, EV_FREE, EV_BUSY) == EV_SET) {
>                   return;
>               }
>           }
> +
> +        /*
> +         * This is the final check for a concurrent set, so it does need
> +         * a smp_mb() pairing with the second barrier of qemu_event_set().
> +         * The barrier is inside the FUTEX_WAIT system call.
> +         */
>           qemu_futex_wait(ev, EV_BUSY);
>       }
>   }


Skipping back and forth between the Linux and QEMU memory model is a pain :D

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


