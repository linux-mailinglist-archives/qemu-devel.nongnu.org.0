Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5616ED1F2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:03:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqyek-0007ih-0C; Mon, 24 Apr 2023 12:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyef-0007Mq-1E
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:03:05 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pqyed-00081G-0W
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:03:04 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a53so32189415e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682352180; x=1684944180;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I43GFvZ+V7R9ASVGS+p2poQ832aMDUCzddW1eEWyKy0=;
 b=DizR1rYFY5syJwBdcFhVwznw4wlErImSj8/RFuw5jl9kEzcPlWOL88D4XLybQA5AtL
 20Q2hZl7Wu6KgRYMqAWotCn8BsCTokKay9JncoH98iyAvXfpLywFnhno7oEP+sZIH7Fn
 osa7kcs+My9DgyciWVwK9gLqE8NdPYWWnzseKwdWIYkgSGiWlzWe4PlftbFXa3XwIlr0
 c5YWE1Bc21NJGDu0S/gqZtiZZSHVD/HpmWrsDNzJDuvdMb3/EFYgfoe26MFitONRrwT4
 G2DqC0F1fQJYJ5FXx9UW5VVPm0feGPpEgSH/r6jCwatMkwj3FOJIEPFlaG1Z3P4oUGJT
 9pPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682352180; x=1684944180;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I43GFvZ+V7R9ASVGS+p2poQ832aMDUCzddW1eEWyKy0=;
 b=iA6/FjX+EHszNt9z2c/SGqLYI8MD9d/Tt8/bj7f69FoZj+B+RGpKmQJhNulPcwdHVQ
 vvUim4McxSZAauI1NKnmh51xJu9JA41fG2ksoaUQ+zjTx3QRvgb+SbAuKQXTm4eymxJr
 +2nfuv+6MWmGnaKEWAR5FXZJNyAuEAja1dhjMBznv7FVCPuWig/W7rRSka5gXuNBvNmC
 6WCCzjd17dbgI89hG2UkZlnfAQb2WH0EH/VDkikRtdtVGmbPsdH0iewF32eCmbRdnCjF
 9unEDWNbx6ZH2jS0RoY3RO1/0+6OTxY9GG39IjY/EE6HbH6eKpd/oIeg26f9E1Itl94B
 GsZA==
X-Gm-Message-State: AAQBX9eSYNBRZcu7+pFsxn1+l065kJ7G47dv4jAXAA/bqpbky9/hMhgK
 XgW2PSoSmZJzGEbX3Td0If8CWKe5Ooxp1p7S0ugANQ==
X-Google-Smtp-Source: AKy350bB3FAp61/AI7Xogmlwx8jh8y7lAb2kAKLrG52rlUd3j02SPMLBoos6bBHgKch27X9/4ubNig==
X-Received: by 2002:a05:600c:212:b0:3f1:93c2:4df7 with SMTP id
 18-20020a05600c021200b003f193c24df7mr7969809wmi.5.1682352180542; 
 Mon, 24 Apr 2023 09:03:00 -0700 (PDT)
Received: from [10.43.0.114] (cust-west-loneq8-46-193-226-34.wb.wifirst.net.
 [46.193.226.34]) by smtp.gmail.com with ESMTPSA id
 h7-20020a5d6e07000000b003048084a57asm1464822wrz.79.2023.04.24.09.03.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:03:00 -0700 (PDT)
Message-ID: <011b8fc8-99b8-a3d0-7001-efdf72a7c2ce@linaro.org>
Date: Mon, 24 Apr 2023 17:02:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RFC PATCH v3 43/44] target/loongarch: Use {set/get}_gpr replace
 to cpu_fpr
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <20230420080709.3352575-1-gaosong@loongson.cn>
 <20230420080709.3352575-44-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230420080709.3352575-44-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
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

On 4/20/23 09:07, Song Gao wrote:
> Introduce set_fpr() and get_fpr() and remove cpu_fpr.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   .../loongarch/insn_trans/trans_farith.c.inc   | 72 +++++++++++++++----
>   target/loongarch/insn_trans/trans_fcmp.c.inc  | 12 ++--
>   .../loongarch/insn_trans/trans_fmemory.c.inc  | 37 ++++++----
>   target/loongarch/insn_trans/trans_fmov.c.inc  | 31 +++++---
>   target/loongarch/translate.c                  | 20 ++++--
>   5 files changed, 129 insertions(+), 43 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

