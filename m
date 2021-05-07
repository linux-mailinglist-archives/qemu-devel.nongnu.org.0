Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA5B376900
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 18:45:00 +0200 (CEST)
Received: from localhost ([::1]:59456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3b1-00079a-Sf
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 12:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3Yl-0005bZ-Hg
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:42:39 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lf3Yi-0004kk-Mm
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:42:39 -0400
Received: by mail-pl1-x634.google.com with SMTP id z18so1827326plg.8
 for <qemu-devel@nongnu.org>; Fri, 07 May 2021 09:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGbyLTG/ae6YxmlCvWygJRPj6FSCaRvBqpKMeTMO9rU=;
 b=wEdkYh+2stxn9SUaMA0OHh5H21Ef/3oNYlh4oe7qdA5jiuoOB1JSwONooKFlqqBWt+
 YrxHwT0akmJCOWuzPa7SZCqyHdB044Rr0weoNllsIutvNY/AigBpQuu2s1bKKx9eFqzx
 raUhsspPhzfcLymWlf/D5HDkBF9d0ajhCLMVaCYW2ardW911mdJwCFvUv0Dr9GBG0uwQ
 go2eGniWTUu/U61zJnHBcn8b1e9xEhwgN+ErsKExNM9uz3FLlurImmixVCZ0pJyi0UBw
 KlaR8XG3IPa7ccVSjq7aLUrggheiQGQw6pqiqLTBkLhKUrGYmQf/DBr2oAjPS4OnXNZL
 cs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGbyLTG/ae6YxmlCvWygJRPj6FSCaRvBqpKMeTMO9rU=;
 b=fUSGTdAW41ghqy2OyXABYv+j8/iaD2Uc8kGQMWAEJyW506uPvnvU3CacFmdJUt79Tp
 r5xr0Jz7VIxTVOT5BqODRBK7RPhnoVOgw9Y+ht8hDacKfmjSL9Gwcftw4ReTKCpnbNqU
 lxDt3fe9N1AfhWiDnI4YkZU8qHYSv6BybIEipTi8SMvkYuSejzWMpY/M7QekqV60C5RY
 zxdsrIDB8T4DXXHQCFuO2nb2FVij9o+gM3jgp7Ou2uujZAwQzuKygZduB976TpIvu/Np
 HborBWpAIFovKkABFIYg6HnFCzEGUfoWhRs5vMaymOpYiKwY8JtLfi9Pq47XDjSZaT35
 5QbA==
X-Gm-Message-State: AOAM532wbAT7AovGeQXfMIRXWnDG7DdFUj2ugpZrEnUHMob4Hhto9+3E
 ie/SqLAkpOkBfEhE1t588h5iog==
X-Google-Smtp-Source: ABdhPJxXr6rgcdx3qWP6zP2VzMs7H9JJwZjBaMXCinmCLBellNtfd48dX8kX9Lui1N3pPdbR9vzAYw==
X-Received: by 2002:a17:902:d681:b029:ed:6877:376 with SMTP id
 v1-20020a170902d681b02900ed68770376mr10470884ply.58.1620405755168; 
 Fri, 07 May 2021 09:42:35 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id o12sm4787850pjr.43.2021.05.07.09.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 May 2021 09:42:34 -0700 (PDT)
Subject: Re: [PATCH 16/23] ui/curses: Avoid dynamic stack allocation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505211047.1496765-1-philmd@redhat.com>
 <20210505211047.1496765-17-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <652ab80d-72eb-cbd0-02d3-32f09b4f39b0@linaro.org>
Date: Fri, 7 May 2021 09:42:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210505211047.1496765-17-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/5/21 2:10 PM, Philippe Mathieu-Daudé wrote:
> Use autofree heap allocation instead of variable-length
> array on the stack.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   ui/curses.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

