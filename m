Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7683C4DA919
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 04:54:32 +0100 (CET)
Received: from localhost ([::1]:43526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUKjz-0005wW-GS
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 23:54:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKib-0004Xj-P8
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:01 -0400
Received: from smtp126.ord1c.emailsrvr.com ([108.166.43.126]:50010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nUKia-0005a8-0O
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 23:53:01 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp8.relay.ord1c.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 2D0D2A00DB; 
 Tue, 15 Mar 2022 23:52:58 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/3] Fixes for building on Solaris 11.4.42 CBE
Date: Tue, 15 Mar 2022 22:52:24 -0500
Message-Id: <20220316035227.3702-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: bed69193-96d2-4a39-a762-e06e17567ffe-1-1
Received-SPF: pass client-ip=108.166.43.126;
 envelope-from=adeason@sinenomine.net; helo=smtp126.ord1c.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Andrew Deason <adeason@sinenomine.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With these minor fixes, I can build qemu on Solaris 11.4.42 CBE
(Oracle's new rolling release thing), using '--disable-rdma
--enable-modules --disable-dbus-display --target-list=x86_64-softmmu'.
I'm just interested in the guest agent right now, so that's all I've
tested (briefly), but the rest of the build wasn't hard to get working.
With this, the guest agent runs fine using isa-serial.

Changes since v2:
- Rename new symbol to HAVE_MADVISE_WITHOUT_PROTOTYPE
- Move madvise prototype to include/qemu/osdep.h
- More comments in meson.build

Changes since v1:
- Change the CONFIG_MADVISE checks to not be platform-specific
- Add the last commit removing util/osdep.c cruft

Andrew Deason (3):
  util/osdep: Avoid madvise proto on modern Solaris
  hw/i386/acpi-build: Avoid 'sun' identifier
  util/osdep: Remove some early cruft

 hw/i386/acpi-build.c |  4 ++--
 include/qemu/osdep.h |  8 ++++++++
 meson.build          | 23 +++++++++++++++++++++--
 util/osdep.c         | 10 ----------
 4 files changed, 31 insertions(+), 14 deletions(-)

-- 
2.11.0


