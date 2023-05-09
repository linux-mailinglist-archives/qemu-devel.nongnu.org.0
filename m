Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B636FC97E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:51:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOf3-0002qf-Q7; Tue, 09 May 2023 10:49:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOes-0002oH-Hd
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:49:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pwOee-00026r-IR
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:49:30 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30639daee76so3884523f8f.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683643767; x=1686235767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dK5ac7kkFz/UOnHQVKeOY33TI5jVnA/U63q0XWmNm/0=;
 b=IvZ99HMMiYUa/XaTYS4SLk3GgO03yCxVLzgmrGXrFA6fTOvB3uL3bAXjukr6eJER9r
 j2zG5vb78pnAHvvxlLoowtUYgowhxc0eJqhhZDsvilfPg/xyKkemZjnUV74wOu4Y3dKK
 IvLpgvEKURhHRh8XBzY2zSTapvxn6dXLMDPSZwgY14UIlok89lokE7gr6kAnlgUcfdRh
 TW9QNvLTuj3u+2xtP8OANkzGn7d3zjk9dbeQTAV06GfeBxpcO1n1Zrvn+dU9fjVADZXf
 uOS0WvhclfcIxohUB2CHr5UkYS76tDIAp8vAkbOnSgu3M+PP//jFCyt46n2YwCdlMnFs
 AqHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683643767; x=1686235767;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dK5ac7kkFz/UOnHQVKeOY33TI5jVnA/U63q0XWmNm/0=;
 b=PiTgg+qpPOOvhuRp8XyIekNdTAwgAfZWsFUT12NtLGZqrUE5YOdjIKuHrORL38KygN
 GISwQTAGzBP7nA1R1ftdL//0Zs44ZGD+QOfKAneQZmmnbwfDs7sQnnuUzjGLyMMCdSua
 FMrjPdbn1VFMb2cLu1P+2MerGTX1SCchJaStbQVsY8dIKZAPrJ3ks/ASF4ke90xRMqYa
 +ykJGCikfdX1aVCe9foUK7SYV6au2n9VeMGf9VlQrfX4+ShuHF4ptvi8vlmvk2c9xcxl
 ckXuAKnQgnKWr43cP/p6f/g4H+BI+XG/UioFbgO3fACQqIO1HqMENelzugZPy07+xHMD
 O9XQ==
X-Gm-Message-State: AC+VfDx6c5FXHJaBv7ra19Z9wQfE8H9Q1keufheo2Mk78lMWwkEvtSXm
 JOLFXwfgIzETeGmGTK3iZUrdvg==
X-Google-Smtp-Source: ACHHUZ4Hes/u25N4RLNIHrCBYePMNuD3TeiE2hG2eAY7ofEONI9ljNVQjRGZlhibduouIgQnjPIMLg==
X-Received: by 2002:a5d:678d:0:b0:307:95d1:d7d0 with SMTP id
 v13-20020a5d678d000000b0030795d1d7d0mr5118601wru.39.1683643766875; 
 Tue, 09 May 2023 07:49:26 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.211.62])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4091000000b003078a3f3a24sm10806359wrp.114.2023.05.09.07.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 May 2023 07:49:26 -0700 (PDT)
Message-ID: <d51de29f-a23f-be79-049a-f15df2be7ac6@linaro.org>
Date: Tue, 9 May 2023 16:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH v3 2/3] target/arm: Select CONFIG_ARM_V7M when TCG is
 enabled
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230508181611.2621-1-farosas@suse.de>
 <20230508181611.2621-3-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230508181611.2621-3-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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

On 8/5/23 20:16, Fabiano Rosas wrote:
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
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/Kconfig b/target/arm/Kconfig
> index 3fffdcb61b..5947366f6e 100644
> --- a/target/arm/Kconfig
> +++ b/target/arm/Kconfig
> @@ -1,6 +1,7 @@
>   config ARM
>       bool
>       select ARM_COMPATIBLE_SEMIHOSTING if TCG
> +    select ARM_V7M if TCG

Probably worth a comment mentioning this is temporarily
required until <some magic happens>, so we won't forgot
to remove it.

>   
>   config AARCH64
>       bool


