Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 675C2426EEE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 18:25:57 +0200 (CEST)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYsh1-00024J-40
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 12:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1mYsf6-0000xe-HB
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 12:23:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23435)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crobinso@redhat.com>)
 id 1mYsf2-0000GT-5K
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 12:23:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633710230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Zj6o8slAvh6ymRS2f8q19U9bSkcQ4A30RElmflBs0v0=;
 b=eldM5fZCFB2KvunZNhA7z7ru2PBu82Edm7kfZGDRQkgRXNnPyHK2+zmiCZEIMmIgIylCvH
 DAlgZIoL+ORYHn3eDN0qD2/+KTXFQs1kjJvYgnVkRvPYGhUUOOM8J+vDzlyCXEG1qHoAsg
 0BEBNOrmAR0EXLoacgZikpSO8g751wg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-ymxq75C8OKeLWOkvtCIv4g-1; Fri, 08 Oct 2021 12:21:07 -0400
X-MC-Unique: ymxq75C8OKeLWOkvtCIv4g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E112B1B2C981;
 Fri,  8 Oct 2021 16:21:05 +0000 (UTC)
Received: from worklaptop.home (unknown [10.22.17.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07751100763C;
 Fri,  8 Oct 2021 16:21:04 +0000 (UTC)
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] tests: tcg: Fix PVH test with binutils 2.36+
Date: Fri,  8 Oct 2021 12:21:01 -0400
Message-Id: <5ab2a54c262c61f64c22dbb49ade3e2db8a740bb.1633708346.git.crobinso@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crobinso@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crobinso@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.051,
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
Cc: alex.bennee@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 richard.henderson@linaro.org, ehabkost@redhat.com,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

binutils started adding a .note.gnu.property ELF section which
makes the PVH test fail:

  TEST    hello on x86_64
qemu-system-x86_64: Error loading uncompressed kernel without PVH ELF Note

Discard .note.gnu* while keeping the PVH .note bits intact.

This also strips the build-id note, so drop the related comment.

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 tests/tcg/x86_64/system/kernel.ld | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/x86_64/system/kernel.ld b/tests/tcg/x86_64/system/kernel.ld
index 49c12b04ae..ca5d6bd850 100644
--- a/tests/tcg/x86_64/system/kernel.ld
+++ b/tests/tcg/x86_64/system/kernel.ld
@@ -16,7 +16,10 @@ SECTIONS {
 		*(.rodata)
 	} :text
 
-        /* Keep build ID and PVH notes in same section */
+        /DISCARD/ : {
+                *(.note.gnu*)
+        }
+
         .notes :  {
                *(.note.*)
         } :note
-- 
2.32.0


