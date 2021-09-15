Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F0840BEF5
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 06:30:43 +0200 (CEST)
Received: from localhost ([::1]:55144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQMZF-0002v4-Iq
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 00:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQMXM-0002Ea-Qj
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 00:28:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mQMXH-0006D4-6x
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 00:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631680116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6m9TZh92CBt8e8uPCiG2EZ5+msp2rhaXraIOkX9sao=;
 b=PVlf7V7KZaJ+k+TdhpU4o0WOAAi7W0Co0A0gdRrAvvGq4pEq02H6ecuvqoI9MXCO7S1aIl
 mhXCvmiU4SZCN7t6tGZzHK65r8FHZ9p9XIgDO6iZCmSbaRNv6wOH4Dn54U5P3ma8Jjh++Z
 RU0ctSQJSxfhvVi5uLCtkvNZIqbw0qM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-p1Pn5vLEPhWQZazjZpvf8w-1; Wed, 15 Sep 2021 00:28:34 -0400
X-MC-Unique: p1Pn5vLEPhWQZazjZpvf8w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB040802929;
 Wed, 15 Sep 2021 04:28:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 678E15D6AD;
 Wed, 15 Sep 2021 04:28:33 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F1BE3113865F; Wed, 15 Sep 2021 06:28:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ensuring a machine's buses have unique names
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 <87czq0l2mn.fsf@dusky.pond.sub.org>
 <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
Date: Wed, 15 Sep 2021 06:28:31 +0200
In-Reply-To: <CAFEAcA-1cGjt54XDEmKiDctySW4zdQptoc2taGp0XxMOtKvGCw@mail.gmail.com>
 (Peter Maydell's message of "Tue, 14 Sep 2021 16:25:49 +0100")
Message-ID: <87mtoe4g40.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> On Thu, 26 Aug 2021 at 15:08, Markus Armbruster <armbru@redhat.com> wrote:
>> Peter Maydell <peter.maydell@linaro.org> writes:
>> > What's the right way to ensure that when a machine has multiple
>> > buses of the same type (eg multiple i2c controllers, multiple
>> > sd card controllers) they all get assigned unique names so that
>> > the user can use '-device ...,bus=some-name' to put a device on a
>> > specific bus?
>
>> Another one used to be isapc.  It's not anymore.  I believe it's due to
>>
>> commit 61de36761b565a4138d8ad7ec75489ab28fe84b6
>> Author: Alexander Graf <agraf@csgraf.de>
>> Date:   Thu Feb 6 16:08:15 2014 +0100
>>
>>     qdev: Keep global allocation counter per bus
>
>> Note that the automatic bus numbers depend on the order in which board
>> code creates devices.  Too implicit and fragile for my taste.  But it's
>> been working well enough.
>
> I had a bit of a look into this. I think the problem here is that
> we created a family of easy-to-misuse APIs and then misused them...

Well, "mission accomplished!"

> The qbus_create() and qbus_create_inplace() functions both take
> a 'const char *name' argument. If they're passed in NULL then
> they create an automatically-uniquified name (as per the commit
> above).

Fine print: if the device providing the bus has an ID (the thing set
with id=ID), then the name is ID.N, where N counts from 0 in this
device, else it's TYPE.N, where N counts from 0 globally per bus type,
and TYPE is the bus's type name converted to lower case.

Either scheme produces unique names, but together they need not: 

    $ qemu-system-x86_64 --nodefaults -S -display none -monitor stdio -device intel-hda -device intel-hda,id=hda
    QEMU 6.1.50 monitor - type 'help' for more information
    (qemu) info qtree
    bus: main-system-bus
      type System
      [...]
      dev: i440FX-pcihost, id ""
        [...]
        bus: pci.0
          type PCI
          dev: intel-hda, id "hda"
            [...]
            bus: hda.0
              type HDA
          dev: intel-hda, id ""
            [...]
            bus: hda.0
              type HDA
      [...]

Both buses are named "hda.0".

Awesome: we made avoiding device IDs that produce bus ID clashes the
user's job.  To know what to avoid, you need to know your machine type,
and the buses provided by the devices you add without ID (which you
shouldn't).  "Fun" when your machine type evolves.

Poorly designed from the start, and then commit 61de36761b5 blew its
chance to fix it.

>         If they're passed in a non-NULL string then they use
> it as-is, whether it's unique in the system or not. We then
> typically wrap qbus_create() in a bus-specific creation function
> (examples are scsi_bus_new(), ide_bus_new(), i2c_init_bus()).
> Mostly those creation functions also take a 'name' argument and
> pass it through. ide_bus_new() is an interesting exception which
> does not take a name argument.
>
> The easy-to-misuse part is that now we have a set of functions
> that look like you should pass them in a name (and where there's
> plenty of code in the codebase that passes in a name) but where
> that's the wrong thing unless you're a board model and are
> picking a guaranteed unique name, or you're an odd special case
> like virtio-scsi. (virtio-scsi is the one caller of scsi_bus_new()
> that passes in something other than NULL.) In particular for
> code which is implementing a device that is a whatever-controller,
> creating a whatever-bus and specifying a name is almost always
> going to be wrong, because as soon as some machine creates two
> of these whatever-controllers it has non-unique bus names.

Yes.

> It looks like IDE buses are OK because ide_bus_new() takes no
> name argument, and SCSI buses are OK because the callers
> correctly pass in NULL, but almost all the "minor" buses
> (SD, I2C, ipack, aux...) have a lot of incorrect naming of
> buses in controller models.
>
> I'm not sure how best to sort this tangle out. We could:
>  * make controller devices pass in NULL as bus name; this
>    means that some bus names will change, which is an annoying
>    breakage but for these minor bus types we can probably
>    get away with it. This brings these buses into line with
>    how we've been handling uniqueness for ide and scsi.

To gauge the breakage, we need a list of the affected bus names.

>  * drop the 'name' argument for buses like ide that don't
>    actually have any callsites that need to pass a name
>  * split into foo_bus_new() and foo_bus_new_named() so that
>    the "easy default" doesn't pass a name, and there's at least
>    a place to put a doc comment explaining that the name passed
>    into the _named() version should be unique ??

Yes, please.

A bus name setter would be even more discouraging, but is no good,
because it can't undo the side effect on the bus type's counter.

Omitting foo_bus_new_named() when there is no user feels okay to me.

>  * something else ?
>
> thanks
> -- PMM


