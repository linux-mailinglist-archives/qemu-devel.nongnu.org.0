Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 575E03CF9EC
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 14:56:30 +0200 (CEST)
Received: from localhost ([::1]:47508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pIT-0007Wm-Dd
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 08:56:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGO-0004hf-64
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29068)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGL-0008HI-5P
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785656;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDA6OMzuuNafnaDgrGqqKn+q8ASuHBGX0GdykCIu9Ow=;
 b=aE5IIhwIlbPIKCuj8WHOFM05srFpAtmDfFmiF9X35ycIKlfg0qReynbtFiX05dSd9pgvP3
 6JxB/y0zJywQ/9I+SiDfw7y9CdYSNDvvzyK+DqBqwaIocV2LLx5jyyvnn8hyI9wx9eTPeP
 o487s0zi1SUW1i1xvaDcHvXOKFeoR3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-nAyoMjfFOqOSo8pOPPcX_A-1; Tue, 20 Jul 2021 08:54:15 -0400
X-MC-Unique: nAyoMjfFOqOSo8pOPPcX_A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D7B680365C
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 085CB5D719
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0F2D4112D84C; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] migration: Unify failure check for migrate_add_blocker()
Date: Tue, 20 Jul 2021 14:54:01 +0200
Message-Id: <20210720125408.387910-10-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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

Most callers check the return value.  Some check whether it set an
error.  Functionally equivalent, but the former tends to be easier on
the eyes, so do that everywhere.

Prior art: commit c6ecec43b2 "qemu-option: Check return value instead
of @err where convenient".

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 backends/tpm/tpm_emulator.c | 3 +--
 hw/display/qxl.c            | 8 ++++----
 hw/virtio/vhost.c           | 2 +-
 target/i386/kvm/kvm.c       | 6 +++---
 target/i386/nvmm/nvmm-all.c | 3 +--
 target/i386/whpx/whpx-all.c | 3 +--
 6 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index e5f1063ab6..f8095d23d5 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -492,8 +492,7 @@ static int tpm_emulator_block_migration(TPMEmulator *tpm_emu)
         error_setg(&tpm_emu->migration_blocker,
                    "Migration disabled: TPM emulator does not support "
                    "migration");
-        migrate_add_blocker(tpm_emu->migration_blocker, &err);
-        if (err) {
+        if (migrate_add_blocker(tpm_emu->migration_blocker, &err) < 0) {
             error_report_err(err);
             error_free(tpm_emu->migration_blocker);
             tpm_emu->migration_blocker = NULL;
diff --git a/hw/display/qxl.c b/hw/display/qxl.c
index 84f99088e0..436399db76 100644
--- a/hw/display/qxl.c
+++ b/hw/display/qxl.c
@@ -680,12 +680,12 @@ static int interface_get_command(QXLInstance *sin, struct QXLCommandExt *ext)
                     msg < (void *)qxl->vga.vram_ptr ||
                     msg > ((void *)qxl->vga.vram_ptr + qxl->vga.vram_size))) {
                 if (!qxl->migration_blocker) {
-                    Error *local_err = NULL;
+                    Error *err = NULL;
+
                     error_setg(&qxl->migration_blocker,
                                "qxl: guest bug: command not in ram bar");
-                    migrate_add_blocker(qxl->migration_blocker, &local_err);
-                    if (local_err) {
-                        error_report_err(local_err);
+                    if (migrate_add_blocker(qxl->migration_blocker, &err) < 0) {
+                        error_report_err(err);
                     }
                 }
             }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index e8f85a5d2d..dbbc6b6915 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1372,7 +1372,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 
     if (hdev->migration_blocker != NULL) {
         r = migrate_add_blocker(hdev->migration_blocker, errp);
-        if (*errp) {
+        if (r < 0) {
             error_free(hdev->migration_blocker);
             goto fail_busyloop;
         }
diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 8e1bb905ca..bb72c233cc 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1421,7 +1421,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                    "'hv-passthrough' CPU flag prevents migration, use explicit"
                    " set of hv-* flags instead");
         ret = migrate_add_blocker(hv_passthrough_mig_blocker, &local_err);
-        if (local_err) {
+        if (ret < 0) {
             error_report_err(local_err);
             return ret;
         }
@@ -1435,7 +1435,7 @@ static int hyperv_init_vcpu(X86CPU *cpu)
                    " make sure SMT is disabled and/or that vCPUs are properly"
                    " pinned)");
         ret = migrate_add_blocker(hv_no_nonarch_cs_mig_blocker, &local_err);
-        if (local_err) {
+        if (ret < 0) {
             error_report_err(local_err);
             return ret;
         }
@@ -1874,7 +1874,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
                        "State blocked by non-migratable CPU device"
                        " (invtsc flag)");
             r = migrate_add_blocker(invtsc_mig_blocker, &local_err);
-            if (local_err) {
+            if (r < 0) {
                 error_report_err(local_err);
                 return r;
             }
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 7bb0d9e30e..28dee4c5ee 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -926,8 +926,7 @@ nvmm_init_vcpu(CPUState *cpu)
         error_setg(&nvmm_migration_blocker,
             "NVMM: Migration not supported");
 
-        (void)migrate_add_blocker(nvmm_migration_blocker, &local_error);
-        if (local_error) {
+        if (migrate_add_blocker(nvmm_migration_blocker, &local_error) < 0) {
             error_report_err(local_error);
             error_free(nvmm_migration_blocker);
             return -EINVAL;
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index cc8c0b984b..3e925b9da7 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -1346,8 +1346,7 @@ int whpx_init_vcpu(CPUState *cpu)
                "State blocked due to non-migratable CPUID feature support,"
                "dirty memory tracking support, and XSAVE/XRSTOR support");
 
-        (void)migrate_add_blocker(whpx_migration_blocker, &local_error);
-        if (local_error) {
+        if (migrate_add_blocker(whpx_migration_blocker, &local_error) < 0) {
             error_report_err(local_error);
             error_free(whpx_migration_blocker);
             ret = -EINVAL;
-- 
2.31.1


