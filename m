Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6135F1382
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 22:19:54 +0200 (CEST)
Received: from localhost ([::1]:40196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeMUC-0004Gn-Vz
	for lists+qemu-devel@lfdr.de; Fri, 30 Sep 2022 16:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeMR5-0002Xy-PY
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 16:16:39 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:34624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oeMR3-0003ll-S5
 for qemu-devel@nongnu.org; Fri, 30 Sep 2022 16:16:39 -0400
Received: by mail-qt1-x836.google.com with SMTP id e20so3219581qts.1
 for <qemu-devel@nongnu.org>; Fri, 30 Sep 2022 13:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=IFjWUXfspDkCWdDJutszC8GDF2PR+9cbEqNg2oZTgrw=;
 b=vfR65lD0OJuYEzhJuWrNFrprumz7TwTiUg076ARHodFieSB8RJFAedcudHaD1WIASJ
 cdmbWm3eOtyA9bp5feJWYbSQoGc675649at1Q/ytkfMgyoxQR+0eGc9az6BpNI5hsV2c
 vSt2IsZ7SppHUzUaCfpdeB7M4rg9dvGB1ECUOFBKVbsn479FM+xBoUw5Qv/T8gRTVtgb
 oPh1PAo7iExN6UaEg8jKRSqAOZyFPY81wcwD5YVB9O+47FzDZ8oGnDoheTBVkLNxwjXr
 lgjO606bAs3yZxKVEHAY9Xs+Xwwz8pn9l/wqOzS1/TjMvEBSjAPh2q2HD0yolqtjYyT5
 CBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=IFjWUXfspDkCWdDJutszC8GDF2PR+9cbEqNg2oZTgrw=;
 b=O+DZi4wGIVYd/XV3o3vTag/xjrGFZ9V9TKx5YudLDe9B+9T8QzrHlguyUl1HzDYaO8
 QZAAYmP/5n0M2MvgH/v/mVLDQkyQ3QLXw8thXHwXZnjZtHb+bofbXJMb3oZGIuplQbqu
 3CpgZRmm4r4UvyTwinDliGUXBqy073PxLGWdA3EMzhJZTrvacLMP7KB8KXokQbAmjWm0
 EOjbhG3pCvAJZBXf0b4Xq7zxfpwjFwclDEDh8Pj2dS7jhkpoenOqPYn7bs2QP32qvpGT
 MdgxezUvNwsS7PeFcYMBQF09CGSsI4hpbJAJRA4fn8O+whQVVdZoMkEFyXrT/6lAEKjs
 hWuw==
X-Gm-Message-State: ACrzQf1MRh/dnLX2+wH3ABc6MxAePq+VHcXcprJGegaldkWKqeqbNhy9
 S7X3TU+5reyZIBbC/K7KfCSHcw==
X-Google-Smtp-Source: AMsMyM5XTJblbygqauZKItti7jLHGZl3YtUW8Krlks5NZD3wxoI0Sw2GmmZQcbj0Z+ZdXcZttQTreg==
X-Received: by 2002:a05:622a:5c6:b0:35d:4fc2:cee0 with SMTP id
 d6-20020a05622a05c600b0035d4fc2cee0mr8340000qtb.143.1664568996634; 
 Fri, 30 Sep 2022 13:16:36 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80a1:5a60:d0d7:468b:5667:114b?
 ([2605:ef80:80a1:5a60:d0d7:468b:5667:114b])
 by smtp.gmail.com with ESMTPSA id
 h16-20020ac85690000000b0035bb8168daesm2662528qta.57.2022.09.30.13.15.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 13:16:00 -0700 (PDT)
Message-ID: <64bd1473-ee2a-9e9e-4411-2ecfb39ed4b9@linaro.org>
Date: Fri, 30 Sep 2022 13:15:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] docs/system/arm/emulation.rst: Report FEAT_GTG support
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220930174853.2233633-1-peter.maydell@linaro.org>
 <20220930174853.2233633-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220930174853.2233633-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.583,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/22 10:48, Peter Maydell wrote:
> FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
> can report a different set of supported granule (page) sizes for
> stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
> we already report the granule sizes that way for '-cpu max', and now
> we also correctly make attempts to use unimplemented granule sizes
> fail, so we can report the support of the feature in the
> documentation.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

