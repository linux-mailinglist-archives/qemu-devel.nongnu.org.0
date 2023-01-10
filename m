Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D316646E7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 18:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6X-0003WV-Il; Tue, 10 Jan 2023 11:04:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5p-00033V-E1
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH5n-00051k-8K
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qFzwud0tCEEBPQ1AKKxOkIC1M2ZNueA5Gpue5JhlQOc=;
 b=GZ3d1Axxcks3AhWXeJkisticZZr7g2F8rZzE9f+QhGB4BxTmL9dvIUaVnnlJ5bOH4bJFCP
 30Uf9+lwpVcjUUWhjKk5Hz/SQvR1kbOMj3qthJSkTCQU0fiZNmrD+PPVJ3Hh2ClgE/M3qd
 nCo9iumRjc5/8ePQpBVZFRHAieDccDA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-553-J1HvgjjsMTSrGeFzYGRbbA-1; Tue, 10 Jan 2023 11:03:12 -0500
X-MC-Unique: J1HvgjjsMTSrGeFzYGRbbA-1
Received: by mail-wm1-f70.google.com with SMTP id
 q19-20020a1cf313000000b003d96c95e2f9so2676566wmq.2
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFzwud0tCEEBPQ1AKKxOkIC1M2ZNueA5Gpue5JhlQOc=;
 b=1VMLRTl30D8bEeE0HEn8gLOsfFXH9YrtIN/tDI7PE9JjdYtC9TQzlqwga3X38qI4M/
 12fuVOtcoZLWossGyUNIWmxXaZ/Lwi0LtnqCNwhM1ygSwS/6GDtZqRvmfaa9DP22AaHD
 vdP9v/nZGMdcHOKRd902uDuJuPQp9r4lCguukLXPFuYsXXQNPrTa+r/8NDx8VDNvax+7
 WwgaKN7TbRU2YG7V3yB2F2tc5LH0mdA35+KY2xPJ7XoKuwnaGqWBz/hApNJz/ZfbX6aa
 6cek406ScKz8r2CdFftsrriIYpPKUVhCxiiywVKfklIdX96nk58YI/W2iFvZt8gfKLPa
 uCpw==
X-Gm-Message-State: AFqh2ko6c1LP+LapKOAX97ogBm2txZExiRvribDUAT9WAaKzcwomPyHH
 o3kiDqVOYBDrmEkHaoYNyBJ35r68CXz/rEy1vGWel2CQWbKT2OJEJi4xR9UMyyHkRe9R3PYMNG1
 5OI5EacthhAKCRg/T3oc6Y3zORJnVS8yCjzic+vEquwQtLP4pEGhyM/ZiKREwCC5+WkQ=
X-Received: by 2002:a7b:c7ca:0:b0:3d3:4cbf:3a51 with SMTP id
 z10-20020a7bc7ca000000b003d34cbf3a51mr49355561wmk.14.1673366590644; 
 Tue, 10 Jan 2023 08:03:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvSs7QNeTr0v21Yw2XkyxjU1tlziROxfUu5/+tWVAqxvZLVQ4lLoh8RoVgPwwLsRYtXNdkSBw==
X-Received: by 2002:a7b:c7ca:0:b0:3d3:4cbf:3a51 with SMTP id
 z10-20020a7bc7ca000000b003d34cbf3a51mr49355522wmk.14.1673366590222; 
 Tue, 10 Jan 2023 08:03:10 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b003c6c3fb3cf6sm15136938wmj.18.2023.01.10.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:09 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 13/29] tests: add G_GNUC_PRINTF for various functions
Date: Tue, 10 Jan 2023 17:02:17 +0100
Message-Id: <20230110160233.339771-14-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Daniel P. Berrangé <berrange@redhat.com>

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20221219130205.687815-6-berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/ahci-test.c           |  3 +++
 tests/qtest/arm-cpu-features.c    |  1 +
 tests/qtest/erst-test.c           |  2 +-
 tests/qtest/ide-test.c            |  3 ++-
 tests/qtest/ivshmem-test.c        |  4 ++--
 tests/qtest/libqmp.c              |  2 +-
 tests/qtest/libqos/libqos-pc.h    |  6 ++++--
 tests/qtest/libqos/libqos-spapr.h |  6 ++++--
 tests/qtest/libqos/libqos.h       |  6 ++++--
 tests/qtest/libqos/virtio-9p.c    |  1 +
 tests/qtest/migration-helpers.h   |  1 +
 tests/qtest/rtas-test.c           |  2 +-
 tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
 tests/unit/test-qmp-cmds.c        | 13 +++++++++----
 14 files changed, 36 insertions(+), 18 deletions(-)

diff --git a/tests/qtest/ahci-test.c b/tests/qtest/ahci-test.c
index 66652fed0465..1967cd589855 100644
--- a/tests/qtest/ahci-test.c
+++ b/tests/qtest/ahci-test.c
@@ -154,6 +154,7 @@ static void ahci_migrate(AHCIQState *from, AHCIQState *to, const char *uri)
 /**
  * Start a Q35 machine and bookmark a handle to the AHCI device.
  */
+G_GNUC_PRINTF(1, 0)
 static AHCIQState *ahci_vboot(const char *cli, va_list ap)
 {
     AHCIQState *s;
@@ -171,6 +172,7 @@ static AHCIQState *ahci_vboot(const char *cli, va_list ap)
 /**
  * Start a Q35 machine and bookmark a handle to the AHCI device.
  */
+G_GNUC_PRINTF(1, 2)
 static AHCIQState *ahci_boot(const char *cli, ...)
 {
     AHCIQState *s;
@@ -209,6 +211,7 @@ static void ahci_shutdown(AHCIQState *ahci)
  * Boot and fully enable the HBA device.
  * @see ahci_boot, ahci_pci_enable and ahci_hba_enable.
  */
+G_GNUC_PRINTF(1, 2)
 static AHCIQState *ahci_boot_and_enable(const char *cli, ...)
 {
     AHCIQState *ahci;
diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
index 5a145273860c..8691802950ca 100644
--- a/tests/qtest/arm-cpu-features.c
+++ b/tests/qtest/arm-cpu-features.c
@@ -32,6 +32,7 @@ static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
                           QUERY_TAIL, cpu_type);
 }
 
+G_GNUC_PRINTF(3, 4)
 static QDict *do_query(QTestState *qts, const char *cpu_type,
                        const char *fmt, ...)
 {
diff --git a/tests/qtest/erst-test.c b/tests/qtest/erst-test.c
index 974e8bcfe5b7..c45bee7f054c 100644
--- a/tests/qtest/erst-test.c
+++ b/tests/qtest/erst-test.c
@@ -98,7 +98,7 @@ static void setup_vm_cmd(ERSTState *s, const char *cmd)
     const char *arch = qtest_get_arch();
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        s->qs = qtest_pc_boot(cmd);
+        s->qs = qtest_pc_boot("%s", cmd);
     } else {
         g_printerr("erst-test tests are only available on x86\n");
         exit(EXIT_FAILURE);
diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index dbe1563b230f..dcb050bf9b4d 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -125,6 +125,7 @@ static QGuestAllocator guest_malloc;
 static char *tmp_path[2];
 static char *debug_path;
 
+G_GNUC_PRINTF(1, 2)
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
     QTestState *qts;
@@ -788,7 +789,7 @@ static void test_flush_nodev(void)
     QPCIDevice *dev;
     QPCIBar bmdma_bar, ide_bar;
 
-    qts = ide_test_start("");
+    qts = ide_test_start("%s", "");
 
     dev = get_pci_device(qts, &bmdma_bar, &ide_bar);
 
diff --git a/tests/qtest/ivshmem-test.c b/tests/qtest/ivshmem-test.c
index cd550c8935ef..9bf8e78df672 100644
--- a/tests/qtest/ivshmem-test.c
+++ b/tests/qtest/ivshmem-test.c
@@ -109,9 +109,9 @@ static void setup_vm_cmd(IVState *s, const char *cmd, bool msix)
     const char *arch = qtest_get_arch();
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        s->qs = qtest_pc_boot(cmd);
+        s->qs = qtest_pc_boot("%s", cmd);
     } else if (strcmp(arch, "ppc64") == 0) {
-        s->qs = qtest_spapr_boot(cmd);
+        s->qs = qtest_spapr_boot("%s", cmd);
     } else {
         g_printerr("ivshmem-test tests are only available on x86 or ppc64\n");
         exit(EXIT_FAILURE);
diff --git a/tests/qtest/libqmp.c b/tests/qtest/libqmp.c
index 2b08382e5d1c..a89cab03c3b6 100644
--- a/tests/qtest/libqmp.c
+++ b/tests/qtest/libqmp.c
@@ -134,7 +134,7 @@ static void socket_send_fds(int socket_fd, int *fds, size_t fds_num,
  * in the case that they choose to discard all replies up until
  * a particular EVENT is received.
  */
-static void
+static G_GNUC_PRINTF(4, 0) void
 _qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                   const char *fmt, va_list ap)
 {
diff --git a/tests/qtest/libqos/libqos-pc.h b/tests/qtest/libqos/libqos-pc.h
index 1a9923ead42f..a2e4209a4932 100644
--- a/tests/qtest/libqos/libqos-pc.h
+++ b/tests/qtest/libqos/libqos-pc.h
@@ -3,8 +3,10 @@
 
 #include "libqos.h"
 
-QOSState *qtest_pc_vboot(const char *cmdline_fmt, va_list ap);
-QOSState *qtest_pc_boot(const char *cmdline_fmt, ...);
+QOSState *qtest_pc_vboot(const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(1, 0);
+QOSState *qtest_pc_boot(const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(1, 2);
 void qtest_pc_shutdown(QOSState *qs);
 
 #endif
diff --git a/tests/qtest/libqos/libqos-spapr.h b/tests/qtest/libqos/libqos-spapr.h
index c61338917acd..e4483c14f801 100644
--- a/tests/qtest/libqos/libqos-spapr.h
+++ b/tests/qtest/libqos/libqos-spapr.h
@@ -3,8 +3,10 @@
 
 #include "libqos.h"
 
-QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap);
-QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...);
+QOSState *qtest_spapr_vboot(const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(1, 0);
+QOSState *qtest_spapr_boot(const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(1, 2);
 void qtest_spapr_shutdown(QOSState *qs);
 
 /* List of capabilities needed to silence warnings with TCG */
diff --git a/tests/qtest/libqos/libqos.h b/tests/qtest/libqos/libqos.h
index 9b4dd509f08e..12d05b236595 100644
--- a/tests/qtest/libqos/libqos.h
+++ b/tests/qtest/libqos/libqos.h
@@ -21,8 +21,10 @@ struct QOSState {
     QOSOps *ops;
 };
 
-QOSState *qtest_vboot(QOSOps *ops, const char *cmdline_fmt, va_list ap);
-QOSState *qtest_boot(QOSOps *ops, const char *cmdline_fmt, ...);
+QOSState *qtest_vboot(QOSOps *ops, const char *cmdline_fmt, va_list ap)
+    G_GNUC_PRINTF(2, 0);
+QOSState *qtest_boot(QOSOps *ops, const char *cmdline_fmt, ...)
+    G_GNUC_PRINTF(2, 3);
 void qtest_common_shutdown(QOSState *qs);
 void qtest_shutdown(QOSState *qs);
 bool have_qemu_img(void);
diff --git a/tests/qtest/libqos/virtio-9p.c b/tests/qtest/libqos/virtio-9p.c
index 7f2102825622..186fcc1141ad 100644
--- a/tests/qtest/libqos/virtio-9p.c
+++ b/tests/qtest/libqos/virtio-9p.c
@@ -211,6 +211,7 @@ static void *virtio_9p_pci_create(void *pci_bus, QGuestAllocator *t_alloc,
  *                      variable arguments of this function to this
  *                      replacement string
  */
+G_GNUC_PRINTF(3, 4)
 static void regex_replace(GString *haystack, const char *pattern,
                           const char *replace_fmt, ...)
 {
diff --git a/tests/qtest/migration-helpers.h b/tests/qtest/migration-helpers.h
index db0684de48b2..a188b6278796 100644
--- a/tests/qtest/migration-helpers.h
+++ b/tests/qtest/migration-helpers.h
@@ -25,6 +25,7 @@ QDict *wait_command_fd(QTestState *who, int fd, const char *command, ...);
 G_GNUC_PRINTF(2, 3)
 QDict *wait_command(QTestState *who, const char *command, ...);
 
+G_GNUC_PRINTF(2, 3)
 QDict *qmp_command(QTestState *who, const char *command, ...);
 
 G_GNUC_PRINTF(3, 4)
diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
index 50df60e5b20e..1ba42b37d219 100644
--- a/tests/qtest/rtas-test.c
+++ b/tests/qtest/rtas-test.c
@@ -13,7 +13,7 @@ static void run_test_rtas_get_time_of_day(const char *machine)
     uint64_t ret;
     time_t t1, t2;
 
-    qs = qtest_spapr_boot(machine);
+    qs = qtest_spapr_boot("%s", machine);
 
     t1 = time(NULL);
     ret = qrtas_get_time_of_day(qs->qts, &qs->alloc, &tm, &ns);
diff --git a/tests/qtest/usb-hcd-uhci-test.c b/tests/qtest/usb-hcd-uhci-test.c
index 7a117b64d90c..f264d2bf734d 100644
--- a/tests/qtest/usb-hcd-uhci-test.c
+++ b/tests/qtest/usb-hcd-uhci-test.c
@@ -72,9 +72,9 @@ int main(int argc, char **argv)
     qtest_add_func("/uhci/pci/hotplug/usb-storage", test_usb_storage_hotplug);
 
     if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
-        qs = qtest_pc_boot(cmd);
+        qs = qtest_pc_boot("%s", cmd);
     } else if (strcmp(arch, "ppc64") == 0) {
-        qs = qtest_spapr_boot(cmd);
+        qs = qtest_spapr_boot("%s", cmd);
     } else {
         g_printerr("usb-hcd-uhci-test tests are only "
                    "available on x86 or ppc64\n");
diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
index 2373cd64cbfa..6d52b4e5d811 100644
--- a/tests/unit/test-qmp-cmds.c
+++ b/tests/unit/test-qmp-cmds.c
@@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
 }
 
 
+G_GNUC_PRINTF(2, 3)
 static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
 {
     va_list ap;
@@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
     return ret;
 }
 
+G_GNUC_PRINTF(3, 4)
 static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
                                   const char *template, ...)
 {
@@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
 
 static void test_dispatch_cmd_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-command-features1' }";
+    #define cmd "{ 'execute': 'test-command-features1' }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -287,12 +289,13 @@ static void test_dispatch_cmd_deprecated(void)
 
     compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
     do_qmp_dispatch_error(false, ERROR_CLASS_COMMAND_NOT_FOUND, cmd);
+    #undef cmd
 }
 
 static void test_dispatch_cmd_arg_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-features0',"
-        " 'arguments': { 'fs1': { 'foo': 42 } } }";
+    #define cmd "{ 'execute': 'test-features0'," \
+        " 'arguments': { 'fs1': { 'foo': 42 } } }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -310,11 +313,12 @@ static void test_dispatch_cmd_arg_deprecated(void)
 
     compat_policy.deprecated_input = COMPAT_POLICY_INPUT_REJECT;
     do_qmp_dispatch_error(false, ERROR_CLASS_GENERIC_ERROR, cmd);
+    #undef cmd
 }
 
 static void test_dispatch_cmd_ret_deprecated(void)
 {
-    const char *cmd = "{ 'execute': 'test-features0' }";
+    #define cmd "{ 'execute': 'test-features0' }"
     QDict *ret;
 
     memset(&compat_policy, 0, sizeof(compat_policy));
@@ -334,6 +338,7 @@ static void test_dispatch_cmd_ret_deprecated(void)
     ret = qobject_to(QDict, do_qmp_dispatch(false, cmd));
     assert(ret && qdict_size(ret) == 0);
     qobject_unref(ret);
+    #undef cmd
 }
 
 /* test generated dealloc functions for generated types */
-- 
2.38.1


