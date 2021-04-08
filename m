Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA492358CFE
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 20:54:11 +0200 (CEST)
Received: from localhost ([::1]:39948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUZn8-0000ar-DE
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 14:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZl0-0007vk-2o
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:51:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZky-0004FT-DT
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 14:51:57 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so5250763pjb.0
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DkNqo7WsSitVCtODJIwTEmaQB3gOywUitP/N79B9E1I=;
 b=e3+fTrMX82CQOAO+OOajZRMMyDJa7FpKag/LcJNme3rb7pYsWbc8GK4LmjgFjMsNBH
 SA/Wpgm2N5HpJwoFdcRIThMhn/zxYIWhd23D9gDQAqGfNuU+EYYpJLnBtbbvwEbDt/Rr
 kPIqO9fAIyEd9AU+NF08s/LcKnMYFuwN0IiG6HMQ9S6pTMpmdDLjG5bDWdasWuMIn+Rx
 /ikaQUxtDUtxWSHjmLsR2Q+GdRK97D/GkoK7nkzzhqvSWnQ6J/ceEhqrMneEJt0VM2Em
 mMPmT7rG1l4ZKHOpchmtNmiEIXK1wBPX7MQecX/o6juFdN6RBv9XgIOb9W8v0d/XlG4w
 oP3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DkNqo7WsSitVCtODJIwTEmaQB3gOywUitP/N79B9E1I=;
 b=tupc/ErfGmrfANojabcquCw/GvuRNOiMfn36GQ3Pv7JlS1Z6K6vZaFRYjmWlPIrS/o
 S+AYmogv/s79wD9nWYwHlfQXqBRyAJdL2Sw3pzHOyDQIxU6sPY5xvZ18FnPplGOlaESk
 sXseLTeX1UJIkhGkSL6iNIPkFSTHxnzIMCECwJPsjwjTbs22IbQhkdNozgrpzWgyO92N
 PezbDz1R9HdezIhQF9ON8/7WmgElcBDz+sRerYDtUtxXj1h05zVh2p3UGTaGfiD0RVQ4
 OW0FAWbPc87LJyw7+2wIpXv+Ys4cKIFnD1IYVZqtlDrBfDRyiZy3kVv+5HzBYkKFQU6y
 OZHA==
X-Gm-Message-State: AOAM531APgUK5hG1Ze5RLE3KHD+bWYq0oGHPfpaBqpPDCe5Sfgj1DWEN
 ViHWHDJNa99993VfWcK0jiaU3Q==
X-Google-Smtp-Source: ABdhPJxW8NkOcjQWorTcUZ6+IME0t6cffw+3ipFGEzNz6+QHcJcxji7GQdit7tuHoRUA6b1OgY7dOQ==
X-Received: by 2002:a17:90b:3609:: with SMTP id
 ml9mr10472308pjb.142.1617907914973; 
 Thu, 08 Apr 2021 11:51:54 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id x2sm102692pgb.89.2021.04.08.11.51.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 11:51:54 -0700 (PDT)
Subject: Re: [PATCH v1 4/8] target/riscv: Remove the hardcoded MSTATUS_SD macro
To: Alistair Francis <alistair23@gmail.com>
References: <cover.1617393702.git.alistair.francis@wdc.com>
 <7efb55362999a5b709ea8e7fa0ea188e740d9c67.1617393702.git.alistair.francis@wdc.com>
 <81cbeace-c357-1ef3-1a1c-f1b266e66a98@linaro.org>
 <CAKmqyKNN7y=WV5=Bqd7zjLrYL620QOzrz=YR0XgdxMe+pLBxcw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <19807b18-f61f-5ff4-253a-aad940260f30@linaro.org>
Date: Thu, 8 Apr 2021 11:51:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKmqyKNN7y=WV5=Bqd7zjLrYL620QOzrz=YR0XgdxMe+pLBxcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/8/21 8:20 AM, Alistair Francis wrote:
>>       target_ulong sd = is_32bit(ctx) ? MSTATUS32_SD : MSTATUS64_SD;
> 
> It turns out clang doesn't like this, so I might still be stuck with ifdefs.

I think we need

#ifdef TARGET_RISCV32
#define is_32bit(ctx)  true
#else
...
#endif

based on

$ cat z.c
int foo(int x) { return x ? 1 : 1ul << 32; }
int bar(void) { return 1 ? 1 : 1ul << 32; }
rth@cloudburst:~$ clang-11 -S -Wall z.c
z.c:1:37: warning: implicit conversion from 'unsigned long' to 'int' changes 
value from 4294967296 to 0 [-Wconstant-conversion]
int foo(int x) { return x ? 1 : 1ul << 32; }
                  ~~~~~~         ~~~~^~~~~

r~

