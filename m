Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0F407DE7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Sep 2021 17:24:36 +0200 (CEST)
Received: from localhost ([::1]:39850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPRLP-0007YW-K9
	for lists+qemu-devel@lfdr.de; Sun, 12 Sep 2021 11:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRJb-0006N8-86
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:22:43 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:35805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mPRJX-0008HD-FE
 for qemu-devel@nongnu.org; Sun, 12 Sep 2021 11:22:42 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 r128-20020a1c4486000000b003065f0bc631so429104wma.0
 for <qemu-devel@nongnu.org>; Sun, 12 Sep 2021 08:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yzxTtxTOEsIE4NgUbjgOv7bSQxD4Ya4UoPGhlBgUB8g=;
 b=PKtlV8KIJQx//cESt+a9tEpaMdiSVSxwPI/E+5F1Y/0mm3dZN55pPRv9gVhoUij+gs
 dUmj5IZ+r+0j1y3z8MXC5FuE8zEFGrowxFfBp9aNT3au+rU+mFHWjuZF2vnWlXpCgY8a
 GT1ycYV95Co+PqSYxnC3nnn9nihIxEjNS/Tkqkd8/k9Qa8LqWW16/aZwwhEt5dnNs3/Y
 keuwTheAcj0DgbkI0jkGPoD8WcvNZ2iOJTdgI6FpxKWZikTUwpoNrDLeVvBDuQJUzByv
 gC+R79xkYB/Br1+Lr4pqg/pj9uPVglZH9I4yoCuWw6GhH9Cr/oQ9jWlY+1DukpBw2M3u
 fo5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yzxTtxTOEsIE4NgUbjgOv7bSQxD4Ya4UoPGhlBgUB8g=;
 b=ak8ZvMVftnlo9gTYtS45dxfFeB9TAeQ4RUTvdu2W2Uqza48ojVpKnpKQug2xzJmxUW
 cQBSctvTZUXV4k+EStaibFEq+NJfdpu9i61+5UBkF0SDDwM7R230BmD/rG+qc2vzn4wB
 8vLVFNt5t1iADCe/8wQbssFk/nOvooIS+/3UgVxnbG43zitL4wp7a/ftTNzdFu6P5/z+
 +ZZgvD8jHVHVzsAI7erPn3TPMbhQUaVd45rsGnUD71X2Q5mYiz5BzjhvK9ZtuzQpNoA6
 +4IeaXxAOsLBMWSZhwZCExGUSaBe1dS5Xr4sHrCIWQzxlhri+UYYZUzgcLlKPvOaXS9P
 uq4g==
X-Gm-Message-State: AOAM531hUD2KdnxXjGUMVMkT4tAtO6N/epfxfRmvxJNQklug3nJLdcLd
 qcZsahaI+B9SWdo0+6uM8+w=
X-Google-Smtp-Source: ABdhPJxzg5wg++CDRC77cbllwj026KpiMOwHNzOR22eI+1F/pi4msniENp87NrygOe4CYJLHkMllWA==
X-Received: by 2002:a7b:c843:: with SMTP id c3mr7026385wml.76.1631460157935;
 Sun, 12 Sep 2021 08:22:37 -0700 (PDT)
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.21])
 by smtp.gmail.com with ESMTPSA id l2sm4465212wmi.1.2021.09.12.08.22.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 08:22:37 -0700 (PDT)
Subject: Re: [PATCH 12/20] nubus: move nubus to its own 32-bit address space
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 laurent@vivier.eu
References: <20210912074914.22048-1-mark.cave-ayland@ilande.co.uk>
 <20210912074914.22048-13-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <679f4f66-bbb5-52b7-a616-0463ea719d0d@amsat.org>
Date: Sun, 12 Sep 2021 17:22:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210912074914.22048-13-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-3.584,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

On 9/12/21 9:49 AM, Mark Cave-Ayland wrote:
> According to "Designing Cards and Drivers for the Macintosh Family" the Nubus
> has its own 32-bit address space based upon physical slot addressing.
> 
> Move Nubus to its own 32-bit address space and then use memory region aliases
> to map available slot and super slot ranges into the q800 system address
> space via the Macintosh Nubus bridge.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c                      |  8 +++-----
>  hw/nubus/mac-nubus-bridge.c         | 15 +++++++++++++--
>  hw/nubus/nubus-bus.c                | 18 ++++++++++++++++++
>  hw/nubus/nubus-device.c             |  2 +-
>  include/hw/nubus/mac-nubus-bridge.h |  2 ++
>  include/hw/nubus/nubus.h            | 10 +++++++---
>  6 files changed, 44 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

