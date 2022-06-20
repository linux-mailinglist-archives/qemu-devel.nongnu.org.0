Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5575524A5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 21:39:01 +0200 (CEST)
Received: from localhost ([::1]:49444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3NEi-0000od-Cp
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 15:39:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MzY-000474-B1
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:23:20 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:41875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3MzW-0007Py-O9
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 15:23:19 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 g10-20020a17090a708a00b001ea8aadd42bso11213901pjk.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 12:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=vcH3D8ORIUk+caI/YcF0fm1BdgBq03NGayjULhS0QKs=;
 b=cAGyaUF83BywHebhI72SSjvvnc/+faAanYBypVG3+HETPEAFQyYfA3COGpcL89WuFx
 TLulcVTnTJaYLKjsaXa7eJ+vxCgqr8Qr/U1St8e2dBfBm/nhr+jgyYYnqDp0o2ZFPRh1
 wqMHskQzTi1Pd4hUU3MIdCWZZ6e0nexb/2KxGrjXoeEGBkjULg4B+9P50lale8MSd//6
 bzfxmsI2MdpR33FTiMWvSYdROKI3hzkt4rofkEBfbrWe+ASOWf3F660oghgquLU5a7GI
 qPfYYl8kM7fpXiP3ABNDr8mxgbaV/U/ElMvRzm9XT+Gk1/SQiBGj1zvpikqNKRzGPuhf
 HAOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vcH3D8ORIUk+caI/YcF0fm1BdgBq03NGayjULhS0QKs=;
 b=OePD+PllQiKidevSJwPx4AXwTD91kKsmq73zRnAmQQ0dn3EMipehvjyqicc0RXWNwH
 hbcDWgrwmG6gtUYbR2eP3YCC3V2yE0HPL9eUbIjRpQqDwzahYVlXnTA3aaUXUhDjoDaS
 L9VhWN+kWjdqj7gmlkEj9MgfyqvRzjsRviS3RyaoihY3+SNV7o/CmwU+s9z9ZsMkXwE/
 bxUxvkElB5vPgLanvMV6Nn+IxIBDwa63YE9te5S/dh6mwY3AcK964NjdfPnFyXLBd4n0
 uK2V1Y4FH4ZvmAIiEYtjbobPrk5Az1Apn6aGVV/bGxrOSe9TwlX8q+NvN0qjGf84wbUO
 SEUA==
X-Gm-Message-State: AJIora+Kp0sKOATAAqKDrabVwTFiO4y2Qt6IOiRZZ37vh1tJKeznrRjG
 eMeHOrzyHIN145FOPOptuqcqXQ==
X-Google-Smtp-Source: AGRyM1uE+ZqVRQZ8ffKJFoZ1VloTMThjGSMkyXHultuE+Aa1PDsgF///NzukGlFPtwo2zK71bX3Qjw==
X-Received: by 2002:a17:902:d650:b0:168:b027:1a58 with SMTP id
 y16-20020a170902d65000b00168b0271a58mr24930270plh.60.1655752997350; 
 Mon, 20 Jun 2022 12:23:17 -0700 (PDT)
Received: from ?IPV6:2602:47:d49e:3c01:a3e0:8a80:7b85:aea6?
 ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a1709026bc900b00163bddfb109sm9138947plt.10.2022.06.20.12.23.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jun 2022 12:23:16 -0700 (PDT)
Message-ID: <f34ef8a6-1a97-a125-b59d-042de7892f6f@linaro.org>
Date: Mon, 20 Jun 2022 12:23:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 09/10] bsd-user: Implement pathconf, lpathconf and
 fpathconf
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>
References: <20220620174220.22179-1-imp@bsdimp.com>
 <20220620174220.22179-10-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220620174220.22179-10-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/20/22 10:42, Warner Losh wrote:
> Signed-off-by: Stacey Son<sson@FreeBSD.org>
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/bsd-file.h           | 32 ++++++++++++++++++++++++++++++++
>   bsd-user/freebsd/os-syscall.c | 12 ++++++++++++
>   2 files changed, 44 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

