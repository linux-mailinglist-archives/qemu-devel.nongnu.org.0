Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7EDC402961
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:07:09 +0200 (CEST)
Received: from localhost ([::1]:45036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaoe-0007Sv-Uo
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:07:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaB3-0000Rg-Q5
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNaAx-0000Kx-CX
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhGnKr6ZqWdteqsKevxCBVGezoJVsxx1I6b8HFCfc74=;
 b=adhBMWtfAyQjOP7zpxrk6EQZtMSPu4I7HjLeYp2o6aQRHtnMlXjGMdRX1cY/Zd60AwJ391
 gp98/aza7boExnbjE9gNKlnsn+5wx+P8T1NuAzdH4Ma+EBFa6gJQWbqMoDCyx6bHJ41lB4
 kAgd69JZdSBn59TUeguYnEGtn9ndB40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-hE2zLGVJOtmbzxZ1thhw6g-1; Tue, 07 Sep 2021 08:26:04 -0400
X-MC-Unique: hE2zLGVJOtmbzxZ1thhw6g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 39DDD101371B
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:26:03 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3AED78433;
 Tue,  7 Sep 2021 12:26:01 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 28/32] qga/rust: implement get-host-name in Rust (example)
Date: Tue,  7 Sep 2021 16:19:39 +0400
Message-Id: <20210907121943.3498701-29-marcandre.lureau@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Use the "hostname" crate (https://github.com/svartalf/hostname)

(notice the wrong error message in our win32 implementation)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/qemu/osdep.h  | 10 ----------
 qga/commands.c        | 20 ++++----------------
 tests/unit/test-qga.c |  2 ++
 util/oslib-posix.c    | 35 -----------------------------------
 util/oslib-win32.c    | 13 -------------
 Cargo.lock            | 40 ++++++++++++++++++++++++++++++++++++++++
 qga/Cargo.toml        |  1 +
 qga/lib.rs            |  3 +++
 qga/qmp/hostname.rs   |  9 +++++++++
 qga/qmp/mod.rs        | 10 ++++++++++
 10 files changed, 69 insertions(+), 74 deletions(-)
 create mode 100644 qga/qmp/hostname.rs
 create mode 100644 qga/qmp/mod.rs

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 60718fc342..ca8f3465d2 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -740,16 +740,6 @@ static inline void qemu_reset_optind(void)
 #endif
 }
 
-/**
- * qemu_get_host_name:
- * @errp: Error object
- *
- * Operating system agnostic way of querying host name.
- *
- * Returns allocated hostname (caller should free), NULL on failure.
- */
-char *qemu_get_host_name(Error **errp);
-
 /**
  * qemu_get_host_physmem:
  *
diff --git a/qga/commands.c b/qga/commands.c
index 80501e4a73..117c219ac4 100644
--- a/qga/commands.c
+++ b/qga/commands.c
@@ -508,25 +508,13 @@ int ga_parse_whence(GuestFileWhence *whence, Error **errp)
     return -1;
 }
 
+#ifndef CONFIG_WITH_RUST
 GuestHostName *qmp_guest_get_host_name(Error **errp)
 {
-    GuestHostName *result = NULL;
-    g_autofree char *hostname = qemu_get_host_name(errp);
-
-    /*
-     * We want to avoid using g_get_host_name() because that
-     * caches the result and we wouldn't reflect changes in the
-     * host name.
-     */
-
-    if (!hostname) {
-        hostname = g_strdup("localhost");
-    }
-
-    result = g_new0(GuestHostName, 1);
-    result->host_name = g_steal_pointer(&hostname);
-    return result;
+    error_setg(errp, QERR_UNSUPPORTED);
+    return NULL;
 }
+#endif
 
 GuestTimezone *qmp_guest_get_timezone(Error **errp)
 {
diff --git a/tests/unit/test-qga.c b/tests/unit/test-qga.c
index 5cb140d1b5..a22ab8c82c 100644
--- a/tests/unit/test-qga.c
+++ b/tests/unit/test-qga.c
@@ -864,6 +864,7 @@ static void test_qga_guest_exec_invalid(gconstpointer fix)
 
 static void test_qga_guest_get_host_name(gconstpointer fix)
 {
+#ifdef CONFIG_WITH_RUST
     const TestFixture *fixture = fix;
     QDict *ret, *val;
 
@@ -875,6 +876,7 @@ static void test_qga_guest_get_host_name(gconstpointer fix)
     g_assert(qdict_haskey(val, "host-name"));
 
     qobject_unref(ret);
+#endif
 }
 
 static void test_qga_guest_get_timezone(gconstpointer fix)
diff --git a/util/oslib-posix.c b/util/oslib-posix.c
index e8bdb02e1d..1498e0b7f5 100644
--- a/util/oslib-posix.c
+++ b/util/oslib-posix.c
@@ -809,41 +809,6 @@ void sigaction_invoke(struct sigaction *action,
     action->sa_sigaction(info->ssi_signo, &si, NULL);
 }
 
-#ifndef HOST_NAME_MAX
-# ifdef _POSIX_HOST_NAME_MAX
-#  define HOST_NAME_MAX _POSIX_HOST_NAME_MAX
-# else
-#  define HOST_NAME_MAX 255
-# endif
-#endif
-
-char *qemu_get_host_name(Error **errp)
-{
-    long len = -1;
-    g_autofree char *hostname = NULL;
-
-#ifdef _SC_HOST_NAME_MAX
-    len = sysconf(_SC_HOST_NAME_MAX);
-#endif /* _SC_HOST_NAME_MAX */
-
-    if (len < 0) {
-        len = HOST_NAME_MAX;
-    }
-
-    /* Unfortunately, gethostname() below does not guarantee a
-     * NULL terminated string. Therefore, allocate one byte more
-     * to be sure. */
-    hostname = g_new0(char, len + 1);
-
-    if (gethostname(hostname, len) < 0) {
-        error_setg_errno(errp, errno,
-                         "cannot get hostname");
-        return NULL;
-    }
-
-    return g_steal_pointer(&hostname);
-}
-
 size_t qemu_get_host_physmem(void)
 {
 #ifdef _SC_PHYS_PAGES
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index af559ef339..575f697815 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -629,19 +629,6 @@ bool qemu_write_pidfile(const char *filename, Error **errp)
     return true;
 }
 
-char *qemu_get_host_name(Error **errp)
-{
-    wchar_t tmp[MAX_COMPUTERNAME_LENGTH + 1];
-    DWORD size = G_N_ELEMENTS(tmp);
-
-    if (GetComputerNameW(tmp, &size) == 0) {
-        error_setg_win32(errp, GetLastError(), "failed close handle");
-        return NULL;
-    }
-
-    return g_utf16_to_utf8(tmp, size, NULL, NULL, NULL);
-}
-
 size_t qemu_get_host_physmem(void)
 {
     MEMORYSTATUSEX statex;
diff --git a/Cargo.lock b/Cargo.lock
index ad5bb47762..8752dbf2ac 100644
--- a/Cargo.lock
+++ b/Cargo.lock
@@ -34,12 +34,29 @@ dependencies = [
  "nix",
 ]
 
+[[package]]
+name = "hostname"
+version = "0.3.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3c731c3e10504cc8ed35cfe2f1db4c9274c3d35fa486e3b31df46f068ef3e867"
+dependencies = [
+ "libc",
+ "match_cfg",
+ "winapi",
+]
+
 [[package]]
 name = "libc"
 version = "0.2.101"
 source = "registry+https://github.com/rust-lang/crates.io-index"
 checksum = "3cb00336871be5ed2c8ed44b60ae9959dc5b9f08539422ed43f09e34ecaeba21"
 
+[[package]]
+name = "match_cfg"
+version = "0.1.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ffbee8634e0d45d258acb448e7eaab3fce7a0a467395d4d9f228e3c1f01fb2e4"
+
 [[package]]
 name = "memoffset"
 version = "0.6.4"
@@ -74,4 +91,27 @@ name = "qga"
 version = "0.1.0"
 dependencies = [
  "common",
+ "hostname",
 ]
+
+[[package]]
+name = "winapi"
+version = "0.3.9"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419"
+dependencies = [
+ "winapi-i686-pc-windows-gnu",
+ "winapi-x86_64-pc-windows-gnu",
+]
+
+[[package]]
+name = "winapi-i686-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6"
+
+[[package]]
+name = "winapi-x86_64-pc-windows-gnu"
+version = "0.4.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f"
diff --git a/qga/Cargo.toml b/qga/Cargo.toml
index d262b847fa..387af59a30 100644
--- a/qga/Cargo.toml
+++ b/qga/Cargo.toml
@@ -6,6 +6,7 @@ publish = false
 
 [dependencies]
 common = { path = "../rust/common" }
+hostname = "0.3.1"
 
 [lib]
 path = "lib.rs"
diff --git a/qga/lib.rs b/qga/lib.rs
index 7f62788ff6..e51e211006 100644
--- a/qga/lib.rs
+++ b/qga/lib.rs
@@ -1,2 +1,5 @@
+pub use common::{err, libc, Error, Result};
+
 mod qapi;
 mod qapi_ffi;
+mod qmp;
diff --git a/qga/qmp/hostname.rs b/qga/qmp/hostname.rs
new file mode 100644
index 0000000000..c3eb1f6fd2
--- /dev/null
+++ b/qga/qmp/hostname.rs
@@ -0,0 +1,9 @@
+use crate::*;
+
+pub(crate) fn get() -> Result<qapi::GuestHostName> {
+    let host_name = hostname::get()?
+        .into_string()
+        .or_else(|_| err!("Invalid hostname"))?;
+
+    Ok(qapi::GuestHostName { host_name })
+}
diff --git a/qga/qmp/mod.rs b/qga/qmp/mod.rs
new file mode 100644
index 0000000000..c192e4247d
--- /dev/null
+++ b/qga/qmp/mod.rs
@@ -0,0 +1,10 @@
+use common::*;
+
+use crate::qapi_ffi;
+
+mod hostname;
+
+#[no_mangle]
+extern "C" fn qmp_guest_get_host_name(errp: *mut *mut ffi::Error) -> *mut qapi_ffi::GuestHostName {
+    qmp!(hostname::get(), errp)
+}
-- 
2.33.0.113.g6c40894d24


