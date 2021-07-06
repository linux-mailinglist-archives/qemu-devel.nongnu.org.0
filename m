Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 822093BDF1E
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Jul 2021 23:47:13 +0200 (CEST)
Received: from localhost ([::1]:34504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0suO-0002Qm-2r
	for lists+qemu-devel@lfdr.de; Tue, 06 Jul 2021 17:47:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m0ssu-0001kk-T3
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:45:40 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333]:34463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1m0sst-0006wO-95
 for qemu-devel@nongnu.org; Tue, 06 Jul 2021 17:45:40 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 t24-20020a9d7f980000b029046f4a1a5ec4so270578otp.1
 for <qemu-devel@nongnu.org>; Tue, 06 Jul 2021 14:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=K+KA1gqKG8uwMAZB4RM3f6iYW8Y8proFptVOd3rWI08=;
 b=YswBTNP3JtgBl51ve+uNPrl5OFa57lBq1ukxR9v7w3LfybpAyWspDjUCpAfI1a88wn
 U2LO4rHXLAHX6DUWF9tUO9Xn9Vdmliqq1v06ZHTN5lnC/aymsEPtbT0S7zhZh4Zm2vle
 RJoxF5GudchGOR+5eQEhgjXnBhoJ1sC/VPhM9FoWBem4GN8NGnC+/ZF2CddV/Liy/b+P
 wEuAMb4CbjsoIANTiPAaCZDG7srJ7ybAAcTwbumQc0uMQvO33rshIeW2gn0s9QC95jkY
 ydmzorvf4XdpUmxlSoqUEYa8K9avJJvlPM94K6Sjf4ePW0pbicThofvgdRFl/b3E9SOE
 PLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=K+KA1gqKG8uwMAZB4RM3f6iYW8Y8proFptVOd3rWI08=;
 b=M1isuBdLsoCnoOH9D4t8coWZudO2bqX/8NAW4Afqe3gZ1OVRqeZAx4LCnOX1QkpKYk
 0+oQg6G/jAMv5kseWbLR3q0HCBMdOXmUxkHXoMDw8eEetwY4PAIUsucPIsohcgYf6SNs
 uK6Szt1ZE8Dl7bwHMYJzCFVdMNwMsybzHiOyshjX+T1PNcyHBgsacNZ08bIBaVFwv+2q
 X7sr8P/7K36JTKcX0qjMTfE4v9MhaouHsLQs+ucK9fdbxGexO2UGkoy+xGuWI1fIq9ey
 PHifwaph8l6tERXbcwEipSsspzwuK1vhUSgrVrtekYMLf02RyXao+xbUvhuxeqIL4VW0
 NqeQ==
X-Gm-Message-State: AOAM530PtyxElldGJrkBVZaq6LPDE8Jr4e0rUDFWj9lJYwqv+eDogyt2
 qVdIFQaCBRcVfOPUaaNwMA==
X-Google-Smtp-Source: ABdhPJwGA8fMNseSkbvZcJFzhqCwN/dU5tK0NhbezfDid4zzzlsBYqTb9QGFUYiW97K8cYKpzvJ2sg==
X-Received: by 2002:a05:6830:18da:: with SMTP id
 v26mr16104133ote.144.1625607938163; 
 Tue, 06 Jul 2021 14:45:38 -0700 (PDT)
Received: from serve.minyard.net ([47.184.156.158])
 by smtp.gmail.com with ESMTPSA id i133sm3742746oia.2.2021.07.06.14.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 14:45:37 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:ec58:59b9:1dc0:5361])
 by serve.minyard.net (Postfix) with ESMTPSA id 7E246180110;
 Tue,  6 Jul 2021 21:45:36 +0000 (UTC)
Date: Tue, 6 Jul 2021 16:45:35 -0500
From: Corey Minyard <minyard@acm.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [GIT PULL] I2C/IPMI bug fixes for QEMU 6.1
Message-ID: <20210706214535.GU2921206@minyard.net>
References: <20210706200558.GT2921206@minyard.net>
 <CAFEAcA-dvSPpKoJ-+ATYcBs6UuLJY1ZKwx-9WYvPyJ+0MYU4ew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-dvSPpKoJ-+ATYcBs6UuLJY1ZKwx-9WYvPyJ+0MYU4ew@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
Cc: Titus Rwantare <titusr@google.com>, Hao Wu <wuhaotsh@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hmm, it compiled for me, I wonder if there are some compiler
differences, but I don't see how.

Anyway, copying the original patch source so they know.

Thanks for checking.

-corey

On Tue, Jul 06, 2021 at 10:16:36PM +0100, Peter Maydell wrote:
> On Tue, 6 Jul 2021 at 21:06, Corey Minyard <minyard@acm.org> wrote:
> >
> > The following changes since commit 38848ce565849e5b867a5e08022b3c755039c11a:
> >
> >   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20210616' into staging (2021-06-16 17:02:30 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://github.com/cminyard/qemu.git tags/for-qemu-6.1-1
> >
> > for you to fetch changes up to 7051d605e6b03259e0185dd574f760b93d15fa10:
> >
> >   ipmi/sim: fix watchdog_expired data type error in IPMIBmcSim struct (2021-06-25 08:54:57 -0500)
> >
> > ----------------------------------------------------------------
> > Some qemu updates for IPMI and I2C
> >
> > Move some ADC file to where they belong and move some sensors to a
> > sensor directory, since with new BMCs coming in lots of different
> > sensors should be coming in.  Keep from cluttering things up.
> >
> > Add support for I2C PMBus devices.
> >
> > Replace the confusing and error-prone i2c_send_recv and i2c_transfer with
> > specific send and receive functions.  Several errors have already been
> > made with these, avoid any new errors.
> >
> > Fix the watchdog_expired field in the IPMI watchdog, it's not a bool,
> > it's a u8.  After a vmstate transfer, the new value could be wrong.
> >
> 
> Hi; this fails to compile on 32-bit hosts:
> 
> ../../hw/sensor/max34451.c: In function 'max34451_init':
> /home/peter.maydell/qemu/include/qemu/bitops.h:22:38: error: left
> shift count >= width of type [-Werror=shift-count-overflow]
>  #define BIT(nr)                 (1UL << (nr))
>                                       ^
> /home/peter.maydell/qemu/include/hw/i2c/pmbus_device.h:253:36: note:
> in expansion of macro 'BIT'
>  #define PB_HAS_TEMPERATURE         BIT(40)
>                                     ^~~
> ../../hw/sensor/max34451.c:725:37: note: in expansion of macro
> 'PB_HAS_TEMPERATURE'
>          pmbus_page_config(pmdev, i, PB_HAS_TEMPERATURE | PB_HAS_VOUT_MODE);
>                                      ^~~~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> 
> You probably wanted to define PB_HAS_TEMPERATURE using BIT_ULL().
> 
> Sample gitlab CI job failure with this error:
> https://gitlab.com/qemu-project/qemu/-/jobs/1403927147
> 
> thanks
> -- PMM
> 

