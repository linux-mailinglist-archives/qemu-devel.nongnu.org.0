Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D917D6AC2C4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:15:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBbu-0003EF-B9; Mon, 06 Mar 2023 09:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBbg-00039u-4q
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:14:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZBbd-0000c7-T9
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 09:14:27 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso8289565wmq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 06:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678112064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7b/5Nnn4470AE9lGpvZFOcmVz7QwGaCPX8iwkVjkmAY=;
 b=VKoSWinPM2t6rF59tTGlyotv1sTZoB5pL/F9i4PJCIfhxzgiou3RKIykHqXTallWTj
 fBDJno/uFDmRhPx/fuHRTKyp2mS/rJXnSzp8zTNEuGDzEgH7K0gwFk6bUDHn0RUUvHLP
 K61U4eMBqoxAXhICiIn3iO+t8Xka5Y/h0DW0U+nPOPr7fWEHSIeA5dxamolq8tgoOrmQ
 gNc3XK88fx6L0XRsaDzCwA0ixgqDzc2ULh98ZYFQkPbcRrNIezOW/RE3AdymE+sZ5MAG
 XJwxu2vySUC6Uz9SNYACRR1jN/luUjQlf3h++WQlwPh05tHYq+tOGhGg9JtbcmI26HHz
 4AjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678112064;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7b/5Nnn4470AE9lGpvZFOcmVz7QwGaCPX8iwkVjkmAY=;
 b=DAKBAl5wkfze3VLA73+E7U9dvKi8rS9ALf/XbtAw4x/lKe1G42lJ1Y4oC8TGNTGdbl
 kuti8Fm05ZxKuRD7Tx8BVxzfDLBN5Zc/tE8zK7tTAS5d+xRfLfCaMFqNKho1WBiqzPOK
 08oEaTbmlQicNgtIHV9RhtZQnXRuzQujwPQ5NEvRcJaFc5WcTzWJfJCzkByVGw58/juh
 1gj+PVM2Va9H1SSJCjhHzO4KpNzA4w7Ogh+L3LHYLPFRm2xMua4MRIwcx6tW0cmRWo3+
 o6IgsBHxUCOEi1Iqhb98b1p5FeoNoh7I2XsUtLRXn+k0EPO3jTi2SWX8QK+1VrhTpvZw
 RORQ==
X-Gm-Message-State: AO0yUKWOhCSYUX4C+c5KBc7ktxnuCCbidADAfprE2SZNlkpUwtqDgizt
 LCwpsmcoFLMR3Btnlxq4Gh/F2g==
X-Google-Smtp-Source: AK7set+Xhew/dIrscr5an0m6xOYjWf32Mlt31aX/ke5wsNBW6htZ1VBFyrZt04sxh8moS8N8BowhMQ==
X-Received: by 2002:a05:600c:4f87:b0:3ea:d610:f059 with SMTP id
 n7-20020a05600c4f8700b003ead610f059mr10396660wmq.4.1678112064170; 
 Mon, 06 Mar 2023 06:14:24 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 c40-20020a05600c4a2800b003eb20d4d4a8sm10175450wmp.44.2023.03.06.06.14.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 06:14:23 -0800 (PST)
Message-ID: <77f3be43-1281-0f40-1f31-d6d053c09afb@linaro.org>
Date: Mon, 6 Mar 2023 15:14:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 25/70] target/m68k: Use tcg_constant_i32 in gen_ea_mode
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-26-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/2/23 06:41, Richard Henderson wrote:
> Return a constant for an immediate input.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/m68k/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



