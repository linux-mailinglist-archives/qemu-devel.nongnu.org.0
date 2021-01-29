Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F24563086EE
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:17:07 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Oxn-00069b-2N
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5OwN-00054e-LK
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1l5OwK-0002uf-VV
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611908136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Le1c974EV5lf0TZoOdh+swW2cPXQowAnSWUpwRUymgk=;
 b=NjI+WPPBW3Hiw4SXQRb1ST9aB483SxItdtmx7wNkg4HnGFvX+0Qy1P6BGO8U2VFw0+ORv6
 7aLKoZIz2TlIiJW37RGIGcCVMLUr5tOukGfPXmQRrKOP9dA31N1bWeDmO9CORokCCwdroz
 mPERXsfuEtV/0pcVwT/7tDNRmNvtm7E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-ygnGwcRtMEC3ImOhTBSR8g-1; Fri, 29 Jan 2021 03:15:34 -0500
X-MC-Unique: ygnGwcRtMEC3ImOhTBSR8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCEEB81A2BD;
 Fri, 29 Jan 2021 08:15:31 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-113-224.ams2.redhat.com
 [10.36.113.224])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2745571C9F;
 Fri, 29 Jan 2021 08:15:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 8A3E6113865F; Fri, 29 Jan 2021 09:15:19 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 0/1] QOM type names and QAPI
Date: Fri, 29 Jan 2021 09:15:18 +0100
Message-Id: <20210129081519.3848145-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
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
Cc: peter.maydell@linaro.org, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 frederic.konrad@adacore.com, kraxel@redhat.com, edgar.iglesias@gmail.com,
 jcd@tribudubois.net, qemu-block@nongnu.org, quintela@redhat.com,
 andrew.smirnov@gmail.com, marcandre.lureau@redhat.com, atar4qemu@gmail.com,
 ehabkost@redhat.com, alistair@alistair23.me, dgilbert@redhat.com,
 chouteau@adacore.com, qemu-arm@nongnu.org, peter.chubb@nicta.com.au,
 jsnow@redhat.com, kwolf@redhat.com, berrange@redhat.com, mreitz@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPI has naming rules.  docs/devel/qapi-code-gen.txt:

    === Naming rules and reserved names ===

    All names must begin with a letter, and contain only ASCII letters,
    digits, hyphen, and underscore.  There are two exceptions: enum values
    may start with a digit, and names that are downstream extensions (see
    section Downstream extensions) start with underscore.

    [More on reserved names, upper vs. lower case, '-' vs. '_'...]

The generator enforces the rules.

Naming rules help in at least three ways:

1. They help with keeping names in interfaces consistent and
   predictable.

2. They make avoiding collisions with the users' names in the
   generator simpler.

3. They enable quote-less, evolvable syntax.

   For instance, keyval_parse() syntax consists of names, values, and
   special characters ',', '=', '.'

   Since names cannot contain special characters, there is no need for
   quoting[*].  Simple.

   Values are unrestricted, but only ',' is special there.  We quote
   it by doubling.

   Together, we get exactly the same quoting as in QemuOpts.  This is
   a feature.

   If we ever decice to extend key syntax, we have plenty of special
   characters to choose from.  This is also a feature.

   Both features rely on naming rules.

QOM has no naming rules whatsoever.  Actual names aren't nearly as bad
as they could be.  Still, there are plenty of "funny" names.  This
will become a problem when we

* Switch from QemuOpts to keyval_parse()

  QOM type names must not contain special characters, unless we
  introduce more quoting.  Which we shouldn't, because the value of
  special characters in names is negligible compared to the hassle of
  having to quote them.

* QAPIfy (the compile-time static parts of) QOM

  QOM type names become QAPI enum values.  They must conform to QAPI
  naming rules.

Adopting QAPI naming rules for QOM type names takes care of both.

Let's review the existing offenders.

1. We have a few type names containing ',', and one containing ' '.
   The former require QemuOpts / keyval quoting (double the comma),
   the latter requires shell quoting.  There is no excuse for making
   our users remember and do such crap.  PATCH 1 eliminates it.

2. We have some 550 type names containing '.'.  QAPI's naming rules
   could be relaxed to accept '.', but keyval_parse()'s can't.

   Aside: I wish keyval_parse() would use '/' instead of '.', but it's
   designed to be compatible to the block layer's existing use of
   dotted keys (shoehorned into QemuOpts).

3. We have six type names containing '+'.  Four of them also contain
   '.'.  Naming rules could be relaxed to accept '+'.  I'm not sure
   it's worthwhile.

4. We have 19 names starting with a digit.  Three of them also contain
   '.'.  Leading digit is okay as QAPI enum, not okay as
   keyval_parse() key fragment.  We can either rename these types, or
   make keyval_parse() a bit less strict.

Of the type names containing '.' or '+'[**], 293 are CPUs, 107 are
machines, and 150 are something else.  48 of them can be plugged with
-device, all s390x or spapr CPUs.

Can we get rid of '.'?

I figure we could keep old names as deprecated aliases if we care.
Perhaps just the ones that can be plugged with -device.


[*] Paolo's "[PATCH 04/25] keyval: accept escaped commas in implied
option" provides for comma-quoting.  I'm ignoring it here for brevity.
I assure you it doesn't weaken my argument.

[**] They are:
    603e_v1.1-powerpc-cpu
    603e_v1.1-powerpc64-cpu
    603e_v1.2-powerpc-cpu
    603e_v1.2-powerpc64-cpu
    603e_v1.3-powerpc-cpu
    603e_v1.3-powerpc64-cpu
    603e_v1.4-powerpc-cpu
    603e_v1.4-powerpc64-cpu
    603e_v2.2-powerpc-cpu
    603e_v2.2-powerpc64-cpu
    603e_v4.1-powerpc-cpu
    603e_v4.1-powerpc64-cpu
    604e_v1.0-powerpc-cpu
    604e_v1.0-powerpc64-cpu
    604e_v2.2-powerpc-cpu
    604e_v2.2-powerpc64-cpu
    604e_v2.4-powerpc-cpu
    604e_v2.4-powerpc64-cpu
    7400_v1.0-powerpc-cpu
    7400_v1.0-powerpc64-cpu
    7400_v1.1-powerpc-cpu
    7400_v1.1-powerpc64-cpu
    7400_v2.0-powerpc-cpu
    7400_v2.0-powerpc64-cpu
    7400_v2.1-powerpc-cpu
    7400_v2.1-powerpc64-cpu
    7400_v2.2-powerpc-cpu
    7400_v2.2-powerpc64-cpu
    7400_v2.6-powerpc-cpu
    7400_v2.6-powerpc64-cpu
    7400_v2.7-powerpc-cpu
    7400_v2.7-powerpc64-cpu
    7400_v2.8-powerpc-cpu
    7400_v2.8-powerpc64-cpu
    7400_v2.9-powerpc-cpu
    7400_v2.9-powerpc64-cpu
    740_v1.0-powerpc-cpu
    740_v1.0-powerpc64-cpu
    740_v2.0-powerpc-cpu
    740_v2.0-powerpc64-cpu
    740_v2.1-powerpc-cpu
    740_v2.1-powerpc64-cpu
    740_v2.2-powerpc-cpu
    740_v2.2-powerpc64-cpu
    740_v3.0-powerpc-cpu
    740_v3.0-powerpc64-cpu
    740_v3.1-powerpc-cpu
    740_v3.1-powerpc64-cpu
    7410_v1.0-powerpc-cpu
    7410_v1.0-powerpc64-cpu
    7410_v1.1-powerpc-cpu
    7410_v1.1-powerpc64-cpu
    7410_v1.2-powerpc-cpu
    7410_v1.2-powerpc64-cpu
    7410_v1.3-powerpc-cpu
    7410_v1.3-powerpc64-cpu
    7410_v1.4-powerpc-cpu
    7410_v1.4-powerpc64-cpu
    7441_v2.1-powerpc-cpu
    7441_v2.1-powerpc64-cpu
    7441_v2.10-powerpc-cpu
    7441_v2.10-powerpc64-cpu
    7441_v2.3-powerpc-cpu
    7441_v2.3-powerpc64-cpu
    7445_v1.0-powerpc-cpu
    7445_v1.0-powerpc64-cpu
    7445_v2.1-powerpc-cpu
    7445_v2.1-powerpc64-cpu
    7445_v3.2-powerpc-cpu
    7445_v3.2-powerpc64-cpu
    7445_v3.3-powerpc-cpu
    7445_v3.3-powerpc64-cpu
    7445_v3.4-powerpc-cpu
    7445_v3.4-powerpc64-cpu
    7447_v1.0-powerpc-cpu
    7447_v1.0-powerpc64-cpu
    7447_v1.1-powerpc-cpu
    7447_v1.1-powerpc64-cpu
    7447a_v1.0-powerpc-cpu
    7447a_v1.0-powerpc64-cpu
    7447a_v1.1-powerpc-cpu
    7447a_v1.1-powerpc64-cpu
    7447a_v1.2-powerpc-cpu
    7447a_v1.2-powerpc64-cpu
    7448_v1.0-powerpc-cpu
    7448_v1.0-powerpc64-cpu
    7448_v1.1-powerpc-cpu
    7448_v1.1-powerpc64-cpu
    7448_v2.0-powerpc-cpu
    7448_v2.0-powerpc64-cpu
    7448_v2.1-powerpc-cpu
    7448_v2.1-powerpc64-cpu
    7450_v1.0-powerpc-cpu
    7450_v1.0-powerpc64-cpu
    7450_v1.1-powerpc-cpu
    7450_v1.1-powerpc64-cpu
    7450_v1.2-powerpc-cpu
    7450_v1.2-powerpc64-cpu
    7450_v2.0-powerpc-cpu
    7450_v2.0-powerpc64-cpu
    7450_v2.1-powerpc-cpu
    7450_v2.1-powerpc64-cpu
    7451_v2.10-powerpc-cpu
    7451_v2.10-powerpc64-cpu
    7451_v2.3-powerpc-cpu
    7451_v2.3-powerpc64-cpu
    7455_v1.0-powerpc-cpu
    7455_v1.0-powerpc64-cpu
    7455_v2.1-powerpc-cpu
    7455_v2.1-powerpc64-cpu
    7455_v3.2-powerpc-cpu
    7455_v3.2-powerpc64-cpu
    7455_v3.3-powerpc-cpu
    7455_v3.3-powerpc64-cpu
    7455_v3.4-powerpc-cpu
    7455_v3.4-powerpc64-cpu
    7457_v1.0-powerpc-cpu
    7457_v1.0-powerpc64-cpu
    7457_v1.1-powerpc-cpu
    7457_v1.1-powerpc64-cpu
    7457_v1.2-powerpc-cpu
    7457_v1.2-powerpc64-cpu
    7457a_v1.0-powerpc-cpu
    7457a_v1.0-powerpc64-cpu
    7457a_v1.1-powerpc-cpu
    7457a_v1.1-powerpc64-cpu
    7457a_v1.2-powerpc-cpu
    7457a_v1.2-powerpc64-cpu
    745_v1.0-powerpc-cpu
    745_v1.0-powerpc64-cpu
    745_v1.1-powerpc-cpu
    745_v1.1-powerpc64-cpu
    745_v2.0-powerpc-cpu
    745_v2.0-powerpc64-cpu
    745_v2.1-powerpc-cpu
    745_v2.1-powerpc64-cpu
    745_v2.2-powerpc-cpu
    745_v2.2-powerpc64-cpu
    745_v2.3-powerpc-cpu
    745_v2.3-powerpc64-cpu
    745_v2.4-powerpc-cpu
    745_v2.4-powerpc64-cpu
    745_v2.5-powerpc-cpu
    745_v2.5-powerpc64-cpu
    745_v2.6-powerpc-cpu
    745_v2.6-powerpc64-cpu
    745_v2.7-powerpc-cpu
    745_v2.7-powerpc64-cpu
    745_v2.8-powerpc-cpu
    745_v2.8-powerpc64-cpu
    750_v1.0-powerpc-cpu
    750_v1.0-powerpc64-cpu
    750_v2.0-powerpc-cpu
    750_v2.0-powerpc64-cpu
    750_v2.1-powerpc-cpu
    750_v2.1-powerpc64-cpu
    750_v2.2-powerpc-cpu
    750_v2.2-powerpc64-cpu
    750_v3.0-powerpc-cpu
    750_v3.0-powerpc64-cpu
    750_v3.1-powerpc-cpu
    750_v3.1-powerpc64-cpu
    750cl_v1.0-powerpc-cpu
    750cl_v1.0-powerpc64-cpu
    750cl_v2.0-powerpc-cpu
    750cl_v2.0-powerpc64-cpu
    750cx_v1.0-powerpc-cpu
    750cx_v1.0-powerpc64-cpu
    750cx_v2.0-powerpc-cpu
    750cx_v2.0-powerpc64-cpu
    750cx_v2.1-powerpc-cpu
    750cx_v2.1-powerpc64-cpu
    750cx_v2.2-powerpc-cpu
    750cx_v2.2-powerpc64-cpu
    750cxe_v2.1-powerpc-cpu
    750cxe_v2.1-powerpc64-cpu
    750cxe_v2.2-powerpc-cpu
    750cxe_v2.2-powerpc64-cpu
    750cxe_v2.3-powerpc-cpu
    750cxe_v2.3-powerpc64-cpu
    750cxe_v2.4-powerpc-cpu
    750cxe_v2.4-powerpc64-cpu
    750cxe_v2.4b-powerpc-cpu
    750cxe_v2.4b-powerpc64-cpu
    750cxe_v3.0-powerpc-cpu
    750cxe_v3.0-powerpc64-cpu
    750cxe_v3.1-powerpc-cpu
    750cxe_v3.1-powerpc64-cpu
    750cxe_v3.1b-powerpc-cpu
    750cxe_v3.1b-powerpc64-cpu
    750fx_v1.0-powerpc-cpu
    750fx_v1.0-powerpc64-cpu
    750fx_v2.0-powerpc-cpu
    750fx_v2.0-powerpc64-cpu
    750fx_v2.1-powerpc-cpu
    750fx_v2.1-powerpc64-cpu
    750fx_v2.2-powerpc-cpu
    750fx_v2.2-powerpc64-cpu
    750fx_v2.3-powerpc-cpu
    750fx_v2.3-powerpc64-cpu
    750gx_v1.0-powerpc-cpu
    750gx_v1.0-powerpc64-cpu
    750gx_v1.1-powerpc-cpu
    750gx_v1.1-powerpc64-cpu
    750gx_v1.2-powerpc-cpu
    750gx_v1.2-powerpc64-cpu
    750l_v2.0-powerpc-cpu
    750l_v2.0-powerpc64-cpu
    750l_v2.1-powerpc-cpu
    750l_v2.1-powerpc64-cpu
    750l_v2.2-powerpc-cpu
    750l_v2.2-powerpc64-cpu
    750l_v3.0-powerpc-cpu
    750l_v3.0-powerpc64-cpu
    750l_v3.2-powerpc-cpu
    750l_v3.2-powerpc64-cpu
    755_v1.0-powerpc-cpu
    755_v1.0-powerpc64-cpu
    755_v1.1-powerpc-cpu
    755_v1.1-powerpc64-cpu
    755_v2.0-powerpc-cpu
    755_v2.0-powerpc64-cpu
    755_v2.1-powerpc-cpu
    755_v2.1-powerpc64-cpu
    755_v2.2-powerpc-cpu
    755_v2.2-powerpc64-cpu
    755_v2.3-powerpc-cpu
    755_v2.3-powerpc64-cpu
    755_v2.4-powerpc-cpu
    755_v2.4-powerpc64-cpu
    755_v2.5-powerpc-cpu
    755_v2.5-powerpc64-cpu
    755_v2.6-powerpc-cpu
    755_v2.6-powerpc64-cpu
    755_v2.7-powerpc-cpu
    755_v2.7-powerpc64-cpu
    755_v2.8-powerpc-cpu
    755_v2.8-powerpc64-cpu
    970_v2.2-powerpc64-cpu
    970_v2.2-spapr-cpu-core
    970fx_v1.0-powerpc64-cpu
    970fx_v2.0-powerpc64-cpu
    970fx_v2.1-powerpc64-cpu
    970fx_v3.0-powerpc64-cpu
    970fx_v3.1-powerpc64-cpu
    970mp_v1.0-powerpc64-cpu
    970mp_v1.0-spapr-cpu-core
    970mp_v1.1-powerpc64-cpu
    970mp_v1.1-spapr-cpu-core
    ALTR.timer
    Sun-UltraSparc-IIIi+-sparc64-cpu
    Sun-UltraSparc-IV+-sparc64-cpu
    arm.cortex-a9-global-timer
    aspeed.fmc-ast2400
    aspeed.fmc-ast2500
    aspeed.fmc-ast2600
    aspeed.gpio
    aspeed.gpio-ast2400
    aspeed.gpio-ast2500
    aspeed.gpio-ast2600
    aspeed.gpio-ast2600-1_8v
    aspeed.i2c
    aspeed.i2c-ast2400
    aspeed.i2c-ast2500
    aspeed.i2c-ast2600
    aspeed.rtc
    aspeed.scu
    aspeed.scu-ast2400
    aspeed.scu-ast2500
    aspeed.scu-ast2600
    aspeed.sdhci
    aspeed.sdmc
    aspeed.sdmc-ast2400
    aspeed.sdmc-ast2500
    aspeed.sdmc-ast2600
    aspeed.smc
    aspeed.smc-ast2400
    aspeed.spi1-ast2400
    aspeed.spi1-ast2500
    aspeed.spi1-ast2600
    aspeed.spi2-ast2500
    aspeed.spi2-ast2600
    aspeed.timer
    aspeed.timer-ast2400
    aspeed.timer-ast2500
    aspeed.timer-ast2600
    aspeed.vic
    aspeed.wdt
    aspeed.wdt-ast2400
    aspeed.wdt-ast2500
    aspeed.wdt-ast2600
    aspeed.xdma
    cadence.sdhci
    cfi.pflash01
    cfi.pflash02
    exynos4210.clk
    exynos4210.combiner
    exynos4210.fimd
    exynos4210.gic
    exynos4210.i2c
    exynos4210.irq_gate
    exynos4210.mct
    exynos4210.pmu
    exynos4210.pwm
    exynos4210.rng
    exynos4210.rtc
    exynos4210.uart
    imx.avic
    imx.ccm
    imx.enet
    imx.epit
    imx.fec
    imx.gpio
    imx.i2c
    imx.rngc
    imx.serial
    imx.spi
    imx.usbphy
    imx2.wdt
    imx25.ccm
    imx25.gpt
    imx31.ccm
    imx31.gpt
    imx6.ccm
    imx6.gpt
    imx6.src
    imx6ul.ccm
    imx7.analog
    imx7.ccm
    imx7.gpr
    imx7.gpt
    imx7.snvs
    loongson.liointc
    mchp.pfsoc.ddr_cfg
    mchp.pfsoc.ddr_sgmii_phy
    mchp.pfsoc.ioscb
    mchp.pfsoc.sysreg
    microbit.i2c
    microchip.pfsoc
    nrf51_soc.gpio
    nrf51_soc.nvm
    nrf51_soc.rng
    nrf51_soc.timer
    nrf51_soc.uart
    pc-1.0-machine
    pc-1.1-machine
    pc-1.2-machine
    pc-1.3-machine
    pc-i440fx-1.4-machine
    pc-i440fx-1.5-machine
    pc-i440fx-1.6-machine
    pc-i440fx-1.7-machine
    pc-i440fx-2.0-machine
    pc-i440fx-2.1-machine
    pc-i440fx-2.10-machine
    pc-i440fx-2.11-machine
    pc-i440fx-2.12-machine
    pc-i440fx-2.2-machine
    pc-i440fx-2.3-machine
    pc-i440fx-2.4-machine
    pc-i440fx-2.5-machine
    pc-i440fx-2.6-machine
    pc-i440fx-2.7-machine
    pc-i440fx-2.8-machine
    pc-i440fx-2.9-machine
    pc-i440fx-3.0-machine
    pc-i440fx-3.1-machine
    pc-i440fx-4.0-machine
    pc-i440fx-4.1-machine
    pc-i440fx-4.2-machine
    pc-i440fx-5.0-machine
    pc-i440fx-5.1-machine
    pc-i440fx-5.2-machine
    pc-i440fx-6.0-machine
    pc-q35-2.10-machine
    pc-q35-2.11-machine
    pc-q35-2.12-machine
    pc-q35-2.4-machine
    pc-q35-2.5-machine
    pc-q35-2.6-machine
    pc-q35-2.7-machine
    pc-q35-2.8-machine
    pc-q35-2.9-machine
    pc-q35-3.0-machine
    pc-q35-3.1-machine
    pc-q35-4.0-machine
    pc-q35-4.0.1-machine
    pc-q35-4.1-machine
    pc-q35-4.2-machine
    pc-q35-5.0-machine
    pc-q35-5.1-machine
    pc-q35-5.2-machine
    pc-q35-6.0-machine
    power10_v1.0-pnv-chip
    power10_v1.0-powernv-cpu-core
    power10_v1.0-powerpc64-cpu
    power10_v1.0-spapr-cpu-core
    power5+_v2.1-powerpc64-cpu
    power5+_v2.1-spapr-cpu-core
    power7+_v2.1-powerpc64-cpu
    power7+_v2.1-spapr-cpu-core
    power7_v2.3-powerpc64-cpu
    power7_v2.3-spapr-cpu-core
    power8_v2.0-pnv-chip
    power8_v2.0-powernv-cpu-core
    power8_v2.0-powerpc64-cpu
    power8_v2.0-spapr-cpu-core
    power8e_v2.1-pnv-chip
    power8e_v2.1-powernv-cpu-core
    power8e_v2.1-powerpc64-cpu
    power8e_v2.1-spapr-cpu-core
    power8nvl_v1.0-pnv-chip
    power8nvl_v1.0-powernv-cpu-core
    power8nvl_v1.0-powerpc64-cpu
    power8nvl_v1.0-spapr-cpu-core
    power9_v1.0-powerpc64-cpu
    power9_v1.0-spapr-cpu-core
    power9_v2.0-pnv-chip
    power9_v2.0-powernv-cpu-core
    power9_v2.0-powerpc64-cpu
    power9_v2.0-spapr-cpu-core
    pseries-2.1-machine
    pseries-2.10-machine
    pseries-2.11-machine
    pseries-2.12-machine
    pseries-2.12-sxxm-machine
    pseries-2.2-machine
    pseries-2.3-machine
    pseries-2.4-machine
    pseries-2.5-machine
    pseries-2.6-machine
    pseries-2.7-machine
    pseries-2.8-machine
    pseries-2.9-machine
    pseries-3.0-machine
    pseries-3.1-machine
    pseries-4.0-machine
    pseries-4.1-machine
    pseries-4.2-machine
    pseries-5.0-machine
    pseries-5.1-machine
    pseries-5.2-machine
    pseries-6.0-machine
    qemu:dummy
    qemu:iommu-memory-region
    qemu:memory-region
    riscv.hart_array
    riscv.lowrisc.ibex.soc
    riscv.sifive.clint
    riscv.sifive.e.prci
    riscv.sifive.e.soc
    riscv.sifive.plic
    riscv.sifive.test
    riscv.sifive.u.otp
    riscv.sifive.u.prci
    riscv.sifive.u.soc
    s390-ccw-virtio-2.10-machine
    s390-ccw-virtio-2.11-machine
    s390-ccw-virtio-2.12-machine
    s390-ccw-virtio-2.4-machine
    s390-ccw-virtio-2.5-machine
    s390-ccw-virtio-2.6-machine
    s390-ccw-virtio-2.7-machine
    s390-ccw-virtio-2.8-machine
    s390-ccw-virtio-2.9-machine
    s390-ccw-virtio-3.0-machine
    s390-ccw-virtio-3.1-machine
    s390-ccw-virtio-4.0-machine
    s390-ccw-virtio-4.1-machine
    s390-ccw-virtio-4.2-machine
    s390-ccw-virtio-5.0-machine
    s390-ccw-virtio-5.1-machine
    s390-ccw-virtio-5.2-machine
    s390-ccw-virtio-6.0-machine
    sifive.pdma
    sifive_soc.gpio
    virt-2.10-machine
    virt-2.11-machine
    virt-2.12-machine
    virt-2.6-machine
    virt-2.7-machine
    virt-2.8-machine
    virt-2.9-machine
    virt-3.0-machine
    virt-3.1-machine
    virt-4.0-machine
    virt-4.1-machine
    virt-4.2-machine
    virt-5.0-machine
    virt-5.1-machine
    virt-5.2-machine
    virt-6.0-machine
    xenfv-3.1-machine
    xenfv-4.2-machine
    xlnx-zynmp.rtc
    xlnx.axi-dma
    xlnx.axi-ethernet
    xlnx.dpdma
    xlnx.pmu_io_intc
    xlnx.ps7-dev-cfg
    xlnx.ps7-qspi
    xlnx.ps7-spi
    xlnx.usmp-gqspi
    xlnx.v-dp
    xlnx.versal-usb2
    xlnx.versal-usb2-ctrl-regs
    xlnx.xps-ethernetlite
    xlnx.xps-intc
    xlnx.xps-spi
    xlnx.xps-timer
    xlnx.xps-uartlite
    xlnx.zdma
    xlnx.zynqmp-can
    xlnx.zynqmp_ipi
    z10BC.2-base-s390x-cpu
    z10BC.2-s390x-cpu
    z10EC.2-base-s390x-cpu
    z10EC.2-s390x-cpu
    z10EC.3-base-s390x-cpu
    z10EC.3-s390x-cpu
    z13.2-base-s390x-cpu
    z13.2-s390x-cpu
    z14.2-base-s390x-cpu
    z14.2-s390x-cpu
    z196.2-base-s390x-cpu
    z196.2-s390x-cpu
    z890.2-base-s390x-cpu
    z890.2-s390x-cpu
    z890.3-base-s390x-cpu
    z890.3-s390x-cpu
    z900.2-base-s390x-cpu
    z900.2-s390x-cpu
    z900.3-base-s390x-cpu
    z900.3-s390x-cpu
    z990.2-base-s390x-cpu
    z990.2-s390x-cpu
    z990.3-base-s390x-cpu
    z990.3-s390x-cpu
    z990.4-base-s390x-cpu
    z990.4-s390x-cpu
    z990.5-base-s390x-cpu
    z990.5-s390x-cpu
    z9BC.2-base-s390x-cpu
    z9BC.2-s390x-cpu
    z9EC.2-base-s390x-cpu
    z9EC.2-s390x-cpu
    z9EC.3-base-s390x-cpu
    z9EC.3-s390x-cpu
    zEC12.2-base-s390x-cpu
    zEC12.2-s390x-cpu

Markus Armbruster (1):
  hw: Replace anti-social QOM type names

 include/hw/arm/armv7m.h                      |  2 +-
 include/hw/arm/fsl-imx25.h                   |  2 +-
 include/hw/arm/fsl-imx31.h                   |  2 +-
 include/hw/arm/fsl-imx6.h                    |  2 +-
 include/hw/arm/fsl-imx6ul.h                  |  2 +-
 include/hw/arm/fsl-imx7.h                    |  2 +-
 include/hw/arm/xlnx-zynqmp.h                 |  2 +-
 include/hw/cris/etraxfs.h                    |  2 +-
 include/hw/i386/ich9.h                       |  2 +-
 include/hw/misc/grlib_ahb_apb_pnp.h          |  4 ++--
 include/hw/misc/zynq-xadc.h                  |  2 +-
 include/hw/register.h                        |  2 +-
 include/hw/sparc/grlib.h                     |  6 +++---
 hw/arm/xilinx_zynq.c                         |  2 +-
 hw/audio/cs4231.c                            |  2 +-
 hw/block/fdc.c                               |  4 ++--
 hw/char/etraxfs_ser.c                        |  2 +-
 hw/cris/axis_dev88.c                         |  6 +++---
 hw/display/tcx.c                             |  2 +-
 hw/intc/etraxfs_pic.c                        |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c              |  2 +-
 hw/misc/zynq_slcr.c                          |  2 +-
 hw/sparc/sun4m.c                             | 12 ++++++------
 hw/timer/etraxfs_timer.c                     |  2 +-
 softmmu/vl.c                                 |  2 +-
 tests/vmstate-static-checker-data/dump1.json |  4 ++--
 tests/vmstate-static-checker-data/dump2.json |  4 ++--
 27 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.26.2


