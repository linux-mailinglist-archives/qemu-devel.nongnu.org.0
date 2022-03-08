Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99EE4D202B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 19:24:05 +0100 (CET)
Received: from localhost ([::1]:44722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nReVA-000473-Oe
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 13:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReSD-00073J-J3
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:21:02 -0500
Received: from [2607:f8b0:4864:20::1031] (port=55836
 helo=mail-pj1-x1031.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nReSC-0003Lf-67
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 13:21:01 -0500
Received: by mail-pj1-x1031.google.com with SMTP id k92so78470pjh.5
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 10:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zmKwPsCHNJ+XTW1FdvOFOwyr1Rapx5Fd0vDmP+tM+Eo=;
 b=lYMk7OawTPylN03ia0EIGliyYCYxQ9B3unCVVvV04n96f+cCJZ8lHy9JGGwqqlJal8
 vj5ZDfskOz81+11PVZ1Xbpb2Ocb6vdN3GKXaJFnfnni8QmJ/+FxNNwhYlDCMfHkJQYr/
 asRvUcFUH1q0LWWnyzbHdfXCwTujaO6FFk453vH8TMVaInPp50Jx7WPK+hOoso6NZC44
 AN9z4gjYu6lMAhHCZCQE5sz0szO1pG5FxMIK6GhIg72tNcyBkZf+bVVwjcpvAaJrcTw7
 5bIAavnXuQyFHV+aKEbNsfYLsP8pbiBSfPWiq/kt8STVUsuUKu11/9w+OmnWzTpL5CkE
 oLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zmKwPsCHNJ+XTW1FdvOFOwyr1Rapx5Fd0vDmP+tM+Eo=;
 b=kuijVoQlQy2IgGgm9GHMgFfcn68vHjOOzggcOGD3zX8scv0+xUT022w6Xm5x+7t+ZM
 Qb324sekurk1prGVEib02Jl88kuXK1NpWMS5gDWjISxGg6Obzi06km12W2blvdB0Urfr
 kHx26QyaChpOQ6alFhuECUiZz36+a0vGONzkNcSXvmDYnnCgsuqHz9Ix4Y15aW5Lisb8
 2c/V/OoF+KSwp+bpNddG/d3woq7PfCo6s9QnMw3cxWK8NfMzJDXzaP9q7Q+VjEKd+kMn
 mOs/A56f6hER3azUQTJA0UUNZQT4jyr4AXQQ4tTl1uVuNPxvkuCXFtQeQS966VkbImBg
 57Ig==
X-Gm-Message-State: AOAM532jZusNO/wkMz6A5XcUMQQKPphkgbsOkMlaYOu8G+J+VQX7vltA
 hehLGIZ6nFrq+ktboi4SnvHAhA==
X-Google-Smtp-Source: ABdhPJwG2hiiT48vfvUMj9IVSNz8ZtbFDpWnKUO5iwlCRIhPMVeVHZEF+eL8b5BcspzD46PhoYt3/g==
X-Received: by 2002:a17:90a:cf:b0:1bf:50c6:64e4 with SMTP id
 v15-20020a17090a00cf00b001bf50c664e4mr6078600pjd.81.1646763658582; 
 Tue, 08 Mar 2022 10:20:58 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 t2-20020a63a602000000b0038062a0bc6fsm5796459pge.67.2022.03.08.10.20.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 10:20:58 -0800 (PST)
Message-ID: <b3e44467-1081-387d-929d-5b098ffb796a@linaro.org>
Date: Tue, 8 Mar 2022 08:20:55 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/13] hw/isa/piix4: Resolve global instance variable
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-devel@nongnu.org
References: <20220307134353.1950-1-philippe.mathieu.daude@gmail.com>
 <20220307134353.1950-6-philippe.mathieu.daude@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220307134353.1950-6-philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1031
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/7/22 03:43, Philippe Mathieu-Daudé wrote:
> From: Bernhard Beschow<shentey@gmail.com>
> 
> Now that piix4_set_irq's opaque parameter references own PIIX4State,
> piix4_dev becomes redundant.
> 
> Signed-off-by: Bernhard Beschow<shentey@gmail.com>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Acked-by: Michael S. Tsirkin<mst@redhat.com>
> Message-Id:<20220217101924.15347-6-shentey@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/isa/piix4.c                | 10 +++-------
>   include/hw/southbridge/piix.h |  2 --
>   2 files changed, 3 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

