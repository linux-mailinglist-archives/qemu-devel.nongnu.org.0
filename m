Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9103491C6
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 13:21:05 +0100 (CET)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPOz2-0000mO-NH
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 08:21:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOx4-0008FV-Uk
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:19:02 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:45808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPOx3-0001dw-GM
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 08:19:02 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 91-20020a9d08640000b0290237d9c40382so1672994oty.12
 for <qemu-devel@nongnu.org>; Thu, 25 Mar 2021 05:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=goYeK9pLYHXcQ2+SqgisuJ8KsIZqVbBC1mLUWzE10WM=;
 b=UMwtsMDVD/FXd9wDFh0r+pZMK6eKTT09s7vei+8pXSPY0lgAVBNLMLTDi63viIXMKY
 eIHNIRZcI09rVhvlTEcJZWbcT1zloF8avVe7d3Mhvj92OKGJOaH5ALs3Vo7bad1f6TFI
 YRn97EHC2wxUrEjcl599sdQW1CUhNycgcjil3nDjBFkB0DCw6tvL3okdQJWKL/2s3Irk
 RPTLoNmHgOB9lrTdTmkjOc+43oIeteQ220KrxFdG19pX1VSfJO9EhBRAG8/LHtslt0g8
 XHyXPi/x7twBakX6EViFPPudBTh3jSWRpvWdLjhSBfT+fmRIWbIlu8mbku8C969nyTah
 9gsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=goYeK9pLYHXcQ2+SqgisuJ8KsIZqVbBC1mLUWzE10WM=;
 b=q+VGIOJgvlA7uS5oJimbkMHoQoz0PIffbesBWCPoCqYlmKjBYC9pp4bBtNUyoz7015
 pk/VhlXL1Th4RTi9ML6FowE6IxmPtcE99B/gnB4Lht4aJCGvy3crO577iT9NJ0xF6qyK
 c2P6d5SsSPQEJ0k8Yb0SNJ1ZebQuMhtUCVDYwTfl2CtFVuzj71PeN+lN6Tt/McO7MQ7G
 hBIa4f7JvYK4x4O7xaZKLM8F4UWWWQQPelhhgmBtyvdcJKw/1hfPTTe5Mscq8myN4rs0
 s5tivhBhYJVO02lxl93wElaOga8VOS8AxYUBXDS9fCAPOhrcnbI+CCjJaDWqM+xplLKH
 eF3A==
X-Gm-Message-State: AOAM531MMyDhQGOkLMKOE9Aki6FGfN96lFaGdcRk37hdc9OakD5tpRAK
 M29Z/hbBpGBrGanzFDSp3wd+4A==
X-Google-Smtp-Source: ABdhPJzlqULHOoFPsr7tSa1EWVsUJdKNkm+FjBX4HL8ud1ugqhnnrOnQsfIFpehm6kW49dpJD4S6TA==
X-Received: by 2002:a9d:3a4a:: with SMTP id j68mr7257519otc.4.1616674740149;
 Thu, 25 Mar 2021 05:19:00 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id d206sm1073265oib.56.2021.03.25.05.18.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 05:18:59 -0700 (PDT)
Subject: Re: [PATCH 2/6] hw/isa/vt82c686: Simplify removing unuseful
 qemu_allocate_irqs() call
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d896541b-c90b-4a1c-33e8-499799137b2b@linaro.org>
Date: Thu, 25 Mar 2021 06:18:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210324175438.680310-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
> Instead of creating an input IRQ with qemu_allocate_irqs()
> to pass it as output IRQ of the PIC, with its handler simply
> dispatching into the "intr" output IRQ, simplify by directly
> connecting the PIC to the "intr" named output.
> 
> Fixes: 3dc31cb8490 ("vt82c686: Move creation of ISA devices to the ISA bridge")
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/vt82c686.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


