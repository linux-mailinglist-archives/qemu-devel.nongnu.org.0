Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB303273A1
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:24:14 +0100 (CET)
Received: from localhost ([::1]:52958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPng-0000Uh-LL
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPkT-00074u-Tn
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:20:54 -0500
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232]:34293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGPkR-0003dl-NX
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 12:20:53 -0500
Received: by mail-lj1-x232.google.com with SMTP id r23so16645406ljh.1
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 09:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=50I85kwi4TsdGYap5vZoRzId2DUATjLVUntOirnqCOY=;
 b=eHJCSyeLLoI/7S4O9VDhKM5P9e0SXjGuycGl2C8IlSKOEsFwVsg7W1nm3s6XdNesow
 ayXLk4RJL+grrjcS/PK5yRD4n2dfm9D/lB9uZWR+BgkpwAj5gJEjMtgIxkr2OQlwbGgS
 4E3D+H1+4WFHEolBFY5mvYJNdEnsL3PvV0VvhWesb7haAqt45PNTZ27yiC1CUhK2B8ZT
 UPPGnOIGP9dHa9vN05cbsmPB29HxvaY5FuquiYPZNs29/gL6gXmDF7TUs44bshfNPJh4
 AUwndwg8dUTaGRx318iRsFQrrk8ixg6ig6pi+aanC+gmL9MepkBy+Yd8oske1UBQAe0K
 PSHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=50I85kwi4TsdGYap5vZoRzId2DUATjLVUntOirnqCOY=;
 b=J5F7e9iDFeWFQrtmOLpKO5kGNh6t1dG4BYZTflKY3Jzpj+VjfG0bVvW/vTGz/D5vG8
 shm9sm6ySRfGyk+dtsFIk7tOxI+r3LCiVwnWzhb4l+YDziUGLmCTwXXVGoNpKMqgBwTH
 y2/egbNNRrUm7YC5SgYpf1b9zq4pbs0WbDgH4rUnn5z4+Sb3w5DSimJ3qnVyMtHACbVA
 bit3jnv9sK2xvHCbmt+RFqP/dEO0Ome4kMurWL5wbR9aSiO4rmCFHYmHtDoK8S2uPtxO
 neMtDdEeGoZaxDARqzKH7C988xv3Du7RlykUE0d9hiyIOTp0B8pbV3qAkV+vnijyNBUv
 pQbA==
X-Gm-Message-State: AOAM532cpyl9KRMiIs1AdRQz/B4w6NSQhl+wFDHsvrgW6E5LMRCFWgyZ
 rC174ePl88QR/k6zKXdwFWlyH6+r3JM=
X-Google-Smtp-Source: ABdhPJwiR/Gsu9K94UpvByS1BhObftMqBvAfF612GskXpKttz0ooswvigb3gdHdyhMDP9zJXuTeTkw==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr7640021wrw.235.1614528858794; 
 Sun, 28 Feb 2021 08:14:18 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h22sm21872390wmb.36.2021.02.28.08.14.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 08:14:18 -0800 (PST)
Subject: Re: [PATCH 1/2] target/mips: Fold jazz behaviour into
 mips_cpu_do_transaction_failed
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210227232519.222663-1-richard.henderson@linaro.org>
 <20210227232519.222663-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8102bde6-d2d3-0058-dddb-db295ce5bfac@amsat.org>
Date: Sun, 28 Feb 2021 17:14:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210227232519.222663-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::232;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lj1-x232.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 2/28/21 12:25 AM, Richard Henderson wrote:
> Add a flag to MIPSCPUClass in order to avoid needing to
> replace mips_tcg_ops.do_transaction_failed.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/mips/cpu-qom.h   |  3 +++
>  hw/mips/jazz.c          | 35 +++--------------------------------
>  target/mips/op_helper.c |  3 ++-
>  3 files changed, 8 insertions(+), 33 deletions(-)
> 
> diff --git a/target/mips/cpu-qom.h b/target/mips/cpu-qom.h
> index 826ab13019..dda0c911fa 100644
> --- a/target/mips/cpu-qom.h
> +++ b/target/mips/cpu-qom.h
> @@ -47,6 +47,9 @@ struct MIPSCPUClass {
>      DeviceRealize parent_realize;
>      DeviceReset parent_reset;
>      const struct mips_def_t *cpu_def;
> +
> +    /* Used for the jazz board to modify mips_cpu_do_transaction_failed. */

Isn't it possible to have other (old) boards doing something similar?

If so any target can overload its CPUClass with the same boolean,
so:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +    bool no_data_aborts;
>  };

