Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9151721223
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 04:42:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40122 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRSom-0006jQ-H3
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 22:41:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmQ-0005Mf-Um
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hRSmP-0001x8-Dp
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:30 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hRSmO-0001un-Rw
	for qemu-devel@nongnu.org; Thu, 16 May 2019 22:39:29 -0400
Received: by mail-pg1-x52a.google.com with SMTP id z3so2514417pgp.8
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 19:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2mdUhA9QY53J9qxmmtiU77JLGo/5dq+rrvrp7LbuABM=;
	b=poYWOHWTKxLBY7OV4mGt0f55815aBl2mHO1TmkX/jFJSDEfZ7s5HFWi9JimGO2UNFU
	/cgN2lBQDaeClPabVrWop1BCoyph9RLVZDBiS5ad8+R0/fhoeXmnBTKiTUQxPVru6ZKG
	iQO/HFsPy7CSQF7Hb3N7yI/zV3sKTOvUYc4fgofOIta0xysHvNB/9k/umIg0lOemoat/
	wEnZNrtQqn0+RC7lcqANv2GQm26/hRtx3kmHhd6iYnJauzb94I4j00nQICD5JgvUomIP
	03jRwRBm4HbYmkt8xyVaqaEr01FuPl0nQGPVGHu6meQGOziFN3nwH0k04LnqpC0aRjLz
	8JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=2mdUhA9QY53J9qxmmtiU77JLGo/5dq+rrvrp7LbuABM=;
	b=OgbgAm3yECvCazAY9+vZ7f0BXLwJVnrDfAx5FSlSnww7a2N0lGitWH7h4ozq+o3n1k
	1Ooq22rCEzvisRL0Y6vUFzjToY7UKe1UVXxnuOj31S6MdG+TrYFHU4+u8W6iV+lfTgGy
	dyXgqsDROnHQrfeZNkZD4gS3G4YSxgdW+5AjdbOtcwWuLW2Loh5q4JYdD6oQJ9yxzAND
	V86l5sF5uJrsl8w1oyJsT8pEyyXcXtBUsXg8glgW90Zcp/ddD5ARViWmosdhnKFij2jI
	K+XPY/1OxGclquEioJL+CCg2Ys+gyk5pBNmdpApEpfDE0IWQvuyHdBaoimko+v8ZfB99
	9hOg==
X-Gm-Message-State: APjAAAU/a9cPotnabcC++0mAmt9g6qLp77yaXiwqJ4jEKR1+596sbFI3
	gDFXcIzQE+68FRjMY5oIhZc+1gFJT5A=
X-Google-Smtp-Source: APXvYqzQWqDj4V5ExCcI8eXIaKwatS2z8yEmhDKPUJPGHAc5rJ62sYDXjrvLPDH80EjbBgJFkAQWBA==
X-Received: by 2002:a63:441c:: with SMTP id r28mr54053380pga.255.1558060766790;
	Thu, 16 May 2019 19:39:26 -0700 (PDT)
Received: from localhost.localdomain (97-113-13-231.tukw.qwest.net.
	[97.113.13.231])
	by smtp.gmail.com with ESMTPSA id w6sm6984152pge.30.2019.05.16.19.39.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 19:39:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 16 May 2019 19:38:59 -0700
Message-Id: <20190517023924.1686-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52a
Subject: [Qemu-devel] [PATCH v8 00/25] Add qemu_getrandom and ARMv8.5-RNG etc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: lvivier@redhat.com, berrange@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The change in v8 is to which objects are linked in to user-only
from the crypto directory.  Daniel asked for all of crypto-obj-y
to be added, but I have been unable to find a solution that works.

If I add crypto-obj-y, then authz-obj-y must be included to resolve
dependencies.  Daniel suggested splitting authz-obj-y into two, so
that linux-user plus some of the tools need not link against libpam.

However, I tried that, and in the process managed to break testing.
I'm not really sure what I did wrong:

  TEST    check-speed: tests/benchmark-crypto-cipher
  ERROR - too few tests run (expected 32, got 0)

Or maybe it was broken before, but at least this way I'm not touching
any of the variables that affect tests/Makefile.include.

Given that user-only *is* being linked against the enabled crypto libs,
the behaviour between static and non-static is identical, which is I
believe the major portion of Daniel's request.  I think further cleanup
to the makefiles can be done separately.


r~


Changes since v7:
  * Re-instate the configure probe for --static from v5.
  * Revert the changes to crypto-obj-y.
  * Rename crypto-aes-obj-y to crypto-user-obj-y.
  * Add crypto random number objects to crypto-user-obj-y.

Changes since v6:
  * Drop the crypto-obj-y, crypto-aes-obj-y, and configure changes.
    This fixes the regression visible in make check-unit, due to
    objects not being pulled in from libqemuutil.a.
  * Add a crypto-rng-obj-y, and force it to be random-platform.o.
    This avoids attempting to link the crypto libraries into the
    user-only binaries.  Which in turn means we can drop all of
    the configure changes to cope with the crypto libraries not
    having the static libraries packaged by recent distros.

Changes since v5:
  * Merge crypto-obj-y into util-obj-y (patch 2).
  * Fix leftover crypto-obj-aes-y reference (patch 2).
  * Add ARM_CP_IO to the RNG registers (patch 22).
  * Issue gen_io_start/end around ppc DARN (new patch 24).
  * Issue gen_io_start/end around x86 rdrand (patch 25).

Changes since v4:
  * Do not autoenable nettle or gcrypt if linking is broken.
    Fixes --static on fedora 30.
  * Delay removal of srand() for -seed.
  * Do not loop for -1 result for ppc64 DARN.

Changes since v3:
  * Do not autoenable gnutls if linking is broken.
    Fixes --static on ubuntu 18.04.

Changes since v2:
  * Changes from review.
    - getrandom is not exclusive of /dev/urandom fallback.
    - vnc fails gracefully on crypto failure.
    - a great renaming.
  * Drop the "nonblock" argument, as it's not deliverable from the backend.
  * Propagate Error back through qemu_guest_getrandom.
  * Add qemu_guest_getrandom_nofail to centralize "Argh! Death!".
  * Convert hw/misc/
  * Implement ppc darn.
  * Implement x86 rdrand.

Changes since v1:
  * Build crypto-obj-y for linux-user as well.
  * Several patches to tidy crypto/random-platform.c.
  * Use getrandom(2) in crypto/random-platform.c.
  * Use qcrypto_random_bytes in ui/vnc.c.
  * In qemu_getrandom:
    - Use g_rand_int instead of srand48.
    - Use qcrypto_random_bytes instead of getrandom directly.


Richard Henderson (25):
  configure: Link test before auto-enabling crypto libraries
  build: Link user-only with crypto random number objects
  crypto: Reverse code blocks in random-platform.c
  crypto: Do not fail for EINTR during qcrypto_random_bytes
  crypto: Use O_CLOEXEC in qcrypto_random_init
  crypto: Use getrandom for qcrypto_random_bytes
  crypto: Change the qcrypto_random_bytes buffer type to void*
  ui/vnc: Split out authentication_failed
  ui/vnc: Use gcrypto_random_bytes for start_auth_vnc
  util: Add qemu_guest_getrandom and associated routines
  cpus: Initialize pseudo-random seeds for all guest cpus
  linux-user: Initialize pseudo-random seeds for all guest cpus
  linux-user: Call qcrypto_init if not using -seed
  linux-user: Use qemu_guest_getrandom_nofail for AT_RANDOM
  linux-user/aarch64: Use qemu_guest_getrandom for PAUTH keys
  linux-user: Remove srand call
  aspeed/scu: Use qemu_guest_getrandom_nofail
  hw/misc/nrf51_rng: Use qemu_guest_getrandom_nofail
  hw/misc/bcm2835_rng: Use qemu_guest_getrandom_nofail
  hw/misc/exynos4210_rng: Use qemu_guest_getrandom
  target/arm: Put all PAC keys into a structure
  target/arm: Implement ARMv8.5-RNG
  target/ppc: Use gen_io_start/end around DARN
  target/ppc: Use qemu_guest_getrandom for DARN
  target/i386: Implement CPUID_EXT_RDRAND

 Makefile                            |   4 +-
 Makefile.objs                       |   2 +-
 Makefile.target                     |   4 +-
 include/crypto/random.h             |   2 +-
 include/qemu/guest-random.h         |  68 ++++++++++++++++++
 include/qom/cpu.h                   |   1 +
 linux-user/aarch64/target_syscall.h |   2 -
 target/arm/cpu.h                    |  17 +++--
 target/i386/helper.h                |   2 +
 cpus.c                              |   9 +++
 crypto/random-gcrypt.c              |   2 +-
 crypto/random-gnutls.c              |   2 +-
 crypto/random-platform.c            | 104 +++++++++++++++++-----------
 hw/misc/aspeed_scu.c                |  10 +--
 hw/misc/bcm2835_rng.c               |  32 ++++-----
 hw/misc/exynos4210_rng.c            |  11 ++-
 hw/misc/nrf51_rng.c                 |   4 +-
 linux-user/aarch64/cpu_loop.c       |  25 +------
 linux-user/elfload.c                |   8 +--
 linux-user/main.c                   |  33 +++++----
 linux-user/syscall.c                |  34 +++++++--
 target/arm/cpu64.c                  |   1 +
 target/arm/helper.c                 |  64 ++++++++++++++---
 target/arm/pauth_helper.c           |  18 ++---
 target/i386/cpu.c                   |   5 +-
 target/i386/int_helper.c            |  21 ++++++
 target/i386/translate.c             |  62 +++++++++++++----
 target/ppc/int_helper.c             |  39 +++++++----
 target/ppc/translate.c              |  21 ++++--
 ui/vnc.c                            |  53 ++++++--------
 util/guest-random.c                 |  93 +++++++++++++++++++++++++
 vl.c                                |   4 ++
 configure                           |  87 +++++++++++++++--------
 crypto/Makefile.objs                |  11 +--
 qemu-options.hx                     |  10 +++
 util/Makefile.objs                  |   1 +
 36 files changed, 610 insertions(+), 256 deletions(-)
 create mode 100644 include/qemu/guest-random.h
 create mode 100644 util/guest-random.c

-- 
2.17.1


