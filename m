Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74513AB4BA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 15:27:40 +0200 (CEST)
Received: from localhost ([::1]:49732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lts3X-0007ee-PG
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 09:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ltrtE-0000v8-PW
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:17:01 -0400
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233]:43539)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1ltrtB-0003QG-Fe
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 09:16:59 -0400
Received: by mail-oi1-x233.google.com with SMTP id x196so6467574oif.10
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 06:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=W4ZkfnqqgvhS0STzsmNLB87GQVr7XiFKXVFWaHU3DT0=;
 b=ds9i79r7QG3vfnvxs64KoFESC74c14IUdOqo9/ujnJ0lKvfZhbMqylWUCXoATFffMB
 KOoFPb3Ej6h9DbqOYKXksnAwVwKvYRM5NO2IXeEWtIO2mvzRS03uK/SdwutQnWW6zzXO
 Qun1w8R/0VrviRxwACdQhj1YuybQCFHuquVW+pZDiM5ex1vxuny7MnAvk1X0QI2wCcSk
 RfyMSv5Jc+E3+UoQJZ+ttMJjVZpoloUq15dUlIfepAIAXHb1tsDjyl3ebbjdLav2mJh+
 TNBHT1WkJptCrd+mYz5NMb0yePXxag+evrqBW1BVs+BkFdOVqFe+7qGwSJJe/rSUt+BT
 JgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=W4ZkfnqqgvhS0STzsmNLB87GQVr7XiFKXVFWaHU3DT0=;
 b=GhbSf3xwSAwzCtMbuWwGk9hx/0GdrG5l1nuwmV1fTYGwMxCaWFJunMGVjhAY8Sbp/2
 DYe3/BMTkFaIdBtQzXYZMVM1fampB5c8IWR38nNaPdhUKkmK8Ua3Ve+B1hFHZuFB69Bb
 TnhAHC//NElQOk3eFoeKw3lsWzbZOYjJrq0Zjv4WSxWHnGaj0G/F6pBejFvkop2EO2rs
 bnDh4VloEfQsV2VZ8npflWx+r4+4GQ+ZMvpSOswwHCJ9VUUzFB2g/InUo1W16AQmKBB3
 SC5xuO1lO6uxuKgvn+45dNYJSMo8xYSG5etgkDvpucvwS+u49Ep9vqlD6ZJjfFLkZVhD
 HSsQ==
X-Gm-Message-State: AOAM530RC3h77ttN/86wyjCHay22hoc5WZVl/C1Dh3exzAQ9RW/5YjiB
 pkl9yeGJnEhqPYZL/TJrpA==
X-Google-Smtp-Source: ABdhPJzXREnwgq9z8yyzxCuNScb6oP2XYVXoXgEMvn+DL/QjKRBkeF2XNeHLNKd/T3Ped8MzHU+LoQ==
X-Received: by 2002:a54:4503:: with SMTP id l3mr1818527oil.156.1623935815027; 
 Thu, 17 Jun 2021 06:16:55 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id r2sm1248021otd.54.2021.06.17.06.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 06:16:54 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:ede8:ade8:da1:e1cc])
 by serve.minyard.net (Postfix) with ESMTPSA id 47F8C180293;
 Thu, 17 Jun 2021 13:16:53 +0000 (UTC)
Date: Thu, 17 Jun 2021 08:16:52 -0500
From: Corey Minyard <minyard@acm.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/15] hw/i2c: Remove confusing i2c_send_recv() API
Message-ID: <20210617131652.GH2921206@minyard.net>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::233;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x233.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Reply-To: minyard@acm.org
Cc: Corey Minyard <cminyard@mvista.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 01:53:19PM +0200, Philippe Mathieu-Daudé wrote:
> Full series reviewed, all comments addressed.
> 
> Corey, could you take this via your tree?

Ok.  I'll do some testing then request a pull.

-corey

> 
> Regards,
> 
> Phil.
> 
> This is a respin of Zoltan's patch:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg714711.html
> 
> Since v4:
> - removed assertion in i2c_do_start_transfer (Richard)
> - added Richard R-b tags
> 
> Since v3:
> - addressed minor review comments from Richard/Corey
> - added R-b/A-b tags
> - implemented Richard suggestion (last 2 patches, 14 & 15)
> 
> Since v2, tried to address Corey's review comments resulting
> in a i2c_send_recv() removal and code easier to review (to my
> taste at least).
> 
> BALATON Zoltan (1):
>   hw/i2c: Make i2c_start_transfer() direction argument a boolean
> 
> Philippe Mathieu-Daudé (14):
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
>   hw/i2c: Extract i2c_do_start_transfer() from i2c_start_transfer()
>   hw/i2c: Introduce i2c_start_recv() and i2c_start_send()
> 
>  include/hw/i2c/i2c.h      | 46 +++++++++++++++++++++---
>  include/hw/input/lm832x.h | 28 +++++++++++++++
>  hw/arm/nseries.c          |  3 +-
>  hw/arm/pxa2xx.c           |  2 +-
>  hw/arm/spitz.c            |  4 +--
>  hw/display/ati.c          |  2 +-
>  hw/display/sm501.c        | 16 +++++----
>  hw/display/xlnx_dp.c      |  2 +-
>  hw/i2c/core.c             | 76 ++++++++++++++++++++++-----------------
>  hw/i2c/imx_i2c.c          |  2 +-
>  hw/i2c/pm_smbus.c         |  4 +--
>  hw/i2c/ppc4xx_i2c.c       | 15 +++++---
>  hw/i2c/smbus_master.c     | 22 ++++++------
>  hw/input/lm832x.c         |  2 +-
>  hw/misc/auxbus.c          | 70 ++++++++++++++++++++++++++----------
>  MAINTAINERS               |  1 +
>  16 files changed, 207 insertions(+), 88 deletions(-)
>  create mode 100644 include/hw/input/lm832x.h
> 
> -- 
> 2.31.1
> 
> 

