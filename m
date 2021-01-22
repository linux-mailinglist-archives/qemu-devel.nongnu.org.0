Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2523007BA
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 16:49:02 +0100 (CET)
Received: from localhost ([::1]:45316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2ygH-0003Pe-QB
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 10:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yeZ-0002o9-QE
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:47:15 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:34306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2yeY-0008RW-1e
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 10:47:15 -0500
Received: by mail-ed1-x52b.google.com with SMTP id d22so7110944edy.1
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFF3oHAnCreyQ8d6nvTVlFjwwJGcXT7kbU6Xy7q2N1k=;
 b=iaD/PIeRx0mjTev0L7q1j1sq+0t364ARSWpjD3UcNe+3PyJ4xd+ANFfZOS/mvC8IlQ
 nbzx8doo/Lumt3SFf6OWogoBs1jL5htnGLoPZlzLNMDoXbrmh9l6qK/bOS6B/o+NIL8s
 AUMq7VabtL7faSReIJo7s+w77ofb3K+o0s3cLvqanDR5MyigEoxCvBfV7KkqpDoXoOmv
 ZHpI3sX0c+pI6Z7ygGhecpwsLeh+uQTmMKwD0+THgXs6U5WFOf7sOtGAPLx1GWY0ytLD
 fYDb0XMvzGKCo92C4RnvKhFld8lE3wykropoNHfV5JTH0HH1AvRiscvsbg4gwR1787Ej
 IXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFF3oHAnCreyQ8d6nvTVlFjwwJGcXT7kbU6Xy7q2N1k=;
 b=WLQsKzVaBZtf4vXknnO38faVlwG9nF+X2SZKYlUBHWTQOXtWCEmMRQ0e4I0rCDEspj
 U9A1OFteNA7IqotGWz9Zyxnjf9yZ1wycSeKqzUqEmEPn3BuDp6rmN9e8z0B54URzFPm6
 qpC+Cmu4JeHmfEg/WjB4FesjD0epnfIrEtEhMPXQp2ENn6cmkvc+BKIXjtlDnqkgbQK/
 fZoxs04m7/1eHnAIngNlH5kD5bOcuKZJIuxdJ6+YduLl+mvLup7eVwdn1ey1hbnzvMHn
 DzOpfhz77o3qUHxr39cwQg0zM+aaLTQfZKwAme/cax/mK6TSt4iXPtHczwwFiPTaz7RZ
 9WEg==
X-Gm-Message-State: AOAM531yANeApI+2fnZinyQIKYcO+kG+Ob+mRWs1lFJMa4/bBk9GTd2O
 y98WODBLm+75gzCezkPr24iOPBtYl94IR1O5Gk7ySw==
X-Google-Smtp-Source: ABdhPJx6uKZbIJB82MyjSzu2f2OPspNYAdgSZ3TmyD97f2PcWTFOeu/JzGJWozY8TWNZLur0Z3z2nGTSxSqz6khVJsc=
X-Received: by 2002:a05:6402:1383:: with SMTP id
 b3mr3582488edv.100.1611330432289; 
 Fri, 22 Jan 2021 07:47:12 -0800 (PST)
MIME-Version: 1.0
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
In-Reply-To: <20210120092748.14789-4-maxim.uvarov@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 15:47:01 +0000
Message-ID: <CAFEAcA8gGHP0eFmkxu=rV6RqR=g65uPQvZf7utWLTGLp-V8A7A@mail.gmail.com>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
To: Maxim Uvarov <maxim.uvarov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jan 2021 at 09:27, Maxim Uvarov <maxim.uvarov@linaro.org> wrote:
>
> Add secure pl061 for reset/power down machine from
> the secure world (Arm Trusted Firmware). Connect it
> with gpio-pwr driver.
>
> Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>

A nit, which I raise only because you'll need a respin anyway:


> +    /* connect secure pl061 to gpio-pwr */
> +    qdev_connect_gpio_out(pl061_dev, SECURE_GPIO_REBOOT,
> +                          qdev_get_gpio_in_named(gpio_pwr_dev, "reset", 0));

> +    qemu_fdt_add_subnode(vms->fdt, "/gpio-restart");

We have three different names for the same thing here: 'reboot',
'reset' and 'restart'. If we name the GPIO line SECURE_GPIO_RESET
we can at least get that down to two.

thanks
-- PMM

