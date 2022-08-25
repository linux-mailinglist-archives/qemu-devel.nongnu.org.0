Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 880D95A158C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 17:25:22 +0200 (CEST)
Received: from localhost ([::1]:56530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oREjR-0005Ma-5n
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 11:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREhH-0003Oy-Sy
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:23:07 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:56101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oREhG-0005DB-4u
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 11:23:07 -0400
Received: by mail-pj1-x102d.google.com with SMTP id pm13so11744742pjb.5
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 08:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=iameHqBelA9xxeSH4cOGesEMxtnS6edYLqzqccbR/I4=;
 b=ULiC4A5TAhATJ4/FE+mOta3+i4hDLR7gBqe3u6vyMLThYBSX6a6ZtkCiljnD7oc4Ir
 DToTsresB+/xjlUYX8/uwrdyFSeDglSPs/7JQIAcYwKo+NY7J2LHPQl5VY5fkaFh3/No
 wd/gqQXL2+CXSLSgaISnFztxF6sNFVh2fgGWs62modwWf3kSERnJYLuiYum/nM2sgKuQ
 q9aZ1Qr6wnWg1YWETPdvXPCnX6BekLTvfUXqYOMeCYmfMt5/9klByg0hBuPyppoWwusu
 LtdKofaHbFyrbaoZztB9X7Q67qFC20rhVA0d0CNCng6i2yPBybLYj9lMdtJjQwGVnAdO
 DU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=iameHqBelA9xxeSH4cOGesEMxtnS6edYLqzqccbR/I4=;
 b=PfpY61PRt0VJkTJ2jUeaVyUvOOvRBYJquV0QZ2ywTNwDjwvm80doB/VKqholF1Yum9
 12fA5/veps4R17ApC/VwSKnIzGGFyPjWyXLscx/Gjx9P4VCK8sOL881Fod8r3scNaOZK
 HXbYapXNUJRaVsUJh4+0CTJIGHaNxQ8yDw3SrMld/zAYIJYA+bc6pexaSo/WBfRS6VPo
 pViG95+Gcbu3W0RGm+Ju3ys56guEL+3QbxYMtV4OumgHglZaO7gUVfbkONLWL/k6jgYj
 /4pq3b9xDKAyiJ1UWS53q2eb/omGv/xvHy0KF3UjtSPksIhrND54VmSP5J6fbV8GY80q
 Sn5g==
X-Gm-Message-State: ACgBeo102mJfU4R78osX3ZCdwY29R/wwrXkWwNdv1E1qfrwUsPNh/y7P
 m++dZ/7zlA/I7dJ83TxePdDXeg==
X-Google-Smtp-Source: AA6agR4j+yiD50Sscu+zwKSQUsi7L/X2c6EqBBgjG59EhXrcllrM2fK+69DY6BKXxFESvS9pKrCLFA==
X-Received: by 2002:a17:90b:1b46:b0:1fb:de2:2e77 with SMTP id
 nv6-20020a17090b1b4600b001fb0de22e77mr14209557pjb.143.1661440984616; 
 Thu, 25 Aug 2022 08:23:04 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:64be:e7c:2851:ce4b?
 ([2602:47:d49d:ec01:64be:e7c:2851:ce4b])
 by smtp.gmail.com with ESMTPSA id
 mz16-20020a17090b379000b001f50c1f896esm3694848pjb.5.2022.08.25.08.23.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 08:23:04 -0700 (PDT)
Message-ID: <08249dfe-52b9-3048-e6c2-2be0414b10d6@linaro.org>
Date: Thu, 25 Aug 2022 08:23:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PULL for-7.1 0/1] aspeed queue
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20220825085710.34800-1-clg@kaod.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220825085710.34800-1-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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

On 8/25/22 01:57, Cédric Le Goater wrote:
> The following changes since commit 9a99f964b152f8095949bbddca7841744ad418da:
> 
>    Update version for v7.1.0-rc4 release (2022-08-24 19:27:56 -0700)

Too late, as you can see by -rc4.

r~

> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20220825
> 
> for you to fetch changes up to 7ccff968f65cfad573bc0015cb0ab800d4337a6e:
> 
>    hw/i2c/aspeed: Fix old reg slave receive (2022-08-25 10:46:42 +0200)
> 
> ----------------------------------------------------------------
> Aspeed queue:
> 
> * hw/i2c/aspeed: Fix old reg slave receive
> 
> ----------------------------------------------------------------
> Peter Delevoryas (1):
>        hw/i2c/aspeed: Fix old reg slave receive
> 
>   include/hw/i2c/aspeed_i2c.h | 1 +
>   hw/i2c/aspeed_i2c.c         | 8 +++++---
>   2 files changed, 6 insertions(+), 3 deletions(-)


