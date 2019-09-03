Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D59EBA6DB8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 18:14:14 +0200 (CEST)
Received: from localhost ([::1]:48632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5BRd-0005ZA-G3
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 12:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32962)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5B2f-0004qh-JU
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:48:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5B2e-0005Tb-AI
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 11:48:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:23881)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1i5B2Y-0005Oq-EB; Tue, 03 Sep 2019 11:48:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E443D3175289;
 Tue,  3 Sep 2019 15:48:16 +0000 (UTC)
Received: from thuth.com (ovpn-117-51.ams2.redhat.com [10.36.117.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F6BC19D7A;
 Tue,  3 Sep 2019 15:48:13 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Tue,  3 Sep 2019 17:48:07 +0200
Message-Id: <20190903154810.27365-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 03 Sep 2019 15:48:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [RFC PATCH 0/3] Make it possible to compile with
 CONFIG_ARM_V7M=n
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We've got CONFIG_ARM_V7M, but it currently can't be disabled.
Here are some patches that should allow to disable the switch
(if the corresponding boards are disabled, too).

I'm mainly posting this patches for Philippe and his current TCG-disablement
work, maybe some of this is useful for him, too. I've marked the patches
as RFC since they are hardly tested.

Thomas Huth (3):
  target/arm: Make cpu_register() and set_feature() available for other
    files
  target/arm: Move cortex-m related functions to m_helper.c
  target/arm: Make m_helper.c optional via CONFIG_ARM_V7M

 target/arm/Makefile.objs   |   3 +-
 target/arm/cpu.c           | 166 +------------------------------------
 target/arm/cpu.h           |  18 ++++
 target/arm/cpu64.c         |  16 ----
 target/arm/m_helper-stub.c |  58 +++++++++++++
 target/arm/m_helper.c      | 164 ++++++++++++++++++++++++++++++++++++
 6 files changed, 244 insertions(+), 181 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c

-- 
2.18.1


