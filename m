Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F1F36D180
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 07:05:00 +0200 (CEST)
Received: from localhost ([::1]:50644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbcNf-0004CY-DM
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 01:04:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbcMS-0003m3-57
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:03:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lbcMO-0000kA-7b
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 01:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619586217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QuMkR+uAOZHggHt3loCe7zo1l3Wo2MSLhQp3IqWCpjA=;
 b=Mj37zo21xiDYYO6noXNfuOzq/97tXaNv/JyK82fQYjhhnbEcCVrqiSNvh+SLTs0wa9hcgn
 hAfy4CftJYiF3PIIYfuAi8gEAxSjcLoOKwpj3cDxi9/XTgUI+DTm/6rpZ4LsEoIIuUAwRa
 JnuWfpDNf9ODRgLU9kLydss8gYY4yF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-GHDCz16PN5OB2L0imQcklQ-1; Wed, 28 Apr 2021 01:03:35 -0400
X-MC-Unique: GHDCz16PN5OB2L0imQcklQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E7D3107ACE6;
 Wed, 28 Apr 2021 05:03:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92F5A6A051;
 Wed, 28 Apr 2021 05:03:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0614B113525D; Wed, 28 Apr 2021 07:03:30 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v8 08/11] hw/core: deprecate old reset functions and
 introduce new ones
References: <20200123132823.1117486-1-damien.hedde@greensocs.com>
 <20200123132823.1117486-9-damien.hedde@greensocs.com>
 <9fb8a6ed-137b-7269-91f1-69c11c6d876a@redhat.com>
 <20210427212707.3tckau5r3kraciam@habkost.net>
Date: Wed, 28 Apr 2021 07:03:30 +0200
In-Reply-To: <20210427212707.3tckau5r3kraciam@habkost.net> (Eduardo Habkost's
 message of "Tue, 27 Apr 2021 17:27:07 -0400")
Message-ID: <87lf93q9ul.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 Luc Michel <luc@lmichel.fr>, cohuck@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, edgari@xilinx.com, pbonzini@redhat.com,
 berrange@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> On Tue, Apr 27, 2021 at 02:21:28PM +0200, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> On 1/23/20 2:28 PM, Damien Hedde wrote:
>> > Deprecate device_legacy_reset(), qdev_reset_all() and
>> > qbus_reset_all() to be replaced by new functions
>> > device_cold_reset() and bus_cold_reset() which uses resettable API.
>> >=20
>> > Also introduce resettable_cold_reset_fn() which may be used as a
>> > replacement for qdev_reset_all_fn and qbus_reset_all_fn().
>> >=20
>> > Following patches will be needed to look at legacy reset call sites
>> > and switch to resettable api. The legacy functions will be removed
>> > when unused.
>> >=20
>> > Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
>> > Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> > Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> > ---
>> >  include/hw/qdev-core.h  | 27 +++++++++++++++++++++++++++
>> >  include/hw/resettable.h |  9 +++++++++
>> >  hw/core/bus.c           |  5 +++++
>> >  hw/core/qdev.c          |  5 +++++
>> >  hw/core/resettable.c    |  5 +++++
>> >  5 files changed, 51 insertions(+)
>> >=20
>> > diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
>> > index 1b4b420617..b84fcc32bf 100644
>> > --- a/include/hw/qdev-core.h
>> > +++ b/include/hw/qdev-core.h
>> > @@ -406,6 +406,13 @@ int qdev_walk_children(DeviceState *dev,
>> >                         qdev_walkerfn *post_devfn, qbus_walkerfn *post=
_busfn,
>> >                         void *opaque);
>> > =20
>> > +/**
>> > + * @qdev_reset_all:
>> > + * Reset @dev. See @qbus_reset_all() for more details.
>> > + *
>> > + * Note: This function is deprecated and will be removed when it beco=
mes unused.
>> > + * Please use device_cold_reset() now.
>> > + */
>> >  void qdev_reset_all(DeviceState *dev);
>> >  void qdev_reset_all_fn(void *opaque);
>> > =20
>> > @@ -418,10 +425,28 @@ void qdev_reset_all_fn(void *opaque);
>> >   * hard reset means that qbus_reset_all will reset all state of the d=
evice.
>> >   * For PCI devices, for example, this will include the base address r=
egisters
>> >   * or configuration space.
>> > + *
>> > + * Note: This function is deprecated and will be removed when it beco=
mes unused.
>> > + * Please use bus_cold_reset() now.
>>=20
>> Some time passed, so looking at this with some retrospective.
>>=20
>> If there is an effort to introduce a new API replacing another one,
>> we should try convert all the uses of the old API to the new one,
>> instead of declaring it legacy.
>>=20
>> Declare an API legacy/deprecated should be the last resort if there
>> is no way to remove it. I'd recommend to move the deprecated/legacy
>> declarations in a separate header, with the '_legacy' suffix.
>>=20
>> Else:
>>=20
>> 1/ we never finish API conversions,
>> 2/ the new API might not be ready for all the legacy API use cases,
>> 3/ we end up having to maintain 2 different APIs.
>>=20
>>=20
>> So the recommendation is to use bus_cold_reset(), but it isn't
>> used anywhere...:
>>=20
>> $ git grep bus_cold_reset
>> docs/devel/reset.rst:64:- ``bus_cold_reset()``
>> hw/core/bus.c:73:void bus_cold_reset(BusState *bus)
>> include/hw/qdev-core.h:715: * Please use bus_cold_reset() now.
>> include/hw/qdev-core.h:728: * bus_cold_reset:
>> include/hw/qdev-core.h:733:void bus_cold_reset(BusState *bus);
>>=20
>> IMHO we shouldn't add new public prototypes without callers.
>
> I agree.  We should make at least some effort to convert code to
> the new API, if only to serve as reference for people doing the
> conversion.  I'm surprised that a new function was added more
> than a year ago and nobody is using it.
>
> What happened here?  Was there some plan to convert existing code
> but it was abandoned?

Commit abb89dbf2 introduced bus_cold_reset() and device_cold_reset().
It was posted as part of "[PATCH v8 00/11] Multi-phase reset mechanism".
The series did not add any users.  The cover letter explains:

    The purpose of this series is to split the current reset procedure
    into multiple phases. This will help to solve some ordering
    difficulties we have during reset.

    This is a ready to merge version. I've taken the few remarks of
    Philippe about v7 in account. Thanks to him for all the tests he did.

    This series adds resettable interface and transitions base Device and
    Bus classes (sysbus subclasses are ok too). It provides new reset
    functions but does not switch anymore the old functions
    (device_reset() and qdev/qbus_reset_all()) to resettable interface.
    These functions keep the exact same behavior as before.

    The series also transition the main reset handlers registration which
    has no impact until devices and buses are transitioned.

    The series is organized as follows:
    Patch 1 prepare the reset transition. Patch 2 adds some utility trace
    events. Patches 3 to 8 adds resettable api in devices and buses. Patch
    9 adds some documentation. Patches 10 and 11 transition the call sites
    of qemu_register_reset(qdev/qbus_reset_all_fn, ...).

    After this series, the plan is then to transition devices, buses and
    legacy reset call sites. Devices and buses have to be transitioned
    from mother class to daughter classes order but until the final
    (daughter) class is transitioned, old monolitic reset behavior will
    be kept for this class.

bus_cold_reset() has never seen any use.

The only transitioning to device_cold_reset() I can find is Peter
Maydell's

    781c67ca55 cpu: Use DeviceClass reset instead of a special CPUClass res=
et

Then there's a QOMification series that uses device_cold_reset()
temporarily, also by Peter:

    4bebb9ad4e hw/arm/stellaris: Convert SSYS to QOM device
    14711b6f54 hw/arm/stellaris: Remove board-creation reset of STELLARIS_S=
YS

Finally, Bin Meng, Philippe Mathieu-Daud=C3=A9, and Luc Michel added new co=
de
using it:

    c696e1f2b3 hw/sd: Add Cadence SDHCI emulation
    65ad1da23e hw/misc/mps2-fpgaio: Use the LED device
    435db7ebf5 hw/misc/mps2-scc: Use the LED device
    1e986e25d0 hw/misc/bcm2835_cprman: add a PLL skeleton implementation
    09d56bbc9b hw/misc/bcm2835_cprman: add a PLL channel skeleton implement=
ation
    7281362484 hw/misc/bcm2835_cprman: add a clock mux skeleton implementat=
ion
    502960ca04 hw/misc/bcm2835_cprman: add the DSI0HSCK multiplexer

>> I see it is similar to device_cold_reset(), but TBH I'm scared
>> to be the first one using it.

For what it's worth, Damien further explained the two helpers in
docs/devel/reset.rst:

    For Devices and Buses, the following helper functions exist:

    - ``device_cold_reset()``
    - ``bus_cold_reset()``

    These are simple wrappers around resettable_reset() function; they only=
 cast the
    Device or Bus into an Object and pass the cold reset type. When possibl=
e
    prefer to use these functions instead of ``resettable_reset()``.

I figure what's missing is guidance on how to transition code from
legacy reset to multi-phase reset.  Ideally with a working example
people can study.  Damien, can you help us out?


