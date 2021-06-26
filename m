Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C770A3B4DF4
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 12:17:09 +0200 (CEST)
Received: from localhost ([::1]:56634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lx5N6-0003Mp-86
	for lists+qemu-devel@lfdr.de; Sat, 26 Jun 2021 06:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx5M6-0002fE-Nm
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 06:16:06 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:35538)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lx5M4-00064J-M5
 for qemu-devel@nongnu.org; Sat, 26 Jun 2021 06:16:06 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 j11-20020a05600c1c0bb02901e23d4c0977so9391392wms.0
 for <qemu-devel@nongnu.org>; Sat, 26 Jun 2021 03:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sgqNlgyCB58ufLKn1VPF7YBmLCw5LItdjalS3SP5ssU=;
 b=lpZmZ2pOAdl2OIkEPlr6cp0AYHRXERpmJwIXxH9pm92FQ25nOxcu5AVT5oGph1UdVc
 hc/iXjo239fwEjthrG2yRGYjT699es2uEN2C5iRyuj7F4y2IgPs+CwQaJN6i4kZg783Z
 xxoJjq54XDBUAr1rJ9DmTwlTDhvSF2ekxPc/5RK89sRnP5Qly1wvFRhMgYQGTXQ0r0SV
 QD2Wflthrr7mGN9JvQ5dDRg5P6J/uJXNMMay+0LfipYAfg+28xpJfFz3TE3JlV67wypf
 CPQMZ/HuZvU24ed/uATWd+bUSTzjV9K36SC6GaJEpIS6enpSCEbNayBqa16a8G4CPr3o
 s1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sgqNlgyCB58ufLKn1VPF7YBmLCw5LItdjalS3SP5ssU=;
 b=h1rWw1T3hzcULZlppeTYGAhhCdEB8rmih/Nx3rf/SNx9F8TM2Jyshly7FcjM2dDAT0
 CCJw/FWsUqNZ8u03pL36wV2VYgw3ppIxv7p6lH4RjPf/k8Jl0I2C7Rq2Rte8b6eSZivr
 DM0K6ukyyKQ+rM5El78YJl0Li1ilhGHd8uBbty+ozScVHbGY4V2nKcJ+xHNFixFn2tLI
 FY2xoYT2ww+AAy3LvwgeEpqnD3EO6on9cDQfGDcFdxJDkBsmo4h0yYN+14P9ea2DASmU
 RtZ94NIbDJQ4plDgkENmgIIlpGbBV76a1uR5Hs3oOTZZ6q2oHJ3EOl5FPaB3GK/TFhFS
 SU0Q==
X-Gm-Message-State: AOAM530PtsmiI9sVzW/xBp28H0vCT040UVYTrtiDAMReqU3cGLIjV1Te
 XPrvlCCATBvKWTZ5olMP9WY=
X-Google-Smtp-Source: ABdhPJwdUcSYqnE+FkzFV56+wALdalDtzCdVSDGzq8IqgxpOhB7KzAMshVeCYQF3gXGcT9XrYXQ9+A==
X-Received: by 2002:a05:600c:321a:: with SMTP id
 r26mr15519419wmp.90.1624702563226; 
 Sat, 26 Jun 2021 03:16:03 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h6sm13955978wmc.40.2021.06.26.03.16.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 03:16:02 -0700 (PDT)
Subject: Re: [PATCH v3] Add basic power management to raspi.
To: Nolan Leake <nolan@sigbus.net>, qemu-devel@nongnu.org
References: <20210625210209.1870217-1-nolan@sigbus.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4fe1c908-6d2e-8481-81c6-2c68c367e5e3@amsat.org>
Date: Sat, 26 Jun 2021 12:16:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210625210209.1870217-1-nolan@sigbus.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Nolan, Peter,

On 6/25/21 11:02 PM, Nolan Leake wrote:
> This is just enough to make reboot and poweroff work. Works for
> linux, u-boot, and the arm trusted firmware. Not tested, but should
> work for plan9, and bare-metal/hobby OSes, since they seem to generally
> do what linux does for reset.
> 
> The watchdog timer functionality is not yet implemented.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64

Please carry the tags from previous versions (if the changes are minor).

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Nolan Leake <nolan@sigbus.net>
> ---
>  hw/arm/bcm2835_peripherals.c         |  13 ++-
>  hw/misc/bcm2835_powermgt.c           | 160 +++++++++++++++++++++++++++
>  hw/misc/meson.build                  |   1 +
>  include/hw/arm/bcm2835_peripherals.h |   3 +-
>  include/hw/misc/bcm2835_powermgt.h   |  29 +++++
>  5 files changed, 204 insertions(+), 2 deletions(-)
>  create mode 100644 hw/misc/bcm2835_powermgt.c
>  create mode 100644 include/hw/misc/bcm2835_powermgt.h
> 
> diff --git hw/arm/bcm2835_peripherals.c hw/arm/bcm2835_peripherals.c

Odd, usually the diff line comes with a/ b/ prefix, I can not
apply your patch (git version 2.31.1, Fedora):

Applying: Add basic power management to raspi.
error: arm/bcm2835_peripherals.c: does not exist in index
error: misc/meson.build: does not exist in index
error: hw/arm/bcm2835_peripherals.h: does not exist in index
Patch failed at 0001 Add basic power management to raspi.

But patchew succeeded:
https://patchew.org/QEMU/20210625210209.1870217-1-nolan@sigbus.net/

Applying: Add basic power management to raspi.
Using index info to reconstruct a base tree...
A       arm/bcm2835_peripherals.c
A       hw/arm/bcm2835_peripherals.h
A       misc/meson.build
Falling back to patching base and 3-way merge...

So I tested patchew's commit 7856ac0e804:
https://github.com/patchew-project/qemu/commit/7856ac0e8045d006f1008a03e1d4d8710b9d0612

Peter, when queueing this patch (maybe prepending hw/arm: or
hw/arm/raspi: to the subject), can you take the corresponding
test along - which is already reviewed?
https://www.mail-archive.com/qemu-devel@nongnu.org/msg811909.html

Thanks both,

Phil.

