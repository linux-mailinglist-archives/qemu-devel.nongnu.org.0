Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D558243E8EB
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 21:15:20 +0200 (CEST)
Received: from localhost ([::1]:58990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgArv-00031V-W9
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 15:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAqD-0001pB-SB
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:13:34 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:45007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgAqB-0002DR-W5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 15:13:33 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so5555462pjb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=83CMRppbhRH9vyvQq8CfReGu6764mjaApvjJPJglI2c=;
 b=WkS2o8M67Q7m1ADbxYgBeZKANPKAku+N1mJahMPlcGNDRtwrWZX1NWXOof36B78T47
 Y5wo5BvBsZ2ebZ3/L93DdrCb8I0fKRYTRuHi5lm4Rg27u0k4a0mkdYfFMjU3BIevm0h1
 tG4lDw+0XmX1uiV33uqlLi3YvwZLQRClhA1T8Rv/4WAzglLVfdtVhZTmVfu8Fi9ljWx+
 5ZA15AuZ3EF2fgu5SftHzYF+8L/9vOv/oJoFEwst1oDQIUOI6N4OmPmM1UkgUHbN0gzS
 S/qVHL2EC73C5+T/8g0G5Wv7ABdOHjysbSEVeXtUGcNzPUNVJIb+zXuSLUys/G1bfPUf
 M6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=83CMRppbhRH9vyvQq8CfReGu6764mjaApvjJPJglI2c=;
 b=Cr37FuJRMxabHZ//gbu8ucAP0jzoLaUyO82RwWOGMcmUlk2ZDCtk3d7xmjmzE5smeY
 0QByP+I++twwSrqM/Nks1ljzh42LwytZ9f/w2zVzn/BhIHazlLfUt9y8t3XDDIEDCrZg
 3gL3atzuwRXv4XFh3Z+kSVeZAo6ZccpUjnvQdkPrRm8eu9x7YyGKKNNnmfDoAyjX8w8u
 F2005Mq+DyefIu+LCIDyGEq/x+Y6GF9RHpXLyRnG6yaZyD/TyLx/L+ptK+NdsYr5xN11
 51vbgaSfilNKV205/B8oOW0/g5jz3kuVccW2aIPKffN1oCCmUr0B1zPvlK782NS45on2
 a4Sg==
X-Gm-Message-State: AOAM530UlCNyJ0PILvGfvwMhOHLVt73wyNEQ4tDb5STQtx1VmeAmsk4r
 VBHyKHhJHWnZyJeOh5BQwRibyg==
X-Google-Smtp-Source: ABdhPJwQtBEav0Q/G0QA00NFi/5k6bIMld2oKcuJsEQlUUhWUpCkHX7iGJcbqvGGpF0zjlVXvAc2Pw==
X-Received: by 2002:a17:90b:4c02:: with SMTP id
 na2mr6652145pjb.105.1635448410637; 
 Thu, 28 Oct 2021 12:13:30 -0700 (PDT)
Received: from [192.168.1.11] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id oj5sm8778766pjb.45.2021.10.28.12.13.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 12:13:30 -0700 (PDT)
Subject: Re: [PATCH 3/4] softmmu: fix for "after access" watchpoints
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
 <163542169727.2127597.8141772572696627329.stgit@pasha-ThinkPad-X280>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26046962-1e7f-ab80-4d7d-9e487719ba25@linaro.org>
Date: Thu, 28 Oct 2021 12:13:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <163542169727.2127597.8141772572696627329.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 4:48 AM, Pavel Dovgalyuk wrote:
> Watchpoints that should fire after the memory access
> break an execution of the current block, try to
> translate current instruction into the separate block,
> which then causes debug interrupt.
> But cpu_interrupt can't be called in such block when
> icount is enabled, because interrupts muse be allowed
> explicitly.
> This patch sets CF_LAST_IO flag for retranslated block,
> allowing interrupt request for the last instruction.
> 
> Signed-off-by: Pavel Dovgalyuk<Pavel.Dovgalyuk@ispras.ru>
> ---
>   softmmu/physmem.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Indeed, the other such assignment, about 30 lines up, already does this.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


