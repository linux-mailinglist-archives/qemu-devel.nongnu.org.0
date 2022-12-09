Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAF164850F
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 16:26:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3fFC-0002yt-Fy; Fri, 09 Dec 2022 10:24:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fEN-0002me-5k
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:24:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3fEL-0001yT-2J
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 10:24:06 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j5-20020a05600c410500b003cfa9c0ea76so63374wmi.3
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 07:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z8IbNBDnIT+Bgnpg6itOhcBdL6FdrS/3O+gJpywIbPI=;
 b=Ep0whTAdDda3/d88CQRz0OMgAkNtggEcPyFd846ZGiI+ajvyP5PYX4tFrvCSjGZLNw
 LB2b4mDal8+0Ih8tWMmVOAsq6vIOcrsQE2AtGTGVi6NQfpK+SxWZEK/ZtmKe7wQaurdG
 oXLRYCaS+CKLs6QYrYjVp4LwT98L0Jjn5xa8TYkd9v+xWcH7ctKeuIt38XTZWDtEB94X
 +Cb1oymYjxb0Hx62uGUqXHlXVf0xAiInSTt2zShsd643tE1g9v1NhxwIpo0aTG7MN2aM
 4lHsRBHdXTbZe5zikqwO/jovgl2sv05x7VDT+iZjgOiMDKuVFYQIXzfe0efljGfzEDIy
 B+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z8IbNBDnIT+Bgnpg6itOhcBdL6FdrS/3O+gJpywIbPI=;
 b=Y7sjlkPXUVrRlbnNpgywvI0fZbc7bRJKjXp3eyUD2ddmJtaKIzUZAORPIKxuPyVtSX
 +aNUoWe/R07k072SkKYn7Ckkz4t+CmPAQR8DZNfONYP5eBIP/Uv1TB29McEMd54Yld6+
 Z9qJC6coYY6fGSZngj0o4dG9L4n4KtZVW8bPMfN5iCFJ5TpPnZueOaHstvPGNIOEkTGM
 if56nl0NrbTN4qs8xriHWUOiTAPgKuL8tCcvmRcPFlW0GYoWjkA2IX8Lh4MBVnV2a8vP
 uFwP7Y2pmHwnLn8cmkaefAxCtwEOYMM9lcN3rY1bv1CP7QcQOiDEIIu08yliIGf/7D9G
 Mo0Q==
X-Gm-Message-State: ANoB5pmFeoriwls7sO/Cu9HwXjqYve+6obXdbWNmeCJWkvF4tRbWE3aO
 UZWFeoVsA+AOUJGjjLEUZXx4Hg==
X-Google-Smtp-Source: AA0mqf6Cownzl5ilhX44/DVwZu/pglEr3Q9NVVu1UqpWZIweSPJYkP84mahiXxaEhz5sgjIglbCYwg==
X-Received: by 2002:a05:600c:1e86:b0:3cf:81af:8b73 with SMTP id
 be6-20020a05600c1e8600b003cf81af8b73mr5180123wmb.23.1670599441419; 
 Fri, 09 Dec 2022 07:24:01 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p6-20020a1c7406000000b003cf5ec79bf9sm17053wmc.40.2022.12.09.07.24.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Dec 2022 07:24:01 -0800 (PST)
Message-ID: <17a7d714-8a1e-8a17-f657-2172060d02e5@linaro.org>
Date: Fri, 9 Dec 2022 16:23:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Peter Maydell <peter.maydell@linaro.org>, Huacai Chen
 <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org
References: <20221120150550.63059-1-shentey@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221120150550.63059-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.288,
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

On 20/11/22 16:05, Bernhard Beschow wrote:
> v1:
> ===
> 
> During my PIIX consolidation work [1] I've noticed that both PIIX models have
> quite different pci_slot_get_pirq() implementations. These functions seem to
> map PCI INTx pins to input pins of a programmable interrupt router which is
> AFAIU board-specific. IOW, board-specific assumptions are baked into the device
> models which prevent e.g. the whole PIIX4 south bridge to be reusable in the PC
> machine.
> 
> This series first factors out pci_bus_map_irqs() from pci_bus_irqs() which
> then allowes for moving the two board-specific PIIX pci_slot_get_pirq()
> funtions into their respective boards. With these changes, the PIIX4 south
> bridge could eventually become an alternative to the PIIX3-Frankenstein
> solution in the PC machine.

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


