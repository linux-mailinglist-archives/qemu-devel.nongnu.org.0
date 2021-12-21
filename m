Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110EF47C998
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 00:15:35 +0100 (CET)
Received: from localhost ([::1]:46194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzoM1-00013e-TB
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 18:15:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoJz-0007n2-2e
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:13:27 -0500
Received: from [2607:f8b0:4864:20::630] (port=40647
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mzoJx-0006Zv-Hg
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 18:13:26 -0500
Received: by mail-pl1-x630.google.com with SMTP id v19so415648plo.7
 for <qemu-devel@nongnu.org>; Tue, 21 Dec 2021 15:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FyB8QF5tuniEVx/CZyuqWjmPXYxib/y2sCRxh9mOq4Y=;
 b=JSj1i1KP69z9wC8SevxjWO/Q1oTvcLSiAQ246U5KOXRyPO8ak/PMQ9fmrH2u5G5Ezr
 PCofNXk64sU9ZFRSaZR6j8wA6pbIqeyVOYV526Uk19mEXev1R5QVC5fzbFBCelS4JUYS
 Anq8gYmBvp1hfpKgcSqqKAMQ8fFoUAeh0+1wRelNREIfjHQJD0bwWttg0aW69qpsOHtU
 fPU9bcxftkXm3xZ7Ih6iSLdIqpOCuhm2reCR8pIcv6wlx0Sc5VCgv4Rw13hAdR5paXTO
 8CYMlT5QzYu5Wf+DLg8u7HUdjF7crHLumlUEEUSX9V127STmQ1XBtyiTgLTbk8275Lfd
 puqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FyB8QF5tuniEVx/CZyuqWjmPXYxib/y2sCRxh9mOq4Y=;
 b=OAjeTyt0XVly6N6FlQWBIJtp293gEK33JjTBN8o2mZW1d9OLYQD8fA3HMsh9l+CWja
 bZioEMF9z7SAzRFjmw9EkvZaOLutuoD3YV8FaRL+bv1R8FYIzRtorBE9nXRdkdYlKS2v
 PJ3tMwGnrHFzww8f4jMJzMiMaso6jviXJRMm6EREMM8LBbA7Zwc2IKVQsGkP6tpLqZlj
 Wj31m/Vud5uAD9WwDQPvTQKbjPqrOVYjDNVmXbqe7kNdrZgqnZj7pEDY2Tjh9DWr8DvP
 lULs95Amk6o3BTh6oFaIfgzmxKdREoOgcw2W6wZgjW9k+wC3WfeeYjy/cXKvlPrEeC6l
 XyDw==
X-Gm-Message-State: AOAM532Ol3gkO0MYaOBYVPIukRZMXYxhaV1sbZxlRP6UbD2tUAJbwYjz
 1jqomuJI7RcRDJchdmoRZnsAcw==
X-Google-Smtp-Source: ABdhPJxq2zJur7pwXf8ejRXXvxsV3A+69KSZB71wtF/aAKNP7cmjz5F6+NaxDNKxIbmd8jPus3FTqQ==
X-Received: by 2002:a17:902:8e87:b0:143:759c:6a2d with SMTP id
 bg7-20020a1709028e8700b00143759c6a2dmr531699plb.59.1640128404009; 
 Tue, 21 Dec 2021 15:13:24 -0800 (PST)
Received: from [192.168.4.112] ([156.19.246.20])
 by smtp.gmail.com with ESMTPSA id n6sm156963pfa.28.2021.12.21.15.13.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 15:13:21 -0800 (PST)
Subject: Re: [PATCH 1/5] hw/scsi/megasas: Use uint32_t for reply queue
 head/tail values
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211218151053.1545962-1-philmd@redhat.com>
 <20211218151053.1545962-2-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <408da27e-d64d-0c58-19b5-0406974154a2@linaro.org>
Date: Tue, 21 Dec 2021 15:13:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211218151053.1545962-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.012,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sven Schnelle <svens@stackframe.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/18/21 7:10 AM, Philippe Mathieu-Daudé wrote:
> While the reply queue values fit in 16-bit, they are accessed
> as 32-bit:
> 
>    661:    s->reply_queue_head = ldl_le_pci_dma(pcid, s->producer_pa);
>    662:    s->reply_queue_head %= MEGASAS_MAX_FRAMES;
>    663:    s->reply_queue_tail = ldl_le_pci_dma(pcid, s->consumer_pa);
>    664:    s->reply_queue_tail %= MEGASAS_MAX_FRAMES;
> 
> Having:
> 
>    41:#define MEGASAS_MAX_FRAMES 2048         /* Firmware limit at 65535 */
> 
> In order to update the ld/st*_pci_dma() API to pass the address
> of the value to access, it is simpler to have the head/tail declared
> as 32-bit values. Replace the uint16_t by uint32_t, wasting 4 bytes in
> the MegasasState structure.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   hw/scsi/megasas.c    | 4 ++--
>   hw/scsi/trace-events | 8 ++++----
>   2 files changed, 6 insertions(+), 6 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

