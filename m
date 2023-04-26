Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCC66EF365
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 13:25:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prdG7-0007A9-Ex; Wed, 26 Apr 2023 07:24:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prdG4-00077J-KF
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:24:24 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1prdG1-000429-Ir
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 07:24:24 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f27a9c7970so6296564f8f.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 04:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682508260; x=1685100260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vdB+T5mzYIxruEFQa5L1fcPBQSTBxGmnYs5VifK0mEs=;
 b=MEHCHJNTk3AqPpE/8I/o6G1k8LTSGONK8FUuDUB+nAqOh9/LD0IDdLgfpjYieHKNIq
 e90Ajt70P/dgmJR7Qv5//lC1jKvR3fUtDhpxfOaWJUmsAb4OA6vBGBEvC1aGQ7X/dONQ
 R3pgardJhvOP25xzSYwGTMnKHF5oROxLICKlJlLEQiHDRQvxy4p9bfC6jbZTbZ6YTcCI
 98SnSu0AaIBJSXEw8BFG1VP62pLRx7mYAfGkA3RBaLUhvKcOs3GFvQ5SMFqBBi5wZKeJ
 YqrvR1fpZzieohR1/ezr40z3YIGu9YKI7Q5homrl7s5NNfa3S5WFZmDgK12ccADM2R+C
 3l9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682508260; x=1685100260;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vdB+T5mzYIxruEFQa5L1fcPBQSTBxGmnYs5VifK0mEs=;
 b=cIEGVkT/owyL/kVZUyEZI7jsgVY0otOqndNx6ityk7RvIBvfb7Ih+2MXoCduBIcXbN
 xH+kveqX3Z/xamWQWvJSgO6JGV0EuMS6RUAke59CcvQBz5dzfahEgB09KQ27jwHhQJY5
 rSt5A0/NHo7qluGZHOsD4NzGdB8B3S/STDawuwWhHOPbydtIvtiOaeBemSWkag3HxaER
 U48c1vCCzxkOEdcgGhbeZDWvzuzFzwcXgk5GuM6Nh69HH7WQ5/wzHYqUHYlAjE6DPnWv
 wNB0YV4KNEakKsUzIt+5kVTIkWySoAbmuF4Eh18v82FXYA3lr9RiHB/0sJuwAsiW+/Ct
 lZfA==
X-Gm-Message-State: AAQBX9falLpc9ksbjErn3cMmg3JKM28vpVV1v9a8O+KZwx/ihmatBGyD
 RXcMShWwLBC5HAX+rL3LYn2DSA==
X-Google-Smtp-Source: AKy350baNONKI5YKxn2YDJOpFmIvIs5mgf6y2D5fcoK2jpsyu8Jy1pG6hkAY8WRcsmIvYmijRxPIqw==
X-Received: by 2002:a5d:5960:0:b0:2f9:9f6f:e4d with SMTP id
 e32-20020a5d5960000000b002f99f6f0e4dmr12495248wri.39.1682508259732; 
 Wed, 26 Apr 2023 04:24:19 -0700 (PDT)
Received: from [172.23.2.237] ([195.167.132.10])
 by smtp.gmail.com with ESMTPSA id
 l11-20020a5d674b000000b0030276f42f08sm14303292wrw.88.2023.04.26.04.24.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Apr 2023 04:24:19 -0700 (PDT)
Message-ID: <42418bb2-b231-43a4-dabe-b893423cc970@linaro.org>
Date: Wed, 26 Apr 2023 12:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 18/57] tcg/loongarch64: Rationalize args to
 tcg_out_qemu_{ld, st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org, git@xen0n.name, jiaxun.yang@flygoat.com
References: <20230424054105.1579315-1-richard.henderson@linaro.org>
 <20230424054105.1579315-19-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230424054105.1579315-19-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 24/4/23 07:40, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.  Shift some
> code around slightly to share more between softmmu and user-only.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/loongarch64/tcg-target.c.inc | 100 +++++++++++++------------------
>   1 file changed, 42 insertions(+), 58 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


