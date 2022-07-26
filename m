Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E59580A80
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:38:19 +0200 (CEST)
Received: from localhost ([::1]:58014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCKo-0006s9-Fp
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:38:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCG7-0004E6-3l
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:33:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGCG3-0007c4-Fy
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658810002;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k0ZHGRkHGN2ocWWhjuMPV1yyguEqDv5mrkPvbipGLPM=;
 b=DU8v6Z29lJF72Ib34n18LfnmMH8K0f5ZP68dFEhC50IzGuNUN38phpfaiDJOmcSZNOxW0y
 Grzym6Pv5O0MOC9JOjkD1Joow4QazxUUZ+cWEWkRGbUv3D3FfuhaP57PYPLYcV7IVMmGS1
 UsYnCj9DSc3acq1oorCV/8fBR3XmDlg=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-iosDwfa3MmyItAePDDf_Fw-1; Tue, 26 Jul 2022 00:33:21 -0400
X-MC-Unique: iosDwfa3MmyItAePDDf_Fw-1
Received: by mail-lf1-f69.google.com with SMTP id
 u25-20020a199219000000b0048a7af081bfso2361140lfd.23
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:33:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k0ZHGRkHGN2ocWWhjuMPV1yyguEqDv5mrkPvbipGLPM=;
 b=XKvaULbJ1LAkPl9gnmQAwfI4ojqNjxTkqAIxj8OzFxLWSX4cgI7lKkBDhzIO+04eZv
 uihmvnRdABQ+GjxsO/RrU1KHUyRuypH4KQuQLJBgTgRtr9UhkseROynq5iHwcqlRlURc
 dF3IIaGfeZMIyxyiS381QLl4JLPe05JDtuFcgkcWSv9WgAD6XdsSSXW/6Q+xFiySu7PR
 7yMedaDV7tmhpTSSBtpUhJK2PwCE4WpU7SclkAqhDmFiQVBP2rUu8s+IBCnQef0a/Pne
 fDm8ejNVGJsmBJbjTfdYw9C4LHUDA0Tyu8ur5qLFAvaKBHvkpyuUnzOvD+fwAieze5aF
 oCIQ==
X-Gm-Message-State: AJIora8BemV6L5MaNGaPm+ODL/Sz2ZPphl3nD7tRUSQjZMbW06Kn7We9
 wAgg6XXPNmsczZzX9gqamuxdi1d4/HmludaIVkZm5ZZjGAJUGwJkgOxCu4LEkLunFdmqvCYzHK9
 d42L4+k8xwrl6ff+7+R9LH9CsSJFn4ds=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr4940323ljh.251.1658809999841; 
 Mon, 25 Jul 2022 21:33:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u2pq4PmgRI2yUUeApabPnUNPITR3JsopDyRJ6LhCYYdis2aND5scSP9pBKoo6baUYVFhcRj4Ibo+Ybr3O1Wtc=
X-Received: by 2002:a2e:83c4:0:b0:25d:ea2c:5bc2 with SMTP id
 s4-20020a2e83c4000000b0025dea2c5bc2mr4940312ljh.251.1658809999303; Mon, 25
 Jul 2022 21:33:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111303.10628-1-ake@igel.co.jp>
In-Reply-To: <20220720111303.10628-1-ake@igel.co.jp>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 26 Jul 2022 12:33:07 +0800
Message-ID: <CACGkMEtUGP7j=VB2p0ZCp-XBktXp8rccdcJWQ2p57sfkKM1jEQ@mail.gmail.com>
Subject: Re: [PATCH] e1000e: Fix possible interrupt loss when using MSI
To: Ake Koomsin <ake@igel.co.jp>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 20, 2022 at 7:14 PM Ake Koomsin <ake@igel.co.jp> wrote:
>
> Commit "e1000e: Prevent MSI/MSI-X storms" introduced msi_causes_pending
> to prevent interrupt storms problem. It was tested with MSI-X.
>
> In case of MSI, the guest can rely solely on interrupts to clear ICR.
> Upon clearing all pending interrupts, msi_causes_pending gets cleared.
> However, when e1000e_itr_should_postpone() in e1000e_send_msi() returns
> true, MSI never gets fired by e1000e_intrmgr_on_throttling_timer()
> because msi_causes_pending is still set. This results in interrupt loss.
>
> To prevent this, we need to clear msi_causes_pending when MSI is going
> to get fired by the throttling timer. The guest can then receive
> interrupts eventually.
>
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>

I've queued this.

Thanks

> ---
>  hw/net/e1000e_core.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 2c51089a82..208e3e0d79 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -159,6 +159,8 @@ e1000e_intrmgr_on_throttling_timer(void *opaque)
>
>      if (msi_enabled(timer->core->owner)) {
>          trace_e1000e_irq_msi_notify_postponed();
> +        /* Clear msi_causes_pending to fire MSI eventually */
> +        timer->core->msi_causes_pending = 0;
>          e1000e_set_interrupt_cause(timer->core, 0);
>      } else {
>          trace_e1000e_irq_legacy_notify_postponed();
> --
> 2.25.1
>


