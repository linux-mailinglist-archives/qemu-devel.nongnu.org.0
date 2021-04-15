Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35503360906
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:14:41 +0200 (CEST)
Received: from localhost ([::1]:52114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX0tM-0000Iy-AY
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lX0ro-0007Tk-T4; Thu, 15 Apr 2021 08:13:04 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1lX0rn-0006pV-10; Thu, 15 Apr 2021 08:13:04 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso17606759otv.6; 
 Thu, 15 Apr 2021 05:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=QvwfhIdUeY4x0QekFaIu/2Bu+Ass4F3AOwVrAAEctoI=;
 b=KsZqkozIZUcA95BLUfs/23Mky9b3WY0pgEKF9dGCrA2MoR0Dbtxz2BoH7rZvrDPb65
 61SHd2UkCN/fW5oM9cnH7zlYRiwnJOGreCXTpyBKAnway0HbpxM+I4+uIZkf436+qoQY
 KV0vbaHdeLpDKhxQpu9OcZ/y2Wm+c8nkqMAVa0+D10b/cwrL/ZeX+fIBSivMO2OxYUVd
 bAPZhEsWftm7REHF/XDgZ2xzCA4KFouqAEhBBoxF+1kFkTGaIMHElYsu+5inAboy0r7L
 GrLLbuZqJSlGQH5dUGmM/V9ZTxCUZoFxdfTC86hu1gwTaKi1ZHVdwA827NMXqwpnTgJu
 SWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=QvwfhIdUeY4x0QekFaIu/2Bu+Ass4F3AOwVrAAEctoI=;
 b=LfbBjyQzBDtDVH9wPESlMzx78TlEXsOOSutyGZ+eaWLfJiDrtHo9pxB9FZzAZtQmFd
 5Sdzg90832wNr8el5jY0UhXRJbpVpBkCd2QCOlyrTpiE3zmWyf5tQVgc7Grn1GFL9A1U
 xBXWSLqbjKRQx+zlAPy2bk5ZwkUw77iEGQmYyUpWNlQhuMjOHmDXmA9yvyugRlVKZs3p
 U23OrlGl88EcsBgUL/nkyOYpbl1c/JkdFSXeSFhBen0tZtffqrE2KE/lyJtUlIbXkzMR
 E4Aw4bnL/n377AwtDnOadM1qvoT4Kg4aR9lkZyohnhTlM3zSeDKnKLBJ9pnkKXAvNAq+
 9xBA==
X-Gm-Message-State: AOAM5335GZZCvWaN8JzobUcwKPzcNxXM/bz2HgHfxV29dEZHA1mUI8ZW
 tQO/6aAIa6XEpGu8d2vInw==
X-Google-Smtp-Source: ABdhPJx3+inMNVtf+hGqmmGcTPrXHZh/VMWytzQ5llgFLN26G3Ll8IFzRZWOnAHryPMPr5M67rKyvw==
X-Received: by 2002:a9d:63d5:: with SMTP id e21mr2545180otl.93.1618488780741; 
 Thu, 15 Apr 2021 05:13:00 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id z26sm519452oot.25.2021.04.15.05.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:12:59 -0700 (PDT)
Received: from minyard.net (unknown [IPv6:2001:470:b8f6:1b:5f7:923a:a6cc:a687])
 by serve.minyard.net (Postfix) with ESMTPSA id E9B64180052;
 Thu, 15 Apr 2021 12:12:58 +0000 (UTC)
Date: Thu, 15 Apr 2021 07:12:57 -0500
From: Corey Minyard <minyard@acm.org>
To: Patrick Venture <venture@google.com>
Subject: Re: [PATCH v4 0/4] hw/i2c: Adds pca954x i2c mux switch device
Message-ID: <20210415121257.GD5612@minyard.net>
References: <20210412194522.664594-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210412194522.664594-1-venture@google.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=tcminyard@gmail.com; helo=mail-ot1-x32c.google.com
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
Cc: cminyard@mvista.com, qemu-devel@nongnu.org, hskinnemoen@google.com,
 wuhaotsh@google.com, qemu-arm@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 12, 2021 at 12:45:18PM -0700, Patrick Venture wrote:
> The i2c mux device pca954x implements two devices:
>  - the pca9546 and pca9548.

This looks good, I have pulled it into my queue.  6.0 is about to be
released, I'll try to remember to request a pull after that.

Thanks,

-corey

> 
> v4:
>  - Fixed up bug where the i2c_scan_bus wasn't parameterizing the
>  current_devs list.
>  - Minor consistency changes in the i2c mux pca954x.
> 
> v3:
>  - fixup comment with missing end parenthesis.
>  - removed superfluous object cast.
> 
> v2:
>  - the core i2c bus now calls a match method on each i2c child, which
>  by default will only check for a match against itself.
>  - the pca954x device overrides the i2c device match method to search
>  the children for each of its buses that are active.
>  - the pca954x device now owns an i2c bus for each channel, allowing
>  the normal device model to attach devices to the channels.
> 
> Patrick Venture (4):
>   hw/i2c: name I2CNode list in I2CBus
>   hw/i2c: add match method for device search
>   hw/i2c: move search to i2c_scan_bus method
>   hw/i2c: add pca954x i2c-mux switch
> 
>  MAINTAINERS                      |   6 +
>  hw/i2c/Kconfig                   |   4 +
>  hw/i2c/core.c                    |  55 ++++--
>  hw/i2c/i2c_mux_pca954x.c         | 290 +++++++++++++++++++++++++++++++
>  hw/i2c/meson.build               |   1 +
>  hw/i2c/trace-events              |   5 +
>  include/hw/i2c/i2c.h             |  17 +-
>  include/hw/i2c/i2c_mux_pca954x.h |  19 ++
>  8 files changed, 383 insertions(+), 14 deletions(-)
>  create mode 100644 hw/i2c/i2c_mux_pca954x.c
>  create mode 100644 include/hw/i2c/i2c_mux_pca954x.h
> 
> -- 
> 2.31.1.295.g9ea45b61b8-goog
> 
> 

