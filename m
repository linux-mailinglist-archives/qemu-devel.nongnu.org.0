Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EFE443E88
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:43:05 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBrL-0004z3-P5
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miBq5-0004B2-MG
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:41:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1miBpq-0001Eg-Ev
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:41:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635928889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ALar6u8c6+7Xy3lp5n4cQZcdDHdHnNDLPD2OHtxFXRs=;
 b=Obb0ixJVmr8GVH7dmSP14/JnyXGAoxfk9HRz5xhY8RlXRRjnulbOFPsGo4jiXy2BLRVWFR
 7wMg9+fne3QIC4dNb1Fi65PNnj+hCd9/uTilwXpeQmoOtOxSvrVz7JsZe7uS7lzH8GjfO4
 YwTGCkHIHq/jm3ZxgFaLa5gEAyQquIc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-600-_WjXLeK9M7yC_-3unf_caA-1; Wed, 03 Nov 2021 04:41:23 -0400
X-MC-Unique: _WjXLeK9M7yC_-3unf_caA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 127838066EF;
 Wed,  3 Nov 2021 08:41:22 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-7.ams2.redhat.com [10.36.112.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C0765D9D3;
 Wed,  3 Nov 2021 08:41:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F01C911380A7; Wed,  3 Nov 2021 09:41:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: does drive_get_next(IF_NONE) make sense?
References: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
Date: Wed, 03 Nov 2021 09:41:19 +0100
In-Reply-To: <CAFEAcA9zmPds0+jHm8VY465XEhK6bbVPd+nDob1ruRPaHOua_Q@mail.gmail.com>
 (Peter Maydell's message of "Tue, 2 Nov 2021 15:14:02 +0000")
Message-ID: <87r1bxzl5c.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Hao Wu <wuhaotsh@google.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Maydell <peter.maydell@linaro.org> writes:

> Does it make sense for a device/board to do drive_get_next(IF_NONE) ?

Short answer: hell, no!  ;)

Long answer below.

> At the moment we have exactly one user of this, which is
> hw/misc/sifive_u_otp.c. This is a model of a one-time-programmable
> fuse, and the drive is providing the backing store for the fuse
> contents. Borrowing an IF_NONE for this seems a bit odd, but
> it's not clear any of the other IF_ types is better.
>
> We also just (this release cycle) added models of the Xilinx
> efuse OTP fuses. Those have been implemented to use IF_PFLASH.
> (This is a somewhat unfortunate inconsistency I guess.)
>
> We also have a patchseries currently in the code review stage
> which uses IF_NONE:
> https://patchew.org/QEMU/20211101232346.1070813-1-wuhaotsh@google.com/20211101232346.1070813-6-wuhaotsh@google.com/
> Here we are trying to provide a drive as backing store for some
> EEPROMs that hang off the i2c buses on some npcm7xx boards.
>
> Are these uses of IF_NONE OK, or should we be doing something
> else (using IF_PFLASH, defining a new IF_*, ???)

Two questions, really: one, may boards IF_NONE for onboard devices, and
two, should new board code use drive_get_next().


drive_get_next() is basically a bad idea.  It returns the "next" block
backend of a certain interface type.  "Next" means bus=0,unit=N, where
subsequent calls count N up from zero, per interface type.

This lets you define unit numbers implicitly by execution order.  If the
order changes, or new calls appear "in the middle", unit numbers change.
ABI break.  Hard to spot in review.

Old hat: explicit is better than implicit.  Better use drive_get().
Even if that means you have to pass unit numbers around.


IF_NONE is *only* for use with -device.

Traditional -drive (before IF_NONE) does two things:

(1) Create a block backend device

(2) Request the board to create a block frontend device

    Which kind of device the board creates is up to the board.  Nothing
    but common decency stops a board from creating a floppy when asked
    for an IF_PFLASH.

When -device was invented, we needed a way to create just a block
backend.

A working (at the time), but obviously bad way was to use -drive to
create one the board ignores.

Improvement: invent an interface type all the boards ignore.  This is
IF_NONE.

Hindsight: we should have created a separate option instead of
overloading -drive.  Such an option now exists: -blockdev.

The difference between IF_NONE and the other interface types is more
than just convention: we actually detect when the board ignores a
request to create a block device, like this:

    $ qemu-system-x86_64 -S -drive if=mtd
    qemu-system-x86_64: -drive if=mtd: machine type does not support if=mtd,bus=0,unit=0

We don't do this for if=none, because those may still be used with
device_add:

    $ qemu-system-x86_64 -nodefaults -display none -S -drive if=none,id=mt -device virtio-scsi -monitor stdio
    QEMU 6.1.50 monitor - type 'help' for more information
    (qemu) device_add scsi-cd,drive=mt,id=cd0
    (qemu) info block
    mt: [not inserted]
        Attached to:      cd0
        Removable device: not locked, tray closed

Therefore, having the board use IF_NONE just like a traditional
interface type is *wrong*.

As I explained above, the board can use any traditional interface type.
If none of them matches, and common decency prevents use of a
non-matching one, invent a new one.  We could do IF_OTHER.


