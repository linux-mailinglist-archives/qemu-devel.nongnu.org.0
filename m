Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1163F982B
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 12:36:49 +0200 (CEST)
Received: from localhost ([::1]:58824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJZE8-0002Nw-8F
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 06:36:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJZCr-0001jJ-H3
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:35:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJZCq-0001PC-3h
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 06:35:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id dm15so9208465edb.10
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 03:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5j8LcRxWhi7xidcPLbQ6LlmW8QJvQFR429ono+OR0i4=;
 b=zHSOdhBAu2IOk1W6vQokwBC5pPVvnRv/EUFUyWTt83Ul7mWnrrYuUycmspnap2iHvZ
 3SMDdlhpC6nImLb4UFctetFPGYB+pJNiR+gXjht/y7q9N/cp7IbqpaJMwqrrSoVB/6Tn
 Zz89J8ADPcJsOwOk6kJK9VCtAjzp45JvksoutlOdUbioabXkOBVZHMDFzlf1iwH3AomU
 rk8oPdwdSEaEDlp4rNdK2ilngZ/g70IaBht18c3xGY2iR1Tk4nFwIH0R8OnPyKimdYT8
 S7OTlZPIGDPVJfX9lsO9tcrl1ReKK+VUqlpKF+kmWbis+3e5XfvbUxp1FDZcjvv4q8SK
 Aipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5j8LcRxWhi7xidcPLbQ6LlmW8QJvQFR429ono+OR0i4=;
 b=WjMr+twTxW6Iam9YwPEHjPqVDXLNBfSETYKZCGtEm9htKuG09tKqDaf7pXaRdHhF6P
 0+SyA7V6K9kN2jZOXKPYZHtKOYSJpEf1b2jO+/m9St4JOgFkqzfHYHHgPEk6zE/cUWXi
 V6HZMyH+AeEjUDi6tQ+G8P6XwUlwpp0TIinHhEk814e08jHYZ2eiBpxiuMCBhq63IDEY
 Ev4tdlPA2Ym/3LbEiNImHw1bCSJvD15w4+AQnWQXlv9CSznSrs9Q/PJqHKszunTDoCw2
 3jdW17GyZjOt9UX2gmiT5yOlrU191V2UyHK93JJQaMFG8tptw78xHrV0Q1wnYLVZrCzA
 LIxg==
X-Gm-Message-State: AOAM530P1SQjo0TWh+XrbUK36pUdVMP58cQls7g8fe43MmVDzgLoM9GV
 N5Azb9ScYx3iZIJ0IyZMRrNa2vlpBx4DE5+5lBdAxg==
X-Google-Smtp-Source: ABdhPJw3bi5M55Z8KFtrL1kgRgmwJAayeo78Eu+VHBWaEyB4K29O2qPwLor8gJuPDq6YCw3xT4ULwr7g3hOPoINMVm8=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr9049841edw.44.1630060525864;
 Fri, 27 Aug 2021 03:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210815162738.75461-1-kevin.townsend@linaro.org>
 <20210815162738.75461-2-kevin.townsend@linaro.org>
In-Reply-To: <20210815162738.75461-2-kevin.townsend@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Aug 2021 11:34:38 +0100
Message-ID: <CAFEAcA8ro6_ChTgSLYrFBVuBO_vD5gvvs6i2m8g2AK4=7KW78w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 15 Aug 2021 at 17:31, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> This commit adds emulation of the magnetometer on the LSM303DLHC.
> It allows the magnetometer's X, Y and Z outputs to be set via the
> mag_x, mag_y and mag_z properties, as well as the 12-bit
> temperature output via the temperature property.

> +/* Property Names */
> +#define LSM303DLHC_MSG_PROP_MAGX ("mag_x")
> +#define LSM303DLHC_MSG_PROP_MAGY ("mag_y")
> +#define LSM303DLHC_MSG_PROP_MAGZ ("mag_z")
> +#define LSM303DLHC_MSG_PROP_TEMP ("temperature")

Forgot to mention -- for property names, we prefer hyphens
rather than underscores.

-- PMM

