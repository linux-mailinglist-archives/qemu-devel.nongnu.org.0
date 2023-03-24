Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6576C848A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 19:11:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pflry-0002Yf-Dq; Fri, 24 Mar 2023 14:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflro-0002Wo-EJ
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:10:20 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pflrl-00077D-Vx
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:10:19 -0400
Received: by mail-pl1-x634.google.com with SMTP id w4so2555922plg.9
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 11:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679681416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=e7Zwgmg7lLgBkstgZN7om6+EzqPG8iEVLf/hxZVgdzs=;
 b=YxNGEcBHaIbRlZ/Jd0E+sQAf8qLqqznplhE+k8ly9CtW7+FMtKwjfhVc8PmiohVgUX
 nD6Cp2K3bp9S4afsmWcBdJwoommfu9/ivRKULndYKewj62tYNuDk1xCXzZ7da870amYP
 Y7+bAIwH19rlISL+WHkmTMol/HGlv6zpqhGI3v0hDwNqxkRqjGP7dYGfzl9yrEaOhkgO
 V6GNtG2NtmK41SnaiwMhGt+PxPrw0x1h03ZPfaiLybC85sPx65YTf4ACXubgdY8z3ulL
 IcEiYEPzjHARYUHICCLirYO0mMdz2ehVuXsCi47WutIScWnNEnkbSrpKl2I2Mfzf3grn
 ndpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679681416;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e7Zwgmg7lLgBkstgZN7om6+EzqPG8iEVLf/hxZVgdzs=;
 b=09kpkLYoisUTbwxTsJVe/t0oe+2J3CEfsVISF0k16jGjYI2egJ82PBxpX5U/RjdkwE
 S4ZQXTSrppyY1gfIU6U+pWb9qjSzOqmI8Hr2Um2EFbn3y6aSXapn+LM6MrEIFGyi0PNn
 nF7LigjkVMTmYFz7wppg9ooduRXilK4pTDHqlYbmldFJp2HnNaP0ur02QVpLxX8LGasj
 00QleB1wgqInG/HEt/Gmbw7E+8UREJNkYbGkWIeLQ0yPCfFpc07o53FtqdiMJjXlA67o
 l9Itt/FESjQTWxqqe4pdPZFBFnauBABGTlpcuMpObgL1B0TAhTOzQ2hHEFh/a6d55roF
 Pz+w==
X-Gm-Message-State: AAQBX9fRghXjWJOMMriCi+F+eqR+LfRWYhARzKrIthkjY0jfn+5SjgAG
 ykh9if/tT6MOgI05r9FeOmiSJQ==
X-Google-Smtp-Source: AKy350bJJjDOg6PYrpRjj6TqGhTOAuPMK2t8OM04urhIHIdFdxEuwUmLEP10gdZVzfVo88FmpMGpNw==
X-Received: by 2002:a17:90b:1d90:b0:23c:ffd2:6502 with SMTP id
 pf16-20020a17090b1d9000b0023cffd26502mr4073877pjb.12.1679681416294; 
 Fri, 24 Mar 2023 11:10:16 -0700 (PDT)
Received: from ?IPV6:2602:ae:1544:6601:cb42:9f2a:fcd4:54fc?
 ([2602:ae:1544:6601:cb42:9f2a:fcd4:54fc])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a17090adb0400b0023f8bdc4a7fsm211762pjv.14.2023.03.24.11.10.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 11:10:15 -0700 (PDT)
Message-ID: <ec88c7be-d89c-885d-3c87-a3179b827288@linaro.org>
Date: Fri, 24 Mar 2023 11:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 4/8] target/riscv: Remove check on RVH for
 riscv_cpu_set_virt_enabled
Content-Language: en-US
To: Weiwei Li <liweiwei@iscas.ac.cn>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org
Cc: palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
References: <20230324123809.107714-1-liweiwei@iscas.ac.cn>
 <20230324123809.107714-5-liweiwei@iscas.ac.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230324123809.107714-5-liweiwei@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
> In current implementation, riscv_cpu_set_virt_enabled is only called when
> RVH is enabled.
> 
> Signed-off-by: Weiwei Li<liweiwei@iscas.ac.cn>
> Signed-off-by: Junqiang Wang<wangjunqiang@iscas.ac.cn>
> ---
>   target/riscv/cpu_helper.c | 4 ----
>   1 file changed, 4 deletions(-)

Perhaps assert, or assert under CONFIG_DEBUG.
Otherwise the function deserves a comment about the interface.

With that,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

