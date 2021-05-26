Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4982E3920E2
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:31:29 +0200 (CEST)
Received: from localhost ([::1]:52046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llzFV-0004rn-Lr
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:31:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llzCq-00048T-9Y
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:28:40 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:33717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llzCn-0007Vu-Pf
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:28:39 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 v13-20020a17090abb8db029015f9f7d7290so4144272pjr.0
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 12:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EORavrUCI6LnV2nkXRXDXRmRuBt79sdgsXDG/NChsLM=;
 b=obQ5bqnNhqU2ZOCMLzf7WM1wA9kLHbvYozsKQZhAr1DwsQwwNy4SeNwoQwpNYM2DJL
 VgLFV+XFMapcZBsOlXk5a/q3UMG1XZ4fYFvW/K6Jn1JfX1WISCb/g+0CPNj078DyRq/a
 vU4qgyXMvSKjcjuLiizzAC97M4UcWLF2FsFx0oPKAn+pTBcET//1NAbXrSYuEHMY7vgg
 xd6JtOCd/8rzzY5y5VXqerUYFpz1iqMExSs6Ve0+AZrkAISZ00WgVxOdn7jo/pVQJQ2q
 xGc5qnpvcTYk72YpSUzLtcHhC2T/i+o6+q/pzOxAxWY2+GZ/G8p4DW7gE/9uQcqLC+j8
 E46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EORavrUCI6LnV2nkXRXDXRmRuBt79sdgsXDG/NChsLM=;
 b=qT2N0jIEVxmhMHksu698TlEg0AOKtjxMm5+Cb+FFMWAUfflAFt6HNmtIdMfx7ViLu3
 CxRvFY4YTqUqmKi1au3wDbE0vd5eexX0UWyVBAtre+yGAOD62DcIl8DYkGMCj+j41r5S
 Q6z/m9b7rewlbybHdvCFoWYfNOQUq8FAr4R48CHqNeF4sNFFgVgy0hKgWUEAOqyhQsP0
 vnX1d+QvOK3L9Vq2eOMpCalj1sFTUE4GSnwfQ9y54VBUOvA5NdlHYeit0mFFkbXZGvBX
 C+zaBTGmmi3K4PCm+o5kf1wgygSusX2kAi33WJEDIPgdT3fkYle8xPvGZiOv9NSMj4KH
 X5Tg==
X-Gm-Message-State: AOAM533MQtP1nSNF6zbUqK/+yMYC55ZkBGZVs2iODE29T1+7zxm4w5sI
 gWkUXCKoRSsQ1e/I74CQ9F6pOq8TKF4OtA==
X-Google-Smtp-Source: ABdhPJxgwuIFRPgQVcAUXs7C1k3xP4nuZDFLgEubR5bmESBk5no8Xl8RTyMzPbgg137Wde+jvXzGtw==
X-Received: by 2002:a17:90a:e391:: with SMTP id
 b17mr37750199pjz.75.1622057316059; 
 Wed, 26 May 2021 12:28:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 h26sm33398pfk.19.2021.05.26.12.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 12:28:35 -0700 (PDT)
Subject: Re: Denormal input handling
From: Richard Henderson <richard.henderson@linaro.org>
To: morrell@alumni.ucsd.edu, qemu-devel@nongnu.org
References: <746277332.296230.1622055775751.ref@mail.yahoo.com>
 <746277332.296230.1622055775751@mail.yahoo.com>
 <4bc4444e-782a-311c-719d-091a04e20387@linaro.org>
Message-ID: <b6cc921d-afad-9b39-e13a-9789bd873f99@linaro.org>
Date: Wed, 26 May 2021 12:28:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4bc4444e-782a-311c-719d-091a04e20387@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/26/21 12:23 PM, Richard Henderson wrote:
> On 5/26/21 12:02 PM, Michael Morrell via wrote:
>> I think the behavior should be for denormal inputs that if 
>> "flush_inputs_to_zero" is true, then set the value to zero (without setting 
>> the "input denormal" flag); and if "flush_inputs_to_zero" is false, set the 
>> "input denormal" flag and normalize the input.
>>
>> This matches what x86 does (I'm not sure about other architectures).
> 
> It is not.
> 
> Intel Architectures SDM Vol 1, Section 11.5.2.2:
>    The denormal operand exception is not affected by
>    flush-to-zero mode.

Ho hum, I misread what you wrote outside the quoted context.

Both your suggestion and the current behaviour are wrong for x86.  The current 
behavior is correct for arm.

What we need are two separate softfloat flags, one for "any denormal seen on 
input" and another for "denormal flushed to zero on input".

The target emulation code then chooses what set of bits needs exporting to 
target architecture state.


r~

