Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 116F63CFA12
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:06:39 +0200 (CEST)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pSI-0007ue-3i
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:06:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGZ-0005LQ-Ex
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGX-0008LX-GY
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785668;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ooqr9i89smTm1LP2t+3BtIJJ0XQ2K2fh0uJlziD7rFo=;
 b=TDv1XplRbp9tKkOE4VnFFBH7j7BjuiIlFNVJQbanS57tyjvV/VrAMuv+Y6YFpim/ZifQFN
 yxHGb37Uz4P6tXD6PnseResXzta0uhRSr3Zl5o8KMyD/j9KD5iQENFURDyw+U5vapIbT1F
 rt6LaCcXRB9Io9gVhEyjAG6uNv7dfec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-230-qiLJ5blfMGaOGWFbiNJhKg-1; Tue, 20 Jul 2021 08:54:25 -0400
X-MC-Unique: qiLJ5blfMGaOGWFbiNJhKg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEE33101F7A3;
 Tue, 20 Jul 2021 12:54:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7802369CB4;
 Tue, 20 Jul 2021 12:54:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E9654112D841; Tue, 20 Jul 2021 14:54:08 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/16] error: Use error_fatal to simplify obvious fatal errors
 (again)
Date: Tue, 20 Jul 2021 14:53:53 +0200
Message-Id: <20210720125408.387910-2-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We did this with scripts/coccinelle/use-error_fatal.cocci before, in
commit 50beeb68094 and 007b06578ab.  This commit cleans up rarer
variations that don't seem worth matching with Coccinelle.

Cc: Thomas Huth <thuth@redhat.com>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
Cc: Peter Xu <peterx@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/s390x/ipl.c        |  6 +-----
 migration/migration.c |  7 +------
 qemu-img.c            |  6 +-----
 qemu-io.c             |  6 +-----
 qemu-nbd.c            |  5 +----
 scsi/qemu-pr-helper.c | 11 +++--------
 softmmu/vl.c          |  7 +------
 target/i386/sev.c     |  8 +-------
 ui/console.c          |  6 ++----
 ui/spice-core.c       |  7 +------
 10 files changed, 13 insertions(+), 56 deletions(-)

diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
index 8c863cf386..1821c6faee 100644
--- a/hw/s390x/ipl.c
+++ b/hw/s390x/ipl.c
@@ -711,7 +711,6 @@ int s390_ipl_pv_unpack(void)
 void s390_ipl_prepare_cpu(S390CPU *cpu)
 {
     S390IPLState *ipl = get_ipl_device();
-    Error *err = NULL;
 
     cpu->env.psw.addr = ipl->start_addr;
     cpu->env.psw.mask = IPL_PSW_MASK;
@@ -723,10 +722,7 @@ void s390_ipl_prepare_cpu(S390CPU *cpu)
         }
     }
     if (ipl->netboot) {
-        if (load_netboot_image(&err) < 0) {
-            error_report_err(err);
-            exit(1);
-        }
+        load_netboot_image(&error_fatal);
         ipl->qipl.netboot_start_addr = cpu_to_be64(ipl->start_addr);
     }
     s390_ipl_set_boot_menu(ipl);
diff --git a/migration/migration.c b/migration/migration.c
index 2d306582eb..231dc24414 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -187,8 +187,6 @@ static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
 
 void migration_object_init(void)
 {
-    Error *err = NULL;
-
     /* This can only be called once. */
     assert(!current_migration);
     current_migration = MIGRATION_OBJ(object_new(TYPE_MIGRATION));
@@ -209,10 +207,7 @@ void migration_object_init(void)
     qemu_mutex_init(&current_incoming->page_request_mutex);
     current_incoming->page_requested = g_tree_new(page_request_addr_cmp);
 
-    if (!migration_object_check(current_migration, &err)) {
-        error_report_err(err);
-        exit(1);
-    }
+    migration_object_check(current_migration, &error_fatal);
 
     blk_mig_init();
     ram_mig_init();
diff --git a/qemu-img.c b/qemu-img.c
index 797742a443..e0b438182e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5310,7 +5310,6 @@ int main(int argc, char **argv)
 {
     const img_cmd_t *cmd;
     const char *cmdname;
-    Error *local_error = NULL;
     int c;
     static const struct option long_options[] = {
         {"help", no_argument, 0, 'h'},
@@ -5328,10 +5327,7 @@ int main(int argc, char **argv)
     module_call_init(MODULE_INIT_TRACE);
     qemu_init_exec_dir(argv[0]);
 
-    if (qemu_init_main_loop(&local_error)) {
-        error_report_err(local_error);
-        exit(EXIT_FAILURE);
-    }
+    qemu_init_main_loop(&error_fatal);
 
     qcrypto_init(&error_fatal);
 
diff --git a/qemu-io.c b/qemu-io.c
index 57f07501df..3924639b92 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -529,7 +529,6 @@ int main(int argc, char **argv)
     int flags = BDRV_O_UNMAP;
     int ret;
     bool writethrough = true;
-    Error *local_error = NULL;
     QDict *opts = NULL;
     const char *format = NULL;
     bool force_share = false;
@@ -629,10 +628,7 @@ int main(int argc, char **argv)
         exit(1);
     }
 
-    if (qemu_init_main_loop(&local_error)) {
-        error_report_err(local_error);
-        exit(1);
-    }
+    qemu_init_main_loop(&error_fatal);
 
     if (!trace_init_backends()) {
         exit(1);
diff --git a/qemu-nbd.c b/qemu-nbd.c
index 26ffbf15af..65ebec598f 100644
--- a/qemu-nbd.c
+++ b/qemu-nbd.c
@@ -963,10 +963,7 @@ int main(int argc, char **argv)
         }
     }
 
-    if (qemu_init_main_loop(&local_err)) {
-        error_report_err(local_err);
-        exit(EXIT_FAILURE);
-    }
+    qemu_init_main_loop(&error_fatal);
     bdrv_init();
     atexit(qemu_nbd_shutdown);
 
diff --git a/scsi/qemu-pr-helper.c b/scsi/qemu-pr-helper.c
index 7b9389b47b..f281daeced 100644
--- a/scsi/qemu-pr-helper.c
+++ b/scsi/qemu-pr-helper.c
@@ -1044,10 +1044,7 @@ int main(int argc, char **argv)
         }
     }
 
-    if (qemu_init_main_loop(&local_err)) {
-        error_report_err(local_err);
-        exit(EXIT_FAILURE);
-    }
+    qemu_init_main_loop(&error_fatal);
 
     server_watch = qio_channel_add_watch(QIO_CHANNEL(server_ioc),
                                          G_IO_IN,
@@ -1061,10 +1058,8 @@ int main(int argc, char **argv)
         }
     }
 
-    if ((daemonize || pidfile_specified) &&
-        !qemu_write_pidfile(pidfile, &local_err)) {
-        error_report_err(local_err);
-        exit(EXIT_FAILURE);
+    if (daemonize || pidfile_specified) {
+        qemu_write_pidfile(pidfile, &error_fatal);
     }
 
 #ifdef CONFIG_LIBCAP_NG
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 4df1496101..0d2db1abc3 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2673,12 +2673,7 @@ void qmp_x_exit_preconfig(Error **errp)
     qemu_machine_creation_done();
 
     if (loadvm) {
-        Error *local_err = NULL;
-        if (!load_snapshot(loadvm, NULL, false, NULL, &local_err)) {
-            error_report_err(local_err);
-            autostart = 0;
-            exit(1);
-        }
+        load_snapshot(loadvm, NULL, false, NULL, &error_fatal);
     }
     if (replay_mode != REPLAY_MODE_NONE) {
         replay_vmstate_init();
diff --git a/target/i386/sev.c b/target/i386/sev.c
index 83df8c09f6..0b2c8f594a 100644
--- a/target/i386/sev.c
+++ b/target/i386/sev.c
@@ -737,7 +737,6 @@ static void
 sev_launch_finish(SevGuestState *sev)
 {
     int ret, error;
-    Error *local_err = NULL;
 
     trace_kvm_sev_launch_finish();
     ret = sev_ioctl(sev->sev_fd, KVM_SEV_LAUNCH_FINISH, 0, &error);
@@ -752,12 +751,7 @@ sev_launch_finish(SevGuestState *sev)
     /* add migration blocker */
     error_setg(&sev_mig_blocker,
                "SEV: Migration is not implemented");
-    ret = migrate_add_blocker(sev_mig_blocker, &local_err);
-    if (local_err) {
-        error_report_err(local_err);
-        error_free(sev_mig_blocker);
-        exit(1);
-    }
+    migrate_add_blocker(sev_mig_blocker, &error_fatal);
 }
 
 static void
diff --git a/ui/console.c b/ui/console.c
index 1103b65314..5d2e6178ff 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1508,7 +1508,6 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
         "This VM has no graphic display device.";
     static DisplaySurface *dummy;
     QemuConsole *con;
-    Error *err = NULL;
 
     assert(!dcl->ds);
 
@@ -1523,9 +1522,8 @@ void register_displaychangelistener(DisplayChangeListener *dcl)
         dcl->con->gl = dcl;
     }
 
-    if (dcl->con && !dpy_compatible_with(dcl->con, dcl, &err)) {
-        error_report_err(err);
-        exit(1);
+    if (dcl->con) {
+        dpy_compatible_with(dcl->con, dcl, &error_fatal);
     }
 
     trace_displaychangelistener_register(dcl, dcl->ops->dpy_name);
diff --git a/ui/spice-core.c b/ui/spice-core.c
index 86d43783ac..bbd7ad070b 100644
--- a/ui/spice-core.c
+++ b/ui/spice-core.c
@@ -671,18 +671,13 @@ static void qemu_spice_init(void)
     }
     passwordSecret = qemu_opt_get(opts, "password-secret");
     if (passwordSecret) {
-        Error *local_err = NULL;
         if (qemu_opt_get(opts, "password")) {
             error_report("'password' option is mutually exclusive with "
                          "'password-secret'");
             exit(1);
         }
         password = qcrypto_secret_lookup_as_utf8(passwordSecret,
-                                                 &local_err);
-        if (!password) {
-            error_report_err(local_err);
-            exit(1);
-        }
+                                                 &error_fatal);
     } else {
         str = qemu_opt_get(opts, "password");
         if (str) {
-- 
2.31.1


