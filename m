Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706E6FDB03
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 11:47:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwgPl-0004Aq-DE; Wed, 10 May 2023 05:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgPj-0004AZ-3u
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:47:15 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwgPh-0008AX-ID
 for qemu-devel@nongnu.org; Wed, 10 May 2023 05:47:14 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3077d134028so3801372f8f.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683712032; x=1686304032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gq0N1kF/kJ6+BPqB+hnvwt/gmd8ss+FLPMdBCJFr5mo=;
 b=Unt9ay+yMQ8YEx6cpeZdEGjlK8Wt5QlbFv0inumO4E1Xt5DvtOJc+npW+23qF+SE9V
 /4bNmJX7nlL2RM9P93+elgWkKiNRhv+dnUAYwW4h7ofwhwLqD+OQ40v+ZhpWfM9VUh5G
 gO1U3TlXfAxxeE8g5rJZ0WRQSCicdo1u1Bln4gWZaKCMvvJo0a46z4RIYRIT4XfSRn9w
 s+SIqcRjrTwd3IVNT4uPQm2Mu/KF4UYaax9D570TlBLTFXgf2qs7Ul1o5I5FFENWrocW
 FRW5GbY/a4lqIVU32KF0QUY9IQ1VO/2cNy9Xz+NmG4Ue3Z8CoC3kEapC1c7lC86IAaw+
 BerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683712032; x=1686304032;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gq0N1kF/kJ6+BPqB+hnvwt/gmd8ss+FLPMdBCJFr5mo=;
 b=RikJOfVYiLd0MOLmTYgjQawSwc1nBaQDmfvaGGxaQ0mHmeRg+Foht6YmTYWU9pyBSJ
 LS8CBxYeoDkIc3MwsSTo1tcamUabVMXKT01nsrN7NbSfFVx7eYp1/jQw+ukyEPDprqPC
 FSMS1FCMJUhs+eeHWGcz/9v7Lxh0+cYlZf9oTfSBRlJZmv1qp74u433d5KEX62lWTtUq
 8CmRgUpGPjtk2l0xHxRR1r1thVsVzL9m+v4kMzbbHR6VOHnpLYIjKp7tvYAYne28Y5pJ
 u48vKO96m3Gf3ImNxA9u1Hfqi48ECpBlToOs9aK8OlPKSqUco63dHdx9tCp2Z68xOdwJ
 va+A==
X-Gm-Message-State: AC+VfDxOxUN8XDbJxWH4C0sxfqn83kcj6JUzWwoiwN/0kPyLStCbccsF
 0FmQmlPSzAYwXQRSMKSJvrTY2Q==
X-Google-Smtp-Source: ACHHUZ5XQFuvKDryGVmQbCdq4zMn89aTNGqz95x6qaP8HP90zgm0zRvF+PRFiAHxMArEixU6jpHvsg==
X-Received: by 2002:a5d:51c4:0:b0:300:2067:f5d8 with SMTP id
 n4-20020a5d51c4000000b003002067f5d8mr11447648wrv.65.1683712032007; 
 Wed, 10 May 2023 02:47:12 -0700 (PDT)
Received: from [192.168.110.227] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b002f013fb708fsm17030656wro.4.2023.05.10.02.47.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 02:47:11 -0700 (PDT)
Message-ID: <e3fd94fa-3809-8b94-e8cf-4f19dea9ffe9@linaro.org>
Date: Wed, 10 May 2023 10:47:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 03/12] target: Widen pc/cs_base in cpu_get_tb_cpu_state
Content-Language: en-US
To: Anton Johansson <anjo@rev.ng>, qemu-devel@nongnu.org
Cc: ale@rev.ng, pbonzini@redhat.com, eduardo@habkost.net, philmd@linaro.org,
 marcel.apfelbaum@gmail.com, wangyanan55@huawei.com
References: <20230505141403.25735-1-anjo@rev.ng>
 <20230505141403.25735-4-anjo@rev.ng>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505141403.25735-4-anjo@rev.ng>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/5/23 15:13, Anton Johansson wrote:
> Signed-off-by: Anton Johansson<anjo@rev.ng>
> ---
>   accel/tcg/cpu-exec.c      | 9 ++++++---
>   accel/tcg/translate-all.c | 3 ++-
>   target/alpha/cpu.h        | 4 ++--
>   target/arm/cpu.h          | 4 ++--
>   target/arm/helper.c       | 4 ++--
>   target/avr/cpu.h          | 4 ++--
>   target/cris/cpu.h         | 4 ++--
>   target/hexagon/cpu.h      | 4 ++--
>   target/hppa/cpu.h         | 5 ++---
>   target/i386/cpu.h         | 4 ++--
>   target/loongarch/cpu.h    | 6 ++----
>   target/m68k/cpu.h         | 4 ++--
>   target/microblaze/cpu.h   | 4 ++--
>   target/mips/cpu.h         | 4 ++--
>   target/nios2/cpu.h        | 4 ++--
>   target/openrisc/cpu.h     | 5 ++---
>   target/ppc/cpu.h          | 8 ++++----
>   target/ppc/helper_regs.c  | 4 ++--
>   target/riscv/cpu.h        | 4 ++--
>   target/riscv/cpu_helper.c | 4 ++--
>   target/rx/cpu.h           | 4 ++--
>   target/s390x/cpu.h        | 4 ++--
>   target/sh4/cpu.h          | 4 ++--
>   target/sparc/cpu.h        | 4 ++--
>   target/tricore/cpu.h      | 4 ++--
>   target/xtensa/cpu.h       | 4 ++--
>   26 files changed, 58 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

