Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCDE48B491
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 18:52:34 +0100 (CET)
Received: from localhost ([::1]:58382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7LJx-0001XS-5j
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 12:52:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7LIt-00008q-9t
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:51:27 -0500
Received: from [2a00:1450:4864:20::144] (port=42601
 helo=mail-lf1-x144.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <roman@roolebo.dev>) id 1n7LIq-0005Mq-Di
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 12:51:27 -0500
Received: by mail-lf1-x144.google.com with SMTP id h2so59096050lfv.9
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 09:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=roolebo.dev; s=mail;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ZLRqiKWaAGlwzjX994xIvZgojm5Rg9lDhmEuFU6GaRY=;
 b=FDcBa+MGykl34zDnzWZqqdoHp/5mWD2Dnos5wMzwFsCeEMutX2FZaqUSpL6SFnagOk
 39sWPpndfvEB5MfS4f4vmmtmdTP7v1K7hdJK2AWFpEneZUhqyd/BHQrJCi5C0BF8GbUL
 HzbCkdkWwjWQBq9rxIAwZMEmRhS0aYDtFv6U3sERIE65oRVG8l7EZOMXIH19sPL5ZgPV
 mdjNowNeHN4VGzQ4cFGvrsc6kPndMvcKv2LGsWmlHTMSjktsErOCf+vXxVutmX+c/hnH
 ddyfr2aFlEYjKU39qhEGKi0fQdleGChy2JlhVH3s6btwQanGgzs5OF3OCxUz3HIjlpf2
 KZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ZLRqiKWaAGlwzjX994xIvZgojm5Rg9lDhmEuFU6GaRY=;
 b=MT8A+pfxxF7n8Po56VwTBF5nH7NcaZiM4tBDVo9WcR2twuuqA6IK66Q8dJDzQ8Inxi
 Q2PJbNPLgqCQAgzumbQF2Y3JLy1Hl8xMng7ovxbsn2rCeBvr3B0cT6Ksu0bg354WxdGm
 INm9c6aRTm+R2XFBaC12KhF1YYaTdwdLT5TTCUXvm7Ujx3UAucRCa4AYINSa41WK0BJ9
 E8WAKFSXtScRpuNrLRCO67JRdhvmAYoGlL7M98N2SgYCtaiN83UYymR6KKWaQX/6cTYj
 ZBP4Pw5FnzRJL3COTr78J/w48GPr4vJV8QdAgujR/VxlocmQC6E9M23lX9/6iI72Qu0r
 Wlzw==
X-Gm-Message-State: AOAM531eBBqm0yOdMDPLDwEluCg11dA+ib1wurX2xFCFYBI0WbcsdLSl
 L5MO6+M/ijhUVlNyzhH1k329Fw==
X-Google-Smtp-Source: ABdhPJzau4ZvH1L7ZcJN8fwIr3H60GQoAxrex1gHtWiZn6xyrU3qVBNi8QFGojyOPhqaM11bGsxlWg==
X-Received: by 2002:a2e:7a09:: with SMTP id v9mr3841598ljc.456.1641923482354; 
 Tue, 11 Jan 2022 09:51:22 -0800 (PST)
Received: from localhost (ip-185-108-208-32.ip.asarta.ru. [185.108.208.32])
 by smtp.gmail.com with ESMTPSA id p9sm612360lfu.83.2022.01.11.09.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 09:51:22 -0800 (PST)
Date: Tue, 11 Jan 2022 20:51:21 +0300
From: Roman Bolshakov <roman@roolebo.dev>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v3 4/7] hvf: Remove deprecated hv_vcpu_flush() calls
Message-ID: <Yd3DmSqZ1SiJwd7P@roolebo.dev>
References: <20220110131001.614319-1-f4bug@amsat.org>
 <20220110131001.614319-5-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220110131001.614319-5-f4bug@amsat.org>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::144
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::144;
 envelope-from=roman@roolebo.dev; helo=mail-lf1-x144.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel P =?iso-8859-1?Q?=2E_Berrang=E9?= <berrange@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 10, 2022 at 02:09:58PM +0100, Philippe Mathieu-Daudé wrote:
> When building on macOS 12, we get:
> 
>   In file included from ../target/i386/hvf/hvf.c:59:
>   ../target/i386/hvf/vmx.h:174:5: error: 'hv_vcpu_flush' is deprecated: first deprecated in macOS 11.0 - This API has no effect and always returns HV_UNSUPPORTED [-Werror,-Wdeprecated-declarations]
>       hv_vcpu_flush(vcpu);
>       ^

This seems to be true even for older macOS (e.g. Catalina).

>   /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/System/Library/Frameworks/Hypervisor.framework/Headers/hv.h:364:20: note: 'hv_vcpu_flush' has been explicitly marked deprecated here
>   extern hv_return_t hv_vcpu_flush(hv_vcpuid_t vcpu)
>                      ^
> 
> Since this call "has no effect", simply remove it ¯\_(ツ)_/¯
> 
> Not very useful deprecation doc:
> https://developer.apple.com/documentation/hypervisor/1441386-hv_vcpu_flush
> 

Reviewed-by: Roman Bolshakov <roman@roolebo.dev>
Tested-by: Roman Bolshakov <roman@roolebo.dev>

Thanks,
Roman

> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/i386/hvf/vmx.h      | 2 --
>  target/i386/hvf/x86_task.c | 1 -
>  target/i386/hvf/x86hvf.c   | 2 --
>  3 files changed, 5 deletions(-)
> 
> diff --git a/target/i386/hvf/vmx.h b/target/i386/hvf/vmx.h
> index 6df87116f62..094fb9b9dc9 100644
> --- a/target/i386/hvf/vmx.h
> +++ b/target/i386/hvf/vmx.h
> @@ -159,7 +159,6 @@ static inline void macvm_set_cr0(hv_vcpuid_t vcpu, uint64_t cr0)
>      wvmcs(vcpu, VMCS_GUEST_CR0, cr0 | CR0_NE | CR0_ET);
>  
>      hv_vcpu_invalidate_tlb(vcpu);
> -    hv_vcpu_flush(vcpu);
>  }
>  
>  static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
> @@ -171,7 +170,6 @@ static inline void macvm_set_cr4(hv_vcpuid_t vcpu, uint64_t cr4)
>      wvmcs(vcpu, VMCS_CR4_MASK, CR4_VMXE);
>  
>      hv_vcpu_invalidate_tlb(vcpu);
> -    hv_vcpu_flush(vcpu);
>  }
>  
>  static inline void macvm_set_rip(CPUState *cpu, uint64_t rip)
> diff --git a/target/i386/hvf/x86_task.c b/target/i386/hvf/x86_task.c
> index 422156128b7..c8dc3d48fa8 100644
> --- a/target/i386/hvf/x86_task.c
> +++ b/target/i386/hvf/x86_task.c
> @@ -181,5 +181,4 @@ void vmx_handle_task_switch(CPUState *cpu, x68_segment_selector tss_sel, int rea
>      store_regs(cpu);
>  
>      hv_vcpu_invalidate_tlb(cpu->hvf->fd);
> -    hv_vcpu_flush(cpu->hvf->fd);
>  }
> diff --git a/target/i386/hvf/x86hvf.c b/target/i386/hvf/x86hvf.c
> index 907f09f1b43..bec9fc58146 100644
> --- a/target/i386/hvf/x86hvf.c
> +++ b/target/i386/hvf/x86hvf.c
> @@ -125,8 +125,6 @@ static void hvf_put_segments(CPUState *cpu_state)
>  
>      hvf_set_segment(cpu_state, &seg, &env->ldt, false);
>      vmx_write_segment_descriptor(cpu_state, &seg, R_LDTR);
> -    
> -    hv_vcpu_flush(cpu_state->hvf->fd);
>  }
>      
>  void hvf_put_msrs(CPUState *cpu_state)
> -- 
> 2.33.1

