Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1132F3BB9
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 22:08:08 +0100 (CET)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzQtb-00023D-Us
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 16:08:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kzQoO-0004kx-NL
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:44 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:46938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jpewhacker@gmail.com>)
 id 1kzQoN-00081s-4m
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 16:02:44 -0500
Received: by mail-oi1-x22a.google.com with SMTP id q205so3795637oig.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 13:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wA1Olew9SX3UK3sLbOhqAXGgUJnTyIMPBI7bKnFIgQc=;
 b=QVb05CB+SFhGTXwQfoVfFu2tcIPGp5/y5tVwEVHM3NbDLYemzgB6oUpdQHLtjhFaTm
 4M6ztBp7cvPHEx9ReSNINsPVNu/mmZ9f3t6cDfTdxIL0zVPfsOhiD00/nOI56YsGq1aN
 +ijhL4trl+ODUFuL4X4NFn8XtkfhbFFUn1+qenSGSNVbOH7h0g0LUo2d3wRslx68WTgQ
 3UbhICjf9SpIED4oWw4ODqlbK1chD7UYRXpgKfa4JCSv7ConoF0FJQeWk+ny3joQ7knB
 1sS8TmO/zygloRVZFdAJBIVFqFty7QoIlIqkA/Jk2XHyRYpvwIEFE3QPcfIU/kRQkM6Z
 5pwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wA1Olew9SX3UK3sLbOhqAXGgUJnTyIMPBI7bKnFIgQc=;
 b=DZ52I7oHYXYckZuTTWur/YLW7lzyFKJObfsrz+ctTl0+jGEKxJi2mCs4K2Q8u3VuWO
 YFOrfBYWnKoYINOrohHT1bSAg+C5xQtxknjc60MpLPEWN8MbY+NMEC3dNwZvVNCCAdtw
 oWJrCHRpG1P6tsaqaf2O7as15vYlGUzHVGV36h1PjPVe1w50ZGU/cOeBb43/cCsevNSC
 fd41s/iuzLYER7zvxeWqKfRsTOJaugx2cXKnvQ/3s1vj8546G9h4irF6l2xVMngn9Xbt
 keqMxikzTAQ9o2sNQxTdkPrdTLsYTN4Fw1ZAyF+RWdsILELf7OVTJq/lJCISEqtDcuF0
 JqKQ==
X-Gm-Message-State: AOAM532Z8x+8RyHqTIfZkjQVmXgQ10UqdLoUgB95lsOJ/ChX0P0J3OKh
 zmNqOhkiMesqcQR+aCiGyr4i8lokNYiUBQ==
X-Google-Smtp-Source: ABdhPJwHyDoSDtpbnM9l0DJfy9VxJD30kCInY9CukDCu6uAw0QF7RvAfNhOmh2KO2DU2YpgVBYFWKg==
X-Received: by 2002:aca:5e42:: with SMTP id s63mr670540oib.96.1610485361250;
 Tue, 12 Jan 2021 13:02:41 -0800 (PST)
Received: from localhost.localdomain ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
 by smtp.gmail.com with ESMTPSA id
 e10sm880160otl.38.2021.01.12.13.02.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 13:02:40 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] configure: MinGW respect --bindir argument
Date: Tue, 12 Jan 2021 15:02:39 -0600
Message-Id: <20210112210239.28836-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210107213856.34170-1-JPEWhacker@gmail.com>
References: <20210107213856.34170-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=jpewhacker@gmail.com; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, thuth@redhat.com, luoyonggang@gmail.com,
 Joshua Watt <JPEWhacker@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are two cases that need to be accounted for when compiling QEMU
for MinGW32:
 1) A standalone distribution, where QEMU is self contained and
    extracted by the user, such as a user would download from the QEMU
    website. In this case, all the QEMU executable files should be
    rooted in $prefix to ensure they can be easily found by the user
 2) QEMU integrated into a distribution image/sysroot/SDK and
    distributed with other programs. In this case, the provided
    arguments for bindir/datadir/etc. should be respected as they for a
    Linux build.

Restructures the MinGW path configuration so that all of the paths
except bindir use the same rules as when building for other platforms.
This satisfies #2 and #1 since these files do not need to be directly in
$prefix anyway.

The handling for --bindir is changed so that it defaults to $prefix on
MinGW (maintaining the compatibility with #1), but if the user specifies
a specific path when configuring it can also satisfy #2.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 configure | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/configure b/configure
index 5860bdb77b..092e2926bc 100755
--- a/configure
+++ b/configure
@@ -1571,20 +1571,15 @@ libexecdir="${libexecdir:-$prefix/libexec}"
 includedir="${includedir:-$prefix/include}"
 
 if test "$mingw32" = "yes" ; then
-    mandir="$prefix"
-    datadir="$prefix"
-    docdir="$prefix"
-    bindir="$prefix"
-    sysconfdir="$prefix"
-    local_statedir="$prefix"
+    bindir="${bindir:-$prefix}"
 else
-    mandir="${mandir:-$prefix/share/man}"
-    datadir="${datadir:-$prefix/share}"
-    docdir="${docdir:-$prefix/share/doc}"
     bindir="${bindir:-$prefix/bin}"
-    sysconfdir="${sysconfdir:-$prefix/etc}"
-    local_statedir="${local_statedir:-$prefix/var}"
 fi
+mandir="${mandir:-$prefix/share/man}"
+datadir="${datadir:-$prefix/share}"
+docdir="${docdir:-$prefix/share/doc}"
+sysconfdir="${sysconfdir:-$prefix/etc}"
+local_statedir="${local_statedir:-$prefix/var}"
 firmwarepath="${firmwarepath:-$datadir/qemu-firmware}"
 localedir="${localedir:-$datadir/locale}"
 
-- 
2.30.0


