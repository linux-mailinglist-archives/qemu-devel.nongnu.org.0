Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7546C82E4
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 18:08:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfkte-0005tq-76; Fri, 24 Mar 2023 13:08:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfktb-0005o1-Pr
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:08:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pfktV-0000lW-MP
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 13:08:04 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 gp15-20020a17090adf0f00b0023d1bbd9f9eso5715238pjb.0
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679677680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gko1/jEEXZ5+q3lib1YMQXWydMfRiSffOTChJChMhUc=;
 b=j0GDOp+N3LhSyWY4AzCptVA0gSdTZjZiRv8570L71gG8IDX49DBbif5noST6DjRjGy
 49sZWguA3ThsoTfGUVYCBQ+RJWqEeF68cvwSLIUvaAKhtT7lN541Cj4mZyohc02XlJy9
 AsG1RDy1e2OVnhfWg4UiqfV6S2gkNiexwmwZfPktbra+Bgok7VD0NrrlLnffrg16TRCp
 zqGzZr5lTYvvhQ/meKFrsQ8RUXRWPKp6/+tuj4QDGYORQAeNmp1XzPePd9EPR31qYWdJ
 WqHLsEguDgU8CD606rdPr40vQuoD/agt1sXsAzIGbK5e9DuCv3msUSQI4qXzDG8v2jyu
 AACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679677680;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gko1/jEEXZ5+q3lib1YMQXWydMfRiSffOTChJChMhUc=;
 b=5lHxzzL1Cjw6UMiKKdhj/uhGw4bsIZ+LGbQLBd+KK02M0/EtsTXLYW7KgZzpT331ak
 KUx/8IrIdoM0xqBGKUyOC25XTbceN1RlSDT5AHZcSvNTfZuYOJvwkg0JkaHMXCwAMp58
 l9tkIwNlBmVgUbTnR6UQWRJh6gzsRNF7LPN/21KjlMWDLPQuRVg/XwAkgBAAQTFc15eX
 PKLNSYaMA64bmQHwdPnnsbqQN/D7JG0qRxd79+3ebicaf4qmTt2JafbxuJUshS/FMJm2
 267mowttwUjtVmdZ43wuDG+zceSrtYOFGm46hm1+x+l9A02XUprvwEAZDDZiKyVkcqSg
 Ty1Q==
X-Gm-Message-State: AAQBX9dTRYhIClFvi8/8vDszeV1Qtx4IVAYobNDqQK+6tbfEIPmpTjSM
 Z9kpW6yRKlL4EAYMLWcGEL/s3A==
X-Google-Smtp-Source: AKy350YEzZM6MZ1PVi84x1rfRgPbhaRLjjM4nYE4YeyVR2fee2HcbqyECVdYDw93nHH76YKBiLVWbA==
X-Received: by 2002:a17:902:ec91:b0:1a1:dd3a:7509 with SMTP id
 x17-20020a170902ec9100b001a1dd3a7509mr3791178plg.48.1679677680275; 
 Fri, 24 Mar 2023 10:08:00 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170902bd0b00b001994e74c094sm14473444pls.275.2023.03.24.10.07.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 10:07:59 -0700 (PDT)
Message-ID: <5b356c5a-46a3-4490-14e4-a40cf0a57e68@linaro.org>
Date: Fri, 24 Mar 2023 10:07:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 3/4] target/riscv: Encode the FS and VS on a normal way
 for tb flags
Content-Language: en-US
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: Alistair.Francis@wdc.com, palmer@dabbelt.com, bin.meng@windriver.com,
 liweiwei@iscas.ac.cn, dbarboza@ventanamicro.com, qemu-riscv@nongnu.org
References: <20230324143031.1093-1-zhiwei_liu@linux.alibaba.com>
 <20230324143031.1093-4-zhiwei_liu@linux.alibaba.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324143031.1093-4-zhiwei_liu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 3/24/23 07:30, LIU Zhiwei wrote:
> Reuse the MSTATUS_FS and MSTATUS_VS for the tb flags positions is not a
> normal way.
> 
> It will make it hard to change the tb flags layout. And even worse, if we
> want to keep tb flags for a same extension togather without a hole.
> 
> Signed-off-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
> Reviewed-by: Weiwei Li <liweiwei@iscas.ac.cn>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> +        flags =  FIELD_DP32(flags, TB_FLAGS, FS,
> +        flags =  FIELD_DP32(flags, TB_FLAGS, VS,

Extra space after =.


r~


