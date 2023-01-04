Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9065D08D
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 11:23:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0uH-0003SA-7c; Wed, 04 Jan 2023 05:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pD0uF-0003Pi-83
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:21:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1pD0uD-0008Ji-Lp
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 05:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672827716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RohMzZMiYL8kORlWeJ782P/VZf8kRwPjAClCNjDjQlo=;
 b=YuWr2q0ZCI9oWcvncBPHIXhsbsCBvwMIPGx+iMApQpBV2dIFCetlsKgwaKLRJ1F25pa0BO
 ZtPsca4vTjd90iiRruoedEwtQam/Ff1PoBx6Dt8FdxcE2IAvAStlo1v/gVGQFP/q/qPmBw
 gU2lNEhYb8WJGEhBV7D5zvCDxlCdCMU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-KtQ7NHzZNZiOEZki2xdCeQ-1; Wed, 04 Jan 2023 05:21:52 -0500
X-MC-Unique: KtQ7NHzZNZiOEZki2xdCeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 641D1183B3C0;
 Wed,  4 Jan 2023 10:21:52 +0000 (UTC)
Received: from [10.39.192.86] (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F3CCE40C2064;
 Wed,  4 Jan 2023 10:21:50 +0000 (UTC)
Message-ID: <d8db3dff-0339-e2ed-301e-54002cca0e83@redhat.com>
Date: Wed, 4 Jan 2023 11:21:49 +0100
MIME-Version: 1.0
Subject: Re: IO port write width clamping differs between TCG and KVM
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: "Ard Biesheuvel (kernel.org address)" <ardb@kernel.org>,
 qemu devel list <qemu-devel@nongnu.org>, Igor Mammedov
 <imammedo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Tsirkin <mtsirkin@redhat.com>
References: <aaedee84-d3ed-a4f9-21e7-d221a28d1683@redhat.com>
 <ea401dd3-53f1-b27c-4a5a-9085ce5ab051@redhat.com>
 <c03e353e-0d7b-6515-d7ac-1cb71e9cc7c9@redhat.com>
 <2048fd2c-0c85-bea5-3c0c-5223bedcc252@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
In-Reply-To: <2048fd2c-0c85-bea5-3c0c-5223bedcc252@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

(Adding Gerd.)

On 1/4/23 08:23, Philippe Mathieu-Daudé wrote:
> Hi Laszlo,
>
> Happy new year!

Happy new year! :) Sorry for not responding earlier, I was busy writing
& testing the patch.

[...]

>> However, what I *really* don't understand is why this commit
>> (5d971f9e672507210e77d020d89e0e89165c8fc9) makes a difference *only*
>> under TCG.

So this remains a mistery to me...

>
> Is it easily reproducible with TCG?

Yes and no.

If you have an OVMF binary built for the DEBUG or NOOPT target, then
it's nearly trivial:

qemu-system-i386 \
  -M accel=tcg \
  -smp 2 \
  -drive if=pflash,file=edk2-i386-code.fd,readonly=on \
  -drive if=pflash,file=edk2-i386-vars.fd,snapshot=on \
  -m 512 \
  -global isa-debugcon.iobase=0x402 \
  -debugcon file:/tmp/debug.log

Without the fix, you find near the top of "/tmp/debug.log":

  MaxCpuCountInitialization: QEMU v2.7 reset bug: BootCpuCount=2 Present=0
  MaxCpuCountInitialization: BootCpuCount=0 mMaxCpuCount=1

Note that here OVMF is led to believe that the system has 2 possible
CPUs, and *zero* enabled one :)

(Side comment: don't be confused by the "QEMU v2.7 reset bug" message.
That is a workaround in OVMF for a *different* QEMU bug. Unfortunately,
the workaround is unexpectedly triggered by *this* other QEMU bug as
well, but *opposite* to the intent.)

With the fix, you see, in the log:

  MaxCpuCountInitialization: BootCpuCount=2 mMaxCpuCount=2

Unfortunately, this simple reproducer does not work with the
QEMU-bundled binaries, because of commit ca26041500eb ("edk2: switch to
release builds", 2022-03-15). The switch to the RELEASE target indeed
speeds up the OVMF binaries, but it also eliminates all ASSERT()s and
DEBUG messages from the code. Therefore you'll get an empty
"/tmp/debug.log" with the above command.

Gerd, any particular reason for commit ca26041500eb? (The commit doesn't
say.)

I've found another small omission, namely in the same  patch series that
contains the above commit. While commit 3891a5996fee ("edk2: update
binaries to stable202202", 2022-03-15) updated the binaries, there was
no separate patch to refresh the accompanying text in "pc-bios/README".

For an earlier example, refer to 419236601eb2 ("pc-bios: update the
README file with edk2-stable202008 information", 2020-09-13).

Thus, at the moment, "pc-bios/README" is stale.

I'd recommend two things:

- restoring (or re-introducing, as separate binaries?) the DEBUG builds,

- refreshing "pc-bios/README".

Laszlo


