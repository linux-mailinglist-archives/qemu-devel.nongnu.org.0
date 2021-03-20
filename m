Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A4C342E2B
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Mar 2021 17:08:54 +0100 (CET)
Received: from localhost ([::1]:52290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNe9l-0007mK-3h
	for lists+qemu-devel@lfdr.de; Sat, 20 Mar 2021 12:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe71-0005v2-35
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:06:04 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229]:40580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lNe6x-0007Kb-2x
 for qemu-devel@nongnu.org; Sat, 20 Mar 2021 12:06:02 -0400
Received: by mail-oi1-x229.google.com with SMTP id i3so8244169oik.7
 for <qemu-devel@nongnu.org>; Sat, 20 Mar 2021 09:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7ACpu5jSpMTfDxH1LrNiYKrf0uMI6FinUmM2uhdysh0=;
 b=xIOZLZEob+0nWdrgWJ6rAQNIt322IJQkY+KfdPPtnKVMBRVDHzxKpS4tSUYwg3RSUQ
 QSH1UF0a6cGx6gbvWlfoTJytJdkP/F32MFAw8fL3qfZhLxvpx3SIHLgjp0sHw2YGyQXL
 lfwGWV2yOLWBqKkg0I6ckPF7mU55E9YaiJggFgYXSNVkf26l6dRBKVtDclxU4PRh4xpW
 ehkJZFcIbLzgbuQ+bVc9IqlMZgrFpZ5Rxt1ek4dal40kNxoeAQ1vMqW9pOG/PAPfECCT
 250zOzHwjy37p2qQCsdIU24WTa+UVJtjZ8rWum44nMUyAJwdKEhPHko+DMOTNmT9y5jX
 M94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7ACpu5jSpMTfDxH1LrNiYKrf0uMI6FinUmM2uhdysh0=;
 b=DOi8+qLqNiDhFV+WAEoaPWyEK2D/8jYFJuGVQcu6pFMipAzBgtJbhi4LpxIQC/BPVY
 q7l4ahZUinsGlQ6xnQ28T8t5o8F5aXFVXU2n42jE6W1fqYrBh8HchThOYokn3mwDIS93
 jliPd/xJCEoJAswgfdAhXDU29rBi8NXL3zJRjSXXTf0eKpx518kk4YZxUULlyudru1+F
 C/FXCNvhibGvgkE36qWrdYGDBMJj1B6QkRttphcHA/Sp/tRpjOYkjzwEUYkIkml3FAbN
 Y1Ha6PoSzA+qG4NE+nmvPzQFCwB3zBeoZdBaUH3ccR5bRaSZLZO0L8Xs+du/7wY29mOL
 8TcA==
X-Gm-Message-State: AOAM532cXBpFHwc3S9a3YEDRWFetImzN8/wgNlJCAgv6cZyREiYJFVGY
 YzPxwu2HbmZa97DwDJDUpCEe4Q==
X-Google-Smtp-Source: ABdhPJwrPNOKPwRQnIc+B/SS+toLKXYHge7dIMj54a1tFZuXB2mAv5mL21UvpdiLWVUMB1feVAIBTw==
X-Received: by 2002:aca:4284:: with SMTP id p126mr4403328oia.178.1616256357811; 
 Sat, 20 Mar 2021 09:05:57 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id y143sm1945994oie.50.2021.03.20.09.05.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Mar 2021 09:05:57 -0700 (PDT)
Subject: Re: [PATCH v1 08/14] linux-user/riscv: initialise the TaskState
 heap/stack info
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210320133706.21475-1-alex.bennee@linaro.org>
 <20210320133706.21475-9-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da9398dd-3363-9340-f9ed-872cb06fe939@linaro.org>
Date: Sat, 20 Mar 2021 10:05:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210320133706.21475-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/20/21 7:37 AM, Alex Bennée wrote:
> Arguably the target_cpu_copy_regs function for each architecture is
> misnamed as a number of the architectures also take the opportunity to
> fill out the TaskState structure. This could arguably be factored out
> into common code but that would require a wider audit of the
> architectures. For now just replicate for riscv so we can correctly
> report semihosting information for SYS_HEAPINFO.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> Message-Id:<20210312102029.17017-5-alex.bennee@linaro.org>
> ---
>   linux-user/riscv/cpu_loop.c | 5 +++++
>   1 file changed, 5 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

