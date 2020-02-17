Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F467161BB1
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:35:46 +0100 (CET)
Received: from localhost ([::1]:52036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3mBF-0001e3-KM
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m8W-0005w4-P3
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m8V-0004wC-RI
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:56 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:43471)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3m8V-0004vu-ME
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:32:55 -0500
Received: by mail-pl1-x642.google.com with SMTP id p11so7102968plq.10
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6K0fLeUCdjVsOzMfr+p4W+4kA8q4NQnenhV460crDkc=;
 b=WQeRCjewSwc6hhDx2ZRljmdTR1ftLMtjvgLLESpEjZuxr9517889PqODO6MnTW5zOD
 IL3IsDFMHiJuF3Q38kmiZZSPJlcKuWs0ODMW0nJ2TLwjFHiSxLCb705NxwvF1wzUcXNs
 baat+W91/9sXQNPlOHkA2woMf0DPvjwE/thoqixldL/IR6e+YP2Y3qqpQ6cvkYsElKuk
 0+arSsCPQkMdxmwgGOoGCa9aUde1t/0WgnWcVAn6WOgW/ROIeXBksczy8j4BwK1wGnJK
 G6lUGm9/hZ2a21vQpUs9XxRYQClZZJEJLz++g8TsiKdxMuZOic8mXvZJBusvGbxQThbz
 QOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6K0fLeUCdjVsOzMfr+p4W+4kA8q4NQnenhV460crDkc=;
 b=CWVfbqektID12i/d/yhM409RV/HMgY3mqqctY86KvtoaIXr/SZeng2S5Hu68fm2rAZ
 Gne+Ie1oiJVxFw+Z9CqVqWRgQxvAWbqA1KvNImYbdytd+PDRf5r7kekaNYDaKC/vu+IT
 fmTZu8SigTBSjwUG2nhz3E8ZTYpgGEGc0ic1UV4nTjUnFctXTWifgDYa/g+SSWb/WwzL
 F3EBXlCkndCoyJo7cDXdYGJ7ynufRNkaTjrrLdndkLs5qdi16AsrW0QkjSNitc8xmlEZ
 3gVAcXcKdhko5dKj1b1vqpLDW8Yuu+CFD0wLqQmF0nnUkscdthXmXJQYxR5aTA4pwzEp
 W5MQ==
X-Gm-Message-State: APjAAAWv+BYqJRI5g9Zb0vmedrNnBz4H/d3SghwBTuurcxevnYSHEavs
 SJyWYK75/g+DVlVVozoWB+HlCQ==
X-Google-Smtp-Source: APXvYqyIjMeGTNN+2YUBkvQ5QfStAxjoPeHCjg6UH/hVRh083NEEkkegntzPHlMH50tpwcJofMGpRA==
X-Received: by 2002:a17:902:8542:: with SMTP id
 d2mr17831298plo.200.1581967974779; 
 Mon, 17 Feb 2020 11:32:54 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a18sm1216760pfl.138.2020.02.17.11.32.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:32:54 -0800 (PST)
Subject: Re: [PATCH v5 61/79] ppc/mac_oldworld: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-62-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8ad63c9e-d354-653f-3e9c-8c593f71e52c@linaro.org>
Date: Mon, 17 Feb 2020 11:32:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-62-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::642
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
> Acked-by: David Gibson <david@gibson.dropbear.id.au>
> Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


