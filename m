Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC32A4CADF4
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 19:54:34 +0100 (CET)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPU7N-0000zx-Vk
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 13:54:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkN-00019z-9O
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nPTkL-0000Gy-SL
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 13:30:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646245845;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z07z8CGNUIIYlCG7E922xqz5XbqR2PM+pls6kG+eRsU=;
 b=LaNzHB0GGaun4EsF+gCp6dFlNPMdtNsvyZY65ipwvgfXbQx44X5eF/Sn2KJ37CSnNyQxLT
 1hFL6lEI621X5OZbmIK2jeYxNHPse7M+NMoWW4kVY7oP2cca6h7FYT6Q2tXrF5pCkDUzDd
 juK2fkyRiWEFyYK60qBr5GwR816R6rs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-iUgNLhxVNo-pblI0l2vGag-1; Wed, 02 Mar 2022 13:30:44 -0500
X-MC-Unique: iUgNLhxVNo-pblI0l2vGag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 051A618D6A22;
 Wed,  2 Mar 2022 18:30:43 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.33.36.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66A651059166;
 Wed,  2 Mar 2022 18:30:41 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, f.ebner@proxmox.com, hreitz@redhat.com,
 jinpu.wang@ionos.com, peter.maydell@linaro.org, peterx@redhat.com,
 s.reiter@proxmox.com
Subject: [PULL 07/18] migration: Dump sub-cmd name in loadvm_process_command tp
Date: Wed,  2 Mar 2022 18:29:25 +0000
Message-Id: <20220302182936.227719-8-dgilbert@redhat.com>
In-Reply-To: <20220302182936.227719-1-dgilbert@redhat.com>
References: <20220302182936.227719-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

It'll be easier to read the name rather than index of sub-cmd when debugging.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20220301083925.33483-2-peterx@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/savevm.c     | 3 ++-
 migration/trace-events | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 1599b02fbc..7bb65e1d61 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -2273,12 +2273,13 @@ static int loadvm_process_command(QEMUFile *f)
         return qemu_file_get_error(f);
     }
 
-    trace_loadvm_process_command(cmd, len);
     if (cmd >= MIG_CMD_MAX || cmd == MIG_CMD_INVALID) {
         error_report("MIG_CMD 0x%x unknown (len 0x%x)", cmd, len);
         return -EINVAL;
     }
 
+    trace_loadvm_process_command(mig_cmd_args[cmd].name, len);
+
     if (mig_cmd_args[cmd].len != -1 && mig_cmd_args[cmd].len != len) {
         error_report("%s received with bad length - expecting %zu, got %d",
                      mig_cmd_args[cmd].name,
diff --git a/migration/trace-events b/migration/trace-events
index 48aa7b10ee..123cfe79d7 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -22,7 +22,7 @@ loadvm_postcopy_handle_resume(void) ""
 loadvm_postcopy_ram_handle_discard(void) ""
 loadvm_postcopy_ram_handle_discard_end(void) ""
 loadvm_postcopy_ram_handle_discard_header(const char *ramid, uint16_t len) "%s: %ud"
-loadvm_process_command(uint16_t com, uint16_t len) "com=0x%x len=%d"
+loadvm_process_command(const char *s, uint16_t len) "com=%s len=%d"
 loadvm_process_command_ping(uint32_t val) "0x%x"
 postcopy_ram_listen_thread_exit(void) ""
 postcopy_ram_listen_thread_start(void) ""
-- 
2.35.1


