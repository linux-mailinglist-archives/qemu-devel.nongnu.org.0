Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 992A96743EA
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 22:07:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIc7J-0002MQ-B5; Thu, 19 Jan 2023 16:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc7G-0002Ly-Q0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:06:34 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIc7A-0004iN-5o
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 16:06:34 -0500
Received: by mail-pl1-x630.google.com with SMTP id p24so3461096plw.11
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CmRhhIjV/QjVTLP2pRCvDsOoJaBA6etwfA5WJgaYlMk=;
 b=CuqpKut8c91KGU+vtmnovKa6SbwSo1yCAQ7qyC92FFGexoqsoBeToHhu+mNgheuamm
 tfvDUhHRWRv4Sj0hqMMprIO3pZ4owDCnicz1+eDWTjn1k6FUPerUM5XfH6vE+8dYJXr6
 EAMmtzIsyMx8OcUksHa+IU6FejT41r1pYJb1XCbIqZ3wkXtouX0m60WQlLnWacp01hYL
 i6NQaMslLEh1jNuRNfeo7miEN40RtdKhdeyUnzCjYHX/hJVSm92NSG9NmUoF0Igrc3v9
 8wjcNZPwYIuPI5LcnAOjgtrnumKK04hxSC9QaJGMHQIpLrXqJn1DaLRRHCRjcbOMXzCR
 e/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CmRhhIjV/QjVTLP2pRCvDsOoJaBA6etwfA5WJgaYlMk=;
 b=OJ38WKGZUotMPLQ1Uf8+AopdahXYWekDkIf6rv3OE8T5YzLPH+oJFc7cVH99oeIuFy
 EvdsoNi0H4Kk+KF6hry451Fwwnqf9ioEaT4je3I1ipVBq3SlRhVSU2jzfXjOV8JuXPpd
 Zo1WsqWRP7wyo7iI44yFRiXeoDcI88WNUE/MVN/P/lwQr3odwAoRNMwseByEkulKbfH1
 ovPPJweBD4g0g4aGLhEtTIi/oIC3lU/FkIB7ZQIMQxYH6MlzP+xBD05MDtKHyObV3lT7
 zrn/XPB+oePJkNVNfcV4dCuSFrbjkSpkepB43+fTFQZvuqoT0hHq3epgEJvLNUKjOcfA
 8H7Q==
X-Gm-Message-State: AFqh2kq3++gr9yT1QylxhUPrqjCXDOk08CB9+fmdjHyATI3apQ4yM1bm
 LaiWIlgiwKgc2R6nQD9eVXskdw==
X-Google-Smtp-Source: AMrXdXsJ0m/97aVynDeLE7IqzpM0poVh8LjguayKFOqQHlEGZh0ZOPUmbyS7c0lTS5+NBw51oPXayg==
X-Received: by 2002:a17:903:2441:b0:194:4483:bff6 with SMTP id
 l1-20020a170903244100b001944483bff6mr18933584pls.68.1674162387029; 
 Thu, 19 Jan 2023 13:06:27 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170902710400b0018bc4493005sm11099059pll.269.2023.01.19.13.06.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 13:06:26 -0800 (PST)
Message-ID: <5212ffdc-ee6f-d0fa-46e5-8815ecc118ef@linaro.org>
Date: Thu, 19 Jan 2023 11:06:22 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 05/11] tests/qtest/migration-test: Inverse #ifdef'ry
 ladders
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>, Thomas Huth <thuth@redhat.com>
References: <20230119145838.41835-1-philmd@linaro.org>
 <20230119145838.41835-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119145838.41835-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 1/19/23 04:58, Philippe Mathieu-Daudé wrote:
> This slighly simplify the logic, and eases the following conversion.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   tests/qtest/migration-test.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

