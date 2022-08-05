Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4735558AD0E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:29:36 +0200 (CEST)
Received: from localhost ([::1]:43492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzGZ-0007Hu-5F
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz9o-0003DN-P8
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:22:37 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oJz9n-0007w1-CD
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 11:22:36 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 15-20020a17090a098f00b001f305b453feso8606616pjo.1
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=PnitCgwbs7iv0tiqvmm15hxb+rQGzENOE2qtWrqs3zI=;
 b=QDtRt3vR0SguQrfsWn7bmBJvFAwfLW2kIsjKZbQTbHbv94nfka6TK4autXPydSbSvW
 6lnHgwHCBTOcZJ5COglEjGnOeYChJeOVn1/jLCNufWvwlAu1/8U+P/GCE8npmcTbywj3
 07cwx+hfR0tgBoqbkI3R3VvTEtswGvwISRwLThQ9Pqs/3rmuhiU5n+vrRnM079bnUaNA
 aizHi0kqbic7nBxnPZUz2E4/+BONWR23fFK2SftGQtd+cbhRll7u0Wk7EVXDFlREQ4OG
 OctN5VcfNxwG9UWpZjQHdZVPgz2qw+f8rKxjBrEj5dM0DRdImkCYATmAavda0I2TW+Ao
 lbQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PnitCgwbs7iv0tiqvmm15hxb+rQGzENOE2qtWrqs3zI=;
 b=lAlMAbb9uxh7S8OG14oSNAfP70+ZsYfv2dF+yGUTRgTRzuMUINVdl2IQMrECPsNNTc
 y+zsyWQEj2A0Bte6bwOWzk5Pnm73iA9CGEUz49XM0YZTKm7LILs5NxMm7mQYY6i+PV57
 pHBBJ6/v5LGzMfpbI0ebiNUQoenc0x/ybkbQ391uF80E9BYknFf2habttfkERc7rq6/J
 VddBur8pMphRUlh9pKAoh5dwkAGVFK/Qgy9R2nBzKbIjkdYYRF/o5+PlvR8cr3FlVp3N
 UCOHJgMfd0T3+fJSsPJvyslOjEH0cqRT+BwEo0gxhNtcgPa30mNYdvsO2V2/pmMsyzhy
 wf3g==
X-Gm-Message-State: ACgBeo2itsSCehcWupaXV0I5+Jc7fFZ1vh2VEMkWIzazaQxbpUSbJx6W
 hFP8GNGEXStE1orSNWeHsrmGXw==
X-Google-Smtp-Source: AA6agR5xPbjOyrtrd7y8eOM7eCOwjJ3rCpKAmk66aTHVZ/SEcTRNgd1DV6qlQXSBbu60U/ewMiTMhA==
X-Received: by 2002:a17:902:b612:b0:16c:7e2d:ff39 with SMTP id
 b18-20020a170902b61200b0016c7e2dff39mr7103323pls.111.1659712954011; 
 Fri, 05 Aug 2022 08:22:34 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:abf8:e436:f4c:9089?
 ([2602:ae:154e:e201:abf8:e436:f4c:9089])
 by smtp.gmail.com with ESMTPSA id
 r29-20020aa7963d000000b0050dc76281e0sm3106411pfg.186.2022.08.05.08.22.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 08:22:33 -0700 (PDT)
Message-ID: <a81a84b3-0f3e-f550-51cf-79e7498c215d@linaro.org>
Date: Fri, 5 Aug 2022 08:22:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] hw/loongarch: remove acpi-build.c unused variable
 'aml_len'
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, yangxiaojuan@loongson.cn
References: <20220721040046.3985609-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220721040046.3985609-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/22 21:00, Song Gao wrote:
> Fix a compiler warning on openbsd:
> ../src/hw/loongarch/acpi-build.c:416:12: warning: variable 'aml_len'
> set but not used [-Wunused-but-set-variable]
>      size_t aml_len = 0;
>             ^
> 
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   hw/loongarch/acpi-build.c | 8 --------
>   1 file changed, 8 deletions(-)

Thanks, queued.


r~

