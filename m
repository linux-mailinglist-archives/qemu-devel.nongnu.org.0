Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DDF2EA0F2
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 00:37:50 +0100 (CET)
Received: from localhost ([::1]:58154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwZQ5-0000Fe-Mh
	for lists+qemu-devel@lfdr.de; Mon, 04 Jan 2021 18:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZL2-0005Q7-1F
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:32:36 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwZKy-0002VR-QI
 for qemu-devel@nongnu.org; Mon, 04 Jan 2021 18:32:35 -0500
Received: by mail-pj1-x1033.google.com with SMTP id b5so585654pjl.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jan 2021 15:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VqUQTDAbgo6DsLofYAlCABCNRmGVVoIjrc0IUsfnhI4=;
 b=Q5ioql1kTKxRGEJSKoy4n8qC4oBNRnCseJJ7NclqqPmIPL0o8QtvBjRQj+mVHgtPxs
 9t30ejZnXBajlvi5MYFZ6j60jeAUYlraCNH9uINWM7zXOkQfq8rZ8kyAlYAgh0lUS6GY
 UJgrWME/o45S/cHgRPl4suT1pTxlXP1oUNbnVkzd//tbkDXXIWzbh50nCF9yBVywIPfn
 Cq592LDyQUie6uGS6YDfYTjE0UjPL+XFq9ki9KipuCBZPaDFkkFAtPu7tEtQHQFrY2T7
 OtOTk6dBJSigRuQgVYlbgXeRCyBYpNKC7ABwbEb62qyWsIex0fhEn876cGP+jARXSvwX
 Pg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VqUQTDAbgo6DsLofYAlCABCNRmGVVoIjrc0IUsfnhI4=;
 b=TM511vXCsBk5I4DP6PrmMjw/sZygW5s4gB028f8VoQl0BFMueubSuDlybAgzhm2SbR
 6q5B+UDKeKKBQc/jCRecvc0TqX43ZQDxvZGyP/8XaGl6CUbajBXFthnk7GUI2ERr1liv
 DzckOo4FmU+D6X3/VEr3XfwpwRfU3PTvqAg+dJGazJqYz3Qh3wRoakrlHp10k8/ei6yc
 FjqGz5+9Dw8NmEKz7qdhJcy/XZJPyQ4DS1oKqhjOT7sq9lasQ/e1kjdAPeqYwKMkiTC8
 vXHuuucKdlxo3cGcRFbTysZGUO0eTEgzj5D2xl33uVo/GUnIEvwEfj5O9rDhtN2FJenV
 eYfQ==
X-Gm-Message-State: AOAM531AlkoTqrWodyMFyOXsqchJFd1lu78MC6G3mac9bssH58RGzVSI
 wcE8Nu0o8rq8gdpNpIbluw1rhg==
X-Google-Smtp-Source: ABdhPJzlBILfseIlB8CADeaARqhu4dgeURUhbKOsbY1K3nHnevuAIz9yiCSV4VYTGg62xhs5dbEh6Q==
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr73758595plp.1.1609803151211; 
 Mon, 04 Jan 2021 15:32:31 -0800 (PST)
Received: from [10.25.18.35] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id cl23sm419336pjb.23.2021.01.04.15.32.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jan 2021 15:32:30 -0800 (PST)
Subject: Re: [PATCH v3 05/15] hw/mips/boston: Check 64-bit support with
 cpu_type_is_64bit()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210104221154.3127610-1-f4bug@amsat.org>
 <20210104221154.3127610-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d172123e-87ac-c30a-e9d2-16a89091fc6e@linaro.org>
Date: Mon, 4 Jan 2021 13:32:27 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210104221154.3127610-6-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paul Burton <paulburton@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/4/21 12:11 PM, Philippe Mathieu-Daudé wrote:
> Directly check if the CPU supports 64-bit with the recently
> added cpu_type_is_64bit() helper (inlined).
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/mips/boston.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


