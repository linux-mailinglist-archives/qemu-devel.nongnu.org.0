Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2C49F0C6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 03:01:56 +0100 (CET)
Received: from localhost ([::1]:58662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDGaI-0007zC-Ux
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 21:01:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nDGWm-0004kT-UX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:58:17 -0500
Received: from [2607:f8b0:4864:20::f29] (port=44978
 helo=mail-qv1-xf29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1nDGWg-0005Xu-3G
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 20:58:13 -0500
Received: by mail-qv1-xf29.google.com with SMTP id s6so4518408qvv.11
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 17:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=i0fJ4wFtdM9w1Ip37G6q3UGsw4HzFarjoUrsDLqeKGE=;
 b=g0Iv1B1zeOVWiCxi0qF4fC5uQ1z1oJQV//9LnXEoxqUEagWWWs0JL9SBRsYNbBEABF
 sgAqfXMs/E5QYY2BBqEjyyDQEwZhMtt3LwUgTkNYfZv56LTuCacK+6Vclaa51jvzqi1B
 vYtRSDlp3Bckqb/1WxbfIx/ZX+zlK08mTPYcegEtFDY1wKtbJ0FbpuQwXS2npFc7Yd2m
 cv98Jcyw6RNIIVRUs6SggqbZZq6dS1ZNG8itPodZiHwifCSbB4iiVYExw40dw/tWhqjJ
 tn9DFi4np8mCT53zk6nNvFl83ZKy7BrR1WoWRQZLqw8EDBzjoeZ+fr7V8zT87Bm54LIv
 1sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=i0fJ4wFtdM9w1Ip37G6q3UGsw4HzFarjoUrsDLqeKGE=;
 b=ayD/mZIE9dcOEq/D+uhGPDscAJr+yx8ceQO9Ihxt4hzDYqVl1GkMuQl/dTDYsG1BOg
 VS897E4kdbwDPLnn2nx4iyGRzhV7C3sNpd60bf3mv27Ut/hhs28WU7leE1PX7DAy/0jE
 ui1vJGMBlvE004QqRgYJw+fBT/0q/pPtio8uGqOhuL5uhQLRUEaEmwVOirhaLjyZsQK/
 zQHzBG3nSoe1pgEz2a0f8oiR++5WLoJHwngeJVfZLMH0JdYebO0cUDO/xX7ajr4PNVEp
 o1GziERT7ypLo3IfDv7DIC2LwAvi//laSEhBTTVHv389SesVSuZEEETVOtLCs15muGRR
 Oo3A==
X-Gm-Message-State: AOAM530ZXT7ra+nJxA0lPDDiV8s8j4xnO9awb/cvLFLUOxuptbDHODvv
 8GdhkY9FYP+srNQJtz820A==
X-Google-Smtp-Source: ABdhPJyZR8htf0VjrgqW2fz8FdaIeMxdd+Hk6Fmdd3CTJpFBB4vCZNQRXVULQCyBgVF2QIs7DvMgeA==
X-Received: by 2002:a05:6214:c4d:: with SMTP id
 r13mr575846qvj.101.1643335087871; 
 Thu, 27 Jan 2022 17:58:07 -0800 (PST)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id b6sm2192794qti.72.2022.01.27.17.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 17:58:07 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:f085:adcc:a9f1:6b22])
 by serve.minyard.net (Postfix) with ESMTPSA id B15CD1800B7;
 Fri, 28 Jan 2022 01:58:05 +0000 (UTC)
Date: Thu, 27 Jan 2022 19:58:04 -0600
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH] hw/sensor: Add SB-TSI Temperature Sensor Interface
Message-ID: <20220128015804.GW34919@minyard.net>
References: <20220108030451.3867815-1-venture@google.com>
 <CAO=notwq9OWgPEymrb6OR0LXkH784qZPxzaO0X8UvgT+_-TizQ@mail.gmail.com>
 <20220117140524.GC34953@minyard.net>
 <CAO=notxchfjca97JVVnocc0o6d5iQDPz494m=epZzH6Ot_h2ag@mail.gmail.com>
 <CAGcCb12g-zqBq1f-kXO0PfX6CmESi86RYoAvbBVsJju89KwSoA@mail.gmail.com>
 <20220127145532.GI34953@minyard.net>
 <CAGcCb13uCD61Mk1Jbsb9GSCdAA-x71LeZ+kreU8pLnCsq6_NKA@mail.gmail.com>
 <CAO=notz9Lyr0NYoUOAiemWpxFb=T4C2DCxSU+hzdCLamDLGhAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO=notz9Lyr0NYoUOAiemWpxFb=T4C2DCxSU+hzdCLamDLGhAA@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::f29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=tcminyard@gmail.com; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Doug Evans <dje@google.com>, Hao Wu <wuhaotsh@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 27, 2022 at 03:18:43PM -0800, Patrick Venture wrote:
> On Thu, Jan 27, 2022 at 10:20 AM Hao Wu <wuhaotsh@google.com> wrote:
> 
> >
> > On Thu, Jan 27, 2022 at 6:55 AM Corey Minyard <cminyard@mvista.com> wrote:
> >
> >> On Wed, Jan 26, 2022 at 04:09:03PM -0800, Hao Wu wrote:
> >> > Hi,
> >> >
> >> > Sorry for the late reply. I'm not sure what "auto-increment" means here.
> >>
> >> The question is: When a value is read, does the address automatically
> >> increment.  I2C devices very often do this.  If you do a multi-byte
> >> read, they often will read the value from address 0, then from address
> >> 1, etc.  Same for writes.
> >>
> > The datasheet does not suggest such behavior could happen.
> >
> >>
> >> > The kernel driver at
> >> > https://lkml.org/lkml/2020/12/11/968
> >> > only has byte-size read/write operations, so I don't see a problem here.
> >> > The values are extracted
> >> > from the datasheet.
> >>
> >> The *Linux* kernel driver my only do byte-size operations, but other
> >> kernels may work different, and the Linux kernel may change.  You have
> >> to implement from the datasheet, not the device driver.
> >>
> > The implementation is already according to the datasheet.
> >
> >> Thanks,
> >>
> >> -corey
> >>
> >>
> I have to send out a new patchset to include my signature block since I'm
> sending a patch Hao wrote.  Laurent pointed this out to me in a different
> patch series.
> 
> From this exchange, I don't think there are other changes for v2.  Please
> let me know if that's false.

Yes, we are good.  It's a little surprising, hopefully we don't have to
fix it in the future if it works that way the datasheet didn't say so.

Acked-by: Corey Minyard <cminyard@mvista.com>

> 
> Thanks,
> Patrick
> 
> 
> > >
> >> > On Tue, Jan 18, 2022 at 9:10 AM Patrick Venture <venture@google.com>
> >> wrote:
> >> >
> >> > >
> >> > >
> >> > > On Mon, Jan 17, 2022 at 6:05 AM Corey Minyard <cminyard@mvista.com>
> >> wrote:
> >> > >
> >> > >> On Sun, Jan 09, 2022 at 06:17:34PM -0800, Patrick Venture wrote:
> >> > >> > On Fri, Jan 7, 2022 at 7:04 PM Patrick Venture <venture@google.com
> >> >
> >> > >> wrote:
> >> > >> >
> >> > >> > > From: Hao Wu <wuhaotsh@google.com>
> >> > >> > >
> >> > >> > > SB Temperature Sensor Interface (SB-TSI) is an SMBus compatible
> >> > >> > > interface that reports AMD SoC's Ttcl (normalized temperature),
> >> > >> > > and resembles a typical 8-pin remote temperature sensor's I2C
> >> > >> interface
> >> > >> > > to BMC.
> >> > >> > >
> >> > >> > > This patch implements a basic AMD SB-TSI sensor that is
> >> > >> > > compatible with the open-source data sheet from AMD and Linux
> >> > >> > > kernel driver.
> >> > >> > >
> >> > >> > > Reference:
> >> > >> > > Linux kernel driver:
> >> > >> > > https://lkml.org/lkml/2020/12/11/968
> >> > >> > > Register Map:
> >> > >> > > https://developer.amd.com/wp-content/resources/56255_3_03.PDF
> >> > >> > > (Chapter 6)
> >> > >> > >
> >> > >> > > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> >> > >> > > Reviewed-by: Doug Evans <dje@google.com>
> >> > >> > > ---
> >> > >> > >  hw/sensor/Kconfig            |   4 +
> >> > >> > >  hw/sensor/meson.build        |   1 +
> >> > >> > >  hw/sensor/tmp_sbtsi.c        | 393
> >> > >> +++++++++++++++++++++++++++++++++++
> >> > >> > >  hw/sensor/trace-events       |   5 +
> >> > >> > >  hw/sensor/trace.h            |   1 +
> >> > >> > >  meson.build                  |   1 +
> >> > >> > >  tests/qtest/meson.build      |   1 +
> >> > >> > >  tests/qtest/tmp_sbtsi-test.c | 180 ++++++++++++++++
> >> > >> > >  8 files changed, 586 insertions(+)
> >> > >> > >  create mode 100644 hw/sensor/tmp_sbtsi.c
> >> > >> > >  create mode 100644 hw/sensor/trace-events
> >> > >> > >  create mode 100644 hw/sensor/trace.h
> >> > >> > >  create mode 100644 tests/qtest/tmp_sbtsi-test.c
> >> > >> > >
> >> > >> > > diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
> >> > >> > > index 9c8a049b06..27f6f79c84 100644
> >> > >> > > --- a/hw/sensor/Kconfig
> >> > >> > > +++ b/hw/sensor/Kconfig
> >> > >> > > @@ -21,3 +21,7 @@ config ADM1272
> >> > >> > >  config MAX34451
> >> > >> > >      bool
> >> > >> > >      depends on I2C
> >> > >> > > +
> >> > >> > > +config AMDSBTSI
> >> > >> > > +    bool
> >> > >> > > +    depends on I2C
> >> > >> > > diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
> >> > >> > > index 059c4ca935..f7b0e645eb 100644
> >> > >> > > --- a/hw/sensor/meson.build
> >> > >> > > +++ b/hw/sensor/meson.build
> >> > >> > > @@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true:
> >> > >> > > files('dps310.c'))
> >> > >> > >  softmmu_ss.add(when: 'CONFIG_EMC141X', if_true:
> >> files('emc141x.c'))
> >> > >> > >  softmmu_ss.add(when: 'CONFIG_ADM1272', if_true:
> >> files('adm1272.c'))
> >> > >> > >  softmmu_ss.add(when: 'CONFIG_MAX34451', if_true:
> >> files('max34451.c'))
> >> > >> > > +softmmu_ss.add(when: 'CONFIG_AMDSBTSI', if_true:
> >> > >> files('tmp_sbtsi.c'))
> >> > >> > > diff --git a/hw/sensor/tmp_sbtsi.c b/hw/sensor/tmp_sbtsi.c
> >> > >> > > new file mode 100644
> >> > >> > > index 0000000000..b68c7ebf61
> >> > >> > > --- /dev/null
> >> > >> > > +++ b/hw/sensor/tmp_sbtsi.c
> >> > >> > > @@ -0,0 +1,393 @@
> >> > >> > > +/*
> >> > >> > > + * AMD SBI Temperature Sensor Interface (SB-TSI)
> >> > >> > > + *
> >> > >> > > + * Copyright 2021 Google LLC
> >> > >> > > + *
> >> > >> > > + * This program is free software; you can redistribute it and/or
> >> > >> modify it
> >> > >> > > + * under the terms of the GNU General Public License as
> >> published by
> >> > >> the
> >> > >> > > + * Free Software Foundation; either version 2 of the License, or
> >> > >> > > + * (at your option) any later version.
> >> > >> > > + *
> >> > >> > > + * This program is distributed in the hope that it will be
> >> useful,
> >> > >> but
> >> > >> > > WITHOUT
> >> > >> > > + * ANY WARRANTY; without even the implied warranty of
> >> > >> MERCHANTABILITY or
> >> > >> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
> >> > >> License
> >> > >> > > + * for more details.
> >> > >> > > + */
> >> > >> > > +
> >> > >> > > +#include "qemu/osdep.h"
> >> > >> > > +#include "hw/i2c/smbus_slave.h"
> >> > >> > > +#include "hw/irq.h"
> >> > >> > > +#include "migration/vmstate.h"
> >> > >> > > +#include "qapi/error.h"
> >> > >> > > +#include "qapi/visitor.h"
> >> > >> > > +#include "qemu/log.h"
> >> > >> > > +#include "qemu/module.h"
> >> > >> > > +#include "trace.h"
> >> > >> > > +
> >> > >> > > +#define TYPE_SBTSI "sbtsi"
> >> > >> > > +#define SBTSI(obj) OBJECT_CHECK(SBTSIState, (obj), TYPE_SBTSI)
> >> > >> > > +
> >> > >> > > +/**
> >> > >> > > + * SBTSIState:
> >> > >> > > + * temperatures are in units of 0.125 degrees
> >> > >> > > + * @temperature: Temperature
> >> > >> > > + * @limit_low: Lowest temperature
> >> > >> > > + * @limit_high: Highest temperature
> >> > >> > > + * @status: The status register
> >> > >> > > + * @config: The config register
> >> > >> > > + * @alert_config: The config for alarm_l output.
> >> > >> > > + * @addr: The address to read/write for the next cmd.
> >> > >> > > + * @alarm: The alarm_l output pin (GPIO)
> >> > >> > > + */
> >> > >> > > +typedef struct SBTSIState {
> >> > >> > > +    SMBusDevice parent;
> >> > >> > > +
> >> > >> > > +    uint32_t temperature;
> >> > >> > > +    uint32_t limit_low;
> >> > >> > > +    uint32_t limit_high;
> >> > >> > > +    uint8_t status;
> >> > >> > > +    uint8_t config;
> >> > >> > > +    uint8_t alert_config;
> >> > >> > > +    uint8_t addr;
> >> > >> > > +    qemu_irq alarm;
> >> > >> > > +} SBTSIState;
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
> >> > >> registers
> >> > >> > > are
> >> > >> > > + * the integer part of a temperature value or limit, and "_DEC"
> >> > >> registers
> >> > >> > > are
> >> > >> > > + * corresponding decimal parts.
> >> > >> > > + */
> >> > >> > > +#define SBTSI_REG_TEMP_INT      0x01 /* RO */
> >> > >> > > +#define SBTSI_REG_STATUS        0x02 /* RO */
> >> > >> > > +#define SBTSI_REG_CONFIG        0x03 /* RO */
> >> > >> > > +#define SBTSI_REG_TEMP_HIGH_INT 0x07 /* RW */
> >> > >> > > +#define SBTSI_REG_TEMP_LOW_INT  0x08 /* RW */
> >> > >> > > +#define SBTSI_REG_CONFIG_WR     0x09 /* RW */
> >> > >> > > +#define SBTSI_REG_TEMP_DEC      0x10 /* RO */
> >> > >> > > +#define SBTSI_REG_TEMP_HIGH_DEC 0x13 /* RW */
> >> > >> > > +#define SBTSI_REG_TEMP_LOW_DEC  0x14 /* RW */
> >> > >> > > +#define SBTSI_REG_ALERT_CONFIG  0xBF /* RW */
> >> > >> > > +#define SBTSI_REG_MAN           0xFE /* RO */
> >> > >> > > +#define SBTSI_REG_REV           0xFF /* RO */
> >> > >> > > +
> >> > >> > > +#define SBTSI_STATUS_HIGH_ALERT BIT(4)
> >> > >> > > +#define SBTSI_STATUS_LOW_ALERT  BIT(3)
> >> > >> > > +#define SBTSI_CONFIG_ALERT_MASK BIT(7)
> >> > >> > > +#define SBTSI_ALARM_EN          BIT(0)
> >> > >> > > +
> >> > >> > > +#define SBTSI_LIMIT_LOW_DEFAULT (0)
> >> > >> > > +#define SBTSI_LIMIT_HIGH_DEFAULT (560)
> >> > >> > > +#define SBTSI_MAN_DEFAULT (0)
> >> > >> > > +#define SBTSI_REV_DEFAULT (4)
> >> > >> > > +#define SBTSI_ALARM_L "alarm_l"
> >> > >> > > +
> >> > >> > > +/* The temperature we stored are in units of 0.125 degrees. */
> >> > >> > > +#define SBTSI_TEMP_UNIT_IN_MILLIDEGREE 125
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * The integer part and decimal of the temperature both 8 bits.
> >> > >> > > + * Only the top 3 bits of the decimal parts are used.
> >> > >> > > + * So the max temperature is (2^8-1) + (2^3-1)/8 = 255.875
> >> degrees.
> >> > >> > > + */
> >> > >> > > +#define SBTSI_TEMP_MAX 255875
> >> > >> > > +
> >> > >> > > +/* The integer part of the temperature in terms of 0.125
> >> degrees. */
> >> > >> > > +static uint8_t get_temp_int(uint32_t temp)
> >> > >> > > +{
> >> > >> > > +    return temp >> 3;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * The decimal part of the temperature, in terms of 0.125
> >> degrees.
> >> > >> > > + * H/W store it in the top 3 bits so we shift it by 5.
> >> > >> > > + */
> >> > >> > > +static uint8_t get_temp_dec(uint32_t temp)
> >> > >> > > +{
> >> > >> > > +    return (temp & 0x7) << 5;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * Compute the temperature using the integer and decimal part,
> >> > >> > > + * in terms of 0.125 degrees. The decimal part are only the top
> >> 3
> >> > >> bits
> >> > >> > > + * so we shift it by 5 here.
> >> > >> > > + */
> >> > >> > > +static uint32_t compute_temp(uint8_t integer, uint8_t decimal)
> >> > >> > > +{
> >> > >> > > +    return (integer << 3) + (decimal >> 5);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/* Compute new temp with new int part of the temperature. */
> >> > >> > > +static uint32_t compute_temp_int(uint32_t temp, uint8_t integer)
> >> > >> > > +{
> >> > >> > > +    return compute_temp(integer, get_temp_dec(temp));
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/* Compute new temp with new dec part of the temperature. */
> >> > >> > > +static uint32_t compute_temp_dec(uint32_t temp, uint8_t decimal)
> >> > >> > > +{
> >> > >> > > +    return compute_temp(get_temp_int(temp), decimal);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/* The integer part of the temperature. */
> >> > >> > > +static void sbtsi_update_status(SBTSIState *s)
> >> > >> > > +{
> >> > >> > > +    s->status = 0;
> >> > >> > > +    if (s->alert_config & SBTSI_ALARM_EN) {
> >> > >> > > +        if (s->temperature >= s->limit_high) {
> >> > >> > > +            s->status |= SBTSI_STATUS_HIGH_ALERT;
> >> > >> > > +        }
> >> > >> > > +        if (s->temperature <= s->limit_low) {
> >> > >> > > +            s->status |= SBTSI_STATUS_LOW_ALERT;
> >> > >> > > +        }
> >> > >> > > +    }
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_update_alarm(SBTSIState *s)
> >> > >> > > +{
> >> > >> > > +    sbtsi_update_status(s);
> >> > >> > > +    if (s->status != 0 && !(s->config &
> >> SBTSI_CONFIG_ALERT_MASK)) {
> >> > >> > > +        qemu_irq_raise(s->alarm);
> >> > >> > > +    } else {
> >> > >> > > +        qemu_irq_lower(s->alarm);
> >> > >> > > +    }
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static uint8_t sbtsi_read_byte(SMBusDevice *d)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(d);
> >> > >> > > +    uint8_t data = 0;
> >> > >> > > +
> >> > >> > > +    switch (s->addr) {
> >> > >> > > +    case SBTSI_REG_TEMP_INT:
> >> > >> > > +        data = get_temp_int(s->temperature);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_DEC:
> >> > >> > > +        data = get_temp_dec(s->temperature);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_HIGH_INT:
> >> > >> > > +        data = get_temp_int(s->limit_high);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_LOW_INT:
> >> > >> > > +        data = get_temp_int(s->limit_low);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
> >> > >> > > +        data = get_temp_dec(s->limit_high);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_LOW_DEC:
> >> > >> > > +        data = get_temp_dec(s->limit_low);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_CONFIG:
> >> > >> > > +    case SBTSI_REG_CONFIG_WR:
> >> > >> > > +        data = s->config;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_STATUS:
> >> > >> > > +        sbtsi_update_alarm(s);
> >> > >> > > +        data = s->status;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_ALERT_CONFIG:
> >> > >> > > +        data = s->alert_config;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_MAN:
> >> > >> > > +        data = SBTSI_MAN_DEFAULT;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_REV:
> >> > >> > > +        data = SBTSI_REV_DEFAULT;
> >> > >> > > +        break;
> >> > >>
> >> > >> Does this device do some sort of auto-increment on the address when
> >> > >> reading/writing?
> >> > >>
> >> > >
> >> > > +Hao Wu <wuhaotsh@google.com>   - Please take a look at the above
> >> > > question.  I imagine it's a while since you've thought about it, but
> >> please
> >> > > double check :)
> >> > > Thanks!
> >> > >
> >> > >
> >> > >> Other than that possible issue, I don't see anything else, it's
> >> pretty
> >> > >> straightforward.
> >> > >>
> >> > >> > > +
> >> > >> > > +    default:
> >> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> >> > >> > > +                "%s: reading from invalid reg: 0x%02x\n",
> >> > >> > > +                __func__, s->addr);
> >> > >> > > +        break;
> >> > >> > > +    }
> >> > >> > > +
> >> > >> > > +    trace_tmp_sbtsi_read_data(s->addr, data);
> >> > >> > > +    return data;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_write(SBTSIState *s, uint8_t data)
> >> > >> > > +{
> >> > >> > > +    trace_tmp_sbtsi_write_data(s->addr, data);
> >> > >> > > +    switch (s->addr) {
> >> > >> > > +    case SBTSI_REG_CONFIG_WR:
> >> > >> > > +        s->config = data;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_HIGH_INT:
> >> > >> > > +        s->limit_high = compute_temp_int(s->limit_high, data);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_LOW_INT:
> >> > >> > > +        s->limit_low = compute_temp_int(s->limit_low, data);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_HIGH_DEC:
> >> > >> > > +        s->limit_high = compute_temp_dec(s->limit_high, data);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_LOW_DEC:
> >> > >> > > +        s->limit_low = compute_temp_dec(s->limit_low, data);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_ALERT_CONFIG:
> >> > >> > > +        s->alert_config = data;
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    case SBTSI_REG_TEMP_INT:
> >> > >> > > +    case SBTSI_REG_TEMP_DEC:
> >> > >> > > +    case SBTSI_REG_CONFIG:
> >> > >> > > +    case SBTSI_REG_STATUS:
> >> > >> > > +    case SBTSI_REG_MAN:
> >> > >> > > +    case SBTSI_REG_REV:
> >> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> >> > >> > > +                "%s: writing to read only reg: 0x%02x data:
> >> > >> 0x%02x\n",
> >> > >> > > +                __func__, s->addr, data);
> >> > >> > > +        break;
> >> > >> > > +
> >> > >> > > +    default:
> >> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR,
> >> > >> > > +                "%s: writing to invalid reg: 0x%02x data:
> >> 0x%02x\n",
> >> > >> > > +                __func__, s->addr, data);
> >> > >> > > +        break;
> >> > >> > > +    }
> >> > >> > > +    sbtsi_update_alarm(s);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static int sbtsi_write_data(SMBusDevice *d, uint8_t *buf,
> >> uint8_t
> >> > >> len)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(d);
> >> > >> > > +
> >> > >> > > +    if (len == 0) {
> >> > >> > > +        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty
> >> data\n",
> >> > >> > > __func__);
> >> > >> > > +        return -1;
> >> > >> > > +    }
> >> > >> > > +
> >> > >> > > +    s->addr = buf[0];
> >> > >> > > +    if (len > 1) {
> >> > >> > > +        sbtsi_write(s, buf[1]);
> >> > >> > > +        if (len > 2) {
> >> > >> > > +            qemu_log_mask(LOG_GUEST_ERROR, "%s: extra data at
> >> end\n",
> >> > >> > > __func__);
> >> > >> > > +        }
> >> > >> > > +    }
> >> > >> > > +    return 0;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/* Units are millidegrees. */
> >> > >> > > +static void sbtsi_get_temperature(Object *obj, Visitor *v,
> >> const char
> >> > >> > > *name,
> >> > >> > > +                                  void *opaque, Error **errp)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(obj);
> >> > >> > > +    uint32_t temp = s->temperature *
> >> SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> >> > >> > > +
> >> > >> > > +    visit_type_uint32(v, name, &temp, errp);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/* Units are millidegrees. */
> >> > >> > > +static void sbtsi_set_temperature(Object *obj, Visitor *v,
> >> const char
> >> > >> > > *name,
> >> > >> > > +                                  void *opaque, Error **errp)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(obj);
> >> > >> > > +    uint32_t temp;
> >> > >> > > +
> >> > >> > > +    if (!visit_type_uint32(v, name, &temp, errp)) {
> >> > >> > > +        return;
> >> > >> > > +    }
> >> > >> > > +    if (temp > SBTSI_TEMP_MAX) {
> >> > >> > > +        error_setg(errp, "value %" PRIu32 ".%03" PRIu32 " C is
> >> out of
> >> > >> > > range",
> >> > >> > > +                   temp / 1000, temp % 1000);
> >> > >> > > +        return;
> >> > >> > > +    }
> >> > >> > > +
> >> > >> > > +    s->temperature = temp / SBTSI_TEMP_UNIT_IN_MILLIDEGREE;
> >> > >> > > +    sbtsi_update_alarm(s);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static int sbtsi_post_load(void *opaque, int version_id)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = opaque;
> >> > >> > > +
> >> > >> > > +    sbtsi_update_alarm(s);
> >> > >> > > +    return 0;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static const VMStateDescription vmstate_sbtsi = {
> >> > >> > > +    .name = "SBTSI",
> >> > >> > > +    .version_id = 0,
> >> > >> > > +    .minimum_version_id = 0,
> >> > >> > > +    .post_load = sbtsi_post_load,
> >> > >> > > +    .fields = (VMStateField[]) {
> >> > >> > > +        VMSTATE_UINT32(temperature, SBTSIState),
> >> > >> > > +        VMSTATE_UINT32(limit_low, SBTSIState),
> >> > >> > > +        VMSTATE_UINT32(limit_high, SBTSIState),
> >> > >> > > +        VMSTATE_UINT8(config, SBTSIState),
> >> > >> > > +        VMSTATE_UINT8(status, SBTSIState),
> >> > >> > > +        VMSTATE_UINT8(addr, SBTSIState),
> >> > >> > > +        VMSTATE_END_OF_LIST()
> >> > >> > > +    }
> >> > >> > > +};
> >> > >> > > +
> >> > >> > > +static void sbtsi_enter_reset(Object *obj, ResetType type)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(obj);
> >> > >> > > +
> >> > >> > > +    s->config = 0;
> >> > >> > > +    s->limit_low = SBTSI_LIMIT_LOW_DEFAULT;
> >> > >> > > +    s->limit_high = SBTSI_LIMIT_HIGH_DEFAULT;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_hold_reset(Object *obj)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(obj);
> >> > >> > > +
> >> > >> > > +    qemu_irq_lower(s->alarm);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_init(Object *obj)
> >> > >> > > +{
> >> > >> > > +    SBTSIState *s = SBTSI(obj);
> >> > >> > > +
> >> > >> > > +    /* Current temperature in millidegrees. */
> >> > >> > > +    object_property_add(obj, "temperature", "uint32",
> >> > >> > > +                        sbtsi_get_temperature,
> >> sbtsi_set_temperature,
> >> > >> > > +                        NULL, NULL);
> >> > >> > > +    qdev_init_gpio_out_named(DEVICE(obj), &s->alarm,
> >> SBTSI_ALARM_L,
> >> > >> 0);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_class_init(ObjectClass *klass, void *data)
> >> > >> > > +{
> >> > >> > > +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> >> > >> > > +    DeviceClass *dc = DEVICE_CLASS(klass);
> >> > >> > > +    SMBusDeviceClass *k = SMBUS_DEVICE_CLASS(klass);
> >> > >> > > +
> >> > >> > > +    dc->desc = "SB-TSI Temperature Sensor";
> >> > >> > > +    dc->vmsd = &vmstate_sbtsi;
> >> > >> > > +    k->write_data = sbtsi_write_data;
> >> > >> > > +    k->receive_byte = sbtsi_read_byte;
> >> > >> > > +    rc->phases.enter = sbtsi_enter_reset;
> >> > >> > > +    rc->phases.hold = sbtsi_hold_reset;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static const TypeInfo sbtsi_info = {
> >> > >> > > +    .name          = TYPE_SBTSI,
> >> > >> > > +    .parent        = TYPE_SMBUS_DEVICE,
> >> > >> > > +    .instance_size = sizeof(SBTSIState),
> >> > >> > > +    .instance_init = sbtsi_init,
> >> > >> > > +    .class_init    = sbtsi_class_init,
> >> > >> > > +};
> >> > >> > > +
> >> > >> > > +static void sbtsi_register_types(void)
> >> > >> > > +{
> >> > >> > > +    type_register_static(&sbtsi_info);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +type_init(sbtsi_register_types)
> >> > >> > > diff --git a/hw/sensor/trace-events b/hw/sensor/trace-events
> >> > >> > > new file mode 100644
> >> > >> > > index 0000000000..21ab3809e2
> >> > >> > > --- /dev/null
> >> > >> > > +++ b/hw/sensor/trace-events
> >> > >> > > @@ -0,0 +1,5 @@
> >> > >> > > +# See docs/devel/tracing.rst for syntax documentation.
> >> > >> > > +
> >> > >> > > +# tmp_sbtsi.c
> >> > >> > > +tmp_sbtsi_write_data(uint8_t addr, uint8_t value) "SBTSI write
> >> > >> > > addr:0x%02x data: 0x%02x"
> >> > >> > > +tmp_sbtsi_read_data(uint8_t addr, uint8_t value) "SBTSI read
> >> > >> addr:0x%02x
> >> > >> > > data: 0x%02x"
> >> > >> > > diff --git a/hw/sensor/trace.h b/hw/sensor/trace.h
> >> > >> > > new file mode 100644
> >> > >> > > index 0000000000..e4721560b0
> >> > >> > > --- /dev/null
> >> > >> > > +++ b/hw/sensor/trace.h
> >> > >> > > @@ -0,0 +1 @@
> >> > >> > > +#include "trace/trace-hw_sensor.h"
> >> > >> > > diff --git a/meson.build b/meson.build
> >> > >> > > index 53065e96ec..f8ab0bf74e 100644
> >> > >> > > --- a/meson.build
> >> > >> > > +++ b/meson.build
> >> > >> > > @@ -2494,6 +2494,7 @@ if have_system
> >> > >> > >      'hw/rtc',
> >> > >> > >      'hw/s390x',
> >> > >> > >      'hw/scsi',
> >> > >> > > +    'hw/sensor',
> >> > >> > >      'hw/sd',
> >> > >> > >      'hw/sh4',
> >> > >> > >      'hw/sparc',
> >> > >> > > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> >> > >> > > index 37e1eaa449..d1a8c38f74 100644
> >> > >> > > --- a/tests/qtest/meson.build
> >> > >> > > +++ b/tests/qtest/meson.build
> >> > >> > > @@ -254,6 +254,7 @@ qos_test_ss.add(
> >> > >> > >    'spapr-phb-test.c',
> >> > >> > >    'tmp105-test.c',
> >> > >> > >    'emc141x-test.c',
> >> > >> > > +  'tmp_sbtsi-test.c',
> >> > >> > >    'usb-hcd-ohci-test.c',
> >> > >> > >    'virtio-test.c',
> >> > >> > >    'virtio-blk-test.c',
> >> > >> > > diff --git a/tests/qtest/tmp_sbtsi-test.c
> >> > >> b/tests/qtest/tmp_sbtsi-test.c
> >> > >> > > new file mode 100644
> >> > >> > > index 0000000000..7f5fafacc7
> >> > >> > > --- /dev/null
> >> > >> > > +++ b/tests/qtest/tmp_sbtsi-test.c
> >> > >> > > @@ -0,0 +1,180 @@
> >> > >> > > +/*
> >> > >> > > + * QTests for the SBTSI temperature sensor
> >> > >> > > + *
> >> > >> > > + * Copyright 2020 Google LLC
> >> > >> > > + *
> >> > >> > > + * This program is free software; you can redistribute it and/or
> >> > >> modify it
> >> > >> > > + * under the terms of the GNU General Public License as
> >> published by
> >> > >> the
> >> > >> > > + * Free Software Foundation; either version 2 of the License, or
> >> > >> > > + * (at your option) any later version.
> >> > >> > > + *
> >> > >> > > + * This program is distributed in the hope that it will be
> >> useful,
> >> > >> but
> >> > >> > > WITHOUT
> >> > >> > > + * ANY WARRANTY; without even the implied warranty of
> >> > >> MERCHANTABILITY or
> >> > >> > > + * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
> >> > >> License
> >> > >> > > + * for more details.
> >> > >> > > + */
> >> > >> > > +
> >> > >> > > +#include "qemu/osdep.h"
> >> > >> > > +
> >> > >> > > +#include "libqtest-single.h"
> >> > >> > > +#include "libqos/qgraph.h"
> >> > >> > > +#include "libqos/i2c.h"
> >> > >> > > +#include "qapi/qmp/qdict.h"
> >> > >> > > +#include "qemu/bitops.h"
> >> > >> > > +
> >> > >> > > +#define TEST_ID   "sbtsi-test"
> >> > >> > > +#define TEST_ADDR (0x4c)
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * SB-TSI registers only support SMBus byte data access. "_INT"
> >> > >> registers
> >> > >> > > are
> >> > >> > > + * the integer part of a temperature value or limit, and "_DEC"
> >> > >> registers
> >> > >> > > are
> >> > >> > > + * corresponding decimal parts.
> >> > >> > > + */
> >> > >> > > +#define REG_TEMP_INT      0x01 /* RO */
> >> > >> > > +#define REG_STATUS        0x02 /* RO */
> >> > >> > > +#define REG_CONFIG        0x03 /* RO */
> >> > >> > > +#define REG_TEMP_HIGH_INT 0x07 /* RW */
> >> > >> > > +#define REG_TEMP_LOW_INT  0x08 /* RW */
> >> > >> > > +#define REG_CONFIG_WR     0x09 /* RW */
> >> > >> > > +#define REG_TEMP_DEC      0x10 /* RO */
> >> > >> > > +#define REG_TEMP_HIGH_DEC 0x13 /* RW */
> >> > >> > > +#define REG_TEMP_LOW_DEC  0x14 /* RW */
> >> > >> > > +#define REG_ALERT_CONFIG  0xBF /* RW */
> >> > >> > > +
> >> > >> > > +#define STATUS_HIGH_ALERT BIT(4)
> >> > >> > > +#define STATUS_LOW_ALERT  BIT(3)
> >> > >> > > +#define CONFIG_ALERT_MASK BIT(7)
> >> > >> > > +#define ALARM_EN          BIT(0)
> >> > >> > > +
> >> > >> > > +/* The temperature stored are in units of 0.125 degrees. */
> >> > >> > > +#define TEMP_UNIT_IN_MILLIDEGREE 125
> >> > >> > > +#define LIMIT_LOW (10500)
> >> > >> > > +#define LIMIT_HIGH (55125)
> >> > >> > > +
> >> > >> > > +static uint32_t qmp_sbtsi_get_temperature(const char *id)
> >> > >> > > +{
> >> > >> > > +    QDict *response;
> >> > >> > > +    int ret;
> >> > >> > > +
> >> > >> > > +    response = qmp("{ 'execute': 'qom-get', 'arguments': {
> >> 'path':
> >> > >> %s, "
> >> > >> > > +                   "'property': 'temperature' } }", id);
> >> > >> > > +    g_assert(qdict_haskey(response, "return"));
> >> > >> > > +    ret = (uint32_t)qdict_get_int(response, "return");
> >> > >> > > +    qobject_unref(response);
> >> > >> > > +    return ret;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void qmp_sbtsi_set_temperature(const char *id, uint32_t
> >> value)
> >> > >> > > +{
> >> > >> > > +    QDict *response;
> >> > >> > > +
> >> > >> > > +    response = qmp("{ 'execute': 'qom-set', 'arguments': {
> >> 'path':
> >> > >> %s, "
> >> > >> > > +                   "'property': 'temperature', 'value': %d }
> >> }", id,
> >> > >> > > value);
> >> > >> > > +    g_assert(qdict_haskey(response, "return"));
> >> > >> > > +    qobject_unref(response);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * Compute the temperature using the integer and decimal part
> >> and
> >> > >> return
> >> > >> > > + * millidegrees. The decimal part are only the top 3 bits so we
> >> > >> shift it
> >> > >> > > by
> >> > >> > > + * 5 here.
> >> > >> > > + */
> >> > >> > > +static uint32_t regs_to_temp(uint8_t integer, uint8_t decimal)
> >> > >> > > +{
> >> > >> > > +    return ((integer << 3) + (decimal >> 5)) *
> >> > >> TEMP_UNIT_IN_MILLIDEGREE;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +/*
> >> > >> > > + * Compute the integer and decimal parts of the temperature in
> >> > >> > > millidegrees.
> >> > >> > > + * H/W store the decimal in the top 3 bits so we shift it by 5.
> >> > >> > > + */
> >> > >> > > +static void temp_to_regs(uint32_t temp, uint8_t *integer,
> >> uint8_t
> >> > >> > > *decimal)
> >> > >> > > +{
> >> > >> > > +    temp /= TEMP_UNIT_IN_MILLIDEGREE;
> >> > >> > > +    *integer = temp >> 3;
> >> > >> > > +    *decimal = (temp & 0x7) << 5;
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void tx_rx(void *obj, void *data, QGuestAllocator *alloc)
> >> > >> > > +{
> >> > >> > > +    uint16_t value;
> >> > >> > > +    uint8_t integer, decimal;
> >> > >> > > +    QI2CDevice *i2cdev = (QI2CDevice *)obj;
> >> > >> > > +
> >> > >> > > +    /* Test default values */
> >> > >> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
> >> > >> > > +    g_assert_cmpuint(value, ==, 0);
> >> > >> > > +
> >> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
> >> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
> >> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 0);
> >> > >> > > +
> >> > >> > > +    /* Test setting temperature */
> >> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, 20000);
> >> > >> > > +    value = qmp_sbtsi_get_temperature(TEST_ID);
> >> > >> > > +    g_assert_cmpuint(value, ==, 20000);
> >> > >> > > +
> >> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_INT);
> >> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_DEC);
> >> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==, 20000);
> >> > >> > > +
> >> > >> > > +    /* Set alert mask in config */
> >> > >> > > +    i2c_set8(i2cdev, REG_CONFIG_WR, CONFIG_ALERT_MASK);
> >> > >> > > +    value = i2c_get8(i2cdev, REG_CONFIG);
> >> > >> > > +    g_assert_cmphex(value, ==, CONFIG_ALERT_MASK);
> >> > >> > > +    /* Enable alarm_en */
> >> > >> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, ALARM_EN);
> >> > >> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
> >> > >> > > +    g_assert_cmphex(value, ==, ALARM_EN);
> >> > >> > > +
> >> > >> > > +    /* Test setting limits */
> >> > >> > > +    /* Limit low = 10.500 */
> >> > >> > > +    temp_to_regs(LIMIT_LOW, &integer, &decimal);
> >> > >> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_INT, integer);
> >> > >> > > +    i2c_set8(i2cdev, REG_TEMP_LOW_DEC, decimal);
> >> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_LOW_INT);
> >> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_LOW_DEC);
> >> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==,
> >> LIMIT_LOW);
> >> > >> > > +    /* Limit high = 55.125 */
> >> > >> > > +    temp_to_regs(LIMIT_HIGH, &integer, &decimal);
> >> > >> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_INT, integer);
> >> > >> > > +    i2c_set8(i2cdev, REG_TEMP_HIGH_DEC, decimal);
> >> > >> > > +    integer = i2c_get8(i2cdev, REG_TEMP_HIGH_INT);
> >> > >> > > +    decimal = i2c_get8(i2cdev, REG_TEMP_HIGH_DEC);
> >> > >> > > +    g_assert_cmpuint(regs_to_temp(integer, decimal), ==,
> >> LIMIT_HIGH);
> >> > >> > > +    /* No alert is generated. */
> >> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
> >> > >> > > +    g_assert_cmphex(value, ==, 0);
> >> > >> > > +
> >> > >> > > +    /* Test alert for low temperature */
> >> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_LOW);
> >> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
> >> > >> > > +    g_assert_cmphex(value, ==, STATUS_LOW_ALERT);
> >> > >> > > +
> >> > >> > > +    /* Test alert for high temperature */
> >> > >> > > +    qmp_sbtsi_set_temperature(TEST_ID, LIMIT_HIGH);
> >> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
> >> > >> > > +    g_assert_cmphex(value, ==, STATUS_HIGH_ALERT);
> >> > >> > > +
> >> > >> > > +    /* Disable alarm_en */
> >> > >> > > +    i2c_set8(i2cdev, REG_ALERT_CONFIG, 0);
> >> > >> > > +    value = i2c_get8(i2cdev, REG_ALERT_CONFIG);
> >> > >> > > +    g_assert_cmphex(value, ==, 0);
> >> > >> > > +    /* No alert when alarm_en is false. */
> >> > >> > > +    value = i2c_get8(i2cdev, REG_STATUS);
> >> > >> > > +    g_assert_cmphex(value, ==, 0);
> >> > >> > > +}
> >> > >> > > +
> >> > >> > > +static void sbtsi_register_nodes(void)
> >> > >> > > +{
> >> > >> > > +    QOSGraphEdgeOptions opts = {
> >> > >> > > +        .extra_device_opts = "id=" TEST_ID ",address=0x4c"
> >> > >> > > +    };
> >> > >> > > +    add_qi2c_address(&opts, &(QI2CAddress) { TEST_ADDR });
> >> > >> > > +
> >> > >> > > +    qos_node_create_driver("sbtsi", i2c_device_create);
> >> > >> > > +    qos_node_consumes("sbtsi", "i2c-bus", &opts);
> >> > >> > > +
> >> > >> > > +    qos_add_test("tx-rx", "sbtsi", tx_rx, NULL);
> >> > >> > > +}
> >> > >> > > +libqos_init(sbtsi_register_nodes);
> >> > >> > > --
> >> > >> >
> >> > >> >
> >> > >> > + Corey for i2c maintainer.  The new sensor directory is mostly if
> >> not
> >> > >> > entirely i2c devices.  I didn't create a maintainer entry for this
> >> i2c
> >> > >> > device, but I can if desired and send out a v2.
> >> > >>
> >> > >> Yeah, I guess I should be maintainer there.  I'll queue up a change
> >> for
> >> > >> that.  Thanks.
> >> > >>
> >> > >> -corey
> >> > >>
> >> > >> >
> >> > >> >
> >> > >> > > 2.34.1.575.g55b058a8bb-goog
> >> > >> > >
> >> > >> > >
> >> > >>
> >> > >
> >>
> >

