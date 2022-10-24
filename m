Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B53DB60ACF2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 16:17:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omy5h-0007Gp-FA; Mon, 24 Oct 2022 10:06:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy5c-0007DF-2C
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:06:05 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1omy5Z-0002hB-92
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:06:03 -0400
Received: by mail-wm1-x332.google.com with SMTP id jb18so3233851wmb.4
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=azJwmTJQjJmnPnfMc/80KP1xF9YL8dFHx2E3ACVWdx0=;
 b=bczW26RzdNQ64QxU7VNWWfa0GnaShqFDHIxScXgcJr57oqXucMYtqWaxRrYz9szrSo
 gqXyZnw6mLMm7DIicIj8tGDLGJaZcmlOrl4Rpms6xtYsVcC440Nqy1aLy81YxHHUpa95
 PMqXNAHLF6+0Gg5Yqlwhmoj8zeARVoRlX8EQKpeH4LxzIPUNxqEY+JpXJx5wE0p59681
 YUEaoU2ciadR/UCCuFZhiUu3FzZPnHsWKWWtw1huIO3jye9ie7veo8uU4QQxRCd82LMN
 iMNecoCoSZbPTIHjiybuee1JKBcJVtwhxY8H7UTsoU8P02X7fctLNW//vfaWmUE7idGm
 qILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=azJwmTJQjJmnPnfMc/80KP1xF9YL8dFHx2E3ACVWdx0=;
 b=fEUrlNRlQkuTCGOe4sSXMEaRcF4AZO9vrVmATpY9zvvsXvOQH5spjyhZMk4VX0thPj
 /jLOTrK86im3tcIimpKPQfmqXETPpTFo9B2Ws/IwRU8EekOl3BSJDqHaN6oepNC7tOg9
 biRRUbL9DKzusMHc+FGbFSKWTsL+xX/7SrB6xz2msL2p1OF2PslTX8+k49ow61PajPmZ
 26D9JyPOdMN4odmRj2WB5ve+KVbef6RR8SbHfjkH/RlXgB9hDYr+D3wsx+pElB3TC4Zw
 Vimyc7nG5v4QvljoLYBjlLYmSLxZUv+0GBgCansHy7fYZgAU3AAocvgAKMt6iAweCYjk
 Kh0g==
X-Gm-Message-State: ACrzQf1t4QeNRq8iKT/Xed3dGkuPlye3pNaw0HLfxGz+rUfzK6JXfG3y
 u4+q9E4pF8XgnnXDNs9bv/6sOm6872OdgQ==
X-Google-Smtp-Source: AMsMyM6+YyVbHLVxAP7Tul+Omhw4FMaIr04qaMPXb6NQM75S4TjW0AaERuKsgbtmxO8Hd0UK+cIgWw==
X-Received: by 2002:a05:600c:4e0b:b0:3cd:d83b:7998 with SMTP id
 b11-20020a05600c4e0b00b003cdd83b7998mr5310588wmq.119.1666620358301; 
 Mon, 24 Oct 2022 07:05:58 -0700 (PDT)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 15-20020a05600c020f00b003a3170a7af9sm38410wmi.4.2022.10.24.07.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Oct 2022 07:05:57 -0700 (PDT)
Message-ID: <c07cdb60-a8c5-02f2-71dd-f411964269ad@linaro.org>
Date: Mon, 24 Oct 2022 16:05:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: [PATCH 18/29] target/s390x: Convert to tcg_ops
 restore_state_to_opc
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221024132459.3229709-1-richard.henderson@linaro.org>
 <20221024132459.3229709-20-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221024132459.3229709-20-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/10/22 15:24, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/s390x/s390x-internal.h | 4 +++-
>   target/s390x/cpu.c            | 1 +
>   target/s390x/tcg/translate.c  | 7 +++++--
>   3 files changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


