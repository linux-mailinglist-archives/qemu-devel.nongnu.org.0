Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187416C1CCE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 17:52:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peIiP-0001ak-3n; Mon, 20 Mar 2023 12:50:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIiM-0001aV-QL
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:50:30 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1peIiL-0008RN-CQ
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 12:50:30 -0400
Received: by mail-pl1-x629.google.com with SMTP id k2so13092400pll.8
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 09:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679331028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kAz17jAjDkgUA3azmV5YWOPn7jAXMJUI1Fut7+1x/so=;
 b=Lia0qR/6WbH3Rpu8mopPIERNudotazQW3ogxsZR4/c2qsbKKErin573I1EFtDQXBAq
 +lzLfAEjiwTyY/Yr6ExPwU0KvUls/y9S8PB2SuhCIR/06qZUqMPBy1B6huI8dsFjqODM
 88ZF5oVkVajklndQMt2ztlg1J0sIYUqcSDeRd+vLmXeTQ+wbrOB9yI8Yr6jm6oRGsZb5
 slKabPOJjw5s6mwmgk4R7r753fKQDswPLM2xwgH3w72znUDlIlDZlb+bR0S3V/2Dziqo
 +FQ7eESEGyWK1YdArc/2Aj2grCCm8rB/bVnheiGhV7kgbODc9sALI9oyooElk8lSuaM4
 bp5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679331028;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kAz17jAjDkgUA3azmV5YWOPn7jAXMJUI1Fut7+1x/so=;
 b=3evm09yzrI8uQFlslvsQ0fMVRBU7JHfTovrSeOWj2BcIs8+V8luTK3cTSyJgvU/R6H
 8qso6wWaUma7XZYJeQGPvTH/puatKKJwqTh2+jDovqd8JVxo0PPhtY+ApQovK0EKoWQj
 P9g4w5NCYfZ9nLRCdu4MIoq3CQOTJjGqgSkf+ACXg5dVyfCqAqft/HpOVzoxDfEPB1Oq
 BPBeqoBsaGmVnbUKHAypeSERLT0kmkkJHA0UZWD/sInJwFlMvEg+joMpr8TIpd/ZhBC3
 nUbndIaMgvXzWKh9Ed8NNr3HGTAT3gW0XM6DuM8ZtCswsOi5RYaLH10JnBi5FPtBjOCV
 nHBA==
X-Gm-Message-State: AO0yUKUxQZvk+wT4RyR4rDB0mhr+lK9jPxtFpkh2ry3+Y1YMoZHOyDrg
 Ilr5NqsBRvW4RyXCR4JkjiO3Zw==
X-Google-Smtp-Source: AK7set9wC0rKYKl0vnTsd6zZ9RSbA4k78lyabS7lwVuiWOXZA6k5p44MErV9CQ0/hUiL+hbQTpHG4Q==
X-Received: by 2002:a17:903:246:b0:19e:b2ed:6fee with SMTP id
 j6-20020a170903024600b0019eb2ed6feemr19013015plh.58.1679331027904; 
 Mon, 20 Mar 2023 09:50:27 -0700 (PDT)
Received: from [192.168.4.112] (096-041-163-098.res.spectrum.com.
 [96.41.163.98]) by smtp.gmail.com with ESMTPSA id
 jd1-20020a170903260100b0019b0afc24e8sm6927509plb.250.2023.03.20.09.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Mar 2023 09:50:27 -0700 (PDT)
Message-ID: <71086246-b711-f6f9-439a-0ff52ddd8b74@linaro.org>
Date: Mon, 20 Mar 2023 09:30:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 10/10] accel/tcg: remove unused includes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
 <20230320101035.2214196-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230320101035.2214196-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/20/23 03:10, Alex Bennée wrote:
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   accel/tcg/cpu-exec.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

