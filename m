Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957073BE08F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 03:27:51 +0200 (CEST)
Received: from localhost ([::1]:38408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0wLu-0004fQ-Mz
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 21:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wKU-00038w-Fp
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:26:23 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:33469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wKQ-0005OU-1b
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 21:26:22 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so2592921pjb.0
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 18:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=97dWQTK0WkbE88a9uFtTKzUR61elIjKO5cQBqs1RizU=;
 b=e40eV8azd2K7uCpj4OLF33hiFy073hYvBKgoc4Ld9NMggoU2g6e13FRjg8s5OkodD5
 vy9QadOZyOEIxUCAIit93/Da3CHG+/VpW8R5Vw7a2t2BbpQ4wsqTB46oeA7U5zP6m8sW
 vFA9IY0Dhuu509idwwm5gy6u/ZwFzwx44vgoz65XzBKXHwXxR4VpRGwNWuuyi9qvnmPf
 RnqkR7Rm/WdhV78exsqvvOgzmLtl175B+EKJzUWJb/oea+QlXo7KUo2hGwInSq2KPusn
 LtCalL9296LMf1QKaZE5Se07I3npXhdciXKwXyD135/JkNgv/+/auJlyUKLHgjZQ+BYn
 F8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=97dWQTK0WkbE88a9uFtTKzUR61elIjKO5cQBqs1RizU=;
 b=rI7NWGLGEKQQdRMvAaX84eHvl3CEsAQKWdCzhTUUBwn9TCpwHt+gkcppRvODuM4QRF
 aaev13hCYEscXTgg53FPcXgq7TKCa2F7/tGO6oCED7jvQrTo53FQAir8PEKO7NSUPzEE
 3YvjmUyvUSaG0Aj679Spr372KggIl1vMKHuDc7jNw7k6EQlEhRiGnGSDW8U1yaQhamG6
 GkHSQB/Y2pephnWa+Gi9XqwecMT4jPnkoSnPH2iepHm0dSPa9Fw7qsoDw+JwBUlX3z/Z
 M7b0ulPoKbUpbDdLYDsaXPtK0o0kxZXdwzprRLas9bcdre0063ybuzkHPp0dSQsJIM2d
 PtPA==
X-Gm-Message-State: AOAM532i6a23okBb0S+uBrBHekN9nyloAkfPIvMSoytu8/4/NHRcgZEk
 X93AklOUqzSPLzwq/5uEo4tbszt7/TDCyw==
X-Google-Smtp-Source: ABdhPJzQ8/uvQg2YJ6ZqJmDdooLaV8V8YYqsam3AXw8EcsXjr7Vysa087QmkzYlyjnQn/UtdaK6qBg==
X-Received: by 2002:a17:90a:5401:: with SMTP id
 z1mr22642502pjh.7.1625621176824; 
 Tue, 06 Jul 2021 18:26:16 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id m9sm17484569pfk.20.2021.07.06.18.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:26:16 -0700 (PDT)
Subject: Re: [PATCH 04/11] hw/gpio/pl061: Add tracepoints for register read
 and write
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <744821fd-9780-fc60-81e4-d4d751b3e490@linaro.org>
Date: Tue, 6 Jul 2021 18:26:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/2/21 3:40 AM, Peter Maydell wrote:
> Add tracepoints for reads and writes to the PL061 registers. This requires
> restructuring pl061_read() to only return after the tracepoint, rather
> than having lots of early-returns.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/gpio/pl061.c      | 70 ++++++++++++++++++++++++++++++--------------
>   hw/gpio/trace-events |  2 ++
>   2 files changed, 50 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

