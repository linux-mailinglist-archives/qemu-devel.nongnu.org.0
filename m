Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D9F9B181
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 16:00:59 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1A7e-0002vZ-4v
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 10:00:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i1A58-0001OY-J0
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i1A57-0007Hx-I1
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 09:58:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39514)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1i1A55-0007GO-8j; Fri, 23 Aug 2019 09:58:19 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 759DDA2F867;
 Fri, 23 Aug 2019 13:58:18 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-118.brq.redhat.com [10.40.204.118])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2436B2636D;
 Fri, 23 Aug 2019 13:58:13 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Aug 2019 15:58:07 +0200
Message-Id: <20190823135811.13883-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Fri, 23 Aug 2019 13:58:18 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 0/4] Support disabling TCG on ARM (part 2)
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cover from Samuel Ortiz from (part 1) [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. [...]

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

The first 2 patches disable non-KVM compatible cpus to the KVM build,
then the last 2 remove the boards using these cpus from this build.

This is a resend (no changes) of patches from part 1 v4 from [2].

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html
[2]: https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00312.html

Philippe Mathieu-Daud=C3=A9 (4):
  target/arm: Restrict pre-ARMv7 cpus to TCG
  target/arm: Restrict R and M profiles to TCG
  RFC target/arm: Do not build pre-ARMv7 cpus when using KVM
  RFC target/arm: Do not build A/M-profile cpus when using KVM

 default-configs/arm-softmmu.mak | 47 +++++++++++++++------------------
 hw/arm/Kconfig                  | 42 ++++++++++++++++++++++++++---
 target/arm/cpu.c                | 16 ++++++++++-
 3 files changed, 76 insertions(+), 29 deletions(-)

--=20
2.20.1


