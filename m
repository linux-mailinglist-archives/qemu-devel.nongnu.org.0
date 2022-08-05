Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4797858A484
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 03:40:37 +0200 (CEST)
Received: from localhost ([::1]:49642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJmKJ-0001wn-T0
	for lists+qemu-devel@lfdr.de; Thu, 04 Aug 2022 21:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oJmI3-0008ME-0C
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 21:38:16 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1oJmHx-0000g0-En
 for qemu-devel@nongnu.org; Thu, 04 Aug 2022 21:38:11 -0400
Received: by mail-pf1-x430.google.com with SMTP id c139so1045129pfc.2
 for <qemu-devel@nongnu.org>; Thu, 04 Aug 2022 18:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=0MC1aXXFD/F2RPwWLCHQLk9Dvj9n5nCe2dAeJt1lCvc=;
 b=mHxfnb623YTuRDCkGD2YyZh3LjVirSIVowfr2kztFpBE1eXvjQkGzvR/xUS8KrSWsG
 4SJNEUEBjl9Mt7TuCTufeJoIzlkArd2+zNClK+aTBO4zNUC7Gfw46Dn4v9Jbd8PMSjxL
 QtGjLVLRzLCUW+7HHXdUB8TTYiV9T3VVyNBHRdXCC+qvrLJN+JQv4GoVc7wDQT0Ws1Pb
 9JFc/dyDzxK56FstA62UwBSITlOzpoG+DDDCpBqWPtx1/e1YKXPmUaDGWgbAw8dWz1tS
 +plxbMK7A1PtvyuEMAYUrknw556W8UdlZP6EQAUrv4dQWN+VgxIGfmvVjxg66bQvOwyZ
 EFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0MC1aXXFD/F2RPwWLCHQLk9Dvj9n5nCe2dAeJt1lCvc=;
 b=zM3bQAU8OMGFwHzqycpABSlR9y9pXtJ91/SRMlKkk6LOuB1sftt1sXy+Oi2WIpUbBq
 uukAK8cHBrRsv0LoRwZ7OqXpNyNcmJHO6HDYTpnfEHlCwOptHRPTVqP6zOk2vOTwW/bi
 sB7FJARwEezpY/uBFK0Iqt6cs4LG4DZbNCP4d/fhxER9/o3u2SAKy+l1F6lf8tHMpLDx
 h7/5mVDQ5e0nKCXvusuVhRDHx7E+liWIvfBcUsMMKNj8C0M1LXyyqqYyZ/xOGm5g2vQh
 1gIKO14J/LlXH3XZQPCgT1GbNL09AdN10mAc4PnVZgSZHiR5Dsw3dLw+3wESOVvsuIMV
 awPw==
X-Gm-Message-State: ACgBeo3YA7/VwZVWSig7lhGEGt4h+phIQVCO2xHkv4/hf1xVXuydU+nF
 z8stdGA+gY10SpXIXnvjmoJBEA==
X-Google-Smtp-Source: AA6agR4SLkDbWNpukm6uHa55YA7IIf7ubK7Zy14dOxQjL5V9KocDJcj5gd60DRgTiS0cahh+LT1ioQ==
X-Received: by 2002:a05:6a00:1a94:b0:52b:21a0:afbc with SMTP id
 e20-20020a056a001a9400b0052b21a0afbcmr4404829pfv.13.1659663486714; 
 Thu, 04 Aug 2022 18:38:06 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.72])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a63da4a000000b0041c79a5f443sm503186pgj.9.2022.08.04.18.38.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Aug 2022 18:38:05 -0700 (PDT)
Message-ID: <3e59abfe-de87-ab99-d52b-6e8aced6c5d5@bytedance.com>
Date: Fri, 5 Aug 2022 09:32:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Re: PING: [PATCH] KVM: HWPoison: Fix memory address&size during
 remap
Content-Language: en-US
To: "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "mtosatti@redhat.com" <mtosatti@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Eiichi Tsukata <eiichi.tsukata@nutanix.com>
References: <20220420064542.423508-1-pizhenwei@bytedance.com>
 <527342ea-ad25-6f66-169d-912a6d75ae54@bytedance.com>
 <713249DB-CCBE-402D-96CE-447250FFDA42@nutanix.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <713249DB-CCBE-402D-96CE-447250FFDA42@nutanix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

Could you please give me any hint about this issue & patch?


On 8/4/22 14:59, Eiichi Tsukata wrote:
> Hi
> 
> We’ve also hit this case.
> 
>> On May 5, 2022, at 9:32, zhenwei pi <pizhenwei@bytedance.com> wrote:
>>
>> Hi, Paolo
>>
>> I would appreciate it if you could review patch.
>>
>> On 4/20/22 14:45, zhenwei pi wrote:
>>> qemu exits during reset with log:
>>> qemu-system-x86_64: Could not remap addr: 1000@22001000
>>> Currently, after MCE on RAM of a guest, qemu records a ram_addr only,
>>> remaps this address with a fixed size(TARGET_PAGE_SIZE) during reset.
>>> In the hugetlbfs scenario, mmap(addr...) needs page_size aligned
>>> address and correct size. Unaligned address leads mmap to fail.
> 
> As far as I checked, SIGBUS sent from memory_failure() due to PR_MCE_KILL_EARLY has aligned address
> in siginfo. But SIGBUS sent from kvm_mmu_page_fault() has unaligned address. This happens only when Guest touches
> poisoned pages before they get remapped. This is not a usual case but it can sometimes happen.
> 
> FYI: call path
>         CPU 1/KVM-328915  [005] d..1. 711765.805910: signal_generate: sig=7 errno=0 code=4 comm=CPU 1/KVM pid=328915 grp=0 res=0
>         CPU 1/KVM-328915  [005] d..1. 711765.805915: <stack trace>
>   => trace_event_raw_event_signal_generate
>   => __send_signal
>   => do_send_sig_info
>   => send_sig_mceerr
>   => handle_abnormal_pfn
>   => direct_page_fault
>   => kvm_mmu_page_fault
>   => kvm_arch_vcpu_ioctl_run
>   => kvm_vcpu_ioctl
>   => __x64_sys_ioctl
>   => do_syscall_64
> 
> 
> In addition, aligning length suppresses the following madvise error message in qemu_ram_setup_dump():
> 
>    qemu_madvise: Invalid argument
>    madvise doesn't support MADV_DONTDUMP, but dump_guest_core=off specified
> 
> 
> Thanks
> 
> Eiichi

-- 
zhenwei pi

