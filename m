Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCCA6F600D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 22:28:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puJ4t-0003XH-DG; Wed, 03 May 2023 16:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ4k-0003Wf-4h
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:27:47 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ4i-0007FE-Io
 for qemu-devel@nongnu.org; Wed, 03 May 2023 16:27:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlNoTmR5oqM/ReXI0o/foNGSM5nq4xAVY0E5gis5IaY=; b=qe5XIbDnS5DEj9oLRfbwGXvkrc
 2TwQ7oo4WFbg7ERM/rRFGj0NWt8IAbahX8wauTxDt09H46RZHT2I0kuDgE3EFwdGeV3jI1AzId3Tm
 76xf/Crujbs1Pt3BDxsNPdQCsxxsyLsKY2d/oYWHYS10MKAuRH5CLjxvCcGeFl57XFegSaLQ8vS5y
 4UPXyAVSkdAy1jC9jPSZqlZ+Vbt6pNFlW+v18dFSJWv0geNnU9Y3D6xdEbWD/oD2owpJvK23vMiVp
 R2KpqmNLgXpgM9tFmyTyWHAbm2xgxo7/S+0zZVhJoW92H/6Tl/6H93F1P6bvzWQAmC8Mzfr18Qx+J
 qkDO1Ry3wPkzHz4th5G1Br7D573O3sCn2Sv84TGvcu0NPWR/OO5e9sIs8CCEN22xJPoMjD9V9eQk/
 6YuDcoa6NbUWENeV+oy9UQMmsSxpOltqXICXpJdFEHA6zkUhzvc9NwyfcTgyEhFo+LzgrN6Np7sLj
 U9yQOlxIojAxjqLdX58nGh9Y+fOC6A20cpkMWxKkT77NUYAzqj/U+FpRzB1VkxNu1yE4fQJ2OpAwg
 muIOMreXz0aWk1WzJ2k+D0FPrabYWKre/wiFmKXGVwoIO7smfwUJVUyA7bg/Cr85nxgyGaB57GpCY
 yOsEEr1Z7xKFrb9ljmKgb3rJNaZ8vfA/AT7R6STfI=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1puJ3j-00042N-ME; Wed, 03 May 2023 21:26:47 +0100
Message-ID: <18761cb6-9fd7-52e0-c222-4284c0a0edf2@ilande.co.uk>
Date: Wed, 3 May 2023 21:27:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, jiaxun.yang@flygoat.com, crwulff@gmail.com,
 marex@denx.de, ysato@users.sourceforge.jp
References: <20230502160846.1289975-1-richard.henderson@linaro.org>
 <20230502160846.1289975-15-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230502160846.1289975-15-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 14/16] target/sparc: Use cpu_ld*_code_mmu
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.28,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 02/05/2023 17:08, Richard Henderson wrote:

> This passes on the memop as given as argument to
> helper_ld_asi to the ultimate load primitive.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/sparc/ldst_helper.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
> index a53580d9e4..7972d56a72 100644
> --- a/target/sparc/ldst_helper.c
> +++ b/target/sparc/ldst_helper.c
> @@ -593,6 +593,7 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
>   #if defined(DEBUG_MXCC) || defined(DEBUG_ASI)
>       uint32_t last_addr = addr;
>   #endif
> +    MemOpIdx oi;
>   
>       do_check_align(env, addr, size - 1, GETPC());
>       switch (asi) {
> @@ -692,19 +693,20 @@ uint64_t helper_ld_asi(CPUSPARCState *env, target_ulong addr,
>       case ASI_M_IODIAG:  /* Turbosparc IOTLB Diagnostic */
>           break;
>       case ASI_KERNELTXT: /* Supervisor code access */
> +        oi = make_memop_idx(memop, cpu_mmu_index(env, true));
>           switch (size) {
>           case 1:
> -            ret = cpu_ldub_code(env, addr);
> +            ret = cpu_ldb_code_mmu(env, addr, oi, GETPC());
>               break;
>           case 2:
> -            ret = cpu_lduw_code(env, addr);
> +            ret = cpu_ldw_code_mmu(env, addr, oi, GETPC());
>               break;
>           default:
>           case 4:
> -            ret = cpu_ldl_code(env, addr);
> +            ret = cpu_ldl_code_mmu(env, addr, oi, GETPC());
>               break;
>           case 8:
> -            ret = cpu_ldq_code(env, addr);
> +            ret = cpu_ldq_code_mmu(env, addr, oi, GETPC());
>               break;
>           }
>           break;

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

