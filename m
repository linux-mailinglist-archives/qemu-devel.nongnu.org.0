Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E136E1423
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 20:27:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn1ew-0002BU-Qv; Thu, 13 Apr 2023 14:27:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pn1ek-0002B6-Me
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:26:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pn1ed-0006hP-F7
 for qemu-devel@nongnu.org; Thu, 13 Apr 2023 14:26:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681410401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=G2a6dMHT+8lfKNfScR6YBS5ZElx21DJviOulLExTHK0=;
 b=fH9O0fzbkSWqv6lzyTJiG+fxc5UIHcl+nidujbqgbuCfjESaMqtM5Ey7OahHb/ySZdbp5S
 npJiAIpF97ZMEBz5vchJVBC5cbrky8fMKWLUZdjpKdd8flxtJxaFDAM8YHf34LbY07FCPm
 Zn5yl8LosV3tZJJ9UtWn4XD6I+VGEZQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-175-DlqVCiPdPA2fVgN_erd3pw-1; Thu, 13 Apr 2023 14:26:40 -0400
X-MC-Unique: DlqVCiPdPA2fVgN_erd3pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B264485530D;
 Thu, 13 Apr 2023 18:26:39 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDDC52027044;
 Thu, 13 Apr 2023 18:26:38 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] hw/core: Move numa.c into the target independent source set
Date: Thu, 13 Apr 2023 20:26:36 +0200
Message-Id: <20230413182636.139356-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is nothing that depends on target specific macros in this
file, so we can move it to the common source set to avoid that
we have to compile this file multiple times (one time for each
target).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 7a4d02b6c0..ae977c9396 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -44,6 +44,7 @@ softmmu_ss.add(files(
   'machine.c',
   'nmi.c',
   'null-machine.c',
+  'numa.c',
   'qdev-fw.c',
   'qdev-properties-system.c',
   'sysbus.c',
@@ -53,5 +54,4 @@ softmmu_ss.add(files(
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
-  'numa.c',
 ))
-- 
2.31.1


