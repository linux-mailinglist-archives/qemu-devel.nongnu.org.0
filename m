Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD1261A654
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 01:15:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or6qE-0001Ek-QS; Fri, 04 Nov 2022 20:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6qC-0001Ed-JZ
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:15:17 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1or6qA-0006Aw-Nj
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 20:15:16 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-13bef14ea06so7247760fac.3
 for <qemu-devel@nongnu.org>; Fri, 04 Nov 2022 17:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KrGfw02yakagnq3kdQUrbt6J6cR11Ur3TnOCJY19x7k=;
 b=VcbshW1bL/wQj0Te5Wkm6X4kIRfLV/vtrQ7NW/JVLvr7JIyERsWUQPU3HQhK3jxDcI
 +Hrh4Z+bacfZWNAXGJFk/gdQ6TBYIzyLKVdYVQSJEAw5QTs4FaIaAjLdGAj3Jwxph2eN
 lmOlzHePK6zBljpuFzuf1tIxEdTyDCFvU0AkhWDWp5TSMkwk49pIxRi/U4WqwCMCnMRg
 IRPzWG2ieUbWG/EnOVJo214oXc2VjZ557i0Wu4F3Y/05sxakuMZXuCdqMspxgldtgqgF
 tRyHpIoucI4sbuZ92t9kxkxBoxHfGxCtsRcFe880bwvbqZKkvRGxOheV5jt9+zfW5UH5
 JIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KrGfw02yakagnq3kdQUrbt6J6cR11Ur3TnOCJY19x7k=;
 b=PWhtkQlCzDK8wxecqNUHorx2si6XIspZ4x/SZGKTh9v3/rXeXsYV5nrdTTWOmBEtDd
 InD17oUAUzCq0tseFB/4UArmwLYvZuOyR6k/phRyDx6/gq7SUjU9MIQwguLDDfU9mis+
 ACHr++9E5vbZrooM6CfJXM2nwxFBKtDWaLZvpm2GCMdOb9i4a4LJG1VRh1oNNnM7fccj
 gZH2faN0kf9aHOTKNOTvcMZt0zSW7vfbquQYqC8i2xCtoknpvq/u59MSBcQ057TPAW3G
 A/hZUuk1/5GhjeX4oAHDIcGvFrhSPRXiRU7MYCzN2ghvlPiHyWBbwx5xkS5F+dPzQmlV
 UrYA==
X-Gm-Message-State: ACrzQf2hbZxwmPNX/J3mE0HnrYUacJBwG/C4s3k54lPVB6DFi6iUMg0s
 c7GeEqq8WqNYgimw8v72boKTaw==
X-Google-Smtp-Source: AMsMyM6NdxCWg1b7mfsqO3I1aI2XCthOmQCggVqGhZIp8uaLGCuyhMD8VSXEN2viMv2Ykm6BL/9GaA==
X-Received: by 2002:a05:6870:350:b0:13c:939c:40b0 with SMTP id
 n16-20020a056870035000b0013c939c40b0mr23500011oaf.170.1667607313352; 
 Fri, 04 Nov 2022 17:15:13 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.176.28])
 by smtp.gmail.com with ESMTPSA id
 62-20020aca0741000000b00359ccf7748dsm172824oih.56.2022.11.04.17.15.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 17:15:12 -0700 (PDT)
Message-ID: <46c8d340-23eb-1e21-9945-eca378016854@linaro.org>
Date: Sat, 5 Nov 2022 11:15:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 08/11] Hexagon (target/hexagon) Add overrides for
 compound compare and jump
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, ale@rev.ng, anjo@rev.ng, bcain@quicinc.com,
 quic_mathbern@quicinc.com
References: <20221104192631.29434-1-tsimpson@quicinc.com>
 <20221104192631.29434-9-tsimpson@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221104192631.29434-9-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/5/22 06:26, Taylor Simpson wrote:
> Signed-off-by: Taylor Simpson<tsimpson@quicinc.com>
> ---
>   target/hexagon/gen_tcg.h | 177 +++++++++++++++++++++++++++++++++++++++
>   target/hexagon/genptr.c  |  72 ++++++++++++++++
>   2 files changed, 249 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

