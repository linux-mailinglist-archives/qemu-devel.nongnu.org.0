Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1DF6D2692
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 19:22:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piIQT-0003GD-1M; Fri, 31 Mar 2023 13:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIQQ-0003Es-M5
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:20:30 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1piIQO-0007yY-Ss
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 13:20:30 -0400
Received: by mail-pj1-x102f.google.com with SMTP id c4so5108984pjs.4
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 10:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680283227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CYipa/QLa3PyWBXCOADrhlYP0vasQs+OWgccO4L0NQA=;
 b=C7hautFeFeTTjlcSjzdlSnX1fLaYwBLwGyJpMjBoV64g2VGszRf1TedsKgF7OwH86S
 tx7uOnFFS8tSAxuAVOZFbHaecn+eRHsRWgyqFzli3WfAsV3gsAzyI96R/KlgjWYDseDx
 YUMyPhSf+VEQDINULt7mftXBC0luv6vlHJ85hibhlv+TM0z46PLS+kslLou2nFGhkZl9
 XslZApmZzaGfWqGeDeMw+ITwfq/tizdPDa0iTxDrcRLfqxjzbUyqQ40J3hlcv1S1znKn
 EC0GMYlvM0QAPjPVFMPrm8fm3+p+qa5QowbhTIr3aBKcquZjhS288tZjAS0d30jrO+Jo
 PEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680283227;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CYipa/QLa3PyWBXCOADrhlYP0vasQs+OWgccO4L0NQA=;
 b=d+XMsoZhIuYAEA6borg3OcqdIBXx5dvKx0JPspjFo3avsJlDB2UXzjQvCxmcwmfkC3
 eAKbuUwnfe0o5eAYBZ7EiUTuaPsMUfGZfNoqG99WkNYgaJeuHDsYZo3txntmWhwfZ23m
 3dtTvotu7N5c1ikNwywNULAAr1miAcnfyKHa8NllBUnkrzdaBoLi2pewouJzRfT7jirZ
 tSNSU17H2wVgeckQVa9M8J5mwq4d5ndNZNzJWfLbky6yxuvKg2R2XM3vCTnelHNK820A
 rABPqwfLCtx74FHwZep9UCAWD8J7y3DivxRmdmy3WDfjFBmL4UjakVjzW9AoBRQ3eGzJ
 s/NQ==
X-Gm-Message-State: AAQBX9cGex8xB4pU4H3k+1zloUF7cb3TfH5CuOhdEhqyHjDLQBCHUkac
 ERxyrHQJdyujhlE19DGXhQqcAw==
X-Google-Smtp-Source: AKy350YrpECUK/+NwNjN7l21lytH0ei07f7exm0G0lB+3lW0Aha81wTKhdurt66ubvbeLcGXk9BIsQ==
X-Received: by 2002:a17:90b:33c9:b0:233:a6b7:3770 with SMTP id
 lk9-20020a17090b33c900b00233a6b73770mr31706713pjb.14.1680283226699; 
 Fri, 31 Mar 2023 10:20:26 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:b714:1fce:85fa:2fc7?
 ([2602:ae:1541:f901:b714:1fce:85fa:2fc7])
 by smtp.gmail.com with ESMTPSA id
 s64-20020a635e43000000b004fb171df68fsm1847940pgb.7.2023.03.31.10.20.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Mar 2023 10:20:26 -0700 (PDT)
Message-ID: <74de6823-bcc7-afd9-fa6b-4c1d2c6e41b0@linaro.org>
Date: Fri, 31 Mar 2023 10:20:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PULL 00/15] tcg patch queue
Content-Language: en-US
To: Joel Stanley <joel@jms.id.au>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230328225806.2278728-1-richard.henderson@linaro.org>
 <CACPK8XebHkZ=08kDkYhZFmoZyOOSBcVynSY90qWe58cviCNYJQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CACPK8XebHkZ=08kDkYhZFmoZyOOSBcVynSY90qWe58cviCNYJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 3/30/23 03:37, Joel Stanley wrote:
> On Tue, 28 Mar 2023 at 22:59, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> The following changes since commit d37158bb2425e7ebffb167d611be01f1e9e6c86f:
>>
>>    Update version for v8.0.0-rc2 release (2023-03-28 20:43:21 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://gitlab.com/rth7680/qemu.git tags/pull-tcg-20230328
>>
>> for you to fetch changes up to 87e303de70f93bf700f58412fb9b2c3ec918c4b5:
>>
>>    softmmu: Restore use of CPU watchpoint for all accelerators (2023-03-28 15:24:06 -0700)
>>
>> ----------------------------------------------------------------
>> Use a local version of GTree [#285]
>> Fix page_set_flags vs the last page of the address space [#1528]
>> Re-enable gdbstub breakpoints under KVM
>>
>> ----------------------------------------------------------------
>> Emilio Cota (2):
>>        util: import GTree as QTree
>>        tcg: use QTree instead of GTree
>>
>> Philippe Mathieu-Daudé (3):
>>        softmmu: Restrict cpu_check_watchpoint / address_matches to TCG accel
>>        softmmu/watchpoint: Add missing 'qemu/error-report.h' include
>>        softmmu: Restore use of CPU watchpoint for all accelerators
>>
>> Richard Henderson (10):
>>        linux-user: Diagnose misaligned -R size
>>        accel/tcg: Pass last not end to page_set_flags
>>        accel/tcg: Pass last not end to page_reset_target_data
>>        accel/tcg: Pass last not end to PAGE_FOR_EACH_TB
>>        accel/tcg: Pass last not end to page_collection_lock
>>        accel/tcg: Pass last not end to tb_invalidate_phys_page_range__locked
>>        accel/tcg: Pass last not end to tb_invalidate_phys_range
>>        linux-user: Pass last not end to probe_guest_base
>>        include/exec: Change reserved_va semantics to last byte
>>        linux-user/arm: Take more care allocating commpage
> 
> Thanks for getting these fixes merged.
> 
> This last one (4f5c67f8df7f26e559509c68c45e652709edd23f) causes a
> regression for me. On ppc64le, qemu-arm now segfaults. If I revert
> this one I can run executables without the assert.
> 
> The segfault looks like this:
> 
> #0  0x00000001001e44fc in stl_he_p (v=5, ptr=0x240450ffc) at
> /home/joel/qemu/include/qemu/bswap.h:260
> #1  stl_le_p (v=5, ptr=0x240450ffc) at /home/joel/qemu/include/qemu/bswap.h:302
> #2  init_guest_commpage () at ../linux-user/elfload.c:460
> #3  probe_guest_base (image_name=image_name@entry=0x1003c72e0
> <real_exec_path> "/home/joel/hello",
>      guest_loaddr=guest_loaddr@entry=65536,
> guest_hiaddr=guest_hiaddr@entry=17411743) at
> ../linux-user/elfload.c:2818
> #4  0x00000001001e50d4 in load_elf_image (image_name=0x1003c72e0
> <real_exec_path> "/home/joel/hello",
>      image_fd=<optimised out>, info=info@entry=0x7fffffffe7e8,
> pinterp_name=pinterp_name@entry=0x7fffffffe558,
>      bprm_buf=bprm_buf@entry=0x7fffffffe8d0 "\177ELF\001\001\001") at
> ../linux-user/elfload.c:3108
> #5  0x00000001001e5434 in load_elf_binary (bprm=0x7fffffffe8d0,
> info=0x7fffffffe7e8) at ../linux-user/elfload.c:3548
> #6  0x00000001001e85bc in loader_exec (fdexec=<optimised out>,
> filename=<optimised out>, argv=<optimised out>,
>      envp=<optimised out>, regs=0x7fffffffe888, infop=0x7fffffffe7e8,
> bprm=0x7fffffffe8d0) at ../linux-user/linuxload.c:155
> #7  0x0000000100046c7c in main (argc=<optimised out>,
> argv=0x7ffffffff1c8, envp=<optimised out>) at ../linux-user/main.c:892

Gah!  I've exposed the same sort of overflow conditions within target_mmap and friends.  I 
think the only short-term solution for 8.0 is to revert the last patch.


r~


