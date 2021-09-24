Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFC0417729
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 16:57:44 +0200 (CEST)
Received: from localhost ([::1]:41730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTmdy-0005Au-Vl
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 10:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTmcx-0004Qu-VO
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:56:40 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mTmcw-000531-Fc
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 10:56:39 -0400
Received: by mail-qk1-x731.google.com with SMTP id 138so27961083qko.10
 for <qemu-devel@nongnu.org>; Fri, 24 Sep 2021 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QtgDq+s+oFF1Qvw79uA7XYfYU73XDmXpmZrSn78gv5U=;
 b=GdROZdUe3mRAD089UMNMqTsWK4MPail9KdwPWt1U90MmISrNFO3n6nJuA9xlOlfy11
 PFvBsaUqtWPlXBoGXPHibGPjK0b2/90ivkhlTdWxcqe3Q/yNjqnp20B/alz5iUs3Od1t
 RJ9d9OdjYcZRlUdUwhAdagx7fHCF5Kj3pHmKVBptjhmtsJyw+XBO9QrTt106JICk7Ua8
 FV0BXToZQNVLi8VaIjzRReaD/uxlJWbCrjg+WFebiiQyh7FTGcLLQNtIb1sl1p8NXBWC
 wIieKJB6Cc8b6ewD8vdMtabak4JJinwWA+e2EiMGAvC+OC4Xk2WF60MNv4EyJp0FCsOW
 LlGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QtgDq+s+oFF1Qvw79uA7XYfYU73XDmXpmZrSn78gv5U=;
 b=Y9F7TDUKlL3TMVAEz+J0p0iuvf7hXP+D8BBLvNOPlevUjMNijq05CquFRhJw0X7/Lx
 a6ZyCbOkb7VMSf4pkAtCrROtjdpC4clTfzKUEcax66FZlE4h4hGE/IBZJbYHlNMNU7dz
 fslNOa5qphwKyn2HymoH3XqIGOXAf/cW6fDvUGF2w6Yes/2grFfD+HS5S19MTx0Ysp/i
 uN1mORqMAU2IdxjW9v2+vhkUzAKSjh6guOk8SzAfF+J+htYvpyeupiTSi7guZpFScOtr
 kv6BWgmi5U4iBGDGlsG+zq/c4Jn5LcD8qOvMDt4SzdLCulPtR537Jh8F8Gm0cDltOCDF
 0Awg==
X-Gm-Message-State: AOAM530cvMERo1wLy7guStKX3TIXL2QTDlcxQsdwmf6TuBKAzkwW/5yk
 hGayhC5N3u6UDF66O3XtI4DwhBAwoENy3Q==
X-Google-Smtp-Source: ABdhPJyaXtOICL/APZo+uPPHL8ziXmtgmJ14Wn2e5XgPlFSKIn+OQwDg374MdI9MUqWy49ZSL3/e+w==
X-Received: by 2002:a37:bd87:: with SMTP id n129mr3242331qkf.428.1632495397194; 
 Fri, 24 Sep 2021 07:56:37 -0700 (PDT)
Received: from [192.168.3.43] (cpe-24-74-129-96.carolina.res.rr.com.
 [24.74.129.96])
 by smtp.gmail.com with ESMTPSA id s10sm6445446qko.134.2021.09.24.07.56.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Sep 2021 07:56:36 -0700 (PDT)
Subject: Re: [PATCH v4 23/30] tcg/loongarch64: Add softmmu load/store helpers, 
 implement qemu_ld/qemu_st ops
To: WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210923165939.729081-1-git@xen0n.name>
 <20210923165939.729081-24-git@xen0n.name>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8cb68dfe-42d3-46ae-da7a-b89eff31ade2@linaro.org>
Date: Fri, 24 Sep 2021 10:56:34 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923165939.729081-24-git@xen0n.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/23/21 12:59 PM, WANG Xuerui wrote:
> +    if (USE_GUEST_BASE) {
> +        tcg_out_opc_add_d(s, base, TCG_GUEST_BASE_REG, addr_regl);
> +    } else {
> +        base = addr_regl;
> +    }
> +    tcg_out_qemu_ld_direct(s, data_regl, base, opc, type);
> +#endif
> +}

My last messages against v3 came too late:
Missing zero-extend of addr_regl for TARGET_LONG_BITS == 32.


r~

