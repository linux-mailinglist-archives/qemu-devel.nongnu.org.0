Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0423A06BB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 00:24:40 +0200 (CEST)
Received: from localhost ([::1]:43442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqk9I-0008H7-2S
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 18:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqk8G-0007OW-2x
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:23:36 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:37384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqk8D-0000CB-LW
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 18:23:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id t9so17728684pgn.4
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 15:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=0CxNvhaSjHkMlrZQCqF9ME3PJvka4xXExulfNpCmYtE=;
 b=XTR67y51xQUOXgZ8RTnC44UNaL2aIQhhVG7mJLDCcnwNvfpOWO2dtV+Vm0wnQYPMO9
 7AZU2mKepf7CtoPGKpl0vtGy/UFpoPd1Lcawpmon5CXVL9JM3YjD+jXl3o3qMzkJmBhW
 QrTNpXdzuU2VWgjZ6sGjBhHET4itkZpfNz04TBHIwhwopdRYEdXZg99woVzGGHVMmJCA
 aNfiIqyRcoFgeymNgAj0wyjylKpC5zg+perkV57Xj6MU7rBVeCgfKq+pCCkzVYpmNhBV
 UO03vAKYBovik3MQWoHkhJFCh9XqBxPhKpiHJOF8QaGddIOXObuWmXQh4E+b7XmUBLD6
 kXWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0CxNvhaSjHkMlrZQCqF9ME3PJvka4xXExulfNpCmYtE=;
 b=hLja2J7mIHe4s+9bTugXiArRYLC0sWreH2SdCCdyRFS+ooxeFxYwpz+yQiIqsX1xPL
 mQKyHB7QW9ROTxA1u/JViua9tFrpr8/EqMEe4SZSatY1d4lfWaTTqljAbZ3EXA3xBQt+
 ExGOWg0VvXgkd2Ej12VNj7xqaZOi1NI0lca6G2MRiko219B1jZ5cPO79bCpHaj2I/fif
 8HWF/Yp4dPCdNAxczlQGfA3KQ6Uag2AUAARTDm6fmxWik5HpXGo/vZiDbGAfGg7rem9q
 TcgCIo16HKp5xGCuR91mTMiAw7LJlxRp7IIQqoERrxs92CxRfsHOhvPf9w8y7RCTiCS9
 YiOg==
X-Gm-Message-State: AOAM533NFzQ4bWgoCg0lGGTsHp87Z8L8KO+2cqE7xd3RjrB4OPcl2t3T
 wLMCqjtOp98s6FSCVovjKJgXI3DxfLHLXg==
X-Google-Smtp-Source: ABdhPJwxHW8HsyFssWhR5cMIjeaX3TnEnuVU9dMYEecd8wypJBUYkax1UpYOzr7sgF7LEXK2VjegqA==
X-Received: by 2002:a62:6491:0:b029:28e:8c90:6b16 with SMTP id
 y139-20020a6264910000b029028e8c906b16mr1975424pfb.24.1623191011725; 
 Tue, 08 Jun 2021 15:23:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 i2sm3091290pjj.25.2021.06.08.15.23.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 15:23:31 -0700 (PDT)
Subject: Re: [PATCH 16/55] target/arm: Implement MVE VREV16, VREV32, VREV64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bb8e0ca-b9e7-7342-8b79-604737daf05b@linaro.org>
Date: Tue, 8 Jun 2021 15:23:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static uint64_t mask_to_bytemask8(uint16_t mask)
> +{
> +    return mask_to_bytemask4(mask) |
> +        ((uint64_t)mask_to_bytemask4(mask >> 4) << 32);
> +}

Again, suggest to share the array from expand_pred_b.

> +DO_1OP(vrev16b, 2, uint16_t, H2, bswap16)
> +DO_1OP(vrev32b, 4, uint32_t, H4, bswap32)
> +DO_1OP(vrev32h, 4, uint32_t, H4, hswap32)
> +DO_1OP(vrev64b, 8, uint64_t, , bswap64)
> +DO_1OP(vrev64h, 8, uint64_t, , hswap64)
> +DO_1OP(vrev64w, 8, uint64_t, , wswap64)

I've started to wonder if we shouldn't add a no-op H8, just so we don't have 
the empty argument for checkpatch to complain about.

And in this particular case I suppose we could H##ESIZE, which would then 
negate my earlier suggestion for using sizeof.

> +    MVEGenOneOpFn *fns[] = {

static const, etc.


r~

