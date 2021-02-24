Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FAA32448D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:22:07 +0100 (CET)
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzja-0002M4-Iv
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzUH-00072P-9t
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:06:17 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzUF-0006LM-Lx
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:06:16 -0500
Received: by mail-pj1-x102b.google.com with SMTP id u12so1738724pjr.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=229nyDUBO4Gwhktm3OIArNTtnk1En2Sj+mZRHRyHFiM=;
 b=tjAflxx3rRuegc1VeGexRKvCwOaCouS29PvW8HCXcKIMjTyjc6f6LGPDph1PDJok+C
 9Y787ZHmg2I5yw8v7vA+7zH/CF0bweVI3kjPaxfBBZkRAIwu4SKolM/5YglC6pzPRgZW
 xAEaK2sussRiHfz/t683zP9Jf7s3lJi+AiakIvn2iMlceGmlwS+m7N1c6gyv7Q4qzmwI
 DfHWzdXcDTgasT8lzJ09YoC51iZ3rLSzPrDZuTOD1Pnjdu3h2hhlgqz4VQjAnFiYnx1h
 3vpLdhQHwiPs8LP2xpj1R0UyqCKufwY3DUFzp/BPDm78FyIaAFr/kRdb1F/lXvv72dK8
 HQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=229nyDUBO4Gwhktm3OIArNTtnk1En2Sj+mZRHRyHFiM=;
 b=SR0GRLLGQLgrC/K17E1LqcOgrY3hQi/t5oNynAOSn+qDgFwD8Dr+MujcrHkrfdL8fa
 /dFfVqVb+ZVKaNxzlrZDJFKZh9KtZJfLPpoLEnXkNQq/+V2mD86ZFH6ZbQ7iZ+eJ0VfB
 tTpRei7LDPFad2VpDWrM8GbnlFo6fj3bxMgAO5qjdi/8am922jjW1Mxk2J6M308OenqO
 HvsWx1bxsFK0RkOOCnnaYwLLfcdOxtS/y2KxqHHtZkvjaDs+ViF/QIonRXdj3GYxEKL+
 o/N/BgHFoHdlCELT4vPeGDOa79o5xHFkZ9vCFcMea0ToXL5g++p5dpxQ3mU4h8UK04CT
 g4ng==
X-Gm-Message-State: AOAM530KcW4EFpe5knNMs1zNx2HuovB+XoYKffmPYMAAy7MlMWaX1kFp
 MCwFzMeOkET0gtHUkO5uAlG82w==
X-Google-Smtp-Source: ABdhPJyxchwK8+ptgHmx5+5cj9u9BrM1Iu3m3FrGKPxLkQthy8hHgKpK0sU81tMBBW/V5u397rmU6w==
X-Received: by 2002:a17:90a:5206:: with SMTP id
 v6mr6040391pjh.22.1614193574351; 
 Wed, 24 Feb 2021 11:06:14 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id a24sm3532594pff.18.2021.02.24.11.06.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:06:13 -0800 (PST)
Subject: Re: [PATCH v4 08/12] target/mips: Move MUL opcode check from
 decode_mxu() to decode_legacy()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210224185706.3293058-1-f4bug@amsat.org>
 <20210224185706.3293058-9-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f56d2b17-80ad-758a-05c6-2ff68f564004@linaro.org>
Date: Wed, 24 Feb 2021 11:06:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224185706.3293058-9-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Craig Janeczek <jancraig@amazon.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 10:57 AM, Philippe Mathieu-Daudé wrote:
> Move the check for MUL opcode from decode_opc_mxu() callee
> to decode_opc_legacy() caller, so we can simplify the ifdef'ry
> and elide the call in few commits.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 19 +++++--------------
>  1 file changed, 5 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


