Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 265B96535C9
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 19:02:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p83Q8-0000n1-Dn; Wed, 21 Dec 2022 13:02:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Q0-0000Z2-0y
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p83Px-0004JG-Aa
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 13:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671645732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PBODSe+9wJNvncsm+Vv6BK3PHV793OAwINbgAu0jenE=;
 b=QOxU6Izj89t4W45+5MpYNxQMulfIP5T0i8r4yjTO3aAyFzLQuoFU1IpvMs3HHI3iCRocgY
 3iCkRCsQev45T/jflyVF6EiXDKGTZft2qyj3/sezZdRt7Czq9gLm7SBFFm/lE1+jeCiy+5
 J1rH/7OycOcJVjP7Gi6RIrgiuFzFpok=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-342-AioF3VgGMCqu_KJ0NuvYsg-1; Wed, 21 Dec 2022 13:02:11 -0500
X-MC-Unique: AioF3VgGMCqu_KJ0NuvYsg-1
Received: by mail-ej1-f69.google.com with SMTP id
 hq42-20020a1709073f2a00b007c100387d64so10985553ejc.3
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 10:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBODSe+9wJNvncsm+Vv6BK3PHV793OAwINbgAu0jenE=;
 b=mapDbGPyFVCVMZR+H5H1Nyj4Rpo6npXSVKxaH2ZI+Wrxwr0A/fKgmeh30lPemUcINc
 Kj3feYoWhyeO1yJNzxXuY8HzAbBQCar+KDWINDRcvFWsPMVnb08fB8JnJqmJDeHNgwPm
 sHe3XG91uU9xfwr5LpZ9RWnyMZw94l9e/fvTpxgkKvio5SA7pWd/ywguknuuakmVtZUW
 Bw3U677NTk/+JQLK5791XZ9pJuf8oXGzi0xX8SwsqULsVnu271N4fnk74bBGCe+CuW0s
 0N1FzvYqMRBY5XBhULXfsHSq33qT89wnXNf7FRfU5UXCOMIA1/Pr0+sZI0OLyiWCtfNV
 w5lA==
X-Gm-Message-State: AFqh2ko8C5qtqAn7/nXRbQU6Wb5Q3Bxy6m1p97FAPBeW1USLjtZ9/11y
 FbaRcgmEqOr7kCZ3JS3kjqaNEBOAZi3s2l8ik7BOKmR0aGc8GbUeQ7ZNWiWUcpg54hFD0+uaJUI
 K4BjOvHkc6LQfW02N4EiPpVgKCkMgqG9GpBwwkW6O1Ed9uwQtk5yL7IkwzauljVWRn+w=
X-Received: by 2002:a17:906:430a:b0:7c1:54b9:c688 with SMTP id
 j10-20020a170906430a00b007c154b9c688mr1942919ejm.60.1671645729317; 
 Wed, 21 Dec 2022 10:02:09 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsJNgwsqp1jFzJC3MHWlPHkiMJnv2kahc90+RGtkKXlqeEbUFgbn7g8hiMKRosYo8iXh5/O/A==
X-Received: by 2002:a17:906:430a:b0:7c1:54b9:c688 with SMTP id
 j10-20020a170906430a00b007c154b9c688mr1942891ejm.60.1671645729016; 
 Wed, 21 Dec 2022 10:02:09 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 ku13-20020a170907788d00b00837ac146a53sm2340571ejc.23.2022.12.21.10.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 10:02:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/24] configure: cleanup $cpu tests
Date: Wed, 21 Dec 2022 19:01:26 +0100
Message-Id: <20221221180141.839616-10-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221221180141.839616-1-pbonzini@redhat.com>
References: <20221221180141.839616-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

$cpu is derived from preprocessor defines rather than uname these days,
so do not bother using isainfo on Solaris.  Likewise do not recognize
BeOS's uname -m output.

Keep the other, less OS-specific canonicalizations for the benefit
of people using --cpu.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/configure b/configure
index 543fd5a48bf0..9cbbeaa269d1 100755
--- a/configure
+++ b/configure
@@ -337,9 +337,6 @@ for opt do
   ;;
   esac
 done
-# OS specific
-# Using uname is really, really broken.  Once we have the right set of checks
-# we can eliminate its usage altogether.
 
 # Preferred compiler:
 #  ${CC} (if set)
@@ -489,13 +486,6 @@ sunos)
   QEMU_CFLAGS="-D_XOPEN_SOURCE=600 $QEMU_CFLAGS"
 # needed for TIOCWIN* defines in termios.h
   QEMU_CFLAGS="-D__EXTENSIONS__ $QEMU_CFLAGS"
-  # $(uname -m) returns i86pc even on an x86_64 box, so default based on isainfo
-  # Note that this check is broken for cross-compilation: if you're
-  # cross-compiling to one of these OSes then you'll need to specify
-  # the correct CPU with the --cpu option.
-  if test -z "$cpu" && test "$(isainfo -k)" = "amd64"; then
-    cpu="x86_64"
-  fi
 ;;
 haiku)
   pie="no"
@@ -550,16 +540,21 @@ elif check_define __aarch64__ ; then
 elif check_define __loongarch64 ; then
   cpu="loongarch64"
 else
+  # Using uname is really broken, but it is just a fallback for architectures
+  # that are going to use TCI anyway
   cpu=$(uname -m)
+  echo "WARNING: unrecognized host CPU, proceeding with 'uname -m' output '$cpu'"
 fi
 
-# Normalise host CPU name, set multilib cflags
+# Normalise host CPU name and set multilib cflags.  The canonicalization
+# isn't really necessary, because the architectures that we check for
+# should not hit the 'uname -m' case, but better safe than sorry.
 # Note that this case should only have supported host CPUs, not guests.
 case "$cpu" in
   armv*b|armv*l|arm)
     cpu="arm" ;;
 
-  i386|i486|i586|i686|i86pc|BePC)
+  i386|i486|i586|i686)
     cpu="i386"
     CPU_CFLAGS="-m32" ;;
   x32)
-- 
2.38.1


