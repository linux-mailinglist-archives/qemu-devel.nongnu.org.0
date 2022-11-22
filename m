Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034363333C
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 03:24:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxIvz-0005qk-Hz; Mon, 21 Nov 2022 21:22:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxIvr-0005qV-9Y
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 21:22:44 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oxIvo-000583-E1
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 21:22:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id z26so13063401pff.1
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 18:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HhYGGs7jFPIR/N6z+1hsE5f5+sEMzzPUj9xAWA4yIto=;
 b=orkuyhbnqMCdidgU8zv8ECfpdaq4LoBtBu+K6GQ9yWXjJA2IOyNLwuc5Rn1UdeT0v/
 48lHWyit0BheXTTLFJjNCBTwzdG5Y4lx3MINX9NNcBlTMXN4FP7PsQST2+xYIYiWzrwp
 dtsJEfPnaSeTCmg3UUkoR0iFeR7lUgyt5hT4iavr6Ek1rwcMg7o+K8d4BkyzggHazGUG
 OH4uSuyGnSKTukjsyw7eO/2yHzBYhm/Ss1l3G7fzOgdAcE9Ti5VX/4xdbqVzqXapxTjk
 JGTxUcHSSl/C5QPlvjW95mtXVeqhO2aYfewerF6yRlo/XDntTACuPVT8MQcdslPKwIZz
 7lNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HhYGGs7jFPIR/N6z+1hsE5f5+sEMzzPUj9xAWA4yIto=;
 b=JJ5mPGdpja0MR50KlTSG22UBYgfcSUkP6GndBYI/41TNiyZczLn846D3JiPSXUWsd+
 qAs3UkhZhWL38OuoMdhgczayuxl0vnUy4uQReHHiaxSU6EJYjlreauiWv209/fBRPvYj
 ib1f9zMlYhTKid6UYKNokcfQJlMhZG+t8kR5sOLmQpfdgFv9R5VVi8bcPBZbfBL+gAfK
 s4vtRv+cccj40KA/juHXVULvWzUUNmZBwfY1tX4jYhx+0wvps+4+9EBWCol0kOJ4eWHy
 vZLx/IV0vxQEeBBpmcmqLyu00dxcAXOVYaCXSRGT3btW5Yd79VU1zozP6w/0X+7zTvIU
 QFnw==
X-Gm-Message-State: ANoB5pnao9jFDwoF6CxWAMeyAaPTz7PG+p6bGNxLOO9UhgjJMLR05eQK
 doR36duKeY5CgZ5+fqjowM2Ehg==
X-Google-Smtp-Source: AA0mqf6sqkiq/4VE/3Q2zeOzJ82UGxB2YWrvLZBbrIZgsuojXjUsfDMmjQtw8wXaIdgX8S7LF5c2Tw==
X-Received: by 2002:a63:4081:0:b0:46f:e657:7d25 with SMTP id
 n123-20020a634081000000b0046fe6577d25mr19743511pga.347.1669083757091; 
 Mon, 21 Nov 2022 18:22:37 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:dd04:f222:eac3:5b54?
 ([2602:47:d48a:1201:dd04:f222:eac3:5b54])
 by smtp.gmail.com with ESMTPSA id
 hk5-20020a17090b224500b002130ad34d24sm7104825pjb.4.2022.11.21.18.22.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 18:22:36 -0800 (PST)
Message-ID: <a0eae94e-eafa-e206-be32-e2ce58e466d2@linaro.org>
Date: Mon, 21 Nov 2022 18:22:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Plugin Memory Callback Debugging
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>
References: <Y3QNRWUK8BLRQlaQ@strawberry.localdomain>
 <878rkbalba.fsf@linaro.org> <Y3vdIHJrR1k1lmf8@strawberry.localdomain>
 <871qpwc6i6.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <871qpwc6i6.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 11/21/22 13:51, Alex Bennée wrote:
> 
> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
> 
>> On Nov 15 22:36, Alex Bennée wrote:
>>> Aaron Lindsay <aaron@os.amperecomputing.com> writes:
>>>> I believe the code *should* always reset `cpu->plugin_mem_cbs` to NULL at the
>>>> end of an instruction/TB's execution, so its not exactly clear to me how this
>>>> is occurring. However, I suspect it may be relevant that we are calling
>>>> `free_dyn_cb_arr()` because my plugin called `qemu_plugin_reset()`.
>>>
>>> Hmm I'm going to have to remind myself about how this bit works.
>>
>> When is it expected that cpu->plugin_mem_cbs is reset to NULL if it is
>> set for an instruction? Is it guaranteed it is reset by the end of the
>> tb?
> 
> It should be by the end of the instruction. See
> inject_mem_disable_helper() which inserts TCG code to disable the
> helpers. We also have plugin_gen_disable_mem_helpers() which should
> catch every exit out of a block (exit_tb, goto_tb, goto_ptr). That is
> why qemu_plugin_disable_mem_helpers() is only really concerned about
> when we longjmp out of the loop.
> 
>> If I were to put an assertion in cpu_tb_exec() just after the call
>> to tcg_qemu_tb_exec(), should cpu->plugin_mem_cbs always be NULL
>> there?
> 
> Yes I think so.

Indeed.

As an aside, this field should be moved out of CPUState to DisasContextBase, because it's 
only used in code generation.

> 
>> In my debugging, I *think* I'm seeing a tb set cpu->plugin_mem_cbs
>> for an instruction, and then not reset it to NULL. I'm wondering if its
>> getting optimized away or something, but want to make sure I've got my
>> assumptions correct about how this is intended to be working.
> 
> We are expecting some stuff to dead code away (but hopefully in pairs).
> We don't know ahead of the instruction decode if it will be a memory
> instruction so opportunistically insert our empty helper calls. If no
> memory access is done those ops should be gone. This is all done to
> avoid doing a 2 pass translate.
> 
> Richard,
> 
> Have I got that right? I think thats how I remember the TCG code working.

That's about right.


r~


