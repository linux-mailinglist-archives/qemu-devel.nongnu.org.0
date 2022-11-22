Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB2763400E
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 16:22:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxV58-0007HJ-P3; Tue, 22 Nov 2022 10:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV39-0006Lh-7v
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:19:04 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oxV36-00045r-PQ
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 10:19:02 -0500
Received: by mail-wr1-x434.google.com with SMTP id i12so21345404wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 07:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=omvAEKINZ0W/wTxggBEWe30GBN77qN5IbXQCTucO0eI=;
 b=n4CbM95GmuTC63E/+WPbEl66AFAf2B7fVW/iA8CxQ5fXQ7BjHCa5AJ4MR28FEIzXOI
 qBJz7oXDzK4qjbYQP6D+Y5gL8jq5MGDO5BOIsWALRO6mk48akVfd6PpSIlkq6fHVVV7p
 sWTKX+/mnY74qEleC+ReqxDgtxN7329a6Rcbz2FBMzb5I1G+Tkz2pIR9pxxh8EnBfXcL
 A4ns2XTulXYJL8cOfmw5us8euaHqKQIgO4+DQJ7xERMGqoVUT4y+Cj+Yhtc1eTSb2lZA
 BWsARiAzZt6D2kjVVHMHQH2hb2H/LVZhZnyjlhSBGg9AUYC3kDUIJmRJiG2lBn61wFP8
 3JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omvAEKINZ0W/wTxggBEWe30GBN77qN5IbXQCTucO0eI=;
 b=MCE2E7BWo9HBqWMQMqMk3j2OKGZE9hTDWMEghgH1rAzJ/tptZxjuVk+dkBnN1ZPzN8
 rrbfwj+EqWaZEY1MtWJtLeZHtpGZtKp5Rm/p5GU/dbyf7+ck0fm5FYNVvE3eECdG39mP
 BN/k6to3fJGQo+jtUJ9GthIITrm4BtRI4iIqte24rQw3feOJTJCGlGfIvKIB/qBz6bdg
 wQZv5ucVN6eOOcjP4CtUbl7IEgl78AsagPPUAC5BAgNTbfYD2rUdqITPQxbQip1/EI/1
 5WvjbISrJJ1UXXOpZtJ/7NhSjcmhIeC9bLxCFyPY8wlEZR4fxhgoOg+pRARuLF9c5uxr
 rO+w==
X-Gm-Message-State: ANoB5pkMizuEifwTxPLz3H8wvB83V75T6ktqP7LHgDocuDZ2v2gYrKxm
 Gy6H4vMvkTCB2R3XZLTucTGv2g==
X-Google-Smtp-Source: AA0mqf71E+sN3NNRw7RVKBE5/XAqSIeMWSRhF6QEt1nv/kGxQrG4DTOwIicuBPZ4HQHGzzEblxw/HQ==
X-Received: by 2002:adf:dfc6:0:b0:236:cfcf:8e36 with SMTP id
 q6-20020adfdfc6000000b00236cfcf8e36mr14766744wrn.323.1669130339059; 
 Tue, 22 Nov 2022 07:18:59 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a5d4d83000000b00236576c8eddsm14234292wru.12.2022.11.22.07.18.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Nov 2022 07:18:58 -0800 (PST)
Message-ID: <0bb7ab20-4e3a-b347-5cdc-4f68d199e7ef@linaro.org>
Date: Tue, 22 Nov 2022 16:18:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH-for-7.2] vhost-vdpa: skip TPM CRB memory section
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: eperezma@redhat.com, eric.auger@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20221122145349.86072-1-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221122145349.86072-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

On 22/11/22 15:53, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> 851d6d1a0f ("vfio/common: remove spurious tpm-crb-cmd misalignment
> warning") removed the warning on vfio_listener_region_add() path.
> 
> An error is reported for vhost-vdpa case:
> qemu-kvm: vhost_vdpa_listener_region_add received unaligned region
> 
> Skip the CRB device.
> 
> Fixes:
> https://bugzilla.redhat.com/show_bug.cgi?id=2141965
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 7468e44b87..9d7206e4b8 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -19,6 +19,7 @@
>   #include "hw/virtio/virtio-net.h"
>   #include "hw/virtio/vhost-shadow-virtqueue.h"
>   #include "hw/virtio/vhost-vdpa.h"
> +#include "sysemu/tpm.h"
>   #include "exec/address-spaces.h"
>   #include "migration/blocker.h"
>   #include "qemu/cutils.h"
> @@ -46,6 +47,11 @@ static bool vhost_vdpa_listener_skipped_section(MemoryRegionSection *section,
>   {
>       Int128 llend;
>   
> +    if (TPM_IS_CRB(section->mr->owner)) {
> +        /* The CRB command buffer has its base address unaligned. */
> +        return true;
> +    }

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


