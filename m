Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 953154B4054
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 04:35:38 +0100 (CET)
Received: from localhost ([::1]:58094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJS9J-00058W-5m
	for lists+qemu-devel@lfdr.de; Sun, 13 Feb 2022 22:35:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJS84-0004TS-Qk
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJS81-0003js-GJ
 for qemu-devel@nongnu.org; Sun, 13 Feb 2022 22:34:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644809655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hDFJArXgLo4PsPDePCF2YhhtHYp0pwwbwrgjVaZDQu8=;
 b=h9tLehz3AjOg6fYFFEpNX6o2HXv7HXTN3bkCEYVKFDbyLkcLF9s+svoJt6o1Yd4SVbCWCz
 hNlKfD+AoOVZdPwpp3ittsmNdUQeHnmn1BNZ4dCgyppSuaVuf7yEvzy9RoTWxxR76MrZbD
 evdiT/thDv4enMyuSO9xj6abZVhMA8k=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-lHxSMW0hNaSJns3UTJ2SeQ-1; Sun, 13 Feb 2022 22:34:14 -0500
X-MC-Unique: lHxSMW0hNaSJns3UTJ2SeQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 s10-20020a17090a948a00b001b96be201f6so5812915pjo.4
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 19:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hDFJArXgLo4PsPDePCF2YhhtHYp0pwwbwrgjVaZDQu8=;
 b=e+qdJJNDoXyy9TZmY0D2b5pQHLxTRQY8jKLjXA+77iFCOVeEqcyzezAVgmJZnT/Gwl
 85xbE7jQrwGt3xYo+w79WpQKAJVCq3sBmVpeiFT5agcWE0S9tYwx+Aaof7iR6F0iY1l0
 l9YD0JcCnJDp8xULctu56atIIvmTGHJqMaOj5sCamjRSrHQlyHOZflwbYa3YgaNqPc7V
 FcCMqhUQddROHnhtOhGWBerTN66ngCBCVLc8w5mfkEuqF76kTNPqAzewb7bmaUMNwfrS
 woe9dm5RczS2VpbEp4Zvb48h+xSk4XWfXBkYiOohQQKWVM5h8iPStaI8khCsvnhvviv4
 LODg==
X-Gm-Message-State: AOAM531GxQrlaSqCAsNogJTZ+lLB2KDj668mBrBWyYKMgHPfWa4q/PmS
 VwMIJKWEQNmzhk3B+DTLpOwh6foD5mr/DUwQ5XEm/NrOYXmFRU48sLppny1NjwVYe0gpLLT2Oxi
 pasj1oMjsfAHAPU0=
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr3385289pjb.171.1644809653696; 
 Sun, 13 Feb 2022 19:34:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyRLLNQOJHHTNKSXn/WwjRGgnKGapXIdI90Rn/fcKRw72gDnLBcrZw0B/cGHu5FoJmuyBuTKQ==
X-Received: by 2002:a17:90b:1e06:: with SMTP id
 pg6mr3385265pjb.171.1644809653423; 
 Sun, 13 Feb 2022 19:34:13 -0800 (PST)
Received: from [10.72.13.241] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id t1sm24598016pgj.43.2022.02.13.19.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Feb 2022 19:34:12 -0800 (PST)
Message-ID: <e58eeed9-d6ea-a8e1-6a8d-29138b413291@redhat.com>
Date: Mon, 14 Feb 2022 11:33:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.0
Subject: Re: [PATCH v2] hw/net: e1000e: Clear ICR on read when using non MSI-X
 interrupts
To: Nick Hudson <skrll@netbsd.org>
References: <20220212094418.93056-1-skrll@netbsd.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220212094418.93056-1-skrll@netbsd.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/2/12 下午5:44, Nick Hudson 写道:
> In section 7.4.3 of the 82574 datasheet it states that
>
>      "In systems that do not support MSI-X, reading the ICR
>       register clears it's bits..."
>
> Some OSes rely on this.
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>


Applied.

Thanks


> ---
>   hw/net/e1000e_core.c | 5 +++++
>   hw/net/trace-events  | 1 +
>   2 files changed, 6 insertions(+)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 8ae6fb7e14..2c51089a82 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -2607,6 +2607,11 @@ e1000e_mac_icr_read(E1000ECore *core, int index)
>           core->mac[ICR] = 0;
>       }
>   
> +    if (!msix_enabled(core->owner)) {
> +        trace_e1000e_irq_icr_clear_nonmsix_icr_read();
> +        core->mac[ICR] = 0;
> +    }
> +
>       if ((core->mac[ICR] & E1000_ICR_ASSERTED) &&
>           (core->mac[CTRL_EXT] & E1000_CTRL_EXT_IAME)) {
>           trace_e1000e_irq_icr_clear_iame();
> diff --git a/hw/net/trace-events b/hw/net/trace-events
> index 643338f610..4c0ec3fda1 100644
> --- a/hw/net/trace-events
> +++ b/hw/net/trace-events
> @@ -221,6 +221,7 @@ e1000e_irq_write_ics(uint32_t val) "Adding ICR bits 0x%x"
>   e1000e_irq_icr_process_iame(void) "Clearing IMS bits due to IAME"
>   e1000e_irq_read_ics(uint32_t ics) "Current ICS: 0x%x"
>   e1000e_irq_read_ims(uint32_t ims) "Current IMS: 0x%x"
> +e1000e_irq_icr_clear_nonmsix_icr_read(void) "Clearing ICR on read due to non MSI-X int"
>   e1000e_irq_icr_read_entry(uint32_t icr) "Starting ICR read. Current ICR: 0x%x"
>   e1000e_irq_icr_read_exit(uint32_t icr) "Ending ICR read. Current ICR: 0x%x"
>   e1000e_irq_icr_clear_zero_ims(void) "Clearing ICR on read due to zero IMS"


