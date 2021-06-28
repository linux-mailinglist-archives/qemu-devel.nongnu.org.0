Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856C3B6719
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 18:55:33 +0200 (CEST)
Received: from localhost ([::1]:38368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxuXk-0006Gx-KV
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 12:55:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuWl-0005Of-Fn
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:54:31 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:54016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuWi-0005Up-UN
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:54:31 -0400
Received: by mail-pj1-x1029.google.com with SMTP id bb20so10539244pjb.3
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PmscNVFaRvsQGd7iPIC+tEfvjAlvthGNjNXCdf5iAqI=;
 b=vHSD0f4urOiuaz6kps6JOx6aVydiBZS25Dz9DmWh1KFvO3khMYAI/fMKHH69YR1BLN
 oKghUazGRAmSrNOWXnGgm7BzDdBqmjkpj1oyZc4GU9OVxbuye+xwWuyzSX7qp23ybKNu
 8tZWFkgmt+6NVoLN51YM7TGXykzjnoJR1dqohdzCvhKTclOaHcxIxC/Gbo3Hev0uBMYk
 /uVSG34X28dWV1gsd7pEdRmR6J9wK4jfLTR/Azp1Gav6bI+FXIAJH/LWtBRmW2mV/t7T
 GeR75UBPiV/sQnuUDe3oa8ySrxPhanCKzR02/i844whfHd7tVqLQ+54da4ClszD+rHUF
 R5Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PmscNVFaRvsQGd7iPIC+tEfvjAlvthGNjNXCdf5iAqI=;
 b=W/AQgX01xy1u2jTaFXbox+f2pNzeSrFrl303GvyCPWSN1W1EBzwWxhr2NX/+YVTsx8
 eTGlq07dtIqX6/snUDWB3xXMMnFGjOAhVJ7b0zLqPtJTvHJnSe9piLCAPAuTCF1VF5FU
 AL7QQZAz7XG75wKy23nuwaF0ZAlzJ+hXpDWzXw8a3/PWt1b3z0+mZSGAm7L2pe5S+gpw
 dCu6ruvbCiJkrK21pmw9Ieh4vBoFPbX7+gZqqgkG8f8pkrVF0YEoV5t6FtsmTeW9B3D6
 D5vkXE0UQrIoATitJDVHAeANlTVi9is4HK8+YW7gX8WUGg+2EHaVoJzV1O5gwBqAA+c5
 XqGA==
X-Gm-Message-State: AOAM530G2R97ZIG14Dn6b6znFr8tWm7iWm7c+oyIBglxpgW/BUQH2jBe
 JOmCenkHv5yimQrP//O+dw5Mm7bzUvxzWQ==
X-Google-Smtp-Source: ABdhPJyACHdxxfgEBUHPaHVdckfe1EaEYjK4adRvmMQ1/F+0KfkldP9SciyOYZUG4yQK31RZFyXKcw==
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr29250866pjb.38.1624899267411; 
 Mon, 28 Jun 2021 09:54:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id pj4sm44583pjb.18.2021.06.28.09.54.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:54:27 -0700 (PDT)
Subject: Re: [PATCH 15/18] target/arm: Implement MVE long shifts by immediate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b12b3fb9-8919-8e87-1aa9-e54807bf82af@linaro.org>
Date: Mon, 28 Jun 2021 09:54:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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

On 6/28/21 6:58 AM, Peter Maydell wrote:
>   {
> +  # The v8.1M MVE shift insns overlap in encoding with MOVS/ORRS
> +  # and are distinguished by having Rm==13 or 15. Those are UNPREDICTABLE
> +  # cases for MOVS/ORRS. We decode the MVE cases first, ensuring that
> +  # they explicitly call unallocated_encoding() for cases that must UNDEF
> +  # (eg "using a new shift insn on a v8.1M CPU without MVE"), and letting
> +  # the rest fall through (where ORR_rrri and MOV_rxri will end up
> +  # handling them as r13 and r15 accesses with the same semantics as A32).
> +  LSLL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
> +  LSRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
> +  ASRL_ri        1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
> +
> +  UQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
> +  URSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
> +  SRSHRL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
> +  SQSHLL_ri      1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
> +

Could perhaps usefully be nested under [ ].

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

