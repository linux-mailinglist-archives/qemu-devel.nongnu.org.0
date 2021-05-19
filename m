Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C645389827
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 22:42:37 +0200 (CEST)
Received: from localhost ([::1]:48230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljT1Y-0008Cy-4c
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 16:42:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ljT08-0006bL-RY
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:41:09 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336]:39602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ljT04-0005op-Kx
 for qemu-devel@nongnu.org; Wed, 19 May 2021 16:41:07 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 d25-20020a0568300459b02902f886f7dd43so12946348otc.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 13:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=NX8L2mgZZFtB20GajHqNmwUBgiQ+JBs1sStzbhoL4wc=;
 b=ouUojgvLQqS51R+2vdR6Q8Qn5OwNeisnpun7yLvqvgHI64wiJ4p+gqfGUEzdfDZPu6
 TiRQETjxc0jKUhSLtXV4zURBO2xKeGnBW403lAXi8h0oUqljqeMy7gB3XDa5wamXYE70
 FQcdahR7tnl1tmYiQA7/6gUlTgVPKpYjNvvDnMoFBQ7ST0ARp5n2vJ0RWxBeZNhV3IH6
 DEUwzssYHlxlpssg33Hbq88WG656ry54Mw9HyYVzt5oN+wjRICCgSTsyaGP3C2Fw+8ql
 0Im77TD6SxgFpuN4tZZ2hUsPRO4tHEBd5APZA43Ywf8wuV5UNsSx/1jKqoaAeAJ1fZqZ
 wQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=NX8L2mgZZFtB20GajHqNmwUBgiQ+JBs1sStzbhoL4wc=;
 b=iE8jfK7z8w5hFBlwmDEKbjbBmmeTx1eLTQG03qD8Yt/6SudJqrLutDASQD1fyWr4C7
 RFf3eAePjOgHYRxwq/4wIiLddlM5KDh2r24TbHybCLU8qfotTVPXQC3cDGA3y0We9d47
 T9H77/LOo6sB60FWpwmGPIcjImkxOxb+nuj0hi23Cbx+BQWkTP+vUo3ENfLfl4Y/IXmU
 qdxR5C+XYr6dxaUvrWMdecoP2lVckihWlVO+kb3CX0oGZJnehxFP8zwRwXabwOvksIU4
 inchX/VBlx8nYEnvaUBPSor8yi3h/QLLwIgx6nANAogux+pthxyTCzTzWFM1yzC8g4xU
 nHiA==
X-Gm-Message-State: AOAM5332uoe6RTbdYGR9bVRmvJQtBlXB39r1WnN06x6DV1HEw4/RVbOS
 nWpFI9RuGLSamiB9XYqcfKxQrA==
X-Google-Smtp-Source: ABdhPJwyhzkd2mlDHEsb5aVNNJFhw/zgctX3HiODY0+ErQuEzZcDt6mrk5BNBZajZ1lxYqhKoYhs/w==
X-Received: by 2002:a05:6830:410d:: with SMTP id
 w13mr1085382ott.173.1621456862457; 
 Wed, 19 May 2021 13:41:02 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ecd2:e60e:d7a6:d643])
 by smtp.gmail.com with ESMTPSA id f3sm105569ooj.1.2021.05.19.13.41.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 13:41:01 -0700 (PDT)
Date: Wed, 19 May 2021 15:41:00 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Titus Rwantare <titusr@google.com>
Subject: Re: [PATCH v4 0/5] Add support for PMBus in QEMU
Message-ID: <20210519204100.GB11196@minyard.net>
References: <20210519165002.1195745-1-titusr@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210519165002.1195745-1-titusr@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=cminyard@mvista.com; helo=mail-ot1-x336.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Reply-To: cminyard@mvista.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 19, 2021 at 09:49:57AM -0700, Titus Rwantare wrote:
> Hello,
> 
> This patch series adds an interface to start supporting PMBus devices in QEMU.
> I’ve included two PMBus devices: MAX34451 and ADM1272.
> 

Ok, I've added this to my next tree.  I moved the files to the sensor
directory, too.

-corey

> PMBus is a variant of SMBus meant for digital management of power supplies.
> PMBus adds to the SMBus standard by defining a number of constants and commands
> used by compliant devices. The specification for PMBus can be found at:
> 
> https://pmbus.org/specification-archives/
> 
> Currently, the goal for these devices is to emulate basic functionality by
> reading and writing registers. Timing, and some logical operation is not
> implemented. This implementation supports nearly all available registers for
> PMBus including:
>    - Voltage inputs and outputs
>    - Current inputs and outputs
>    - Temperature sensors
> 
> Unimplimented registers get passed through to the device model, and device
> models can opt out of using the standard registers with flags. The included
> devices make use of these fields and illustrate how to interface with the pmbus
> class.
> 
> Datasheets for sensors:
> 
> https://datasheets.maximintegrated.com/en/ds/MAX34451.pdf
> https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
> 
> Since v3:
> - added VMState descriptions. Adding PMBusPage info to the vmsd has proven to be tricky, it's a TODO for now.
> 
> Since v2:
> - bump for feedback
> - removed commented out code
> 
> Since v1:
> - addressed Joel's comments
> - split out tests into their own patches
> 
> Thanks for reviewing,
> 
> Titus Rwantare
> 
> Titus Rwantare (5):
>   hw/i2c: add support for PMBus
>   hw/misc: add ADM1272 device
>   tests/qtest: add tests for ADM1272 device model
>   hw/misc: add MAX34451 device
>   tests/qtest: add tests for MAX34451 device model
> 
>  include/hw/i2c/pmbus_device.h |  517 +++++++++++
>  hw/i2c/pmbus_device.c         | 1612 +++++++++++++++++++++++++++++++++
>  hw/misc/adm1272.c             |  544 +++++++++++
>  hw/misc/max34451.c            |  775 ++++++++++++++++
>  tests/qtest/adm1272-test.c    |  445 +++++++++
>  tests/qtest/max34451-test.c   |  336 +++++++
>  hw/arm/Kconfig                |    3 +
>  hw/i2c/Kconfig                |    4 +
>  hw/i2c/meson.build            |    1 +
>  hw/misc/Kconfig               |    8 +
>  hw/misc/meson.build           |    2 +
>  tests/qtest/meson.build       |    2 +
>  12 files changed, 4249 insertions(+)
>  create mode 100644 include/hw/i2c/pmbus_device.h
>  create mode 100644 hw/i2c/pmbus_device.c
>  create mode 100644 hw/misc/adm1272.c
>  create mode 100644 hw/misc/max34451.c
>  create mode 100644 tests/qtest/adm1272-test.c
>  create mode 100644 tests/qtest/max34451-test.c
> 
> -- 
> 2.31.1.751.gd2f1c929bd-goog
> 

