Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7746B6FC946
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:41:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOWH-0006kN-42; Tue, 09 May 2023 10:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOWB-0006Sj-Lb
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:46 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwOWA-0000iH-5y
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:40:43 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-306dbad5182so3820870f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643238; x=1686235238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vCvRusGfcWdrz96aV7B9WcqfyYwNN+N/9pd6x/tT/xE=;
 b=G/RvIxdcTSu/WB8gzqxA3LTifn5D42XRVVpbFebPinGxiGjX5ANxD+v12xVNN7Z8Mi
 3LmekJ9sSpAiK6eZJRQnoWkP3nImJJnpkdk8V0OU40J3n5OWP6De4TBJBPAi6CiDe5Jy
 noZUcdmWQL6engtpyfEKIQ5EbSjFbDkFENa2es1nhBEftdxm3P+nVuUcfLaV1vk7uvPx
 PB/x6lI2kL5Xtg8gaZtDcuCCKNZAVwALyS2Kef5GF9m1j9wl8spCvJIVA0Ola2mUeZHU
 LvbPJjLoxDaCodAzzRbOuDzYBX+8ytIBCLV3T5qyzQKfkfT3D4NGVsrNrNKg8W5GiWh2
 DlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643238; x=1686235238;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vCvRusGfcWdrz96aV7B9WcqfyYwNN+N/9pd6x/tT/xE=;
 b=fxnpO+M74wc/S1VQeT2PG2QBx2Vm3F5NBjO7KpJh5FvxabCPTujIASAaSxIfv66Shw
 FTiGLutpxejiEgLtRmyzIf+mbCB+MGoL4F4yzS1Bkdfa9gCQ34eHBjv1mK8P7+T14MLO
 XHYE/rtkAp6TB7OHFiGzv8gQibRkVbpvPv1JfKWmHaARtEnwcWDUi0tPgOGlZ7u9zbr9
 J9ZZU6g9X3JyuXmGSSXaz5gdZpuoGyZwbBgQR7wfyL7SZkn/2sX1A10gMKZTcTYu7tF7
 AN6CSgXGS7rHUPSywwNYajOp96WElH8YH3Mw/nDd2yw4f7Ey96L4xZ19Xwipz3p3zBNF
 HJCg==
X-Gm-Message-State: AC+VfDzRSQLbEgjYWTiligPOTBGDUPsLssLlZvSUKyH49GTcdvTVfrzu
 q9bJLf8dTX7JCS/fcTDkcn6VEw==
X-Google-Smtp-Source: ACHHUZ54nhTBKiY0pKdSAQILSqyS/76klJMztLlj9TMdFufaReiRCcjH5IZSqZoJ5d1sTusCmGe2XA==
X-Received: by 2002:a05:6000:d2:b0:306:3afd:ed8f with SMTP id
 q18-20020a05600000d200b003063afded8fmr9389943wrx.25.1683643238476; 
 Tue, 09 May 2023 07:40:38 -0700 (PDT)
Received: from [192.168.11.23] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a15-20020adff7cf000000b002f6176cc6desm14614071wrq.110.2023.05.09.07.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:40:38 -0700 (PDT)
Message-ID: <44d12192-6083-1064-1871-8e8ca6c76034@linaro.org>
Date: Tue, 9 May 2023 15:40:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230508181611.2621-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.421,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 5/8/23 19:16, Fabiano Rosas wrote:
> We cannot allow this config to be disabled at the moment as not all of
> the relevant code is protected by it.
> 
> Commit 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a
> KVM-only build") moved the CONFIGs of several boards to Kconfig, so it
> is now possible that nothing selects ARM_V7M (e.g. when doing a
> --without-default-devices build).
> 
> Return the CONFIG_ARM_V7M entry to a state where it is always selected
> whenever TCG is available.
> 
> Fixes: 29d9efca16 ("arm/Kconfig: Do not build TCG-only boards on a KVM-only build")
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

