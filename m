Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A15836071F
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 12:29:53 +0200 (CEST)
Received: from localhost ([::1]:36054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWzFw-00046v-BU
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 06:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWzEK-0002k3-16
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:28:13 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:36610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWzEG-0002eD-Fj
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 06:28:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 o9-20020a1c41090000b029012c8dac9d47so4924347wma.1
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 03:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QP8abqInayC2z4IQFRHAkUhMvpLtEKcM0U+9zlMiF9c=;
 b=hLQvvb4ioG3fYBshQkVyDhRJ+4glyRNnQgwWE36QrQqPZUuPnpxgW06b0bYJywm3RZ
 L9f3JXs7zVfZiXO7rmdFwlxsbIPbH/xRn1B6r9vG+BbP831LV6bunsPPVwiStH36el5O
 MmGtBGC2vjibPc8g5OUQFkRorwjfAJrmyBRThicEETtUq7JB566LxkExyK4zbHgK9T8U
 7x0Oi40pjdQifqtuOADMauhReqnCcUSiOkR3/8hBYTUOu6ghLou7uzFk8uVW0h9o+iO8
 YhaTZOFY3gUPfWo6XYRex8YktX7qSycA2Bpyl3fHIwoht7rTUoeaR5TojulP8UODJ8gs
 XL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QP8abqInayC2z4IQFRHAkUhMvpLtEKcM0U+9zlMiF9c=;
 b=ex6Prju0+2Z7HUsnq83NJdBALrO3ljumCs2WZij3W5C+w9+f4ZCmZqfDbWJMRfmWKh
 7ZGMqUT48GdUCunuudQeWttcGWQZqizo4ozlr8NvCldfxzMHQSgMMAnBKJwhgfXzm6qt
 oQKxXmKcvw2kZY0qt5cCKEiUsOwxVwMbfmPbgd4jJC8KiPJKiWggWaNwvMLkNEFTLLGA
 x+J/nRw1T7dxaVul7wlXgS/4bRzoFLQhGMQuvbSJblsh0EmLPm9YBGdpHIg4SygxuxnS
 E1VSeDLdmJdl0wufJMkJegEISShhQehOgKPLLCKbSwljBiOYEXnCduPNdye3oRKiT9Ey
 Ndrw==
X-Gm-Message-State: AOAM532HhyRHp8zupeRmoFGR898xzqdi3JMIdfSIPF2YWY8itg7vmAyV
 Gz/h1AQVKM6v4sUiNUy1SmB9IbK8MjE=
X-Google-Smtp-Source: ABdhPJzZp7xkxCnGLReYSyXoqbb3dHNbXw9EKz6vp2cfEig2gtB/3TxCSqn1+DLHP8l3bPe/Z7olUA==
X-Received: by 2002:a1c:7516:: with SMTP id o22mr2394291wmc.91.1618482485307; 
 Thu, 15 Apr 2021 03:28:05 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id c9sm2321344wrr.78.2021.04.15.03.28.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Apr 2021 03:28:04 -0700 (PDT)
Subject: Re: [PATCH-for-6.1] hw/isa/piix4: Use qdev_get_gpio_in_named() to get
 ISA IRQ
To: qemu-devel@nongnu.org
References: <20210324182902.692419-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d64d967d-36fe-a6ae-97d4-6aa7b21cdd66@amsat.org>
Date: Thu, 15 Apr 2021 12:28:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210324182902.692419-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/24/21 7:29 PM, Philippe Mathieu-Daudé wrote:
> Since commit 078778c5a55 ("piix4: Add an i8259 Interrupt Controller")
> the TYPE_PIIX4_PCI_DEVICE exposes the ISA input IRQs as "isa" alias.
> 
> Use this alias to get IRQ for the power management PCI function.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/isa/piix4.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks, applied to mips-next.

