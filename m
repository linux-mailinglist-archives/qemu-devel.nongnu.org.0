Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADB36B2AC6
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 17:31:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paJAO-00068g-79; Thu, 09 Mar 2023 11:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJAM-00068M-2A
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:30:54 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1paJAK-0002qa-4F
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 11:30:53 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso1649028wmo.0
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 08:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678379449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Th5JE1hUTXRn47Ez2DkSnujoHrgBkgzMYBLghKSoLYM=;
 b=enHUPChBumsaB8cgZwT+ShTiY4ZVYsuiFfb3Q+PjuJkaaStRnt/8Y4upEI5RI/ZF39
 x9Gl5DByMoiCo4+A2ywVHU0zUoBeoSKE4VoYEymUATjaBt22wPsDRwbm2WRqubYB5mr5
 z0cfo+/n11L2FktMHFP1tZkJTsaX6ppSeUrhPDm/rakAMpHpAF1g1GtxnD5hJ0P2kZqn
 UIiTVcgfpM4wuq8EQd7KoP0MWiWF77XeaTlp5CfBMryVgTTMPm2QZzNpSvr/c9nrrPpq
 sNpu58RsSGYvmpSjAyRAnRPp546Fz286b7JMDunjbhu/35kARQ8rS78p4vlE/BGDLBzk
 yf0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678379449;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Th5JE1hUTXRn47Ez2DkSnujoHrgBkgzMYBLghKSoLYM=;
 b=JRHAu4FRiPyNKLfOGVW+FCdmphx4iyiZgF3GfmXsc0agsSyEqW80/nze+VYXSFd92K
 uQBYtZs0jfLn3bNp+6f8PfvJkUVz+2Rv9kQxQsWiaJBRT1cXIuN9c3OhwJ5dRkXkRQWF
 AJ/k+iueCdvEgyCjrfhVSjX1AJrr3RJtRy5SMHFc27Nf+kqmbKOcXl1N/gmL5pShISCP
 ujlVbAQ1V6CmZRDLL9jKDWKyrWrWTuJ2Z2RBD1t2XJpfNACAhCNIEviz4ixxqEj55nsZ
 ROnvq6ASkB66XIL0ujTEOuv2soZMg1byjJnTOyXIVNz6cY05mhKfvZwpKiWU7sFk7/Nc
 nudA==
X-Gm-Message-State: AO0yUKVrs+aO6Mu25/y5LOjBRAJku6Decd2ALlVgWgEwkDenJiAxz4st
 mZZOVEnA0rgr2nLMH0po29izMg==
X-Google-Smtp-Source: AK7set9vdovsPaItO9hO3xbQiA7Xf9ncTlEalc4Via1UXvBEmO3K5RPDqGazHbbLoSJjWOlJgXQ20w==
X-Received: by 2002:a05:600c:4ecb:b0:3eb:3148:a1b7 with SMTP id
 g11-20020a05600c4ecb00b003eb3148a1b7mr19837736wmq.12.1678379448727; 
 Thu, 09 Mar 2023 08:30:48 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c2caf00b003e8f0334db8sm470387wmc.5.2023.03.09.08.30.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Mar 2023 08:30:48 -0800 (PST)
Message-ID: <995dde78-1a6e-0cd3-d802-87bd9b277362@linaro.org>
Date: Thu, 9 Mar 2023 17:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 01/18] ui/dbus: initialize cursor_fb
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230307115637.2464377-1-marcandre.lureau@redhat.com>
 <20230307115637.2464377-2-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230307115637.2464377-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/23 12:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Or else, we may randomly destroy some textures..
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   include/ui/egl-helpers.h | 2 ++
>   ui/dbus-listener.c       | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


