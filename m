Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9593370A6E
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 08:23:56 +0200 (CEST)
Received: from localhost ([::1]:47692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ld5WF-0007Ca-8P
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 02:23:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ld5U1-0006ej-BJ
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:21:41 -0400
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233]:46911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1ld5Tz-0004MF-07
 for qemu-devel@nongnu.org; Sun, 02 May 2021 02:21:37 -0400
Received: by mail-lj1-x233.google.com with SMTP id u20so3003114lja.13
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 23:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=wK2nZcsHH7BdcNYfwv1Yd4778uloPga2eJq9SlZ5tjI=;
 b=RY3EUMnHiQPCD+FBtSd+nJE4SP0Q9LlB4S1aojs41/avsoVioaXmKJsza2aNE784Ym
 30P2Eb8+sduj9iWDwyWAums01dGR1Twmpr59FwNCToczacoA0jyR0JERR5SzeVODqkp+
 EHsRLQT/nod96TOGwP1rDwEUkcCJ6ALHq8Wx2OB+GhntJWbn3tQJdPowwz1tc0iMqbN7
 uBcnAamniwY6aboO7jb1I5IqeX7e9soFyPnnVDk5VtFvy1sTb3rSx0mRl8VuQl175X4y
 PXHavwZN31uPWw/ad8ErOxG7wzMU0LaaPgign3ic8Lh5UOXHLYnOtb2MiiHR5cG5Gr2r
 C9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wK2nZcsHH7BdcNYfwv1Yd4778uloPga2eJq9SlZ5tjI=;
 b=kFu25sZUEub/glP5lrD8N7HxBX1r30D+VkOFxnSdbzGsDmYcScbMiWVZg9ItjFd0Jw
 +Q48kDNfGriAVc4UVyTcuC6hkjaD8qzJaR5jX1M2tJutKrp7NkCkC5wUA2AL2o//v0qR
 tbDCXWmtQxq+NiN+xlGo6fMsDNwxwyekJP0UpJs/xCtBHILBm3Js8e1KL4HBQ+2UUz45
 6nOmg9s3mKAFr3sWOM7nJS+YJ72oJpraXcFnr3s7RxTUbhz5MCjcKwJm1gt+y9g8w7S1
 72YfSJD9tFeE8SvS8NfM6BjEwUz0xlKuM+1DOQl+w77GlaqbW2iLCp05Dq9ipnj642Fg
 OrlA==
X-Gm-Message-State: AOAM532i1k9jdhThda89uVx3ugYVtwHOYEUs0Jw2SbZYGK5uuEu3NSxR
 YZFzBOuwiNl3tb3oAIt/LQ0=
X-Google-Smtp-Source: ABdhPJyHy9ughuPpPS3calOsOJ/RTfJWwggvA/HJPtdVUohQT8x2RPe+8TzX+QD2Sa34SxpFGcZ1PQ==
X-Received: by 2002:a2e:7505:: with SMTP id q5mr9111172ljc.322.1619936492504; 
 Sat, 01 May 2021 23:21:32 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id n7sm755867lft.65.2021.05.01.23.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 23:21:32 -0700 (PDT)
Date: Sun, 2 May 2021 08:21:31 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] hw/timer/etraxfs_timer: Convert to 3-phase reset
 (Resettable interface)
Message-ID: <20210502062131.GB477672@toto>
References: <20210501221350.501946-1-philmd@redhat.com>
 <20210501221350.501946-2-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210501221350.501946-2-philmd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::233;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x233.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, May 02, 2021 at 12:13:49AM +0200, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> TYPE_ETRAX_FS_TIMER is a sysbus device, so its DeviceClass::reset()
> handler is called automatically when its qbus parent is reset
> (we don't need to register it manually).
> 
> Convert the generic reset to a enter/exit resettable ones, and
> remove the qemu_register_reset() call.

Hi Philippe,

The interrupt should be updated in the reset_hold phase, otherwise
interrupts stay asserted while the device is in reset.

Otherwise this looks good to me.

Cheers,
Edgar


> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/timer/etraxfs_timer.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/timer/etraxfs_timer.c b/hw/timer/etraxfs_timer.c
> index 5379006086f..7dd3daf6771 100644
> --- a/hw/timer/etraxfs_timer.c
> +++ b/hw/timer/etraxfs_timer.c
> @@ -309,9 +309,9 @@ static const MemoryRegionOps timer_ops = {
>      }
>  };
>  
> -static void etraxfs_timer_reset(void *opaque)
> +static void etraxfs_timer_reset_enter(Object *obj, ResetType type)
>  {
> -    ETRAXTimerState *t = opaque;
> +    ETRAXTimerState *t = ETRAX_TIMER(obj);
>  
>      ptimer_transaction_begin(t->ptimer_t0);
>      ptimer_stop(t->ptimer_t0);
> @@ -325,6 +325,12 @@ static void etraxfs_timer_reset(void *opaque)
>      t->rw_wd_ctrl = 0;
>      t->r_intr = 0;
>      t->rw_intr_mask = 0;
> +}
> +
> +static void etraxfs_timer_reset_exit(Object *obj)
> +{
> +    ETRAXTimerState *t = ETRAX_TIMER(obj);
> +
>      qemu_irq_lower(t->irq);
>  }
>  
> @@ -343,14 +349,16 @@ static void etraxfs_timer_realize(DeviceState *dev, Error **errp)
>      memory_region_init_io(&t->mmio, OBJECT(t), &timer_ops, t,
>                            "etraxfs-timer", 0x5c);
>      sysbus_init_mmio(sbd, &t->mmio);
> -    qemu_register_reset(etraxfs_timer_reset, t);
>  }
>  
>  static void etraxfs_timer_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
>  
>      dc->realize = etraxfs_timer_realize;
> +    rc->phases.enter = etraxfs_timer_reset_enter;
> +    rc->phases.exit = etraxfs_timer_reset_exit;
>  }
>  
>  static const TypeInfo etraxfs_timer_info = {
> -- 
> 2.26.3
> 

