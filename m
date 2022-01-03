Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4044848366C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 18:54:48 +0100 (CET)
Received: from localhost ([::1]:41772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4RXj-0004Ez-9W
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 12:54:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RWl-0003OO-Eu
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:53:47 -0500
Received: from [2607:f8b0:4864:20::531] (port=42628
 helo=mail-pg1-x531.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RWk-00009X-3w
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 12:53:47 -0500
Received: by mail-pg1-x531.google.com with SMTP id g2so30611416pgo.9
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 09:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fr+wyKUxi75zy6gIBb+i6XrZmUevXJ1ts7qOLu+jF1o=;
 b=Z9LtOdxNV0YEWZT4Cf4p+dM5vmuIrhwthxEXlGaxf6VCo9HZRYRc/5Ey4nucGYvyod
 lzx6yTiZ25OdbfiyVJUXNwxFwpWH8U2sdnwWfcUE3X/EliNLHL41MDf4kABcrctVJVSM
 SAgrGR6wkQ5cJK84bLaegBlswIZRFNmdmjJBQ7kbLYzFOKxCC74gGatOyW+ItO9omkGT
 GQZxNUb745eBjR5H+ZyI2IkHeemUnUcoU7nfmZIGRDqXRWScFY/KAHx8XwAnMgVUeaEJ
 zxoSPPwEEJPU6JdX5ZA5SMrSdj+DvHQ65fJ3yV2dT1ps1VFzWP9JiniJJDGrqnGm/KNz
 ZZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fr+wyKUxi75zy6gIBb+i6XrZmUevXJ1ts7qOLu+jF1o=;
 b=FvVyw6q1TZRUf7xcwr8p5hFWIiYgDlaYQrngZnPbwFvnwpnD8uDv+kCS0tLpLJB9e7
 fHiglM8tlRfHpzlYYY2KpcR8/WKtHe51/J/0iSscnObELYR06pW9czLLvWely7xlAwrs
 uBteBiqwfHRBTJpr1rJWXmezITEwM8Sih1JfttHbcZc2P0MZfHMl4bR1Lvd30ny9IXUR
 SZrEmTGf3o4UM4/qch9pZuGc0wu77gTYxaSC0OgPbjFM1uBrrBf11s7TKVca71jJ/KVJ
 mCwlSbzOlY7jnZKeztwWSj+JCrITeQsnMhlKp6pShYkXMhYAt8+cHQ14M349E6prTZWS
 yrzg==
X-Gm-Message-State: AOAM531xmHtC/tc2X2nUXsV7Z+jA6fBxdb4ZHJGveJgEP/IW01l11Klv
 qgmNvHlMWEM2yCg5Xiuh0YbsNQ==
X-Google-Smtp-Source: ABdhPJwMEOz1cFUHpQlBOQSlxd4OtAGbTt2b40w8usYGiizDrcpG7x+Tr28wN31yzrnJ/3tHagGWxg==
X-Received: by 2002:a63:2c50:: with SMTP id s77mr41447615pgs.571.1641232424596; 
 Mon, 03 Jan 2022 09:53:44 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id f7sm37997518pfc.141.2022.01.03.09.53.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 09:53:44 -0800 (PST)
Subject: Re: [PATCH 2/2] tests/tcg/ppc64le: change signal_save_restore_xer to
 use SIGTRAP
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220103165625.307309-1-matheus.ferst@eldorado.org.br>
 <20220103165625.307309-3-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2421ee6-ea21-cc8f-a6cb-39415c8062d6@linaro.org>
Date: Mon, 3 Jan 2022 09:53:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220103165625.307309-3-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::531
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 8:56 AM, matheus.ferst@eldorado.org.br wrote:
> From: Matheus Ferst<matheus.ferst@eldorado.org.br>
> 
> Now that linux-user delivers the signal on tw, we can change
> signal_save_restore_xer to use SIGTRAP instead of SIGILL.
> 
> Suggested-by: Richard Henderson<richard.henderson@linaro.org>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   tests/tcg/ppc64le/signal_save_restore_xer.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

