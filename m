Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5423CD506
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:45:25 +0200 (CEST)
Received: from localhost ([::1]:59944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SeC-0002IP-TR
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:45:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sd7-0001Dm-7f
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:44:17 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5Sd5-0006HR-Ly
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:44:16 -0400
Received: by mail-ej1-x62c.google.com with SMTP id go30so28452941ejc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 05:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=FQYQXme6NhY0IksKcLed4NYnmBF47iHDvDGWrOvOs3M=;
 b=hbiHYMaQxhuBe6K91SKRdISBwx1nH+gtVD0MB4kup9N3fA2FHVaHyjKmHXqoUr88QN
 bNrjcoSsyRkLA2+TOo0rzwF0tybUG4GbYU1+nQBL4cpDu7+ohLxpHe0scqLzyKvadvHC
 Oqm9HEJSNgbPlbQkBzaBS43yauFGEJ5JHL27783sY1l3w/DYvzHhWzhKc76sthblL0M7
 Lkl+b47KSqQkBHK6Awi0JP5kcLcofnB2OFX91gutFIpyHa5gEV3m4kJBdTUXsbq5VxUA
 9XnPATqS/DUssXnG4s6PHgZEgVZg1V5gVw+O2ADvbnrdBveWMyLeY6m8uuDi0wcgFgz1
 cHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=FQYQXme6NhY0IksKcLed4NYnmBF47iHDvDGWrOvOs3M=;
 b=lWbGuiLdg1qtrz3gpQATdAojdo0h3vZS6Uxcs1iqau8G11PF/Rd15PiWRao7vQcmmf
 rQ2upkJA3lkycHaYrvILhrzZttRDxA8mo6VhsfxcrchM5OFSI8ioVWOn1TvuGNnNXdWr
 L81Sz53fXpXWRDUr1luPoNCbuYs7Pu6FcnHb1PMIfqAdmM6KajzFaa+78fGKf9AlKNit
 9EQC6ZdtEfCuQRB2GA/YaFNIWJjkxge2qoa/zpR9DhSbob5z/8V3zghJdNTt7izo3Tmh
 mO+/YmDo/8VayLGTzDb/hLTvRaicoqrUDmbb8JtpQsZUJX3PVr78rh7t0vqWQ+q9SgeU
 UE6w==
X-Gm-Message-State: AOAM533JjaerWEJ4BADLKyZ1H0D5HTBKouXwcAwddNZdbWre0LA+gOYv
 Wi3G3sxTIfcGhSnnEFdOYsBGsEKGyiDC29cpXUVSBZBeD2VgLA==
X-Google-Smtp-Source: ABdhPJx6SlmxRSzVR4Vlc3kmh8MeU8SNgLLk09VFfSdrKz6tytSVyiSuWjozHKavDdECEGBjwTFXaFZrCgU7jn30HAI=
X-Received: by 2002:a17:907:3e02:: with SMTP id
 hp2mr26798032ejc.4.1626698654059; 
 Mon, 19 Jul 2021 05:44:14 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:43:33 +0100
Message-ID: <CAFEAcA_byx5rCR7Y+yJrZ=K8oifdYEAza041W4yyA+wJkDpn6w@mail.gmail.com>
Subject: random crash in migration-test, i386 guest, x86-64 host:
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Random crash in migration-tests:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
u-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-i386
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-
storage-daemon tests/qtest/migration-test --tap -k
PASS 1 qtest-i386/migration-test /i386/migration/bad_dest
PASS 2 qtest-i386/migration-test /i386/migration/fd_proto
PASS 3 qtest-i386/migration-test /i386/migration/validate_uuid
PASS 4 qtest-i386/migration-test /i386/migration/validate_uuid_error
PASS 5 qtest-i386/migration-test /i386/migration/validate_uuid_src_not_set
PASS 6 qtest-i386/migration-test /i386/migration/validate_uuid_dst_not_set
PASS 7 qtest-i386/migration-test /i386/migration/auto_converge
PASS 8 qtest-i386/migration-test /i386/migration/postcopy/unix
Broken pipe
../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
ERROR qtest-i386/migration-test - too few tests run (expected 15, got 8)
Makefile.mtest:280: recipe for target 'run-test-33' failed
make: *** [run-test-33] Error 1


-- PMM

