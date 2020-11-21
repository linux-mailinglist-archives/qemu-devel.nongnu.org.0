Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FDE2BC1FD
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 21:15:46 +0100 (CET)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgZIP-0000Zw-EX
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 15:15:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZGz-00083q-7c
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:14:17 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kgZGx-0006OD-KQ
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 15:14:16 -0500
Received: by mail-pg1-x544.google.com with SMTP id m9so10500372pgb.4
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ixbbSGhDcTPWmlArU21ZhJtrpYKbnI95u4J0OepdOuY=;
 b=tixZ15ziJO/Aq4pC/Bpi+ZACGHpHntl7IzBE7s8n1/1zac92CamoBr3JdOmDscXOTA
 9M33XI5PYmquLIJ9PTyeoKBk9Kj2WXi4NxZfA+S6vEHxTPpR0FgiEtL54VPTq5zp0tGE
 0O+ZaMjUliU93aTXX6Ma1HFegYlUYu6okRqAo98/+c97aB2JQsKxfFJLhWf2tZtlNQaW
 dX3t5MYW7TWGhHzFLWvFJ++Wljsy4OyomLdBWwqQ2g/7PuezL2yjScM+7fspkRQab+Xk
 sNZq/oHkvnSECMScfid2hTE64kikV2aPCDzIZ47HlAmVbmOBYzhlt37APgFgEY8dLHDZ
 7I4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ixbbSGhDcTPWmlArU21ZhJtrpYKbnI95u4J0OepdOuY=;
 b=fRbzwlYTB14/fZAYdd13zBf5bHOf8YfLH1727qEo+QwcS+7r9Jn99HDZ99ttVNK1Ho
 dtJNiRmwk1EJgkw6rw4383kGRAPTT38dNBe/nWxaZjCNTI3rczYahyPHi1P5WJ79M4Tn
 vtxLQ/ssas3vogncMVguRLk+qE4rsUicaicI9cktHcJZ6AZ1ws7DvXTEnVGJnjptvdQo
 zbo72vl/HKXyjJAekYsN9AJbbOvcVlAwdy8g45pPpNIyj45C384vjYexTWmjBTe4zxuK
 EFZbVskuiAh4XSz7HqRam7KmN21oVCBz+CbIymhZyiT8W66UQL6PPZ7X49jkeFhSHlsC
 W5hA==
X-Gm-Message-State: AOAM531z/qu+eyAWrFNsaUhYFpOTK7FXM6kWqXvluQo2lc9n9crR07J3
 JWdXPm6yCnqfJzn7PRdeISs/Ow==
X-Google-Smtp-Source: ABdhPJyhqCky7NZ80qmg1qJeh9kIZoXpAVTxUbT1u0tVB1ApcskMt0F+V5MDGwU2hHIIChSha9KlLA==
X-Received: by 2002:a17:90a:d495:: with SMTP id
 s21mr16462700pju.42.1605989654361; 
 Sat, 21 Nov 2020 12:14:14 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id f17sm7922203pfk.70.2020.11.21.12.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 12:14:12 -0800 (PST)
Subject: Re: [PATCH 21/26] target/mips: Make pipeline 1 multiply opcodes
 generic
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201120210844.2625602-1-f4bug@amsat.org>
 <20201120210844.2625602-22-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <037e4043-485b-73e3-ae9c-694fdd95b6f5@linaro.org>
Date: Sat, 21 Nov 2020 12:14:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201120210844.2625602-22-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/20/20 1:08 PM, Philippe Mathieu-Daudé wrote:
> Special2 multiply opcodes are not specific to Toshiba TX79,
> and are not part of its multimedia extension.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 75 +++++++++++++++++++++--------------------
>  1 file changed, 38 insertions(+), 37 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

