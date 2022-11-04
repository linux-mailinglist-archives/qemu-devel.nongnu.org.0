Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D043F619F1E
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 18:46:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or0mG-0008Sr-Bw; Fri, 04 Nov 2022 13:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0mC-0008Pb-MJ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:46:45 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1or0mA-0005Ky-SB
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 13:46:44 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 bg9-20020a05600c3c8900b003bf249616b0so3615322wmb.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1s0J5w9v0Xo1esNgUem6w9OA8kAw86lLOV2fLd62HT0=;
 b=DbGVRNxP4K6KRncyqS4liItd0kFmIbN2/T2Jm3hS73/MXSkjDkCeBUI2arT4XasfoZ
 yXUqHD5J5waQP8ApCy5m3tK1ieI9uOeDzv2TSeB6Hu8TA0yQvjNTlW3ZS/2NDt4iCQSL
 1+4Rzy8AnBauEfNtg7DA1WZfE5ioZnU4+OdLW4hpNSZPEvAJZVL3Ms/OTsFXKdqpLrZw
 5ONikPxaZaqX1voSA2pHcTK5XSYUwlYZ4QBy+nKMXRpY867lvu8FSxeX1iWySeishnUK
 tW7c3cVgCJ2YALG3RkWInbBTXqHSe2SHGcvgHoWk6GyPo5DC/80p1dAkQ2R293obSBXc
 HJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1s0J5w9v0Xo1esNgUem6w9OA8kAw86lLOV2fLd62HT0=;
 b=LgSO5+li/g4pR4j6j5jBsYDOUpD5l3fZmVWl7ofT9G4gqawZTAerW78GyPgEP6Zw67
 EahTNrsAXwal3JWrL1QMShFikTwsONQbFRzvsLZy4CyxAkoQurkSkcYrRMqojlp+eUBU
 HwrTFMCj/ZEEkNvT4UjE9XvYmCUCC+axewPOZxSmvL0aZwzg+dQ1zBHqP6ykMe/f/3PR
 hN3umxeZNCe7el3YAxeTrCCjpLHItQmh7pTAQ2vq7iV+XAb7hCzMrrI6k4Yuvqq5ucau
 sXrhzthhv7JQjCfEiY3FzHStPBxyxlpA5zK4Urqunm1C+0yiLl3OI+EK+wQ0hhDRuTM9
 J6Pw==
X-Gm-Message-State: ACrzQf3amtcRQhbYh7mlHyJvkqlLLOW6KQLu4u/bVfLTVgq2v/2GOwhX
 cPy5kgRVRVvWtGxx53IFZ6Im9A==
X-Google-Smtp-Source: AMsMyM7AC8Nj/2LLDPCPik4UCe3bODvU8FHASs+xSxmwsVOW/TC92MvcxmNMXZEnk4UekOl8f2EhOw==
X-Received: by 2002:a05:600c:548c:b0:3c6:d8dd:2a72 with SMTP id
 iv12-20020a05600c548c00b003c6d8dd2a72mr34059636wmb.179.1667584001592; 
 Fri, 04 Nov 2022 10:46:41 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c1d1300b003c3a1d8c8e6sm59163wms.19.2022.11.04.10.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:46:41 -0700 (PDT)
Message-ID: <b17a585a-91d3-e799-4fdc-2df5422e15cb@linaro.org>
Date: Fri, 4 Nov 2022 18:46:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH for-8.0 8/9] qdev: Remove qdev_reset_all() and
 qbus_reset_all()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20221104161513.2455862-1-peter.maydell@linaro.org>
 <20221104161513.2455862-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221104161513.2455862-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/11/22 17:15, Peter Maydell wrote:
> Remove the qdev_reset_all() and qbus_reset_all() functions, now we
> have moved all the callers over to the new device_cold_reset() and
> bus_cold_reset() functions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/qdev-core.h | 26 --------------------
>   hw/core/qdev.c         | 54 ------------------------------------------
>   hw/core/trace-events   |  4 ----
>   3 files changed, 84 deletions(-)

> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 0806d8fcaaa..3b0f04c5c6d 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c

> -static int qbus_reset_one(BusState *bus, void *opaque)
> -{
> -    BusClass *bc = BUS_GET_CLASS(bus);
> -    trace_qbus_reset(bus, object_get_typename(OBJECT(bus)));
> -    if (bc->reset) {
> -        bc->reset(bus);
> -    }
> -    return 0;
> -}

> diff --git a/hw/core/trace-events b/hw/core/trace-events
> index 9b3ecce3b2f..d6ab5c74b90 100644
> --- a/hw/core/trace-events
> +++ b/hw/core/trace-events
> @@ -3,11 +3,7 @@ loader_write_rom(const char *name, uint64_t gpa, uint64_t size, bool isrom) "%s:
>   
>   # qdev.c
>   qdev_reset(void *obj, const char *objtype) "obj=%p(%s)"
> -qdev_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
> -qdev_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
>   qbus_reset(void *obj, const char *objtype) "obj=%p(%s)"

We can also remove the "qbus_reset" event.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> -qbus_reset_all(void *obj, const char *objtype) "obj=%p(%s)"
> -qbus_reset_tree(void *obj, const char *objtype) "obj=%p(%s)"
>   qdev_update_parent_bus(void *obj, const char *objtype, void *oldp, const char *oldptype, void *newp, const char *newptype) "obj=%p(%s) old_parent=%p(%s) new_parent=%p(%s)"
>   
>   # resettable.c


