Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 462662D967E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 11:42:19 +0100 (CET)
Received: from localhost ([::1]:34474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kolJ3-0008A8-Ui
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 05:42:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kolHq-0007VC-1r
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:41:02 -0500
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:43728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1kolHk-0003QK-T1
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 05:40:59 -0500
Received: from myt5-23f0be3aa648.qloud-c.yandex.net
 (myt5-23f0be3aa648.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:3e29:0:640:23f0:be3a])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 7D5C42E1444;
 Mon, 14 Dec 2020 13:40:50 +0300 (MSK)
Received: from myt4-18a966dbd9be.qloud-c.yandex.net
 (myt4-18a966dbd9be.qloud-c.yandex.net [2a02:6b8:c00:12ad:0:640:18a9:66db])
 by myt5-23f0be3aa648.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 o8EdErGyCQ-eowOcSer; Mon, 14 Dec 2020 13:40:50 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1607942450; bh=bKBYQMgfePlEbdzkZj+sb/ZNDX1djcpGzsA5XHDizEc=;
 h=In-Reply-To:Message-ID:Subject:To:From:Cc:References:Date;
 b=CbAeIhxm3JHLr1hIm7b6AXKZJ/e0+vkL11lgXdpsmo2xil14XY1232jZjz5gIXhjI
 L6iKb7GevXVXjo9Av4LmojQUWjHEgEaK99ZTEpvZ9qaOujUQB6+ZCa1wYkqnU7DG7r
 jfRFtoUnE9v+7vWw7K8QL6giSVl8eEpAVoxjKmIk=
Authentication-Results: myt5-23f0be3aa648.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:6402::1:b])
 by myt4-18a966dbd9be.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 epbG2B5tEd-eomORRqF; Mon, 14 Dec 2020 13:40:50 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Date: Mon, 14 Dec 2020 13:40:45 +0300
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH] pci/shpc: don't push attention button when ejecting
 powered-off device
Message-ID: <20201214104045.GA2943@rvkaganb.lan>
Mail-Followup-To: Roman Kagan <rvkagan@yandex-team.ru>,
 qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
References: <20201102053750.2281818-1-rvkagan@yandex-team.ru>
 <20201123074732.GA2768@rvkaganb.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201123074732.GA2768@rvkaganb.lan>
Received-SPF: pass client-ip=77.88.29.217; envelope-from=rvkagan@yandex-team.ru;
 helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, Nov 23, 2020 at 10:47:32AM +0300, Roman Kagan wrote:
> On Mon, Nov 02, 2020 at 08:37:50AM +0300, Roman Kagan wrote:
> > When the slot is in steady powered-off state and the device is being
> > removed, there's no need to press the attention button.  Nor is it
> > mandated by the Standard Hot-Plug Controller Specification, Rev. 1.0.
> > 
> > Moreover it confuses the guest, Linux in particular, as it assumes that
> > the attention button pressed in this state indicates that the device has
> > been inserted and will need to be powered on.  Therefore it transitions
> > the slot into BLINKING_ON state for 5 seconds, and discovers at the end
> > that no device is actually inserted:
> > 
> > ... unplug request
> > [12685.451329] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > [12685.455478] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
> > ... in 5 seconds OS powers off the slot, QEMU ejects the device
> > [12690.632282] shpchp 0000:01:00.0: Latch open on Slot(2)
> > ... excessive button press in steady powered-off state
> > [12690.634267] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > [12690.636256] shpchp 0000:01:00.0: Card not present on Slot(2)
> > ... the last button press spawns powering on the slot
> > [12690.638909] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
> > ... in 5 more seconds attempt to power on discovers empty slot
> > [12695.735986] shpchp 0000:01:00.0: No adapter on slot(2)
> > 
> > Worse, if the real device insertion happens within 5 seconds from the
> > apparent completion of the previous device removal (signaled via
> > DEVICE_DELETED event), the new button press will be interpreted as the
> > cancellation of that misguided powering on:
> > 
> > [13448.965295] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > [13448.969430] shpchp 0000:01:00.0: PCI slot #2 - powering off due to button press
> > [13454.025107] shpchp 0000:01:00.0: Latch open on Slot(2)
> > [13454.027101] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > [13454.029165] shpchp 0000:01:00.0: Card not present on Slot(2)
> > ... the excessive button press spawns powering on the slot
> > ... device has already been ejected by QEMU
> > [13454.031949] shpchp 0000:01:00.0: PCI slot #2 - powering on due to button press
> > ... new device is inserted in the slot
> > [13456.861545] shpchp 0000:01:00.0: Latch close on Slot(2)
> > ... valid button press arrives before 5 s since the wrong one
> > [13456.864894] shpchp 0000:01:00.0: Button pressed on Slot(2)
> > [13456.869211] shpchp 0000:01:00.0: Card present on Slot(2)
> > ... the valid button press is counted as cancellation of the wrong one
> > [13456.873173] shpchp 0000:01:00.0: Button cancel on Slot(2)
> > [13456.877101] shpchp 0000:01:00.0: PCI slot #2 - action canceled due to button press
> > 
> > As a result, the newly inserted device isn't brought up by the guest.
> > 
> > Avoid this situation by not pushing the attention button when the device
> > in the slot is in powered-off state and is being ejected.
> > 
> > FWIW pcie implementation doesn't suffer from this problem.
> > 
> > Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
> > ---
> >  hw/pci/shpc.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> > index b00dce629c..837159c5bd 100644
> > --- a/hw/pci/shpc.c
> > +++ b/hw/pci/shpc.c
> > @@ -300,7 +300,6 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
> >              shpc_set_status(shpc, slot, SHPC_SLOT_STATUS_PRSNT_EMPTY,
> >                              SHPC_SLOT_STATUS_PRSNT_MASK);
> >              shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
> > -                SHPC_SLOT_EVENT_BUTTON |
> >                  SHPC_SLOT_EVENT_MRL |
> >                  SHPC_SLOT_EVENT_PRESENCE;
> >          }
> > @@ -566,7 +565,6 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >          return;
> >      }
> >  
> > -    shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
> >      state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
> >      led = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
> >      if (state == SHPC_STATE_DISABLED && led == SHPC_LED_OFF) {
> > @@ -577,6 +575,8 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
> >          shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |=
> >              SHPC_SLOT_EVENT_MRL |
> >              SHPC_SLOT_EVENT_PRESENCE;
> > +    } else {
> > +        shpc->config[SHPC_SLOT_EVENT_LATCH(slot)] |= SHPC_SLOT_EVENT_BUTTON;
> >      }
> >      shpc_set_status(shpc, slot, 0, SHPC_SLOT_STATUS_66);
> >      shpc_interrupt_update(pci_hotplug_dev);
> > -- 
> > 2.28.0
> > 
> 
> Ping?

Ping?

