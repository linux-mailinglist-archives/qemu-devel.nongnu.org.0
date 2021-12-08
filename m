Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7F346CFAD
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 10:06:03 +0100 (CET)
Received: from localhost ([::1]:40316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mustm-0001bm-5p
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 04:06:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musrx-0000UR-Pk
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:04:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1musrw-0002Jo-Cc
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 04:04:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638954247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OXCCokQamee+QqKyUvrdA0djVgKWUpr42xrTXRssBG8=;
 b=jIVUKuCrTWj19q7kNDFJMezdSqXfBnMCKtny+ICLgNQyuc95tXkAQEdeZuem7PBpLxLuAa
 VdYO1D5iw7zAReMGw7dwUt3Ppq9lWKp7y0eArxFE5DQp6yGBVyUXMGrgyV+8ymYxk1UgSi
 4x4eS7bs+VwwlQT9lkxforvjagFs38U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-EqZZVC0lMsy4PRlAw-p3zQ-1; Wed, 08 Dec 2021 04:04:04 -0500
X-MC-Unique: EqZZVC0lMsy4PRlAw-p3zQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 g80-20020a1c2053000000b003331a764709so2693692wmg.2
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 01:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OXCCokQamee+QqKyUvrdA0djVgKWUpr42xrTXRssBG8=;
 b=xlNKqLKEEPD68XhjYAy+wa4YQyfwNyBvp2SPZSQwj/qHrSqVDrufeLUzsWlPij5N0w
 +fqXJS1oCbKn/jlo4vqyq6GhDve6xJO8vJYoUKA61edLyxjgpfNKPf4LzcGmZKl0iKmZ
 L50oYRTTW8fAzYYTJoPWv41AvwlYBa0OPbdQ/Csy2xS3NJFn2JSrmNHo8VVi7uGaI54g
 5RZ26kdn8Z7F+0PuGqQTTK7mmfn14w/bFlVuYFPgOE8kdELFRXkugfpKOv93SRNS5TLe
 U2IwEv68JaDGPON5UL6nJwBJO4rb5m7baBxL505AdxszRXPA5NMdGJqD1eBHs35fbrQZ
 qpaQ==
X-Gm-Message-State: AOAM531xePfSg8GaVo/aK4brHa2siMjG6aO3b8ee6CBGntjDR2L0iR3f
 rmi5gylKpdnnhhgplT/6DYrNhe5jUfMNlzbhIv8xFYOCcI7X+8i0eu+zXWMVckV4R6fblfe8e2X
 xhpP4+vKl7wxaPLI=
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr14214158wme.80.1638954243525; 
 Wed, 08 Dec 2021 01:04:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7yIYf6Oy1zlXu5O6h9oWrF3BJBgztiX06pcm001M0Rse/9IUSk/8R7FNtJZr53MGuraGm0w==
X-Received: by 2002:a1c:9a89:: with SMTP id c131mr14214111wme.80.1638954243152; 
 Wed, 08 Dec 2021 01:04:03 -0800 (PST)
Received: from [10.33.192.183] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id g13sm2059968wmk.37.2021.12.08.01.04.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 01:04:02 -0800 (PST)
Message-ID: <127c0df3-03f9-aaa6-3f22-b8489594fa12@redhat.com>
Date: Wed, 8 Dec 2021 10:04:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] s390x/ipl: support extended kernel command line size
To: Marc Hartmayer <mhartmay@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211122112909.18138-1-mhartmay@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211122112909.18138-1-mhartmay@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.44, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/11/2021 12.29, Marc Hartmayer wrote:
> In the past s390 used a fixed command line length of 896 bytes. This has changed
> with the Linux commit 5ecb2da660ab ("s390: support command lines longer than 896
> bytes"). There is now a parm area indicating the maximum command line size. This
> parm area has always been initialized to zero, so with older kernels this field
> would read zero and we must then assume that only 896 bytes are available.
> 
> Acked-by: Viktor Mihajlovski <mihajlov@de.ibm.com>
> Signed-off-by: Marc Hartmayer <mhartmay@linux.ibm.com>
> ---
>   hw/s390x/ipl.c | 23 ++++++++++++++++++++---
>   1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index 7ddca0127fc2..092c66b3f9f1 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -37,8 +37,9 @@
>   
>   #define KERN_IMAGE_START                0x010000UL
>   #define LINUX_MAGIC_ADDR                0x010008UL
> +#define KERN_PARM_AREA_SIZE_ADDR        0x010430UL
>   #define KERN_PARM_AREA                  0x010480UL
> -#define KERN_PARM_AREA_SIZE             0x000380UL
> +#define LEGACY_KERN_PARM_AREA_SIZE      0x000380UL
>   #define INITRD_START                    0x800000UL
>   #define INITRD_PARM_START               0x010408UL
>   #define PARMFILE_START                  0x001000UL
> @@ -110,6 +111,21 @@ static uint64_t bios_translate_addr(void *opaque, uint64_t srcaddr)
>       return srcaddr + dstaddr;
>   }
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
> +            return size;
> +        }
> +    }
> +    return LEGACY_KERN_PARM_AREA_SIZE;
> +}
> +
>   static void s390_ipl_realize(DeviceState *dev, Error **errp)
>   {
>       MachineState *ms = MACHINE(qdev_get_machine());
> @@ -197,10 +213,11 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>               ipl->start_addr = KERN_IMAGE_START;
>               /* Overwrite parameters in the kernel image, which are "rom" */
>               if (parm_area) {
> -                if (cmdline_size > KERN_PARM_AREA_SIZE) {
> +                uint64_t max_cmdline_size = get_max_kernel_cmdline_size();
> +                if (cmdline_size > max_cmdline_size) {
>                       error_setg(errp,
>                                  "kernel command line exceeds maximum size: %zu > %lu",

I think the %lu likely needs to be turned into a PRIu64 now ... could you 
please try compiling on a 32-bit host env (e.g. via gitlab-ci), fix the 
patch accordingly (also with the cosmetics mentioned by David) and send a 
v2? Thanks!

  Thomas

> -                               cmdline_size, KERN_PARM_AREA_SIZE);
> +                               cmdline_size, max_cmdline_size);
>                       return;
>                   }


