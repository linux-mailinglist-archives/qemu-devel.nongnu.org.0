Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968E444C306
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 15:33:45 +0100 (CET)
Received: from localhost ([::1]:40160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkofY-0005Nw-7w
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 09:33:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkody-0004Vr-5W
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:32:06 -0500
Received: from [2a00:1450:4864:20::432] (port=38605
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mkodw-00051F-2a
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 09:32:05 -0500
Received: by mail-wr1-x432.google.com with SMTP id u18so4379241wrg.5
 for <qemu-devel@nongnu.org>; Wed, 10 Nov 2021 06:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WowmwcCU7c0QlNvZnhiifrbRA5recIcDo5LQkBBK2IU=;
 b=tmTyw5Dmm/L9FQ6eZddKAI4I/VHnYHB5cmIFrbIvUfSZNcNAvF1FCHwDMIerkRgoD7
 BqsR5uVZlxDad5gHpS82MlY5VE4SvAr9saxrlYy8thNZdQvR9+1WdT1VvpOVvX50FBwz
 wTNNWi7mDW4DR23/c/fhBtw73pE7hASC6i+tnZI+oi//8FtWXk+UEsclkENoUo2O7Ghx
 dzjvS0x1HUNV0EXKQrBLGRkhBmt+xWbZPTJ+9xlA0K/qc7IwGuWzxIc50FLB1fMcEU8I
 5pBJmXyiG61s9gI6MilZCt/9pRCfgFsB0pdZTdr7DS5387bCtu9r41Hy9V86mHduco5y
 Fxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WowmwcCU7c0QlNvZnhiifrbRA5recIcDo5LQkBBK2IU=;
 b=We39EvImVD1OSoqZ6oC1xyK+WGFS0jZzcv8hmPZ7Mob3Jm1g9gIgSg/e22hDGjv3oI
 ve1Rf/7kkpOULxHiSbVdJ9WhFeawzD54Y9krCbAF36IZRe68P9JCPZRHm39569QS62Ew
 eOc+zLFMtTdAAlzGrCLX8EAoIzlMUlRp1CccBjeKLZWaQqrtqOpOh8dHvWmCB3imXcKa
 mXwdsqqV5EUPbe6OaVcWyspwp1Tda0oc42GXT+o7srXUZeImOhP939q59mtfVdarICzo
 g/h/ft+PxIKzcYCOnCw65/Sqmi7kCRT+pSTmCTpxgVQmiRPwrBfJruPLXmQz4/1nXzLf
 VaOw==
X-Gm-Message-State: AOAM531G7+FCRa/LOkw71XYmvBl3EydsCQZbv/5xUsz7087DxIt5mZZB
 49m2LwxLqE96DnYT2BtHKwRIpBHu1QC0LYaSYA7YfQ==
X-Google-Smtp-Source: ABdhPJziYutSt1ybgOfN/hHZOTpcwCfHzdmi1mfS3GBYyARb0f/j/xpz8r8UBOwQpAt5rsd7LwY9sSQHqmUIj+ord1g=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr155146wrt.275.1636554722565; 
 Wed, 10 Nov 2021 06:32:02 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA_LUNY7NRt=vDeoHDgaeBYZTzVEx8i8Ce_KopE8Z4_WpQ@mail.gmail.com>
 <YYuusGM1Nn7Dhpv9@redhat.com>
In-Reply-To: <YYuusGM1Nn7Dhpv9@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Nov 2021 14:31:51 +0000
Message-ID: <CAFEAcA883VJwuTu6vk_DFTaB40jv2sQYQpDGDsc0R9JZo_gLgg@mail.gmail.com>
Subject: Re: qemu-img.c possibly overflowing shifts by BDRV_SECTOR_BITS
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Hanna Reitz <hreitz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Nov 2021 at 11:36, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 09.11.2021 um 20:07 hat Peter Maydell geschrieben:
> > Hi; Coverity is complaining about some of the places in qemu-img.c
> > where it takes a 32-bit variable and shifts it left by BDRV_SECTOR_BITS
> > to convert a sector count to a byte count, because it's doing the
> > shift in 32-bits rather than 64 and so Coverity thinks there might
> > be overflow (CID 1465221, 1465219). Is it right and we need extra
> > casts to force the shift to be done in 64 bits, or is there some
> > constraint that means we know the sector counts are always small
> > enough that the byte count is 2GB or less ?
>
> These are false positives. n is limited to BDRV_REQUEST_MAX_SECTORS
> already when it starts out in convert_iteration_sectors() (which is
> enough to make the calculation safe), but for the specific code path, I
> think it's even guaranteed to be further limited to s->buf_sectors which
> is 16 MB at most (MAX_BUF_SECTORS in qemu-img.c).

Thanks. I've marked them as false-positives in the coverity UI.

-- PMM

