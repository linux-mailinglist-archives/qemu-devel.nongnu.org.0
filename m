Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC01619DC
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Feb 2020 19:42:16 +0100 (CET)
Received: from localhost ([::1]:50686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j3lLT-0000R3-7K
	for lists+qemu-devel@lfdr.de; Mon, 17 Feb 2020 13:42:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48154)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lK7-0007qR-UX
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:40:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3lK7-0007OW-1k
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:40:51 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35339)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3lK6-0007OG-Rd
 for qemu-devel@nongnu.org; Mon, 17 Feb 2020 13:40:50 -0500
Received: by mail-pg1-x544.google.com with SMTP id v23so6257841pgk.2
 for <qemu-devel@nongnu.org>; Mon, 17 Feb 2020 10:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=asaUPZ/SSdNK/iGmvj3kmD3MIJpWIE5xkQPbCdtCCXY=;
 b=iiXTwH2ac7NFyGgBrotqJLwMlYa9zLCnkEbIecfue7dmdPkZ9obSDzUigLiSpFLKfz
 DYBg+NmlkiuplYbkQcHlWJKdl0HDxUGXH6e5tRkOtRYSh+z3HWnxmJWlgepr/ytqYx8g
 JietvKoDhBb5vtvgWFXVu4nNSjB/iDi05USunL+LR1jYZs+6s8tN+jSE4McEwobK12fB
 k5TW9VKbO+4XoJuJD4Owxy+jDwwHR4vnaav1xXZMVzlgyOFrmbXylohgjaw5YRO7lAHU
 k+Codv13+Pv56kBt+IzBXpQDJzgk8AvcTRxFrY86iwU8g793VJwZKiLpezfva30Buvz6
 EDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=asaUPZ/SSdNK/iGmvj3kmD3MIJpWIE5xkQPbCdtCCXY=;
 b=s+Bfa2f/Rgx6lGvuAoxw1r2QBpILpM7VarNkb9OFsFfCA+MuiafI0I86WQ9X/tvZWF
 PxzhOi4Goubw70jFEmFscxmdZjhR+oIf2Ucsl7ZPFCXuRaFlq8ef/+DIdJ3SNYYnaLAb
 NIHCfDSsd1IL4H634gHuXgIuTB1qkZVEqHaeOzxxPyGVpGtl0J6T4wUqnStFNtlaXSIB
 XoYJ3n8rSn7PimCECa+SpnJtWbbD0zS+Rih1TW+o1n95wBtmTCKuK5fDbdWBF9UyvpAW
 6VOCXUaiyVeoFcFGuNHEgu9lXn8vLl4lRhMhwJAZh2hWAo91GtTXFT7B72MTOkOpN2tq
 U+0g==
X-Gm-Message-State: APjAAAW7bXrE+o/Ak2e/tbEx1QTC29zFnm93S4xLPgolxUpQb3j/4XEt
 pRI6LO4DCdeysXts8/GMiyHc3Hese5o=
X-Google-Smtp-Source: APXvYqzC8lslTx7aAzNyXLplumpzifFjWsTC5tSrPA4Xs3aM2pc7Y3LaUwgeBP1T8qQDx3P7ZSdInw==
X-Received: by 2002:a63:fb05:: with SMTP id o5mr19505413pgh.355.1581964849835; 
 Mon, 17 Feb 2020 10:40:49 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 q15sm1592202pgm.47.2020.02.17.10.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2020 10:40:49 -0800 (PST)
Subject: Re: [PATCH v5 75/79] make mem_path local variable
To: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
References: <20200217173452.15243-1-imammedo@redhat.com>
 <20200217173452.15243-76-imammedo@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <23f95d66-4cdd-8f7b-7213-8c2b6944bcfe@linaro.org>
Date: Mon, 17 Feb 2020 10:40:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200217173452.15243-76-imammedo@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
> It's no longer used anywhere beside main(),
> so make it local variable that is used for CLI compat
> purposes to keep -mem-path option working.
> 
> Under hood QEMU will use it to create
>   memory-backend-file,mem-path=...
> backend and use its MemoryRegion as main RAM.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> CC: pbonzini@redhat.com
> ---
>  include/sysemu/sysemu.h | 1 -
>  vl.c                    | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

