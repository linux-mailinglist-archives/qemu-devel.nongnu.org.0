Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 361036C8479
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 19:06:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflnT-0000TR-3l; Fri, 24 Mar 2023 14:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflnQ-0000Sm-KA
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:05:48 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflnO-0005xi-Ja
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:05:47 -0400
Received: by mail-pl1-x631.google.com with SMTP id ja10so2564806plb.5
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 11:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6wyILNk2b/7p4Ksrve4hj5v+yRvDz1q9I8/SxebO37E=;
 b=ny4cw9+nSWSkuCV0KUTqR55MV3EuMokzsU6F30h+a9GZ2sYvdWq+FWCwf3B9ocxlvp
 rCiZIZidvysRRfXedqTB7pN1IKtEi/ysVYBx7A1eaaRMYbejH9ZrsdX5UXb9Re1y3msR
 GJGQ0iCGG8PxNa1W8rTmJsAfJ4plaopJApJJ/npGYk5ab/iz6EfEdHb4ltP95M9aKR3h
 BRBPjz/ACJ+ByC9XFmdtlS4QKrMDPCycaxIm8u6jnzXu7qWsvQy2lbPqb4qc+9Ln3sMA
 10JF3lGDLK2RukeMmjlJQcuCzETJwBUMzMfuiiDXo5oUowOM8lUz7T60HkfWqJZwbIpl
 ut0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681144;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6wyILNk2b/7p4Ksrve4hj5v+yRvDz1q9I8/SxebO37E=;
 b=xYdxxTSmLvGDBRQGcuGh7Xj92m7N4kUUGnfPQjrXOwV/tIlMvAl1N9eAmhO7MAg/Nf
 fwUnmvq26DjT5eJ7JiZdNxbjS2mSiYVfDX2vUw39e/P+ekQnqJH2/MLamPdXfsFWYBRx
 x1Y9/tekHz2aEFSX/BsAkx2e+MmEeJVtz5ATDL+j9ExHiSPaCYljQvyBrN8WK/c8K83J
 MM41r2DGXtlvej1qRcBOqXxKFfpfLYkN2+scoeaXMGl9F5QWhxlzwvKyYW+UJ47YmdCT
 zV1aAnC7g1PjOdukw8vAR94cvitIjiYea1V0n36TyocQVc+WszO5Uc0/R47ReGNcYFtV
 FzCg==
X-Gm-Message-State: AAQBX9cyFK34ByJ8zOu0l6/5emge68iUZHtvxeG/+kympq9j6zqOgd4v
 mwrCRFrwYWU48WO4BsxPW3UnlA==
X-Google-Smtp-Source: AKy350bI1Qs1mdZNZNe+UT3bHGrHkjz9j3GP84Ni6vNDzE0O6DyAHAvgzat/2vnBDAMPEKYixtmTZQ==
X-Received: by 2002:a17:902:d102:b0:19e:5cc3:828f with SMTP id
 w2-20020a170902d10200b0019e5cc3828fmr2917861plw.27.1679681144253; 
 Fri, 24 Mar 2023 11:05:44 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 jj11-20020a170903048b00b0019f1222b9f6sm14538004plb.154.2023.03.24.11.05.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:05:43 -0700 (PDT)
Message-ID: <bfde2cc0-a6ba-a785-72e9-234ac08dfb68@linaro.org>
Date: Fri, 24 Mar 2023 11:05:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 3/8] target/riscv: Remove check on RVH for
 riscv_cpu_virt_enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-4-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-4-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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

On 3/24/23 05:38, Weiwei Li wrote:
> Since env->virt.VIRT_ONOFF is initialized as false, and will not be set
> to true when RVH is disabled, so we can just return this bit(false) when
> RVH is not disabled.
> 
> Signed-off-by: Weiwei Li <liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang <wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 4 ----
>   1 file changed, 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

