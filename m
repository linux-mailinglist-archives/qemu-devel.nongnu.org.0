Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A802301610
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 15:50:29 +0100 (CET)
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3KFA-0002mB-CV
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 09:50:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxK-0003m4-MU
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:27354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l3JxI-0005u5-GY
 for qemu-devel@nongnu.org; Sat, 23 Jan 2021 09:32:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611412319;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tM7vtvo9BC9EoGxReCD4/DcMGzq8Euks9dsGqHEC68U=;
 b=eoyPb6az28JEqIH2DimJ7MidW0Kv/Q4JATJ1tLCPLh35sff9zJvtBCZE5v5JHt9wAUPvg1
 jkHmr8/dx5ij51CN3d3Gd2o68zx28Te+xVOwXO8+gQgdOX9UtbFaxVlHA7BxTOeJDe1O+f
 XwIXM3gWwEwC0+Aj0dvmr3IVzH3FT9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-tNd5yXJZNTGRzpiH5pfAGw-1; Sat, 23 Jan 2021 09:31:57 -0500
X-MC-Unique: tNd5yXJZNTGRzpiH5pfAGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0707D1005513
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:57 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C75885D9CC
 for <qemu-devel@nongnu.org>; Sat, 23 Jan 2021 14:31:56 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 25/31] acceptance: switch to QMP change-vnc-password command
Date: Sat, 23 Jan 2021 09:31:22 -0500
Message-Id: <20210123143128.1167797-26-pbonzini@redhat.com>
In-Reply-To: <20210123143128.1167797-1-pbonzini@redhat.com>
References: <20210123143128.1167797-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.165,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/acceptance/vnc.py | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/tests/acceptance/vnc.py b/tests/acceptance/vnc.py
index 3f40bc2be1..22656bbcc2 100644
--- a/tests/acceptance/vnc.py
+++ b/tests/acceptance/vnc.py
@@ -24,10 +24,8 @@ class Vnc(Test):
         self.vm.add_args('-nodefaults', '-S')
         self.vm.launch()
         self.assertFalse(self.vm.qmp('query-vnc')['return']['enabled'])
-        set_password_response = self.vm.qmp('change',
-                                            device='vnc',
-                                            target='password',
-                                            arg='new_password')
+        set_password_response = self.vm.qmp('change-vnc-password',
+                                            password='new_password')
         self.assertIn('error', set_password_response)
         self.assertEqual(set_password_response['error']['class'],
                          'GenericError')
@@ -38,10 +36,8 @@ class Vnc(Test):
         self.vm.add_args('-nodefaults', '-S', '-vnc', ':0')
         self.vm.launch()
         self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
-        set_password_response = self.vm.qmp('change',
-                                            device='vnc',
-                                            target='password',
-                                            arg='new_password')
+        set_password_response = self.vm.qmp('change-vnc-password',
+                                            password='new_password')
         self.assertIn('error', set_password_response)
         self.assertEqual(set_password_response['error']['class'],
                          'GenericError')
@@ -52,8 +48,6 @@ class Vnc(Test):
         self.vm.add_args('-nodefaults', '-S', '-vnc', ':0,password')
         self.vm.launch()
         self.assertTrue(self.vm.qmp('query-vnc')['return']['enabled'])
-        set_password_response = self.vm.qmp('change',
-                                            device='vnc',
-                                            target='password',
-                                            arg='new_password')
+        set_password_response = self.vm.qmp('change-vnc-password',
+                                            password='new_password')
         self.assertEqual(set_password_response['return'], {})
-- 
2.26.2



