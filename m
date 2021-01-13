Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E492F4803
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 10:50:29 +0100 (CET)
Received: from localhost ([::1]:38742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzcnM-0000kr-G7
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 04:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kzckK-0007Xj-N6
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:47:20 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:50414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kzckE-0001sl-Ia
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 04:47:18 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 238142E034A;
 Wed, 13 Jan 2021 12:47:06 +0300 (MSK)
Received: from myt5-70c90f7d6d7d.qloud-c.yandex.net
 (myt5-70c90f7d6d7d.qloud-c.yandex.net [2a02:6b8:c12:3e2c:0:640:70c9:f7d])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 JLFVp3IWBb-l5x87vNC; Wed, 13 Jan 2021 12:47:06 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1610531226; bh=fKOfuE5IgDzh2wgXN00Pl8rG7sFvaZl3mKDKyXATaoI=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=XpZ+4OtghUXCmXqSEvT1A6knXJjkb+z0f8kBQyMr17y6A2GyVIbiBJ/bXWeUTKvCe
 mtjnLk8XwKNfp3Dvo83hGRdavLu2HRN9wt1tmyeW4290fuHaOGkJGqZQSwZqY2fAeK
 ELcSYUs6bGAg6SDNvuAQDzgy0LGV5Z1Vfb7BhqJA=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:7409::1:a])
 by myt5-70c90f7d6d7d.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 b4C3QAepbT-l5nqHMrF; Wed, 13 Jan 2021 12:47:05 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Wed, 13 Jan 2021 12:47:01 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] pci/shpc: don't push attention button when ejecting
 powered-off device
Message-ID: <20210113094701.GB3688@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20201102053750.2281818-1-rvkagan@yandex-team.ru>
 <20201123074732.GA2768@rvkaganb.lan>
 <20201214104045.GA2943@rvkaganb.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201214104045.GA2943@rvkaganb.lan>
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 14, 2020 at 01:40:45PM +0300, Roman Kagan wrote:
> On Mon, Nov 23, 2020 at 10:47:32AM +0300, Roman Kagan wrote:
> > On Mon, Nov 02, 2020 at 08:37:50AM +0300, Roman Kagan wrote:
> > > When the slot is in steady powered-off state and the device is being
> > > removed, there's no need to press the attention button.  Nor is it
> > > mandated by the Standard Hot-Plug Controller Specification, Rev. 1.0.
> > > 
> > > Moreover it confuses the guest, Linux in particular, as it assumes that
> > > the attention button pressed in this state indicates that the device has
> > > been inserted and will need to be powered on.  Therefore it transitions
> > > the slot into BLINKING_ON state for 5 seconds, and discovers at the end
> > > that no device is actually inserted:
> > > 
> > > ... unplug request
> > > [12685.451329] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > > [12685.455478] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
> > > ... in 5 seconds OS powers off the slot, QEMU ejects the device
> > > [12690.632282] shpchp 0000:01:00.0: Latch open on Slot(2)
> > > ... excessive button press in steady powered-off state
> > > [12690.634267] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > > [12690.636256] shpchp 0000:01:00.0: Card not present on Slot(2)
> > > ... the last button press spawns powering on the slot
> > > [12690.638909] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
> > > ... in 5 more seconds attempt to power on discovers empty slot
> > > [12695.735986] shpchp 0000:01:00.0: No adapter on slot(2)
> > > 
> > > Worse, if the real device insertion happens within 5 seconds from the
> > > apparent completion of the previous device removal (signaled via
> > > DEVICE_DELETED event), the new button press will be interpreted as the
> > > cancellation of that misguided powering on:
> > > 
> > > [13448.965295] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > > [13448.969430] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
> > > [13454.025107] shpchp 0000:01:00.0: Latch open on Slot(2)
> > > [13454.027101] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > > [13454.029165] shpchp 0000:01:00.0: Card not present on Slot(2)
> > > ... the excessive button press spawns powering on the slot
> > > ... device has already been ejected by QEMU
> > > [13454.031949] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
> > > ... new device is inserted in the slot
> > > [13456.861545] shpchp 0000:01:00.0: Latch close on Slot(2)
> > > ... valid button press arrives before 5 s since the wrong one
> > > [13456.864894] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > > [13456.869211] shpchp 0000:01:00.0: Card present on Slot(2)
> > > ... the valid button press is counted as cancellation of the wrong one
> > > [13456.873173] shpchp 0000:01:00.0: Button cancel on Slot(2)
> > > [13456.877101] shpchp 0000:01:00.0: PCI slot #2 - action canceled due to button press
> > > 
> > > As a result, the newly inserted device isn't brought up by the guest.
> > > 
> > > Avoid this situation by not pushing the attention button when the device
> > > in the slot is in powered-off state and is being ejected.
> > > 
> > > FWIW pcie implementation doesn't suffer from this problem.
> > > 
> > > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > > ---
> > >  hw/pci/shpc.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> > > index b00dce629c..837159c5bd 100644
> > > --- a/hw/pci/shpc.c
> > > +++ b/hw/pci/shpc.c
> > > @@ -300,7 +300,6 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
> > >              shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
> > >                              SHPC_SLOT_STATUS_PRSNT_MASK);
> > >              shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
> > > -                SHPC_SLOT_EVENT_BUTTON |
> > >                  SHPC_SLOT_EVENT_MRL |
> > >                  SHPC_SLOT_EVENT_PRESENCE;
> > >          }
> > > @@ -566,7 +565,6 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >          return;
> > >      }
> > >  
> > > -    shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
> > >      state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
> > >      led = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
> > >      if (state == SHPC_STATE_DISABLED && led == SHPC_LED_OFF) {
> > > @@ -577,6 +575,8 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> > >          shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
> > >              SHPC_SLOT_EVENT_MRL |
> > >              SHPC_SLOT_EVENT_PRESENCE;
> > > +    } else {
> > > +        shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
> > >      }
> > >      shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
> > >      shpc_interrupt_update(pci_hotplug_dev);
> > > -- 
> > > 2.28.0
> > > 
> > 
> > Ping?
> 
> Ping?

Ping?

