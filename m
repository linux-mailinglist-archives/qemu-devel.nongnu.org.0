Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2606EB46F
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 00:09:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppywC-00032P-AE; Fri, 21 Apr 2023 18:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyvz-0002yJ-4l
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:08:51 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyvx-0000zI-Jt
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 18:08:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1527so23430875e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 15:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682114929; x=1684706929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4zUZxzjqc5IRByWdMEkGgctnsGEtKmS+8pcX2R+SiMk=;
 b=LDrqGtmHOS3iX9eO+CjWIWbb/VwqMD7D0AAA3H6TfBELma/wgo0aailY5tT27N2RHA
 031RS5e78uvnICZw6wWMmc+TQmeEAeSfF/ZXPWrztzE9ROHijbVOPZ0RTQ9BngyDW0Rf
 ok94hlTCVMycRdAo8dQVegZsthDNj8mt9R6acfOuFXefeSnOWczHXOBZbLcSbr3zYATf
 r3gG0EuH7VcP4c87Ge7w6itE3DMohQ+lFj2W+u6zn5EXAzRTkLroMwzz4HlvPxcCDfK+
 Wm0yVGwX9JzFyT5XMrZv6Zj+h6MjbciAi9fDByowODRHu5zSDDUiZXWQImaEvjKZCk9B
 B8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682114929; x=1684706929;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4zUZxzjqc5IRByWdMEkGgctnsGEtKmS+8pcX2R+SiMk=;
 b=DBh8HKmByCbI735UBuCFsAFIuzAoScCkceTjIfZiSV4qgp1P3i0SHLzaDScqD1qrTU
 WdIhY5Cr05uey6zwGLldjiXOF1GZfxQ+WZw+Q1uTqH2QwdVxG5xfVmzKyypKB9lou/qs
 26OgwWQm1GRmYdortoIZrDO74U0ryZaJDLN19fX769Kxc8slJ8e/+6z9afPXLAgvK0Wa
 lCmL9emuYWyK63KlHTCZpwFT3RoWdtjJQsEOKL5QIznXggdrCVMdSuRDQx2e4z3h6cu5
 Ahj4BORtX5Ev4RsiKm6LZ8X1A1G+u27FZ4HPs5xfAOPyuVq2RLVCyv39U9CZNrXbhUm7
 50Lw==
X-Gm-Message-State: AAQBX9cu5tdUfrXVYiN7MQTRrS3/iQKK/RrLv3+dZbxnCueIkoNKkQJF
 73jc5Fy0Dwr0QXBsTM72vWzWlMKxTndVmCt9FHk=
X-Google-Smtp-Source: AKy350bytPg5hXJoJ+FDZ0qFUvNcSsHxQ+FLd6105ErMlvy8I/N6iUb6Tcg3wy2I1IW4VQtGnKKNMA==
X-Received: by 2002:a7b:cb96:0:b0:3f0:7e15:f8fc with SMTP id
 m22-20020a7bcb96000000b003f07e15f8fcmr2918575wmi.14.1682114928744; 
 Fri, 21 Apr 2023 15:08:48 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003f199662956sm153401wmc.47.2023.04.21.15.08.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:08:48 -0700 (PDT)
Message-ID: <0f5e7a96-00a3-187e-06ed-6b5bacd446cc@linaro.org>
Date: Sat, 22 Apr 2023 00:08:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 03/54] tcg: Split out tcg_out_ext8s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-4-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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

On 11/4/23 03:04, Richard Henderson wrote:
> We will need a backend interface for performing 8-bit sign-extend.
> Use it in tcg_reg_alloc_op in the meantime.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                        | 21 ++++++++++++++++-----
>   tcg/aarch64/tcg-target.c.inc     | 11 +++++++----
>   tcg/arm/tcg-target.c.inc         | 10 ++++------
>   tcg/i386/tcg-target.c.inc        | 10 +++++-----
>   tcg/loongarch64/tcg-target.c.inc | 11 ++++-------
>   tcg/mips/tcg-target.c.inc        | 12 ++++++++----
>   tcg/ppc/tcg-target.c.inc         | 10 ++++------
>   tcg/riscv/tcg-target.c.inc       |  9 +++------
>   tcg/s390x/tcg-target.c.inc       | 10 +++-------
>   tcg/sparc64/tcg-target.c.inc     |  7 +++++++
>   tcg/tci/tcg-target.c.inc         | 21 ++++++++++++++++++++-
>   11 files changed, 81 insertions(+), 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


