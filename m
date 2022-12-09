Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C27648191
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 12:25:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bUT-0003uZ-H4; Fri, 09 Dec 2022 06:24:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUH-0003uB-S3
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p3bUF-0000we-T3
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:24:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670585054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QHN1qFcvf9F5Phc9rYoInanXPG/5qUfiwWTnKev0Jos=;
 b=IdwbU2uhVsPTlyy1iH7lD696nIz3kGsv1e/sPjbywEKcMb23de+lPGlQNzTiaFkpfPnt92
 DAgBH0VQnKH8LtroIgceW+tc+KP9cZMzxOUiccctSfAXZm9/zbX8IwEBfD0WmV4s7LPMnT
 0tReuEOfDrQB7vX1uAB4t9nWzFGx9TQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-5P-tr0flPkuLfbB1S3QLCw-1; Fri, 09 Dec 2022 06:24:13 -0500
X-MC-Unique: 5P-tr0flPkuLfbB1S3QLCw-1
Received: by mail-ed1-f71.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso1194760edd.14
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QHN1qFcvf9F5Phc9rYoInanXPG/5qUfiwWTnKev0Jos=;
 b=nxUZpGheOpTwHsPx/UP5e5a0MqvuSIpBN1MtO26kEjWdmi1So3bscXQ+f6NPwHc244
 tNK992MKklhjFDfdcnBdrMs7Y2MMgkBlfR6sKYCH9WXl1yEBVe/wgWj056S+P3g5m9nH
 UyuEU+5y5DncOpgVcdcaaMtyN7AV+2Rb3zpRisaBfDQR3l9PMNq63sucWsZThXXvfgc+
 HHJy8Zgq6sb+9oU8Xyj7YQNtaZD42AnQHREtN8VpNGVxpFeK8ACe4IzeNtsH6S5H2EUr
 2m6rgTZwIyfGjreAgOFU1LCb9L5M5xVynnwQV9CpKeDvH3WFkO9k59nBhR7ZSG63IHTj
 /KUw==
X-Gm-Message-State: ANoB5plUp6pPn4VbMOa/yn7aySr0RjtzLNCAu5l15a9mWVtWEuWM6SxX
 A3CNP4lGVAxjhuQlNHWKqcbq5YPz/Xgm2R+287Em2YMl5Nf4suH28YKlt/28l2Saoe5NRldX27u
 anKMV7qlN1l1d5UuUbC4k+onrRhYZJrvW1htkwcallbeZAwNuALzTC36mTIMTNjlplJ4=
X-Received: by 2002:a17:906:241a:b0:7c0:e989:bf70 with SMTP id
 z26-20020a170906241a00b007c0e989bf70mr4374116eja.25.1670585051734; 
 Fri, 09 Dec 2022 03:24:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf63jg65+QSRR+iRWkkTDgY6yCGSV7s0xe2S61tbkYxbcMu9wCmQzzx7xAQsVJtgpjpPe7WSKw==
X-Received: by 2002:a17:906:241a:b0:7c0:e989:bf70 with SMTP id
 z26-20020a170906241a00b007c0e989bf70mr4374095eja.25.1670585051252; 
 Fri, 09 Dec 2022 03:24:11 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a170906830600b007c10fe64c5dsm448730ejx.86.2022.12.09.03.24.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Dec 2022 03:24:10 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-8.0 00/30] Meson changes for QEMU 8.0
Date: Fri,  9 Dec 2022 12:23:39 +0100
Message-Id: <20221209112409.184703-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

The final bout of conversions removes the remaining compiler tests
for emulators, applies a few cleanups that are enabled by version 0.63
of Meson, and updates the documentation.

Committing this however requires first a libvirt-ci update, in order to
enable using Python 3.8/3.9 on CentOS 8 and SLES 15.  I am still working
on it but the review can start early for these patches.

A final comparison for the effort has a net negative of around 4000
lines of code, despite the growth of QEMU itself in the meanwhile:

      before                             after
--------------------------------------------------------------------------
 8647 configure                     4240 meson.build
 1296 Makefile                      1970 configure                            
  985 tests/Makefile.include         337 Makefile
  440 rules.mak                      224 scripts/meson-buildoptions.py
  379 scripts/tap-driver.pl          171 tests/Makefile.include
  287 Makefile.target                129 scripts/nsis.py
  263 tests/tcg/configure.sh         113 scripts/mtest2make.py
  129 scripts/create_config           48 scripts/undefsym.py
~5500 various Makefile fragments   ~6500 various meson.build files
--------------------------------------------------------------------------
17926 total                        13732 total

Completing the conversion took roughly two years and a lot of the complexity
in how QEMU is built is indeed essential, but I think it's agreed that:

- the disruption to the developers was minimal, and even Windows only took
  a month or so to solidify;

- there is overall feature parity for both configure/Makefile<->meson and for
  tap-driver.pl<->"meson test", but with fewer bugs and fewer (though not zero)
  workarounds required.  For Meson, the main recurring issue is probably the
  gnutls headers issue on Homebrew; see for example commit 76f67bac79f6,
  "meson: Propagate gnutls dependency to migration", 2021-04-01)

- the original target of the conversion ("make it trivial to do trivial
  things; easy to extend existing things; possible to do everything else")
  has been achieved.  New dependencies such as ninja, were introduced in
  such a way as to make them familiar to shell/Make users, and did
  provide subtle quality of life improvements (e.g. rebuild targets
  on command line changes)

New build system features since the introduction of Meson include switching
to config/targets files, custom device configuration (--with-devices-ARCH=),
the modinfo mechanism for module loading, entitlement support for
Hypervisor.framework, the preinstall tree, autogenerated parsing of the
configure command line, and cross-compilation of pc-bios/ (admittedly
not done by Meson, but not hindered either).

Big thanks to Akihiko, Alex, Daniel, Marc-André, Richard, Thomas and
everybody else that shared the work and the reviews!

Thanks,

Paolo

Paolo Bonzini (30):
  configure: remove useless write_c_skeleton
  configure: remove dead function
  configure: remove useless test
  configure: preserve qemu-ga variables
  configure: remove backwards-compatibility and obsolete options
  meson: tweak hardening options for Windows
  meson: support meson 0.64 -Doptimization=plain
  meson: require 0.63.0
  meson: use prefer_static option
  meson: remove static_kwargs
  meson: cleanup dummy-cpus.c rules
  modinfo: lookup compile_commands.json by object
  configure: remove backwards-compatibility code
  configure: test all warnings
  meson: cleanup compiler detection
  build: move glib detection and workarounds to meson
  configure: remove pkg-config functions
  configure, meson: move --enable-modules to Meson
  configure, meson: move --enable-debug-info to Meson
  meson: prepare move of QEMU_CFLAGS to meson
  build: move sanitizer tests to meson
  build: move SafeStack tests to meson
  build: move coroutine backend selection to meson
  build: move stack protector flag selection to meson
  build: move warning flag selection to meson
  build: move remaining compiler flag tests to meson
  build: move compiler version check to meson
  docs: update build system docs
  configure: do not rerun the tests with -Werror
  meson: always log qemu-iotests verbosely

 accel/meson.build                             |   9 +-
 block/meson.build                             |   1 +
 configure                                     | 760 +-----------------
 contrib/plugins/Makefile                      |   7 +-
 docs/devel/build-system.rst                   | 286 ++++---
 meson                                         |   2 +-
 meson.build                                   | 684 +++++++++++-----
 meson_options.txt                             |  13 +
 plugins/meson.build                           |   2 +-
 qga/meson.build                               |   2 +-
 scripts/meson-buildoptions.py                 |   3 +
 scripts/meson-buildoptions.sh                 |  22 +
 scripts/modinfo-collect.py                    |  23 +-
 tcg/meson.build                               |   2 +-
 tests/qemu-iotests/meson.build                |   3 +-
 tests/unit/meson.build                        |   2 +-
 ...{coroutine-win32.c => coroutine-windows.c} |   0
 util/meson.build                              |   2 +-
 18 files changed, 716 insertions(+), 1107 deletions(-)
 rename util/{coroutine-win32.c => coroutine-windows.c} (100%)

-- 
2.38.1


