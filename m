Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B01381A17
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 19:13:15 +0200 (CEST)
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhxqk-000833-7W
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 13:13:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxnc-0006sK-88
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:10:00 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:36630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhxna-00060Q-8r
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:10:00 -0400
Received: by mail-qt1-x836.google.com with SMTP id t7so1945288qtn.3
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x/F39kL6pOyM5m1mav9GUvGOkjanhCOsP6pJ1DEu9TQ=;
 b=y0GrltS8m+V6dPlczXdnzvaILALK6/po9hpu+NF773R9fhMsqxJTR6mmiJ9qI5A0wE
 WoARlKuLf++EwuZrHxs368lgAoW9szL+Iu2f7bsermA6t4vtOF4H7Pr26IGtfZbpzJqy
 bamWZgFiS7/5PDqiRCWmnV3BaIcOqC82feRh9H+RwrJ7znCEsUd41xQS6VE/sR/y1HP0
 Cq/U/T9I2xKcCCviDbc0+YsUqZ8mODG0GX1ZvvgV0yC3P3Gr1ZGGD1uo4qVyrUqdnNdF
 L5djib4SxG8G51GRrqBM4yemzUhkkrrtwr4vgKVOKNKfmxjZUrY2L53aHyCf+IVo97UI
 NJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x/F39kL6pOyM5m1mav9GUvGOkjanhCOsP6pJ1DEu9TQ=;
 b=d0hd5Jtcpwcs4pbiX/Z+iCLHK/uZzyf82PcxayCcDAF7hB4beneFZvhYKo/X57gkhj
 9ytkbFj07vJT8+0ozKS3X0EXZPDpBRT/IyiZO8qLLedkRJdvug4AfkSxxO07pI+luODZ
 ujdVg7iDybm+OApqOWy8Rxe7cyssXI0uQi3o7xY7nUAW6IWLSqgbv/gexxHFbcqxafmS
 6H9THUdD4I/qm9z2ylYAtX1Ozk9nbXVJ5D8x0eZJAeK/vwhZbBIVRxqdcCUY7u5qOhbS
 9q086Uv3amODB8u9vPiYbsJeS7RDWNjFTrRSX2Ccj5byPaFMyaKSOEns405NjuwU05pj
 ok4w==
X-Gm-Message-State: AOAM533CcBt5MsimGKrSjysn7bnx5fd6YUnArfVwGUWodOLObANUgIKz
 mzsApVNZbtV5Ta//ZhF1Gfo+0w==
X-Google-Smtp-Source: ABdhPJwqJB/+C/Y/gi/Qi58MOLrSfgp6hmQKTe+jGUGzJgNN3Ii49C/LYE/kkaoQ+wbdPTG60aU/wg==
X-Received: by 2002:ac8:1192:: with SMTP id d18mr47990874qtj.253.1621098597154; 
 Sat, 15 May 2021 10:09:57 -0700 (PDT)
Received: from [192.168.183.51] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id e30sm7107966qkn.39.2021.05.15.10.09.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 May 2021 10:09:56 -0700 (PDT)
Subject: Re: [PATCH v6 73/82] target/arm: Implement SVE2 fp multiply-add long
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-74-richard.henderson@linaro.org>
 <CAFEAcA9Oc+SiCcECG8pLaHSib87B7+ScSw-yk90pL0193jBCDQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0015562a-4877-8ca4-2a6b-9e597727bd78@linaro.org>
Date: Sat, 15 May 2021 12:09:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Oc+SiCcECG8pLaHSib87B7+ScSw-yk90pL0193jBCDQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/13/21 12:04 PM, Peter Maydell wrote:
> We now have a full set of these macros in vec_helper.c and sve_helper.c,
> and I'm going to need them in the MVE mve_helper.c too. This seems like
> a good point to pull them out into a suitable header file and add a
> documentation comment that makes it clear what they're for (cf comment
> on previous patch).

Done. Moved to vec_internal.h.


r~

