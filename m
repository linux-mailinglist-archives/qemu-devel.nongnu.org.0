Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CBA6F037C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 11:38:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pry49-0006RI-J6; Thu, 27 Apr 2023 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry47-0006Q9-5R
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:37:27 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pry45-0005bW-EK
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 05:37:26 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f3df30043so1334127366b.2
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 02:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682588243; x=1685180243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qm8K0+YG4jDGmH9ZVQnOryv5ahEcOVMPw0WM30T3QbA=;
 b=i3bheFKK76kITEwkNwTWBXpnBO7YRVcqF9d5erGhCn17nc+OxzacDuxFRETr32fkDJ
 x68mM9GM8nGgxIYXC8vSiKww1Or9/nsTYRtKAwrxYCUNYMqVvtRGxWp0/j7JL0LDAIkl
 dZemIkX5pJlA3DDUVPGB+zKr8JVoL5aoR7BcVR0wxL1okRkuQ8rktFl8gkoNsb8jyH/6
 IxjhIES2XfoTroajb2SK+P3lWvFqkYAPiYWpoYTlQ+2dJbYP2aLCL2hcOlLu1dWSV2+C
 81oVJGKYxHLHp0vBJl6L4MZvbW6GUMYi9wM1Vv+ZXTlJG81h5XJ+DTdc9a8gbpFxQpKu
 xRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682588243; x=1685180243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qm8K0+YG4jDGmH9ZVQnOryv5ahEcOVMPw0WM30T3QbA=;
 b=Pq5YwizKSMzPcPQLJVMwf8WY4NFbapCnCh6bcLIOR2wepd6Utu/w4Womg1ZekNEegc
 /JHwK1Ho7NzsryWavO2pyon7JzEoMH/LPyKdG6qR7NJuhWJMR0X3N96Gb3byqJ5jITr3
 rTbdRVuKNclLVsH4YOqDWEWkr987pdmsZKM7CimD6VYFMlb5FZ7taIQdQtuU8/BfU5tO
 W2Saf6xpMIdkUQ95Z8+XzpazGpdSJW6ziqc+k+BqkGUARtjAmYQ/mQDg5OUWONrTrurr
 F2pgm/ur67FXm2XkQ6Q41vxCgJmTfqs9BXWNCqMs1pyWufzQV8Wh6rVmIMEXpIIwgbXp
 kSrA==
X-Gm-Message-State: AC+VfDwtgG8CYPIDvWwFfr2LlWEFhWILEDMrjOm7a5NL7bYegP2G2vyS
 WI1ntv7PLfZ3YF4y5lKTpI8eIA==
X-Google-Smtp-Source: ACHHUZ6v9f7VynQCJkd/E4HV6GqS2TjppvjhYqO0FKpqPP82fDwOPYfVE3ni34OZ3a3Q6hC582jp8w==
X-Received: by 2002:a17:907:16a9:b0:94f:5242:a03a with SMTP id
 hc41-20020a17090716a900b0094f5242a03amr1222869ejc.63.1682588243263; 
 Thu, 27 Apr 2023 02:37:23 -0700 (PDT)
Received: from [172.23.3.19] ([31.221.30.162])
 by smtp.gmail.com with ESMTPSA id
 pv4-20020a170907208400b0094f49f58019sm9313859ejb.27.2023.04.27.02.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Apr 2023 02:37:22 -0700 (PDT)
Message-ID: <9b03b69a-bfea-83fc-cbf9-c3c61bf73608@linaro.org>
Date: Thu, 27 Apr 2023 10:37:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 04/13] target/arm: Do not expose all -cpu max features
 to qtests
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-5-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230426180013.14814-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62a.google.com
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

On 4/26/23 19:00, Fabiano Rosas wrote:
> We're about to move the TCG-only -cpu max configuration code under
> CONFIG_TCG. To be able to do that we need to make sure the qtests
> still have some cpu configured even when no other accelerator is
> available.
> 
> Delineate now what is used with TCG-only and what is also used with
> qtests to make the subsequent patches cleaner.
> 
> Signed-off-by: Fabiano Rosas<farosas@suse.de>
> ---
>   target/arm/cpu64.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

