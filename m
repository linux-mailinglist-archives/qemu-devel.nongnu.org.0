Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9771363796
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 22:43:57 +0200 (CEST)
Received: from localhost ([::1]:50748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYEGq-0004Gv-N7
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 16:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEEX-00036y-6E
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:41:33 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYEES-0005Li-5F
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 16:41:32 -0400
Received: by mail-pl1-x62d.google.com with SMTP id y1so971663plg.11
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 13:41:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RKwN5wbPd4Q4vo7q+I/dmTOQQZy2/RuuZpdBPLp1Cek=;
 b=Pk0EXMgYvoyAaiM3uxqJClGww1ErZWtfeq46K+QCLOhWBNNUNZe+K+1+4909IaGB4W
 n0VQgtUUz1piiO+y+aisZxRSDjfnG1m40ZcQdc2OWMx38Gzmei4sD0N4jw2/ZlcwXA3F
 hHRPqiHAYrXH1V7dKAnBY5keN9PKC6P/JunVh+9CXx6Hb4Qd7Um2F82HNml5zmjG9AdD
 bkGBiVyJCyNd1co3Mo2UN24HABfNDJXPOlpDAZwiPn3FwzH4/NodYrSfd2N4h9R7LGU2
 REy6aFSkpRihwhGI0zOngns+p6bGESMhUbg/drZlLnEDVs2WK6HTwVgm7IhRJ43DMnRn
 tolQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RKwN5wbPd4Q4vo7q+I/dmTOQQZy2/RuuZpdBPLp1Cek=;
 b=ivj+ZwBAs9+dR2fkxGIkTTOj/G8AobLr4covxKI8wMkPCnJM1/lfBhEzsXuDu6tiGh
 raAb22xiEZXQs2htQQvNslafTsLtCd0NF9+VRAJCVEhWnjTIOKmFeJs6W6M6YvfEA/26
 M0e5J4JJl0B6+Vv3RfKA1kesyIvEpMreWHvRh9PWXoV7+7FdBAI56SBKl3nBDiPEs08L
 7giAR+4zobtSwv5vn5ciL+HLg++B4VcZlP3Ql2YMkXOMd6EJA71ioLFset/zCLTypQ22
 nUOt0FtvdSd8VaQUAncifZsaS2JXX+Aw6UIX+DEEO3d1tKKB6ih701vxK+rBcL9gCN9N
 DYsQ==
X-Gm-Message-State: AOAM533DNPrOB9JaoDDc4CFdv+gbnb58gZ6I1/d7HLeCwU3OHLD6BMUE
 FGP9yCP0QLzvuDdohR8RcEwUzQ==
X-Google-Smtp-Source: ABdhPJwn7qvNRSxmAD2KPhU/732cO2233aLzuvuNOKoX5xmAB0es+LFoiQPyuT5R0MVZRJfKAznwnA==
X-Received: by 2002:a17:903:2285:b029:eb:d7b:7687 with SMTP id
 b5-20020a1709032285b02900eb0d7b7687mr19489478plh.82.1618778486734; 
 Sun, 18 Apr 2021 13:41:26 -0700 (PDT)
Received: from ?IPv6:2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3?
 ([2607:fb90:80c6:1fb0:d9de:a301:99b4:6cf3])
 by smtp.gmail.com with ESMTPSA id c21sm10520014pfo.91.2021.04.18.13.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Apr 2021 13:41:26 -0700 (PDT)
Subject: Re: [PATCH 25/26] hw/mips: Restrict non-virtualized machines to TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210418163134.1133100-1-f4bug@amsat.org>
 <20210418163134.1133100-26-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e993b531-925b-e58b-e65b-71ff0c90a930@linaro.org>
Date: Sun, 18 Apr 2021 13:41:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210418163134.1133100-26-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/18/21 9:31 AM, Philippe Mathieu-Daudé wrote:
> Only the malta and loongson3-virt machines support KVM.
> 
> Restrict the other machines to TCG:
> 
>   - mipssim
>   - magnum
>   - pica61
>   - fuloong2e
>   - boston
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/mips/meson.build | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

