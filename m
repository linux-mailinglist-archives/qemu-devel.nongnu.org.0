Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E98361F3E4
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Nov 2022 14:03:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1os1ky-0004bQ-Ka; Mon, 07 Nov 2022 08:01:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1kN-0004Pp-7L
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:01:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1os1kG-0001xW-K2
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 08:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667826048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+W8yWMpqwOfxNe8dg86+JAu0XDqbr8gf56bgcoz02E=;
 b=XS6U8/sQn/uRsCuaIyFfPuZ67KH7I1DYrDA22cBQY8diDNU8vxWnVKrvZLuyNXRybGNu98
 VZZ778+V5PGDon9Hr+KwkQZwN/jfg7Zl6/xeTk7TnTcX6AVxYiNbUWZ5dGgx9GjLnleuc9
 +9bPmF/zhdZaJsgB420uttYNQEh1W1s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-639-YPSxULo2PaOtxGc_YA41Gg-1; Mon, 07 Nov 2022 08:00:42 -0500
X-MC-Unique: YPSxULo2PaOtxGc_YA41Gg-1
Received: by mail-wr1-f69.google.com with SMTP id
 l16-20020adfc790000000b00230c2505f96so2715690wrg.4
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 05:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V+W8yWMpqwOfxNe8dg86+JAu0XDqbr8gf56bgcoz02E=;
 b=VzeSNiYds4UbvqamrUQ7ExR57dspMi68M6mtd+ZyHWuWqn5LeZvggUoCU1kkoU8PDs
 CyfmDXBzJoZ4bPdOJDdEiSxmh+BX6QgL5Ld4MkLOUjXL/XOmzpZRsENCDDR62FSaPeLu
 vBU0XaWDNxeeGtSi3vFNDyJFqAp7bPPxm/AYK/V6UsJPxiej9sHrQoMjTmpv2qB1pHMt
 M/6vdOycKQoCkws+X8WiFFpxSWrmvdmp5TXVKPxr/u0Ssav7oEBlerTxqhChnqT0v335
 n5MwD/ouIujubXBswJ3aE7Xq9AhybH1dGXhWWPvvjYauVBkr02PdSgZg5XpCrJGWgntf
 1TRQ==
X-Gm-Message-State: ACrzQf3wVVJYLKOanyPLfeiNA0oEMv2YgP7jfSsZFYesogYWe/OPlgNg
 5FINN+eQ4vUlXfVm+IVtbZJu8Jn2eGJpBf0+92TC7HtgTD+5Arziz5dbQPrRjjh/yZ8R7sBC80s
 J4MwB2fh6dc4xuWM=
X-Received: by 2002:adf:d1c2:0:b0:236:9033:8ead with SMTP id
 b2-20020adfd1c2000000b0023690338eadmr32609353wrd.653.1667826041270; 
 Mon, 07 Nov 2022 05:00:41 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6OvTUqirkiODqAJPG1K9qANes2oFjZD5s9D99apyNTaV9k+jLMyn1G56qCoVon03SPDZ9vow==
X-Received: by 2002:adf:d1c2:0:b0:236:9033:8ead with SMTP id
 b2-20020adfd1c2000000b0023690338eadmr32609325wrd.653.1667826040962; 
 Mon, 07 Nov 2022 05:00:40 -0800 (PST)
Received: from redhat.com ([169.150.226.212]) by smtp.gmail.com with ESMTPSA id
 j13-20020a05600c190d00b003b47e8a5d22sm12685062wmq.23.2022.11.07.05.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 05:00:40 -0800 (PST)
Date: Mon, 7 Nov 2022 08:00:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ani Sinha <ani@anisinha.ca>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PULL v3 49/81] acpi: pc: vga: use AcpiDevAmlIf interface to
 build VGA device descriptors
Message-ID: <20221107080023-mutt-send-email-mst@kernel.org>
References: <20221105171116.432921-1-mst@redhat.com>
 <20221105171116.432921-50-mst@redhat.com>
 <CAG4p6K6ZgVmKAfRoaaD99RqtEjU0+qwUncb2=n+8GhNAezgKjg@mail.gmail.com>
 <20221107073158-mutt-send-email-mst@kernel.org>
 <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAARzgwwEayuzcrcSWRmK5UBG56R1SbfHJ0XoV9=T91=wqLMSAg@mail.gmail.com>
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

On Mon, Nov 07, 2022 at 06:16:25PM +0530, Ani Sinha wrote:
> On Mon, Nov 7, 2022 at 6:03 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Sun, Nov 06, 2022 at 10:16:41PM +0100, Bernhard Beschow wrote:
> > >
> > >
> > > On Sat, Nov 5, 2022 at 6:45 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > >     From: Igor Mammedov <imammedo@redhat.com>
> > >
> > >     Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > >     Message-Id: <20221017102146.2254096-2-imammedo@redhat.com>
> > >     Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > >     Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > >     NB: we do not expect any functional change in
> > >     any ACPI tables with this change. It's only a refactoring.
> > >
> > >     Reviewed-by: Ani Sinha <ani@anisinha.ca>
> > >     ---
> > >      hw/display/vga_int.h       |  2 ++
> > >      hw/display/acpi-vga-stub.c |  7 +++++++
> > >      hw/display/acpi-vga.c      | 26 ++++++++++++++++++++++++++
> > >      hw/display/vga-pci.c       |  4 ++++
> > >      hw/i386/acpi-build.c       | 26 +-------------------------
> > >      hw/display/meson.build     | 17 +++++++++++++++++
> > >      6 files changed, 57 insertions(+), 25 deletions(-)
> > >      create mode 100644 hw/display/acpi-vga-stub.c
> > >      create mode 100644 hw/display/acpi-vga.c
> > >
> > >
> > > With this "qemu:qtest+qtest-hppa / qtest-hppa/display-vga-test" fails due to
> > > the symbol "aml_return" being undefined:
> > >
> > > # starting QEMU: exec ./qemu-system-hppa -qtest unix:/tmp/qtest-515650.sock
> > > -qtest-log /dev/null -chardev socket,path=/tmp/qtest-515650.qmp,id=char0 -mon
> > > chardev=char0,mode=control -display none -vga none -device virtio-vga -accel
> > > qtest
> > > ----------------------------------- stderr -----------------------------------
> > > Failed to open module: qemu/build/qemu-bundle/usr/lib/qemu/
> > > hw-display-virtio-vga.so: undefined symbol: aml_return
> > > qemu-system-hppa: -device virtio-vga: 'virtio-vga' is not a valid device model
> > > name
> > > Broken pipe
> > > ../src/tests/qtest/libqtest.c:179: kill_qemu() tried to terminate QEMU process
> > > but encountered exit status 1 (expected 0)
> > >
> > > (test program exited with status code -6)
> > >
> > > Best regards,
> > > Bernhard
> >
> > It's unfortunate that it doesn't reproduce for me :(
> 
> To reproduce:
> 
> - docker pull registry.gitlab.com/qemu-project/qemu/qemu/centos8:latest
> - configure line:
> 
> ../configure --enable-werror --disable-docs --disable-nettle
> --enable-gcrypt --enable-fdt=system --enable-modules
> --enable-trace-backends=dtrace --enable-docs --enable-vfio-user-server
> --target-list="ppc64-softmmu or1k-softmmu s390x-softmmu x86_64-softmmu
> rx-softmmu sh4-softmmu nios2-softmmu"


I suspect --enable-modules is the difference.

> - # make
> - # QTEST_QEMU_BINARY=./qemu-system-or1k  ./tests/qtest/qos-test
> failed to open module:
> /build/qemu/qemu/build/qemu-bundle/usr/local/lib64/qemu/hw-display-virtio-vga.so:
> undefined symbol: aml_return
> qemu-system-or1k: ../util/error.c:59: error_setv: Assertion `*errp ==
> NULL' failed.
> Broken pipe
> ../tests/qtest/libqtest.c:188: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> Aborted (core dumped)


