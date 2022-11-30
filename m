Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE563E35C
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 23:23:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0VTp-0000NP-9O; Wed, 30 Nov 2022 17:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VTe-0000Ju-L3
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:22:56 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p0VTY-0004oW-Eq
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 17:22:47 -0500
Received: by mail-pl1-x633.google.com with SMTP id s7so2359642plk.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 14:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hndhixjIt4laxhxe4XTLeyNWZeFQxiD+jrcwK5VmjXw=;
 b=KSZi4H1LMb7U3jgemc6A6YUipD4ikJmyd8e53geWjVDW5b7xeLHH0+wzuLZ54Fm0IO
 3Z0y5R/hbp68sr3HYX7IFuWHCEyJBCJ8F7NBBWSFbyvWcWKT1mRYXPYmxSd73trB05Lz
 agXq17flBw9sxdf6HxZyrRjRXhJwB3HxRblfMnN6sV6R4wdj37OuJwgnumzyJRFUFH4j
 N7io69VDhq546CHDgKaSpRT4imRt0c9mixou1q2w+rAQhPheFmWzI3LgYw1YTWuSoYkf
 wm01BO+uvVMzFfrFLi0gtpfkTrEc8gHGCqsq6z16SfpXgBsBoSQ61jjHPhcWa+gJQTX+
 Suew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hndhixjIt4laxhxe4XTLeyNWZeFQxiD+jrcwK5VmjXw=;
 b=iq8TzkcJ1Qo83SbO5CRq95IGa5CvS08e5NkssAgosFKN5kuc+9SPW4XAg7WyI/CiZg
 pOIYHZZVpOdTjVfa8AcgFahm7UIUFwreo3CclxtMqePxGNrv3oOWQ0FcKsCOamPjUTVl
 iGoW3vf9/GeJo7/zBoq2DJQSRcuN36jfAQPOctgvYtcuifrk21Ynji4smeHdwyNMhNez
 59sCjP1VuWEhlb2NyxYa7QXW7wBsXKrPyPKoVVb1LxzACTCki9e04NSCdKAZge9tcpWw
 B4NE9+tDhrBifYEj5gx73y5bKcpHi8379yZiHyLVgbfN2toA6GX+GLH6BYK34dqs54mJ
 Se+g==
X-Gm-Message-State: ANoB5pmZZQCDwJU5B45YMgkljMGSLjdzVx2dAJjEKrIvaKBG/TUkqPis
 HENwFlOHqPx0jhlmLZX9nbYbnw==
X-Google-Smtp-Source: AA0mqf5+3QPIKc0Vz8JqVxPcbwi9UOAJU/6HQ8NYjLbEB63VdfUWkS3QwrCIJuuss7sH4dXssfqdUQ==
X-Received: by 2002:a17:90a:e2c1:b0:219:5bdb:2b45 with SMTP id
 fr1-20020a17090ae2c100b002195bdb2b45mr7650711pjb.71.1669846952905; 
 Wed, 30 Nov 2022 14:22:32 -0800 (PST)
Received: from ?IPV6:2602:47:d48a:1201:7dfe:6c55:976b:754?
 ([2602:47:d48a:1201:7dfe:6c55:976b:754])
 by smtp.gmail.com with ESMTPSA id
 a3-20020aa795a3000000b0053e38ac0ff4sm1855659pfk.115.2022.11.30.14.22.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 14:22:32 -0800 (PST)
Message-ID: <26e52320-2ec1-85b9-6475-6b6f73fdc118@linaro.org>
Date: Wed, 30 Nov 2022 14:22:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH-for-8.0 1/2] typedefs: Forward-declare AccelState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20221130135641.85328-1-philmd@linaro.org>
 <20221130135641.85328-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221130135641.85328-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.257,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/30/22 05:56, Philippe Mathieu-Daudé wrote:
> Forward-declare AccelState in "qemu/typedefs.h" so structures
> using a reference of it (like MachineState in "hw/boards.h")
> don't have to include "qemu/accel.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/qemu/accel.h    | 4 ++--
>   include/qemu/typedefs.h | 1 +
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

