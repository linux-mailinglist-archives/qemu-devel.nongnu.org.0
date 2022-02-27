Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C46794C58E1
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 02:15:19 +0100 (CET)
Received: from localhost ([::1]:54182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nO89e-0007kp-47
	for lists+qemu-devel@lfdr.de; Sat, 26 Feb 2022 20:15:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO88R-0006xA-GD
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 20:14:03 -0500
Received: from [2607:f8b0:4864:20::42d] (port=36502
 helo=mail-pf1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nO88P-0006ZW-MK
 for qemu-devel@nongnu.org; Sat, 26 Feb 2022 20:14:03 -0500
Received: by mail-pf1-x42d.google.com with SMTP id z16so7934955pfh.3
 for <qemu-devel@nongnu.org>; Sat, 26 Feb 2022 17:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vTnpuKgk2kNzE+UjHMxEUC7iOJDjUOTUS8Ug7nEhLeg=;
 b=DOwWCGL9xicP5tsysn9gNX8L6s8RFm+XF9mc5ZrjI8Bl6l3tMllpquPqJeqZOWlnck
 Tte9e2+41bznfyjnjjVMDTgqd1tu7sZh30E3cXDhl7szh8ZKkbURo626R1Q0jrEzXyCK
 MFEydfWJQ0VXHFLDqlmXeKQjNcRjJ0S4mlyVnUaMiacnL+DAv2o3F68so6SdFJyR952C
 ckxi/jRMcexQBdCDyfAyBx5ngHdurSHihAZZVRPcQxa2YrG7S2PrWEp+L9Y+uNL+0HkF
 PQtBSmeJcTdci4CmbYkDiLXySuq5dmp+UvMV+5AO4s+XMflTR+qVeEAqeRw+hNyl7EBV
 v5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vTnpuKgk2kNzE+UjHMxEUC7iOJDjUOTUS8Ug7nEhLeg=;
 b=DI4vREaTcDUdAIb5gGIFzLPXBXTUHrxLN6006wefz6c+b9psUI5Z2TjlVzbWE5L1Z/
 Nds4dDErRRH943rhNcxN6GhXrOKCu2YuQ/8m6OSwGR8t0FVVwRnogxjlYeAZdyjxI1AL
 VLoQGMK18g61aU0Q4RBYMSVEuTDiSAQSFG+7HHQC3AeRtGC0sjes00b7qtCkVBd5koW9
 Y7+hRHhMFyBKpyWqjYXQiH96k1wM3jW769oMKNIYdbJy90lZm0HcS5RBzmREYFC9iPfF
 xTa/Fzi6BexnNWqvEPiCuI/cWjDNuEZD//1MTc827FbghSnbVWgfuCZ8KJwKpb3JbAD2
 UxKw==
X-Gm-Message-State: AOAM531eHjqzHhhLp2GnA2j83VWsUwMLp4mGv1Mn5Ov1y6YLHLRF6Tmm
 v+dNc2cVKcnT7sGyovjm0ZppXA==
X-Google-Smtp-Source: ABdhPJzMfXqaaNOkxxw4qbGiuSHZ2dDaZM6G0SNSJmWlVD3hcSwa8PkNgcEllsienHUGFBIMkOBH+A==
X-Received: by 2002:a62:1d42:0:b0:4c7:f78d:6f62 with SMTP id
 d63-20020a621d42000000b004c7f78d6f62mr14479763pfd.33.1645924440145; 
 Sat, 26 Feb 2022 17:14:00 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:9001:d56a:9ee0:246?
 (2603-800c-1201-c600-9001-d56a-9ee0-0246.res6.spectrum.com.
 [2603:800c:1201:c600:9001:d56a:9ee0:246])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a63f744000000b00373855b7cf2sm6402331pgk.22.2022.02.26.17.13.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Feb 2022 17:13:59 -0800 (PST)
Message-ID: <21812666-c9de-7c8a-d46c-4af286e69af0@linaro.org>
Date: Sat, 26 Feb 2022 15:13:56 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 9/9] osdep: Move memalign-related functions to their own
 header
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20220226180723.1706285-1-peter.maydell@linaro.org>
 <20220226180723.1706285-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220226180723.1706285-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/26/22 08:07, Peter Maydell wrote:
> Move the various memalign-related functions out of osdep.h and into
> their own header, which we include only where they are used.
> While we're doing this, add some brief documentation comments.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

