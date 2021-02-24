Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEA324495
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:22:59 +0100 (CET)
Received: from localhost ([::1]:49302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzkQ-000336-6R
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:22:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzUw-0007p0-W1
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:06:59 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lEzUu-0006f0-03
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:06:58 -0500
Received: by mail-pj1-x1036.google.com with SMTP id u12so1739868pjr.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ryuNzK5eovXBkkTA1Usgany2fOY9Ylu08Bre9x3c+r0=;
 b=c8iHDpASxmQU7K9cnfHYj4DAKn63Zc+39LSMSAMFSNlQ4bU0u++GVIPs1td7y0VxZw
 suzbu99eOiw3UhxvavkDowUfMhthP18Q1waDDUXDOnTZ7D/I3CDmg6uKHu/cYY4VeuOd
 Lqwx+QLdBlY+GX0m7BbejFWb7hfLoP8UHw+CpYCjmq+ar8W7kQ5UkcIH/pPRuoL2YZEf
 +O+txRU5RBIrz6HT2BeAwtG1yaILdEvz5p6QGAx2WHFAtDP2UguQTcWwlH02Z9iya+zj
 3SDmk+VrWoYcrEaj63iBxOVs/a3919Qoqo82pjgkqGAEih4hPPW3nQbn5O3fcRyqmBG2
 KnVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ryuNzK5eovXBkkTA1Usgany2fOY9Ylu08Bre9x3c+r0=;
 b=esYt0aLIO8a4eE4N5wW/mMT1iBDRtMyJbi5EHMvIagNXVHHNC94BYkQzmsmQiJWx4I
 U8yzUc+KsIxwac7twhFeAMWsvDMMzOhhsv5UXicX6T8V2RBuRPaGc4DEIzzo3NQFXIOs
 IwaHsq6koEuv2Jf3RutimBr+xfGs3R7A14Nn77uiIjn+MtHS7OFovCWcE4X7/bqoto9t
 DGxeibwJkHgAvANNhv+7TEBhPMQUXQZFKyQpSlsCul2jiaM8SI9k4MpBeOKIZ8k2xGUB
 kfRkn4WFA0h0Jzss1eRIT2XuqJhtndLpIuwlRRx7FDvobh5ZVFOFLCYvq1ci5FpjdnRS
 YwGQ==
X-Gm-Message-State: AOAM530E42OGP+rKdv+iwSBwB3mGkyLIURSArUtYgkjm5uDdQ7iEoe2/
 HExgJtztPFtVY6S+6dkGuJjN1TXMHfzzeg==
X-Google-Smtp-Source: ABdhPJyUeLvQrZF293Wj1SB3DNmx7/bCSBK/uoCqmIHU3S8VHLGS780uIsMQNGqjocjWI16SNdGHXQ==
X-Received: by 2002:a17:90b:785:: with SMTP id
 l5mr5237257pjz.128.1614193613782; 
 Wed, 24 Feb 2021 11:06:53 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id 3sm3754894pjk.26.2021.02.24.11.06.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Feb 2021 11:06:53 -0800 (PST)
Subject: Re: [PATCH v4 09/12] target/mips: Convert decode_opc_mxu() to
 decodetree prototype
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210224185706.3293058-1-f4bug@amsat.org>
 <20210224185706.3293058-10-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f78ee50d-1837-6b92-3aa8-9eab534076a8@linaro.org>
Date: Wed, 24 Feb 2021 11:06:51 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210224185706.3293058-10-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
> To easily convert MXU code to decodetree, making it return a boolean.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)

You'll want to mention the function rename, which is new in this revision iirc.


r~

