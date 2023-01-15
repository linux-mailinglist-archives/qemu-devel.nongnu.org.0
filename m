Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D3466AF04
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 03:02:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGsLM-0005hf-IP; Sat, 14 Jan 2023 21:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsLF-0005fe-Kv
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:01:53 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pGsLD-0007jO-8G
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 21:01:48 -0500
Received: by mail-pj1-x102f.google.com with SMTP id bj3so22788890pjb.0
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 18:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0hDiR+1aZ9XSd+OsYKEH8jyu2bQaTDFjwypq5UyTmBE=;
 b=KQx813vJXPPywfy20yMpfkA5RdNE0UzguSuKFhbKvRa+WphqRE/09z/xxprQo8CIdR
 kagEWw44VgDWHTjJ8X0vHqQKpVT1WtsuZwUK3C729ue5pJy4GDGC2bROwy6FKsupaXgW
 csFd6uOZjblzczT2gL3eNxxZXojKoRHKgJTfkPnqkAeuEH604Y2NF0eg39v/zg2xfx2n
 3+3BshsHzGQNZBy9KbihtqbBAX8S/RiTSVNx3zkS+6Q07QuVhNd1Wwh2v6CHRXOoWcnG
 mry7tZll+vr8Sf+M0iKK5woiBzDn3Bf8x3wglpour7PgJSLhMsDYhGxSryxFwf42ehKA
 mcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0hDiR+1aZ9XSd+OsYKEH8jyu2bQaTDFjwypq5UyTmBE=;
 b=R3HITodwyuHNYEVr79mSRpwGDH85j/+FauKd/0Ntth0h5u8ClSLQ55+Ti2vDCFbbE9
 j7IqOn5v2CwejQnev9xUihxLj+faUOURdcAGI+PNNkC+Go3e3mzmnGPgWhwFWIAhuTVX
 LVnOEeA+/CACOzX2LtOicUbcjgwteVZ83kYGZ+jMvy845YJFDyAW913EgR47B5NYh78L
 8FGwYwXH0DsL8lSKJL0Dog0rF2/TQUMkGti5qnLNFN6taRAEKwJFujQI+OGROsxxAGAi
 H+P83bUaPDB7LN7SFTRqgNKE0hEYNUnSn3BwFAU+HNyON5wvK4+hBM3JYbINJ5G5O/i1
 8x2Q==
X-Gm-Message-State: AFqh2kpPS9x72IR8BunfF3e71sRAJS+mnDe1Ek7RAzAa3lSnmEvp3gm4
 jnvbqB1nglGBXf1P0P1v3zWOGg==
X-Google-Smtp-Source: AMrXdXtUYdigCzTVhxlQqGUVx8bcbfcy4qUnfLnRHQcc51DrhDMjKe8coFVoouWSFyOWQOL4wzYeaA==
X-Received: by 2002:a05:6a20:2d99:b0:b6:7b49:8ed with SMTP id
 bf25-20020a056a202d9900b000b67b4908edmr11373800pzb.16.1673748105657; 
 Sat, 14 Jan 2023 18:01:45 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x6-20020a623106000000b0058bb8943c9asm3371864pfx.161.2023.01.14.18.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 Jan 2023 18:01:45 -0800 (PST)
Message-ID: <ddf97585-7429-bc6f-2dd4-990a0b480034@linaro.org>
Date: Sat, 14 Jan 2023 16:01:42 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 4/4] target/m68k: fix FPSR quotient byte for frem
 instruction
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, laurent@vivier.eu,
 qemu-devel@nongnu.org
References: <20230114232959.118224-1-mark.cave-ayland@ilande.co.uk>
 <20230114232959.118224-5-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230114232959.118224-5-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

On 1/14/23 13:29, Mark Cave-Ayland wrote:
> The FPSR quotient byte should be set to the value of the quotient and not the
> result. Manually calculate the quotient in the frem helper in round to nearest
> even mode (note this is different from the quotient calculated internally for
> fmod), and use it to set the quotient byte accordingly.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Fixes:https://gitlab.com/qemu-project/qemu/-/issues/1314
> ---
>   target/m68k/fpu_helper.c | 29 +++++++++++++++++++----------
>   1 file changed, 19 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

