Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B26F136378C
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:29:57 +0200 (CEST)
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYE3I-0007Os-Pn
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYE1s-0006yk-Jg
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:28:28 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:38421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYE1r-000609-1f
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:28:28 -0400
Received: by mail-qk1-x735.google.com with SMTP id s5so25255982qkj.5
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bXh0JNGf9KfpOsTH7WMqQcDd6p9QM2EbWnahiB5+ezQ=;
 b=tVswkyxWNLKa9oSDZGQxxDOtxDKjRYpdgtFCiEK7NTW7VbGBpekbIzd7bgnyqk5+gO
 wUwe6ta823tWYwcsesCag6gyH7TGLO1y6glhRiyE1/zx+2Y1vSM4NTaFYJ65xAGgKYTQ
 tLqd1/FljBbouBC682VlQkpH6bebkVj1/xsBGNOW0kKfl0e4j6FLPQcSPxiwtBUDiDLd
 zqREViONOvRKFolKaDFcS133N4VUgX889HPtfm8gqQxAI0IOsz4PPI5siwRUUg7nrH04
 t08QRXSA34lZA7auo8i0TzE9GB5q0zovuJq4box4p5tiZonTjqEPr+/QB9/ESI33eAtj
 zpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bXh0JNGf9KfpOsTH7WMqQcDd6p9QM2EbWnahiB5+ezQ=;
 b=kkYPvM354A6RIfFv44BIP/hOKukP3obgM8+4FQEWfan9kRV9HcT/FtmQ92i1dvNap+
 Co3glCLGQbite3hQvfBJHvldJEJhE5OAL6ipKZ9ciq96GQhIxb2gUndPu5O10ddOxGea
 RLh3THFFJiq/z14qSWS3sfAMdwmYhxUijFJEnKMecEoa5Y6zopA5Kuv/5Uu71Oklxw6z
 i9JTmCz99qfP59JL/0trjt6sAt92NljiV5WXyyVs6/agleCIKphdtNehLo9VQvcwRhCP
 fsssSJxYyi0wOC/+U4TLOVj0BVtm24UXLuB0pELcsVSkdJ3pmidzBNTp04hqR9RxQ+KB
 EHyQ==
X-Gm-Message-State: AOAM531GmtlbXhyeP4/OIqvH3uSduH9mXSM12icW0qIeCVg5DqBLdKiE
 G0Qz+2z72dqY362sxkJk1E+m6A==
X-Google-Smtp-Source: ABdhPJzIxSvOEUKCm9/RjpdQrBZvrpicoFI09Xl0qVZgC8emZe5SzawD5jNn+eNAfuI+abhjgjjhfw==
X-Received: by 2002:a37:4553:: with SMTP id s80mr9014493qka.167.1618777705956; 
 Sun, 18 Apr 2021 13:28:25 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id e14sm7547675qte.78.2021.04.18.13.28.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:28:25 -0700 (PDT)
Subject: Re: [PATCH 22/26] target/mips: Move CP0 helpers to sysemu/cp0.c
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-23-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10604a40-99ea-b0f9-94f7-8edf3846e828@linaro.org>
Date: Sun, 18 Apr 2021 13:28:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-23-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Opcodes accessing Coprocessor 0 are privileged.
> Move the CP0 helpers to sysemu/ and simplify the #ifdef'ry.
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   target/mips/internal.h         |   9 +--
>   target/mips/cpu.c              | 103 ---------------------------
>   target/mips/sysemu/cp0.c       | 123 +++++++++++++++++++++++++++++++++
>   target/mips/sysemu/meson.build |   1 +
>   4 files changed, 129 insertions(+), 107 deletions(-)
>   create mode 100644 target/mips/sysemu/cp0.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


