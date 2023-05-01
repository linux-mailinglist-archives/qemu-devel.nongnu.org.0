Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 086BC6F2FED
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 11:38:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptPy2-0007AH-Vc; Mon, 01 May 2023 05:37:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPy0-00079w-Hp
 for qemu-devel@nongnu.org; Mon, 01 May 2023 05:37:08 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptPxy-0005i2-PR
 for qemu-devel@nongnu.org; Mon, 01 May 2023 05:37:08 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-2f9b9aa9d75so1283463f8f.0
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 02:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682933825; x=1685525825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2Ulfu//JSlmd4ioDoRY8oEQyfdEQ+vz2PWQIyipab1c=;
 b=yEBwc2uGTktjSACyb4T4mb8fQDr6Y8u9PE9Zo6OruZw7o5BPBE588xDJYg/IgHVU9e
 qbNUi537t9o1aUHwYpwiPNFtQrNbIuQ0dsbXTiIelszCjpZwrN+tAIXm/qV8UggtPNaN
 FlGV6N5knWTRH5oVtuozbhwOTXmPsqxnwk1z/XarHv3SVKzn0ifhp0Hnm0R/Hbqk9mqX
 /aLE/x0DEpnpjFx5iNO+PirxxQjBr+gQCXi5ymjgHMQwoSi4UaeauBWB+/0ql51e5u5S
 0N+Fmeag56qD7pcYKB1qQtJrf8qturPydybLKMAdSkW1tHcP++/HQkvSr23oGURbwH7o
 bGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682933825; x=1685525825;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2Ulfu//JSlmd4ioDoRY8oEQyfdEQ+vz2PWQIyipab1c=;
 b=RvMPFC53XMdg8d0MeRT4XJTw3q028gsPbf20httpKqMZGZG7qPbgKEkROIBCpIjHps
 ln/Nk1rGqPXzc4mSjbv0gpATZPclm+A8leWNs3unRYxqIOmiFlsXSDkGtcedAN7AuJ5q
 f5y8ZA2cTS8ySt+5z6oCF+9soN9YvBymyRhSHqlMLdeBSS923L/0uk7sy6jT24otaFi/
 whtUYLJgSasDv6AUVXURprP1Im7YK2R09ktE184bfBrOjANFZrXA03RkCJ9xoxoETnfO
 yC2CsBGyFMqTFSgeMhsjJdVnlVaJI2nPNX4+y4LNUl1ZvnMn/LhWOzd3WSD9MPZm7ZXL
 Oh3A==
X-Gm-Message-State: AC+VfDx6XAyAOaggLZdnADwezn4noxG5/8ZArpSRKMElF0YdpNTUVTZk
 Ql5bkcjas5nJxJ2lu4NRG6cbXA==
X-Google-Smtp-Source: ACHHUZ5GNhz6WQRMF564ntncCOo25bwRq7XMtiVWPJBvDQm2K6Vo17sLKjKEzX3NucIdGZr943ALFg==
X-Received: by 2002:adf:ed12:0:b0:2ce:9d06:58c6 with SMTP id
 a18-20020adfed12000000b002ce9d0658c6mr9482991wro.53.1682933824721; 
 Mon, 01 May 2023 02:37:04 -0700 (PDT)
Received: from [10.175.90.180] ([86.111.162.250])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a5d48c7000000b00306315583ccsm831073wrs.41.2023.05.01.02.37.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 02:37:04 -0700 (PDT)
Message-ID: <64915da6-4276-1603-1454-9350a44561d8@linaro.org>
Date: Mon, 1 May 2023 10:37:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v7 1/1] arm/kvm: add support for MTE
Content-Language: en-US
To: quintela@redhat.com, Cornelia Huck <cohuck@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org, Eric Auger <eauger@redhat.com>,
 Gavin Shan <gshan@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Andrea Bolognani <abologna@redhat.com>
References: <20230428095533.21747-1-cohuck@redhat.com>
 <20230428095533.21747-2-cohuck@redhat.com> <87sfcj99rn.fsf@secure.mitica>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87sfcj99rn.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/28/23 18:50, Juan Quintela wrote:
> Pardon my ignorance here, but to try to help with migration.  How is
> this mte tag stored?
> - 1 array of 8bits per page of memory
> - 1 array of 64bits per page of memory
> - whatever
> 
> Lets asume that it is 1 byte per page. For the explanation it don't
> matter, only matters that it is an array of things that are one for each
> page.

Not that it matters, as you say, but for concreteness, 1 4-bit tag per 16 bytes, packed, 
so 128 bytes per 4k page.

> So my suggestion is just to send another array:
> 
> - 1 array of page addresses
> - 1 array of page tags that correspond to the previous one
> - 1 array of pages that correspond to the previous addresses
> 
> You put compatiblity marks here and there checking that you are using
> mte (and the same version) in both sides and you call that a day.

Sounds reasonable.

> Notice that this requires the series (still not upstream but already on
> the list) that move the zero page detection to the multifd thread,
> because I am assuming that zero pages also have tags (yes, it was not a
> very impressive guess).

Correct.  "Proper" zero detection would include checking the tags as well.
Zero tags are what you get from the kernel on a new allocation.

> Now you need to tell me if I should do this for each page, or use some
> kind of scatter-gather function that allows me to receive the mte tags
> from an array of pages.

That is going to depend on if KVM exposes an interface with which to bulk-set tags (STGM, 
"store tag multiple", is only available to kernel mode for some reason), a-la 
arch/arm64/mm/copypage.c (which copies the page data then the page tags separately).

For the moment, KVM believes that memcpy from userspace is sufficient, which means we'll 
want a custom memcpy using STGP to store 16 bytes along with its tag.

> You could pass this information when we are searching for dirty pages,
> but it is going to be complicated doing that (basically we only pass the
> dirty page id, nothing else).

A page can be dirtied by changing nothing but a tag.
So we cannot of course send tags "early", they must come with the data.
I'm not 100% sure I understood your question here.

> Another question, if you are using MTE, all pages have MTE, right?
> Or there are other exceptions?

No such systems are built yet, so we won't know what corner cases the host system will 
have to cope with, but I believe as written so far all pages must have tags when MTE is 
enabled by KVM.


r~

