Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 317C3701674
	for <lists+qemu-devel@lfdr.de>; Sat, 13 May 2023 13:35:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxnWW-0002SM-Na; Sat, 13 May 2023 07:34:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnWV-0002SB-7z
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:34:51 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnWT-0006Me-Qf
 for qemu-devel@nongnu.org; Sat, 13 May 2023 07:34:50 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso19689255a12.0
 for <qemu-devel@nongnu.org>; Sat, 13 May 2023 04:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977688; x=1686569688;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=j5BGWueZLO9Kvni/8fQjY5/42t6Qvtg/+tiP/QNAO74=;
 b=yatH4YprBaD0V7JlB2C+hQVdQtvTH3xyAgxq07Id0EKtqeh/KLfHpa9IFP+wTKTVCV
 QwX1BTGzK6x2MwTqRkS6PqFkepSmR/5Xpf8dKSKt02LG/CGfyXrvJ4QtSDz6b7GETT1b
 5LWCFiu9ZOhSp+TYZd1pAV76IBvu+OR+HXKlvM45YfGwRqrSrKgbYwfSnL3y+IgHkvrh
 ppi26Q7EvKaxhNUPmKKuLGs39vlW+CWltZzDCtWdCBzlJUqh3Z+943DeLxI2uVpVstMB
 9RFjvh+/iXYLp+R9GWl9EpplrtOJcdSX7PLdgqZERC0B4It5yXpLmn2y2rRydoGJ5IP+
 Xpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977688; x=1686569688;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j5BGWueZLO9Kvni/8fQjY5/42t6Qvtg/+tiP/QNAO74=;
 b=V4AKhdvy8jMqLlAgwBuiIWVMzlUFBhRErY/BfdPSUCaIhfwm20lsR3tA9Z45VNH+Wn
 +4/GjpTc01p5ox1v073ke0I3Se/uLfAjy6rA1FRHcytA3SDtG+PXjkJnK//fK6IaQQuD
 +O7Eik+JY2/d7c1kG7AoeA6Fnll+JhSQ0qOAze1fOTTtYYxqSgesO0EMKvtd11yQWE+h
 SU4Qd85q6ptbycjOkVb3Kas8TBhF98a9Ncy3WDbCrotajOwPbTcZvjGZFsQJw/H+KXXt
 8fL2GcJgh41RKZP3CE0IshoDmgSIORVUw17w+uxh9Vwn6NzdRhJAzwGg3zGV214DiiRw
 4acQ==
X-Gm-Message-State: AC+VfDyKxdOIVNT71J+eibBJ+4INBA5qzjZ+b440FkOe1MUMW2RyXSHE
 LR3xnsUDcHTF0xt94g7EtmjJ+Q==
X-Google-Smtp-Source: ACHHUZ6uTJdugeyUMcrrFdY0eYB7Rmrw3QE/y2hhyUN0y79GS7IdooqMn4tg+9iPYeTM7hQX8wBSTw==
X-Received: by 2002:a50:fb8a:0:b0:509:d7d0:d71a with SMTP id
 e10-20020a50fb8a000000b00509d7d0d71amr20404336edq.26.1683977688118; 
 Sat, 13 May 2023 04:34:48 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 t21-20020aa7d715000000b0050bc041d2a8sm4708255edq.15.2023.05.13.04.34.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:34:47 -0700 (PDT)
Message-ID: <9b6c5e36-e45a-a23c-190f-4d84d781cd9a@linaro.org>
Date: Sat, 13 May 2023 12:34:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 19/20] target/arm: Convert BRAA, BRAB, BLRAA, BLRAB to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-20-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-20-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the last four BR-with-pointer-auth insns to decodetree.
> The remaining cases in the outer switch in disas_uncond_b_reg()
> all return early rather than leaving the case statement, so we
> can delete the now-unused code at the end of that function.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  4 ++
>   target/arm/tcg/translate-a64.c | 97 ++++++++++++++--------------------
>   2 files changed, 43 insertions(+), 58 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

