Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C03C19CD
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 21:29:42 +0200 (CEST)
Received: from localhost ([::1]:49046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ZiP-00073h-95
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 15:29:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ZPy-0004VS-F3
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:39 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:33690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m1ZPx-00057P-1g
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 15:10:38 -0400
Received: by mail-wr1-x433.google.com with SMTP id d2so8907384wrn.0
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 12:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VSyKjUj+d+Xn5dk3btqlMeGy8KaIxLSqwR7O8dA64y4=;
 b=AwESCE0wubLWDj9BguTn4EnE/s3CElRQXc3M6KjWrgRKDxJmCzigTchh8kA7QxNO7u
 PUnh5dntAH8waPvKrmAI+CwzfjHK9N84HWJviB+iTTd+VzyNeIpy8H5ImHmQN8MUm0T8
 SUZMZ6LWihwi+TdVxF+euW5r5nIjzIUrxhLtwvtNgNtRViFMhutov+E/qPEza3zw/JwD
 1aPWxpMmDskXGcLMxpCFYujWW6HhHN9BTjnvSCdTk0tp4ZZEaKhwkFZxBRyxLguSNyzy
 BPbkqvEmm/mQo8yOklA6RLAuylGFFxQwYQdxoQbLAhXJceOe6hzzCigvbp+jmnPrJ2P4
 yRHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSyKjUj+d+Xn5dk3btqlMeGy8KaIxLSqwR7O8dA64y4=;
 b=nl9J9GuwtJ5QYbsyW+9HNAikECJjf/vsszPxpO/PlsFPPKb1J/nAhIMt6ctl/3i2Jr
 DOMxSYU5C57GcLCP91JAjapnlikCbGVHSV+EKVloR0d8AhN7WAgh2WFvuVTFjJURe7Kz
 V4CRYrgoZKUaHk59OWNee5OZdtqDTrXStaS66fCEiYFNsmpoKkWtd4knXiURTalvC0cv
 c+Dyhglh6/LQmFnRarzY2FHjCgwl23ihEmekt74NT3DCUDjfXHIVzWs7gcoTpXky9pJ8
 ujqo2H3MoCld+8CE1D6jL6HcFNpNYL6C2VMdyencxM6ySKh65RAxF5YIq4Liso6GROeX
 WWvw==
X-Gm-Message-State: AOAM533kcMbhxlh8iGgSFWFqKGWcSmeMJF8i52iYdTHbOEodS6GRRo0g
 H+PCYKsvhwmzAS0K/Mn8sdVnZjKbXtg=
X-Google-Smtp-Source: ABdhPJzmpqZBUbrotEiH0jsEW8K+kEHAdyKg26gbLfB8kbeWlXrmsbE+r187m0TVAIvhsovafi/xEg==
X-Received: by 2002:a5d:6050:: with SMTP id j16mr29237950wrt.46.1625771435698; 
 Thu, 08 Jul 2021 12:10:35 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id w9sm2746266wmc.19.2021.07.08.12.10.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 12:10:35 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/alpha: Use tcg_constant_i64 for zero and lit
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210708182519.750626-1-richard.henderson@linaro.org>
 <20210708182519.750626-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f45d0b1-fef9-6b64-746a-7f6ea9d49026@amsat.org>
Date: Thu, 8 Jul 2021 21:10:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708182519.750626-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 7/8/21 8:25 PM, Richard Henderson wrote:
> These constant temps do not need to be freed, and
> therefore need less bookkeeping from tcg producers.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/alpha/translate.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

