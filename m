Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4926DBCCA
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Apr 2023 21:32:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plEHg-0003L1-6R; Sat, 08 Apr 2023 15:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1plEHa-0003JL-Bw
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:31:32 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1plEHW-0008S4-D9
 for qemu-devel@nongnu.org; Sat, 08 Apr 2023 15:31:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3kJr8qp6CCbsXVmWIj4xa6pR0o/+TJIc3dhcEHRmCkc=; b=MgAu2+zpYrAMt8CpJNDluCv/HD
 dKIU8QI+Es4Oa0xAd5XiUqunzQRMwUcleIaLy6k0i/f7Cf22wMTyP5vls+aoKYPeHKI+ME0C2cHYD
 AZD3m+Oor+H/B2rcH6vE9fPf2KmZzDS9oKn5WIVYw5zjQWWnQbFp7MxFsCVx20JU5p8rM1nYkx6HV
 t3tVai9/lkov4uK42HXT8FRxi6VD1UyHpccdAcr3DcInqBxusHJwcGFRCtbcyrPMW/EOymmfn/T3/
 SO/OvHJp/hxuU8a9CS0dgQuyxwEHeww031HpsGPS2OF04K/VMqvK+XeCwTzlewyjg694JoxFG/AI2
 KFvn5fJOt6ESZgwI7hF5x9gxaMD5PqigsKOgHOpqDa7zXH5Jf8r9Q997UCMdB5r4AfscG5KNRrMxj
 CWFwzpze1AkHWccmNplhUQEAgl1R92aGqz0KdkEiCsJD/yQpZ/Z2qYZNL+UpVUPUedSaKXShB92xb
 enQPBpxAINefdAtzQsdvkMuAwnfM2ujdGfI6XpNM2UkrdyqHoHxzMRjHxGO3pWOXx6tr30pFs9998
 FwkZcgJbik2zYuDZAVCRpgEg2DTpLtdsc/AakDgB7LBXLpuq7cIycP1TNkd+DDfYn8BNhUo8C9ftw
 wBIBXtRFSOSM8QE11yLotd1GyPnIIpJNiiJU8mvi8=;
Received: from [2a00:23c4:8bac:6900:b726:cf58:4c12:f013]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1plEGd-0007RF-F7; Sat, 08 Apr 2023 20:30:35 +0100
Message-ID: <dbea646f-5f0e-da25-e727-d26e5399e186@ilande.co.uk>
Date: Sat, 8 Apr 2023 20:31:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20230408154316.3812709-1-richard.henderson@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230408154316.3812709-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8bac:6900:b726:cf58:4c12:f013
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH for-8.0] tcg/ppc: Fix TCG_TARGET_CALL_{ARG, RET}_I128 for
 ppc32
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.113,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 08/04/2023 16:43, Richard Henderson wrote:

> For both _CALL_SYSV and _CALL_DARWIN, return is by reference,
> not in 4 integer registers.  For _CALL_SYSV, argument is also
> by reference.
> 
> This error resulted in
> 
>      $ ./qemu-system-i386 -nographic
>      qemu-system-i386: tcg/ppc/tcg-target.c.inc:185: \
>          tcg_target_call_oarg_reg: Assertion `slot >= 0 && slot <= 1' failed.
> 
> Fixes: 5427a9a7604 ("tcg: Add TCG_TARGET_CALL_{RET,ARG}_I128")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/ppc/tcg-target.c.inc | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index eb9e80ad37..8e6039576a 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -44,17 +44,18 @@
>   
>   #if TCG_TARGET_REG_BITS == 64
>   # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_EXTEND
> +# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_NORMAL
>   #else
>   # define TCG_TARGET_CALL_ARG_I32   TCG_CALL_ARG_NORMAL
> +# define TCG_TARGET_CALL_RET_I128  TCG_CALL_RET_BY_REF
>   #endif
>   #ifdef _CALL_SYSV
>   # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_EVEN
> +# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_BY_REF
>   #else
>   # define TCG_TARGET_CALL_ARG_I64   TCG_CALL_ARG_NORMAL
> +# define TCG_TARGET_CALL_ARG_I128  TCG_CALL_ARG_NORMAL
>   #endif
> -/* Note sysv arg alignment applies only to 2-word types, not more. */
> -#define TCG_TARGET_CALL_ARG_I128   TCG_CALL_ARG_NORMAL
> -#define TCG_TARGET_CALL_RET_I128   TCG_CALL_RET_NORMAL
>   
>   #include "../tcg-pool.c.inc"
>   #include "../tcg-ldst.c.inc"

Excellent - this fixes running qemu-system-ppc with TCG on my Mac Mini G4 :)

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

