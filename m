Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 399156997E3
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfcR-0001bP-Gm; Thu, 16 Feb 2023 09:52:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSfcP-0001af-GA
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:52:17 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ajones@ventanamicro.com>)
 id 1pSfcN-0004Pt-M9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:52:16 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so1879838wms.1
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g1RHqr5TSHVFZPWRKeU8Ch+Jr2VeSPkSh2pANhFJTlE=;
 b=CS6r2o3lstxX6zaihC6YB1b5Br0jm4WRf1NwGId3/hEcde8WjpV6FioIAfJDMKKjMN
 Bi3MSnbOWxzGq5PS7zUnp5G8SHYVRkmJxifIgNDZ8Yq8BEbL3BD2wjA56N2Y07wDeDaC
 mrWubK12A+X+PNbDI8o2d8Zzc3DQvP1TAopeRiBIDJ4SUsYta/Xb2gI0QUgEPBOD53pM
 c41c8Zco+o70UC9RrzDPisW7iKf/ySxEs77WZZlgBVLuziupYS3fCn9pkLfPqqcSdIU1
 UxzCnOOlAXcKmoJxDCQENMwTrYUWfdQO5X79xMeOqaFxumRs70++mZMut1lJDK1Mr1T5
 6y2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g1RHqr5TSHVFZPWRKeU8Ch+Jr2VeSPkSh2pANhFJTlE=;
 b=S9xDYBUjXWgqT7z6nvhJxc77/45B3Ty0iB4k6xypUCd9jeo9oIm0723Tk3zuAvqOBU
 cikRyJtwP5ASAgDxXpP3DP3hNfOjgtAN8yR0vxEJb1+XYlKabbJ99kdBZshCIgBsk0FE
 L8dtaH6hna6q1/j7m90d8ZPRwJSQns+G2YQJO0xVdaDaxvyznQC/PFHdbzN44xLBhEMG
 Dw0wr6YK1ezWALhH+p5WkmY8GkujUY7n/ZXiCyZjgW4+3iMNKwyHDe+SJBVq4Z9AxLE7
 aPueMYI8QK5p+ctoIUgB6AWnap9faXcKOBx+w6oWSumgbDBuRacGkxOkFNUxwzcSJZC/
 HXXg==
X-Gm-Message-State: AO0yUKXoySfGEKkht9fZ0by2E+Th90gH1wkqmH5U1DM2NNM0VxvOxRsT
 Yn1b9IvI2x218+zt5vnyR6DK2A==
X-Google-Smtp-Source: AK7set8dYTamVEohVMTlMntmhfYIe44TK+RfSJieBgrmRU/z/DxVB7WqBKSL+0tOtrOC3w4cReCYYg==
X-Received: by 2002:a05:600c:4450:b0:3de:a525:1d05 with SMTP id
 v16-20020a05600c445000b003dea5251d05mr2042978wmn.8.1676559134213; 
 Thu, 16 Feb 2023 06:52:14 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
 by smtp.gmail.com with ESMTPSA id
 7-20020a05600c028700b003e214803343sm1863399wmk.46.2023.02.16.06.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 06:52:13 -0800 (PST)
Date: Thu, 16 Feb 2023 15:52:12 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 bmeng@tinylab.org, liweiwei@iscas.ac.cn, zhiwei_liu@linux.alibaba.com
Subject: Re: [PATCH v4 02/10] target/riscv: remove RISCV_FEATURE_MISA
Message-ID: <20230216145212.dvgb5isazcx52w6i@orel>
References: <20230216130444.795997-1-dbarboza@ventanamicro.com>
 <20230216130444.795997-3-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216130444.795997-3-dbarboza@ventanamicro.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=ajones@ventanamicro.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, Feb 16, 2023 at 10:04:36AM -0300, Daniel Henrique Barboza wrote:
> It's unused after write_misa() became a regular no-op.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  target/riscv/cpu.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 7128438d8e..01803a020d 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -89,7 +89,6 @@ enum {
>      RISCV_FEATURE_MMU,
>      RISCV_FEATURE_PMP,
>      RISCV_FEATURE_EPMP,
> -    RISCV_FEATURE_MISA,
>      RISCV_FEATURE_DEBUG
>  };
>  
> -- 
> 2.39.1
>

Probably could squash into the previous patch, but anyway

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

