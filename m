Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B46B620246
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 23:30:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osAc0-00013r-0z; Mon, 07 Nov 2022 17:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAbi-000128-Cb
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:28:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osAbg-0000Xc-K8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:28:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667860119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9VRpzFEU5XK+jAB3tYaV1lwkLSFNBCs/+Mdr64T2gAE=;
 b=Rg5gs4dl/PmSB5oEVtPASBkMJ1qynvZcHegLkyw6F+W61CL/9zvHDWG05+EGfYZjFRnGbB
 OxPexFgC8yGcxl8Uxqp6gO6UiTY32/xrNMbhxT+lPFOp8iZMZSimdWJDzARcYCoibUsq1W
 D07bR2fmWv+Hw+P4Idm0LbWSmDyhXTo=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-IM70ABr9MguGREZkY-P0UQ-1; Mon, 07 Nov 2022 17:28:38 -0500
X-MC-Unique: IM70ABr9MguGREZkY-P0UQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 c19-20020a05622a059300b003a51d69906eso8992233qtb.1
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:28:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9VRpzFEU5XK+jAB3tYaV1lwkLSFNBCs/+Mdr64T2gAE=;
 b=aRhZqc9KOB6udSoJGu6NjeIw1B2ft3YZrHWTEKZLUp3dd/aq3k73kQVCQcVw3nu0/m
 v/q3AmwLhLuN5EeS6dTDewyPKBDNsBcBefARlNrPakRg2KL5ysEhZwaPAPghQ1UZsH8b
 Ov9v+Hh4Fkev3jQdACAkHk22O3mYppXRv1XIFrgqcsqIBTZnK5te+rdeYaIJZLQl8tT6
 fR3gAvb4xIxWOVv2TMlzdSBdpEm75D1XaDeBT/byUBk1f/yfXJrtSzFyJmjb+hVFaHAR
 m6tfo+SlMvo1OEbK1yyBfY2zXqExumLgC6JZvTG2KV3DOk1JeVGipHa9IaoKdGT7tM49
 TVXg==
X-Gm-Message-State: ACrzQf0kedwImkwqJoonmy2jqeSpx4m5RdfDTPolVIQyRwXe+z+PrE42
 kNqihlPCwFihUFO5mC94Rj0ketVqdmu3Lw09HucHJ204vBxKw3p7SxMgLR9a9PClrLrGllbT44U
 J19fdWaLzM49Q9/E=
X-Received: by 2002:a05:6214:2aa6:b0:4bb:b2e9:4f1c with SMTP id
 js6-20020a0562142aa600b004bbb2e94f1cmr46469683qvb.29.1667860117805; 
 Mon, 07 Nov 2022 14:28:37 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6qUpXk4Wn/dBSkIPHXTJTR0+mGqCKRyLYSSH1RqDea3I7kMZyOZZg0YEaNW0CMwzJfKuqwiw==
X-Received: by 2002:a05:6214:2aa6:b0:4bb:b2e9:4f1c with SMTP id
 js6-20020a0562142aa600b004bbb2e94f1cmr46469670qvb.29.1667860117533; 
 Mon, 07 Nov 2022 14:28:37 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 c24-20020a05620a269800b006bba46e5eeasm7816996qkp.37.2022.11.07.14.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:28:37 -0800 (PST)
Date: Mon, 7 Nov 2022 17:28:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Message-ID: <20221107172548-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <20221107073158-mutt-send-email-mst@kernel.org>
 <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
 <20221107080023-mutt-send-email-mst@kernel.org>
 <489F21DE-0D51-4559-8067-2C096A2DC828@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <489F21DE-0D51-4559-8067-2C096A2DC828@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

On Mon, Nov 07, 2022 at 10:07:52PM +0000, Bernhard Beschow wrote:
> Am 7. November 2022 13:00:36 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >On Mon, Nov 07, 2022 at 06:16:25PM +0530, Ani Sinha wrote:
> >> On Mon, Nov 7, 2022 at 6:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >> >
> >> > On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
> >> > >
> >> > >
> >> > > On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >> > >
> >> > >     From: Igor Mammedov <imammedo@redhat.com>
> >> > >
> >> > >     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >> > >     Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> >> > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >> > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> >> > >     NB: we do not expect any functional change in
> >> > >     any ACPI tables with this change. It's only a refactoring.
> >> > >
> >> > >     Reviewed-by: Ani Sinha <ani@anisinha.ca>
> >> > >     ---
> >> > >      hw/display/vga_int.h       |  2 ++
> >> > >      hw/display/acpi-vga-stub.c |  7 +++++++
> >> > >      hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
> >> > >      hw/display/vga-pci.c       |  4 ++++
> >> > >      hw/i386/acpi-build.c       | 26 +-------------------------
> >> > >      hw/display/meson.build     | 17 +++++++++++++++++
> >> > >      6 files changed, 57 insertions(+), 25 deletions(-)
> >> > >      create mode 100644 hw/display/acpi-vga-stub.c
> >> > >      create mode 100644 hw/display/acpi-vga.c
> >> > >
> >> > >
> >> > > With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails due to
> >> > > the symbol "aml_return" being undefined:
> >> > >
> >> > > # starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.sock
> >> > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-515650.qmp,id=char0 -mon
> >> > > chardev=char0,mode=control -display none -vga none -device virtio-vga -accel
> >> > > qtest
> >> > > ----------------------------------- stderr -----------------------------------
> >> > > Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
> >> > > hw-display-virtio-vga.so: undefined symbol: aml_return
> >> > > qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device model
> >> > > name
> >> > > Broken pipe
> >> > > ../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
> >> > > but encountered exit status 1 (expected 0)
> >> > >
> >> > > (test program exited with status code -6)
> >> > >
> >> > > Best regards,
> >> > > Bernhard
> >> >
> >> > It's unfortunate that it doesn't reproduce for me :(
> >> 
> >> To reproduce:
> >> 
> >> - docker pull registry.gitlab.com/qemu-project/qemu/qemu/centos8:latest
> >> - configure line:
> >> 
> >> ../configure --enable-werror --disable-docs --disable-nettle
> >> --enable-gcrypt --enable-fdt=system --enable-modules
> >> --enable-trace-backends=dtrace --enable-docs --enable-vfio-user-server
> >> --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
> >> rx-softmmu sh4-softmmu nios2-softmmu"
> >
> >
> >I suspect --enable-modules is the difference.
> 
> Indeed, I'm building with --enable-modules and got the undefined symbol.
> 
> Perhaps we could use the -Wl,--no-undefined linker option when building with modules to catch these errors at link time already?
> 
> Best regards,
> Bernhard

I don't see how it can work but sure, send a patch :)

> >
> >> - # make
> >> - # QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
> >> failed to open module:
> >> /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> >> undefined symbol: aml_return
> >> qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> >> NULL' failed.
> >> Broken pipe
> >> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> >> signal 6 (Aborted) (core dumped)
> >> Aborted (core dumped)
> >


