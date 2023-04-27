Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 458FE6F0604
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 14:42:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps0wy-0004km-I1; Thu, 27 Apr 2023 08:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps0wu-0004b4-7h
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:42:12 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ps0wF-0001FQ-KV
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 08:42:10 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-953343581a4so1290085566b.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 05:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682599232; x=1685191232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mWPY39s+jEYGtmXjgHTYeCWeKYTXFj8bZY+hOTxLFGc=;
 b=Jk6Dv2qnBl5i+OMKQRpZEw4JgXkiYGFrq/GZuuHNMCDezK5N4mCgSqeoWqxbKU+GbS
 WzMYU70J0iZ8h+pdaBFTyZD6fo+D7JZXsouUIiZa+NXGSU2y5UUjj8i2o+/h5BBuQYeF
 s9p/vV9/KokPViBAg2MDWav2Th9NBg1OHx7JikNrgOYs8G57oZBOHRJA1XI43IAQlPZJ
 7zgMtqf4sJAuppiLL/61gRsSZLVIFM3vbp2aWibJIKxBL9bB5E7+cSlVWNKtMwQlPNcv
 yTni/p/FDCXNKGgBdvmAe9dd568JgBXYfCBX/rdVLy4e9LY7lHG8TYxkDZDumdX6TnTC
 26fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682599232; x=1685191232;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mWPY39s+jEYGtmXjgHTYeCWeKYTXFj8bZY+hOTxLFGc=;
 b=Sp6esbCBsOZzvS6LXIcl3m6RUmXzkvRsd0QsRBzu/1OrtwLy11GQPEwe5oXsvPlldx
 tjNe+SHkFled2xqDAczkD7Ms3gnocruAVqpJJTOpj/53hYtKjrIBM5iIcdYdtC2O7m0I
 JYL3bH2tYYAjkI41J8UUhfKCvvDBKQfYAuuaA45JVnSALUkzDbyQI3O61uboQ4PrBGV2
 ptD1+tul0xidCZ/yIFqcIse7CMLTOuanqU7foTSwniLO06w65czLTbuphefq8vc5YSr9
 AURJwvy0QzHyXP+KN7CyofVnE9RD8Fnt6y+vc5gLTXCs6DvQC5w/1ppYzhj96JzJmigG
 TIzg==
X-Gm-Message-State: AC+VfDxUtlAVrpQj1eCllcs2RhTqBbItR1i4q9pxGsFBe9zUU/ccIkR0
 zPXzYU9pRR7/7tPasIR0ZVsbuQ==
X-Google-Smtp-Source: ACHHUZ6Njzavr9XElqOVmmP3niyvzAuHSoN0ZwJMHPAn6UJHEcQonHOE/yLZF0EZaP3V1BZTcgeMgA==
X-Received: by 2002:a17:907:8687:b0:953:7bb2:28d8 with SMTP id
 qa7-20020a170907868700b009537bb228d8mr1510666ejc.21.1682599231898; 
 Thu, 27 Apr 2023 05:40:31 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 l15-20020aa7c30f000000b004af73333d6esm7797576edq.53.2023.04.27.05.40.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 05:40:31 -0700 (PDT)
Message-ID: <d848bcb8-71b2-205a-c953-23e4a9b7d888@linaro.org>
Date: Thu, 27 Apr 2023 13:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] tests/tcg/s390x: Test EXECUTE of relative branches
Content-Language: en-US
To: Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand
 <david@redhat.com>, Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20230426235813.198183-1-iii@linux.ibm.com>
 <20230426235813.198183-3-iii@linux.ibm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426235813.198183-3-iii@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/27/23 00:58, Ilya Leoshkevich wrote:
> Add a small test to prevent regressions.
> 
> Signed-off-by: Ilya Leoshkevich<iii@linux.ibm.com>
> ---
>   tests/tcg/s390x/Makefile.target |   1 +
>   tests/tcg/s390x/ex-branch.c     | 158 ++++++++++++++++++++++++++++++++
>   2 files changed, 159 insertions(+)
>   create mode 100644 tests/tcg/s390x/ex-branch.c

I'll admit I got lost in the macro expansion.

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

