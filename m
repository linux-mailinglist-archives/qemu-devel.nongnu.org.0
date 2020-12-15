Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 438B02DB34F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 19:10:27 +0100 (CET)
Received: from localhost ([::1]:36948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpEmI-0007aO-AI
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 13:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXc-0003Ie-GH
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpEXV-0001Xx-RT
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 12:55:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608054908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqL3i0v2yrKs3N9FbBzFnSw3fUAq+mRlqpbYNuQeJ5c=;
 b=RzgYl4MABZpWW+j+oQ1YvMCitb01tSdl0VRaMGlfuqdObFV3gub6HBKJwMgalpiSDuT4kO
 F+oH7m8o5btjZF54LGk+7xFYzscScFrv8RdZE9u3rOYZyesU9EyUEoBBegHEjjhQUK1Qhd
 Y1BSYUDOsR0+uZ/B4UXoP1VwRY2kFKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-YC7SACUHMnK6eeJSoaDK1Q-1; Tue, 15 Dec 2020 12:55:03 -0500
X-MC-Unique: YC7SACUHMnK6eeJSoaDK1Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DE89A18B37E2
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 17:55:02 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D96B5D6BA;
 Tue, 15 Dec 2020 17:55:02 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 31/45] hw/core: Restrict 'fw-path-provider.c' to system mode
 emulation
Date: Tue, 15 Dec 2020 12:54:31 -0500
Message-Id: <20201215175445.1272776-32-pbonzini@redhat.com>
In-Reply-To: <20201215175445.1272776-1-pbonzini@redhat.com>
References: <20201215175445.1272776-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

fw-path-provider.c is only consumed by qdev-fw.c, which itself
is in softmmu_ss[], so we can restrict fw-path-provider.c to
softmmu too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20201207220709.4017938-1-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 4a744f3b5e..032576f571 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -1,7 +1,6 @@
 # core qdev-related obj files, also used by *-user and unit tests
 hwcore_files = files(
   'bus.c',
-  'fw-path-provider.c',
   'hotplug.c',
   'qdev-properties.c',
   'qdev.c',
@@ -25,6 +24,7 @@ common_ss.add(when: 'CONFIG_SPLIT_IRQ', if_true: files('split-irq.c'))
 common_ss.add(when: 'CONFIG_XILINX_AXI', if_true: files('stream.c'))
 
 softmmu_ss.add(files(
+  'fw-path-provider.c',
   'loader.c',
   'machine-hmp-cmds.c',
   'machine.c',
-- 
2.26.2



