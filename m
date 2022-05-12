Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC34525524
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 20:49:30 +0200 (CEST)
Received: from localhost ([::1]:35430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npDsP-0002cM-7y
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 14:49:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDdr-0006Eg-O7
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:34:28 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <isaku.yamahata@gmail.com>)
 id 1npDdq-00080r-4u
 for qemu-devel@nongnu.org; Thu, 12 May 2022 14:34:27 -0400
Received: by mail-pl1-x636.google.com with SMTP id s14so5731656plk.8
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 11:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BUcwfda8/NN2DT0blrNG+sqcRTMirbYkw3Wm3k5URm0=;
 b=Q6/f5WOYKWwEL6cs7cDcBAHrNIeTRYQ7qV7MCDi/RQVJpIiZvIvr7erb7Bm9JcIP5E
 2SSIrkD/WbxBMUAvcZlHa5ooyVt9hjlYmmR7xmqQKwfvPG/DWJ8elh23nyG9/qbBsHwG
 OaL0KRfPFSLjCN4VvF8f0xszrKT5+r/gyZzPoLc4tRh2pU9fIKj7F7eLwpC2UY3I0QNX
 KWZgmCm4ZFDyUZQ0RfPhQjxVgMSKCvbRQ6MpAglTm1wNxh4m2RPi/bC75Mn4cBVDBsXB
 tM5pb71VxnJssBH//gIDO0JCqYZQXhmC/eq3hx3utULUdJ3R5IzcWhx9HHKQ4tMk9Wo5
 9UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BUcwfda8/NN2DT0blrNG+sqcRTMirbYkw3Wm3k5URm0=;
 b=kIiGzsQulfuV4Hs2vrYBHWmCWVTOZ9R0d7v/S4tgB4QumsEaaAXyqLobOy6YMsn6Ue
 iVpu2FHKMmNTAMjAKt8NWS9jTE/t4unkBoYs0KDhXLBANqiCX31RMr6RjSOqa99k4Nq+
 jyFnuxWlXT1/RHdNaP2Y7B59vmJBDAWYQ6S0wodkdYlX3+oZRL0WKnncpEMGr3/Ec4ZY
 t3+0xL2t89PqXxCTPlL5Q/wgsrqfF72q7ykweQsV8rRm6KyyJydLtf/tT/Tf2ulsKmQa
 lL6bFdHYaTPtd3vBa/EaO436zy0xLG7dIZAfy0RQLY5pRmQ/pKsT0beZO2nmV1bm4MiT
 SNXQ==
X-Gm-Message-State: AOAM533JnJJa4Vkejyl3416rvzoZwN01rxRBEmjQ0RcxSHTGDSMAiK3R
 6CbaN69hJcFbDIFgNcuK1UI=
X-Google-Smtp-Source: ABdhPJw1R1ibRkcltlohms3DOMAhrRgBYz5yllUvkivQK+M/jfahmJAFriIVG0ehe2vFlAHDci+84A==
X-Received: by 2002:a17:90b:4f45:b0:1dc:4f85:6ad4 with SMTP id
 pj5-20020a17090b4f4500b001dc4f856ad4mr893520pjb.40.1652380464851; 
 Thu, 12 May 2022 11:34:24 -0700 (PDT)
Received: from localhost ([192.55.54.48]) by smtp.gmail.com with ESMTPSA id
 e10-20020a170902784a00b0015e8d4eb20fsm241986pln.89.2022.05.12.11.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 11:34:24 -0700 (PDT)
Date: Thu, 12 May 2022 11:34:23 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Isaku Yamahata <isaku.yamahata@gmail.com>, isaku.yamahata@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, Eric Blake <eblake@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, erdemaktas@google.com,
 kvm@vger.kernel.org, qemu-devel@nongnu.org, seanjc@google.com
Subject: Re: [RFC PATCH v4 24/36] i386/tdx: Add TDVF memory via
 KVM_TDX_INIT_MEM_REGION
Message-ID: <20220512183423.GI2789321@ls.amr.corp.intel.com>
References: <20220512031803.3315890-1-xiaoyao.li@intel.com>
 <20220512031803.3315890-25-xiaoyao.li@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220512031803.3315890-25-xiaoyao.li@intel.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=isaku.yamahata@gmail.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 12, 2022 at 11:17:51AM +0800,
Xiaoyao Li <xiaoyao.li@intel.com> wrote:

> From: Isaku Yamahata <isaku.yamahata@intel.com>
> 
> TDVF firmware (CODE and VARS) needs to be added/copied to TD's private
> memory via KVM_TDX_INIT_MEM_REGION, as well as TD HOB and TEMP memory.
> 
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> Signed-off-by: Xiaoyao Li <xiaoyao.li@intel.com>
> ---
>  target/i386/kvm/tdx.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/target/i386/kvm/tdx.c b/target/i386/kvm/tdx.c
> index 3e18ace90bf7..567ee12e88f0 100644
> --- a/target/i386/kvm/tdx.c
> +++ b/target/i386/kvm/tdx.c
> @@ -240,6 +240,7 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
>  {
>      TdxFirmware *tdvf = &tdx_guest->tdvf;
>      TdxFirmwareEntry *entry;
> +    int r;
>  
>      tdx_init_ram_entries();
>  
> @@ -265,6 +266,29 @@ static void tdx_finalize_vm(Notifier *notifier, void *unused)
>            sizeof(TdxRamEntry), &tdx_ram_entry_compare);
>  
>      tdvf_hob_create(tdx_guest, tdx_get_hob_entry(tdx_guest));
> +
> +    for_each_tdx_fw_entry(tdvf, entry) {
> +        struct kvm_tdx_init_mem_region mem_region = {
> +            .source_addr = (__u64)entry->mem_ptr,
> +            .gpa = entry->address,
> +            .nr_pages = entry->size / 4096,
> +        };
> +
> +        __u32 metadata = entry->attributes & TDVF_SECTION_ATTRIBUTES_MR_EXTEND ?
> +                         KVM_TDX_MEASURE_MEMORY_REGION : 0;

Please use flags instead of metadata.


> +        r = tdx_vm_ioctl(KVM_TDX_INIT_MEM_REGION, metadata, &mem_region);
> +        if (r < 0) {
> +             error_report("KVM_TDX_INIT_MEM_REGION failed %s", strerror(-r));
> +             exit(1);
> +        }
> +
> +        if (entry->type == TDVF_SECTION_TYPE_TD_HOB ||
> +            entry->type == TDVF_SECTION_TYPE_TEMP_MEM) {
> +            qemu_ram_munmap(-1, entry->mem_ptr, entry->size);
> +            entry->mem_ptr = NULL;
> +        }
> +    }
>  }
>  
>  static Notifier tdx_machine_done_notify = {
> -- 
> 2.27.0
> 
> 

-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

