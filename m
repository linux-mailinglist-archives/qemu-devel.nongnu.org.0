Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E840293F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:53:50 +0200 (CEST)
Received: from localhost ([::1]:39354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNabl-0000sZ-1M
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:53:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaB7-0000Vr-H1
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53033)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaB3-0000NV-D6
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xDSOvQHHwljQVtxLeHxQnkkpRBmp5a4O7Ndy4k1bOLs=;
 b=VWsZY0HfEFTeiy3rrdH32QnFjLKEZ3dvKG30hnSY4SlbB8tkWkBfBbXL4PMZoFPjFUWJlR
 X8Zf8LdVYVnHEgMBd6cpP/BQ6hCRn2Ott11e6ar3+iSwLxMYoBgaOVxbRDvCEPrQBleJtP
 WNHOiv+ZxDCev6prNmbp+EIel/GKO20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-YygMETnKNgmpWIhQSIV8aQ-1; Tue, 07 Sep 2021 08:26:10 -0400
X-MC-Unique: YygMETnKNgmpWIhQSIV8aQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 94B886F303
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:26:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BECF61B46B;
 Tue,  7 Sep 2021 12:26:06 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 29/32] qga/rust: implement {get,set}-vcpus in Rust (example)
Date: Tue,  7 Sep 2021 16:19:40 +0400
Message-Id: <20210907121943.3498701-30-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_OTHER_BAD_TLD=1.999, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This is a rewrite of the C version (using the nix & winapi crates).

The main difference is that Rust doesn't let you mix const/mut logic,
the way transfer_vcpu in C does. The Rust version does introduce some
duplication, but is also more strict and can prevent mistakes.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qga/commands-posix.c  | 152 ---------------------------------------
 qga/commands-win32.c  |  71 -------------------
 qga/commands.c        |  14 ++++
 tests/unit/test-qga.c |   2 +
 Cargo.lock            |   2 +
 qga/Cargo.toml        |   6 ++
 qga/qmp/mod.rs        |  20 +++++-
 qga/qmp/vcpus.rs      | 161 ++++++++++++++++++++++++++++++++++++++++++
 8 files changed, 204 insertions(+), 224 deletions(-)
 create mode 100644 qga/qmp/vcpus.rs

diff --git a/qga/commands-posix.c b/qga/commands-posix.c
index 75dbaab68e..97ca70e762 100644
--- a/qga/commands-posix.c
+++ b/qga/commands-posix.c
@@ -2371,146 +2371,6 @@ error:
     return NULL;
 }
 
-/* Transfer online/offline status between @vcpu and the guest system.
- *
- * On input either @errp or *@errp must be NULL.
- *
- * In system-to-@vcpu direction, the following @vcpu fields are accessed:
- * - R: vcpu->logical_id
- * - W: vcpu->online
- * - W: vcpu->can_offline
- *
- * In @vcpu-to-system direction, the following @vcpu fields are accessed:
- * - R: vcpu->logical_id
- * - R: vcpu->online
- *
- * Written members remain unmodified on error.
- */
-static void transfer_vcpu(GuestLogicalProcessor *vcpu, bool sys2vcpu,
-                          char *dirpath, Error **errp)
-{
-    int fd;
-    int res;
-    int dirfd;
-    static const char fn[] = "online";
-
-    dirfd = open(dirpath, O_RDONLY | O_DIRECTORY);
-    if (dirfd == -1) {
-        error_setg_errno(errp, errno, "open(\"%s\")", dirpath);
-        return;
-    }
-
-    fd = openat(dirfd, fn, sys2vcpu ? O_RDONLY : O_RDWR);
-    if (fd == -1) {
-        if (errno != ENOENT) {
-            error_setg_errno(errp, errno, "open(\"%s/%s\")", dirpath, fn);
-        } else if (sys2vcpu) {
-            vcpu->online = true;
-            vcpu->can_offline = false;
-        } else if (!vcpu->online) {
-            error_setg(errp, "logical processor #%" PRId64 " can't be "
-                       "offlined", vcpu->logical_id);
-        } /* otherwise pretend successful re-onlining */
-    } else {
-        unsigned char status;
-
-        res = pread(fd, &status, 1, 0);
-        if (res == -1) {
-            error_setg_errno(errp, errno, "pread(\"%s/%s\")", dirpath, fn);
-        } else if (res == 0) {
-            error_setg(errp, "pread(\"%s/%s\"): unexpected EOF", dirpath,
-                       fn);
-        } else if (sys2vcpu) {
-            vcpu->online = (status != '0');
-            vcpu->can_offline = true;
-        } else if (vcpu->online != (status != '0')) {
-            status = '0' + vcpu->online;
-            if (pwrite(fd, &status, 1, 0) == -1) {
-                error_setg_errno(errp, errno, "pwrite(\"%s/%s\")", dirpath,
-                                 fn);
-            }
-        } /* otherwise pretend successful re-(on|off)-lining */
-
-        res = close(fd);
-        g_assert(res == 0);
-    }
-
-    res = close(dirfd);
-    g_assert(res == 0);
-}
-
-GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
-{
-    GuestLogicalProcessorList *head, **tail;
-    const char *cpu_dir = "/sys/devices/system/cpu";
-    const gchar *line;
-    g_autoptr(GDir) cpu_gdir = NULL;
-    Error *local_err = NULL;
-
-    head = NULL;
-    tail = &head;
-    cpu_gdir = g_dir_open(cpu_dir, 0, NULL);
-
-    if (cpu_gdir == NULL) {
-        error_setg_errno(errp, errno, "failed to list entries: %s", cpu_dir);
-        return NULL;
-    }
-
-    while (local_err == NULL && (line = g_dir_read_name(cpu_gdir)) != NULL) {
-        GuestLogicalProcessor *vcpu;
-        int64_t id;
-        if (sscanf(line, "cpu%" PRId64, &id)) {
-            g_autofree char *path = g_strdup_printf("/sys/devices/system/cpu/"
-                                                    "cpu%" PRId64 "/", id);
-            vcpu = g_malloc0(sizeof *vcpu);
-            vcpu->logical_id = id;
-            vcpu->has_can_offline = true; /* lolspeak ftw */
-            transfer_vcpu(vcpu, true, path, &local_err);
-            QAPI_LIST_APPEND(tail, vcpu);
-        }
-    }
-
-    if (local_err == NULL) {
-        /* there's no guest with zero VCPUs */
-        g_assert(head != NULL);
-        return head;
-    }
-
-    qapi_free_GuestLogicalProcessorList(head);
-    error_propagate(errp, local_err);
-    return NULL;
-}
-
-int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
-{
-    int64_t processed;
-    Error *local_err = NULL;
-
-    processed = 0;
-    while (vcpus != NULL) {
-        char *path = g_strdup_printf("/sys/devices/system/cpu/cpu%" PRId64 "/",
-                                     vcpus->value->logical_id);
-
-        transfer_vcpu(vcpus->value, false, path, &local_err);
-        g_free(path);
-        if (local_err != NULL) {
-            break;
-        }
-        ++processed;
-        vcpus = vcpus->next;
-    }
-
-    if (local_err != NULL) {
-        if (processed == 0) {
-            error_propagate(errp, local_err);
-        } else {
-            error_free(local_err);
-        }
-    }
-
-    return processed;
-}
-
 void qmp_guest_set_user_password(const char *username,
                                  const char *password,
                                  bool crypted,
@@ -2946,18 +2806,6 @@ GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
     return NULL;
 }
 
-GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return NULL;
-}
-
-int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return -1;
-}
-
 void qmp_guest_set_user_password(const char *username,
                                  const char *password,
                                  bool crypted,
diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 4e84afd83b..33a3fd7218 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1816,77 +1816,6 @@ void qmp_guest_set_time(bool has_time, int64_t time_ns, Error **errp)
     }
 }
 
-GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
-{
-    PSYSTEM_LOGICAL_PROCESSOR_INFORMATION pslpi, ptr;
-    DWORD length;
-    GuestLogicalProcessorList *head, **tail;
-    Error *local_err = NULL;
-    int64_t current;
-
-    ptr = pslpi = NULL;
-    length = 0;
-    current = 0;
-    head = NULL;
-    tail = &head;
-
-    if ((GetLogicalProcessorInformation(pslpi, &length) == FALSE) &&
-        (GetLastError() == ERROR_INSUFFICIENT_BUFFER) &&
-        (length > sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION))) {
-        ptr = pslpi = g_malloc0(length);
-        if (GetLogicalProcessorInformation(pslpi, &length) == FALSE) {
-            error_setg(&local_err, "Failed to get processor information: %d",
-                       (int)GetLastError());
-        }
-    } else {
-        error_setg(&local_err,
-                   "Failed to get processor information buffer length: %d",
-                   (int)GetLastError());
-    }
-
-    while ((local_err == NULL) && (length > 0)) {
-        if (pslpi->Relationship == RelationProcessorCore) {
-            ULONG_PTR cpu_bits = pslpi->ProcessorMask;
-
-            while (cpu_bits > 0) {
-                if (!!(cpu_bits & 1)) {
-                    GuestLogicalProcessor *vcpu;
-
-                    vcpu = g_malloc0(sizeof *vcpu);
-                    vcpu->logical_id = current++;
-                    vcpu->online = true;
-                    vcpu->has_can_offline = true;
-
-                    QAPI_LIST_APPEND(tail, vcpu);
-                }
-                cpu_bits >>= 1;
-            }
-        }
-        length -= sizeof(SYSTEM_LOGICAL_PROCESSOR_INFORMATION);
-        pslpi++; /* next entry */
-    }
-
-    g_free(ptr);
-
-    if (local_err == NULL) {
-        if (head != NULL) {
-            return head;
-        }
-        /* there's no guest with zero VCPUs */
-        error_setg(&local_err, "Guest reported zero VCPUs");
-    }
-
-    qapi_free_GuestLogicalProcessorList(head);
-    error_propagate(errp, local_err);
-    return NULL;
-}
-
-int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
-{
-    error_setg(errp, QERR_UNSUPPORTED);
-    return -1;
-}
-
 static gchar *
 get_net_error_message(gint error)
 {
diff --git a/qga/commands.c b/qga/commands.c
index 117c219ac4..d5ad904480 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -573,3 +573,17 @@ GuestFileRead *qmp_guest_file_read(int64_t handle, bool has_count,
 
     return read_data;
 }
+
+#ifndef CONFIG_WITH_RUST
+GuestLogicalProcessorList *qmp_guest_get_vcpus(Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
+}
+
+int64_t qmp_guest_set_vcpus(GuestLogicalProcessorList *vcpus, Error **errp)
+{
+    error_setg(errp, QERR_UNSUPPORTED);
+    return 0;
+}
+#endif
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index a22ab8c82c..47fd8eb717 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -308,6 +308,7 @@ static void test_qga_info(gconstpointer fix)
 
 static void test_qga_get_vcpus(gconstpointer fix)
 {
+#ifdef CONFIG_WITH_RUST
     const TestFixture *fixture = fix;
     QDict *ret;
     QList *list;
@@ -324,6 +325,7 @@ static void test_qga_get_vcpus(gconstpointer fix)
     g_assert(qdict_haskey(qobject_to(QDict, entry->value), "logical-id"));
 
     qobject_unref(ret);
+#endif
 }
 
 static void test_qga_get_fsinfo(gconstpointer fix)
diff --git a/Cargo.lock b/Cargo.lock
index 8752dbf2ac..f3d2631865 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -92,6 +92,8 @@ version = "0.1.0"
 dependencies = [
  "common",
  "hostname",
+ "nix",
+ "winapi",
 ]
 
 [[package]]
diff --git a/qga/Cargo.toml b/qga/Cargo.toml
index 387af59a30..0661b8b7c6 100644
--- a/qga/Cargo.toml
+++ b/qga/Cargo.toml
@@ -8,6 +8,12 @@ publish = false
 common = { path = "../rust/common" }
 hostname = "0.3.1"
 
+[target."cfg(unix)".dependencies]
+nix = "0.20.0"
+
+[target."cfg(windows)".dependencies]
+winapi = { version = "0.3.9", features = ["sysinfoapi", "winnt"] }
+
 [lib]
 path = "lib.rs"
 crate-type = ["staticlib"]
diff --git a/qga/qmp/mod.rs b/qga/qmp/mod.rs
index c192e4247d..5b4f17a07d 100644
--- a/qga/qmp/mod.rs
+++ b/qga/qmp/mod.rs
@@ -1,6 +1,6 @@
 use common::*;
 
-use crate::qapi_ffi;
+use crate::{qapi::NewPtr, qapi_ffi};
 
 mod hostname;
 
@@ -8,3 +8,21 @@ mod hostname;
 extern "C" fn qmp_guest_get_host_name(errp: *mut *mut ffi::Error) -> *mut qapi_ffi::GuestHostName {
     qmp!(hostname::get(), errp)
 }
+
+mod vcpus;
+
+#[no_mangle]
+extern "C" fn qmp_guest_get_vcpus(
+    errp: *mut *mut ffi::Error,
+) -> *mut qapi_ffi::GuestLogicalProcessorList {
+    qmp!(vcpus::get(), errp)
+}
+
+#[no_mangle]
+extern "C" fn qmp_guest_set_vcpus(
+    vcpus: *const qapi_ffi::GuestLogicalProcessorList,
+    errp: *mut *mut ffi::Error,
+) -> libc::c_longlong {
+    let vcpus = unsafe { from_qemu_none(NewPtr(vcpus)) };
+    qmp!(vcpus::set(vcpus), errp, -1)
+}
diff --git a/qga/qmp/vcpus.rs b/qga/qmp/vcpus.rs
new file mode 100644
index 0000000000..f86838355e
--- /dev/null
+++ b/qga/qmp/vcpus.rs
@@ -0,0 +1,161 @@
+#[cfg(unix)]
+use std::fs::OpenOptions;
+#[cfg(unix)]
+use std::io::ErrorKind;
+#[cfg(unix)]
+use std::os::unix::fs::FileExt;
+
+#[cfg(windows)]
+use winapi::um::{sysinfoapi, winnt};
+
+use crate::*;
+
+#[cfg(target_os = "linux")]
+fn get_sysfs_cpu_path(id: i64) -> String {
+    format!("/sys/devices/system/cpu/cpu{}", id)
+}
+
+#[cfg(target_os = "linux")]
+fn set_vcpu(vcpu: &qapi::GuestLogicalProcessor) -> Result<()> {
+    let path = get_sysfs_cpu_path(vcpu.logical_id);
+    std::fs::metadata(&path)?;
+
+    let path = format!("{}/online", path);
+    match OpenOptions::new().read(true).write(true).open(&path) {
+        Ok(file) => {
+            let mut buf = [0u8; 1];
+            file.read_exact_at(&mut buf, 0)?;
+            let online = buf[0] != 0;
+            if vcpu.online != online {
+                buf[0] = if vcpu.online { b'1' } else { b'0' };
+                file.write_all_at(&buf, 0)?;
+            }
+        }
+        Err(e) => {
+            if e.kind() != ErrorKind::NotFound {
+                return Err(e.into());
+            } else if !vcpu.online {
+                return err!(format!(
+                    "logical processor #{} can't be offlined",
+                    vcpu.logical_id
+                ));
+            }
+        }
+    }
+
+    Ok(())
+}
+
+#[cfg(not(target_os = "linux"))]
+fn set_vcpu(_vcpu: &qapi::GuestLogicalProcessor) -> Result<()> {
+    err!("unimplemented")
+}
+
+pub(crate) fn set(vcpus: Vec<qapi::GuestLogicalProcessor>) -> Result<i64> {
+    let mut processed = 0;
+
+    for vcpu in &vcpus {
+        if let Err(e) = set_vcpu(vcpu) {
+            if processed != 0 {
+                break;
+            }
+            return Err(e);
+        }
+
+        processed += 1;
+    }
+
+    Ok(processed)
+}
+
+#[cfg(target_os = "linux")]
+pub(crate) fn get() -> Result<Vec<qapi::GuestLogicalProcessor>> {
+    use nix::unistd::sysconf;
+
+    let mut vcpus = vec![];
+    let nproc_conf = match sysconf(unsafe { std::mem::transmute(libc::_SC_NPROCESSORS_CONF) })? {
+        Some(nproc) => nproc,
+        None => {
+            return err!("Indefinite number of processors.");
+        }
+    };
+
+    for logical_id in 0..nproc_conf {
+        let path = get_sysfs_cpu_path(logical_id);
+        if std::fs::metadata(&path).is_err() {
+            continue;
+        }
+
+        let path = format!("{}/online", path);
+        let (online, can_offline) = match OpenOptions::new().read(true).open(&path) {
+            Ok(file) => {
+                let mut buf = [0u8; 1];
+                file.read_exact_at(&mut buf, 0)?;
+                (buf[0] != 0, Some(true))
+            }
+            Err(e) => {
+                if e.kind() != ErrorKind::NotFound {
+                    return Err(e.into());
+                }
+                (true, Some(false))
+            }
+        };
+
+        vcpus.push(qapi::GuestLogicalProcessor {
+            logical_id,
+            online,
+            can_offline,
+        });
+    }
+
+    Ok(vcpus)
+}
+
+#[cfg(target_os = "windows")]
+fn get_logical_processor_info() -> Result<Vec<winnt::SYSTEM_LOGICAL_PROCESSOR_INFORMATION>> {
+    unsafe {
+        let mut needed_size = 0;
+        sysinfoapi::GetLogicalProcessorInformation(std::ptr::null_mut(), &mut needed_size);
+        let struct_size = std::mem::size_of::<winnt::SYSTEM_LOGICAL_PROCESSOR_INFORMATION>() as u32;
+        if needed_size == 0 || needed_size < struct_size || needed_size % struct_size != 0 {
+            return err!("Failed to get processor information");
+        }
+
+        let nstruct = needed_size / struct_size;
+        let mut buf = Vec::with_capacity(nstruct as usize);
+        let result = sysinfoapi::GetLogicalProcessorInformation(buf.as_mut_ptr(), &mut needed_size);
+        if result == 0 {
+            return err!("Failed to get processor information");
+        }
+
+        let nstruct = needed_size / struct_size;
+        buf.set_len(nstruct as usize);
+        Ok(buf)
+    }
+}
+
+#[cfg(target_os = "windows")]
+pub(crate) fn get() -> Result<Vec<qapi::GuestLogicalProcessor>> {
+    let mut vcpus = vec![];
+
+    get_logical_processor_info()?.iter().map(|info| {
+        for _ in 0..info.ProcessorMask.count_ones() {
+            vcpus.push(qapi::GuestLogicalProcessor {
+                logical_id: vcpus.len() as i64,
+                online: true,
+                can_offline: Some(false),
+            });
+        }
+    });
+
+    if vcpus.is_empty() {
+        return err!("Guest reported zero VCPUs");
+    }
+
+    Ok(vcpus)
+}
+
+#[cfg(not(any(target_os = "linux", target_os = "windows")))]
+pub(crate) fn get() -> Result<Vec<qapi::GuestLogicalProcessor>> {
+    err!("unimplemented")
+}
-- 
2.33.0.113.g6c40894d24


