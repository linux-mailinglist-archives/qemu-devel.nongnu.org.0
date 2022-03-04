Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 659634CE053
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 23:43:16 +0100 (CET)
Received: from localhost ([::1]:41380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQGdn-0001xd-GM
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 17:43:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGZw-0003wa-L4
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:16 -0500
Received: from [2607:f8b0:4864:20::629] (port=37650
 helo=mail-pl1-x629.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQGZv-0008Ci-Ab
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 17:39:16 -0500
Received: by mail-pl1-x629.google.com with SMTP id j13so1003197plx.4
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 14:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=RfSK1Xan5lghINkkcWJBRijvWCG995fN3ML+Wy8bohc=;
 b=R+99QhoQiGwDTU4D7CpYQpqmaCrUD4cgd54HoyP9MZE7zQqDm1FyyCbzJ5AbVxA3dq
 gcOvsX7fNRG/kfOC86xtRKOa55zJ7T8F4+RdJeheIDCtT9PiP+/7nWVrXm2rXUf5hhKN
 ZSzO2ZRvwyABGoWX5sySyV/e39iRcdyycSLR0dvzCBTBkNU7PBhRRdaDC7o3tYAgcVdo
 1Rjxeh6wYIIzNO9Wjq5HKsc3IXIZIc8JpUA5lQcqXYOZzRvoAwEQ4obPd5VXyx57Cr9w
 sDwtrqY7DMf4eqsAXLKOgqkHZJW2UlaCVQRTk5AI5xlELKRPNEbibynzNgMIfvpr7IoI
 BPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RfSK1Xan5lghINkkcWJBRijvWCG995fN3ML+Wy8bohc=;
 b=BHv/6B/lnzkuNZwtggJjAABImTVM3nErDniNFwew7XZ7Jp9yTjMpO1y4IATyXfm6k3
 gUiXgrkCFEWa1qFs8/Hcsg69kEvnR/i7UwRNPD+8j0orruPuyIFO/E0GNQJ5MCN0WojA
 Z46yUP3ez/LtXDyquEMyrc7RyFtk5XjpdM6RSIorAYEGCOxXMjEBhTDM7YplYeEXocVR
 m9YfNvF3KNmRG1g7nnnk2wvD6Vx3gRO0Q6DHQgeZYy2NQttrHMTefyiiM8peHvneeF97
 BCeT1F7blvSNCZBEV1/iM39FTKVA7S1OCU5AUgCvd+NEcss9Niw9P1G7gioHbUdjBjo3
 jCqQ==
X-Gm-Message-State: AOAM530Gquqvzy/kmZlfcj2GOfLdo4w4URpRjKhVwwGcoNkrR510gm2i
 xSCWEb+mtZ9Qw8B93eSIfWE9Dw==
X-Google-Smtp-Source: ABdhPJxlh+7h+4x+a5PtRY5FKyVKm4q0FhWp7IkOBE3b1oKrcyJONmCPgfk2KTCPIuydZfdmw1nuhg==
X-Received: by 2002:a17:902:9041:b0:14f:1c23:1eb1 with SMTP id
 w1-20020a170902904100b0014f1c231eb1mr588379plz.173.1646433552931; 
 Fri, 04 Mar 2022 14:39:12 -0800 (PST)
Received: from ?IPV6:2603:800c:1201:c600:f24b:57b2:da7c:e304?
 (2603-800c-1201-c600-f24b-57b2-da7c-e304.res6.spectrum.com.
 [2603:800c:1201:c600:f24b:57b2:da7c:e304])
 by smtp.gmail.com with ESMTPSA id
 e30-20020a056a0000de00b004ef299a4f89sm7260698pfj.180.2022.03.04.14.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 14:39:12 -0800 (PST)
Message-ID: <fa8c9fa1-45f3-f500-4357-26788ecf5f20@linaro.org>
Date: Fri, 4 Mar 2022 12:39:09 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 6/7] target/ppc: Add missing helper_reset_fpstatus to
 VSX_MAX_MINC
Content-Language: en-US
To: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220304175156.2012315-1-matheus.ferst@eldorado.org.br>
 <20220304175156.2012315-7-matheus.ferst@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220304175156.2012315-7-matheus.ferst@eldorado.org.br>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::629
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?V=c3=adctor_Colombo?= <victor.colombo@eldorado.org.br>,
 groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/4/22 07:51, matheus.ferst@eldorado.org.br wrote:
> From: Víctor Colombo<victor.colombo@eldorado.org.br>
> 
> Fixes: da499405aa ("target/ppc: Refactor VSX_MAX_MINC helper")
> Signed-off-by: Víctor Colombo<victor.colombo@eldorado.org.br>
> Signed-off-by: Matheus Ferst<matheus.ferst@eldorado.org.br>
> ---
>   target/ppc/fpu_helper.c | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

