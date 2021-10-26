Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F41E43B7E2
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 19:05:20 +0200 (CEST)
Received: from localhost ([::1]:33256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPt1-00043u-Do
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 13:05:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfPqD-0001DN-Du
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:02:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1mfPqB-0003ZN-BI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 13:02:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635267742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WhtluN/XirUhu/E7Z/YCKpa/MlfNCnzJk2txJvVjccA=;
 b=UnJEKBI/FVcqAaORh00u84eI0esYBKre2+4PAv9+Tp1RY5K0jLx0QdA7rk+/GYIs5mtKkF
 4A28Bw6MipjuQHGASlM2V5L6CG5w3B1sLO4AvyMR7MgONR8fd1fCO52MtsTC8e1osSyn0N
 Rk5wo61CHxDBPCPsImwq9z5Hw5wh7Uo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-219-4ZSKOBHPPP-CuxKMmOTFcg-1; Tue, 26 Oct 2021 13:02:20 -0400
X-MC-Unique: 4ZSKOBHPPP-CuxKMmOTFcg-1
Received: by mail-wm1-f72.google.com with SMTP id
 b197-20020a1c1bce000000b0032ca040eb40so1224883wmb.7
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 10:02:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WhtluN/XirUhu/E7Z/YCKpa/MlfNCnzJk2txJvVjccA=;
 b=XzI/a0932lMiHDwI0TabjI6RwCtZ51z13AwAPZKrFdH6zgxkG9NV1s+K33zIx6iuMg
 Cg9lxSk0OX12YA+SpOkRkTp/Tg6/JR2ec2BEn/LEFUdJHqeo1dGICuer2Sc0NlcC/R4D
 hZ0EfMgFJ6bHGUOxpMT+HUlPUIKF9pwuWywZWa8f153TTfTH7aAa5nV9d0setG9Z0vBm
 14uAeJ0ph0/YyMJCxlpSHO3XJumnebod54cvEApE0KqpLSXBGvIfytLhiwoF8SP1eEkb
 tCJIlQfp2JCikx4HboT910VLSUeiCnL1u/rafsFfZvmdW0w4wVkB3vUcDhbyUffUDTi3
 8AoQ==
X-Gm-Message-State: AOAM5331qUEuHuAVbMmaMlQpvCcTwQv8uiUcaAtheQoOiLI4O2OzG9PP
 je87utiyEk8Up5fABIHdLRM8W02YupWMJx6qU8X647LDm/JcLJmaEKOxvtJ5llCpjkyb86JsYfE
 6VzjfafyQCIkUcNw=
X-Received: by 2002:adf:c986:: with SMTP id f6mr34886767wrh.216.1635267739115; 
 Tue, 26 Oct 2021 10:02:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5WWmIWFwoyaYWQZ6FpvBV8LDBClMDmMrl1q+j7EnUXG2Lu6/nUCdK1E7KFMx7NhjR/4pNtg==
X-Received: by 2002:adf:c986:: with SMTP id f6mr34886710wrh.216.1635267738768; 
 Tue, 26 Oct 2021 10:02:18 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id n12sm1061411wrv.30.2021.10.26.10.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 10:02:18 -0700 (PDT)
Date: Tue, 26 Oct 2021 18:02:16 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: Re: [PATCH] hw/net: store timers for e1000 in vmstate
Message-ID: <YXg0mFqaEjlaigd6@work-vm>
References: <163524428177.1917083.7115508068018047923.stgit@pasha-ThinkPad-X280>
MIME-Version: 1.0
In-Reply-To: <163524428177.1917083.7115508068018047923.stgit@pasha-ThinkPad-X280>
User-Agent: Mutt/2.0.7 (2021-05-04)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: jasowang@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Pavel Dovgalyuk (pavel.dovgalyuk@ispras.ru) wrote:
> Setting timers randomly when vmstate is loaded breaks
> execution determinism.
> Therefore this patch allows saving mit and autoneg timers
> for e1000. It makes execution deterministic and allows
> snapshotting and reverse debugging in icount mode.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>

I think you need to wire those needed's to machine types (via a
parameter or something) so that they don't break backwards migration
compatibility.

Dave

> ---
>  hw/net/e1000.c |   61 ++++++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 50 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/net/e1000.c b/hw/net/e1000.c
> index a30546c5d5..2f706f7298 100644
> --- a/hw/net/e1000.c
> +++ b/hw/net/e1000.c
> @@ -37,6 +37,7 @@
>  #include "qemu/iov.h"
>  #include "qemu/module.h"
>  #include "qemu/range.h"
> +#include "sysemu/replay.h"
>  
>  #include "e1000x_common.h"
>  #include "trace.h"
> @@ -1407,7 +1408,7 @@ static int e1000_pre_save(void *opaque)
>       * complete auto-negotiation immediately. This allows us to look
>       * at MII_SR_AUTONEG_COMPLETE to infer link status on load.
>       */
> -    if (nc->link_down && have_autoneg(s)) {
> +    if (replay_mode == REPLAY_MODE_NONE && nc->link_down && have_autoneg(s)) {
>          s->phy_reg[PHY_STATUS] |= MII_SR_AUTONEG_COMPLETE;
>      }
>  
> @@ -1438,22 +1439,12 @@ static int e1000_post_load(void *opaque, int version_id)
>              s->mac_reg[TADV] = 0;
>          s->mit_irq_level = false;
>      }
> -    s->mit_ide = 0;
> -    s->mit_timer_on = true;
> -    timer_mod(s->mit_timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 1);
>  
>      /* nc.link_down can't be migrated, so infer link_down according
>       * to link status bit in mac_reg[STATUS].
>       * Alternatively, restart link negotiation if it was in progress. */
>      nc->link_down = (s->mac_reg[STATUS] & E1000_STATUS_LU) == 0;
>  
> -    if (have_autoneg(s) &&
> -        !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE)) {
> -        nc->link_down = false;
> -        timer_mod(s->autoneg_timer,
> -                  qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL) + 500);
> -    }
> -
>      s->tx.props = s->mig_props;
>      if (!s->received_tx_tso) {
>          /* We received only one set of offload data (tx.props)
> @@ -1472,6 +1463,13 @@ static int e1000_tx_tso_post_load(void *opaque, int version_id)
>      return 0;
>  }
>  
> +static int e1000_mit_timer_post_load(void *opaque, int version_id)
> +{
> +    E1000State *s = opaque;
> +    s->mit_timer_on = true;
> +    return 0;
> +}
> +
>  static bool e1000_mit_state_needed(void *opaque)
>  {
>      E1000State *s = opaque;
> @@ -1493,6 +1491,21 @@ static bool e1000_tso_state_needed(void *opaque)
>      return chkflag(TSO);
>  }
>  
> +static bool e1000_mit_timer_needed(void *opaque)
> +{
> +    E1000State *s = opaque;
> +
> +    return s->mit_timer_on;
> +}
> +
> +static bool e1000_autoneg_timer_needed(void *opaque)
> +{
> +    E1000State *s = opaque;
> +
> +    return have_autoneg(s)
> +           && !(s->phy_reg[PHY_STATUS] & MII_SR_AUTONEG_COMPLETE);
> +}
> +
>  static const VMStateDescription vmstate_e1000_mit_state = {
>      .name = "e1000/mit_state",
>      .version_id = 1,
> @@ -1541,6 +1554,30 @@ static const VMStateDescription vmstate_e1000_tx_tso_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_e1000_mit_timer = {
> +    .name = "e1000/mit_timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = e1000_mit_timer_needed,
> +    .post_load = e1000_mit_timer_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(mit_timer, E1000State),
> +        VMSTATE_UINT32(mit_ide, E1000State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +static const VMStateDescription vmstate_e1000_autoneg_timer = {
> +    .name = "e1000/autoneg_timer",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = e1000_autoneg_timer_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_TIMER_PTR(autoneg_timer, E1000State),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_e1000 = {
>      .name = "e1000",
>      .version_id = 2,
> @@ -1622,6 +1659,8 @@ static const VMStateDescription vmstate_e1000 = {
>          &vmstate_e1000_mit_state,
>          &vmstate_e1000_full_mac_state,
>          &vmstate_e1000_tx_tso_state,
> +        &vmstate_e1000_mit_timer,
> +        &vmstate_e1000_autoneg_timer,
>          NULL
>      }
>  };
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


