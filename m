Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0735A0463
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 01:05:34 +0200 (CEST)
Received: from localhost ([::1]:50338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQzRF-0006Ca-Br
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 19:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQzNJ-0003SH-DC
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:01:29 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:36489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQzNH-0004WO-HX
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 19:01:29 -0400
Received: by mail-pg1-x530.google.com with SMTP id s206so16313083pgs.3
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 16:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=kVJQSlOBXGoHjG5/1CJhyRDbq61EtroZuQd5cLUQWIc=;
 b=dfZsjZztGopTu+doJNgSw6tyvWdcem8TigacTcSozGrRTs45cRxL1m4iPZOHlXg3Gs
 aKdSenaDh87TBYQlQQSl1ZVwWQu+/gX5Znt23r3bOTqLhR8GVvTDjRx/xAq9jAgXa4yD
 Nf8HAs4EONPbvcaHSFO1QI4AbkHjUcmqCyGN0BShblWz2XqBMLwtlQ4z9Qib2Yc5ReVj
 A4Fo7GYEXwzNYAhIbwRE9Zo2iOyZZ9XnjqdnYfTfG6cSf1RpXcW5wXi9Thty4FOzwGZ5
 toQ12alZba2diGlBSuBdWcyHNUFyLDE2WyEu89XXx4fNRYtH5hUDf6AeEZZsgVTMKkyh
 MJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=kVJQSlOBXGoHjG5/1CJhyRDbq61EtroZuQd5cLUQWIc=;
 b=julhxrs5QwbpbHNMcCugcQ3klKlDIZDpJccYSfZ6lYqnng6OvzNvZqMutk5MKuEAdr
 y02aQcNE9ygEstG1mJMmJvPjHjDHdhwOk1jMx+HbOlHCPFQA8H9ozHwmDs46iVseuWxW
 PP8PY0G1Gny05HuSY/bqjMcgscIVymmFK1RiDBFQ4zXoIIx5Pvfm0au1Hhh6R4+Tg4zN
 t1ESzYSULWy8Rn2nQVTn9fsOmGIk20heqwXerlQf+3tzbG4Bz/tBfDGzWdlkE5uMoKQf
 Fh4cT9yvfDSvPOlZC3/cQJePZTkFp87XSRQPoRegk1qAoiz8UbA8srmEirf5hHKw23iX
 LbUg==
X-Gm-Message-State: ACgBeo3da7OxrYK54HdTb2AkwqXoKTmITETbIcfLokUUmqrmO5/5oC7X
 DKWwA8xSb+qXsHzjp95P6LjgTw==
X-Google-Smtp-Source: AA6agR4b6zZR37GQ9PkMB9zaneSk3v7lSeX9+5bMiYckhS1hnylKEqi7lmDE1HCMPqr0vTqgfBq1Tw==
X-Received: by 2002:a63:f94f:0:b0:429:7aef:e252 with SMTP id
 q15-20020a63f94f000000b004297aefe252mr931132pgk.270.1661382085715; 
 Wed, 24 Aug 2022 16:01:25 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:944b:63b7:13bc:4d26?
 ([2602:47:d49d:ec01:944b:63b7:13bc:4d26])
 by smtp.gmail.com with ESMTPSA id
 b66-20020a62cf45000000b00536779d43e7sm8057016pfg.201.2022.08.24.16.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 16:01:24 -0700 (PDT)
Message-ID: <dd30d0e2-3e7c-164f-5a34-98c67648c5a5@linaro.org>
Date: Wed, 24 Aug 2022 16:01:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 00/17] (The beginning of) a new i386 decoder
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220824173123.232018-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/22 10:31, Paolo Bonzini wrote:
> It is only lightly tested but it can boot to iPXE and run some 64-bit
> coreutils just fine; Linux seems to trigger a bug in outsw/l/q emulation
> that I haven't checked yet, but still it's enough to show the result of
> a couple days of hacking.

Excellent.

> The generated code is mostly the same, though marginally worse in some
> cases because I privileged code simplicity.  For example, MOVSXD is not
> able to use MO_SL and falls back to MO_UL + sign extension.

I think this is ok.

We can improve things like this on a case-by-case basis.
For example, MOVSXD could gain a X86_SPECIAL_Signed flag,
to be passed on to gen_load().


> One notable
> difference is that the new decoder always sign-extends 8-bit immediates,
> so for example a "cmpb $e9, %dl" instruction will subtract $0xfff...fffe9
> from the temporary value.  This is the way Intel intended "Ib" immediates
> to work, and there's no difference between the two.

That is in fact an improvement.

> Anyay, porting these opcodes is really more of a validation for the
> whole concept and a test for the common decoder code; it's probably more
> efficient to focus on the SSE and VEX 2-byte and 3-byte opcodes as a path
> towards enabling AVX in QEMU, and keep the existing decoder for non-VEX,
> non-SSE opcodes.

Eh... I disagree.  I would really hate to retain the existing decoder.
This is already so much better...

> The series is available at https://gitlab.com/bonzini/qemu.git, branch i386.

Thanks.


r~

