Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6139F44C333
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:42:28 +0100 (CET)
Received: from localhost ([::1]:49550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkonz-0003nG-Ie
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:42:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkomd-0002x2-Ub
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:41:03 -0500
Received: from [2a00:1450:4864:20::32c] (port=50902
 helo=mail-wm1-x32c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkomX-0006Jy-R4
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:41:03 -0500
Received: by mail-wm1-x32c.google.com with SMTP id 133so2438260wme.0
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=flpWnVgKba87/5QDk3vpVNhIyy1OKyt2YChtxNGleXc=;
 b=eSkqfJK2Q5vvXXzWKFRCyYiG+usAWk23kfGD6fCryqyajAKuAaCEVybQETpUH8Nms5
 z9SkFapL1RiqhNiaP8Fgj7WvoqrDxO8DXNhuRIC2MIyGVqFYWm+A+6TgoAkE3txz/uCm
 GSsl4vDntDE4JH4/A+09VLIp3RLvjGTK7hZ4Vdkba6IDyDOJCIJ9ZfWiUSghvp0FAAqA
 DIQPXEqhZHonH0MJx4Q0YewtSH5W/HMd04TcbF8gJBUdDTQQ+MfdqEkR2o5DDWCZ44q0
 HhaMw/ACdEHhydv3PaYqGApjD7fIa1eHOJhvgbjODJ7fDgWKNz8PIErN9urHOFwHHcm/
 KHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=flpWnVgKba87/5QDk3vpVNhIyy1OKyt2YChtxNGleXc=;
 b=yDQ4jUZj/huE4Nmc/5NnMKEXtcFcRWZpPTiqp2bskldlksXiY88RRLAwe8QxvtwncW
 tsIABwjlwyCef8qNdPBcoGkdhkcp5YDSAIQNKkWrrqaUMlFtPoRZeXaY8DOJW/3X5gi6
 eNcRxtQ5Hn4qt6zFUCoJwy7ijvRbEN4LRTB/Rt/hCxjqh7S5zei6xyk+40Q8/SGExM5L
 56xQQw8CZXuB1LFKt5KoDNTSZcZMz21zSL4h0Xy65n9iT/4Lu5NKe0k5lj8zS7gQZTxB
 f0edpErKlRx5gL2UOXSfEcHsqESwBk7MHTJ8wm891Xq/eHz4Xlldf9vanQG/KoM03/f0
 XV0w==
X-Gm-Message-State: AOAM532cOB81DYxVDZOGYRWl8yA+6kVKf+RAWlWdqE8ixlPvQlDvktOv
 yoDa3yxeo2ECmbtOMgM0F25Lng==
X-Google-Smtp-Source: ABdhPJy8PFMT8A600cdgRvF+6v5zFgmyZ63e/LAEn6HKMMSymagSvB3ioYgjeq9dnC36DMiOLQLOtw==
X-Received: by 2002:a7b:c119:: with SMTP id w25mr152337wmi.70.1636555255981;
 Wed, 10 Nov 2021 06:40:55 -0800 (PST)
Received: from [192.168.8.106] (104.red-2-142-241.dynamicip.rima-tde.net.
 [2.142.241.104])
 by smtp.gmail.com with ESMTPSA id l2sm5945244wmi.1.2021.11.10.06.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 06:40:55 -0800 (PST)
Subject: Re: [PATCH v2 05/14] target/riscv: Calculate address according to XLEN
To: LIU Zhiwei <zhiwei_liu@c-sky.com>, qemu-devel@nongnu.org,
 qemu-riscv@nongnu.org, Alexey Baturo <baturo.alexey@gmail.com>
References: <20211110070452.48539-1-zhiwei_liu@c-sky.com>
 <20211110070452.48539-6-zhiwei_liu@c-sky.com>
 <7dace3b5-1320-20b3-703c-bbdf7e745fb9@linaro.org>
 <df0a3a5a-7ca5-b2dc-36c0-d802df99b5b0@c-sky.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bbafca7f-1984-f030-cabc-b5f62ef5afd5@linaro.org>
Date: Wed, 10 Nov 2021 15:40:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <df0a3a5a-7ca5-b2dc-36c0-d802df99b5b0@c-sky.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, NICE_REPLY_A=-1.678, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/10/21 2:44 PM, LIU Zhiwei wrote:
>> I suspect the extend should come before the pointer mask and not after, but this is is a 
>> weakness in the current RVJ spec that it does not specify how the extension interacts 
>> with UXL.  (The reverse ordering would allow a 64-bit os to place a 32-bit application 
>> at a base address above 4gb, which could allow address separation without paging enabled.)
> 
> Agree. Should we adjust currently, or just add a TODO comment here?

Let's add a todo comment for sure.

>> I do think we should merge gen_pm_adjust_address into this function so that we only 
>> create one new temporary.
> 
> I think custom instructions will be added in the future. And possibly there will be  some 
> custom load/store instructions.
> If we merge gen_pm_adjust_address,  we may have to split it once again at that time.

I don't think so.  We're simply having one function to compute a canonical address from a 
register plus offset plus mods.

Also, patch 10 combines pm-mask with zero-extension, so we shouldn't need to do both here. 
  The checks should be combined like

     tcg_gen_addi_tl(addr, src1, imm);
     if (ctx->pm_enabled) {
         tcg_gen_and_tl(addr, addr, pm_mask);
         tcg_gen_or_tl(addr, addr, pm_base);
     } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }

and could possibly be extended to

     if (ctx->pm_mask_enabled) {
         tcg_gen_and_tl(addr, addr, pm_mask);
     } else if (get_xl(ctx) == MXL_RV32) {
         tcg_gen_ext32u_tl(addr, addr);
     }
     if (ctx->pm_base_enabled) {
         tcg_gen_or_tl(addr, addr, pm_base);
     }

with one more bit in TB_FLAGS, e.g.

     if (env->cur_pm_mask < (xl == MVL_RV32 ? UINT32_MAX : UINT64_MAX)) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_MASK_ENABLED, 1);
     }
     if (env->cur_pm_base != 0) {
         flags = FIELD_DP32(flags, TB_FLAGS, PM_BASE_ENABLED, 1);
     }


r~

