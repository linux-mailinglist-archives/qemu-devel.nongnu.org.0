Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5B649EB48
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 20:44:55 +0100 (CET)
Received: from localhost ([::1]:55162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDAhS-0003NJ-Lk
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 14:44:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAcG-0007ME-D8
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:39:32 -0500
Received: from [2a00:1450:4864:20::42e] (port=34438
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDAcE-0002I1-M4
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:39:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id f17so6724817wrx.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HnUsBtTGAkBKeknYVD38A9c7wdorYnP7nNyXrMzBxkQ=;
 b=dg/QZHNyXVgd87cq104F/q6RZ47Dt03WyDFItBYKgSg8g6STeT8RNXhEszMCKc/MvN
 tbWSHuhNPETik8ZkWUEOX/5SmGkHLWfVXbOHN3UzYRtZloDbdTybVkJ721vYHJfX0RM+
 klUawy+b/iQb7ZYH7r0c6eY1Nrx2tfo1xW+O5+MsngiM4rP8Wb2G1dHk0mn4ZXojUmF2
 qtxPlZXhxHVzXYyRlEZFMIf0Go5k+bWDgzPpeI9HGO18n0hpfrjFLwDsPnbEpYDNwkb/
 FxjPFRf0zV3srh8V4xl05nllFEn7ojoBM8M/4Da294TySBc6yuX0/fEhFHRCR9o+GG3A
 qkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HnUsBtTGAkBKeknYVD38A9c7wdorYnP7nNyXrMzBxkQ=;
 b=D9RKOzHKYDcAtqBCotU/lsndgSFyt7P+Jcqj5LJnrLUaOjTGWQEf9zpTRDan6FU25I
 q7dWUMTZ5fGJgl7Pi5VPTGzlxPJ5AQfUbxABS7vOKD1JfmBrf7h25tWpJ1ZrwD2YrdNG
 JcXKOcNRcI62dhyxCfodq1yb2mb2y+4VdxUNZe2a9Mepct7JY1ReXWRT5OB5L71VE37x
 jHYVXTNmqodA0lhlFKwdr9yBUxeUmfXelbgoxYbAbtA/dqyNNQ6bGZGL28xj/4KfEht2
 /7MazKFf7KBhclB9oxElW2/XA8+CvJk+2BRMTOKCNAleR1RX28YlA07hiKANLn8JGQ2f
 GuOw==
X-Gm-Message-State: AOAM5311I/MQZ5ykq8L+EyhCJ6dCPGUbQb6NFtP8L8ln5dLWdtLTN5GM
 mBpECLL2BEKlp8KCcOPk4b+0Vkc8oUGwXS3fueiE7A==
X-Google-Smtp-Source: ABdhPJzKElK63NUyJhIWDIObLrHbTdpoD8ft3YluQSBXQGpab/kJvZ0IkqOgBIFws7a5DnpBrWiTJN1auH1ZNBaAZ8o=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr4127434wrq.295.1643312369206; 
 Thu, 27 Jan 2022 11:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20220106230936.417020-1-titusr@google.com>
 <20220106230936.417020-4-titusr@google.com>
In-Reply-To: <20220106230936.417020-4-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:39:18 +0000
Message-ID: <CAFEAcA-m6Pk+nzSR72hfTaEmEHoYKa+BvxvGij9kCtEu5vRXUA@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/sensor: add Intersil ISL69260 device model
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: minyard@acm.org, venture@google.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 Hao Wu <wuhaotsh@google.com>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 at 23:19, Titus Rwantare <titusr@google.com> wrote:
>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> ---
>  MAINTAINERS                   |   3 +
>  hw/arm/Kconfig                |   1 +
>  hw/sensor/Kconfig             |   5 +
>  hw/sensor/isl_pmbus.c         | 210 +++++++++++++++++++
>  hw/sensor/meson.build         |   1 +
>  include/hw/sensor/isl_pmbus.h |  50 +++++
>  tests/qtest/isl_pmbus-test.c  | 381 ++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build       |   1 +
>  8 files changed, 652 insertions(+)
>  create mode 100644 hw/sensor/isl_pmbus.c
>  create mode 100644 include/hw/sensor/isl_pmbus.h
>  create mode 100644 tests/qtest/isl_pmbus-test.c
>



> +static uint8_t isl_pmbus_read_byte(PMBusDevice *pmdev)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: reading from unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;
> +}
> +
> +static int isl_pmbus_write_data(PMBusDevice *pmdev, const uint8_t *buf,
> +                              uint8_t len)
> +{
> +    qemu_log_mask(LOG_GUEST_ERROR,
> +                  "%s: write to unsupported register: 0x%02x\n",
> +                  __func__, pmdev->code);
> +    return 0xFF;
> +}

This device appears to have no implemented guest visible
interface at all, and yet it has a lot of object properties.
What's going on here ?

thanks
-- PMM

