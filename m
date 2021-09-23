Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E99415FFE
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 15:33:49 +0200 (CEST)
Received: from localhost ([::1]:42134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTOrE-0003RH-9S
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 09:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOoM-0002Lg-FH
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:30:50 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:43927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTOoH-0006D4-I2
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 09:30:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id w17so17138369wrv.10
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 06:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=R72pwKKDq67KLf6mWS3a33RQNqgLdbVmda+g++lW8Po=;
 b=vKxFaJqMjcs2u5m/gk+GTFvrWoUztnpvMGhUW0Gs9qpysDPfK/oNba2P7nUDSChtSc
 gns58B4985wfiS+os8kSvebeLFXfDkRDLhEISZbMhHW4KqqtSp7OROzX77AgYhQQflat
 0riwYTJCz0kYyWgYJ86A1vGd7FCrEMNjfbitajkSHlwbwGseBDLsKXajvC/WqHBzYhKk
 4eYjW6ErJw5lLKVomgNF6fYJHTMjDqFj2lFvmAbW+Mnuw93Y/40b287bwgd2wSuD4m8J
 ddccJadCsCvXIJwsILu4NAAvno9xBSmTbu+hnemBBp5HXIRU0ClRSmrhhZiJ2wm5kXnK
 MQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R72pwKKDq67KLf6mWS3a33RQNqgLdbVmda+g++lW8Po=;
 b=FC+aYzHGuHg6ULOG0F5UJYNlaUJwVH4mRCdAfWTElplyxBi3SUqHHdqKzyhnTBXgfz
 hVLYXhMJxBwj6X3NFrknQgUATV31g0/NVIbdWCb38OmXqMgtLBMvWQwUOQ4AujD8oW64
 y7fIZ/+vwxoynb/tMTgqwE73IckhpyY3Y0eSYhFdy3QYR+KUPbyvXkrNHlYapX2QMFI9
 ZUFLdApfwcIxtbYZtMF9R6L/7qPffSdHdah+upEAMZrodzI9mSx2H4yrxEhM+PZn+v6l
 uCWVaaEBk4Fzkzzj1geoe+ZY4s1wIyCVVLG+1gAj8a3ElCKeJBt5mfiwGnIpCK2mTBp3
 ezqg==
X-Gm-Message-State: AOAM531qlrRwYGZBw/aRRPV9g4I6XUBBPVbYoijY5ZjEPVGpd2LTeU6D
 9ltSw7dpu8nVTKcLU1kgZ+hhR+hfdGOXCU9maWgHjQ==
X-Google-Smtp-Source: ABdhPJy48n+Li9jrTapKCe+BWOMjQ/q6Dw4N5YBFBUuUNj4R9Z3AV47soBvmhhkOwH04wxx2dyNSO+ZHoLVHpcAdVvc=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr5026142wrw.376.1632403843302; 
 Thu, 23 Sep 2021 06:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210920122535.269988-1-eric.auger@redhat.com>
In-Reply-To: <20210920122535.269988-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 14:29:50 +0100
Message-ID: <CAFEAcA-8497+XS0PU3RAkGsrf7PGVm=oGymuHznE3iuopMHbKg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/rtc/pl031: Send RTC_CHANGE QMP event
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Gavin Shan <gshan@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 13:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> The PL031 currently is not able to report guest RTC change to the QMP
> monitor as opposed to mc146818 or spapr RTCs. This patch adds the call
> to qapi_event_send_rtc_change() when the Load Register is written. The
> value which is reported corresponds to the difference between the guest
> reference time and the reference time kept in softmmu/rtc.c.
>
> For instance adding 20s to the guest RTC value will report 20. Adding
> an extra 20s to the guest RTC value will report 20 + 20 = 40.
>
> The inclusion of qapi/qapi-types-misc-target.h in hw/rtl/pl031.c
> require to compile the PL031 with specific_ss.add() to avoid
> ./qapi/qapi-types-misc-target.h:18:13: error: attempt to use poisoned
> "TARGET_<ARCH>".
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Thanks. This looks plausible to me (well, it would ;-)) but
I would appreciate review from Paolo or somebody else who
understands the rtc_change feature and handling.

> ---
>
> v1 -> v2:
> - Use Peter's implementation and remove subsection
>
> Tested with the following script run on guest:
>
>   #!/bin/sh
>   old=$(hwclock --show | cut -f1-7 -d' ')
>   oldabs=$(date +%s -d "$old")
>   newabs=$(expr $oldabs + $1)
>   new=$(date -d @"$newabs")
>   echo Old: $oldabs $old
>   echo New: $newabs $new
>   hwclock --set --date "$new"
>
> and compared with x86 behavior.
> ---
>  hw/rtc/meson.build |  2 +-
>  hw/rtc/pl031.c     | 10 +++++++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
> index 7cecdee5ddb..8fd8d8f9a71 100644
> --- a/hw/rtc/meson.build
> +++ b/hw/rtc/meson.build
> @@ -2,7 +2,7 @@
>  softmmu_ss.add(when: 'CONFIG_DS1338', if_true: files('ds1338.c'))
>  softmmu_ss.add(when: 'CONFIG_M41T80', if_true: files('m41t80.c'))
>  softmmu_ss.add(when: 'CONFIG_M48T59', if_true: files('m48t59.c'))
> -softmmu_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
> +specific_ss.add(when: 'CONFIG_PL031', if_true: files('pl031.c'))
>  softmmu_ss.add(when: 'CONFIG_TWL92230', if_true: files('twl92230.c'))
>  softmmu_ss.add(when: ['CONFIG_ISA_BUS', 'CONFIG_M48T59'], if_true: files('m48t59-isa.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-rtc.c'))
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index 2bbb2062ac8..e7ced90b025 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -24,6 +24,7 @@
>  #include "qemu/log.h"
>  #include "qemu/module.h"
>  #include "trace.h"
> +#include "qapi/qapi-events-misc-target.h"
>
>  #define RTC_DR      0x00    /* Data read register */
>  #define RTC_MR      0x04    /* Match register */
> @@ -136,10 +137,17 @@ static void pl031_write(void * opaque, hwaddr offset,
>      trace_pl031_write(offset, value);
>
>      switch (offset) {
> -    case RTC_LR:
> +    case RTC_LR: {
> +        struct tm tm;
> +
>          s->tick_offset += value - pl031_get_count(s);
> +
> +        qemu_get_timedate(&tm, s->tick_offset);
> +        qapi_event_send_rtc_change(qemu_timedate_diff(&tm));
> +
>          pl031_set_alarm(s);
>          break;
> +    }
>      case RTC_MR:
>          s->mr = value;
>          pl031_set_alarm(s);

-- PMM

