Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDCF5451B1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:16:11 +0200 (CEST)
Received: from localhost ([::1]:43602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKpO-0006qb-34
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:16:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nzJON-0003TY-8T
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:44:13 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nzJOL-00086R-L1
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 10:44:11 -0400
Received: by mail-ed1-x52b.google.com with SMTP id 25so31235065edw.8
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 07:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RR8PqmNpQssCEjl7Z8+0Xu2q0AV0FYIlKl50x4ifRRI=;
 b=mvhXhR6hkMqLgVOCxQJfJPxDVk6RX43Q8duBM3VLYRVf/Jqga0Bdod3V0hKz/oFY2X
 uxvLhN6QCpu8AQts1pUDiclDoDkQ2AWw2GVwl9vDwAy18mE1x04OcuglnjIVPWfwHNZ6
 5tPr3ATRaST0CUx6brtoQzsj4dyB2gUcksHSuiWd64a3rquMQpl8F8F04JjM56yiQ/VO
 9wmfPWlOHGJ65QVx0SVs7Fj+ker0T2uF9LHUTMTuhkry3rpi3YLgcgkPNlRxJZ7CfLME
 j3u5HTIhbdbvUbh51TfEEWGzrPuklAw5QPLWaVv8aYxceKtPEXw4c9/jBHLEeH9ayiWU
 aCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RR8PqmNpQssCEjl7Z8+0Xu2q0AV0FYIlKl50x4ifRRI=;
 b=q0DRP1NaXW0PcOZtItCPpnUXjSdmU05iX7WXjZDemN0v/SG6LfrgGrXxgzoXp+98k1
 ZI2BbWWI0FPYkA/TRHk9bdfgdr3+GbVp7OmsVnQkj3wJyqNUXHuvguGsXaO3rbnmy1G9
 kWnaBBieqefcBfLMvodT1YhJXwaWMcpVRDZZWc9hzGsnU7HYq+enWr3pZqb/92hbHWln
 WZMbsL4/fECpcq7SseGwrq9cqXc2PUbThHibCcWswCS9YYDzI4bND6Lnw3o1+s0UOOZL
 WH8G96q8KTpHxdpxwMJlthlARHMOg5MUTBR5oMbsG+DcZHAWy4N5fJtXjDLNnwZ0zloY
 O73A==
X-Gm-Message-State: AOAM533qQp8O6Prxjuh1e67PCKzlMGsKo3sdlbEmAEKCbuTmlFAeSY9Y
 Sv5oCROMGRz9mshKUkUeIXc=
X-Google-Smtp-Source: ABdhPJxmjhyIJYFp5X6nxMDsFvtX4QdJVObIJFG6hr3ZMGmDKSjuP9onDytH+f4AN9mw41fdr1tf7g==
X-Received: by 2002:a05:6402:b25:b0:42d:d14b:6399 with SMTP id
 bo5-20020a0564020b2500b0042dd14b6399mr45130555edb.38.1654785847866; 
 Thu, 09 Jun 2022 07:44:07 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 p23-20020a170906499700b0070f36b8cb39sm8378721eju.103.2022.06.09.07.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jun 2022 07:44:07 -0700 (PDT)
Message-ID: <1ebafbc4-8085-7f9a-9b4a-a6327680ca07@redhat.com>
Date: Thu, 9 Jun 2022 16:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/4] virtio-mmio: cleanup reset
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, thuth@redhat.com
References: <20220609091534.1416909-1-pbonzini@redhat.com>
 <20220609091534.1416909-5-pbonzini@redhat.com> <87ilpa9gbz.fsf@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87ilpa9gbz.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/9/22 14:22, Cornelia Huck wrote:
>> -    if (proxy->legacy) {
>> -        return;
>> -    }
>> +    virtio_bus_reset(&proxy->bus);
>>   
>> -    for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>> -        proxy->vqs[i].enabled = 0;
>> +    if (!proxy->legacy) {
>> +        for (i = 0; i < VIRTIO_QUEUE_MAX; i++) {
>> +            proxy->vqs[i].enabled = 0;
>> +        }
>>       }
>>   }
>
> The more I look at this, the more confused I get.
> 
> The current code calls soft_reset when the driver sets the status to 0,
> after already having called virtio_reset().

Yes, that's before the patch.

> But doesn't virtio_reset() ultimately already trigger the virtio-mmio
> reset routine, which sets enabled to 0 for all queues? Why do that
> again? (And why is soft_reset a "soft reset"?)
No, it does not set enabled = 0 because "enabled" is specific to 
virtio-mmio (it is read by VIRTIO_MMIO_QUEUE_READY, which is only 
available in virtio-mmio 1.0 devices).  In fact it is stored in 
proxy->vqs[], while virtio_reset only resets fields in vdev->vq[].

k->reset() instead triggers the *device* reset routine (e.g. 
virtio_blk_reset).  So what makes it "soft" is that the various queue 
addresses remain there, and can be enabled just by writing 1 to 
VIRTIO_MMIO_QUEUE_READY for every queue.

Paolo

