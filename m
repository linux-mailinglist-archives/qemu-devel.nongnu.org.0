Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574BD4067F7
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 09:46:56 +0200 (CEST)
Received: from localhost ([::1]:58610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mObFP-0004Fw-EQ
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 03:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mObCC-00076J-Mx
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:43:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57828)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1mObC5-0002zF-1i
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 03:43:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631259806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KSOpuQTgFRxJUKA5nCELLVw9kWziiY4629XofH2jbr0=;
 b=gEzpKQqWfiZkUH1RKckbRPevLUoWl01BcsbAGzgnaVOoBcC/vlL8kXBAZpzY5CHnPbq0wy
 LofJ4wzKk9HRWlByH9vZywKbBHcyKpjcHn2GEbqq2j7I/IMTvLQDbwzUvBiMpqznzb0J9/
 mEa0BpdBsT0Xaxy/zpaMGVOL9mK4yNw=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-Mrvpx4hsPqijv56UiauDTw-1; Fri, 10 Sep 2021 03:43:18 -0400
X-MC-Unique: Mrvpx4hsPqijv56UiauDTw-1
Received: by mail-pj1-f69.google.com with SMTP id
 u3-20020a17090abb0300b0019567f8a277so919975pjr.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 00:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSOpuQTgFRxJUKA5nCELLVw9kWziiY4629XofH2jbr0=;
 b=zdr2Px655ffonTLKkhFFVjZZnQ6GCSlWoxGS1FTmzgOk2VONdpOFn6qJ2fZO6HzKdK
 xRzkuObmJS9Gc3dhUiRnxhhSx9LZiCqQGmQ/GLSiuxEs1C45MEutPNm0TgGIOXRbMh+q
 qrYkwUM0QwvoJwvcmn9UYB2lSvv85rVto7p/MOXzbt2pMFC12yuLTr6vohW6HvOJIGDy
 MCFaqqrUeTEHZjipNvDSTdGtKT93p0TVC36Q/Sy2oFy4izWZj0Ex5f66MvT9cfS51zlk
 OzH0l4NrBoHx2DBbV+ca5leW0U8TP3H13cAR89tBgJlQiOv6j3zJde9t6dRrHqOoty6B
 Yh2g==
X-Gm-Message-State: AOAM530TevkS5rVG2grCG2D3SggH4jtaz68JURlX49VPkCKNxt+iJRA/
 YTKX8KF/8qnkMira4ISbmCZbKct8s0JwC6oJD5O/txKddKzGsDGHwJv8rJDk+9r8FxKhz0wPXGw
 O9p/NjV6Ahwny+s8+JCc17hirYBxHyJc=
X-Received: by 2002:a17:902:760b:b0:13b:122:5ff0 with SMTP id
 k11-20020a170902760b00b0013b01225ff0mr2428213pll.22.1631259796949; 
 Fri, 10 Sep 2021 00:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCIAlRJyW1034fOFW8NIlms3Qz4CDhEpODplEoPEx0cvf1HvfhT6LI/YOseXWz40R/jaMHuipga6lG/B0wSMU=
X-Received: by 2002:a17:902:760b:b0:13b:122:5ff0 with SMTP id
 k11-20020a170902760b00b0013b01225ff0mr2428187pll.22.1631259796470; Fri, 10
 Sep 2021 00:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210907121943.3498701-1-marcandre.lureau@redhat.com>
 <20210907121943.3498701-13-marcandre.lureau@redhat.com>
 <CAKmqyKP3+rh+vxq=Ci1xiZx7N0Pzyx2Dy8zgp4EsM0UUHizrkw@mail.gmail.com>
In-Reply-To: <CAKmqyKP3+rh+vxq=Ci1xiZx7N0Pzyx2Dy8zgp4EsM0UUHizrkw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 10 Sep 2021 11:43:04 +0400
Message-ID: <CAMxuvaytkGSG+2gjzQJj_C95SxxD9RZ8YD6OT7G4D2cWsrnQyA@mail.gmail.com>
Subject: Re: [RFC v3 12/32] rust: provide a common crate for QEMU
To: Alistair Francis <alistair23@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000b494fa05cb9f4466"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b494fa05cb9f4466
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Sep 10, 2021 at 5:19 AM Alistair Francis <alistair23@gmail.com>
wrote:

> On Tue, Sep 7, 2021 at 10:41 PM <marcandre.lureau@redhat.com> wrote:
> >
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > This crates provides common bindings and facilities for QEMU C API
> > shared by various projects.
> >
> > Most importantly, it defines the conversion traits used to convert from
> > C to Rust types. Those traits are largely adapted from glib-rs, since
> > those have proved to be very flexible, and should guide us to bind
> > further QEMU types such as QOM. If glib-rs becomes a dependency, we
> > should consider adopting glib translate traits. For QAPI, we need a
> > smaller subset.
> >
> > Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and i=
t
> > is desirable to track the exact set of packages that are involved in
> > managed builds.
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  Cargo.lock                   |  63 +++++
> >  Cargo.toml                   |   4 +-
> >  rust/common/Cargo.toml       |  11 +
> >  rust/common/src/error.rs     | 113 ++++++++
> >  rust/common/src/ffi.rs       |  93 +++++++
> >  rust/common/src/lib.rs       |  21 ++
> >  rust/common/src/qemu.rs      | 101 ++++++++
> >  rust/common/src/qmp.rs       |   0
> >  rust/common/src/translate.rs | 482 +++++++++++++++++++++++++++++++++++
> >  9 files changed, 887 insertions(+), 1 deletion(-)
> >  create mode 100644 Cargo.lock
> >  create mode 100644 rust/common/Cargo.toml
> >  create mode 100644 rust/common/src/error.rs
> >  create mode 100644 rust/common/src/ffi.rs
> >  create mode 100644 rust/common/src/lib.rs
> >  create mode 100644 rust/common/src/qemu.rs
> >  create mode 100644 rust/common/src/qmp.rs
> >  create mode 100644 rust/common/src/translate.rs
> >
> > diff --git a/Cargo.lock b/Cargo.lock
> > new file mode 100644
> > index 0000000000..8dc2dd9da7
> > --- /dev/null
> > +++ b/Cargo.lock
> > @@ -0,0 +1,63 @@
> > +# This file is automatically @generated by Cargo.
> > +# It is not intended for manual editing.
> > +version =3D 3
> > +
> > +[[package]]
> > +name =3D "autocfg"
> > +version =3D "1.0.1"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700543e627f8a464a"
> > +
> > +[[package]]
> > +name =3D "bitflags"
> > +version =3D "1.2.1"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a54a5c846d691693"
> > +
> > +[[package]]
> > +name =3D "cc"
> > +version =3D "1.0.70"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "d26a6ce4b6a484fa3edb70f7efa6fc430fd2b87285fe8b84304fd0936faa0dc0"
> > +
> > +[[package]]
> > +name =3D "cfg-if"
> > +version =3D "1.0.0"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd"
> > +
> > +[[package]]
> > +name =3D "common"
> > +version =3D "0.1.0"
> > +dependencies =3D [
> > + "libc",
> > + "nix",
> > +]
> > +
> > +[[package]]
> > +name =3D "libc"
> > +version =3D "0.2.101"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "3cb00336871be5ed2c8ed44b60ae9959dc5b9f08539422ed43f09e34ecaeba21"
> > +
> > +[[package]]
> > +name =3D "memoffset"
> > +version =3D "0.6.4"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "59accc507f1338036a0477ef61afdae33cde60840f4dfe481319ce3ad116ddf9"
> > +dependencies =3D [
> > + "autocfg",
> > +]
> > +
> > +[[package]]
> > +name =3D "nix"
> > +version =3D "0.20.1"
> > +source =3D "registry+https://github.com/rust-lang/crates.io-index"
> > +checksum =3D
> "df8e5e343312e7fbeb2a52139114e9e702991ef9c2aea6817ff2440b35647d56"
> > +dependencies =3D [
> > + "bitflags",
> > + "cc",
> > + "cfg-if",
> > + "libc",
> > + "memoffset",
> > +]
> > diff --git a/Cargo.toml b/Cargo.toml
> > index c4b464ff15..14131eed3c 100644
> > --- a/Cargo.toml
> > +++ b/Cargo.toml
> > @@ -1,2 +1,4 @@
> >  [workspace]
> > -members =3D []
> > +members =3D [
> > +  "rust/common",
> > +]
> > diff --git a/rust/common/Cargo.toml b/rust/common/Cargo.toml
> > new file mode 100644
> > index 0000000000..6c240447f3
> > --- /dev/null
> > +++ b/rust/common/Cargo.toml
> > @@ -0,0 +1,11 @@
> > +[package]
> > +name =3D "common"
> > +version =3D "0.1.0"
> > +edition =3D "2018"
> > +publish =3D false
> > +
> > +[dependencies]
> > +libc =3D "0.2.92"
> > +
> > +[target."cfg(unix)".dependencies]
> > +nix =3D "0.20.0"
> > diff --git a/rust/common/src/error.rs b/rust/common/src/error.rs
> > new file mode 100644
> > index 0000000000..f166ac42ea
> > --- /dev/null
> > +++ b/rust/common/src/error.rs
> > @@ -0,0 +1,113 @@
> > +use std::{self, ffi::CString, fmt, io, ptr};
> > +
> > +use crate::translate::*;
>
> It's not uncommon to ban wildcard imports that aren't preludes as it
> can make it confusing to read. Does QEMU have a stance on that type of
> thing?
>

There is no such common rule in Rust afaik. It's based on judgement and
style. If the imported symbols pollute your namespace or not. But yes, in
general, it's better to selectively import what you need, mostly for
readability.


> > +use crate::{ffi, qemu};
> > +
> > +/// Common error type for QEMU and related projects.
> > +#[derive(Debug)]
> > +pub enum Error {
> > +    /// A generic error with file and line location.
> > +    FailedAt(String, &'static str, u32),
> > +    /// An IO error.
> > +    Io(io::Error),
> > +    #[cfg(unix)]
> > +    /// A nix error.
> > +    Nix(nix::Error),
> > +}
> > +
> > +/// Alias for a `Result` with the error type for QEMU.
> > +pub type Result<T> =3D std::result::Result<T, Error>;
>
> I think this is very confusing. Rust developers expect `Result` to be
> the one from `std::result`, it would be better to call this
> `QEMUResult`
>

It's very common in Rust to redefine Result for your crate error. Users
don't have to import it if they prefer the std::result::Result<T,E>. This
redefinition was probably popularized with the `std::io::Result<T>` type. (
https://doc.rust-lang.org/std/io/type.Result.html)


>
> > +
> > +impl Error {
> > +    fn message(&self) -> String {
> > +        use Error::*;
>
> Do we need this here? Why not put it at the top of the file?
>

It's limited here to avoid enum prefix repetition:
match self {
 Error::FailedAt ..
 Error::Io ..
 Error::Foo ..
}

(It wouldn't be a good idea to import it in the top namespace)


> > +        match self {
> > +            FailedAt(msg, _, _) =3D> msg.into(),
> > +            Io(io) =3D> format!("IO error: {}", io),
> > +            #[cfg(unix)]
> > +            Nix(nix) =3D> format!("Nix error: {}", nix),
> > +        }
> > +    }
> > +
> > +    fn location(&self) -> Option<(&'static str, u32)> {
> > +        use Error::*;
> > +        match self {
> > +            FailedAt(_, file, line) =3D> Some((file, *line)),
> > +            Io(_) =3D> None,
> > +            #[cfg(unix)]
> > +            Nix(_) =3D> None,
> > +        }
> > +    }
> > +}
> > +
> > +impl fmt::Display for Error {
> > +    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
> > +        use Error::*;
> > +        match self {
> > +            FailedAt(msg, file, line) =3D> write!(f, "{} ({}:{})", msg=
,
> file, line),
> > +            _ =3D> write!(f, "{}", self.message()),
> > +        }
> > +    }
> > +}
> > +
> > +impl From<io::Error> for Error {
> > +    fn from(val: io::Error) -> Self {
> > +        Error::Io(val)
> > +    }
> > +}
> > +
> > +#[cfg(unix)]
> > +impl From<nix::Error> for Error {
> > +    fn from(val: nix::Error) -> Self {
> > +        Error::Nix(val)
> > +    }
> > +}
> > +
> > +impl QemuPtrDefault for Error {
> > +    type QemuType =3D *mut ffi::Error;
> > +}
> > +
> > +impl<'a> ToQemuPtr<'a, *mut ffi::Error> for Error {
> > +    type Storage =3D qemu::CError;
> > +
> > +    fn to_qemu_none(&'a self) -> Stash<'a, *mut ffi::Error, Self> {
> > +        let err =3D self.to_qemu_full();
> > +
> > +        Stash(err, unsafe { from_qemu_full(err) })
> > +    }
> > +
> > +    fn to_qemu_full(&self) -> *mut ffi::Error {
> > +        let cmsg =3D
> > +            CString::new(self.message()).expect("ToQemuPtr<Error>:
> unexpected '\0' character");
> > +        let mut csrc =3D CString::new("").unwrap();
> > +        let (src, line) =3D self.location().map_or((ptr::null(), 0_i32=
),
> |loc| {
> > +            csrc =3D CString::new(loc.0).expect("ToQemuPtr<Error>::
> unexpected '\0' character");
> > +            (csrc.as_ptr() as *const libc::c_char, loc.1 as i32)
> > +        });
> > +        let func =3D ptr::null();
> > +
> > +        let mut err: *mut ffi::Error =3D ptr::null_mut();
> > +        unsafe {
> > +            ffi::error_setg_internal(
> > +                &mut err as *mut *mut _,
> > +                src,
> > +                line,
> > +                func,
> > +                cmsg.as_ptr() as *const libc::c_char,
> > +            );
> > +            err
> > +        }
> > +    }
> > +}
> > +
> > +/// Convenience macro to build a [`Error::FailedAt`] error.
> > +///
> > +/// Returns a `Result::Err` with the file:line location.
> > +/// (the error can then be converted to a QEMU `ffi::Error`)
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! err {
> > +    ($msg:expr) =3D> {
> > +        Err(Error::FailedAt($msg.into(), file!(), line!()))
> > +    };
> > +}
> > diff --git a/rust/common/src/ffi.rs b/rust/common/src/ffi.rs
> > new file mode 100644
> > index 0000000000..82818d503a
> > --- /dev/null
> > +++ b/rust/common/src/ffi.rs
> > @@ -0,0 +1,93 @@
> > +//! Bindings to the raw low-level C API commonly provided by QEMU
> projects.
> > +//!
> > +//! Manual bindings to C API availabe when linking QEMU projects.
>
> s/availabe/available/g
>
>
yup thanks

> +//! It includes minimal glib allocation functions too, since it's the
> default
> > +//! allocator used by QEMU, and we don't depend on glib-rs crate yet).
> > +//!
> > +//! Higher-level Rust-friendly bindings are provided by different
> modules.
> > +
> > +use libc::{c_char, c_void, size_t};
> > +
> > +extern "C" {
> > +    pub fn g_malloc0(n_bytes: size_t) -> *mut c_void;
> > +    pub fn g_free(ptr: *mut c_void);
> > +    pub fn g_strndup(str: *const c_char, n: size_t) -> *mut c_char;
> > +}
>
> We can get there from the glib/glib_sys crate:
>
> https://gtk-rs.org/gtk-rs-core/stable/latest/docs/glib_sys/fn.g_malloc0.h=
tml
>
> If we only plan on using these 3 I think this approach is fine, but
> something to keep in mind if we use more glib functions.
>
>
Yes, I think I mentioned this somewhere. We might need to import glib-sys
or glib-rs depending on what we need to write in Rust. We may actually not
need more than a few FFI functions though, so importing external crates for
that isn't worth it.


> > +
> > +#[repr(C)]
> > +pub struct QObject(c_void);
> > +
> > +impl ::std::fmt::Debug for QObject {
> > +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result=
 {
> > +        f.debug_struct(&format!("QObject @ {:?}", self as *const _))
> > +            .finish()
> > +    }
> > +}
> > +
> > +#[repr(C)]
> > +pub struct QNull(c_void);
> > +
> > +impl ::std::fmt::Debug for QNull {
> > +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result=
 {
> > +        f.debug_struct(&format!("QNull @ {:?}", self as *const _))
> > +            .finish()
> > +    }
> > +}
> > +
> > +#[repr(C)]
> > +pub struct Error(c_void);
> > +
> > +impl ::std::fmt::Debug for Error {
> > +    fn fmt(&self, f: &mut ::std::fmt::Formatter) -> ::std::fmt::Result=
 {
> > +        f.debug_struct(&format!("Error @ {:?}", self as *const _))
> > +            .finish()
> > +    }
> > +}
> > +
> > +extern "C" {
> > +    pub fn error_setg_internal(
> > +        errp: *mut *mut Error,
> > +        src: *const c_char,
> > +        line: i32,
> > +        func: *const c_char,
> > +        fmt: *const c_char,
> > +        ...
> > +    );
> > +    pub fn error_get_pretty(err: *const Error) -> *const c_char;
> > +    pub fn error_free(err: *mut Error);
> > +}
> > +
> > +/// Wrap a QMP hanlder.
>
> handler
>

thanks!


> > +#[macro_export]
> > +macro_rules! qmp {
> > +    // the basic return value variant
> > +    ($e:expr, $errp:ident, $errval:expr) =3D> {{
> > +        assert!(!$errp.is_null());
> > +        unsafe {
> > +            *$errp =3D std::ptr::null_mut();
> > +        }
> > +
> > +        match $e {
> > +            Ok(val) =3D> val,
> > +            Err(err) =3D> unsafe {
> > +                *$errp =3D err.to_qemu_full();
> > +                $errval
> > +            },
> > +        }
> > +    }};
> > +    // the ptr return value variant
> > +    ($e:expr, $errp:ident) =3D> {{
> > +        assert!(!$errp.is_null());
> > +        unsafe {
> > +            *$errp =3D std::ptr::null_mut();
> > +        }
> > +
> > +        match $e {
> > +            Ok(val) =3D> val.to_qemu_full().into(),
> > +            Err(err) =3D> unsafe {
> > +                *$errp =3D err.to_qemu_full();
> > +                std::ptr::null_mut()
> > +            },
> > +        }
> > +    }};
> > +}
>
> It would be a good idea to document why this code is safe
>

Hmm, I am not sure that's the question. I assume Rust code is safe :)
However, the FFI borders are full of unsafe {}. It's basically a trust
relationship with the other side. But it's always great to document tricky
unsafe {}, or where panic is unexpected (unwrap()/expect()).. based on
review, judgement, style.. (read also
https://doc.rust-lang.org/book/ch09-03-to-panic-or-not-to-panic.html).

Thanks!

Alistair
>
> > diff --git a/rust/common/src/lib.rs b/rust/common/src/lib.rs
> > new file mode 100644
> > index 0000000000..4de826bc2e
> > --- /dev/null
> > +++ b/rust/common/src/lib.rs
> > @@ -0,0 +1,21 @@
> > +//! Common code for QEMU
> > +//!
> > +//! This crates provides common bindings and facilities for QEMU C API
> shared by
> > +//! various projects. Most importantly, it defines the conversion
> traits used to
> > +//! convert from C to Rust types. Those traits are largely adapted fro=
m
> glib-rs,
> > +//! since those have prooven to be very flexible, and should guide us
> to bind
> > +//! further QEMU types such as QOM. If glib-rs becomes a dependency, w=
e
> should
> > +//! consider adopting glib translate traits. For QAPI, we need a
> smaller subset.
> > +
> > +pub use libc;
> > +
> > +mod error;
> > +pub use error::*;
> > +
> > +mod qemu;
> > +pub use qemu::*;
> > +
> > +mod translate;
> > +pub use translate::*;
> > +
> > +pub mod ffi;
> > diff --git a/rust/common/src/qemu.rs b/rust/common/src/qemu.rs
> > new file mode 100644
> > index 0000000000..dd01c6d92d
> > --- /dev/null
> > +++ b/rust/common/src/qemu.rs
> > @@ -0,0 +1,101 @@
> > +use std::{ffi::CStr, ptr, str};
> > +
> > +use crate::{ffi, translate};
> > +use translate::{FromQemuPtrFull, FromQemuPtrNone, QemuPtrDefault,
> Stash, ToQemuPtr};
> > +
> > +/// A type representing an owned C QEMU Error.
> > +pub struct CError(ptr::NonNull<ffi::Error>);
> > +
> > +impl translate::FromQemuPtrFull<*mut ffi::Error> for CError {
> > +    unsafe fn from_qemu_full(ptr: *mut ffi::Error) -> Self {
> > +        assert!(!ptr.is_null());
> > +        Self(ptr::NonNull::new_unchecked(ptr))
> > +    }
> > +}
> > +
> > +impl CError {
> > +    pub fn pretty(&self) -> &str {
> > +        unsafe {
> > +            let pretty =3D ffi::error_get_pretty(self.0.as_ptr());
> > +            let bytes =3D CStr::from_ptr(pretty).to_bytes();
> > +            str::from_utf8(bytes)
> > +                .unwrap_or_else(|err|
> str::from_utf8(&bytes[..err.valid_up_to()]).unwrap())
> > +        }
> > +    }
> > +}
> > +
> > +impl Drop for CError {
> > +    fn drop(&mut self) {
> > +        unsafe { ffi::error_free(self.0.as_ptr()) }
> > +    }
> > +}
> > +
> > +/// QObject (JSON object)
> > +#[derive(Clone, Debug)]
> > +pub struct QObject;
> > +
> > +impl QemuPtrDefault for QObject {
> > +    type QemuType =3D *mut ffi::QObject;
> > +}
> > +
> > +impl FromQemuPtrFull<*mut ffi::QObject> for QObject {
> > +    #[inline]
> > +    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
> > +        unimplemented!()
> > +    }
> > +}
> > +
> > +impl FromQemuPtrNone<*const ffi::QObject> for QObject {
> > +    #[inline]
> > +    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
> > +        unimplemented!()
> > +    }
> > +}
> > +
> > +impl<'a> ToQemuPtr<'a, *mut ffi::QObject> for QObject {
> > +    type Storage =3D ();
> > +
> > +    #[inline]
> > +    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QObject, QObject> {
> > +        unimplemented!()
> > +    }
> > +    #[inline]
> > +    fn to_qemu_full(&self) -> *mut ffi::QObject {
> > +        unimplemented!()
> > +    }
> > +}
> > +
> > +/// QNull (JSON null)
> > +#[derive(Clone, Debug)]
> > +pub struct QNull;
> > +
> > +impl QemuPtrDefault for QNull {
> > +    type QemuType =3D *mut ffi::QNull;
> > +}
> > +
> > +impl FromQemuPtrFull<*mut ffi::QObject> for QNull {
> > +    #[inline]
> > +    unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -> Self {
> > +        unimplemented!()
> > +    }
> > +}
> > +
> > +impl FromQemuPtrNone<*const ffi::QObject> for QNull {
> > +    #[inline]
> > +    unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -> Self {
> > +        unimplemented!()
> > +    }
> > +}
> > +
> > +impl<'a> ToQemuPtr<'a, *mut ffi::QNull> for QNull {
> > +    type Storage =3D ();
> > +
> > +    #[inline]
> > +    fn to_qemu_none(&self) -> Stash<'a, *mut ffi::QNull, QNull> {
> > +        unimplemented!()
> > +    }
> > +    #[inline]
> > +    fn to_qemu_full(&self) -> *mut ffi::QNull {
> > +        unimplemented!()
> > +    }
> > +}
> > diff --git a/rust/common/src/qmp.rs b/rust/common/src/qmp.rs
> > new file mode 100644
> > index 0000000000..e69de29bb2
> > diff --git a/rust/common/src/translate.rs b/rust/common/src/translate.r=
s
> > new file mode 100644
> > index 0000000000..315e14fa25
> > --- /dev/null
> > +++ b/rust/common/src/translate.rs
> > @@ -0,0 +1,482 @@
> > +// largely adapted from glib-rs
> > +// we don't depend on glib-rs as this brings a lot more code that we
> may not need
> > +// and also because there are issues with the conversion traits for ou=
r
> ffi::*mut.
> > +use libc::{c_char, size_t};
> > +use std::ffi::{CStr, CString};
> > +use std::ptr;
> > +
> > +use crate::ffi;
> > +
> > +/// A pointer.
> > +pub trait Ptr: Copy + 'static {
> > +    fn is_null(&self) -> bool;
> > +    fn from<X>(ptr: *mut X) -> Self;
> > +    fn to<X>(self) -> *mut X;
> > +}
> > +
> > +impl<T: 'static> Ptr for *const T {
> > +    #[inline]
> > +    fn is_null(&self) -> bool {
> > +        (*self).is_null()
> > +    }
> > +
> > +    #[inline]
> > +    fn from<X>(ptr: *mut X) -> *const T {
> > +        ptr as *const T
> > +    }
> > +
> > +    #[inline]
> > +    fn to<X>(self) -> *mut X {
> > +        self as *mut X
> > +    }
> > +}
> > +
> > +impl<T: 'static> Ptr for *mut T {
> > +    #[inline]
> > +    fn is_null(&self) -> bool {
> > +        (*self).is_null()
> > +    }
> > +
> > +    #[inline]
> > +    fn from<X>(ptr: *mut X) -> *mut T {
> > +        ptr as *mut T
> > +    }
> > +
> > +    #[inline]
> > +    fn to<X>(self) -> *mut X {
> > +        self as *mut X
> > +    }
> > +}
> > +
> > +/// Macro to declare a `NewPtr` struct.
> > +///
> > +/// A macro to declare a newtype for pointers, to workaround that *T
> are not
> > +/// defined in our binding crates, and allow foreign traits
> implementations.
> > +/// (this is used by qapi-gen bindings)
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +#[doc(hidden)]
> > +macro_rules! new_ptr {
> > +    () =3D> {
> > +        #[derive(Copy, Clone)]
> > +        pub struct NewPtr<P: Ptr>(pub P);
> > +
> > +        impl<P: Ptr> Ptr for NewPtr<P> {
> > +            #[inline]
> > +            fn is_null(&self) -> bool {
> > +                self.0.is_null()
> > +            }
> > +
> > +            #[inline]
> > +            fn from<X>(ptr: *mut X) -> Self {
> > +                NewPtr(P::from(ptr))
> > +            }
> > +
> > +            #[inline]
> > +            fn to<X>(self) -> *mut X {
> > +                self.0.to()
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +/// Provides the default pointer type to be used in some container
> conversions.
> > +///
> > +/// It's `*mut c_char` for `String`, `*mut ffi::GuestInfo` for
> `GuestInfo`...
> > +pub trait QemuPtrDefault {
> > +    type QemuType: Ptr;
> > +}
> > +
> > +impl QemuPtrDefault for String {
> > +    type QemuType =3D *mut c_char;
> > +}
> > +
> > +/// A Stash contains the temporary storage and a pointer into it.
> > +///
> > +/// The pointer is valid for the lifetime of the `Stash`. As the
> lifetime of the
> > +/// `Stash` returned from `to_qemu_none` is at least the enclosing
> statement,
> > +/// you can avoid explicitly binding the stash in most cases and just
> take the
> > +/// pointer out of it:
> > +///
> > +/// ```ignore
> > +///     pub fn set_device_name(&self, name: &str) {
> > +///         unsafe {
> > +///             ffi::qemu_device_set_name(self.pointer,
> name.to_qemu_none().0)
> > +///         }
> > +///     }
> > +/// ```
> > +pub struct Stash<'a, P: Copy, T: ?Sized + ToQemuPtr<'a, P>>(
> > +    pub P,
> > +    pub <T as ToQemuPtr<'a, P>>::Storage,
> > +);
> > +
> > +/// Translate to a pointer.
> > +pub trait ToQemuPtr<'a, P: Copy> {
> > +    type Storage;
> > +
> > +    /// The pointer in the `Stash` is only valid for the lifetime of
> the `Stash`.
> > +    fn to_qemu_none(&'a self) -> Stash<'a, P, Self>;
> > +
> > +    /// Transfer the ownership to the ffi.
> > +    fn to_qemu_full(&self) -> P {
> > +        unimplemented!();
> > +    }
> > +}
> > +
> > +impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Option<T> {
> > +    type Storage =3D Option<<T as ToQemuPtr<'a, P>>::Storage>;
> > +
> > +    #[inline]
> > +    fn to_qemu_none(&'a self) -> Stash<'a, P, Option<T>> {
> > +        self.as_ref()
> > +            .map_or(Stash(Ptr::from::<()>(ptr::null_mut()), None), |s|=
 {
> > +                let s =3D s.to_qemu_none();
> > +                Stash(s.0, Some(s.1))
> > +            })
> > +    }
> > +
> > +    #[inline]
> > +    fn to_qemu_full(&self) -> P {
> > +        self.as_ref()
> > +            .map_or(Ptr::from::<()>(ptr::null_mut()),
> ToQemuPtr::to_qemu_full)
> > +    }
> > +}
> > +
> > +impl<'a, P: Ptr, T: ToQemuPtr<'a, P>> ToQemuPtr<'a, P> for Box<T> {
> > +    type Storage =3D <T as ToQemuPtr<'a, P>>::Storage;
> > +
> > +    #[inline]
> > +    fn to_qemu_none(&'a self) -> Stash<'a, P, Box<T>> {
> > +        let s =3D self.as_ref().to_qemu_none();
> > +        Stash(s.0, s.1)
> > +    }
> > +
> > +    #[inline]
> > +    fn to_qemu_full(&self) -> P {
> > +        ToQemuPtr::to_qemu_full(self.as_ref())
> > +    }
> > +}
> > +
> > +impl<'a> ToQemuPtr<'a, *mut c_char> for String {
> > +    type Storage =3D CString;
> > +
> > +    #[inline]
> > +    fn to_qemu_none(&self) -> Stash<'a, *mut c_char, String> {
> > +        let tmp =3D CString::new(&self[..])
> > +            .expect("String::ToQemuPtr<*mut c_char>: unexpected '\0'
> character");
> > +        Stash(tmp.as_ptr() as *mut c_char, tmp)
> > +    }
> > +
> > +    #[inline]
> > +    fn to_qemu_full(&self) -> *mut c_char {
> > +        unsafe { ffi::g_strndup(self.as_ptr() as *const c_char,
> self.len() as size_t) }
> > +    }
> > +}
> > +
> > +/// Translate from a pointer type, without taking ownership.
> > +pub trait FromQemuPtrNone<P: Ptr>: Sized {
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must be a valid pointer. It is not referenced after the
> call.
> > +    unsafe fn from_qemu_none(ptr: P) -> Self;
> > +}
> > +
> > +/// Translate from a pointer type, taking ownership.
> > +pub trait FromQemuPtrFull<P: Ptr>: Sized {
> > +    /// # Safety
> > +    ///
> > +    /// `ptr` must be a valid pointer. Ownership is transferred.
> > +    unsafe fn from_qemu_full(ptr: P) -> Self;
> > +}
> > +
> > +/// See [`FromQemuPtrNone`](trait.FromQemuPtrNone.html).
> > +#[inline]
> > +#[allow(clippy::missing_safety_doc)]
> > +pub unsafe fn from_qemu_none<P: Ptr, T: FromQemuPtrNone<P>>(ptr: P) ->
> T {
> > +    FromQemuPtrNone::from_qemu_none(ptr)
> > +}
> > +
> > +/// See [`FromQemuPtrFull`](trait.FromQemuPtrFull.html).
> > +#[inline]
> > +#[allow(clippy::missing_safety_doc)]
> > +pub unsafe fn from_qemu_full<P: Ptr, T: FromQemuPtrFull<P>>(ptr: P) ->
> T {
> > +    FromQemuPtrFull::from_qemu_full(ptr)
> > +}
> > +
> > +impl<P: Ptr, T: FromQemuPtrNone<P>> FromQemuPtrNone<P> for Option<T> {
> > +    #[inline]
> > +    unsafe fn from_qemu_none(ptr: P) -> Option<T> {
> > +        if ptr.is_null() {
> > +            None
> > +        } else {
> > +            Some(from_qemu_none(ptr))
> > +        }
> > +    }
> > +}
> > +
> > +impl<P: Ptr, T: FromQemuPtrFull<P>> FromQemuPtrFull<P> for Option<T> {
> > +    #[inline]
> > +    unsafe fn from_qemu_full(ptr: P) -> Option<T> {
> > +        if ptr.is_null() {
> > +            None
> > +        } else {
> > +            Some(from_qemu_full(ptr))
> > +        }
> > +    }
> > +}
> > +
> > +impl FromQemuPtrNone<*const c_char> for String {
> > +    #[inline]
> > +    unsafe fn from_qemu_none(ptr: *const c_char) -> Self {
> > +        assert!(!ptr.is_null());
> > +
> String::from_utf8_lossy(CStr::from_ptr(ptr).to_bytes()).into_owned()
> > +    }
> > +}
> > +
> > +impl FromQemuPtrFull<*mut c_char> for String {
> > +    #[inline]
> > +    unsafe fn from_qemu_full(ptr: *mut c_char) -> Self {
> > +        let res =3D from_qemu_none(ptr as *const _);
> > +        ffi::g_free(ptr as *mut _);
> > +        res
> > +    }
> > +}
> > +
> > +#[doc(hidden)]
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! vec_ffi_wrapper {
> > +    ($ffi:ident) =3D> {
> > +        #[allow(non_camel_case_types)]
> > +        pub struct $ffi(*mut qapi_ffi::$ffi);
> > +
> > +        impl Drop for $ffi {
> > +            fn drop(&mut self) {
> > +                let mut list =3D self.0;
> > +                unsafe {
> > +                    while !list.is_null() {
> > +                        let next =3D (*list).next;
> > +                        Box::from_raw(list);
> > +                        list =3D next;
> > +                    }
> > +                }
> > +            }
> > +        }
> > +
> > +        impl From<NewPtr<*mut qapi_ffi::$ffi>> for *mut qapi_ffi::$ffi=
 {
> > +            fn from(p: NewPtr<*mut qapi_ffi::$ffi>) -> Self {
> > +                p.0
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +#[doc(hidden)]
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_vec_scalars_to_qemu {
> > +    ($rs:ty, $ffi:ident) =3D> {
> > +        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for
> Vec<$rs> {
> > +            type Storage =3D $ffi;
> > +
> > +            #[inline]
> > +            fn to_qemu_none(&self) -> Stash<NewPtr<*mut
> qapi_ffi::$ffi>, Self> {
> > +                let mut list: *mut qapi_ffi::$ffi =3D
> std::ptr::null_mut();
> > +                for value in self.iter().rev() {
> > +                    let b =3D Box::new(qapi_ffi::$ffi {
> > +                        next: list,
> > +                        value: *value,
> > +                    });
> > +                    list =3D Box::into_raw(b);
> > +                }
> > +                Stash(NewPtr(list), $ffi(list))
> > +            }
> > +
> > +            #[inline]
> > +            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
> > +                let mut list: *mut qapi_ffi::$ffi =3D
> std::ptr::null_mut();
> > +                unsafe {
> > +                    for value in self.iter().rev() {
> > +                        let l =3D
> ffi::g_malloc0(std::mem::size_of::<qapi_ffi::$ffi>())
> > +                            as *mut qapi_ffi::$ffi;
> > +                        (*l).next =3D list;
> > +                        (*l).value =3D *value;
> > +                        list =3D l;
> > +                    }
> > +                }
> > +                NewPtr(list)
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +#[doc(hidden)]
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_vec_scalars_from_qemu {
> > +    ($rs:ty, $ffi:ident, $free_ffi:ident) =3D> {
> > +        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs>=
 {
> > +            #[inline]
> > +            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>)
> -> Self {
> > +                let ret =3D from_qemu_none(NewPtr(ffi.0 as *const _));
> > +                qapi_ffi::$free_ffi(ffi.0);
> > +                ret
> > +            }
> > +        }
> > +
> > +        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for
> Vec<$rs> {
> > +            #[inline]
> > +            unsafe fn from_qemu_none(ffi: NewPtr<*const
> qapi_ffi::$ffi>) -> Self {
> > +                let mut ret =3D vec![];
> > +                let mut it =3D ffi.0;
> > +                while !it.is_null() {
> > +                    let e =3D &*it;
> > +                    ret.push(e.value);
> > +                    it =3D e.next;
> > +                }
> > +                ret
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +#[doc(hidden)]
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_vec_to_qemu {
> > +    ($rs:ty, $ffi:ident) =3D> {
> > +        // impl doesn't use only types from inside the current crate
> > +        // impl QemuPtrDefault for Vec<$rs> {
> > +        //     type QemuType =3D NewPtr<*mut qapi_ffi::$ffi>;
> > +        // }
> > +
> > +        impl<'a> ToQemuPtr<'a, NewPtr<*mut qapi_ffi::$ffi>> for
> Vec<$rs> {
> > +            type Storage =3D ($ffi, Vec<Stash<'a, <$rs as
> QemuPtrDefault>::QemuType, $rs>>);
> > +
> > +            #[inline]
> > +            fn to_qemu_none(&self) -> Stash<NewPtr<*mut
> qapi_ffi::$ffi>, Self> {
> > +                let stash_vec: Vec<_> =3D
> self.iter().rev().map(ToQemuPtr::to_qemu_none).collect();
> > +                let mut list: *mut qapi_ffi::$ffi =3D
> std::ptr::null_mut();
> > +                for stash in &stash_vec {
> > +                    let b =3D Box::new(qapi_ffi::$ffi {
> > +                        next: list,
> > +                        value: Ptr::to(stash.0),
> > +                    });
> > +                    list =3D Box::into_raw(b);
> > +                }
> > +                Stash(NewPtr(list), ($ffi(list), stash_vec))
> > +            }
> > +
> > +            #[inline]
> > +            fn to_qemu_full(&self) -> NewPtr<*mut qapi_ffi::$ffi> {
> > +                let v: Vec<_> =3D
> self.iter().rev().map(ToQemuPtr::to_qemu_full).collect();
> > +                let mut list: *mut qapi_ffi::$ffi =3D
> std::ptr::null_mut();
> > +                unsafe {
> > +                    for val in v {
> > +                        let l =3D
> ffi::g_malloc0(std::mem::size_of::<qapi_ffi::$ffi>())
> > +                            as *mut qapi_ffi::$ffi;
> > +                        (*l).next =3D list;
> > +                        (*l).value =3D val;
> > +                        list =3D l;
> > +                    }
> > +                }
> > +                NewPtr(list)
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +#[doc(hidden)]
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_vec_from_qemu {
> > +    ($rs:ty, $ffi:ident, $free_ffi:ident) =3D> {
> > +        impl FromQemuPtrFull<NewPtr<*mut qapi_ffi::$ffi>> for Vec<$rs>=
 {
> > +            #[inline]
> > +            unsafe fn from_qemu_full(ffi: NewPtr<*mut qapi_ffi::$ffi>)
> -> Self {
> > +                let ret =3D from_qemu_none(NewPtr(ffi.0 as *const _));
> > +                qapi_ffi::$free_ffi(ffi.0);
> > +                ret
> > +            }
> > +        }
> > +
> > +        impl FromQemuPtrNone<NewPtr<*const qapi_ffi::$ffi>> for
> Vec<$rs> {
> > +            #[inline]
> > +            unsafe fn from_qemu_none(ffi: NewPtr<*const
> qapi_ffi::$ffi>) -> Self {
> > +                let mut ret =3D vec![];
> > +                let mut it =3D ffi.0;
> > +                while !it.is_null() {
> > +                    let e =3D &*it;
> > +                    ret.push(from_qemu_none(e.value as *const _));
> > +                    it =3D e.next;
> > +                }
> > +                ret
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +/// A macro to help the implementation of `Vec<T>` translations.
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! vec_type {
> > +    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 0) =3D> {
> > +        vec_ffi_wrapper!($ffi);
> > +        impl_vec_from_qemu!($rs, $ffi, $free_ffi);
> > +        impl_vec_to_qemu!($rs, $ffi);
> > +    };
> > +    (Vec<$rs:ty>, $ffi:ident, $free_ffi:ident, 1) =3D> {
> > +        vec_ffi_wrapper!($ffi);
> > +        impl_vec_scalars_from_qemu!($rs, $ffi, $free_ffi);
> > +        impl_vec_scalars_to_qemu!($rs, $ffi);
> > +    };
> > +}
> > +
> > +/// A macro to implement [`ToQemuPtr`] as boxed scalars
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_to_qemu_scalar_boxed {
> > +    ($ty:ty) =3D> {
> > +        impl<'a> ToQemuPtr<'a, *mut $ty> for $ty {
> > +            type Storage =3D Box<$ty>;
> > +
> > +            fn to_qemu_none(&'a self) -> Stash<'a, *mut $ty, Self> {
> > +                let mut box_ =3D Box::new(*self);
> > +                Stash(&mut *box_, box_)
> > +            }
> > +
> > +            fn to_qemu_full(&self) -> *mut $ty {
> > +                unsafe {
> > +                    let ptr =3D
> ffi::g_malloc0(std::mem::size_of::<$ty>()) as *mut _;
> > +                    *ptr =3D *self;
> > +                    ptr
> > +                }
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +/// A macro to implement [`FromQemuPtrNone`] for scalar pointers.
> > +#[allow(unused_macros)]
> > +#[macro_export]
> > +macro_rules! impl_from_qemu_none_scalar {
> > +    ($ty:ty) =3D> {
> > +        impl FromQemuPtrNone<*const $ty> for $ty {
> > +            unsafe fn from_qemu_none(ptr: *const $ty) -> Self {
> > +                *ptr
> > +            }
> > +        }
> > +    };
> > +}
> > +
> > +macro_rules! impl_scalar_boxed {
> > +    ($($t:ident)*) =3D> (
> > +        $(
> > +            impl_to_qemu_scalar_boxed!($t);
> > +            impl_from_qemu_none_scalar!($t);
> > +        )*
> > +    )
> > +}
> > +
> > +// the only built-in used so far, feel free to add more as needed
> > +impl_scalar_boxed!(bool i64 f64);
> > --
> > 2.33.0.113.g6c40894d24
> >
> >
>
>

--000000000000b494fa05cb9f4466
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 10, 2021 at 5:19 AM Ali=
stair Francis &lt;<a href=3D"mailto:alistair23@gmail.com">alistair23@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">On Tue, Sep 7, 2021 at 10:41 PM &lt;<a href=3D"mailto:marcandre.lureau@r=
edhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; This crates provides common bindings and facilities for QEMU C API<br>
&gt; shared by various projects.<br>
&gt;<br>
&gt; Most importantly, it defines the conversion traits used to convert fro=
m<br>
&gt; C to Rust types. Those traits are largely adapted from glib-rs, since<=
br>
&gt; those have proved to be very flexible, and should guide us to bind<br>
&gt; further QEMU types such as QOM. If glib-rs becomes a dependency, we<br=
>
&gt; should consider adopting glib translate traits. For QAPI, we need a<br=
>
&gt; smaller subset.<br>
&gt;<br>
&gt; Cargo.lock is checked-in, as QEMU produces end-of-chain binaries, and =
it<br>
&gt; is desirable to track the exact set of packages that are involved in<b=
r>
&gt; managed builds.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 Cargo.lock=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 63 +++++<br>
&gt;=C2=A0 Cargo.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 rust/common/Cargo.toml=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +<br=
>
&gt;=C2=A0 rust/common/src/<a href=3D"http://error.rs" rel=3D"noreferrer" t=
arget=3D"_blank">error.rs</a>=C2=A0 =C2=A0 =C2=A0| 113 ++++++++<br>
&gt;=C2=A0 rust/common/src/<a href=3D"http://ffi.rs" rel=3D"noreferrer" tar=
get=3D"_blank">ffi.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 93 +++++++<br>
&gt;=C2=A0 rust/common/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" tar=
get=3D"_blank">lib.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 21 ++<br>
&gt;=C2=A0 rust/common/src/<a href=3D"http://qemu.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">qemu.rs</a>=C2=A0 =C2=A0 =C2=A0 | 101 ++++++++<br>
&gt;=C2=A0 rust/common/src/<a href=3D"http://qmp.rs" rel=3D"noreferrer" tar=
get=3D"_blank">qmp.rs</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A00<br>
&gt;=C2=A0 rust/common/src/<a href=3D"http://translate.rs" rel=3D"noreferre=
r" target=3D"_blank">translate.rs</a> | 482 +++++++++++++++++++++++++++++++=
++++<br>
&gt;=C2=A0 9 files changed, 887 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 create mode 100644 Cargo.lock<br>
&gt;=C2=A0 create mode 100644 rust/common/Cargo.toml<br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://error.rs" r=
el=3D"noreferrer" target=3D"_blank">error.rs</a><br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://ffi.rs" rel=
=3D"noreferrer" target=3D"_blank">ffi.rs</a><br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://lib.rs" rel=
=3D"noreferrer" target=3D"_blank">lib.rs</a><br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://qemu.rs" re=
l=3D"noreferrer" target=3D"_blank">qemu.rs</a><br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://qmp.rs" rel=
=3D"noreferrer" target=3D"_blank">qmp.rs</a><br>
&gt;=C2=A0 create mode 100644 rust/common/src/<a href=3D"http://translate.r=
s" rel=3D"noreferrer" target=3D"_blank">translate.rs</a><br>
&gt;<br>
&gt; diff --git a/Cargo.lock b/Cargo.lock<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8dc2dd9da7<br>
&gt; --- /dev/null<br>
&gt; +++ b/Cargo.lock<br>
&gt; @@ -0,0 +1,63 @@<br>
&gt; +# This file is automatically @generated by Cargo.<br>
&gt; +# It is not intended for manual editing.<br>
&gt; +version =3D 3<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;autocfg&quot;<br>
&gt; +version =3D &quot;1.0.1&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;cdb031dd78e28731d87d56cc8ffef4a8f36ca26c38fe2de700=
543e627f8a464a&quot;<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;bitflags&quot;<br>
&gt; +version =3D &quot;1.2.1&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;cf1de2fe8c75bc145a2f577add951f8134889b4795d47466a5=
4a5c846d691693&quot;<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;cc&quot;<br>
&gt; +version =3D &quot;1.0.70&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;d26a6ce4b6a484fa3edb70f7efa6fc430fd2b87285fe8b8430=
4fd0936faa0dc0&quot;<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;cfg-if&quot;<br>
&gt; +version =3D &quot;1.0.0&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf=
79117bd2da40fd&quot;<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;common&quot;<br>
&gt; +version =3D &quot;0.1.0&quot;<br>
&gt; +dependencies =3D [<br>
&gt; + &quot;libc&quot;,<br>
&gt; + &quot;nix&quot;,<br>
&gt; +]<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;libc&quot;<br>
&gt; +version =3D &quot;0.2.101&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;3cb00336871be5ed2c8ed44b60ae9959dc5b9f08539422ed43=
f09e34ecaeba21&quot;<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;memoffset&quot;<br>
&gt; +version =3D &quot;0.6.4&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;59accc507f1338036a0477ef61afdae33cde60840f4dfe4813=
19ce3ad116ddf9&quot;<br>
&gt; +dependencies =3D [<br>
&gt; + &quot;autocfg&quot;,<br>
&gt; +]<br>
&gt; +<br>
&gt; +[[package]]<br>
&gt; +name =3D &quot;nix&quot;<br>
&gt; +version =3D &quot;0.20.1&quot;<br>
&gt; +source =3D &quot;registry+<a href=3D"https://github.com/rust-lang/cra=
tes.io-index" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-=
lang/crates.io-index</a>&quot;<br>
&gt; +checksum =3D &quot;df8e5e343312e7fbeb2a52139114e9e702991ef9c2aea6817f=
f2440b35647d56&quot;<br>
&gt; +dependencies =3D [<br>
&gt; + &quot;bitflags&quot;,<br>
&gt; + &quot;cc&quot;,<br>
&gt; + &quot;cfg-if&quot;,<br>
&gt; + &quot;libc&quot;,<br>
&gt; + &quot;memoffset&quot;,<br>
&gt; +]<br>
&gt; diff --git a/Cargo.toml b/Cargo.toml<br>
&gt; index c4b464ff15..14131eed3c 100644<br>
&gt; --- a/Cargo.toml<br>
&gt; +++ b/Cargo.toml<br>
&gt; @@ -1,2 +1,4 @@<br>
&gt;=C2=A0 [workspace]<br>
&gt; -members =3D []<br>
&gt; +members =3D [<br>
&gt; +=C2=A0 &quot;rust/common&quot;,<br>
&gt; +]<br>
&gt; diff --git a/rust/common/Cargo.toml b/rust/common/Cargo.toml<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..6c240447f3<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/Cargo.toml<br>
&gt; @@ -0,0 +1,11 @@<br>
&gt; +[package]<br>
&gt; +name =3D &quot;common&quot;<br>
&gt; +version =3D &quot;0.1.0&quot;<br>
&gt; +edition =3D &quot;2018&quot;<br>
&gt; +publish =3D false<br>
&gt; +<br>
&gt; +[dependencies]<br>
&gt; +libc =3D &quot;0.2.92&quot;<br>
&gt; +<br>
&gt; +[target.&quot;cfg(unix)&quot;.dependencies]<br>
&gt; +nix =3D &quot;0.20.0&quot;<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://error.rs" rel=3D"norefe=
rrer" target=3D"_blank">error.rs</a> b/rust/common/src/<a href=3D"http://er=
ror.rs" rel=3D"noreferrer" target=3D"_blank">error.rs</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f166ac42ea<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/src/<a href=3D"http://error.rs" rel=3D"noreferrer" t=
arget=3D"_blank">error.rs</a><br>
&gt; @@ -0,0 +1,113 @@<br>
&gt; +use std::{self, ffi::CString, fmt, io, ptr};<br>
&gt; +<br>
&gt; +use crate::translate::*;<br>
<br>
It&#39;s not uncommon to ban wildcard imports that aren&#39;t preludes as i=
t<br>
can make it confusing to read. Does QEMU have a stance on that type of<br>
thing?<br></blockquote><div><br></div><div>There is no such common rule in =
Rust afaik. It&#39;s based on judgement and style. If the imported symbols =
pollute your namespace or not. But yes, in general, it&#39;s better to sele=
ctively import what you need, mostly for readability.<br></div><div><br> </=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +use crate::{ffi, qemu};<br>
&gt; +<br>
&gt; +/// Common error type for QEMU and related projects.<br>
&gt; +#[derive(Debug)]<br>
&gt; +pub enum Error {<br>
&gt; +=C2=A0 =C2=A0 /// A generic error with file and line location.<br>
&gt; +=C2=A0 =C2=A0 FailedAt(String, &amp;&#39;static str, u32),<br>
&gt; +=C2=A0 =C2=A0 /// An IO error.<br>
&gt; +=C2=A0 =C2=A0 Io(io::Error),<br>
&gt; +=C2=A0 =C2=A0 #[cfg(unix)]<br>
&gt; +=C2=A0 =C2=A0 /// A nix error.<br>
&gt; +=C2=A0 =C2=A0 Nix(nix::Error),<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Alias for a `Result` with the error type for QEMU.<br>
&gt; +pub type Result&lt;T&gt; =3D std::result::Result&lt;T, Error&gt;;<br>
<br>
I think this is very confusing. Rust developers expect `Result` to be<br>
the one from `std::result`, it would be better to call this<br>
`QEMUResult`<br></blockquote><div><br></div><div>It&#39;s very common in Ru=
st to redefine Result for your crate error. Users don&#39;t have to import =
it if they prefer the std::result::Result&lt;T,E&gt;. This redefinition was=
 probably popularized with the `std::io::Result&lt;T&gt;` type. (<a href=3D=
"https://doc.rust-lang.org/std/io/type.Result.html">https://doc.rust-lang.o=
rg/std/io/type.Result.html</a>)</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; +<br>
&gt; +impl Error {<br>
&gt; +=C2=A0 =C2=A0 fn message(&amp;self) -&gt; String {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 use Error::*;<br>
<br>
Do we need this here? Why not put it at the top of the file?<br></blockquot=
e><div><br></div><div>It&#39;s limited here to avoid enum prefix repetition=
:</div><div>match self {</div><div>=C2=A0Error::FailedAt .. <br></div><div>=
=C2=A0Error::Io ..</div><div>=C2=A0Error::Foo ..</div><div>}</div><div><br>=
</div><div>(It wouldn&#39;t be a good idea to import it in the top namespac=
e)<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FailedAt(msg, _, _) =3D&gt;=
 msg.into(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Io(io) =3D&gt; format!(&quo=
t;IO error: {}&quot;, io),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[cfg(unix)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nix(nix) =3D&gt; format!(&q=
uot;Nix error: {}&quot;, nix),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fn location(&amp;self) -&gt; Option&lt;(&amp;&#39;stati=
c str, u32)&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 use Error::*;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FailedAt(_, file, line) =3D=
&gt; Some((file, *line)),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Io(_) =3D&gt; None,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[cfg(unix)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Nix(_) =3D&gt; None,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl fmt::Display for Error {<br>
&gt; +=C2=A0 =C2=A0 fn fmt(&amp;self, f: &amp;mut fmt::Formatter) -&gt; fmt=
::Result {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 use Error::*;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 FailedAt(msg, file, line) =
=3D&gt; write!(f, &quot;{} ({}:{})&quot;, msg, file, line),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _ =3D&gt; write!(f, &quot;{=
}&quot;, self.message()),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl From&lt;io::Error&gt; for Error {<br>
&gt; +=C2=A0 =C2=A0 fn from(val: io::Error) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error::Io(val)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[cfg(unix)]<br>
&gt; +impl From&lt;nix::Error&gt; for Error {<br>
&gt; +=C2=A0 =C2=A0 fn from(val: nix::Error) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error::Nix(val)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl QemuPtrDefault for Error {<br>
&gt; +=C2=A0 =C2=A0 type QemuType =3D *mut ffi::Error;<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *mut ffi::Error&gt; for Error=
 {<br>
&gt; +=C2=A0 =C2=A0 type Storage =3D qemu::CError;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;&#39;a self) -&gt; Stash&lt;&#39;a=
, *mut ffi::Error, Self&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let err =3D self.to_qemu_full();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(err, unsafe { from_qemu_full(err) }=
)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; *mut ffi::Error {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let cmsg =3D<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 CString::new(self.message()=
).expect(&quot;ToQemuPtr&lt;Error&gt;: unexpected &#39;\0&#39; character&qu=
ot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut csrc =3D CString::new(&quot;&quot=
;).unwrap();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let (src, line) =3D self.location().map_o=
r((ptr::null(), 0_i32), |loc| {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 csrc =3D CString::new(loc.0=
).expect(&quot;ToQemuPtr&lt;Error&gt;:: unexpected &#39;\0&#39; character&q=
uot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (csrc.as_ptr() as *const li=
bc::c_char, loc.1 as i32)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let func =3D ptr::null();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut err: *mut ffi::Error =3D ptr::nul=
l_mut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ffi::error_setg_internal(<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;mut err =
as *mut *mut _,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 line,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 func,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmsg.as_ptr()=
 as *const libc::c_char,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 err<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Convenience macro to build a [`Error::FailedAt`] error.<br>
&gt; +///<br>
&gt; +/// Returns a `Result::Err` with the file:line location.<br>
&gt; +/// (the error can then be converted to a QEMU `ffi::Error`)<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! err {<br>
&gt; +=C2=A0 =C2=A0 ($msg:expr) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(Error::FailedAt($msg.into(), file!(),=
 line!()))<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://ffi.rs" rel=3D"noreferr=
er" target=3D"_blank">ffi.rs</a> b/rust/common/src/<a href=3D"http://ffi.rs=
" rel=3D"noreferrer" target=3D"_blank">ffi.rs</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..82818d503a<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/src/<a href=3D"http://ffi.rs" rel=3D"noreferrer" tar=
get=3D"_blank">ffi.rs</a><br>
&gt; @@ -0,0 +1,93 @@<br>
&gt; +//! Bindings to the raw low-level C API commonly provided by QEMU pro=
jects.<br>
&gt; +//!<br>
&gt; +//! Manual bindings to C API availabe when linking QEMU projects.<br>
<br>
s/availabe/available/g<br>
<br></blockquote><div><br></div><div>yup thanks</div><div> <br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
&gt; +//! It includes minimal glib allocation functions too, since it&#39;s=
 the default<br>
&gt; +//! allocator used by QEMU, and we don&#39;t depend on glib-rs crate =
yet).<br>
&gt; +//!<br>
&gt; +//! Higher-level Rust-friendly bindings are provided by different mod=
ules.<br>
&gt; +<br>
&gt; +use libc::{c_char, c_void, size_t};<br>
&gt; +<br>
&gt; +extern &quot;C&quot; {<br>
&gt; +=C2=A0 =C2=A0 pub fn g_malloc0(n_bytes: size_t) -&gt; *mut c_void;<br=
>
&gt; +=C2=A0 =C2=A0 pub fn g_free(ptr: *mut c_void);<br>
&gt; +=C2=A0 =C2=A0 pub fn g_strndup(str: *const c_char, n: size_t) -&gt; *=
mut c_char;<br>
&gt; +}<br>
<br>
We can get there from the glib/glib_sys crate:<br>
<a href=3D"https://gtk-rs.org/gtk-rs-core/stable/latest/docs/glib_sys/fn.g_=
malloc0.html" rel=3D"noreferrer" target=3D"_blank">https://gtk-rs.org/gtk-r=
s-core/stable/latest/docs/glib_sys/fn.g_malloc0.html</a><br>
<br>
If we only plan on using these 3 I think this approach is fine, but<br>
something to keep in mind if we use more glib functions.<br>
<br></blockquote><div><br></div><div>Yes, I think I mentioned this somewher=
e. We might need to import glib-sys or glib-rs depending on what we need to=
 write in Rust. We may actually not need more than a few FFI functions thou=
gh, so importing external crates for that isn&#39;t worth it.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +<br>
&gt; +#[repr(C)]<br>
&gt; +pub struct QObject(c_void);<br>
&gt; +<br>
&gt; +impl ::std::fmt::Debug for QObject {<br>
&gt; +=C2=A0 =C2=A0 fn fmt(&amp;self, f: &amp;mut ::std::fmt::Formatter) -&=
gt; ::std::fmt::Result {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.debug_struct(&amp;format!(&quot;QObject=
 @ {:?}&quot;, self as *const _))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .finish()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[repr(C)]<br>
&gt; +pub struct QNull(c_void);<br>
&gt; +<br>
&gt; +impl ::std::fmt::Debug for QNull {<br>
&gt; +=C2=A0 =C2=A0 fn fmt(&amp;self, f: &amp;mut ::std::fmt::Formatter) -&=
gt; ::std::fmt::Result {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.debug_struct(&amp;format!(&quot;QNull @=
 {:?}&quot;, self as *const _))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .finish()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[repr(C)]<br>
&gt; +pub struct Error(c_void);<br>
&gt; +<br>
&gt; +impl ::std::fmt::Debug for Error {<br>
&gt; +=C2=A0 =C2=A0 fn fmt(&amp;self, f: &amp;mut ::std::fmt::Formatter) -&=
gt; ::std::fmt::Result {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.debug_struct(&amp;format!(&quot;Error @=
 {:?}&quot;, self as *const _))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .finish()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +extern &quot;C&quot; {<br>
&gt; +=C2=A0 =C2=A0 pub fn error_setg_internal(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 errp: *mut *mut Error,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 src: *const c_char,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 line: i32,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 func: *const c_char,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fmt: *const c_char,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; +=C2=A0 =C2=A0 );<br>
&gt; +=C2=A0 =C2=A0 pub fn error_get_pretty(err: *const Error) -&gt; *const=
 c_char;<br>
&gt; +=C2=A0 =C2=A0 pub fn error_free(err: *mut Error);<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Wrap a QMP hanlder.<br>
<br>
handler<br></blockquote><div><br></div><div>thanks!</div><div> <br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! qmp {<br>
&gt; +=C2=A0 =C2=A0 // the basic return value variant<br>
&gt; +=C2=A0 =C2=A0 ($e:expr, $errp:ident, $errval:expr) =3D&gt; {{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert!(!$errp.is_null());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *$errp =3D std::ptr::null_m=
ut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match $e {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(val) =3D&gt; val,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(err) =3D&gt; unsafe {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *$errp =3D er=
r.to_qemu_full();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 $errval<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }};<br>
&gt; +=C2=A0 =C2=A0 // the ptr return value variant<br>
&gt; +=C2=A0 =C2=A0 ($e:expr, $errp:ident) =3D&gt; {{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert!(!$errp.is_null());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *$errp =3D std::ptr::null_m=
ut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 match $e {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Ok(val) =3D&gt; val.to_qemu=
_full().into(),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Err(err) =3D&gt; unsafe {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *$errp =3D er=
r.to_qemu_full();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 std::ptr::nul=
l_mut()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }};<br>
&gt; +}<br>
<br>
It would be a good idea to document why this code is safe<br></blockquote><=
div><br></div><div>Hmm, I am not sure that&#39;s the question. I assume Rus=
t code is safe :) However, the FFI borders are full of unsafe {}. It&#39;s =
basically a trust relationship with the other side. But it&#39;s always gre=
at to document tricky unsafe {}, or where panic is unexpected (unwrap()/exp=
ect()).. based on review, judgement, style.. (read also <a href=3D"https://=
doc.rust-lang.org/book/ch09-03-to-panic-or-not-to-panic.html">https://doc.r=
ust-lang.org/book/ch09-03-to-panic-or-not-to-panic.html</a>).</div><div><br=
></div><div>Thanks!<br></div><div> <br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
Alistair<br>
<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://lib.rs" rel=3D"noreferr=
er" target=3D"_blank">lib.rs</a> b/rust/common/src/<a href=3D"http://lib.rs=
" rel=3D"noreferrer" target=3D"_blank">lib.rs</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..4de826bc2e<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/src/<a href=3D"http://lib.rs" rel=3D"noreferrer" tar=
get=3D"_blank">lib.rs</a><br>
&gt; @@ -0,0 +1,21 @@<br>
&gt; +//! Common code for QEMU<br>
&gt; +//!<br>
&gt; +//! This crates provides common bindings and facilities for QEMU C AP=
I shared by<br>
&gt; +//! various projects. Most importantly, it defines the conversion tra=
its used to<br>
&gt; +//! convert from C to Rust types. Those traits are largely adapted fr=
om glib-rs,<br>
&gt; +//! since those have prooven to be very flexible, and should guide us=
 to bind<br>
&gt; +//! further QEMU types such as QOM. If glib-rs becomes a dependency, =
we should<br>
&gt; +//! consider adopting glib translate traits. For QAPI, we need a smal=
ler subset.<br>
&gt; +<br>
&gt; +pub use libc;<br>
&gt; +<br>
&gt; +mod error;<br>
&gt; +pub use error::*;<br>
&gt; +<br>
&gt; +mod qemu;<br>
&gt; +pub use qemu::*;<br>
&gt; +<br>
&gt; +mod translate;<br>
&gt; +pub use translate::*;<br>
&gt; +<br>
&gt; +pub mod ffi;<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://qemu.rs" rel=3D"norefer=
rer" target=3D"_blank">qemu.rs</a> b/rust/common/src/<a href=3D"http://qemu=
.rs" rel=3D"noreferrer" target=3D"_blank">qemu.rs</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..dd01c6d92d<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/src/<a href=3D"http://qemu.rs" rel=3D"noreferrer" ta=
rget=3D"_blank">qemu.rs</a><br>
&gt; @@ -0,0 +1,101 @@<br>
&gt; +use std::{ffi::CStr, ptr, str};<br>
&gt; +<br>
&gt; +use crate::{ffi, translate};<br>
&gt; +use translate::{FromQemuPtrFull, FromQemuPtrNone, QemuPtrDefault, Sta=
sh, ToQemuPtr};<br>
&gt; +<br>
&gt; +/// A type representing an owned C QEMU Error.<br>
&gt; +pub struct CError(ptr::NonNull&lt;ffi::Error&gt;);<br>
&gt; +<br>
&gt; +impl translate::FromQemuPtrFull&lt;*mut ffi::Error&gt; for CError {<b=
r>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(ptr: *mut ffi::Error) -&gt; Se=
lf {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert!(!ptr.is_null());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Self(ptr::NonNull::new_unchecked(ptr))<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl CError {<br>
&gt; +=C2=A0 =C2=A0 pub fn pretty(&amp;self) -&gt; &amp;str {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let pretty =3D ffi::error_g=
et_pretty(self.0.as_ptr());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let bytes =3D CStr::from_pt=
r(pretty).to_bytes();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 str::from_utf8(bytes)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .unwrap_or_el=
se(|err| str::from_utf8(&amp;bytes[..err.valid_up_to()]).unwrap())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl Drop for CError {<br>
&gt; +=C2=A0 =C2=A0 fn drop(&amp;mut self) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe { ffi::error_free(self.0.as_ptr())=
 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// QObject (JSON object)<br>
&gt; +#[derive(Clone, Debug)]<br>
&gt; +pub struct QObject;<br>
&gt; +<br>
&gt; +impl QemuPtrDefault for QObject {<br>
&gt; +=C2=A0 =C2=A0 type QemuType =3D *mut ffi::QObject;<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrFull&lt;*mut ffi::QObject&gt; for QObject {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -&gt;=
 Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrNone&lt;*const ffi::QObject&gt; for QObject {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -&g=
t; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *mut ffi::QObject&gt; for QOb=
ject {<br>
&gt; +=C2=A0 =C2=A0 type Storage =3D ();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;self) -&gt; Stash&lt;&#39;a, *mut =
ffi::QObject, QObject&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; *mut ffi::QObject {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// QNull (JSON null)<br>
&gt; +#[derive(Clone, Debug)]<br>
&gt; +pub struct QNull;<br>
&gt; +<br>
&gt; +impl QemuPtrDefault for QNull {<br>
&gt; +=C2=A0 =C2=A0 type QemuType =3D *mut ffi::QNull;<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrFull&lt;*mut ffi::QObject&gt; for QNull {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(_ffi: *mut ffi::QObject) -&gt;=
 Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrNone&lt;*const ffi::QObject&gt; for QNull {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_none(_ffi: *const ffi::QObject) -&g=
t; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *mut ffi::QNull&gt; for QNull=
 {<br>
&gt; +=C2=A0 =C2=A0 type Storage =3D ();<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;self) -&gt; Stash&lt;&#39;a, *mut =
ffi::QNull, QNull&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; *mut ffi::QNull {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://qmp.rs" rel=3D"noreferr=
er" target=3D"_blank">qmp.rs</a> b/rust/common/src/<a href=3D"http://qmp.rs=
" rel=3D"noreferrer" target=3D"_blank">qmp.rs</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e69de29bb2<br>
&gt; diff --git a/rust/common/src/<a href=3D"http://translate.rs" rel=3D"no=
referrer" target=3D"_blank">translate.rs</a> b/rust/common/src/<a href=3D"h=
ttp://translate.rs" rel=3D"noreferrer" target=3D"_blank">translate.rs</a><b=
r>
&gt; new file mode 100644<br>
&gt; index 0000000000..315e14fa25<br>
&gt; --- /dev/null<br>
&gt; +++ b/rust/common/src/<a href=3D"http://translate.rs" rel=3D"noreferre=
r" target=3D"_blank">translate.rs</a><br>
&gt; @@ -0,0 +1,482 @@<br>
&gt; +// largely adapted from glib-rs<br>
&gt; +// we don&#39;t depend on glib-rs as this brings a lot more code that=
 we may not need<br>
&gt; +// and also because there are issues with the conversion traits for o=
ur ffi::*mut.<br>
&gt; +use libc::{c_char, size_t};<br>
&gt; +use std::ffi::{CStr, CString};<br>
&gt; +use std::ptr;<br>
&gt; +<br>
&gt; +use crate::ffi;<br>
&gt; +<br>
&gt; +/// A pointer.<br>
&gt; +pub trait Ptr: Copy + &#39;static {<br>
&gt; +=C2=A0 =C2=A0 fn is_null(&amp;self) -&gt; bool;<br>
&gt; +=C2=A0 =C2=A0 fn from&lt;X&gt;(ptr: *mut X) -&gt; Self;<br>
&gt; +=C2=A0 =C2=A0 fn to&lt;X&gt;(self) -&gt; *mut X;<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;T: &#39;static&gt; Ptr for *const T {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn is_null(&amp;self) -&gt; bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*self).is_null()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn from&lt;X&gt;(ptr: *mut X) -&gt; *const T {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr as *const T<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to&lt;X&gt;(self) -&gt; *mut X {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self as *mut X<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;T: &#39;static&gt; Ptr for *mut T {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn is_null(&amp;self) -&gt; bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 (*self).is_null()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn from&lt;X&gt;(ptr: *mut X) -&gt; *mut T {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptr as *mut T<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to&lt;X&gt;(self) -&gt; *mut X {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self as *mut X<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Macro to declare a `NewPtr` struct.<br>
&gt; +///<br>
&gt; +/// A macro to declare a newtype for pointers, to workaround that *T =
are not<br>
&gt; +/// defined in our binding crates, and allow foreign traits implement=
ations.<br>
&gt; +/// (this is used by qapi-gen bindings)<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +#[doc(hidden)]<br>
&gt; +macro_rules! new_ptr {<br>
&gt; +=C2=A0 =C2=A0 () =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #[derive(Copy, Clone)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub struct NewPtr&lt;P: Ptr&gt;(pub P);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl&lt;P: Ptr&gt; Ptr for NewPtr&lt;P&gt=
; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn is_null(&amp;self) -&gt;=
 bool {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.0.is_nul=
l()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn from&lt;X&gt;(ptr: *mut =
X) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NewPtr(P::fro=
m(ptr))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to&lt;X&gt;(self) -&gt; =
*mut X {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"ht=
tp://self.0.to" rel=3D"noreferrer" target=3D"_blank">self.0.to</a>()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Provides the default pointer type to be used in some container co=
nversions.<br>
&gt; +///<br>
&gt; +/// It&#39;s `*mut c_char` for `String`, `*mut ffi::GuestInfo` for `G=
uestInfo`...<br>
&gt; +pub trait QemuPtrDefault {<br>
&gt; +=C2=A0 =C2=A0 type QemuType: Ptr;<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl QemuPtrDefault for String {<br>
&gt; +=C2=A0 =C2=A0 type QemuType =3D *mut c_char;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// A Stash contains the temporary storage and a pointer into it.<br>
&gt; +///<br>
&gt; +/// The pointer is valid for the lifetime of the `Stash`. As the life=
time of the<br>
&gt; +/// `Stash` returned from `to_qemu_none` is at least the enclosing st=
atement,<br>
&gt; +/// you can avoid explicitly binding the stash in most cases and just=
 take the<br>
&gt; +/// pointer out of it:<br>
&gt; +///<br>
&gt; +/// ```ignore<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0pub fn set_device_name(&amp;self, name: &amp;s=
tr) {<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsafe {<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ffi::qemu_device_s=
et_name(self.pointer, name.to_qemu_none().0)<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +///=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +/// ```<br>
&gt; +pub struct Stash&lt;&#39;a, P: Copy, T: ?Sized + ToQemuPtr&lt;&#39;a,=
 P&gt;&gt;(<br>
&gt; +=C2=A0 =C2=A0 pub P,<br>
&gt; +=C2=A0 =C2=A0 pub &lt;T as ToQemuPtr&lt;&#39;a, P&gt;&gt;::Storage,<b=
r>
&gt; +);<br>
&gt; +<br>
&gt; +/// Translate to a pointer.<br>
&gt; +pub trait ToQemuPtr&lt;&#39;a, P: Copy&gt; {<br>
&gt; +=C2=A0 =C2=A0 type Storage;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /// The pointer in the `Stash` is only valid for the li=
fetime of the `Stash`.<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;&#39;a self) -&gt; Stash&lt;&#39;a=
, P, Self&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /// Transfer the ownership to the ffi.<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; P {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unimplemented!();<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a, P: Ptr, T: ToQemuPtr&lt;&#39;a, P&gt;&gt; ToQemuPtr&l=
t;&#39;a, P&gt; for Option&lt;T&gt; {<br>
&gt; +=C2=A0 =C2=A0 type Storage =3D Option&lt;&lt;T as ToQemuPtr&lt;&#39;a=
, P&gt;&gt;::Storage&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;&#39;a self) -&gt; Stash&lt;&#39;a=
, P, Option&lt;T&gt;&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as_ref()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .map_or(Stash(Ptr::from::&l=
t;()&gt;(ptr::null_mut()), None), |s| {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let s =3D s.t=
o_qemu_none();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(s.0, So=
me(s.1))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 })<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; P {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.as_ref()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .map_or(Ptr::from::&lt;()&g=
t;(ptr::null_mut()), ToQemuPtr::to_qemu_full)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a, P: Ptr, T: ToQemuPtr&lt;&#39;a, P&gt;&gt; ToQemuPtr&l=
t;&#39;a, P&gt; for Box&lt;T&gt; {<br>
&gt; +=C2=A0 =C2=A0 type Storage =3D &lt;T as ToQemuPtr&lt;&#39;a, P&gt;&gt=
;::Storage;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;&#39;a self) -&gt; Stash&lt;&#39;a=
, P, Box&lt;T&gt;&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let s =3D self.as_ref().to_qemu_none();<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(s.0, s.1)<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; P {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ToQemuPtr::to_qemu_full(self.as_ref())<br=
>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *mut c_char&gt; for String {<=
br>
&gt; +=C2=A0 =C2=A0 type Storage =3D CString;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_none(&amp;self) -&gt; Stash&lt;&#39;a, *mut =
c_char, String&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let tmp =3D CString::new(&amp;self[..])<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .expect(&quot;String::ToQem=
uPtr&lt;*mut c_char&gt;: unexpected &#39;\0&#39; character&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(tmp.as_ptr() as *mut c_char, tmp)<b=
r>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 fn to_qemu_full(&amp;self) -&gt; *mut c_char {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe { ffi::g_strndup(self.as_ptr() as =
*const c_char, self.len() as size_t) }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Translate from a pointer type, without taking ownership.<br>
&gt; +pub trait FromQemuPtrNone&lt;P: Ptr&gt;: Sized {<br>
&gt; +=C2=A0 =C2=A0 /// # Safety<br>
&gt; +=C2=A0 =C2=A0 ///<br>
&gt; +=C2=A0 =C2=A0 /// `ptr` must be a valid pointer. It is not referenced=
 after the call.<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_none(ptr: P) -&gt; Self;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// Translate from a pointer type, taking ownership.<br>
&gt; +pub trait FromQemuPtrFull&lt;P: Ptr&gt;: Sized {<br>
&gt; +=C2=A0 =C2=A0 /// # Safety<br>
&gt; +=C2=A0 =C2=A0 ///<br>
&gt; +=C2=A0 =C2=A0 /// `ptr` must be a valid pointer. Ownership is transfe=
rred.<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(ptr: P) -&gt; Self;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// See [`FromQemuPtrNone`](trait.FromQemuPtrNone.html).<br>
&gt; +#[inline]<br>
&gt; +#[allow(clippy::missing_safety_doc)]<br>
&gt; +pub unsafe fn from_qemu_none&lt;P: Ptr, T: FromQemuPtrNone&lt;P&gt;&g=
t;(ptr: P) -&gt; T {<br>
&gt; +=C2=A0 =C2=A0 FromQemuPtrNone::from_qemu_none(ptr)<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// See [`FromQemuPtrFull`](trait.FromQemuPtrFull.html).<br>
&gt; +#[inline]<br>
&gt; +#[allow(clippy::missing_safety_doc)]<br>
&gt; +pub unsafe fn from_qemu_full&lt;P: Ptr, T: FromQemuPtrFull&lt;P&gt;&g=
t;(ptr: P) -&gt; T {<br>
&gt; +=C2=A0 =C2=A0 FromQemuPtrFull::from_qemu_full(ptr)<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;P: Ptr, T: FromQemuPtrNone&lt;P&gt;&gt; FromQemuPtrNone&lt;P&=
gt; for Option&lt;T&gt; {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_none(ptr: P) -&gt; Option&lt;T&gt; =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ptr.is_null() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(from_qemu_none(ptr))<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl&lt;P: Ptr, T: FromQemuPtrFull&lt;P&gt;&gt; FromQemuPtrFull&lt;P&=
gt; for Option&lt;T&gt; {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(ptr: P) -&gt; Option&lt;T&gt; =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ptr.is_null() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 None<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Some(from_qemu_full(ptr))<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrNone&lt;*const c_char&gt; for String {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_none(ptr: *const c_char) -&gt; Self=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert!(!ptr.is_null());<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 String::from_utf8_lossy(CStr::from_ptr(pt=
r).to_bytes()).into_owned()<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +impl FromQemuPtrFull&lt;*mut c_char&gt; for String {<br>
&gt; +=C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 unsafe fn from_qemu_full(ptr: *mut c_char) -&gt; Self {=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 let res =3D from_qemu_none(ptr as *const =
_);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ffi::g_free(ptr as *mut _);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 res<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[doc(hidden)]<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! vec_ffi_wrapper {<br>
&gt; +=C2=A0 =C2=A0 ($ffi:ident) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 #[allow(non_camel_case_types)]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pub struct $ffi(*mut qapi_ffi::$ffi);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl Drop for $ffi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn drop(&amp;mut self) {<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut list =
=3D self.0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 while !list.is_null() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 let next =3D (*list).next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 Box::from_raw(list);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 list =3D next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl From&lt;NewPtr&lt;*mut qapi_ffi::$ff=
i&gt;&gt; for *mut qapi_ffi::$ffi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn from(p: NewPtr&lt;*mut q=
api_ffi::$ffi&gt;) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p.0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[doc(hidden)]<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_vec_scalars_to_qemu {<br>
&gt; +=C2=A0 =C2=A0 ($rs:ty, $ffi:ident) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, N=
ewPtr&lt;*mut qapi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type Storage =3D $ffi;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_none(&amp;self) =
-&gt; Stash&lt;NewPtr&lt;*mut qapi_ffi::$ffi&gt;, Self&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut list:=
 *mut qapi_ffi::$ffi =3D std::ptr::null_mut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for value in =
self.iter().rev() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 let b =3D Box::new(qapi_ffi::$ffi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 next: list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 value: *value,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 list =3D Box::into_raw(b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(NewPtr(=
list), $ffi(list))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_full(&amp;self) =
-&gt; NewPtr&lt;*mut qapi_ffi::$ffi&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut list:=
 *mut qapi_ffi::$ffi =3D std::ptr::null_mut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for value in self.iter().rev() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 let l =3D ffi::g_malloc0(std::mem::size_of::&lt;qapi_ffi::$f=
fi&gt;())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 as *mut qapi_ffi::$ffi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (*l).next =3D list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (*l).value =3D *value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 list =3D l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NewPtr(list)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[doc(hidden)]<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_vec_scalars_from_qemu {<br>
&gt; +=C2=A0 =C2=A0 ($rs:ty, $ffi:ident, $free_ffi:ident) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl FromQemuPtrFull&lt;NewPtr&lt;*mut qa=
pi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe fn from_qemu_full(ff=
i: NewPtr&lt;*mut qapi_ffi::$ffi&gt;) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let ret =3D f=
rom_qemu_none(NewPtr(ffi.0 as *const _));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_ffi::$fr=
ee_ffi(ffi.0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl FromQemuPtrNone&lt;NewPtr&lt;*const =
qapi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe fn from_qemu_none(ff=
i: NewPtr&lt;*const qapi_ffi::$ffi&gt;) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut ret =
=3D vec![];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut it =
=3D ffi.0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while !it.is_=
null() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 let e =3D &amp;*it;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.push(e.value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 it =3D e.next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[doc(hidden)]<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_vec_to_qemu {<br>
&gt; +=C2=A0 =C2=A0 ($rs:ty, $ffi:ident) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 // impl doesn&#39;t use only types from i=
nside the current crate<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 // impl QemuPtrDefault for Vec&lt;$rs&gt;=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 //=C2=A0 =C2=A0 =C2=A0type QemuType =3D N=
ewPtr&lt;*mut qapi_ffi::$ffi&gt;;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 // }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, N=
ewPtr&lt;*mut qapi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type Storage =3D ($ffi, Vec=
&lt;Stash&lt;&#39;a, &lt;$rs as QemuPtrDefault&gt;::QemuType, $rs&gt;&gt;);=
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_none(&amp;self) =
-&gt; Stash&lt;NewPtr&lt;*mut qapi_ffi::$ffi&gt;, Self&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let stash_vec=
: Vec&lt;_&gt; =3D self.iter().rev().map(ToQemuPtr::to_qemu_none).collect()=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut list:=
 *mut qapi_ffi::$ffi =3D std::ptr::null_mut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for stash in =
&amp;stash_vec {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 let b =3D Box::new(qapi_ffi::$ffi {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 next: list,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 value: Ptr::to(stash.0),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 });<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 list =3D Box::into_raw(b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(NewPtr(=
list), ($ffi(list), stash_vec))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_full(&amp;self) =
-&gt; NewPtr&lt;*mut qapi_ffi::$ffi&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let v: Vec&lt=
;_&gt; =3D self.iter().rev().map(ToQemuPtr::to_qemu_full).collect();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut list:=
 *mut qapi_ffi::$ffi =3D std::ptr::null_mut();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for val in v {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 let l =3D ffi::g_malloc0(std::mem::size_of::&lt;qapi_ffi::$f=
fi&gt;())<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 as *mut qapi_ffi::$ffi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (*l).next =3D list;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 (*l).value =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 list =3D l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NewPtr(list)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +#[doc(hidden)]<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_vec_from_qemu {<br>
&gt; +=C2=A0 =C2=A0 ($rs:ty, $ffi:ident, $free_ffi:ident) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl FromQemuPtrFull&lt;NewPtr&lt;*mut qa=
pi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe fn from_qemu_full(ff=
i: NewPtr&lt;*mut qapi_ffi::$ffi&gt;) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let ret =3D f=
rom_qemu_none(NewPtr(ffi.0 as *const _));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qapi_ffi::$fr=
ee_ffi(ffi.0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl FromQemuPtrNone&lt;NewPtr&lt;*const =
qapi_ffi::$ffi&gt;&gt; for Vec&lt;$rs&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #[inline]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe fn from_qemu_none(ff=
i: NewPtr&lt;*const qapi_ffi::$ffi&gt;) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut ret =
=3D vec![];<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut it =
=3D ffi.0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while !it.is_=
null() {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 let e =3D &amp;*it;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.push(from_qemu_none(e.value as *const _));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 it =3D e.next;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// A macro to help the implementation of `Vec&lt;T&gt;` translations=
.<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! vec_type {<br>
&gt; +=C2=A0 =C2=A0 (Vec&lt;$rs:ty&gt;, $ffi:ident, $free_ffi:ident, 0) =3D=
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vec_ffi_wrapper!($ffi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_vec_from_qemu!($rs, $ffi, $free_ffi)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_vec_to_qemu!($rs, $ffi);<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 (Vec&lt;$rs:ty&gt;, $ffi:ident, $free_ffi:ident, 1) =3D=
&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vec_ffi_wrapper!($ffi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_vec_scalars_from_qemu!($rs, $ffi, $f=
ree_ffi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_vec_scalars_to_qemu!($rs, $ffi);<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// A macro to implement [`ToQemuPtr`] as boxed scalars<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_to_qemu_scalar_boxed {<br>
&gt; +=C2=A0 =C2=A0 ($ty:ty) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl&lt;&#39;a&gt; ToQemuPtr&lt;&#39;a, *=
mut $ty&gt; for $ty {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 type Storage =3D Box&lt;$ty=
&gt;;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_none(&amp;&#39;a=
 self) -&gt; Stash&lt;&#39;a, *mut $ty, Self&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 let mut box_ =
=3D Box::new(*self);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Stash(&amp;mu=
t *box_, box_)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn to_qemu_full(&amp;self) =
-&gt; *mut $ty {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 let ptr =3D ffi::g_malloc0(std::mem::size_of::&lt;$ty&gt;()) as *mut _;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *ptr =3D *self;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ptr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +/// A macro to implement [`FromQemuPtrNone`] for scalar pointers.<br>
&gt; +#[allow(unused_macros)]<br>
&gt; +#[macro_export]<br>
&gt; +macro_rules! impl_from_qemu_none_scalar {<br>
&gt; +=C2=A0 =C2=A0 ($ty:ty) =3D&gt; {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 impl FromQemuPtrNone&lt;*const $ty&gt; fo=
r $ty {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsafe fn from_qemu_none(pt=
r: *const $ty) -&gt; Self {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *ptr<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 };<br>
&gt; +}<br>
&gt; +<br>
&gt; +macro_rules! impl_scalar_boxed {<br>
&gt; +=C2=A0 =C2=A0 ($($t:ident)*) =3D&gt; (<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_to_qemu_scalar_boxed!(=
$t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 impl_from_qemu_none_scalar!=
($t);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 )*<br>
&gt; +=C2=A0 =C2=A0 )<br>
&gt; +}<br>
&gt; +<br>
&gt; +// the only built-in used so far, feel free to add more as needed<br>
&gt; +impl_scalar_boxed!(bool i64 f64);<br>
&gt; --<br>
&gt; 2.33.0.113.g6c40894d24<br>
&gt;<br>
&gt;<br>
<br>
</blockquote></div></div>

--000000000000b494fa05cb9f4466--


