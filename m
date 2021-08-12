Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D733E9DB8
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 06:57:53 +0200 (CEST)
Received: from localhost ([::1]:52196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE2mu-0007d2-0l
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 00:57:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2li-0006hN-Sv
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:56:38 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:40959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mE2lg-0004fF-EO
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 00:56:38 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so13264462pji.5
 for <qemu-devel@nongnu.org>; Wed, 11 Aug 2021 21:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tT+4jryVGu05BQZ7A7stOmZS41JyJMaQpHxqjrcRcnA=;
 b=RJxXjSrMsqC+1owDd0nkcXvSRcAMoMvLR/rVp1UklbMVAOPbhDOvIShP3EkGHtBJ6T
 aQenKASL1Z8Hq2xI7yrOYnAYvChcPZgVzQmhvDBiol4ZgFRBwK1iYBmihLKde91geJ5a
 t7AJPYVkSBmVRDmWBRb10qLNI5KjRqwNWqfCLU6b99S54Gd5wOMlLCEmdhsbL/7h1V/w
 8BUysTvDuDmmctFLO9RM8BBBAWzfrVlYYLL/b5O4uTxV8yMOAOeAsYRD6j0giPQEVxpI
 jEh0RdqgiBFIY/H8zd5OOq6VmL+0RAtFxQBYSDhglph36HBoYS8DZ8Deh04R7W9f7hEG
 CRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tT+4jryVGu05BQZ7A7stOmZS41JyJMaQpHxqjrcRcnA=;
 b=XZUldC5egt/Novx7AOCLk3UQogwFI1kthxwqXdS77sd9XsCx4gcO0poKPp3l3WOTLX
 DGph7nK9aeI0hoQGtKxSVTnZarlJy8VOPXf3kavWlttSCtHvPalMxEF6/TZ9buNaPFba
 szFnLQttQUBeJ1ZtX4o99Ox+H5otLgOLenGihEF5m7fUoNBkm63HUY+PFb6QqIVPzk/4
 SWvXTR4womZM5t4o6OzsVZWe+2pcBQwXL4ELZJYufEjILeVJtZDKkcBRL5UB8L1HJKYM
 6GSSqmuIh7oLlSExwkilD8GsHNT4A5yyVjgHMBkjDs3XvUEpOEciVTPsp4fuyV3xldUl
 dOEg==
X-Gm-Message-State: AOAM533QcJFvDmpBM/p6ypMAbzRXxQYN8U5gTDM8WRHcpu4DDF+v7o2h
 EUfCcbUJOvfUB7PG1HVaId8p5A==
X-Google-Smtp-Source: ABdhPJweD3VVpZvsVV1VTIfH0dntNRUWGbcZgORsgHyw+GAYYPJlbxrAW2YUTdSrw/lUMCASdAY5lw==
X-Received: by 2002:a63:1a46:: with SMTP id a6mr2187224pgm.226.1628744194883; 
 Wed, 11 Aug 2021 21:56:34 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id f66sm1393667pfa.21.2021.08.11.21.56.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Aug 2021 21:56:33 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
From: Richard Henderson <richard.henderson@linaro.org>
To: David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
Message-ID: <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
Date: Wed, 11 Aug 2021 18:56:30 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, groug@kaod.org, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/11/21 6:45 PM, Richard Henderson wrote:
> On 8/11/21 5:39 PM, David Gibson wrote:
>>> I mean, nothing is stopping us from calculating cycles using time, but in the
>>> end we would do the same thing we're already doing today.
>>
>> Oh.. ok.  I had assumed that icount worked by instrumenting the
>> generate TCG code to actually count instructions, rather than working
>> off the time.
> 
> David, you're right, icount instruments the generated tcg code.
> You also have to add -icount to the command-line.

Oh, and btw, icount disables multi-threaded tcg, so you're going to be running that guest 
in round-robin mode.

Icount affects so many aspects of qemu that I really do not think it is the best option 
for a PMU.

If you want to count instructions retired, then just do that.  Stuff values into 
tcg_gen_insn_start so they're available for exception unwind, and otherwise decrement the 
counter at the end of a TB.

If you really must interrupt exactly at 0 (and not simply at some point past underflow), 
then we can adjust the tb lookup logic to let you reduce tb->cflags.CF_COUNT_MASK in 
cpu_get_tb_cpu_state.


r~

