Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D703452A9
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 23:58:45 +0100 (CET)
Received: from localhost ([::1]:52698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOTVU-0005Zx-8y
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 18:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTTn-0004qE-Eu
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:56:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lOTTl-00083A-KE
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 18:56:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616453816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkOcaYkF+0Bpu7sYlShnJR74tz9VpAKjiLSAwFyo8YY=;
 b=UqYw1m/sekM9aiRUz531XrduZ3rYBtSU2aajKN6RCLeVnPoA6fkyzddn3LF1Vr2FrfgC0K
 F+4KeP0kOxp/bjJq3UasXbmhQR1XsxrNZKMu7sflHLlD0QX4wEVq9GWqF4ykEmLKAPQrmD
 CZfEnFPSySV7BeT9D3L8mamMvz2oLcs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-_5NfVV81NLy7wyQNhmjpfw-1; Mon, 22 Mar 2021 18:56:53 -0400
X-MC-Unique: _5NfVV81NLy7wyQNhmjpfw-1
Received: by mail-wr1-f70.google.com with SMTP id b6so135966wrq.22
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 15:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkOcaYkF+0Bpu7sYlShnJR74tz9VpAKjiLSAwFyo8YY=;
 b=B0TbQ29X/Kl4aM/lxJU51H5GghTKZDor+LMPejSqVSAK5TyRM/dgG3nwLw4owCMUaZ
 Hujjxknk188NqG3OT6yrjkLV0eBFUO7adnUQ0/MXnPGRL9T7L+SyhrWtcb+PoWdEdgcV
 BWaJVPlnmUBjcj4CpglVjHpU2YZsxH9wPYgbvjqcMNa6UH42lI/LlGCA9nH3L8lvdYw4
 hHgnJyQnVMMNRxykuiJ7XtgxHG8xr9Yt5tZNoknzmi3t5HeMwkbsKWbdx750I0pLp0Ud
 2ALWK4dDltESJfUvk9i1g3lrWRwXre4V07YwTdwM0cCqeABTpJ1Ek9ES9jQwDUFPBNsI
 23+g==
X-Gm-Message-State: AOAM531OVGvdIatuQ7RZ4SZ8OJYDzz0ndvTRm1/pjV72KtF/fMPGuFZV
 fA6Lt38RwObmABUBHgSNKtcID2hhdQqSsRVZOMMUaYx9PGYReJFUORllGP9icXpyBgh9grKbEjw
 TGwFg7Fmg+kTI8BY=
X-Received: by 2002:adf:e482:: with SMTP id i2mr799824wrm.392.1616453812466;
 Mon, 22 Mar 2021 15:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLd4ASeq4PGmHWR9vRTbaEyBobSIEgtgZ3pQJo9puoEo6WPhWtKRRaHrZOW96tInMdD4hr0Q==
X-Received: by 2002:adf:e482:: with SMTP id i2mr799818wrm.392.1616453812316;
 Mon, 22 Mar 2021 15:56:52 -0700 (PDT)
Received: from redhat.com ([2a10:800e:f0d3:0:b69b:9fb8:3947:5636])
 by smtp.gmail.com with ESMTPSA id a14sm22721872wrg.84.2021.03.22.15.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 15:56:51 -0700 (PDT)
Date: Mon, 22 Mar 2021 18:56:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 00/20] pc,virtio,pci: fixes, features
Message-ID: <20210322185502-mutt-send-email-mst@kernel.org>
References: <20210322154417.524229-1-mst@redhat.com>
 <CAFEAcA9xniNP73rbFLc_eUB2vi2N71vM2xKRMzqGWjXLEeLVag@mail.gmail.com>
 <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA81p5aDj9CzuihLchX3QQB27Z7Jd6cNF9uo-2rh7EXx=w@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Isaku Yamahata <isaku.yamahata@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 22, 2021 at 06:46:06PM +0000, Peter Maydell wrote:
> On Mon, 22 Mar 2021 at 16:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 22 Mar 2021 at 15:44, Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > The following changes since commit f0f20022a0c744930935fdb7020a8c18347d391a:
> > >
> > >   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-03-21' into staging (2021-03-22 10:05:45 +0000)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/virt/kvm/mst/qemu.git tags/for_upstream
> > >
> > > for you to fetch changes up to 5971d4a968d51a80daaad53ddaec2b285115af62:
> > >
> > >   acpi: Move setters/getters of oem fields to X86MachineState (2021-03-22 11:39:02 -0400)
> > >
> > > ----------------------------------------------------------------
> > > pc,virtio,pci: fixes, features
> > >
> > > Fixes all over the place.
> > > ACPI index support.
> > >
> > > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >
> >
> > This triggers a new clang runtime sanitizer warning:
> 
> With a backtrace:
> $ UBSAN_OPTIONS=print_stacktrace=1
> QTEST_QEMU_BINARY=build/clang/qemu-system-mips64el
> ./build/clang/tests/qtest/endianness-test -p
> /mips64el/endianness/fuloong2e
> /mips64el/endianness/fuloong2e: ../../hw/pci/pci.c:252:30: runtime
> error: shift exponent -1 is negative
>     #0 0x55a17bc17a1f in pci_irq_state
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/pci/pci.c:252:30
>     #1 0x55a17bc17a1f in pci_irq_handler
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/pci/pci.c:1453
>     #2 0x55a17b7ed0a5 in pm_update_sci
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/isa/vt82c686.c:147:5
>     #3 0x55a17b7ecce3 in via_pm_reset
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/isa/vt82c686.c:173:5
>     #4 0x55a17c546cc7 in resettable_phase_hold
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:182:13
>     #5 0x55a17c53839a in bus_reset_child_foreach
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/bus.c:97:13
>     #6 0x55a17c546bc2 in resettable_phase_hold
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
>     #7 0x55a17c5435ca in device_reset_child_foreach
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/qdev.c:366:9
>     #8 0x55a17c546bc2 in resettable_phase_hold
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
>     #9 0x55a17c53839a in bus_reset_child_foreach
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/bus.c:97:13
>     #10 0x55a17c546bc2 in resettable_phase_hold
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:173:5
>     #11 0x55a17c545ee0 in resettable_assert_reset
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:60:5
>     #12 0x55a17c545dbf in resettable_reset
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/resettable.c:45:5
>     #13 0x55a17c545d68 in qemu_devices_reset
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/reset.c:69:9
>     #14 0x55a17c47b3eb in qemu_system_reset
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/runstate.c:444:9
>     #15 0x55a17ba225ee in qdev_machine_creation_done
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../hw/core/machine.c:1279:5
>     #16 0x55a17c4bdb03 in qemu_machine_creation_done
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:2567:5
>     #17 0x55a17c4bdb03 in qmp_x_exit_preconfig
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:2590
>     #18 0x55a17c4c2c0b in qemu_init
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/vl.c:3611:9
>     #19 0x55a17b756db5 in main
> /home/petmay01/linaro/qemu-for-merges/build/clang/../../softmmu/main.c:49:5
>     #20 0x7f3a9c9f6bf6 in __libc_start_main
> /build/glibc-S9d2JN/glibc-2.27/csu/../csu/libc-start.c:310
>     #21 0x55a17b731969 in _start
> (/home/petmay01/linaro/qemu-for-merges/build/clang/qemu-system-mips64el+0x1140969)
> 
> OK
> 
> Suggests the relevant commit is
> "acpi:piix4, vt82c686: reinitialize acpi PM device on reset"

Yep, Cc'd the authors and dropped for now. Thanks!

> This happens because pm_update_sci() calls pci_irq_handler(),
> which calls pci_intx(pci_dev), which returns -1, which is not
> a valid interrupt number to call pci_irq_handler() with.
> 
> Q: given that pci_irq_handler() says it must only be called with
> an irqnum in [0..3], shouldn't pci_set_irq() be a bit more
> cautious than to pull a byte directly out of PCI_INTERRUPT_PIN
> and assume it's valid? (Is this guest-writable, or is it read-only?)

It's read-only.

> 
> thanks
> -- PMM


-- 
MST


