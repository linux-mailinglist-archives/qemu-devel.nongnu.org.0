Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C695994DD
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 07:52:59 +0200 (CEST)
Received: from localhost ([::1]:49176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOuwE-0004od-I5
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 01:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOuiC-0003Oz-7B
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43375)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oOui0-0002o6-VD
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 01:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660887492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbzJRqak9IwZ24Po/WnRT6/Jqnt2iGn+zV4LV26v9Hs=;
 b=OZQKBhzDJIurz519bo3MXufCVjzr3l4YI2mqNr8GNP4TbaprVZUQmQRTqvA9p09vsH6OBE
 bdG/IFAWNkwP3ClO2Y2OpwTdp4BsK0XPWuNL4e6h7d2iRD6HLX21tJtrOIj5BrO/Gc4tQa
 t9H/MF+uFOAjLLkz/awGCxoay7yqzos=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-lFUL2ffwOui5b-XEztgouQ-1; Fri, 19 Aug 2022 01:38:11 -0400
X-MC-Unique: lFUL2ffwOui5b-XEztgouQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3F58E1C05EC7;
 Fri, 19 Aug 2022 05:38:11 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96C6840D2827;
 Fri, 19 Aug 2022 05:38:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Xu <peterx@redhat.com>, Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH 3/4] tests/migration/i386: Speed up the i386 migration test
 (when using TCG)
Date: Fri, 19 Aug 2022 07:38:01 +0200
Message-Id: <20220819053802.296584-4-thuth@redhat.com>
In-Reply-To: <20220819053802.296584-1-thuth@redhat.com>
References: <20220819053802.296584-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When KVM is not available, the i386 migration test also runs in a rather
slow fashion, since the guest code takes a couple of seconds to print
the "B"s on the serial console, and the migration test has to wait for
this each time. Let's increase the frequency here, too, so that the
delays in the migration tests get smaller.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/migration/i386/a-b-bootblock.h | 12 ++++++------
 tests/migration/i386/a-b-bootblock.S |  1 +
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/migration/i386/a-b-bootblock.h b/tests/migration/i386/a-b-bootblock.h
index 7d459d4fde..b7b0fce2ee 100644
--- a/tests/migration/i386/a-b-bootblock.h
+++ b/tests/migration/i386/a-b-bootblock.h
@@ -4,17 +4,17 @@
  * the header and the assembler differences in your patch submission.
  */
 unsigned char x86_bootsect[] = {
-  0xfa, 0x0f, 0x01, 0x16, 0x74, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
+  0xfa, 0x0f, 0x01, 0x16, 0x78, 0x7c, 0x66, 0xb8, 0x01, 0x00, 0x00, 0x00,
   0x0f, 0x22, 0xc0, 0x66, 0xea, 0x20, 0x7c, 0x00, 0x00, 0x08, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xe4, 0x92, 0x0c, 0x02,
   0xe6, 0x92, 0xb8, 0x10, 0x00, 0x00, 0x00, 0x8e, 0xd8, 0x66, 0xb8, 0x41,
   0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xb3, 0x00, 0xb8, 0x00, 0x00, 0x10,
   0x00, 0xfe, 0x00, 0x05, 0x00, 0x10, 0x00, 0x00, 0x3d, 0x00, 0x00, 0x40,
-  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x75, 0xe9, 0x66, 0xb8, 0x42, 0x00, 0x66,
-  0xba, 0xf8, 0x03, 0xee, 0xeb, 0xde, 0x66, 0x90, 0x00, 0x00, 0x00, 0x00,
-  0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x9a, 0xcf, 0x00,
-  0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00, 0x27, 0x00, 0x5c, 0x7c,
-  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+  0x06, 0x7c, 0xf2, 0xfe, 0xc3, 0x80, 0xe3, 0x3f, 0x75, 0xe6, 0x66, 0xb8,
+  0x42, 0x00, 0x66, 0xba, 0xf8, 0x03, 0xee, 0xeb, 0xdb, 0x8d, 0x76, 0x00,
+  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xff, 0xff, 0x00, 0x00,
+  0x00, 0x9a, 0xcf, 0x00, 0xff, 0xff, 0x00, 0x00, 0x00, 0x92, 0xcf, 0x00,
+  0x27, 0x00, 0x60, 0x7c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
   0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
diff --git a/tests/migration/i386/a-b-bootblock.S b/tests/migration/i386/a-b-bootblock.S
index 3f97f28023..3d464c7568 100644
--- a/tests/migration/i386/a-b-bootblock.S
+++ b/tests/migration/i386/a-b-bootblock.S
@@ -50,6 +50,7 @@ innerloop:
         jl innerloop
 
         inc %bl
+        andb $0x3f,%bl
         jnz mainloop
 
         mov $66,%ax
-- 
2.31.1


