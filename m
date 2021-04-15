Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1436158D
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 00:35:28 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXAa7-0003uy-2b
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 18:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAUp-00005h-8a
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:30:00 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:44795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXAUn-0008GG-HK
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 18:29:58 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 q14-20020a17090a430eb02901503aaee02bso2459590pjg.3
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 15:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hF0PSkI4nXdCupfh9z1b42UNMmZ5ottCZo/dilC9gLY=;
 b=ekD5nDLvYlGFRttGypTjKepHzpjN8IMEedbNEyER8084YErgVPw+C6D1jcLmjGWTLO
 YrhTE20qSQ7NLvZBznqRWrvB5m7GZrnWJMOkT+uODw16MMpoisPxNQem84sCk6rZW7CL
 JD/j2/MU1r39qo3b4DSgHGo+FL7X5OVqAkoZZyoGBcqi10DFvyvjQdybMMdQkFAGb+il
 4iu0Q6CIq2YR+LIPsOGLJDQzgRVThWeSiQkTlOMAtw260VCyrw8OotMiLZLM4zeIbp77
 XcDC9wk3XI7tLLx79x+C6xD4ZXYZjSuZUeSU+tlh86Lke75y8z0IhQFRVWcA7z7uNRfk
 hhrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hF0PSkI4nXdCupfh9z1b42UNMmZ5ottCZo/dilC9gLY=;
 b=rZdz115MU7bAB78YFuK3P5FtH1Wfx4bBD8QcSIvoiO8gtF3PoGvh6T087eZygjak+u
 70Mu9zJwOHjQ+E+O6BjMx0I/C9D3W+d9s4uUCXl112lZx06IbJuwPiaw30rlem4YSuGm
 CfNegUjGXl5Zcyg/RZM5jI4Wi5Qs89O/3KDizbLP4mXJdoZG97Xg5jl7oMHnmP5qzbul
 yjln2AUuaE6OI4grvTu9MLEYrEr4EF7utuBmR6nyn4SjePga/L/ZUQOfPG987N7yeJvY
 uvXzj12gmu4/yJziTClDRx3H+4OS8q7OXL9bJsdcH97sJJ06jx1uJU17RYVLN076stXh
 OojA==
X-Gm-Message-State: AOAM531yU7/wOt7f8Xkh4wani1uo9s+jEPowTAgzDoxESkIfwWh8T3k6
 qCNGo1CBXg8arufTAcPzyCvLlg==
X-Google-Smtp-Source: ABdhPJwyXJ3fiMMnJxsZYZEj1VGv23DYQOZ3dFS16Ltaq4J4Z1xBA5U9LjbEviFcwh4UAz4CpW1otw==
X-Received: by 2002:a17:90b:368b:: with SMTP id
 mj11mr6188715pjb.217.1618525795949; 
 Thu, 15 Apr 2021 15:29:55 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id g5sm279744pfv.160.2021.04.15.15.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 15:29:55 -0700 (PDT)
Subject: Re: [PATCH] target/xtensa: don't generate extra EXCP_DEBUG on
 exception
To: Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org
References: <20210415205517.23599-1-jcmvbkbc@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <98830153-5ae3-4d92-4ac2-4f76a8b2d523@linaro.org>
Date: Thu, 15 Apr 2021 15:29:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415205517.23599-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/21 1:55 PM, Max Filippov wrote:
> target/xtensa used to generate an extra EXCP_DEBUG exception before the
> first instruction executed after an interrupt or an exception is taken
> to allow single-stepping that instruction in the debugger.
> This is no longer needed after the following commits:
> a7ba744f4082 ("tcg/cpu-exec: precise single-stepping after an exception")
> ba3c35d9c402 ("tcg/cpu-exec: precise single-stepping after an interrupt")
> Drop exception state tracking/extra EXCP_DEBUG generation code.
> 
> Signed-off-by: Max Filippov<jcmvbkbc@gmail.com>
> ---
> This patch depends on the "target/xtensa: Make sure that tb->size != 0"
> patch.
> 
>   target/xtensa/cpu.c        | 1 -
>   target/xtensa/cpu.h        | 7 -------
>   target/xtensa/exc_helper.c | 5 -----
>   target/xtensa/translate.c  | 6 ------
>   4 files changed, 19 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

