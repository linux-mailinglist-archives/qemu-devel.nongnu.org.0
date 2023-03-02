Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C1E6A7D10
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:51:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeeO-0000Lm-Hk; Thu, 02 Mar 2023 03:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXee9-0000LA-OL
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXee4-000621-1J
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:50:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677747032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5D+bZi0LwoxVnMUjLXSLfxdwhr6TSs00ImSeTgVaTzA=;
 b=DQuGncQI/Iu5k1eL3UjEKtA5+//jD6Ueq6GW1u7BVV0Z/vWs66Rsdg/fnRhYBTtIpO5Yci
 YFG0hio60uYy+cAu0rPV5lvKPoFzgCybOTF2oDTxLm3VQibgn1VId5e5O65IgC6y9nam2B
 JOYXm8zBw85pt98lq1sbldSYMYars4w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-363-u8XCtAOuPLyOIeVnXku86g-1; Thu, 02 Mar 2023 03:50:30 -0500
X-MC-Unique: u8XCtAOuPLyOIeVnXku86g-1
Received: by mail-wm1-f71.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so948057wma.7
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:50:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677747030;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5D+bZi0LwoxVnMUjLXSLfxdwhr6TSs00ImSeTgVaTzA=;
 b=PZQ0qa0A1ZDyGPpEww81qLhZ4YVe417eGAwIPFbPA+q2dblz7vIzCSD4MTl1/o1vnT
 dtuIV27bXbxZi/ciCezWDWK2W1hqSuj8voVbuOd+BuDLW8WpaybE0pBHk2rau871H09P
 XKMfwdnq53FnJAV7PmQ9Lsd5446x8/YBjKg+0VFlQHRow1Y0XSYsbMyJygax7+JgMXFJ
 W1c6LtJjqyzjclphCREq91oIlUwmtX80ymBiEnFftehvmzc8p7RsIeUmWnZ4STC5YiIr
 dp0vF1Bbj3urcOFfOWyqCCuiTAWgnbtAWewwyKn9O0TIW6tvHjMjBCb9JHM/y8kf0ZwA
 UkYw==
X-Gm-Message-State: AO0yUKUdXRPHP93GTch/HRar5Hhinf6Aun3hzgvKqFXCUhj2NxYfPZ3g
 g8vyg8I2AAjX5F1bgTR27eaY8vQT72yFmdZ+Fw0wNuAckEKH9e+MeN9tfbvMgOl1aWlHeyi1Vg7
 i7C3vXvQtunQozkI=
X-Received: by 2002:a5d:684f:0:b0:2c7:6bf:16cc with SMTP id
 o15-20020a5d684f000000b002c706bf16ccmr6945151wrw.32.1677747029861; 
 Thu, 02 Mar 2023 00:50:29 -0800 (PST)
X-Google-Smtp-Source: AK7set8x/Ob0YGcFaqRre+VfBJb6Y5WXxzsEotlTk9JfCoJD1L9ZuKvUFPnuNv3STIQRq+QFR0609A==
X-Received: by 2002:a5d:684f:0:b0:2c7:6bf:16cc with SMTP id
 o15-20020a5d684f000000b002c706bf16ccmr6945131wrw.32.1677747029495; 
 Thu, 02 Mar 2023 00:50:29 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 c21-20020a7bc015000000b003e214803343sm2139647wmb.46.2023.03.02.00.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:50:28 -0800 (PST)
Date: Thu, 2 Mar 2023 03:50:25 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 marcel.apfelbaum@gmail.com, philmd@linaro.org,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: Re: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Message-ID: <20230302034518-mutt-send-email-mst@kernel.org>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
 <20230216180356.156832-19-vsementsov@yandex-team.ru>
 <20230301160635-mutt-send-email-mst@kernel.org>
 <5a92d09e-d682-427a-cae0-58b8ec51f75e@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a92d09e-d682-427a-cae0-58b8ec51f75e@yandex-team.ru>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, Mar 02, 2023 at 11:39:42AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> On 02.03.23 00:07, Michael S. Tsirkin wrote:
> > On Thu, Feb 16, 2023 at 09:03:56PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > We have DEVICE_DELETED event, that signals that device_del command is
> > > actually completed. But we don't have a counter-part for device_add.
> > > Still it's sensible for SHPC and PCIe-native hotplug, as there are time
> > > when the device in some intermediate state. Let's add an event that say
> > > that the device is finally powered on, power indicator is on and
> > > everything is OK for next manipulation on that device.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> > 
> > I don't much mind though a bit more motivation would be nice.
> > How is this going to be used? When does management care?
> 
> Some motivations:
> 
> 1. To be sure that device is "accepted" by guest. Guest may ignore hotplugged device for some reason (for example during OS booting). Management wants to catch this and handle the problem, instead of silent assume that everything is OK. So, if we don't get the event by some timeout, we can report an error, try to unplug/plug the disk again or do some other things to handle the problem.

Note this is kind of weak in that we don't know that there's a driver.

> 2. The device can't be removed (by blockdev-del) while power indicator of hotplug controller is blinking (QEMU reports "guest is busy (power indicator blinking)"). So, management should avoid removing the device until it gets the DEVICE_ON event.

That always annoyed me. I wanted delete to just stay pending until
it triggers.

But if we can't fix that,  it's a good reason.  However it can always
start blinking again. So DEVICE_ON is not a good name. DEVICE_REMOVABLE?
And not it's not realiable, it can start blinking by the time you try to
remove.
Another problem is that guest can create a flood of these events
by starting/stopping blinking.

Maybe, if blockdev-del fails then we start listening for events
and notify when it can be retried?

DEVICE_DELETED_RETRY ?

> 3. Also, management tool may make a GUI visualization of power indicator with help of this event.
> 
> > 
> > Meanwhile, for the schema - can this one get ACKs from QAPI maintainers please?
> > 
> > 
> > > ---
> > >   qapi/qdev.json | 10 ++++++++++
> > >   hw/pci/pcie.c  | 14 ++++++++++++++
> > >   hw/pci/shpc.c  | 12 ++++++++++++
> > >   3 files changed, 36 insertions(+)
> > > 
> > > diff --git a/qapi/qdev.json b/qapi/qdev.json
> > > index 6f2d8d6647..116a8a7de8 100644
> > > --- a/qapi/qdev.json
> > > +++ b/qapi/qdev.json
> > > @@ -348,3 +348,13 @@
> > >   { 'command': 'query-hotplug',
> > >     'data': { 'id': 'str' },
> > >     'returns': 'HotplugInfo' }
> > > +
> > > +##
> > > +# @DEVICE_ON:
> > > +#
> > > +# Emitted whenever the device insertion completion is acknowledged by the guest.
> > > +# For now only emitted for SHPC and PCIe-native hotplug.
> > > +#
> > > +# Since: 8.0
> > > +##
> > > +{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index 636f962a23..4297e4e8dc 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -22,6 +22,7 @@
> > >   #include "monitor/qdev.h"
> > >   #include "qapi/error.h"
> > > +#include "qapi/qapi-events-qdev.h"
> > >   #include "hw/pci/pci_bridge.h"
> > >   #include "hw/pci/pcie.h"
> > >   #include "hw/pci/msix.h"
> > > @@ -47,6 +48,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
> > >           && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
> > >   }
> > > +static bool pcie_sltctl_powered_on(uint16_t sltctl)
> > > +{
> > > +    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
> > > +        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
> > > +        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
> > > +}
> > > +
> > >   static LedActivity pcie_led_state_to_qapi(uint16_t value)
> > >   {
> > >       switch (value) {
> > > @@ -816,6 +824,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
> > >           qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
> > >       }
> > > +    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
> > > +        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
> > > +    {
> > > +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
> > > +    }
> > > +
> > >       /*
> > >        * If the slot is populated, power indicator is off and power
> > >        * controller is off, it is safe to detach the devices.
> > > diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
> > > index 6a4f93949d..380b2b83b3 100644
> > > --- a/hw/pci/shpc.c
> > > +++ b/hw/pci/shpc.c
> > > @@ -299,6 +299,12 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
> > >       return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
> > >   }
> > > +static bool shpc_slot_is_on(uint8_t state, uint8_t power, uint8_t attn)
> > > +{
> > > +    return state == SHPC_STATE_ENABLED && power == SHPC_LED_ON &&
> > > +        attn == SHPC_LED_OFF;
> > > +}
> > > +
> > >   static void shpc_slot_command(PCIDevice *d, uint8_t target,
> > >                                 uint8_t state, uint8_t power, uint8_t attn)
> > >   {
> > > @@ -366,6 +372,12 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
> > >               SHPC_SLOT_EVENT_MRL |
> > >               SHPC_SLOT_EVENT_PRESENCE;
> > >       }
> > > +
> > > +    if (!shpc_slot_is_on(old_state, old_power, old_attn) &&
> > > +        shpc_slot_is_on(state, power, attn) && child_dev)
> > > +    {
> > > +        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
> > > +    }
> > >   }
> > >   static void shpc_command(PCIDevice *d)
> > > -- 
> > > 2.34.1
> > 
> 
> -- 
> Best regards,
> Vladimir


