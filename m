Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B96D300084
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 11:41:43 +0100 (CET)
Received: from localhost ([::1]:47818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2tss-0001Kd-4F
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 05:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tqy-0000fg-K4
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:39:44 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2tqx-000383-2x
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 05:39:44 -0500
Received: by mail-ej1-x62f.google.com with SMTP id ke15so6932905ejc.12
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 02:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=k8n9uFV6wocqd0sP/CawxQx+Id+hUI46fzQDQUkvq3Q=;
 b=MkGtZX+49m48Ju0hex8hocz1+zh/gT4ih1GdFlFfbC9qyOADdLtfopZCQiY6w3Y8cw
 Lg4vTR6fJ/0EyJgm+McYoKMVZJXIE+vvtXwdCX1c72N8LMumOxqBzucXFbWRiBaFIE8A
 Gt0iZT6gSejfLxSaOgAIFDgvl6pNCrANhiKbzSwZRRYv0qEOVkkgLc6VqpE9nv4K43Xo
 u/FpcpHaIhvJC9qi6rHSLirvis6n7M9nGcu7zhJRLglaXe+KsDpgK+n37DiqW6b+ECg6
 b4h5Gycr9R9+nKdBa68MqDHHTSO4W5H/GhfyP2Z0Q73/0ddYmSdQJz7npKHgT0Ns3jqg
 kOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k8n9uFV6wocqd0sP/CawxQx+Id+hUI46fzQDQUkvq3Q=;
 b=AfC4NlkIt5xM6+gyvlzrWVrBvOzGcle8tpZ1LL1Uv/zfHk9RhfR+CUccFkhsRNOLGr
 1ojseDGh5OBPXTT49kFDW+NVZpolRo1zXP3ick+/Ng1nFdp6OB7sqYV8t/589r8bhHJk
 1+rpNUmXmG8mpkapNIAd2EwKX8qg7kxhLIAXTRk+Ikr3IDcNIg84+bMiD9aKLxcAiwOG
 vHXn71FQNuMPGZhjVFOiV0KjJkaG7rhbngmg8L9LT5x1Vpz9yyZmAsqN1s9XTuCnUSMq
 dYZ8GT2Vhi8Brm5tpcRNKaHOV1PEROV8AXo3SC5mYRnIcjQaM2kKYjYeTTl2vuRGp2ej
 HFTQ==
X-Gm-Message-State: AOAM530cWWIa6U33lmW6ERP+In1Vl6IC0jObYja9kVd3dQosYFW3eIIV
 meLw55jNgHGx7b+cNBKLDVI=
X-Google-Smtp-Source: ABdhPJzXJ6WSolkHswgfPla8nh87EwG9hqZPP5JkedPgJWhhisbT1XCADqqVw9h87itTPbK+sO8tmQ==
X-Received: by 2002:a17:907:2651:: with SMTP id
 ar17mr2477656ejc.98.1611311981169; 
 Fri, 22 Jan 2021 02:39:41 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s21sm4131973ejz.87.2021.01.22.02.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 02:39:40 -0800 (PST)
Subject: Re: [PATCH] replay: fix replay of the interrupts
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c2188a36-0e89-8801-bdbf-cd2128ca5063@amsat.org>
Date: Fri, 22 Jan 2021 11:39:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <161105999349.694343.16096128094758045254.stgit@pasha-ThinkPad-X280>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, pbonzini@redhat.com,
 richard.henderson@linaro.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/19/21 1:39 PM, Pavel Dovgalyuk wrote:
> Sometimes interrupt event comes at the same time with
> the virtual timers. In this case replay tries to proceed
> the timers, because deadline for them is zero.
> This patch allows processing interrupts and exceptions
> by entering the vCPU execution loop, when deadline is zero,
> but checkpoint associated with virtual timers is not ready
> to be replayed.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
> ---
>  accel/tcg/tcg-cpus-icount.c |    8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/tcg/tcg-cpus-icount.c b/accel/tcg/tcg-cpus-icount.c
> index 9f45432275..a6d2bb8a88 100644
> --- a/accel/tcg/tcg-cpus-icount.c
> +++ b/accel/tcg/tcg-cpus-icount.c
> @@ -81,7 +81,13 @@ void icount_handle_deadline(void)
>      int64_t deadline = qemu_clock_deadline_ns_all(QEMU_CLOCK_VIRTUAL,
>                                                    QEMU_TIMER_ATTR_ALL);
>  
> -    if (deadline == 0) {
> +    /*
> +     * Instructions, interrupts, and exceptions are processed in cpu-exec.
> +     * Don't interrupt cpu thread, when these events are waiting
> +     * (i.e., there is no checkpoint)
> +     */
> +    if (deadline == 0
> +        && (replay_mode == REPLAY_MODE_RECORD || replay_has_checkpoint())) {

LGTM, but Cc'ing Peter/Alex just in case :)

>          icount_notify_aio_contexts();
>      }
>  }
> 
> 


