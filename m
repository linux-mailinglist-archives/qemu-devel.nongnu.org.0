Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3414C3ECAA9
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 21:26:21 +0200 (CEST)
Received: from localhost ([::1]:33262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFLlz-0007Lz-R6
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 15:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFLkV-0006Ab-Gt
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:24:48 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:44017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mFLkR-0003jx-Q4
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 15:24:46 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 qe12-20020a17090b4f8c00b00179321cbae7so13407441pjb.2
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 12:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OLmevI5K22pcTRnkoHu6i/Yu9JUYB8aeyCsGuHxE3TQ=;
 b=n3ghtEIpBDrwpu+Bl/1FHdGZUZ4fYoFif41gCm35Z3IyPaaNP1Pox4S0oLV3dbVW8s
 Dkt3CLgLghZ9yomhR/YItNhzNuXOxi4wZk0MmJjntxlFRejw0xzFrCB/EYIT0dYyvcUL
 s5rBJgnyLMa0Pa57Q7EjH1nSH0oGA91vVPK1+axTC2XAlWgbVF2c2xOkpuS6hue1y/i0
 TzQEIqqCBTDg9KFyCglDDZGzzIXjsJYIcmEfS4Hsjs2d3xeakDjuhMGktLxJk+EZcuFR
 pIu3tBLMlOhKUbHeRxXdNtdoLVtbSVQ22lDBXriF5I5xTVlmIwZkibpJ/9vWs5mypk+Z
 VisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OLmevI5K22pcTRnkoHu6i/Yu9JUYB8aeyCsGuHxE3TQ=;
 b=WBHqneoA7uA1Zh3anPts76sGgqpOqvDefd74+i8d8PPhXxFovHu7zLzobnjnMqRd3B
 nlGdKkNxldXBEjkgNGbtQaXsDWhhPGD7rIvyRdcFv0thmdOo6LtdPlYLq69sRQUgvV6e
 cPomLv5jPxTSV3k9DYTmIU/nXBO8GU7SbmxJB9y6ZTrnY5yUXQSZSLzeycrCQUjOOPjC
 UZwPKqW/rN+xocC2SSwdG3WB7vponqDQA+tqnMCGvjIzhP7WnswfnqPoi7jOf5x04oW2
 ZreGudGgdlTp8HNXKzhGV41rr4+mwDkK6kSFLNJpqzyanR8GhmelOEtUFMPiG44J/LYr
 jLwQ==
X-Gm-Message-State: AOAM532uU9iTrvouNMsOk6tHt1vVTD3CuFPtRTmOpdzz3BeTfkV1rTUU
 KTXyzazkiYQhc6Rt5DnxpRvIEw==
X-Google-Smtp-Source: ABdhPJwGduUOrAbOy3ORR7tmr4tO5wROl/4nWcaIIL+SEx4SAtKssr1qtQyr6l7tQ8sR2+PiU5cTIg==
X-Received: by 2002:aa7:8148:0:b029:31b:10b4:f391 with SMTP id
 d8-20020aa781480000b029031b10b4f391mr12503058pfn.69.1629055481602; 
 Sun, 15 Aug 2021 12:24:41 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id b9sm8934582pfo.175.2021.08.15.12.24.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 12:24:41 -0700 (PDT)
Subject: Re: [PATCH 12/19] target/ppc/pmu_book3s_helper.c: enable PMC1 counter
 negative EBB
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-13-danielhb413@gmail.com> <YRH6IysrDvn/GJvQ@yekko>
 <6a10c0a7-1c4f-0d24-f2cc-12666e590739@gmail.com> <YRNGo8CnfUSC/bQs@yekko>
 <4df4dacf-ba9b-f86e-8510-7c084420e974@gmail.com> <YRSX+kRCEh1oQjWP@yekko>
 <47018114-2249-0fe9-cb87-0ac35ed1e49d@linaro.org>
 <d63f0103-5899-b4ce-baa1-32d05676414f@linaro.org>
 <d2f1f35c-fc82-0b27-b41e-0b1055ecc2e8@gmail.com>
 <7f9ee790-3f5a-6161-627b-0c4313a08bca@gmail.com>
 <d312903b-7096-1ce6-28d0-5bb3690ae0eb@linaro.org>
 <67c127c0-33b0-abb7-dcb6-2143cc56a192@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f41709d-3616-5475-e831-d94ab6b379ba@linaro.org>
Date: Sun, 15 Aug 2021 09:24:37 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <67c127c0-33b0-abb7-dcb6-2143cc56a192@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.147,
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

On 8/14/21 9:13 AM, Daniel Henrique Barboza wrote:
> https://github.com/torvalds/linux/blob/master/tools/testing/selftests/powerpc/pmu/count_instructions.c 
> 
> 
> This test runs an instruction loop that consists of 'addi' instructions . Before running 
> the instructions
> there's an overhead calculation with an empty loop.
...
> static void ppc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
>       target_ulong nip = ctx->base.pc_next;
>       int sse;
> 
> +    gen_helper_insns_inc(cpu_env, tcg_constant_i32(dcbase->num_insns));
> +
>       if (is_jmp == DISAS_NORETURN) {
>           /* We have already exited the TB. */
>           return;

You've not considered how branches are implemented.

We generate code to exit the tb in gen_bcond.  Anything you emit after that is dead code.


r~

