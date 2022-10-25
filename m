Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BE360D63F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 23:38:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onRcK-0000Yy-G7; Tue, 25 Oct 2022 17:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRcI-0000XD-8n
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:37:46 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onRcG-0000Ud-PK
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 17:37:46 -0400
Received: by mail-pl1-x629.google.com with SMTP id d24so12142375pls.4
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 14:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xpCBttGCEsWcPVjQqm9j6653sx6KTS6lLeUnWPZzaOs=;
 b=UDhnGNyOGP6Ssf3yrh73+ZlsXziVuMB29tp/uOWPQxRvC8r4louLnuaeBE7wGPk37z
 oXb6rUVjrQzhgwaohK97zMtDzo7+VyS3qg/Rx3Fj4sS0QhdIEzeI0YJOiOu8i5bR957u
 ksahlTobeWjKHzU0WGTGt6ROSJbTOvrfy6pSO6wNLGemrpNo4n30E5i7++Ym9vklSgqh
 tS+X0JwAlBRjVzFqkOIgndUakYxf6hPxros3PmCZL3Gik7q7tL0UOuoBxMIKE08F99U2
 xLcuGB72ibBPyY08h042JguKthEgY2JHSBoG62OzZeaoznymRF+eh2wqJWMTJNiCWEos
 iYSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xpCBttGCEsWcPVjQqm9j6653sx6KTS6lLeUnWPZzaOs=;
 b=hwYIUJR+MQKyxjxu9T7i57IIBRDGxPxixllpx6D6j/q8hVd1B9sB+5MzX/5t6MfYNz
 BWzRDOFAaCY+0j4XeMQOThW61yk/rEMjUVDmfZx/TlJrHlnMQ+L6krZCkuyd5hiKwYh+
 SPcpnGgfXdOFMrX4RppbfDNTknnG34N8AVPpGBbn8lu11fA5PMEmIQvVf1mUSu6eIdCl
 W5osqiv2QERIplWLAU78UCLy8lLdFLdkX4ssAAfuhNvTx893bRsV5F2sKSX9T/bFR7rK
 iahdY2POV0E/6qbtysBP5kA8Mmz1U8J/3c7RUTpRi23Qzx/RWeRe7BO0RlsX0alobwRO
 Le5A==
X-Gm-Message-State: ACrzQf0tO3XMIzMZF8OILrvt9fUg4nelXL4HYbExYVomR0F+keJPemP1
 ndI9QrV6uNdFHlQ5jOZP88kbOQ==
X-Google-Smtp-Source: AMsMyM52O/8y0YQ73MaMwwef0zXgLrYL3XZuofALUKmVzRTj1xXT2U6BbLVFkZbz3tquwGl0TywjPQ==
X-Received: by 2002:a17:90a:8a04:b0:213:2f34:29e7 with SMTP id
 w4-20020a17090a8a0400b002132f3429e7mr349700pjn.167.1666733862440; 
 Tue, 25 Oct 2022 14:37:42 -0700 (PDT)
Received: from [172.31.50.139] ([103.100.225.182])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a628604000000b00562cfc80864sm1814330pfd.36.2022.10.25.14.37.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 14:37:41 -0700 (PDT)
Message-ID: <d97d023e-978a-57df-f691-9db89aac0da0@linaro.org>
Date: Wed, 26 Oct 2022 07:37:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 1/3] accel/tcg: Add a quicker check for breakpoints
Content-Language: en-US
To: Leandro Lupori <leandro.lupori@eldorado.org.br>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: pbonzini@redhat.com, clg@kaod.org, danielhb413@gmail.com,
 david@gibson.dropbear.id.au, groug@kaod.org
References: <20221025202424.195984-1-leandro.lupori@eldorado.org.br>
 <20221025202424.195984-2-leandro.lupori@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221025202424.195984-2-leandro.lupori@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/26/22 06:24, Leandro Lupori wrote:
> Profiling QEMU during Fedora 35 for PPC64 boot revealed that a
> considerable amount of time was being spent in
> check_for_breakpoints() (0.61% of total time on PPC64 and 2.19% on
> amd64), even though it was just checking that its queue was empty
> and returning, when no breakpoints were set. It turns out this
> function is not inlined by the compiler and it's always called by
> helper_lookup_tb_ptr(), one of the most called functions.
> 
> By leaving only the check for empty queue in
> check_for_breakpoints() and moving the remaining code to
> check_for_breakpoints_slow(), called only when the queue is not
> empty, it's possible to avoid the call overhead. An improvement of
> about 3% in total time was measured on POWER9.
> 
> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
> ---
>   accel/tcg/cpu-exec.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

