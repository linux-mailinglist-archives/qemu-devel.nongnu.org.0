Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD3B4D928A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 03:22:24 +0100 (CET)
Received: from localhost ([::1]:48070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTwpH-0006R6-MU
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 22:22:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnk-0004xB-QP
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:44 -0400
Received: from smtp121.iad3a.emailsrvr.com ([173.203.187.121]:40336)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adeason@sinenomine.net>)
 id 1nTwnj-0002gQ-49
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 22:20:44 -0400
X-Auth-ID: adeason@sinenomine.net
Received: by smtp24.relay.iad3a.emailsrvr.com (Authenticated sender:
 adeason-AT-sinenomine.net) with ESMTPSA id 295E621170; 
 Mon, 14 Mar 2022 22:20:41 -0400 (EDT)
From: Andrew Deason <adeason@sinenomine.net>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Fixes for building on Solaris 11.4.42 CBE
Date: Mon, 14 Mar 2022 21:20:22 -0500
Message-Id: <20220315022025.18908-1-adeason@sinenomine.net>
X-Mailer: git-send-email 2.11.0
X-Classification-ID: dfe4ae03-7d50-4331-ad7e-e8686e56eaca-1-1
Received-SPF: pass client-ip=173.203.187.121;
 envelope-from=adeason@sinenomine.net; helo=smtp121.iad3a.emailsrvr.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Changes since v1:
- Change the CONFIG_MADVISE checks to not be platform-specific
- Add the last commit removing util/osdep.c cruft

Andrew Deason (3):
  util/osdep: Avoid madvise proto on modern Solaris
  hw/i386/acpi-build: Avoid 'sun' identifier
  util/osdep: Remove some early cruft

 hw/i386/acpi-build.c |  4 ++--
 meson.build          | 17 +++++++++++++++--
 util/osdep.c         |  5 +----
 3 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.11.0


