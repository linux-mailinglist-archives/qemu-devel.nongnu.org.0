Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CB2DB0A3
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:58:43 +0100 (CET)
Received: from localhost ([::1]:54474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCio-0003nz-FZ
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:58:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCfQ-0000nv-HY
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:55:14 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:45252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCfN-0006kv-1i
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:55:12 -0500
Received: by mail-ot1-x344.google.com with SMTP id h18so19811205otq.12
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fpKQRZA2i9FEg6oKrVRhVk07KdR65IjiARA1WbzPCN8=;
 b=LNjrbn2f27h2XjqXzuqESol+E15jiJidlZNZ4JrIeBUBtoMGUYTL9vp828DvXiVdux
 sHZOcOmX1g2RCv9g/zMtTqBP59kFZnuF9oH8KOEkFH/+26SL5IMVYo23PLpzaFqVjks0
 te6CrKzs8rjuDp1oMsruQwdhGz0YXvuymYV9djb2MxLza5bigZfmX16jZCY70+lbZYpC
 J5jTocvXIpa/Mf9bmOs1obkD9EYp33iqi4w9hueUPvLKGoJ6EACYX2OARL83lKPjeAS/
 u6yIc8a96LBWM3NYEww4SRNGIpGXxOUakz9UeXUHabx/dSJyfldL2mafJd4DytDFOiLb
 ZzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fpKQRZA2i9FEg6oKrVRhVk07KdR65IjiARA1WbzPCN8=;
 b=cmRal+DvcIW85pypAlHx74snFuCfOR02K2a+W+vB+OHGhio5HpdJnicZv3PtfUMYE2
 7d/ClS+vEtppePsRezZ1dgliQ+MO0wlr6rQNIP28huW77ErrqS5taPcv7//eHJTLdqyN
 6oDevxTpyD9S+BSOAHmUVJjgcn7wjkgFZ1wUIfRx1anl9Elg4JuX3HSVAzY8hfqo0w8O
 Hqe5V2MSCQG+gQcWP19VvXpjKO8xbFrr/pV+Fv4ZK90m8aQfoAKjezeRK1AWjpyzXb3H
 O1qsmrNJpq1lY4veTu3s8XsvN9FLxxmHLNRdcTVThtkOcQQAC0k8ZI6ZIPOmwes/tmSO
 oNOA==
X-Gm-Message-State: AOAM531r88hH4wIwBOaQPa2vUDE0lItIO7L4Ocaf9Ebrac+UQoUMXbw2
 yoemp4RTcIKbVJRNIX6AvB2eCQ==
X-Google-Smtp-Source: ABdhPJxxf4iW1Uef1wmCyDpaqBnFi4zY2keIMpBMxARo6Vwz+s6mePFnrjLTTgCo1TFHO5OiwaVNEw==
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr24032735otq.125.1608047706308; 
 Tue, 15 Dec 2020 07:55:06 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id q77sm4728975ooq.15.2020.12.15.07.55.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:55:05 -0800 (PST)
Subject: Re: [PATCH v2 2/4] scripts/coccinelle: New script to remove
 unnecessary timer_del() calls
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215154107.3255-1-peter.maydell@linaro.org>
 <20201215154107.3255-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0e8935d5-d445-3e7a-3798-c69ace446110@linaro.org>
Date: Tue, 15 Dec 2020 09:55:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215154107.3255-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 9:41 AM, Peter Maydell wrote:
> Now that timer_free() implicitly calls timer_del(), sequences
>   timer_del(mytimer);
>   timer_free(mytimer);
> 
> can be simplified to just
>   timer_free(mytimer);
> 
> 
> Add a Coccinelle script to do this transformation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  scripts/coccinelle/timer-del-timer-free.cocci | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 scripts/coccinelle/timer-del-timer-free.cocci

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


