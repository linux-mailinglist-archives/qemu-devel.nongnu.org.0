Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3817E2B6E1F
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:11:29 +0100 (CET)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf6O0-0007kp-Al
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:11:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Mm-00077t-VP
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:10:13 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:33702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kf6Mj-0006Py-Kz
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:10:12 -0500
Received: by mail-pf1-x443.google.com with SMTP id q10so17952466pfn.0
 for <qemu-devel@nongnu.org>; Tue, 17 Nov 2020 11:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=JSW+R87KG3d6MD5/aj2X6jQckA3PI5mUzsKWCkllkOw=;
 b=SpIAqrtVc3fMpGNlbDwtLkOf0KSfveV9vyeIFyJCCr+Cphnaat+6u3u5rG3F7vo5+v
 V3uIcuCdvT0WYMPA7xxOm+PopY97/V+78Aq0DS1PcEi+kwl6ffdrFE06sEt695XMLa38
 pUPKVj1zBBuag1q5/wVz5VNLCGZuNDsUc2lkjWmGJ/07cqO/G5b7pbVUpblGVMbte8by
 DOPrw0KVHoTTCf/tXR5lPmUnS7WUB5uKE2YhISokJY4ZiSaYWcS6bb/UG/QyPRXTgswC
 avpwV4TbC7YlhwXZgczM/QL2A0lW/YO3fhzWZU9Mvl90iuTLs4Re97ece9/JHhoEi4nU
 TOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JSW+R87KG3d6MD5/aj2X6jQckA3PI5mUzsKWCkllkOw=;
 b=Eb0Ov+W6zP8rs9zQEHBdwF+VfIl04q5mC85/Rp9bFP+9ALmmrgZIkO4OpCfpJG9k8G
 wWKKLOBCiQPJXOFGzDeyZ2VN2iy1l7XHb1/YvUgQuNidC+WUIZ0NXikHeraNaLGlI5we
 55dF4fCqOBvBn8e2+PluRykx+vNtp/JPCQ8Ic384G4HkSpKk7DZf2dzWdxdLRH0l+mIi
 sa3tY/sdpxF5tF1yDXcTC5RHM8Ekz3mzSHU/g0Tt33COZTlAf8PCWcb/R1nIzq0LN1f+
 FOiNmit2q2/1lQadi1iQJ9Bp0pvBEJ2uxPbfbUCHc5VtLsWiExieBe/XQcE597F0eUEs
 kWjA==
X-Gm-Message-State: AOAM532hApbcCMdwk8aReVfFMD3FV637/wfpQxHXdWaEtvV/y9b5Uf0Q
 dx5uv0GHpSuIs8/TqPwE25QAVhJsynbTcA==
X-Google-Smtp-Source: ABdhPJxFzE6Bsfk0nMJmlpYbcZJhOHpLq/dClJGRatOQwfZox8GCQsYnVKOFELpO9b+mLAD7hqTP1w==
X-Received: by 2002:aa7:953c:0:b029:18b:bfb:9fa1 with SMTP id
 c28-20020aa7953c0000b029018b0bfb9fa1mr788641pfp.14.1605640207962; 
 Tue, 17 Nov 2020 11:10:07 -0800 (PST)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id e8sm3932688pjr.30.2020.11.17.11.10.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:10:06 -0800 (PST)
Subject: Re: [PATCH 02/15] target/arm: Implement v8.1M PXN extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201116160831.31000-1-peter.maydell@linaro.org>
 <20201116160831.31000-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a4d9213b-057a-8401-9d42-e47cf9db9f8a@linaro.org>
Date: Tue, 17 Nov 2020 11:10:04 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116160831.31000-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/16/20 8:08 AM, Peter Maydell wrote:
> In v8.1M the PXN architecture extension adds a new PXN bit to the
> MPU_RLAR registers, which forbids execution of code in the region
> from a privileged mode.
> 
> This is another feature which is just in the generic "in v8.1M" set
> and has no ID register field indicating its presence.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


