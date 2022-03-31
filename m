Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0424EE31D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 23:13:08 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na26M-0005AB-KW
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 17:13:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na25H-0004S7-K0
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:11:59 -0400
Received: from [2607:f8b0:4864:20::433] (port=46972
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1na25F-0004rj-VN
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:11:59 -0400
Received: by mail-pf1-x433.google.com with SMTP id s11so711217pfu.13
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 14:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=4dotrmiqGeHpN5a0gD26SFf1gR+dFybtEoxWITumXgQ=;
 b=Uce6upmFWncdizY24Ce79rUAv+bhX0XqDiymSE+8bxxRtL0g+ytNxvjPHcWWFt3+Jh
 z8gj2Z0bmaH87lFaVBOzla4AVXKjYaTAJXvEhxbcuWmSfKvP087m7NAqExWt7YKydFdE
 uyI1B/yYw6INJ1vw77KGG00364sIh/a1q5yLjrDTwFaoTYoPK25rmOzoFbcksgNsT44o
 wCn4cFKAcc0yjo/PTbrv6XIk+dpPyOUvyfVa1ioLadm3N3N9LOx2zkWNrIJ36D7XOJEw
 UDPCnunc7J/TaYPaaGsq3L7SHl40VtJMWsxLSY5VuYDswOw2yJghVwh/SF5wa7m10gzI
 hrxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=4dotrmiqGeHpN5a0gD26SFf1gR+dFybtEoxWITumXgQ=;
 b=YnPdod7vZvbwAZuiSgcpsxKqXZyq/OjdgdPuLsNclDJjDUsC01RFgH09j+RWDsQzwA
 AcC2X8gb5SgRj6bsuTN2Zax3AUE5jnUiWR0QRhHDBl4ZEwbIr0yM21xqnbTaBCYkbyOk
 PHwNTOWvlxGM9dbpj9Ww41Quqxt+r2PK5qutKPPsOZE01u0uxlMy4oXcREl3quIxsQFL
 rLH6gQjbQIKXbg6/MroaQBpBU7DbaERDUs74YktAu+zgmzGqNy29EuPqYKffkFu+wk2v
 9UbvNlCoIGu3H+r/hvfY+E0OCkBMDUtxff4hkgjfOjTdCXj2jmPzX3EouqUhLNxUbbNG
 Fq+A==
X-Gm-Message-State: AOAM531219pyZDtrOgZXLqVi+mgLyARv7gqE5nQCPkXqHb1DKJtOkzc5
 qJpLoRuy1eCxfUA/Yn+4Wfg=
X-Google-Smtp-Source: ABdhPJxHLQdXgBb/0ah76d4o2A8VdPYRLIX51rfe6U8606cI3XOdepUsR5WfWg5wra81pXYw2VHKrg==
X-Received: by 2002:a05:6a00:14ca:b0:4fb:5d3e:5f77 with SMTP id
 w10-20020a056a0014ca00b004fb5d3e5f77mr7501011pfu.34.1648761116561; 
 Thu, 31 Mar 2022 14:11:56 -0700 (PDT)
Received: from ?IPV6:2600:70ff:f07f:0:f49c:562:b5cb:b2b5?
 ([2600:70ff:f07f:0:f49c:562:b5cb:b2b5])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056a00084700b004fb205947c7sm387373pfk.131.2022.03.31.14.11.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Mar 2022 14:11:56 -0700 (PDT)
Message-ID: <73f3b878-1b3d-c292-d124-410a20acfa62@gmail.com>
Date: Thu, 31 Mar 2022 23:11:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 2/3] i386: factor out x86_firmware_configure()
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220331083549.749566-1-kraxel@redhat.com>
 <20220331083549.749566-3-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220331083549.749566-3-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 31/3/22 10:35, Gerd Hoffmann wrote:
> move sev firmware setup to separate function so it can be used from
> other code paths.  No functional change.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Tested-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>   include/hw/i386/x86.h |  3 +++
>   hw/i386/pc_sysfw.c    | 36 ++++++++++++++++++++++--------------
>   2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
> index 916cc325eeb1..4841a49f86c0 100644
> --- a/include/hw/i386/x86.h
> +++ b/include/hw/i386/x86.h
> @@ -140,4 +140,7 @@ void gsi_handler(void *opaque, int n, int level);
>   void ioapic_init_gsi(GSIState *gsi_state, const char *parent_name);
>   DeviceState *ioapic_init_secondary(GSIState *gsi_state);
>   
> +/* pc_sysfw.c */
> +void x86_firmware_configure(void *ptr, int size);
> +
>   #endif
> diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
> index c8b17af95353..36b6121b77b9 100644
> --- a/hw/i386/pc_sysfw.c
> +++ b/hw/i386/pc_sysfw.c
> @@ -148,7 +148,6 @@ static void pc_system_flash_map(PCMachineState *pcms,
>       MemoryRegion *flash_mem;
>       void *flash_ptr;
>       int flash_size;
> -    int ret;
>   
>       assert(PC_MACHINE_GET_CLASS(pcms)->pci_enabled);
>   
> @@ -196,19 +195,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
>               if (sev_enabled()) {

                     ^^^

>                   flash_ptr = memory_region_get_ram_ptr(flash_mem);
>                   flash_size = memory_region_size(flash_mem);
Can we remove the SEV check ...

> -                /*
> -                 * OVMF places a GUIDed structures in the flash, so
> -                 * search for them
> -                 */
> -                pc_system_parse_ovmf_flash(flash_ptr, flash_size);
> -
> -                ret = sev_es_save_reset_vector(flash_ptr, flash_size);
> -                if (ret) {
> -                    error_report("failed to locate and/or save reset vector");
> -                    exit(1);
> -                }
> -
> -                sev_encrypt_flash(flash_ptr, flash_size, &error_fatal);
> +                x86_firmware_configure(flash_ptr, flash_size);

... making this code generic ...?

>               }
>           }
>       }
> @@ -260,3 +247,24 @@ void pc_system_firmware_init(PCMachineState *pcms,
>   
>       pc_system_flash_cleanup_unused(pcms);
>   }
> +
> +void x86_firmware_configure(void *ptr, int size)
> +{
> +    int ret;
> +
> +    /*
> +     * OVMF places a GUIDed structures in the flash, so
> +     * search for them
> +     */
> +    pc_system_parse_ovmf_flash(ptr, size);
> +
> +    if (sev_enabled()) {

... because we are still checking SEV here.

> +        ret = sev_es_save_reset_vector(ptr, size);
> +        if (ret) {
> +            error_report("failed to locate and/or save reset vector");
> +            exit(1);
> +        }
> +
> +        sev_encrypt_flash(ptr, size, &error_fatal);
> +    }
> +}


