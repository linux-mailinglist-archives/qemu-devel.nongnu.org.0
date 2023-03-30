Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 863A86D0814
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 16:22:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pht9h-0007k5-0e; Thu, 30 Mar 2023 10:21:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pht9d-0007i2-VS
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:21:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pht9c-0002cE-8U
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:21:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 o24-20020a05600c511800b003ef59905f26so11856247wms.2
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186086;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ho1ahzs2795A1FCnGVr3UYpIFKT97XqTb8JcZhODI7g=;
 b=w8tL6/14DMfnMNAbcGq6cZds0B5M8jgJtevI0CQ/nbVQuxZD28IoRhetmcLlGpg2Is
 VqZ8EPBXEhIoK0DHN4WMjZ57bfPTv9lmPSNEyXIBgKmrZtxyTuOOzcMgDP2Et5yJDluQ
 jTjHXmBQBFzCJzT3HbeMyMt8GL4C9ikyBfTX7J3OS0P1uQXqrOdSJJlFNzfc+LIVbPyK
 osFBYIU2wQ4q6rVr0Js1atSoImGxAGX+J/+iQxl49xeObj4C00GRgHG2QY9YmoVv56lB
 yW/7T4aJHr01l4+iasfti6xhmCfAMptLRzDGFrk0hAGOIWAZBdPN/95o28ceQlB1MYGQ
 qk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186086;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ho1ahzs2795A1FCnGVr3UYpIFKT97XqTb8JcZhODI7g=;
 b=AOJJYqkGmsxA9LvglUsodkBxIvoykVSlUlCL+IbJfx/SDBdjiD3OsbwwLJkyaFwQMa
 6ip7yWlMER0gh3qTr8vDiOCA44VqgLiVWzuG5Jh/33MjDoqtAYYOwvO7fgHLDqSFjxUC
 0hTh+nU0iTk8AGU9LgDgEO7ihhdNPJjZHqpCVJB48xILo2LXx/IJ39/WXuRw0OTkvGb7
 3r/BASR5wkPXQvHFX3JW3QVEk6cZ39cLmZ51DQtMCW/umryQkP/iaE7I5LpMZSRi/J6c
 Cs/zkKuI884MPv9nyooZJfBvcacFIMEOisegqfHEUtA1TOv7ufLfRO75Xwtkp1KL65kF
 91xA==
X-Gm-Message-State: AO0yUKX60Oc5dM7K5bPzO4Aqd22DXtkl/KcBzPz3NtNJzaOa0Hjqusff
 3Kg14eiKF5XqVAyJhaW/90rROTdjmxxvJkmvh3s=
X-Google-Smtp-Source: AK7set82Ia1aJbY6q8bgEqnknXntlR7X9zrMcMtmF0w5iPUoCCOXavyvDES+hPTTjhppXACy0H54uA==
X-Received: by 2002:a05:600c:224c:b0:3df:eecc:de2b with SMTP id
 a12-20020a05600c224c00b003dfeeccde2bmr18681067wmm.11.1680186086533; 
 Thu, 30 Mar 2023 07:21:26 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l10-20020a1ced0a000000b003ee1acdb036sm6070770wmh.17.2023.03.30.07.21.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:21:26 -0700 (PDT)
Message-ID: <21823d8a-067d-c96e-6e3a-4569f2df3961@linaro.org>
Date: Thu, 30 Mar 2023 16:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH-for-8.0] linux-user/sparc: Don't use 16-bit UIDs on SPARC
 V9
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Gregor Riepl <onitake@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Zach van Rijn <me@zv.io>
References: <20230327131910.78564-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230327131910.78564-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 27/3/23 15:19, Philippe Mathieu-Daudé wrote:
> The 64-bit SPARC V9 syscall ABI uses 32-bit UIDs. Only enable
> the 16-bit UID wrappers for 32-bit SPARC (V7 and V8).
> 
> Possibly missed in commit 992f48a036 ("Support for 32 bit
> ABI on 64 bit targets (only enabled Sparc64)").
> 
> Reported-by: Gregor Riepl <onitake@gmail.com>
> Tested-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> Tested-by: Zach van Rijn <me@zv.io>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1394
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   linux-user/syscall_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Patch queued.

