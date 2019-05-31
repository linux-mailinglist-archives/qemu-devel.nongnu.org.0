Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0DC3119A
	for <lists+qemu-devel@lfdr.de>; Fri, 31 May 2019 17:51:38 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWjof-0007WL-Dg
	for lists+qemu-devel@lfdr.de; Fri, 31 May 2019 11:51:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60417)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hWjla-0005uc-Sb
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:48:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hWjlZ-0003Ms-RB
	for qemu-devel@nongnu.org; Fri, 31 May 2019 11:48:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55418)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1hWjlX-0002Sl-7B; Fri, 31 May 2019 11:48:23 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 90E0F30C1FF6;
	Fri, 31 May 2019 15:47:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-73.brq.redhat.com [10.40.204.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D77C41001E6F;
	Fri, 31 May 2019 15:47:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 31 May 2019 17:47:33 +0200
Message-Id: <20190531154735.20809-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 31 May 2019 15:47:58 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 0/2] target: Build with CONFIG_SEMIHOSTING
 disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Miroslav Rezanina <mrezanin@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Amusingly Miroslav and myself hit this issue at the same time.

Currently there is no way to pass a CONFIG_X to sources in target/,
except via a Makefile rule (and filling with stubs).

Paolo says this is on purpose, CONFIG_X selectors are meant for
devices and we try to avoid having config-devices.mak in
config-target.h.

Some know (arch-specific) limitations are:

- MIPS ITU is accessed by coprocessor instr (ISA feature)
- MIPS timer is accessed by coprocessor instr (ISA feature)
- MIPS semihosting (ISA feature?)
- ARM semihosting (ISA feature?)
- ARMv7 NVIC (device)

This series attempt to fix this the most trivial way, adding
stubs for unreachable code.

Philippe Mathieu-Daud=C3=A9 (2):
  target/arm: Add stubs to build with CONFIG_SEMIHOSTING disabled
  target/mips: Add stubs to build with CONFIG_SEMIHOSTING disabled

 target/arm/Makefile.objs      |  3 ++-
 target/arm/arm-semi-stubs.c   | 21 +++++++++++++++++++++
 target/mips/Makefile.objs     |  3 ++-
 target/mips/mips-semi-stubs.c | 23 +++++++++++++++++++++++
 4 files changed, 48 insertions(+), 2 deletions(-)
 create mode 100644 target/arm/arm-semi-stubs.c
 create mode 100644 target/mips/mips-semi-stubs.c

--=20
2.20.1


