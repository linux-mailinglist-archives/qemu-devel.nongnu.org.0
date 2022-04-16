Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5CE503205
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Apr 2022 02:18:37 +0200 (CEST)
Received: from localhost ([::1]:54386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfW96-00037k-LK
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 20:18:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfW8I-0002Rz-9O
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 20:17:46 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nfW8G-0008Bc-PQ
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 20:17:46 -0400
Received: by mail-pg1-x534.google.com with SMTP id u2so9038300pgq.10
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 17:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KYaaSWQRjZqZXT8VyJaQ/efrlSaIDbvAQpwmHlhjE/4=;
 b=ka7JJ44iEF0gEfxWc5rElLvadx0v9uGNQr9ZUfcUtwhrI42RdmleBoVdQ7R3Cka94p
 vpEMTyrly+41p+EOhR2RPH83e7iRd6EQE7EYd70tXMJW8QFsPzgKpfDGME0eD1gmw32I
 83HCOD6BFrJSo88x+dTE8vRlEyLJg78i2kFHwcc1nL1Q7GolFDDfRKyrLC9De2e765m0
 I7szCxUmj8cD1DafUAyDsLOdeRZd+SZrZonT76eMtNmOuYUW9CxOaOlNIXGsVjuYzI5G
 EhhbVed8VM3RUglR+tyCMpTHXQmGIvxThFY7DmtE6nZId/XKLB7Sm4fgK/hLp2PGgCnH
 tKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KYaaSWQRjZqZXT8VyJaQ/efrlSaIDbvAQpwmHlhjE/4=;
 b=nhtGMwtzW/DAWg5w8Y/u3K2E9OQ8BeJzGEGCf/gvhwEBMQmjRlmTgpSVaa1WzG+EFl
 jHV/wcGGZ69fT3bv022EyVMBeXXFZ8cnkVsBzd/WXgcFEDos85UR/TvndvK5Sojn9IQW
 JCV9rRjZvXMBANLFmTMuUuyqqd6dQ1Ust4TsQYUAHbTa0zM2UmkrgMCnNhrSSlOeFDNo
 Aq5eJ4DYKUFDvN25vJepB60JDdg32a/2tpRhoQZGZKIfBFnKgHzqfJ5HzUSDApaTWYPl
 jhOCjg5Jw+YU8ho79+iEnqhzwQ17zzjNV8vzonbBebFX9G36DAQMwaUKnojh3fZ3aG+E
 uj2w==
X-Gm-Message-State: AOAM530P5tvQg6m1oMC72DMeGcbBM30paDXiHdjdl8R5fS/f3yDh5E4H
 JKMurA4Jg0ocFzUu6psJ4jVLEQ==
X-Google-Smtp-Source: ABdhPJzfEXlhiD39oSVE00A0/Xr02QZiTcYsZ4XeguF9scZhbVnIyFPkxN5dv29g5xZDiKv5ef8hYg==
X-Received: by 2002:a65:6146:0:b0:384:6471:db2a with SMTP id
 o6-20020a656146000000b003846471db2amr1144294pgv.4.1650068263280; 
 Fri, 15 Apr 2022 17:17:43 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm4000926pfj.43.2022.04.15.17.17.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 17:17:42 -0700 (PDT)
Message-ID: <ca2922f6-afd4-4725-3a12-213f763dc94a@linaro.org>
Date: Fri, 15 Apr 2022 17:17:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 24/43] target/loongarch: Add constant timer support
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-25-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-25-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   target/loongarch/constant_timer.c | 65 +++++++++++++++++++++++++++++++
>   target/loongarch/cpu.c            |  2 +
>   target/loongarch/cpu.h            |  4 ++
>   target/loongarch/internals.h      |  6 +++
>   target/loongarch/meson.build      |  1 +
>   5 files changed, 78 insertions(+)
>   create mode 100644 target/loongarch/constant_timer.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

