Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 614AF130AE9
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 01:38:20 +0100 (CET)
Received: from localhost ([::1]:46632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioGPT-00053e-1e
	for lists+qemu-devel@lfdr.de; Sun, 05 Jan 2020 19:38:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33214)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ioGOc-0004Kv-3Z
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 19:37:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ioGOa-00074x-V1
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 19:37:25 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:45633)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ioGOa-00074Q-OZ
 for qemu-devel@nongnu.org; Sun, 05 Jan 2020 19:37:24 -0500
Received: by mail-pg1-x542.google.com with SMTP id b9so26046068pgk.12
 for <qemu-devel@nongnu.org>; Sun, 05 Jan 2020 16:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=fAYcYxkLjIHtycjAgZnbvUkMKH4qVhiSAK6O7ZcMWkY=;
 b=jwaUhi+cQa+NRa0ZVZOxfwXx1yHiX6EkeZUBcl4RUWQ91nJm0oMzeA1huYeazLMtNm
 0o4lyY710YYMPR2+2hPvH78FpT/a2d0qimTOseoD4C+51wlzWbizKx7A6DdmPrbUHsC8
 HP2J3qd+7D9zY7b17liA/gjQB+qWbtKf4XKOPXTCxknMwIMSOVuVLZLt76efEE4jBuWL
 O2uLaDkgvmDvnsOC8g6KzU59EOOKHg4NYBPFrVYK4jLLoVKoc7He8+DWE/xrsPJBz+/2
 oLyODPblGkUxwiC+gqrG5zuevLR9W7sDrhFm0h3uJw7w+DHxsJsv3caL+5WBYXKzPOpY
 tsIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fAYcYxkLjIHtycjAgZnbvUkMKH4qVhiSAK6O7ZcMWkY=;
 b=dw0QCwq9u6lZenSnJptFxByjbC5k0JpQQ6secFbS1TiX3obsNgdSrnKG2ZUfnXKYR1
 oPd9yWG5fCiq360hBYVfcrYcsjE09590FGWzkfeLSdHXvYdoPeRNh4/0ds1PjCE2+6yp
 Z70rrithZF7vLXXaLZgNomZrggvI6daiJT5qabPNdgW0vqqxEdebOvsACUw95H/CwbRK
 E1ltApXUvqxD2azFo/HigvMXY2JBx1UbI61GOZspVsCquTcrbdtrz8cBS0zjxuEiOtpj
 S3hzACO7i3vsgqTQy2LI94Dwjxhck6Ihn5aFFuRI35YyQTJpSo2A50O+zSqei2zXxgy8
 duCA==
X-Gm-Message-State: APjAAAW/sU69Y83l4kvDLh/mrqrmW/uj9G2vubyJBfSArFgiFcT+0avM
 RKDJ3U5BgMDTSPobhhzLD2RJJPu/Hj/PeA==
X-Google-Smtp-Source: APXvYqy8tT8NXNFrQr3H9aKtMiXOORJCA+dNuI3eioNfJ8a1aAHInGPp30TZIkFbNNpJ1/jTgvoFKg==
X-Received: by 2002:a63:289:: with SMTP id 131mr109541326pgc.149.1578271043077; 
 Sun, 05 Jan 2020 16:37:23 -0800 (PST)
Received: from ?IPv6:2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd?
 (2001-44b8-2176-c800-f1c3-9f9c-2e9f-1ebd.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:f1c3:9f9c:2e9f:1ebd])
 by smtp.gmail.com with ESMTPSA id q15sm70527795pgi.55.2020.01.05.16.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Jan 2020 16:37:22 -0800 (PST)
Subject: Re: [PATCH 08/86] alpha:dp264: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <1577797450-88458-1-git-send-email-imammedo@redhat.com>
 <1577797450-88458-9-git-send-email-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ce0e90e4-0e6e-f29d-81c8-347c3a37aab2@linaro.org>
Date: Mon, 6 Jan 2020 10:37:18 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1577797450-88458-9-git-send-email-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::542
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

On 12/31/19 11:02 PM, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/alpha/alpha_sys.h | 2 +-
>  hw/alpha/dp264.c     | 3 ++-
>  hw/alpha/typhoon.c   | 8 ++------
>  3 files changed, 5 insertions(+), 8 deletions(-)

Acked-by: Richard Henderson <richard.henderson@linaro.org>


r~

