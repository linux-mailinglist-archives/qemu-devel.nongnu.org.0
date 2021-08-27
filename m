Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976C3F93DC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:58:01 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTwG-0005qi-8w
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpg-0000Tt-8T
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39066)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpe-0001Dc-2i
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bf6zCX1ixbXXVgnh5SbDX4tuLDD8mJ1Fj6uq0eMqyI=;
 b=Vlf9nWloUG4UeyLwH9qjYQ2QWQhIE0JjvPI555H8aWmC57q6cC7JX8c/YFTQCTxBoNqpsb
 eNj0nC2qT3/oxA/khiJS7FPwTt8prj/1iHrrfrMq+T4tV+4Z1kY40dDMo3O0792ylG8MRj
 p6A6y8EHEsa9A22xDlVSTbAJ/OXDCwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-B-4AyzrWPNGYHuFjTxUxcw-1; Fri, 27 Aug 2021 00:51:07 -0400
X-MC-Unique: B-4AyzrWPNGYHuFjTxUxcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7075640A2;
 Fri, 27 Aug 2021 04:51:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E43B960C5F;
 Fri, 27 Aug 2021 04:50:45 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7FDC511380AA; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/15] error: Use error_fatal to simplify obvious fatal errors
 (again)
Date: Fri, 27 Aug 2021 06:50:30 +0200
Message-Id: <20210827045044.388748-2-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cornelia Huck <cornelia.huck@de.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
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
Message-Id: <20210720125408.387910-2-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 041b8451a6..b169943f35 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -188,8 +188,6 @@ static gint page_request_addr_cmp(gconstpointer ap, gconstpointer bp)
 
 void migration_object_init(void)
 {
-    Error *err = NULL;
-
     /* This can only be called once. */
     assert(!current_migration);
     current_migration = MIGRATION_OBJ(object_new(TYPE_MIGRATION));
@@ -210,10 +208,7 @@ void migration_object_init(void)
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
index 908fd0cce5..d77f3e76a9 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -5350,7 +5350,6 @@ int main(int argc, char **argv)
 {
     const img_cmd_t *cmd;
     const char *cmdname;
-    Error *local_error = NULL;
     int c;
     static const struct option long_options[] = {
         {"help", no_argument, 0, 'h'},
@@ -5368,10 +5367,7 @@ int main(int argc, char **argv)
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
index 5ca11e7469..6227f8f10e 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2694,12 +2694,7 @@ void qmp_x_exit_preconfig(Error **errp)
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
index 0371055e6c..31974b8d6c 100644
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


