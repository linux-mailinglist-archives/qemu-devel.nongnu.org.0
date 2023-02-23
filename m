Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 453FB6A11F8
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 22:28:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJ85-00075y-Dx; Thu, 23 Feb 2023 16:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ83-00075e-LQ
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:27:51 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJ82-0001eO-0x
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 16:27:51 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so430557wmi.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 13:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4m4bF9u+6z0gKSMiMEbU7jDKImeSK+8cUSpx0GZuv3w=;
 b=gGAFcPG/WQEx1MCepSJYxfpvrfsu8akjuYAtbQmTH2B71XbiHnnsSIHkYdTugeNo7C
 zg94+Ca4DTlSmr4LNU4chwF598JrIzcrOqZQF82wqRCUbF4XQ+finQHrdGaIzc3gaNn6
 DrN4itDhbAjpc05p0+32YH431UB6mTuYaeghLnz+ydqAvuVQ/y8LpTBZAyfVoWI5At/i
 UPRoTSMpC8PKu2xAG5G68tLwvgrlvIFgYSsbo8WxJ+SCZPO678e0shppDCa8RZh0b7Zm
 oiQMzwCvvkTHpnkO5DWD4dQoe0fPAiDv8kRaMW3YpBJu2dWFfVSB3IJSat/9mDr4ymlT
 jxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4m4bF9u+6z0gKSMiMEbU7jDKImeSK+8cUSpx0GZuv3w=;
 b=j/SP19SJs5hdgDOO8F3twjvF9bqFjXyFmauUpDHe2C81Wm3m5IPBgON3WgQD9XFGPF
 q1RAs+ysz+B0XtX8QhYXgPZ+WsxdJy91ra6Pu+nRk8xGf+Pkl0nTJ//EQKvcIqD5cSgS
 6mFX4AiZj88OtYL0Lh8UeHoH3mdN85WAqA3095r75d2jn8i0GaE/fiCYwB0C+NaE/rLz
 fJnCGQimg3Npwys2i8sT56uFk6DBjS6fjc+Gq4mr8mf7n+GVRHRKvYm2wBAP+juHgQuf
 CgGhTdux85VXbzBE92l0JGkwVnoEOxAbdwY67G5v2Tugtk2g0XtadxPc2MZg9wj02+4A
 0QRw==
X-Gm-Message-State: AO0yUKXx+rTb2w2YKYXhiQrtRoMgxen8BncIu1nGeSe+VQEJKiZifM6y
 H+Cv8TWQWRQkmA8VsXtcbYRKSQ==
X-Google-Smtp-Source: AK7set8ksXrAyv0obLqqO9feVESlMUHdabVFnoOeZ8uLZ7GoPs4Cn5z48pzxVmsxifRdglaJQ1rGmA==
X-Received: by 2002:a05:600c:1d23:b0:3e7:f108:664c with SMTP id
 l35-20020a05600c1d2300b003e7f108664cmr8066771wms.40.1677187668290; 
 Thu, 23 Feb 2023 13:27:48 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm12953853wra.15.2023.02.23.13.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 13:27:47 -0800 (PST)
Message-ID: <c82c10b6-d50d-b7a7-5b53-05ee9f1f69e6@linaro.org>
Date: Thu, 23 Feb 2023 22:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 05/13] softmmu/physmem: Check watchpoints for read+write
 at once
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-6-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230223204342.1093632-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 23/2/23 21:43, Richard Henderson wrote:
> Atomic operations are read-modify-write, and we'd like to
> be able to test both read and write with one call.  This is
> easy enough, with BP_MEM_READ | BP_MEM_WRITE.
> 
> Add BP_HIT_SHIFT to make it easy to set BP_WATCHPOINT_HIT_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/hw/core/cpu.h |  7 ++++---
>   softmmu/physmem.c     | 19 ++++++++++---------
>   2 files changed, 14 insertions(+), 12 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


