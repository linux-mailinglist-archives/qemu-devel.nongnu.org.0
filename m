Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DD92B18ED
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:21:02 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWCT-0003Tv-5A
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:21:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8o-0007mp-MI
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8m-0003px-W0
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9waHiCll9jkC8K2NE3gUVQ2pxiduXE8yB4v0+9V3JBY=;
 b=TazgsUORPqPS4Csf0zMJYgOcolen2X14tZf3iwemmOHEiNIQ9tv3XTT2KkrWD1TxzMVpaT
 LBuXuXlXqMVJ9dxIf6MpceMA/Iatsr9Zsz0mN7i6HY+lRLY9/epaLRAYKhRVWdEYPVzXC/
 XqT1PBUy+BV5Pr2ZUc2T87XuYhxNRbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-aQ97opCMO1eO3Q-eHi9LHA-1; Fri, 13 Nov 2020 05:17:07 -0500
X-MC-Unique: aQ97opCMO1eO3Q-eHi9LHA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 812F21882FBC;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D4A575125;
 Fri, 13 Nov 2020 10:17:04 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 001/122] vl: remove bios_name
Date: Fri, 13 Nov 2020 05:15:03 -0500
Message-Id: <20201113101704.1438368-1-pbonzini@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

bios_name was a legacy variable used by machine code, but it is
no more.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20201026143028.3034018-16-pbonzini@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/sysemu/sysemu.h | 1 -
 softmmu/vl.c            | 2 --
 2 files changed, 3 deletions(-)

diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
index 817ff4cf75..1336b4264a 100644
--- a/include/sysemu/sysemu.h
+++ b/include/sysemu/sysemu.h
@@ -8,7 +8,6 @@
 
 /* vl.c */
 
-extern const char *bios_name;
 extern int only_migratable;
 extern const char *qemu_name;
 extern QemuUUID qemu_uuid;
diff --git a/softmmu/vl.c b/softmmu/vl.c
index e6e0ad5a92..ab79c361b9 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -119,7 +119,6 @@
 
 static const char *data_dir[16];
 static int data_dir_idx;
-const char *bios_name = NULL;
 enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;
 int display_opengl;
 const char* keyboard_layout = NULL;
@@ -4208,7 +4207,6 @@ void qemu_init(int argc, char **argv, char **envp)
     kernel_filename = qemu_opt_get(machine_opts, "kernel");
     initrd_filename = qemu_opt_get(machine_opts, "initrd");
     kernel_cmdline = qemu_opt_get(machine_opts, "append");
-    bios_name = qemu_opt_get(machine_opts, "firmware");
 
     opts = qemu_opts_find(qemu_find_opts("boot-opts"), NULL);
     if (opts) {
-- 
2.26.2


