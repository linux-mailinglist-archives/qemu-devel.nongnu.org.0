Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B373167F299
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 01:05:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLYh1-0002WI-LI; Fri, 27 Jan 2023 19:03:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYgz-0002Vu-LO
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:03:37 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pLYgx-0001Ia-SE
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 19:03:37 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso4631593wmq.5
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 16:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2/jUNKjA6fOoQ6tzXSBdPybO4wT1XtuZDU7H9KaMbUI=;
 b=eS8rEpW/tI2iYWCQBIEsvdtJkTgaE8jeOhUIOD6o98gd27mgFhYeyaxKoa7GZVF9e7
 30m90gQrDvkJffv/jCQLf9eKXqKLIEn0JzKsYX0uC0AH/gH6/pX5+uLuuBPpp1rRFyxY
 3E/Z7zbWUbSQ39s1DOoTGLcnMQwnXaGlCa29dqoZD7xnOSr9O/0AbRB/mIEPw+Kq49B1
 1efS9KnRQ3+lYWSwscsfmzDl1DkU7/z5SuQLY1OhdfGLRei2Vz55c5qhVr7Pcoh4Hu4k
 k92fEbMYcSn2vjkjsCBM1ikjX8yMu2lTtc+hpVjyQ/za0BeUJf1O0XncoMwZJgbuWYvn
 CFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2/jUNKjA6fOoQ6tzXSBdPybO4wT1XtuZDU7H9KaMbUI=;
 b=SH8V5iOsqUesGg2BqRczY983ZnlO7I6EQvCk4HnqtGsBokTxqg90bVZhsB4xTbLdaw
 XiJ1Ev08Pi8IBpfanphQhyuSFRIq+dI3H5KpLKfWObQYwx99XT7svw9UB5UhAA9R6gjN
 SyLcX55rLvh9F4vB3s7lYBNi5xiB+kBb2/Wga+Dj4CCu6jgb755GPWx09JwbKGbd6yUx
 YQQpnCKGguw4xKrDFDk5DkNfF66NZTmJPR4/TzEx4SwIWQiXP4V85GhRmKYvOv8hQkfc
 TgkLRMEGXv3VGu1KEWYGBFqSJut3Ul9yEfb13/Bp9W/emslDPwBUBFD9QBCnZiygjGQl
 VdUg==
X-Gm-Message-State: AO0yUKVP/jeyoeDB5vjpJ20rCAoXLqGaTcbf36Bh8EGj0Nmtvo0UOP68
 s6jhEPL0egy1nP4cz1OdNT2Y9Q==
X-Google-Smtp-Source: AK7set8IR82fJWon6NMTsxeey5gM6TNPR0zEluD4EZhtx1CKBFfeaEsU4p/UPSndTa8CPKvRuR+rrg==
X-Received: by 2002:a05:600c:5124:b0:3dc:45a6:ee4e with SMTP id
 o36-20020a05600c512400b003dc45a6ee4emr953570wms.25.1674864213059; 
 Fri, 27 Jan 2023 16:03:33 -0800 (PST)
Received: from [192.168.0.114] ([196.77.14.77])
 by smtp.gmail.com with ESMTPSA id
 h20-20020a05600c351400b003dc1300eab0sm10193732wmq.33.2023.01.27.16.03.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 16:03:32 -0800 (PST)
Message-ID: <9e8629c6-bafc-08c9-7092-d9b7dffda6eb@linaro.org>
Date: Sat, 28 Jan 2023 01:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 02/16] target/arm: Add confidential guest support
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org, richard.henderson@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-3-jean-philippe@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230127150727.612594-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 27/1/23 16:07, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>    -M virt,confidential-guest-support=<id>
>    -object guest-rme,id=<id>[,options...]
> 
> This is only the skeleton. Support will be added in following patches.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   docs/system/confidential-guest-support.rst |  1 +
>   qapi/qom.json                              |  3 +-
>   target/arm/kvm-rme.c                       | 48 ++++++++++++++++++++++
>   target/arm/meson.build                     |  7 +++-
>   4 files changed, 57 insertions(+), 2 deletions(-)
>   create mode 100644 target/arm/kvm-rme.c

> diff --git a/target/arm/kvm-rme.c b/target/arm/kvm-rme.c
> new file mode 100644
> index 0000000000..22aa3dc712
> --- /dev/null
> +++ b/target/arm/kvm-rme.c
> @@ -0,0 +1,48 @@
> +/*
> + * QEMU Arm RME support
> + *
> + * Copyright Linaro 2022
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/confidential-guest-support.h"
> +#include "hw/boards.h"
> +#include "hw/core/cpu.h"
> +#include "kvm_arm.h"
> +#include "migration/blocker.h"
> +#include "qapi/error.h"
> +#include "qom/object_interfaces.h"
> +#include "sysemu/kvm.h"
> +#include "sysemu/runstate.h"
> +
> +#define TYPE_RME_GUEST "rme-guest"
> +OBJECT_DECLARE_SIMPLE_TYPE(RmeGuest, RME_GUEST)
> +
> +typedef struct RmeGuest RmeGuest;

OBJECT_DECLARE_SIMPLE_TYPE() already forward-declares RmeGuest,
otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


