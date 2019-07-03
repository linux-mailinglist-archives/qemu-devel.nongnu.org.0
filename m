Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5DD5EBC8
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Jul 2019 20:44:02 +0200 (CEST)
Received: from localhost ([::1]:38516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hikEb-0004B4-Jo
	for lists+qemu-devel@lfdr.de; Wed, 03 Jul 2019 14:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56618)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hijg7-0004hj-L5
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hijg5-0000bf-TD
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hijg5-0000bH-Ny
 for qemu-devel@nongnu.org; Wed, 03 Jul 2019 14:08:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EE51CC01F278;
 Wed,  3 Jul 2019 18:08:20 +0000 (UTC)
Received: from localhost (ovpn-116-30.gru2.redhat.com [10.97.116.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE9B1001DC0;
 Wed,  3 Jul 2019 18:08:20 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Date: Wed,  3 Jul 2019 15:07:05 -0300
Message-Id: <20190703180726.31267-23-ehabkost@redhat.com>
In-Reply-To: <20190703180726.31267-1-ehabkost@redhat.com>
References: <20190703180726.31267-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 03 Jul 2019 18:08:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v4 22/43] i386: Don't print warning if phys-bits
 was set automatically
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If cpu->host_phys_bits_limit is set, QEMU will make
cpu->phys_bits be lower than host_phys_bits on some cases.  This
triggers a warning that was supposed to be printed only if
phys-bits was explicitly set in the command-line.

Reorder the code so the value of cpu->phys_bits is validated
before the cpu->host_phys_bits handling.  This will avoid
unexpected warnings when cpu->host_phys_bits_limit is set.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20190611205420.20286-1-ehabkost@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3a38fe3633..390f47adc5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -5293,15 +5293,6 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
             uint32_t host_phys_bits = x86_host_phys_bits();
             static bool warned;
 
-            if (cpu->host_phys_bits) {
-                /* The user asked for us to use the host physical bits */
-                cpu->phys_bits = host_phys_bits;
-                if (cpu->host_phys_bits_limit &&
-                    cpu->phys_bits > cpu->host_phys_bits_limit) {
-                    cpu->phys_bits = cpu->host_phys_bits_limit;
-                }
-            }
-
             /* Print a warning if the user set it to a value that's not the
              * host value.
              */
@@ -5313,6 +5304,15 @@ static void x86_cpu_realizefn(DeviceState *dev, Error **errp)
                 warned = true;
             }
 
+            if (cpu->host_phys_bits) {
+                /* The user asked for us to use the host physical bits */
+                cpu->phys_bits = host_phys_bits;
+                if (cpu->host_phys_bits_limit &&
+                    cpu->phys_bits > cpu->host_phys_bits_limit) {
+                    cpu->phys_bits = cpu->host_phys_bits_limit;
+                }
+            }
+
             if (cpu->phys_bits &&
                 (cpu->phys_bits > TARGET_PHYS_ADDR_SPACE_BITS ||
                 cpu->phys_bits < 32)) {
-- 
2.18.0.rc1.1.g3f1ff2140


