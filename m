Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 098C82D360B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 23:20:33 +0100 (CET)
Received: from localhost ([::1]:50516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmlLU-0002wK-2B
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 17:20:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkoi-0006GA-BM
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:46:40 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:41021)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmkog-0005XH-Io
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 16:46:39 -0500
Received: by mail-ot1-x341.google.com with SMTP id x13so189265oto.8
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 13:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oty0wPSO21B92v+ceSRVXFqtyP7fp7aR2WeEKcmjgpE=;
 b=A6rzuDVMJjuhXbPneHmHFW7qT8EWEn9cndw0i57ZR6Ol4Eypncz972umaqmvRE95EA
 mNlAMFwhG74tex3DJVMvLyD3vF+CvL8y0Pbaaex9XRzN+miSsdDKISbn1cfZqcI0FM1G
 Cdn7htEcdZNZ2sSmIAWdvRxOLlVoTNNEQB3miB2Q5M7KM9q+5va/hk9wpYgo9qtTdU4d
 f2ZtkFFKAMbiwuWoNbMCeVvf8ybDgh/9NUnLMhT6HDScn/yfYpLE6ca4vW3uwUKafO0T
 8um2o1GuXrOvluQz3mGMX7BJtX5RcOJ0CM8RuElMv7cAYASfuWPv2DV6/KCGUStv8GD3
 7E/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oty0wPSO21B92v+ceSRVXFqtyP7fp7aR2WeEKcmjgpE=;
 b=iqxI9o+7jrjD4PN6HErlXOfXly9jMOfr+8JQbk74g4HMhmsD7aFYBCBZuoWmkUBI5i
 IE/SIT/bzBdS2f0P2OEbW+1yATU2dRMmTsJs87ufogylnOpa61EX1Fa9rAkKNT8VZfcy
 hgLj+s1GHfk9czs+aPFqXoHiIlp7Z5oDVfnxWpeNISF7Z7Fg4NxFsw0Hzim69qnsg6OR
 9mtgEr0ek2vNYTDPid0ZMMx6Q814JgV/KQjr+Afs3oLwLIJ6zYkrWrX2kdaYHbEsXs0B
 fpwkZ5LkFQpnuliRIFMpSwgajTqFXX8ZtSM1V2w3M6OBLsMPyfICGbPfmKnRZ02yPA8b
 6UpA==
X-Gm-Message-State: AOAM532pEL3NbQol02JlNjoXXrshCl16xnQLuORtRcA9wji+0hjguqd5
 7OyTQGRQYFH7L/Hpc8GfNBqHnA==
X-Google-Smtp-Source: ABdhPJx4jeU+EBSjliJjH96Xla46A3J91fakYZhPMpDfl55wM6KiAlcSFlDlF5YhMKC3GzvQJj8PxA==
X-Received: by 2002:a9d:2ab:: with SMTP id 40mr94611otl.280.1607463996134;
 Tue, 08 Dec 2020 13:46:36 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id m81sm4660oib.37.2020.12.08.13.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Dec 2020 13:46:35 -0800 (PST)
Subject: Re: [PATCH 01/19] hw/mips: Move address translation helpers to
 target/mips/
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201206233949.3783184-1-f4bug@amsat.org>
 <20201206233949.3783184-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <89d90ad5-d638-bdeb-c004-c84002e16d51@linaro.org>
Date: Tue, 8 Dec 2020 15:46:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201206233949.3783184-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Paul Burton <paulburton@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/6/20 5:39 PM, Philippe Mathieu-Daudé wrote:
> Address translation is an architectural thing (not hardware
> related). Move the helpers from hw/ to target/.
> 
> As physical address and KVM are specific to system mode
> emulation, restrict this file to softmmu, so it doesn't
> get compiled for user-mode emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/mips/cpudevs.h  | 7 -------
>  target/mips/cpu.h          | 8 ++++++++
>  hw/mips/boston.c           | 1 -
>  {hw => target}/mips/addr.c | 2 +-
>  target/mips/translate.c    | 2 --
>  hw/mips/meson.build        | 2 +-
>  target/mips/meson.build    | 1 +
>  7 files changed, 11 insertions(+), 12 deletions(-)
>  rename {hw => target}/mips/addr.c (98%)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

