Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A51161B20
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:59:41 +0100 (CET)
Received: from localhost ([::1]:51040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lcK-0007oK-LA
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50463)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3las-000736-Vm
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3las-00004x-4E
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:10 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:45806)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lar-0008WF-Uc
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:58:10 -0500
Received: by mail-pl1-x642.google.com with SMTP id b22so7070966pls.12
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sjL0s2nDBiTTNujvl3Y5yK5e3lHJojMyQRwS2tz8dQM=;
 b=b7KquiqvnK0mM6OAlo6QLZaIjcwVvdQnwSbVZZwrCos/1mD6wbpOcDIrXku5qN/rzp
 azy7KtsaPaDU4rVWk7PR5WLs6iiBd66FhLIm1ZBCG+bC58fV9cD6Lwa+NuDg14vasmYs
 gkOZHnowKPvtUYbhKG3l1o3L6k5otSNBpRIjenauQjEjBZO16/BmnHH68DYsytJoeAbn
 dryvyvkk6ak3kLgyRgwIYMQcYkOLcdg46whBku33hR4RDMVUJW6R1bb8dPq6P0lHNg7Y
 u3zVvL7eGs9lZzRsGhbqJ/suIPNhmY9ejEaOh6ZJPJ6Wj+jyxA8uD9Hv+Fkt33qCulnh
 n18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sjL0s2nDBiTTNujvl3Y5yK5e3lHJojMyQRwS2tz8dQM=;
 b=MwtAWjrBPDrBfb41lTl4zY1ZRzXzEeweelSr2Uw6g3T7nVekMq6NgJHY69j286ovOL
 xRTHqgZhMvFVXKpn5Zs133ZI3INJU/hCGz7WGQB1EkpNpt/6Q0W3Tso0j2D1pBaJ5Nh+
 g2cKyvCHBtQ9NYxYfwMJx883bKtNpOa2ClrKQsKgrWzWOOsK+1dmY0zjNEvkwAZQBC1U
 MYLFI38dDUxIK4YDbVTsWj1mRkPtEITI7ZnIGc3xUvNG1HHYWzJGDdtmrRsPrRdmGtui
 98OfDFH+gGReagW55V8jX5PCkm8tKeOsspuc+eiWfURj2IkvMJ/jzAUZwDCjhhpJKuuJ
 Ra5Q==
X-Gm-Message-State: APjAAAWtJTKjRmzJUFCRxHyIzN2/FrhgvYoQVYNu8X8HcojfcEyQs9oH
 Un3bTApAuVyrOj+T1cHLL76bew==
X-Google-Smtp-Source: APXvYqyqW72eerSz795kk93SG5z2VePX30JTPEZVOwDITOh6MMygN9oeqJW4s18BlyvxltGn6aQuow==
X-Received: by 2002:a17:902:b682:: with SMTP id
 c2mr17355713pls.127.1581965888819; 
 Mon, 17 Feb 2020 10:58:08 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 84sm1608711pgg.90.2020.02.17.10.58.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:58:08 -0800 (PST)
Subject: Re: [PATCH v5 17/79] arm/integratorcp: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-18-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ea134484-dce1-51ac-eca5-d8e297ac0177@linaro.org>
Date: Mon, 17 Feb 2020 10:58:06 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-18-imammedo@redhat.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, peter.chubb@nicta.com.au
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
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


