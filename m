Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E82FF11CDA7
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Dec 2019 13:58:22 +0100 (CET)
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifO2v-0008HY-PK
	for lists+qemu-devel@lfdr.de; Thu, 12 Dec 2019 07:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNxn-0002bK-T6
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ifNxm-0005bh-QC
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:03 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:38625)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ifNxm-0005Zo-Ij
 for qemu-devel@nongnu.org; Thu, 12 Dec 2019 07:53:02 -0500
Received: by mail-wm1-x335.google.com with SMTP id p17so2374008wmi.3
 for <qemu-devel@nongnu.org>; Thu, 12 Dec 2019 04:53:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lAA1rauPYw3IdpUqrU8014lOsyjgeqIfQTPWD16bhyU=;
 b=AEUUq2eQC1y04DVlwqhtHbH5q85fKMba2+z67LVO//TenswBIQehzV4XVBgS9ih+Ee
 xYfHjIpojqS0qt9TGiYT+FJE5ZN5HwRyS85mPFxVjQ7u0f30Ejuf1u+LaYqf3388h5aa
 XTnLkh7dcvsScL6ogtIK8LHOWuFGZNOh/p/NnYf6BbrqX1KHDKww1YzAtszbyEmaD33H
 iKMBAr52EDuWhf0wycCmOWGbz5n9gZy6bHHnscIgxQCBxaXlyyoGuz0LoirYqF+jwJGB
 aYLRg6ailW/htf4KIpxJoH0C67iq8sM8X4nFbaWwqHfiCe9QnnlmfQHo5pBfvzdO5Wl/
 rKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=lAA1rauPYw3IdpUqrU8014lOsyjgeqIfQTPWD16bhyU=;
 b=npmMyHGRilSYOSHnVzotNvH0UY3bcTExZSHj+NlaxS4xlRB9BxoESub9UDp3p5T0Ay
 q2Yy1c/CbOenwFQFY66Z813xhO2sv1FAVBnolhnN2K6Q2ZlzArKsA35wi78pazWPZDhX
 f5OD/7/RVvxhrrST+F6KSy+UFQe262a4LZDZgO5UEVUIlKJDg8j3EVejKgtpkSDQAavB
 aWp6ZN55QbYa5Bwz79Poc2oxiu9aqVjPSDJ6zysoz/ZHufEed0l0p+X42Hu4xDIiMgwk
 v5wUAEI1E96c9g0ZKlS5l/91Gv008LmfV/6/lMTQGFHaWswgO85mvU0/do3SLMiaDlh6
 GHlQ==
X-Gm-Message-State: APjAAAUBhD2Xzww/HXeHfrIBZP/6VjICQZYqEa3Gr3XZ8s/v1s9gLHcr
 LPTlGd/7Im5LLyjF+MwT+dV8UBl5
X-Google-Smtp-Source: APXvYqzVi6EPtHjIiN2lriJmXybAtb1AQ180AnLTEHmQRDtlZ/ywPdVo1iHIWUDhnSvo8SkAfzGewA==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr6455917wmi.104.1576155181268; 
 Thu, 12 Dec 2019 04:53:01 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n189sm5193825wme.33.2019.12.12.04.53.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Dec 2019 04:53:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 003/132] configure: expand path variables for meson configure
Date: Thu, 12 Dec 2019 13:50:47 +0100
Message-Id: <1576155176-2464-4-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
References: <1576155176-2464-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/configure b/configure
index 9745b87..a444bc3 100755
--- a/configure
+++ b/configure
@@ -404,16 +404,7 @@ DSOSUF=".so"
 LDFLAGS_SHARED="-shared"
 modules="no"
 prefix="/usr/local"
-mandir="\${prefix}/share/man"
-datadir="\${prefix}/share"
 firmwarepath="\${prefix}/share/qemu-firmware"
-qemu_docdir="\${prefix}/share/doc/qemu"
-bindir="\${prefix}/bin"
-libdir="\${prefix}/lib"
-libexecdir="\${prefix}/libexec"
-includedir="\${prefix}/include"
-sysconfdir="\${prefix}/etc"
-local_statedir="\${prefix}/var"
 confsuffix="/qemu"
 slirp=""
 oss_lib=""
@@ -926,12 +917,6 @@ if test "$mingw32" = "yes" ; then
     LIBS="-liberty $LIBS"
   fi
   prefix="c:/Program Files/QEMU"
-  mandir="\${prefix}"
-  datadir="\${prefix}"
-  qemu_docdir="\${prefix}"
-  bindir="\${prefix}"
-  sysconfdir="\${prefix}"
-  local_statedir=
   confsuffix=""
   libs_qga="-lws2_32 -lwinmm -lpowrprof -lwtsapi32 -lwininet -liphlpapi -lnetapi32 $libs_qga"
 fi
@@ -1529,6 +1514,26 @@ for opt do
   esac
 done
 
+libdir="${libdir:-$prefix/lib}"
+libexecdir="${libexecdir:-$prefix/libexec}"
+includedir="${includedir:-$prefix/include}"
+
+if test "$mingw32" = "yes" ; then
+    mandir="$prefix"
+    datadir="$prefix"
+    qemu_docdir="$prefix"
+    bindir="$prefix"
+    sysconfdir="$prefix"
+    local_statedir=
+else
+    mandir="${mandir:-$prefix/share/man}"
+    datadir="${datadir:-$prefix/share}"
+    qemu_docdir="${qemu_docdir:-$prefix/share/doc/qemu}"
+    bindir="${bindir:-$prefix/bin}"
+    sysconfdir="${sysconfdir:-$prefix/etc}"
+    local_statedir="${local_statedir:-$prefix/var}"
+fi
+
 case "$cpu" in
     ppc)
            CPU_CFLAGS="-m32"
-- 
1.8.3.1



