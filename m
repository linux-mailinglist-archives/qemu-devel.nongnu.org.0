Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C35161B9C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 20:30:21 +0100 (CET)
Received: from localhost ([::1]:51808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3m5z-0000Ek-V3
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 14:30:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55293)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m4M-0006fw-VG
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:28:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3m4L-0002zE-W5
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:28:38 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:34529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3m4L-0002yN-Qo
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 14:28:37 -0500
Received: by mail-pf1-x441.google.com with SMTP id i6so9433984pfc.1
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 11:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jbUdH6Eujzo6rno2n4kS6BU6fJkjgt6ImnztGIZKbEs=;
 b=O0aPq3tea21QxVjOCFa524jNQ/Jg7CjpEhYy6Fm+0e1gK6IL+R5+0UZPC1yqT7/5ay
 a9S5ZMdKZy3QwjbDX1+IwYi6CTSC3KQ49Qqk5UMhY/Ct8ETe1X19RRYB1y1c4mGUgNyc
 8zfH801HxkhpTbOoZS2la6+FKXn3Yh2LdkUv7wpCkS1N2GsYJsxkinjgzREDrCBtx9U2
 h20Y4J+EsjUnOS+7GhxYkFh+MZ3gOhmtvWFa2a27yH6wj9HjaAQ+V5Qi7xMNB2HzbrXf
 FiGzmcY0wN0cxKfDZ/Aj3PKrZsTkAXPlziyebvZBWr01nOWGNHfuI7ofV3ybsRy5X+Hw
 lyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbUdH6Eujzo6rno2n4kS6BU6fJkjgt6ImnztGIZKbEs=;
 b=AMgs566/wIkpe6RsJCMDkcdcd1FVTf//xYfRFZNwNUG909N4n1KlimliWnip7Aw82L
 o5e4C9dfQZleGVflf/hrtZJiktPDUBRU2i9iOZYQsqNuAt+qWDEkOWXtm520ju7h8pST
 2/Pc8n9R9Ej6kxTcpbmPPNkIlMo5QBBy7NaZJJvgZOu9VKAFb3KVM9GXBZ5BG9y14hnr
 reIHhuzVfosrkeKUOpi18xmVM4vWSLRUkX6bJ4P7/AKuc19LwaskIXzOuHBvSTyZjJtp
 NN6Ztc/kjqvYlhHY67+W28VpzApjWYv5o94nymIveUiQv/fwFK7UDTsOzWvc7FbUZTcO
 jd1w==
X-Gm-Message-State: APjAAAWte7pjuGPJpwahdZClI2o+o5wA404zlsy2Mr5PaalFFupra11m
 W7RUDgxmPmk9qpZrUyUOy+ITGXQCBpQ=
X-Google-Smtp-Source: APXvYqxhza4gVzxV8p81rAM5BqAmd66CXsB97iGqhVJFF2LLGoYRK/88wEvXBba5s5iqlQ3EPhANaQ==
X-Received: by 2002:a63:6407:: with SMTP id y7mr19126155pgb.45.1581967716818; 
 Mon, 17 Feb 2020 11:28:36 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 c15sm226191pja.30.2020.02.17.11.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 11:28:36 -0800 (PST)
Subject: Re: [PATCH v5 43/79] x86/pc: use memdev for RAM
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-44-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <da36261f-8437-fa5f-5608-3ecf70fb7811@linaro.org>
Date: Mon, 17 Feb 2020 11:28:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-44-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, mst@redhat.com, ehabkost@redhat.com,
 rth@twiddle.net
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
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> ---
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


