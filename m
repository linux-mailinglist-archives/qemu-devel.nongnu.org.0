Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A09A14E4278
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 16:02:39 +0100 (CET)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWg1u-0001C0-Jh
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 11:02:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg0C-0008Ob-3g
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:00:52 -0400
Received: from [2607:f8b0:4864:20::1032] (port=39818
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWg0A-0002zF-Ig
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 11:00:51 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 mr5-20020a17090b238500b001c67366ae93so3051817pjb.4
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 08:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=GmI+FCWe9wjBBLe1AwZOFnpBW9/+gU8DcVA5R6lmDZk=;
 b=NlndussVrIdXguaEMfFZM3mj5tNoBc1C9/IRCS/HCo1YzONSnFk/8QbkZKNQ4iFtKk
 stLrLRMdJ3VSfCOgjTzTpVqFfcK2r+Izq1hgrJ2Mqcidzp/KMHkjmG5av8R9++MbIaAl
 tfeGs+ZYjcLzQx+yc7no4YpDkbzeh7QiP3qYdYEm4IysU5cHp6ZIVfx6kawVgnSFR7K6
 UWnCcGxdxPYRMPPVz1z8ZbHrtuYXu2CIhoQR9IRg5OIeRmSVE5mjam/8Hg2ReaBxz3kH
 qkOV15Pk02Ghn1fUdM2zV3RA0K2Sitk9aFzy6+nv56kGfeSde110+xwS3nqFJqLQ2gSo
 wdYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GmI+FCWe9wjBBLe1AwZOFnpBW9/+gU8DcVA5R6lmDZk=;
 b=Jf8qgjFMOo6oVsQfnNRFsAeJmkZmFMW6qE/yEysVQoT2YiMGQ8RFX8q2eQmh0HunqR
 8xpXXQ6ovV8mJ1AjwG6u2R2YYQ3Xf0VDZdCPdgB0yZZVnN6DMpCvNryc0w1SlJfNt4w1
 ho/lV0eNenZ3jAnEplcnsDCER6AQ7j1Hh0rZ1uROceadUISe9PolA7dh6LZY3MKaiJVS
 d+I+I0dbEeL0l+SBWzMn7R1NOa+JdrJEZI9nHCwGMqny1lTjIpH09EclmY3nPAKqbmlw
 cFoyNjeCFA1HPal7XrkvPDVXXYzBbCP/T1072NcCcZxWQpaajRtCHdbc86R9+JknpwvA
 HDhg==
X-Gm-Message-State: AOAM531RfaPNa8GpAhUtniMOQXyR49l+4SzACjWLE8cdrNiG01ncrH0R
 NG2pZX3NrOMXbteJJd2sbQT+Kg==
X-Google-Smtp-Source: ABdhPJxdM1LhgZ5F0d2Paee/7ahZ9LtyNW+bKMq2KmBs40qPAx8lx4d2Y1b4PPXSreVSUC4MZbnV7w==
X-Received: by 2002:a17:90a:c083:b0:1c6:a164:fd5d with SMTP id
 o3-20020a17090ac08300b001c6a164fd5dmr5579861pjs.8.1647961248981; 
 Tue, 22 Mar 2022 08:00:48 -0700 (PDT)
Received: from [192.168.10.94] ([152.44.200.141])
 by smtp.gmail.com with ESMTPSA id
 3-20020a17090a1a0300b001c5d05622fbsm3167718pjk.33.2022.03.22.08.00.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 08:00:48 -0700 (PDT)
Message-ID: <3a26879d-d6f7-1f2e-bb2b-e8ee6a005fa9@linaro.org>
Date: Tue, 22 Mar 2022 08:00:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH for-7.0] hw/intc/arm_gicv3_its: Add missing newlines to
 process_mapc() logging
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322102824.3474956-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220322102824.3474956-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/22/22 03:28, Peter Maydell wrote:
> In commit 84d43d2e82da we rearranged the logging of errors in
> process_mapc(), and inadvertently dropped the trailing newlines
> from the log messages. Restore them.
> 
> Fixes: 84d43d2e82da ("hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field")
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
> index b96b874afdf..d9c741f5fdd 100644
> --- a/hw/intc/arm_gicv3_its.c
> +++ b/hw/intc/arm_gicv3_its.c
> @@ -524,12 +524,12 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
>       trace_gicv3_its_cmd_mapc(icid, cte.rdbase, cte.valid);
>   
>       if (icid >= s->ct.num_entries) {
> -        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
> +        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d\n", icid);
>           return CMD_CONTINUE;
>       }
>       if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
>           qemu_log_mask(LOG_GUEST_ERROR,
> -                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
> +                      "ITS MAPC: invalid RDBASE %u\n", cte.rdbase);

Should fix %d as well, broken with the same patch, 84d43d2e82d.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

