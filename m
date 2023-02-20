Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA0069D3CD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 20:07:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUBUj-0002wc-3m; Mon, 20 Feb 2023 14:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBUh-0002tu-1W
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:06:35 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUBUd-0000xp-Ee
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 14:06:34 -0500
Received: by mail-pf1-x430.google.com with SMTP id fd25so287721pfb.1
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 11:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VL/N0M/IaCwowRk1oS8ozeiIXvHnRHocpTP75PytFnY=;
 b=pUq4wdk0bDb31vj+YerQ/Y7WW5iuf8cIbIoZsZYrSFqzRIUs/xWPY5ejIQnUHgnQGv
 jLZFWeq60br6+nEK/h105oRhocuv36ql408Iefrzsp0cO3jql1gBLWLq29E1aYNSG8BU
 780iMlVjT2E44BdFi0XJcs5JaVV1cG9sA4geDZhzyQlF0uoXLNDWh8+D21AlVDhsWDdM
 ob4BiFpsbOpWPR/1FpP3poOFtB+h+dCkMC7LmQdyc3qeyDr9/uWEHb49PuGKlPf4lAf1
 VVFpRFZCY5dgPL0J2pDizX+yKEcH4iy8uR5C6yTNVJM3A90TfKSlbJQN6V6CjR6BwQDC
 GNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VL/N0M/IaCwowRk1oS8ozeiIXvHnRHocpTP75PytFnY=;
 b=ZpK8XxRemT+m5mH38bf5tuLNEeA+b0/EQACraNiPqr17XnW9+zwoj5mHAJkO6HsETu
 5pnYaBUzvBfDocRuoa1tv3cCFlqFSWp4M7+a5x1MA6yDBy7Q0G88U06aWSZzSrYZ/wB2
 ZblZcMoYOGJsT5roBe5lougRq83RjctyOaEDBxOin+eVr5RwmXv1TXS46jn1YI65Q3r4
 8Jmon2Vhlr63XEALkTDuSy8q4T8epbGjlWiu/cRWePnF8a9g/gTF/0SGixBd5IrYv59i
 2lvXPL/B/MRcsxnhQD985MbYA/2AOivqaB7n3GKnxsMHJdoHzIVnkH9rKh8lKeFUTflE
 wtUg==
X-Gm-Message-State: AO0yUKUWeNVzAfVPkYGNA7gAAxo67+Dm0IQqMAgOgwJ+0lfmwjIQQoAI
 FI7ToDT/cG7m5itc7TVOEl2wug==
X-Google-Smtp-Source: AK7set8Hi0EWHKdXSo0bYqkcCKqlegCsMg82d12Y9K9pPu1zzB+88VogZYo1QAYM/QMzhxCLTIclOg==
X-Received: by 2002:aa7:95b9:0:b0:5a8:aa1d:30e9 with SMTP id
 a25-20020aa795b9000000b005a8aa1d30e9mr815301pfk.18.1676919990073; 
 Mon, 20 Feb 2023 11:06:30 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 r11-20020a62e40b000000b0059416691b64sm8307635pfh.19.2023.02.20.11.06.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 11:06:16 -0800 (PST)
Message-ID: <c6191066-aad2-7457-0090-57f0ba232f63@linaro.org>
Date: Mon, 20 Feb 2023 09:06:13 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/5] hw/audio/ac97: Replace container_of() by AC97() QOM
 cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
References: <20230220131837.26292-1-philmd@linaro.org>
 <20230220131837.26292-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230220131837.26292-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/20/23 03:18, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/audio/ac97.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

