Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E8D6EBEFD
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 13:01:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqXRt-0000Ml-Fk; Sun, 23 Apr 2023 07:00:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXRo-0000Jz-Sk
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:00:01 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqXRm-00036U-4F
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 07:00:00 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2efbaad9d76so3121093f8f.0
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682247596; x=1684839596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/aQObA+sNj7tkAQsxCLj6UYKXbZIOGSrA2zXnvSBpSs=;
 b=bKbFK3gSADE/WzDTX+6FOr+Ms7JeviPPu0YMCD7UitexTDet6JM28pko0I5dNGyJDW
 mnjx0OPnuxWabiN3WzD7Oo9+z8z1VbbwKvhct3cIEvvMMkD7fvaPQs3QhA34MiQDHlnY
 89AJJwjsCmsvfLkik0ORYxBifJe5ncX0SuU8N//OTU+0kWux2Atgxdjy73whPd0cHFQu
 L74D98UEW4Z70tgn2C0WB+M04IEXy90scbAkeHMwTXdAyspV23ywEaJ8sGGJf6YCXntY
 bOTVbts9EJXlOKq7xRjLPyOn5/helal3eKcZCzQ1twKETXUzyyHjh/piD0Rii7+LRDT9
 8u4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682247596; x=1684839596;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/aQObA+sNj7tkAQsxCLj6UYKXbZIOGSrA2zXnvSBpSs=;
 b=GlaqP3993EzaAQH+/6ROF6gpC575218ntIZUIKuE5b3BDTXXAt8MqhQUkcDmV9rFN/
 esLvDWpndf8yLahpKk8LM/8eCzd8DXWP1MiBGweVYT+FJl9br+p+mUcFpl383B+WFhqy
 l3LEHIElm8EbbdSW7b8H646lLA/YczU2MZjzXB6GAjizCNY3eO7vMX9yBPdjvvFWQSVm
 10JR0ZWTKK2aj+mbohuKIeunfis1TM7iubgqyQVZvECDP7tW8XfNEmMmquMNWrXkEJVm
 riiFMCtWChuCb8IK5YeL1FFc9g8eedEcdzwsc2m9ko30+rZM3r9OfqGe0JneyneatnBv
 coTw==
X-Gm-Message-State: AAQBX9fzf5ZTQHh/7JkPl5hFWbLLXJujzLV+Llrcg+Y8YhmURe3Fclsr
 2rOhaNrb+pJqSGOAi1vVXOrqGA==
X-Google-Smtp-Source: AKy350b0zd2ru8IIxqjHoMY9O4Vbb/CkuWLXuzpdK0ps/xOscC018QnJ9hNx3b32MTJPV/x25vE+og==
X-Received: by 2002:a5d:44cc:0:b0:2ff:4904:c377 with SMTP id
 z12-20020a5d44cc000000b002ff4904c377mr7211304wrr.25.1682247596269; 
 Sun, 23 Apr 2023 03:59:56 -0700 (PDT)
Received: from [10.43.4.99] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b002fa6929eb83sm8412761wrv.21.2023.04.23.03.59.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 03:59:55 -0700 (PDT)
Message-ID: <3a0dff2a-37f8-5346-62ce-e6a01e793619@linaro.org>
Date: Sun, 23 Apr 2023 11:59:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/8] Start replacing target_ulong with vaddr
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230420212850.20400-1-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420212850.20400-1-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/20/23 22:28, Anton Johansson wrote:
> This is a first patchset in removing target_ulong from non-target/
> directories.  As use of target_ulong is spread accross the codebase we
> are attempting to target as few maintainers as possible with each
> patchset in order to ease reviewing.
> 
> The following instances of target_ulong remain in accel/ and tcg/
>      - atomic helpers (atomic_common.c.inc), cpu_atomic_*()
>        (atomic_template.h,) and cpu_[st|ld]*()
>        (cputlb.c/ldst_common.c.inc) are only used in target/ and can
>        be pulled out into a separate target-specific file;
> 
>      - Calls to cpu_get_tb_cpu_state() cast pc and cs_base to
>        target_ulong in order to avoid having to touch the target/
>        directory in this patchset;
> 
>      - walk_memory_regions() is used in user-exec.c and
>        linux-user/elfload.c;
> 
>      - helper_ret_*_mmu() is used in tcg/*/tcg-target.c.inc and
>        tcg/tci.c;
> 
>      - Functions in translate-all.c dealing with TCGContext.gen_insn_data
>        will be switched off target_ulong once gen_insn_data and
>        TARGET_INSN_START_WORDS have been dealt with;
> 
>      - kvm_find_sw_breakpoint() in kvm-all.c used in target/;
> 
>      - The last address when looking up page flags for an interval
>        [start,last] in pageflags_find()/pageflags_next() is still
>        target_long.  I'm not sure why this is required.  This only
>        seems relevant on 32-bit guests since the addresses passed
>        to the interval tree are uint64_t's, are we relying on a
>        sign extension here for some reason?
> 
>      - CPUTLBEntry and functions that read from it will be left for a
>        later date;
> 
> Smaller patchsets implementing above changes will follow.

You may wish to browse my work in progress

   https://gitlab.com/rth7680/qemu/-/commits/tcg-once/

to avoid duplication, as I have done some of these.  This tree is on top of my atomicity 
patch set; I'm working on upstreaming that now.


r~

