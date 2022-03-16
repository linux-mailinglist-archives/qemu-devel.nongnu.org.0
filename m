Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9144DB18B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:33:40 +0100 (CET)
Received: from localhost ([::1]:38390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTmV-00025M-Lp
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:33:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdQ-0004Pk-Fy
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nUTdN-00045x-Dc
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:24:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647437052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9X4C5xYImvYrSWBJgEytlSSHnMdwpZx66TgCF39K0o=;
 b=Qb5IZEdRE9yUW1gc9aL3oQCMy+QV53ykhpYpKCvTARorkZlcURKP/HiTvMhjqnzVu/D16Q
 W5awssPbzDDePvkRdR0nMIwF//81kdbKBPDDpZEepU7XwQ6K4f3jnEQjCPAZU5jCDgfAOn
 C7yK9Xz/ET0UL9Mo+ck96YrgY9RTuG0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-HTDmjeujPb2u1uKdjJGFWw-1; Wed, 16 Mar 2022 09:24:11 -0400
X-MC-Unique: HTDmjeujPb2u1uKdjJGFWw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9D4441044567;
 Wed, 16 Mar 2022 13:24:08 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC0DA401E47;
 Wed, 16 Mar 2022 13:24:07 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] hw/display/vga: Report a proper error when adding a 2nd
 ISA VGA
Date: Wed, 16 Mar 2022 14:24:02 +0100
Message-Id: <20220316132402.1190346-4-thuth@redhat.com>
In-Reply-To: <20220316132402.1190346-1-thuth@redhat.com>
References: <20220316132402.1190346-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU currently abort()s if the user tries to add a second ISA VGA
device, for example:

$ ./qemu-system-x86_64 -device isa-vga -device isa-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)
$ ./qemu-system-x86_64 -device isa-cirrus-vga -device isa-cirrus-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)
$ ./qemu-system-mips64el -M pica61 -device isa-vga
RAMBlock "vga.vram" already registered, abort!
Aborted (core dumped)

Such a crash should never happen just because of giving bad parameters
at the command line. Let's return a proper error message instead.
(The idea is based on an original patch by Jose R. Ziviani for the
isa-vga device, but this now fixes it for the isa-cirrus-vga device, too)

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/display/vga.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/display/vga.c b/hw/display/vga.c
index 7fc6ab7e4f..1dca3dd7c0 100644
--- a/hw/display/vga.c
+++ b/hw/display/vga.c
@@ -2206,6 +2206,12 @@ void vga_common_init(VGACommonState *s, Object *obj, Error **errp)
     s->vbe_size_mask = s->vbe_size - 1;
 
     s->is_vbe_vmstate = 1;
+
+    if (s->global_vmstate && qemu_ram_block_by_name("vga.vram")) {
+        error_setg(errp, "A global VGA device has already been registered");
+        return;
+    }
+
     memory_region_init_ram_nomigrate(&s->vram, obj, "vga.vram", s->vram_size,
                                      &local_err);
     if (local_err) {
-- 
2.27.0


