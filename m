Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FC443172B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 13:24:21 +0200 (CEST)
Received: from localhost ([::1]:42726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcQke-00035w-5K
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 07:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQiV-0000KU-IN; Mon, 18 Oct 2021 07:22:07 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:41923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQiT-0008EI-7Y; Mon, 18 Oct 2021 07:22:07 -0400
Received: by mail-lj1-x231.google.com with SMTP id u5so3049721ljo.8;
 Mon, 18 Oct 2021 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O37UyOj79sa4YNb4SimS+2nlegN29a4r0sah6fnCBDI=;
 b=bwvwrCkSH92/QxspB2d/VAsmr8Gl08Q7Jn9h3R/Y+adsoHeX8a6E3+gBP1NCLKTTTa
 nASY2MEx1AhpqS8Vgo2C5o3ERYs1AlRL0M/lJpjFtEf6PW4asNQQ+6nBEDq9KgwTDrna
 +p8kasCG8Uc8N6nN7N0vwAbGoA0T2FsOCtixfLV808005i8BEeYk5nMlhKW2Qv3avrJZ
 9AlQYNU/xeMqR4ZGiCibDkJTcWu3+Z3fEPIXQYeBtB78E1wwFrSfRH7IA8DoFJftctBZ
 7AGpzR2Vv8FEq9jDUeHOAMBMrv/7zC49IZanONbpwCKO66t4SolOKRxLM4XGkebJnBjZ
 JZ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O37UyOj79sa4YNb4SimS+2nlegN29a4r0sah6fnCBDI=;
 b=yyQtMfQ5iQZIysiMjAS/umXptQG/yFg0p9baYrU9MFWoqwIXz+zae6/2Ix4pNbrbAd
 Cx8wKfZPMEmsqJQEx2g5EtpCB0orOYh8oGzSZ5kTEe46wgIYTCc82nRxVncDsNHEY4Sk
 O/aznk8ujXGT5sKXwessUnDWlAcazTeieo4OGyVDb3yVGjrn1O9bY9d2F+wNwHrwH8Bu
 Tm2vEza7ZA5aXnZ09m4zw1PWzOJxeubTKYnU81i623Je9htZzYmIz4Lpldu3HvCZF4Gg
 ORUPjqD/hMv2Qwu0dZOfvXxc7qnMpGWAm4VNQd/wQ8vNku8Bs9+b/m3a/CYGFEDojYJq
 nFxA==
X-Gm-Message-State: AOAM531f2aiLGKcSRaUPU0dsQmwnnahQGJITu18av24p2ayhhYqG6Nf/
 8PI6t7YQvrfm7etZE0KY8Sg=
X-Google-Smtp-Source: ABdhPJw3CkQhIdquXypde79wVfnd53mumTOxjvnHRhQdwoFimzn4mP069eJLQaOB48feLGe6Wsfu0Q==
X-Received: by 2002:a2e:a303:: with SMTP id l3mr31999887lje.242.1634556118192; 
 Mon, 18 Oct 2021 04:21:58 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 79sm422441ljj.124.2021.10.18.04.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:21:57 -0700 (PDT)
Date: Mon, 18 Oct 2021 13:21:56 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 2/3] hw/nvram: Fix Memory Leak in Xilinx Versal eFuse
 device
Message-ID: <20211018112155.GD23846@fralle-msi>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
 <20211015203532.2463705-3-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015203532.2463705-3-tong.ho@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alistair@alistair23.me, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On [2021 Oct 15] Fri 13:35:31, Tong Ho wrote:
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-versal-efuse-ctrl.c b/hw/nvram/xlnx-versal-efuse-ctrl.c
> index d362376703..b35ba65ab5 100644
> --- a/hw/nvram/xlnx-versal-efuse-ctrl.c
> +++ b/hw/nvram/xlnx-versal-efuse-ctrl.c
> @@ -439,9 +439,11 @@ static void efuse_pgm_addr_postw(RegisterInfo *reg, uint64_t val64)
>       *       up to guest to do so (or by reset).
>       */
>      if (efuse_pgm_locked(s, bit)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Denied setting of efuse<%u, %u, %u>\n",
> -                      object_get_canonical_path(OBJECT(s)),
> +                      path,
>                        FIELD_EX32(bit, EFUSE_PGM_ADDR, PAGE),
>                        FIELD_EX32(bit, EFUSE_PGM_ADDR, ROW),
>                        FIELD_EX32(bit, EFUSE_PGM_ADDR, COLUMN));
> @@ -478,9 +480,11 @@ static void efuse_rd_addr_postw(RegisterInfo *reg, uint64_t val64)
>      s->regs[R_EFUSE_RD_DATA] = xlnx_versal_efuse_read_row(s->efuse,
>                                                            bit, &denied);
>      if (denied) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s: Denied reading of efuse<%u, %u>\n",
> -                      object_get_canonical_path(OBJECT(s)),
> +                      path,
>                        FIELD_EX32(bit, EFUSE_RD_ADDR, PAGE),
>                        FIELD_EX32(bit, EFUSE_RD_ADDR, ROW));
>  
> @@ -625,9 +629,11 @@ static void efuse_ctrl_reg_write(void *opaque, hwaddr addr,
>      s = XLNX_VERSAL_EFUSE_CTRL(dev);
>  
>      if (addr != A_WR_LOCK && s->regs[R_WR_LOCK]) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          qemu_log_mask(LOG_GUEST_ERROR,
>                        "%s[reg_0x%02lx]: Attempt to write locked register.\n",
> -                      object_get_canonical_path(OBJECT(s)), (long)addr);
> +                      path, (long)addr);
>      } else {
>          register_write_memory(opaque, addr, data, size);
>      }
> @@ -681,16 +687,20 @@ static void efuse_ctrl_realize(DeviceState *dev, Error **errp)
>      const uint32_t lks_sz = sizeof(XlnxEFuseLkSpec) / 2;
>  
>      if (!s->efuse) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          error_setg(errp, "%s.efuse: link property not connected to XLNX-EFUSE",
> -                   object_get_canonical_path(OBJECT(dev)));
> +                   path);
>          return;
>      }
>  
>      /* Sort property-defined pgm-locks for bsearch lookup */
>      if ((s->extra_pg0_lock_n16 % lks_sz) != 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          error_setg(errp,
>                     "%s.pg0-lock: array property item-count not multiple of %u",
> -                   object_get_canonical_path(OBJECT(dev)), lks_sz);
> +                   path, lks_sz);
>          return;
>      }
>  
> -- 
> 2.25.1
> 
> 

