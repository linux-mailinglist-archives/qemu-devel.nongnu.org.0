Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF54E2DB0A2
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:57:48 +0100 (CET)
Received: from localhost ([::1]:51044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpChv-0002Qg-V6
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:57:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCfE-0000d2-KE
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:55:00 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpCfC-0006kU-9U
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:55:00 -0500
Received: by mail-ot1-x341.google.com with SMTP id 11so19805459oty.9
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OccRTpKLN7B7VExNrgN3uZKux1sadY1FUfOza07lslY=;
 b=NaSpjy/sp1dTQqr36dh8LofN412BX3TMomUxOxZYSTGnyRmi2DyVhOje5tnCnHDnWn
 0bEjOkh9d1jcVirEN82VpLJ4+bOPSIX6rGgsGyex8KriENJZDAxiqfScnmoQvAWAHCW3
 ZMwiybOUxqvg74SMO5FX503ghWQoLU1KWkF3KIbPRQBoMXZOG3WjXJjqdYM9kDkLQQx0
 cdOIPl0Tg0GGjayo7rK6Z1+OxIwi29lZIu3633LFReOz7ZN9uPQ8J9Ph1BQmd/Es1Usz
 IRErq3snecogkmsNMeXVmvhxrrhKH7CzV4fClbb2XysM3u80Ys5n/e0+/5NzDCLkTIcN
 wqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OccRTpKLN7B7VExNrgN3uZKux1sadY1FUfOza07lslY=;
 b=G1SZwr7qiaNW3L5OZ4yGH9YvhxTqIdzefFW+eI/Nk0HjWuwnmvyOJC872s9BG8ev2K
 VPtKSVgDEj2d69i7++FHRS3xfq3jNQrwdNXcq18ghl8d1Xu6bAJW33b1zN4b02cVwjFP
 Yr8q4u/QgPxpL2FOcQDa/tgoE1z5EzxYtOwQH5+CWrlv140cvQzxhU2pMu0bfUxgizcb
 G1/L+tpiMUGqt8IoQAFwPY4cTAOTgW8op31ef9wS1OCbRL8DYMt51Ly0RXK6Jp9hIi1P
 zINhfOYUXIETkpZ0Pvk/LUZMytkmlhKuTtxzWiYeTSu/O37LMCqdBjZ2oLkCDG4DWrvq
 fX7Q==
X-Gm-Message-State: AOAM530WI7oOhwMCt1hbFmL2gvSLpHei4YRRfiM+N8+deSfIkD7CbTiS
 D5QTIjcwZVFjAXt9tV95D70QbU8JSTElh/Dz
X-Google-Smtp-Source: ABdhPJzeJUB7tVIyu/4jH6IaskGivU6jYkugaTT4RnZwuvOGKD2PPPz268AhwUAMbH+Qx44b+KpENA==
X-Received: by 2002:a9d:4e84:: with SMTP id v4mr24047756otk.45.1608047697207; 
 Tue, 15 Dec 2020 07:54:57 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id n3sm497214otj.46.2020.12.15.07.54.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 07:54:56 -0800 (PST)
Subject: Re: [PATCH v2 4/4] target/arm: Remove timer_del()/timer_deinit()
 before timer_free()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20201215154107.3255-1-peter.maydell@linaro.org>
 <20201215154107.3255-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f6ecb06-968e-e304-3fa0-929e0ff0bb21@linaro.org>
Date: Tue, 15 Dec 2020 09:54:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201215154107.3255-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/15/20 9:41 AM, Peter Maydell wrote:
> The Arm CPU finalize function uses a sequence of timer_del(), timer_deinit(),
> timer_free() to free the timer. The timer_deinit() step in this was always
> unnecessary, and now the timer_del() is implied by timer_free(), so we can
> collapse this down to simply calling timer_free().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


