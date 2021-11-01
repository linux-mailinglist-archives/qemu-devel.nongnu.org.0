Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E6441F19
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:19:59 +0100 (CET)
Received: from localhost ([::1]:46558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhayU-0003J4-JQ
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaxB-0001Gk-37
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:18:37 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:44899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhax8-0007OC-N0
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:18:36 -0400
Received: by mail-wr1-x433.google.com with SMTP id d13so29121353wrf.11
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2YmfFMGc0gsGmnXwd3+5M2iawyYIskorFjLr3wZWOAU=;
 b=d24GepGw2cImaDwbIBIXDrXbDFfVjenbCIC0G/yGKjDS+YrjVN9xZZJYmdp5PlcyiM
 icQf9umq9//FlrsRrg1G8ejYkQR9aNF0Kb76RYM67ldtHP9eLoVX6AyFTDluVwchphsf
 zEScvTe4HNnLmps2/36cRdJKcRqR2PWIh5QRpD9qkLCEU5m4y5l/DhgvJt2o8E/w9ITC
 Zc7U0yA8KXen5vuznPRk2JiKTN1DpHkTaVKBvYV2b7QClNebzRS0M4fXiXR/Rugyv3xS
 FU124oo5Jqu6xhCL8qYkrAENYLel5ikJjz6+ynMZV3ugJck0FrcG0qekjBm8bLtv1zsm
 rqdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2YmfFMGc0gsGmnXwd3+5M2iawyYIskorFjLr3wZWOAU=;
 b=sCv8MbwxF7uROoJlLr0DIWylQ3bddL+ihkW9XNFlj38vhukCqNIIwFO72ImBRUvHot
 ocy6t7Wzz6+H0yIgJQcIJHY9kWcJAhmGZ0wxpOLRVahSDoqxPgnKWFiK5ibUc+z5WvVI
 ZrRy3xSuBI5R4zKMRehfUKDW8P0Z4X471CITvGFdXffvXEjnxCEMryTmseMPZvH2QFSp
 AYAoimhEFeNAe19lcmSErP0pNMHaQovjvpjDW+Rw2cf/EjbcAV8WEMHPBgiTpT8+d5nO
 8Hl8kB8GZmTTEfrfgKisMcWNV/+6EKyOLV0lJruFXMeq4h4yhgUNG7vrcZ1lGEt57gIX
 fXwA==
X-Gm-Message-State: AOAM533a1XcOiQA2F2V0aQUxuxFlkqjN9mMrKG+uyXic+nXSuOKFNdyb
 rodbnOcHBjl46xsm1YU9fn8quZD0OFug17HjV11gkA==
X-Google-Smtp-Source: ABdhPJxwVPz22bOc38YEM7IDYxn8CcclU3qhZ+Xwk2o+BQan8JIPDOIMTJAuzInFAkpFlKeop8wPe0HtfzV+JDh0aPA=
X-Received: by 2002:a05:6000:18ae:: with SMTP id
 b14mr39253866wri.263.1635787113281; 
 Mon, 01 Nov 2021 10:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-2-wuhaotsh@google.com>
In-Reply-To: <20211008002628.1958285-2-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:18:22 +0000
Message-ID: <CAFEAcA_TcKcSsx5J+QqK1AM+ZwCvbSrSPgSD9XA35vVwJah9hA@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] hw/sd: add nuvoton MMC
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by:  Hao Wu <wuhaotsh@google.com>
> ---

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI read of nonexist reg: 0x%02"

"nonexistent"

> +                      HWADDR_PRIx, addr);
> +        break;
> +    }
> +
> +    return val;
> +}
> +
> +static void npcm7xx_sdhci_write(void *opaque, hwaddr addr, uint64_t val,
> +                                unsigned int size)
> +{
> +    NPCM7xxSDHCIState *s = opaque;
> +
> +    switch (addr) {
> +    case NPCM7XX_BOOTTOCTRL:
> +        s->regs.boottoctrl = val;
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "SDHCI write of nonexist reg: 0x%02"

ditto

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

