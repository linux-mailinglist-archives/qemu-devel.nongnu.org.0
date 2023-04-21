Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A916EB3DC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 23:47:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppyZk-0000YX-Ln; Fri, 21 Apr 2023 17:45:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyZi-0000XM-P4
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:45:50 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyZg-0004LA-1L
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 17:45:50 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f1958d3a85so8073685e9.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682113546; x=1684705546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RrLWy4735jhG6/XvphhkUdvpeMfBIv1YjmYFdIeImDM=;
 b=zW2u3ovCBn9+jKQXv3LnlwpZsXxc7ffzKqGypr1ffvkeIVzvzV3C0sDEpE2Lc9l1ez
 GH4J7/TxqpEz50hYtmli7BObRPVuI2x+2njOyIiwDVYq5Fw+Q7HOmzmuLH/iD7jAnG+9
 bwst6RlJsYgflgmMPMVOaXZfF+pgQYx59IZdvbHe7iqh5U3+TTHfZ0Xbg0+pVQ7Ik3ZQ
 bs+dEjPgT38o0Sfu0iDx4GtOo5Sb7TOwrxPnyb348kswBl+Apdg2ND1KM157gnFRm3/6
 UT4D029MegxS/+zwOG9gjqEmmXhHxS+sWABGeov/PW5EdWI2m+nLXZvhM3c13GyNzhxN
 i26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682113546; x=1684705546;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RrLWy4735jhG6/XvphhkUdvpeMfBIv1YjmYFdIeImDM=;
 b=CtytOD1cHoksdLi3jgmNufJFAc3W8fAvdSSC9vgk2yv749Rl7xzG7AmEJ3rgJ71rWe
 GC9IkVtDYgcQw7jUCxcA67QxRNTd9PpBimmjvVSbNGdW/9uU9dvJF4T/7tCuvBn1Io5E
 1RlT9XFCRz3KujHX4pSVVUXvRuPqBp1QtW+uJal4PYJbt9shFdTDcnkkPGN9d8ZxQWe+
 aEEQQYN/hzSQ7RVB7PCssmdXE8XM89VH1Z2JixE7Mlk5lMKbuCTlZODOE0k1dIBVS3mR
 q1ZTFMAopNacuhh3v8JWnRMr0i5/yRfr4V0UqCuwkXwlPhJEVk4urXqQC81uxZ1kYH14
 1VYQ==
X-Gm-Message-State: AAQBX9fRUm29IqTlXPc4Py3beJi31dqS+DTpipV5SUizaMpRtRr3Vj0k
 BWKyeHHIl1pVlgAV444OI7TgUA==
X-Google-Smtp-Source: AKy350ZdrE0MTEt0jp+FPo3gTATvqa01c/MYJS1PyTQOtuqFbJ7W7HmfxIRtdRSbo5V+rsLLKZSARA==
X-Received: by 2002:a05:600c:213:b0:3f1:73ca:7807 with SMTP id
 19-20020a05600c021300b003f173ca7807mr2762252wmi.37.1682113546141; 
 Fri, 21 Apr 2023 14:45:46 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 g9-20020a05600c000900b003f0aa490336sm9135051wmc.26.2023.04.21.14.45.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 14:45:45 -0700 (PDT)
Message-ID: <9e0eede0-4168-f13d-8234-1612f2654cb5@linaro.org>
Date: Fri, 21 Apr 2023 23:45:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 03/42] tcg: Split out tcg_out_ext8s
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-5-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-5-richard.henderson@linaro.org>
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

On 8/4/23 04:42, Richard Henderson wrote:
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


