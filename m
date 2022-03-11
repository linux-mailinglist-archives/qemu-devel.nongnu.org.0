Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3836A4D63E7
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 15:41:01 +0100 (CET)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSgRw-0008FF-9O
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 09:41:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSgQZ-0007aT-Af
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:39:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1nSgQW-00042k-0t
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 09:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647009571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=alQK0f99wYBgliwicdHivhZQ2tFDklbHFayhRnE9BAs=;
 b=OGYN0a+wF/oxT34lO8ZdemG1d8ba069p3ruplDHHIfwJpjQ0qB1RoePIzl0COS8Ijbxsrz
 zHeB+eoHVekRwv3zwQX6tkIB8y2OUJqsjzIykqY1m9wgXFDJ8TFSHP16Uyou3KJnUHvQZ1
 tejXhe6NbUw353QRNeB4pe2iMa6ScAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-173-RYjaGFm3MACeM9l0-jfWaw-1; Fri, 11 Mar 2022 09:39:27 -0500
X-MC-Unique: RYjaGFm3MACeM9l0-jfWaw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A18B835DE0;
 Fri, 11 Mar 2022 14:39:25 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3AE181059153;
 Fri, 11 Mar 2022 14:39:03 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] x86: q35: require split irqchip for large CPU count
Date: Fri, 11 Mar 2022 09:39:01 -0500
Message-Id: <20220311143901.96481-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pbonzini@redhat.com, dwmw2@infradead.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

if VM is started with:

   -enable-kvm -smp 256

without specifying 'split' irqchip, VM might eventually boot
but no more than 255 CPUs will be operational and following
error messages in guest could be observed:
   ...
   smpboot: native_cpu_up: bad cpu 256
   ...
It's a regression introduced by [1], which removed dependency
on intremap=on that were implicitly requiring 'split' irqchip
and forgot to check for 'split' irqchip.
Instead of letting VM boot a broken VM, error out and tell
user how to fix CLI.

Fixes: c1bb5418e ("target/i386: Support up to 32768 CPUs without IRQ remapping")
Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2060691
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/pc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index fd55fc725c..a612df5241 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -743,9 +743,9 @@ void pc_machine_done(Notifier *notifier, void *data)
 
 
     if (x86ms->apic_id_limit > 255 && !xen_enabled() &&
-        !kvm_irqchip_in_kernel()) {
-        error_report("current -smp configuration requires kernel "
-                     "irqchip support.");
+        !kvm_irqchip_is_split()) {
+        error_report("current -smp configuration requires 'split' irqchip,"
+                     "ensure that '-machine kernel-irqchip=split' is used.");
         exit(EXIT_FAILURE);
     }
 }
-- 
2.31.1


