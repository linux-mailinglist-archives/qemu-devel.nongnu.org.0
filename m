Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3FF423896
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 09:13:06 +0200 (CEST)
Received: from localhost ([::1]:36562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY16v-0002wd-E4
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 03:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY15k-0001fZ-JU
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:11:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mY15i-00033R-Rf
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 03:11:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633504310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LmFNslIIzF0gTI9vUlkVKyUj12/jxE5LkxOKLETFT88=;
 b=PTRQT8jx2OYCPOv1+1x/OTLQT6vFvPltqoG3zC7L2v5t7Brv69IrxoE0BRlszfkWRyEt7q
 UmkfKwrY9ZI5xevPFqUii5XMkEHp7/Nk1QQY9pWjHk76MUys5UsR5mFmABKa6llb3h3w41
 0yGj31RWoG06ZN9rmCi58KWJKWVpGzU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-oMu-lar9OWezaUuORKNBaA-1; Wed, 06 Oct 2021 03:11:45 -0400
X-MC-Unique: oMu-lar9OWezaUuORKNBaA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86EF3824FAA;
 Wed,  6 Oct 2021 07:11:43 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D55D9604CC;
 Wed,  6 Oct 2021 07:11:41 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/ppc: Fix iothread locking in the 405 code
Date: Wed,  6 Oct 2021 09:11:40 +0200
Message-Id: <20211006071140.565952-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using u-boot as firmware with the taihu board, QEMU aborts with
this assertion:

 ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed:
  (qemu_mutex_iothread_locked())

Running QEMU with "-d in_asm" shows that the crash happens when writing
to SPR 0x3f2, so we are missing to lock the iothread in the code path
here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/ppc/ppc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index f5d012f860..bb57f1c9ed 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -336,6 +336,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
 
+    qemu_mutex_lock_iothread();
+
     switch ((val >> 28) & 0x3) {
     case 0x0:
         /* No action */
@@ -353,6 +355,8 @@ void store_40x_dbcr0(CPUPPCState *env, uint32_t val)
         ppc40x_system_reset(cpu);
         break;
     }
+
+    qemu_mutex_unlock_iothread();
 }
 
 /* PowerPC 40x internal IRQ controller */
-- 
2.27.0


