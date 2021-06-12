Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C543A4DFC
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Jun 2021 11:46:37 +0200 (CEST)
Received: from localhost ([::1]:53180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ls0Dr-0001x8-Ru
	for lists+qemu-devel@lfdr.de; Sat, 12 Jun 2021 05:46:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls0CZ-0001DU-Qz
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:45:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37611)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ls0CY-0008KL-4n
 for qemu-devel@nongnu.org; Sat, 12 Jun 2021 05:45:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i94so8611030wri.4
 for <qemu-devel@nongnu.org>; Sat, 12 Jun 2021 02:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z3YNIvY1qck4wu/yC2ENJ4wJ5RlAuprfWyviz0JbUCE=;
 b=j2Xa6hHbmR5z1v9zj0h/g3W3c4c4baQBk9QootDYPe3z/X+IxVUTrCFsq6WrZjz45o
 Wrl1bKihXgjKQV6S83Q2G2pHMqaxK71786NcQPyo1Lj2KrN6pAsOt43i1QN9aBAbiqc2
 y6hmzD2JVLwraDAp6JW/x0DsvcsSrp/zQ3adID+aYfCY/ee4l3kVVIy5yusOSicQ4UOZ
 Ma0IZveQN+jle/vp8AtF0H6htUMr6aDsJMx2RLd3Swu9M7ns0OVffp5HQN8+oSTtAu5j
 VTpLfy5Tm1eiAShp6n0ac4ombkHJkK1+nTHMOugFm2SOfbGLTEcCQMDJajWxE39St2KK
 ASSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z3YNIvY1qck4wu/yC2ENJ4wJ5RlAuprfWyviz0JbUCE=;
 b=mDl6oumsb538owH0avf/8CPca+DBhoxkLxBDhRWTX3peXU55gGY4pq9BvLxHarp/Qr
 XGJMMiIY4iac8aW3MqgqLDM/amN56r6DI9elrtCbZswFFB+hRusdzPtBW1EHrNXCNEQh
 c4lcLsRLJjeQ00lj2QSA4Mab3E52xCnIGmF/6ChsfF3iFqJaQ0KGuX1mt02LgByiSfO7
 QEwHGBK6cEnJtP8O/CxkXyZT0edXlRCz8uVyTf2ww3joL2i7innwNftiEJjjuiKbT5Mh
 PAnZVnIIqBTWw7GUfHKB3FRNO23DNdG5vTTAClET551oSDUFk1ZtcKJvE8TksFA1KF17
 zwvQ==
X-Gm-Message-State: AOAM530aQ6pMMmPYWIP8BtPgpyQPVoOgrsDAqzTJ4ttKo0lagEOx5TCi
 rJs4Xzc6bowQchWb7boHJguC7DBbKuxAJg==
X-Google-Smtp-Source: ABdhPJxAHOuSzdN3sn1VrfL3g7hj14gcNqQVmaIltEsrx1keeuyP3KXgVKCyKJfQAj/p1X/yXsbEqA==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr8427134wrv.252.1623491112195; 
 Sat, 12 Jun 2021 02:45:12 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id w11sm10147105wrv.89.2021.06.12.02.45.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 12 Jun 2021 02:45:11 -0700 (PDT)
Subject: Re: [PATCH v7 16/27] tcg/tci: Implement goto_ptr
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210601150106.12761-1-richard.henderson@linaro.org>
 <20210601150106.12761-17-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5db2b70a-637c-038c-fccb-395bb64819ae@amsat.org>
Date: Sat, 12 Jun 2021 11:45:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210601150106.12761-17-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/1/21 5:00 PM, Richard Henderson wrote:
> This operation is critical to staying within the interpretation
> loop longer, which avoids the overhead of setup and teardown for
> many TBs.
> 
> The check in tcg_prologue_init is disabled because TCI does
> want to use NULL to indicate exit, as opposed to branching to
> a real epilogue.
> 
> Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/tci/tcg-target-con-set.h |  1 +
>  tcg/tci/tcg-target.h         |  2 +-
>  tcg/tcg.c                    |  2 ++
>  tcg/tci.c                    | 19 +++++++++++++++++++
>  tcg/tci/tcg-target.c.inc     | 16 ++++++++++++++++
>  5 files changed, 39 insertions(+), 1 deletion(-)

> diff --git a/tcg/tcg.c b/tcg/tcg.c
> index c8e6dfb845..3d856371a1 100644
> --- a/tcg/tcg.c
> +++ b/tcg/tcg.c
> @@ -1353,10 +1353,12 @@ void tcg_prologue_init(TCGContext *s)
>      }
>  #endif
>  
> +#ifndef CONFIG_TCG_INTERPRETER
>      /* Assert that goto_ptr is implemented completely.  */

Maybe expand the comment briefly explaining the TCI case?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

>      if (TCG_TARGET_HAS_goto_ptr) {
>          tcg_debug_assert(tcg_code_gen_epilogue != NULL);
>      }
> +#endif
>  }

