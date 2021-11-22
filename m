Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8471458DEC
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:56:41 +0100 (CET)
Received: from localhost ([::1]:54914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7w8-0000JA-CI
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:56:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp7uY-0006xW-Ah
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:55:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mp7uU-0001Pm-GX
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 06:55:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637582097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZQ9PzkGhKq90eYNgELE12vYKAYnVPr5AvFae/M1cls=;
 b=JQiF4guJGtPFw6ZitUzvwtMbgGMQvXprxS1EtskMVXL/PE7veW5leLZM4FBrW2/oqrFTk/
 KBBAfaxBktzhevuaj0xumCz5Ti2YDM/fDnOjZaoAuS1g3wSAqdAc3J4oxuAFHc3BijStPy
 enXeiXrqYmR4sPQJ6rtlp4DW/W1Szmw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-y1jCZTWRMWqTDI2qAdiEDw-1; Mon, 22 Nov 2021 06:54:55 -0500
X-MC-Unique: y1jCZTWRMWqTDI2qAdiEDw-1
Received: by mail-wm1-f72.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so10075355wmg.2
 for <qemu-devel@nongnu.org>; Mon, 22 Nov 2021 03:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=6ZQ9PzkGhKq90eYNgELE12vYKAYnVPr5AvFae/M1cls=;
 b=5tHxOPIiiS59V1ePoG0vd+14SV8Q8yO7SsTqqu/R9p6S0C56dHL29Xz/x5oCD5kpkS
 rauXuniHTnrg4WrMX1X3+1sD+L7GPIPrbgcvlLTX5zWtygsvjjzS1ejiXKZtXAiQC2cT
 +XPQhhIJPteH583SYwLq+c2LfhWrQ1fz0ALV9TNVmM4wIZAlLh4R3lS4Q1O+qvlceF/D
 KSDViIeUGgZxsNzTCdpIijO+bjbYuCqZX9tcW/zox8stE2G19KRCRwwSjEqmtY0VXx9Y
 Szl4D0absq3aUCDpYF2GQGKlHeQ6uBQ3sapvqGdfdUlK7/9c7AyEpVrwd32lv6oeLygy
 Ch7g==
X-Gm-Message-State: AOAM532kzO/IFuCjODWPJuyUMY5ZEFZUUn3W5sGtzaublqUHmlbwISd4
 Ay/QIbAotC5LSbUJNE9eLsUbc04/rctg7BZ6mYM5E7cZohSSL95lRMjMMW4ClB9crdTnAh2FPtD
 ZnLR54QLBfEGRxAU=
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr28762560wmf.185.1637582094662; 
 Mon, 22 Nov 2021 03:54:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz+J/mMrpWDTGK0zf9h99zuhtMbB2wERIUNfnsESg9GVXVDejC85xxusPk5zbUKn3YHcbyC6w==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr28762529wmf.185.1637582094392; 
 Mon, 22 Nov 2021 03:54:54 -0800 (PST)
Received: from [192.168.3.132] (p5b0c667b.dip0.t-ipconnect.de. [91.12.102.123])
 by smtp.gmail.com with ESMTPSA id a1sm10669211wri.89.2021.11.22.03.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Nov 2021 03:54:54 -0800 (PST)
Message-ID: <c44561b3-abdb-dcc8-bef0-fb546dc957a3@redhat.com>
Date: Mon, 22 Nov 2021 12:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] s390x/ipl: support extended kernel command line size
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211122112909.18138-1-mhartmay@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211122112909.18138-1-mhartmay@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.097, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.11.21 12:29, Marc Hartmayer wrote:
> In the past s390 used a fixed command line length of 896 bytes. This has changed
> with the Linux commit 5ecb2da660ab ("s390: support command lines longer than 896
> bytes"). There is now a parm area indicating the maximum command line size. This
> parm area has always been initialized to zero, so with older kernels this field
> would read zero and we must then assume that only 896 bytes are available.
> 
> Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>  hw/s390x/ipl.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 7ddca0127fc2..092c66b3f9f1 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -37,8 +37,9 @@
>  
>  #define KERN_IMAGE_START                0x010000UL
>  #define LINUX_MAGIC_ADDR                0x010008UL
> +#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
>  #define KERN_PARM_AREA                  0x010480UL
> -#define KERN_PARM_AREA_SIZE             0x000380UL
> +#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
>  #define INITRD_START                    0x800000UL
>  #define INITRD_PARM_START               0x010408UL
>  #define PARMFILE_START                  0x001000UL
> @@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
>      return srcaddr + dstaddr;
>  }
>  
> +static uint64_t get_max_kernel_cmdline_size(void)
> +{
> +    uint64_t *size_ptr = rom_ptr(KERN_PARM_AREA_SIZE_ADDR, sizeof(*size_ptr));
> +
> +    if (size_ptr) {
> +        uint64_t size;
> +
> +        size = be64_to_cpu(*size_ptr);
> +        if (size != 0) {

Could do "if (size) {"

> +            return size;
> +        }
> +    }
> +    return LEGACY_KERN_PARM_AREA_SIZE;
> +}
> +
>  static void s390_ipl_realize(DeviceState *dev, Error **errp)
>  {
>      MachineState *ms = MACHINE(qdev_get_machine());
> @@ -197,10 +213,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>              ipl->start_addr = KERN_IMAGE_START;
>              /* Overwrite parameters in the kernel image, which are "rom" */
>              if (parm_area) {
> -                if (cmdline_size > KERN_PARM_AREA_SIZE) {
> +                uint64_t max_cmdline_size = get_max_kernel_cmdline_size();

We might want an empty line here.

> +                if (cmdline_size > max_cmdline_size) {
>                      error_setg(errp,
>                                 "kernel command line exceeds maximum size: %zu > %lu",
> -                               cmdline_size, KERN_PARM_AREA_SIZE);
> +                               cmdline_size, max_cmdline_size);
>                      return;
>                  }
>  
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


