Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73B16E8D79
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 11:04:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppQDS-00065s-17; Thu, 20 Apr 2023 05:04:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQDM-0005zy-Er
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:04:28 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppQDK-0001Tj-SN
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 05:04:28 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3296813wmo.0
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681981465; x=1684573465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=X34+LUTFr1MxHIk45fFuqYJt5/kbuguKamHuiADW7YE=;
 b=eX2VH8e0rwI3jLJarBMPpgyZLZbgP1ZjEcEZc6TMdA9pJjLiNliPB6pgXO+BZUffS6
 HnxiGWAo8whjePZRQhpP5ZO74+RMMuaAMQgHkw+umIcSi6D7c//m3bmBcbsz3GAUD78R
 veeScQOQ1GIPaEwtnpbjfcM1P1KFTNkVSSFbGxk4lm+zjxIjq/JOKiMhczNzbfwgNQWk
 osek45lSdgyIcrbHOOjRTcnLtB4PHmgydX1QLjDAtto/oyyDY/EDT5PuWRNMtxWv5DdQ
 R69bsZGcwpRHSmzJKsFUHRE1fpjH6HTBCun6c/OtP65ZfsBiiCj0ubQqWyb0iQXJxcnP
 EV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681981465; x=1684573465;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=X34+LUTFr1MxHIk45fFuqYJt5/kbuguKamHuiADW7YE=;
 b=iR0ih9KpDk/UouKpd2tJjFJ4tWY1iFzPVIGUZAHuCdiyGVvv9U0OB66hTR00n0Njdx
 1QRUjGaVCfCllXlGoXtbJUoPAEO17E7J4NrqXUH7SOZMsSK9elMyd6DG64Vm9zt6yxL5
 jpM+mfOiFsfV8JtZ5eGbEkhM5XrEoOs0FWZeKp8AWrkc3eYeW5TeA4vAu5BiY4uvSO5V
 96qLjaSF3VkAirN5DIAVpkiguMWIG7ve86adNlHQI+6ofnHO8Hk1LQ0XplJpdfcxkbXO
 pkXJsFXfWkbXn0czIS8PiDCxJgiV3UjS/QdnSfK3nLDWeTZzTT4V+86s55SW9FaIhx1s
 +eEg==
X-Gm-Message-State: AAQBX9c7TnvHgtkqfg6a2PcLOyXqh0NZFreDPMwfEhUn80+H9TSfwg8X
 jNo8lu7MTaLtw+qD9UftsqF9PQ==
X-Google-Smtp-Source: AKy350YYDWX+HrT4vmWQ1c/kW6KcQ6uaff0Zwm7revEL+oYRFCwSrWiIpsJjPU7qMaa/DryzjLu8pw==
X-Received: by 2002:a1c:720e:0:b0:3f1:6faa:d94c with SMTP id
 n14-20020a1c720e000000b003f16faad94cmr667490wmc.16.1681981465168; 
 Thu, 20 Apr 2023 02:04:25 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 u15-20020a05600c210f00b003f17848673fsm1380553wml.27.2023.04.20.02.04.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 02:04:24 -0700 (PDT)
Message-ID: <d0f88cbd-284e-f55b-4e34-25dd11a31565@linaro.org>
Date: Thu, 20 Apr 2023 11:04:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v3 09/10] qapi/run-state.json: Fix missing newline at end
 of file
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 libvir-list@redhat.com, Markus Armbruster <armbru@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>
References: <20230417164041.684562-1-peter.maydell@linaro.org>
 <20230417164041.684562-10-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230417164041.684562-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.597,
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

On 17/4/23 18:40, Peter Maydell wrote:
> The run-state.json file is missing a trailing newline; add it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> Noticed this because my editor wanted to add the newline
> when I touched the file for the following patch...
> ---
>   qapi/run-state.json | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


