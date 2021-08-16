Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5968C3ED9A2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 17:13:33 +0200 (CEST)
Received: from localhost ([::1]:60734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFeIu-0006m3-EC
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 11:13:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeHr-00059Q-PT; Mon, 16 Aug 2021 11:12:27 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:34304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mFeHq-0004wR-6v; Mon, 16 Aug 2021 11:12:27 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 o1-20020a05600c5101b02902e676fe1f04so138893wms.1; 
 Mon, 16 Aug 2021 08:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CcXV1ujKrf9KvVgqoFVLQ6u1wvQsW4MQ9TI63igXQzY=;
 b=Joi00VYprIZGs5XsAR8bhpb+DQUcqrh9O0PZNCJeblz7j+R/5H0YMpInazpElpC2Uj
 hgrHIZWIqIeEZwSIxQg0+6ujYLYXs0x2T4vg579NHe+z6J0QH48/GMAUOKIq7ZNePwpC
 AxMDwpPhDZD2tWqYSjRZT3hXS6kX94hip9+p9eThE6cD1EF99kOfNlINmBBHwqsI7ULk
 kiQCmvXUX+P2dWgUZlxChEczU5wrUlG55BAZFvualNWvUxiIj5OuTzgL4gtO52pYn/lv
 VQqxZYvAswmdyoUTMociScmLH1U95fnwnRMC9rBtt70Wz4W9tWUjl6sIO7Y8uqjB8Oxo
 5p3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CcXV1ujKrf9KvVgqoFVLQ6u1wvQsW4MQ9TI63igXQzY=;
 b=fFezBSMCJkc/MvwWWXEsi7fPaCgBa6+tNzoTn3DTyY+CDJRstiyMG4OHY55Mk32zZx
 vvE6L19Ofr0SUMFIRI0qdYSg/hR0cajO03ctEu+SBmYh3GXm0O2oCa7NfUDxM+yfQwLW
 JVqk9U819uD0D4z2gbEwaqJ8gHhouNWuvU9atEDpfmbSWbl43pkFiKsQoIcC0/2rjUMm
 4WopgjjMiQTd1DiwS6hwBmwBR5ezurfLGEhqedCeapM4DDthmqdmk1AI9YHhpbQelE8D
 CACdndyZHUdrzyZlQ4yG4SNNXEXjdvFW9RZdI21jQw7tfS4v/wWVBnUzxBXjZkWwzHgn
 20uQ==
X-Gm-Message-State: AOAM5304ZVOKuCT48XyHCRqZTw2d5PEQkCMFQcEL/REW0aYSG+VMGhQu
 mo5rjjYiAe6hDIJ+DkoFyGM=
X-Google-Smtp-Source: ABdhPJxGsxQkQ1Hmzn+D+zJmfO+N/8lRK3V9PCRwFMgYksoGXplYosGZMwm1Knyj4LR9C0ypS9Q40w==
X-Received: by 2002:a7b:c254:: with SMTP id b20mr15966013wmj.189.1629126744459; 
 Mon, 16 Aug 2021 08:12:24 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id d9sm11876649wrw.26.2021.08.16.08.12.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 08:12:23 -0700 (PDT)
Subject: Re: [PATCH 2/3] target/arm: Avoid assertion trying to use KVM and
 multiple ASes
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210816135842.25302-1-peter.maydell@linaro.org>
 <20210816135842.25302-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <25540908-760a-44db-50f5-b36c38bef2db@amsat.org>
Date: Mon, 16 Aug 2021 17:12:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210816135842.25302-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-3.71,
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
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/16/21 3:58 PM, Peter Maydell wrote:
> KVM cannot support multiple address spaces per CPU; if you try to
> create more than one then cpu_address_space_init() will assert.
> 
> In the Arm CPU realize function, detect the configurations which
> would cause us to need more than one AS, and cleanly fail the
> realize rather than blundering on into the assertion. This
> turns this:
>   $ qemu-system-aarch64  -enable-kvm -display none -cpu max -machine raspi3b
>   qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
>   Aborted
> 
> into:
>   $ qemu-system-aarch64  -enable-kvm -display none -machine raspi3b
>   qemu-system-aarch64: Cannot enable KVM when guest CPU has EL3 enabled
> 
> and this:
>   $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
>   qemu-system-aarch64: ../../softmmu/physmem.c:747: cpu_address_space_init: Assertion `asidx == 0 || !kvm_enabled()' failed.
>   Aborted
> 
> into:
>   $ qemu-system-aarch64  -enable-kvm -display none -machine mps3-an524
>   qemu-system-aarch64: Cannot enable KVM when using an M-profile guest CPU
> 
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/528
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

