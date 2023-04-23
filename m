Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A03106EC171
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 19:44:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqdkL-0000jG-UV; Sun, 23 Apr 2023 13:43:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdkJ-0000iM-Bb
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:43:31 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqdkF-0000a1-KR
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 13:43:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f09b4a1584so23480675e9.2
 for <qemu-devel@nongnu.org>; Sun, 23 Apr 2023 10:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682271805; x=1684863805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZSi4ke+tXRGzo5Ctj3aN4P5PuYQg00uZmQOYP7MLN9M=;
 b=nTm9jPZe04VyI8fJNXzX+QCo2oVfTjm7xSugc/R7PBiKXHrswiz5Ejbson2Y1J8rZ5
 ZOFjz1rbPvje2bsG2xyL4etBKIwW8WY2tLrV1FVKI8XIr7jeyE0G3Z/snXelhcit9LqX
 DEJfY15CUAM8GQmtMujEtZE3/MRM4Z8XIZpzj28qUh6UP2DwTptexaGm6Mnq+Aek5euS
 Qd318sxUzyC+MCC38Ji82yT9lkrxXL++XEGjBOM6zzTr1nOu7KxLXFNajshRlAsJkhES
 TvYU1O09xTWQZI20oZmIzP3of0RdvzhGa9ZP7ns+YnP/OaA7y8YGQdzSawGRhqeL988C
 GE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682271805; x=1684863805;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZSi4ke+tXRGzo5Ctj3aN4P5PuYQg00uZmQOYP7MLN9M=;
 b=LcoLZuh4sowsE1lrDOEAOH88IAmdmOV9eIZgpv7NM56cisrNz6/MRfvZ9Yeaiy6Pkh
 UdCbDtBMDe3McSc+Yi//RDVzEd+AQBDUhXaUKD9ECDMlWZiFGd+DBqBOhPzyDQGf3rqn
 mG/kPEnK0ugX+QY8GMtJBeB9E5UaIvgdpGGWZMk3WiBiVKOHbEcTfs45/IYn06CfwSpe
 SE1Kz7x2AeuJaSw3Br3yfVlE+8SH17JTQXLIoGFLT7EGkmO51qREioElqy0/stbI/5sO
 c2EvItLgVIb4cAMqcqayVKBgFUPJasWjCQ4WoIvBeshxPgpMk0Ew7dUVQh7LA1DRRck4
 m8qA==
X-Gm-Message-State: AAQBX9fQaeMpND3v2jcetIBTfcx8xyrIfIE9QFKGNw2SRRZJc3xIlyWb
 U6cwVlSPRZGI9r6yadiEvXRRrA==
X-Google-Smtp-Source: AKy350bB7CnC9v2LFvin1OsenFCaWtCXY1WySKRIHHVhEUxHPiNkslyNke2PvcFlaPxkid/q2NBS8A==
X-Received: by 2002:a05:600c:284:b0:3f1:8173:fc1a with SMTP id
 4-20020a05600c028400b003f18173fc1amr6047727wmk.28.1682271805296; 
 Sun, 23 Apr 2023 10:43:25 -0700 (PDT)
Received: from [192.168.252.175] (8.red-88-29-167.dynamicip.rima-tde.net.
 [88.29.167.8]) by smtp.gmail.com with ESMTPSA id
 x24-20020a1c7c18000000b003f183127434sm10159548wmc.30.2023.04.23.10.43.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 10:43:24 -0700 (PDT)
Message-ID: <29951829-1aee-5c7a-bf38-58e290afb706@linaro.org>
Date: Sun, 23 Apr 2023 19:43:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 06/13] hw/ide: Extract bmdma_init_ops()
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org
References: <20230422150728.176512-1-shentey@gmail.com>
 <20230422150728.176512-7-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230422150728.176512-7-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
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

On 22/4/23 17:07, Bernhard Beschow wrote:
> There are three private copies of bmdma_setup_bar() with small adaptions.
> Consolidate them into one public implementation.
> 
> While at it rename the function to bmdma_init_ops() to reflect that the memory
> regions being initialized represent BMDMA operations. The actual mapping as a
> PCI BAR is still performed separately in each device.
> 
> Note that the bmdma_bar attribute will be renamed in a separate commit.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   include/hw/ide/pci.h |  1 +
>   hw/ide/cmd646.c      | 20 +-------------------
>   hw/ide/pci.c         | 16 ++++++++++++++++
>   hw/ide/piix.c        | 19 +------------------
>   hw/ide/via.c         | 19 +------------------
>   5 files changed, 20 insertions(+), 55 deletions(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


