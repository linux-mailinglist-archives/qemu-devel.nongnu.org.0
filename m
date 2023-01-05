Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372BA65F6E2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 23:34:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDYcJ-0000tV-FA; Thu, 05 Jan 2023 17:21:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYcE-0000sC-Cx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:21:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDYcC-00086g-Ie
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 17:21:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so2424333wms.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 14:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mic0+BXRVfs/ZmEr3GX2+ibmm4HSM+41CoqO2kVroes=;
 b=X4YDm7yp9Siy9ipFQH3vOFD1Xu0NlZ7xJ5f8ToHKHQzOobUUpLnQ8jLG56SMkzZPNV
 s5sil1qr1HfQulCAj1MH2aqCtxGi5BQhavoVoiwpFugW0F7kFus1ADlqcnRYQ+rQKBmg
 RPdDbt6jLk7gtdchPIIO0HCZ4O40DxIWo3Cqo8sLLyms2iZB99Dlt7/ml7MZmFApjZ72
 9aPgUYHEIiTboIjtu6O5ZjSxjhbTnl/sfRAycBBHI21kXdXN2GV7kMG12em7KePQOBdi
 UaZShczZa5nEZZObn1Em7sbvEmCOSboODIqXHq77s79ddqdjbJDOp/fn/jHizBS8xka+
 i9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mic0+BXRVfs/ZmEr3GX2+ibmm4HSM+41CoqO2kVroes=;
 b=jb4eQL8gSHW89ebmZHLGWpwyTSjZLHTzrw0iHLYjhx/jlpH/xrSbilducK32L3rMSW
 v4wcecVkw0nzHtpWp7m2nLnTBFRcAnnAfTF09YrpCNe8YGLKx09LnxV5LoUuhclqZwRp
 4Y2ptwzsgalAgq3qBg1YYPu7YS5/5DykvUNl2hD/g/SOXftZ/iqE7/meRthvXlRZrJqP
 UyZzF4TjuZ5Ys/Zejy58dnYyT+mOJBl+sR+GZTXW0JR4kDTZ4y8Wfe8UT0/FIK487+Tc
 Dw7cRrTjqaFRnu11PT4DeKyWiiwErB/1DbgpwGAMwSjr+r4tb43IdFVxycvtFbcRPd+2
 iWLA==
X-Gm-Message-State: AFqh2kpKp5nsEbepiHm/Dmnt5JzPipiOB29I4aUeKpbCDfLFI3ttuyCh
 bX6/BvHtBAEvTjeafhqYCVwGMw==
X-Google-Smtp-Source: AMrXdXsnW+lQtRkiggNhDCqNfRNznMtfTGAGmyJrtyuW1oYeup2VIAxOvsFGxim3EU7YySQvXMAeLw==
X-Received: by 2002:a1c:7216:0:b0:3d3:49db:9b25 with SMTP id
 n22-20020a1c7216000000b003d349db9b25mr39311370wmc.26.1672957295309; 
 Thu, 05 Jan 2023 14:21:35 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c510900b003c6f8d30e40sm4513825wms.31.2023.01.05.14.21.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 14:21:34 -0800 (PST)
Message-ID: <7975336c-c80c-04ff-24e3-a5a339ba0305@linaro.org>
Date: Thu, 5 Jan 2023 23:21:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 33/40] target/arm: Move "cntfrq" to class property
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, berrange@redhat.com, eduardo@habkost.net,
 armbru@redhat.com, ajones@ventanamicro.com, alex.bennee@linaro.org
References: <20230103181646.55711-1-richard.henderson@linaro.org>
 <20230103181646.55711-34-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230103181646.55711-34-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 3/1/23 19:16, Richard Henderson wrote:
> With the movement of the property, we can remove the field
> from the cpu entirely, using only the class.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu-qom.h    |  3 +++
>   target/arm/cpu.h        |  3 ---
>   hw/arm/aspeed_ast2600.c |  6 +++--
>   target/arm/cpu.c        | 50 +++++++++++++++++++++++------------------
>   target/arm/helper.c     |  3 ++-
>   5 files changed, 37 insertions(+), 28 deletions(-)


> @@ -2320,6 +2318,14 @@ static bool arm_cpu_class_late_init(ObjectClass *oc, Error **errp)
>           }
>       }
>   
> +#ifndef CONFIG_USER_ONLY
> +    /* TODO: Perhaps better to put this check in a property set hook. */

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> +    if (!acc->gt_cntfrq_hz) {
> +        error_setg(errp, "Invalid CNTFRQ: %"PRId64"Hz", acc->gt_cntfrq_hz);
> +        return false;
> +    }
> +#endif /* CONFIG_USER_ONLY */

