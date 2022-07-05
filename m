Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA4566540
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 10:42:28 +0200 (CEST)
Received: from localhost ([::1]:32936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8e8Z-0003AC-QF
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 04:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8e6m-0002CK-6C
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:40:37 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:40637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8e6a-0005Wt-Uq
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 04:40:35 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so16079010pjl.5
 for <qemu-devel@nongnu.org>; Tue, 05 Jul 2022 01:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dh2kYoKUsV4vjCNfJaAlP3HQhPqPP1lxSx9kkKh/r2Q=;
 b=vauWLLbcyZxDXHZEqCKYAj37oxk6hFyZIWLql+2bJboh7q5yMk7VNqmzLU042YXN9P
 KLOttjMbdO4AShNtI8Rr0chTvolvQqbRxXY0UeLY5QNTOLdazo4BV7RQbXk7tE8JD2iz
 N7JT0gLyYatm3YbrRs4cb0s0NwnBbwgSkoE9QtIimwTXlihUE/PPQpVuH2apA1HcsiCs
 OiDu58VKtXyTlLZABP+QSF/PCqpxP54jjdbPROiUh0PR/35aWzVn6Ztm9d5InBYcQ/3P
 C9Lt2Y9NYIkgE6gNJbjworQQWcLiLkNCFFA3XKMkJTrULomcT/YR58d8l7GRUR89PIXy
 kV/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dh2kYoKUsV4vjCNfJaAlP3HQhPqPP1lxSx9kkKh/r2Q=;
 b=W1UalweLuLDI6oVSfh3ojETYrW0mWIH7bF5gw8UnTT0xh7CHQswm+91ml23WxHBx7n
 g10qmiAUtv2EGQx8R8cHUXH4llcZXz8RyP3ldLmicu3OgYdab53pI4gjJmCVIwtWuNSq
 4PXm08VGkUz4onbFdA/10xijCtgIwnwM7dcF1xrR5MFNiWZqXKsJJCmlh0LA8wAdjFmW
 97XSMhbEWCnccF/ZZJIg14ecNkRJCu3/ym7eTpRHGW7ukVrT6yCUH51JCcLidgcioODD
 qoje1EORP/foSl4j1t/PEunHFcs6p5Jcemiewgi3RKi+gtqOsv2rCyIaj3edi86hsYqz
 K7lA==
X-Gm-Message-State: AJIora+YS0BRvzQ9ZpRY4gLjC+bbU+fZ3b12B6oAzNHFux+1OmAQmiiP
 UnQKo07lOBYbV8yjY0ARAwHqGWD+iXi2mJk/
X-Google-Smtp-Source: AGRyM1u+ItQKdgWOxp8VDknzNoc3aAtRnrMgC5DoxlpQG7okj4A04tiVHU84IhQg/PnEgkg41RfHzw==
X-Received: by 2002:a17:902:7596:b0:16a:3bea:11eb with SMTP id
 j22-20020a170902759600b0016a3bea11ebmr40503270pll.154.1657010408265; 
 Tue, 05 Jul 2022 01:40:08 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 i17-20020a170902cf1100b0016be24e3668sm4003407plg.291.2022.07.05.01.40.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jul 2022 01:40:07 -0700 (PDT)
Message-ID: <7c659db6-7033-9817-069f-2d9052cdba2a@linaro.org>
Date: Tue, 5 Jul 2022 13:59:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] target/loongarch: Clean up tlb when cpu reset
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
Cc: yangxiaojuan@loongson.cn
References: <20220705070950.2364243-1-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220705070950.2364243-1-gaosong@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/5/22 12:39, Song Gao wrote:
> We should make sure that tlb is clean when cpu reset.
> 
> Signed-off-by: Song Gao <gaosong@loongson.cn>
> ---
>   target/loongarch/cpu.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Applied.


r~

