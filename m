Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B70B4A8FDE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 22:27:57 +0100 (CET)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFje0-000659-1F
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 16:27:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFibQ-0005oz-CI; Thu, 03 Feb 2022 15:21:12 -0500
Received: from pharaoh.lmichel.fr ([149.202.28.74]:50250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc@lmichel.fr>)
 id 1nFibN-0001Oi-PU; Thu, 03 Feb 2022 15:21:12 -0500
Received: from localhost (sekoia-pc.home.lmichel.fr [192.168.61.100])
 by pharaoh.lmichel.fr (Postfix) with ESMTPSA id 3B290C60912;
 Thu,  3 Feb 2022 21:21:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmichel.fr; s=pharaoh; 
 t=1643919665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=23ghNXj2cokyojP3FkXbJypqWLELVpWdmnT3PoTP2IY=;
 b=fIIeWjgORkk3iIJj8/ULkyWdxrc2Ve+rzkHQhk7kI5yPEnK82JTrEyzfk0vY1CyTbFiHJC
 RZndANZwSW6HwXb+DF13UIyFvHPOm4HTX2VGwP5yW+eIFUOd1xWk3bVRZykZ5G5Te3nPU+
 zgpDiBJbOydsYBd3NwvX9rzGeUSE8yNlkLTvg3hQ7B/d3f3ALMbq1ifgPLMKI34SItLhdn
 DegoE/ItG/Sf//WghNOBSwTCojeffkDo8bNmlYIV0botz9xWI8hy064Zk8t243UFBxxXTi
 m99WLs/o0xJsGZ1XBLv0NW5E0hW3Hagry71UwUX/bX649XeVVR5nxO2ka/CKzQ==
Date: Thu, 3 Feb 2022 21:21:04 +0100
From: Luc Michel <luc@lmichel.fr>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 2/6] target/arm: Make rvbar settable after realize
Message-ID: <Yfw5MBPA0AOPfa3a@sekoia-pc.home.lmichel.fr>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-3-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-3-edgar.iglesias@gmail.com>
Received-SPF: pass client-ip=149.202.28.74; envelope-from=luc@lmichel.fr;
 helo=pharaoh.lmichel.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

On 00:12 Mon 31 Jan     , Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Make the rvbar property settable after realize. This is done
> in preparation to model the ZynqMP's runtime configurable rvbar.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/arm/cpu.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5a9c02a256..e30ae088fe 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1128,9 +1128,6 @@ static Property arm_cpu_reset_cbar_property =
>  static Property arm_cpu_reset_hivecs_property =
>              DEFINE_PROP_BOOL("reset-hivecs", ARMCPU, reset_hivecs, false);
>  
> -static Property arm_cpu_rvbar_property =
> -            DEFINE_PROP_UINT64("rvbar", ARMCPU, rvbar, 0);
> -
>  #ifndef CONFIG_USER_ONLY
>  static Property arm_cpu_has_el2_property =
>              DEFINE_PROP_BOOL("has_el2", ARMCPU, has_el2, true);
> @@ -1233,7 +1230,9 @@ void arm_cpu_post_init(Object *obj)
>      }
>  
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        qdev_property_add_static(DEVICE(obj), &arm_cpu_rvbar_property);
> +        object_property_add_uint64_ptr(obj, "rvbar",
> +                                       &cpu->rvbar,
> +                                       OBJ_PROP_FLAG_READWRITE);
I think you may have a problem here. cpu->rvbar is used to define the
reset value of the rvbar_elx registers in register_cp_regs_for_features.
This is done at realize time. Changing the rvbar property after realize
would fail to update the rvbar_elx register values.

I guess you should also switch to a .readfn instead of a .resetvalue for
those registers.

-- 
Luc

>      }
>  
>  #ifndef CONFIG_USER_ONLY
> -- 
> 2.25.1
> 

-- 

