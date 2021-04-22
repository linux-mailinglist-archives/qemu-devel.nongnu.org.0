Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF27368163
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 15:22:22 +0200 (CEST)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZZHh-0005UG-Cn
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 09:22:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZZGl-00055p-0s
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 09:21:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lZZGg-0000mW-Vp
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 09:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619097677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a4V9ufdzq5WJGlGSitSSjim0l4EUZ2FVshanPiFYxFg=;
 b=F/0k9lpLwQoGWNWEcScNc+8pbR0wmHiFJyjFjnochNyrpWOIdJUP+qGvJfaZRRpoZDrJYA
 eP4A1WA14ChvJNN0IFHBFLc+vZ2Si660U8yYA+3DQUso4iI0jCROxBHIzSfPFZokxBRuNA
 u7JsWNxiQB/mGi8lGiZUF0VmN1ahvmA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-109-DcFQBj5VNIuJahXOac9xjw-1; Thu, 22 Apr 2021 09:21:15 -0400
X-MC-Unique: DcFQBj5VNIuJahXOac9xjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98325192CC40;
 Thu, 22 Apr 2021 13:21:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07D0C5C1D5;
 Thu, 22 Apr 2021 13:21:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 91390113525D; Thu, 22 Apr 2021 15:21:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: Resetting non-qdev children in a 3-phase reset device
References: <CAFEAcA8k+RUNhAOzCeefBs+vcyAgrtHwHMH9KfQb6OJg0su_7w@mail.gmail.com>
 <fc080508-9b82-8a2b-79bb-ab4e9f812cce@amsat.org>
 <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
Date: Thu, 22 Apr 2021 15:21:11 +0200
In-Reply-To: <CAFEAcA8hs3Uw=8-_CFa_GoMhmqxCcHw5t751oKzicd0_+Dh8kA@mail.gmail.com>
 (Peter Maydell's message of "Mon, 19 Apr 2021 10:03:24 +0100")
Message-ID: <87y2datpyw.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Sun, 18 Apr 2021 at 21:16, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>>
>> +Markus
>>
>> On 4/9/21 8:13 PM, Peter Maydell wrote:
>> > Maybe some mechanism for marking "these things which are my
>> > QOM children I want to be reset when I am reset (so make them
>> > reset children of me and don't reset them as part of the
>> > qbus-tree-walking)" would be useful. I do think that in a
>> > lot of cases we want to be doing something closer to "reset
>> > along the QOM tree".
>>
>> Eh here you mention QOM again... Shouldn't it be qdev?
>
> No, I meant QOM, ie the relation you see below in the "info qom-tree"
> output:
>
>> I know the LED is just an example of a broader problem.
>> I indeed took care to add the QOM parent relation:
>>
>> (qemu) info qom-tree
>> /machine (mps2-an385-machine)
>>   /fpgaio (mps2-fpgaio)
>>     /mps2-fpgaio[0] (memory-region)
>>     /userled0 (led)
>>       /unnamed-gpio-in[0] (irq)
>>     /userled1 (led)
>>       /unnamed-gpio-in[0] (irq)
>>   /scc (mps2-scc)
>>     /mps2-scc[0] (memory-region)
>>     /scc-led0 (led)
>>       /unnamed-gpio-in[0] (irq)
>>     /scc-led1 (led)
>>       /unnamed-gpio-in[0] (irq)
>>     ...
>>
>> So looking at this qom-tree, the reset tree seems to me
>> more natural than the sysbus one, but IIRC not many models
>> set this QOM relationship.
>
>> QOM objects aren't enforced to have a relation with a parent,
>
> I thought they always got parented into somewhere, even if it
> was a catch-all bucket somewhere ?

If a *device* has no QOM parent at realize time, realize sets the QOM
parent to the /machine/unattached/ orphanage.  In device_set_realized():

    if (value && !dev->realized) {
        ...
        if (!obj->parent) {
            gchar *name =3D g_strdup_printf("device[%d]", unattached_count+=
+);

            object_property_add_child(container_get(qdev_get_machine(),
                                                    "/unattached"),
                                      name, obj);
            unattached_parent =3D true;
            g_free(name);
        }

As far as I understand this is a crutch to help us cope with
incompletely QOMified devices.

The crutch does not apply to QOM objects that aren't devices.

>> as opposed as recent changes from Markus to always have a qdev
>> on a qbus).

Most qdevs plug into a qbus, but some don't.

DeviceClass member @bus_type names the kind of bus the device plugs
into.  It's a QOM type name.  Example: for a PCI device, it's
TYPE_PCI_BUS, and the device must be plugged into an instance of a
(subtype of) TYPE_PCI_BUS.

If @bus_type is null, the device does not plug into any qbus.

The qbus a device is plugged into is also called the parent bus.  Not to
be confused with the QOM parent.

>>             But even without parent they end in the /unattached
>> container below /machine, so if the reset were there, the
>> machine could still iterate over the /unattached children.
>
> ...yes, /unattached is what I was thinking about.
>
> My current half-thought-through view is that where we ought
> to try to end up is something like:
>
>  * "real" buses should continue to propagate reset
>    (A "real" bus is like PCI, SCSI, and other buses where the real
>    hardware has a concept of a "bus reset" or where the power to the
>    plugged device comes from the bus so that powercycling the
>    controller naturally powercycles the devices. Sysbus is not a
>    "real" bus; I haven't checked the others to see if we have any
>    other non-real buses)
>  * reset should follow the QOM tree for objects not on a "real" bus
>    (that is, the qdev "reset this device" function should do
>    "iterate through my QOM children and reset those which are not
>    on a real bus" as well as its current "reset myself" and "reset
>    every qbus I have")
>  * instead of reset starting with the sysbus and working along the
>    qbus hierarchy, we start by resetting the machine. That should
>    include resetting all the QOM children of the machine. Any
>    device which has a qbus should reset the qbus as part of its
>    reset, but only "real" buses reset their children when reset.

Sounds like an approximation of reset wire modelling :)

In a real machine, the reset signal travels along "wires" (in quotes,
because it need not be a dedicated wire, although it commonly is)

We're not modelling these wires explicitly so far.  Instead, we make
assumptions such as "reset flows along the qdev tree", which are close
enough except when they aren't.

What you propose is likely closer to reality than what we have now.

Do I make sense?

> That means that, for instance, if you reset an SoC container object
> it will reset all the sub-devices within the SoC and the miscellaneous
> bits of glue logic like OR gates it might also own[*]. It also means that
> CPU objects should no longer need weird special casing, because they
> are part of the QOM hierarchy and get reset that way.
>
> [*] Fun fact: TYPE_OR_IRQ inherits directly from TYPE_DEVICE which
> means that pretty much no instances of it ever get reset.
>
> There is of course a massive unsolved problem with this idea, which
> is the usual "how do we get there from here" one.
>
> (Eventually I think we might be able to collapse TYPE_SYS_BUS_DEVICE
> down into TYPE_DEVICE: there is no particular reason why a TYPE_DEVICE
> can have GPIO inputs and outputs but only a TYPE_SYS_BUS_DEVICE can
> claim to have MMIO regions and IRQs. "Only sysbus devices get reset"
> is a big part of why a lot of devices today are sysbus.)

Sysbus may habe been a design mistake.  It goes back the qdev design
assumption "every device plugs into exactly one bus, every bus is part
of exactly one device, and the main system bus is the root of this
tree".  The assumption ceased to hold long ago, but we still have
sysbus.


