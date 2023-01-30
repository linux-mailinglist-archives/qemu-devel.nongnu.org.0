Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B31681A85
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 20:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMZsE-00026W-SS; Mon, 30 Jan 2023 14:31:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZsD-00026J-0k
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:31:25 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pMZsB-0007bY-By
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 14:31:24 -0500
Received: by mail-pf1-x436.google.com with SMTP id n2so8617281pfo.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 11:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eCFoNt1jRz09QsibqsdldoOn+tEyu0sGypvd8j7h204=;
 b=dGezz5trEw/wsIOmdoes0/JdEOyymFMbLSPg9J1iM2W0QAqE71+qy+axjcYZ08mBCE
 vgwsx7v1y98OxxhL+n5ODC7lsqeFKXz04uj2jEutHTTUR3W3PKmV+J9DhtEZ57OAYaY/
 um8l+R4uQtcB9N3hnDnXJoOJBWe0QhaKQPSZvBJgz4B7ozfDq/apaGVgDu8W05u35JNx
 5KqenwkQMazyQnerXrYWxWfzMYouz+aIEgXce64/IbLXIyEqmHVuMyc+fQ3O702e4/9C
 w5FuLasCle6yFBjktdr5ax4HxZRUDsT4TazmwK0EWHcqKv1AaKpvOJ53mFbDcoIYrCVu
 GBsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eCFoNt1jRz09QsibqsdldoOn+tEyu0sGypvd8j7h204=;
 b=FKQ4eCEz7HoW2uhj/kO/Ctpaq6KQe6SbM07PLln/QHwb/V/+AH35VC3bxZwR1KEL//
 PV+V0P2yIx0MzESIeps/UTS0MQQ72mv5KZtUeBgR0312gatIdUDYSsrkHkvJmfP8sSCK
 VODbw0yhqzUOKByFG+J1x/FLo8zff8TJfuUJwW+fWH8vef38LYA4XGYMjEW6zq8Z0myy
 y1rcLLvWBlkDwXTzlCbUpVV26xLuXtXO8O7ZNYG0zICI2v6GTnKo42G1ikHH/yuPPdRu
 4qSA7r9bGuoZYUUyao3yn3tPrCCe+rwKJMprprK2PDHD6d0MT4ZzvoNgJFtnUM75PNPd
 GPXw==
X-Gm-Message-State: AO0yUKXP9KyLqi/zgTogY6+OXC7Mo2wTIC3qru+nKHyR0tpng9iL9Ppv
 A6495Vm+s4o04zosneH/zBKx3w==
X-Google-Smtp-Source: AK7set8/4voGNHBgemKhyzRL/sMMQhAFyQPPAp1NNj+tkn+7cqZ0qROvoZzZZ09FDV8YypnkKLYXMA==
X-Received: by 2002:a05:6a00:2406:b0:590:6ff5:5704 with SMTP id
 z6-20020a056a00240600b005906ff55704mr20623301pfh.8.1675107081435; 
 Mon, 30 Jan 2023 11:31:21 -0800 (PST)
Received: from [192.168.50.50] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 s64-20020a625e43000000b00590774b9ea1sm7864973pfb.107.2023.01.30.11.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Jan 2023 11:31:20 -0800 (PST)
Message-ID: <4c611630-1399-d08a-5887-bc60511bcdac@linaro.org>
Date: Mon, 30 Jan 2023 09:31:17 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Please review a important patch abort fix setting of
 CPUX86State::gdt::base
Content-Language: en-US
To: fanwj@mail.ustc.edu.cn, qemu-devel@nongnu.org
References: <4dd3e63d.4889e.185fd6e590e.Coremail.fanwj@mail.ustc.edu.cn>
 <CAFEAcA_wL3PBW3aG=3nmQhJ6c6vrvy6=NE3DXn3Q06ct4pV19g@mail.gmail.com>
 <bc1f835.49eba.18602ce7f81.Coremail.fanwj@mail.ustc.edu.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <bc1f835.49eba.18602ce7f81.Coremail.fanwj@mail.ustc.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/30/23 03:12, fanwj@mail.ustc.edu.cn wrote:
> 
> 1. "The memcpy is definitely wrong, because you're casting a guest address into a host address, which is incorrect. You have to use g2h()."
> There is no need to use g2h(), Because there are both guest address whether source or dest memory. refer to "linux-user/i386/cpu_loop.c" target_cpu_copy_regs function, Only use g2h_untagged when convert gdt::base to gdt_table. I don't use and modify gdt_table, Only copy gdt::base from source CPU to dest CPU. They are same type so no needed to convert by g2h.

This is *not* about the type, this is about the location in host memory, as input to 
memcpy.  The g2h function is 1-to-1, but it is not the identity function.


> 2. "I'm actually surprised that you need this for TARGET_X86_64 at all ..."
> GDT on QEMU User Mode is Pseudorandom GDT，It is NOT kernel private data structures. It is NOT Global Descriptor Table. It IS index table of fs and gs. And It is Thread local data. The Memory which gdt::base point can be modified by syscall SYS_set_thread_data.

Well, then you'll need to fix other assumptions in target/i386/tcg/translate.c, beginning 
with

#if defined(CONFIG_USER_ONLY) && defined(TARGET_X86_64)
#define VM86(S)   false
#define CODE32(S) true
#define SS32(S)   true
#define ADDSEG(S) false

which currently means that whatever you do with set_thread_data won't be recognized at 
translation time.


r~

