Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7AE161BCC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:40:45 +0100 (CET)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3mG4-0000SD-EX
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:40:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3mF8-00089d-OB
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:39:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3mF7-0007nN-J4
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:39:46 -0500
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:36344)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3mF7-0007my-E8
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:39:45 -0500
Received: by mail-pf1-x443.google.com with SMTP id 185so9440470pfv.3
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DOSc99TPq+iHWlIgbzJ98LWgMViJiAlVN8DFv6VjtBA=;
 b=OA1wVS60byn9rd9R5fXn3bD5UdDSZ4QLuEANGHe6Pio624coWXpDOZvAXphPqDKz7D
 nWfAMPAobrHfH/v3yf6G813/q7ejKzjew2DupzBTevCLT1jK+QE0RoJk8m8dSpIL+bXI
 zGevZnNaIWFlafY5wlhTA21jli1yzUuPleD4m+abBEqxddtuNI3QKbZccvSk9521xpQD
 T9sRPucI7pxtiRU9XprEwd9yDCtxwSxrLS8kyNsnt5h1bVIuQ/q+8LkHKG0c8CvQXrZH
 hrR2/Oh6qPHcZEW1Eg+Pmpz6VAvHTrs2ilKfLz73ITmDRJbYZXPckJ4AibkFMxEWZYo7
 m30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DOSc99TPq+iHWlIgbzJ98LWgMViJiAlVN8DFv6VjtBA=;
 b=Q1LWhy+ypGkbovO05j7KLz12n3K3zhXOfT636GVZ40pPYIIXFtWNOlPbNfcW5194/m
 A8IEg8PukX41mjpmd5Mnqpr5kcWqDHEtjePABEzq3LLPChtGpgYHKxr3leyQUiOCAVw6
 xxKhXPb56gKRK6YtPxuyLEksgOh0KEHYnPdOHHNjWF1A34lt4KGqp5/K+o4sirRO83cm
 /osm25sZU/r0+HJfgsGnJnTMqLxnIDAGv6E3eky335KbVzAQaNefYpA5XRV8A4TT+i+H
 f7ID8pYUUK7/QvcdHu9a7/9pyIkIfjps7+3sEsbzi3lBPmNFCXfTiOD0dUOHFmRRgwcV
 FkTQ==
X-Gm-Message-State: APjAAAXoAIucmLISyloRyEgl0elTHygzEpl1S4YhjQc4kJiGteb+WPhA
 /gYlgDy3rk6J20XlCUjmMhhWpw==
X-Google-Smtp-Source: APXvYqyab/KhgX4tEBk+vKHbbISLD0djP1bMkjJ45HXLkX1dyVu5lzi2ds8l8NleI0N5ATzhkWD/dg==
X-Received: by 2002:a63:7019:: with SMTP id l25mr18907486pgc.132.1581968384536; 
 Mon, 17 Feb 2020 11:39:44 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 r8sm233396pjo.22.2020.02.17.11.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:39:43 -0800 (PST)
Subject: Re: [PATCH v5 67/79] ppc/spapr: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-68-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ee4d5e6f-2859-73e5-01a9-627bdee50a78@linaro.org>
Date: Mon, 17 Feb 2020 11:39:41 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-68-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
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
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


