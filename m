Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 823F76A413D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:56:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWc74-00064O-6w; Mon, 27 Feb 2023 06:56:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc6t-00062M-H1
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:56:05 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWc6r-0000oZ-Mr
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:56:03 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so3647144wmi.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WjdfL26YmFPvxotZkKLLkDiGMcCKt9gQYj4MnZd4IkQ=;
 b=fCo0VdO8D6NDX/iwyP+Nc5jFJkGI8aKibRvtfzooUL3j7CaiAH8/mv2vZ2afz2Qp0p
 oWAfF80cxNQfy5YhDwsCr2Rh68O0N+WGlZmfVNx8SsTjopQ/4PbN2pJ+aRZbp1gf5z7s
 TLgq13qHYVwFI6VkWZ0cWS68p+qb7PlGVm1Y6o/EdcnsTAoJDdkDLko6w1AHyAC2T3an
 iAFKt5Z8mCm11wMKlbD8ldKkgXsgFfTb57yG1lORKTXMJlwnXxxRFQHlaH+NGY9Wnm4A
 G5TabOrHSxf6uOmAcjLKMYMOpqq8uoNcOzNVyqOi1rAXwyqWLkEBhV3XZLr0wpnRBe/r
 WEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WjdfL26YmFPvxotZkKLLkDiGMcCKt9gQYj4MnZd4IkQ=;
 b=0fLCaTYUld9qG/RPperJ3ZHaHbFlKrW+YLBva6rzngbP3UukJ+PGYSK89usYT5T4lI
 bZMTbAO/SiPp8G/68/jumaJVvqTlw19A2xHhkmoJEZKeLQNL5CJd6BjY55+zvzf+Yk8T
 NCbcdT+WJ2uGS8uPn2b+YFuW4WV1gNrc8PaeDEMFh53KUdmXDTvnqpdNWv+M68bVS/0K
 JWUYr6f1jtZmAFKFxcepnFhaydaSKkW9DWaXsa1cIQt3NPGj25wohjImN4Y0QL7xJb6G
 qXpFeh+YHk2QEc+VkImkV3Abm1SBhFxrRUzerPfzkvBtvPWTAV3pYi0wlz3MguEodEif
 KP2A==
X-Gm-Message-State: AO0yUKWd3BMaTJyMBqfk0EiC7i+VM/9/qCKAp6xkGYWNgC/lRogrDXWd
 /T1G4tWUy9mRsl9SdLfryA4uFA==
X-Google-Smtp-Source: AK7set8LLjAAC9NLcvE8U7JkBvYSebAXnkC3zFJVIIcg8uIbE18hfaZORzb38i9yf4hcvAQPPCuTLQ==
X-Received: by 2002:a05:600c:70a:b0:3df:eecc:de2b with SMTP id
 i10-20020a05600c070a00b003dfeeccde2bmr15469700wmn.11.1677498958904; 
 Mon, 27 Feb 2023 03:55:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p15-20020a7bcdef000000b003e200d3b2d1sm8905402wmj.38.2023.02.27.03.55.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 03:55:58 -0800 (PST)
Message-ID: <dbe01fb1-106e-3c2e-ba6b-d739f77d39bc@linaro.org>
Date: Mon, 27 Feb 2023 12:55:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 08/12] hw/isa/lpc_ich9: Remove redundant ich9_lpc_reset()
 invocation
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Thomas Huth <thuth@redhat.com>
References: <20230213173033.98762-1-shentey@gmail.com>
 <20230213173033.98762-9-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213173033.98762-9-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

On 13/2/23 18:30, Bernhard Beschow wrote:
> ich9_lpc_reset() is the dc->reset callback which is called
> automatically. No need to call it explicitly during k->realize.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/lpc_ich9.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


