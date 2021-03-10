Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F425333D92
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 14:24:25 +0100 (CET)
Received: from localhost ([::1]:33828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJyp6-0004mV-3Y
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 08:24:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJyiw-00026k-0N
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:18:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52477)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lJyit-0001LM-60
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 08:18:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615382278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aptCxkAEzZJ5m/wupd4/9tFNhMatcIFI1bCVGDXFqdM=;
 b=RVslItGdMtXsb05c/cI2awlY0w3BC+u4dVs9PNi6agBPkO2MavC8ahZsiBfd13LmXOSkx8
 HbEzEtCinxZiivvsFHSWALWATOO3Wc3ze+slSSxqsVDopJ2Sgw6nLXXOyjGEq+qsA4zVX/
 rvazeWHMA5KrgLm3F5tHKDuF6zo8GEU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-Jb3sCd8_N7yrgHOEl4I2rQ-1; Wed, 10 Mar 2021 08:17:54 -0500
X-MC-Unique: Jb3sCd8_N7yrgHOEl4I2rQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E5931005D45;
 Wed, 10 Mar 2021 13:17:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-83.phx2.redhat.com
 [10.3.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BADEC5C1A1;
 Wed, 10 Mar 2021 13:17:49 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2169E1132C12; Wed, 10 Mar 2021 14:17:48 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] usb: Un-deprecate -usbdevice (except for -usbdevice
 audio which gets removed)
References: <20210309165035.967853-1-thuth@redhat.com>
Date: Wed, 10 Mar 2021 14:17:48 +0100
In-Reply-To: <20210309165035.967853-1-thuth@redhat.com> (Thomas Huth's message
 of "Tue, 9 Mar 2021 17:50:35 +0100")
Message-ID: <87y2ev2lmr.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 qemu-devel@nongnu.org, Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Thomas Huth <thuth@redhat.com> writes:

> When trying to remove the -usbdevice option, there were complaints that
> "-usbdevice braille" is still a very useful shortcut for some people.

Pointer?  I missed it.

> Thus we never remove this option. Since it's not such a big burden to
> keep it around, and it's also convenient in the sense that you don't
> have to worry to enable a host controller explicitly with this option,
> we should remove it from he deprecation list again, and rather properly
> document the possible device for this option instead.
>
> However, there is one exception: "-usbdevice audio" should go away, since
> audio devices without "audiodev=..." parameter are also on the deprecation
> list and you cannot use "-usbdevice audio" with "audiodev".
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

To be frank, I don't like this.  At all.

-usbdevice comes with its own ad hoc mini-language, parsed by
usbdevice_create().  Syntax is DRIVER[:PARAMS], where PARAMS defaults to
"" and is parsed by an optional DRIVER-specific LegacyUSBFactory.

We already dropped multiple drivers: "host", "serial", "disk", "net"
(commit 99761176e, v2.12), and "bt" (commit 43d68d0a9, v5.0).

We've kept "audio" (dropped in this patch), "tablet", "mouse",
"keyboard", "braille", "ccid", and "wacom-tablet".  Only "mouse",
"tablet", "braille" are documented (fixed in this patch).

One more has crept in: "u2f-key" (commit bb014a810, v5.2).  It's buggy:

    $ qemu-system-x86_64 -S -usbdevice u2f-key
    qemu-system-x86_64: -usbdevice u2f-key: '-usbdevice' is deprecated, please use '-device usb-...' instead
    **
    ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
    Bail out! ERROR:../qom/object.c:508:object_initialize_with_type: assertion failed: (type->abstract == false)
    Aborted (core dumped)

Broken right in the commit that added the stuff.  The sugar never
worked, and should be taken out again.

Without a factory, "-usbdevice BAR" is sugar for

    -device BAZ -machine usb=on

"braille" is the only driver with a factory.  "-usbdevice braille" is
sugar for

  -device usb-braille,chardev=braille -chardev braille,id=braille
  -machine usb=on

It's buggy:

    $ qemu-system-x86_64 -S -usbdevice braille
    qemu-system-x86_64: -usbdevice braille: '-usbdevice' is deprecated, please use '-device usb-...' instead
[three seconds tick by...]
    Segmentation fault (core dumped)

It neglects to actually parse PARAMS:

    $ qemu-system-x86_64 -S -usbdevice braille:"I'm a Little Teapot"
    qemu-system-x86_64: -usbdevice braille:I'm a Little Teapot: '-usbdevice' is deprecated, please use '-device usb-...' instead
[three seconds tick by...]
    Segmentation fault (core dumped)

The whole machinery in support of optional PARAMS has long become
useless.

I fail to see why we could drop the sugar for serial, disk, net and host
devices, but not for the others.

The only one that has something approaching a leg to stand on is
braille.  Still, I fail to see why having to specify a backend is fine
for any number of other devices, but not for braille.

Does QEMU really need more ways to do the same things?  Underdocumented
and undertested ways.

Let's drop -usbdevice as planned.

If users need more time, we can extend the grace period.


