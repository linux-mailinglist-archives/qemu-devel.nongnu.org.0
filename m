Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9C6F4B09
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 22:12:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptwLQ-0007y6-Od; Tue, 02 May 2023 16:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwLO-0007sr-D1
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:11:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptwLL-0002V3-L8
 for qemu-devel@nongnu.org; Tue, 02 May 2023 16:11:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f173af665fso27226495e9.3
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 13:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683058279; x=1685650279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G8W8uovREul2fjSz4ctWSs8on3qfCZtGwx3akPGfCho=;
 b=GhDde+IzRT/Iz2MyV4B6i/1fNEtgBuT+ASzKpunfyXCUY7EOpb1e7BqeFpzr1l1qbi
 tXt/SDokiQImuBpzan2H/qu8dLRELqmX3S9e+2Q83BikF4khnx2bAP84+mXYIwDBxHki
 MGhBaRWybXoSrd72i+4630ypP0itjKAc+XW0qLLQicybv2y08ZfHmXi7z1cS6+dmrAbj
 4kuidZOkYQjhrouK/wyNMFPUDbM9xpvLz/JtdTI8/1gU3JlABj6ALqepr2xCasPyYtmi
 pgJdP8fWRyuh03NF0AGxgkkaDap6nenu2eFV8rFgc7Omz9HExw+6O4IdqMlBUFolzshH
 sPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683058279; x=1685650279;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G8W8uovREul2fjSz4ctWSs8on3qfCZtGwx3akPGfCho=;
 b=RELCTsUeQf257YYS3x2HBXFk7lAw1Zw6weTKcIw0OcDR5r+ThEh6rRGqaCrbMnhazy
 0Hgn63YKiKudGWmhdkIwXlmy1NRIktSgNqAiuSyn1KsDWfzjU8uut3ccHle93itP75lg
 oT8WYXdCLHzwVhx8UJiTe0RsfT5RKsTVkJobwTDIh9x2DjgYIrEZsJ04snlbgfpZ8ImC
 sINgDU7aHQg5Y7WG46IJSebXPGx0ILOinEWr1kmRtKDtfN2Ti8z7RTj06UQocX78Xfsf
 kB7vTg3PvfmzdseDoKugHOYk3lKpadKOvnPLcx8CqWlUCK9WaWQpgxB+4ETt6bwk2vh+
 OATQ==
X-Gm-Message-State: AC+VfDxqUaRvgok3zJb8oTg+1tyYuzFRqgwHS8rWRdNeyINjaFuHOxC9
 /q4EihXBrOTKo0x9o1GpbAWyAg==
X-Google-Smtp-Source: ACHHUZ44PCy7E/XtvFkW3m5C1otW6y1vCSFg3OHlv31ZzM1H4SpQLbtJM5WZats+tadljGs04jmZvA==
X-Received: by 2002:a05:600c:2219:b0:3f3:1fa6:d2a8 with SMTP id
 z25-20020a05600c221900b003f31fa6d2a8mr11326218wml.25.1683058278803; 
 Tue, 02 May 2023 13:11:18 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:5063:9fcd:f6cc:e52d?
 ([2a02:c7c:74db:8d00:5063:9fcd:f6cc:e52d])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a5d4751000000b003063a92bbf5sm1769813wrs.70.2023.05.02.13.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 May 2023 13:11:18 -0700 (PDT)
Message-ID: <80f6b30f-5d3f-5e43-5472-2108b89758aa@linaro.org>
Date: Tue, 2 May 2023 21:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/19] qemu/bitops.h: Limit rotate amounts
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <20230428144757.57530-9-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428144757.57530-9-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 4/28/23 15:47, Lawrence Hunter wrote:
>   static inline uint32_t ror32(uint32_t word, unsigned int shift)
>   {
> -    return (word >> shift) | (word << ((32 - shift) & 31));
> +    shift &= 31;
> +    return (word >> shift) | (word << (32 - shift));

This is incorrect, because if shift == 0, you are now performing (word << 32).

I agree with your original intent though, to mask and accept any rotation.
I've changed these like so:

-    return (word >> shift) | (word << ((32 - shift) & 31));
+    return (word >> (shift & 31)) | (word << (-shift & 31));

which also eliminates the useless subtract from word-size-before-mask.


r~

