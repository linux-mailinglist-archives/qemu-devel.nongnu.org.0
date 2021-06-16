Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA463AA45E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:31:25 +0200 (CEST)
Received: from localhost ([::1]:48814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltbG0-0007N7-AO
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltbDk-0005oO-IY
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:29:04 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:46728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cminyard@mvista.com>)
 id 1ltbDh-0001Lc-Gu
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:29:03 -0400
Received: by mail-oi1-x233.google.com with SMTP id c13so3646735oib.13
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mvista-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=FCBYsswJDTcntYmgYIvvIu8QxEyHtHxZfSvcQUP0s8U=;
 b=hGliG2jrHcimXHHGfzQR7u9c2Y8C/KF5L8hOEX4hvs69oBit0AO+/Z21ur4gaDQs9J
 shqTlWW82C9ZsvVQAOHT5WNTZV0QSxgJ/g8rCHgSLWVyxYwp7d1JHBcID1O7JVLfgveJ
 FqQv8GOV5G9GECXIbzkEq3Dl1MvLIhrl1RSmxHJTU8z1+MSEGQhofBzeY/wlx0oYcJNn
 IkLAMjS3wjHFO8lHhh7s0FHGXl1NCLLx4riFky+/SpOduM8jA1vS7ib1TPjivfqYS0MW
 41hXXJJIMkrkDukIbyvomdKVu22NuSZRKhsanrDHKgTgBHYb4bkV6/I5LhATMZHoxz63
 1dVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=FCBYsswJDTcntYmgYIvvIu8QxEyHtHxZfSvcQUP0s8U=;
 b=YzXFvwMfGEYZ18cHUdODqyf3J7FJ/hbssatIp9wv1a1szLUo26RuJanNcukmLnzTOM
 PtgahU2aDbZQqOO2vYeao8EWcZTtdBzGcgS3ZrHzwttk9rgormRpRQWmzhcbyy7JmqCX
 fmpZ+0A+woSkryoMPRKNiajeWA7+ZcIqMLaE2g/ybn6j+rDaBKSU02Ebc4ZJ0Rae4Exo
 OFPj7ZHwis9tjA9FE8zHn9OEopq0dP41GNgXRAPiKLyfSdW+5yLrR2uso+XQrg4Qhaqm
 4RT+ITjiM1zYwXFlXyj+I0D5pZyE3CW4GUTC6Tg+2mTzjCW5Qvd7U9UxQ//oz71Sqni2
 dqPw==
X-Gm-Message-State: AOAM5316UrNmh/KRpIHTVcEAZNxqjb+F95ljWS+8PQ+u9iDVG9RJRAOj
 tVkgOfT8Ba4Lltd42ZpXipTPog==
X-Google-Smtp-Source: ABdhPJysY3KoMSG1deGB7ECXzI9Cm5Z2DOkUWUMWliGIifYdGCm5Zes63wCAhCuvivD0CGTme0C1Zw==
X-Received: by 2002:a05:6808:1148:: with SMTP id
 u8mr733841oiu.125.1623871739871; 
 Wed, 16 Jun 2021 12:28:59 -0700 (PDT)
Received: from minyard.net ([2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by smtp.gmail.com with ESMTPSA id u1sm496917otg.17.2021.06.16.12.28.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 12:28:59 -0700 (PDT)
Date: Wed, 16 Jun 2021 14:28:58 -0500
From: Corey Minyard <cminyard@mvista.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 00/13] hw/i2c: Remove confusing i2c_send_recv() API
Message-ID: <20210616192858.GG11196@minyard.net>
References: <20210616161418.2514095-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210616161418.2514095-1-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=cminyard@mvista.com; helo=mail-oi1-x233.google.com
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
Cc: "Signed-off-by : Frederic Konrad" <frederic.konrad@adacore.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 06:14:05PM +0200, Philippe Mathieu-Daudé wrote:
> This is a respin of Zoltan's patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
> 
> Since v2, tried to address Corey's review comments resulting
> in a i2c_send_recv() removal and code easier to review (to my
> taste at least).

Yes, this is much better.  I had a few minor comments, and Richard did,
too, but with those fixed this is a big improvement over the existing
code.

I can give you an:

Acked-by: Corey Minyard <cminyard@mvista.com>

for all of these, or I can take them into my tree.  I'm fine either way.

-corey

> 
> Supersedes: <20200623063123.20776-1-f4bug@amsat.org>
> 
> BALATON Zoltan (1):
>   hw/i2c: Make i2c_start_transfer() direction argument a boolean
> 
> Philippe Mathieu-Daudé (12):
>   hw/input/lm832x: Move lm832x_key_event() declaration to "lm832x.h"
>   hw/input/lm832x: Define TYPE_LM8323 in public header
>   hw/display/sm501: Simplify sm501_i2c_write() logic
>   hw/display/sm501: Replace i2c_send_recv() by i2c_recv() & i2c_send()
>   hw/i2c/ppc4xx_i2c: Add reference to datasheet
>   hw/i2c/ppc4xx_i2c: Replace i2c_send_recv() by i2c_recv() & i2c_send()
>   hw/misc/auxbus: Fix MOT/classic I2C mode
>   hw/misc/auxbus: Explode READ_I2C / WRITE_I2C_MOT cases
>   hw/misc/auxbus: Replace 'is_write' boolean by its value
>   hw/misc/auxbus: Replace i2c_send_recv() by i2c_recv() & i2c_send()
>   hw/i2c: Remove confusing i2c_send_recv()
>   hw/i2c: Rename i2c_set_slave_address() -> i2c_slave_set_address()
> 
>  include/hw/i2c/i2c.h      | 21 +++++++++---
>  include/hw/input/lm832x.h | 28 ++++++++++++++++
>  hw/arm/nseries.c          |  3 +-
>  hw/arm/pxa2xx.c           |  2 +-
>  hw/arm/spitz.c            |  4 +--
>  hw/display/ati.c          |  2 +-
>  hw/display/sm501.c        | 16 +++++----
>  hw/display/xlnx_dp.c      |  2 +-
>  hw/i2c/core.c             | 56 ++++++++++++++-----------------
>  hw/i2c/imx_i2c.c          |  2 +-
>  hw/i2c/ppc4xx_i2c.c       | 15 ++++++---
>  hw/input/lm832x.c         |  2 +-
>  hw/misc/auxbus.c          | 69 +++++++++++++++++++++++++++++----------
>  MAINTAINERS               |  1 +
>  14 files changed, 149 insertions(+), 74 deletions(-)
>  create mode 100644 include/hw/input/lm832x.h
> 
> -- 
> 2.31.1
> 

