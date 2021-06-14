Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B15A23A6FCC
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 22:05:43 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lssq6-00051r-QR
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 16:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssoQ-0004A1-T7
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:03:58 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:41697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lssoO-00089G-ES
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 16:03:58 -0400
Received: by mail-pf1-x42e.google.com with SMTP id x73so11402798pfc.8
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=4FbwJ92eOuOt2Ykki2atX+/r78wFL07JKaARVSVcQVE=;
 b=OFN9SjoZURE+Ef3jAX6f4TE6rkgW1vhfGhz+g9JKN9AbDp0kMIEOxrJ/+5rJS++seS
 JXWiZLmxT+8XGgPCsJcbK1kuRmU8YwzXQIRiTS1oYOd++vXmM8dfnOqpP0EVSaNqrLH0
 xy6jMIRx3HzEbJYecYbLsW39T3U+8xGlZNtn6zWLNtxnrwpfkniykvT6BVzBwh8H+Try
 Gwq4ynZY+0DSjmgn6DwphapO9pq6/uhAb6RH7xDeaxl71iHSYnhOB7EXiKL9S8rqYUdO
 w1d3wYp5ozSKLYB4pV+nsMCVTE4UB8TjpfF33xo7gOt8qR2JHAfAcZeXj/8IT33dp2Ff
 NiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4FbwJ92eOuOt2Ykki2atX+/r78wFL07JKaARVSVcQVE=;
 b=ol513QLo0sN2JZnHp/BuSbTej/U+/0n3lx4q9nDTgx9z+CMAhNBGhzdtlghRbXblRD
 cRv7a977Brg58Xvk59IXRcT08vQHKGTDgFXFoic3cGJ6gtyHmD1Bed8b4X7VjPYMOOEG
 JVfznbemn5a2qbSwpESStcFfg/u9MK7o6WFT/ve3LtZZbjmXfZXKttf6Q6Vtd9KArE/a
 rgl8UwUuTMGur9sKDLp78A6CPOuGkrVLQPGEXrKAfinRLGprzikiXZNiSFw5ow4xrUEv
 D03HX+3Lo5qb9+S5ryYgHkxnioV8ycPAx03e0biflKqGo6EA8GAFi5jVX9kFrc8YVUVi
 9tWw==
X-Gm-Message-State: AOAM532g9rHW4T4jP1w0xRzIKYFgHdYAYWuvIUPaog7bL9nzBxsz5Ezx
 3R9zw+vKECIm3CbtAZsRTdkl19EFrAZyNQ==
X-Google-Smtp-Source: ABdhPJwcuvFsXGCZxaqrBujh2O7lEAUhA04IZOs7y88wIHPeps5oCXlj5zLvJDk+Q6BRC+cHYJexYA==
X-Received: by 2002:a63:514b:: with SMTP id r11mr18712704pgl.437.1623701035091; 
 Mon, 14 Jun 2021 13:03:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 ig1sm12910630pjb.27.2021.06.14.13.03.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 13:03:54 -0700 (PDT)
Subject: Re: [PATCH v2 17/57] target/arm: Implement MVE VREV16, VREV32, VREV64
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210614151007.4545-1-peter.maydell@linaro.org>
 <20210614151007.4545-18-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2e2c3225-4c7d-59d9-9fe1-bf2de72ac8b7@linaro.org>
Date: Mon, 14 Jun 2021 13:03:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614151007.4545-18-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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

On 6/14/21 8:09 AM, Peter Maydell wrote:
> Implement the MVE instructions VREV16, VREV32 and VREV64.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  4 ++++
>   target/arm/mve_helper.c    |  7 +++++++
>   target/arm/translate-mve.c | 33 +++++++++++++++++++++++++++++++++
>   4 files changed, 51 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

