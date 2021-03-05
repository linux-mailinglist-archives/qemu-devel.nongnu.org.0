Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1AD32DE55
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 01:33:31 +0100 (CET)
Received: from localhost ([::1]:52158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHyPK-0003kW-FZ
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 19:33:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyN5-00034q-1z
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 19:31:11 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:36718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHyN0-0001TB-NQ
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 19:31:10 -0500
Received: by mail-pg1-x535.google.com with SMTP id t26so148146pgv.3
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 16:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=bvFd1Gr4Aj4ifwWA4NAWtAWhHdlgxfrBMugrvvOzp7c=;
 b=pPnHDGVFhZJ3hLoxT31ISzUoCwSgA+gvP7GdOtEmJCxDjLHjyYsaceuq6upPP5ME6r
 pkraGldvwdh8vhDhslDZ8m6Hfzpxl1e2oiBnQPe2rpDQ36q75asw6o5dXc35woQVTdtR
 o92o8Bcz9ch750W4DSTAOL7xEUJ3UBWFUR/EfoekPILc2EvXhXrXe2ssxQVWD5AyHEje
 seUxn57TwnZ7/vNh6kfGQ03dH/fpDDDeoTwyibS4dxXvuH/Z9YBd7HEDXoUssLXRsc7M
 SPUV7xOxdV86AUmH2NH/TikEHQRlGk2jTePFhhwFNNbBEoMbjPtbrI1fPRtf/xB+f3V3
 fQig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bvFd1Gr4Aj4ifwWA4NAWtAWhHdlgxfrBMugrvvOzp7c=;
 b=dUEYTbZWZ9QUkEMyaSEymCQJf0JdOaxaId36u6Wu+9QorvOno5dALnb6nFTnnSsxSx
 gEs3Se+hTEH+LaQIR55DYT1RhfmyRs9WF+I60o1NkRq+nqRuyhPxUBHAeBIJc8GhXW2j
 aIWmyFeAacQtCKQ5+dhMfnrhjITMyiZxEff8Ww3dYP9xObEr/VfeYcW1hmTEwpy/qg3j
 OvTv2PQ/LOiwn6PZ9kB7OKylIVQOQtQxCBoEc5G/Q7lMVkLMNl7lFy+17xOXwxq5m9cJ
 U+FTt2/Yl+cvKvhFjLCIhO5dQtNlk4DEeN6F/Ixj9KYXDrR3Ph+luw8CTt/tDgZ67Xx1
 UiYQ==
X-Gm-Message-State: AOAM530Qd9DN0n94G9eiG2+USMx66x5rOlTYblSauR3O3JQ64MlajQq/
 Xe6gCjNeKU3pss6Vr1XQPX6b1J8OpENdNA==
X-Google-Smtp-Source: ABdhPJzp2oHfRTFdacJ5MAza4OAg7Yp4VDk3+95rx+nt9w/OBkkZd+zzqFXn1XiiZHGHzxYxfRl/Yw==
X-Received: by 2002:a62:683:0:b029:1ec:c88c:8ea2 with SMTP id
 125-20020a6206830000b02901ecc88c8ea2mr6284641pfg.27.1614904263219; 
 Thu, 04 Mar 2021 16:31:03 -0800 (PST)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id b14sm383659pji.14.2021.03.04.16.31.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 16:31:02 -0800 (PST)
Subject: Re: [PATCH 39/44] hw/misc/mps2-scc: Implement changes for AN547
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-40-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a78bced8-2dff-49ae-1a4f-3d1b0bdeadbf@linaro.org>
Date: Thu, 4 Mar 2021 16:30:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-40-peter.maydell@linaro.org>
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

On 2/19/21 6:46 AM, Peter Maydell wrote:
> Implement the minor changes required to the SCC block for AN547 images:
>   * CFG2 and CFG5 exist (like AN524)
>   * CFG3 is reserved (like AN524)
>   * CFG0 bit 1 is CPU_WAIT; we don't implement it, but note this
>     in the TODO comment
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

