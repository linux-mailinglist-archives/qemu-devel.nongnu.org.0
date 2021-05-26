Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB585390E3C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 04:16:50 +0200 (CEST)
Received: from localhost ([::1]:49344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llj6H-0003vg-UF
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 22:16:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2V-0001Av-8U
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:12:55 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:36490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llj2T-0004UC-GD
 for qemu-devel@nongnu.org; Tue, 25 May 2021 22:12:54 -0400
Received: by mail-pg1-x529.google.com with SMTP id 27so22991227pgy.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 19:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=qrQXyVyq4QwWLodHiKbngIZmMttCwZNmfiYBNokad7jPpp5yeXzKqM0jzSotuYa7h/
 ELtet1bJq5C/4sUhZM9ppd+/xqW6nm3Xsl6cv4F0h02PUr4I8Ff5AD1fRfvAKM8NJDQG
 RyVLTWIR9iDNtNJ7NKi7RAEjsbhkw1GOSCKInULcU9HTFLe8Nd7MZ2EDtmYSKbJwBE4X
 kEIliKxUWZMuyi4qw7fuys4TzpliKdKC4D0hBuL427RvuVBiylC5Z+zMKA74GlTLEGTW
 4d7jFl/L4OI2EiZqEFVnyJaufrHuCihSzuy7ZbTjgTdzFVH3uTq40Eg99FMtgbKCpjdK
 Fp0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1ACUOCqdn17RVm5Hag3M2hwHGksegtAeTMD0aHzy6Io=;
 b=M3x4S2UoNFkcDdjqtbxufWOU8Qs33gQ4+Adj/xNhWhQJIcHYn/AxnMA2bNMJCq/1/s
 CxCW+D7wU8LXeyxFgEOi/1DnXf/BHZ2Ej1YXvCU5VZ/hCC7Ikfn8Ts2AUKf11NWdNGxX
 Cohdebgrv8+eivj8GRAGitmZu4T308CpWkVy6pdJAuIR8eIXLoc1ZHTq9diSbF54ghI9
 rnWOpAvQhU6YWrgux7CBWUzZCq9jGhUVHM6j46fgYirL+iKs1qS7dJQ0p43Jw335Xy9Y
 P2rtGNOEh+ZY2FBmgsyaT36PYJ/uIrhub0ajDh5hJQ5utqZbULvPH/CtWrelHOZwOKML
 irmQ==
X-Gm-Message-State: AOAM533H5DdiqgoP4PUm9sk1W0Ujh1fzLT+vgmBrq5/SyE53QTQbSM7m
 x17+ZD5f38hLH0iwUXQHxkZKbWxbVNZLjA==
X-Google-Smtp-Source: ABdhPJwpjNPQN/rksGJ+m4RDVaGoTXcKZZG9oQJqWZ0rGLn8UH5T4t7HN7oRGUGruzIpIzMf3cHVyw==
X-Received: by 2002:a05:6a00:1a4f:b029:2e0:754b:88c2 with SMTP id
 h15-20020a056a001a4fb02902e0754b88c2mr33161712pfv.65.1621995172039; 
 Tue, 25 May 2021 19:12:52 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 13sm14779492pfz.91.2021.05.25.19.12.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 19:12:51 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
Date: Tue, 25 May 2021 19:12:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517105140.1062037-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 3:51 AM, Philippe Mathieu-Daudé wrote:
> In commit cbc183d2d9f ("cpu: move cc->transaction_failed to tcg_ops")
> we restricted the do_transaction_failed() handler to the sysemu part
> of TCGCPUOps, but forgot to restrict the target specific declarations.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/arm/internals.h |  2 ++
>   target/m68k/cpu.h      |  2 ++
>   target/riscv/cpu.h     | 10 +++++-----
>   target/xtensa/cpu.h    |  8 ++++----
>   4 files changed, 13 insertions(+), 9 deletions(-)

What do the extra ifdefs buy us? Surely the fact that the symbol is not present 
in the user-only, and would produce link errors if used, is sufficient?

r~

