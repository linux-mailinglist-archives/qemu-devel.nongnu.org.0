Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5F3F89D9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 16:11:40 +0200 (CEST)
Received: from localhost ([::1]:54634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJG6V-0001w1-RP
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 10:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJG3u-0006zi-Kw
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJG3r-0007G8-Jn
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 10:08:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629986933;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Sa9bp0rr13S0+Vqsqj0cw3azK3U5/YZ4AVB88HoOCOQ=;
 b=DEAA/46lbeEGpQxM4RAiQ4vsj+ijKe6VYWZjO4sqabaoG8zNXd2nLNQiDDf7BpO6yqLXKI
 W9GqHz9ElG7xNVqvsr+UuzgLvVvBDJ29zcPfV16nGRpHRSBem6G5p0wv12CcAr7506bWrW
 jHi3yzZx2aNGDQbkTeyq6Og6WgmaPVk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-DDpo9m6aNPuVJsRpz0bu9A-1; Thu, 26 Aug 2021 10:08:51 -0400
X-MC-Unique: DDpo9m6aNPuVJsRpz0bu9A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5C8A87D548;
 Thu, 26 Aug 2021 14:08:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FA0F100238C;
 Thu, 26 Aug 2021 14:08:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E8E1D11380A9; Thu, 26 Aug 2021 16:08:48 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: ensuring a machine's buses have unique names
References: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
Date: Thu, 26 Aug 2021 16:08:48 +0200
In-Reply-To: <CAFEAcA8Q2XEANtKfk_Ak2GgeM8b_=kf_qduLztCuL=E_k36FWg@mail.gmail.com>
 (Peter Maydell's message of "Thu, 12 Aug 2021 12:05:36 +0100")
Message-ID: <87czq0l2mn.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> What's the right way to ensure that when a machine has multiple
> buses of the same type (eg multiple i2c controllers, multiple
> sd card controllers) they all get assigned unique names so that
> the user can use '-device ...,bus=some-name' to put a device on a
> specific bus?
>
> For instance in hw/arm/xlnx-zynqmp.c, the SoC object creates
> a set of alias properties on the SoC for the sd-bus buses that
> its 4 SD card controllers create. The alias properties are named
> "sd-bus%d" so they are unique. This works, but it's kind of error-prone
> because you need each machine model to remember to create these
> aliases when necessary.
>
> mps3-an524 is an example of a machine that fails to do this
> for its i2c buses, and therefore the user can't usefully
> tell QEMU which bus to plug a command-line created i2c bus into.

Another one used to be isapc.  It's not anymore.  I believe it's due to

commit 61de36761b565a4138d8ad7ec75489ab28fe84b6
Author: Alexander Graf <agraf@csgraf.de>
Date:   Thu Feb 6 16:08:15 2014 +0100

    qdev: Keep global allocation counter per bus
    
    When we have 2 separate qdev devices that both create a qbus of the
    same type without specifying a bus name or device name, we end up
    with two buses of the same name, such as ide.0 on the Mac machines:
    
      dev: macio-ide, id ""
        bus: ide.0
          type IDE
      dev: macio-ide, id ""
        bus: ide.0
          type IDE
    
    If we now spawn a device that connects to a ide.0 the last created
    bus gets the device, with the first created bus inaccessible to the
    command line.
    
    After some discussion on IRC we concluded that the best quick fix way
    forward for this is to make automated bus-class type based allocation
    count a global counter. That's what this patch implements. With this
    we instead get
    
      dev: macio-ide, id ""
        bus: ide.1
          type IDE
      dev: macio-ide, id ""
        bus: ide.0
          type IDE
    
    on the example mentioned above.
    
    This also means that if you did -device ...,bus=ide.0 you got a device
    on the first bus (the last created one) before this patch and get that
    device on the second one (the first created one) now.  Breaks
    migration unless you change bus=ide.0 to bus=ide.1 on the destination.
    
    This is intended and makes the bus enumeration work as expected.
    
    As per review request follows a list of otherwise affected boards and
    the reasoning for the conclusion that they are ok:
    
       target      machine         bus id              times
       ------      -------         ------              -----
    
       aarch64     n800            i2c-bus.0           2
       aarch64     n810            i2c-bus.0           2
       arm         n800            i2c-bus.0           2
       arm         n810            i2c-bus.0           2
    
    -> Devices are only created explicitly on one of the two buses, using
       s->mpu->i2c[0], so no change to the guest.
    
       aarch64     vexpress-a15    virtio-mmio-bus.0   4
       aarch64     vexpress-a9     virtio-mmio-bus.0   4
       aarch64     virt            virtio-mmio-bus.0   32
       arm         vexpress-a15    virtio-mmio-bus.0   4
       arm         vexpress-a9     virtio-mmio-bus.0   4
       arm         virt            virtio-mmio-bus.0   32
    
    -> Makes -device bus= work for all virtio-mmio buses.  Breaks
       migration.  Workaround for migration from old to new: specify
       virtio-mmio-bus.4 or .32 respectively rather than .0 on the
       destination.
    
       aarch64     xilinx-zynq-a9  usb-bus.0           2
       arm         xilinx-zynq-a9  usb-bus.0           2
       mips64el    fulong2e        usb-bus.0           2
    
    -> Normal USB operation not affected. Migration driver needs command
       line to use the other bus.
    
       i386        isapc           ide.0               2
       x86_64      isapc           ide.0               2
       mips        mips            ide.0               2
       mips64      mips            ide.0               2
       mips64el    mips            ide.0               2
       mipsel      mips            ide.0               2
       ppc         g3beige         ide.0               2
       ppc         mac99           ide.0               2
       ppc         prep            ide.0               2
       ppc64       g3beige         ide.0               2
       ppc64       mac99           ide.0               2
       ppc64       prep            ide.0               2
    
    -> Makes -device bus= work for all IDE buses.  Breaks migration.
       Workaround for migration from old to new: specify ide.1 rather than
       ide.0 on the destination.
    
    Signed-off-by: Alexander Graf <agraf@suse.de>
    Signed-off-by: Markus Armbruster <armbru@redhat.com>
    Reviewed-by: Andreas Faerber <afaerber@suse.de>
    Signed-off-by: Alexander Graf <agraf@suse.de>

Note that the automatic bus numbers depend on the order in which board
code creates devices.  Too implicit and fragile for my taste.  But it's
been working well enough.

> Ideally we should make buses get unique names by default
> and also assert() at startup that there aren't any duplicated
> names, I think.
>
> Side note: is there a way to mark a bus as "do not consider
> this when plugging devices where the user did not specify
> the bus themselves" ? Some of the i2c buses on that machine
> are purely internal to the board (eg there's one that has
> the touchscreen controller hanging off it and nothing else),
> and some are "this i2c bus is connected to the expansion port",
> so ideally if no bus is specified we would want to prefer
> the expansion-port i2c bus, not the ones that are internal-only.

I think the only existing way is to make qbus_is_full() return true.


