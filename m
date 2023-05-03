Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCEF6F5599
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:08:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9Or-0000s0-GJ; Wed, 03 May 2023 06:07:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Ol-0000kA-5J
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:07:47 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pu9Od-0000sM-1w
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:07:41 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f95231618aso3042263f8f.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683108458; x=1685700458;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mAdzLbJN+aeB493e/VyT67/4zonz1G4I82ZGjbc0o6U=;
 b=bgZwzW80NrChL6LFqq1I6+fpdFkCFVpq7M/W2kcioEXSLORkZmQmxIGP4MKCo4/xtp
 RMfXPQCgj9ZzX1FQzLFfnH83en2gaz4mHJDbvDNwkrx9B5j/xD4sRmicbY+qWYL+xwz2
 qrGUuYTaN6ctweZAXHGPJRLsQLuM0RQvaW/HuSirEIFdJUB3bN5+U/mfNSLlH9dG+d06
 78vvlTCHRkryfgGytD8tFtOas/L+5SpFGwCRJy3lYmq0yyB97A10LI4DqGrH5tPBc0yQ
 OKCMW5AkW2whlQLg0aXJMWRnp5puFVXNSCC2zFRGb5mGMyYzcF2lpnDZuXbVVWzNu9/9
 iWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683108458; x=1685700458;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mAdzLbJN+aeB493e/VyT67/4zonz1G4I82ZGjbc0o6U=;
 b=EQochTl0295Fc7qC0kCcaazpnyoYmKP2+1HJ5bPA9dZllwUVFGsTzey9I/RyAWgDqP
 vouAlN8r8CLTYHsLb+YEDFF5j8P1LubzMKQZKKgBuTdRbGvUx+eh3SFzurYshNctwz0C
 hmYCh0fU/ITD2GXqQc0iQMKGyFlVjfA+Bi68lbi80l5AYNZuyibgj4eHfJURQBroWWv+
 eoeyYtM531mQ3PfgaMHO0r2oIQMzft+JndaGkdQG8EAZNP39acZYS9yugDKIrKVXfM4E
 Yl4t63oUKEoHMiWzf9E/TM4ZEzHRXStHmjdU6XT7ILmFAO7vAt2H0+ehqSG0VDwMsxAc
 f3SA==
X-Gm-Message-State: AC+VfDy/pKM6yLM2vukti1EtdZlqbbf7fJ6AqG4JEqFmA966zfMgIgpk
 +XoxvsZxvwDU2uZfvAok03yEIw==
X-Google-Smtp-Source: ACHHUZ6gq6EAXLO1JpQ1E6lHFs3co02+ZNpBorxDk7cEMa9nvSmQ/UJ82hdlXK895MfMBkx9mTMUtA==
X-Received: by 2002:a5d:6b8f:0:b0:306:2fac:377 with SMTP id
 n15-20020a5d6b8f000000b003062fac0377mr5594103wrx.8.1683108457687; 
 Wed, 03 May 2023 03:07:37 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:c01d:9d74:b630:9087?
 ([2a02:c7c:74db:8d00:c01d:9d74:b630:9087])
 by smtp.gmail.com with ESMTPSA id
 p10-20020a5d48ca000000b003047dc162f7sm24007536wrs.67.2023.05.03.03.07.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 03:07:37 -0700 (PDT)
Message-ID: <e510ce0c-4ea5-a6f8-5575-bb82a0efcc48@linaro.org>
Date: Wed, 3 May 2023 11:07:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 10/10] xxhash: remove qemu_xxhash7
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20230503091756.1453057-1-alex.bennee@linaro.org>
 <20230503091756.1453057-11-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230503091756.1453057-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:17, Alex Bennée wrote:
> Now we no longer have users for qemu_xxhash7 we can drop an additional
> multiply and rol and make qemu_xxhash6 the implementation. Adjust the
> smaller hash functions accordingly.
> 
> Message-Id: <20230420150009.1675181-11-alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/xxhash.h | 17 ++++-------------
>   1 file changed, 4 insertions(+), 13 deletions(-)

Oh, well, I noticed during this review that we're not hashing cs_base, so probably 
expanding this to xxhash8 more proper.

cs_base is used for all kinds of important things, such as AArch64 flags expansion, so we 
might get better hashing performance by including it.


r~

