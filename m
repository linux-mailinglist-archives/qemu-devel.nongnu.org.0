Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E609268DD4C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 16:48:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPQBw-0004tB-4W; Tue, 07 Feb 2023 10:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPQBf-0004pN-69
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:47:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPQBd-00078D-35
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 10:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675784831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJjl93DVN9vdohT7xlF3+/lT2ly444CPsYRyAQ512gk=;
 b=Ahq+zOpeol+vIRx1T1NEv5PJSM6jagTkCM6pbFUjmINLGkutseHOGc7w5O042oGI1sBZEZ
 DRUIn1XXwdcv5dc9M3vbXTIVT2dLqJabQTeucHDC9H9D6yfMKlIlUj0GIATqjyzMKadHfi
 vswtckRZfEDKGe39YySyiCe9SBj6JWY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-281-lZfDIsljMHamWq4ydqoeHA-1; Tue, 07 Feb 2023 10:47:10 -0500
X-MC-Unique: lZfDIsljMHamWq4ydqoeHA-1
Received: by mail-qv1-f71.google.com with SMTP id
 c10-20020a05621401ea00b004c72d0e92bcso7804189qvu.12
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 07:47:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJjl93DVN9vdohT7xlF3+/lT2ly444CPsYRyAQ512gk=;
 b=KDcMW0f+r87pFNsQcb8TJKdAbCWVb4QySl9hcruVpLPC1BxBA2nRJ2yqJEBhfvzSMQ
 P7YwfbhDBvu/CQVBLjboXvgn/Z0zI9apixbs0fiKcNTw8Kfa7tJcp2E2/+X2HHoOXyfb
 pxSr5RdudOtUxlEwYtH3EvoIy3e9rMOOZezPmza9HCWKLKV5tRIg5cqVidjCWXZFsFdR
 NBGIgf5ojGX/Bq3SJazq+sWioSoW5Q6ppdP5ABk2VFEaVc+OEKb9RI49pV8blIEnpnwA
 T8RUKvCd7ZO8/9OuIQKOg7oYYQtb+q+sE5fUxx2m4toObNLXgOEtsitLRD6icRgWfuK8
 Lk1w==
X-Gm-Message-State: AO0yUKV9yWOoE/NQrHgVNDqYgK+oZI1J/pjBSSFSP6KfGhgy4jSkz46s
 XnAjyjh8g9sWCY4X6Q/abmjifgRtAXiG29NBP29G8zg4RGE4OVSbJY/V3Vh0gt4NaEhJmRoUp0F
 EGMt0xjmh7lDnBsY=
X-Received: by 2002:a05:622a:1a1d:b0:3b9:b9ae:1476 with SMTP id
 f29-20020a05622a1a1d00b003b9b9ae1476mr5940481qtb.40.1675784830189; 
 Tue, 07 Feb 2023 07:47:10 -0800 (PST)
X-Google-Smtp-Source: AK7set8DxIRJCtilC7sJcv+ggFtgXZpChfhaDLeU+Gdly33mlllmOvFHXSqzSURdw97u1eZIHKYKqQ==
X-Received: by 2002:a05:622a:1a1d:b0:3b9:b9ae:1476 with SMTP id
 f29-20020a05622a1a1d00b003b9b9ae1476mr5940455qtb.40.1675784829955; 
 Tue, 07 Feb 2023 07:47:09 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-120.web.vodafone.de.
 [109.43.176.120]) by smtp.gmail.com with ESMTPSA id
 cm13-20020a05622a250d00b003ba20fd91a4sm5063785qtb.11.2023.02.07.07.47.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:47:08 -0800 (PST)
Message-ID: <6a2ded82-8bbf-8fd5-4704-071c6bdbf3eb@redhat.com>
Date: Tue, 7 Feb 2023 16:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 03/10] hw/i386: Select VGA_PCI in Kconfig
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-4-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206140809.26028-4-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 06/02/2023 15.08, Fabiano Rosas wrote:
> Machines that have "std" as default VGA display need to always build
> vga-pci.c, otherwise we get a crash when CONFIG_PCI_DEVICES=n:
> 
> $ ./qemu-system-x86_64 -M q35 -vga std

I'd remove the "-vga std" in above example to show that it also crashed "by 
default".

> qemu-system-x86_64: unknown type 'VGA'
> Aborted (core dumped)
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/i386/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 527b95df81..8e59cb6634 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -30,9 +30,9 @@ config PC
>       imply TEST_DEVICES
>       imply TPM_CRB
>       imply TPM_TIS_ISA
> -    imply VGA_PCI
>       imply VIRTIO_VGA
>       imply NVDIMM
> +    select VGA_PCI
>       select FDC_ISA
>       select I8259
>       select I8254

Maybe it would be better to add it to the i440fx and the q35 machine only, 
so that you could still compile the isapc machine without it?

  Thomas


