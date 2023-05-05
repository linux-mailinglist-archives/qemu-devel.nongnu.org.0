Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73476F852B
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 17:00:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puwv1-00044Q-On; Fri, 05 May 2023 11:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puwuz-000448-SH
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:00:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puwuv-0005xX-Mp
 for qemu-devel@nongnu.org; Fri, 05 May 2023 11:00:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f315712406so103000435e9.0
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 08:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683298812; x=1685890812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=b0DcFp4DIu21N/e7QEtzL2tRyjkPa6twHQ3omVndbvc=;
 b=sNtHC3kDyTpPQZgzCjcjqE2bBy6cNZNpbTp6YJWFExrcdVqykkIqOeGBjr3jpoWAqz
 QfAdmx4XY7GcJtX4xuS/RCOJ7C5so6G/xkaeOwgGOAEyaSoihYfOEuJaX09V9e65WYw5
 Rsbry/yDkQO3HnEEPR9kUxQSWe1VrtJc8tfaJEcsoAxmVICJ5QMktv2x+AS2S3IM5blf
 zBgx+vclBVVQMB1E4p9bfDfKtEqgQMpV5l2aYb3qoUevqT9JS2m++I9x73L8cGe89TzC
 tWNMgsfjCCEpw/pCPY0cptL1dMtsu1AXpkb/D/DBBpljFpCj70aKpC3p6b+pdRYEYK5B
 qTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683298812; x=1685890812;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=b0DcFp4DIu21N/e7QEtzL2tRyjkPa6twHQ3omVndbvc=;
 b=G2Zx41TKELrZTzcY+dYxjh2V0JkSZA1dW9islnOpvAzriq9I85kLOurzYBwEAqlzYY
 rhJiDIZcwCa7i8kOgpofaZAkEWHPK6ocY3oIaniyhzw3G6Dkk27BMot+QNW1MTzYMhOj
 tmApzs4cuanMGBeKYyb34s6ZeZDe9P7tXLSE/PaAC6uHpoywK1A84fEAyo4yaOXo5Drf
 3TiWGvOZh/7lNzfxwCbGPQh0NOI8BT1yNdfaLkjE1KJCaa3GxrZvB+7auzad+P0n9NsC
 Rpa5dHBMwTHPs/KLXImfQPVxPp5unvMKo1waN2Bnpivq7d3rWj2SKTnQR2hBVIhuG6Di
 nHIA==
X-Gm-Message-State: AC+VfDxG0hlkh3npXUDmDO6eR//r4oXxofNyPDcQ2RaBc8l6TptNCNYX
 5U9R3v2Oo1TsSLOQNV31mPR6sg==
X-Google-Smtp-Source: ACHHUZ4yO/few0CH3YXAgZf2F0ngfChGR0ZwbQsg0AlXbe8GVTj/CnXieUoGrrMyEx+I662qdz45kg==
X-Received: by 2002:a5d:4052:0:b0:2f7:cfe2:6507 with SMTP id
 w18-20020a5d4052000000b002f7cfe26507mr5074534wrp.20.1683298812288; 
 Fri, 05 May 2023 08:00:12 -0700 (PDT)
Received: from [192.168.20.44] ([212.241.182.8])
 by smtp.gmail.com with ESMTPSA id
 v1-20020a5d6101000000b003062b57ffd1sm2666961wrt.50.2023.05.05.08.00.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 May 2023 08:00:11 -0700 (PDT)
Message-ID: <e295901d-b942-5681-45d4-01cba5f14b4c@linaro.org>
Date: Fri, 5 May 2023 16:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PULL 00/89] riscv-to-apply queue
To: Alistair Francis <alistair23@gmail.com>, qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
References: <20230505010241.21812-1-alistair.francis@wdc.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230505010241.21812-1-alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/5/23 02:01, Alistair Francis wrote:
> The following changes since commit f6b761bdbd8ba63cee7428d52fb6b46e4224ddab:
> 
>    Merge tag 'qga-pull-2023-05-04' ofhttps://github.com/kostyanf14/qemu  into staging (2023-05-04 12:08:00 +0100)
> 
> are available in the Git repository at:
> 
>    https://github.com/alistair23/qemu.git  tags/pull-riscv-to-apply-20230505-1
> 
> for you to fetch changes up to e1d084a8524a9225a46d485e2d164bb258f326f7:
> 
>    target/riscv: add Ventana's Veyron V1 CPU (2023-05-05 10:49:50 +1000)
> 
> ----------------------------------------------------------------
> First RISC-V PR for 8.1
> 
> * CPURISCVState related cleanup and simplification
> * Refactor Zicond and reuse in XVentanaCondOps
> * Fix invalid riscv,event-to-mhpmcounters entry
> * Support subsets of code size reduction extension
> * Fix itrigger when icount is used
> * Simplification for RVH related check and code style fix
> * Add signature dump function for spike to run ACT tests
> * Rework MISA writing
> * Fix mstatus.MPP related support
> * Use check for relationship between Zdinx/Zhinx{min} and Zfinx
> * Fix the H extension TVM trap
> * A large collection of mstatus sum changes and cleanups
> * Zero init APLIC internal state
> * Implement query-cpu-definitions
> * Restore the predicate() NULL check behavior
> * Fix Guest Physical Address Translation
> * Make sure an exception is raised if a pte is malformed
> * Add Ventana's Veyron V1 CPU

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/8.1 as appropriate.


r~


