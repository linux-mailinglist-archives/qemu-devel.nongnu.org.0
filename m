Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B92E16F20FA
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Apr 2023 00:39:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psWja-0003J6-TT; Fri, 28 Apr 2023 18:38:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWjY-0003IM-Gi
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:38:32 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1psWjW-0007An-Py
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 18:38:32 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f18335a870so1364555e9.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 15:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682721509; x=1685313509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AuzxP35MrbKy3jQb0AgKA3eB+v0ygkrGtM0eA2b2OUs=;
 b=B7vYmBbc5wswEloQgyXjjcIPffwQAdGiux9k4rhpToZSf7VXyz6Z1jqa9puxUHthuW
 7x7dazH+0e/fgy2mt8h+f1Jl9VIwBnb2M5RcN+J5HM/FIn3oBwxv1zQhzFj0mifKuKFu
 k/D23KunY0VV2dh5z0+yHZWTxsB2D8PqS1gJHarmlyjJQ69K7L/qk3U4FLnQh1vyzml6
 2blEI5legF4QAQy6XrJYpmbqV06gwlvFtn1gT1Qkt7oAxJIStW03yAFL61JPMdOMkWU4
 UqY0P8KRohcyJOWHV/8Wo72zY0dkbwPqpBo1CSVT3FmFyva5RkUQhmyyZcoHx8TLnzqf
 FK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682721509; x=1685313509;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AuzxP35MrbKy3jQb0AgKA3eB+v0ygkrGtM0eA2b2OUs=;
 b=A6M5Ml9EfqPlCy2zZWLqzsDiaMnqEghem1C+cx7reKDZ9QsTWep2O4x/cUqGeAByo0
 Cw70h1q3mCiw/L9HrMVr4mdyi7gfc55Vy6jNs38Ta3yJ3OClL8YN2330iApjaEZBCy0M
 GRtV1ggT7AfTQzL2nNiy89lPaU30y5RpMetFgp6Ihg5bvXmNZyLBohUQvjD/y/Ss1OKD
 iZUUEkkz4MB6C92XJKM4wQM/JgL0A2dM80v2jf0aORJoQybKqxJiIBh0PNu83g5j0EqN
 fkF20aWvyODb08dRROX+2XU56MY7rok1fT+voVjZfqFH0ne0IDiuLm/kVvInPD/qxUXn
 2Yug==
X-Gm-Message-State: AC+VfDzo+lc5kPbAGH8opbUDV+vw42/WIPVEZXuJAuVkl8UX7ZM6JKR1
 RpRckKeE5yRL73hkxjDtv4g5Lg==
X-Google-Smtp-Source: ACHHUZ7OeMSUugrGJCjS7oR+SwWHbI50l7agy8nmY6Y1GQvqpEGbq4BlfphtecVWmmV+hJtRC3JSvg==
X-Received: by 2002:adf:de07:0:b0:304:7ff3:9b2 with SMTP id
 b7-20020adfde07000000b003047ff309b2mr5580538wrm.39.1682721508997; 
 Fri, 28 Apr 2023 15:38:28 -0700 (PDT)
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net.
 [88.28.19.47]) by smtp.gmail.com with ESMTPSA id
 w6-20020adfee46000000b002f0442a2d3asm22080474wro.48.2023.04.28.15.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Apr 2023 15:38:28 -0700 (PDT)
Message-ID: <14f6f77b-e816-567b-eac9-f5d678c7edf7@linaro.org>
Date: Fri, 28 Apr 2023 23:38:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 05/13] target/arm: Move 64-bit TCG CPUs into tcg/
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-6-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-6-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 26/4/23 20:00, Fabiano Rosas wrote:
> Move the 64-bit CPUs that are TCG-only:
> - cortex-a35
> - cortex-a55
> - cortex-a72
> - cortex-a76
> - a64fx
> - neoverse-n1
> 
> Keep the CPUs that can be used with KVM:
> - cortex-a57
> - cortex-a53
> - max
> - host
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/virt.c              |   6 +-
>   target/arm/cpu64.c         | 687 +----------------------------------
>   target/arm/internals.h     |   4 +
>   target/arm/tcg/cpu64.c     | 723 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/meson.build |   1 +
>   5 files changed, 735 insertions(+), 686 deletions(-)
>   create mode 100644 target/arm/tcg/cpu64.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


