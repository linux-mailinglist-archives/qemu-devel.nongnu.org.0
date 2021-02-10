Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7101316D05
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:42:48 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tVn-0005HP-UO
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:42:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9tQr-0001N8-Bg
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:37:41 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:35089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l9tQp-0007Ju-Lj
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:37:41 -0500
Received: by mail-pl1-x630.google.com with SMTP id g3so1606513plp.2
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9CVFlwqso6wO0l02QGuHvwTzT2IgFNmo741QEXu3yoQ=;
 b=Vo8AgFG1bjE3zn1rayEXUaMkoCO0+4M4CxJ9Z6R0rOQ8iHxQXhFxybV/khzUnZETyd
 bLtiLZJKbWqLhH/ru6g30NQW/uIx1hdqVa2F6vNSNdw/X1JNMdS6WNW8UpddwCdwvlHU
 6tK9yInLeXgYQcjCWf3eTgmGg5hr9duTT2J0PgwjFRXtBvOCOkO0+WTMDLvhImZSozoP
 bYznBWZLpBCZol8HvnNHOaDxXz25adBznFTeo6NgPA8S1j0dK/J8G0bWGY9PlAmvje17
 fxhpIUyLkZcU2NJzWTJ2LrOajH60ytgQtbxLfQYiPxe1B3gP8i+z59HARKfi3+NOgfQ2
 rodw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9CVFlwqso6wO0l02QGuHvwTzT2IgFNmo741QEXu3yoQ=;
 b=mx4Y/DXPPj6KdaoVz0FxlXWWMETEnpeMlBHTuwJ+wuIt2XC9MupjngzoP8NEeKtht2
 Nkj1kxzdF8enovcgZyRZV/qIVarrnUm1mDaPWt4Jj85Ruxcu7mK2lUOkt4xeY6q4hKID
 YFI1rbc4CiHAamThNCDYvPv3Kr273RDK89kOMntC2y4N+gBYZwpJH+e1MwSug/oGcLXv
 /+jkaSo10/8jzZIGW32CY0EqtVXNetlgYggNZA9wURomxKW+QKadpyps4iQPzSIcdvRv
 o+6Xq9xLYDqfkI34s8Zr/ztOecuxmmZMCixkn86qZnyLL/wtojMNghBnLQzuyj2lq2am
 K83A==
X-Gm-Message-State: AOAM532KZ6PPwHKk6l/Jvez2zajxBDMyqqsTEUQveaqMLe9axV2H2CWl
 Zcw5EnfUai5hGp+JWnEkfErZlQ==
X-Google-Smtp-Source: ABdhPJzmncynzootQRzn0eCemr21PzVFvt6kUa94QiXVUcYcagSLNTWpsGrpRtEayubmgOJy8VC4Ng==
X-Received: by 2002:a17:90a:8b8a:: with SMTP id
 z10mr4128193pjn.67.1612978657827; 
 Wed, 10 Feb 2021 09:37:37 -0800 (PST)
Received: from [192.168.1.11] (174-21-150-71.tukw.qwest.net. [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id
 68sm3164277pfg.90.2021.02.10.09.37.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Feb 2021 09:37:37 -0800 (PST)
Subject: Re: [PATCH] accel/tcg/plugin-gen: fix the call signature for inline
 callbacks
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210210172751.11669-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba6b2579-14b7-e3f3-08b7-cb84c6331c55@linaro.org>
Date: Wed, 10 Feb 2021 09:37:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210210172751.11669-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.211,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Emilio G . Cota" <cota@braap.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/10/21 9:27 AM, Alex Bennée wrote:
> A recent change to the handling of constants in TCG changed the
> pattern of ops emitted for a constant add. We no longer emit a mov and
> the constant can be applied directly to the TCG_op_add arguments. This
> was causing SEGVs when running the insn plugin with arg=inline. Fix
> this by updating copy_add_i64 to do the right thing while also adding
> a comment at the top of the append section as an aide memoir if
> something like this happens again.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Emilio G. Cota <cota@braap.org>
> ---
>  accel/tcg/plugin-gen.c | 32 +++++++++++---------------------
>  1 file changed, 11 insertions(+), 21 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

