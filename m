Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2605FFB4C
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 18:53:20 +0200 (CEST)
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojkPW-000825-Qw
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 12:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ojkOR-0006Lz-Tp
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 12:52:11 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1ojkOQ-0000XR-B8
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 12:52:11 -0400
Received: by mail-wr1-x432.google.com with SMTP id n12so12024298wrp.10
 for <qemu-devel@nongnu.org>; Sat, 15 Oct 2022 09:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/7ypXEjXLkWtB+382N9csnN+iGSf5K/zZODXeNtcGHI=;
 b=ORfqdNPtljF4vW9dL/tjDFx6a9qx32AHl270Rz5FMiH7+F/iEhMHcXo/N5ePTyknW/
 nMREvEyIaLbpGqTYTlC4X5x139FIEaeY8tyZhw4AtliGnvDXaW9Y+851dIhWD63VGDcl
 yyYa8Gvv1lKz5+1lO/FTk90s6YwtvHWibioVDk2+Q5uE3kcdemeNLIEvHhb17XPAU+rL
 ZVCm7yg3KJKjiL7lk6I9y6PvgpnInTbPZSsbH2qFpobFb9RFBXPa8EiRRkTNYfgFSfBW
 lqLp5qHAee5e1Nl4quLjXbIsS/nZfOuLfl15J8T5gnClw8ZTytVxQq3teEhJlUV82hRl
 mbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7ypXEjXLkWtB+382N9csnN+iGSf5K/zZODXeNtcGHI=;
 b=Lj+7CXMnKetiCV2lnljm/MWmUVc+UQwhfXlok8pmyYM/uVR1hckUeCUyiXUiAgQi4D
 +ObcpHTEPvNeJMe/d44G7Xc51+C9Y8SfEdcQ2f/oLjuJQHI7AuoRaWZtsAX4lwOgq8bg
 tHwKsuF6kRFMz2/MDBqlLJ0iRua02ocnSCx/oR6yaBf/Sqz/7ma/fvOFIDQOH74Dg5jF
 VausdbsvT/Zh336WNhdeYjN/dbO3/mARaGOIN0zyp40iaqTi7qjWlnL0pzJXc7+L4LY7
 kRfWOcpnMGl+mRhj1ffChWiiiYeoELQ41M4qKIloWWe98eu3UIHPgsMpL32DcUxdtr5i
 yUMQ==
X-Gm-Message-State: ACrzQf2T5SPtXABuygm+K7xSKFVoxpmB82To8mg0p0k1XUNQwb/su6qC
 G0H6eF6jKGW5wUqSy3eDi3Q=
X-Google-Smtp-Source: AMsMyM4/DAjVEQ+zpJxTZCl+kLpb6mqelHd/lhHJLkcW2n7jKoUOnIqTEoiP92skA4CCk2kz00Wmzg==
X-Received: by 2002:adf:9c87:0:b0:232:a0fb:ea5f with SMTP id
 d7-20020adf9c87000000b00232a0fbea5fmr1961336wre.473.1665852727638; 
 Sat, 15 Oct 2022 09:52:07 -0700 (PDT)
Received: from localhost ([2a03:b0c0:1:d0::dee:c001])
 by smtp.gmail.com with ESMTPSA id
 bw3-20020a0560001f8300b0022cd96b3ba6sm5040963wrb.90.2022.10.15.09.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Oct 2022 09:52:04 -0700 (PDT)
Date: Sat, 15 Oct 2022 16:52:04 +0000
From: Stafford Horne <shorne@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org,
 richard.henderson@linaro.org
Subject: Re: [PATCH v3 6/8] openrisc: re-randomize rng-seed on reboot
Message-ID: <Y0rlNIWFtqc3xSuW@oscomms1>
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-7-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221014021653.1461512-7-Jason@zx2c4.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=shorne@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Jason,

On Thu, Oct 13, 2022 at 08:16:51PM -0600, Jason A. Donenfeld wrote:
> When the system reboots, the rng-seed that the FDT has should be
> re-randomized, so that the new boot gets a new seed. Since the FDT is in
> the ROM region at this point, we add a hook right after the ROM has been
> added, so that we have a pointer to that copy of the FDT.

This looks good to me.

Acked-by: Stafford Horne <shorne@gmail.com>

> Cc: Stafford Horne <shorne@gmail.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  hw/openrisc/boot.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/hw/openrisc/boot.c b/hw/openrisc/boot.c
> index 128ccbcba2..007e80cd5a 100644
> --- a/hw/openrisc/boot.c
> +++ b/hw/openrisc/boot.c
> @@ -14,6 +14,7 @@
>  #include "hw/openrisc/boot.h"
>  #include "sysemu/device_tree.h"
>  #include "sysemu/qtest.h"
> +#include "sysemu/reset.h"
>  
>  #include <libfdt.h>
>  
> @@ -111,6 +112,8 @@ uint32_t openrisc_load_fdt(void *fdt, hwaddr load_start,
>  
>      rom_add_blob_fixed_as("fdt", fdt, fdtsize, fdt_addr,
>                            &address_space_memory);
> +    qemu_register_reset_nosnapshotload(qemu_fdt_randomize_seeds,
> +                        rom_ptr_for_as(&address_space_memory, fdt_addr, fdtsize));
>  
>      return fdt_addr;
>  }
> -- 
> 2.37.3
> 

