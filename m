Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C75DA400563
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 20:55:47 +0200 (CEST)
Received: from localhost ([::1]:43514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMELq-0000e7-BZ
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 14:55:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEKQ-0007cq-BN
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:54:18 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMEKN-0006VT-S4
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 14:54:17 -0400
Received: by mail-wr1-x42c.google.com with SMTP id x6so24514wrv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yIi6cB7WNF8LQ0Ed9ML2tyuqdnRS5B/UrdJhP+Qgnbs=;
 b=D/Vm9lZ+qoiHPFzqQOaEYT3NV0+oiToTWLupVFxbiXRXZD9BgvgyGV4A1wvNmdqEr3
 40UEQbae9waCUUILyaHMZ1HvuZ+PlrRIXLBM/8/Ry1y+mqoX5asWp3pWB4vLSwbI3Yw1
 aEYO3CrD62wvwVxSqYqXvDXhNFeN3NG66TROF4c1wo9YSAIRClFQwfHwkThXGOOB+89P
 WCrW+B+ess3cG4ZYZMovojQ2wQSq0iUym5Rj7I+Jl40AnvG4kh/OKZJZJ3Q/GZoogaWR
 g2XFdykh53wf78m6V5OlnQDdjkJCmc9sXFnna9Pqqs1AFMhAC9rayB5BEmc+WMop4RR1
 2mqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yIi6cB7WNF8LQ0Ed9ML2tyuqdnRS5B/UrdJhP+Qgnbs=;
 b=beoQ6UFFS7I5DGOjZe1RfRxIvucAkk77ciZ6XYbEJEwcm3gygyw/WHUyaWpu60I/VA
 X0gj7olFiT6Df/3BsSa6xs2O3CmNp8hf1C+zqUqxBD9YkdlDQYkKUihbqnmI6yllfY3A
 rjki7pQZCE1IBcDDRZhugq3HYgbEw2Ctwvcq0ztrbEaQkRQvzPBZfmq88TLr176/kU0a
 HlxfGA0EW+rYP+uq//LWKgAYqtGybvvZrjrAvCcb6Z/fPFRhSQC8kDqe0u9qmxzIzDi+
 XQO0JnX8waz6d1PiGrhojogeMxAHCv4EgITlcEdOKjDHtbUF4oMpRimdEJ3wVgo6cIf1
 atdg==
X-Gm-Message-State: AOAM530eE38B9HwTW97Cgg3qOBSEX3gQZbLg5IonxCL+aS4F7auovqxT
 vTn+u971ra0mdG0Kj/oR9hL9ig==
X-Google-Smtp-Source: ABdhPJzDbaZHDRZRuzXLEl0/wxZSq8LIeGxg7N/CIZwzPj1hsomntywa/gaydImoX58AjT1OmoEYAQ==
X-Received: by 2002:adf:c785:: with SMTP id l5mr525124wrg.360.1630695254317;
 Fri, 03 Sep 2021 11:54:14 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id u26sm74414wrd.32.2021.09.03.11.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:54:13 -0700 (PDT)
Subject: Re: [PATCH 01/24] target/xtensa: Restrict do_transaction_failed() to
 sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210902151715.383678-1-f4bug@amsat.org>
 <20210902151715.383678-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0759ebf7-0a8e-392c-83eb-797d5887b07c@linaro.org>
Date: Fri, 3 Sep 2021 20:54:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902151715.383678-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Warner Losh <imp@bsdimp.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 qemu-ppc@nongnu.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Kyle Evans <kevans@freebsd.org>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/2/21 5:16 PM, Philippe Mathieu-Daudé wrote:
> The do_transaction_failed() is restricted to system emulation since
> commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops").
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/xtensa/cpu.h | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

