Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2E64DE5D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 17:17:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5qth-0001YT-IU; Thu, 15 Dec 2022 11:15:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qtf-0001YC-BZ
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:15:47 -0500
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p5qtd-0002IM-OK
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 11:15:47 -0500
Received: by mail-pl1-x629.google.com with SMTP id d7so7347930pll.9
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 08:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jt8XD/NgG/K6O4LNz72OiSoRqjOkC9vJvdJzPYgWxzQ=;
 b=gc/tQE6+O8X+Gm+Q+HZzBK9PZ56MXZ6tCRgqpRWaKh73chdAQevLx4MUbK1ZEPySJY
 vjc4mTXxriqXxZ5JggNjoFXYcggd/jdXTRNElqOiWh3ie3+xdVQ7NtycrYluD37sg7a/
 F2CfORU7QT34RHmKJpuIV9UR0XGLrXcKZRWjNTWdxSf1mLAxeJgVzXLCcAsvo0rZUuzn
 TSAVTlc9IQdfExtEjcg8wwaYde1O57qkcqSQY9Lb/g2dUkaVzCICqnqIpiCtIcZXzlpo
 mnPRarm58fGUfCW9PmeovtTs2LEF3hzzgtnHQ9wBzP70Gp06zcO1KRZXZvH1WwTqEOms
 lXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jt8XD/NgG/K6O4LNz72OiSoRqjOkC9vJvdJzPYgWxzQ=;
 b=yx8wrMVw27y02SzZwnFoMDVQj1npEEuge8ZQXTOiwK6tp3Nvn51l4lq16czEDUt8jn
 GIXC2qyBx13DobvJIvzZVYOElJ5anbR/gEm3SAUXZUUvoNHRlvhtbTrcMR0tP6CMDK64
 MW6Rlf8D5LHbfw6TRulb9VtAU8g3PIunfFiOp9GA9lm0f25gJ/bzC4e1IkyyePQFzGWt
 3jI6/5fIUaLJMoXvJ1pH2OdjlokQ7dEqoJ/RTnPWePnpqC7f/gLHkbz8W4owjtdsdxQt
 BUZs9N9/xyrw0uKk1KIIWhSEJaXX63AwRfFUAfwS1e7xV1oASNte8yobA412OJP+D+50
 pdjw==
X-Gm-Message-State: ANoB5pmhN6i9LDrOISKyYaai6//vOcLZuX/sqUpGqh7hZH+Ygcm+0+mu
 ngZKvll78z5EKTKo3yPqSa41gQ==
X-Google-Smtp-Source: AA0mqf5A7rp2FKOS5phY3IX5WFSk4QnN05Ge7im9Gu6fTP+rIsDlvSHmMDlv8xf6QWrO/UwhIV53Vg==
X-Received: by 2002:a17:90a:6f46:b0:219:8144:7965 with SMTP id
 d64-20020a17090a6f4600b0021981447965mr29817661pjk.17.1671120943279; 
 Thu, 15 Dec 2022 08:15:43 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a80f:54a1:edc3:6cb4?
 ([2602:47:d48c:8101:a80f:54a1:edc3:6cb4])
 by smtp.gmail.com with ESMTPSA id
 nu6-20020a17090b1b0600b002191a64b5d5sm3363096pjb.18.2022.12.15.08.15.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 08:15:42 -0800 (PST)
Message-ID: <f0ae5daf-ec43-aede-12d1-a6dd4406c28b@linaro.org>
Date: Thu, 15 Dec 2022 08:15:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH] includes: move tb_flush into its own header
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20221215140933.2337853-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221215140933.2337853-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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

On 12/15/22 06:09, Alex Bennée wrote:
> This aids subsystems (like gdbstub) that want to trigger a flush
> without pulling target specific headers.
> 
> [AJB: RFC because this is part of a larger gdbstub series but I wanted
> to post for feedback in case anyone wants to suggest better naming].
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/exec/exec-all.h     | 1 -
>   linux-user/user-internals.h | 1 +
>   accel/tcg/tb-maint.c        | 1 +
>   accel/tcg/translate-all.c   | 1 +
>   cpu.c                       | 1 +
>   gdbstub/gdbstub.c           | 1 +
>   hw/ppc/spapr_hcall.c        | 1 +
>   plugins/core.c              | 1 +
>   plugins/loader.c            | 2 +-
>   target/alpha/sys_helper.c   | 1 +
>   target/riscv/csr.c          | 1 +
>   11 files changed, 10 insertions(+), 2 deletions(-)

It appears as if you forgot to add tb-common.h.
That said, if this is intended to have exactly one thing, tb-flush.h might be better.


r~

