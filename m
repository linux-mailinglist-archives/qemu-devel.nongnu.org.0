Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E711D161B95
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:27:03 +0100 (CET)
Received: from localhost ([::1]:51708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3m2o-0003Yy-Vw
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:27:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54915)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m1O-0002Jj-3u
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:25:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m1N-0001bg-8U
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:25:34 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3m1N-0001bP-3e
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:25:33 -0500
Received: by mail-pg1-x544.google.com with SMTP id b9so9582914pgk.12
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X8AEMZPiEtj8NBy2aqTtBUyOCgCZNHzj7alvIhp8ll0=;
 b=U0A+wsd4BlzEn8Aa3StC2lsxuRRl3+L2FnyAjq2PQIK+fPZRzXiZ37qBWfTgNzUbMw
 0sz5BYfA39LGSQxjaR8T69aiFB3K+EuRTDKoevQJe57JRMY59WjKA14nldPe8ueazSx8
 W8k3zbIE22WdQGwW89TYP5qzZ8dx6Ngs3JcA/nL5dpAyHKQ/r9+JGHJAJp+kl5xOztED
 SZP51DJgSUqWC1tjt6EZlsbAsf59BP6zygeVRP6vJMeZeGzraEok+BETwVZA8GXAfzc7
 3IB2HWGcRBGybwxb9eXgzMwlKkLiwrcoz11sYNv16qrI0hFIyoAdMzAbCuB7Rdwx03AG
 lQHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X8AEMZPiEtj8NBy2aqTtBUyOCgCZNHzj7alvIhp8ll0=;
 b=ZPa0NKnmBPxrY9/hyAGPnLvbfRml49duGaL8npGGoR6NLUz9qnCSOtM2xU8dCV2UoO
 V3YoptgyC+Uhz0MwBR9xz/zY3YkTszX5XR32EuAkuQDHbwWtxY6rrerecLCuI2PvpcvE
 5ltv9HkA1j57mRqSipRq0tgbtIigVEdVmhyIB/mCyIbjxTgAzjFQPhvkmpYNC+pPCQt/
 FyAA5LogzUV6sXHkphw/8oGER/Gn6EjFvw8DJ6An1KbPtiFRfFDDknJue9a73WCZi925
 PCOjUf35y93/INmumNlbE+tXabj2qrAPBeDEAARr0MZqfOWHiDS/SqJuJKqY/97Vm05u
 mj6w==
X-Gm-Message-State: APjAAAU1c+em6rvKq88Zbd04pZyHXBQ7VOlZaFpXa7aerJMzz7t6EHQg
 3Km9qhrJd16Oa3EYFZ1P9+zz6g==
X-Google-Smtp-Source: APXvYqxJnKm3QFOx4heyR/PplK7s9A41EM9X+oQ7P2Xbbzgyj+LCoWSB9QYXpYnjGz4n81arLpzYsQ==
X-Received: by 2002:aa7:9525:: with SMTP id c5mr17924356pfp.133.1581967532113; 
 Mon, 17 Feb 2020 11:25:32 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 o9sm1214991pfg.130.2020.02.17.11.25.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:25:31 -0800 (PST)
Subject: Re: [PATCH v5 37/79] arm/xlnx-zcu102: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-38-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9a44a517-3e63-7a20-5324-d6c8e0652a39@linaro.org>
Date: Mon, 17 Feb 2020 11:25:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-38-imammedo@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/17/20 9:34 AM, Igor Mammedov wrote:
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
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


