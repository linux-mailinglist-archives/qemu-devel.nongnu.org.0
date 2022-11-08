Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 90067621EE1
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 23:12:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osWoL-0001Kj-CK; Tue, 08 Nov 2022 17:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1osWoI-0001KK-64
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 17:11:10 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1osWoD-0003Jg-6O
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 17:11:09 -0500
Received: by mail-pj1-x1032.google.com with SMTP id o7so15046234pjj.1
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 14:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:from:to:cc:subject:date:message-id
 :reply-to; bh=bMhdbNJVUoz0Hj11V1L/5t60JRes0LegbsCxcfC4KLI=;
 b=sNLXw/e8tqibTpV5uRMPGZpTyTqYIfR9CmVVwL9TzoRB2PnnunBBS2sjTCfe8Q/3OW
 89ha8y56MErb1iPrA9+lYQaTwl+3Ow5giGRGeJSfTLS1I2H2TRj+j74eERGYvDYF/+LM
 3h96G25BV3w2BIw/wF33+DA7bIjhkWXdBgnGAQoXTOXfIqD1dl/jV4wiCDF+D7KGWUNQ
 gr4VpUKc4vIazBPU8mUOPX9KBBvK607TFaEUoS0ziYGwtKHCoMxNzYHGfgX6J5WVD9+M
 Y2D56L1W1pSl14s5iqKgzg6SvAEA3JVLj3GKr+O5475NrlUSKlVmcIanN/A1CCoQlzCG
 Ri2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:to:from:cc
 :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMhdbNJVUoz0Hj11V1L/5t60JRes0LegbsCxcfC4KLI=;
 b=JpgLVE/qJvFHU7HZWDcikzC3zxOVyJnWypiUCNOrENk1rQxRfDPLa4vjvG5wKSvxfi
 c9gGkqLiakHUckN6lAqMft6eEU1tnMSw8MpHhWt2UDg7Z0k4zE1KPpSp7qmSmgjqloQZ
 SAsUFJkKQXetupLnUJM7i36bTpzszsPOLau/W0ZRGSQ4kCL+G0yx/zQjLve+8AEI7K59
 hvXavvXYKQMIiX6va63pOvX0QEZ71iMFV+SjInQkV4dyVvcnyMC2g6Y+W3xBisHFwu56
 DYA0mXfq1ZBkNFpziZ7lcj0V0z0rTqLCVMGmm1U5qxq71Mf2bomPINoM3NKPoK0K/uqx
 eA4A==
X-Gm-Message-State: ACrzQf2zE+uiP/jEcTGvWrDhbX6VrxTMd+r+DEl1X4QilDSCI5k3GJBp
 j0tZcBmZR233haa9a1Cv41hjP5JRBor/Ug==
X-Google-Smtp-Source: AMsMyM6WciXG6cRpMP5SU0OvjWTdWly9RXBEHgu6Kx/SuqgJQJ44Bxgojed6ci3mKgOSzcuQrJhExA==
X-Received: by 2002:a17:90a:540e:b0:210:1e26:9422 with SMTP id
 z14-20020a17090a540e00b002101e269422mr57311066pjh.100.1667945462738; 
 Tue, 08 Nov 2022 14:11:02 -0800 (PST)
Received: from localhost ([50.221.140.188]) by smtp.gmail.com with ESMTPSA id
 t12-20020a1709027fcc00b00177fb862a87sm7399876plb.20.2022.11.08.14.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Nov 2022 14:11:02 -0800 (PST)
Date: Tue, 08 Nov 2022 14:11:02 -0800 (PST)
X-Google-Original-Date: Tue, 08 Nov 2022 14:11:00 PST (-0800)
Subject: Re: [PATCH trivial for 7.2] hw/ssi/sifive_spi.c: spelling: reigster
In-Reply-To: <20221105115329.306527-1-mjt@msgid.tls.msk.ru>
CC: qemu-devel@nongnu.org, mjt@tls.msk.ru, qemu-trivial@nongnu.org,
 alistair@alistair23.me, bin.meng@windriver.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mjt@tls.msk.ru
Message-ID: <mhng-33f90530-6bed-4501-913a-0ce40f4d9e0b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Sat, 05 Nov 2022 04:53:29 PDT (-0700), mjt@tls.msk.ru wrote:
> Fixes: 0694dabe9763847f3010b54ab3ec7d367d2f0ff0

Not sure if I missed something in QEMU land, but those are usually 
listed more like

Fixes: 0694dabe97 ("hw/ssi: Add SiFive SPI controller support")

Checkpatch isn't failing, though.  Either way

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks!

> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  hw/ssi/sifive_spi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ssi/sifive_spi.c b/hw/ssi/sifive_spi.c
> index 03540cf5ca..1b4a401ca1 100644
> --- a/hw/ssi/sifive_spi.c
> +++ b/hw/ssi/sifive_spi.c
> @@ -267,7 +267,7 @@ static void sifive_spi_write(void *opaque, hwaddr addr,
>      case R_RXDATA:
>      case R_IP:
>          qemu_log_mask(LOG_GUEST_ERROR,
> -                      "%s: invalid write to read-only reigster 0x%"
> +                      "%s: invalid write to read-only register 0x%"
>                        HWADDR_PRIx " with 0x%x\n", __func__, addr << 2, value);
>          break;

