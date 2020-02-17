Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE661161B5C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:15:44 +0100 (CET)
Received: from localhost ([::1]:51408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lrr-0005LO-RZ
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:15:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52920)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lqU-0004V0-F8
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:14:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lqT-0001di-Gk
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:14:18 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:33201)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lqT-0001cM-AR
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:14:17 -0500
Received: by mail-pg1-x543.google.com with SMTP id 6so9718876pgk.0
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zCSCIDCqEnp4VXY7Q3cgz5dsjX1P2gHTslBhjD/InX4=;
 b=vlFIESHNZa0JVsRvuN9AmBaZPItZfG7dXhIFay/8Ahr8lt3Pp2ECzPxHEraKEkDzM3
 7JOoG1l/rQ2HRjaDYgBEcvFjcNrR0eluWUSiomi3XR7YWOdJsv+pJDgjUmgL01EkyUxh
 41S0C6TMqp/66QuZuhYBm27v4xA/ZznYp5K54merB3d593CK3LnDojhFHTaT9DP/Tp48
 ZiiPlUdDgzC6BtErczmbFL5hOsUchzqThchDnBtNmzPuZUqHJ7IQz+3oNo6bWIs+4V8L
 vpTMiwZBvqrVnLXJgv9xKZZU/HVYlB71GiqW05dBHMaelDLug6Fqxh+YA2He1kdsZFnX
 oKKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zCSCIDCqEnp4VXY7Q3cgz5dsjX1P2gHTslBhjD/InX4=;
 b=VQeTVUe3uZBL5CaBfFYzNhAYbG+cSqIp2FQzsMGVr+oET7RacSvZVQXH8pgOgmQoG/
 p5UTsAV9WigPETtxN1lqzEz9q8D+yXH2U7UznYiNFhS3t3Pgn+h8opMiXcjGqdi4Zsz1
 YyTUxDHojTtvJl36gGA7KNbbNwaknMpeBJd04pbciSnoXfcQ3y8utsXWv1WNC2WEOdl8
 jeYSrbvaZseg53z6WPiJ/9ylfexPd5cz4jKWjh0bWEmbYb0XWNmmbLuniW1Kh0KfNhXT
 wZtEgP41GQ+cb+FaHa26tN6niRkZedbcCr6Pmx6p+hBwRi43GYc8ch20MTtIbaSPLN0Y
 wuhg==
X-Gm-Message-State: APjAAAUIxKAniXVxkmwVPykyeZ1rrzGq7ASHfIaW3MI+x+SSFeaku99o
 Bt8Kxs/VXN/CHH/ZlkabUjwKIUov5HI=
X-Google-Smtp-Source: APXvYqx4JpKTcO/tUDEw+aSl1vRW3N0ibh96pPIb1cu/qjYe7uUdHZ0gY6RwfM92xjyO6287naK9kQ==
X-Received: by 2002:a63:7b5a:: with SMTP id k26mr15309780pgn.406.1581966856299; 
 Mon, 17 Feb 2020 11:14:16 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 a2sm516911pfi.30.2020.02.17.11.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:14:15 -0800 (PST)
Subject: Re: [PATCH v5 27/79] arm/palm: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-28-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1ab391d4-743d-f4ee-2c1f-87d89d7c8af5@linaro.org>
Date: Mon, 17 Feb 2020 11:14:13 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-28-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
> PS:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~



