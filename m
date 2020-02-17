Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B216C161B17
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:53:33 +0100 (CET)
Received: from localhost ([::1]:50920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lWO-0003CT-QT
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:53:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49701)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lV9-0001Xu-Qc
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:52:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lV8-0004y1-Tp
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:52:15 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:37882)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lV8-0004w2-OM
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:52:14 -0500
Received: by mail-pg1-x544.google.com with SMTP id z12so9688427pgl.4
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OrQ87Mo1G4nIGFgelk22OWo/vzSSWntxzmTb97TOftk=;
 b=NKnDh2v49bwLVGn7huEo5U4p3GLyI/WaEF9xoj1Qd1eGJj777HPBbx7JRtatt13uwu
 P2rlWGWDQdLwwZtu963fVaxxAGDwsVxmfCHzFQLQV4z7p/mjLKfBivYWXoXtSePX1Cri
 etSRQbDcRpqOgJ+95YQ7RUezgBY8zZoqf7+Y0Yvd8at5XtkZh7SaI1dakII68jJItujw
 MJI30EpoVmeT8uxdISr2n95W08P/ZTV68Cv7nI+CMapbA7gLttNF7uhQQ/33/Fcr8/9+
 w8mhOjbQQ0Z1tw15ia26cdvPAspKMK1v/7Nz4UUCszqLcNhvDOcDVXnIFSmBT8y+yaPg
 TnsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OrQ87Mo1G4nIGFgelk22OWo/vzSSWntxzmTb97TOftk=;
 b=Bd4FBDXIsGt2DbJC712KOgraS0Z5NKIbhRu41XojaoLv8i/Fd4zBDwTjLn/1dMBvKU
 9IYcZi7zvHQhRj0m/WnNmUiTXEu5MhSgRNl8U9nBKJ+O4nkBkPmkDEJGL6xKwjh35fun
 x5hC+I7sDpo+S3uFT/pRgETR6rTaNpV06OhpxI4PyS/DwyWCawXxiZJjToEKpVysZVfX
 wcpKaROkGRtBrZZhcMbA/heIdQ6eDd29tiRxo1DcN+ed7fVudnS8oi3fszUZIGRE39hC
 ZGQq20z4F9Uqq9HCGsHF1hvlbdGMZliwoPjpvV44BkAHFlPdX5hO9OxKM8mVn+drcp5A
 9erw==
X-Gm-Message-State: APjAAAUOYBZ/4Js/UOl62on56KugPTrt9Y6pKrOg6f9NJxTBhDhPkQGG
 AJrhYey5he2mPWlUDmH7aGTuUQ==
X-Google-Smtp-Source: APXvYqyxWUL1o7jA6JegiLnengOuTKlAc8Ph74hsGj7EcKwKmg3rw5iVmoTOaLEAABmv3yRYs+Ew4A==
X-Received: by 2002:a63:504f:: with SMTP id q15mr18982560pgl.8.1581965533788; 
 Mon, 17 Feb 2020 10:52:13 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id 26sm199267pjk.3.2020.02.17.10.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:52:13 -0800 (PST)
Subject: Re: [PATCH v5 14/79] arm/highbank: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-15-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dc95bc98-d3c6-f844-6f1f-9033066ffed2@linaro.org>
Date: Mon, 17 Feb 2020 10:52:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-15-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, robh@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:33 AM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

