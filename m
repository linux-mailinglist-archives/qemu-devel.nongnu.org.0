Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39985696ABD
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 18:04:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRyhE-0006vx-1d; Tue, 14 Feb 2023 12:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyh9-0006uJ-M2
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:02:19 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pRyh8-0007S1-1D
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 12:02:19 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 d13-20020a17090ad3cd00b0023127b2d602so16034440pjw.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 09:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OzZV46h5GRpbV/pl//EexeFF+dgefhGyiSqalfOuhkc=;
 b=PyDc9Un/e7R/CgRHZO4NczlQyKDgMCUoOL3nf1gqCsDHXTZAqCMaMib+I+2y2asVmW
 fVdedRm2wNmYxWvtAC246nohpfYAlIVCb46Gx9AUBcmq6Z/Dw20ZZ6ZdJ5JRWHlyjMn6
 Ts0H2s/v2KVfahgpuEoTs/P1EnpveWRK/dAojHi8/BWDk5drYN53R034RnVsrv4ayxWD
 lT3fAe0dgg0qv+6W2asGl1DTldaVO6UOQRXauOLxAx9JVAL7eHNo9HslcjVRHj4rLgdX
 Sbfqx8MJioAXzOraphIju41svSBejSAN5mISx41bK4D23UlkkKjbsOilOJQRem10kOX7
 cjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OzZV46h5GRpbV/pl//EexeFF+dgefhGyiSqalfOuhkc=;
 b=0IftKqCIcd3e8PqcBcUaGLwGIHXZ1gvck1VDhTB9e3kLta3yaS7II2J/1hpdCaLJhY
 jj+kpa+8DKtHnLDYOwHgICmAmRBSeSEJMMrN/BPUqcfw2pxwjsV+sw96mQ0jW8bcEhHQ
 Bz/R+hSPCgKm9a5PLRnffQ20lzEOugwlb3Mn2kMHLhD6AZSIrVn7Jy8E9LNH0pNSAJqQ
 vTq6R7yp6gSC6oFaNbSc12XF3KmOsC6meGjuHcPESM7b27r/tM7qQ8iPrErGfyoZLVDW
 BvvcBX2ihOlFj/QVqgjUH6UNHTou3tRpyMyW2v+pGUnQYXn4cWW2P23imjtEYZZt+jeM
 2vGg==
X-Gm-Message-State: AO0yUKWl6j0OhJgutU+R7JzJ7ClitQNy1II92HvnmdogAVV9hsJyVExN
 VB7QzwLWjA2OuO5dYj4pbPLthw==
X-Google-Smtp-Source: AK7set+xKRVoU8aZbVFi+ap4IvsHmz1dMPcqDEiE8S+9O0+TvxhEwh+YGnsuiRISGlPjZXOngFLYQg==
X-Received: by 2002:a17:902:e54f:b0:19a:b427:232d with SMTP id
 n15-20020a170902e54f00b0019ab427232dmr4250937plf.45.1676394136197; 
 Tue, 14 Feb 2023 09:02:16 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 z19-20020a170902ee1300b0019a7d58e595sm7217914plb.143.2023.02.14.09.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 09:02:15 -0800 (PST)
Message-ID: <4ed07e71-17df-fca1-7e80-0b3aed7ca910@linaro.org>
Date: Tue, 14 Feb 2023 07:02:12 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/4] util/cacheflush: fix illegal instruction on
 windows-arm64
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org, 
 alex.bennee@linaro.org
References: <20230213161352.17199-1-pierrick.bouvier@linaro.org>
 <20230213161352.17199-2-pierrick.bouvier@linaro.org>
 <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA--p8kRsbTy4vg83fEap_MO--HEMcOGGnnXzcxJYZW6Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/14/23 06:44, Peter Maydell wrote:
> This will cause us to not use the generic aarch64 flush_idcache_range(),
> which uses DC CVAU and IC IVAU. Does that not work on Windows?
> 
> If it doesn't then I think the ifdeffery would be more clearly
> structured as
> 
> #elif defined(__aarch64__)
> 
> ifdef CONFIG_DARWIN
> [macos implementation of flush_idcache_range]
> #elif defined(CONFIG_WIN32)
> /* Explanation here of why the generic version doesn't work */
> #else
> /* generic version */
> #endif
> 
> #elif defined(__mips__)

More specifically, there *must* be a replacement, or TCG will not work.
It appears as if FlushInstructionCache is the right syscall on windows.

I cannot find documentation for a data cache flush.  But until there is also a way to 
allocate split w^x memory regions (tcg/region.c, alloc_code_gen_buffer_splitwx), you need 
not worry about that.  You could reasonably assert(rx == rw) there.


r~

