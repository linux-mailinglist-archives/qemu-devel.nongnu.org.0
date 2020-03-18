Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA7018A368
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 20:59:04 +0100 (CET)
Received: from localhost ([::1]:57692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEeqE-00007o-Vj
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 15:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47875)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jEeot-0007bK-SR
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 15:57:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jEeop-0001v4-7I
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 15:57:39 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:36657)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jEeoo-0001gy-T2
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 15:57:35 -0400
Received: by mail-pl1-x643.google.com with SMTP id g2so9141990plo.3
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 12:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SfifZN2LfHh6ueoZ6ciAcGJnVw4PMaTiQsypNeYvvyw=;
 b=hFEpeashxxC+xsNUOpbAhFGsvfegul5e6MXizzSAIuoROx754INkdwMqbXZ4FWhEYt
 zWW/LFjFmyLf7too9SbKb9jHYsIqPWKvrglpwnwsMNOG1LvzBXll1bBiV4O/KsWVw5m3
 psenE9ULMYmfIlA4YOvSDUkkTpI5XcEyKHtD16HgOHS5nVKDg5oNusEgcMP9PkjS9Mc9
 sDpxUkG1rqJLGx9qJ7F5OUlIXiPBcJ4NpnSAvgPxdnO3ifryBwQb1QVO7zfYSa2akFBm
 CvSpFfwzwsZjNb0TfL58IiR2qoaIPHTgcBzTUrRnFSELVnchFnYxEhkv9pSPkgeqMPd3
 e6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SfifZN2LfHh6ueoZ6ciAcGJnVw4PMaTiQsypNeYvvyw=;
 b=ISkdEiL1xuqLZO+I0kGwmM750LhpNhAioT3IdvcOOalxVv1BMmd7V4foo6vrz5UUr3
 hIXddjmOQY6cukx6RX7aDnQ21YJkCVp/FHXS/83/MuVfxg47ZOKk+n6/sj6fnjNlSAxG
 dYdZ190mDn9PMv5HZVk93aSEJDDMVs/JxLyzHxJCEiRgPzzAGYq3WE+tYnvSa2Vf0VZa
 UL0t49rSY83j5lQkbM6o9U3n/I7PAfhoARKf8TsyOxccSnBGvogN15lJFHIklmIWzgbR
 33znet//G3waa5lQ3EK1Hwy/Ifj8ykUtVThdRp/iQ/DrpeVnYPHgbueYjboe23D6FH3p
 /sqg==
X-Gm-Message-State: ANhLgQ1iUkrA8g33xx4RdKFBvZDQYZ/zf7z5wDXe6HRJLM4FkGS01S8g
 ojmbl8sV/cGFPhjyeFnVwOMpQw==
X-Google-Smtp-Source: ADFU+vsZ432fPyUOzVfMpuW9g2zC/zgI60WUbGjzoPhCVl3IC93pXpTbOneqSdKTzx+re6ePQfyh3w==
X-Received: by 2002:a17:902:9b95:: with SMTP id
 y21mr5463410plp.101.1584561453815; 
 Wed, 18 Mar 2020 12:57:33 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 d1sm7249399pfc.3.2020.03.18.12.57.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 12:57:33 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] target/ppc: don't byte swap ELFv2 signal handler
To: Vincent Fazio <vfazio@xes-inc.com>, qemu-devel@nongnu.org
References: <20200318170116.1922-1-vfazio@xes-inc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8d76e1bf-2149-b995-3257-fd40eca6ccf9@linaro.org>
Date: Wed, 18 Mar 2020 12:57:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318170116.1922-1-vfazio@xes-inc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Vincent Fazio <vfazio@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/18/20 10:01 AM, Vincent Fazio wrote:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Previously, the signal handler would be byte swapped if the target and
> host CPU used different endianness. This would cause a SIGSEGV when
> attempting to translate the opcode pointed to by the swapped address.
> 
>  Thread 1 "qemu-ppc64" received signal SIGSEGV, Segmentation fault.
>  0x00000000600a9257 in ldl_he_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:351
>  351        __builtin_memcpy(&r, ptr, sizeof(r));
> 
>  #0  0x00000000600a9257 in ldl_he_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:351
>  #1  0x00000000600a92fe in ldl_be_p (ptr=0x4c2c061000000000) at qemu/include/qemu/bswap.h:449
>  #2  0x00000000600c0790 in translator_ldl_swap at qemu/include/exec/translator.h:201
>  #3  0x000000006011c1ab in ppc_tr_translate_insn at qemu/target/ppc/translate.c:7856
>  #4  0x000000006005ae70 in translator_loop at qemu/accel/tcg/translator.c:102
> 
> Now, no swap is performed and execution continues properly.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
> Changes since v1:
> - Drop host/target endianness callouts
> - Drop unnecessary pointer cast
> - Clarify commit message

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

