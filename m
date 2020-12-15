Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F12DB71F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 00:29:55 +0100 (CET)
Received: from localhost ([::1]:54614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpJlQ-00060A-P8
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 18:29:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJeK-0004qO-94
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:22:32 -0500
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41]:39604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpJeI-0008LV-Li
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 18:22:31 -0500
Received: by mail-oo1-xc41.google.com with SMTP id k9so5267977oop.6
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 15:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAOqAEKgtDopVLswWnS4lG+9el5eIJssgOsRmeRbIUo=;
 b=MH2g5td4pqDww5l3EfNzZam2wJKmfUwjFNymXpkJbZGRAH/uH/ykE5xdFjo8mXnAgU
 PjhLcg6AsOVZBEnformDG73U4YwV96p2uafYeZ7KCmb291lNH18J1fKgoRq0CVc7sqtS
 yaS/MEcKO/0rDGIaDmJRxFr0Ji24h5wCXgx6OysuEaIT2dMNoGPWQHZJ3Rn7JlbUPbqV
 bk3Tl8gYwqeTfo/h322eW/RXYc8LZrbgJ1I1WX1A9S7PpyPhHJ/FNnnFW4/5SMD5rBKF
 OBosLg3R64DWSMGklX9ZRgkY1BsaGiQTiqi8vNbyJxGGM4miEm8JUq9vvG7yP4sVY8ni
 75FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAOqAEKgtDopVLswWnS4lG+9el5eIJssgOsRmeRbIUo=;
 b=q6DDANfbJi7etIBySkKzBQqhcvuwpaGur8eqskgiMYaLbMiNWUc5wWrJ4EmTxKsaUu
 IgeI6bN00geFoJ+AUgIGHlNyxm6J9/hK9QJr5NKavqyICOA5GBjgTdUjyKHh9draMj/y
 Ui0StmGIoGV2ii+ybVIKAYJeA2N528A52DGe75A3y+eqTraMmH+N+ukUBihqdr+W2z2C
 DClW7XxaY1kKeLs3/FT4kjzrD3PUfZ3GBiutmAxOv5aJ9PbAZ2TI8w9++DB4vWCnqPWT
 rBxVLus2gLcHtjsoC3PF4mFhcQG47AXLa58IbC4cIhUEbqqf8P1OB+rM4BKUAMaC7MPu
 GZcg==
X-Gm-Message-State: AOAM531e0Dx0tgsy6dIqTsnqlQBk7OOC6pdJQ9MubyxiIUoJox7LgbVg
 S0E4VdHGwAzYL+zxXGKq5rSScw==
X-Google-Smtp-Source: ABdhPJyYb7BtNjIKViVJ3fa6Upa+QE4PTCFJtpOOi4c3nagi9JwrLGx0peUqXw4dYgEeA1nWZkEH7A==
X-Received: by 2002:a4a:c387:: with SMTP id u7mr19133338oop.89.1608074549489; 
 Tue, 15 Dec 2020 15:22:29 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id v92sm91767otb.75.2020.12.15.15.22.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 15:22:28 -0800 (PST)
Subject: Re: [RFC PATCH v2 24/24] target/mips/mod-msa: Pass TCGCond argument
 to gen_check_zero_element()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201215225757.764263-1-f4bug@amsat.org>
 <20201215225757.764263-25-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0b151ab5-edb4-3cec-4c94-7f7dff43738c@linaro.org>
Date: Tue, 15 Dec 2020 17:22:26 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215225757.764263-25-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c41;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc41.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 4:57 PM, Philippe Mathieu-Daudé wrote:
> Simplify gen_check_zero_element() by passing the TCGCond
> argument along.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> Maybe this can be named 'msa_translate.c' after all...
> ---
>  target/mips/mod-msa_translate.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

