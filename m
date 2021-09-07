Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4438740291D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 14:44:22 +0200 (CEST)
Received: from localhost ([::1]:49816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNaSb-00054N-BV
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 08:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7X-0002H4-Mq
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mNa7U-0007SU-60
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 08:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631017350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmqgzU2LG+o+OcknvY+PT66pHvYdgIWiDiBRiE4H3mQ=;
 b=ZD4/rrPXmggrS9yX4MqMiR2WwMr0D3oWqDF41XKG6MQvjO4IV1f/L7PzHY1C+Dw1vXEKya
 x6V6Wqac8Osrfk1G3boHxhE4vYy3Sll4vVCMnJ9jSZJTW5vgv92NKcyR7ZlEsv2JPfmPnl
 b/iks1VjWKh0vnajrq6+KY8ssBM/uRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584--c2sdhmjO8205pYD-hgvfQ-1; Tue, 07 Sep 2021 08:22:29 -0400
X-MC-Unique: -c2sdhmjO8205pYD-hgvfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0E74802947
 for <qemu-devel@nongnu.org>; Tue,  7 Sep 2021 12:22:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.23])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C5504369A;
 Tue,  7 Sep 2021 12:22:18 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [RFC v3 12/32] rust: provide a common crate for QEMU
Date: Tue,  7 Sep 2021 16:19:23 +0400
Message-Id: <20210907121943.3498701-13-marcandre.lureau@redhat.com>
In-Reply-To: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 stefanha@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

This crates provides common bindings and facilities for QEMU C API
shared by various projects.

Most importantly, it defines the conversion traits used to convert from
C to Rust types. Those traits are largely adapted from glib-rs, since
those have proved to be very flexible, and should guide us to bind
further QEMU types such as QOM. If glib-rs becomes a dependency, we
should consider adopting glib translate traits. For QAPI, we need a
smaller subset.

Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and it
is desirable to track the exact set of packages that are involved in
managed builds.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 Cargo.lock                   |  63 +++++
 Cargo.toml                   |   4 +-
 rust/common/Cargo.toml       |  11 +
 rust/common/src/error.rs     | 113 ++++++++
 rust/common/src/ffi.rs       |  93 +++++++
 rust/common/src/lib.rs       |  21 ++
 rust/common/src/qemu.rs      | 101 ++++++++
 rust/common/src/qmp.rs       |   0
 rust/common/src/translate.rs | 482 +++++++++++++++++++++++++++++++++++
 9 files changed, 887 insertions(+), 1 deletion(-)
 create mode 100644 Cargo.lock
 create mode 100644 rust/common/Cargo.toml
 create mode 100644 rust/common/src/error.rs
 create mode 100644 rust/common/src/ffi.rs
 create mode 100644 rust/common/src/lib.rs
 create mode 100644 rust/common/src/qemu.rs
 create mode 100644 rust/common/src/qmp.rs
 create mode 100644 rust/common/src/translate.rs

diff --git a/Cargo.lock b/Cargo.lock
new file mode 100644
index 0000000000..8dc2dd9da7
--- /dev/null
+++ b/Cargo.lock
@@ -0,0 +1,63 @@
+# This file is automatically @generated by Cargo.
+# It is not intended for manual editing.
+version = 3
+
+[[package]]
+name = "autocfg"
+version = "1.0.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"
+
+[[package]]
+name = "bitflags"
+version = "1.2.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693"
+
+[[package]]
+name = "cc"
+version = "1.0.70"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "d26a6ce4b6a484fa3edb70f7efa6fc430fd2b87285fe8b84304fd0936faa0dc0"
+
+[[package]]
+name = "cfg-if"
+version = "1.0.0"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
+
+[[package]]
+name = "common"
+version = "0.1.0"
+dependencies = [
+ "libc",
+ "nix",
+]
+
+[[package]]
+name = "libc"
+version = "0.2.101"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "3cb00336871be5ed2c8ed44b60ae9959dc5b9f08539422ed43f09e34ecaeba21"
+
+[[package]]
+name = "memoffset"
+version = "0.6.4"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "59accc507f1338036a0477ef61afdae33cde60840f4dfe481319ce3ad116ddf9"
+dependencies = [
+ "autocfg",
+]
+
+[[package]]
+name = "nix"
+version = "0.20.1"
+source = "registry+https://github.com/rust-lang/crates.io-index"
+checksum = "df8e5e343312e7fbeb2a52139114e9e702991ef9c2aea6817ff2440b35647d56"
+dependencies = [
+ "bitflags",
+ "cc",
+ "cfg-if",
+ "libc",
+ "memoffset",
+]
diff --git a/Cargo.toml b/Cargo.toml
index c4b464ff15..14131eed3c 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -1,2 +1,4 @@
 [workspace]
-members = []
+members = [
+  "rust/common",
+]
diff --git a/rust/common/Cargo.toml b/rust/common/Cargo.toml
new file mode 100644
index 0000000000..6c240447f3
--- /dev/null
+++ b/rust/common/Cargo.toml
@@ -0,0 +1,11 @@
+[package]
+name = "common"
+version = "0.1.0"
+edition = "2018"
+publish = false
+
+[dependencies]
+libc = "0.2.92"
+
+[target."cfg(unix)".dependencies]
+nix = "0.20.0"
diff --git a/rust/common/src/error.rs b/rust/common/src/error.rs
new file mode 100644
index 0000000000..f166ac42ea
--- /dev/null
+++ b/rust/common/src/error.rs
@@ -0,0 +1,113 @@
+use std::{self, ffi::CString, fmt, io, ptr};
+
+use crate::translate::*;
+use crate::{ffi, qemu};
+
+/// Common error type for QEMU and related projects.
+#[derive(Debug)]
+pub enum Error {
+    /// A generic error with file and line location.
+    FailedAt(String, &'static str, u32),
+    /// An IO error.
+    Io(io::Error),
+    #[cfg(unix)]
+    /// A nix error.
+    Nix(nix::Error),
+}
+
+/// Alias for a `Result` with the error type for QEMU.
+pub type Result<T> = std::result::Result<T, Error>;
+
+impl Error {
+    fn message(&self) -> String {
+        use Error::*;
+        match self {
+            FailedAt(msg, _, _) => msg.into(),
+            Io(io) => format!("IO error: {}", io),
+            #[cfg(unix)]
+            Nix(nix) => format!("Nix error: {}", nix),
+        }
+    }
+
+    fn location(&self) -> Option<(&'static str, u32)> {
+        use Error::*;
+        match self {
+            FailedAt(_, file, line) => Some((file, *line)),
+            Io(_) => None,
+            #[cfg(unix)]
+            Nix(_) => None,
+        }
+    }
+}
+
+impl fmt::Display for Error {
+    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
+        use Error::*;
+        match self {
+            FailedAt(msg, file, line) => write!(f, "{} ({}:{})", msg, file, line),
+            _ => write!(f, "{}", self.message()),
+        }
+    }
+}
+
+impl From<io::Error> for Error {
+    fn from(val: io::Error) -> Self {
+        Error::Io(val)
+    }
+}
+
+#[cfg(unix)]
+impl From<nix::Error> for Error {
+    fn from(val: nix::Error) -> Self {
+        Error::Nix(val)
+    }
+}
+
+impl QemuPtrDefault for Error {
+    type QemuType = *mut ffi::Error;
+}
+
+impl<'a> ToQemuPtr<'a, *mut ffi::Error> for Error {
+    type Storage = qemu::CError;
+
+    fn to_qemu_none(&'a self) -> Stash<'a, *mut ffi::Error, Self> {
+        let err = self.to_qemu_full();
+
+        Stash(err, unsafe { from_qemu_full(err) })
+    }
+
+    fn to_qemu_full(&self) -> *mut ffi::Error {
+        let cmsg =
+            CString::new(self.message()).expect("ToQemuPtr<Error>: unexpected '\0' character");
+        let mut csrc = CString::new("").unwrap();
+        let (src, line) = self.location().map_or((ptr::null(), 0_i32), |loc| {
+            csrc = CString::new(loc.0).expect("ToQemuPtr<Error>:: unexpected '\0' character");
+            (csrc.as_ptr() as *const libc::c_char, loc.1 as i32)
+        });
+        let func = ptr::null();
+
+        let mut err: *mut ffi::Error = ptr::null_mut();
+        unsafe {
+            ffi::error_setg_internal(
+                &mut err as *mut *mut _,
+                src,
+                line,
+                func,
+                cmsg.as_ptr() as *const libc::c_char,
+            );
+            err
+        }
+    }
+}
+
+/// Convenience macro to build a [`Error::FailedAt`] error.
+///
+/// Returns a `Result::Err` with the file:line location.
+/// (the error can then be converted to a QEMU `ffi::Error`)
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! err {
+    ($msg:expr) => {
+        Err(Error::FailedAt($msg.into(), file!(), line!()))
+    };
+}
diff --git a/rust/common/src/ffi.rs b/rust/common/src/ffi.rs
new file mode 100644
index 0000000000..82818d503a
--- /dev/null
+++ b/rust/common/src/ffi.rs
@@ -0,0 +1,93 @@
+//! Bindings to the raw low-level C API commonly provided by QEMU projects.
+//!
+//! Manual bindings to C API availabe when linking QEMU projects.
+//! It includes minimal glib allocation functions too, since it's the default
+//! allocator used by QEMU, and we don't depend on glib-rs crate yet).
+//!
+//! Higher-level Rust-friendly bindings are provided by different modules.
+
+use libc::{c_char, c_void, size_t};
+
+extern "C" {
+    pub fn g_malloc0(n_bytes: size_t) -> *mut c_void;
+    pub fn g_free(ptr: *mut c_void);
+    pub fn g_strndup(str: *const c_char, n: size_t) -> *mut c_char;
+}
+
+#[repr(C)]
+pub struct QObject(c_void);
+
+impl ::std::fmt::Debug for QObject {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("QObject @ {:?}", self as *const _))
+            .finish()
+    }
+}
+
+#[repr(C)]
+pub struct QNull(c_void);
+
+impl ::std::fmt::Debug for QNull {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("QNull @ {:?}", self as *const _))
+            .finish()
+    }
+}
+
+#[repr(C)]
+pub struct Error(c_void);
+
+impl ::std::fmt::Debug for Error {
+    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result {
+        f.debug_struct(&format!("Error @ {:?}", self as *const _))
+            .finish()
+    }
+}
+
+extern "C" {
+    pub fn error_setg_internal(
+        errp: *mut *mut Error,
+        src: *const c_char,
+        line: i32,
+        func: *const c_char,
+        fmt: *const c_char,
+        ...
+    );
+    pub fn error_get_pretty(err: *const Error) -> *const c_char;
+    pub fn error_free(err: *mut Error);
+}
+
+/// Wrap a QMP hanlder.
+#[macro_export]
+macro_rules! qmp {
+    // the basic return value variant
+    ($e:expr, $errp:ident, $errval:expr) => {{
+        assert!(!$errp.is_null());
+        unsafe {
+            *$errp = std::ptr::null_mut();
+        }
+
+        match $e {
+            Ok(val) => val,
+            Err(err) => unsafe {
+                *$errp = err.to_qemu_full();
+                $errval
+            },
+        }
+    }};
+    // the ptr return value variant
+    ($e:expr, $errp:ident) => {{
+        assert!(!$errp.is_null());
+        unsafe {
+            *$errp = std::ptr::null_mut();
+        }
+
+        match $e {
+            Ok(val) => val.to_qemu_full().into(),
+            Err(err) => unsafe {
+                *$errp = err.to_qemu_full();
+                std::ptr::null_mut()
+            },
+        }
+    }};
+}
diff --git a/rust/common/src/lib.rs b/rust/common/src/lib.rs
new file mode 100644
index 0000000000..4de826bc2e
--- /dev/null
+++ b/rust/common/src/lib.rs
@@ -0,0 +1,21 @@
+//! Common code for QEMU
+//!
+//! This crates provides common bindings and facilities for QEMU C API shared by
+//! various projects. Most importantly, it defines the conversion traits used to
+//! convert from C to Rust types. Those traits are largely adapted from glib-rs,
+//! since those have prooven to be very flexible, and should guide us to bind
+//! further QEMU types such as QOM. If glib-rs becomes a dependency, we should
+//! consider adopting glib translate traits. For QAPI, we need a smaller subset.
+
+pub use libc;
+
+mod error;
+pub use error::*;
+
+mod qemu;
+pub use qemu::*;
+
+mod translate;
+pub use translate::*;
+
+pub mod ffi;
diff --git a/rust/common/src/qemu.rs b/rust/common/src/qemu.rs
new file mode 100644
index 0000000000..dd01c6d92d
--- /dev/null
+++ b/rust/common/src/qemu.rs
@@ -0,0 +1,101 @@
+use std::{ffi::CStr, ptr, str};
+
+use crate::{ffi, translate};
+use translate::{FromQemuPtrFull, FromQemuPtrNone, QemuPtrDefault, Stash, ToQemuPtr};
+
+/// A type representing an owned C QEMU Error.
+pub struct CError(ptr::NonNull<ffi::Error>);
+
+impl translate::FromQemuPtrFull<*mut ffi::Error> for CError {
+    unsafe fn from_qemu_full(ptr: *mut ffi::Error) -> Self {
+        assert!(!ptr.is_null());
+        Self(ptr::NonNull::new_unchecked(ptr))
+    }
+}
+
+impl CError {
+    pub fn pretty(&self) -> &str {
+        unsafe {
+            let pretty = ffi::error_get_pretty(self.0.as_ptr());
+            let bytes = CStr::from_ptr(pretty).to_bytes();
+            str::from_utf8(bytes)
+                .unwrap_or_else(|err| str::from_utf8(&bytes[..err.valid_up_to()]).unwrap())
+        }
+    }
+}
+
+impl Drop for CError {
+    fn drop(&mut self) {
+        unsafe { ffi::error_free(self.0.as_ptr()) }
+    }
+}
+
+/// QObject (JSON object)
+#[derive(Clone, Debug)]
+pub struct QObject;
+
+impl QemuPtrDefault for QObject {
+    type QemuType = *mut ffi::QObject;
+}
+
+impl FromQemuPtrFull<*mut ffi::QObject> for QObject {
+    #[inline]
+    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
+        unimplemented!()
+    }
+}
+
+impl FromQemuPtrNone<*const ffi::QObject> for QObject {
+    #[inline]
+    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
+        unimplemented!()
+    }
+}
+
+impl<'a> ToQemuPtr<'a, *mut ffi::QObject> for QObject {
+    type Storage = ();
+
+    #[inline]
+    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QObject, QObject> {
+        unimplemented!()
+    }
+    #[inline]
+    fn to_qemu_full(&self) -> *mut ffi::QObject {
+        unimplemented!()
+    }
+}
+
+/// QNull (JSON null)
+#[derive(Clone, Debug)]
+pub struct QNull;
+
+impl QemuPtrDefault for QNull {
+    type QemuType = *mut ffi::QNull;
+}
+
+impl FromQemuPtrFull<*mut ffi::QObject> for QNull {
+    #[inline]
+    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
+        unimplemented!()
+    }
+}
+
+impl FromQemuPtrNone<*const ffi::QObject> for QNull {
+    #[inline]
+    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
+        unimplemented!()
+    }
+}
+
+impl<'a> ToQemuPtr<'a, *mut ffi::QNull> for QNull {
+    type Storage = ();
+
+    #[inline]
+    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QNull, QNull> {
+        unimplemented!()
+    }
+    #[inline]
+    fn to_qemu_full(&self) -> *mut ffi::QNull {
+        unimplemented!()
+    }
+}
diff --git a/rust/common/src/qmp.rs b/rust/common/src/qmp.rs
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/rust/common/src/translate.rs b/rust/common/src/translate.rs
new file mode 100644
index 0000000000..315e14fa25
--- /dev/null
+++ b/rust/common/src/translate.rs
@@ -0,0 +1,482 @@
+// largely adapted from glib-rs
+// we don't depend on glib-rs as this brings a lot more code that we may not need
+// and also because there are issues with the conversion traits for our ffi::*mut.
+use libc::{c_char, size_t};
+use std::ffi::{CStr, CString};
+use std::ptr;
+
+use crate::ffi;
+
+/// A pointer.
+pub trait Ptr: Copy + 'static {
+    fn is_null(&self) -> bool;
+    fn from<X>(ptr: *mut X) -> Self;
+    fn to<X>(self) -> *mut X;
+}
+
+impl<T: 'static> Ptr for *const T {
+    #[inline]
+    fn is_null(&self) -> bool {
+        (*self).is_null()
+    }
+
+    #[inline]
+    fn from<X>(ptr: *mut X) -> *const T {
+        ptr as *const T
+    }
+
+    #[inline]
+    fn to<X>(self) -> *mut X {
+        self as *mut X
+    }
+}
+
+impl<T: 'static> Ptr for *mut T {
+    #[inline]
+    fn is_null(&self) -> bool {
+        (*self).is_null()
+    }
+
+    #[inline]
+    fn from<X>(ptr: *mut X) -> *mut T {
+        ptr as *mut T
+    }
+
+    #[inline]
+    fn to<X>(self) -> *mut X {
+        self as *mut X
+    }
+}
+
+/// Macro to declare a `NewPtr` struct.
+///
+/// A macro to declare a newtype for pointers, to workaround that *T are not
+/// defined in our binding crates, and allow foreign traits implementations.
+/// (this is used by qapi-gen bindings)
+#[allow(unused_macros)]
+#[macro_export]
+#[doc(hidden)]
+macro_rules! new_ptr {
+    () => {
+        #[derive(Copy, Clone)]
+        pub struct NewPtr<P: Ptr>(pub P);
+
+        impl<P: Ptr> Ptr for NewPtr<P> {
+            #[inline]
+            fn is_null(&self) -> bool {
+                self.0.is_null()
+            }
+
+            #[inline]
+            fn from<X>(ptr: *mut X) -> Self {
+                NewPtr(P::from(ptr))
+            }
+
+            #[inline]
+            fn to<X>(self) -> *mut X {
+                self.0.to()
+            }
+        }
+    };
+}
+
+/// Provides the default pointer type to be used in some container conversions.
+///
+/// It's `*mut c_char` for `String`, `*mut ffi::GuestInfo` for `GuestInfo`...
+pub trait QemuPtrDefault {
+    type QemuType: Ptr;
+}
+
+impl QemuPtrDefault for String {
+    type QemuType = *mut c_char;
+}
+
+/// A Stash contains the temporary storage and a pointer into it.
+///
+/// The pointer is valid for the lifetime of the `Stash`. As the lifetime of the
+/// `Stash` returned from `to_qemu_none` is at least the enclosing statement,
+/// you can avoid explicitly binding the stash in most cases and just take the
+/// pointer out of it:
+///
+/// ```ignore
+///     pub fn set_device_name(&self, name: &str) {
+///         unsafe {
+///             ffi::qemu_device_set_name(self.pointer, name.to_qemu_none().0)
+///         }
+///     }
+/// ```
+pub struct Stash<'a, P: Copy, T: ?Sized + ToQemuPtr<'a, P>>(
+    pub P,
+    pub <T as ToQemuPtr<'a, P>>::Storage,
+);
+
+/// Translate to a pointer.
+pub trait ToQemuPtr<'a, P: Copy> {
+    type Storage;
+
+    /// The pointer in the `Stash` is only valid for the lifetime of the `Stash`.
+    fn to_qemu_none(&'a self) -> Stash<'a, P, Self>;
+
+    /// Transfer the ownership to the ffi.
+    fn to_qemu_full(&self) -> P {
+        unimplemented!();
+    }
+}
+
+impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Option<T> {
+    type Storage = Option<<T as ToQemuPtr<'a, P>>::Storage>;
+
+    #[inline]
+    fn to_qemu_none(&'a self) -> Stash<'a, P, Option<T>> {
+        self.as_ref()
+            .map_or(Stash(Ptr::from::<()>(ptr::null_mut()), None), |s| {
+                let s = s.to_qemu_none();
+                Stash(s.0, Some(s.1))
+            })
+    }
+
+    #[inline]
+    fn to_qemu_full(&self) -> P {
+        self.as_ref()
+            .map_or(Ptr::from::<()>(ptr::null_mut()), ToQemuPtr::to_qemu_full)
+    }
+}
+
+impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Box<T> {
+    type Storage = <T as ToQemuPtr<'a, P>>::Storage;
+
+    #[inline]
+    fn to_qemu_none(&'a self) -> Stash<'a, P, Box<T>> {
+        let s = self.as_ref().to_qemu_none();
+        Stash(s.0, s.1)
+    }
+
+    #[inline]
+    fn to_qemu_full(&self) -> P {
+        ToQemuPtr::to_qemu_full(self.as_ref())
+    }
+}
+
+impl<'a> ToQemuPtr<'a, *mut c_char> for String {
+    type Storage = CString;
+
+    #[inline]
+    fn to_qemu_none(&self) -> Stash<'a, *mut c_char, String> {
+        let tmp = CString::new(&self[..])
+            .expect("String::ToQemuPtr<*mut c_char>: unexpected '\0' character");
+        Stash(tmp.as_ptr() as *mut c_char, tmp)
+    }
+
+    #[inline]
+    fn to_qemu_full(&self) -> *mut c_char {
+        unsafe { ffi::g_strndup(self.as_ptr() as *const c_char, self.len() as size_t) }
+    }
+}
+
+/// Translate from a pointer type, without taking ownership.
+pub trait FromQemuPtrNone<P: Ptr>: Sized {
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer. It is not referenced after the call.
+    unsafe fn from_qemu_none(ptr: P) -> Self;
+}
+
+/// Translate from a pointer type, taking ownership.
+pub trait FromQemuPtrFull<P: Ptr>: Sized {
+    /// # Safety
+    ///
+    /// `ptr` must be a valid pointer. Ownership is transferred.
+    unsafe fn from_qemu_full(ptr: P) -> Self;
+}
+
+/// See [`FromQemuPtrNone`](trait.FromQemuPtrNone.html).
+#[inline]
+#[allow(clippy::missing_safety_doc)]
+pub unsafe fn from_qemu_none<P: Ptr, T: FromQemuPtrNone<P>>(ptr: P) -> T {
+    FromQemuPtrNone::from_qemu_none(ptr)
+}
+
+/// See [`FromQemuPtrFull`](trait.FromQemuPtrFull.html).
+#[inline]
+#[allow(clippy::missing_safety_doc)]
+pub unsafe fn from_qemu_full<P: Ptr, T: FromQemuPtrFull<P>>(ptr: P) -> T {
+    FromQemuPtrFull::from_qemu_full(ptr)
+}
+
+impl<P: Ptr, T: FromQemuPtrNone<P>> FromQemuPtrNone<P> for Option<T> {
+    #[inline]
+    unsafe fn from_qemu_none(ptr: P) -> Option<T> {
+        if ptr.is_null() {
+            None
+        } else {
+            Some(from_qemu_none(ptr))
+        }
+    }
+}
+
+impl<P: Ptr, T: FromQemuPtrFull<P>> FromQemuPtrFull<P> for Option<T> {
+    #[inline]
+    unsafe fn from_qemu_full(ptr: P) -> Option<T> {
+        if ptr.is_null() {
+            None
+        } else {
+            Some(from_qemu_full(ptr))
+        }
+    }
+}
+
+impl FromQemuPtrNone<*const c_char> for String {
+    #[inline]
+    unsafe fn from_qemu_none(ptr: *const c_char) -> Self {
+        assert!(!ptr.is_null());
+        String::from_utf8_lossy(CStr::from_ptr(ptr).to_bytes()).into_owned()
+    }
+}
+
+impl FromQemuPtrFull<*mut c_char> for String {
+    #[inline]
+    unsafe fn from_qemu_full(ptr: *mut c_char) -> Self {
+        let res = from_qemu_none(ptr as *const _);
+        ffi::g_free(ptr as *mut _);
+        res
+    }
+}
+
+#[doc(hidden)]
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! vec_ffi_wrapper {
+    ($ffi:ident) => {
+        #[allow(non_camel_case_types)]
+        pub struct $ffi(*mut qapi_ffi::$ffi);
+
+        impl Drop for $ffi {
+            fn drop(&mut self) {
+                let mut list = self.0;
+                unsafe {
+                    while !list.is_null() {
+                        let next = (*list).next;
+                        Box::from_raw(list);
+                        list = next;
+                    }
+                }
+            }
+        }
+
+        impl From<NewPtr<*mut qapi_ffi::$ffi>> for *mut qapi_ffi::$ffi {
+            fn from(p: NewPtr<*mut qapi_ffi::$ffi>) -> Self {
+                p.0
+            }
+        }
+    };
+}
+
+#[doc(hidden)]
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_vec_scalars_to_qemu {
+    ($rs:ty, $ffi:ident) => {
+        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
+            type Storage = $ffi;
+
+            #[inline]
+            fn to_qemu_none(&self) -> Stash<NewPtr<*mut qapi_ffi::$ffi>, Self> {
+                let mut list: *mut qapi_ffi::$ffi = std::ptr::null_mut();
+                for value in self.iter().rev() {
+                    let b = Box::new(qapi_ffi::$ffi {
+                        next: list,
+                        value: *value,
+                    });
+                    list = Box::into_raw(b);
+                }
+                Stash(NewPtr(list), $ffi(list))
+            }
+
+            #[inline]
+            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
+                let mut list: *mut qapi_ffi::$ffi = std::ptr::null_mut();
+                unsafe {
+                    for value in self.iter().rev() {
+                        let l = ffi::g_malloc0(std::mem::size_of::<qapi_ffi::$ffi>())
+                            as *mut qapi_ffi::$ffi;
+                        (*l).next = list;
+                        (*l).value = *value;
+                        list = l;
+                    }
+                }
+                NewPtr(list)
+            }
+        }
+    };
+}
+
+#[doc(hidden)]
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_vec_scalars_from_qemu {
+    ($rs:ty, $ffi:ident, $free_ffi:ident) => {
+        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
+            #[inline]
+            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>) -> Self {
+                let ret = from_qemu_none(NewPtr(ffi.0 as *const _));
+                qapi_ffi::$free_ffi(ffi.0);
+                ret
+            }
+        }
+
+        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for Vec<$rs> {
+            #[inline]
+            unsafe fn from_qemu_none(ffi: NewPtr<*const qapi_ffi::$ffi>) -> Self {
+                let mut ret = vec![];
+                let mut it = ffi.0;
+                while !it.is_null() {
+                    let e = &*it;
+                    ret.push(e.value);
+                    it = e.next;
+                }
+                ret
+            }
+        }
+    };
+}
+
+#[doc(hidden)]
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_vec_to_qemu {
+    ($rs:ty, $ffi:ident) => {
+        // impl doesn't use only types from inside the current crate
+        // impl QemuPtrDefault for Vec<$rs> {
+        //     type QemuType = NewPtr<*mut qapi_ffi::$ffi>;
+        // }
+
+        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
+            type Storage = ($ffi, Vec<Stash<'a, <$rs as QemuPtrDefault>::QemuType, $rs>>);
+
+            #[inline]
+            fn to_qemu_none(&self) -> Stash<NewPtr<*mut qapi_ffi::$ffi>, Self> {
+                let stash_vec: Vec<_> = self.iter().rev().map(ToQemuPtr::to_qemu_none).collect();
+                let mut list: *mut qapi_ffi::$ffi = std::ptr::null_mut();
+                for stash in &stash_vec {
+                    let b = Box::new(qapi_ffi::$ffi {
+                        next: list,
+                        value: Ptr::to(stash.0),
+                    });
+                    list = Box::into_raw(b);
+                }
+                Stash(NewPtr(list), ($ffi(list), stash_vec))
+            }
+
+            #[inline]
+            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
+                let v: Vec<_> = self.iter().rev().map(ToQemuPtr::to_qemu_full).collect();
+                let mut list: *mut qapi_ffi::$ffi = std::ptr::null_mut();
+                unsafe {
+                    for val in v {
+                        let l = ffi::g_malloc0(std::mem::size_of::<qapi_ffi::$ffi>())
+                            as *mut qapi_ffi::$ffi;
+                        (*l).next = list;
+                        (*l).value = val;
+                        list = l;
+                    }
+                }
+                NewPtr(list)
+            }
+        }
+    };
+}
+
+#[doc(hidden)]
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_vec_from_qemu {
+    ($rs:ty, $ffi:ident, $free_ffi:ident) => {
+        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs> {
+            #[inline]
+            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>) -> Self {
+                let ret = from_qemu_none(NewPtr(ffi.0 as *const _));
+                qapi_ffi::$free_ffi(ffi.0);
+                ret
+            }
+        }
+
+        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for Vec<$rs> {
+            #[inline]
+            unsafe fn from_qemu_none(ffi: NewPtr<*const qapi_ffi::$ffi>) -> Self {
+                let mut ret = vec![];
+                let mut it = ffi.0;
+                while !it.is_null() {
+                    let e = &*it;
+                    ret.push(from_qemu_none(e.value as *const _));
+                    it = e.next;
+                }
+                ret
+            }
+        }
+    };
+}
+
+/// A macro to help the implementation of `Vec<T>` translations.
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! vec_type {
+    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 0) => {
+        vec_ffi_wrapper!($ffi);
+        impl_vec_from_qemu!($rs, $ffi, $free_ffi);
+        impl_vec_to_qemu!($rs, $ffi);
+    };
+    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 1) => {
+        vec_ffi_wrapper!($ffi);
+        impl_vec_scalars_from_qemu!($rs, $ffi, $free_ffi);
+        impl_vec_scalars_to_qemu!($rs, $ffi);
+    };
+}
+
+/// A macro to implement [`ToQemuPtr`] as boxed scalars
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_to_qemu_scalar_boxed {
+    ($ty:ty) => {
+        impl<'a> ToQemuPtr<'a, *mut $ty> for $ty {
+            type Storage = Box<$ty>;
+
+            fn to_qemu_none(&'a self) -> Stash<'a, *mut $ty, Self> {
+                let mut box_ = Box::new(*self);
+                Stash(&mut *box_, box_)
+            }
+
+            fn to_qemu_full(&self) -> *mut $ty {
+                unsafe {
+                    let ptr = ffi::g_malloc0(std::mem::size_of::<$ty>()) as *mut _;
+                    *ptr = *self;
+                    ptr
+                }
+            }
+        }
+    };
+}
+
+/// A macro to implement [`FromQemuPtrNone`] for scalar pointers.
+#[allow(unused_macros)]
+#[macro_export]
+macro_rules! impl_from_qemu_none_scalar {
+    ($ty:ty) => {
+        impl FromQemuPtrNone<*const $ty> for $ty {
+            unsafe fn from_qemu_none(ptr: *const $ty) -> Self {
+                *ptr
+            }
+        }
+    };
+}
+
+macro_rules! impl_scalar_boxed {
+    ($($t:ident)*) => (
+        $(
+            impl_to_qemu_scalar_boxed!($t);
+            impl_from_qemu_none_scalar!($t);
+        )*
+    )
+}
+
+// the only built-in used so far, feel free to add more as needed
+impl_scalar_boxed!(bool i64 f64);
-- 
2.33.0.113.g6c40894d24


