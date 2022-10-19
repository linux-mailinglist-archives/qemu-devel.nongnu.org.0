Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B90E605447
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 02:01:53 +0200 (CEST)
Received: from localhost ([::1]:35052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olJ0S-0004m9-MW
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 20:01:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olIwq-0001MI-DY
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 19:58:08 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1olIwo-0005io-ND
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 19:58:08 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so1685629pjq.3
 for <qemu-devel@nongnu.org>; Wed, 19 Oct 2022 16:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dWe1ZxZ8pTz6kD/cetljOEaJW28Xh9U+009TvvDzqvc=;
 b=wMBlJ+XUt2GMD5OWnR1xWnJ8CbVrZcF9tijU3GO59OB5eB1YZjMd4bLMtMiIsf1oaw
 AvVOLDsYc31v8+cZY7v/blvpo1OnkOXK18ehF4UjX+22wNRoM71gGgsa7b5Be59ttzdR
 i5cALI/201ESXFsOuuqvB3NOk++mvM0vJCsDJHlc4x889f7XlQYn1xndEa6UYld/dEcf
 VdWj9elEk5p2R3XitKAGKHt9xdO/u4iPXS/+HWR9fYiaOkPXF4gQmhLOm14eNuFrsRwF
 fglACJgl36rv7ggREOR+gFEdQHlg2E/h9SSjwjxCAS+4BFJbm8j2f3dS/hlEkrEKRREf
 WabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dWe1ZxZ8pTz6kD/cetljOEaJW28Xh9U+009TvvDzqvc=;
 b=NVGN8+/XCT6smIsHis9whosu9Bwe3+E7CTZ+xvIl/CBkbMLDXsnIjbPCoYhep6/KXJ
 2hg0WMr8MaLue6EEh63h4DbD2tdNjX87cSbk3WYVktF1ayJyK/nUe5epN+aMrL+6a+f9
 LdyaciUoA1aoZwMXmfJ+0HcwReaEpltT0JVhuCnPU5dVs+g6iMCyjv/DEwEz/fgZ8hEZ
 0stI3hY6pcrNoHxtbs+BEl9pkupPKVU8MJPG6v7tau4klWsdfSXd9U7WZh+IcPKZYHzC
 l0V004PnD4TrRA1DWscuaLae2Ie9qWDyWhOgehUkrs2T53Xxi0b1ctfMpL0jhUAZ27YH
 RMxQ==
X-Gm-Message-State: ACrzQf1/sjLWeCsbwSYlc4qTUYizSfBKGw2RugvZBDLC6wcIzTQznAaP
 ZqtqG9ZuIN6GYb36FVaCDeCNGg==
X-Google-Smtp-Source: AMsMyM7Xgl7HRobp518DuiMGcKJP727eRdqwZdq/ox4c6KS4Z71P9Wv0nEI3LLcSLaX78SQF8a+GXw==
X-Received: by 2002:a17:90a:fee:b0:20a:fbef:3e76 with SMTP id
 101-20020a17090a0fee00b0020afbef3e76mr12792886pjz.11.1666223884749; 
 Wed, 19 Oct 2022 16:58:04 -0700 (PDT)
Received: from [192.168.1.107] ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a170902f78600b001769cfa5cd4sm11333350pln.49.2022.10.19.16.58.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Oct 2022 16:58:04 -0700 (PDT)
Message-ID: <d11fbd88-5607-be2a-b5ee-2f34b9eece71@linaro.org>
Date: Thu, 20 Oct 2022 01:55:47 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [RFC PATCH] target/s390x: fake instruction loading when handling
 'ex'
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20221019113552.1051940-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221019113552.1051940-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 10/19/22 21:35, Alex Bennée wrote:
> The s390x EXecute instruction is a bit weird as we synthesis the
> executed instruction from what we have stored in memory. When plugins
> are enabled this breaks because we detect the ld_code2() loading from
> a non zero offset without the rest of the instruction being there.

Hmm.  The fact that you see an ld_code2 at all is incorrect.

(1) translator_lduw, which ld_code2 is using, is supposed to
     be only for instructions that we're executing, per plugins.
     But the usage you are seeing is a probe for the next insn,
     which should not be included.

(2) We always exit the tb after EX, so the probe for the next
     insn is also wrong.  We've got the tests in the wrong order:

         if (!is_same_page(dcbase, dc->base.pc_next) ||
             !is_same_page(dcbase, get_next_pc(env, dc, dc->base.pc_next)) ||
             dc->ex_value) {

None of that takes away from the fact that we *should* have a way to report the EX 
instruction to the plugin.


> +/**
> + * translator_fake_ldw - fake instruction load
> + * @insn16: 2 byte instruction
> + * @pc: program counter of instruction
> + *
> + * This is a special case helper used where the instruction we are
> + * about to translate comes from somewhere else (e.g. being
> + * re-synthesised for s390x "ex"). It ensures we update other areas of
> + * the translator with details of the executed instruction.
> + */
> +
> +static inline void translator_fake_ldw(uint16_t insn16, abi_ptr pc)
> +{
> +    plugin_insn_append(pc, &insn16, sizeof(insn16));
> +}

You're not handing the endianness of the two bytes.
I think you should just decompose all the way to fake_ldb.

I don't know much sense you're going to get out of the PC.  The EX instruction is at a 
particular address A, having loaded data from B.  The EX instruction is 4 bytes, but the 
insn at B may be 6 bytes.  The next insn executed may well be PC = A+4, apparently 
overlapping with the 6 byte insn you gave to the plugin just a minute ago.

But I don't know what else to report except [PC, PC+5], as you're doing.



r~

