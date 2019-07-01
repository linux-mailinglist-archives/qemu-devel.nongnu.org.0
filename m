Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C0650B23
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 14:51:54 +0200 (CEST)
Received: from localhost ([::1]:50874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfORs-0001Ey-VM
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 08:51:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <vkuznets@redhat.com>) id 1hfOPM-0007N0-Ue
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:49:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vkuznets@redhat.com>) id 1hfOPL-0007Og-PW
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:49:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vkuznets@redhat.com>) id 1hfOPL-0007Lh-JQ
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 08:49:15 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C048687638;
 Mon, 24 Jun 2019 12:49:14 +0000 (UTC)
Received: from vitty.brq.redhat.com (unknown [10.34.244.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 504EA60BFC;
 Mon, 24 Jun 2019 12:49:13 +0000 (UTC)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2019 14:49:11 +0200
Message-Id: <20190624124911.31795-1-vkuznets@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Mon, 24 Jun 2019 12:49:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] i386/kvm: fix build with CONFIG_HYPERV=n
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Roman Kagan <rkagan@virtuozzo.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When switching from boolean properties to bits to represent Hyper-V
enlightenments we forgot to update hyperv-stub.c for CONFIG_HYPERV=3Dn
builds.

Reported-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Fixes: 2d384d7c8361 ("i386/kvm: convert hyperv enlightenments properties =
from bools to bits")
Signed-off-by: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 target/i386/hyperv-stub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/hyperv-stub.c b/target/i386/hyperv-stub.c
index fe548cbae2..0028527e79 100644
--- a/target/i386/hyperv-stub.c
+++ b/target/i386/hyperv-stub.c
@@ -15,7 +15,7 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_e=
xit *exit)
 {
     switch (exit->type) {
     case KVM_EXIT_HYPERV_SYNIC:
-        if (!cpu->hyperv_synic) {
+        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
             return -1;
         }
=20
--=20
2.20.1


