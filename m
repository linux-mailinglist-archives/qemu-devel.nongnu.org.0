Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5243D1E2
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 21:47:59 +0200 (CEST)
Received: from localhost ([::1]:38468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfoty-0004Cg-9s
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 15:47:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoJh-0006ak-Uq
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:10:31 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfoJg-0005dC-CN
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 15:10:29 -0400
Received: by mail-pl1-x635.google.com with SMTP id z11so2680802plg.8
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 12:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YaH/QRucbHrHQvd4T0y8gwcoRYZR4uzeqYWC/bVJEps=;
 b=iv2XlL60Fk1aIPsDkN7YlCA7GwJSxWYrZ1DUP3HQWczog8chlG4RvpLdeGxBj+mBNZ
 AY2C6Zih/kDXSaM2qP/BipDNY8c6MKdlMnHtUSETc0ew+JrKZygInX1lOs+j1z6poJKe
 cVVe5+LiS9483y79Mr0NhiwTN+CkGA2euvHSb+P7ZhijPtGiLhP+0UWK3yPCHMWJ4/Zl
 OmEz+6vZCZMiV7IrM8/duKIE/JmGfba9/3nmoeV+JATh0OCgVRfoPX2ySb1xa+utrp7U
 yMu3+q2nB8+xT1/gDAbRLIMRJfI+93cA81oZG5Bcbfq2rfe/+QXEuyEefOQzjATUy1DT
 7TUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YaH/QRucbHrHQvd4T0y8gwcoRYZR4uzeqYWC/bVJEps=;
 b=6imVE9H8y/Pxsihp1YJoYyBYL5fWtgVvYVmIRBTI1l01NpRQEBAiJQPaifOP3JKNH4
 W3hHOit7OtMxqJs1EQjGze7qGP5u47wPq6YzZwCgG/Sq67XcIZ2LRmiENUmiuuxp7218
 Q61kKYC3FdW3BpCwQZUjM+a9MO/UCk/67h3AnKLwo7F5L0FwsPEOQm5vXbOunY7K7QSO
 9ihh1qdxThMux6Xspdx9keEHxLDkhSP7WGg+mF0BaVXEsrxn3S03MIX5iSxRW7j0giX1
 6S5iQ/yFYGtqRVgR4qhBF+/ckj3qZAiVKw06fbzRRJZuHQI/NZmBOp/CBxhvKGxlI6xQ
 RJ1w==
X-Gm-Message-State: AOAM530Qgw6ojdxN6yv4uSdKnrqi2v75Os8Bk7nRM+eBttbymNhwWM3K
 KhndAHBOMlb3+0G7Wjw4Imj+ew==
X-Google-Smtp-Source: ABdhPJw/3emYWMAPTzF+PTrA0ZWvVF04dZbinwKsneZ7iJBQXqVH5A4YK+IueROU+bo4g6UoW/aA0A==
X-Received: by 2002:a17:90b:4d88:: with SMTP id
 oj8mr7399963pjb.175.1635361825537; 
 Wed, 27 Oct 2021 12:10:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id a12sm5049805pjq.16.2021.10.27.12.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 12:10:25 -0700 (PDT)
Subject: Re: [PATCH v2 08/32] target/mips: Convert MSA LDI opcode to decodetree
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20211027180730.1551932-1-f4bug@amsat.org>
 <20211027180730.1551932-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <03d50538-fe50-c9ae-a2d2-cb0a4bce6bb3@linaro.org>
Date: Wed, 27 Oct 2021 12:10:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027180730.1551932-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.847,
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
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 11:07 AM, Philippe Mathieu-Daudé wrote:
> Convert the LDI opcode (Immediate Load) to decodetree. Since it
> overlaps with the generic MSA handler, use a decodetree overlap
> group.
> 
> Since the 'data format' field is a constant value, use
> tcg_constant_i32() instead of a TCG temporary.
> 
> Reviewed-by: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
> v2:
> - add &msa_ldi format
> - !check_msa_enabled -> return true
> - TCG timm is constant
> ---
>   target/mips/tcg/msa.decode      |  8 +++++++-
>   target/mips/tcg/msa_translate.c | 22 ++++++++++++++--------
>   2 files changed, 21 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

