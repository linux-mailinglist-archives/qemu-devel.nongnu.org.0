Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AF2B51F3
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 21:07:50 +0100 (CET)
Received: from localhost ([::1]:60492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kekmz-0000sV-Ik
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 15:07:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke5-0001vp-5j
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54389)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1keke3-0002BS-E9
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 14:58:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605556714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2XVz4iFoJx6xauams/X7I+T8OaFub5vx850hl0DeWt4=;
 b=UQyCh6by0H84DR+mNwsVbD80J5EZRwY9lkOjx6M4giIH9hO9CxWxUHDguLNkSZfI9hdwTU
 53GaYhFQT5hWLfk1dvqwbx4NRQNxMsxS/8SQ4VnzBRKa/cSA+jiz21yYO5ZEULJJQGvWin
 csdfuRKbl4D0iDe4GM0H/mXhK4GEk5A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-Fxvew0ATOIywS6M1Vb5_Tw-1; Mon, 16 Nov 2020 14:58:33 -0500
X-MC-Unique: Fxvew0ATOIywS6M1Vb5_Tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C0D95F9DB
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:58:32 +0000 (UTC)
Received: from virtlab511.virt.lab.eng.bos.redhat.com
 (virtlab511.virt.lab.eng.bos.redhat.com [10.19.152.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE19F19D6C
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 19:58:31 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/5] target/i386: avoid theoretical leak on MCE injection
Date: Mon, 16 Nov 2020 14:58:14 -0500
Message-Id: <20201116195815.48264-5-pbonzini@redhat.com>
In-Reply-To: <20201116195815.48264-1-pbonzini@redhat.com>
References: <20201116195815.48264-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/15 22:35:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

g_strdup_printf is used twice to write to the same variable, which
can theoretically cause a leak.  In practice, it is extremely
unlikely that a guest is seeing a recursive MCE and has disabled
CR4.MCE between the first and the second error, but we can fix it
and we can also make a slight improvement on the logic: CR4.MCE=0
causes a triple fault even for a non-recursive machine check, so
let's place its test first.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/helper.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/target/i386/helper.c b/target/i386/helper.c
index 516ce0cad8..034f46bcc2 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -908,16 +908,14 @@ static void do_inject_x86_mce(CPUState *cs, run_on_cpu_data data)
             return;
         }
 
-        if (recursive) {
-            need_reset = true;
-            msg = g_strdup_printf("CPU %d: Previous MCE still in progress, "
-                                  "raising triple fault", cs->cpu_index);
-        }
-
         if (!(cenv->cr[4] & CR4_MCE_MASK)) {
             need_reset = true;
             msg = g_strdup_printf("CPU %d: MCE capability is not enabled, "
                                   "raising triple fault", cs->cpu_index);
+        } else if (recursive) {
+            need_reset = true;
+            msg = g_strdup_printf("CPU %d: Previous MCE still in progress, "
+                                  "raising triple fault", cs->cpu_index);
         }
 
         if (need_reset) {
-- 
2.26.2



